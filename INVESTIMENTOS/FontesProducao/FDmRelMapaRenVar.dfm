inherited DmRelMapaRenVar: TDmRelMapaRenVar
  Left = 0
  Top = 249
  Width = 1010
  Height = 363
  Caption = 'DmRelMapaRenVar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 54
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
    Left = 54
  end
  inherited qryExemplo: TwwQuery
    Left = 54
  end
  inherited rpExemplo: TppReport
    Left = 54
    DataPipelineName = 'pplExemplo'
  end
  object BDEMapaRenVar: TppBDEPipeline
    DataSource = dsMapaRenVar
    UserName = 'BDEMapaRenVar'
    Left = 54
    Top = 119
  end
  object rptMapaRenVar: TppReport
    AutoStop = False
    DataPipeline = BDEMapaRenVar
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Movimentação em Renda Variável'
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
    BeforePrint = rptMapaRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 54
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaRenVar'
    object pphbRMov: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 14288
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284300
        BandType = 0
      end
      object lblVariacao: TppLabel
        UserName = 'lblVariacao'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 213519
        mmTop = 29369
        mmWidth = 11906
        BandType = 0
      end
      object lblSaldoAnterior: TppLabel
        UserName = 'lblSldAnterior'
        Caption = 'Saldo Anterior'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 108215
        mmTop = 20638
        mmWidth = 19315
        BandType = 0
      end
      object lblVendas: TppLabel
        UserName = 'lblVendas'
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 188119
        mmTop = 20638
        mmWidth = 7673
        BandType = 0
      end
      object lblCompras: TppLabel
        UserName = 'Label4'
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 151342
        mmTop = 20638
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Movimentação em Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 72496
        BandType = 0
      end
      object ppLabel38: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo4'
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
      object ppDBImage4: TppDBImage
        UserName = 'DbLogo4'
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
      object pplblDescInvest: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Segmentação de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 29898
        mmWidth = 42069
        BandType = 0
      end
      object lblQtdAnterior: TppLabel
        UserName = 'lblSldAnteriorQtd'
        Caption = 'Quantidade'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112977
        mmTop = 25400
        mmWidth = 14552
        BandType = 0
      end
      object lblVlrSaldoAnt: TppLabel
        UserName = 'lblSldAnteriorVlr'
        Caption = 'Saldo'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 119856
        mmTop = 29369
        mmWidth = 7673
        BandType = 0
      end
      object lblQtdCompras: TppLabel
        UserName = 'lblQtdCompras'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 25400
        mmWidth = 14552
        BandType = 0
      end
      object lblVlrCompras: TppLabel
        UserName = 'lblVlrCompras'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 29369
        mmWidth = 7144
        BandType = 0
      end
      object lblQtdVendas: TppLabel
        UserName = 'lblVendas1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 25400
        mmWidth = 14552
        BandType = 0
      end
      object lblVlrVendas: TppLabel
        UserName = 'lblVendas2'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 188648
        mmTop = 29369
        mmWidth = 7144
        BandType = 0
      end
      object lblRestCapital: TppLabel
        UserName = 'lblVariacao1'
        Caption = 'Rest. Capital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 232305
        mmTop = 29369
        mmWidth = 17198
        BandType = 0
      end
      object lblSaldoAtual: TppLabel
        UserName = 'lblVendas3'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265378
        mmTop = 20638
        mmWidth = 15610
        BandType = 0
      end
      object lblQtdAtu: TppLabel
        UserName = 'lblQtdAtu'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 266436
        mmTop = 25400
        mmWidth = 14552
        BandType = 0
      end
      object lblVlrSaldoAtu: TppLabel
        UserName = 'Label2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 273315
        mmTop = 29369
        mmWidth = 7673
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284300
        BandType = 0
      end
      object lblPlanPatroRMov: TppDBText
        UserName = 'lblPlanPatroRMov'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3683
        mmLeft = 241195
        mmTop = 14023
        mmWidth = 39793
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppShape28: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'Shape28'
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 8202
        mmLeft = 43392
        mmTop = 529
        mmWidth = 239978
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRCOMPRAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 138642
        mmTop = 4498
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QTDECOMPRAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 138642
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'QTDEVENDAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 173038
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'dbVendasVlr2'
        DataField = 'VLRVENDAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 173038
        mmTop = 4498
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'SALDOVLRINVCARTANT'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 104511
        mmTop = 4498
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'dbSldAtu2'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 253471
        mmTop = 4498
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = 'SALDOQTDEINVCARTANT'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 104511
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 253471
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'VARIACAO'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 202671
        mmTop = 4498
        mmWidth = 23548
        BandType = 4
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'dbSomaLinhas1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = BDEMapaRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 2910
        mmLeft = 239713
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'dbRestCapital1'
        DataField = 'VLRRESTCAPITAL'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 227013
        mmTop = 4498
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = BDEMapaRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 794
        mmWidth = 56092
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
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
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel82: TppLabel
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
        mmTop = 794
        mmWidth = 283369
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label3'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 16669
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SALDOVLRINVCARTANT'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 93927
        mmTop = 1323
        mmWidth = 34396
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLRCOMPRAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 129117
        mmTop = 1323
        mmWidth = 30956
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLRVENDAS'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 1323
        mmWidth = 34396
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VARIACAO'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 195527
        mmTop = 1323
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLRRESTCAPITAL'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 1323
        mmWidth = 24871
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 3704
        mmLeft = 249767
        mmTop = 1323
        mmWidth = 31221
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaRenVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaRenVar'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 1588
          mmWidth = 36407
          BandType = 5
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'dbSumVlrAplicado1'
          DataField = 'SALDOVLRINVCARTANT'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 93663
          mmTop = 1588
          mmWidth = 34660
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'dbSumSldAnterior1'
          DataField = 'VLRCOMPRAS'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 136525
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'dbSumVlrIOF1'
          DataField = 'VLRVENDAS'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'dbSumVlrResgate2'
          DataField = 'VARIACAO'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 202142
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLRRESTCAPITAL'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 226219
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'dbSumSldFundo1'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 250825
          mmTop = 1588
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = BDEMapaRenVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaRenVar'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCarteira: TppShape
          UserName = 'shpCarteira'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'ppdbDescCarteira'
          DataField = 'DESCCARTINVEST'
          DataPipeline = BDEMapaRenVar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 265
          mmWidth = 93663
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand1AfterPrint
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppdbSumSldAnterior: TppDBCalc
          UserName = 'dbSumSldAnterior'
          DataField = 'VLRCOMPRAS'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 136525
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label1'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1588
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrAplicado: TppDBCalc
          UserName = 'dbSumVlrAplicado'
          DataField = 'SALDOVLRINVCARTANT'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 93663
          mmTop = 1588
          mmWidth = 34660
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrIOF: TppDBCalc
          UserName = 'dbSumVlrIOF'
          DataField = 'VLRVENDAS'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumVlrResgate: TppDBCalc
          UserName = 'dbSumVlrResgate'
          DataField = 'VARIACAO'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 202142
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppdbSumSldFundo: TppDBCalc
          UserName = 'dbSumSldFundo'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 250825
          mmTop = 1588
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'dbSumVlrResgate1'
          DataField = 'VLRRESTCAPITAL'
          DataPipeline = BDEMapaRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3175
          mmLeft = 226219
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = BDEMapaRenVar
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaRenVar'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = BDEMapaRenVar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDEMapaRenVar'
          mmHeight = 3440
          mmLeft = 265
          mmTop = 794
          mmWidth = 41804
          BandType = 3
          GroupNo = 2
        end
        object ppShape29: TppShape
          UserName = 'Shape29'
          Brush.Color = clSilver
          mmHeight = 10054
          mmLeft = 43127
          mmTop = 0
          mmWidth = 241036
          BandType = 3
          GroupNo = 2
        end
        object ppLabel115: TppLabel
          UserName = 'Label115'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 114300
          mmTop = 794
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 120915
          mmTop = 5556
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 148696
          mmTop = 794
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 155840
          mmTop = 5556
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 794
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel120: TppLabel
          UserName = 'Label1103'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 190236
          mmTop = 5556
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 274373
          mmTop = 5556
          mmWidth = 6615
          BandType = 3
          GroupNo = 2
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 267494
          mmTop = 794
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          Caption = 'Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 46831
          mmTop = 3969
          mmWidth = 17463
          BandType = 3
          GroupNo = 2
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          Caption = 'Variação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 215636
          mmTop = 5556
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Rest. Capital'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 235215
          mmTop = 5556
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsMapaRenVar: TwwDataSource
    DataSet = qryMapaRenVar
    Left = 54
    Top = 219
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTEIRAINVEST, DESCCARTINVEST, FLGCARTPROP'
      'FROM'
      '    CARTEIRAINVEST'
      'WHERE'
      '    (IDTIPOINVEST = 2) OR (IDTIPOINVEST IS NULL)'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 171
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTPROP'
    end
  end
  object BDEMapaCustoRenVar: TppBDEPipeline
    DataSource = dsMapaRenVar
    UserName = 'BDEMapaCustoRenVar'
    Left = 314
    Top = 119
  end
  object rptMapaCustoRenVar: TppReport
    AutoStop = False
    DataPipeline = BDEMapaCustoRenVar
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Custo de Renda Variável'
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
    BeforePrint = rptMapaCustoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 314
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaCustoRenVar'
    object pphbRCusto: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpConsRentFndCab1'
        Brush.Color = clSilver
        mmHeight = 5556
        mmLeft = 265
        mmTop = 20373
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lblVariacao'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 185738
        mmTop = 21431
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Custo de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 56886
        BandType = 0
      end
      object ppLabel6: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPeriodoCusto: TppLabel
        UserName = 'lblPeriodoCusto'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 9790
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel8: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 21431
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'lblVendas2'
        Caption = 'PU Custo Médio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 137319
        mmTop = 21431
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'lblSldAtuQtd'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 109538
        mmTop = 21431
        mmWidth = 15610
        BandType = 0
      end
      object lblPlanPatroRCusto: TppDBText
        UserName = 'lblPlanPatroRCusto'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3725
        mmLeft = 108183
        mmTop = 14023
        mmWidth = 86022
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape2: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object dbPUMedio: TppDBText
        UserName = 'dbPUMedio'
        DataField = 'PUCUSTO'
        DataPipeline = BDEMapaCustoRenVar
        DisplayFormat = '###,###,###,###,###,##0.0000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3440
        mmLeft = 135467
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'ppdbDescInvest'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = BDEMapaCustoRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 794
        mmWidth = 59002
        BandType = 4
      end
      object ppdbSldQtd: TppDBText
        UserName = 'dbSldAtu1'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BDEMapaCustoRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppdbSaldoAqui: TppDBText
        UserName = 'dbVendasVlr1'
        DataField = 'SALDOAQUI'
        DataPipeline = BDEMapaCustoRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3440
        mmLeft = 170127
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'STAAJUSTECUSTO'
        DataPipeline = BDEMapaCustoRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3440
        mmLeft = 194469
        mmTop = 794
        mmWidth = 1588
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
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
        mmLeft = 152136
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 16669
        BandType = 7
      end
      object dbSumSaldoAquiGeral: TppDBCalc
        UserName = 'dbSumSaldoAquiGeral'
        DataField = 'SALDOAQUI'
        DataPipeline = BDEMapaCustoRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 1323
        mmWidth = 33867
        BandType = 7
      end
      object lblPUMedCartGeral: TppLabel
        OnPrint = lblPUMedCartGeralPrint
        UserName = 'lblPUMedCart1'
        Caption = 'PU Médio da Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 1323
        mmWidth = 32015
        BandType = 7
      end
      object dbTotQtdGeral: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BDEMapaCustoRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRenVar'
        mmHeight = 3704
        mmLeft = 90752
        mmTop = 1323
        mmWidth = 34131
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaCustoRenVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaCustoRenVar'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand2AfterPrint
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel23: TppLabel
          UserName = 'Label1'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 1588
          mmWidth = 36407
          BandType = 5
          GroupNo = 0
        end
        object dbSumSaldoAquiPlan: TppDBCalc
          UserName = 'dbSumSaldoAquiPlan'
          DataField = 'SALDOAQUI'
          DataPipeline = BDEMapaCustoRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRenVar'
          mmHeight = 3175
          mmLeft = 169863
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object lblPUMedPlan: TppLabel
          OnPrint = lblPUMedPlanPrint
          UserName = 'lblPUMedPlan'
          Caption = 'PU Médio do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 135467
          mmTop = 1588
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object dbTotQtdPlan: TppDBCalc
          UserName = 'dbTotQtdPlan'
          DataField = 'SALDOQTDEINVCART'
          DataPipeline = BDEMapaCustoRenVar
          DisplayFormat = '###,###,###,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRenVar'
          mmHeight = 3175
          mmLeft = 89165
          mmTop = 1588
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = BDEMapaCustoRenVar
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaCustoRenVar'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'shpCarteira'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'ppdbDescCarteira'
          DataField = 'DESCCARTINVEST'
          DataPipeline = BDEMapaCustoRenVar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRenVar'
          mmHeight = 3969
          mmLeft = 265
          mmTop = 0
          mmWidth = 82286
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1588
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object dbTotQtdCart: TppDBCalc
          UserName = 'dbTotQtdCart'
          DataField = 'SALDOQTDEINVCART'
          DataPipeline = BDEMapaCustoRenVar
          DisplayFormat = '###,###,###,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRenVar'
          mmHeight = 3175
          mmLeft = 89165
          mmTop = 1588
          mmWidth = 35719
          BandType = 5
          GroupNo = 1
        end
        object lblPUMedCart: TppLabel
          OnPrint = lblPUMedCartPrint
          UserName = 'lblPUMedCart'
          Caption = 'PU Médio da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 131498
          mmTop = 1588
          mmWidth = 27252
          BandType = 5
          GroupNo = 1
        end
        object dbSumSaldoAquiCart: TppDBCalc
          UserName = 'dbSumSaldoAquiCart'
          DataField = 'SALDOAQUI'
          DataPipeline = BDEMapaCustoRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRenVar'
          mmHeight = 3175
          mmLeft = 169863
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object rptMapaPosicaoRenVar: TppReport
    AutoStop = False
    DataPipeline = BDEMapaPosicaoRenVar
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Posisão de Renda Variável'
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
    BeforePrint = rptMapaPosicaoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 448
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaPosicaoRenVar'
    object pphbRPos: TppHeaderBand
      BeforePrint = pphbRPosBeforePrint
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 5292
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Posição de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 60452
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPeriodoPosicao: TppLabel
        UserName = 'lblPeriodoPosicao'
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
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel31: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 20902
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'lblSldAnteriorQtd'
        Caption = 'Quantidade'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 166952
        mmTop = 20902
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'lblSldAnteriorVlr'
        Caption = 'Saldo Atual'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 266171
        mmTop = 20902
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'lblComprasQtd'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 192882
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'lblComprasVlr'
        Caption = 'Data Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 201348
        mmTop = 20902
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'lblVendas1'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 234421
        mmTop = 20902
        mmWidth = 11113
        BandType = 0
      end
      object lblPlanPatroRPos: TppDBText
        OnPrint = lblPlanPatroRPosPrint
        UserName = 'lblPlanPatroRPos'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3683
        mmLeft = 243047
        mmTop = 14023
        mmWidth = 39793
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblDescInvest1'
        Caption = 'Sigla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 80698
        mmTop = 20902
        mmWidth = 6604
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'dbComprasVlr'
        DataField = 'DATACOTACAO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 201877
        mmTop = 795
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'dbComprasQtd'
        DataField = 'LOTE'
        DataPipeline = BDEMapaPosicaoRenVar
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 795
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'dbVendasQtd'
        DataField = 'COTACAO'
        DataPipeline = BDEMapaPosicaoRenVar
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 222515
        mmTop = 795
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'dbSldAntVlr'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaPosicaoRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 248179
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppdbDescInvest'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 794
        mmWidth = 75406
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'dbSldAntQtd'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BDEMapaPosicaoRenVar
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppdbDescInvest1'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 794
        mmWidth = 64823
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel43: TppLabel
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
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
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
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaPosicaoRenVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 4233
        mmLeft = 225690
        mmTop = 1852
        mmWidth = 56621
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaPosicaoRenVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaPosicaoRenVar'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppgMPosPlanPrev: TppGroupFooterBand
        AfterPrint = ppgMPosPlanPrevAfterPrint
        BeforePrint = ppgMPosPlanPrevBeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape7'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Total do Plano / Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1323
          mmWidth = 42598
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'SALDOPLANO'
          DataPipeline = BDEMapaPosicaoRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaPosicaoRenVar'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 1323
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = BDEMapaPosicaoRenVar
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaPosicaoRenVar'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape6: TppShape
          UserName = 'shpCarteira'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppdbDescCarteiraPos: TppDBText
          OnPrint = ppdbDescCarteiraPosPrint
          UserName = 'ppdbDescCarteiraPos'
          DataField = 'DESCCARTINVEST'
          DataPipeline = BDEMapaPosicaoRenVar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'BDEMapaPosicaoRenVar'
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
      end
      object ppgMPosCarteira: TppGroupFooterBand
        AfterPrint = ppgMPosCarteiraAfterPrint
        BeforePrint = ppgMPosCarteiraBeforePrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object shpTotalCarteira: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel44: TppLabel
          UserName = 'Label1'
          Caption = 'Total da Carteira: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 1323
          mmWidth = 21590
          BandType = 5
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'SALDOCART'
          DataPipeline = BDEMapaPosicaoRenVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaPosicaoRenVar'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 1323
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object BDEMapaPosicaoRenVar: TppBDEPipeline
    DataSource = dsMapaRenVar
    UserName = 'BDEMapaPosicaoRenVar'
    Left = 448
    Top = 119
  end
  object qryPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 314
    Top = 219
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
    end
  end
  object rptMapaPosRVGroup: TppReport
    AutoStop = False
    DataPipeline = BDEMapaPosRVGroup
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Posisão de Renda Variável'
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
    BeforePrint = rptMapaPosicaoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 576
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaPosRVGroup'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = pphbRPosBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 60325
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Posição de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4149
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 60452
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPeriodoPosGroup: TppLabel
        UserName = 'lblPeriodoPosGroup'
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
      object ppDBImage3: TppDBImage
        UserName = 'DbLogo4'
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
      object ppDBText5: TppDBText
        OnPrint = lblPlanPatroRPosPrint
        UserName = 'lblPlanPatroRPos'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BDEMapaPosRVGroup
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosRVGroup'
        mmHeight = 3683
        mmLeft = 231670
        mmTop = 14023
        mmWidth = 50377
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        mmHeight = 22490
        mmLeft = 25400
        mmTop = 23283
        mmWidth = 258763
        BandType = 0
      end
      object ppMemoPosGroup: TppMemo
        UserName = 'MemoMovGroup'
        Caption = 'MemoMovGroup'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 20902
        mmLeft = 26194
        mmTop = 24077
        mmWidth = 257176
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 25665
        mmTop = 19050
        mmWidth = 43011
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'lblDescInvest2'
        Caption = 'Segmentação de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 56621
        mmWidth = 35010
        BandType = 0
      end
      object ppShape30: TppShape
        UserName = 'shpConsRentFndCab3'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7408
        mmLeft = 0
        mmTop = 52917
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'lblSldAnterior1'
        Caption = 'Lote'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 194205
        mmTop = 55563
        mmWidth = 5969
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'lblVendas4'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 236009
        mmTop = 55563
        mmWidth = 11134
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 266965
        mmTop = 55563
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label131'
        Caption = 'Quantidade'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 159544
        mmTop = 55563
        mmWidth = 15579
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'lblDescInvest4'
        Caption = 'Segmentação de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 794
        mmTop = 55563
        mmWidth = 35010
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'Sigla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 55563
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 54504
        mmTop = 55563
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        Caption = 'Data Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 203465
        mmTop = 55563
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'dbSegmentacao1'
        DataField = 'DESCSEGMENTACAO'
        DataPipeline = BDEMapaPosRVGroup
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEMapaPosRVGroup'
        mmHeight = 3387
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 82286
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6615
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = BDEMapaRenVar
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDEMapaRenVar'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'shpConsRentFndCab4'
              Brush.Color = clSilver
              mmHeight = 5292
              mmLeft = 51329
              mmTop = 529
              mmWidth = 233098
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'lblDescInvest3'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 54504
              mmTop = 1323
              mmWidth = 17463
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label1'
              Caption = 'Sigla'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 115094
              mmTop = 1588
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'lblSldAnteriorQtd1'
              Caption = 'Quantidade'
              Color = 14935011
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 160073
              mmTop = 1323
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'lblComprasQtd1'
              Caption = 'Lote'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 194734
              mmTop = 1323
              mmWidth = 6085
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'lblComprasVlr1'
              Caption = 'Data Cotação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 203465
              mmTop = 1323
              mmWidth = 17992
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label2'
              Caption = 'Cotação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 236273
              mmTop = 1323
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'lblSldAnteriorVlr1'
              Caption = 'Saldo Atual'
              Color = 14935011
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 268023
              mmTop = 1323
              mmWidth = 15610
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppShape32: TppShape
              OnPrint = shpDetalhePrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              ShiftWithParent = True
              mmHeight = 4763
              mmLeft = 51858
              mmTop = 529
              mmWidth = 232305
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'dbComprasVlr1'
              DataField = 'DATACOTACAO'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 203465
              mmTop = 1058
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'dbComprasQtd1'
              DataField = 'LOTE'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 186267
              mmTop = 1058
              mmWidth = 14023
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'dbVendasQtd1'
              DataField = 'COTACAO'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,##0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 223838
              mmTop = 1058
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'dbSldAntVlr1'
              DataField = 'SALDOVLRINVCART'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 249503
              mmTop = 1058
              mmWidth = 34131
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'ppdbDescInvest2'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 54504
              mmTop = 1058
              mmWidth = 43921
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'dbSldAntQtd1'
              DataField = 'SALDOQTDEINVCART'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 144727
              mmTop = 1058
              mmWidth = 30163
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText3'
              DataField = 'SIGLAACAOBOLSA'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3175
              mmLeft = 115359
              mmTop = 1058
              mmWidth = 25135
              BandType = 4
            end
          end
          object ppSummaryBand9: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppShape10: TppShape
              UserName = 'Shape10'
              Brush.Color = clSilver
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 51329
              mmTop = 265
              mmWidth = 233098
              BandType = 7
            end
            object ppLine25: TppLine
              UserName = 'Line101'
              ParentWidth = True
              Style = lsDouble
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 5027
              mmWidth = 284300
              BandType = 7
            end
            object ppLabel135: TppLabel
              UserName = 'Label135'
              Caption = 'Total da Segmentação de Mercado:  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 53181
              mmTop = 794
              mmWidth = 49234
              BandType = 7
            end
            object ppDBText81: TppDBText
              UserName = 'DBText81'
              DataField = 'SALDOVLRINVCART'
              DataPipeline = BDEMapaPosRVGroup
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaPosRVGroup'
              mmHeight = 3440
              mmLeft = 256117
              mmTop = 794
              mmWidth = 26988
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel27: TppLabel
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
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLine11: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
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
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaPosRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosRVGroup'
        mmHeight = 4233
        mmLeft = 225690
        mmTop = 1852
        mmWidth = 56621
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaPosRVGroup
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaPosRVGroup'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        AfterPrint = ppgMPosPlanPrevAfterPrint
        BeforePrint = ppgMPosPlanPrevBeforePrint
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape11: TppShape
          UserName = 'Shape7'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label7'
          Caption = 'Total do Plano / Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1323
          mmWidth = 42598
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText9'
          DataField = 'SALDOPLANO'
          DataPipeline = BDEMapaPosRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaPosRVGroup'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 1323
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object BDEMapaPosRVGroup: TppBDEPipeline
    DataSource = dsMapaRenVarOutros
    UserName = 'BDEMapaPosRVGroup'
    Left = 576
    Top = 119
  end
  object DBEMapaMovRVGroup: TppBDEPipeline
    DataSource = dsMapaRenVarOutros
    UserName = 'BDEMapaMovRVGroup'
    Left = 702
    Top = 119
  end
  object rptMapaCustoRVGroup: TppReport
    AutoStop = False
    DataPipeline = BDEMapaCustoRVGroup
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Custo de Renda Variável'
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
    BeforePrint = rptMapaCustoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 810
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEMapaCustoRVGroup'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51858
      mmPrintPosition = 0
      object ppShape16: TppShape
        UserName = 'shpConsRentFndCab1'
        Brush.Color = clSilver
        mmHeight = 5556
        mmLeft = 0
        mmTop = 46302
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'lblVariacao'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 186267
        mmTop = 47361
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Custo de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 56886
        BandType = 0
      end
      object ppLabel65: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPeriodoCustoGroup: TppLabel
        UserName = 'lblPeriodoCusto'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 9790
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel67: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 52652
        mmTop = 47361
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'lblVendas2'
        Caption = 'PU Custo Médio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 137054
        mmTop = 47361
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'lblSldAtuQtd'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 111125
        mmTop = 47361
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'lblPlanPatroRCusto'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BDEMapaPosicaoRenVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaPosicaoRenVar'
        mmHeight = 3683
        mmLeft = 154677
        mmTop = 8731
        mmWidth = 39793
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        mmHeight = 22490
        mmLeft = 25665
        mmTop = 23283
        mmWidth = 171450
        BandType = 0
      end
      object ppMemoCustoGroup: TppMemo
        UserName = 'MemoMovGroup1'
        Caption = 'MemoCustoGroup'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 20902
        mmLeft = 26458
        mmTop = 24077
        mmWidth = 169863
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 25665
        mmTop = 19050
        mmWidth = 43011
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'Label140'
        Caption = 'Segmentação de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 794
        mmTop = 47361
        mmWidth = 35010
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = BDEMapaRenVar
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDEMapaRenVar'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppShape31: TppShape
              UserName = 'shpConsRentFndCab4'
              Brush.Color = clSilver
              mmHeight = 5292
              mmLeft = 50536
              mmTop = 529
              mmWidth = 146315
              BandType = 1
            end
            object ppLabel136: TppLabel
              UserName = 'lblDescInvest5'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 52652
              mmTop = 1588
              mmWidth = 17463
              BandType = 1
            end
            object ppLabel137: TppLabel
              UserName = 'lblSldAtuQtd1'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 111125
              mmTop = 1588
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel138: TppLabel
              UserName = 'Label138'
              Caption = 'PU Custo Médio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 137054
              mmTop = 1588
              mmWidth = 21696
              BandType = 1
            end
            object ppLabel139: TppLabel
              UserName = 'lblVariacao2'
              Caption = 'Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 186267
              mmTop = 1588
              mmWidth = 7938
              BandType = 1
            end
          end
          object ppDetailBand11: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppShape33: TppShape
              OnPrint = shpDetalhePrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              ShiftWithParent = True
              mmHeight = 4763
              mmLeft = 50800
              mmTop = 529
              mmWidth = 146050
              BandType = 4
            end
            object ppDBText55: TppDBText
              UserName = 'ppdbDescInvest4'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3440
              mmLeft = 52652
              mmTop = 1323
              mmWidth = 51858
              BandType = 4
            end
            object ppDBText77: TppDBText
              UserName = 'DBText77'
              DataField = 'SALDOQTDEINVCART'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3440
              mmLeft = 107156
              mmTop = 1323
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText78: TppDBText
              UserName = 'dbPUMedio1'
              DataField = 'PUCUSTO'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0.0000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3440
              mmLeft = 135202
              mmTop = 1323
              mmWidth = 23283
              BandType = 4
            end
            object ppDBText79: TppDBText
              UserName = 'DBText79'
              DataField = 'SALDOAQUI'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3440
              mmLeft = 170921
              mmTop = 1323
              mmWidth = 23283
              BandType = 4
            end
          end
          object ppSummaryBand11: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppShape34: TppShape
              UserName = 'Shape10'
              Brush.Color = clSilver
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 51065
              mmTop = 265
              mmWidth = 145786
              BandType = 7
            end
            object ppLabel143: TppLabel
              UserName = 'Label135'
              Caption = 'Total da Segmentação de Mercado:  '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 53181
              mmTop = 794
              mmWidth = 49234
              BandType = 7
            end
            object ppDBText84: TppDBText
              UserName = 'DBText81'
              DataField = 'SALDOAQUI'
              DataPipeline = BDEMapaPosRVGroup
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaPosRVGroup'
              mmHeight = 3440
              mmLeft = 167217
              mmTop = 794
              mmWidth = 26988
              BandType = 7
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              DataField = 'SALDOQTDEINVCART'
              DataPipeline = BDEMapaPosRVGroup
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaPosRVGroup'
              mmHeight = 3440
              mmLeft = 102923
              mmTop = 794
              mmWidth = 23548
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'DESCSEGMENTACAO'
        DataPipeline = BDEMapaPosRVGroup
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEMapaPosRVGroup'
        mmHeight = 3387
        mmLeft = 0
        mmTop = 1588
        mmWidth = 82286
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel70: TppLabel
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object ppLine20: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
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
        mmLeft = 152136
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel71: TppLabel
        UserName = 'Label3'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 16669
        BandType = 7
      end
      object ppDBCalc29: TppDBCalc
        UserName = 'dbSumSaldoAquiGeral'
        DataField = 'SALDOAQUI'
        DataPipeline = BDEMapaCustoRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRVGroup'
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 1323
        mmWidth = 33867
        BandType = 7
      end
      object ppLabel72: TppLabel
        OnPrint = lblPUMedCartGeralPrint
        UserName = 'lblPUMedCart1'
        Caption = 'PU Médio da Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 1323
        mmWidth = 32015
        BandType = 7
      end
      object ppDBCalc30: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BDEMapaCustoRVGroup
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaCustoRVGroup'
        mmHeight = 3704
        mmLeft = 89165
        mmTop = 1323
        mmWidth = 34660
        BandType = 7
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = BDEMapaCustoRVGroup
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEMapaCustoRVGroup'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand2AfterPrint
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel73: TppLabel
          UserName = 'Label1'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 1588
          mmWidth = 36407
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'dbSumSaldoAquiPlan'
          DataField = 'SALDOAQUI'
          DataPipeline = BDEMapaCustoRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRVGroup'
          mmHeight = 3175
          mmLeft = 170921
          mmTop = 1588
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel74: TppLabel
          OnPrint = lblPUMedPlanPrint
          UserName = 'lblPUMedPlan'
          Caption = 'PU Médio do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 135467
          mmTop = 1588
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'dbTotQtdPlan'
          DataField = 'SALDOQTDEINVCART'
          DataPipeline = BDEMapaCustoRVGroup
          DisplayFormat = '###,###,###,###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEMapaCustoRVGroup'
          mmHeight = 3175
          mmLeft = 96838
          mmTop = 1588
          mmWidth = 29634
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList3: TppParameterList
    end
  end
  object BDEMapaCustoRVGroup: TppBDEPipeline
    DataSource = dsMapaRenVarOutros
    UserName = 'BDEMapaCustoRVGroup'
    Left = 810
    Top = 119
  end
  object rptMapaPosicaoRenVarCon: TppReport
    AutoStop = False
    DataPipeline = pplMapaPosicaoRenVarCon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Posisão de Renda Variável'
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
    BeforePrint = rptMapaPosicaoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 440
    Top = 173
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMapaPosicaoRenVarCon'
    object ppHeaderBand4: TppHeaderBand
      BeforePrint = pphbRPosBeforePrint
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppShape18: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 5292
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Posição de Renda Variável - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 113411
        BandType = 0
      end
      object ppLabel76: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'lblPeriodoPosicao'
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
      object ppDBImage7: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel78: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 20902
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'lblSldAnteriorQtd'
        Caption = 'Quantidade'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 166952
        mmTop = 20902
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'lblSldAnteriorVlr'
        Caption = 'Saldo Atual'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 252148
        mmTop = 20902
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'lblComprasQtd'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 192882
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'lblComprasVlr'
        Caption = 'Data Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 201348
        mmTop = 20902
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'lblVendas1'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 234421
        mmTop = 20902
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'lblDescInvest1'
        Caption = 'Sigla'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 80698
        mmTop = 20902
        mmWidth = 6604
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'TODOS OS PLANOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 251355
        mmTop = 14023
        mmWidth = 30692
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape20: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'dbComprasVlr'
        DataField = 'DATACOTACAO'
        DataPipeline = pplMapaPosicaoRenVarCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 201877
        mmTop = 795
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'dbComprasQtd'
        DataField = 'LOTE'
        DataPipeline = pplMapaPosicaoRenVarCon
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 795
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'dbVendasQtd'
        DataField = 'COTACAO'
        DataPipeline = pplMapaPosicaoRenVarCon
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 222515
        mmTop = 795
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'dbSldAntVlr'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = pplMapaPosicaoRenVarCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 248179
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppdbDescInvest'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplMapaPosicaoRenVarCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 794
        mmWidth = 75406
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'dbSldAntQtd'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = pplMapaPosicaoRenVarCon
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'ppdbDescInvest1'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = pplMapaPosicaoRenVarCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 794
        mmWidth = 64823
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable12: TppSystemVariable
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel86: TppLabel
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
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLine23: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
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
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = pplMapaPosicaoRenVarCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosicaoRenVarCon'
        mmHeight = 4233
        mmLeft = 225690
        mmTop = 1852
        mmWidth = 56621
        BandType = 7
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplMapaPosicaoRenVarCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaPosicaoRenVarCon'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape22: TppShape
          UserName = 'shpCarteira'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppdbDescCarteiraCons: TppDBText
          OnPrint = ppdbDescCarteiraConsPrint
          UserName = 'ppdbDescCarteira'
          DataField = 'DESCCARTINVEST'
          DataPipeline = pplMapaPosicaoRenVarCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplMapaPosicaoRenVarCon'
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
      end
      object ppgMPosCarteiraCons: TppGroupFooterBand
        AfterPrint = ppgMPosCarteiraConsAfterPrint
        BeforePrint = ppgMPosCarteiraConsBeforePrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape23: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLine26: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel89: TppLabel
          UserName = 'Label1'
          Caption = 'Total da Carteira: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 1323
          mmWidth = 21590
          BandType = 5
          GroupNo = 1
        end
        object ppDBText56: TppDBText
          UserName = 'DBText6'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = pplMapaPosicaoRenVarCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaPosicaoRenVarCon'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 1323
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object pplMapaPosicaoRenVarCon: TppBDEPipeline
    DataSource = DtsMapaRenVarCon
    UserName = 'pplMapaPosicaoRenVarCon'
    Left = 440
    Top = 221
  end
  object QryMapaRenVarCon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVESTIMENTO,'
      '   DATACOTACAO, COTACAO, LOTE,IDSEGMENTACAO,DESCSEGMENTACAO,'
      '   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART,'
      '   SUM(SALDOVLRINVCART) AS SALDOVLRINVCART,'
      ''
      '   --william'
      
        '   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTD' +
        'ECC, ROUND(SUM ((QTDECC * COTACAO)/LOTE),2) AS SALDOVLRCC, ROUND' +
        '(SUM ((QTDECCI * COTACAO)/LOTE),2) AS SALDOVLRCCI,'
      '   SUM(QTDECCI) AS QTDECCI'
      'FROM ('
      '         SELECT'
      '                SM.IDSEGMENTACAO, SM.DESCSEGMENTACAO,'
      
        '                AB2.SIGLAACAOBOLSA, PP.PLANPRVCONTABPATRO, DECOD' +
        'E('#39'A'#39','#39'A'#39',CA.DESCCARTINVEST,'#39' '#39') AS DESCCARTINVEST,'
      '                IV.DESCINVESTIMENTO,'
      '                NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,'
      
        '                DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(' +
        'H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,'
      '                ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,'
      
        '                DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOA' +
        'QUI / H1.SALDOQTDEINVCART),10))) AS PUCUSTO,'
      
        '                NVL(OPER.VLRRESTITUICAO * -1,0) AS VLRRESTCAPITA' +
        'L,'
      
        '                NVL(SALDOANTERIOR.SALDOQTDEINVCART,0) AS SALDOQT' +
        'DEINVCARTANT ,'
      
        '                NVL(SALDOANTERIOR.SALDOVLRINVCART,0) AS SALDOVLR' +
        'INVCARTANT,'
      '                DECODE(((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1), 0, 0,'
      '                          ((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1) + NVL(OPER.VLRRESTI' +
        'TUICAO,0)) AS VARIACAO,'
      
        '                (NVL(OPER.QTDECOMPRAS,0) + NVL(OPER.QTDTRPACRESC' +
        ',0)) AS QTDECOMPRAS,'
      
        '                (NVL(OPER.VLRCOMPRAS,0)  + NVL(OPER.DESPESASCP,0' +
        ') - NVL(OPER.VLRCOMPRASDIRSUB,0) + NVL(OPER.VLRTRPACRESC,0) ) AS' +
        ' VLRCOMPRAS,'
      
        '                (NVL(OPER.QTDEVENDAS,0)  + NVL(OPER.QTDTRPBAIXA,' +
        '0)) AS QTDEVENDAS,'
      
        '                (NVL(OPER.VLRVENDAS,0) - NVL(OPER.DESPESASVD,0) ' +
        '+ ABS(NVL(OPER.VLRTRPBAIXA,0)) ) AS VLRVENDAS,'
      
        '                ROUND((COT.VLRCONTABIL/COT.QTDTITLOTE),8) AS COT' +
        'ACAO,'
      '                (COT.DATACOTACAO) AS DATACOTACAO,'
      '                (COT.QTDTITLOTE) AS LOTE,'
      
        '                ROUND((H1.SALDOVLRINVCART - (H1.SALDOQTDEINVCART' +
        ' * (COT.VLRCONTABIL/COT.QTDTITLOTE))),2) AS DIF,'
      '                NVL(AJQ.QTDEOPERACAO,0) AS QTDAJUSTE,'
      '                NVL(AJQ.VLROPERACAO,0)  AS VLRAJUSTE,'
      
        '                DECODE(NVL(AJQ.QTDEOPERACAO,0),0,'#39#39','#39'*'#39') AS STAA' +
        'JUSTEQTD,'
      '                NVL(AJC.VLROPERACAO,0)  AS CUSTOAJUSTE,'
      
        '                DECODE(NVL(AJC.VLROPERACAO,0),0,'#39#39','#39'*'#39') AS STAAJ' +
        'USTECUSTO,'
      '                ABS(NVL(OPER.VLRTRPBAIXA,0))  AS VLRTRPBAIXA,'
      '                NVL(OPER.QTDTRPBAIXA,0)  AS QTDTRPBAIXA,'
      '                NVL(OPER.VLRTRPACRESC,0) AS VLRTRPACRESC,'
      '                NVL(OPER.QTDTRPACRESC,0) AS QTDTRPACRESC,'
      ''
      '                NVL(H1.SALDOQTDECPMF,0) AS QTDECC,'
      
        '                (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECP' +
        'MF,0)) AS QTDECCI,'
      ''
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR) AS SALDOPLANO,'
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR, H1.IDCARTEIRAINVEST) AS SALDOCART,'
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR, H1.IDINVESTIMENTO) AS SALDOINV,'
      
        '                DECODE('#39'A'#39','#39'A'#39',H1.IDCARTEIRAINVEST,'#39#39') AS IDCART' +
        'EIRAINVEST'
      
        '         FROM HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA' +
        ', TIPOOPERACAO TP, VWPLANPREVCTBPATR PP, SEGMENTACAOMERCADO SM, ' +
        'EMISSOR EM,'
      
        '            (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL, QT' +
        'DTITLOTE'
      '             FROM COTACAOINVEST'
      
        '             WHERE DATACOTACAO||IDINVESTIMENTO IN (SELECT MAX(DA' +
        'TACOTACAO)||IDINVESTIMENTO'
      
        '                                                   FROM COTACAOI' +
        'NVEST'
      
        '                                                   WHERE DATACOT' +
        'ACAO <= TO_DATE('#39'04/01/2010'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                   GROUP BY IDIN' +
        'VESTIMENTO) ) COT,'
      
        '            (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST,HA' +
        '.IDINVESTIMENTO, HA.SALDOQTDEINVCART, HA.SALDOVLRINVCART, HA.SAL' +
        'DOVARIACAO'
      '             FROM HISTCARTINV HA'
      '             WHERE (HA.IDHISTCARTINV IN'
      '                    (SELECT MAX(HA2.IDHISTCARTINV)'
      '                     FROM HISTCARTINV HA2'
      '                     WHERE (HA2.IDTIPOINVEST = 2)'
      
        '                       AND (('#39#39' IS NULL) OR (HA2.IDPLANPREVCTBPA' +
        'TR = '#39#39'))'
      
        '                       AND (('#39#39' IS NULL)  OR (HA2.IDCARTEIRAINVE' +
        'ST = '#39#39'))'
      '                       AND (HA2.IDCARTEIRAGERENC IS NULL)'
      
        '                       AND (HA2.DATAMOVCARTINV = TO_DATE('#39'31/12/' +
        '2009'#39','#39'DD/MM/YYYY'#39'))'
      
        '                     GROUP BY HA2.IDTIPOINVEST, HA2.IDPLANPREVCT' +
        'BPATR, HA2.IDCARTEIRAINVEST, HA2.IDCARTEIRAGERENC,'
      
        '                              HA2.IDINVESTIMENTO, HA2.DATAMOVCAR' +
        'TINV) )'
      
        '               AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTER' +
        'IOR,'
      
        '            (SELECT SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDECOMPR' +
        'AS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRCO' +
        'MPRAS,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,PR.IDTIPOOPERDI' +
        'RDSU,         NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                 PR.IDTIPOOPERDI' +
        'RDSU + 10000, NVL(ABS(HC.VLRMOVCARTINV),0), 0)) AS VLRCOMPRASDIR' +
        'SUB,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,  -114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0),'
      
        '                                                 -10114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0), 0 ) ) AS VLRVENDASDIRSUB,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDEVENDA' +
        'S,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRVE' +
        'NDAS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASVD,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.L' +
        'UCPREJ,0),0)) AS LUCPREJ,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASCP,'
      
        '                    SUM(DECODE(HC.IDTIPOOPERACAO,  PR.IDTIPOOPER' +
        'DIRRES ,      NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                   PR.IDTIPOOPER' +
        'DIRRES+10000, NVL(ABS(HC.VLRMOVCARTINV),0),0)) AS VLRRESTITUICAO' +
        ','
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.V' +
        'LRTRPBAIXA,0),0)) AS VLRTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.Q' +
        'TDTRPBAIXA,0),0)) AS QTDTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.V' +
        'LRTRPACRESC,0),0)) AS VLRTRPACRESC,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.Q' +
        'TDTRPACRESC,0),0)) AS QTDTRPACRESC,'
      '                    HC.IDPLANPREVCTBPATR,'
      '                    HC.IDCARTEIRAINVEST,'
      '                    HC.IDINVESTIMENTO'
      
        '             FROM HISTCARTINV HC, INVESTIMENTO IV, TIPOOPERACAO ' +
        'TP, OPERACAOINVEST OP, CORRETVALORES CV,'
      '                  CARTEIRAINVEST CI, PARAMINVEST PR,'
      '                  (SELECT HI.IDOPERACAOINVEST,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'DOP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',(VLRMOVCARTINV*-1),VLRMOVCARTINV),0)) AS DES' +
        'PESAS,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'LUC'#39',VLRM' +
        'OVCARTINV,0)) AS LUCPREJ,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',VLRMOVCARTINV,0)))  AS VLRTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',QTDEMOVINVCART,0))) AS QTDTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',VLRMOVCARTINV,0)))  AS VLRTRPACRESC,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',QTDEMOVINVCART,0)))  AS QTDTRPACRESC'
      '                   FROM HISTCARTINV HI'
      '                   WHERE (HI.IDTIPOINVEST = 2)'
      
        '                     AND (('#39#39' IS NULL) OR (HI.IDPLANPREVCTBPATR ' +
        '= '#39#39'))'
      
        '                     AND (('#39#39' IS NULL)  OR (HI.IDCARTEIRAINVEST ' +
        '= '#39#39'))'
      '                     AND (HI.IDCARTEIRAGERENC IS NULL)'
      
        '                     AND (HI.DATAMOVCARTINV BETWEEN TO_DATE('#39'04/' +
        '01/2010'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                                    TO_DATE('#39'04/' +
        '01/2010'#39','#39'DD/MM/YYYY'#39'))'
      '                     AND ( (HI.TIPMOVCARTINV = '#39'DOP'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'LUC'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'TRP'#39') )'
      '                   GROUP BY HI.IDOPERACAOINVEST) OPER'
      '             WHERE (HC.IDTIPOINVEST = 2)'
      '               AND (('#39#39' IS NULL) OR (HC.IDPLANPREVCTBPATR = '#39#39'))'
      '               AND (('#39#39' IS NULL)  OR (HC.IDCARTEIRAINVEST = '#39#39'))'
      '               AND (HC.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (HC.DATAMOVCARTINV BETWEEN TO_DATE('#39'04/01/201' +
        '0'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE('#39'04/01/201' +
        '0'#39','#39'DD/MM/YYYY'#39'))'
      
        '               AND ((HC.TIPMOVCARTINV = '#39'OPE'#39') OR (HC.TIPMOVCART' +
        'INV = '#39'TRP'#39'))'
      '               AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)'
      '               AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)'
      '               AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '               AND (HC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))'
      '               AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+)' +
        ')'
      '               AND (OP.IDCORRETVALORES  = CV.IDCORRETVALORES(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OPER.IDOPERACAOINVEST(' +
        '+))'
      
        '             GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.' +
        'IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,'
      '                      HC.IDINVESTIMENTO) OPER,'
      ''
      
        '            (SELECT SUM(NVL(O.QTDEOPERACAO,0)) AS QTDEOPERACAO, ' +
        'SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO,'
      
        '                    O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPL' +
        'ANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      '               AND (('#39#39' IS NULL) OR (O.IDPLANPREVCTBPATR = '#39#39'))'
      '               AND (('#39#39' IS NULL)  OR (O.IDCARTEIRAINVEST = '#39#39'))'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE('#39'04/01/2010'#39',' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                           TO_DATE('#39'04/01/2010'#39',' +
        #39'DD/MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJQ'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJQ,'
      ''
      
        '            (SELECT SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO, O.' +
        'IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      '               AND (('#39#39' IS NULL) OR (O.IDPLANPREVCTBPATR = '#39#39'))'
      '               AND (('#39#39' IS NULL)  OR (O.IDCARTEIRAINVEST = '#39#39'))'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE('#39'04/01/2010'#39',' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                           TO_DATE('#39'04/01/2010'#39',' +
        #39'DD/MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJC'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJC,'
      ''
      '            (SELECT IDACAO, SIGLAACAOBOLSA'
      '             FROM ACOESXBOLSA A, PARAMINVEST P'
      '             WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2'
      ''
      '         WHERE (H1.IDHISTCARTINV  IN'
      '                (SELECT MAX(H2.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H2, PARAMINVEST P2'
      '                 WHERE (H2.IDTIPOINVEST = 2)'
      
        '                   AND (('#39#39' IS NULL) OR (H2.IDPLANPREVCTBPATR = ' +
        #39#39'))'
      
        '                   AND (('#39#39' IS NULL)  OR (H2.IDCARTEIRAINVEST = ' +
        #39#39'))'
      '                   AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                   AND (H2.DATAMOVCARTINV  BETWEEN TO_DATE('#39'04/0' +
        '1/2010'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                                   TO_DATE('#39'04/0' +
        '1/2010'#39','#39'DD/MM/YYYY'#39'))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0) + 10000 )'
      
        '                 GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR,' +
        ' H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC,'
      '                          H2.IDINVESTIMENTO))'
      
        '           AND (IV.IDINVESTIMENTO(+)               = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (CA.IDCARTEIRAINVEST(+)             = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (COT.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (TP.IDTIPOINVEST(+)                 = H1.IDTIPOIN' +
        'VEST)'
      
        '           AND (TP.IDTIPOOPERACAO(+)               = H1.IDTIPOOP' +
        'ERACAO)'
      
        '           AND (PP.IDPLANPREVCTBPATR(+)            = H1.IDPLANPR' +
        'EVCTBPATR)'
      ''
      
        '           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (OPER.IDPLANPREVCTBPATR(+)          = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (OPER.IDCARTEIRAINVEST(+)           = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (OPER.IDINVESTIMENTO(+)             = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AJQ.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJQ.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJQ.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AJC.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJC.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJC.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AB2.IDACAO(+)                      = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (IV.IDEMISSOR                       = EM.IDEMISSO' +
        'R)'
      
        '           AND (EM.IDSEGMENTACAO                   = SM.IDSEGMEN' +
        'TACAO)'
      ''
      
        '         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVEST' +
        'IMENTO'
      '    )'
      
        'GROUP BY PLANPRVCONTABPATRO, DESCINVESTIMENTO, SIGLAACAOBOLSA, D' +
        'ESCCARTINVEST, COTACAO, DATACOTACAO, LOTE,'
      
        '         STAAJUSTEQTD, STAAJUSTECUSTO, IDCARTEIRAINVEST, IDSEGME' +
        'NTACAO, DESCSEGMENTACAO'
      ''
      'ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 570
    Top = 173
    object StringField3: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Qtd. Atual'
      DisplayWidth = 18
      FieldName = 'SALDOQTDEINVCART'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 18
      FieldName = 'SALDOVLRINVCART'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object StringField4: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SIGLAACAOBOLSA'
      Visible = False
      Size = 10
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'LOTE'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Cotação'
      DisplayWidth = 12
      FieldName = 'DATACOTACAO'
      Visible = False
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 16
      FieldName = 'COTACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object QryMapaRenVarConSALDOQTDEINVCART_1: TFloatField
      FieldName = 'SALDOQTDEINVCART_1'
    end
    object QryMapaRenVarConQTDECC: TFloatField
      FieldName = 'QTDECC'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object QryMapaRenVarConSALDOVLRCC: TFloatField
      FieldName = 'SALDOVLRCC'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object QryMapaRenVarConSALDOVLRCCI: TFloatField
      FieldName = 'SALDOVLRCCI'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object QryMapaRenVarConQTDECCI: TFloatField
      FieldName = 'QTDECCI'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object QryMapaRenVarConIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
    object QryMapaRenVarConDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
  end
  object DtsMapaRenVarCon: TwwDataSource
    DataSet = QryMapaRenVarCon
    Left = 574
    Top = 219
  end
  object pplMapaPosRVGroupCon: TppBDEPipeline
    DataSource = DtsMapaRenVarCon
    UserName = 'pplMapaPosRVGroupCon'
    Left = 696
    Top = 217
    object pplMapaPosRVGroupConppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplMapaPosRVGroupConppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDEINVCART'
      FieldName = 'SALDOQTDEINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 1
    end
    object pplMapaPosRVGroupConppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRINVCART'
      FieldName = 'SALDOVLRINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 2
    end
    object pplMapaPosRVGroupConppField4: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 30
      Position = 3
    end
    object pplMapaPosRVGroupConppField5: TppField
      FieldAlias = 'SIGLAACAOBOLSA'
      FieldName = 'SIGLAACAOBOLSA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object pplMapaPosRVGroupConppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE'
      FieldName = 'LOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplMapaPosRVGroupConppField7: TppField
      FieldAlias = 'DATACOTACAO'
      FieldName = 'DATACOTACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 12
      Position = 6
    end
    object pplMapaPosRVGroupConppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTACAO'
      FieldName = 'COTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 7
    end
    object pplMapaPosRVGroupConppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDEINVCART_1'
      FieldName = 'SALDOQTDEINVCART_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplMapaPosRVGroupConppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECC'
      FieldName = 'QTDECC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplMapaPosRVGroupConppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRCC'
      FieldName = 'SALDOVLRCC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplMapaPosRVGroupConppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRCCI'
      FieldName = 'SALDOVLRCCI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplMapaPosRVGroupConppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECCI'
      FieldName = 'QTDECCI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplMapaPosRVGroupConppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSEGMENTACAO'
      FieldName = 'IDSEGMENTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplMapaPosRVGroupConppField15: TppField
      FieldAlias = 'DESCSEGMENTACAO'
      FieldName = 'DESCSEGMENTACAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
  end
  object rptMapaPosRVGroupCon: TppReport
    AutoStop = False
    DataPipeline = pplMapaPosRVGroupCon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Posisão de Renda Variável'
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
    BeforePrint = rptMapaPosicaoRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 696
    Top = 171
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMapaPosRVGroupCon'
    object ppHeaderBand5: TppHeaderBand
      BeforePrint = pphbRPosBeforePrint
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object ppLabel90: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Posição de Renda Variável - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 113411
        BandType = 0
      end
      object ppLabel91: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'lblPeriodoPosGroup'
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
      object ppDBImage8: TppDBImage
        UserName = 'DbLogo4'
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
      object ppShape25: TppShape
        UserName = 'Shape15'
        mmHeight = 22490
        mmLeft = 25400
        mmTop = 23283
        mmWidth = 258763
        BandType = 0
      end
      object MemoMovGroupCon: TppMemo
        UserName = 'MemoMovGroupCon'
        Caption = 'MemoMovGroupCon'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 20902
        mmLeft = 26194
        mmTop = 24077
        mmWidth = 257176
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label40'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 25665
        mmTop = 19050
        mmWidth = 43011
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'TODOS OS PLANOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 250561
        mmTop = 19050
        mmWidth = 30692
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape26: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'dbComprasVlr'
        DataField = 'DATACOTACAO'
        DataPipeline = pplMapaPosRVGroupCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 201877
        mmTop = 795
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'dbComprasQtd'
        DataField = 'LOTE'
        DataPipeline = pplMapaPosRVGroupCon
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 795
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'dbVendasQtd'
        DataField = 'COTACAO'
        DataPipeline = pplMapaPosRVGroupCon
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 222515
        mmTop = 795
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'dbSldAntVlr'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = pplMapaPosRVGroupCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 248179
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppdbDescInvest'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplMapaPosRVGroupCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 794
        mmWidth = 75406
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'dbSldAntQtd'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = pplMapaPosRVGroupCon
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 795
        mmWidth = 34130
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'ppdbDescInvest1'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = pplMapaPosRVGroupCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 794
        mmWidth = 64823
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable14: TppSystemVariable
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel101: TppLabel
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
        mmTop = 794
        mmWidth = 284163
        BandType = 8
      end
      object ppLine27: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
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
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel102: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1852
        mmWidth = 18521
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = pplMapaPosRVGroupCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaPosRVGroupCon'
        mmHeight = 4233
        mmLeft = 225690
        mmTop = 1852
        mmWidth = 56621
        BandType = 7
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = pplMapaPosRVGroupCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaPosRVGroupCon'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape24: TppShape
          UserName = 'shpConsRentFndCab'
          Brush.Color = clSilver
          mmHeight = 5292
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppLabel93: TppLabel
          UserName = 'lblDescInvest'
          Caption = 'Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 6879
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel94: TppLabel
          UserName = 'lblSldAnteriorQtd'
          Caption = 'Quantidade'
          Color = 14935011
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 166688
          mmTop = 6879
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel95: TppLabel
          UserName = 'lblSldAnteriorVlr'
          Caption = 'Saldo Atual'
          Color = 14935011
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 266171
          mmTop = 6879
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel96: TppLabel
          UserName = 'lblComprasQtd'
          Caption = 'Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 192882
          mmTop = 6879
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel97: TppLabel
          UserName = 'lblComprasVlr'
          Caption = 'Data Cotação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 201348
          mmTop = 6879
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel98: TppLabel
          UserName = 'lblVendas1'
          Caption = 'Cotação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 234421
          mmTop = 6879
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel99: TppLabel
          UserName = 'lblDescInvest1'
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 80698
          mmTop = 6879
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppShape17: TppShape
          UserName = 'shpConsRentFndCab5'
          Brush.Color = clSilver
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText42: TppDBText
          UserName = 'ppdbDescInvest5'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = pplMapaPosRVGroupCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplMapaPosRVGroupCon'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 1588
          mmWidth = 75406
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object qrySegmentacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IDSEGMENTACAO, DESCSEGMENTACAO, IDGRUPO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE '
      '  IDGRUPO =:GRUPO')
    ValidateWithMask = True
    Left = 315
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
    object qrySegmentacaoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDGRUPO'
    end
  end
  object qryMapaRenVar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   PLANPRVCONTABPATRO, DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVES' +
        'TIMENTO,'
      
        '   DATACOTACAO, COTACAO, LOTE, STAAJUSTEQTD, STAAJUSTECUSTO, DES' +
        'CSEGMENTACAO, IDSEGMENTACAO,'
      
        '   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTD' +
        'ECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC,'
      
        '   TRUNC(SUM (QTDECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI)' +
        ' AS QTDECCI,'
      
        '   SUM(SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(SALDOAQUI) AS SA' +
        'LDOAQUI, SUM(PUCUSTO) AS PUCUSTO,'
      
        '   SUM(VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(SALDOQTDEINVCARTAN' +
        'T) AS SALDOQTDEINVCARTANT,'
      
        '   SUM(SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(VARIACAO) ' +
        'AS VARIACAO, SUM(QTDECOMPRAS) AS QTDECOMPRAS,'
      
        '   SUM(VLRCOMPRAS) AS VLRCOMPRAS, SUM(QTDEVENDAS) AS QTDEVENDAS,' +
        ' SUM(VLRVENDAS) AS VLRVENDAS,'
      
        '   SUM(DIF) AS DIF, SUM(QTDAJUSTE) AS QTDAJUSTE, SUM(VLRAJUSTE) ' +
        'AS VLRAJUSTE, SUM(CUSTOAJUSTE) AS CUSTOAJUSTE,'
      
        '   SUM(VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(QTDTRPBAIXA) AS QTDTRPBA' +
        'IXA,'
      
        '   SUM(VLRTRPACRESC) AS VLRTRPACRESC, SUM(QTDTRPACRESC) AS QTDTR' +
        'PACRESC,'
      ''
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANO,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SAL' +
        'DOCART,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCIN' +
        'VESTIMENTO) AS SALDOINV,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERAL,'
      ''
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALD' +
        'OCARTCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINV' +
        'ESTIMENTO) AS SALDOINVCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCC,'
      ''
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SAL' +
        'DOCARTCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCIN' +
        'VESTIMENTO) AS SALDOINVCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCCI'
      ''
      
        '--   SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALD' +
        'OVLRINVCART,0)) )) OVER (PARTITION BY H1.IDPLANPREVCTBPATR) AS S' +
        'ALDOPLANO,'
      
        '--   SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALD' +
        'OVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, DECOD' +
        'E('#39'S'#39','#39'A'#39',H1.IDCARTEIRAINVEST,1)) AS SALDOCART,'
      
        '--   SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALD' +
        'OVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVCTBPATR, DECOD' +
        'E('#39'S'#39','#39'A'#39',H1.IDCARTEIRAINVEST,1), H1.IDINVESTIMENTO) AS SALDOINV' +
        ','
      ''
      '--   SUM(SALDOPLANO) AS SALDOPLANO,'
      '--   SUM(SALDOCART) AS SALDOCART,'
      '--   SUM(SALDOINV) AS SALDOINV'
      'FROM ('
      '         SELECT '
      
        '                AB2.SIGLAACAOBOLSA, PP.PLANPRVCONTABPATRO, DECOD' +
        'E(:VARGROUP,'#39'A'#39',CA.DESCCARTINVEST,'#39' '#39') AS DESCCARTINVEST,'
      '                IV.DESCINVESTIMENTO,'
      '                NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,'
      
        '                DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(' +
        'H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,'
      '                ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,'
      
        '                DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOA' +
        'QUI / H1.SALDOQTDEINVCART),10))) AS PUCUSTO,'
      
        '                NVL(OPER.VLRRESTITUICAO * -1,0) AS VLRRESTCAPITA' +
        'L,'
      
        '                NVL(SALDOANTERIOR.SALDOQTDEINVCART,0) AS SALDOQT' +
        'DEINVCARTANT ,'
      
        '                NVL(SALDOANTERIOR.SALDOVLRINVCART,0) AS SALDOVLR' +
        'INVCARTANT,'
      '                DECODE(((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1), 0, 0,'
      '                          ((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1) + NVL(OPER.VLRRESTI' +
        'TUICAO,0)) AS VARIACAO,'
      
        '                (NVL(OPER.QTDECOMPRAS,0) + NVL(OPER.QTDTRPACRESC' +
        ',0)) AS QTDECOMPRAS,'
      
        '                (NVL(OPER.VLRCOMPRAS,0)  + NVL(OPER.DESPESASCP,0' +
        ') - NVL(OPER.VLRCOMPRASDIRSUB,0) + NVL(OPER.VLRTRPACRESC,0) ) AS' +
        ' VLRCOMPRAS,'
      
        '                (NVL(OPER.QTDEVENDAS,0)  + NVL(OPER.QTDTRPBAIXA,' +
        '0)) AS QTDEVENDAS,'
      
        '                (NVL(OPER.VLRVENDAS,0) - NVL(OPER.DESPESASVD,0) ' +
        '+ ABS(NVL(OPER.VLRTRPBAIXA,0)) ) AS VLRVENDAS,'
      
        '                ROUND((COT.VLRCONTABIL/COT.QTDTITLOTE),8) AS COT' +
        'ACAO,'
      '                (COT.DATACOTACAO) AS DATACOTACAO,'
      '                (COT.QTDTITLOTE) AS LOTE,'
      
        '                ROUND((H1.SALDOVLRINVCART - (H1.SALDOQTDEINVCART' +
        ' * (COT.VLRCONTABIL/COT.QTDTITLOTE))),2) AS DIF,'
      '                NVL(AJQ.QTDEOPERACAO,0) AS QTDAJUSTE,'
      '                NVL(AJQ.VLROPERACAO,0)  AS VLRAJUSTE,'
      
        '                DECODE(NVL(AJQ.QTDEOPERACAO,0),0,'#39#39','#39'*'#39') AS STAA' +
        'JUSTEQTD,'
      '                NVL(AJC.VLROPERACAO,0)  AS CUSTOAJUSTE,'
      
        '                DECODE(NVL(AJC.VLROPERACAO,0),0,'#39#39','#39'*'#39') AS STAAJ' +
        'USTECUSTO,'
      '                ABS(NVL(OPER.VLRTRPBAIXA,0))  AS VLRTRPBAIXA,'
      '                NVL(OPER.QTDTRPBAIXA,0)  AS QTDTRPBAIXA,'
      '                NVL(OPER.VLRTRPACRESC,0) AS VLRTRPACRESC,'
      '                NVL(OPER.QTDTRPACRESC,0) AS QTDTRPACRESC,'
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR) AS SALDOPLANO,'
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR, H1.IDCARTEIRAINVEST) AS SALDOCART,'
      
        '--                SUM(DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0,' +
        ' (NVL(H1.SALDOVLRINVCART,0)))) OVER (PARTITION BY H1.IDPLANPREVC' +
        'TBPATR, H1.IDINVESTIMENTO) AS SALDOINV,'
      
        '                DECODE(:VARGROUP,'#39'A'#39',H1.IDCARTEIRAINVEST,'#39#39') AS ' +
        'IDCARTEIRAINVEST, SM.DESCSEGMENTACAO, SM.IDSEGMENTACAO,'
      '                       NVL(H1.SALDOQTDECPMF,0) AS QTDECC,'
      
        '                      (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDO' +
        'QTDECPMF,0)) AS QTDECCI '
      
        '         FROM HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA' +
        ', TIPOOPERACAO TP, VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAO' +
        'MERCADO SM,'
      
        '            (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL, QT' +
        'DTITLOTE'
      '             FROM COTACAOINVEST'
      
        '             WHERE DATACOTACAO||IDINVESTIMENTO IN (SELECT MAX(DA' +
        'TACOTACAO)||IDINVESTIMENTO'
      
        '                                                   FROM COTACAOI' +
        'NVEST'
      
        '                                                   WHERE DATACOT' +
        'ACAO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '                                                   GROUP BY IDIN' +
        'VESTIMENTO) ) COT,'
      
        '            (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST,HA' +
        '.IDINVESTIMENTO, HA.SALDOQTDEINVCART, HA.SALDOVLRINVCART, HA.SAL' +
        'DOVARIACAO'
      '             FROM HISTCARTINV HA'
      '             WHERE (HA.IDHISTCARTINV IN'
      '                    (SELECT MAX(HA2.IDHISTCARTINV)'
      '                     FROM HISTCARTINV HA2'
      '                     WHERE (HA2.IDTIPOINVEST = 2)'
      
        '                       AND ((:IDPLANPREVCTBPATR IS NULL) OR (HA2' +
        '.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                       AND ((:IDCARTEIRAINVEST IS NULL)  OR (HA2' +
        '.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      '                       AND (HA2.IDCARTEIRAGERENC IS NULL)'
      
        '                       AND (HA2.DATAMOVCARTINV = TO_DATE(:DATAAN' +
        'T,'#39'DD/MM/YYYY'#39'))'
      
        '                     GROUP BY HA2.IDTIPOINVEST, HA2.IDPLANPREVCT' +
        'BPATR, HA2.IDCARTEIRAINVEST, HA2.IDCARTEIRAGERENC,'
      
        '                              HA2.IDINVESTIMENTO, HA2.DATAMOVCAR' +
        'TINV) )'
      
        '               AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTER' +
        'IOR,'
      
        '            (SELECT SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDECOMPR' +
        'AS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRCO' +
        'MPRAS,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,PR.IDTIPOOPERDI' +
        'RDSU,         NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                 PR.IDTIPOOPERDI' +
        'RDSU + 10000, NVL(ABS(HC.VLRMOVCARTINV),0), 0)) AS VLRCOMPRASDIR' +
        'SUB,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,  -114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0),'
      
        '                                                 -10114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0), 0 ) ) AS VLRVENDASDIRSUB,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),0),0)) AS QTDEVENDA' +
        'S,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),0),0)) AS VLRVE' +
        'NDAS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASVD,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.L' +
        'UCPREJ,0),0)) AS LUCPREJ,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASCP,'
      
        '                    SUM(DECODE(HC.IDTIPOOPERACAO,  PR.IDTIPOOPER' +
        'DIRRES ,      NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                   PR.IDTIPOOPER' +
        'DIRRES+10000, NVL(ABS(HC.VLRMOVCARTINV),0),0)) AS VLRRESTITUICAO' +
        ','
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.V' +
        'LRTRPBAIXA,0),0)) AS VLRTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.Q' +
        'TDTRPBAIXA,0),0)) AS QTDTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.V' +
        'LRTRPACRESC,0),0)) AS VLRTRPACRESC,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.Q' +
        'TDTRPACRESC,0),0)) AS QTDTRPACRESC,'
      '                    HC.IDPLANPREVCTBPATR,'
      '                    HC.IDCARTEIRAINVEST,'
      '                    HC.IDINVESTIMENTO'
      
        '             FROM HISTCARTINV HC, INVESTIMENTO IV, TIPOOPERACAO ' +
        'TP, OPERACAOINVEST OP, CORRETVALORES CV,'
      '                  CARTEIRAINVEST CI, PARAMINVEST PR,'
      '                  (SELECT HI.IDOPERACAOINVEST,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'DOP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',(VLRMOVCARTINV*-1),VLRMOVCARTINV),0)) AS DES' +
        'PESAS,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'LUC'#39',VLRM' +
        'OVCARTINV,0)) AS LUCPREJ,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',VLRMOVCARTINV,0)))  AS VLRTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',QTDEMOVINVCART,0))) AS QTDTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',VLRMOVCARTINV,0)))  AS VLRTRPACRESC,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',QTDEMOVINVCART,0)))  AS QTDTRPACRESC'
      '                   FROM HISTCARTINV HI'
      '                   WHERE (HI.IDTIPOINVEST = 2)'
      
        '                     AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI.ID' +
        'PLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                     AND ((:IDCARTEIRAINVEST IS NULL)  OR (HI.ID' +
        'CARTEIRAINVEST = :IDCARTEIRAINVEST))'
      '                     AND (HI.IDCARTEIRAGERENC IS NULL)'
      
        '                     AND (HI.DATAMOVCARTINV BETWEEN TO_DATE(:DAT' +
        'AINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                    TO_DATE(:DAT' +
        'AFIM,'#39'DD/MM/YYYY'#39'))'
      '                     AND ( (HI.TIPMOVCARTINV = '#39'DOP'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'LUC'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'TRP'#39') )'
      '                   GROUP BY HI.IDOPERACAOINVEST) OPER'
      '             WHERE (HC.IDTIPOINVEST = 2)'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '               AND ((:IDCARTEIRAINVEST IS NULL)  OR (HC.IDCARTEI' +
        'RAINVEST = :IDCARTEIRAINVEST))'
      '               AND (HC.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (HC.DATAMOVCARTINV BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39'))'
      
        '               AND ((HC.TIPMOVCARTINV = '#39'OPE'#39') OR (HC.TIPMOVCART' +
        'INV = '#39'TRP'#39'))'
      '               AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)'
      '               AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)'
      '               AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '               AND (HC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))'
      '               AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+)' +
        ')'
      '               AND (OP.IDCORRETVALORES  = CV.IDCORRETVALORES(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OPER.IDOPERACAOINVEST(' +
        '+))'
      
        '             GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.' +
        'IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,'
      '                      HC.IDINVESTIMENTO) OPER,'
      ''
      
        '            (SELECT SUM(NVL(O.QTDEOPERACAO,0)) AS QTDEOPERACAO, ' +
        'SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO,'
      
        '                    O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPL' +
        'ANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      
        '               AND ((:IDCARTEIRAINVEST IS NULL)  OR (O.IDCARTEIR' +
        'AINVEST = :IDCARTEIRAINVEST))'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                                           TO_DATE(:DATAFIM,'#39'DD/' +
        'MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJQ'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJQ,'
      ''
      
        '            (SELECT SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO, O.' +
        'IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      
        '               AND ((:IDCARTEIRAINVEST IS NULL)  OR (O.IDCARTEIR' +
        'AINVEST = :IDCARTEIRAINVEST))'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/' +
        'MM/YYYY'#39') AND'
      
        '                                           TO_DATE(:DATAFIM,'#39'DD/' +
        'MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJC'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJC,'
      ''
      '            (SELECT IDACAO, SIGLAACAOBOLSA'
      '             FROM ACOESXBOLSA A, PARAMINVEST P'
      '             WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2'
      ''
      '         WHERE (H1.IDHISTCARTINV  IN'
      '                (SELECT MAX(H2.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H2, PARAMINVEST P2'
      '                 WHERE (H2.IDTIPOINVEST = 2)'
      
        '                   AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPL' +
        'ANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                   AND ((:IDCARTEIRAINVEST IS NULL)  OR (H2.IDCA' +
        'RTEIRAINVEST = :IDCARTEIRAINVEST))'
      '                   AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                   AND (H2.DATAMOVCARTINV  BETWEEN TO_DATE(:DATA' +
        'INI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                   TO_DATE(:DATA' +
        'FIM,'#39'DD/MM/YYYY'#39'))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0) + 10000 )'
      
        '                 GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR,' +
        ' H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC,'
      '                          H2.IDINVESTIMENTO))'
      '           AND (SM.IDSEGMENTACAO = :IDSEGMENTACAO)'
      
        '           AND (IV.IDINVESTIMENTO(+)               = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (CA.IDCARTEIRAINVEST(+)             = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (COT.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (TP.IDTIPOINVEST(+)                 = H1.IDTIPOIN' +
        'VEST)'
      
        '           AND (TP.IDTIPOOPERACAO(+)               = H1.IDTIPOOP' +
        'ERACAO)'
      
        '           AND (PP.IDPLANPREVCTBPATR(+)            = H1.IDPLANPR' +
        'EVCTBPATR)'
      ''
      
        '           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (OPER.IDPLANPREVCTBPATR(+)          = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (OPER.IDCARTEIRAINVEST(+)           = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (OPER.IDINVESTIMENTO(+)             = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AJQ.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJQ.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJQ.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AJC.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJC.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJC.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '           AND (AB2.IDACAO(+)                      = H1.IDINVEST' +
        'IMENTO)'
      ''
      
        '         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVEST' +
        'IMENTO'
      '    )'
      
        'GROUP BY PLANPRVCONTABPATRO, DESCINVESTIMENTO, SIGLAACAOBOLSA, D' +
        'ESCCARTINVEST, COTACAO, DATACOTACAO, LOTE,'
      
        '         STAAJUSTEQTD, STAAJUSTECUSTO, IDCARTEIRAINVEST, DESCSEG' +
        'MENTACAO, IDSEGMENTACAO'
      ''
      'ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO'
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
    ValidateWithMask = True
    Left = 54
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
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
        Name = 'DATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object qryMapaRenVarSTAAJUSTEQTD: TStringField
      DisplayLabel = ' '
      DisplayWidth = 1
      FieldName = 'STAAJUSTEQTD'
      Size = 1
    end
    object qryMapaRenVarPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryMapaRenVarDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryMapaRenVarSALDOQTDEINVCARTANT: TFloatField
      DisplayLabel = 'Qtd. Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOQTDEINVCARTANT'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object D: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOVLRINVCARTANT'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarQTDECOMPRAS: TFloatField
      DisplayLabel = 'Qtd. de Entrada'
      DisplayWidth = 18
      FieldName = 'QTDECOMPRAS'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarVLRCOMPRAS: TFloatField
      DisplayLabel = 'Vlr. de Entrada'
      DisplayWidth = 18
      FieldName = 'VLRCOMPRAS'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarQTDEVENDAS: TFloatField
      DisplayLabel = 'Qtd. de Saída'
      DisplayWidth = 18
      FieldName = 'QTDEVENDAS'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarVLRVENDAS: TFloatField
      DisplayLabel = 'Vlr. de Saída'
      DisplayWidth = 18
      FieldName = 'VLRVENDAS'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarVLRRESTCAPITAL: TFloatField
      DisplayLabel = 'Restituição~de Capital'
      DisplayWidth = 18
      FieldName = 'VLRRESTCAPITAL'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarSALDOQTDEINVCART: TFloatField
      DisplayLabel = 'Qtd. Atual'
      DisplayWidth = 18
      FieldName = 'SALDOQTDEINVCART'
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarSALDOVLRINVCART: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 18
      FieldName = 'SALDOVLRINVCART'
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Segmentação de Mercado'
      DisplayWidth = 38
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object qryMapaRenVarDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object qryMapaRenVarPUCUSTO: TFloatField
      DisplayLabel = 'PU Custo Médio'
      DisplayWidth = 19
      FieldName = 'PUCUSTO'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.0000000000'
    end
    object qryMapaRenVarSALDOAQUI: TFloatField
      DisplayLabel = 'Custo'
      DisplayWidth = 17
      FieldName = 'SALDOAQUI'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarSIGLAACAOBOLSA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SIGLAACAOBOLSA'
      Visible = False
      Size = 10
    end
    object qryMapaRenVarLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'LOTE'
      Visible = False
    end
    object qryMapaRenVarDATACOTACAO: TDateTimeField
      DisplayLabel = 'Data Cotação'
      DisplayWidth = 12
      FieldName = 'DATACOTACAO'
      Visible = False
    end
    object qryMapaRenVarCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 16
      FieldName = 'COTACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryMapaRenVarVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 18
      FieldName = 'VARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarQTDAJUSTE: TFloatField
      DisplayLabel = 'Ajuste de Qtde.'
      DisplayWidth = 18
      FieldName = 'QTDAJUSTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarVLRAJUSTE: TFloatField
      DisplayLabel = 'Valor do Ajuste'
      DisplayWidth = 18
      FieldName = 'VLRAJUSTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarDIF: TFloatField
      FieldName = 'DIF'
      Visible = False
    end
    object qryMapaRenVarCUSTOAJUSTE: TFloatField
      FieldName = 'CUSTOAJUSTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarSTAAJUSTECUSTO: TStringField
      FieldName = 'STAAJUSTECUSTO'
      Visible = False
      Size = 1
    end
    object qryMapaRenVarSALDOPLANO: TFloatField
      FieldName = 'SALDOPLANO'
      Visible = False
    end
    object qryMapaRenVarSALDOCART: TFloatField
      FieldName = 'SALDOCART'
      Visible = False
    end
    object qryMapaRenVarSALDOINV: TFloatField
      FieldName = 'SALDOINV'
      Visible = False
    end
    object qryMapaRenVarVLRTRPBAIXA: TFloatField
      FieldName = 'VLRTRPBAIXA'
      Visible = False
    end
    object qryMapaRenVarQTDTRPBAIXA: TFloatField
      FieldName = 'QTDTRPBAIXA'
      Visible = False
    end
    object qryMapaRenVarVLRTRPACRESC: TFloatField
      FieldName = 'VLRTRPACRESC'
      Visible = False
    end
    object qryMapaRenVarQTDTRPACRESC: TFloatField
      FieldName = 'QTDTRPACRESC'
      Visible = False
    end
    object qryMapaRenVarSALDOGERAL: TFloatField
      FieldName = 'SALDOGERAL'
      Visible = False
    end
    object qryMapaRenVarIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object qryMapaRenVarQTDECC: TFloatField
      FieldName = 'QTDECC'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarSALDOVLRCC: TFloatField
      FieldName = 'SALDOVLRCC'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarSALDOVLRCCI: TFloatField
      FieldName = 'SALDOVLRCCI'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0.00'
    end
    object qryMapaRenVarQTDECCI: TFloatField
      FieldName = 'QTDECCI'
      Visible = False
      DisplayFormat = '###,###,###,###,###,##0'
    end
    object qryMapaRenVarSALDOPLANOCC: TFloatField
      FieldName = 'SALDOPLANOCC'
      Visible = False
    end
    object qryMapaRenVarSALDOCARTCC: TFloatField
      FieldName = 'SALDOCARTCC'
      Visible = False
    end
    object qryMapaRenVarSALDOINVCC: TFloatField
      FieldName = 'SALDOINVCC'
      Visible = False
    end
    object qryMapaRenVarSALDOGERALCC: TFloatField
      FieldName = 'SALDOGERALCC'
      Visible = False
    end
    object qryMapaRenVarSALDOPLANOCCI: TFloatField
      FieldName = 'SALDOPLANOCCI'
      Visible = False
    end
    object qryMapaRenVarSALDOCARTCCI: TFloatField
      FieldName = 'SALDOCARTCCI'
      Visible = False
    end
    object qryMapaRenVarSALDOINVCCI: TFloatField
      FieldName = 'SALDOINVCCI'
      Visible = False
    end
    object qryMapaRenVarSALDOGERALCCI: TFloatField
      FieldName = 'SALDOGERALCCI'
      Visible = False
    end
  end
  object BDEMapaRenVarOutros: TppBDEPipeline
    DataSource = dsMapaRenVarOutros
    UserName = 'BDEMapaRenVar1'
    Left = 164
    Top = 119
  end
  object qryMapaRenVarOutros: TwwQuery
    AfterScroll = qryMapaRenVarOutrosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TOT.PLANPRVCONTABPATRO, TOT.IDSEGMENTACAO, TOT.DESCSEGMEN' +
        'TACAO, TOT.DESCCARTINVEST,'
      
        'SUM(TOT.SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(TOT.SALDOAQUI) ' +
        'AS SALDOAQUI, SUM(TOT.PUCUSTO) AS PUCUSTO,'
      
        'SUM(TOT.VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(TOT.SALDOQTDEINVC' +
        'ARTANT) AS SALDOQTDEINVCARTANT,'
      
        'SUM(TOT.SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(TOT.VARIA' +
        'CAO) AS VARIACAO, SUM(TOT.QTDECOMPRAS) AS QTDECOMPRAS,'
      
        'SUM(TOT.VLRCOMPRAS) AS VLRCOMPRAS, SUM(TOT.QTDEVENDAS) AS QTDEVE' +
        'NDAS, SUM(TOT.VLRVENDAS) AS VLRVENDAS,'
      
        'SUM(TOT.DIF) AS DIF, SUM(TOT.QTDAJUSTE) AS QTDAJUSTE, SUM(TOT.VL' +
        'RAJUSTE) AS VLRAJUSTE, SUM(TOT.CUSTOAJUSTE) AS CUSTOAJUSTE,'
      
        'SUM(TOT.VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(TOT.QTDTRPBAIXA) AS QTD' +
        'TRPBAIXA,'
      
        'SUM(TOT.LOTE) AS LOTE, SUM(TOT.COTACAO) AS COTACAO, SUM(TOT.SALD' +
        'OQTDEINVCART) AS SALDOQTDEINVCART,'
      'TOT.SALDOPLANO AS SALDOPLANO'
      'FROM'
      ' (SELECT'
      
        '   PLANPRVCONTABPATRO, DESCCARTINVEST, SIGLAACAOBOLSA, DESCINVES' +
        'TIMENTO,'
      
        '   DATACOTACAO, COTACAO, LOTE, STAAJUSTEQTD, STAAJUSTECUSTO, DES' +
        'CSEGMENTACAO, IDSEGMENTACAO, '
      
        '   SUM(SALDOQTDEINVCART) AS SALDOQTDEINVCART, SUM(QTDECC) AS QTD' +
        'ECC, TRUNC(SUM(QTDECC * COTACAO),2) AS SALDOVLRCC, TRUNC(SUM (QT' +
        'DECCI * COTACAO),2) AS SALDOVLRCCI, SUM(QTDECCI) AS QTDECCI,  '
      
        '   SUM(SALDOVLRINVCART) AS SALDOVLRINVCART, SUM(SALDOAQUI) AS SA' +
        'LDOAQUI, SUM(PUCUSTO) AS PUCUSTO,'
      
        '   SUM(VLRRESTCAPITAL) AS VLRRESTCAPITAL, SUM(SALDOQTDEINVCARTAN' +
        'T) AS SALDOQTDEINVCARTANT,'
      
        '   SUM(SALDOVLRINVCARTANT) AS SALDOVLRINVCARTANT, SUM(VARIACAO) ' +
        'AS VARIACAO, SUM(QTDECOMPRAS) AS QTDECOMPRAS,'
      
        '   SUM(VLRCOMPRAS) AS VLRCOMPRAS, SUM(QTDEVENDAS) AS QTDEVENDAS,' +
        ' SUM(VLRVENDAS) AS VLRVENDAS,'
      
        '   SUM(DIF) AS DIF, SUM(QTDAJUSTE) AS QTDAJUSTE, SUM(VLRAJUSTE) ' +
        'AS VLRAJUSTE, SUM(CUSTOAJUSTE) AS CUSTOAJUSTE,'
      
        '   SUM(VLRTRPBAIXA) AS VLRTRPBAIXA, SUM(QTDTRPBAIXA) AS QTDTRPBA' +
        'IXA,'
      
        '   SUM(VLRTRPACRESC) AS VLRTRPACRESC, SUM(QTDTRPACRESC) AS QTDTR' +
        'PACRESC,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANO,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SAL' +
        'DOCART,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCIN' +
        'VESTIMENTO) AS SALDOINV,'
      
        '   SUM(DECODE(SUM(SALDOQTDEINVCART), 0, 0, SUM(SALDOVLRINVCART) ' +
        ')) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERAL,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SALD' +
        'OCARTCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINV' +
        'ESTIMENTO) AS SALDOINVCC,'
      
        '   SUM(DECODE(SUM(QTDECC),0,0, ROUND(SUM (QTDECC * COTACAO),2) )' +
        ') OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCC,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO) AS SALDOPLANOCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST) AS SAL' +
        'DOCARTCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCIN' +
        'VESTIMENTO) AS SALDOINVCCI,'
      
        '   SUM(DECODE(SUM(QTDECCI),0,0, ROUND(SUM(QTDECCI * COTACAO),2) ' +
        ')) OVER (PARTITION BY DESCCARTINVEST) AS SALDOGERALCCI'
      'FROM ('
      '         SELECT '
      '                AB2.SIGLAACAOBOLSA, PP.PLANPRVCONTABPATRO,'
      '                '#39' '#39' AS DESCCARTINVEST,'
      '                IV.DESCINVESTIMENTO,'
      '                NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART,'
      
        '                DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(' +
        'H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,'
      '                ROUND(NVL(H1.SALDOAQUI,0),2) AS SALDOAQUI,'
      
        '                DECODE(H1.SALDOQTDEINVCART,0,0,(ROUND((H1.SALDOA' +
        'QUI / H1.SALDOQTDEINVCART),10))) AS PUCUSTO,'
      
        '                NVL(OPER.VLRRESTITUICAO * -1,0) AS VLRRESTCAPITA' +
        'L,'
      
        '                NVL(SALDOANTERIOR.SALDOQTDEINVCART,0) AS SALDOQT' +
        'DEINVCARTANT,'
      
        '                NVL(SALDOANTERIOR.SALDOVLRINVCART,0) AS SALDOVLR' +
        'INVCARTANT,'
      '                DECODE(((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1), 0, 0,'
      '                          ((NVL(SALDOANTERIOR.SALDOVLRINVCART,0)'
      '                           + NVL(OPER.VLRCOMPRAS,0)'
      '                           - NVL(OPER.VLRCOMPRASDIRSUB,0)'
      '                           + NVL(OPER.DESPESASCP,0)'
      '                           - NVL(OPER.VLRVENDAS,0)'
      '                           + NVL(OPER.DESPESASVD,0)'
      '                           + NVL(OPER.VLRTRPBAIXA,0)'
      '                           + NVL(OPER.VLRTRPACRESC,0)'
      
        '                           - DECODE((NVL(H1.SALDOQTDEINVCART,0))' +
        ', 0, 0, (NVL(H1.SALDOVLRINVCART,0))) )* - 1) + NVL(OPER.VLRRESTI' +
        'TUICAO,0)) AS VARIACAO,'
      
        '                (NVL(OPER.QTDECOMPRAS,0) + NVL(OPER.QTDTRPACRESC' +
        ',0)) AS QTDECOMPRAS,'
      
        '                (NVL(OPER.VLRCOMPRAS,0)  + NVL(OPER.DESPESASCP,0' +
        ') - NVL(OPER.VLRCOMPRASDIRSUB,0) + NVL(OPER.VLRTRPACRESC,0) ) AS' +
        ' VLRCOMPRAS,'
      
        '                (NVL(OPER.QTDEVENDAS,0)  + NVL(OPER.QTDTRPBAIXA,' +
        '0)) AS QTDEVENDAS,'
      
        '                (NVL(OPER.VLRVENDAS,0) - NVL(OPER.DESPESASVD,0) ' +
        '+ ABS(NVL(OPER.VLRTRPBAIXA,0)) ) AS VLRVENDAS,'
      
        '                ROUND((COT.VLRCONTABIL/COT.QTDTITLOTE),8) AS COT' +
        'ACAO,'
      '                (COT.DATACOTACAO) AS DATACOTACAO,'
      '                (COT.QTDTITLOTE) AS LOTE,'
      
        '                ROUND((H1.SALDOVLRINVCART - (H1.SALDOQTDEINVCART' +
        ' * (COT.VLRCONTABIL/COT.QTDTITLOTE))),2) AS DIF,'
      '                NVL(AJQ.QTDEOPERACAO,0) AS QTDAJUSTE,'
      '                NVL(AJQ.VLROPERACAO,0)  AS VLRAJUSTE,'
      
        '                DECODE(NVL(AJQ.QTDEOPERACAO,0),0,'#39#39','#39'*'#39') AS STAA' +
        'JUSTEQTD,'
      '                NVL(AJC.VLROPERACAO,0)  AS CUSTOAJUSTE,'
      
        '                DECODE(NVL(AJC.VLROPERACAO,0),0,'#39#39','#39'*'#39') AS STAAJ' +
        'USTECUSTO,'
      '                ABS(NVL(OPER.VLRTRPBAIXA,0))  AS VLRTRPBAIXA,'
      '                NVL(OPER.QTDTRPBAIXA,0)  AS QTDTRPBAIXA,'
      '                NVL(OPER.VLRTRPACRESC,0) AS VLRTRPACRESC,'
      '                NVL(OPER.QTDTRPACRESC,0) AS QTDTRPACRESC,'
      '                1 AS IDCARTEIRAINVEST,'
      '               NVL(H1.SALDOQTDECPMF,0) AS QTDECC,'
      
        '              (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF' +
        ',0)) AS QTDECCI '
      '               , SM.DESCSEGMENTACAO, SM.IDSEGMENTACAO'
      
        '         FROM HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA' +
        ', TIPOOPERACAO TP, VWPLANPREVCTBPATR PP, EMISSOR EM, SEGMENTACAO' +
        'MERCADO SM,'
      
        '            (SELECT IDINVESTIMENTO, DATACOTACAO, VLRCONTABIL, QT' +
        'DTITLOTE'
      '             FROM COTACAOINVEST'
      
        '             WHERE DATACOTACAO||IDINVESTIMENTO IN (SELECT MAX(DA' +
        'TACOTACAO)||IDINVESTIMENTO'
      
        '                                                   FROM COTACAOI' +
        'NVEST'
      
        '                                                   WHERE DATACOT' +
        'ACAO <= TO_DATE('#39'01/02/2009'#39','#39'DD/MM/YYYY'#39')'
      
        '                                                   GROUP BY IDIN' +
        'VESTIMENTO) ) COT,'
      
        '            (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST,HA' +
        '.IDINVESTIMENTO, HA.SALDOQTDEINVCART, HA.SALDOVLRINVCART, HA.SAL' +
        'DOVARIACAO'
      '             FROM HISTCARTINV HA'
      '             WHERE (HA.IDHISTCARTINV IN'
      '                    (SELECT MAX(HA2.IDHISTCARTINV)'
      '                     FROM HISTCARTINV HA2'
      '                     WHERE (HA2.IDTIPOINVEST = 2)'
      '                       AND (HA2.IDPLANPREVCTBPATR = 1)'
      '                       AND (HA2.IDCARTEIRAINVEST > 0)'
      '                       AND (HA2.IDCARTEIRAGERENC IS NULL)'
      
        '                       AND (HA2.DATAMOVCARTINV = TO_DATE('#39'30/12/' +
        '2008'#39','#39'DD/MM/YYYY'#39'))'
      
        '                     GROUP BY HA2.IDTIPOINVEST, HA2.IDPLANPREVCT' +
        'BPATR, HA2.IDCARTEIRAINVEST, HA2.IDCARTEIRAGERENC,'
      
        '                              HA2.IDINVESTIMENTO, HA2.DATAMOVCAR' +
        'TINV) )'
      
        '               AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTER' +
        'IOR,'
      
        '            (SELECT SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),'#39'TRC'#39',NVL(HC.QTDEMO' +
        'VINVCART,0),0),0)) AS QTDECOMPRAS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),'#39'TRC'#39',NVL(ABS(H' +
        'C.VLRMOVCARTINV),0),0),0)) AS VLRCOMPRAS,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,PR.IDTIPOOPERDI' +
        'RDSU,         NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                 PR.IDTIPOOPERDI' +
        'RDSU + 10000, NVL(ABS(HC.VLRMOVCARTINV),0), 0)) AS VLRCOMPRASDIR' +
        'SUB,'
      
        '                    SUM(DECODE(TP.IDTIPOOPERACAO,  -114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0),'
      
        '                                                 -10114,NVL(ABS(' +
        'HC.VLRMOVCARTINV),0), 0 ) ) AS VLRVENDASDIRSUB,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(HC.QTDEMOVINVCART,0),'#39'TRC'#39',NVL(HC.QTDEMO' +
        'VINVCART,0),0),0)) AS QTDEVENDAS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',DECODE(HC.' +
        'TIPMOVCARTINV,'#39'OPE'#39',NVL(ABS(HC.VLRMOVCARTINV),0),'#39'TRC'#39',NVL(ABS(H' +
        'C.VLRMOVCARTINV),0),0),0)) AS VLRVENDAS,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASVD,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.L' +
        'UCPREJ,0),0)) AS LUCPREJ,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(ABS(OP' +
        'ER.DESPESAS),0),0)) AS DESPESASCP,'
      
        '                    SUM(DECODE(HC.IDTIPOOPERACAO,  PR.IDTIPOOPER' +
        'DIRRES ,      NVL(ABS(HC.VLRMOVCARTINV),0),'
      
        '                                                   PR.IDTIPOOPER' +
        'DIRRES+10000, NVL(ABS(HC.VLRMOVCARTINV),0),0)) AS VLRRESTITUICAO' +
        ','
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.V' +
        'LRTRPBAIXA,0),0)) AS VLRTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'D'#39',NVL(OPER.Q' +
        'TDTRPBAIXA,0),0)) AS QTDTRPBAIXA,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.V' +
        'LRTRPACRESC,0),0)) AS VLRTRPACRESC,'
      
        '                    SUM(DECODE(HC.NATURMOVCARTINV,'#39'A'#39',NVL(OPER.Q' +
        'TDTRPACRESC,0),0)) AS QTDTRPACRESC,'
      '                    HC.IDPLANPREVCTBPATR,'
      '                    HC.IDCARTEIRAINVEST,'
      '                    HC.IDINVESTIMENTO'
      
        '             FROM HISTCARTINV HC, INVESTIMENTO IV, TIPOOPERACAO ' +
        'TP, OPERACAOINVEST OP, CORRETVALORES CV,'
      '                  CARTEIRAINVEST CI, PARAMINVEST PR,'
      '                  (SELECT HI.IDOPERACAOINVEST,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'DOP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',(VLRMOVCARTINV*-1),VLRMOVCARTINV),0)) AS DES' +
        'PESAS,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'LUC'#39',VLRM' +
        'OVCARTINV,0)) AS LUCPREJ,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',VLRMOVCARTINV,0)))  AS VLRTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'D'#39',QTDEMOVINVCART,0))) AS QTDTRPBAIXA,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',VLRMOVCARTINV,0)))  AS VLRTRPACRESC,'
      
        '                          SUM(DECODE(HI.TIPMOVCARTINV,'#39'TRP'#39',DECO' +
        'DE(NATURMOVOPER,'#39'A'#39',QTDEMOVINVCART,0)))  AS QTDTRPACRESC'
      '                   FROM HISTCARTINV HI'
      '                   WHERE (HI.IDTIPOINVEST = 2)'
      '                     AND (HI.IDPLANPREVCTBPATR = 1)'
      '                     AND (HI.IDCARTEIRAINVEST > 0)'
      '                     AND (HI.IDCARTEIRAGERENC IS NULL)'
      
        '                     AND (HI.DATAMOVCARTINV BETWEEN TO_DATE('#39'01/' +
        '01/2009'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                                    TO_DATE('#39'01/' +
        '02/2009'#39','#39'DD/MM/YYYY'#39'))'
      '                     AND ( (HI.TIPMOVCARTINV = '#39'DOP'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'LUC'#39') OR'
      '                           (HI.TIPMOVCARTINV = '#39'TRP'#39') )'
      '                   GROUP BY HI.IDOPERACAOINVEST) OPER'
      '             WHERE (HC.IDTIPOINVEST = 2)'
      '               AND (HC.IDPLANPREVCTBPATR = 1)'
      '               AND (HC.IDCARTEIRAINVEST > 0)'
      '               AND (HC.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (HC.DATAMOVCARTINV BETWEEN TO_DATE('#39'01/01/200' +
        '9'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE('#39'01/02/200' +
        '9'#39','#39'DD/MM/YYYY'#39'))'
      
        '               AND ((HC.TIPMOVCARTINV = '#39'OPE'#39') OR (HC.TIPMOVCART' +
        'INV = '#39'TRP'#39') OR (HC.TIPMOVCARTINV = '#39'TRC'#39'))'
      '               AND (HC.IDTIPOINVEST     = IV.IDTIPOINVEST)'
      '               AND (HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO)'
      '               AND (HC.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST)'
      '               AND (HC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))'
      '               AND (HC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OP.IDOPERACAOINVEST(+)' +
        ')'
      '               AND (OP.IDCORRETVALORES  = CV.IDCORRETVALORES(+))'
      
        '               AND (HC.IDOPERACAOINVEST = OPER.IDOPERACAOINVEST(' +
        '+))'
      
        '             GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.' +
        'IDCARTEIRAINVEST, HC.IDCARTEIRAGERENC,'
      '                      HC.IDINVESTIMENTO) OPER,'
      
        '            (SELECT SUM(NVL(O.QTDEOPERACAO,0)) AS QTDEOPERACAO, ' +
        'SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO,'
      
        '                    O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPL' +
        'ANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      '               AND (O.IDPLANPREVCTBPATR = 1)'
      '               AND (O.IDCARTEIRAINVEST > 0)'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE('#39'01/01/2009'#39',' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                           TO_DATE('#39'01/02/2009'#39',' +
        #39'DD/MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJQ'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJQ,'
      
        '            (SELECT SUM(NVL(O.VLROPERACAO,0)) AS VLROPERACAO, O.' +
        'IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.IDPLANPREVCTBPATR'
      '             FROM OPERACAOINVEST O, BOLETA B'
      '             WHERE (O.IDTIPOINVEST = 2)'
      '               AND (O.IDPLANPREVCTBPATR = 1)'
      '               AND (O.IDCARTEIRAINVEST  > 0)'
      '               AND (O.IDCARTEIRAGERENC IS NULL)'
      
        '               AND (O.DATAOPERACAO BETWEEN TO_DATE('#39'01/01/2009'#39',' +
        #39'DD/MM/YYYY'#39') AND'
      
        '                                           TO_DATE('#39'01/02/2009'#39',' +
        #39'DD/MM/YYYY'#39'))'
      '               AND (B.IDBOLETA     = O.NUMDOCUMENTO)'
      '               AND (B.TIPMOVBOLETA = '#39'AJC'#39')'
      
        '             GROUP BY O.IDTIPOINVEST, O.IDPLANPREVCTBPATR, O.IDC' +
        'ARTEIRAINVEST, O.IDINVESTIMENTO) AJC,'
      '            (SELECT IDACAO, SIGLAACAOBOLSA'
      '             FROM ACOESXBOLSA A, PARAMINVEST P'
      '             WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2'
      '         WHERE (H1.IDHISTCARTINV  IN'
      '                (SELECT MAX(H2.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H2, PARAMINVEST P2'
      '                 WHERE (H2.IDTIPOINVEST = 2)'
      '                   AND (H2.IDPLANPREVCTBPATR = 1)'
      '                   AND (H2.IDCARTEIRAINVEST > 0)'
      '                   AND (H2.IDCARTEIRAGERENC IS NULL)'
      
        '                   AND (H2.DATAMOVCARTINV  BETWEEN TO_DATE('#39'01/0' +
        '1/2009'#39','#39'DD/MM/YYYY'#39') AND'
      
        '                                                   TO_DATE('#39'01/0' +
        '2/2009'#39','#39'DD/MM/YYYY'#39'))'
      
        '                   AND (H2.IDTIPOOPERACAO <> -70) AND (H2.IDTIPO' +
        'OPERACAO <> -10070)'
      
        '                   AND (H2.IDTIPOOPERACAO <> -170) AND (H2.IDTIP' +
        'OOPERACAO <> -10170)'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDSU,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RJUR,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RMUL,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERDI' +
        'RDIV,0) + 10000 )'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0))'
      
        '                   AND (H2.IDTIPOOPERACAO <> NVL(P2.IDTIPOOPERRF' +
        'RAC,0) + 10000 )'
      
        '                 GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR,' +
        ' H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC,'
      '                          H2.IDINVESTIMENTO))'
      '                   AND (SM.IDSEGMENTACAO > 0)'
      
        '           AND (IV.IDINVESTIMENTO(+)               = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (CA.IDCARTEIRAINVEST(+)             = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (COT.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (TP.IDTIPOINVEST(+)                 = H1.IDTIPOIN' +
        'VEST)'
      
        '           AND (TP.IDTIPOOPERACAO(+)               = H1.IDTIPOOP' +
        'ERACAO)'
      
        '           AND (PP.IDPLANPREVCTBPATR(+)            = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (OPER.IDPLANPREVCTBPATR(+)          = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (OPER.IDCARTEIRAINVEST(+)           = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (OPER.IDINVESTIMENTO(+)             = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (AJQ.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJQ.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJQ.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (AJC.IDPLANPREVCTBPATR(+)           = H1.IDPLANPR' +
        'EVCTBPATR)'
      
        '           AND (AJC.IDCARTEIRAINVEST(+)            = H1.IDCARTEI' +
        'RAINVEST)'
      
        '           AND (AJC.IDINVESTIMENTO(+)              = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (AB2.IDACAO(+)                      = H1.IDINVEST' +
        'IMENTO)'
      
        '           AND (IV.IDEMISSOR                       = EM.IDEMISSO' +
        'R)'
      
        '           AND (SM.IDSEGMENTACAO                   = EM.IDSEGMEN' +
        'TACAO)'
      '           AND ('
      '           (H1.IDCARTEIRAINVEST = 1 )'
      '          OR'
      '           (H1.IDCARTEIRAINVEST = 9 )'
      '          OR'
      '           (H1.IDCARTEIRAINVEST = 10 )'
      '          OR'
      '           (H1.IDCARTEIRAINVEST = 12 )'
      '          OR'
      '           (H1.IDCARTEIRAINVEST = 13 )'
      '          OR'
      '           (H1.IDCARTEIRAINVEST = 14 )'
      '               )'
      
        '         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVEST' +
        'IMENTO'
      '    )'
      
        '   GROUP BY PLANPRVCONTABPATRO, DESCINVESTIMENTO, SIGLAACAOBOLSA' +
        ', DESCCARTINVEST, COTACAO, DATACOTACAO, LOTE,'
      
        '         STAAJUSTEQTD, STAAJUSTECUSTO, DESCSEGMENTACAO, IDSEGMEN' +
        'TACAO'
      
        '  ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, DESCINVESTIMENTO ' +
        ') TOT'
      
        'GROUP BY TOT.PLANPRVCONTABPATRO, TOT.DESCSEGMENTACAO, TOT.IDSEGM' +
        'ENTACAO, TOT.DESCCARTINVEST, TOT.SALDOPLANO'
      
        'ORDER BY TOT.PLANPRVCONTABPATRO, TOT.DESCSEGMENTACAO, TOT.IDSEGM' +
        'ENTACAO, TOT.DESCCARTINVEST'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 171
    object qryMapaRenVarOutrosIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
    object qryMapaRenVarOutrosDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object qryMapaRenVarOutrosSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryMapaRenVarOutrosSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryMapaRenVarOutrosPUCUSTO: TFloatField
      FieldName = 'PUCUSTO'
    end
    object qryMapaRenVarOutrosVLRRESTCAPITAL: TFloatField
      FieldName = 'VLRRESTCAPITAL'
    end
    object qryMapaRenVarOutrosSALDOQTDEINVCARTANT: TFloatField
      FieldName = 'SALDOQTDEINVCARTANT'
    end
    object qryMapaRenVarOutrosSALDOVLRINVCARTANT: TFloatField
      FieldName = 'SALDOVLRINVCARTANT'
    end
    object qryMapaRenVarOutrosVARIACAO: TFloatField
      FieldName = 'VARIACAO'
    end
    object qryMapaRenVarOutrosQTDECOMPRAS: TFloatField
      FieldName = 'QTDECOMPRAS'
    end
    object qryMapaRenVarOutrosVLRCOMPRAS: TFloatField
      FieldName = 'VLRCOMPRAS'
    end
    object qryMapaRenVarOutrosQTDEVENDAS: TFloatField
      FieldName = 'QTDEVENDAS'
    end
    object qryMapaRenVarOutrosVLRVENDAS: TFloatField
      FieldName = 'VLRVENDAS'
    end
    object qryMapaRenVarOutrosDIF: TFloatField
      FieldName = 'DIF'
    end
    object qryMapaRenVarOutrosQTDAJUSTE: TFloatField
      FieldName = 'QTDAJUSTE'
    end
    object qryMapaRenVarOutrosVLRAJUSTE: TFloatField
      FieldName = 'VLRAJUSTE'
    end
    object qryMapaRenVarOutrosCUSTOAJUSTE: TFloatField
      FieldName = 'CUSTOAJUSTE'
    end
    object qryMapaRenVarOutrosVLRTRPBAIXA: TFloatField
      FieldName = 'VLRTRPBAIXA'
    end
    object qryMapaRenVarOutrosQTDTRPBAIXA: TFloatField
      FieldName = 'QTDTRPBAIXA'
    end
    object qryMapaRenVarOutrosPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryMapaRenVarOutrosDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      FixedChar = True
      Size = 1
    end
    object qryMapaRenVarOutrosLOTE: TFloatField
      FieldName = 'LOTE'
    end
    object qryMapaRenVarOutrosCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qryMapaRenVarOutrosSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryMapaRenVarOutrosSALDOPLANO: TFloatField
      FieldName = 'SALDOPLANO'
    end
  end
  object dsMapaRenVarOutros: TwwDataSource
    DataSet = qryMapaRenVarOutros
    Left = 165
    Top = 219
  end
  object rptMapaMovRVGroup: TppReport
    AutoStop = False
    DataPipeline = DBEMapaMovRVGroup
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Movimentação em Renda Variável'
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
    BeforePrint = rptMapaRenVarBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 702
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'DBEMapaMovRVGroup'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 61383
      mmPrintPosition = 0
      object ppShape12: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 14288
        mmLeft = 0
        mmTop = 47094
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'lblVariacao'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 213519
        mmTop = 56621
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'lblSldAnterior'
        Caption = 'Saldo Anterior'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 109009
        mmTop = 47890
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'lblVendas'
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 187590
        mmTop = 47890
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label4'
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 149490
        mmTop = 47890
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label37'
        Caption = 'Mapa de Movimentação em Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 72496
        BandType = 0
      end
      object ppLabel47: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblPosicaoMovGroup: TppLabel
        UserName = 'LPeriodo4'
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
      object ppDBImage5: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLabel49: TppLabel
        UserName = 'lblDescInvest'
        Caption = 'Segmentação de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 56621
        mmWidth = 35010
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'lblSldAnteriorQtd'
        Caption = 'Quantidade'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 113771
        mmTop = 52652
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'lblSldAnteriorVlr'
        Caption = 'Saldo'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 120650
        mmTop = 56621
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'lblQtdCompras'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 52652
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'lblVlrCompras'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 152929
        mmTop = 56621
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'lblVendas1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 180711
        mmTop = 52652
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'lblVendas2'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 188119
        mmTop = 56621
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'lblVariacao1'
        Caption = 'Rest. Capital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 232305
        mmTop = 56621
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'lblVendas3'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265378
        mmTop = 47890
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'lblQtdAtu'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 266436
        mmTop = 52652
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 273315
        mmTop = 56621
        mmWidth = 7673
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 51858
        mmWidth = 284300
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'lblPlanPatroRMov'
        AutoSize = True
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = DBEMapaMovRVGroup
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3683
        mmLeft = 230611
        mmTop = 14023
        mmWidth = 50377
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'shpConsRentFndCab2'
        mmHeight = 22490
        mmLeft = 25400
        mmTop = 23283
        mmWidth = 258763
        BandType = 0
      end
      object ppMemoMovGroup: TppMemo
        UserName = 'MemoMovGroup'
        Caption = 'MemoMovGroup'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 20902
        mmLeft = 26194
        mmTop = 24077
        mmWidth = 257176
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 25665
        mmTop = 19050
        mmWidth = 43011
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppShape13: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe2'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEMapaRenVar'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 10054
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = BDEMapaRenVar
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação em Renda Variável'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDEMapaRenVar'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11377
            mmPrintPosition = 0
            object ppShape21: TppShape
              UserName = 'shpConsRentFndCab1'
              Brush.Color = clSilver
              mmHeight = 10054
              mmLeft = 38100
              mmTop = 0
              mmWidth = 246063
              BandType = 1
            end
            object ppLabel106: TppLabel
              UserName = 'Label3'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 114300
              mmTop = 1270
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel114: TppLabel
              UserName = 'Label114'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2921
              mmLeft = 120915
              mmTop = 6085
              mmWidth = 6646
              BandType = 1
            end
            object ppLabel107: TppLabel
              UserName = 'Label107'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 146579
              mmTop = 1323
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel108: TppLabel
              UserName = 'Label108'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2921
              mmLeft = 153723
              mmTop = 6085
              mmWidth = 6138
              BandType = 1
            end
            object ppLabel109: TppLabel
              UserName = 'Label109'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 181505
              mmTop = 1323
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel110: TppLabel
              UserName = 'Label110'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2921
              mmLeft = 188648
              mmTop = 6085
              mmWidth = 6138
              BandType = 1
            end
            object ppLabel111: TppLabel
              UserName = 'Label1101'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 273844
              mmTop = 6086
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel113: TppLabel
              UserName = 'Label113'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 266965
              mmTop = 1323
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel104: TppLabel
              UserName = 'Label104'
              Caption = 'Investimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 40217
              mmTop = 4498
              mmWidth = 17484
              BandType = 1
            end
            object ppLabel105: TppLabel
              UserName = 'Label1102'
              Caption = 'Variação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2921
              mmLeft = 215107
              mmTop = 6086
              mmWidth = 10202
              BandType = 1
            end
            object ppLabel112: TppLabel
              UserName = 'Label112'
              Caption = 'Rest. Capital'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2921
              mmLeft = 234686
              mmTop = 6086
              mmWidth = 14774
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppShape27: TppShape
              OnPrint = shpDetalhePrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              ShiftWithParent = True
              mmHeight = 8202
              mmLeft = 38100
              mmTop = 529
              mmWidth = 246063
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'dbComprasVlr2'
              DataField = 'VLRCOMPRAS'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 136261
              mmTop = 4498
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'dbComprasQtd2'
              DataField = 'QTDECOMPRAS'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 136261
              mmTop = 529
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'dbVendasQtd2'
              DataField = 'QTDEVENDAS'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 171450
              mmTop = 529
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'dbVendasVlr'
              DataField = 'VLRVENDAS'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 171450
              mmTop = 4498
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'dbSldAntVlr2'
              DataField = 'SALDOVLRINVCARTANT'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 104511
              mmTop = 4498
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'dbSldAtu'
              DataField = 'SALDOVLRINVCART'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 252413
              mmTop = 4498
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'dbSldAntQtd2'
              DataField = 'SALDOQTDEINVCARTANT'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 104511
              mmTop = 529
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText1'
              DataField = 'SALDOQTDEINVCART'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 252413
              mmTop = 529
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText2'
              DataField = 'VARIACAO'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 201877
              mmTop = 4498
              mmWidth = 23548
              BandType = 4
            end
            object ppDBCalc9: TppDBCalc
              UserName = 'dbSomaLinhas'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              Visible = False
              DBCalcType = dcCount
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 2879
              mmLeft = 238390
              mmTop = 529
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'dbRestCapital'
              DataField = 'VLRRESTCAPITAL'
              DataPipeline = BDEMapaRenVar
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 225955
              mmTop = 4498
              mmWidth = 23548
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              DataField = 'STAAJUSTEQTD'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3683
              mmLeft = 281782
              mmTop = 529
              mmWidth = 1852
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'ppdbDescInvest3'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = BDEMapaRenVar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEMapaRenVar'
              mmHeight = 3429
              mmLeft = 39952
              mmTop = 794
              mmWidth = 62442
              BandType = 4
            end
          end
          object ppSummaryBand10: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1852
            mmPrintPosition = 0
          end
        end
      end
      object ppdbSegmentacao: TppDBText
        UserName = 'dbSegmentacao'
        DataField = 'DESCSEGMENTACAO'
        DataPipeline = BDEMapaRenVarOutros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2910
        mmLeft = 2381
        mmTop = 795
        mmWidth = 82286
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'ppdbSldAnterior'
        DataField = 'SALDOVLRINVCARTANT'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 102923
        mmTop = 1323
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppdbSldAnterior1'
        DataField = 'VLRCOMPRAS'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 134673
        mmTop = 1323
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'VLRVENDAS'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 169863
        mmTop = 1323
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'VARIACAO'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 202142
        mmTop = 1323
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = 'VLRRESTCAPITAL'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 226219
        mmTop = 1323
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BDEMapaRenVarOutros
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEMapaRenVarOutros'
        mmHeight = 2646
        mmLeft = 250825
        mmTop = 1323
        mmWidth = 30163
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSystemVariable8: TppSystemVariable
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 283634
        BandType = 8
      end
      object ppLabel60: TppLabel
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
        mmTop = 794
        mmWidth = 283369
        BandType = 8
      end
      object ppLine17: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 794
        mmWidth = 45508
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel61: TppLabel
        UserName = 'Label3'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 16669
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SALDOVLRINVCARTANT'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 93927
        mmTop = 1323
        mmWidth = 34396
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLRCOMPRAS'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 129117
        mmTop = 1323
        mmWidth = 30956
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLRVENDAS'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 1323
        mmWidth = 34396
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VARIACAO'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 195527
        mmTop = 1323
        mmWidth = 30163
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLRRESTCAPITAL'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 1323
        mmWidth = 24871
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = DBEMapaMovRVGroup
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBEMapaMovRVGroup'
        mmHeight = 3704
        mmLeft = 249767
        mmTop = 1323
        mmWidth = 31221
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = DBEMapaMovRVGroup
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBEMapaMovRVGroup'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel62: TppLabel
          UserName = 'Label14'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3302
          mmLeft = 0
          mmTop = 2646
          mmWidth = 36407
          BandType = 5
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line9'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'dbSumVlrAplicado1'
          DataField = 'SALDOVLRINVCARTANT'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3440
          mmLeft = 93663
          mmTop = 2646
          mmWidth = 34660
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'dbSumSldAnterior1'
          DataField = 'VLRCOMPRAS'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3175
          mmLeft = 136525
          mmTop = 2646
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'dbSumVlrIOF1'
          DataField = 'VLRVENDAS'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 2646
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'dbSumVlrResgate2'
          DataField = 'VARIACAO'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3175
          mmLeft = 202142
          mmTop = 2646
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLRRESTCAPITAL'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3175
          mmLeft = 226219
          mmTop = 2646
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'dbSumSldFundo1'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = DBEMapaMovRVGroup
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBEMapaMovRVGroup'
          mmHeight = 3175
          mmLeft = 250825
          mmTop = 2646
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
