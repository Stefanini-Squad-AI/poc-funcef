inherited RelCalcMKTLTN: TRelCalcMKTLTN
  Left = 788
  Top = 261
  Width = 236
  Height = 260
  Caption = 'RelCalcMKTLTN'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cdsCalcMKTLTN: TCMClientDataSet
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
  object sprCalcMKTLTN: TCMSqlParams
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
    ClientDataSet = cdsCalcMKTLTN
    Left = 24
    Top = 72
  end
  object dsCalcMKTLTN: TDataSource
    AutoEdit = False
    DataSet = cdsCalcMKTLTN
    Left = 160
    Top = 72
  end
  object pplCalcMKTLTN: TppBDEPipeline
    DataSource = dsCalcMKTLTN
    UserName = 'lCalcMKTLTN'
    Left = 53
    Top = 136
    object pplCalcMKTLTNppField1: TppField
      FieldAlias = 'DATAFLUXO'
      FieldName = 'DATAFLUXO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object pplCalcMKTLTNppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCalcMKTLTNppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMEMISSAO'
      FieldName = 'CUPOMEMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCalcMKTLTNppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMCOMPRA'
      FieldName = 'CUPOMCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplCalcMKTLTNppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUPAR'
      FieldName = 'PUPAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplCalcMKTLTNppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJUREMISS'
      FieldName = 'PUJUREMISS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCalcMKTLTNppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJURCOMPRA'
      FieldName = 'PUJURCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplCalcMKTLTNppField8: TppField
      FieldAlias = 'ULTIMO'
      FieldName = 'ULTIMO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
  end
  object rptCalcMKTLTN: TppReport
    AutoStop = False
    DataPipeline = pplCalcMKTLTN
    OnStartPage = rptCalcMKTLTNStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valor de Mercado de LTN'
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
    DataPipelineName = 'pplCalcMKTLTN'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object lblTipoCalculo: TppLabel
        UserName = 'Label1'
        Caption = 'Letra do Tesouro Nacional (LTN) '
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 135202
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
        mmLeft = 161132
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
        mmLeft = 186002
        mmTop = 20638
        mmWidth = 13229
        BandType = 0
      end
      object lblCapMoedaInd: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Taxa Indicativa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 206905
        mmTop = 20638
        mmWidth = 23548
        BandType = 0
      end
      object lblInvestimento: TppLabel
        UserName = 'lblInvestimento1'
        Caption = 'LTN : 01/04/2008'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 25400
        mmTop = 32544
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 135202
        mmTop = 32544
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
        mmLeft = 161132
        mmTop = 32544
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
        mmLeft = 186267
        mmTop = 32544
        mmWidth = 13229
        BandType = 0
      end
      object lblTXIndicativa: TppLabel
        UserName = 'lblTXIndicativa'
        Caption = '8,49090000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 208227
        mmTop = 32544
        mmWidth = 21431
        BandType = 0
      end
      object lblCabMoedaInf: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'D.U. até o Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 232040
        mmTop = 20638
        mmWidth = 30956
        BandType = 0
      end
      object lblDU: TppLabel
        UserName = 'lblDU'
        Caption = '182'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 244740
        mmTop = 32544
        mmWidth = 5334
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 187855
        mmTop = 3175
        mmWidth = 66940
        BandType = 7
      end
      object lblPUMercado: TppLabel
        UserName = 'Label21'
        Caption = '3.557,0945473'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 229394
        mmTop = 3704
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 189177
        mmTop = 3969
        mmWidth = 24045
        BandType = 7
      end
    end
  end
end
