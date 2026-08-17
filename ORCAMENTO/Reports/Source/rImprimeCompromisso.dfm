inherited rptImprimeCompromisso: TrptImprimeCompromisso
  Left = 410
  Top = 320
  Width = 260
  Caption = 'rptImprimeCompromisso'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    Report = rpImprimeCompromisso
  end
  object sqlImprimeCompromisso: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTAORCAMEN, C.IDPLANOORCAMEN, '
      '   C.IDGRUPOORCAMEN, C.NOMECONTAORCAMEN, '
      '   C.TIPOCALCREALIZADO, C.TIPOCALCORCADO, '
      '   C.CODCENTRORESPON, G.NOMEGRUPOORCAMEN, '
      '   G.CODGRUPOORC '
      'FROM '
      '   CONTASORCAMEN C, GRUPOORCAMEN G'
      'WHERE'
      '   C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN ')
    ClientDataSet = cdsImprimeCompromisso
    Left = 16
    Top = 48
  end
  object cdsImprimeCompromisso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 48
  end
  object dsImprimeCompromisso: TwwDataSource
    DataSet = cdsImprimeCompromisso
    Left = 96
    Top = 48
  end
  object pplImprimeCompromisso: TppBDEPipeline
    DataSource = dsImprimeCompromisso
    UserName = 'lImprimeCompromisso'
    Left = 136
    Top = 48
  end
  object rpImprimeCompromisso: TppReport
    AutoStop = False
    DataPipeline = pplImprimeCompromisso
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
    Left = 176
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplImprimeCompromisso'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Listagem de Contas Orçamentárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70644
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'ppLabel126'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'ppLabel140'
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 17727
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'ppLabel141'
        Caption = 'da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'ppLabel142'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 17727
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'ppLabel143'
        Caption = 'da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'ppLabel144'
        Caption = 'Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 21696
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'ppLabel145'
        Caption = 'Centro de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 17727
        mmWidth = 15346
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26459
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'ppLabel146'
        Caption = 'Orçamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 21696
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'ppLabel147'
        Caption = 'Grupo da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 17727
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel149: TppLabel
        UserName = 'ppLabel149'
        Caption = 'do Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 200819
        mmTop = 21696
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'ppLabel150'
        Caption = 'Tipo de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 200819
        mmTop = 17727
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'ppLabel151'
        Caption = 'do Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'ppLabel154'
        Caption = 'Tipo de Cálculo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 17727
        mmWidth = 23019
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 529
        mmWidth = 84138
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'ppDBText53'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 529
        mmWidth = 37306
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'ppDBText55'
        DataField = 'CALCORCADO'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 200555
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'ppDBText56'
        DataField = 'CALCREAL'
        DataPipeline = pplImprimeCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImprimeCompromisso'
        mmHeight = 3704
        mmLeft = 243682
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'ppLine39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel155: TppLabel
        UserName = 'ppLabel155'
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
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 123825
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254794
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
