inherited dtmRelatoriosClaudio: TdtmRelatoriosClaudio
  Left = 320
  Top = 172
  Width = 389
  Height = 322
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 37
    Top = 42
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
    Left = 37
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 37
  end
  inherited rpExemplo: TppReport
    Left = 37
    Top = 0
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 20638
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmWidth = 31750
      end
      inherited Line1: TppLine
        mmTop = 19579
      end
      inherited LblEmpresa: TppLabel
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmWidth = 24342
      end
      object ppLCarteiraEx: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
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
        mmWidth = 10848
        BandType = 0
      end
      object ppDbLogo: TppDBImage
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
    end
  end
  object PpParticEmp: TppReport
    AutoStop = False
    DataPipeline = bdeParticEmp
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 37
    Top = 103
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeParticEmp'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Enquadramento por Participação nas Empresas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 93927
        mmTop = 11113
        mmWidth = 96838
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel17'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 125413
        mmTop = 3969
        mmWidth = 29633
        BandType = 0
      end
      object PpParticEmpLabel1: TppLabel
        UserName = 'PpParticEmpLabel1'
        Caption = 'Empresas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 26723
        mmWidth = 16140
        BandType = 0
      end
      object PpParticEmpLabel2: TppLabel
        UserName = 'PpParticEmpLabel2'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 26723
        mmWidth = 13494
        BandType = 0
      end
      object PpParticEmpLabel3: TppLabel
        UserName = 'PpParticEmpLabel3'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 47096
        mmTop = 26723
        mmWidth = 8467
        BandType = 0
      end
      object PpParticEmpLabel4: TppLabel
        UserName = 'PpParticEmpLabel4'
        Caption = 'Qtde. Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113506
        mmTop = 26723
        mmWidth = 20108
        BandType = 0
      end
      object PpParticEmpLabel5: TppLabel
        UserName = 'PpParticEmpLabel5'
        Caption = '% Partic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 141552
        mmTop = 26723
        mmWidth = 13494
        BandType = 0
      end
      object PpParticEmpLabel6: TppLabel
        UserName = 'PpParticEmpLabel6'
        Caption = 'Acima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 26723
        mmWidth = 10583
        BandType = 0
      end
      object PpParticEmpLabel8: TppLabel
        UserName = 'PpParticEmpLabel8'
        Caption = 'Limite de Enquadramento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 20638
        mmWidth = 44715
        BandType = 0
      end
      object PpParticEmpDBText6: TppDBText
        UserName = 'PpParticEmpDBText6'
        AutoSize = True
        DataField = 'PERCPARTICEMPR'
        DataPipeline = bdeParticEmp
        DisplayFormat = '#,0.00 %;-#,0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 4233
        mmLeft = 44186
        mmTop = 20638
        mmWidth = 32808
        BandType = 0
      end
      object LblDataEnq: TppLabel
        UserName = 'LblDataEnq'
        Caption = 'LblDataEnq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 14552
        mmWidth = 14288
        BandType = 0
      end
      object PpParticEmpLabel11: TppLabel
        UserName = 'PpParticEmpLabel11'
        Caption = 'Limite de Recursos Garantidores:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 188913
        mmTop = 20902
        mmWidth = 55827
        BandType = 0
      end
      object PpParticEmpDBText7: TppDBText
        UserName = 'PpParticEmpDBText7'
        AutoSize = True
        DataField = 'PERCPARTICRECUR'
        DataPipeline = bdeParticEmp
        DisplayFormat = '#,0.00 %;-#,0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 4233
        mmLeft = 242888
        mmTop = 20902
        mmWidth = 35190
        BandType = 0
      end
      object PpParticEmpLabel12: TppLabel
        UserName = 'PpParticEmpLabel12'
        Caption = 'Valor Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 188913
        mmTop = 26723
        mmWidth = 24606
        BandType = 0
      end
      object PpParticEmpLabel13: TppLabel
        UserName = 'PpParticEmpLabel13'
        Caption = '% Partic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 219869
        mmTop = 26723
        mmWidth = 13494
        BandType = 0
      end
      object a: TppLabel
        UserName = 'a'
        Caption = 'Acima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 239184
        mmTop = 26723
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      BeforePrint = ppDetailBand7BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object PpParticEmpDBText3: TppDBText
        UserName = 'PpParticEmpDBText3'
        AutoSize = True
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeParticEmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 3175
        mmLeft = 47361
        mmTop = 265
        mmWidth = 29104
        BandType = 4
      end
      object PpParticEmpDBText5: TppDBText
        UserName = 'PpParticEmpDBText5'
        AutoSize = True
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeParticEmp
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeParticEmp'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 265
        mmWidth = 29898
        BandType = 4
      end
      object lblAcima: TppLabel
        UserName = 'lblAcima'
        Caption = 'lblAcima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 265
        mmWidth = 10319
        BandType = 4
      end
      object lblPerc: TppLabel
        UserName = 'lblPerc'
        Caption = 'lblPerc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 140759
        mmTop = 265
        mmWidth = 8467
        BandType = 4
      end
      object PpParticEmpLabel9: TppLabel
        OnPrint = PpParticEmpLabel9Print
        UserName = 'PpParticEmpLabel9'
        Caption = 'PpParticEmpLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object LblPERCRECUR: TppLabel
        OnPrint = LblPERCRECURPrint
        UserName = 'LblPERCRECUR'
        Caption = 'LblPERCRECUR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object LblAcima2: TppLabel
        UserName = 'LblAcima2'
        Caption = 'LblAcima2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 238390
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object LblVlrMerc: TppLabel
        UserName = 'LblVlrMerc'
        Caption = 'LblVlrMerc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 200290
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel18: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel18'
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
        mmTop = 6085
        mmWidth = 274109
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
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
        mmTop = 12965
        mmWidth = 273580
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247386
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object PpParticEmpGroup3: TppGroup
      BreakName = 'NOME'
      DataPipeline = bdeParticEmp
      OutlineSettings.CreateNode = True
      UserName = 'PpParticEmpGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeParticEmp'
      object PpParticEmpGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object PpParticEmpDBText1: TppDBText
          UserName = 'PpParticEmpDBText1'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = bdeParticEmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3440
          mmLeft = 794
          mmTop = 2117
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpDBText4: TppDBText
          UserName = 'PpParticEmpDBText4'
          AutoSize = True
          DataField = 'TOTACAO'
          DataPipeline = bdeParticEmp
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 2117
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine1: TppLine
          UserName = 'PpParticEmpLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine2: TppLine
          UserName = 'PpParticEmpLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object PpParticEmpLine3: TppLine
          UserName = 'PpParticEmpLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object PpParticEmpGroupFooterBand3: TppGroupFooterBand
        BeforePrint = PpParticEmpGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object PpParticEmpDBCalc1: TppDBCalc
          UserName = 'PpParticEmpDBCalc1'
          AutoSize = True
          DataField = 'SALDOQTDEINVCART'
          DataPipeline = bdeParticEmp
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = PpParticEmpGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3175
          mmLeft = 93398
          mmTop = 1323
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object PpParticEmpLabel7: TppLabel
          UserName = 'PpParticEmpLabel7'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25665
          mmTop = 1058
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object PpParticEmpLine4: TppLine
          UserName = 'PpParticEmpLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object PpParticEmpLabel10: TppLabel
          OnPrint = PpParticEmpLabel10Print
          UserName = 'PpParticEmpLabel10'
          Caption = 'PpParticEmpLabel10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 129646
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object LblTotValMer: TppLabel
          UserName = 'LblTotValMer'
          Caption = 'LblTotValMer'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 197380
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object LbPercPatric: TppLabel
          OnPrint = LbPercPatricPrint
          UserName = 'LbPercPatric'
          Caption = 'LbPercPatric'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 217488
          mmTop = 1323
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object PpParticEmpGroup4: TppGroup
      BreakName = 'IDCARTEIRAINVEST'
      DataPipeline = bdeParticEmp
      OutlineSettings.CreateNode = True
      UserName = 'PpParticEmpGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeParticEmp'
      object PpParticEmpGroupHeaderBand4: TppGroupHeaderBand
        BeforePrint = PpParticEmpGroupHeaderBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object PpParticEmpDBText2: TppDBText
          UserName = 'PpParticEmpDBText2'
          AutoSize = True
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeParticEmp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeParticEmp'
          mmHeight = 3175
          mmLeft = 25665
          mmTop = 265
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
      end
      object PpParticEmpGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeParticEmp: TppBDEPipeline
    DataSource = dtsParticEmp
    UserName = 'bdeParticEmp'
    Left = 255
    Top = 103
  end
  object dtsParticEmp: TwwDataSource
    DataSet = qryParticEmp
    Left = 183
    Top = 103
  end
  object qryParticEmp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT H.SALDOQTDEINVCART, H.DATAMOVCARTINV,  I.DESCINV' +
        'ESTIMENTO,'
      
        '                SL.TOT,             PI.PERCPARTICEMPR, P.NOME, H' +
        '.IDHISTCARTINV,'
      
        '                C.DESCCARTINVEST,   SL.IDEMISSOR,      PI.PERCPA' +
        'RTICRECUR,'
      
        #9'             H.IDCARTEIRAINVEST, H.IDINVESTIMENTO,  (0) AS TOTA' +
        'CAO,'
      '             '#9' (0) AS COTACAO, (0) AS QTDTITLOTE'
      ''
      
        'FROM PESSOA P, HISTCARTINV H, CARTEIRAINVEST C, ACAO A, TIPOACAO' +
        ' TA, INVESTIMENTO I,'
      
        '     (SELECT PERCPARTICEMPR,  PERCPARTICRECUR  FROM PARAMINVEST)' +
        ' PI,'
      '     (SELECT  SUM(PE.VLRPARAMEMISSOR) AS TOT, PE.IDEMISSOR'
      #9'   FROM  VALPARAMXEMISSOR PE, PESSOA P'
      #9'   WHERE P.IDPESSOA=IDEMISSOR AND'
      
        #9'         IDPARAMEMISSOR IN (SELECT IDPARAMEMISSOR FROM TIPOACAO' +
        ')'
      #9'   GROUP BY PE.IDEMISSOR) SL'
      ''
      'WHERE (I.IDINVESTIMENTO  = H.IDINVESTIMENTO   AND'
      '       P.IDPESSOA        = I.IDEMISSOR        AND'
      #9'    C.IDCARTEIRAINVEST= H.IDCARTEIRAINVEST AND'
      #9'    A.IDACAO          = H.IDINVESTIMENTO   AND'
      #9'    TA.CODTIPOACAO    = A.CODTIPOACAO      AND'
      #9'    I.IDEMISSOR       = SL.IDEMISSOR(+))   AND'
      ''
      '       IDHISTCARTINV = (SELECT MAX(IDHISTCARTINV)'
      '                        FROM HISTCARTINV H3'
      
        '                        WHERE H3.DATAMOVCARTINV=H.DATAMOVCARTINV' +
        '     AND'
      
        '                              H3.IDCARTEIRAINVEST=H.IDCARTEIRAIN' +
        'VEST AND'
      
        '                              H3.IDINVESTIMENTO=H.IDINVESTIMENTO' +
        ')    AND'
      ''
      '       DATAMOVCARTINV = (SELECT MAX(DATAMOVCARTINV)'
      '                         FROM HISTCARTINV H2'
      
        '                         WHERE H2.IDCARTEIRAINVEST=H.IDCARTEIRAI' +
        'NVEST AND'
      
        '                               H2.IDINVESTIMENTO=H.IDINVESTIMENT' +
        'O)'
      ''
      
        'GROUP BY P.NOME, H.IDHISTCARTINV, C.DESCCARTINVEST,   SL.TOT, SL' +
        '.IDEMISSOR,'
      
        #9'      H.IDCARTEIRAINVEST,      H.IDINVESTIMENTO,   I.DESCINVEST' +
        'IMENTO,'
      
        #9'      PI.PERCPARTICEMPR,       PI.PERCPARTICRECUR, H.SALDOQTDEI' +
        'NVCART,'
      '         H.DATAMOVCARTINV'
      '')
    UpdateObject = UpdtParticEmp
    ValidateWithMask = True
    Left = 111
    Top = 103
    object qryParticEmpSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryParticEmpDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryParticEmpTOT: TFloatField
      FieldName = 'TOT'
    end
    object qryParticEmpPERCPARTICEMPR: TFloatField
      FieldName = 'PERCPARTICEMPR'
    end
    object qryParticEmpNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryParticEmpDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryParticEmpDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryParticEmpIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryParticEmpIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryParticEmpIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryParticEmpTOTACAO: TFloatField
      FieldName = 'TOTACAO'
    end
    object qryParticEmpIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryParticEmpPERCPARTICRECUR: TFloatField
      FieldName = 'PERCPARTICRECUR'
    end
    object qryParticEmpCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qryParticEmpQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
  end
  object UpdtParticEmp: TUpdateSQL
    ModifySQL.Strings = (
      'update HistCartInv'
      'set'
      '  TOTACAO = :TOTACAO'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      'insert into HistCartInv'
      '  (TOTACAO)'
      'values'
      '  (:TOTACAO)')
    DeleteSQL.Strings = (
      'delete from HistCartInv'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 319
    Top = 103
  end
  object ppBdeTipoOper: TppBDEPipeline
    DataSource = DsTipoOper
    UserName = 'BdeTipoOper'
    Left = 255
    Top = 162
    object ppBdeTipoOperppField1: TppField
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField2: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField3: TppField
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField4: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField5: TppField
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField6: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField7: TppField
      FieldAlias = 'TOTVALOPERACAO'
      FieldName = 'TOTVALOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField8: TppField
      FieldAlias = 'TOTQTDOPERACAO'
      FieldName = 'TOTQTDOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField9: TppField
      FieldAlias = 'PRECOUNIT'
      FieldName = 'PRECOUNIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField10: TppField
      FieldAlias = 'PRECOUNITXLOTE'
      FieldName = 'PRECOUNITXLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField11: TppField
      FieldAlias = 'TOTALLIQUIDO'
      FieldName = 'TOTALLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField12: TppField
      FieldAlias = 'PRECOUNITXLOTELIQ'
      FieldName = 'PRECOUNITXLOTELIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField13: TppField
      FieldAlias = 'LOTEBASE'
      FieldName = 'LOTEBASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField14: TppField
      FieldAlias = 'TOTIR'
      FieldName = 'TOTIR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField15: TppField
      FieldAlias = 'TOTREMUNER'
      FieldName = 'TOTREMUNER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBdeTipoOperppField16: TppField
      FieldAlias = 'TOTDESPESA'
      FieldName = 'TOTDESPESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object DsTipoOper: TwwDataSource
    DataSet = QryTotTipoOper
    Left = 183
    Top = 162
  end
  object QryTotTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDCARTEIRAINVEST, CA.DESCCARTINVEST, OP.IDTIPOOPERACAO' +
        ', TP.DESCTIPOOPERACAO,'
      '       OP.IDINVESTIMENTO, I.DESCINVESTIMENTO,'
      
        '       SUM(OP.VLROPERACAO + NVL(OP.VLRREMUNERACAO,0)) - DECODE(O' +
        'P.IDTIPOOPERACAO,-96,SUM(OP.VLROPERACAO),0) AS TOTVALOPERACAO,'
      '       SUM(OP.QTDEOPERACAO) AS TOTQTDOPERACAO,'
      
        '       SUM(ABS(NVL(OP.VLRIR,0)) + ABS(NVL(OP.VLRIRREMUNER,0))) A' +
        'S TOTIR,'
      '       SUM(NVL(OP.VLRREMUNERACAO,0)) AS TOTREMUNER,'
      '       SUM(NVL(TOTDESPOPER.TOTDESPESAS,0)) AS TOTDESPESA,'
      
        '       ROUND((SUM(OP.VLROPERACAO)/DECODE(SUM(OP.QTDEOPERACAO),0,' +
        '1,SUM(OP.QTDEOPERACAO))),9) AS PRECOUNIT,'
      
        '       ROUND(( (SUM(OP.VLROPERACAO)/DECODE(SUM(OP.QTDEOPERACAO),' +
        '0,1,SUM(OP.QTDEOPERACAO))) * CT.QTDTITLOTE),9) AS PRECOUNITXLOTE' +
        ','
      
        '       ROUND((((DECODE(TP.NATUREZAOPERACAO,'#39'A'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'V'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'U'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'M'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'D'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'S'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'O'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'R'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                           '#39'I'#39', (SUM(OP.VLROPERA' +
        'CAO + NVL(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRR' +
        'EMUNER,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                                (SUM(OP.VLROPERA' +
        'CAO - NVL(OP.VLRIR,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0))) -' +
        ' DECODE(OP.IDTIPOOPERACAO,-96,SUM(OP.VLROPERACAO),0)) * CT.QTDTI' +
        'TLOTE) / DECODE(SUM(OP.QTDEOPERACAO),0,1,SUM(OP.QTDEOPERACAO))),' +
        '9) AS PRECOUNITXLOTELIQ,'
      
        '       DECODE(TP.NATUREZAOPERACAO,'#39'A'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'V'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'U'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'M'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') + NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'D'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'S'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'O'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'R'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                  '#39'I'#39', (SUM(OP.VLROPERACAO + NVL' +
        '(OP.VLRREMUNERACAO,0) - NVL(OP.VLRIR,0) - NVL(OP.VLRIRREMUNER,0)' +
        ') - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0)),'
      
        '                                       (SUM(OP.VLROPERACAO - NVL' +
        '(OP.VLRIR,0)) - NVL(SUM(TOTDESPOPER.TOTDESPESAS),0))) - DECODE(O' +
        'P.IDTIPOOPERACAO,-96,SUM(OP.VLROPERACAO),0) AS TOTALLIQUIDO,'
      '       CT.QTDTITLOTE AS LOTEBASE'
      ''
      
        'FROM OPERACAOINVEST OP, TIPOOPERACAO TP, INVESTIMENTO I, CARTEIR' +
        'AINVEST CA,'
      
        '     (SELECT D.IDOPERACAOINVEST, SUM(D.VLRDESPOPER) AS TOTDESPES' +
        'AS'
      '      FROM DESPOPERINVEST D'
      '      GROUP BY D.IDOPERACAOINVEST) TOTDESPOPER, COTACAOINVEST CT'
      'WHERE OP.IDTIPOINVEST     = 2'
      '  AND OP.IDCARTEIRAGERENC IS NULL'
      '  AND OP.ORIGDEST NOT IN ('#39'O'#39')'
      '  AND OP.IDTIPOOPERACAO NOT IN (-159,-10159)'
      '  AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '                              TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (:IDCARTEIRAINVEST = OP.ID' +
        'CARTEIRAINVEST))'
      
        '  AND ((:IDTIPOOPERACAO   IS NULL) OR (:IDTIPOOPERACAO   = OP.ID' +
        'TIPOOPERACAO))'
      '  AND OP.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO'
      '  AND OP.IDINVESTIMENTO   = I.IDINVESTIMENTO'
      '  AND OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST'
      '  AND OP.IDOPERACAOINVEST = TOTDESPOPER.IDOPERACAOINVEST(+)'
      '  AND CT.DATACOTACAO      = (SELECT MAX(C.DATACOTACAO)'
      '                             FROM COTACAOINVEST C'
      
        '                             WHERE C.IDINVESTIMENTO = OP.IDINVES' +
        'TIMENTO'
      
        '                               AND C.DATACOTACAO <= OP.DATAOPERA' +
        'CAO)'
      '  AND CT.IDINVESTIMENTO   = OP.IDINVESTIMENTO'
      'HAVING SUM(OP.VLROPERACAO) <> 0'
      
        'GROUP BY OP.IDCARTEIRAINVEST, CA.DESCCARTINVEST,  OP.IDTIPOOPERA' +
        'CAO, TP.DESCTIPOOPERACAO,'
      
        '         OP.IDINVESTIMENTO, I.DESCINVESTIMENTO,   TP.NATUREZAOPE' +
        'RACAO, CT.QTDTITLOTE'
      
        'ORDER BY OP.IDCARTEIRAINVEST, CA.DESCCARTINVEST,TP.DESCTIPOOPERA' +
        'CAO, I.DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 111
    Top = 162
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
        Value = '01/11/2005'
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
        Value = '01/11/2005'
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object QryTotTipoOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryTotTipoOperDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryTotTipoOperIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryTotTipoOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTotTipoOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryTotTipoOperDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryTotTipoOperTOTVALOPERACAO: TFloatField
      FieldName = 'TOTVALOPERACAO'
    end
    object QryTotTipoOperTOTQTDOPERACAO: TFloatField
      FieldName = 'TOTQTDOPERACAO'
    end
    object QryTotTipoOperPRECOUNIT: TFloatField
      FieldName = 'PRECOUNIT'
    end
    object QryTotTipoOperPRECOUNITXLOTE: TFloatField
      FieldName = 'PRECOUNITXLOTE'
    end
    object QryTotTipoOperTOTALLIQUIDO: TFloatField
      FieldName = 'TOTALLIQUIDO'
    end
    object QryTotTipoOperPRECOUNITXLOTELIQ: TFloatField
      FieldName = 'PRECOUNITXLOTELIQ'
    end
    object QryTotTipoOperLOTEBASE: TFloatField
      FieldName = 'LOTEBASE'
    end
    object QryTotTipoOperTOTIR: TFloatField
      FieldName = 'TOTIR'
    end
    object QryTotTipoOperTOTREMUNER: TFloatField
      FieldName = 'TOTREMUNER'
    end
    object QryTotTipoOperTOTDESPESA: TFloatField
      FieldName = 'TOTDESPESA'
    end
  end
  object RpTotTipoOper: TppReport
    AutoStop = False
    DataPipeline = ppBdeTipoOper
    OnStartPage = RpTotTipoOperStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Resumo das Operações Realizadas'
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
    BeforePrint = RpTotTipoOperBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 37
    Top = 162
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBdeTipoOper'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Resumo das Operações Realizadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8467
        mmWidth = 59267
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object LbDataIni: TppLabel
        UserName = 'LbDataIni'
        Caption = 'Data Inicial .: 01/11/2005 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 15346
        mmWidth = 36248
        BandType = 0
      end
      object LbDataFim: TppLabel
        UserName = 'LbDataFim'
        Caption = 'Data Final   .: 30/11/2005'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 15346
        mmWidth = 35983
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
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
      object ppTotTipoOperDBText2: TppDBText
        UserName = 'ppTotTipoOperDBText2'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBdeTipoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 3440
        mmLeft = 51065
        mmTop = 21166
        mmWidth = 91017
        BandType = 0
      end
      object ppTotTipoOperDBText1: TppDBText
        UserName = 'ppTotTipoOperDBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = ppBdeTipoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 21167
        mmWidth = 99484
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label1'
        Caption = 'Tipo de Operação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 25400
        mmTop = 21167
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Carteira de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144727
        mmTop = 21167
        mmWidth = 34131
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object shpTotTipoOperDetalhe: TppShape
        OnPrint = shpTotTipoOperDetalhePrint
        UserName = 'shpTotTipoOperDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object DBPrecoUnit: TppDBText
        UserName = 'DBPrecoUnit'
        DataField = 'PRECOUNIT'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 3969
        mmLeft = 129646
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object DbTotTipoOperPMporLote: TppDBText
        UserName = 'DbTotTipoOperPMporLote'
        DataField = 'PRECOUNITXLOTELIQ'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 3969
        mmLeft = 122767
        mmTop = 529
        mmWidth = 38100
        BandType = 4
      end
      object ppTotTipoOperDBText3: TppDBText
        UserName = 'ppTotTipoOperDBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBdeTipoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 529
        mmWidth = 79111
        BandType = 4
      end
      object ppTotTipoOperDBText4: TppDBText
        UserName = 'ppTotTipoOperDBText4'
        DataField = 'TOTQTDOPERACAO'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 88900
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppTotTipoOperDBText6: TppDBText
        UserName = 'ppTotTipoOperDBText6'
        DataField = 'TOTALLIQUIDO'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 257176
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TOTIR'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 230188
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TOTDESPESA'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 199496
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TOTREMUNER'
        DataPipeline = ppBdeTipoOper
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeTipoOper'
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 1323
        mmWidth = 282311
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
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
        mmTop = 1323
        mmWidth = 282311
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppTotTipoOperGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = ppBdeTipoOper
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'TotTipoOperGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBdeTipoOper'
      object ppTotTipoOperGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object shpCabecalho: TppShape
          UserName = 'shpCabecalho'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppTotTipoOperLabel1: TppLabel
          UserName = 'ppTotTipoOperLabel1'
          Caption = 'Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 4763
          mmTop = 529
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppTotTipoOperLabel2: TppLabel
          UserName = 'ppTotTipoOperLabel2'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 94721
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object lblPrcMed: TppLabel
          UserName = 'lblPrcMed'
          AutoSize = False
          Caption = 'Preço Médio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 120386
          mmTop = 529
          mmWidth = 40481
          BandType = 3
          GroupNo = 0
        end
        object ppTotTipoOperLabel4: TppLabel
          UserName = 'ppTotTipoOperLabel4'
          Caption = 'Valor Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 264319
          mmTop = 529
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label2'
          Caption = 'I.R. Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 238125
          mmTop = 529
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label3'
          Caption = 'Despesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 210344
          mmTop = 529
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label4'
          Caption = 'Remuneração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 171980
          mmTop = 794
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
      end
      object ppTotTipoOperGroupFooterBand1: TppGroupFooterBand
        AfterPrint = ppTotTipoOperGroupFooterBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppTotTipoOperGroup2: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = ppBdeTipoOper
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'TotTipoOperGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBdeTipoOper'
      object ppTotTipoOperGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppTotTipoOperGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppTotTipoOperDBCalc1: TppDBCalc
          UserName = 'ppTotTipoOperDBCalc1'
          DataField = 'TOTALLIQUIDO'
          DataPipeline = ppBdeTipoOper
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppTotTipoOperGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBdeTipoOper'
          mmHeight = 3440
          mmLeft = 257176
          mmTop = 1852
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object ppTotTipoOperLine4: TppLine
          UserName = 'ppTotTipoOperLine4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppTotTipoOperLabel5: TppLabel
          UserName = 'ppTotTipoOperLabel5'
          Caption = 'Total do Tipo de Operação .:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 115623
          mmTop = 1852
          mmWidth = 38365
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBdeMapaCorret: TppBDEPipeline
    DataSource = DsMapaCorret
    UserName = 'BdeMapaCorret'
    Left = 255
    Top = 226
  end
  object DsMapaCorret: TwwDataSource
    DataSet = QryMapaCorret
    Left = 183
    Top = 226
  end
  object QryMapaCorret: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  COR.SGLCORRETVALORES,                                   ' +
        '                   '
      
        '        SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,DES.VLRDESPOPER,0)' +
        ') AS TOTPOSITIVOS, '
      
        '        ABS(SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,0,DES.VLRDESPO' +
        'PER))) AS TOTNEGATIVOS,   '
      ''
      
        '        (SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,DES.VLRDESPOPER,0' +
        ')) +'
      
        '         SUM(DECODE(LEAST(0,DES.VLRDESPOPER),0,0,DES.VLRDESPOPER' +
        '))) AS TOTLIQUIDO '
      ''
      'FROM DESPOPERINVEST DES, CORRETVALORES COR '
      ''
      'WHERE '#9'DES.IDTIPOINVEST      = 2  '#9#9#9'           AND '
      #9'DES.DATAOPERACAO>= TO_DATE('#39'02/01/2000'#39','#39'DD/MM/YYYY'#39') AND '
      #9'DES.DATAOPERACAO<= TO_DATE('#39'29/02/2000'#39','#39'DD/MM/YYYY'#39') AND '
      #9'DES.IDFORCLI          = COR.IDCORRETVALORES  '#9'               '
      ''
      'GROUP  BY COR.SGLCORRETVALORES  '
      'ORDER  BY COR.SGLCORRETVALORES  ')
    ValidateWithMask = True
    Left = 111
    Top = 226
  end
  object RpMapaCorret: TppReport
    AutoStop = False
    DataPipeline = ppBdeMapaCorret
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
    BeforePrint = RpMapaCorretBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 37
    Top = 226
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBdeMapaCorret'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Mapa de Corretagem em Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 64029
        mmTop = 8731
        mmWidth = 69586
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object LblDataIniMapaCorret: TppLabel
        UserName = 'LblDataIniMapaCorret'
        Caption = 'Data Inicial .: 01/01/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 8202
        mmWidth = 33338
        BandType = 0
      end
      object LblDataFimMapaCorret: TppLabel
        UserName = 'LblDataFimMapaCorret'
        Caption = 'Data Final   .: 31/12/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 12700
        mmWidth = 33338
        BandType = 0
      end
      object RpMapaCorretLabel3: TppLabel
        UserName = 'RpMapaCorretLabel3'
        Caption = 'Corretora de Valores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 17463
        mmWidth = 34925
        BandType = 0
      end
      object RpMapaCorretLabel4: TppLabel
        UserName = 'RpMapaCorretLabel4'
        Caption = 'Desp. Corret. e Taxas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 64294
        mmTop = 17463
        mmWidth = 35983
        BandType = 0
      end
      object RpMapaCorretLabel5: TppLabel
        UserName = 'RpMapaCorretLabel5'
        Caption = 'Dev. Corretagem '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 106892
        mmTop = 17463
        mmWidth = 29369
        BandType = 0
      end
      object RpMapaCorretLabel6: TppLabel
        UserName = 'RpMapaCorretLabel6'
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 177800
        mmTop = 17463
        mmWidth = 18256
        BandType = 0
      end
      object RpMapaCorretLine1: TppLine
        UserName = 'RpMapaCorretLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197300
        BandType = 0
      end
      object RpMapaCorretLabel7: TppLabel
        UserName = 'RpMapaCorretLabel7'
        Caption = 'Desp. Liquida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 16933
        mmWidth = 23019
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object RpMapaCorretDBText1: TppDBText
        UserName = 'RpMapaCorretDBText1'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = ppBdeMapaCorret
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 794
        mmWidth = 57150
        BandType = 4
      end
      object RpMapaCorretDBText2: TppDBText
        UserName = 'RpMapaCorretDBText2'
        DataField = 'TOTPOSITIVOS'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 64294
        mmTop = 794
        mmWidth = 35983
        BandType = 4
      end
      object RpMapaCorretDBText3: TppDBText
        UserName = 'RpMapaCorretDBText3'
        DataField = 'TOTNEGATIVOS'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 100277
        mmTop = 794
        mmWidth = 35983
        BandType = 4
      end
      object RpMapaCorretDBText4: TppDBText
        UserName = 'RpMapaCorretDBText4'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 137584
        mmTop = 794
        mmWidth = 30692
        BandType = 4
      end
      object LbPerc: TppLabel
        OnPrint = LbPercPrint
        UserName = 'LbPerc'
        Caption = 'PERC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 186532
        mmTop = 1058
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
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
      object ppCalc3: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RpMapaCorretSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RpMapaCorretLine2: TppLine
        UserName = 'RpMapaCorretLine2'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 7
      end
      object RpMapaCorretDBCalc1: TppDBCalc
        UserName = 'RpMapaCorretDBCalc1'
        DataField = 'TOTPOSITIVOS'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 64294
        mmTop = 3440
        mmWidth = 35983
        BandType = 7
      end
      object RpMapaCorretDBCalc2: TppDBCalc
        UserName = 'RpMapaCorretDBCalc2'
        DataField = 'TOTNEGATIVOS'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 100277
        mmTop = 3440
        mmWidth = 35983
        BandType = 7
      end
      object RpMapaCorretDBCalc3: TppDBCalc
        UserName = 'RpMapaCorretDBCalc3'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppBdeMapaCorret
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeMapaCorret'
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 3440
        mmWidth = 30956
        BandType = 7
      end
      object RpMapaCorretLabel9: TppLabel
        UserName = 'RpMapaCorretLabel9'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 3440
        mmWidth = 11377
        BandType = 7
      end
      object RpMapaCorretLabel8: TppLabel
        OnPrint = LbPercPrint
        UserName = 'RpMapaCorretLabel8'
        Caption = '100,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 185738
        mmTop = 3440
        mmWidth = 10319
        BandType = 7
      end
    end
  end
end
