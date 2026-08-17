inherited RelCalcMKTNTN: TRelCalcMKTNTN
  Left = 514
  Top = 335
  Width = 236
  Height = 260
  Caption = 'RelCalcMKTNTN'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cdsCalcMKTNTN: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 72
    Data = {
      8E0100009619E0BD010000001800000008000300000003000000D70009444154
      41464C55584F0800080000000000044449415308000400000000000C4355504F
      4D454D495353414F08000400000000000B4355504F4D434F4D50524108000400
      0000000005505550415208000400000000000A50554A5552454D495353080004
      00000000000B50554A5552434F4D505241080004000000000006554C54494D4F
      010049000000010005574944544802000200010002000D44454641554C545F4F
      5244455202008200010000000100044C43494404000100090800000000000000
      12E260CACC420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E0000000000F41738
      CCCC420000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E0000000000D64D0FCECC42
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000153}
  end
  object sprCalcMKTNTN: TCMSqlParams
    SQL.Strings = (
      
        'SELECT FL.DATAFLUXO, 0 AS DIAS, 0 AS CUPOMEMISSAO, 0 AS CUPOMCOM' +
        'PRA, 0 AS PUPAR, 0 AS PUJUREMISS, 0 AS PUJURCOMPRA, '
      '       DECODE(OP.VENCOPERACAO, '#39#39', '#39'N'#39', '#39'S'#39') AS ULTIMO'
      'FROM   FLUXOINVESTRENFIX FL,'
      '       (SELECT DISTINCT VENCOPERACAO'
      '        FROM OPERRENFIX'
      '        WHERE IDOPERRENFIX = IDOPERRENFIXAPLIC'
      '          AND IDINVESTIMENTO = 2502) OP'
      'WHERE  FL.IDINVESTIMENTO = 2502 '
      '  AND  FL.DATAFLUXO >= TO_DATE('#39'01/12/2006'#39', '#39'DD/MM/YYYY'#39')'
      '  AND  FL.DATAFLUXO = OP.VENCOPERACAO(+)'
      'ORDER BY DATAFLUXO')
    ClientDataSet = cdsCalcMKTNTN
    Left = 24
    Top = 72
  end
  object dsCalcMKTNTN: TDataSource
    AutoEdit = False
    DataSet = cdsCalcMKTNTN
    Left = 160
    Top = 72
  end
  object pplCalcMKTNTN: TppBDEPipeline
    DataSource = dsCalcMKTNTN
    UserName = 'lCalcMKTNTN'
    Left = 53
    Top = 136
    object pplCalcMKTNTNppField1: TppField
      FieldAlias = 'DATAFLUXO'
      FieldName = 'DATAFLUXO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object pplCalcMKTNTNppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCalcMKTNTNppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMEMISSAO'
      FieldName = 'CUPOMEMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCalcMKTNTNppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMCOMPRA'
      FieldName = 'CUPOMCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplCalcMKTNTNppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUPAR'
      FieldName = 'PUPAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplCalcMKTNTNppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJUREMISS'
      FieldName = 'PUJUREMISS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCalcMKTNTNppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJURCOMPRA'
      FieldName = 'PUJURCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCalcMKTNTNppField8: TppField
      FieldAlias = 'ULTIMO'
      FieldName = 'ULTIMO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
  end
  object rptCalcMKTNTN: TppReport
    AutoStop = False
    DataPipeline = pplCalcMKTNTN
    OnStartPage = rptCalcMKTNTNStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valor de Mercado de NTN'
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
    Left = 146
    Top = 136
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCalcMKTNTN'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object lblTipoCalculo: TppLabel
        UserName = 'Label1'
        Caption = 'Nota do Tesouro Nacional (NTN) '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 233892
        mmTop = 14552
        mmWidth = 49742
        BandType = 0
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Valor de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 29104
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
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
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Data Atual: 12/12/2006'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14552
        mmWidth = 33602
        BandType = 0
      end
      object linCabecalho: TppLine
        UserName = 'linCabecalho'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 18521
        mmWidth = 284300
        BandType = 0
      end
      object shpCustodiante: TppShape
        UserName = 'shpDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 8731
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284300
        BandType = 0
      end
      object lblCapInvestimento: TppLabel
        UserName = 'lblCapInvestimento'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 24871
        mmTop = 20638
        mmWidth = 19643
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Aplicação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 20638
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 20638
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Taxa de Emissão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 147638
        mmTop = 20638
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data do PU PAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7620
        mmLeft = 166952
        mmTop = 20638
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label6'
        Caption = 'PU PAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 194469
        mmTop = 20638
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        Caption = 'Taxa de Juros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 20638
        mmWidth = 21431
        BandType = 0
      end
      object lblCabMoedaInf: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Moeda de Inflação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 239978
        mmTop = 20638
        mmWidth = 30956
        BandType = 0
      end
      object lblInvestimento: TppLabel
        UserName = 'lblInvestimento1'
        Caption = 'NTN-C : 01/04/2008'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 25400
        mmTop = 29369
        mmWidth = 28490
        BandType = 0
      end
      object lblDtAplicacao: TppLabel
        UserName = 'lblDtAplicacao'
        Caption = '30/12/2002'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 29369
        mmWidth = 16933
        BandType = 0
      end
      object lblDtVencimento: TppLabel
        UserName = 'lblDtVencimento'
        Caption = '01/04/2008'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 29369
        mmWidth = 17992
        BandType = 0
      end
      object lblTxEmissao: TppLabel
        UserName = 'lblTxEmissao'
        Caption = '6,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 29369
        mmWidth = 13229
        BandType = 0
      end
      object lblDatPUPar: TppLabel
        UserName = 'lblDatPUPar'
        Caption = '01/12/2006'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 29369
        mmWidth = 17463
        BandType = 0
      end
      object lblPUPar: TppLabel
        UserName = 'lblPUPar'
        Caption = '1.887,104411'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 190765
        mmTop = 29369
        mmWidth = 19558
        BandType = 0
      end
      object lblTXJuros: TppLabel
        UserName = 'lblTXJuros'
        Caption = '8,49090000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 215107
        mmTop = 29369
        mmWidth = 21431
        BandType = 0
      end
      object lblMoedaInf: TppLabel
        UserName = 'lblMoedaInf'
        Caption = '0,750000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 29369
        mmWidth = 30956
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'shpDetalhe2'
        ParentWidth = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 40481
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 40746
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Dias Úteis'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 58208
        mmTop = 40746
        mmWidth = 15409
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Cupom Emissão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 82550
        mmTop = 40746
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Cupom Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 40746
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'PU Juros Emissão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 40746
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        Caption = 'PU Juros Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 40746
        mmWidth = 33867
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        ReprintOnOverFlow = True
        DataField = 'DATAFLUXO'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DIAS'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = '#,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CUPOMEMISSAO'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = '###,###,##0.00000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 0
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CUPOMCOMPRA'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = '###,###,##0.00000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 0
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PUJURCOMPRA'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = '###,###,##0.00000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 225955
        mmTop = 0
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'PUJUREMISS'
        DataPipeline = pplCalcMKTNTN
        DisplayFormat = '###,###,##0.00000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCalcMKTNTN'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 0
        mmWidth = 33867
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'lblSistema'
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
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 16933
        mmLeft = 193675
        mmTop = 2910
        mmWidth = 68263
        BandType = 7
      end
      object lblPUMercado: TppLabel
        UserName = 'Label21'
        Caption = '1.978,2564035'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 236453
        mmTop = 14288
        mmWidth = 23368
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'PU de Mercado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 196407
        mmTop = 14552
        mmWidth = 24045
        BandType = 7
      end
      object lblPUParFinal: TppLabel
        UserName = 'Label10'
        OnGetText = lblPUParFinalGetText
        Caption = '1.887.104411'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 238400
        mmTop = 8996
        mmWidth = 21421
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'PU de Par'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 196321
        mmTop = 9260
        mmWidth = 15081
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label12'
        Caption = 'Cupom Compra %'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 196321
        mmTop = 3969
        mmWidth = 27517
        BandType = 7
      end
      object lblCuponCompra: TppLabel
        UserName = 'Label101'
        Caption = '0,9311259755'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 237427
        mmTop = 3704
        mmWidth = 22394
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PUPAR'
      DataPipeline = pplCalcMKTNTN
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCalcMKTNTN'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object sumCupomCompra: TppDBCalc
          UserName = 'sumCupomCompra'
          DataField = 'CUPOMCOMPRA'
          DataPipeline = pplCalcMKTNTN
          DisplayFormat = '###,###,##0.00000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCalcMKTNTN'
          mmHeight = 3704
          mmLeft = 132292
          mmTop = 1323
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'PUJURCOMPRA'
          DataPipeline = pplCalcMKTNTN
          DisplayFormat = '###,###,##0.00000000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCalcMKTNTN'
          mmHeight = 3704
          mmLeft = 225955
          mmTop = 1323
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label9'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 1323
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'linCabecalho1'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
