inherited dtmRelRegra: TdtmRelRegra
  Left = 244
  Top = 40
  Width = 524
  Height = 422
  Caption = 'dtmRelRegra'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 105
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
    Left = 71
  end
  inherited rpExemplo: TppReport
    Left = 135
  end
  object pprFormula: TppReport
    AutoStop = False
    DataPipeline = ppBdeFormula
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 135
    Top = 56
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Relatório de Formulas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 77523
        mmTop = 8731
        mmWidth = 44450
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 18785
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
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
      object pprFormulaLabel1: TppLabel
        UserName = 'pprFormulaLabel1'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 14817
        mmWidth = 8996
        BandType = 0
      end
      object pprFormulaLabel4: TppLabel
        UserName = 'pprFormulaLabel4'
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 14817
        mmWidth = 11642
        BandType = 0
      end
      object pprFormulaLabel2: TppLabel
        UserName = 'pprFormulaLabel2'
        Caption = 'Descrição / Expressão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 14817
        mmWidth = 32015
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object pprFormulaDBText1: TppDBText
        UserName = 'pprFormulaDBText1'
        AutoSize = True
        DataField = 'IDFORMULA'
        DataPipeline = ppBdeFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 7144
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object pprFormulaDBText2: TppDBText
        UserName = 'pprFormulaDBText2'
        AutoSize = True
        DataField = 'DESCRICAOFORMULA'
        DataPipeline = ppBdeFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 29369
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object pprFormulaDBText3: TppDBText
        UserName = 'pprFormulaDBText3'
        CharWrap = True
        DataField = 'EXPRESSAOREAL'
        DataPipeline = ppBdeFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 5292
        mmLeft = 29369
        mmTop = 3175
        mmWidth = 162719
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21590
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
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
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object pprFormulaGroup1: TppGroup
      BreakName = 'DESCGRUPOFORMULA'
      DataPipeline = ppBdeFormula
      UserName = 'rFormulaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object pprFormulaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object pprFormulaDBText4: TppDBText
          UserName = 'pprFormulaDBText4'
          AutoSize = True
          DataField = 'DESCGRUPOFORMULA'
          DataPipeline = ppBdeFormula
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 0
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
      end
      object pprFormulaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
  object ppBdeFormula: TppBDEPipeline
    DataSource = dsFormula
    UserName = 'BdeFormula'
    Left = 105
    Top = 56
    object ppBdeFormulappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORMULA'
      FieldName = 'IDFORMULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeFormulappField2: TppField
      FieldAlias = 'DESCRICAOFORMULA'
      FieldName = 'DESCRICAOFORMULA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBdeFormulappField3: TppField
      FieldAlias = 'EXPRESSAOREAL'
      FieldName = 'EXPRESSAOREAL'
      FieldLength = 255
      DisplayWidth = 255
      Position = 2
    end
    object ppBdeFormulappField4: TppField
      FieldAlias = 'DESCGRUPOFORMULA'
      FieldName = 'DESCGRUPOFORMULA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
  end
  object dsFormula: TwwDataSource
    DataSet = QryFormula
    Left = 71
    Top = 56
  end
  object QryFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL, G.DESCGR' +
        'UPOFORMULA'
      'FROM'
      '    GRPFORMULA G, FORMULA F'
      'WHERE'
      '     G.CODGRUPOFORMULA = F.CODGRUPOFORMULA'
      'ORDER BY'
      '      G.DESCGRUPOFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL'
      '')
    ValidateWithMask = True
    Left = 37
    Top = 56
  end
  object pprVariaveis: TppReport
    AutoStop = False
    DataPipeline = ppBdeVariaveis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 135
    Top = 120
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Relatório de Variaveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78581
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
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
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Codigo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 17198
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 17198
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'IDCAMPO'
        DataPipeline = ppBdeVariaveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'DESCRICAODOCAMPO'
        DataPipeline = ppBdeVariaveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 31485
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21590
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
      object ppLabel9: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel9'
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
  end
  object ppBdeVariaveis: TppBDEPipeline
    DataSource = dsVariaveis
    UserName = 'BdeVariaveis'
    Left = 105
    Top = 120
    object ppBdeVariaveisppField1: TppField
      FieldAlias = 'IDCAMPO'
      FieldName = 'IDCAMPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeVariaveisppField2: TppField
      FieldAlias = 'DESCRICAODOCAMPO'
      FieldName = 'DESCRICAODOCAMPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  object dsVariaveis: TwwDataSource
    DataSet = qryVariaveis
    Left = 71
    Top = 120
  end
  object qryVariaveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDCAMPO, DESCRICAODOCAMPO'
      'FROM'
      '    CMPBD'
      'WHERE'
      '     CAMPODOBANCO = 0'
      'ORDER BY'
      '      IDCAMPO')
    ValidateWithMask = True
    Left = 37
    Top = 120
  end
  object pprCampos: TppReport
    AutoStop = False
    DataPipeline = ppBdeCampo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 135
    Top = 168
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'Relatório de Variaveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78581
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 18256
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel10: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel10'
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
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Identificador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50271
        mmTop = 14288
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 14288
        mmWidth = 14288
        BandType = 0
      end
      object pprCamposLabel1: TppLabel
        UserName = 'pprCamposLabel1'
        Caption = 'Campo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 12435
        mmTop = 14288
        mmWidth = 10319
        BandType = 0
      end
      object pprCamposLabel2: TppLabel
        UserName = 'pprCamposLabel2'
        Caption = 'Tabela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 14288
        mmWidth = 9525
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        AutoSize = True
        DataField = 'DESCRICAODOCAMPO'
        DataPipeline = ppBdeCampo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 80698
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object pprCamposDBText2: TppDBText
        UserName = 'pprCamposDBText2'
        AutoSize = True
        DataField = 'NOMEDOCAMPO'
        DataPipeline = ppBdeCampo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 12435
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'IDCAMPO'
        DataPipeline = ppBdeCampo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 50271
        mmTop = 0
        mmWidth = 10848
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21590
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel13: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel13'
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
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
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
    object pprCamposGroup1: TppGroup
      BreakName = 'ENTIDADE'
      DataPipeline = ppBdeCampo
      UserName = 'rCamposGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object pprCamposGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object pprCamposDBText1: TppDBText
          UserName = 'pprCamposDBText1'
          AutoSize = True
          DataField = 'ENTIDADE'
          DataPipeline = ppBdeCampo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1323
          mmTop = 0
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
      end
      object pprCamposGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppBdeCampo: TppBDEPipeline
    DataSource = dsCampos
    UserName = 'BdeCampo'
    Left = 105
    Top = 168
    object ppBdeCampoppField1: TppField
      FieldAlias = 'IDCAMPO'
      FieldName = 'IDCAMPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeCampoppField2: TppField
      FieldAlias = 'DESCRICAODOCAMPO'
      FieldName = 'DESCRICAODOCAMPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBdeCampoppField3: TppField
      FieldAlias = 'ENTIDADE'
      FieldName = 'ENTIDADE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppBdeCampoppField4: TppField
      FieldAlias = 'NOMEDOCAMPO'
      FieldName = 'NOMEDOCAMPO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
  end
  object dsCampos: TwwDataSource
    DataSet = qryCampos
    Left = 71
    Top = 168
  end
  object qryCampos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDCAMPO, DESCRICAODOCAMPO,ENTIDADE,NOMEDOCAMPO'
      'FROM'
      '    CMPBD'
      'WHERE'
      '     CAMPODOBANCO > 0'
      'ORDER BY'
      '      ENTIDADE, NOMEDOCAMPO')
    ValidateWithMask = True
    Left = 37
    Top = 168
  end
  object pprRegras: TppReport
    AutoStop = False
    DataPipeline = ppBdeRegras
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 135
    Top = 216
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Relatório de Regras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 81227
        mmTop = 8731
        mmWidth = 39952
        BandType = 0
      end
      object ppLabel15: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel15'
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
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 14817
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pprRegrasDBText4: TppDBText
        UserName = 'pprRegrasDBText4'
        AutoSize = True
        DataField = 'IDALGORITMODAREG'
        DataPipeline = ppBdeRegras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object pprRegrasDBText5: TppDBText
        UserName = 'pprRegrasDBText5'
        AutoSize = True
        DataField = 'DESCRICAOALGORIT'
        DataPipeline = ppBdeRegras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 20373
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 21590
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel20: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel20'
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
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
    object pprRegrasGroup1: TppGroup
      BreakName = 'IDREGRA'
      DataPipeline = ppBdeRegras
      UserName = 'rRegrasGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object pprRegrasGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15875
        mmPrintPosition = 0
        object pprRegrasLabel1: TppLabel
          UserName = 'pprRegrasLabel1'
          Caption = 'Identificador da Regra :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 6085
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasLabel2: TppLabel
          UserName = 'pprRegrasLabel2'
          Caption = 'Descrição da Regra :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 2117
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasDBText1: TppDBText
          UserName = 'pprRegrasDBText1'
          AutoSize = True
          DataField = 'IDREGRA'
          DataPipeline = ppBdeRegras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 35983
          mmTop = 6085
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasDBText2: TppDBText
          UserName = 'pprRegrasDBText2'
          AutoSize = True
          DataField = 'NOMEREGRA'
          DataPipeline = ppBdeRegras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 35983
          mmTop = 2117
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasLabel3: TppLabel
          UserName = 'pprRegrasLabel3'
          Caption = 'Tipo da Regra :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 60325
          mmTop = 6085
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasDBText3: TppDBText
          UserName = 'pprRegrasDBText3'
          AutoSize = True
          DataField = 'DESCREGRA'
          DataPipeline = ppBdeRegras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 83608
          mmTop = 6085
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasLabel4: TppLabel
          UserName = 'pprRegrasLabel4'
          Caption = 'Nº do Passo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 10319
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasLabel5: TppLabel
          UserName = 'pprRegrasLabel5'
          Caption = 'Descrição do Algoritmo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 20373
          mmTop = 10319
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object pprRegrasLine1: TppLine
          UserName = 'pprRegrasLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 14817
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object pprRegrasGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
  end
  object ppBdeRegras: TppBDEPipeline
    DataSource = dsRegras
    UserName = 'BdeRegras'
    Left = 105
    Top = 216
    object ppBdeRegrasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeRegrasppField2: TppField
      FieldAlias = 'NOMEREGRA'
      FieldName = 'NOMEREGRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBdeRegrasppField3: TppField
      FieldAlias = 'DESCREGRA'
      FieldName = 'DESCREGRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBdeRegrasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDALGORITMODAREG'
      FieldName = 'IDALGORITMODAREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBdeRegrasppField5: TppField
      FieldAlias = 'DESCRICAOALGORIT'
      FieldName = 'DESCRICAOALGORIT'
      FieldLength = 120
      DisplayWidth = 120
      Position = 4
    end
  end
  object dsRegras: TwwDataSource
    DataSet = QryRegras
    Left = 71
    Top = 216
  end
  object QryRegras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      R.IDREGRA, R.NOMEREGRA, T.DESCREGRA, A.IDALGORITMODAREG, A' +
        '.DESCRICAOALGORIT'
      'FROM'
      '    REGRA R, ALGREGRA A, TIPOREGRA T'
      'WHERE'
      '     R.IDREGRA = A.IDREGRA AND T.IDTIPOREGRA = R.IDTIPOREGRA'
      'ORDER BY'
      '      T.DESCREGRA, R.NOMEREGRA, R.IDREGRA, A.IDALGORITMODAREG')
    ValidateWithMask = True
    Left = 37
    Top = 216
  end
  object ppBdeSRB: TppBDEPipeline
    DataSource = DsSRB
    UserName = 'lExemplo1'
    Left = 107
    Top = 279
    object ppBdeSRBppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBdeSRBppField2: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppBdeSRBppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object ppBdeSRBppField4: TppField
      FieldAlias = 'INSCRICAODATA'
      FieldName = 'INSCRICAODATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppBdeSRBppField5: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppBdeSRBppField6: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppBdeSRBppField7: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppBdeSRBppField8: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppBdeSRBppField9: TppField
      FieldAlias = 'NOMEBENEFICIO'
      FieldName = 'NOMEBENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
  end
  object DsSRB: TwwDataSource
    DataSet = QrySRB
    Left = 64
    Top = 278
  end
  object QrySRB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ELG.IDPESSJUR, ELG.DATAADMISSAO, ELG.MATRICULA,'
      '  PTP.INSCRICAODATA,'
      '  PES.NOME AS PARTICIPANTE,'
      '  PSF.DATANASC,'
      '  PPV.NOME AS PLANO,'
      '  PAT.NOME AS PATROCINADORA,'
      '  BNF.NOME AS NOMEBENEFICIO'
      ''
      'FROM'
      '  PESSOA PES, PESSOAFISICA PSF, ELEGPATRO ELG, PARTPREVPLAN PTP,'
      
        '  PLANPREVPATRO PPP, PLANPREV PPV, PESSOA PAT, BENEFPLANPREV BPP' +
        ', '
      '  BENEFICIO BNF'
      ''
      ''
      'WHERE'
      '  PES.IDPESSOA   = :IDPESSOA     AND'
      ''
      '  BPP.IDBENEFICIO = :IDBENEFICIO         AND'
      '  BPP.IDPLANOPREV = PPV.IDPLANOPREV      AND'
      ''
      '  BPP.IDBENEFICIO = BNF.IDBENEFICIO      AND'
      ''
      ''
      '  PES.IDPESSOA   = PSF.IDPESSOA  AND'
      ''
      '  ELG.IDPESSJUR  = ELG.IDPESSJUR AND'
      '  PES.IDPESSOA   = ELG.IDPESSOA  AND'
      ''
      '  ELG.IDPESSJUR  = PTP.IDPESSJUR AND'
      '  ELG.IDPESSOA   = PTP.IDPESSOA  AND'
      ''
      '  PTP.IDPESSJUR   = PPP.IDPESSJUR   AND'
      '  PTP.IDPLANOPREV = PPP.IDPLANOPREV AND'
      ''
      '  PPP.IDPLANOPREV = PPV.IDPLANOPREV AND '
      '  PTP.IDPESSJUR   = PAT.IDPESSOA'
      ''
      ''
      ''
      'ORDER BY'
      '  PPV.IDPLANOPREV'
      ' ')
    UpdateObject = UpdSRB
    ValidateWithMask = True
    Left = 4
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object ppSRB: TppReport
    AutoStop = False
    DataPipeline = ppBdeSRB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppSRBBeforePrint
    DeviceType = 'Screen'
    Left = 137
    Top = 280
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label11'
        Caption = 'Calculo do SRB parcela "A"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 115623
        mmTop = 10319
        mmWidth = 56092
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 2646
        mmWidth = 28046
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33867
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label1'
        Caption = 'Empresa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 24077
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'PATROCINADORA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 24342
        mmWidth = 121973
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label2'
        Caption = 'Plano '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 28840
        mmWidth = 10848
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLANO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 29104
        mmWidth = 121973
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 17727
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 17992
        mmWidth = 121973
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 17727
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 183886
        mmTop = 17992
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 24077
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label3'
        Caption = 'Data de Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 35190
        mmWidth = 33867
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37042
        mmTop = 35454
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Data de Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 35190
        mmWidth = 30692
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 117211
        mmTop = 35190
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Data de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 164836
        mmTop = 34925
        mmWidth = 29369
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'INSCRICAODATA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 196850
        mmTop = 35190
        mmWidth = 29104
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 40217
        mmWidth = 284300
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 9525
        mmLeft = 183621
        mmTop = 24077
        mmWidth = 99219
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeSRBAux
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
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
          Template.SaveTo = stDatabase
          Left = 136
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 529
              mmWidth = 8467
              BandType = 1
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 5292
              mmWidth = 284300
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'SAL. BÁSICO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 21696
              mmTop = 529
              mmWidth = 23283
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label301'
              Caption = 'ANUÊNIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 64558
              mmTop = 529
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label302'
              Caption = 'FÉRIAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 98690
              mmTop = 529
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label303'
              Caption = 'DIFERENÇA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 127265
              mmTop = 529
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label304'
              Caption = 'SOMA PARCELAS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 157427
              mmTop = 529
              mmWidth = 27517
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'ÍNDICE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 228071
              mmTop = 529
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'SOMA CORRIGIDA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 254001
              mmTop = 529
              mmWidth = 29633
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              Caption = 'LIMITANTE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 193940
              mmTop = 529
              mmWidth = 19050
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              AutoSize = True
              DataField = 'DATA'
              DataPipeline = ppBdeSRBAux
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3704
              mmLeft = 1323
              mmTop = 794
              mmWidth = 8467
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              AutoSize = True
              DataField = 'SALBASICO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 24606
              mmTop = 794
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              DataField = 'ANUENIO'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 63236
              mmTop = 794
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              AutoSize = True
              DataField = 'FERIAS'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 97631
              mmTop = 794
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              AutoSize = True
              DataField = 'DIFERENCA'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 125942
              mmTop = 794
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              AutoSize = True
              DataField = 'SOMAPARCELAS'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 158221
              mmTop = 794
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              AutoSize = True
              DataField = 'INDICE'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 226748
              mmTop = 794
              mmWidth = 12700
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              AutoSize = True
              DataField = 'SOMACORRIGIDA'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 254265
              mmTop = 794
              mmWidth = 27517
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              AutoSize = True
              DataField = 'LIMITANTE'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 193146
              mmTop = 794
              mmWidth = 19050
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 15346
            mmPrintPosition = 0
            object ppLine16: TppLine
              UserName = 'Line16'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              AutoSize = True
              DataField = 'SOMACORRIGIDA'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 239448
              mmTop = 1588
              mmWidth = 42333
              BandType = 7
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              Caption = 'Somatório dos Salários .:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 182563
              mmTop = 1852
              mmWidth = 52917
              BandType = 7
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 7408
              mmWidth = 284300
              BandType = 7
            end
            object ppLabel39: TppLabel
              UserName = 'Label39'
              Caption = 'Renda Mensal  ..........:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 182827
              mmTop = 10848
              mmWidth = 52917
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              AutoSize = True
              DataField = 'SOMACORRIGIDA'
              DataPipeline = ppBdeSRBAux
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DBCalcType = dcAverage
              mmHeight = 3704
              mmLeft = 239713
              mmTop = 10583
              mmWidth = 42333
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10848
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel18: TppLabel
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
        mmTop = 12171
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 12171
        mmWidth = 283634
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
        mmLeft = 256911
        mmTop = 6615
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object QryRubricasA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  P.IDGRUPORUBRICA, H.IDPESSJUR, H.IDRUBRICA, H.CODPROVDESC,   H' +
        '.VALORPROVENTO,  H.MES'
      'FROM'
      '  HISTRUBSAL H, PROVDESC P'
      'WHERE '
      '  H.IDPESSOA  = :IDPESSOA  AND'
      '  H.IDPESSJUR = :IDPESSJUR   AND'
      '  H.MES < :ANOMES   AND'
      
        '  H.MES >= TO_CHAR(ADD_MONTHS(TO_DATE(:ANOMES, '#39'YYYY/MM'#39'),-12), ' +
        #39'YYYY/MM'#39')    AND'
      '  P.IDGRUPORUBRICA IN ('#39'A'#39')   AND'
      '  H.IDRUBRICA = P.IDPROVENTO'
      'ORDER BY'
      '  H.MES'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 13
    Top = 311
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '2312'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '50031'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
        Value = '2001/11'
      end
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
      end>
  end
  object UpdSRB: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DATA = :DATA,'
      '  SALBASICO = :SALBASICO,'
      '  ANUENIO = :ANUENIO,'
      '  FERIAS = :FERIAS,'
      '  DIFERENCA = :DIFERENCA,'
      '  SOMAPARCELAS = :SOMAPARCELAS,'
      '  LIMITANTE = :LIMITANTE,'
      '  INDICE = :INDICE,'
      '  FATOR = :FATOR,'
      '  SOMACORRIGIDA = :SOMACORRIGIDA'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (DATA, SALBASICO, ANUENIO, FERIAS, DIFERENCA, SOMAPARCELAS, LI' +
        'MITANTE, '
      '   INDICE, FATOR, SOMACORRIGIDA)'
      'values'
      
        '  (:DATA, :SALBASICO, :ANUENIO, :FERIAS, :DIFERENCA, :SOMAPARCEL' +
        'AS, :LIMITANTE, '
      '   :INDICE, :FATOR, :SOMACORRIGIDA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    Left = 34
    Top = 278
  end
  object DsSRBAux: TDataSource
    DataSet = QrySRBAux
    Left = 109
    Top = 311
  end
  object ppBdeSRBAux: TppBDEPipeline
    DataSource = DsSRBAux
    UserName = 'ppBdeSRBAux'
    Left = 139
    Top = 311
    object ppBdeSRBAuxppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 0
    end
    object ppBdeSRBAuxppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALBASICO'
      FieldName = 'SALBASICO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBdeSRBAuxppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANUENIO'
      FieldName = 'ANUENIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBdeSRBAuxppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'FERIAS'
      FieldName = 'FERIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBdeSRBAuxppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBdeSRBAuxppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOMAPARCELAS'
      FieldName = 'SOMAPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBdeSRBAuxppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'LIMITANTE'
      FieldName = 'LIMITANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBdeSRBAuxppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBdeSRBAuxppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBdeSRBAuxppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOMACORRIGIDA'
      FieldName = 'SOMACORRIGIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object QrySRBAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'MMM/YYYY'#39' AS DATA,'
      '  NVL(000.00,0) AS SALBASICO,'
      '  NVL(000.00,0) AS ANUENIO,'
      '  NVL(000.00,0) AS FERIAS,'
      '  NVL(000.00,0) AS DIFERENCA,'
      '  NVL(000.00,0) AS SOMAPARCELAS,'
      '  NVL(000.00,0) AS LIMITANTE,'
      '  NVL(000.00,0) AS INDICE,'
      '  NVL(000.00,0) AS FATOR,'
      '  NVL(000.00,0) AS SOMACORRIGIDA'
      'FROM'
      '  DUAL'
      ' '
      ' '
      ' ')
    UpdateObject = UpdSRBAux
    ValidateWithMask = True
    Left = 47
    Top = 311
  end
  object QryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'MMM/YYYY'#39' AS DATA,'
      '  NVL(000.00,0) AS SALBASICO,'
      '  NVL(000.00,0) AS ANUENIO,'
      '  NVL(000.00,0) AS FERIAS,'
      '  NVL(000.00,0) AS DIFERENCA,'
      '  NVL(000.00,0) AS SOMAPARCELAS,'
      '  NVL(000.00,0) AS LIMITANTE,'
      '  NVL(000.00,0) AS INDICE,'
      '  NVL(000.00,0) AS FATOR,'
      '  NVL(000.00,0) AS SOMACORRIGIDA'
      'FROM'
      '  DUAL'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 9
    Top = 87
  end
  object DsSRBParcelaB: TDataSource
    DataSet = QrySRBAuxB
    Left = 139
    Top = 343
  end
  object ppBdeSRBAuxB: TppBDEPipeline
    DataSource = DsSRBParcelaB
    UserName = 'ppBdeSRBAuxB'
    Left = 170
    Top = 343
    object ppBdeSRBAuxBppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBdeSRBAuxBppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 48
      DisplayWidth = 48
      Position = 1
    end
    object ppBdeSRBAuxBppField3: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 2
    end
    object ppBdeSRBAuxBppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAL'
      FieldName = 'VALORREAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBdeSRBAuxBppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLIMITADO1'
      FieldName = 'VALORLIMITADO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBdeSRBAuxBppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLIMITADO2'
      FieldName = 'VALORLIMITADO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBdeSRBAuxBppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBdeSRBAuxBppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBdeSRBAuxBppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCORRIGIDO1'
      FieldName = 'VALORCORRIGIDO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBdeSRBAuxBppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCORRIGIDO2'
      FieldName = 'VALORCORRIGIDO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBdeSRBAuxBppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROPORCAO1'
      FieldName = 'VALORPROPORCAO1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBdeSRBAuxBppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPROPORCAO2'
      FieldName = 'VALORPROPORCAO2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object QrySRBAuxB: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  0 AS IDRUBRICA,'
      '  '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NOME,'
      '  '#39'MMM/YYYY'#39' AS DATA,'
      '  NVL(000.00,0) AS VALORREAL,'
      '  NVL(000.00,0) AS VALORLIMITADO1,'
      '  NVL(000.00,0) AS VALORLIMITADO2,'
      '  NVL(000.00,0) AS INDICE,'
      '  NVL(000.00,0) AS FATOR,'
      '  NVL(000.00,0) AS VALORCORRIGIDO1,'
      '  NVL(000.00,0) AS VALORCORRIGIDO2,'
      '  NVL(000.00,0) AS VALORPROPORCAO1,'
      '  NVL(000.00,0) AS VALORPROPORCAO2'
      'FROM'
      '  DUAL'
      ''
      ' '
      ' ')
    UpdateObject = UpdSRBParcelaB
    ValidateWithMask = True
    Left = 77
    Top = 343
  end
  object QryRubricasB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TO_CHAR(TO_DATE(MES,'#39'YYYY/MM'#39'),'#39'MON/YYYY'#39') AS MESANO,'
      
        '  H.IDRUBRICA, H.MES, H.VALORPROVENTO, TO_DATE(H.MES,'#39'YYYY/MM'#39') ' +
        'AS DATARUBRICA,'
      
        '  D.TIPOCALCULO, D.IDRUBRICA, D.ANOMESREF, D.VLRCORRIGIDO, D.VLR' +
        'CALCULO,'
      '  D.VLRINDICE, D.FATOR,'
      '  C.IDBENEFICIO,'
      '  P.DESCRICAO'
      'FROM'
      '  HISTRUBSAL H,  DETCALCULO D, CALCULO C, PROVDESC P'
      'WHERE'
      '  H.IDPESSOA       = :IDPESSOA  AND'
      
        '  ( (C.IDBENEFICIO = :IDBENEFICIO) OR (C.IDBENEFICIO IS NULL) ) ' +
        ' AND'
      ''
      '  D.IDCALCULO = C.IDCALCULO(+)  AND'
      ''
      '  H.IDRUBRICA = D.IDRUBRICA(+)  AND'
      '  H.MES       = D.ANOMESREF(+)  AND'
      '  H.IDRUBRICA = P.IDPROVENTO    AND'
      '  P.IDGRUPORUBRICA IN (:IDGRUPORUBRICA)'
      ''
      ' '
      'ORDER BY'
      '  H.IDRUBRICA, H.MES, D.TIPOCALCULO'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDGRUPORUBRICA'
        ParamType = ptUnknown
      end>
  end
  object UpdSRBAux: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DATA = :DATA,'
      '  SALBASICO = :SALBASICO,'
      '  ANUENIO = :ANUENIO,'
      '  FERIAS = :FERIAS,'
      '  DIFERENCA = :DIFERENCA,'
      '  SOMAPARCELAS = :SOMAPARCELAS,'
      '  LIMITANTE = :LIMITANTE,'
      '  INDICE = :INDICE,'
      '  FATOR = :FATOR,'
      '  SOMACORRIGIDA = :SOMACORRIGIDA'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (DATA, SALBASICO, ANUENIO, FERIAS, DIFERENCA, SOMAPARCELAS, LI' +
        'MITANTE, '
      '   INDICE, FATOR, SOMACORRIGIDA)'
      'values'
      
        '  (:DATA, :SALBASICO, :ANUENIO, :FERIAS, :DIFERENCA, :SOMAPARCEL' +
        'AS, :LIMITANTE, '
      '   :INDICE, :FATOR, :SOMACORRIGIDA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    Left = 79
    Top = 311
  end
  object UpdSRBParcelaB: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DATA = :DATA,'
      '  SALBASICO = :SALBASICO,'
      '  ANUENIO = :ANUENIO,'
      '  FERIAS = :FERIAS,'
      '  DIFERENCA = :DIFERENCA,'
      '  SOMAPARCELAS = :SOMAPARCELAS,'
      '  LIMITANTE = :LIMITANTE,'
      '  INDICE = :INDICE,'
      '  FATOR = :FATOR,'
      '  SOMACORRIGIDA = :SOMACORRIGIDA'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (DATA, SALBASICO, ANUENIO, FERIAS, DIFERENCA, SOMAPARCELAS, LI' +
        'MITANTE, '
      '   INDICE, FATOR, SOMACORRIGIDA)'
      'values'
      
        '  (:DATA, :SALBASICO, :ANUENIO, :FERIAS, :DIFERENCA, :SOMAPARCEL' +
        'AS, :LIMITANTE, '
      '   :INDICE, :FATOR, :SOMACORRIGIDA)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DATA = :OLD_DATA and'
      '  SALBASICO = :OLD_SALBASICO and'
      '  ANUENIO = :OLD_ANUENIO and'
      '  FERIAS = :OLD_FERIAS and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  SOMAPARCELAS = :OLD_SOMAPARCELAS and'
      '  LIMITANTE = :OLD_LIMITANTE and'
      '  INDICE = :OLD_INDICE and'
      '  FATOR = :OLD_FATOR and'
      '  SOMACORRIGIDA = :OLD_SOMACORRIGIDA')
    Left = 109
    Top = 343
  end
  object ppSRBB: TppReport
    AutoStop = False
    DataPipeline = ppBdeSRB
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    BeforePrint = ppSRBBBeforePrint
    DeviceType = 'Screen'
    Left = 169
    Top = 312
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'Label11'
        Caption = 'Calculo do SRB parcela "B"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 70644
        mmTop = 9790
        mmWidth = 56092
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel41: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83079
        mmTop = 2117
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label1'
        Caption = 'Empresa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 24606
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText1'
        DataField = 'PATROCINADORA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 24871
        mmWidth = 94721
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label2'
        Caption = 'Plano '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 29369
        mmWidth = 10848
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText6'
        DataField = 'PLANO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 29633
        mmWidth = 94721
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label22'
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 17727
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText7'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 17992
        mmWidth = 94721
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label23'
        Caption = 'Matricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 17992
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 134144
        mmTop = 18256
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label24'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 24871
        mmWidth = 13494
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34133
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'NOMEBENEFICIO'
        DataPipeline = ppBdeSRB
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 134409
        mmTop = 24871
        mmWidth = 62442
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeSRBAuxB
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 136
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText28: TppDBText
              UserName = 'DBText12'
              AutoSize = True
              DataField = 'DATA'
              DataPipeline = ppBdeSRBAuxB
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 1058
              mmTop = 265
              mmWidth = 7673
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText13'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORREAL'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 18256
              mmTop = 265
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORLIMITADO1'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 28310
              mmTop = 265
              mmWidth = 27252
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText15'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORLIMITADO2'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 53711
              mmTop = 265
              mmWidth = 27252
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText16'
              AutoSize = True
              DataField = 'INDICE'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00000;-#,0.00000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 91811
              mmTop = 265
              mmWidth = 11642
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText17'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORCORRIGIDO1'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 96838
              mmTop = 265
              mmWidth = 29104
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText18'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORPROPORCAO1'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 144727
              mmTop = 265
              mmWidth = 29104
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText19'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORPROPORCAO2'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 166952
              mmTop = 265
              mmWidth = 29104
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText20'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'VALORCORRIGIDO2'
              DataPipeline = ppBdeSRBAuxB
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3440
              mmLeft = 119063
              mmTop = 265
              mmWidth = 29104
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 17463
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 36513
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 56356
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 81756
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 104511
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line301'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 127000
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 148961
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppLine33: TppLine
              UserName = 'Line33'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4233
              mmLeft = 174890
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'IDRUBRICA'
            DataPipeline = ppBdeSRBAuxB
            NewPage = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 17727
              mmPrintPosition = 0
              object ppLabel51: TppLabel
                UserName = 'Label29'
                Caption = 'DATA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 1058
                mmTop = 7408
                mmWidth = 8467
                BandType = 3
                GroupNo = 0
              end
              object ppLine23: TppLine
                UserName = 'Line15'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 17463
                mmWidth = 197300
                BandType = 3
                GroupNo = 0
              end
              object ppLabel52: TppLabel
                UserName = 'Label30'
                Caption = 'VALOR REAL'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 14552
                mmTop = 7408
                mmWidth = 21167
                BandType = 3
                GroupNo = 0
              end
              object ppLabel53: TppLabel
                UserName = 'Label301'
                Caption = 'VALOR LIMITADO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 47096
                mmTop = 7408
                mmWidth = 29633
                BandType = 3
                GroupNo = 0
              end
              object ppLabel55: TppLabel
                UserName = 'Label303'
                Caption = 'INDICE'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 90752
                mmTop = 7408
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel56: TppLabel
                UserName = 'Label304'
                Caption = 'VALOR CORRIGIDO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 114829
                mmTop = 7408
                mmWidth = 31750
                BandType = 3
                GroupNo = 0
              end
              object ppLabel57: TppLabel
                UserName = 'Label35'
                Caption = '2º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 183357
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel58: TppLabel
                UserName = 'Label36'
                Caption = 'PROPORÇÃO'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 167482
                mmTop = 7408
                mmWidth = 19050
                BandType = 3
                GroupNo = 0
              end
              object ppLabel59: TppLabel
                UserName = 'Label38'
                Caption = '1º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 161132
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppDBText25: TppDBText
                UserName = 'DBText25'
                DataField = 'IDRUBRICA'
                DataPipeline = ppBdeSRBAuxB
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 24077
                mmTop = 529
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLabel47: TppLabel
                UserName = 'Label47'
                Caption = 'RUBRICA .:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 1058
                mmTop = 265
                mmWidth = 21167
                BandType = 3
                GroupNo = 0
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                DataField = 'NOME'
                DataPipeline = ppBdeSRBAuxB
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 43127
                mmTop = 529
                mmWidth = 142082
                BandType = 3
                GroupNo = 0
              end
              object ppLine19: TppLine
                UserName = 'Line19'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 6085
                mmWidth = 197300
                BandType = 3
                GroupNo = 0
              end
              object ppLabel48: TppLabel
                UserName = 'Label48'
                Caption = '1º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 113242
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel49: TppLabel
                UserName = 'Label49'
                Caption = '2º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 135467
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel50: TppLabel
                UserName = 'Label50'
                Caption = '1º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 42863
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppLabel54: TppLabel
                UserName = 'Label54'
                Caption = '2º VEZ'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 68263
                mmTop = 12171
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppLabel60: TppLabel
                UserName = 'Label37'
                Caption = 'Total do SRB .:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 90752
                mmTop = 1588
                mmWidth = 31750
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc1'
                AutoSize = True
                DataField = 'VALORPROPORCAO1'
                DataPipeline = ppBdeSRBAuxB
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = []
                ResetGroup = ppGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 127000
                mmTop = 1588
                mmWidth = 46567
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc5: TppDBCalc
                UserName = 'DBCalc5'
                AutoSize = True
                DataField = 'VALORPROPORCAO2'
                DataPipeline = ppBdeSRBAuxB
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 10
                Font.Style = []
                ResetGroup = ppGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 149490
                mmTop = 1588
                mmWidth = 46567
                BandType = 5
                GroupNo = 0
              end
              object ppLine25: TppLine
                UserName = 'Line17'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 5
                GroupNo = 0
              end
              object ppLine24: TppLine
                UserName = 'Line16'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 529
                mmLeft = 0
                mmTop = 6350
                mmWidth = 197300
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 4233
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
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
        mmTop = 5556
        mmWidth = 197380
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
        mmHeight = 3704
        mmLeft = 265
        mmTop = 5556
        mmWidth = 163513
        BandType = 8
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = QryRubricasA
    Left = 8
    Top = 344
  end
  object qryRegrasUtilizadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT T.TABELA, T.CAMPO, T.MODULO, T.CODIGO_REGRA, R.N' +
        'OMEREGRA'
      'FROM ('
      
        'SELECT '#39'ALTERXCONTRIBASS    '#39' AS TABELA, '#39'IDREGRACALCULO        ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRACALCULO' +
        '            AS CODIGO_REGRA       FROM   ALTERXCONTRIBASS    WHE' +
        'RE IDREGRACALCULO            IS NOT NULL     UNION'
      
        'SELECT '#39'ALTERXPARCASS       '#39' AS TABELA, '#39'IDREGRA               ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRA       ' +
        '            AS CODIGO_REGRA       FROM   ALTERXPARCASS       WHE' +
        'RE IDREGRA                   IS NOT NULL     UNION'
      
        'SELECT '#39'CONTRIBASS          '#39' AS TABELA, '#39'IDREGRA               ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRA       ' +
        '            AS CODIGO_REGRA       FROM   CONTRIBASS          WHE' +
        'RE IDREGRA                   IS NOT NULL     UNION'
      
        'SELECT '#39'HSTCONTRIBASS       '#39' AS TABELA, '#39'IDREGRA               ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRA       ' +
        '            AS CODIGO_REGRA       FROM   HSTCONTRIBASS       WHE' +
        'RE IDREGRA                   IS NOT NULL     UNION'
      
        'SELECT '#39'PARCASS             '#39' AS TABELA, '#39'IDREGRAPRINCIPAL      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAPRINCIP' +
        'AL          AS CODIGO_REGRA       FROM   PARCASS             WHE' +
        'RE IDREGRAPRINCIPAL          IS NOT NULL     UNION'
      
        'SELECT '#39'PARCASSTIPOS        '#39' AS TABELA, '#39'IDREGRAPRINCIPAL      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAPRINCIP' +
        'AL          AS CODIGO_REGRA       FROM   PARCASSTIPOS        WHE' +
        'RE IDREGRAPRINCIPAL          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAATRASOJUR      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAATRASOJ' +
        'UR          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAATRASOJUR          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRADEVOLCORR      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRADEVOLCO' +
        'RR          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRADEVOLCORR          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAATRASOCOR      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAATRASOC' +
        'OR          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAATRASOCOR          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRACANCELAME      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRACANCELA' +
        'ME          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRACANCELAME          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAGERAL          ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAGERAL  ' +
        '            AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAGERAL              IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRABENEFICIA      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRABENEFIC' +
        'IA          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRABENEFICIA          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRACOBRANCA       ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRACOBRANC' +
        'A           AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRACOBRANCA           IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAADMINISTR      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAADMINIS' +
        'TR          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAADMINISTR          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRADEVOLJUROS     ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRADEVOLJU' +
        'ROS         AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRADEVOLJUROS         IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRADESISTENC      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRADESISTE' +
        'NC          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRADESISTENC          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAPAGAMENTO      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAPAGAMEN' +
        'TO          AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAPAGAMENTO          IS NOT NULL     UNION'
      
        'SELECT '#39'PLANASS             '#39' AS TABELA, '#39'IDREGRAADMISSAO       ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAADMISSA' +
        'O           AS CODIGO_REGRA       FROM   PLANASS             WHE' +
        'RE IDREGRAADMISSAO           IS NOT NULL     UNION'
      
        'SELECT '#39'SERVPLANASS         '#39' AS TABELA, '#39'IDREGRACOMISSAO       ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRACOMISSA' +
        'O           AS CODIGO_REGRA       FROM   SERVPLANASS         WHE' +
        'RE IDREGRACOMISSAO           IS NOT NULL     UNION'
      
        'SELECT '#39'SERVPLANASS         '#39' AS TABELA, '#39'IDREGRAREEMBOLSO      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAREEMBOL' +
        'SO          AS CODIGO_REGRA       FROM   SERVPLANASS         WHE' +
        'RE IDREGRAREEMBOLSO          IS NOT NULL     UNION'
      
        'SELECT '#39'SERVPLANASS         '#39' AS TABELA, '#39'IDREGRAPAGAMENTO      ' +
        #39' AS CAMPO, '#39'Adm. Assistencial       '#39' AS MODULO, IDREGRAPAGAMEN' +
        'TO          AS CODIGO_REGRA       FROM   SERVPLANASS         WHE' +
        'RE IDREGRAPAGAMENTO          IS NOT NULL     UNION'
      
        'SELECT '#39'ALTERADORXBENEF     '#39' AS TABELA, '#39'IDREGRACALCULO        ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRACALCULO' +
        '            AS CODIGO_REGRA       FROM   ALTERADORXBENEF     WHE' +
        'RE IDREGRACALCULO            IS NOT NULL     UNION'
      
        'SELECT '#39'ALTERADORXCONTRIB   '#39' AS TABELA, '#39'IDREGRACALCULO        ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRACALCULO' +
        '            AS CODIGO_REGRA       FROM   ALTERADORXCONTRIB   WHE' +
        'RE IDREGRACALCULO            IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFICIO           '#39' AS TABELA, '#39'IDREGRALINHASPC       ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRALINHASP' +
        'C           AS CODIGO_REGRA       FROM   BENEFICIO           WHE' +
        'RE IDREGRALINHASPC           IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRABENEFMIN       ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRABENEFMI' +
        'N           AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRABENEFMIN           IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRACALCOP3        ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRACALCOP3' +
        '            AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRACALCOP3            IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRASRB            ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRASRB    ' +
        '            AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRASRB                IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRAINICIO         ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRAINICIO ' +
        '            AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRAINICIO             IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRAULTPAGTO       ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRAULTPAGT' +
        'O           AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRAULTPAGTO           IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRAPRIMPAGTO      ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRAPRIMPAG' +
        'TO          AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRAPRIMPAGTO          IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRACALCOP2        ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRACALCOP2' +
        '            AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRACALCOP2            IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRACALCABONO      ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRACALCABO' +
        'NO          AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRACALCABONO          IS NOT NULL     UNION'
      
        'SELECT '#39'BENEFPLANPREV       '#39' AS TABELA, '#39'IDREGRAELEGIBILI      ' +
        #39' AS CAMPO, '#39'AdmPrev                 '#39' AS MODULO, IDREGRAELEGIBI' +
        'LI          AS CODIGO_REGRA       FROM   BENEFPLANPREV       WHE' +
        'RE IDREGRAELEGIBILI          IS NOT NULL'
      ') T, REGRA R'
      'WHERE R.IDREGRA = T.CODIGO_REGRA'
      '')
    ValidateWithMask = True
    Left = 283
    Top = 328
  end
  object dsRegrasUtilizadas: TwwDataSource
    DataSet = qryRegrasUtilizadas
    Left = 320
    Top = 328
  end
  object ppRegrasUtilizadas: TppBDEPipeline
    DataSource = dsRegrasUtilizadas
    UserName = 'lExemplo2'
    Left = 354
    Top = 328
  end
  object rpRegrasUtilizadas: TppReport
    AutoStop = False
    DataPipeline = ppRegrasUtilizadas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 384
    Top = 328
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'Label11'
        Caption = 'Relação de Regras Parametrizadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 66411
        mmTop = 8731
        mmWidth = 70644
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'CODIGO_REGRA'
        DataPipeline = ppRegrasUtilizadas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 4498
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'NOMEREGRA'
        DataPipeline = ppRegrasUtilizadas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 22225
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = '['
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 265
        mmWidth = 794
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'TABELA'
        DataPipeline = ppRegrasUtilizadas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 125677
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 265
        mmWidth = 794
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'CAMPO'
        DataPipeline = ppRegrasUtilizadas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 154782
        mmTop = 265
        mmWidth = 40217
        BandType = 4
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 196586
        mmTop = 265
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppSystemVariable4: TppSystemVariable
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
      object ppLine34: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel63: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Regras de Negócio'
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
      object ppSystemVariable5: TppSystemVariable
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
    object ppGroup1: TppGroup
      BreakName = 'MODULO'
      DataPipeline = ppRegrasUtilizadas
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLabel64: TppLabel
          UserName = 'Label64'
          AutoSize = False
          Caption = 'Módulo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 794
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText38: TppDBText
          UserName = 'DBText38'
          DataField = 'MODULO'
          DataPipeline = ppRegrasUtilizadas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 22225
          mmTop = 794
          mmWidth = 97631
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label65'
          Caption = 'Nº da Regra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 6879
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Nome da Regra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 22225
          mmTop = 6879
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label67'
          Caption = 'Informações Técnicas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 124354
          mmTop = 6350
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel71: TppLabel
          UserName = 'Label71'
          Caption = '( [Tabela / Campo ] )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 124354
          mmTop = 10319
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'Line35'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
