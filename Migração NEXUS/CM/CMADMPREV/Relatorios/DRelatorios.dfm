object DtmRelatorios: TDtmRelatorios
  Left = 3
  Top = 27
  Width = 797
  Height = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = DtmRelatoriosCreate
  OnDestroy = DtmRelatoriosDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ppReportMovAnt: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
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
    AfterPrint = ppReportMovAntAfterPrint
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportMovAntBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 577
    Top = 391
    Version = '7.04'
    mmColumnWidth = 0
    object ppReportMovHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppReportMovLine1: TppLine
        UserName = 'ppReportMovLine1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 14288
        mmWidth = 281253
        BandType = 0
      end
      object ppReportMovLabel15: TppLabel
        UserName = 'ppReportMovLabel15'
        Caption = 'Extrato de Movimentação de Reservas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 101336
        mmTop = 7938
        mmWidth = 77258
        BandType = 0
      end
      object ppRpLblEmpresa: TppLabel
        UserName = 'ppRpLblEmpresa'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 130440
        mmTop = 1058
        mmWidth = 17992
        BandType = 0
      end
      object ppReportMovLabel19: TppLabel
        UserName = 'ppReportMovLabel19'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 224103
        mmTop = 9790
        mmWidth = 12435
        BandType = 0
      end
      object ppRpLblDataIni: TppLabel
        UserName = 'ppRpLblDataIni'
        Caption = 'ppRpLblDataIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 237596
        mmTop = 9790
        mmWidth = 23813
        BandType = 0
      end
      object ppReportMovLabel22: TppLabel
        UserName = 'ppReportMovLabel22'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 255323
        mmTop = 9790
        mmWidth = 2117
        BandType = 0
      end
      object ppRpLblDataFin: TppLabel
        UserName = 'ppRpLblDataFin'
        Caption = 'ppRpLblDataFin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 259028
        mmTop = 9790
        mmWidth = 24606
        BandType = 0
      end
    end
    object ppReportMovDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppReportMovFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppReportMovLabel2: TppLabel
        UserName = 'ppReportMovLabel2'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 42333
        BandType = 8
      end
      object ppReportMovLine2: TppLine
        UserName = 'ppReportMovLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1852
        mmTop = 265
        mmWidth = 279401
        BandType = 8
      end
      object ppReportMovCalc1: TppSystemVariable
        UserName = 'ReportMovCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 245798
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppReportMovCalc2: TppSystemVariable
        UserName = 'ReportMovCalc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 1588
        mmWidth = 20108
        BandType = 8
      end
    end
    object ppReportMovGroup1: TppGroup
      BreakName = 'ppReportMovDBText1'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'ReportMovGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppReportMovLabel4: TppLabel
          UserName = 'ppReportMovLabel4'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 529
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppReportMovDBText1: TppDBText
          UserName = 'ppReportMovDBText1'
          DataField = 'PESSJUR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 42069
          mmTop = 529
          mmWidth = 106892
          BandType = 3
          GroupNo = 0
        end
      end
      object ppReportMovGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppReportMovGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppReportMovDBCalc7: TppDBCalc
          UserName = 'ppReportMovDBCalc7'
          DataField = 'VLRCOTAS'
          DisplayFormat = '#0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppReportMovGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 143140
          mmTop = 794
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppReportMovLabel16: TppLabel
          UserName = 'ppReportMovLabel16'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 101865
          mmTop = 794
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object ppReportMovLine4: TppLine
          UserName = 'ppReportMovLine4'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 94192
          mmTop = 265
          mmWidth = 183357
          BandType = 5
          GroupNo = 0
        end
        object pplblSaldoTotalMoeda: TppLabel
          UserName = 'pplblSaldoTotalMoeda'
          Caption = 'pplblSaldoTotalMoeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 231775
          mmTop = 794
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppReportMovGroup4: TppGroup
      BreakName = 'IDESTAB'
      OutlineSettings.CreateNode = True
      UserName = 'ReportMovGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppReportMovLabel17: TppLabel
          UserName = 'ppReportMovLabel17'
          Caption = 'Regional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6085
          mmTop = 265
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppReportMovDBText13: TppDBText
          UserName = 'ppReportMovDBText13'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 42069
          mmTop = 265
          mmWidth = 106892
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReportMovGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReportMovGroup2: TppGroup
      BreakName = 'IDPLANOPREV'
      OutlineSettings.CreateNode = True
      UserName = 'ReportMovGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppReportMovLabel5: TppLabel
          UserName = 'ppReportMovLabel5'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 265
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object ppReportMovDBText2: TppDBText
          UserName = 'ppReportMovDBText2'
          DataField = 'PLANPREV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 42069
          mmTop = 265
          mmWidth = 106892
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReportMovGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReportMovGroup3: TppGroup
      BreakName = 'ppReportMovDBText3'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'ReportMovGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppReportMovGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppReportMovLabel6: TppLabel
          UserName = 'ppReportMovLabel6'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 794
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovDBText3: TppDBText
          UserName = 'ppReportMovDBText3'
          DataField = 'RESERVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 20902
          mmTop = 794
          mmWidth = 91017
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel8: TppLabel
          UserName = 'ppReportMovLabel8'
          Caption = 'Entrada   / Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 32015
          mmTop = 7673
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel3: TppLabel
          UserName = 'ppReportMovLabel3'
          AutoSize = False
          Caption = 'Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3970
          mmLeft = 46567
          mmTop = 8202
          mmWidth = 12172
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel9: TppLabel
          UserName = 'ppReportMovLabel9'
          AutoSize = False
          Caption = 'Movimentação [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 172509
          mmTop = 7408
          mmWidth = 23813
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel10: TppLabel
          UserName = 'ppReportMovLabel10'
          Caption = 'Movimentação [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 143934
          mmTop = 7408
          mmWidth = 24606
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel11: TppLabel
          UserName = 'ppReportMovLabel11'
          Caption = 'Saldo Anterior  [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4498
          mmLeft = 193940
          mmTop = 794
          mmWidth = 38629
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel12: TppLabel
          UserName = 'ppReportMovLabel12'
          AutoSize = False
          Caption = 'Saldo Anterior [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 4498
          mmLeft = 120386
          mmTop = 794
          mmWidth = 41010
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel13: TppLabel
          UserName = 'ppReportMovLabel13'
          Caption = 'Saldo  [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 123825
          mmTop = 7673
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel14: TppLabel
          UserName = 'ppReportMovLabel14'
          Caption = 'Saldo  [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 247915
          mmTop = 7673
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovLabel1: TppLabel
          UserName = 'ppReportMovLabel1'
          Caption = 'Valor da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 201877
          mmTop = 7408
          mmWidth = 15081
          BandType = 3
          GroupNo = 3
        end
        object ppReportMovLabel7: TppLabel
          UserName = 'ppReportMovLabel7'
          Caption = 'Data da Cota'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8467
          mmLeft = 219340
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppReportMovLabel18: TppLabel
          UserName = 'ppReportMovLabel18'
          AutoSize = False
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 7673
          mmWidth = 18256
          BandType = 3
          GroupNo = 3
        end
        object CotasAntReal: TppLabel
          UserName = 'CotasAntReal'
          Caption = 'CotasAntReal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 234421
          mmTop = 794
          mmWidth = 25135
          BandType = 3
          GroupNo = 3
        end
        object CotasAnt: TppLabel
          UserName = 'CotasAnt'
          Caption = 'CotasAnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 794
          mmWidth = 25135
          BandType = 3
          GroupNo = 3
        end
      end
      object ppReportMovGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1588
        mmPrintPosition = 0
        object ppReportMovLine3: TppLine
          UserName = 'ppReportMovLine3'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95250
          mmTop = 529
          mmWidth = 183357
          BandType = 5
          GroupNo = 3
        end
      end
    end
    object ppReportMovGroup5: TppGroup
      BreakName = 'ppReportMovDBText4'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'ReportMovGroup5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppReportMovGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppReportMovDBText4: TppDBText
          UserName = 'ppReportMovDBText4'
          DataField = 'DATAALIMENTACAO'
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 218811
          mmTop = 0
          mmWidth = 16669
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBText5: TppDBText
          UserName = 'ppReportMovDBText5'
          DataField = 'FLGENTRADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 32279
          mmTop = 0
          mmWidth = 13758
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBText6: TppDBText
          UserName = 'ppReportMovDBText6'
          DataField = 'CONTRIBUICAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 46831
          mmTop = 0
          mmWidth = 65881
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBCalc5: TppDBCalc
          UserName = 'ppReportMovDBCalc5'
          DataField = 'VLRCOTAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppReportMovGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 146050
          mmTop = 0
          mmWidth = 22754
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBCalc6: TppDBCalc
          UserName = 'ppReportMovDBCalc6'
          DataField = 'SALDOCOTAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppReportMovGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 115359
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBCalc9: TppDBCalc
          UserName = 'ppReportMovDBCalc9'
          DataField = 'VLRREAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppReportMovGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBCalc10: TppDBCalc
          UserName = 'ppReportMovDBCalc10'
          DataField = 'SALDOREAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppReportMovGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 241036
          mmTop = 0
          mmWidth = 21167
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBText7: TppDBText
          UserName = 'ppReportMovDBText7'
          DataField = 'VALORINDICE'
          DisplayFormat = '#,0.0000;-#,0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 201877
          mmTop = 0
          mmWidth = 15875
          BandType = 5
          GroupNo = 4
        end
        object ppReportMovDBText8: TppDBText
          UserName = 'ppReportMovDBText8'
          DataField = 'MESREFERENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 6350
          mmTop = 0
          mmWidth = 16933
          BandType = 5
          GroupNo = 4
        end
      end
    end
  end
  object qryMovAnt: TwwQuery
    OnCalcFields = qryMovAntCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTR' +
        'IBUICAO,H.IDBENEFICIO,H.IDTIPORESERVA,'
      
        '       H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL ,H.VLRC' +
        'OTAS   ,H.SALDOREAL  ,H.SALDOCOTAS     ,'
      
        '       BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLA' +
        'NPREV.NOME PLANPREV,'
      
        '       PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.' +
        'NOME CONTRIBUICAO , EVENTOGERADOR.NOME EVENTO,'
      '       DECODE(FLGENTRADA,0,H.VLRREAL) VLRREALSAIDA,'
      '       DECODE(FLGENTRADA,1,H.VLRREAL) VLRREALENT,'
      '       DECODE(FLGENTRADA,0,H.VLRCOTAS) COTASSAIDA,'
      '       DECODE(FLGENTRADA,1,H.VLRCOTAS) COTASENT ,'
      
        '       DECODE(FLGENTRADA,0,(H.SALDOREAL) + H.VLRREAL,1,H.SALDORE' +
        'AL - VLRREAL) AS VLRREALANT,'
      
        '       DECODE(FLGENTRADA,0,((H.SALDOCOTAS) + H.VLRCOTAS)  ,1,  (' +
        'H.SALDOCOTAS - VLRCOTAS) ) AS VLRCOTASANT ,'
      
        '       DECODE(FLGENTRADA,1,'#39'Entrada'#39',0,'#39'Saída'#39') FLGENTRADA, FLGE' +
        'NTRADA ENTRADA  ,'
      
        '       PARTPREVPLAN.INSCRICAONUMERO , ELEGPATRO.MATRICULA , INDI' +
        'CEREAJUSTE, H.SEQPROPOSTA, H.VALORINDICE,'
      
        '       H.MESREFERENCIA, H.DATAALIMENTACAO, ELEGPATRO.IDESTAB, RE' +
        'G.NOME'
      '       FROM  PLANPREV, BENEFICIO, CONTRIBUICAO, EVENTOGERADOR,'
      
        '       RESERVAXPLANO , PARTPREVPLAN , ELEGPATRO, PESSOA , PESSOA' +
        ' PESSJUR ,'
      '       HISTMOVRESERVA H, PESSOA REG'
      '       WHERE (PESSOA.IDPESSOA =  H.IDPESSOA)'
      '       AND (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA)'
      '       AND (ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA)'
      '       AND (PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA)'
      '       AND (PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV)'
      '       AND (H.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA)'
      '       AND (PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR)'
      '       AND (PESSJUR.IDPESSOA = H.IDPESSJUR)'
      '       AND (PLANPREV.IDPLANOPREV = H.IDPLANOPREV)'
      '       AND (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV )'
      '       AND (RESERVAXPLANO.IDTIPORESERVA = H.IDTIPORESERVA )'
      
        '       AND (EVENTOGERADOR.IDEVENTOGERADOR(+) = H.IDEVENTOGERADOR' +
        ' )'
      '       AND (CONTRIBUICAO.IDCONTRIBUICAO(+) = H.IDCONTRIBUICAO )'
      '       AND (BENEFICIO.IDBENEFICIO(+) = H.IDBENEFICIO)'
      '       AND (ELEGPATRO.IDESTAB = REG.IDPESSOA(+))'
      
        '       ORDER BY IDESTAB,PESSJUR, PLANPREV, RESERVA, H.IDHISTRESE' +
        'RVA')
    ValidateWithMask = True
    Left = 201
    Top = 10
    object qryMovAntIDHISTRESERVA: TFloatField
      FieldName = 'IDHISTRESERVA'
    end
    object qryMovAntIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object qryMovAntIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMovAntIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryMovAntIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryMovAntIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object qryMovAntIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMovAntIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovAntDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryMovAntVLRREAL: TFloatField
      FieldName = 'VLRREAL'
    end
    object qryMovAntVLRCOTAS: TFloatField
      FieldName = 'VLRCOTAS'
    end
    object qryMovAntSALDOREAL: TFloatField
      FieldName = 'SALDOREAL'
    end
    object qryMovAntSALDOCOTAS: TFloatField
      FieldName = 'SALDOCOTAS'
    end
    object qryMovAntBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryMovAntRESERVA: TStringField
      FieldName = 'RESERVA'
      Size = 50
    end
    object qryMovAntPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryMovAntPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 60
    end
    object qryMovAntPESSJUR: TStringField
      FieldName = 'PESSJUR'
      Size = 60
    end
    object qryMovAntCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryMovAntEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 60
    end
    object qryMovAntVLRREALSAIDA: TFloatField
      FieldName = 'VLRREALSAIDA'
    end
    object qryMovAntVLRREALENT: TFloatField
      FieldName = 'VLRREALENT'
    end
    object qryMovAntCOTASSAIDA: TFloatField
      FieldName = 'COTASSAIDA'
    end
    object qryMovAntCOTASENT: TFloatField
      FieldName = 'COTASENT'
    end
    object qryMovAntVLRREALANT: TFloatField
      FieldName = 'VLRREALANT'
    end
    object qryMovAntVLRCOTASANT: TFloatField
      FieldName = 'VLRCOTASANT'
    end
    object qryMovAntFLGENTRADA: TStringField
      FieldName = 'FLGENTRADA'
      Size = 7
    end
    object qryMovAntENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object qryMovAntINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryMovAntMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryMovAntINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object qryMovAntSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryMovAntVALORINDICE: TFloatField
      FieldName = 'VALORINDICE'
    end
    object qryMovAntMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryMovAntDATAALIMENTACAO: TDateTimeField
      FieldName = 'DATAALIMENTACAO'
    end
    object qryMovAntIDESTAB: TFloatField
      FieldName = 'IDESTAB'
    end
    object qryMovAntNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsMov: TwwDataSource
    AutoEdit = False
    DataSet = qryMov
    Left = 289
    Top = 8
  end
  object ppBDEPipelineMovPart: TppBDEPipeline
    DataSource = dsMovPart
    UserName = 'BDEPipelineMovPart'
    OnNext = ppBDEPipelineMovPartNext
    Left = 126
    Top = 88
  end
  object ppReportMovPart: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineMovPart
    OnEndPage = ppReportMovPartEndPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
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
    AfterPrint = ppReportMovPartAfterPrint
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportMovPartBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 157
    Top = 63
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineMovPart'
    object ppHeaderBand1: TppHeaderBand
      AfterPrint = ppHeaderBand1AfterPrint
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'ppLine1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 13758
        mmWidth = 281253
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Extrato de Movimentação de Reservas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 101336
        mmTop = 7938
        mmWidth = 77523
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 130704
        mmTop = 794
        mmWidth = 17992
        BandType = 0
      end
      object ppReportMovPartLabel4: TppLabel
        UserName = 'ppReportMovPartLabel4'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 9525
        mmWidth = 12965
        BandType = 0
      end
      object pplblMovReservaPeriodo: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 227013
        mmTop = 9525
        mmWidth = 54769
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'FLGENTRADA'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object ppValorCotas: TppDBText
        OnPrint = ppValorCotasPrint
        UserName = 'ValorCotas'
        DataField = 'VLRCOTASCALC'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText5: TppDBText
        OnPrint = ppDBText5Print
        UserName = 'ppDBText5'
        DataField = 'VLRREALCALC'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 198702
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object ppReportMovPartDBText7: TppDBText
        UserName = 'ppReportMovPartDBText7'
        DataField = 'SALDOREAL'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 226748
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppReportMovPartDBText17: TppDBText
        UserName = 'ppReportMovPartDBText17'
        DataField = 'VALORINDICE'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 265
        mmWidth = 19050
        BandType = 4
      end
      object ppReportMovPartDBText19: TppDBText
        UserName = 'ppReportMovPartDBText19'
        DataField = 'DATAALIMENTACAO'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppReportMovPartDBText8: TppDBText
        UserName = 'ppReportMovPartDBText8'
        DataField = 'GERADOR'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 265
        mmWidth = 64029
        BandType = 4
      end
      object ppDBText104: TppDBText
        OnPrint = ppDBText5Print
        UserName = 'DBText104'
        DataField = 'VLRSDREALHOJE'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 248973
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppSaldoCotas: TppDBText
        OnPrint = ppValorCotasPrint
        UserName = 'SaldoCotas'
        DataField = 'SALDOCOTAS'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 42333
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1852
        mmTop = 265
        mmWidth = 279401
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 1323
        mmWidth = 12965
        BandType = 8
      end
    end
    object ppReportMovPartGroup1: TppGroup
      BreakName = 'ppReportMovPartDBText1'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'ReportMovPartGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppReportMovPartGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppReportMovPartGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText11'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ppDBText10'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          ParentHeight = True
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 16404
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 116417
          mmTop = 6615
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object ppDBText10: TppDBText
          UserName = 'ppDBText10'
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 150019
          mmTop = 6615
          mmWidth = 89694
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'ppLabel6'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 6615
          mmWidth = 21696
          BandType = 3
          GroupNo = 2
        end
        object ppDBText11: TppDBText
          UserName = 'ppDBText11'
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 6615
          mmWidth = 78581
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartLabel8: TppLabel
          UserName = 'ppReportMovPartLabel8'
          Caption = 'Regional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 11377
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartDBText18: TppDBText
          UserName = 'ppReportMovPartDBText18'
          DataField = 'NOME'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 11377
          mmWidth = 78581
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartLabel1: TppLabel
          UserName = 'ppReportMovPartLabel1'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 116417
          mmTop = 2117
          mmWidth = 18521
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartDBText1: TppDBText
          UserName = 'ppReportMovPartDBText1'
          DataField = 'PESSOA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 149754
          mmTop = 2117
          mmWidth = 89959
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartLabel2: TppLabel
          UserName = 'ppReportMovPartLabel2'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartDBText2: TppDBText
          UserName = 'ppReportMovPartDBText2'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3704
          mmLeft = 24077
          mmTop = 2117
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartLabel3: TppLabel
          UserName = 'ppReportMovPartLabel3'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 48154
          mmTop = 2117
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppReportMovPartDBText3: TppDBText
          UserName = 'ppReportMovPartDBText3'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 64294
          mmTop = 2117
          mmWidth = 31485
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'MODOATUALIZA'
      DataPipeline = ppBDEPipelineMovPart
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineMovPart'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 5821
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 3
        end
        object ppDBText85: TppDBText
          UserName = 'DBText85'
          AutoSize = True
          DataField = 'MODOATUALIZA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 1058
          mmWidth = 26194
          BandType = 3
          GroupNo = 3
        end
        object ppLabel145: TppLabel
          UserName = 'Label2'
          Caption = 'Tipo de Atualização '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 1058
          mmWidth = 30956
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup28: TppGroup
      BreakName = 'ppDBText12'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group28'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand28: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23019
        mmPrintPosition = 0
        object ppLabel7: TppLabel
          UserName = 'ppLabel7'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 529
          mmWidth = 11642
          BandType = 3
          GroupNo = 4
        end
        object ppDBText12: TppDBText
          UserName = 'ppDBText12'
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 19579
          mmTop = 529
          mmWidth = 91017
          BandType = 3
          GroupNo = 4
        end
        object ppLabel8: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 11377
          mmWidth = 14023
          BandType = 3
          GroupNo = 4
        end
        object ppLabel9: TppLabel
          UserName = 'ppLabel9'
          Caption = 'Entrada   / Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 6615
          mmLeft = 20638
          mmTop = 11377
          mmWidth = 11906
          BandType = 3
          GroupNo = 4
        end
        object cotasantPart: TppDBText
          UserName = 'cotasantPart'
          DataField = 'VLRCOTASANT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 148961
          mmTop = 2381
          mmWidth = 21696
          BandType = 3
          GroupNo = 4
        end
        object ppReportMovPartDBText11: TppDBText
          UserName = 'ppReportMovPartDBText11'
          DataField = 'MOESIGLA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 130969
          mmTop = 2381
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object ppReportMovPartDBText12: TppDBText
          UserName = 'ppReportMovPartDBText12'
          DataField = 'SIGLAEMP'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 215636
          mmTop = 2381
          mmWidth = 15346
          BandType = 3
          GroupNo = 4
        end
        object cotasantrealPart: TppDBText
          UserName = 'cotasantrealPart'
          DataField = 'VLRREALANT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 231511
          mmTop = 2381
          mmWidth = 23813
          BandType = 3
          GroupNo = 4
        end
        object ppLabel11: TppLabel
          UserName = 'ppLabel11'
          AutoSize = False
          Caption = 'Movimentação [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 201084
          mmTop = 11377
          mmWidth = 23813
          BandType = 3
          GroupNo = 4
        end
        object ppLabel16: TppLabel
          UserName = 'ppLabel16'
          Caption = 'Saldo  [Moeda] na data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 9790
          mmLeft = 234421
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 4
        end
        object ppDBText86: TppDBText
          UserName = 'DBText86'
          DataField = 'NOMETIPOINDICE'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 108744
          mmTop = 15610
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object ppDBText87: TppDBText
          UserName = 'DBText87'
          DataField = 'NOMETIPOINDICE'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 132292
          mmTop = 15610
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object ppDBText102: TppDBText
          UserName = 'DBText102'
          DataField = 'NOMETIPOINDICE'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 158221
          mmTop = 15346
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object ppDBText103: TppDBText
          UserName = 'DBText103'
          DataField = 'NOMETIPOINDICE'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3175
          mmLeft = 179123
          mmTop = 15610
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Movimentação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3175
          mmLeft = 107686
          mmTop = 11906
          mmWidth = 19315
          BandType = 3
          GroupNo = 4
        end
        object ppLabel14: TppLabel
          UserName = 'ppLabel14'
          Caption = 'Saldo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3175
          mmLeft = 114565
          mmTop = 2646
          mmWidth = 16140
          BandType = 3
          GroupNo = 4
        end
        object ppReportMovPartLabel5: TppLabel
          UserName = 'ppReportMovPartLabel5'
          Caption = 'Valor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 11906
          mmWidth = 7673
          BandType = 3
          GroupNo = 4
        end
        object ppLabel15: TppLabel
          UserName = 'ppLabel15'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 162984
          mmTop = 11906
          mmWidth = 7408
          BandType = 3
          GroupNo = 4
        end
        object ppReportMovPartLabel9: TppLabel
          UserName = 'ppReportMovPartLabel9'
          Caption = 'Data '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 184415
          mmTop = 11642
          mmWidth = 6615
          BandType = 3
          GroupNo = 4
        end
        object ppReportMovPartLabel6: TppLabel
          UserName = 'ppReportMovPartLabel6'
          Caption = 'Saldo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 199232
          mmTop = 2646
          mmWidth = 16140
          BandType = 3
          GroupNo = 4
        end
        object lblSaldoHoje: TppLabel
          UserName = 'lblSaldoHoje'
          Caption = 'Movimento  [Moeda] Hoje'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 9790
          mmLeft = 255588
          mmTop = 11113
          mmWidth = 14817
          BandType = 3
          GroupNo = 4
        end
        object ppLabel10: TppLabel
          UserName = 'ppLabel10'
          AutoSize = False
          Caption = 'Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 35983
          mmTop = 11377
          mmWidth = 14288
          BandType = 3
          GroupNo = 4
        end
      end
      object ppGroupFooterBand28: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
        object ppReportMovPartLine1: TppLine
          UserName = 'ppReportMovPartLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 113506
          mmTop = 264
          mmWidth = 168540
          BandType = 5
          GroupNo = 4
        end
      end
    end
  end
  object qryMovPartAnt: TwwQuery
    AutoCalcFields = False
    BeforeOpen = qryMovPartAntBeforeOpen
    AfterScroll = qryMovPartAntAfterScroll
    OnCalcFields = qryMovPartAntCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' H.IDHISTRESERVA,H.IDEVENTOGERADOR,H.IDPLANOPREV,H.IDCONTRIBUICA' +
        'O,H.IDBENEFICIO,H.IDTIPORESERVA, '
      
        ' H.IDPESSJUR ,H.IDPESSOA   ,H.DATAMOV   ,H.VLRREAL , H.SALDOREAL' +
        ', VLRCOTAS  ,H.SALDOCOTAS,H.VALORINDICE, '
      ' DECODE(FLGENTRADA,0,H.VLRREAL) VLRREALSAIDA, '
      ' DECODE(FLGENTRADA,1,H.VLRREAL) VLRREALENT, '
      ' DECODE(FLGENTRADA,0,H.VLRCOTAS) COTASSAIDA, '
      ' DECODE(FLGENTRADA,1,H.VLRCOTAS) COTASENT, '
      
        ' DECODE(FLGENTRADA,0,(H.SALDOREAL) + H.VLRREAL,1,H.SALDOREAL - V' +
        'LRREAL) AS VLRREALANT, '
      
        ' DECODE(FLGENTRADA,0,((H.SALDOCOTAS) + H.VLRCOTAS)  ,1,  (H.SALD' +
        'OCOTAS - VLRCOTAS) ) AS VLRCOTASANT,'
      
        ' BENEFICIO.NOME BENEFICIO, RESERVAXPLANO.NOME RESERVA, PLANPREV.' +
        'NOME PLANPREV,'
      
        ' PESSOA.NOME PESSOA , PESSJUR.NOME PESSJUR , CONTRIBUICAO.NOME C' +
        'ONTRIBUICAO , EVENTOGERADOR.NOME EVENTO,'
      
        ' DECODE(FLGENTRADA,1,'#39'Entrada'#39',0,'#39'Saída'#39') FLGENTRADA, FLGENTRADA' +
        ' ENTRADA,'
      
        ' PARTPREVPLAN.INSCRICAONUMERO, ELEGPATRO.MATRICULA   , INDICEREA' +
        'JUSTE,'
      ' MOEDA.MOESIGLA, MOEDAEMP.MOESIGLA SIGLAEMP, H.SEQPROPOSTA,'
      ' H.FLGPROCEDENCIA,'
      
        ' H.MESREFERENCIA, H.DATAALIMENTACAO , ELEGPATRO.IDESTAB , REG.NO' +
        'ME'
      ''
      
        'FROM HISTMOVRESERVA H, EVENTOGERADOR, PLANPREV, PESSOA , PESSOA ' +
        'PESSJUR , PESSOA REG,'
      
        ' RESERVAXPLANO, CONTRIBUICAO, BENEFICIO, ELEGPATRO, PARTPREVPLAN' +
        ','
      'MOEDA, MOEDA MOEDAEMP'
      'WHERE'
      'PESSOA.IDPESSOA =  H.IDPESSOA'
      'AND ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      ' AND ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA'
      'AND PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'AND RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO'
      ' AND PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      ' AND PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'AND PESSJUR.IDPESSOA = H.IDPESSJUR'
      'AND MOEDAEMP.MOECODIGO = 3'
      'AND PLANPREV.IDPLANOPREV = H.IDPLANOPREV'
      'AND RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      ' AND RESERVAXPLANO.IDTIPORESERVA = H.IDTIPORESERVA'
      'AND EVENTOGERADOR.IDEVENTOGERADOR(+) = H.IDEVENTOGERADOR'
      'AND CONTRIBUICAO.IDCONTRIBUICAO(+) = H.IDCONTRIBUICAO'
      'AND BENEFICIO.IDBENEFICIO(+) = H.IDBENEFICIO'
      'AND ELEGPATRO.IDESTAB = REG.IDPESSOA(+)'
      
        'ORDER BY IDESTAB,PESSOA ,PESSJUR, PLANPREV, RESERVA,H.IDHISTRESE' +
        'RVA')
    ValidateWithMask = True
    Left = 329
    Top = 65
    object qryMovPartAntIDHISTRESERVA: TFloatField
      FieldName = 'IDHISTRESERVA'
    end
    object qryMovPartAntIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object qryMovPartAntIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMovPartAntIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryMovPartAntIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryMovPartAntIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object qryMovPartAntIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMovPartAntIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovPartAntDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
      DisplayFormat = '##/##/####'
    end
    object qryMovPartAntVLRREAL: TFloatField
      FieldName = 'VLRREAL'
    end
    object qryMovPartAntSALDOREAL: TFloatField
      FieldName = 'SALDOREAL'
    end
    object qryMovPartAntVLRCOTAS: TFloatField
      FieldName = 'VLRCOTAS'
    end
    object qryMovPartAntSALDOCOTAS: TFloatField
      FieldName = 'SALDOCOTAS'
    end
    object qryMovPartAntBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryMovPartAntRESERVA: TStringField
      FieldName = 'RESERVA'
      Size = 50
    end
    object qryMovPartAntPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryMovPartAntPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 60
    end
    object qryMovPartAntPESSJUR: TStringField
      FieldName = 'PESSJUR'
      Size = 60
    end
    object qryMovPartAntCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryMovPartAntEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 60
    end
    object qryMovPartAntFLGENTRADA: TStringField
      FieldName = 'FLGENTRADA'
      Size = 7
    end
    object qryMovPartAntINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryMovPartAntMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryMovPartAntGERADOR: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'GERADOR'
      Size = 50
      Calculated = True
    end
    object qryMovPartAntENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object qryMovPartAntINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object qryMovPartAntVLRREALSAIDA: TFloatField
      FieldName = 'VLRREALSAIDA'
    end
    object qryMovPartAntVLRREALENT: TFloatField
      FieldName = 'VLRREALENT'
    end
    object qryMovPartAntCOTASSAIDA: TFloatField
      FieldName = 'COTASSAIDA'
    end
    object qryMovPartAntCOTASENT: TFloatField
      FieldName = 'COTASENT'
    end
    object qryMovPartAntVLRREALANT: TFloatField
      FieldName = 'VLRREALANT'
    end
    object qryMovPartAntVLRCOTASANT: TFloatField
      FieldName = 'VLRCOTASANT'
    end
    object qryMovPartAntVLRREALCALC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRREALCALC'
      Calculated = True
    end
    object qryMovPartAntVLRCOTASCALC: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRCOTASCALC'
      Calculated = True
    end
    object qryMovPartAntMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryMovPartAntSIGLAEMP: TStringField
      FieldName = 'SIGLAEMP'
      Size = 10
    end
    object qryMovPartAntSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryMovPartAntVALORINDICE: TFloatField
      FieldName = 'VALORINDICE'
    end
    object qryMovPartAntMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryMovPartAntDATAALIMENTACAO: TDateTimeField
      FieldName = 'DATAALIMENTACAO'
    end
    object qryMovPartAntIDESTAB: TFloatField
      FieldName = 'IDESTAB'
    end
    object qryMovPartAntNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryMovPartAntFLGPROCEDENCIA: TFloatField
      FieldName = 'FLGPROCEDENCIA'
    end
  end
  object dsMovPart: TwwDataSource
    AutoEdit = False
    DataSet = qryMovPart
    OnDataChange = dsMovPartDataChange
    Left = 488
    Top = 73
  end
  object qryinconsis: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select 1 from dual')
    ValidateWithMask = True
    Left = 516
    Top = 10
  end
  object ppBDEPipelineInconsis: TppBDEPipeline
    DataSource = dsinconsis
    UserName = 'BDEPipelineInconsis'
    Left = 33
    Top = 139
  end
  object dsinconsis: TwwDataSource
    AutoEdit = False
    DataSet = qryinconsis
    Left = 393
    Top = 5
  end
  object ppRpInconsis: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineInconsis
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppRpInconsisBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 129
    Top = 198
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineInconsis'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Reservas com Movimentações Inconsistentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 52388
        mmTop = 7408
        mmWidth = 92340
        BandType = 0
      end
      object ppLabelemp: TppLabel
        UserName = 'ppLabelemp'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 89694
        mmTop = 1323
        mmWidth = 17992
        BandType = 0
      end
      object ppRpInconsisLine1: TppLine
        UserName = 'ppRpInconsisLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1323
        mmTop = 14023
        mmWidth = 191823
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 42333
        BandType = 8
      end
      object ppRpInconsisLine2: TppLine
        UserName = 'ppRpInconsisLine2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1058
        mmTop = 529
        mmWidth = 191823
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 197380
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 92075
        mmTop = 1323
        mmWidth = 12965
        BandType = 8
      end
      object ppRpInconsisCalc1: TppSystemVariable
        UserName = 'RpInconsisCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'ppDBText14'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'ppDBText14'
          DataField = 'PESSOA'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 25135
          mmTop = 529
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'ppLabel27'
          Caption = 'Matrícula:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 56356
          mmTop = 5821
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'ppLabel28'
          Caption = 'Inscrição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 5821
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'ppDBText15'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 72231
          mmTop = 5821
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'ppDBText16'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 20902
          mmTop = 5821
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'ppLabel29'
          Caption = 'Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 124619
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppRpLblDatainconsisIni: TppLabel
          UserName = 'ppRpLblDatainconsisIni'
          Caption = 'ppRpLblDatainconsisIni'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 138113
          mmTop = 529
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppRpLblDatainconsisfim: TppLabel
          UserName = 'ppRpLblDatainconsisfim'
          Caption = 'ppRpLblDatainconsisfim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 159544
          mmTop = 529
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'ppLabel32'
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 155840
          mmTop = 529
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppRpInconsisLine3: TppLine
          UserName = 'ppRpInconsisLine3'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 1323
          mmTop = 12171
          mmWidth = 191823
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'ppDBText17'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel34: TppLabel
          UserName = 'ppLabel34'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 13494
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 36777
          mmTop = 529
          mmWidth = 106892
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'ppDBText18'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel35: TppLabel
          UserName = 'ppLabel35'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 13494
          mmTop = 265
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppDBText18: TppDBText
          UserName = 'ppDBText18'
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 47361
          mmTop = 265
          mmWidth = 91017
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppRpInconsisGroup2: TppGroup
      BreakName = 'RESERVA'
      DataPipeline = ppBDEPipelineInconsis
      OutlineSettings.CreateNode = True
      UserName = 'RpInconsisGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineInconsis'
      object ppRpInconsisGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppRpInconsisLabel1: TppLabel
          UserName = 'ppRpInconsisLabel1'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 23019
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 3
        end
        object ppRpInconsisDBText1: TppDBText
          UserName = 'ppRpInconsisDBText1'
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineInconsis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsis'
          mmHeight = 3969
          mmLeft = 38100
          mmTop = 1058
          mmWidth = 91017
          BandType = 3
          GroupNo = 3
        end
      end
      object ppRpInconsisGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryinconsiscol: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select 1 from dual'
      '')
    ValidateWithMask = True
    Left = 444
    Top = 6
  end
  object ppBDEPipelineInconsisCol: TppBDEPipeline
    DataSource = dsinconsiscol
    UserName = 'BDEPipelineInconsisCol'
    Left = 30
    Top = 194
  end
  object dsinconsiscol: TwwDataSource
    AutoEdit = False
    DataSet = qryinconsiscol
    Left = 247
    Top = 194
  end
  object ppRptCol: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineInconsisCol
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 129
    Top = 146
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineInconsisCol'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Reservas com Movimentações Inconsistentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 52388
        mmTop = 7408
        mmWidth = 92340
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 89694
        mmTop = 1323
        mmWidth = 17992
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1323
        mmTop = 14023
        mmWidth = 191823
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 42333
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 1058
        mmTop = 529
        mmWidth = 191823
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 197380
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 88636
        mmTop = 1323
        mmWidth = 20108
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'ppDBText8'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel37: TppLabel
          UserName = 'ppLabel37'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 10054
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineInconsisCol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsisCol'
          mmHeight = 3969
          mmLeft = 33338
          mmTop = 529
          mmWidth = 106892
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'ppLabel30'
          Caption = 'Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 141023
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'ppLabel31'
          Caption = 'ppLabel31'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 154517
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'ppLabel33'
          Caption = 'ppLabel33'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 175948
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object ppLabel36: TppLabel
          UserName = 'ppLabel36'
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 172244
          mmTop = 529
          mmWidth = 2117
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'ppDBText9'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 10054
          mmTop = 265
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'ppDBText9'
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineInconsisCol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsisCol'
          mmHeight = 3969
          mmLeft = 43921
          mmTop = 265
          mmWidth = 91017
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'RESERVA'
      DataPipeline = ppBDEPipelineInconsisCol
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineInconsisCol'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 19579
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 3
        end
        object ppDBText13: TppDBText
          UserName = 'ppDBText13'
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineInconsisCol
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineInconsisCol'
          mmHeight = 3969
          mmLeft = 34660
          mmTop = 1058
          mmWidth = 91017
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppReportPartInconsis: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineMovPart
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportPartInconsisBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 241
    Top = 73
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineMovPart'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 14288
        mmWidth = 281253
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'Extrato de Movimentação de Reservas Inconsistentes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 88106
        mmTop = 7938
        mmWidth = 107950
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 130704
        mmTop = 794
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'DATAMOV'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'FLGENTRADA'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText7: TppDBText
        OnPrint = ppDBText7Print
        UserName = 'ppDBText7'
        DataField = 'VLRCOTASCALC'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText19: TppDBText
        OnPrint = ppDBText19Print
        UserName = 'ppDBText19'
        DataField = 'VLRREALCALC'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 529
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        AutoSize = False
        Caption = 'ppLabel23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 205317
        mmTop = 3175
        mmWidth = 92075
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'ppLabel24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 285221
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
        Caption = 'ppLabel40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 292630
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        Caption = 'ppLabel41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 286015
        mmTop = 2646
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'ppLabel42'
        Caption = 'ppLabel42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 288661
        mmTop = 1323
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'SALDOCOTAS'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'SALDOREAL'
        DataPipeline = ppBDEPipelineMovPart
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 237332
        mmTop = 529
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'GERADOR'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 529
        mmWidth = 97102
        BandType = 4
      end
      object ppReportPartInconsisDBText7: TppDBText
        UserName = 'ppReportPartInconsisDBText7'
        DataField = 'VALORINDICE'
        DataPipeline = ppBDEPipelineMovPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineMovPart'
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'ppLabel43'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 42333
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'ppLine7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1852
        mmTop = 265
        mmWidth = 279401
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 1323
        mmWidth = 12965
        BandType = 8
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PESSOA'
      DataPipeline = ppBDEPipelineMovPart
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineMovPart'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText23: TppDBText
          UserName = 'ppDBText23'
          DataField = 'PESSOA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 25135
          mmTop = 529
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'ppLabel44'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'ppLabel45'
          Caption = 'Matrícula:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 125148
          mmTop = 529
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'ppLabel46'
          Caption = 'Inscrição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 175155
          mmTop = 529
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'ppDBText24'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 141023
          mmTop = 529
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'ppDBText25'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 191294
          mmTop = 529
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'ppLabel47'
          Caption = 'Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 224103
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppRpLblDataPartIncIni: TppLabel
          UserName = 'ppRpLblDataPartIncIni'
          Caption = 'ppRpLblDataPartIncIni'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 237596
          mmTop = 529
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppRpLblDataPartInFim: TppLabel
          UserName = 'ppRpLblDataPartInFim'
          Caption = 'ppRpLblDataPartInFim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 259028
          mmTop = 529
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'ppLabel50'
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 255323
          mmTop = 529
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'ppDBText26'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel51: TppLabel
          UserName = 'ppLabel51'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'ppDBText26'
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 28310
          mmTop = 529
          mmWidth = 106892
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'ppDBText27'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel52: TppLabel
          UserName = 'ppLabel52'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object ppDBText27: TppDBText
          UserName = 'ppDBText27'
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 38894
          mmTop = 529
          mmWidth = 91017
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'ppDBText28'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppLabel53: TppLabel
          UserName = 'ppLabel53'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppDBText28: TppDBText
          UserName = 'ppDBText28'
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 20108
          mmTop = 265
          mmWidth = 91017
          BandType = 3
          GroupNo = 2
        end
        object ppLabel54: TppLabel
          UserName = 'ppLabel54'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3970
          mmLeft = 529
          mmTop = 8202
          mmWidth = 6878
          BandType = 3
          GroupNo = 2
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'Entrada   / Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 20108
          mmTop = 8202
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel56'
          AutoSize = False
          Caption = 'Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 35454
          mmTop = 8202
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          AutoSize = False
          Caption = 'Movimentação [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 209021
          mmTop = 7938
          mmWidth = 23813
          BandType = 3
          GroupNo = 2
        end
        object ppLabel58: TppLabel
          UserName = 'ppLabel58'
          Caption = 'Movimentação [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 144727
          mmTop = 7938
          mmWidth = 24606
          BandType = 3
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'ppLabel59'
          Caption = 'Saldo  [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 191294
          mmTop = 7938
          mmWidth = 10848
          BandType = 3
          GroupNo = 3
        end
        object ppLabel60: TppLabel
          UserName = 'ppLabel60'
          Caption = 'Saldo  [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 252678
          mmTop = 7938
          mmWidth = 12171
          BandType = 3
          GroupNo = 3
        end
        object ppDBText29: TppDBText
          UserName = 'ppDBText29'
          DataField = 'VLRREALANT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 233892
          mmTop = 265
          mmWidth = 30692
          BandType = 3
          GroupNo = 3
        end
        object ppLabel62: TppLabel
          UserName = 'ppLabel62'
          Caption = 'Saldo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3969
          mmLeft = 117740
          mmTop = 265
          mmWidth = 21696
          BandType = 3
          GroupNo = 3
        end
        object ppDBText30: TppDBText
          UserName = 'ppDBText30'
          DataField = 'VLRCOTASANT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 165100
          mmTop = 265
          mmWidth = 29898
          BandType = 3
          GroupNo = 3
        end
        object ppReportPartInconsisDBText1: TppDBText
          UserName = 'ppReportPartInconsisDBText1'
          DataField = 'MOESIGLA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 147638
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
        object ppReportPartInconsisDBText2: TppDBText
          UserName = 'ppReportPartInconsisDBText2'
          DataField = 'SIGLAEMP'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 216430
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
        object ppReportPartInconsisLabel1: TppLabel
          UserName = 'ppReportPartInconsisLabel1'
          Caption = 'Valor da [Cota]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 11906
          mmLeft = 127794
          mmTop = 7673
          mmWidth = 14817
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand13BeforePrint
        mmBottomOffset = 0
        mmHeight = 21960
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'COTASSAIDA'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.000000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 178330
          mmTop = 16933
          mmWidth = 33602
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          AutoSize = True
          DataField = 'VLRREALSAIDA'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 218017
          mmTop = 15081
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
        object ppLine8: TppLine
          UserName = 'ppLine8'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 94192
          mmTop = 794
          mmWidth = 188648
          BandType = 5
          GroupNo = 2
        end
        object ppLabel64: TppLabel
          UserName = 'ppLabel64'
          Caption = 'Movimento Líquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 98425
          mmTop = 9260
          mmWidth = 33338
          BandType = 5
          GroupNo = 2
        end
        object ppLabel65: TppLabel
          UserName = 'ppLabel65'
          Caption = 'Saldo Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 98425
          mmTop = 1588
          mmWidth = 20373
          BandType = 5
          GroupNo = 3
        end
        object ppDBText31: TppDBText
          UserName = 'ppDBText31'
          DataField = 'SALDOCOTAS'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.000000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 165100
          mmTop = 1588
          mmWidth = 33602
          BandType = 5
          GroupNo = 3
        end
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
          DataField = 'SALDOREAL'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 233892
          mmTop = 1588
          mmWidth = 30956
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          DataField = 'COTASENT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.000000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 165629
          mmTop = 15081
          mmWidth = 33867
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          DataField = 'VLRREALENT'
          DataPipeline = ppBDEPipelineMovPart
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          Transparent = True
          Visible = False
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 230717
          mmTop = 17198
          mmWidth = 32015
          BandType = 5
          GroupNo = 3
        end
        object ppLabel70: TppLabel
          UserName = 'ppLabel70'
          Caption = 'ppReportMovPartLabel12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 165100
          mmTop = 9260
          mmWidth = 33602
          BandType = 5
          GroupNo = 3
        end
        object ppLabel71: TppLabel
          UserName = 'ppLabel71'
          Caption = 'ppReportMovPartLabel13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 233892
          mmTop = 9260
          mmWidth = 30956
          BandType = 5
          GroupNo = 3
        end
        object ppReportPartInconsisDBText4: TppDBText
          UserName = 'ppReportPartInconsisDBText4'
          DataField = 'MOESIGLA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 147638
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppReportPartInconsisDBText3: TppDBText
          UserName = 'ppReportPartInconsisDBText3'
          DataField = 'MOESIGLA'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 147638
          mmTop = 9260
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppReportPartInconsisDBText6: TppDBText
          UserName = 'ppReportPartInconsisDBText6'
          DataField = 'SIGLAEMP'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 216430
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
        object ppReportPartInconsisDBText5: TppDBText
          UserName = 'ppReportPartInconsisDBText5'
          DataField = 'SIGLAEMP'
          DataPipeline = ppBDEPipelineMovPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineMovPart'
          mmHeight = 3969
          mmLeft = 216430
          mmTop = 9260
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object ppBDEPipelineSaldoContas: TppBDEPipeline
    DataSource = dsSaldoContas
    UserName = 'BDEPipelineSaldoContas'
    Left = 30
    Top = 295
  end
  object qrySaldoContas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     MAX(COTACAOMOEDA.COTDATA) AS DATACOTACAO,'
      '     SITPLANOPREV.DESCRICAO AS SITUACAO,'
      '     PESSJUR.NOME AS PATROCINADORA,'
      '     PLANPREV.NOME AS PLANO,'
      '     PESSOA.NOME AS PARTICIPANTE,'
      '     MOEDA.MOEDESC AS MOEDA, '
      '     RESERVAXPLANO.NOME AS RESERVA, '
      '     COTACAOMOEDA.COTVALOR AS COTACAO,'
      '     RESERVAPART.DATAREFERENCIASA AS DATAREF,'
      '     RESERVAPART.VALORRESERVA AS RESERVACOTAS,'
      
        '     (RESERVAPART.VALORRESERVA * COTACAOMOEDA.COTVALOR)  AS RESE' +
        'RVAREAL'
      'FROM'
      '     PLANPREV, '
      '     PARTPREVPLAN,'
      '     RESERVAXPLANO, '
      '     PESSOA PESSJUR,'
      '     PESSOA, '
      '     MOEDA,'
      '     COTACAOMOEDA, '
      '     SITPLANOPREV,'
      '     RESERVAPART'
      'WHERE'
      '     RESERVAPART.IDPESSOA = PESSOA.IDPESSOA'
      '     AND RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA'
      '     AND RESERVAPART.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND RESERVAPART.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND RESERVAPART.DATAREFERENCIASA = :DATA1'
      '     AND PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND PARTPREVPLAN.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND PARTPREVPLAN.IDPESSOA = PESSOA.IDPESSOA'
      
        '     AND PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPR' +
        'EV '
      '     AND COTACAOMOEDA.MOECODIGO = MOEDA.MOECODIGO'
      '     AND COTACAOMOEDA.COTDATA = :DATA2'
      '     AND RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO'
      'GROUP  BY'
      '     PESSJUR.NOME,'
      '     PLANPREV.NOME,'
      '     SITPLANOPREV.DESCRICAO,'
      '     RESERVAXPLANO.NOME, '
      '     PESSOA.NOME,'
      '     MOEDA.MOEDESC, '
      '     COTACAOMOEDA.COTVALOR,'
      '     RESERVAPART.DATAREFERENCIASA,'
      '     RESERVAPART.VALORRESERVA')
    ValidateWithMask = True
    Left = 241
    Top = 295
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptUnknown
        Value = 36053d
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptUnknown
        Value = 36054d
      end>
  end
  object dsSaldoContas: TwwDataSource
    DataSet = qrySaldoContas
    Left = 337
    Top = 295
  end
  object qryTransferenciaCotas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDHISTRESERVA,'
      '     PESSOA.NOME PESSOA,'
      '     PT.INSCRICAONUMERO,'
      '     RP.NOME RESERVA,'
      '     VLRCOTAS,'
      '     VLRREAL,'
      '     DATAMOV,'
      '     PESSJUR.NOME PESSJUR,'
      '     PV.NOME PLANPREV,'
      '     MOESIGLA,'
      '     MOEDESC, '
      '     DECODE(FLGENTRADA, 0, '#39'Origem'#39', 1, '#39'Destino'#39'),'
      '     DECODE(FLGENTRADA, 0, '#39'Saída'#39', 1, '#39'Entrada'#39')'
      'FROM'
      '     HISTMOVRESERVA H,'
      '     PARTPREVPLAN PT,'
      '     PLANPREV PV, '
      '     PESSOA,'
      '     PESSOA PESSJUR,'
      '     RESERVAXPLANO RP, '
      '     MOEDA M'
      'WHERE'
      '     H.IDPESSOA = PESSOA.IDPESSOA'
      '     AND H.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND H.IDPLANOPREV = PV.IDPLANOPREV'
      '     AND RP.IDPLANOPREV = PV.IDPLANOPREV'
      '     AND RP.IDTIPORESERVA = H.IDTIPORESERVA'
      '     AND PT.IDPESSOA = PESSOA.IDPESSOA(+)'
      '     AND PT.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND PT.IDPLANOPREV = PV.IDPLANOPREV '
      '     AND RP.INDICEREAJUSTE = M.MOECODIGO'
      '     AND H.IDEVENTOGERADOR IS NOT NULL'
      'ORDER  BY '
      '     PESSJUR.NOME, '
      '     PV.NOME, '
      '     H.IDHISTRESERVA ')
    ValidateWithMask = True
    Left = 241
    Top = 248
  end
  object ppReportTransferenciaCotas: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineTransferenciaCotas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Transferência de Cotas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportTransferenciaCotasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 145
    Top = 248
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppReportTransferenciaCotasLabel1: TppLabel
        UserName = 'ppReportTransferenciaCotasLabel1'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 131234
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppReportTransferenciaCotasLabel2: TppLabel
        UserName = 'ppReportTransferenciaCotasLabel2'
        Caption = 'Relatório de Transferência de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 98161
        mmTop = 7938
        mmWidth = 88106
        BandType = 0
      end
      object ppReportTransferenciaCotasLine8: TppLine
        UserName = 'ppReportTransferenciaCotasLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 266701
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppReportTransferenciaCotasDBText3: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText3'
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = -265
        mmTop = 1323
        mmWidth = 32015
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText4: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText4'
        AutoSize = True
        DataField = 'PESSOA'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 1323
        mmWidth = 13229
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText5: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText5'
        AutoSize = True
        DataField = 'RESERVA'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 1323
        mmWidth = 15081
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText6: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText6'
        AutoSize = True
        DataField = 'VLRCOTAS'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText7: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText7'
        AutoSize = True
        DataField = 'MOESIGLA'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 180182
        mmTop = 1323
        mmWidth = 16669
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText8: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText8'
        AutoSize = True
        DataField = 'DECODE(FLGENTRADA,0,'#39'ORIGEM'#39',1,'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 1323
        mmWidth = 57679
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText10: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText10'
        AutoSize = True
        DataField = 'MOEDESC'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 197115
        mmTop = 1323
        mmWidth = 16140
        BandType = 4
      end
      object ppReportTransferenciaCotasDBText11: TppDBText
        UserName = 'ppReportTransferenciaCotasDBText11'
        AutoSize = True
        DataField = 'DATAMOV'
        DataPipeline = ppBDEPipelineTransferenciaCotas
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppReportTransferenciaCotasLabel14: TppLabel
        UserName = 'ppReportTransferenciaCotasLabel14'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppReportTransferenciaCotasLine7: TppLine
        UserName = 'ppReportTransferenciaCotasLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 8
      end
      object ppReportTransferenciaCotasCalc1: TppSystemVariable
        UserName = 'ReportTransferenciaCotasCalc1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppReportTransferenciaCotasCalc2: TppSystemVariable
        UserName = 'ReportTransferenciaCotasCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppReportTransferenciaCotasGroup1: TppGroup
      BreakName = 'PESSJUR'
      DataPipeline = ppBDEPipelineTransferenciaCotas
      OutlineSettings.CreateNode = True
      UserName = 'ReportTransferenciaCotasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
      object ppReportTransferenciaCotasGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportTransferenciaCotasDBText1: TppDBText
          UserName = 'ppReportTransferenciaCotasDBText1'
          AutoSize = True
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineTransferenciaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
          mmHeight = 3704
          mmLeft = 34396
          mmTop = 1323
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppReportTransferenciaCotasLabel3: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel3'
          Caption = 'Patrocinadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 7408
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppReportTransferenciaCotasLine1: TppLine
          UserName = 'ppReportTransferenciaCotasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6350
          mmWidth = 266701
          BandType = 3
          GroupNo = 0
        end
      end
      object ppReportTransferenciaCotasGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportTransferenciaCotasLine5: TppLine
          UserName = 'ppReportTransferenciaCotasLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object ppReportTransferenciaCotasLabel13: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel13'
          Caption = 'Total por patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppReportTransferenciaCotasDBCalc2: TppDBCalc
          UserName = 'ppReportTransferenciaCotasDBCalc2'
          AutoSize = True
          DataField = 'VLRCOTAS'
          DataPipeline = ppBDEPipelineTransferenciaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportTransferenciaCotasGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
          mmHeight = 3704
          mmLeft = 210873
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppReportTransferenciaCotasGroup2: TppGroup
      BreakName = 'PLANPREV'
      DataPipeline = ppBDEPipelineTransferenciaCotas
      OutlineSettings.CreateNode = True
      UserName = 'ReportTransferenciaCotasGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
      object ppReportTransferenciaCotasGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppReportTransferenciaCotasDBText2: TppDBText
          UserName = 'ppReportTransferenciaCotasDBText2'
          AutoSize = True
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineTransferenciaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
          mmHeight = 3704
          mmLeft = 29898
          mmTop = 1323
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel4: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel4'
          Caption = 'Plano '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 7408
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLine2: TppLine
          UserName = 'ppReportTransferenciaCotasLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 266701
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel5: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel5'
          Caption = 'Nº Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 7408
          mmTop = 7938
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel6: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel6'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 31750
          mmTop = 7938
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel7: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel7'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 111125
          mmTop = 7938
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel8: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel8'
          Caption = 'Qtde. cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 153723
          mmTop = 7938
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel9: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel9'
          Caption = 'Sigla'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 185209
          mmTop = 7938
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel10: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel10'
          Caption = 'Descrição moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 201084
          mmTop = 7938
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLabel11: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel11'
          Caption = 'Data mov'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 238655
          mmTop = 7938
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLine3: TppLine
          UserName = 'ppReportTransferenciaCotasLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 266701
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReportTransferenciaCotasGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportTransferenciaCotasLabel12: TppLabel
          UserName = 'ppReportTransferenciaCotasLabel12'
          Caption = 'Total por plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppReportTransferenciaCotasDBCalc1: TppDBCalc
          UserName = 'ppReportTransferenciaCotasDBCalc1'
          AutoSize = True
          DataField = 'VLRCOTAS'
          DataPipeline = ppBDEPipelineTransferenciaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportTransferenciaCotasGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineTransferenciaCotas'
          mmHeight = 3704
          mmLeft = 210873
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLine4: TppLine
          UserName = 'ppReportTransferenciaCotasLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 266701
          BandType = 5
          GroupNo = 1
        end
        object ppReportTransferenciaCotasLine6: TppLine
          UserName = 'ppReportTransferenciaCotasLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 266701
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBDEPipelineTransferenciaCotas: TppBDEPipeline
    DataSource = dsTransferenciaCotas
    UserName = 'BDEPipelineTransferenciaCotas'
    Left = 30
    Top = 248
  end
  object dsTransferenciaCotas: TwwDataSource
    DataSet = qryTransferenciaCotas
    Left = 337
    Top = 248
  end
  object ppReportSaldoContas: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineSaldoContas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo de Contas'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportSaldoContasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 241
    Top = 145
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineSaldoContas'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87842
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'Relatório de Saldo de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 63236
        mmTop = 7938
        mmWidth = 70908
        BandType = 0
      end
      object ppReportSaldoContasLine9: TppLine
        UserName = 'ppReportSaldoContasLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppReportSaldoContasDBText4: TppDBText
        UserName = 'ppReportSaldoContasDBText4'
        AutoSize = True
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBDEPipelineSaldoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 1323
        mmWidth = 23283
        BandType = 4
      end
      object ppReportSaldoContasDBText6: TppDBText
        UserName = 'ppReportSaldoContasDBText6'
        AutoSize = True
        DataField = 'RESERVACOTAS'
        DataPipeline = ppBDEPipelineSaldoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas'
        mmHeight = 3704
        mmLeft = 65617
        mmTop = 1323
        mmWidth = 26194
        BandType = 4
      end
      object ppReportSaldoContasDBText7: TppDBText
        UserName = 'ppReportSaldoContasDBText7'
        AutoSize = True
        DataField = 'MOEDA'
        DataPipeline = ppBDEPipelineSaldoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas'
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 1323
        mmWidth = 11642
        BandType = 4
      end
      object ppReportSaldoContasDBText8: TppDBText
        UserName = 'ppReportSaldoContasDBText8'
        AutoSize = True
        DataField = 'COTACAO'
        DataPipeline = ppBDEPipelineSaldoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppReportSaldoContasDBText9: TppDBText
        UserName = 'ppReportSaldoContasDBText9'
        AutoSize = True
        DataField = 'RESERVAREAL'
        DataPipeline = ppBDEPipelineSaldoContas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas'
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 1323
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppReportSaldoContasCalc1: TppSystemVariable
        UserName = 'ReportSaldoContasCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 1323
        mmWidth = 24606
        BandType = 8
      end
    end
    object ppReportSaldoContasGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBDEPipelineSaldoContas
      OutlineSettings.CreateNode = True
      UserName = 'ReportSaldoContasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas'
      object ppReportSaldoContasGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLine1: TppLine
          UserName = 'ppReportSaldoContasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoContasLabel1: TppLabel
          UserName = 'ppReportSaldoContasLabel1'
          Caption = 'Patrocinadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoContasDBText1: TppDBText
          UserName = 'ppReportSaldoContasDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 31750
          mmTop = 1323
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoContasLabel13: TppLabel
          UserName = 'ppReportSaldoContasLabel13'
          Caption = 'Data Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoContasDBText10: TppDBText
          UserName = 'ppReportSaldoContasDBText10'
          AutoSize = True
          DataField = 'DATAREF'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object ppReportSaldoContasGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReportSaldoContasGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppBDEPipelineSaldoContas
      OutlineSettings.CreateNode = True
      UserName = 'ReportSaldoContasGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas'
      object ppReportSaldoContasGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLine2: TppLine
          UserName = 'ppReportSaldoContasLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoContasLabel2: TppLabel
          UserName = 'ppReportSaldoContasLabel2'
          Caption = 'Plano '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoContasDBText2: TppDBText
          UserName = 'ppReportSaldoContasDBText2'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 19844
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoContasLabel14: TppLabel
          UserName = 'ppReportSaldoContasLabel14'
          Caption = 'Data Conversão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoContasDBText11: TppDBText
          UserName = 'ppReportSaldoContasDBText11'
          AutoSize = True
          DataField = 'DATACOTACAO'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReportSaldoContasGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLabel12: TppLabel
          UserName = 'ppReportSaldoContasLabel12'
          Caption = 'Total por plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppReportSaldoContasLine8: TppLine
          UserName = 'ppReportSaldoContasLine8'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 1
        end
        object ppReportSaldoContasDBCalc3: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc3'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 1323
          mmWidth = 35190
          BandType = 5
          GroupNo = 1
        end
        object ppReportSaldoContasDBCalc6: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc6'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 53975
          mmTop = 1323
          mmWidth = 37835
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppReportSaldoContasGroup3: TppGroup
      BreakName = 'SITUACAO'
      DataPipeline = ppBDEPipelineSaldoContas
      OutlineSettings.CreateNode = True
      UserName = 'ReportSaldoContasGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas'
      object ppReportSaldoContasGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLine3: TppLine
          UserName = 'ppReportSaldoContasLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoContasLabel3: TppLabel
          UserName = 'ppReportSaldoContasLabel3'
          Caption = 'Situação '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoContasDBText3: TppDBText
          UserName = 'ppReportSaldoContasDBText3'
          AutoSize = True
          DataField = 'SITUACAO'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
      end
      object ppReportSaldoContasGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLabel11: TppLabel
          UserName = 'ppReportSaldoContasLabel11'
          Caption = 'Total por situação participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object ppReportSaldoContasLine7: TppLine
          UserName = 'ppReportSaldoContasLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 2
        end
        object ppReportSaldoContasDBCalc2: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc2'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 1323
          mmWidth = 35190
          BandType = 5
          GroupNo = 2
        end
        object ppReportSaldoContasDBCalc5: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc5'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 53975
          mmTop = 1323
          mmWidth = 37835
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppReportSaldoContasGroup4: TppGroup
      BreakName = 'RESERVA'
      DataPipeline = ppBDEPipelineSaldoContas
      OutlineSettings.CreateNode = True
      UserName = 'ReportSaldoContasGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas'
      object ppReportSaldoContasGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppReportSaldoContasLabel7: TppLabel
          UserName = 'ppReportSaldoContasLabel7'
          Caption = 'Cot. moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 127000
          mmTop = 7938
          mmWidth = 16933
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLabel8: TppLabel
          UserName = 'ppReportSaldoContasLabel8'
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 106892
          mmTop = 7938
          mmWidth = 10054
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLabel9: TppLabel
          UserName = 'ppReportSaldoContasLabel9'
          Caption = 'Saldo (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 168540
          mmTop = 7938
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLabel4: TppLabel
          UserName = 'ppReportSaldoContasLabel4'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 7938
          mmWidth = 18256
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLabel6: TppLabel
          UserName = 'ppReportSaldoContasLabel6'
          Caption = 'Saldo cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 74083
          mmTop = 7938
          mmWidth = 17727
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLabel5: TppLabel
          UserName = 'ppReportSaldoContasLabel5'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 12435
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasDBText5: TppDBText
          UserName = 'ppReportSaldoContasDBText5'
          AutoSize = True
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 1323
          mmWidth = 15081
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLine4: TppLine
          UserName = 'ppReportSaldoContasLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 3
        end
        object ppReportSaldoContasLine5: TppLine
          UserName = 'ppReportSaldoContasLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 203200
          BandType = 3
          GroupNo = 3
        end
      end
      object ppReportSaldoContasGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportSaldoContasLabel10: TppLabel
          UserName = 'ppReportSaldoContasLabel10'
          Caption = 'Total por reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 3
        end
        object ppReportSaldoContasLine6: TppLine
          UserName = 'ppReportSaldoContasLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 3
        end
        object ppReportSaldoContasDBCalc1: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc1'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 1323
          mmWidth = 35190
          BandType = 5
          GroupNo = 3
        end
        object ppReportSaldoContasDBCalc4: TppDBCalc
          UserName = 'ppReportSaldoContasDBCalc4'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportSaldoContasGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas'
          mmHeight = 3704
          mmLeft = 53975
          mmTop = 1323
          mmWidth = 37835
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object ppBDEPipelineSaldoSituacao: TppBDEPipeline
    DataSource = dsSaldoSituacao
    UserName = 'BDEPipelineSaldoSituacao'
    Left = 30
    Top = 342
  end
  object qrySaldoSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     SUM(RESERVAPART.VALORRESERVA) AS RESERVACOTAS,'
      '     SITPLANOPREV.DESCRICAO AS SITUACAO,'
      '     PESSJUR.NOME AS PATROCINADORA,'
      '     PLANPREV.NOME AS PLANO,'
      '     PESSOA.NOME AS PARTICIPANTE,'
      '     MOEDA.MOEDESC AS MOEDA, '
      '     RESERVAXPLANO.NOME AS RESERVA, '
      '     COTACAOMOEDA.COTVALOR AS COTACAO,'
      '     COTACAOMOEDA.COTDATA,'
      '     RESERVAPART.DATAREFERENCIASA AS DATAREF,'
      
        '     (RESERVAPART.VALORRESERVA * COTACAOMOEDA.COTVALOR)  AS RESE' +
        'RVAREAL'
      'FROM'
      '     PLANPREV, '
      '     PARTPREVPLAN,'
      '     RESERVAXPLANO, '
      '     PESSOA PESSJUR,'
      '     PESSOA, '
      '     MOEDA,'
      '     COTACAOMOEDA, '
      '     SITPLANOPREV,'
      '     RESERVAPART'
      'WHERE'
      '     RESERVAPART.IDPESSOA = PESSOA.IDPESSOA'
      '     AND RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA'
      '     AND RESERVAPART.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND RESERVAPART.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND RESERVAPART.DATAREFERENCIASA = :DATA1'
      '     AND PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND PARTPREVPLAN.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND PARTPREVPLAN.IDPESSOA = PESSOA.IDPESSOA'
      
        '     AND PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPR' +
        'EV '
      '     AND COTACAOMOEDA.MOECODIGO = MOEDA.MOECODIGO'
      '     AND COTACAOMOEDA.COTDATA = :DATA2'
      '     AND RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO'
      'GROUP  BY'
      '     PESSJUR.NOME,'
      '     PLANPREV.NOME,'
      '     SITPLANOPREV.DESCRICAO,'
      '     RESERVAXPLANO.NOME, '
      '     PESSOA.NOME,'
      '     MOEDA.MOEDESC, '
      '     COTACAOMOEDA.COTDATA,'
      '     COTACAOMOEDA.COTVALOR,'
      '     RESERVAPART.DATAREFERENCIASA,'
      '     RESERVAPART.VALORRESERVA')
    ValidateWithMask = True
    Left = 241
    Top = 342
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptUnknown
        Value = 36053d
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptUnknown
        Value = 36054d
      end>
  end
  object dsSaldoSituacao: TwwDataSource
    DataSet = qrySaldoSituacao
    Left = 337
    Top = 342
  end
  object ppReportSaldoSituacao: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineSaldoSituacao
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo por Situação'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportSaldoSituacaoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 145
    Top = 302
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineSaldoSituacao'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87842
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Resumo de Saldos por Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 61119
        mmTop = 7938
        mmWidth = 78317
        BandType = 0
      end
      object ppReportSaldoSituacaoLine2: TppLine
        UserName = 'ppReportSaldoSituacaoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppReportSaldoSituacaoDBText1: TppDBText
        UserName = 'ppReportSaldoSituacaoDBText1'
        AutoSize = True
        DataField = 'RESERVA'
        DataPipeline = ppBDEPipelineSaldoSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoSituacao'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 1323
        mmWidth = 15081
        BandType = 4
      end
      object ppReportSaldoSituacaoDBText2: TppDBText
        UserName = 'ppReportSaldoSituacaoDBText2'
        AutoSize = True
        DataField = 'RESERVACOTAS'
        DataPipeline = ppBDEPipelineSaldoSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoSituacao'
        mmHeight = 3704
        mmLeft = 65617
        mmTop = 1323
        mmWidth = 26194
        BandType = 4
      end
      object ppReportSaldoSituacaoDBText3: TppDBText
        UserName = 'ppReportSaldoSituacaoDBText3'
        AutoSize = True
        DataField = 'MOEDA'
        DataPipeline = ppBDEPipelineSaldoSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoSituacao'
        mmHeight = 3704
        mmLeft = 108479
        mmTop = 1323
        mmWidth = 11642
        BandType = 4
      end
      object ppReportSaldoSituacaoDBText4: TppDBText
        UserName = 'ppReportSaldoSituacaoDBText4'
        AutoSize = True
        DataField = 'COTACAO'
        DataPipeline = ppBDEPipelineSaldoSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoSituacao'
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppReportSaldoSituacaoDBText5: TppDBText
        UserName = 'ppReportSaldoSituacaoDBText5'
        AutoSize = True
        DataField = 'RESERVAREAL'
        DataPipeline = ppBDEPipelineSaldoSituacao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoSituacao'
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 1323
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 1323
        mmWidth = 24606
        BandType = 8
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBDEPipelineSaldoSituacao
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoSituacao'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine11: TppLine
          UserName = 'ppLine11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
        end
        object ppLabel76: TppLabel
          UserName = 'ppLabel76'
          Caption = 'Patrocinadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText33'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 31750
          mmTop = 1323
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoSituacaoLabel6: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel6'
          Caption = 'Data Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppReportSaldoSituacaoDBText6: TppDBText
          UserName = 'ppReportSaldoSituacaoDBText6'
          AutoSize = True
          DataField = 'DATAREF'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppBDEPipelineSaldoSituacao
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoSituacao'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'ppLine12'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
        end
        object ppLabel77: TppLabel
          UserName = 'ppLabel77'
          Caption = 'Plano '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppDBText34: TppDBText
          UserName = 'ppDBText34'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 19844
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoSituacaoLabel7: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel7'
          Caption = 'Data Conversão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppReportSaldoSituacaoDBText7: TppDBText
          UserName = 'ppReportSaldoSituacaoDBText7'
          AutoSize = True
          DataField = 'COTDATA'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel78: TppLabel
          UserName = 'ppLabel78'
          Caption = 'Total por plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppLine13: TppLine
          UserName = 'ppLine13'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoSituacao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'ppDBCalc6'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'SITUACAO'
      DataPipeline = ppBDEPipelineSaldoSituacao
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoSituacao'
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppLine14: TppLine
          UserName = 'ppLine14'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
        end
        object ppLabel79: TppLabel
          UserName = 'ppLabel79'
          Caption = 'Situação '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppDBText35: TppDBText
          UserName = 'ppDBText35'
          AutoSize = True
          DataField = 'SITUACAO'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLine1: TppLine
          UserName = 'ppReportSaldoSituacaoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLabel1: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel1'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 7938
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLabel2: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel2'
          Caption = 'Saldo cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 74083
          mmTop = 7938
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLabel3: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel3'
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 108479
          mmTop = 7938
          mmWidth = 10054
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLabel4: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel4'
          Caption = 'Cot. moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 132292
          mmTop = 7938
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object ppReportSaldoSituacaoLabel5: TppLabel
          UserName = 'ppReportSaldoSituacaoLabel5'
          Caption = 'Saldo(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 7938
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          Caption = 'Total por situação participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object ppLine15: TppLine
          UserName = 'ppLine15'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoSituacao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoSituacao'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryRetiradaCotas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PESSOA.NOME PESSOA,'
      '     PT.INSCRICAONUMERO,'
      '     RP.NOME RESERVA,'
      '     H.VLRCOTAS,'
      '     H.DATAMOV,'
      '     PESSJUR.NOME PESSJUR,'
      '     PV.NOME PLANPREV'
      'FROM'
      '     HISTMOVRESERVA H,'
      '     PARTPREVPLAN PT,'
      '     PLANPREV PV, '
      '     PESSOA,'
      '     PESSOA PESSJUR,'
      '     RESERVAXPLANO RP'
      'WHERE'
      '     H.IDPESSOA = PESSOA.IDPESSOA'
      '     AND H.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND H.IDPLANOPREV = PV.IDPLANOPREV'
      '     AND RP.IDPLANOPREV = PV.IDPLANOPREV'
      '     AND RP.IDTIPORESERVA = H.IDTIPORESERVA'
      '     AND PT.IDPESSOA = PESSOA.IDPESSOA'
      '     AND PT.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND PT.IDPLANOPREV = PV.IDPLANOPREV '
      '     AND H.IDBENEFICIO IS NOT NULL'
      '     AND H.FLGENTRADA = 0'
      '     AND H.DATAMOV >= :DATA1'
      '     AND H.DATAMOV <= :DATA2'
      'ORDER  BY '
      '     PESSJUR.NOME, '
      '     PV.NOME,'
      '     PESSOA.NOME, '
      '     H.DATAMOV '#9)
    ValidateWithMask = True
    Left = 241
    Top = 390
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptUnknown
        Value = 36066d
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptUnknown
        Value = 36070d
      end>
  end
  object ppReportRetiradaCotas: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineRetiradaCotas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Retirada de Cotas'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppReportRetiradaCotasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 132
    Top = 355
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineRetiradaCotas'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel81: TppLabel
        UserName = 'ppLabel81'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87577
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'ppLabel82'
        Caption = 'Relatório de Retirada de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 61648
        mmTop = 7938
        mmWidth = 74083
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppBDEPipelineRetiradaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineRetiradaCotas'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 1323
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText37'
        AutoSize = True
        DataField = 'PESSOA'
        DataPipeline = ppBDEPipelineRetiradaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineRetiradaCotas'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 1323
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText38'
        AutoSize = True
        DataField = 'RESERVA'
        DataPipeline = ppBDEPipelineRetiradaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineRetiradaCotas'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 1323
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        AutoSize = True
        DataField = 'VLRCOTAS'
        DataPipeline = ppBDEPipelineRetiradaCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineRetiradaCotas'
        mmHeight = 3704
        mmLeft = 129382
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppReportRetiradaCotasDBText1: TppDBText
        UserName = 'ppReportRetiradaCotasDBText1'
        AutoSize = True
        DataField = 'DATAMOV'
        DataPipeline = ppBDEPipelineRetiradaCotas
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineRetiradaCotas'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppLine22: TppLine
        UserName = 'ppLine22'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppReportRetiradaCotasCalc1: TppSystemVariable
        UserName = 'ReportRetiradaCotasCalc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'PESSJUR'
      DataPipeline = ppBDEPipelineRetiradaCotas
      OutlineSettings.CreateNode = True
      UserName = 'Group17'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineRetiradaCotas'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText40: TppDBText
          UserName = 'ppDBText40'
          AutoSize = True
          DataField = 'PESSJUR'
          DataPipeline = ppBDEPipelineRetiradaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineRetiradaCotas'
          mmHeight = 3704
          mmLeft = 34396
          mmTop = 1323
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel84: TppLabel
          UserName = 'ppLabel84'
          Caption = 'Patrocinadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'ppLine23'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
        end
        object ppReportRetiradaCotasLabel2: TppLabel
          UserName = 'ppReportRetiradaCotasLabel2'
          Caption = 'Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppReportRetiradaCotasLabel3: TppLabel
          UserName = 'ppReportRetiradaCotasLabel3'
          Caption = 'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 150813
          mmTop = 1323
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppReportRetiradaCotasCalc2: TppSystemVariable
          UserName = 'ReportRetiradaCotasCalc2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 132292
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppReportRetiradaCotasCalc3: TppSystemVariable
          UserName = 'ReportRetiradaCotasCalc3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 156104
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine24: TppLine
          UserName = 'ppLine24'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 5
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'ppLabel85'
          Caption = 'Total por patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 79375
          mmTop = 1323
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          AutoSize = True
          DataField = 'VLRCOTAS'
          DataPipeline = ppBDEPipelineRetiradaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineRetiradaCotas'
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'PLANPREV'
      DataPipeline = ppBDEPipelineRetiradaCotas
      OutlineSettings.CreateNode = True
      UserName = 'Group18'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineRetiradaCotas'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppDBText41: TppDBText
          UserName = 'ppDBText41'
          AutoSize = True
          DataField = 'PLANPREV'
          DataPipeline = ppBDEPipelineRetiradaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineRetiradaCotas'
          mmHeight = 3704
          mmLeft = 34396
          mmTop = 1323
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel86: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Plano '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLine25: TppLine
          UserName = 'ppLine25'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
        end
        object ppLabel87: TppLabel
          UserName = 'ppLabel87'
          Caption = 'Nº insc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 7938
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel88: TppLabel
          UserName = 'ppLabel88'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 20902
          mmTop = 7938
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel89: TppLabel
          UserName = 'ppLabel89'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 79375
          mmTop = 7938
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel90: TppLabel
          UserName = 'ppLabel90'
          Caption = 'Qtde. cotas retirada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 116681
          mmTop = 7938
          mmWidth = 29898
          BandType = 3
          GroupNo = 1
        end
        object ppLine26: TppLine
          UserName = 'ppLine26'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
        end
        object ppReportRetiradaCotasLabel1: TppLabel
          UserName = 'ppReportRetiradaCotasLabel1'
          Caption = 'Data retirada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 171980
          mmTop = 7938
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel91: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Total por plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 79375
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'ppDBCalc12'
          AutoSize = True
          DataField = 'VLRCOTAS'
          DataPipeline = ppBDEPipelineRetiradaCotas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineRetiradaCotas'
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 1
        end
        object ppLine27: TppLine
          UserName = 'ppLine27'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 5
          GroupNo = 1
        end
        object ppReportRetiradaCotasLine1: TppLine
          UserName = 'ppReportRetiradaCotasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBDEPipelineRetiradaCotas: TppBDEPipeline
    DataSource = dsRetiradaCotas
    UserName = 'BDEPipelineRetiradaCotas'
    Left = 30
    Top = 390
  end
  object dsRetiradaCotas: TwwDataSource
    DataSet = qryRetiradaCotas
    Left = 337
    Top = 390
  end
  object qryFichaBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       HISTRUBSAL.MES,'
      
        '       DECODE(PROVDESC.FLGDESCONTO, 0, HISTRUBSAL.VALORPROVENTO,' +
        ' NULL) AS VALORPROVENTO1,'
      
        '       DECODE(PROVDESC.FLGDESCONTO, 1, HISTRUBSAL.VALORPROVENTO,' +
        ' NULL) AS VALORPROVENTO2,'
      '       PROVDESC.IDPROVENTO,'
      '       PROVDESC.DESCRICAO,'
      '       PESSJUR.NOME AS PATROCINADORA,'
      '       PESSOABENEF.NOME AS BENEFICIARIO'
      ''
      ''
      'FROM'
      ''
      
        '        HISTRUBSAL, PROVDESC, PESSOA PESSJUR, PESSOA PESSOABENEF' +
        ', PATRO, ELEGPATRO '
      ''
      ''
      'WHERE '
      '      PATRO.IDFUNDACAO = HISTRUBSAL.IDPESSJUR'
      '      AND   PESSJUR.IDPESSOA = PATRO.IDPESSOA'
      '      AND   PROVDESC.IDPROVENTO = HISTRUBSAL.IDRUBRICA'
      '      AND   ELEGPATRO.IDPESSOA = HISTRUBSAL.IDPESSOA'
      '      AND   PESSOABENEF.IDPESSOA = HISTRUBSAL.IDPESSOA'
      ''
      'ORDER BY'
      '       PESSJUR.NOME,'
      '       PESSOABENEF.NOME,'
      '       HISTRUBSAL.MES')
    ValidateWithMask = True
    Left = 241
    Top = 437
  end
  object ppReportFichaBeneficio: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineFichaBeneficio
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ficha Financeira de Benefícios'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 126
    Top = 410
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineFichaBeneficio'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87577
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'FICHA FINANCEIRA BENEFICIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 59267
        mmTop = 7938
        mmWidth = 78846
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 203200
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppReportFichaBeneficioDBText4: TppDBText
        UserName = 'ppReportFichaBeneficioDBText4'
        AutoSize = True
        DataField = 'IDPROVENTO'
        DataPipeline = ppBDEPipelineFichaBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFichaBeneficio'
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
      end
      object ppReportFichaBeneficioDBText5: TppDBText
        UserName = 'ppReportFichaBeneficioDBText5'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppBDEPipelineFichaBeneficio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFichaBeneficio'
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 1323
        mmWidth = 19050
        BandType = 4
      end
      object ppReportFichaBeneficioDBText6: TppDBText
        UserName = 'ppReportFichaBeneficioDBText6'
        AutoSize = True
        DataField = 'VALORPROVENTO1'
        DataPipeline = ppBDEPipelineFichaBeneficio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFichaBeneficio'
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 1323
        mmWidth = 30692
        BandType = 4
      end
      object ppReportFichaBeneficioDBText7: TppDBText
        UserName = 'ppReportFichaBeneficioDBText7'
        AutoSize = True
        DataField = 'VALORPROVENTO2'
        DataPipeline = ppBDEPipelineFichaBeneficio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineFichaBeneficio'
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 1323
        mmWidth = 30692
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel94: TppLabel
        UserName = 'ppLabel94'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppReportFichaBeneficioGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBDEPipelineFichaBeneficio
      OutlineSettings.CreateNode = True
      UserName = 'ReportFichaBeneficioGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineFichaBeneficio'
      object ppReportFichaBeneficioGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportFichaBeneficioLabel1: TppLabel
          UserName = 'ppReportFichaBeneficioLabel1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 1323
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppReportFichaBeneficioDBText1: TppDBText
          UserName = 'ppReportFichaBeneficioDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppBDEPipelineFichaBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineFichaBeneficio'
          mmHeight = 3704
          mmLeft = 30427
          mmTop = 1323
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppReportFichaBeneficioLine1: TppLine
          UserName = 'ppReportFichaBeneficioLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 0
        end
      end
      object ppReportFichaBeneficioGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReportFichaBeneficioGroup2: TppGroup
      BreakName = 'BENEFICIARIO'
      DataPipeline = ppBDEPipelineFichaBeneficio
      OutlineSettings.CreateNode = True
      UserName = 'ReportFichaBeneficioGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineFichaBeneficio'
      object ppReportFichaBeneficioGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportFichaBeneficioLabel2: TppLabel
          UserName = 'ppReportFichaBeneficioLabel2'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 1323
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppReportFichaBeneficioDBText2: TppDBText
          UserName = 'ppReportFichaBeneficioDBText2'
          AutoSize = True
          DataField = 'BENEFICIARIO'
          DataPipeline = ppBDEPipelineFichaBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineFichaBeneficio'
          mmHeight = 3704
          mmLeft = 26458
          mmTop = 1323
          mmWidth = 22490
          BandType = 3
          GroupNo = 1
        end
        object ppReportFichaBeneficioLine2: TppLine
          UserName = 'ppReportFichaBeneficioLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 1
        end
      end
      object ppReportFichaBeneficioGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppReportFichaBeneficioGroup3: TppGroup
      BreakName = 'MES'
      DataPipeline = ppBDEPipelineFichaBeneficio
      OutlineSettings.CreateNode = True
      UserName = 'ReportFichaBeneficioGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineFichaBeneficio'
      object ppReportFichaBeneficioGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppReportFichaBeneficioLabel3: TppLabel
          UserName = 'ppReportFichaBeneficioLabel3'
          Caption = 'Mês ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 1323
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioDBText3: TppDBText
          UserName = 'ppReportFichaBeneficioDBText3'
          AutoSize = True
          DataField = 'MES'
          DataPipeline = ppBDEPipelineFichaBeneficio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineFichaBeneficio'
          mmHeight = 3704
          mmLeft = 19844
          mmTop = 1323
          mmWidth = 6879
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioLine3: TppLine
          UserName = 'ppReportFichaBeneficioLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioLine4: TppLine
          UserName = 'ppReportFichaBeneficioLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 203200
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioLabel4: TppLabel
          UserName = 'ppReportFichaBeneficioLabel4'
          Caption = 'Cód. / Descrição da rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 7938
          mmWidth = 40481
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioLabel5: TppLabel
          UserName = 'ppReportFichaBeneficioLabel5'
          Caption = 'Provento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 134938
          mmTop = 7938
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppReportFichaBeneficioLabel6: TppLabel
          UserName = 'ppReportFichaBeneficioLabel6'
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 171980
          mmTop = 7938
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
      end
      object ppReportFichaBeneficioGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppReportFichaBeneficioLine5: TppLine
          UserName = 'ppReportFichaBeneficioLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 203200
          BandType = 5
          GroupNo = 2
        end
        object ppReportFichaBeneficioLabel7: TppLabel
          UserName = 'ppReportFichaBeneficioLabel7'
          Caption = 'Total liquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 95250
          mmTop = 1323
          mmWidth = 17992
          BandType = 5
          GroupNo = 2
        end
        object ppReportFichaBeneficioDBCalc1: TppDBCalc
          UserName = 'ppReportFichaBeneficioDBCalc1'
          AutoSize = True
          DataField = 'VALORPROVENTO1'
          DataPipeline = ppBDEPipelineFichaBeneficio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppReportFichaBeneficioGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineFichaBeneficio'
          mmHeight = 3704
          mmLeft = 151871
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppBDEPipelineFichaBeneficio: TppBDEPipeline
    DataSource = dsFichaBeneficio
    UserName = 'BDEPipelineFichaBeneficio'
    Left = 30
    Top = 434
  end
  object dsFichaBeneficio: TwwDataSource
    DataSet = qryFichaBeneficio
    Left = 337
    Top = 437
  end
  object ppBDEPipelineSaldoContas1: TppBDEPipeline
    DataSource = dsSaldoContas1
    UserName = 'BDEPipelineSaldoContas1'
    Left = 30
    Top = 484
  end
  object qrySaldoContas1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '     COTACAOMOEDA.COTDATA,'
      '     SITPLANOPREV.DESCRICAO AS SITUACAO,'
      '     PESSJUR.NOME AS PATROCINADORA,'
      '     PLANPREV.NOME AS PLANO,'
      '     PESSOA.NOME AS PARTICIPANTE,'
      '     MOEDA.MOEDESC AS MOEDA, '
      '     RESERVAXPLANO.NOME AS RESERVA, '
      '     COTACAOMOEDA.COTVALOR AS COTACAO,'
      '     RESERVAPART.DATAREFERENCIASA AS DATAREF,'
      '     RESERVAPART.VALORRESERVA AS RESERVACOTAS,'
      
        '     (RESERVAPART.VALORRESERVA * COTACAOMOEDA.COTVALOR)  AS RESE' +
        'RVAREAL'
      'FROM'
      '     PLANPREV, '
      '     PARTPREVPLAN,'
      '     RESERVAXPLANO, '
      '     PESSOA PESSJUR,'
      '     PESSOA, '
      '     MOEDA,'
      '     COTACAOMOEDA, '
      '     SITPLANOPREV,'
      '     RESERVAPART'
      'WHERE'
      '     RESERVAPART.IDPESSOA = PESSOA.IDPESSOA'
      '     AND RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA'
      '     AND RESERVAPART.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND RESERVAPART.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND RESERVAPART.DATAREFERENCIASA = :DATA1'
      '     AND PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '     AND PARTPREVPLAN.IDPESSJUR = PESSJUR.IDPESSOA'
      '     AND PARTPREVPLAN.IDPESSOA = PESSOA.IDPESSOA'
      
        '     AND PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPR' +
        'EV '
      '     AND COTACAOMOEDA.MOECODIGO = MOEDA.MOECODIGO'
      '     AND COTACAOMOEDA.COTDATA = :DATA2'
      '     AND RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO'
      'GROUP  BY'
      '     PESSJUR.NOME,'
      '     PLANPREV.NOME,'
      '     SITPLANOPREV.DESCRICAO,'
      '     RESERVAXPLANO.NOME, '
      '     PESSOA.NOME,'
      '     MOEDA.MOEDESC, '
      '     COTACAOMOEDA.COTDATA,'
      '     COTACAOMOEDA.COTVALOR,'
      '     RESERVAPART.DATAREFERENCIASA,'
      '     RESERVAPART.VALORRESERVA')
    ValidateWithMask = True
    Left = 241
    Top = 484
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptUnknown
        Value = 36053d
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptUnknown
        Value = 36054d
      end>
  end
  object dsSaldoContas1: TwwDataSource
    DataSet = qrySaldoContas1
    Left = 337
    Top = 484
  end
  object ppReportSaldoContas1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineSaldoContas1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportSaldoSituacao'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 145
    Top = 484
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineSaldoContas1'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 87842
        mmTop = 1323
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'Relatório de Saldo de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 63236
        mmTop = 7938
        mmWidth = 70908
        BandType = 0
      end
      object ppReportSaldoContas1Line1: TppLine
        UserName = 'ppReportSaldoContas1Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        AutoSize = True
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBDEPipelineSaldoContas1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas1'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 1323
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'ppDBText43'
        DataField = 'RESERVACOTAS'
        DataPipeline = ppBDEPipelineSaldoContas1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas1'
        mmHeight = 3969
        mmLeft = 75936
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'ppDBText44'
        AutoSize = True
        DataField = 'MOEDA'
        DataPipeline = ppBDEPipelineSaldoContas1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas1'
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 1323
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'ppDBText45'
        AutoSize = True
        DataField = 'COTACAO'
        DataPipeline = ppBDEPipelineSaldoContas1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas1'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'ppDBText46'
        DataField = 'RESERVAREAL'
        DataPipeline = ppBDEPipelineSaldoContas1
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipelineSaldoContas1'
        mmHeight = 3969
        mmLeft = 168011
        mmTop = 1323
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 1323
        mmWidth = 42598
        BandType = 8
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 1323
        mmWidth = 11906
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 197380
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 1323
        mmWidth = 24606
        BandType = 8
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBDEPipelineSaldoContas1
      OutlineSettings.CreateNode = True
      UserName = 'Group19'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas1'
      object ppGroupHeaderBand19: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine17: TppLine
          UserName = 'ppLine17'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel98: TppLabel
          UserName = 'ppLabel98'
          Caption = 'Patrocinadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText47: TppDBText
          UserName = 'ppDBText47'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 31750
          mmTop = 1323
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel99: TppLabel
          UserName = 'ppLabel99'
          Caption = 'Data Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppDBText48: TppDBText
          UserName = 'ppDBText48'
          AutoSize = True
          DataField = 'DATAREF'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup20: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppBDEPipelineSaldoContas1
      OutlineSettings.CreateNode = True
      UserName = 'Group20'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas1'
      object ppGroupHeaderBand20: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine18: TppLine
          UserName = 'ppLine18'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel100: TppLabel
          UserName = 'ppLabel100'
          Caption = 'Plano '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppDBText49: TppDBText
          UserName = 'ppDBText49'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 19844
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel101: TppLabel
          UserName = 'ppLabel101'
          Caption = 'Data Conversão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 119063
          mmTop = 1323
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppDBText50: TppDBText
          UserName = 'ppDBText50'
          AutoSize = True
          DataField = 'COTDATA'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 145521
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand20: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel102: TppLabel
          UserName = 'ppLabel102'
          Caption = 'Total por plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppLine19: TppLine
          UserName = 'ppLine19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup21: TppGroup
      BreakName = 'SITUACAO'
      DataPipeline = ppBDEPipelineSaldoContas1
      OutlineSettings.CreateNode = True
      UserName = 'Group21'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas1'
      object ppGroupHeaderBand21: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLine21: TppLine
          UserName = 'ppLine21'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel103: TppLabel
          UserName = 'ppLabel103'
          Caption = 'Situação '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppDBText51: TppDBText
          UserName = 'ppDBText51'
          AutoSize = True
          DataField = 'SITUACAO'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel104: TppLabel
          UserName = 'ppLabel104'
          Caption = 'Total por situação participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object ppLine30: TppLine
          UserName = 'ppLine30'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc15'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup21
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'ppDBCalc16'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup21
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup22: TppGroup
      BreakName = 'RESERVA'
      DataPipeline = ppBDEPipelineSaldoContas1
      OutlineSettings.CreateNode = True
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipelineSaldoContas1'
      object ppGroupHeaderBand22: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppLabel105: TppLabel
          UserName = 'ppLabel105'
          Caption = 'Cot. moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 127000
          mmTop = 7938
          mmWidth = 16933
          BandType = 3
          GroupNo = 3
        end
        object ppLabel106: TppLabel
          UserName = 'ppLabel106'
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 106892
          mmTop = 7938
          mmWidth = 10054
          BandType = 3
          GroupNo = 3
        end
        object ppLabel107: TppLabel
          UserName = 'ppLabel107'
          Caption = 'Saldo (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 168540
          mmTop = 7938
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel108: TppLabel
          UserName = 'ppLabel108'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 7938
          mmWidth = 18256
          BandType = 3
          GroupNo = 3
        end
        object ppLabel109: TppLabel
          UserName = 'ppLabel109'
          Caption = 'Saldo cotas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 74083
          mmTop = 7938
          mmWidth = 17727
          BandType = 3
          GroupNo = 3
        end
        object ppLabel110: TppLabel
          UserName = 'ppLabel110'
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 12435
          BandType = 3
          GroupNo = 3
        end
        object ppDBText52: TppDBText
          UserName = 'ppDBText52'
          AutoSize = True
          DataField = 'RESERVA'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 1323
          mmWidth = 15081
          BandType = 3
          GroupNo = 3
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 3
        end
        object ppLine32: TppLine
          UserName = 'ppLine32'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 12965
          mmWidth = 197300
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand22: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          Caption = 'Total por reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 3
        end
        object ppLine33: TppLine
          UserName = 'ppLine33'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'ppDBCalc17'
          AutoSize = True
          DataField = 'RESERVAREAL'
          DataPipeline = ppBDEPipelineSaldoContas1
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 1323
          mmWidth = 6350
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'ppDBCalc18'
          AutoSize = True
          DataField = 'RESERVACOTAS'
          DataPipeline = ppBDEPipelineSaldoContas1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipelineSaldoContas1'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1323
          mmWidth = 1852
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object ppBDERelBeneficios: TppBDEPipeline
    DataSource = dsRelBeneficios
    UserName = 'BDERelBeneficios'
    Left = 688
    Top = 118
  end
  object dsRelBeneficios: TwwDataSource
    DataSet = qryRelBeneficios
    Left = 684
    Top = 64
  end
  object qryRelBeneficios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.NOME, PPATRO.NOME AS NOMEPATROCINADORA, PL.NOME AS NOME' +
        'PLANO,'
      '       PF.SEXO, PF.DATANASC, PF.DATAMORTE, PF.NUMDEPIRRF,'
      '       PF.NUMDEPSALF,'
      '       DECODE(PF.FLGISENTOIRRF,1,'#39'Sim'#39','#39'Não'#39'), PF.ESTCIVIL,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.IDSITFUNC, SFUNC.DESCRI' +
        'CAO AS NOMESITFUNC,'
      '       EL.TEMPOSERVANTERIOR,'
      '       EL.DATADEMISSAO,'
      '       PP.INSCRICAODATA, PP.INSCRICAONUMERO, PP.INSCRICAOTIPO,'
      '       PP.DTINICIOINSC, PP.SALAUXDOENCA,'
      '       DECODE(PP.FLGDEVEEMPRESTIMO,1,'#39'Sim'#39','#39'Não'#39'),'
      '       DECODE(PP.FLGDEVEASSISTENC,1,'#39'Sim'#39','#39'Não'#39'),'
      '       DECODE(PP.FLGDEVEPREVIDENC,1,'#39'Sim'#39','#39'Não'#39'),'
      '       DECODE(PP.FLGFITESPECIAL,1,'#39'Sim'#39','#39'Não'#39'),'
      '       PP.IDSITPART, SPART.DESCRICAO AS NOMESITPART,'
      '       SPLAN.DESCRICAO AS NOMESITPLANO,'
      '       PR.NUMEROPROCESSO, PR.DTEVENTO, EG.NOME AS NOMEEVENTO,'
      
        '       SITP.DESCRICAO AS NOMESITPROCESSO, B.NOME AS NOMEBENEFICI' +
        'O,'
      '       BFC.VALORATUAL, BFC.DATAREQUERIMENTO,'
      '       BFC.DATAINICIO,  BFC.DATAFINAL,'
      '       DECODE(BFC.FLGFORMAPAGTO,'#39'F'#39','#39'F'#39','#39'P'#39') AS FLGFORMAPAGTO,'
      
        '       BFC.ULTMESPREPARO, BFC.VLRCALCINSS, BFC.VLRINFINSS, BFC.D' +
        'ATAINICIOINSS,'
      '       BFC.NUMPROCINSS, BFC.DATAINICIOFUND,'
      '       DECODE(BFC.FLGBENEFMIN,1,'#39'X'#39','#39#39'),'
      '       BFC.VALORCOTAS, BFC.IDSITBENEFICIO,'
      '       BP.NOMEVALORBASE1, BP.NOMEVALORBASE2, BP.NOMEVALORBASE3,'
      '       BPT.VALORBASE1, BPT.VALORBASE2, BPT.VALORBASE3'
      
        'FROM   PESSOA P, PESSOA PPATRO, PESSOAFISICA PF, ELEGPATRO EL, P' +
        'ARTPREVPLAN PP,'
      
        '       SITFUNC SFUNC, SITPART SPART, SITPLANOPREV SPLAN, PLANPRE' +
        'V PL,'
      
        '       PROCESSOBENEF PR, BENEFBFCIARIO BFC, BENEFPLANPREV BP, BE' +
        'NEFICIO B,'
      '       EVENTOGERADOR EG, SITBENEFICIO SITP, BENEFPLANOPART BPT'
      'WHERE  (P.IDPESSOA = :IDPESSOA)'
      'AND    (PR.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BP.FLGREFERENCIA = 0)'
      'AND    (PF.IDPESSOA  = P.IDPESSOA)'
      'AND    (EL.IDPESSJUR = PPATRO.IDPESSOA)'
      'AND    (EL.IDPESSOA  = P.IDPESSOA)'
      'AND    (PP.IDPESSOA  = EL.IDPESSOA)'
      'AND    (PP.IDPESSJUR = EL.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND    (EL.IDSITFUNC = SFUNC.IDSITFUNC)'
      'AND    (PP.IDSITPART = SPART.IDSITPART)'
      'AND    (PP.IDSITPLANOPREV = SPLAN.IDSITPLANOPREV)'
      'AND    (PR.IDEVENTOGERADOR = EG.IDEVENTOGERADOR)'
      'AND    (PR.IDSITPROCESSO   = SITP.IDSITBENEFICIO)'
      'AND    (BFC.IDPESSOA      = PP.IDPESSOA)'
      'AND    (BFC.IDTITULAR     = PP.IDPESSOA)'
      'AND    (BFC.IDPESSJUR     = PP.IDPESSJUR)'
      'AND    (BFC.IDPLANOPREV   = PP.IDPLANOPREV)'
      'AND    (BFC.NUMEROPROCESSO = PR.NUMEROPROCESSO)'
      'AND    (BFC.IDBENEFICIO   = BP.IDBENEFICIO)'
      'AND    (BFC.IDPLANOPREV   = BP.IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO    = B.IDBENEFICIO)'
      'AND    (BPT.IDPESSOA      = BFC.IDPESSOA)'
      'AND    (BPT.IDPLANOPREV   = BFC.IDPLANOPREV)'
      'AND    (BPT.IDPESSJUR     = BFC.IDPESSJUR)'
      'AND    (BPT.IDBENEFICIO   = BFC.IDBENEFICIO)'
      '')
    ValidateWithMask = True
    Left = 682
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 53144
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 949
      end>
  end
  object ppRepRelBeneficios: TppReport
    AutoStop = False
    DataPipeline = ppBDERelBeneficios
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 695
    Top = 172
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDERelBeneficios'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 104511
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Relatório de Processos de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 65881
        mmTop = 8731
        mmWidth = 73290
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15875
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'lblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 86784
        mmTop = 1588
        mmWidth = 27781
        BandType = 0
      end
      object ppRepRelBeneficiosLabel1: TppLabel
        UserName = 'ppRepRelBeneficiosLabel1'
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 25665
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosLabel2: TppLabel
        UserName = 'ppRepRelBeneficiosLabel2'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 50006
        mmWidth = 20108
        BandType = 0
      end
      object ppRepRelBeneficiosLabel3: TppLabel
        UserName = 'ppRepRelBeneficiosLabel3'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 59002
        mmWidth = 13229
        BandType = 0
      end
      object ppRepRelBeneficiosLabel4: TppLabel
        UserName = 'ppRepRelBeneficiosLabel4'
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 70379
        mmWidth = 29633
        BandType = 0
      end
      object ppRepRelBeneficiosLabel5: TppLabel
        UserName = 'ppRepRelBeneficiosLabel5'
        Caption = 'Nº de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 79375
        mmWidth = 21431
        BandType = 0
      end
      object ppRepRelBeneficiosLabel6: TppLabel
        UserName = 'ppRepRelBeneficiosLabel6'
        Caption = 'Admitido em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 59002
        mmWidth = 18785
        BandType = 0
      end
      object ppRepRelBeneficiosLabel7: TppLabel
        UserName = 'ppRepRelBeneficiosLabel7'
        Caption = 'Situação na Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 50006
        mmWidth = 37306
        BandType = 0
      end
      object ppRepRelBeneficiosLabel8: TppLabel
        UserName = 'ppRepRelBeneficiosLabel8'
        Caption = 'Demitido em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 59002
        mmWidth = 18521
        BandType = 0
      end
      object ppRepRelBeneficiosLabel9: TppLabel
        UserName = 'ppRepRelBeneficiosLabel9'
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 25665
        mmWidth = 30956
        BandType = 0
      end
      object ppRepRelBeneficiosLabel10: TppLabel
        UserName = 'ppRepRelBeneficiosLabel10'
        Caption = 'Nascido em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 34660
        mmWidth = 16933
        BandType = 0
      end
      object ppRepRelBeneficiosLabel11: TppLabel
        UserName = 'ppRepRelBeneficiosLabel11'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 34660
        mmWidth = 7144
        BandType = 0
      end
      object ppRepRelBeneficiosLabel12: TppLabel
        UserName = 'ppRepRelBeneficiosLabel12'
        Caption = 'Falecido em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 39423
        mmWidth = 17463
        BandType = 0
      end
      object ppRepRelBeneficiosLabel13: TppLabel
        UserName = 'ppRepRelBeneficiosLabel13'
        Caption = 'Dep. para IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 34660
        mmWidth = 20373
        BandType = 0
      end
      object ppRepRelBeneficiosLabel14: TppLabel
        UserName = 'ppRepRelBeneficiosLabel14'
        Caption = 'Dep. para Sal. Família'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 39423
        mmWidth = 30163
        BandType = 0
      end
      object ppRepRelBeneficiosLabel15: TppLabel
        UserName = 'ppRepRelBeneficiosLabel15'
        Caption = 'Isento de IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 44450
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosLabel16: TppLabel
        UserName = 'ppRepRelBeneficiosLabel16'
        Caption = 'Estado Civil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 39423
        mmWidth = 16669
        BandType = 0
      end
      object ppRepRelBeneficiosDBText1: TppDBText
        UserName = 'ppRepRelBeneficiosDBText1'
        DataField = 'NOME'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 30163
        mmWidth = 95250
        BandType = 0
      end
      object ppRepRelBeneficiosDBText2: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOMESITPART'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 29898
        mmWidth = 47625
        BandType = 0
      end
      object ppRepRelBeneficiosDBText3: TppDBText
        UserName = 'ppRepRelBeneficiosDBText3'
        DataField = 'DATANASC'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 4233
        mmLeft = 22225
        mmTop = 34660
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosDBText4: TppDBText
        UserName = 'ppRepRelBeneficiosDBText4'
        DataField = 'DATAMORTE'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 39423
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosDBText5: TppDBText
        UserName = 'ppRepRelBeneficiosDBText5'
        DataField = 'SEXO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 63236
        mmTop = 34660
        mmWidth = 4498
        BandType = 0
      end
      object ppRepRelBeneficiosDBText6: TppDBText
        UserName = 'ppRepRelBeneficiosDBText6'
        DataField = 'ESTCIVIL'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 72231
        mmTop = 39423
        mmWidth = 1588
        BandType = 0
      end
      object ppRepRelBeneficiosDBText7: TppDBText
        UserName = 'ppRepRelBeneficiosDBText7'
        DataField = 'NUMDEPIRRF'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 34660
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosDBText8: TppDBText
        UserName = 'ppRepRelBeneficiosDBText8'
        DataField = 'NUMDEPSALF'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 39423
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosLine1: TppLine
        UserName = 'ppRepRelBeneficiosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 48683
        mmWidth = 197300
        BandType = 0
      end
      object ppRepRelBeneficiosDBText9: TppDBText
        UserName = 'ppRepRelBeneficiosDBText9'
        DataField = 'NOMEPATROCINADORA'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 54504
        mmWidth = 95250
        BandType = 0
      end
      object ppRepRelBeneficiosDBText10: TppDBText
        UserName = 'ppRepRelBeneficiosDBText10'
        DataField = 'NOMESITFUNC'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 54504
        mmWidth = 47625
        BandType = 0
      end
      object ppRepRelBeneficiosDBText11: TppDBText
        UserName = 'ppRepRelBeneficiosDBText11'
        DataField = 'MATRICULA'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 63500
        mmWidth = 20638
        BandType = 0
      end
      object ppRepRelBeneficiosDBText12: TppDBText
        UserName = 'ppRepRelBeneficiosDBText12'
        DataField = 'DATAADMISSAO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 63500
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosDBText13: TppDBText
        UserName = 'ppRepRelBeneficiosDBText13'
        DataField = 'DATADEMISSAO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 63500
        mmWidth = 15875
        BandType = 0
      end
      object ppRepRelBeneficiosLine2: TppLine
        UserName = 'ppRepRelBeneficiosLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 68792
        mmWidth = 197300
        BandType = 0
      end
      object ppRepRelBeneficiosLabel17: TppLabel
        UserName = 'ppRepRelBeneficiosLabel17'
        Caption = 'Situação no Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 70379
        mmWidth = 25400
        BandType = 0
      end
      object ppRepRelBeneficiosLabel18: TppLabel
        UserName = 'ppRepRelBeneficiosLabel18'
        Caption = 'Inscrito em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 79375
        mmWidth = 16669
        BandType = 0
      end
      object ppRepRelBeneficiosLabel19: TppLabel
        UserName = 'ppRepRelBeneficiosLabel19'
        Caption = 'Situação Especial ?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 88900
        mmWidth = 27517
        BandType = 0
      end
      object ppRepRelBeneficiosLabel20: TppLabel
        UserName = 'ppRepRelBeneficiosLabel20'
        Caption = 'Deve Empréstimo ?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 84138
        mmWidth = 28575
        BandType = 0
      end
      object ppRepRelBeneficiosLabel21: TppLabel
        UserName = 'ppRepRelBeneficiosLabel21'
        Caption = 'Deve Previdenciário ?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 79375
        mmWidth = 31485
        BandType = 0
      end
      object ppRepRelBeneficiosLabel22: TppLabel
        UserName = 'ppRepRelBeneficiosLabel22'
        Caption = 'Deve Assistencial ?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115623
        mmTop = 88900
        mmWidth = 28575
        BandType = 0
      end
      object ppRepRelBeneficiosDBText14: TppDBText
        UserName = 'ppRepRelBeneficiosDBText14'
        DataField = 'DECODE(PF.FLGISENTOIRRF,1,'#39'SIM'#39
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 43921
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText15: TppDBText
        UserName = 'ppRepRelBeneficiosDBText15'
        DataField = 'NOMEPLANO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 74877
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText16: TppDBText
        UserName = 'ppRepRelBeneficiosDBText16'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 83873
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText17: TppDBText
        UserName = 'ppRepRelBeneficiosDBText17'
        DataField = 'INSCRICAODATA'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 83873
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText18: TppDBText
        UserName = 'ppRepRelBeneficiosDBText18'
        DataField = 'NOMESITPLANO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 74877
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText19: TppDBText
        UserName = 'ppRepRelBeneficiosDBText19'
        DataField = 'DECODE(PP.FLGFITESPECIAL,1,'#39'SIM'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 88900
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText20: TppDBText
        UserName = 'ppRepRelBeneficiosDBText20'
        DataField = 'DECODE(PP.FLGDEVEPREVIDENC,1,'#39'S'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 79375
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText21: TppDBText
        UserName = 'ppRepRelBeneficiosDBText21'
        DataField = 'DECODE(PP.FLGDEVEEMPRESTIMO,1,'#39
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 84138
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText22: TppDBText
        UserName = 'ppRepRelBeneficiosDBText22'
        DataField = 'DECODE(PP.FLGDEVEASSISTENC,1,'#39'S'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 88900
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosLine3: TppLine
        UserName = 'ppRepRelBeneficiosLine3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 92340
        mmWidth = 197300
        BandType = 0
      end
      object ppRepRelBeneficiosRegion2: TppRegion
        UserName = 'ppRepRelBeneficiosRegion2'
        Brush.Color = clSilver
        Caption = 'ppRepRelBeneficiosRegion2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 15875
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppRepRelBeneficiosLabel32: TppLabel
          UserName = 'ppRepRelBeneficiosLabel32'
          Caption = 'Dados do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 85461
          mmTop = 16669
          mmWidth = 31485
          BandType = 0
        end
      end
      object ppRepRelBeneficiosLabel51: TppLabel
        UserName = 'ppRepRelBeneficiosLabel51'
        Caption = 'Opções de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 94721
        mmWidth = 29898
        BandType = 0
      end
      object ppRepRelBeneficiosDBText39: TppDBText
        UserName = 'ppRepRelBeneficiosDBText39'
        DataField = 'NOMEVALORBASE1'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 94721
        mmWidth = 44450
        BandType = 0
      end
      object ppRepRelBeneficiosDBText40: TppDBText
        UserName = 'ppRepRelBeneficiosDBText40'
        DataField = 'NOMEVALORBASE2'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 94721
        mmWidth = 43392
        BandType = 0
      end
      object ppRepRelBeneficiosDBText41: TppDBText
        UserName = 'ppRepRelBeneficiosDBText41'
        DataField = 'NOMEVALORBASE3'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 94721
        mmWidth = 41804
        BandType = 0
      end
      object ppRepRelBeneficiosDBText42: TppDBText
        UserName = 'ppRepRelBeneficiosDBText42'
        DataField = 'VALORBASE1'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 98690
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText43: TppDBText
        UserName = 'ppRepRelBeneficiosDBText43'
        DataField = 'VALORBASE2'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 98690
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText44: TppDBText
        UserName = 'ppRepRelBeneficiosDBText44'
        DataField = 'VALORBASE3'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 98690
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosLine5: TppLine
        UserName = 'ppRepRelBeneficiosLine5'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 103188
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppRepRelBeneficiosDBText27: TppDBText
        UserName = 'ppRepRelBeneficiosDBText27'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 529
        mmWidth = 36248
        BandType = 4
      end
      object ppRepRelBeneficiosDBText28: TppDBText
        UserName = 'ppRepRelBeneficiosDBText28'
        DataField = 'DATAINICIOINSS'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object ppRepRelBeneficiosDBText29: TppDBText
        UserName = 'ppRepRelBeneficiosDBText29'
        DataField = 'DATAINICIOINSS'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText30: TppDBText
        UserName = 'ppRepRelBeneficiosDBText30'
        DataField = 'VALORATUAL'
        DataPipeline = ppBDERelBeneficios
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppRepRelBeneficiosDBText31: TppDBText
        UserName = 'ppRepRelBeneficiosDBText31'
        DataField = 'VALORCOTAS'
        DataPipeline = ppBDERelBeneficios
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText32: TppDBText
        UserName = 'ppRepRelBeneficiosDBText32'
        DataField = 'VLRCALCINSS'
        DataPipeline = ppBDERelBeneficios
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 102659
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText33: TppDBText
        UserName = 'ppRepRelBeneficiosDBText33'
        DataField = 'VLRINFINSS'
        DataPipeline = ppBDERelBeneficios
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText34: TppDBText
        UserName = 'ppRepRelBeneficiosDBText34'
        DataField = 'DATAINICIO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 134938
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText35: TppDBText
        UserName = 'ppRepRelBeneficiosDBText35'
        DataField = 'DATAFINAL'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppRepRelBeneficiosDBText36: TppDBText
        UserName = 'ppRepRelBeneficiosDBText36'
        DataField = 'NUMPROCINSS'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppRepRelBeneficiosDBText37: TppDBText
        UserName = 'ppRepRelBeneficiosDBText37'
        DataField = 'DECODE(BFC.FLGBENEFMIN,1,'#39'X'#39','#39#39
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 187855
        mmTop = 529
        mmWidth = 1588
        BandType = 4
      end
      object ppRepRelBeneficiosDBText38: TppDBText
        UserName = 'ppRepRelBeneficiosDBText38'
        DataField = 'IDSITBENEFICIO'
        DataPipeline = ppBDERelBeneficios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDERelBeneficios'
        mmHeight = 3704
        mmLeft = 193940
        mmTop = 529
        mmWidth = 1588
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel63: TppLabel
        UserName = 'ppLabel63'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 12435
        mmWidth = 197909
        BandType = 8
      end
      object ppRepRelBeneficiosLabel38: TppLabel
        UserName = 'ppRepRelBeneficiosLabel38'
        Caption = 'Situações do Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 2910
        mmWidth = 29369
        BandType = 8
      end
      object ppRepRelBeneficiosLabel44: TppLabel
        UserName = 'ppRepRelBeneficiosLabel44'
        Caption = '1- Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 2910
        mmWidth = 12171
        BandType = 8
      end
      object ppRepRelBeneficiosLabel45: TppLabel
        UserName = 'ppRepRelBeneficiosLabel45'
        Caption = '2 - Retido '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 2910
        mmWidth = 12965
        BandType = 8
      end
      object ppRepRelBeneficiosLabel46: TppLabel
        UserName = 'ppRepRelBeneficiosLabel46'
        Caption = '3 - Encerrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 2910
        mmWidth = 17463
        BandType = 8
      end
      object ppRepRelBeneficiosLabel47: TppLabel
        UserName = 'ppRepRelBeneficiosLabel47'
        Caption = '4 - Pendente de Concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161396
        mmTop = 2910
        mmWidth = 35454
        BandType = 8
      end
      object ppRepRelBeneficiosLabel48: TppLabel
        UserName = 'ppRepRelBeneficiosLabel48'
        Caption = '5 - Encerrado por Morte do Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 6879
        mmWidth = 50271
        BandType = 8
      end
      object ppRepRelBeneficiosLabel49: TppLabel
        UserName = 'ppRepRelBeneficiosLabel49'
        Caption = '6- Não Concedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 6879
        mmWidth = 22754
        BandType = 8
      end
      object ppRepRelBeneficiosLabel50: TppLabel
        UserName = 'ppRepRelBeneficiosLabel50'
        Caption = '7 - Concedido em Exigência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 6879
        mmWidth = 35190
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
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
        mmTop = 12435
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 12435
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppRepRelBeneficiosGroup1: TppGroup
      BreakName = 'NUMEROPROCESSO'
      DataPipeline = ppBDERelBeneficios
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'RepRelBeneficiosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDERelBeneficios'
      object ppRepRelBeneficiosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 35983
        mmPrintPosition = 0
        object ppRepRelBeneficiosRegion1: TppRegion
          UserName = 'ppRepRelBeneficiosRegion1'
          Brush.Color = clSilver
          Caption = 'ppRepRelBeneficiosRegion1'
          mmHeight = 14023
          mmLeft = 0
          mmTop = 20108
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppRepRelBeneficiosLabel28: TppLabel
            UserName = 'ppRepRelBeneficiosLabel28'
            Caption = 'Início do Benefício'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            WordWrap = True
            mmHeight = 7408
            mmLeft = 42333
            mmTop = 20902
            mmWidth = 13494
            BandType = 3
            GroupNo = 0
          end
          object ppRepRelBeneficiosLabel35: TppLabel
            UserName = 'ppRepRelBeneficiosLabel35'
            Caption = 'INSS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 42069
            mmTop = 29104
            mmWidth = 6085
            BandType = 3
            GroupNo = 0
          end
          object ppRepRelBeneficiosLabel29: TppLabel
            UserName = 'ppRepRelBeneficiosLabel29'
            Caption = 'Sit.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 191030
            mmTop = 21167
            mmWidth = 4498
            BandType = 3
            GroupNo = 0
          end
        end
        object ppRepRelBeneficiosLabel23: TppLabel
          UserName = 'ppRepRelBeneficiosLabel23'
          Caption = 'Processo de Benefício Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1588
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel24: TppLabel
          UserName = 'ppRepRelBeneficiosLabel24'
          Caption = 'Evento Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 10319
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel25: TppLabel
          UserName = 'ppRepRelBeneficiosLabel25'
          Caption = 'Data do Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 529
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel26: TppLabel
          UserName = 'ppRepRelBeneficiosLabel26'
          Caption = 'Situação do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 50271
          mmTop = 1852
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosDBText23: TppDBText
          UserName = 'ppRepRelBeneficiosDBText23'
          DataField = 'NUMEROPROCESSO'
          DataPipeline = ppBDERelBeneficios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDERelBeneficios'
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 5821
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosDBText24: TppDBText
          UserName = 'ppRepRelBeneficiosDBText24'
          DataField = 'NOMESITPROCESSO'
          DataPipeline = ppBDERelBeneficios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDERelBeneficios'
          mmHeight = 3704
          mmLeft = 50271
          mmTop = 6085
          mmWidth = 63500
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosDBText25: TppDBText
          UserName = 'ppRepRelBeneficiosDBText25'
          DataField = 'DTEVENTO'
          DataPipeline = ppBDERelBeneficios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDERelBeneficios'
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 5027
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosDBText26: TppDBText
          UserName = 'ppRepRelBeneficiosDBText26'
          DataField = 'NOMEEVENTO'
          DataPipeline = ppBDERelBeneficios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDERelBeneficios'
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 14552
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel27: TppLabel
          UserName = 'ppRepRelBeneficiosLabel27'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 20902
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel30: TppLabel
          UserName = 'ppRepRelBeneficiosLabel30'
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 71967
          mmTop = 29369
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel31: TppLabel
          UserName = 'ppRepRelBeneficiosLabel31'
          Caption = 'Valor (Cotas)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 85990
          mmTop = 29369
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel33: TppLabel
          UserName = 'ppRepRelBeneficiosLabel33'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 139700
          mmTop = 29369
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel34: TppLabel
          UserName = 'ppRepRelBeneficiosLabel34'
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 29369
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel36: TppLabel
          UserName = 'ppRepRelBeneficiosLabel36'
          Caption = 'Calc INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 29369
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel37: TppLabel
          UserName = 'ppRepRelBeneficiosLabel37'
          Caption = 'Inf. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 121444
          mmTop = 29369
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel39: TppLabel
          UserName = 'ppRepRelBeneficiosLabel39'
          Caption = 'Proc. INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 169863
          mmTop = 20902
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel40: TppLabel
          UserName = 'ppRepRelBeneficiosLabel40'
          Caption = 'Min.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 183357
          mmTop = 20902
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel41: TppLabel
          UserName = 'ppRepRelBeneficiosLabel41'
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 121179
          mmTop = 20902
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel42: TppLabel
          UserName = 'ppRepRelBeneficiosLabel42'
          Caption = 'Valor do Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 80433
          mmTop = 20902
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLabel43: TppLabel
          UserName = 'ppRepRelBeneficiosLabel43'
          Caption = 'Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 55563
          mmTop = 29369
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppRepRelBeneficiosLine4: TppLine
          UserName = 'ppRepRelBeneficiosLine4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 33867
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppRepRelBeneficiosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryMov: TwwQuery
    BeforeOpen = qryMovPartAntBeforeOpen
    AfterScroll = qryMovAfterScroll
    OnCalcFields = qryMovCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      H.IDHISTRESERVA,'
      '      H.IDEVENTOGERADOR,'
      '      H.IDPLANOPREV,'
      '      H.IDCONTRIBUICAO,'
      '      H.IDBENEFICIO,'
      '      H.IDTIPORESERVA,'
      '      H.IDPESSJUR ,'
      '      H.IDPESSOA   ,'
      '      H.DATAMOV   ,'
      '      H.VLRREAL ,'
      '      H.SALDOREAL,'
      '      VLRCOTAS  ,'
      '      H.SALDOCOTAS     ,'
      '      DECODE(FLGENTRADA, 0, H.VLRREAL) VLRREALSAIDA,'
      '      DECODE(FLGENTRADA, 1, H.VLRREAL) VLRREALENT,'
      '      DECODE(FLGENTRADA, 0, H.VLRCOTAS) COTASSAIDA,'
      '      DECODE(FLGENTRADA, 1, H.VLRCOTAS) COTASENT ,'
      
        '      DECODE(FLGENTRADA, 0, (H.SALDOREAL) + H.VLRREAL, 1, H.SALD' +
        'OREAL - VLRREAL) AS VLRREALANT,'
      
        '      DECODE(FLGENTRADA, 0, ((H.SALDOCOTAS) + H.VLRCOTAS), 1, (H' +
        '.SALDOCOTAS - VLRCOTAS) ) AS VLRCOTASANT,'
      '      BENEFICIO.NOME BENEFICIO,'
      '      RESERVAXPLANO.NOME RESERVA,'
      '      PLANPREV.NOME PLANPREV,'
      '      PESSOA.NOME PESSOA ,'
      '      PESSJUR.NOME PESSJUR ,'
      '      CONTRIBUICAO.NOME CONTRIBUICAO ,'
      '      EVENTOGERADOR.NOME EVENTO ,'
      '      DECODE(FLGENTRADA, 1, '#39'ENTRADA'#39', 0, '#39'SAíDA'#39') FLGENTRADA,'
      '      FLGENTRADA ENTRADA,'
      '      PARTPREVPLAN.INSCRICAONUMERO,'
      '      ELEGPATRO.MATRICULA,'
      '      INDICEREAJUSTE,'
      '      MOEDA.MOESIGLA,'
      '      MOEDAEMP.MOESIGLA SIGLAEMP,'
      '      H.SEQPROPOSTA,'
      '      H.VALORINDICE,'
      '      H.FLGPROCEDENCIA,'
      '      H.MESREFERENCIA,'
      '      H.DATAALIMENTACAO ,'
      '      ELEGPATRO.IDESTAB,'
      '      REG.NOME '
      'FROM'
      '      PLANPREV ,'
      '      CONTRIBUICAO,'
      '      BENEFICIO,'
      '      MOEDA ,'
      '      MOEDA MOEDAEMP,'
      '      RESERVAXPLANO ,'
      '      EVENTOGERADOR,'
      '      PARTPREVPLAN ,'
      '      ELEGPATRO,'
      '      RESERVAPART ,'
      '      PESSOA ,'
      '      PESSOA PESSJUR,'
      '      HISTMOVRESERVA H ,'
      '    PESSOA REG '
      'WHERE  (H.IDPESSJUR   = 2003)  '
      'AND    (H.IDPLANOPREV = 7)  '
      'AND    (H.MESREFERENCIA >= '#39'2002/01'#39')  '
      'AND    (H.MESREFERENCIA <= '#39'2002/01'#39')  '
      'AND    (H.IDPESSOA = PESSOA.IDPESSOA )                    '
      'AND    (MOEDAEMP.MOECODIGO = 1 )  '
      'AND    (H.SEQPROPOSTA = 1  )             '
      'AND    (RESERVAPART.SEQPROPOSTA = 1 )   '
      'AND    (H.IDTIPORESERVA = RESERVAPART.IDTIPORESERVA)  '
      'AND    (H.IDPESSOA      = RESERVAPART.IDPESSOA)       '
      'AND    (H.IDPESSJUR     = RESERVAPART.IDPESSJUR)      '
      'AND    (H.IDPLANOPREV   = RESERVAPART.IDPLANOPREV)    '
      
        'AND    (RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA)' +
        '   '
      
        'AND    (RESERVAPART.IDPLANOPREV   = RESERVAXPLANO.IDPLANOPREV)  ' +
        '   '
      
        'AND    (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV )      ' +
        '   '
      
        'AND    (H.IDEVENTOGERADOR = EVENTOGERADOR.IDEVENTOGERADOR(+) )  ' +
        '   '
      
        'AND    (H.IDCONTRIBUICAO = CONTRIBUICAO.IDCONTRIBUICAO(+) )     ' +
        '   '
      
        'AND    (H.IDBENEFICIO = BENEFICIO.IDBENEFICIO(+) )              ' +
        '   '
      
        'AND    (H.IDPESSJUR = PESSJUR.IDPESSOA )                        ' +
        '   '
      
        'AND    (RESERVAPART.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV)     ' +
        '   '
      
        'AND    (RESERVAPART.IDPESSOA    = PARTPREVPLAN.IDPESSOA )       ' +
        '   '
      
        'AND    (RESERVAPART.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA)     ' +
        '   '
      
        'AND    (RESERVAPART.IDPESSJUR   = PARTPREVPLAN.IDPESSJUR )      ' +
        '   '
      
        'AND    (RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO(+))      ' +
        '   '
      
        'AND    (PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR)           ' +
        '   '
      
        'AND    (PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA)             ' +
        '   '
      
        'AND    (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA)                   ' +
        '   '
      
        'AND    (ELEGPATRO.IDESTAB = REG.IDPESSOA(+))                    ' +
        '   '
      
        'ORDER BY IDESTAB, PESSOA, PESSJUR, PLANPREV, RESERVA, H.MESREFER' +
        'ENCIA, H.IDHISTRESERVA '
      '')
    ValidateWithMask = True
    Left = 249
    Top = 10
    object qryMovIDHISTRESERVA: TFloatField
      FieldName = 'IDHISTRESERVA'
    end
    object qryMovIDEVENTOGERADOR: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object qryMovIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryMovIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryMovIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryMovIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object qryMovIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryMovIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
    end
    object qryMovVLRREAL: TFloatField
      FieldName = 'VLRREAL'
    end
    object qryMovSALDOREAL: TFloatField
      FieldName = 'SALDOREAL'
    end
    object qryMovVLRCOTAS: TFloatField
      FieldName = 'VLRCOTAS'
    end
    object qryMovSALDOCOTAS: TFloatField
      FieldName = 'SALDOCOTAS'
    end
    object qryMovVLRREALSAIDA: TFloatField
      FieldName = 'VLRREALSAIDA'
    end
    object qryMovVLRREALENT: TFloatField
      FieldName = 'VLRREALENT'
    end
    object qryMovCOTASSAIDA: TFloatField
      FieldName = 'COTASSAIDA'
    end
    object qryMovCOTASENT: TFloatField
      FieldName = 'COTASENT'
    end
    object qryMovVLRREALANT: TFloatField
      FieldName = 'VLRREALANT'
    end
    object qryMovVLRCOTASANT: TFloatField
      FieldName = 'VLRCOTASANT'
    end
    object qryMovBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryMovRESERVA: TStringField
      FieldName = 'RESERVA'
      FixedChar = True
      Size = 50
    end
    object qryMovPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object qryMovPESSOA: TStringField
      FieldName = 'PESSOA'
      Size = 60
    end
    object qryMovPESSJUR: TStringField
      FieldName = 'PESSJUR'
      Size = 60
    end
    object qryMovCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 60
    end
    object qryMovFLGENTRADA: TStringField
      FieldName = 'FLGENTRADA'
      Size = 7
    end
    object qryMovENTRADA: TFloatField
      FieldName = 'ENTRADA'
    end
    object qryMovINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryMovMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryMovINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object qryMovMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryMovSIGLAEMP: TStringField
      FieldName = 'SIGLAEMP'
      Size = 10
    end
    object qryMovSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryMovVALORINDICE: TFloatField
      FieldName = 'VALORINDICE'
    end
    object qryMovFLGPROCEDENCIA: TFloatField
      FieldName = 'FLGPROCEDENCIA'
    end
    object qryMovMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryMovDATAALIMENTACAO: TDateTimeField
      FieldName = 'DATAALIMENTACAO'
    end
    object qryMovIDESTAB: TFloatField
      FieldName = 'IDESTAB'
    end
    object qryMovNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object qryMovPart: TwwQuery
    AutoCalcFields = False
    BeforeOpen = qryMovPartAntBeforeOpen
    AfterScroll = qryMovPartAntAfterScroll
    OnCalcFields = qryMovPartAntCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      H.IDHISTRESERVA,'
      '      H.IDEVENTOGERADOR,'
      '      H.IDPLANOPREV,'
      '      H.IDCONTRIBUICAO,'
      '      H.IDBENEFICIO,'
      '      H.IDTIPORESERVA,'
      '      H.IDPESSJUR ,'
      '      H.IDPESSOA   ,'
      '      H.DATAMOV   ,'
      '      H.VLRREAL ,'
      '      H.SALDOREAL,'
      '      VLRCOTAS  ,'
      '      H.SALDOCOTAS     ,'
      '      DECODE(FLGENTRADA,'
      '      0,'
      '      H.VLRREAL) VLRREALSAIDA,'
      '      DECODE(FLGENTRADA,'
      '      1,'
      '      H.VLRREAL) VLRREALENT,'
      '      DECODE(FLGENTRADA,'
      '      0,'
      '      H.VLRCOTAS) COTASSAIDA,'
      '      DECODE(FLGENTRADA,'
      '      1,'
      '      H.VLRCOTAS) COTASENT ,'
      '      DECODE(FLGENTRADA,'
      '      0,'
      '      (H.SALDOREAL) + H.VLRREAL,'
      '      1,'
      '      H.SALDOREAL - VLRREAL) AS VLRREALANT,'
      '      DECODE(FLGENTRADA,'
      '      0,'
      '      ((H.SALDOCOTAS) + H.VLRCOTAS)  ,'
      '      1,'
      '      (H.SALDOCOTAS - VLRCOTAS) ) AS VLRCOTASANT,'
      '      BENEFICIO.NOME BENEFICIO,'
      '      RESERVAXPLANO.NOME RESERVA,'
      '      PLANPREV.NOME PLANPREV,'
      '      PESSOA.NOME PESSOA ,'
      '      PESSJUR.NOME PESSJUR ,'
      '      CONTRIBUICAO.NOME CONTRIBUICAO ,'
      '      EVENTOGERADOR.NOME EVENTO ,'
      '      DECODE(FLGENTRADA,'
      '      1,'
      '      '#39'ENTRADA'#39','
      '      0,'
      '      '#39'SAíDA'#39') FLGENTRADA,'
      '      FLGENTRADA ENTRADA,'
      '      PARTPREVPLAN.INSCRICAONUMERO,'
      '      ELEGPATRO.MATRICULA,'
      '      INDICEREAJUSTE,'
      '      MOEDA.MOESIGLA,'
      '      MOEDAEMP.MOESIGLA SIGLAEMP,'
      '      H.SEQPROPOSTA,'
      '      H.VALORINDICE,'
      '      H.FLGPROCEDENCIA,'
      '      H.MESREFERENCIA,'
      '      H.DATAALIMENTACAO ,'
      '      ELEGPATRO.IDESTAB,'
      '      REG.NOME,'
      '      DECODE(RESERVAXPLANO.FLGMODATUALIZACAO,'
      '      0,'
      '      '#39'RESERVA ATUALIZADA POR COTA'#39','
      '      '#39'RESERVA ATUALIZADA POR ÍNDICE'#39') AS MODOATUALIZA,'
      '      DECODE(RESERVAXPLANO.FLGMODATUALIZACAO,'
      '      0,'
      '      '#39'[COTA]'#39','
      '      '#39'[ÍNDICE]'#39') AS NOMETIPOINDICE,'
      
        '      RESERVAXPLANO.FLGMODATUALIZACAO   , rownum                ' +
        '                                       '
      'FROM'
      '      PLANPREV ,'
      '      CONTRIBUICAO,'
      '      BENEFICIO,'
      '      MOEDA ,'
      '      MOEDA MOEDAEMP,'
      '      RESERVAXPLANO ,'
      '      EVENTOGERADOR,'
      '      PARTPREVPLAN ,'
      '      ELEGPATRO,'
      '      RESERVAPART ,'
      '      PESSOA ,'
      '      PESSOA PESSJUR,'
      '      HISTMOVRESERVA H ,'
      '    PESSOA REG '
      'WHERE  (H.IDPESSJUR   = 91008)  '
      'AND    (H.IDPESSOA    = 388223)  '
      'AND    (H.IDPLANOPREV = 2)  '
      'AND    (H.IDPESSOA = PESSOA.IDPESSOA )                    '
      'AND    (MOEDAEMP.MOECODIGO = 1 )  '
      'AND (H.SEQPROPOSTA = 1  )             '
      'AND (RESERVAPART.SEQPROPOSTA = 1 )   '
      'AND (H.IDTIPORESERVA = RESERVAPART.IDTIPORESERVA)  '
      'AND (H.IDPESSOA      = RESERVAPART.IDPESSOA)       '
      'AND (H.IDPESSJUR     = RESERVAPART.IDPESSJUR)      '
      'AND (H.IDPLANOPREV   = RESERVAPART.IDPLANOPREV)    '
      'AND (RESERVAPART.IDTIPORESERVA = RESERVAXPLANO.IDTIPORESERVA)   '
      'AND (RESERVAPART.IDPLANOPREV   = RESERVAXPLANO.IDPLANOPREV)     '
      'AND (RESERVAXPLANO.IDPLANOPREV = PLANPREV.IDPLANOPREV )         '
      'AND (H.IDEVENTOGERADOR = EVENTOGERADOR.IDEVENTOGERADOR(+) )     '
      'AND (H.IDCONTRIBUICAO = CONTRIBUICAO.IDCONTRIBUICAO(+) )        '
      'AND (H.IDBENEFICIO = BENEFICIO.IDBENEFICIO(+) )                 '
      'AND (H.IDPESSJUR = PESSJUR.IDPESSOA )                           '
      'AND (RESERVAPART.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV)        '
      'AND (RESERVAPART.IDPESSOA    = '
      'PARTPREVPLAN.IDPESSOA )          '
      'AND (RESERVAPART.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA)        '
      'AND (RESERVAPART.IDPESSJUR   = PARTPREVPLAN.IDPESSJUR )         '
      'AND (RESERVAXPLANO.INDICEREAJUSTE = MOEDA.MOECODIGO(+))         '
      'AND (PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR)              '
      'AND (PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA)                '
      'AND (ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA)                      '
      'AND (ELEGPATRO.IDESTAB = REG.IDPESSOA(+))                       '
      'ORDER BY IDESTAB,'
      'PESSOA ,'
      'PESSJUR,'
      'PLANPREV,'
      'RESERVAXPLANO.FLGMODATUALIZACAO,'
      'RESERVA,'
      'H.MESREFERENCIA,'
      'H.IDHISTRESERVA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 110
    Top = 65
    object FloatField25: TFloatField
      FieldName = 'IDHISTRESERVA'
    end
    object FloatField26: TFloatField
      FieldName = 'IDEVENTOGERADOR'
    end
    object FloatField27: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object FloatField28: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object FloatField29: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object FloatField30: TFloatField
      FieldName = 'IDTIPORESERVA'
    end
    object FloatField31: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object FloatField32: TFloatField
      FieldName = 'IDPESSOA'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DATAMOV'
      DisplayFormat = '##/##/####'
    end
    object FloatField33: TFloatField
      FieldName = 'VLRREAL'
    end
    object FloatField34: TFloatField
      FieldName = 'SALDOREAL'
    end
    object FloatField35: TFloatField
      FieldName = 'VLRCOTAS'
    end
    object FloatField36: TFloatField
      FieldName = 'SALDOCOTAS'
    end
    object StringField12: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object StringField13: TStringField
      FieldName = 'RESERVA'
      Size = 50
    end
    object StringField14: TStringField
      FieldName = 'PLANPREV'
      Size = 50
    end
    object StringField15: TStringField
      FieldName = 'PESSOA'
      Size = 60
    end
    object StringField16: TStringField
      FieldName = 'PESSJUR'
      Size = 60
    end
    object StringField17: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object StringField18: TStringField
      FieldName = 'EVENTO'
      Size = 60
    end
    object StringField19: TStringField
      FieldName = 'FLGENTRADA'
      Size = 7
    end
    object FloatField37: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object StringField20: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object StringField21: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'GERADOR'
      Size = 50
      Calculated = True
    end
    object FloatField38: TFloatField
      FieldName = 'ENTRADA'
    end
    object FloatField39: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object FloatField40: TFloatField
      FieldName = 'VLRREALSAIDA'
    end
    object FloatField41: TFloatField
      FieldName = 'VLRREALENT'
    end
    object FloatField42: TFloatField
      FieldName = 'COTASSAIDA'
    end
    object FloatField43: TFloatField
      FieldName = 'COTASENT'
    end
    object FloatField44: TFloatField
      FieldName = 'VLRREALANT'
    end
    object FloatField45: TFloatField
      FieldName = 'VLRCOTASANT'
    end
    object FloatField46: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRREALCALC'
      Calculated = True
    end
    object FloatField47: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRCOTASCALC'
      Calculated = True
    end
    object StringField22: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object StringField23: TStringField
      FieldName = 'SIGLAEMP'
      Size = 10
    end
    object FloatField48: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object FloatField49: TFloatField
      FieldName = 'VALORINDICE'
    end
    object StringField24: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DATAALIMENTACAO'
    end
    object FloatField50: TFloatField
      FieldName = 'IDESTAB'
    end
    object StringField25: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object FloatField51: TFloatField
      FieldName = 'FLGPROCEDENCIA'
    end
    object qryMovPartMODOATUALIZA: TStringField
      FieldName = 'MODOATUALIZA'
      Size = 29
    end
    object qryMovPartFLGMODATUALIZACAO: TFloatField
      FieldName = 'FLGMODATUALIZACAO'
    end
    object qryMovPartNOMETIPOINDICE: TStringField
      FieldName = 'NOMETIPOINDICE'
      Size = 6
    end
    object qryMovPartVLRSDCOTASDATA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRSDREALDATA'
      Calculated = True
    end
    object qryMovPartVLRSDCOTASHOJE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRSDREALHOJE'
      Calculated = True
    end
    object qryMovPartVLRSDCOTAS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VLRSDCOTAS'
      Calculated = True
    end
  end
  object qryDocAbertos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, PATRO.NOME PATRO, L.VALOR, PL.PLNPLANIL,'
      'D.NODOCUMENTO , D.DATAEMISSAO, D.DATAVENCTO , D.PLACONTA,'
      'D.COMPLDOCUMENTO, EL.MATRICULA'
      'FROM PESSOA P, PESSOA PATRO,  ELEGPATRO EL,'
      'DOCUMENTO D , LANCTODOCUM L , PLANILHA PL'
      'WHERE'
      'D.CODDOCUMENTO = D.CODDOCUMENTO AND'
      'D.IDMODULO IN (16, 452, 454, 456, 487) AND'
      'D.DATAVENCTO > ADD_MONTHS(SYSDATE, -4) AND'
      'TO_CHAR(D.DATAEMISSAO,'#39'YYYY/MM'#39') <= '#39'2001/11'#39' AND'
      'L.CODDOCUMENTO = D.CODDOCUMENTO AND'
      'PL.PLNCODIGO = L.PLNCODIGO AND'
      'PL.IDMODULO = IN (16, 452, 454, 456, 487) AND'
      'D.IDFORCLI = P.IDPESSOA  AND'
      'PATRO.FLGPATROCINADORA = 1 AND'
      'EL.IDPESSJUR = PATRO.IDPESSOA AND'
      'EL.IDPESSOA = P.IDPESSOA AND'
      'EXISTS ( SELECT 1 FROM'
      '   HSTCONTRIBPREV H'
      '   WHERE'
      '   H.IDPESSJUR = H.IDPESSJUR AND'
      '   H.MESCOBRANCA = H.MESCOBRANCA  AND'
      '   H.MESREFERENCIA = H.MESREFERENCIA AND'
      '   H.IDPLANOPREV = H.IDPLANOPREV AND'
      '   H.IDPESSOA = P.IDPESSOA AND '
      '   H.FLGSITFUNDACAO = '#39'MA'#39' AND'
      '   H.CODDOCUMENTOPREV = D.CODDOCUMENTO) AND'
      'NOT EXISTS (SELECT 1 FROM DOCUMENTO DO'
      '   WHERE DO.IDFORCLI = P.IDPESSOA AND'
      '   DO.COMPLDOCUMENTO = D.COMPLDOCUMENTO AND'
      '   DO.NODOCUMENTO = D.NODOCUMENTO AND'
      '   DO.STATUS = '#39'2'#39')'
      
        'ORDER BY PATRO.IDPESSOA , EL.MATRICULA, D.NODOCUMENTO , D.DATAEM' +
        'ISSAO,'
      'PL.PLNPLANIL'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 466
    Top = 357
  end
  object dsDocAbertos: TwwDataSource
    DataSet = qryDocAbertos
    Left = 488
    Top = 349
  end
  object rppDocAbertos: TppBDEPipeline
    DataSource = dsDocAbertos
    UserName = 'dtppdoc'
    Left = 479
    Top = 373
    object rppDocAbertosppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object rppDocAbertosppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object rppDocAbertosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object rppDocAbertosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object rppDocAbertosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object rppDocAbertosppField6: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object rppDocAbertosppField7: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object rppDocAbertosppField8: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 7
    end
    object rppDocAbertosppField9: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 8
    end
    object rppDocAbertosppField10: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 9
    end
  end
  object ppDocAbertos: TppReport
    AutoStop = False
    DataPipeline = rppDocAbertos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 474
    Top = 397
    Version = '7.04'
    mmColumnWidth = 177800
    DataPipelineName = 'rppDocAbertos'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'rpSitParticipAtivoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 13758
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'rpSitParticipAtivoLabel8'
        Caption = 'Relatório de Doc. Pendentes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Black'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 6615
        mmLeft = 47361
        mmTop = 2910
        mmWidth = 81492
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText94: TppDBText
        UserName = 'rpSitParticipAtivoDBText1'
        DataField = 'NODOCUMENTO'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'rpSitParticipAtivoDBText2'
        DataField = 'DATAVENCTO'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 3704
        mmLeft = 100806
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'rpSitParticipAtivoDBText10'
        DataField = 'DATAEMISSAO'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 3704
        mmLeft = 67998
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'rpSitParticipAtivoDBText15'
        DataField = 'PLNPLANIL'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'rpSitParticipAtivoDBText16'
        DataField = 'VALOR'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSystemVariable9: TppSystemVariable
        UserName = 'rpSitParticipAtivoCalc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 265
        mmWidth = 20902
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'rpSitParticipAtivoCalc2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 265
        mmWidth = 9525
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'Label25'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 794
        mmWidth = 7673
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VALOR'
        DataPipeline = rppDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'rppDocAbertos'
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 794
        mmWidth = 22225
        BandType = 7
      end
    end
    object ppGroup23: TppGroup
      BreakName = 'PATRO'
      DataPipeline = rppDocAbertos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'rppDocAbertos'
      object ppGroupHeaderBand23: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel67: TppLabel
          UserName = 'Label22'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 265
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText113: TppDBText
          UserName = 'DBText59'
          DataField = 'PATRO'
          DataPipeline = rppDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'rppDocAbertos'
          mmHeight = 3969
          mmLeft = 26723
          mmTop = 265
          mmWidth = 80963
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'Line11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand23: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel68: TppLabel
          UserName = 'Label23'
          Caption = 'Somatório por Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 118798
          mmTop = 265
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALOR'
          DataPipeline = rppDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'rppDocAbertos'
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 529
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup24: TppGroup
      BreakName = 'NOME'
      DataPipeline = rppDocAbertos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'rppDocAbertos'
      object ppGroupHeaderBand24: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppDBText114: TppDBText
          UserName = 'rpSitParticipAtivoDBText4'
          DataField = 'MATRICULA'
          DataPipeline = rppDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'rppDocAbertos'
          mmHeight = 3969
          mmLeft = 18521
          mmTop = 529
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppDBText115: TppDBText
          UserName = 'rpSitParticipAtivoDBText5'
          DataField = 'NOME'
          DataPipeline = rppDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'rppDocAbertos'
          mmHeight = 4233
          mmLeft = 57679
          mmTop = 265
          mmWidth = 92075
          BandType = 3
          GroupNo = 1
        end
        object ppLabel69: TppLabel
          UserName = 'rpSitParticipAtivoLabel1'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object ppLabel112: TppLabel
          UserName = 'rpSitParticipAtivoLabel2'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 45508
          mmTop = 265
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppLabel113: TppLabel
          UserName = 'Label26'
          Caption = 'No. Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38100
          mmTop = 5821
          mmWidth = 21696
          BandType = 3
          GroupNo = 1
        end
        object ppLabel114: TppLabel
          UserName = 'Label28'
          Caption = 'Dt. Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 68792
          mmTop = 5821
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel115: TppLabel
          UserName = 'Label29'
          Caption = 'Dt. Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 100013
          mmTop = 5821
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLabel116: TppLabel
          UserName = 'Label30'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 135202
          mmTop = 5821
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel117: TppLabel
          UserName = 'Label301'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 174096
          mmTop = 5821
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand24: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel118: TppLabel
          UserName = 'Label24'
          Caption = 'Somatório por Pessoa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 127794
          mmTop = 2646
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VALOR'
          DataPipeline = rppDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'rppDocAbertos'
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 2646
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppLine41: TppLine
          UserName = 'rpSitParticipAtivoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppFechaInterfaceAmPrev: TppBDEPipeline
    DataSource = dsFechaInterfaceAmPrev
    UserName = 'FechaInterfaceAmPrev'
    Left = 382
    Top = 143
  end
  object rpFechaInterfaceAmPrev: TppReport
    AutoStop = False
    DataPipeline = ppFechaInterfaceAmPrev
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 411
    Top = 205
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppFechaInterfaceAmPrev'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object lblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Fechamento Interface x AdmPrev - Mês : Junho / 1998'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53975
        mmTop = 26458
        mmWidth = 108479
        BandType = 0
      end
      object rpResumoCobrDBImage1: TppDBImage
        UserName = 'rpResumoCobrDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpResumoCobrDBText1: TppDBText
        UserName = 'rpResumoCobrDBText1'
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
      object rpResumoCobrDBText2: TppDBText
        UserName = 'rpResumoCobrDBText2'
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpResumoCobrDBText3: TppDBText
        UserName = 'rpResumoCobrDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFechaInterfaceAmPrev
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFechaInterfaceAmPrev'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 69586
        BandType = 0
      end
      object rpResumoCobrDBText10: TppDBText
        UserName = 'rpResumoCobrDBText10'
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
        mmLeft = 113242
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText11: TppDBText
        UserName = 'rpResumoCobrDBText11'
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
        mmWidth = 20108
        BandType = 0
      end
      object rpResumoCobrDBText12: TppDBText
        UserName = 'rpResumoCobrDBText12'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object rpResumoCobrDBText13: TppDBText
        UserName = 'rpResumoCobrDBText13'
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
        mmLeft = 112977
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText14: TppDBText
        UserName = 'rpResumoCobrDBText14'
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
      object rpResumoCobrLabel10: TppLabel
        UserName = 'rpResumoCobrLabel10'
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
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpResumoCobrDBText5: TppDBText
        UserName = 'rpResumoCobrDBText5'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppFechaInterfaceAmPrev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppFechaInterfaceAmPrev'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 0
        mmWidth = 47361
        BandType = 4
      end
      object rpResumoCobrDBText6: TppDBText
        UserName = 'rpResumoCobrDBText6'
        DataField = 'VALORTMP'
        DataPipeline = ppFechaInterfaceAmPrev
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFechaInterfaceAmPrev'
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpResumoCobrDBText7: TppDBText
        UserName = 'rpResumoCobrDBText7'
        DataField = 'VALORHST'
        DataPipeline = ppFechaInterfaceAmPrev
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFechaInterfaceAmPrev'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'DIF'
        DataPipeline = ppFechaInterfaceAmPrev
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppFechaInterfaceAmPrev'
        mmHeight = 3704
        mmLeft = 177007
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel119: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 3175
        mmWidth = 189707
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 3175
        mmWidth = 177271
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpResumoCobrGroup2: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = ppFechaInterfaceAmPrev
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpResumoCobrGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFechaInterfaceAmPrev'
      object rpResumoCobrGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResumoCobrGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpResumoCobrGroup1: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppFechaInterfaceAmPrev
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoCobrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFechaInterfaceAmPrev'
      object rpResumoCobrGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object rpResumoCobrLabel2: TppLabel
          UserName = 'rpResumoCobrLabel2'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5027
          mmTop = 15081
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLabel3: TppLabel
          UserName = 'rpResumoCobrLabel3'
          AutoSize = False
          Caption = 'Tot. Recebido Interface'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 111919
          mmTop = 10848
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLabel12: TppLabel
          UserName = 'rpResumoCobrLabel12'
          Caption = 'Plano Previdenciário : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 7144
          mmWidth = 34131
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrDBText15: TppDBText
          UserName = 'rpResumoCobrDBText15'
          AutoSize = True
          DataField = 'NOME_1'
          DataPipeline = ppFechaInterfaceAmPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3969
          mmLeft = 40481
          mmTop = 7144
          mmWidth = 68263
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLine2: TppLine
          UserName = 'rpResumoCobrLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 19050
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLabel1: TppLabel
          UserName = 'rpResumoCobrLabel1'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 1588
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrDBText4: TppDBText
          UserName = 'rpResumoCobrDBText4'
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataPipeline = ppFechaInterfaceAmPrev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3969
          mmLeft = 40481
          mmTop = 1588
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object rpResumoCobrLine5: TppLine
          UserName = 'rpResumoCobrLine5'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          AutoSize = False
          Caption = 'Tot. Recebido AdmPrev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 143669
          mmTop = 10848
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel121: TppLabel
          UserName = 'Label1201'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 174625
          mmTop = 11113
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
      end
      object rpResumoCobrGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpResumoCobrLabel6: TppLabel
          UserName = 'rpResumoCobrLabel6'
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 65881
          mmTop = 1323
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
        object rpResumoCobrLine4: TppLine
          UserName = 'rpResumoCobrLine4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5291
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpResumoCobrLine3: TppLine
          UserName = 'rpResumoCobrLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'rpEsperadoSubTot1'
          AutoSize = True
          DataField = 'VALORTMP'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 106892
          mmTop = 1058
          mmWidth = 26194
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'rpRecebidoSubTot2'
          AutoSize = True
          DataField = 'VALORHST'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 139965
          mmTop = 1058
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          AutoSize = True
          DataField = 'DIF'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 179652
          mmTop = 1058
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpResumoCobrGroup3: TppGroup
      BreakName = 'NOMECONTRIB'
      DataPipeline = ppFechaInterfaceAmPrev
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoCobrGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppFechaInterfaceAmPrev'
      object rpResumoCobrGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResumoCobrGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpResumoCobrLabel7: TppLabel
          UserName = 'rpResumoCobrLabel7'
          Caption = 'SubTotal :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 65617
          mmTop = 529
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object rpEsperadoSubTot: TppDBCalc
          UserName = 'rpEsperadoSubTot'
          AutoSize = True
          DataField = 'VALORTMP'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 106627
          mmTop = 265
          mmWidth = 26194
          BandType = 5
          GroupNo = 2
        end
        object rpRecebidoSubTot: TppDBCalc
          UserName = 'rpRecebidoSubTot'
          AutoSize = True
          DataField = 'VALORHST'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 139436
          mmTop = 265
          mmWidth = 25665
          BandType = 5
          GroupNo = 2
        end
        object rpResumoCobrLine1: TppLine
          UserName = 'rpResumoCobrLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'rpRecebidoSubTot1'
          AutoSize = True
          DataField = 'DIF'
          DataPipeline = ppFechaInterfaceAmPrev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpResumoCobrGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppFechaInterfaceAmPrev'
          mmHeight = 3175
          mmLeft = 179388
          mmTop = 265
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryFechaInterfaceAmPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(A.VALOR,0) VALORTMP , NVL(B.VALOR,0) VALORHST , C.NOM' +
        'E, PL.NOME, '
      #39'2002/03'#39' MESREFERENCIA, '#39'PATRO'#39' NOMEPATRO,'
      'ABS(NVL(A.VALOR,0) - NVL(B.VALOR,0) ) DIF'
      'FROM '
      
        '(SELECT SUM(VALORRECEBIDO) VALOR, IDDESCONTO IDCONTRIBUICAO, IDP' +
        'LANOPREV'
      'FROM TMPDESC '
      'WHERE IDPESSJUR = 2002 AND'
      'MESCOBRANCA = '#39'2002/03'#39
      'GROUP BY IDDESCONTO, IDPLANOPREV) A,'
      '(SELECT SUM(VALORRECEBIDO) VALOR, IDCONTRIBUICAO, IDPLANOPREV'
      'FROM HSTCONTRIBPREV '
      'WHERE IDPESSJUR = 2002 AND'
      'MESCOBRANCA = '#39'2002/03'#39' '
      'GROUP BY IDCONTRIBUICAO, IDPLANOPREV) B,'
      'CONTRIBUICAO C, PLANPREV PL'
      'WHERE A.IDCONTRIBUICAO = B.IDCONTRIBUICAO AND'
      'C.IDCONTRIBUICAO = B.IDCONTRIBUICAO AND'
      'A.IDPLANOPREV = B.IDPLANOPREV AND'
      'PL.IDPLANOPREV = A.IDPLANOPREV'
      'ORDER BY PL.NOME , C.NOME  '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 454
    Top = 163
  end
  object dsFechaInterfaceAmPrev: TwwDataSource
    DataSet = qryFechaInterfaceAmPrev
    Left = 457
    Top = 137
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 542
    Top = 116
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 574
    Top = 111
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
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 557
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsDifInterfaceAdmprev: TwwDataSource
    DataSet = qryDifInterfaceAdmprev
    Left = 537
    Top = 249
  end
  object ppDifInterfaceAdmprev: TppBDEPipeline
    DataSource = dsDifInterfaceAdmprev
    UserName = 'FechaInterfaceAmPrev1'
    Left = 494
    Top = 247
  end
  object qryDifInterfaceAdmprev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT t.IDPESSOA , t.codprovdesc,  t.mesreferencia, '
      'decode(t.flgatrasodevol,'#39'A'#39','#39'Atraso'#39','#39'D'#39','#39'Devolução'#39','#39' '#39'), '
      't.MATRICULA , t.IDDESCONTO, t.VALORRECEBIDO ,'
      #39'PATRO'#39' NOMEPATRO , PL.NOME NOMEPLANO, C.NOME NOMECONTRIB,'
      'p.nome'
      'FROM TMPDESC t , pessoa p ,  PLANPREV PL, CONTRIBUICAO C'
      'WHERE '
      'p.idpessoa = t.idpessoa and'
      't.IDPESSJUR = 2002 AND '
      't.MESCOBRANCA = '#39'2002/03'#39' AND'
      'T.IDDESCONTO = 9 AND '
      'nvl(t.valorrecebido,0) >0 and '
      'nvl(sitenvio,0) >0 and '
      'PL.IDPLANOPREV = T.IDPLANOPREV AND'
      'C.IDCONTRIBUICAO = T.IDDESCONTO AND'
      'not exists (select 1 from hstcontribprev where'
      'idpessjur = 2002 and '
      'mescobranca = '#39'2002/03'#39' and'
      'idpessoa = t.idpessoa and'
      'idcontribuicao = t.iddesconto and'
      'idplanoprev = t.idplanoprev and'
      'mesreferencia = t.mesreferencia  and'
      'mescobranca = t.mescobranca and'
      'valorrecebido = t.valorrecebido)'
      'order by t.idplanoprev,t.iddesconto , t.idpessoa'
      ' ')
    ValidateWithMask = True
    Left = 526
    Top = 291
  end
  object rpDifInterfaceAdmprev: TppReport
    AutoStop = False
    DataPipeline = ppDifInterfaceAdmprev
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 491
    Top = 285
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDifInterfaceAdmprev'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object lblTituloDif: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Diferença Interface x AdmPrev - Mês : Junho / 1998'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 56886
        mmTop = 26458
        mmWidth = 102659
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'rpResumoCobrDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'rpResumoCobrDBText1'
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
      object ppDBText55: TppDBText
        UserName = 'rpResumoCobrDBText2'
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 97367
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'rpResumoCobrDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 69586
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'rpResumoCobrDBText10'
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
        mmLeft = 113242
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'rpResumoCobrDBText11'
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
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'rpResumoCobrDBText12'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 48419
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'rpResumoCobrDBText13'
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
        mmLeft = 112977
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText61: TppDBText
        UserName = 'rpResumoCobrDBText14'
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
      object ppLabel123: TppLabel
        UserName = 'rpResumoCobrLabel10'
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
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText64: TppDBText
        UserName = 'rpResumoCobrDBText7'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppDifInterfaceAdmprev
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText1'
        DataField = 'DECODE(T.FLGATRASODEVOL,'#39'A'#39','#39'AT'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3175
        mmLeft = 136790
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'MATRICULA'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3175
        mmLeft = 23813
        mmTop = 0
        mmWidth = 79375
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3175
        mmLeft = 116152
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = 'CODPROVDESC'
        DataPipeline = ppDifInterfaceAdmprev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDifInterfaceAdmprev'
        mmHeight = 3175
        mmLeft = 159809
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = 'AdmPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 3175
        mmWidth = 189707
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 3175
        mmWidth = 177271
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup25: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = ppDifInterfaceAdmprev
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpResumoCobrGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDifInterfaceAdmprev'
      object ppGroupHeaderBand25: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand25: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup26: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppDifInterfaceAdmprev
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoCobrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDifInterfaceAdmprev'
      object ppGroupHeaderBand26: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15875
        mmPrintPosition = 0
        object ppLabel127: TppLabel
          UserName = 'rpResumoCobrLabel12'
          Caption = 'Plano Previdenciário : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 7144
          mmWidth = 35719
          BandType = 3
          GroupNo = 1
        end
        object ppDBText66: TppDBText
          UserName = 'rpResumoCobrDBText15'
          AutoSize = True
          DataField = 'NOMEPLANO'
          DataPipeline = ppDifInterfaceAdmprev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDifInterfaceAdmprev'
          mmHeight = 3969
          mmLeft = 40481
          mmTop = 7144
          mmWidth = 60590
          BandType = 3
          GroupNo = 1
        end
        object ppLine37: TppLine
          UserName = 'rpResumoCobrLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 14023
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel128: TppLabel
          UserName = 'rpResumoCobrLabel1'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 1588
          mmWidth = 24342
          BandType = 3
          GroupNo = 1
        end
        object ppDBText67: TppDBText
          UserName = 'rpResumoCobrDBText4'
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataPipeline = ppDifInterfaceAdmprev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDifInterfaceAdmprev'
          mmHeight = 3969
          mmLeft = 40481
          mmTop = 1588
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLine38: TppLine
          UserName = 'rpResumoCobrLine5'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand26: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel131: TppLabel
          UserName = 'rpResumoCobrLabel6'
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 138907
          mmTop = 1323
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
        object ppLine42: TppLine
          UserName = 'rpResumoCobrLine4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5291
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLine43: TppLine
          UserName = 'rpResumoCobrLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc23'
          AutoSize = True
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppDifInterfaceAdmprev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup26
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDifInterfaceAdmprev'
          mmHeight = 3175
          mmLeft = 154782
          mmTop = 1058
          mmWidth = 34660
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup27: TppGroup
      BreakName = 'NOMECONTRIB'
      DataPipeline = ppDifInterfaceAdmprev
      OutlineSettings.CreateNode = True
      UserName = 'rpResumoCobrGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDifInterfaceAdmprev'
      object ppGroupHeaderBand27: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppDBText62: TppDBText
          UserName = 'rpResumoCobrDBText5'
          AutoSize = True
          DataField = 'NOMECONTRIB'
          DataPipeline = ppDifInterfaceAdmprev
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppDifInterfaceAdmprev'
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 529
          mmWidth = 80963
          BandType = 3
          GroupNo = 2
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 160338
          mmTop = 5556
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel129: TppLabel
          UserName = 'Label129'
          Caption = 'Matrícula  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 5292
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object ppLabel130: TppLabel
          UserName = 'Label130'
          Caption = 'Vl. Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 172509
          mmTop = 5556
          mmWidth = 16669
          BandType = 3
          GroupNo = 2
        end
        object ppLabel125: TppLabel
          UserName = 'Label1'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23548
          mmTop = 5292
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object ppLabel133: TppLabel
          UserName = 'Label133'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 115623
          mmTop = 5292
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel134: TppLabel
          UserName = 'Label134'
          AutoSize = False
          Caption = 'Atraso / Devolução'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 136261
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand27: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel132: TppLabel
          UserName = 'rpResumoCobrLabel7'
          Caption = 'SubTotal :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 138642
          mmTop = 529
          mmWidth = 13758
          BandType = 5
          GroupNo = 2
        end
        object ppLine44: TppLine
          UserName = 'rpResumoCobrLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'rpRecebidoSubTot1'
          AutoSize = True
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppDifInterfaceAdmprev
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup27
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDifInterfaceAdmprev'
          mmHeight = 3175
          mmLeft = 154517
          mmTop = 529
          mmWidth = 34660
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryParcelamento: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSOA,  PP.IDPESSOA AS IDTITULAR, PP.IDPESSJUR,    ' +
        '     PP.IDPLANOPREV, PP.SEQPROPOSTA,'
      '       P.NOME,       P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC,  PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA' +
        ','
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      
        '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,  PP' +
        '.SALMANTIDO,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO,'
      
        '       PT.IDRUBSALMANUT, PT.IDRUBSALMANUTPARC, PT.IDRUBSALPARTIC' +
        'IP,'
      '       PP.SALPARTICIPACAO , PL.IDREGRAVLRDIVIDA,'
      '       PL.IDREGRASDODEVEDOR ,   PL.IDREGRASALPARCELA,'
      
        '       PL.IDREGRAOPPARCELAS ,  PL.IDREGRAAMORTIZA, TO_NUMBER( :V' +
        'ALORDIVIDA) VALORDIVIDA'
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO,'
      '       PATRO PT'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = pp.IDPESSOA'
      'AND    EL.IDPESSJUR   = pp.IDPESSJUR'
      'AND    P.IDPESSOA     = pp.IDPESSOA'
      'AND    PP.IDPESSJUR   = PT.IDPESSOA'
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 689
    Top = 220
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORDIVIDA'
        ParamType = ptUnknown
        Value = '1000'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1123446'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '66'
      end>
    object qryParcelamentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryParcelamentoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryParcelamentoIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryParcelamentoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryParcelamentoSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryParcelamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryParcelamentoNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryParcelamentoNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryParcelamentoDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryParcelamentoDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryParcelamentoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryParcelamentoDATAADMISSAO: TDateTimeField
      FieldName = 'DATAADMISSAO'
    end
    object qryParcelamentoDATADEMISSAO: TDateTimeField
      FieldName = 'DATADEMISSAO'
    end
    object qryParcelamentoTEMPOSERVANTERIOR: TFloatField
      FieldName = 'TEMPOSERVANTERIOR'
    end
    object qryParcelamentoTEMPONAOCREDITADO: TFloatField
      FieldName = 'TEMPONAOCREDITADO'
    end
    object qryParcelamentoTEMPOSITESPECIAL: TFloatField
      FieldName = 'TEMPOSITESPECIAL'
    end
    object qryParcelamentoNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 15
    end
    object qryParcelamentoIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
    end
    object qryParcelamentoTEMPOSERVTOTAL: TFloatField
      FieldName = 'TEMPOSERVTOTAL'
    end
    object qryParcelamentoTEMPOSERVTOTMES: TFloatField
      FieldName = 'TEMPOSERVTOTMES'
    end
    object qryParcelamentoTEMPOSERVTOTDIA: TFloatField
      FieldName = 'TEMPOSERVTOTDIA'
    end
    object qryParcelamentoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryParcelamentoINSCRICAODATA: TDateTimeField
      FieldName = 'INSCRICAODATA'
    end
    object qryParcelamentoFLGDEVEEMPRESTIMO: TFloatField
      FieldName = 'FLGDEVEEMPRESTIMO'
    end
    object qryParcelamentoFLGDEVEASSISTENC: TFloatField
      FieldName = 'FLGDEVEASSISTENC'
    end
    object qryParcelamentoFLGDEVEPREVIDENC: TFloatField
      FieldName = 'FLGDEVEPREVIDENC'
    end
    object qryParcelamentoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryParcelamentoIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
    end
    object qryParcelamentoSALMANTIDO: TFloatField
      FieldName = 'SALMANTIDO'
    end
    object qryParcelamentoNOMESITPART: TStringField
      FieldName = 'NOMESITPART'
      Size = 50
    end
    object qryParcelamentoNOMESITFUNC: TStringField
      FieldName = 'NOMESITFUNC'
      Size = 60
    end
    object qryParcelamentoNOMESITPLANO: TStringField
      FieldName = 'NOMESITPLANO'
      Size = 50
    end
    object qryParcelamentoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryParcelamentoIDRUBSALMANUT: TFloatField
      FieldName = 'IDRUBSALMANUT'
    end
    object qryParcelamentoIDRUBSALMANUTPARC: TFloatField
      FieldName = 'IDRUBSALMANUTPARC'
    end
    object qryParcelamentoIDRUBSALPARTICIP: TFloatField
      FieldName = 'IDRUBSALPARTICIP'
    end
    object qryParcelamentoSALPARTICIPACAO: TFloatField
      FieldName = 'SALPARTICIPACAO'
    end
    object qryParcelamentoIDREGRAVLRDIVIDA: TFloatField
      FieldName = 'IDREGRAVLRDIVIDA'
    end
    object qryParcelamentoIDREGRASDODEVEDOR: TFloatField
      FieldName = 'IDREGRASDODEVEDOR'
    end
    object qryParcelamentoIDREGRASALPARCELA: TFloatField
      FieldName = 'IDREGRASALPARCELA'
    end
    object qryParcelamentoIDREGRAOPPARCELAS: TFloatField
      FieldName = 'IDREGRAOPPARCELAS'
    end
    object qryParcelamentoIDREGRAAMORTIZA: TFloatField
      FieldName = 'IDREGRAAMORTIZA'
    end
    object qryParcelamentoVALORDIVIDA: TFloatField
      FieldName = 'VALORDIVIDA'
      currency = True
    end
  end
  object dsParcelamento: TwwDataSource
    DataSet = qryParcelamento
    Left = 689
    Top = 263
  end
  object ppParcelamento: TppBDEPipeline
    DataSource = dsParcelamento
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'parcelamento'
    Left = 689
    Top = 313
  end
  object rpParcelamento: TppReport
    AutoStop = False
    DataPipeline = ppParcelamento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    BeforePrint = rpParcelamentoBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 692
    Top = 358
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppParcelamento'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppDBText71: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmTop = 1058
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText95: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText96: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBImage8: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'rpTotalizadorDBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText99: TppDBText
        UserName = 'rpTotalizadorDBText5'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 'Opções de Parcelamento de Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 29633
        mmWidth = 195527
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 36248
        mmWidth = 197909
        BandType = 0
      end
    end
    object ppDetCritCadAnalitico: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 90488
      mmPrintPosition = 0
      object ppLabel135: TppLabel
        UserName = 'Label135'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 1852
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel137: TppLabel
        UserName = 'Label137'
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 10319
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'NOME'
        DataPipeline = ppParcelamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppParcelamento'
        mmHeight = 4233
        mmLeft = 18521
        mmTop = 1852
        mmWidth = 94456
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'MATRICULA'
        DataPipeline = ppParcelamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppParcelamento'
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 10319
        mmWidth = 24871
        BandType = 4
      end
      object ppLabel138: TppLabel
        UserName = 'Label138'
        Caption = 'Valor de débito a ser parcelado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 32279
        mmWidth = 53975
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'VALORDIVIDA'
        DataPipeline = ppParcelamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppParcelamento'
        mmHeight = 4233
        mmLeft = 59267
        mmTop = 32279
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel139: TppLabel
        UserName = 'Label139'
        Caption = 'Opções de Parcelamento a Prazo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 14288
        mmTop = 42863
        mmWidth = 57150
        BandType = 4
      end
      object rchopcoes: TppMemo
        UserName = 'rchopcoes'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 12
        Font.Style = [fsBold]
        Stretch = True
        Transparent = True
        mmHeight = 38365
        mmLeft = 14288
        mmTop = 50271
        mmWidth = 169598
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 17463
        mmWidth = 197909
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6561
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
        UserName = 'Calc9'
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
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel136: TppLabel
        UserName = 'ppLabel25'
        AutoSize = False
        Caption = 'AdmPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLine45: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
  end
  object ppReportMov: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportMov'
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
    BeforePrint = ppReportMovBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 129
    Top = 9
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand15: TppHeaderBand
      AfterPrint = ppHeaderBand1AfterPrint
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLine48: TppLine
        UserName = 'ppLine1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 14288
        mmWidth = 281253
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Extrato de Movimentação de Reservas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 101336
        mmTop = 7938
        mmWidth = 77523
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 130704
        mmTop = 794
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'ppReportMovPartLabel4'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 9525
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 227013
        mmTop = 9525
        mmWidth = 54769
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText76: TppDBText
        UserName = 'ppDBText1'
        DataField = 'MESREFERENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText2'
        DataField = 'FLGENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText78: TppDBText
        OnPrint = ppValorCotasPrint
        UserName = 'ppDBText4'
        DataField = 'VLRCOTASCALC'
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText79: TppDBText
        OnPrint = ppDBText5Print
        UserName = 'ppDBText5'
        DataField = 'VLRREALCALC'
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223573
        mmTop = 265
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'ppReportMovPartDBText7'
        DataField = 'SALDOREAL'
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252678
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'ppReportMovPartDBText8'
        DataField = 'GERADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 265
        mmWidth = 73819
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'ppReportMovPartDBText6'
        DataField = 'SALDOCOTAS'
        DisplayFormat = '#0.000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'ppReportMovPartDBText17'
        DataField = 'VALORINDICE'
        DisplayFormat = '#0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'ppReportMovPartDBText19'
        DataField = 'DATAALIMENTACAO'
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 186532
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel144: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 41275
        BandType = 8
      end
      object ppLine49: TppLine
        UserName = 'ppLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1852
        mmTop = 265
        mmWidth = 279401
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 1323
        mmWidth = 12965
        BandType = 8
      end
    end
    object ppGroup29: TppGroup
      BreakName = 'ppDBText88'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand29: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel148: TppLabel
          UserName = 'ppLabel6'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 529
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText88: TppDBText
          UserName = 'ppDBText11'
          DataField = 'PESSJUR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 529
          mmWidth = 89165
          BandType = 3
          GroupNo = 0
        end
        object ppLabel149: TppLabel
          UserName = 'ppReportMovPartLabel8'
          Caption = 'Regional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 125148
          mmTop = 265
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppDBText89: TppDBText
          UserName = 'ppReportMovPartDBText18'
          DataField = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 141023
          mmTop = 265
          mmWidth = 106892
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand29: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup30: TppGroup
      BreakName = 'ppDBText90'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand30: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel150: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 529
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object ppDBText90: TppDBText
          UserName = 'ppDBText10'
          DataField = 'PLANPREV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 529
          mmWidth = 89694
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand30: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup31: TppGroup
      BreakName = 'ppDBText91'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand31: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19050
        mmPrintPosition = 0
        object ppLabel151: TppLabel
          UserName = 'ppLabel7'
          Caption = 'Reserva '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 265
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppDBText91: TppDBText
          UserName = 'ppDBText12'
          DataField = 'RESERVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 20108
          mmTop = 265
          mmWidth = 91017
          BandType = 3
          GroupNo = 2
        end
        object ppLabel152: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object ppLabel153: TppLabel
          UserName = 'ppLabel9'
          Caption = 'Entrada   / Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 21167
          mmTop = 5292
          mmWidth = 12435
          BandType = 3
          GroupNo = 2
        end
        object ppLabel154: TppLabel
          UserName = 'ppLabel10'
          AutoSize = False
          Caption = 'Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 35719
          mmTop = 5292
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel155: TppLabel
          UserName = 'ppLabel11'
          AutoSize = False
          Caption = 'Movimentação [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 8202
          mmLeft = 230982
          mmTop = 5556
          mmWidth = 23813
          BandType = 3
          GroupNo = 2
        end
        object ppLabel156: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Movimentação [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 115359
          mmTop = 5292
          mmWidth = 22490
          BandType = 3
          GroupNo = 2
        end
        object ppLabel157: TppLabel
          UserName = 'ppLabel15'
          Caption = 'Saldo  [Cotas]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 168275
          mmTop = 5556
          mmWidth = 11113
          BandType = 3
          GroupNo = 3
        end
        object ppLabel158: TppLabel
          UserName = 'ppLabel16'
          Caption = 'Saldo  [Moeda]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 259557
          mmTop = 5821
          mmWidth = 12435
          BandType = 3
          GroupNo = 3
        end
        object ppDBText92: TppDBText
          UserName = 'cotasantrealPart'
          DataField = 'VLRREALANT'
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 200555
          mmTop = 15081
          mmWidth = 30692
          BandType = 3
          GroupNo = 3
        end
        object ppLabel159: TppLabel
          UserName = 'ppLabel14'
          Caption = 'Saldo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3969
          mmLeft = 87313
          mmTop = 4763
          mmWidth = 21696
          BandType = 3
          GroupNo = 3
        end
        object ppDBText93: TppDBText
          UserName = 'cotasantPart'
          DataField = 'VLRCOTASANT'
          DisplayFormat = '#0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 83609
          mmTop = 14817
          mmWidth = 28575
          BandType = 3
          GroupNo = 3
        end
        object ppDBText97: TppDBText
          UserName = 'ppReportMovPartDBText11'
          DataField = 'MOESIGLA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 89959
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
        object ppDBText101: TppDBText
          UserName = 'ppReportMovPartDBText12'
          DataField = 'SIGLAEMP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 208492
          mmTop = 9525
          mmWidth = 17198
          BandType = 3
          GroupNo = 3
        end
        object ppLabel160: TppLabel
          UserName = 'ppReportMovPartLabel5'
          Caption = 'Valor da [Cota]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 9260
          mmLeft = 146050
          mmTop = 5292
          mmWidth = 14023
          BandType = 3
          GroupNo = 3
        end
        object ppLabel161: TppLabel
          UserName = 'ppReportMovPartLabel9'
          Caption = 'Data da [Cota]'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7673
          mmLeft = 187061
          mmTop = 5027
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel162: TppLabel
          UserName = 'ppReportMovPartLabel6'
          Caption = 'Saldo Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3969
          mmLeft = 206111
          mmTop = 5292
          mmWidth = 21696
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand31: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine50: TppLine
          UserName = 'ppReportMovPartLine1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 113506
          mmTop = 0
          mmWidth = 168540
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 37
    Top = 39
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qryCotacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA,COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :iIdMoeda AND'
      '               COTDATA IN'
      '              (SELECT MAX(COTDATA) FROM COTACAOMOEDA'
      '               WHERE MOECODIGO = :iIdMoeda)')
    ValidateWithMask = True
    Left = 344
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end>
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA,COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :iIdMoeda AND'
      '               COTDATA IN'
      '              (SELECT MAX(COTDATA) FROM COTACAOMOEDA'
      '               WHERE MOECODIGO = :iIdMoeda)')
    ValidateWithMask = True
    Left = 304
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'iIdMoeda'
        ParamType = ptUnknown
      end>
  end
end
