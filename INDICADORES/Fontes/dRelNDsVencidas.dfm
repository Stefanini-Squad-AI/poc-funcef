inherited dtmRelNDsVencidas: TdtmRelNDsVencidas
  Width = 407
  Caption = 'dtmRelNDsVencidas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    Report = ppNDsVencidas
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Active = False
    ProviderName = 'dsp'
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      '/* SELECT NDs VENCIDAS */'
      ''
      'SELECT IM.IMONOME,'
      '       CL.LOJAS,'
      '       CL.NOMCONTRATO,'
      '       NVL(APMES.VLRAPURACAONUM,0) AS QTDEMESES,'
      '       NVL(APALU.VLRAPURACAONUM,0) AS VLRALUGUEL,       '
      '       NVL(APENC.VLRAPURACAONUM,0) AS VLRENCARGOS, '
      '       NVL(APFUN.VLRAPURACAONUM,0) AS VLRFUNDOS,'
      '       NVL(APLUV.VLRAPURACAONUM,0) AS VLRLUVAS,       '
      '       APPRO.VLRAPURACAOSTR AS DSC_PROVIDENCIA,'
      '       APDAT.VLRAPURACAODAT AS DAT_PROVIDENCIA'
      '  FROM IMOVEL IM,'
      '       IND_CONTRATOLOJA CL,'
      '      ( '
      '       SELECT DISTINCT AP.IDIMOVEL, AP.IDCONTRATO'
      '         FROM IND_GRPINDICADOR GI,'
      '              IND_APURACAO AP '
      '        WHERE GI.IDSUBTIPO = 7'
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '          AND GI.IDINDICADOR = AP.IDINDICADOR   '
      '      ) GI, '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 48'
      '--          AND AP.IDIMOVEL = 1227        '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APMES,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 49'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APALU,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 50'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APENC,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 51'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APFUN,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 52'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APLUV,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAOSTR'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 53'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APPRO,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAODAT'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 54'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APDAT  '
      '   '
      ' WHERE GI.IDCONTRATO = CL.IDCONTRATO'
      '   AND GI.IDIMOVEL   = IM.IDIMOVEL'
      '   AND GI.IDIMOVEL   = APMES.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APMES.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APALU.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APALU.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APENC.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APENC.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APFUN.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APFUN.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APLUV.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APLUV.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APPRO.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APPRO.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APDAT.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APDAT.IDCONTRATO(+)'
      '        '
      '')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
  end
  object ppNDsVencidas: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    BeforePrint = ppNDsVencidasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
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
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'ND´s Vencidas '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284163
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'LOJAS'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMCONTRATO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 529
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QTDEMESES'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 85725
        mmTop = 529
        mmWidth = 7938
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VLRALUGUEL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 96573
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLRENCARGOS'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 116946
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VLRFUNDOS'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VLRLUVAS'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DSC_PROVIDENCIA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 203730
        mmTop = 529
        mmWidth = 57150
        BandType = 4
      end
      object vTotDet: TppVariable
        UserName = 'vTotDet'
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 178330
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DAT_PROVIDENCIA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 261673
        mmTop = 529
        mmWidth = 16404
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object lblSistema: TppLabel
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
        mmWidth = 283369
        BandType = 8
      end
      object ppOrcamentoSystemVariable7: TppSystemVariable
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 255588
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IMONOME'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Loja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 7408
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel1: TppLabel
          UserName = 'OrcamentoLabel1'
          AutoSize = False
          Caption = 'Meses'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 81492
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 119856
          mmTop = 6879
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 142875
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome Fantasia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 18521
          mmTop = 6879
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 102129
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Luvas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 163248
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183886
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Providência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 203730
          mmTop = 6879
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Dt. Providência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 261673
          mmTop = 6879
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total do Shopping'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 18256
          mmTop = 4498
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 2117
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 9260
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object dbcTotAlug: TppDBCalc
          UserName = 'dbcTotAlug'
          BlankWhenZero = True
          DataField = 'VLRALUGUEL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 97102
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcTotEnc: TppDBCalc
          UserName = 'dbcTotEnc'
          BlankWhenZero = True
          DataField = 'VLRENCARGOS'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 117475
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcTotFund: TppDBCalc
          UserName = 'dbcTotFund'
          BlankWhenZero = True
          DataField = 'VLRFUNDOS'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 137848
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbcTotLuv: TppDBCalc
          UserName = 'dbcTotLuv'
          BlankWhenZero = True
          DataField = 'VLRLUVAS'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 158221
          mmTop = 4498
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object vTotShop: TppVariable
          UserName = 'vTotShop'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 178594
          mmTop = 4498
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506AF70726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A20202076546F7444
        65742E4173457874656E646564203A3D202070706C5B27564C52414C55475545
        4C275D202B2070706C5B27564C52454E434152474F53275D202B0D0A20202020
        2020202020202020202020202020202020202020202070706C5B27564C524655
        4E444F53275D20202B2070706C5B27564C524C55564153275D3B0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060644657461696C094576656E744E61
        6D65060B4265666F72655072696E74074576656E74494402180001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061B47726F757046
        6F6F74657242616E64314265666F72655072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F7572636506B470726F636564757265
        2047726F7570466F6F74657242616E64314265666F72655072696E743B0D0A62
        6567696E0D0A20202076546F7453686F702E4173457874656E646564203A3D20
        646263546F74416C75672E56616C7565202B20646263546F74456E632E56616C
        7565202B0D0A2020202020202020202020202020202020202020202020202020
        646263546F7446756E642E56616C7565202B20646263546F744C75762E56616C
        75653B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65061047726F7570
        466F6F74657242616E6431094576656E744E616D65060B4265666F7265507269
        6E74074576656E74494402180000}
    end
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '/* SELECT NDs VENCIDAS */'
      ''
      'SELECT IM.IMONOME,'
      '       CL.LOJAS,'
      '       CL.NOMCONTRATO,'
      '       NVL(APMES.VLRAPURACAONUM,0) AS QTDEMESES,'
      '       NVL(APALU.VLRAPURACAONUM,0) AS VLRALUGUEL,       '
      '       NVL(APENC.VLRAPURACAONUM,0) AS VLRENCARGOS, '
      '       NVL(APFUN.VLRAPURACAONUM,0) AS VLRFUNDOS,'
      '       NVL(APLUV.VLRAPURACAONUM,0) AS VLRLUVAS,       '
      '       APPRO.VLRAPURACAOSTR AS DSC_PROVIDENCIA,'
      '       APDAT.VLRAPURACAODAT AS DAT_PROVIDENCIA'
      '  FROM IMOVEL IM,'
      '       IND_CONTRATOLOJA CL,'
      '      ( '
      '       SELECT DISTINCT AP.IDIMOVEL, AP.IDCONTRATO'
      '         FROM IND_GRPINDICADOR GI,'
      '              IND_APURACAO AP '
      '        WHERE GI.IDSUBTIPO = 7'
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '          AND GI.IDINDICADOR = AP.IDINDICADOR   '
      '      ) GI, '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 48'
      '--          AND AP.IDIMOVEL = 1227        '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APMES,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 49'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APALU,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 50'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APENC,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 51'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APFUN,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAONUM'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 52'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APLUV,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAOSTR'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 53'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APPRO,  '
      '      (   '
      '       SELECT IDIMOVEL, IDCONTRATO, VLRAPURACAODAT'
      '         FROM IND_APURACAO AP'
      '        WHERE AP.IDINDICADOR = 54'
      '--          AND AP.IDIMOVEL    = 1227    '
      '          AND AP.MESCOMPETENCIA = 1'
      '          AND AP.ANOCOMPETENCIA = 2002'
      '       ) APDAT  '
      '   '
      ' WHERE GI.IDCONTRATO = CL.IDCONTRATO'
      '   AND GI.IDIMOVEL   = IM.IDIMOVEL'
      '   AND GI.IDIMOVEL   = APMES.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APMES.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APALU.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APALU.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APENC.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APENC.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APFUN.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APFUN.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APLUV.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APLUV.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APPRO.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APPRO.IDCONTRATO(+)'
      '   AND GI.IDIMOVEL   = APDAT.IDIMOVEL(+)'
      '   AND GI.IDCONTRATO = APDAT.IDCONTRATO(+)'
      '        '
      '')
    ValidateWithMask = True
    Left = 340
    Top = 28
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 340
    Top = 16
  end
end
