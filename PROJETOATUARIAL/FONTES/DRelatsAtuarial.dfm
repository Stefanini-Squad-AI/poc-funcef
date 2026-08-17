inherited DtmRelatsAtuarial: TDtmRelatsAtuarial
  Left = 367
  Top = 163
  Width = 499
  Height = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 63
    Top = 5
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
    Left = 35
    Top = 5
  end
  inherited qryExemplo: TwwQuery
    Left = 7
    Top = 5
  end
  inherited rpExemplo: TppReport
    Left = 91
    Top = 5
  end
  object pp1: TppBDEPipeline
    DataSource = ds1
    Left = 63
    Top = 66
  end
  object ds1: TwwDataSource
    DataSet = q1
    Left = 35
    Top = 66
  end
  object q1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME FROM PESSOA WHERE ROWNUM < 10')
    ValidateWithMask = True
    Left = 7
    Top = 66
  end
  object rpt1: TppReport
    AutoStop = False
    DataPipeline = pp1
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
    Left = 91
    Top = 66
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object rpt1DBText2: TppDBText
        UserName = 'rpt1DBText2'
        DataField = 'NOME'
        DataPipeline = pp1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
    object rpt1SummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object pp2: TppBDEPipeline
    DataSource = ds2
    Left = 213
    Top = 298
  end
  object ds2: TwwDataSource
    DataSet = q2
    Left = 185
    Top = 298
  end
  object q2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME FROM PESSOA WHERE ROWNUM < 10')
    ValidateWithMask = True
    Left = 157
    Top = 298
  end
  object rpt2: TppReport
    AutoStop = False
    DataPipeline = pp2
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
    Left = 241
    Top = 298
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
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
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpt2DBText1: TppDBText
        UserName = 'rpt2DBText1'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pp2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpt2DBText2: TppDBText
        UserName = 'rpt2DBText2'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = pp2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69321
        mmTop = 0
        mmWidth = 10583
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
        OnPrint = LblSistemaPrint
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
        mmTop = 7144
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
        mmTop = 5292
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
  object pplVariavel: TppBDEPipeline
    DataSource = dsEmiteVariavel
    UserName = 'lVariavel'
    Left = 63
    Top = 36
  end
  object qryEmiteVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_VARIAVEL'
      'order by NO_VARIAVEL')
    ValidateWithMask = True
    Left = 7
    Top = 36
    object qryEmiteVariavelNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_VARIAVEL.NO_VARIAVEL'
    end
    object qryEmiteVariavelDS_VARIAVEL: TStringField
      FieldName = 'DS_VARIAVEL'
      Origin = 'FI_VARIAVEL.DS_VARIAVEL'
      Size = 80
    end
    object qryEmiteVariavelIM_VARIAVEL: TStringField
      FieldName = 'IM_VARIAVEL'
      Origin = 'FI_VARIAVEL.IM_VARIAVEL'
    end
    object qryEmiteVariavelVL_DEFAULT: TFloatField
      FieldName = 'VL_DEFAULT'
      Origin = 'FI_VARIAVEL.VL_DEFAULT'
    end
    object qryEmiteVariavelDS_SQL_CAMPO_BANCO: TMemoField
      FieldName = 'DS_SQL_CAMPO_BANCO'
      Origin = 'FI_VARIAVEL.DS_SQL_CAMPO_BANCO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEmiteVariavelNO_FUNCAO: TStringField
      FieldName = 'NO_FUNCAO'
      Origin = 'FI_VARIAVEL.NO_FUNCAO'
      Size = 30
    end
    object qryEmiteVariavelIR_OCOR_CALC_ATUARIAL: TStringField
      FieldName = 'IR_OCOR_CALC_ATUARIAL'
      Origin = 'FI_VARIAVEL.IR_OCOR_CALC_ATUARIAL'
      Size = 1
    end
    object qryEmiteVariavelIR_TABUA: TStringField
      FieldName = 'IR_TABUA'
      Origin = 'FI_VARIAVEL.IR_TABUA'
      Size = 1
    end
    object qryEmiteVariavelIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = 'FI_VARIAVEL.IR_DOMINIO_SISTEMA'
      Size = 3
    end
    object qryEmiteVariavelNO_CAMPO_BANCO: TStringField
      FieldName = 'NO_CAMPO_BANCO'
      Origin = 'FI_VARIAVEL.NO_CAMPO_BANCO'
      Size = 200
    end
  end
  object dsEmiteVariavel: TwwDataSource
    DataSet = qryEmiteVariavel
    Left = 35
    Top = 36
  end
  object rpVariavel: TppReport
    AutoStop = False
    DataPipeline = pplVariavel
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
    DeviceType = 'Screen'
    Left = 91
    Top = 36
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Relação de Variáveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 121179
        mmTop = 8731
        mmWidth = 42069
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel8'
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
      object rpVariavelShape1: TppShape
        UserName = 'rpVariavelShape1'
        Brush.Color = clSilver
        mmHeight = 6615
        mmLeft = 0
        mmTop = 18256
        mmWidth = 284692
        BandType = 0
      end
      object rpVariavelLabel4: TppLabel
        UserName = 'rpVariavelLabel4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 19579
        mmWidth = 8731
        BandType = 0
      end
      object rpVariavelLabel5: TppLabel
        UserName = 'rpVariavelLabel5'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59267
        mmTop = 19315
        mmWidth = 15346
        BandType = 0
      end
      object rpVariavelLabel6: TppLabel
        UserName = 'rpVariavelLabel6'
        Caption = 'Valor Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 196057
        mmTop = 19579
        mmWidth = 17463
        BandType = 0
      end
      object rpVariavelLabel7: TppLabel
        UserName = 'rpVariavelLabel7'
        Caption = 'Memória de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 218546
        mmTop = 19579
        mmWidth = 29633
        BandType = 0
      end
      object rpVariavelLabel8: TppLabel
        UserName = 'rpVariavelLabel8'
        Caption = 'Variável Indexada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 254001
        mmTop = 19579
        mmWidth = 26723
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpVariavelDBText1: TppDBText
        UserName = 'rpVariavelDBText1'
        DataField = 'DS_VARIAVEL'
        DataPipeline = pplVariavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 794
        mmWidth = 124354
        BandType = 4
      end
      object rpVariavelDBText2: TppDBText
        UserName = 'rpVariavelDBText2'
        DataField = 'VL_DEFAULT'
        DataPipeline = pplVariavel
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 186002
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object rpVariavelDBText3: TppDBText
        UserName = 'rpVariavelDBText3'
        OnGetText = rpVariavelDBText3GetText
        DataField = 'IR_OCOR_CALC_ATUARIAL'
        DataPipeline = pplVariavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 223309
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object rpVariavelDBText4: TppDBText
        UserName = 'rpVariavelDBText4'
        OnGetText = rpVariavelDBText4GetText
        DataField = 'IR_TABUA'
        DataPipeline = pplVariavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 258234
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object rpVariavelDBText5: TppDBText
        UserName = 'rpVariavelDBText5'
        DataField = 'NO_VARIAVEL'
        DataPipeline = pplVariavel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 794
        mmWidth = 52652
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel9'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 256117
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmLeft = 27517
        mmTop = 3175
        mmWidth = 229130
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
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryEmiteFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from FI_FORMULA'
      'order by NO_FORMULA')
    ValidateWithMask = True
    Left = 7
    Top = 95
    object qryEmiteFormulaCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'FI_FORMULA.CD_FORMULA'
    end
    object qryEmiteFormulaNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'FI_FORMULA.NO_FORMULA'
      Size = 80
    end
    object qryEmiteFormulaDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object qryEmiteFormulaNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'FI_FORMULA.NO_VARIAVEL_RESULT'
    end
    object qryEmiteFormulaNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_INICIAL'
    end
    object qryEmiteFormulaNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_FINAL'
    end
  end
  object dsEmiteFormula: TwwDataSource
    DataSet = qryEmiteFormula
    Left = 35
    Top = 95
  end
  object pplFormula: TppBDEPipeline
    DataSource = dsEmiteFormula
    UserName = 'lFormula'
    Left = 63
    Top = 95
  end
  object rpFormula: TppReport
    AutoStop = False
    DataPipeline = pplFormula
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
    DeviceType = 'Screen'
    Left = 91
    Top = 95
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Relação de Fórmulas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 121179
        mmTop = 8731
        mmWidth = 42863
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel11: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel11'
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
      object rpFormulaShape1: TppShape
        UserName = 'rpFormulaShape1'
        Brush.Color = clSilver
        mmHeight = 6615
        mmLeft = 0
        mmTop = 18785
        mmWidth = 284692
        BandType = 0
      end
      object rpFormulaLabel1: TppLabel
        UserName = 'rpFormulaLabel1'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 20108
        mmWidth = 8731
        BandType = 0
      end
      object rpFormulaLabel2: TppLabel
        UserName = 'rpFormulaLabel2'
        Caption = 'Expressão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 20108
        mmWidth = 16140
        BandType = 0
      end
      object rpFormulaLabel3: TppLabel
        UserName = 'rpFormulaLabel3'
        Caption = 'Variável de Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 221721
        mmTop = 20108
        mmWidth = 32544
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpFormulaDBText1: TppDBText
        UserName = 'rpFormulaDBText1'
        DataField = 'NO_FORMULA'
        DataPipeline = pplFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 794
        mmWidth = 93398
        BandType = 4
      end
      object rpFormulaDBMemo1: TppDBMemo
        UserName = 'rpFormulaDBMemo1'
        CharWrap = True
        DataField = 'DS_FORMULA'
        DataPipeline = pplFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 794
        mmWidth = 119592
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpFormulaDBText2: TppDBText
        UserName = 'rpFormulaDBText2'
        DataField = 'NO_VARIAVEL_RESULT'
        DataPipeline = pplFormula
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 221986
        mmTop = 794
        mmWidth = 61648
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel17'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 256117
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 3175
        mmWidth = 229130
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryCritica: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Select CD_GRUPO_PARTIC, NO_GRUPO_PARTIC, DS_CONDICAO,'
      '        count(CD_GRUPO_PARTIC) as Quantidade'
      'from TempTotal'
      'group by CD_GRUPO_PARTIC, NO_GRUPO_PARTIC, DS_CONDICAO')
    ValidateWithMask = True
    Left = 7
    Top = 214
    object qryCriticaCD_GRUPO_PARTIC: TIntegerField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"TempTotal.DB".CD_GRUPO_PARTIC'
    end
    object qryCriticaNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = '"TempTotal.DB".NO_GRUPO_PARTIC'
      Size = 60
    end
    object qryCriticaQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = '"TempTotal.DB".CD_GRUPO_PARTIC'
    end
    object qryCriticaDS_CONDICAO: TStringField
      FieldName = 'DS_CONDICAO'
      Origin = '"TempTotal.DB".DS_CONDICAO'
      Size = 200
    end
  end
  object pplCritica: TppBDEPipeline
    DataSource = dsCritica
    UserName = 'lCritica'
    Left = 63
    Top = 214
  end
  object dsCritica: TwwDataSource
    DataSet = qryCritica
    Left = 35
    Top = 214
  end
  object rpCritica: TppReport
    AutoStop = False
    DataPipeline = pplCritica
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
    DeviceType = 'Screen'
    Left = 91
    Top = 214
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Mapa de Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 127000
        mmTop = 15346
        mmWidth = 30427
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel13'
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
        mmTop = 9260
        mmWidth = 29633
        BandType = 0
      end
      object rpCriticaShape1: TppShape
        UserName = 'rpCriticaShape1'
        Brush.Color = clSilver
        mmHeight = 6615
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284692
        BandType = 0
      end
      object rpCriticaLabel1: TppLabel
        UserName = 'rpCriticaLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 27781
        mmWidth = 10319
        BandType = 0
      end
      object rpCriticaLabel2: TppLabel
        UserName = 'rpCriticaLabel2'
        Caption = 'Crítica de Enquadramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 27781
        mmWidth = 38894
        BandType = 0
      end
      object rpCriticaLabel3: TppLabel
        UserName = 'rpCriticaLabel3'
        Caption = 'Quantidade de Críticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 244475
        mmTop = 27781
        mmWidth = 34131
        BandType = 0
      end
      object rpCriticaLabel4: TppLabel
        UserName = 'rpCriticaLabel4'
        Caption = 'Crítica de Enquadramento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 104775
        mmTop = 27781
        mmWidth = 38894
        BandType = 0
      end
      object LblEntidade: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'LblEntidade'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 193675
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpCriticaDBText1: TppDBText
        UserName = 'rpCriticaDBText1'
        DataField = 'CD_GRUPO_PARTIC'
        DataPipeline = pplCritica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object rpCriticaDBText2: TppDBText
        UserName = 'rpCriticaDBText2'
        DataField = 'NO_GRUPO_PARTIC'
        DataPipeline = pplCritica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17727
        mmTop = 794
        mmWidth = 84138
        BandType = 4
      end
      object rpCriticaDBText3: TppDBText
        UserName = 'rpCriticaDBText3'
        DataField = 'Quantidade'
        DataPipeline = pplCritica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 250296
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object rpCriticaDBMemo1: TppDBMemo
        UserName = 'rpCriticaDBMemo1'
        CharWrap = True
        DataField = 'DS_CONDICAO'
        DataPipeline = pplCritica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 104246
        mmTop = 529
        mmWidth = 140759
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
        mmWidth = 283634
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257440
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryCriticaDemonst: TwwQuery
    DatabaseName = 'BdTemporario'
    SQL.Strings = (
      'Select distinct * from TempDemonst'
      'order by CD_GRUPO_PARTIC, NR_MATRICULA, NO_PARTICIPANTE')
    ValidateWithMask = True
    Left = 7
    Top = 244
    object qryCriticaDemonstCD_GRUPO_PARTIC: TIntegerField
      FieldName = 'CD_GRUPO_PARTIC'
    end
    object qryCriticaDemonstNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Size = 60
    end
    object qryCriticaDemonstNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object qryCriticaDemonstNO_PARTICIPANTE: TStringField
      FieldName = 'NO_PARTICIPANTE'
      Size = 60
    end
    object qryCriticaDemonstDS_VALOR: TStringField
      FieldName = 'DS_VALOR'
      Size = 80
    end
  end
  object dsCriticaDemonst: TwwDataSource
    DataSet = qryCriticaDemonst
    Left = 35
    Top = 244
  end
  object pplCriticaDemonst: TppBDEPipeline
    DataSource = dsCriticaDemonst
    UserName = 'lCriticaDemonst'
    Left = 63
    Top = 244
  end
  object rpCriticaDemonst: TppReport
    AutoStop = False
    DataPipeline = pplCriticaDemonst
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
    Left = 91
    Top = 244
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Demonstrativo Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 74613
        mmTop = 15346
        mmWidth = 48154
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23283
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel16'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 8202
        mmWidth = 29633
        BandType = 0
      end
      object rpCriticaDemonstLabel5: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'rpCriticaDemonstLabel5'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpCriticaDemonstDBText3: TppDBText
        UserName = 'rpCriticaDemonstDBText3'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplCriticaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 8202
        mmTop = 1058
        mmWidth = 24871
        BandType = 4
      end
      object rpCriticaDemonstDBText4: TppDBText
        UserName = 'rpCriticaDemonstDBText4'
        DataField = 'NO_PARTICIPANTE'
        DataPipeline = pplCriticaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 34660
        mmTop = 1058
        mmWidth = 79111
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DS_VALOR'
        DataPipeline = pplCriticaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 118004
        mmTop = 1058
        mmWidth = 79111
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel21: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel21'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCriticaDemonstGroup1: TppGroup
      BreakName = 'CD_GRUPO_PARTIC'
      DataPipeline = pplCriticaDemonst
      UserName = 'rpCriticaDemonstGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCriticaDemonstGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpCriticaDemonstShape1: TppShape
          UserName = 'rpCriticaDemonstShape1'
          Brush.Color = clSilver
          mmHeight = 6350
          mmLeft = 0
          mmTop = 529
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstLabel1: TppLabel
          UserName = 'rpCriticaDemonstLabel1'
          Caption = 'Código: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstLabel2: TppLabel
          UserName = 'rpCriticaDemonstLabel2'
          Caption = 'Crítica de Enquadramento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 39952
          mmTop = 1852
          mmWidth = 40481
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstDBText1: TppDBText
          UserName = 'rpCriticaDemonstDBText1'
          DataField = 'CD_GRUPO_PARTIC'
          DataPipeline = pplCriticaDemonst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 14552
          mmTop = 1852
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstDBText2: TppDBText
          UserName = 'rpCriticaDemonstDBText2'
          DataField = 'NO_GRUPO_PARTIC'
          DataPipeline = pplCriticaDemonst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 81756
          mmTop = 1852
          mmWidth = 100013
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstLabel3: TppLabel
          UserName = 'rpCriticaDemonstLabel3'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 8202
          mmTop = 8202
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpCriticaDemonstLabel4: TppLabel
          UserName = 'rpCriticaDemonstLabel4'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 34925
          mmTop = 8202
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 118004
          mmTop = 8202
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCriticaDemonstGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
    end
  end
  object qryEmiteHipotese: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.DS_HIPOTESE as "Descrição", '
      '           a.DT_GERACAO as "Data de Geração", '
      '           c.DS_ITEM_HIPOTESE as "Item",'
      '           b.VL_HIPOTESE as "Valor",'
      '           b.IR_GERA_TAB_SERVICO,'
      '           d1.DS_TABUA as "Tábua Masculina",'
      '           d2.DS_TABUA as "Tábua Feminina",'
      '           d3.DS_TABUA as "Tábua Pensao"          '
      'from FI_HIPOTESE a, '
      '        FI_COMPOSICAO_HIPOTESE b,'
      '        FI_ITEM_HIPOTESE c, '
      '        FI_TABUA d1,'
      '        FI_TABUA d2,'
      '        FI_TABUA d3'
      'where a.CD_HIPOTESE = :CD_HIPOTESE and '
      '           a.CD_HIPOTESE = b.CD_HIPOTESE and '
      '           b.SQ_VERSAO_COMUTACAO_MAS = d1.CD_TABUA (+)  and '
      '           b.SQ_VERSAO_COMUTACAO_FEM = d2.CD_TABUA (+) and '
      '           b.SQ_VERSAO_COMUTACAO_PEN = d3.CD_TABUA (+) and '
      '           b.CD_ITEM_HIPOTESE = c.CD_ITEM_HIPOTESE ')
    ValidateWithMask = True
    Left = 7
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_HIPOTESE'
        ParamType = ptUnknown
      end>
    object qryEmiteHipoteseDescrio: TStringField
      FieldName = 'Descrição'
      FixedChar = True
      Size = 50
    end
    object qryEmiteHipoteseDatadeGerao: TDateTimeField
      FieldName = 'Data de Geração'
    end
    object qryEmiteHipoteseItem: TStringField
      FieldName = 'Item'
      FixedChar = True
      Size = 50
    end
    object qryEmiteHipoteseValor: TFloatField
      FieldName = 'Valor'
    end
    object qryEmiteHipoteseTbuaMasculina: TStringField
      FieldName = 'Tábua Masculina'
      FixedChar = True
      Size = 50
    end
    object qryEmiteHipoteseTbuaFeminina: TStringField
      FieldName = 'Tábua Feminina'
      FixedChar = True
      Size = 50
    end
    object qryEmiteHipoteseTbuaPensao: TStringField
      FieldName = 'Tábua Pensao'
      FixedChar = True
      Size = 50
    end
    object qryEmiteHipoteseIR_GERA_TAB_SERVICO: TStringField
      FieldName = 'IR_GERA_TAB_SERVICO'
      FixedChar = True
      Size = 1
    end
  end
  object dsEmiteHipotese: TwwDataSource
    DataSet = qryEmiteHipotese
    Left = 35
    Top = 125
  end
  object pplHipotese: TppBDEPipeline
    DataSource = dsEmiteHipotese
    UserName = 'lHipotese'
    Left = 63
    Top = 125
    object pplHipoteseppField1: TppField
      FieldAlias = 'Descrição'
      FieldName = 'Descrição'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplHipoteseppField2: TppField
      FieldAlias = 'Data de Geração'
      FieldName = 'Data de Geração'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplHipoteseppField3: TppField
      FieldAlias = 'Item'
      FieldName = 'Item'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object pplHipoteseppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'Valor'
      FieldName = 'Valor'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplHipoteseppField5: TppField
      FieldAlias = 'Tábua Masculina'
      FieldName = 'Tábua Masculina'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pplHipoteseppField6: TppField
      FieldAlias = 'Tábua Feminina'
      FieldName = 'Tábua Feminina'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplHipoteseppField7: TppField
      FieldAlias = 'Tábua Pensao'
      FieldName = 'Tábua Pensao'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pplHipoteseppField8: TppField
      FieldAlias = 'IR_GERA_TAB_SERVICO'
      FieldName = 'IR_GERA_TAB_SERVICO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
  end
  object rpHipotese: TppReport
    AutoStop = False
    DataPipeline = pplHipotese
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
    Left = 91
    Top = 125
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Hipótese de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78317
        mmTop = 8731
        mmWidth = 40481
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel20: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel20'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpHipotesteShape1: TppShape
        UserName = 'rpHipotesteShape1'
        Brush.Color = clSilver
        mmHeight = 7673
        mmLeft = 0
        mmTop = 24871
        mmWidth = 197644
        BandType = 0
      end
      object rpHipotesteLabel1: TppLabel
        UserName = 'rpHipotesteLabel1'
        Caption = 'Calc. Tábua Serv.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 26723
        mmWidth = 26458
        BandType = 0
      end
      object rpHipotesteLabel2: TppLabel
        UserName = 'rpHipotesteLabel2'
        Caption = 'Descrição: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 18785
        mmWidth = 16933
        BandType = 0
      end
      object rpHipotesteLabel3: TppLabel
        UserName = 'rpHipotesteLabel3'
        Caption = 'Data de Geração: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 85196
        mmTop = 18785
        mmWidth = 26458
        BandType = 0
      end
      object rpHipotesteDBText1: TppDBText
        UserName = 'rpHipotesteDBText1'
        DataField = 'Descrição'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21431
        mmTop = 18785
        mmWidth = 60061
        BandType = 0
      end
      object rpHipotesteDBText2: TppDBText
        UserName = 'rpHipotesteDBText2'
        DataField = 'Data de Geração'
        DataPipeline = pplHipotese
        DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 18785
        mmWidth = 47096
        BandType = 0
      end
      object rpHipotesteLabel4: TppLabel
        UserName = 'rpHipotesteLabel4'
        Caption = 'Ítem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 26723
        mmWidth = 6615
        BandType = 0
      end
      object rpHipotesteLabel5: TppLabel
        UserName = 'rpHipotesteLabel5'
        Caption = 'Tábua'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 53446
        mmTop = 26723
        mmWidth = 9260
        BandType = 0
      end
      object rpHipotesteLabel6: TppLabel
        UserName = 'rpHipotesteLabel6'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 150813
        mmTop = 26723
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object rpHipotesteDBText3: TppDBText
        UserName = 'rpHipotesteDBText3'
        DataField = 'Item'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 1058
        mmWidth = 47361
        BandType = 4
      end
      object rpHipotesteDBText4: TppDBText
        UserName = 'rpHipotesteDBText4'
        DataField = 'Tábua Masculina'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53181
        mmTop = 794
        mmWidth = 95250
        BandType = 4
      end
      object rpHipotesteDBText5: TppDBText
        UserName = 'rpHipotesteDBText5'
        OnGetText = rpHipotesteDBText5GetText
        DataField = 'IR_GERA_TAB_SERVICO'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object rpHipotesteDBText6: TppDBText
        UserName = 'rpHipotesteDBText6'
        DataField = 'Valor'
        DataPipeline = pplHipotese
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 128059
        mmTop = 794
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'Tábua Feminina'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53181
        mmTop = 5556
        mmWidth = 95250
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText401'
        DataField = 'Tábua Pensao'
        DataPipeline = pplHipotese
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53181
        mmTop = 10319
        mmWidth = 95250
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel25: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel25'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
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
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object QryGrupoFormulas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select distinct  b.DT_GERACAO,'
      '                      b.CD_PESSOA_ENTID,'
      '                      b.CD_PESSOA_PATROC,'
      '                      b.CD_PLANO,'
      '                      b.CD_PARTIC,'
      '                      a.ds_grupo_formula,'
      '                      p.no_pessoa,'
      '                      p.NR_MATRICULA,'
      '                      p.CD_VERSAO,'
      '                      g.no_grupo_partic'
      '          from'
      '              fi_grupo_formula a,'
      '              fi_ocor_calculo_atuarial b,'
      '              fi_sequencia_formula c,'
      '              fi_participante p,'
      '              fi_grupo_participante g'
      '          where'
      '              b.DT_GERACAO       = :DT_GERACAO'
      '    and    b.CD_PESSOA_ENTID     = :CD_PESSOA_ENTID'
      '    and    b.CD_PESSOA_PATROC    = :CD_PESSOA_PATROC'
      '    and    b.CD_PLANO            = :CD_PLANO'
      '    and    b.CD_PARTIC           = :CD_PARTIC'
      '    and    b.CD_VERSAO           = :CD_VERSAO'
      '    and    b.CD_VERSAO           = p.CD_VERSAO'
      '    and    b.CD_PARTIC           = p.CD_PARTIC'
      '    and    b.CD_GRUPO_PARTIC     = g.CD_GRUPO_PARTIC'
      '    and    a.CD_GRUPO_FORMULA    = C.CD_GRUPO_FORMULA'
      '    and    b.CD_FORMULA          = C.CD_FORMULA'
      '    and    c.CD_GRUPO_FORMULA'
      
        '               in (select cd_grupo_formula from   fi_composicao_' +
        'calculo_benef d'
      
        '                          where    b.CD_PESSOA_ENTID     =  d.CD' +
        '_PESSOA_ENTID'
      
        '                            and    b.CD_PESSOA_PATROC    =  d.CD' +
        '_PESSOA_PATROC'
      
        '                            and    b.CD_PLANO            =  d.CD' +
        '_PLANO'
      
        '                            and    b.CD_pARTIC           =  :CD_' +
        'PARTIC'
      
        '                            and    b.CD_TIPO_BENEF       =  d.CD' +
        '_TIPO_BENEF'
      
        '                            and    b.CD_GRUPO_PARTIC     =  d.CD' +
        '_GRUPO_PARTIC)'
      ''
      'union'
      ''
      'select distinct b.DT_GERACAO,'
      '                b.CD_PESSOA_ENTID,'
      '                b.CD_PESSOA_PATROC,'
      '                b.CD_PLANO,'
      '                b.CD_PARTIC,'
      '                a.ds_grupo_formula,'
      '                p.no_pessoa,'
      '                p.NR_MATRICULA,                '
      '                p.CD_VERSAO,                '
      '                g.no_grupo_partic'
      '          from'
      '              fi_grupo_formula a,'
      '              fi_ocor_calculo_atuarial b,'
      '              fi_sequencia_formula c,'
      '              fi_participante p,'
      '              fi_grupo_participante g'
      ''
      '          where'
      '              b.DT_GERACAO       = :DT_GERACAO'
      '    and    b.CD_PESSOA_ENTID     = :CD_PESSOA_ENTID'
      '    and    b.CD_PESSOA_PATROC    = :CD_PESSOA_PATROC'
      '    and    b.CD_PLANO            = :CD_PLANO'
      '    and    b.CD_PARTIC           = :CD_PARTIC'
      '    and    b.CD_VERSAO           = :CD_VERSAO'
      '    and    b.CD_VERSAO           = p.CD_VERSAO'
      '    and    b.CD_PARTIC           = p.CD_PARTIC'
      '    and    b.CD_GRUPO_PARTIC     = g.CD_GRUPO_PARTIC'
      '    and    a.CD_GRUPO_FORMULA    = C.CD_GRUPO_FORMULA'
      '    and    b.CD_FORMULA          = C.CD_FORMULA'
      '    and    c.CD_GRUPO_FORMULA'
      
        '               in (select cd_grupo_formula from   fi_composicao_' +
        'calculo d'
      
        '                          where    b.CD_PESSOA_ENTID     =  d.CD' +
        '_PESSOA_ENTID'
      
        '                            and    b.CD_PESSOA_PATROC    =  d.CD' +
        '_PESSOA_PATROC'
      
        '                            and    b.CD_PLANO            =  d.CD' +
        '_PLANO'
      
        '                            and    b.CD_GRUPO_PARTIC     =  d.CD' +
        '_GRUPO_PARTIC)'
      '')
    ValidateWithMask = True
    Left = 157
    Top = 63
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object QryGrupoFormulasDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
    end
    object QryGrupoFormulasCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
    end
    object QryGrupoFormulasCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
    end
    object QryGrupoFormulasCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
    end
    object QryGrupoFormulasCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object QryGrupoFormulasDS_GRUPO_FORMULA: TStringField
      FieldName = 'DS_GRUPO_FORMULA'
      Size = 80
    end
    object QryGrupoFormulasNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Size = 60
    end
    object QryGrupoFormulasNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object QryGrupoFormulasCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object QryGrupoFormulasNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object dsGrupoFormulas: TwwDataSource
    DataSet = QryGrupoFormulas
    Left = 185
    Top = 63
  end
  object QryFormulas: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGrupoFormulas
    SQL.Strings = (
      'select     distinct a.*, '
      '           b.DT_GERACAO,'
      '           b.CD_PESSOA_ENTID,'
      '           b.CD_PESSOA_PATROC,'
      '           b.CD_PLANO,'
      '           b.CD_PARTIC,'
      '           c.NR_ORDEM_FORMULA'
      ''
      '          from'
      '              fi_formula a,'
      '              fi_ocor_calculo_atuarial b,'
      '              FI_SEQUENCIA_FORMULA c'
      ''
      '          where'
      '           b.DT_GERACAO         = :DT_GERACAO'
      '    and    b.CD_PESSOA_ENTID    = :CD_PESSOA_ENTID'
      '    and    b.CD_PESSOA_PATROC   = :CD_PESSOA_PATROC'
      '    and    b.CD_PLANO           = :CD_PLANO'
      '    and    b.CD_PARTIC          = :CD_PARTIC'
      '    and    b.CD_VERSAO          = :CD_VERSAO'
      '    and    b.CD_FORMULA         =  a.CD_FORMULA'
      '    and    c.CD_FORMULA         =  a.CD_FORMULA'
      ''
      'order by c.NR_ORDEM_FORMULA')
    ValidateWithMask = True
    Left = 157
    Top = 92
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object QryFormulasCD_FORMULA: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'FI_FORMULA.CD_FORMULA'
    end
    object QryFormulasNO_FORMULA: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'FI_FORMULA.NO_FORMULA'
      Size = 80
    end
    object QryFormulasDS_FORMULA: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object QryFormulasNO_VARIAVEL_RESULT: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'FI_FORMULA.NO_VARIAVEL_RESULT'
    end
    object QryFormulasNO_VARIAVEL_INICIAL: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_INICIAL'
    end
    object QryFormulasNO_VARIAVEL_FINAL: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_FINAL'
    end
    object QryFormulasDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".DT_GERACAO'
    end
    object QryFormulasCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_ENTID'
    end
    object QryFormulasCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_PATROC'
    end
    object QryFormulasCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PLANO'
    end
    object QryFormulasCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PARTIC'
    end
  end
  object dsFormulas: TwwDataSource
    DataSet = QryFormulas
    Left = 185
    Top = 92
  end
  object QryOcorCalculoATu: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGrupoFormulas
    SQL.Strings = (
      'select distinct no_variavel, vl_calculo_atuarial'
      '   from'
      '      fi_refer_calculo_atuarial e,'
      '      fi_ocor_calculo_atuarial b'
      ' where'
      '        b.DT_GERACAO          = :DT_GERACAO'
      ' and    b.CD_PESSOA_ENTID     = :CD_PESSOA_ENTID'
      ' and    b.CD_PESSOA_PATROC    = :CD_PESSOA_PATROC'
      ' and    b.CD_PLANO            = :CD_PLANO'
      ' and    b.CD_PARTIC           = :CD_PARTIC'
      ' and    b.CD_VERSAO           = :CD_VERSAO'
      ' and    e.CD_VERSAO           = b.CD_VERSAO'
      ' and    b.DT_GERACAO          = e.DT_GERACAO'
      ' and    b.CD_PESSOA_ENTID     = e.CD_PESSOA_ENTID'
      ' and    b.CD_PESSOA_PATROC    = e.CD_PESSOA_PATROC'
      ' and    b.CD_PLANO            = e.CD_PLANO')
    ValidateWithMask = True
    Left = 157
    Top = 121
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object QryOcorCalculoATuNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".NO_VARIAVEL'
    end
    object QryOcorCalculoATuVL_CALCULO_ATUARIAL: TFloatField
      FieldName = 'VL_CALCULO_ATUARIAL'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".VL_CALCULO_ATUARIAL'
    end
  end
  object dsOcorCalculoATu: TwwDataSource
    DataSet = QryOcorCalculoATu
    Left = 185
    Top = 121
  end
  object pplGrupoFormulas: TppBDEPipeline
    DataSource = dsGrupoFormulas
    UserName = 'lGrupoFormulas'
    Left = 213
    Top = 63
  end
  object pplFormulas: TppBDEPipeline
    DataSource = dsFormulas
    UserName = 'lFormulas'
    Left = 213
    Top = 92
  end
  object pplOcorCalculoATu: TppBDEPipeline
    DataSource = dsOcorCalculoATu
    UserName = 'lOcorCalculoATu'
    Left = 213
    Top = 121
    object pplOcorCalculoATuppField1: TppField
      FieldAlias = 'NO_VARIAVEL'
      FieldName = 'NO_VARIAVEL'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplOcorCalculoATuppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_CALCULO_ATUARIAL'
      FieldName = 'VL_CALCULO_ATUARIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
  object rpMemoriaCalculo: TppReport
    AutoStop = False
    DataPipeline = pplGrupoFormulas
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
    Left = 241
    Top = 92
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Memória de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78581
        mmTop = 16933
        mmWidth = 40217
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24871
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel22: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel22'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 9790
        mmWidth = 29633
        BandType = 0
      end
      object rpMemoriaCalculoLabel12: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'rpMemoriaCalculoLabel12'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object rpMemoriaCalculoSubReport1: TppSubReport
        UserName = 'rpMemoriaCalculoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpMemoriaCalculoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplFormulas
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport1'
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
          Left = 286
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object rpMemoriaCalculoHeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object rpMemoriaCalculoLabel1: TppLabel
              UserName = 'rpMemoriaCalculoLabel1'
              Caption = 'Nome da Fórmula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 1852
              mmTop = 529
              mmWidth = 26194
              BandType = 0
            end
            object rpMemoriaCalculoLabel2: TppLabel
              UserName = 'rpMemoriaCalculoLabel2'
              Caption = 'Variável de Resultado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 529
              mmWidth = 32544
              BandType = 0
            end
            object rpMemoriaCalculoLabel3: TppLabel
              UserName = 'rpMemoriaCalculoLabel3'
              Caption = 'Variável Inicial Somatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 79640
              mmTop = 4763
              mmWidth = 38100
              BandType = 0
            end
            object rpMemoriaCalculoLabel4: TppLabel
              UserName = 'rpMemoriaCalculoLabel4'
              Caption = 'Variável Final Somatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 80433
              mmTop = 8996
              mmWidth = 36248
              BandType = 0
            end
            object rpMemoriaCalculoLabel5: TppLabel
              UserName = 'rpMemoriaCalculoLabel5'
              Caption = 'Fórmula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 156369
              mmTop = 529
              mmWidth = 12171
              BandType = 0
            end
            object rpMemoriaCalculoLine1: TppLine
              UserName = 'rpMemoriaCalculoLine1'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 29369
              mmTop = 3969
              mmWidth = 49477
              BandType = 0
            end
            object rpMemoriaCalculoLine2: TppLine
              UserName = 'rpMemoriaCalculoLine2'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 118534
              mmTop = 3969
              mmWidth = 36513
              BandType = 0
            end
            object rpMemoriaCalculoLine3: TppLine
              UserName = 'rpMemoriaCalculoLine3'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 169863
              mmTop = 3969
              mmWidth = 26723
              BandType = 0
            end
          end
          object rpMemoriaCalculoDetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 15081
            mmPrintPosition = 0
            object rpMemoriaCalculoDBText1: TppDBText
              UserName = 'rpMemoriaCalculoDBText1'
              DataField = 'NO_FORMULA'
              DataPipeline = pplFormulas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 1852
              mmTop = 529
              mmWidth = 68792
              BandType = 4
            end
            object rpMemoriaCalculoDBText2: TppDBText
              UserName = 'rpMemoriaCalculoDBText2'
              DataField = 'NO_VARIAVEL_RESULT'
              DataPipeline = pplFormulas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 529
              mmWidth = 32808
              BandType = 4
            end
            object rpMemoriaCalculoDBText3: TppDBText
              UserName = 'rpMemoriaCalculoDBText3'
              DataField = 'NO_VARIAVEL_INICIAL'
              DataPipeline = pplFormulas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 5027
              mmWidth = 32808
              BandType = 4
            end
            object rpMemoriaCalculoDBText4: TppDBText
              UserName = 'rpMemoriaCalculoDBText4'
              DataField = 'NO_VARIAVEL_FINAL'
              DataPipeline = pplFormulas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82021
              mmTop = 9525
              mmWidth = 33073
              BandType = 4
            end
            object rpMemoriaCalculoDBMemo1: TppDBMemo
              UserName = 'rpMemoriaCalculoDBMemo1'
              CharWrap = True
              DataField = 'DS_FORMULA'
              DataPipeline = pplFormulas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 13229
              mmLeft = 126736
              mmTop = 529
              mmWidth = 68792
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
      object rpMemoriaCalculoSubReport2: TppSubReport
        UserName = 'rpMemoriaCalculoSubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpMemoriaCalculoSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpMemoriaCalculoChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplOcorCalculoATu
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport2'
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
          Left = 306
          Top = 212
          Version = '5.5'
          mmColumnWidth = 0
          object rpMemoriaCalculoHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object rpMemoriaCalculoLabel6: TppLabel
              UserName = 'rpMemoriaCalculoLabel6'
              Caption = 'Nome da Variável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 44186
              mmTop = 1323
              mmWidth = 26458
              BandType = 0
            end
            object rpMemoriaCalculoLabel7: TppLabel
              UserName = 'rpMemoriaCalculoLabel7'
              Caption = 'Valor Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 131234
              mmTop = 1323
              mmWidth = 23548
              BandType = 0
            end
            object rpMemoriaCalculoLine4: TppLine
              UserName = 'rpMemoriaCalculoLine4'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 794
              mmTop = 4233
              mmWidth = 42069
              BandType = 0
            end
            object rpMemoriaCalculoLine5: TppLine
              UserName = 'rpMemoriaCalculoLine5'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 71967
              mmTop = 4233
              mmWidth = 57944
              BandType = 0
            end
            object rpMemoriaCalculoLine6: TppLine
              UserName = 'rpMemoriaCalculoLine6'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 156104
              mmTop = 4233
              mmWidth = 41010
              BandType = 0
            end
          end
          object rpMemoriaCalculoDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpMemoriaCalculoDBText5: TppDBText
              UserName = 'rpMemoriaCalculoDBText5'
              DataField = 'NO_VARIAVEL'
              DataPipeline = pplOcorCalculoATu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 44186
              mmTop = 529
              mmWidth = 60590
              BandType = 4
            end
            object rpMemoriaCalculoDBText6: TppDBText
              UserName = 'rpMemoriaCalculoDBText6'
              DataField = 'VL_CALCULO_ATUARIAL'
              DataPipeline = pplOcorCalculoATu
              DisplayFormat = '##,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 115094
              mmTop = 529
              mmWidth = 39423
              BandType = 4
            end
          end
        end
      end
      object rpMemoriaCalculoLabel8: TppLabel
        UserName = 'rpMemoriaCalculoLabel8'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 2117
        mmWidth = 15875
        BandType = 4
      end
      object rpMemoriaCalculoLabel9: TppLabel
        UserName = 'rpMemoriaCalculoLabel9'
        Caption = 'Participante: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 2117
        mmWidth = 19844
        BandType = 4
      end
      object rpMemoriaCalculoLabel10: TppLabel
        UserName = 'rpMemoriaCalculoLabel10'
        Caption = 'Grupo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 136525
        mmTop = 2117
        mmWidth = 10583
        BandType = 4
      end
      object rpMemoriaCalculoLabel11: TppLabel
        UserName = 'rpMemoriaCalculoLabel11'
        Caption = 'Rotina de Cálculo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 9260
        mmWidth = 27517
        BandType = 4
      end
      object rpMemoriaCalculoDBText7: TppDBText
        UserName = 'rpMemoriaCalculoDBText7'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplGrupoFormulas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 2117
        mmWidth = 25400
        BandType = 4
      end
      object rpMemoriaCalculoDBText8: TppDBText
        UserName = 'rpMemoriaCalculoDBText8'
        DataField = 'NO_PESSOA'
        DataPipeline = pplGrupoFormulas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 65617
        mmTop = 2117
        mmWidth = 70115
        BandType = 4
      end
      object rpMemoriaCalculoDBText9: TppDBText
        UserName = 'rpMemoriaCalculoDBText9'
        DataField = 'DS_GRUPO_FORMULA'
        DataPipeline = pplGrupoFormulas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 9260
        mmWidth = 89959
        BandType = 4
      end
      object rpMemoriaCalculoDBMemo2: TppDBMemo
        UserName = 'rpMemoriaCalculoDBMemo2'
        CharWrap = False
        DataField = 'NO_GRUPO_PARTIC'
        DataPipeline = pplGrupoFormulas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 12700
        mmLeft = 147638
        mmTop = 2117
        mmWidth = 49477
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel27: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel27'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
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
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryGFormulasHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select distinct  b.DT_GERACAO,'
      '                      b.CD_PESSOA_ENTID,'
      '                      b.CD_PESSOA_PATROC,'
      '                      b.CD_PLANO,'
      '                      b.CD_PARTIC,'
      '                      a.ds_grupo_formula,'
      '                      p.no_pessoa,'
      '                      p.NR_MATRICULA,'
      '                      p.CD_VERSAO,'
      '                      g.no_grupo_partic'
      '          from'
      '              fi_grupo_formula a,'
      '              fi_bk_ocor_calculo_atuarial b,'
      '              fi_sequencia_formula c,'
      '              fi_bk_participante p,'
      '              fi_grupo_participante g'
      '          where'
      '              b.DT_GERACAO       = :DT_GERACAO'
      '    and    b.CD_PARTIC           = :CD_PARTIC'
      '    and    b.CD_VERSAO           = :CD_VERSAO'
      '    and    b.CD_VERSAO           = p.CD_VERSAO'
      '    and    b.CD_PARTIC           = p.CD_PARTIC'
      '    and    b.CD_GRUPO_PARTIC     = g.CD_GRUPO_PARTIC'
      '    and    a.CD_GRUPO_FORMULA    = C.CD_GRUPO_FORMULA'
      '    and    b.CD_FORMULA          = C.CD_FORMULA'
      '    and    c.CD_GRUPO_FORMULA'
      
        '               in (select cd_grupo_formula from   fi_composicao_' +
        'calculo_benef d'
      
        '                          where    b.CD_PESSOA_ENTID     =  d.CD' +
        '_PESSOA_ENTID'
      
        '                            and    b.CD_PESSOA_PATROC    =  d.CD' +
        '_PESSOA_PATROC'
      
        '                            and    b.CD_PLANO            =  d.CD' +
        '_PLANO'
      
        '                            and    b.CD_pARTIC           =  :CD_' +
        'PARTIC'
      
        '                            and    b.CD_TIPO_BENEF       =  d.CD' +
        '_TIPO_BENEF'
      
        '                            and    b.CD_GRUPO_PARTIC     =  d.CD' +
        '_GRUPO_PARTIC)'
      ''
      'union'
      ''
      'select distinct b.DT_GERACAO,'
      '                b.CD_PESSOA_ENTID,'
      '                b.CD_PESSOA_PATROC,'
      '                b.CD_PLANO,'
      '                b.CD_PARTIC,'
      '                a.ds_grupo_formula,'
      '                p.no_pessoa,'
      '                p.NR_MATRICULA,                '
      '                p.CD_VERSAO,                '
      '                g.no_grupo_partic'
      '          from'
      '              fi_grupo_formula a,'
      '              fi_bk_ocor_calculo_atuarial b,'
      '              fi_sequencia_formula c,'
      '              fi_bk_participante p,'
      '              fi_grupo_participante g'
      ''
      '          where'
      '              b.DT_GERACAO       = :DT_GERACAO'
      '    and    b.CD_PARTIC           = :CD_PARTIC'
      '    and    b.CD_VERSAO           = :CD_VERSAO'
      '    and    b.CD_VERSAO           = p.CD_VERSAO'
      '    and    b.CD_PARTIC           = p.CD_PARTIC'
      '    and    b.CD_GRUPO_PARTIC     = g.CD_GRUPO_PARTIC'
      '    and    a.CD_GRUPO_FORMULA    = C.CD_GRUPO_FORMULA'
      '    and    b.CD_FORMULA          = C.CD_FORMULA'
      '    and    c.CD_GRUPO_FORMULA'
      
        '               in (select cd_grupo_formula from   fi_composicao_' +
        'calculo d'
      
        '                          where    b.CD_PESSOA_ENTID     =  d.CD' +
        '_PESSOA_ENTID'
      
        '                            and    b.CD_PESSOA_PATROC    =  d.CD' +
        '_PESSOA_PATROC'
      
        '                            and    b.CD_PLANO            =  d.CD' +
        '_PLANO'
      
        '                            and    b.CD_GRUPO_PARTIC     =  d.CD' +
        '_GRUPO_PARTIC)'
      '')
    ValidateWithMask = True
    Left = 157
    Top = 150
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_GERACAO'
    end
    object FloatField1: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
    end
    object FloatField2: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
    end
    object FloatField3: TFloatField
      FieldName = 'CD_PLANO'
    end
    object FloatField4: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object StringField1: TStringField
      FieldName = 'DS_GRUPO_FORMULA'
      Size = 80
    end
    object StringField2: TStringField
      FieldName = 'NO_PESSOA'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object FloatField5: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object StringField4: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Size = 60
    end
  end
  object dsGFormulasHist: TwwDataSource
    DataSet = qryGFormulasHist
    Left = 185
    Top = 150
  end
  object qryFormulasHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGFormulasHist
    SQL.Strings = (
      'select     distinct a.*, '
      '           b.DT_GERACAO,'
      '           b.CD_PESSOA_ENTID,'
      '           b.CD_PESSOA_PATROC,'
      '           b.CD_PLANO,'
      '           b.CD_PARTIC,'
      '           c.NR_ORDEM_FORMULA'
      ''
      '          from'
      '              fi_formula a,'
      '              fi_bk_ocor_calculo_atuarial b,'
      '              FI_SEQUENCIA_FORMULA c'
      ''
      '          where'
      '           b.DT_GERACAO         = :DT_GERACAO'
      '    and    b.CD_PESSOA_ENTID    = :CD_PESSOA_ENTID'
      '    and    b.CD_PESSOA_PATROC   = :CD_PESSOA_PATROC'
      '    and    b.CD_PLANO           = :CD_PLANO'
      '    and    b.CD_PARTIC          = :CD_PARTIC'
      '    and    b.CD_VERSAO          = :CD_VERSAO'
      '    and    b.CD_FORMULA         =  a.CD_FORMULA'
      '    and    c.CD_FORMULA         =  a.CD_FORMULA'
      ''
      'order by c.NR_ORDEM_FORMULA')
    ValidateWithMask = True
    Left = 157
    Top = 180
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object FloatField6: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = 'FI_FORMULA.CD_FORMULA'
    end
    object StringField5: TStringField
      FieldName = 'NO_FORMULA'
      Origin = 'FI_FORMULA.NO_FORMULA'
      Size = 80
    end
    object MemoField1: TMemoField
      FieldName = 'DS_FORMULA'
      Origin = 'FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
    object StringField6: TStringField
      FieldName = 'NO_VARIAVEL_RESULT'
      Origin = 'FI_FORMULA.NO_VARIAVEL_RESULT'
    end
    object StringField7: TStringField
      FieldName = 'NO_VARIAVEL_INICIAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_INICIAL'
    end
    object StringField8: TStringField
      FieldName = 'NO_VARIAVEL_FINAL'
      Origin = 'FI_FORMULA.NO_VARIAVEL_FINAL'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".DT_GERACAO'
    end
    object FloatField7: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_ENTID'
    end
    object FloatField8: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_PATROC'
    end
    object FloatField9: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PLANO'
    end
    object FloatField10: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PARTIC'
    end
  end
  object dsFormulasHist: TwwDataSource
    DataSet = qryFormulasHist
    Left = 185
    Top = 180
  end
  object qryOcorCalculoHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsGFormulasHist
    SQL.Strings = (
      'select b.*'
      '   from'
      '      fi_bk_refer_calculo_atuarial e,'
      '      fi_bk_ocor_calculo_atuarial b'
      ' where'
      '        b.DT_GERACAO          = :DT_GERACAO'
      ' and    b.CD_PESSOA_ENTID     = :CD_PESSOA_ENTID'
      ' and    b.CD_PESSOA_PATROC    = :CD_PESSOA_PATROC'
      ' and    b.CD_PLANO            = :CD_PLANO'
      ' and    b.CD_PARTIC           = :CD_PARTIC'
      ' and    b.CD_VERSAO           = :CD_VERSAO'
      ' and    e.CD_VERSAO           = b.CD_VERSAO'
      ' and    b.DT_GERACAO          = e.DT_GERACAO'
      ' and    b.CD_PESSOA_ENTID     = e.CD_PESSOA_ENTID'
      ' and    b.CD_PESSOA_PATROC    = e.CD_PESSOA_PATROC'
      ' and    b.CD_PLANO            = e.CD_PLANO'
      'ORDER BY'
      '  sq_ocor_calculo'
      '')
    ValidateWithMask = True
    Left = 157
    Top = 209
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object DateTimeField3: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".DT_GERACAO'
    end
    object FloatField11: TFloatField
      FieldName = 'SQ_OCOR_CALCULO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".SQ_OCOR_CALCULO'
    end
    object FloatField12: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_PATROC'
    end
    object FloatField13: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PESSOA_ENTID'
    end
    object FloatField14: TFloatField
      FieldName = 'CD_PLANO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PLANO'
    end
    object FloatField15: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_VERSAO'
    end
    object FloatField16: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_PARTIC'
    end
    object FloatField17: TFloatField
      FieldName = 'CD_GRUPO_PARTIC'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_GRUPO_PARTIC'
    end
    object FloatField18: TFloatField
      FieldName = 'CD_FORMULA'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_FORMULA'
    end
    object StringField9: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".NO_VARIAVEL'
    end
    object FloatField19: TFloatField
      FieldName = 'VL_CALCULO_ATUARIAL'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".VL_CALCULO_ATUARIAL'
    end
    object FloatField20: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = '"CM.FI_OCOR_CALCULO_ATUARIAL".CD_TIPO_BENEF'
    end
  end
  object dsOcorCalculoHist: TwwDataSource
    DataSet = qryOcorCalculoHist
    Left = 185
    Top = 209
  end
  object pplGFormulasHist: TppBDEPipeline
    DataSource = dsGFormulasHist
    UserName = 'lGFormulasHist'
    Left = 213
    Top = 150
  end
  object pplFormulasHist: TppBDEPipeline
    DataSource = dsFormulasHist
    UserName = 'lFormulasHist'
    Left = 213
    Top = 180
  end
  object pplOcorCalculoHist: TppBDEPipeline
    DataSource = dsOcorCalculoHist
    UserName = 'lOcorCalculoHist'
    Left = 213
    Top = 209
  end
  object rpMemoriaCalculoHist: TppReport
    AutoStop = False
    DataPipeline = pplGFormulasHist
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
    Left = 241
    Top = 180
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Memória de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78846
        mmTop = 16404
        mmWidth = 39688
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel24: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel24'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 9260
        mmWidth = 29633
        BandType = 0
      end
      object rpMemoriaCalculoHistLabel1: TppLabel
        UserName = 'rpMemoriaCalculoHistLabel1'
        Caption = '* * * H i s t ó r i c o * * *'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 18785
        mmWidth = 37306
        BandType = 0
      end
      object LblEntidadeHist: TppLabel
        OnPrint = LblEntidadeHistPrint
        UserName = 'LblEntidadeHist'
        AutoSize = False
        Caption = 'LblEntidadeHist'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'ppSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplFormulasHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 286
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object ppHeaderBand10: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object ppLabel26: TppLabel
              UserName = 'ppLabel26'
              Caption = 'Nome da Fórmula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 1852
              mmTop = 529
              mmWidth = 26194
              BandType = 0
            end
            object ppLabel28: TppLabel
              UserName = 'ppLabel28'
              Caption = 'Variável de Resultado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 529
              mmWidth = 32544
              BandType = 0
            end
            object ppLabel29: TppLabel
              UserName = 'ppLabel29'
              Caption = 'Variável Inicial Somatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 79640
              mmTop = 4763
              mmWidth = 38100
              BandType = 0
            end
            object ppLabel30: TppLabel
              UserName = 'ppLabel30'
              Caption = 'Variável Final Somatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 80433
              mmTop = 8996
              mmWidth = 36248
              BandType = 0
            end
            object ppLabel31: TppLabel
              UserName = 'ppLabel31'
              Caption = 'Fórmula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 156369
              mmTop = 529
              mmWidth = 12171
              BandType = 0
            end
            object ppLine19: TppLine
              UserName = 'ppLine19'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 29369
              mmTop = 3969
              mmWidth = 49477
              BandType = 0
            end
            object ppLine20: TppLine
              UserName = 'ppLine20'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 118534
              mmTop = 3969
              mmWidth = 36513
              BandType = 0
            end
            object ppLine21: TppLine
              UserName = 'ppLine21'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 169863
              mmTop = 3969
              mmWidth = 26723
              BandType = 0
            end
          end
          object ppDetailBand10: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 15346
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'ppDBText1'
              DataField = 'NO_FORMULA'
              DataPipeline = pplFormulasHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 1852
              mmTop = 529
              mmWidth = 68792
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'ppDBText2'
              DataField = 'NO_VARIAVEL_RESULT'
              DataPipeline = pplFormulasHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 529
              mmWidth = 32808
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'ppDBText3'
              DataField = 'NO_VARIAVEL_INICIAL'
              DataPipeline = pplFormulasHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82286
              mmTop = 5027
              mmWidth = 32808
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'ppDBText4'
              DataField = 'NO_VARIAVEL_FINAL'
              DataPipeline = pplFormulasHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 82021
              mmTop = 9525
              mmWidth = 33073
              BandType = 4
            end
            object ppDBMemo1: TppDBMemo
              UserName = 'ppDBMemo1'
              CharWrap = True
              DataField = 'DS_FORMULA'
              DataPipeline = pplFormulasHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 13229
              mmLeft = 126736
              mmTop = 529
              mmWidth = 68792
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'ppSubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplOcorCalculoHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport2'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 306
          Top = 212
          Version = '5.5'
          mmColumnWidth = 0
          object ppHeaderBand11: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppLabel32: TppLabel
              UserName = 'ppLabel32'
              Caption = 'Nome da Variável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 44186
              mmTop = 1323
              mmWidth = 26194
              BandType = 0
            end
            object ppLabel33: TppLabel
              UserName = 'ppLabel33'
              Caption = 'Valor Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 131234
              mmTop = 1323
              mmWidth = 23548
              BandType = 0
            end
            object ppLine22: TppLine
              UserName = 'ppLine22'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 794
              mmTop = 4233
              mmWidth = 42069
              BandType = 0
            end
            object ppLine23: TppLine
              UserName = 'ppLine23'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 71967
              mmTop = 4233
              mmWidth = 57944
              BandType = 0
            end
            object ppLine24: TppLine
              UserName = 'ppLine24'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 156104
              mmTop = 4233
              mmWidth = 41010
              BandType = 0
            end
          end
          object ppDetailBand11: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText5: TppDBText
              UserName = 'ppDBText5'
              DataField = 'NO_VARIAVEL'
              DataPipeline = pplOcorCalculoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 44186
              mmTop = 529
              mmWidth = 60590
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'ppDBText6'
              DataField = 'VL_CALCULO_ATUARIAL'
              DataPipeline = pplOcorCalculoHist
              DisplayFormat = '##,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 115094
              mmTop = 529
              mmWidth = 39423
              BandType = 4
            end
          end
        end
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 2117
        mmWidth = 15610
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Participante: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 2117
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'Grupo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 136525
        mmTop = 2117
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        Caption = 'Rotina de Cálculo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 9260
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplGFormulasHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 18521
        mmTop = 2117
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        DataField = 'NO_PESSOA'
        DataPipeline = pplGFormulasHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 65617
        mmTop = 2117
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'DS_GRUPO_FORMULA'
        DataPipeline = pplGFormulasHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 9260
        mmWidth = 89959
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'ppDBMemo2'
        CharWrap = False
        DataField = 'NO_GRUPO_PARTIC'
        DataPipeline = pplGFormulasHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 14288
        mmLeft = 147638
        mmTop = 2117
        mmWidth = 49477
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel38: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel38'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
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
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryEmiteRotina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.DS_GRUPO_FORMULA as "Rotina", '
      '          c.NR_ORDEM_FORMULA as "Ordem", '
      '          b.NO_FORMULA as "Nome",'
      '          b.NO_VARIAVEL_RESULT as "Variável de Resultado",'
      '          b.DS_FORMULA as "Expressão"'
      'from FI_GRUPO_FORMULA a, FI_FORMULA b, FI_SEQUENCIA_FORMULA c'
      'where a.CD_GRUPO_FORMULA = :CD_GRUPO_FORMULA'
      '  and a.CD_GRUPO_FORMULA = c.CD_GRUPO_FORMULA'
      '  and c.CD_FORMULA = b.CD_FORMULA'
      'order by a.DS_GRUPO_FORMULA, c.NR_ORDEM_FORMULA'
      '')
    ValidateWithMask = True
    Left = 7
    Top = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_GRUPO_FORMULA'
        ParamType = ptUnknown
      end>
    object qryEmiteRotinaRotina: TStringField
      FieldName = 'Rotina'
      Origin = 'FI_GRUPO_FORMULA.DS_GRUPO_FORMULA'
      Size = 80
    end
    object qryEmiteRotinaOrdem: TFloatField
      FieldName = 'Ordem'
      Origin = 'FI_SEQUENCIA_FORMULA.NR_ORDEM_FORMULA'
    end
    object qryEmiteRotinaNome: TStringField
      FieldName = 'Nome'
      Origin = 'FI_FORMULA.NO_FORMULA'
      Size = 80
    end
    object qryEmiteRotinaVariveldeResultado: TStringField
      FieldName = 'Variável de Resultado'
      Origin = 'FI_FORMULA.NO_VARIAVEL_RESULT'
    end
    object qryEmiteRotinaExpresso: TMemoField
      FieldName = 'Expressão'
      Origin = 'FI_FORMULA.DS_FORMULA'
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsEmiteRotina: TwwDataSource
    DataSet = qryEmiteRotina
    Left = 35
    Top = 154
  end
  object pplRotina: TppBDEPipeline
    DataSource = dsEmiteRotina
    UserName = 'lRotina'
    Left = 63
    Top = 154
  end
  object rpRotina: TppReport
    AutoStop = False
    DataPipeline = pplRotina
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
    Left = 91
    Top = 154
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel42: TppLabel
        UserName = 'ppLabel42'
        Caption = 'Rotina de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 80698
        mmTop = 8731
        mmWidth = 35983
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel43: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel43'
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
        mmWidth = 28046
        BandType = 0
      end
      object rpRotinaShape1: TppShape
        UserName = 'rpRotinaShape1'
        Brush.Color = clSilver
        mmHeight = 7144
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197644
        BandType = 0
      end
      object rpRotinaLabel1: TppLabel
        UserName = 'rpRotinaLabel1'
        Caption = 'Rotina: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
      end
      object rpRotinaLabel2: TppLabel
        UserName = 'rpRotinaLabel2'
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 26194
        mmWidth = 10319
        BandType = 0
      end
      object rpRotinaLabel3: TppLabel
        UserName = 'rpRotinaLabel3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 21960
        mmTop = 26194
        mmWidth = 8731
        BandType = 0
      end
      object rpRotinaLabel4: TppLabel
        UserName = 'rpRotinaLabel4'
        Caption = 'Expressão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 26194
        mmWidth = 16140
        BandType = 0
      end
      object rpRotinaLabel5: TppLabel
        UserName = 'rpRotinaLabel5'
        Caption = 'Variável de Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 85196
        mmTop = 26194
        mmWidth = 32544
        BandType = 0
      end
      object rpRotinaDBText1: TppDBText
        UserName = 'rpRotinaDBText1'
        DataField = 'Rotina'
        DataPipeline = pplRotina
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 18521
        mmWidth = 56621
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpRotinaDBText2: TppDBText
        UserName = 'rpRotinaDBText2'
        DataField = 'Ordem'
        DataPipeline = pplRotina
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 7673
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object rpRotinaDBText3: TppDBText
        UserName = 'rpRotinaDBText3'
        DataField = 'Nome'
        DataPipeline = pplRotina
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21431
        mmTop = 529
        mmWidth = 60061
        BandType = 4
      end
      object rpRotinaDBText4: TppDBText
        UserName = 'rpRotinaDBText4'
        DataField = 'Variável de Resultado'
        DataPipeline = pplRotina
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object rpRotinaDBMemo1: TppDBMemo
        UserName = 'rpRotinaDBMemo1'
        CharWrap = True
        DataField = 'Expressão'
        DataPipeline = pplRotina
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 529
        mmWidth = 76729
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel47: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel47'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
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
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryEmiteTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select b.DS_TABUA as "Descrição",'
      '          b.SG_TABUA as "Especificação",'
      '          b.DT_REF_TABUA as "Data de Criação",  '
      '          a.NR_IDADE as "Idade",'
      '          a.NR_L_X as "lx",'
      '          a.NR_P_X as "px",'
      '          a.NR_D_X as "dx",'
      '          a.NR_Q_X as "qx",'
      '          a.NR_I_X as "ix"'
      'from FI_OCORR_TABUA a, FI_TABUA b, FI_TIPO_TABUA c'
      'where b.CD_TABUA = :CD_TABUA '
      '   and b.CD_TABUA = a.CD_TABUA'
      '   and c.CD_TIPO_TABUA = b.CD_TIPO_TABUA'
      'order by b.DS_TABUA, a.NR_IDADE')
    ValidateWithMask = True
    Left = 7
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TABUA'
        ParamType = ptUnknown
      end>
    object qryEmiteTabuaDescrio: TStringField
      FieldName = 'Descrição'
      Origin = 'FI_TABUA.DS_TABUA'
      Size = 50
    end
    object qryEmiteTabuaEspecificao: TStringField
      FieldName = 'Especificação'
      Origin = 'FI_TABUA.SG_TABUA'
      Size = 15
    end
    object qryEmiteTabuaDatadeCriao: TDateTimeField
      FieldName = 'Data de Criação'
      Origin = 'FI_TABUA.DT_REF_TABUA'
    end
    object qryEmiteTabuaIdade: TFloatField
      FieldName = 'Idade'
      Origin = 'FI_OCORR_TABUA.NR_IDADE'
    end
    object qryEmiteTabualx: TFloatField
      FieldName = 'lx'
      Origin = 'FI_OCORR_TABUA.NR_L_X'
    end
    object qryEmiteTabuapx: TFloatField
      FieldName = 'px'
      Origin = 'FI_OCORR_TABUA.NR_P_X'
    end
    object qryEmiteTabuadx: TFloatField
      FieldName = 'dx'
      Origin = 'FI_OCORR_TABUA.NR_D_X'
    end
    object qryEmiteTabuaqx: TFloatField
      FieldName = 'qx'
      Origin = 'FI_OCORR_TABUA.NR_Q_X'
    end
    object qryEmiteTabuaix: TFloatField
      FieldName = 'ix'
      Origin = 'FI_OCORR_TABUA.NR_I_X'
    end
  end
  object dsEmiteTabua: TwwDataSource
    DataSet = qryEmiteTabua
    Left = 35
    Top = 184
  end
  object pplTabua: TppBDEPipeline
    DataSource = dsEmiteTabua
    UserName = 'lTabua'
    Left = 63
    Top = 184
  end
  object rpTabua: TppReport
    AutoStop = False
    DataPipeline = pplTabua
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
    Left = 91
    Top = 184
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'ppLabel44'
        Caption = 'Tábuas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 91017
        mmTop = 8731
        mmWidth = 15081
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel45: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel45'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpTabuaShape1: TppShape
        UserName = 'rpTabuaShape1'
        Brush.Color = clSilver
        mmHeight = 7408
        mmLeft = 0
        mmTop = 31750
        mmWidth = 197644
        BandType = 0
      end
      object rpTabuaLabel1: TppLabel
        UserName = 'rpTabuaLabel1'
        Caption = 'Descrição: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 18521
        mmWidth = 16933
        BandType = 0
      end
      object rpTabuaLabel2: TppLabel
        UserName = 'rpTabuaLabel2'
        Caption = 'Especificação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 8467
        mmTop = 25400
        mmWidth = 22754
        BandType = 0
      end
      object rpTabuaDBText1: TppDBText
        UserName = 'rpTabuaDBText1'
        DataField = 'Descrição'
        DataPipeline = pplTabua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 26458
        mmTop = 18521
        mmWidth = 51858
        BandType = 0
      end
      object rpTabuaDBText2: TppDBText
        UserName = 'rpTabuaDBText2'
        DataField = 'Especificação'
        DataPipeline = pplTabua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 32279
        mmTop = 25400
        mmWidth = 37571
        BandType = 0
      end
      object rpTabuaLabel3: TppLabel
        UserName = 'rpTabuaLabel3'
        Caption = 'Data de Criação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 17992
        mmWidth = 25400
        BandType = 0
      end
      object rpTabuaDBText3: TppDBText
        UserName = 'rpTabuaDBText3'
        DataField = 'Data de Criação'
        DataPipeline = pplTabua
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 17992
        mmWidth = 37835
        BandType = 0
      end
      object rpTabuaLabel4: TppLabel
        UserName = 'rpTabuaLabel4'
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 33602
        mmWidth = 8202
        BandType = 0
      end
      object rpTabuaLabel5: TppLabel
        UserName = 'rpTabuaLabel5'
        Caption = 'lx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 50271
        mmTop = 33602
        mmWidth = 2646
        BandType = 0
      end
      object rpTabuaLabel6: TppLabel
        UserName = 'rpTabuaLabel6'
        Caption = 'dx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 119592
        mmTop = 33602
        mmWidth = 3704
        BandType = 0
      end
      object rpTabuaLabel7: TppLabel
        UserName = 'rpTabuaLabel7'
        Caption = 'px'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 33602
        mmWidth = 3704
        BandType = 0
      end
      object rpTabuaLabel8: TppLabel
        UserName = 'rpTabuaLabel8'
        Caption = 'qx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 152400
        mmTop = 33338
        mmWidth = 3704
        BandType = 0
      end
      object rpTabuaLabel9: TppLabel
        UserName = 'rpTabuaLabel9'
        Caption = 'ix'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 190236
        mmTop = 33073
        mmWidth = 2646
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpTabuaDBText4: TppDBText
        UserName = 'rpTabuaDBText4'
        DataField = 'Idade'
        DataPipeline = pplTabua
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 5027
        mmTop = 1058
        mmWidth = 8467
        BandType = 4
      end
      object rpTabuaDBText5: TppDBText
        UserName = 'rpTabuaDBText5'
        DataField = 'lx'
        DataPipeline = pplTabua
        DisplayFormat = '#,###,###,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 1058
        mmWidth = 34925
        BandType = 4
      end
      object rpTabuaDBText6: TppDBText
        UserName = 'rpTabuaDBText6'
        DataField = 'px'
        DataPipeline = pplTabua
        DisplayFormat = '###0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 54769
        mmTop = 1058
        mmWidth = 34396
        BandType = 4
      end
      object rpTabuaDBText7: TppDBText
        UserName = 'rpTabuaDBText7'
        DataField = 'qx'
        DataPipeline = pplTabua
        DisplayFormat = '###0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 1058
        mmWidth = 31485
        BandType = 4
      end
      object rpTabuaDBText8: TppDBText
        UserName = 'rpTabuaDBText8'
        DataField = 'dx'
        DataPipeline = pplTabua
        DisplayFormat = '#,###,###,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 90223
        mmTop = 1058
        mmWidth = 33867
        BandType = 4
      end
      object rpTabuaDBText9: TppDBText
        UserName = 'rpTabuaDBText9'
        DataField = 'ix'
        DataPipeline = pplTabua
        DisplayFormat = '###0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 794
        mmWidth = 37306
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel50: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel50'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
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
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplTabComutacao: TppBDEPipeline
    DataSource = dsTabComutacao
    UserName = 'lTabComutacao'
    Left = 213
    Top = 239
    object pplTabComutacaoppField1: TppField
      FieldAlias = 'idade'
      FieldName = 'idade'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField2: TppField
      FieldAlias = 'l_x'
      FieldName = 'l_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField3: TppField
      FieldAlias = 'p_x'
      FieldName = 'p_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField4: TppField
      FieldAlias = 'd_x'
      FieldName = 'd_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField5: TppField
      FieldAlias = 'q_x'
      FieldName = 'q_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField6: TppField
      FieldAlias = 'DD_x'
      FieldName = 'DD_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField7: TppField
      FieldAlias = 'N_x'
      FieldName = 'N_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField8: TppField
      FieldAlias = 'S_x'
      FieldName = 'S_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField9: TppField
      FieldAlias = 'C_x'
      FieldName = 'C_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField10: TppField
      FieldAlias = 'M_x'
      FieldName = 'M_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplTabComutacaoppField11: TppField
      FieldAlias = 'R_x'
      FieldName = 'R_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object dsTabComutacao: TwwDataSource
    DataSet = QryTabComutacao
    Left = 185
    Top = 239
  end
  object QryTabComutacao: TwwQuery
    DatabaseName = 'BdTmp'
    SQL.Strings = (
      'select * from Rel_TabComutacao'
      '    order by idade')
    ValidateWithMask = True
    Left = 157
    Top = 239
    object QryTabComutacaoidade: TIntegerField
      FieldName = 'idade'
      Origin = '"Rel_TabComutacao.DB".idade'
    end
    object QryTabComutacaol_x: TFloatField
      FieldName = 'l_x'
      Origin = '"Rel_TabComutacao.DB".l_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaop_x: TFloatField
      FieldName = 'p_x'
      Origin = '"Rel_TabComutacao.DB".p_x'
      DisplayFormat = '##,##0.00000000'
    end
    object QryTabComutacaod_x: TFloatField
      FieldName = 'd_x'
      Origin = '"Rel_TabComutacao.DB".d_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoq_x: TFloatField
      FieldName = 'q_x'
      Origin = '"Rel_TabComutacao.DB".q_x'
      DisplayFormat = '##,##0.00000000'
    end
    object QryTabComutacaoDD_x: TFloatField
      FieldName = 'DD_x'
      Origin = '"Rel_TabComutacao.DB".DD_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoN_x: TFloatField
      FieldName = 'N_x'
      Origin = '"Rel_TabComutacao.DB".N_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoS_x: TFloatField
      FieldName = 'S_x'
      Origin = '"Rel_TabComutacao.DB".S_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoC_x: TFloatField
      FieldName = 'C_x'
      Origin = '"Rel_TabComutacao.DB".C_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoM_x: TFloatField
      FieldName = 'M_x'
      Origin = '"Rel_TabComutacao.DB".M_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoR_x: TFloatField
      FieldName = 'R_x'
      Origin = '"Rel_TabComutacao.DB".R_x'
      DisplayFormat = '##,##0.0000'
    end
  end
  object rpTabComutacao: TppReport
    AutoStop = False
    DataPipeline = pplTabComutacao
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
    DeviceType = 'Screen'
    Left = 241
    Top = 239
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
        Caption = 'Tabela de Comutação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120121
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel40: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel40'
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
      object rpTabComutacaoShape1: TppShape
        UserName = 'rpTabComutacaoShape1'
        Brush.Color = clSilver
        mmHeight = 7673
        mmLeft = 0
        mmTop = 24342
        mmWidth = 284692
        BandType = 0
      end
      object rpTabComutacaoLabel1: TppLabel
        UserName = 'rpTabComutacaoLabel1'
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 26194
        mmWidth = 8202
        BandType = 0
      end
      object rpTabComutacaoLabel2: TppLabel
        UserName = 'rpTabComutacaoLabel2'
        Caption = 'l_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 26458
        mmTop = 26723
        mmWidth = 4498
        BandType = 0
      end
      object rpTabComutacaoLabel3: TppLabel
        UserName = 'rpTabComutacaoLabel3'
        Caption = 'p_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 26458
        mmWidth = 5556
        BandType = 0
      end
      object rpTabComutacaoLabel4: TppLabel
        UserName = 'rpTabComutacaoLabel4'
        Caption = 'd_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 26194
        mmWidth = 5556
        BandType = 0
      end
      object rpTabComutacaoLabel5: TppLabel
        UserName = 'rpTabComutacaoLabel5'
        Caption = 'q_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 99484
        mmTop = 26194
        mmWidth = 5556
        BandType = 0
      end
      object rpTabComutacaoLabel6: TppLabel
        UserName = 'rpTabComutacaoLabel6'
        Caption = 'D_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 26194
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutacaoLabel7: TppLabel
        UserName = 'rpTabComutacaoLabel7'
        Caption = 'N_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 159279
        mmTop = 25929
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutacaoLabel8: TppLabel
        UserName = 'rpTabComutacaoLabel8'
        Caption = 'S_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 196057
        mmTop = 25929
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutacaoLabel9: TppLabel
        UserName = 'rpTabComutacaoLabel9'
        Caption = 'Mortalidade: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 18256
        mmWidth = 19315
        BandType = 0
      end
      object rpTabComutacaoLabel10: TppLabel
        UserName = 'rpTabComutacaoLabel10'
        Caption = 'Taxa de Juros: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 18521
        mmWidth = 23019
        BandType = 0
      end
      object pRLabelmorte: TppLabel
        UserName = 'pRLabelmorte'
        Caption = 'pRLabelmorte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69586
        mmTop = 18256
        mmWidth = 33073
        BandType = 0
      end
      object pRLabelfator: TppLabel
        UserName = 'pRLabelfator'
        Caption = 'pRLabelfator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 18521
        mmWidth = 18785
        BandType = 0
      end
      object rpTabComutacaoLabel13: TppLabel
        UserName = 'rpTabComutacaoLabel13'
        Caption = 'C_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 218811
        mmTop = 26194
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutacaoLabel14: TppLabel
        UserName = 'rpTabComutacaoLabel14'
        Caption = 'M_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 26194
        mmWidth = 6350
        BandType = 0
      end
      object rpTabComutacaoLabel15: TppLabel
        UserName = 'rpTabComutacaoLabel15'
        Caption = 'R_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 277813
        mmTop = 26194
        mmWidth = 5821
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpTabComutacaoDBText1: TppDBText
        UserName = 'rpTabComutacaoDBText1'
        DataField = 'idade'
        DataPipeline = pplTabComutacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 1058
        mmWidth = 7144
        BandType = 4
      end
      object rpTabComutacaoDBText2: TppDBText
        UserName = 'rpTabComutacaoDBText2'
        DataField = 'd_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 1058
        mmWidth = 22225
        BandType = 4
      end
      object rpTabComutacaoDBText3: TppDBText
        UserName = 'rpTabComutacaoDBText3'
        DataField = 'q_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 79904
        mmTop = 1058
        mmWidth = 25665
        BandType = 4
      end
      object rpTabComutacaoDBText4: TppDBText
        UserName = 'rpTabComutacaoDBText4'
        DataField = 'DD_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 1058
        mmWidth = 28575
        BandType = 4
      end
      object rpTabComutacaoDBText5: TppDBText
        UserName = 'rpTabComutacaoDBText5'
        DataField = 'N_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 1058
        mmWidth = 28575
        BandType = 4
      end
      object rpTabComutacaoDBText6: TppDBText
        UserName = 'rpTabComutacaoDBText6'
        DataField = 'S_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1058
        mmWidth = 36248
        BandType = 4
      end
      object rpTabComutacaoDBText7: TppDBText
        UserName = 'rpTabComutacaoDBText7'
        DataField = 'C_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 202936
        mmTop = 1058
        mmWidth = 22225
        BandType = 4
      end
      object rpTabComutacaoDBText8: TppDBText
        UserName = 'rpTabComutacaoDBText8'
        DataField = 'l_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 16140
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object rpTabComutacaoDBText9: TppDBText
        UserName = 'rpTabComutacaoDBText9'
        DataField = 'p_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 35190
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object rpTabComutacaoDBText10: TppDBText
        UserName = 'rpTabComutacaoDBText10'
        DataField = 'M_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 1058
        mmWidth = 28310
        BandType = 4
      end
      object rpTabComutacaoDBText11: TppDBText
        UserName = 'rpTabComutacaoDBText11'
        DataField = 'R_x'
        DataPipeline = pplTabComutacao
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 1058
        mmWidth = 27781
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel52'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 256117
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 3175
        mmWidth = 229130
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplTabComutInv: TppBDEPipeline
    DataSource = dsTabComutInv
    UserName = 'lTabComutInv'
    Left = 213
    Top = 269
    object pplTabComutInvppField1: TppField
      FieldAlias = 'idade'
      FieldName = 'idade'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField2: TppField
      FieldAlias = 'l_x'
      FieldName = 'l_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField3: TppField
      FieldAlias = 'p_x'
      FieldName = 'p_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField4: TppField
      FieldAlias = 'q_x'
      FieldName = 'q_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField5: TppField
      FieldAlias = 'd_x'
      FieldName = 'd_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField6: TppField
      FieldAlias = 'p_x_aa'
      FieldName = 'p_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField7: TppField
      FieldAlias = 'q_x_aa'
      FieldName = 'q_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField8: TppField
      FieldAlias = 'p_x_ai'
      FieldName = 'p_x_ai'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField9: TppField
      FieldAlias = 'q_x_ai'
      FieldName = 'q_x_ai'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField10: TppField
      FieldAlias = 'p_x_a'
      FieldName = 'p_x_a'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField11: TppField
      FieldAlias = 'q_x_a'
      FieldName = 'q_x_a'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField12: TppField
      FieldAlias = 'i_x'
      FieldName = 'i_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField13: TppField
      FieldAlias = 'p_x_i'
      FieldName = 'p_x_i'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField14: TppField
      FieldAlias = 'q_x_i'
      FieldName = 'q_x_i'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField15: TppField
      FieldAlias = 'l_x_aa'
      FieldName = 'l_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField16: TppField
      FieldAlias = 'll_x_aa'
      FieldName = 'll_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField17: TppField
      FieldAlias = 'l_x_ii'
      FieldName = 'l_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField18: TppField
      FieldAlias = 'N_x'
      FieldName = 'N_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField19: TppField
      FieldAlias = 'DD_x'
      FieldName = 'DD_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField20: TppField
      FieldAlias = 'S_x'
      FieldName = 'S_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField21: TppField
      FieldAlias = 'C_x'
      FieldName = 'C_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField22: TppField
      FieldAlias = 'M_x'
      FieldName = 'M_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField23: TppField
      FieldAlias = 'R_x'
      FieldName = 'R_x'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField24: TppField
      FieldAlias = 'N_x_aa'
      FieldName = 'N_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField25: TppField
      FieldAlias = 'D_x_aa'
      FieldName = 'D_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField26: TppField
      FieldAlias = 'S_x_aa'
      FieldName = 'S_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField27: TppField
      FieldAlias = 'C_x_aa'
      FieldName = 'C_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField28: TppField
      FieldAlias = 'M_x_aa'
      FieldName = 'M_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField29: TppField
      FieldAlias = 'R_x_aa'
      FieldName = 'R_x_aa'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField30: TppField
      FieldAlias = 'N_x_ii'
      FieldName = 'N_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField31: TppField
      FieldAlias = 'D_x_ii'
      FieldName = 'D_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField32: TppField
      FieldAlias = 'S_x_ii'
      FieldName = 'S_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField33: TppField
      FieldAlias = 'C_x_ii'
      FieldName = 'C_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField34: TppField
      FieldAlias = 'M_x_ii'
      FieldName = 'M_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pplTabComutInvppField35: TppField
      FieldAlias = 'R_x_ii'
      FieldName = 'R_x_ii'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
  end
  object qryTabComutInv: TwwQuery
    DatabaseName = 'BdTmp'
    SQL.Strings = (
      'select * from Rel_TabComutacaoInv'
      '    order by idade')
    ValidateWithMask = True
    Left = 157
    Top = 269
    object IntegerField1: TIntegerField
      FieldName = 'idade'
      Origin = '"Rel_TabComutacaoInv.DB".idade'
    end
    object FloatField21: TFloatField
      FieldName = 'l_x'
      Origin = '"Rel_TabComutacaoInv.DB".l_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField22: TFloatField
      FieldName = 'p_x'
      Origin = '"Rel_TabComutacaoInv.DB".p_x'
      DisplayFormat = '#0.00000000'
    end
    object FloatField23: TFloatField
      FieldName = 'q_x'
      Origin = '"Rel_TabComutacaoInv.DB".q_x'
      DisplayFormat = '#0.00000000'
    end
    object FloatField24: TFloatField
      FieldName = 'd_x'
      Origin = '"Rel_TabComutacaoInv.DB".d_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaop_x_aa: TFloatField
      FieldName = 'p_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".p_x_aa'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaoq_x_aa: TFloatField
      FieldName = 'q_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".q_x_aa'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaop_x_ai: TFloatField
      FieldName = 'p_x_ai'
      Origin = '"Rel_TabComutacaoInv.DB".p_x_ai'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaoq_x_ai: TFloatField
      FieldName = 'q_x_ai'
      Origin = '"Rel_TabComutacaoInv.DB".q_x_ai'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaop_x_a: TFloatField
      FieldName = 'p_x_a'
      Origin = '"Rel_TabComutacaoInv.DB".p_x_a'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaoq_x_a: TFloatField
      FieldName = 'q_x_a'
      Origin = '"Rel_TabComutacaoInv.DB".q_x_a'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaoi_x: TFloatField
      FieldName = 'i_x'
      Origin = '"Rel_TabComutacaoInv.DB".i_x'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaop_x_i: TFloatField
      FieldName = 'p_x_i'
      Origin = '"Rel_TabComutacaoInv.DB".p_x_i'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaoq_x_i: TFloatField
      FieldName = 'q_x_i'
      Origin = '"Rel_TabComutacaoInv.DB".q_x_i'
      DisplayFormat = '#0.00000000'
    end
    object QryTabComutacaol_x_aa: TFloatField
      FieldName = 'l_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".l_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoll_x_aa: TFloatField
      FieldName = 'll_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".ll_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaol_x_ii: TFloatField
      FieldName = 'l_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".l_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField25: TFloatField
      FieldName = 'N_x'
      Origin = '"Rel_TabComutacaoInv.DB".N_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField26: TFloatField
      FieldName = 'DD_x'
      Origin = '"Rel_TabComutacaoInv.DB".DD_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField27: TFloatField
      FieldName = 'S_x'
      Origin = '"Rel_TabComutacaoInv.DB".S_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField28: TFloatField
      FieldName = 'C_x'
      Origin = '"Rel_TabComutacaoInv.DB".C_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField29: TFloatField
      FieldName = 'M_x'
      Origin = '"Rel_TabComutacaoInv.DB".M_x'
      DisplayFormat = '##,##0.0000'
    end
    object FloatField30: TFloatField
      FieldName = 'R_x'
      Origin = '"Rel_TabComutacaoInv.DB".R_x'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoN_x_aa: TFloatField
      FieldName = 'N_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".N_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoD_x_aa: TFloatField
      FieldName = 'D_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".D_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoS_x_aa: TFloatField
      FieldName = 'S_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".S_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoC_x_aa: TFloatField
      FieldName = 'C_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".C_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoM_x_aa: TFloatField
      FieldName = 'M_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".M_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoR_x_aa: TFloatField
      FieldName = 'R_x_aa'
      Origin = '"Rel_TabComutacaoInv.DB".R_x_aa'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoN_x_ii: TFloatField
      FieldName = 'N_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".N_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoD_x_ii: TFloatField
      FieldName = 'D_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".D_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoS_x_ii: TFloatField
      FieldName = 'S_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".S_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoC_x_ii: TFloatField
      FieldName = 'C_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".C_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoM_x_ii: TFloatField
      FieldName = 'M_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".M_x_ii'
      DisplayFormat = '##,##0.0000'
    end
    object QryTabComutacaoR_x_ii: TFloatField
      FieldName = 'R_x_ii'
      Origin = '"Rel_TabComutacaoInv.DB".R_x_ii'
      DisplayFormat = '##,##0.0000'
    end
  end
  object dsTabComutInv: TwwDataSource
    DataSet = qryTabComutInv
    Left = 185
    Top = 269
  end
  object rpTabComutInv: TppReport
    AutoStop = False
    DataPipeline = pplTabComutInv
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
    DeviceType = 'Screen'
    Left = 241
    Top = 269
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        Caption = 'Tabela de Comutação (com Invalidez)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 105304
        mmTop = 8731
        mmWidth = 75406
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel46: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel46'
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
      object rpTabComutInvShape1: TppShape
        UserName = 'rpTabComutInvShape1'
        Brush.Color = clSilver
        mmHeight = 17463
        mmLeft = 0
        mmTop = 25665
        mmWidth = 284692
        BandType = 0
      end
      object rpTabComutInvLabel1: TppLabel
        UserName = 'rpTabComutInvLabel1'
        Caption = 'Idade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 28046
        mmWidth = 8202
        BandType = 0
      end
      object rpTabComutInvLabel2: TppLabel
        UserName = 'rpTabComutInvLabel2'
        Caption = 'p_x_a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 28046
        mmWidth = 9260
        BandType = 0
      end
      object rpTabComutInvLabel3: TppLabel
        UserName = 'rpTabComutInvLabel3'
        Caption = 'p_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 28046
        mmWidth = 5556
        BandType = 0
      end
      object rpTabComutInvLabel4: TppLabel
        UserName = 'rpTabComutInvLabel4'
        Caption = 'p_x_i'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 28046
        mmWidth = 8202
        BandType = 0
      end
      object rpTabComutInvLabel5: TppLabel
        UserName = 'rpTabComutInvLabel5'
        Caption = 'l_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 128852
        mmTop = 28046
        mmWidth = 4498
        BandType = 0
      end
      object rpTabComutInvLabel6: TppLabel
        UserName = 'rpTabComutInvLabel6'
        Caption = 'D_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 152136
        mmTop = 28046
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutInvLabel7: TppLabel
        UserName = 'rpTabComutInvLabel7'
        Caption = 'N_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 178065
        mmTop = 28046
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutInvLabel8: TppLabel
        UserName = 'rpTabComutInvLabel8'
        Caption = 'Taxa de Juros: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 20373
        mmWidth = 23019
        BandType = 0
      end
      object pRLabelfatorInv: TppLabel
        UserName = 'pRLabelfatorInv'
        Caption = 'pRLabelfatorInv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 53711
        mmTop = 20373
        mmWidth = 64294
        BandType = 0
      end
      object rpTabComutInvLabel10: TppLabel
        UserName = 'rpTabComutInvLabel10'
        Caption = 'q_x_a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 28046
        mmWidth = 9260
        BandType = 0
      end
      object rpTabComutInvLabel11: TppLabel
        UserName = 'rpTabComutInvLabel11'
        Caption = 'q_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 32544
        mmWidth = 5556
        BandType = 0
      end
      object rpTabComutInvLabel12: TppLabel
        UserName = 'rpTabComutInvLabel12'
        Caption = 'p_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 47361
        mmTop = 32544
        mmWidth = 11113
        BandType = 0
      end
      object rpTabComutInvLabel13: TppLabel
        UserName = 'rpTabComutInvLabel13'
        Caption = 'q_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 72496
        mmTop = 32544
        mmWidth = 11113
        BandType = 0
      end
      object rpTabComutInvLabel14: TppLabel
        UserName = 'rpTabComutInvLabel14'
        Caption = 'q_x_i'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 32544
        mmWidth = 8202
        BandType = 0
      end
      object rpTabComutInvLabel15: TppLabel
        UserName = 'rpTabComutInvLabel15'
        Caption = 'l_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 123561
        mmTop = 32544
        mmWidth = 10054
        BandType = 0
      end
      object rpTabComutInvLabel16: TppLabel
        UserName = 'rpTabComutInvLabel16'
        Caption = 'D_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 32544
        mmWidth = 11377
        BandType = 0
      end
      object rpTabComutInvLabel17: TppLabel
        UserName = 'rpTabComutInvLabel17'
        Caption = 'N_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 172509
        mmTop = 32544
        mmWidth = 11377
        BandType = 0
      end
      object rpTabComutInvLabel18: TppLabel
        UserName = 'rpTabComutInvLabel18'
        Caption = 'S_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 201084
        mmTop = 32544
        mmWidth = 11377
        BandType = 0
      end
      object rpTabComutInvLabel19: TppLabel
        UserName = 'rpTabComutInvLabel19'
        Caption = 'p_x_ai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 48419
        mmTop = 37042
        mmWidth = 10054
        BandType = 0
      end
      object rpTabComutInvLabel20: TppLabel
        UserName = 'rpTabComutInvLabel20'
        Caption = 'q_x_ai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 73554
        mmTop = 37042
        mmWidth = 10054
        BandType = 0
      end
      object rpTabComutInvLabel21: TppLabel
        UserName = 'rpTabComutInvLabel21'
        Caption = 'i_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 103981
        mmTop = 37042
        mmWidth = 4498
        BandType = 0
      end
      object rpTabComutInvLabel22: TppLabel
        UserName = 'rpTabComutInvLabel22'
        Caption = 'l_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 37042
        mmWidth = 7938
        BandType = 0
      end
      object rpTabComutInvLabel23: TppLabel
        UserName = 'rpTabComutInvLabel23'
        Caption = 'D_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148961
        mmTop = 37042
        mmWidth = 9260
        BandType = 0
      end
      object rpTabComutInvLabel24: TppLabel
        UserName = 'rpTabComutInvLabel24'
        Caption = 'N_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 174625
        mmTop = 37042
        mmWidth = 9525
        BandType = 0
      end
      object rpTabComutInvLabel25: TppLabel
        UserName = 'rpTabComutInvLabel25'
        Caption = 'C_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 226219
        mmTop = 28046
        mmWidth = 5821
        BandType = 0
      end
      object rpTabComutInvLabel26: TppLabel
        UserName = 'rpTabComutInvLabel26'
        Caption = 'C_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 220663
        mmTop = 32544
        mmWidth = 11377
        BandType = 0
      end
      object rpTabComutInvLabel27: TppLabel
        UserName = 'rpTabComutInvLabel27'
        Caption = 'C_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 222780
        mmTop = 37042
        mmWidth = 9260
        BandType = 0
      end
      object rpTabComutInvLabel28: TppLabel
        UserName = 'rpTabComutInvLabel28'
        Caption = 'M_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 37042
        mmWidth = 9790
        BandType = 0
      end
      object rpTabComutInvLabel29: TppLabel
        UserName = 'rpTabComutInvLabel29'
        Caption = 'M_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 245798
        mmTop = 32544
        mmWidth = 11906
        BandType = 0
      end
      object rpTabComutInvLabel30: TppLabel
        UserName = 'rpTabComutInvLabel30'
        Caption = 'M_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 251355
        mmTop = 28046
        mmWidth = 6350
        BandType = 0
      end
      object rpTabComutInvLabel31: TppLabel
        UserName = 'rpTabComutInvLabel31'
        Caption = 'R_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 272786
        mmTop = 37042
        mmWidth = 9260
        BandType = 0
      end
      object rpTabComutInvLabel32: TppLabel
        UserName = 'rpTabComutInvLabel32'
        Caption = 'R_x_aa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 270934
        mmTop = 32544
        mmWidth = 11377
        BandType = 0
      end
      object rpTabComutInvLabel33: TppLabel
        UserName = 'rpTabComutInvLabel33'
        Caption = 'R_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 276490
        mmTop = 28046
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'S_x_ii'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 203200
        mmTop = 37042
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'S_x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 206640
        mmTop = 28046
        mmWidth = 5821
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object rpTabComutInvDBText1: TppDBText
        UserName = 'rpTabComutInvDBText1'
        DataField = 'idade'
        DataPipeline = pplTabComutInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 7144
        BandType = 4
      end
      object rpTabComutInvDBText2: TppDBText
        UserName = 'rpTabComutInvDBText2'
        DataField = 'q_x_a'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 1058
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText3: TppDBText
        UserName = 'rpTabComutInvDBText3'
        DataField = 'p_x_i'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 1058
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText4: TppDBText
        UserName = 'rpTabComutInvDBText4'
        DataField = 'l_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 1058
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText5: TppDBText
        UserName = 'rpTabComutInvDBText5'
        DataField = 'DD_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 1058
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText6: TppDBText
        UserName = 'rpTabComutInvDBText6'
        DataField = 'N_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 1058
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText7: TppDBText
        UserName = 'rpTabComutInvDBText7'
        DataField = 'p_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 1058
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText8: TppDBText
        UserName = 'rpTabComutInvDBText8'
        DataField = 'p_x_a'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 1058
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText9: TppDBText
        UserName = 'rpTabComutInvDBText9'
        DataField = 'q_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 5027
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText10: TppDBText
        UserName = 'rpTabComutInvDBText10'
        DataField = 'q_x_i'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 5027
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText11: TppDBText
        UserName = 'rpTabComutInvDBText11'
        DataField = 'l_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 5027
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText12: TppDBText
        UserName = 'rpTabComutInvDBText12'
        DataField = 'D_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 5027
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText13: TppDBText
        UserName = 'rpTabComutInvDBText13'
        DataField = 'N_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 5027
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText14: TppDBText
        UserName = 'rpTabComutInvDBText14'
        DataField = 'q_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 5027
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText15: TppDBText
        UserName = 'rpTabComutInvDBText15'
        DataField = 'p_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 5027
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText16: TppDBText
        UserName = 'rpTabComutInvDBText16'
        DataField = 'q_x_ai'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 8996
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText17: TppDBText
        UserName = 'rpTabComutInvDBText17'
        DataField = 'i_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 8996
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText18: TppDBText
        UserName = 'rpTabComutInvDBText18'
        DataField = 'l_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 8996
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText19: TppDBText
        UserName = 'rpTabComutInvDBText19'
        DataField = 'D_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 8996
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText20: TppDBText
        UserName = 'rpTabComutInvDBText20'
        DataField = 'N_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 8996
        mmWidth = 23548
        BandType = 4
      end
      object rpTabComutInvDBText21: TppDBText
        UserName = 'rpTabComutInvDBText21'
        DataField = 'p_x_ai'
        DataPipeline = pplTabComutInv
        DisplayFormat = '#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 8996
        mmWidth = 24342
        BandType = 4
      end
      object rpTabComutInvDBText22: TppDBText
        UserName = 'rpTabComutInvDBText22'
        DataField = 'S_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 1058
        mmWidth = 27517
        BandType = 4
      end
      object rpTabComutInvDBText23: TppDBText
        UserName = 'rpTabComutInvDBText23'
        DataField = 'S_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 5027
        mmWidth = 27517
        BandType = 4
      end
      object rpTabComutInvDBText24: TppDBText
        UserName = 'rpTabComutInvDBText24'
        DataField = 'S_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 8996
        mmWidth = 27517
        BandType = 4
      end
      object rpTabComutInvDBText25: TppDBText
        UserName = 'rpTabComutInvDBText25'
        DataField = 'C_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 213784
        mmTop = 1058
        mmWidth = 20108
        BandType = 4
      end
      object rpTabComutInvDBText26: TppDBText
        UserName = 'rpTabComutInvDBText26'
        DataField = 'C_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 213784
        mmTop = 5027
        mmWidth = 20108
        BandType = 4
      end
      object rpTabComutInvDBText27: TppDBText
        UserName = 'rpTabComutInvDBText27'
        DataField = 'C_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 213784
        mmTop = 8996
        mmWidth = 20108
        BandType = 4
      end
      object rpTabComutInvDBText28: TppDBText
        UserName = 'rpTabComutInvDBText28'
        DataField = 'M_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236273
        mmTop = 1058
        mmWidth = 23019
        BandType = 4
      end
      object rpTabComutInvDBText29: TppDBText
        UserName = 'rpTabComutInvDBText29'
        DataField = 'R_x'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 260615
        mmTop = 1058
        mmWidth = 22490
        BandType = 4
      end
      object rpTabComutInvDBText30: TppDBText
        UserName = 'rpTabComutInvDBText30'
        DataField = 'M_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236273
        mmTop = 5027
        mmWidth = 23019
        BandType = 4
      end
      object rpTabComutInvDBText31: TppDBText
        UserName = 'rpTabComutInvDBText31'
        DataField = 'R_x_aa'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 260615
        mmTop = 5027
        mmWidth = 22490
        BandType = 4
      end
      object rpTabComutInvDBText32: TppDBText
        UserName = 'rpTabComutInvDBText32'
        DataField = 'M_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236273
        mmTop = 8996
        mmWidth = 23019
        BandType = 4
      end
      object rpTabComutInvDBText33: TppDBText
        UserName = 'rpTabComutInvDBText33'
        DataField = 'R_x_ii'
        DataPipeline = pplTabComutInv
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 260615
        mmTop = 8996
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel65: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel65'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 256117
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 3175
        mmWidth = 229130
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpTabComutInvSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object rpTabComutInvShape2: TppShape
        UserName = 'rpTabComutInvShape2'
        mmHeight = 12171
        mmLeft = 0
        mmTop = 7673
        mmWidth = 284692
        BandType = 7
      end
      object rpTabComutInvLabel34: TppLabel
        UserName = 'rpTabComutInvLabel34'
        Caption = 'Mortalidade: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 47361
        mmTop = 8996
        mmWidth = 19315
        BandType = 7
      end
      object pRLabelmorteInv: TppLabel
        UserName = 'pRLabelmorteInv'
        Caption = 'pRLabelmorteInv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67733
        mmTop = 8996
        mmWidth = 57679
        BandType = 7
      end
      object rpTabComutInvLabel36: TppLabel
        UserName = 'rpTabComutInvLabel36'
        Caption = 'Invalidez: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 136525
        mmTop = 8996
        mmWidth = 14552
        BandType = 7
      end
      object pRLabelInval: TppLabel
        UserName = 'pRLabelInval'
        Caption = 'pRLabelInval'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 152136
        mmTop = 8996
        mmWidth = 67469
        BandType = 7
      end
      object rpTabComutInvLabel38: TppLabel
        UserName = 'rpTabComutInvLabel38'
        Caption = 'Entrada em Invalidez: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 118798
        mmTop = 14288
        mmWidth = 32544
        BandType = 7
      end
      object pRLabelentri: TppLabel
        UserName = 'pRLabelentri'
        Caption = 'pRLabelentri'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 152400
        mmTop = 14288
        mmWidth = 66940
        BandType = 7
      end
      object rpTabComutInvLabel40: TppLabel
        UserName = 'rpTabComutInvLabel40'
        Caption = '  -  Tábuas Utilizadas  -  '
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 8996
        mmWidth = 34925
        BandType = 7
      end
    end
  end
  object pplParticipante: TppBDEPipeline
    DataSource = dsEmiteParticipante
    UserName = 'lParticipante'
    Left = 393
    Top = 15
  end
  object pplDependente: TppBDEPipeline
    DataSource = dsEmiteDependente
    UserName = 'lDependente'
    Left = 393
    Top = 44
  end
  object pplTempo: TppBDEPipeline
    DataSource = dsEmiteTempo
    UserName = 'lTempo'
    Left = 393
    Top = 73
  end
  object pplValor: TppBDEPipeline
    DataSource = dsEmiteValor
    UserName = 'lValor'
    Left = 393
    Top = 102
  end
  object pplBeneficio: TppBDEPipeline
    DataSource = dsEmiteBeneficio
    UserName = 'lBeneficio'
    Left = 393
    Top = 131
  end
  object qryEmiteParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.NO_PESSOA as PATROCINADORA, '
      '       c.DS_TIPO_CAT_PROF_ESP, d.DS_ESTADO_CIVIL,'
      '       e.DS_SEXO, f.DS_IR_CONDICAO_TRABALHO,'
      '       g.DS_SITUACAO_FUNDACAO, h.DS_SITUACAO_PATROC'
      'from FI_PARTICIPANTE a, FI_PESSOA_JURIDICA b,'
      '     FI_TIPO_CATEG_PROF_ESPECIAL c, FI_ESTADO_CIVIL d,'
      '     FI_SEXO e, FI_CONDICAO_TRABALHO f,'
      '     FI_SITUACAO_FUNDACAO g, FI_SITUACAO_PATROC h'
      'where a.CD_PARTIC = :CD_PARTIC'
      '    and a.CD_VERSAO = :CD_VERSAO   '
      '    and a.CD_PESSOA_PATROC = b.CD_PESSOA'
      '    and a.CD_TIPO_CAT_PROF_ESP = c.CD_TIPO_CAT_PROF_ESP (+)'
      '    and a.CD_ESTADO_CIVIL = d.CD_ESTADO_CIVIL (+)'
      '    and a.IR_SEXO = e.IR_SEXO (+)'
      '    and a.IR_CONDICAO_TRABALHO = f.IR_CONDICAO_TRABALHO (+)'
      '    and a.CD_SITUACAO_FUNDACAO = g.CD_SITUACAO_FUNDACAO (+)'
      '    and a.CD_SITUACAO_PATROC = h.CD_SITUACAO_PATROC (+)')
    ValidateWithMask = True
    Left = 337
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteParticipanteCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteParticipanteCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteParticipanteCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
    end
    object qryEmiteParticipanteCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
    end
    object qryEmiteParticipanteCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
    end
    object qryEmiteParticipanteCD_TIPO_CAT_PROF_ESP: TFloatField
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
    end
    object qryEmiteParticipanteNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object qryEmiteParticipanteNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Size = 60
    end
    object qryEmiteParticipanteCD_ESTADO_CIVIL: TStringField
      FieldName = 'CD_ESTADO_CIVIL'
      Size = 1
    end
    object qryEmiteParticipanteIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Size = 1
    end
    object qryEmiteParticipanteTP_PARTICIPANTE: TStringField
      FieldName = 'TP_PARTICIPANTE'
      Size = 1
    end
    object qryEmiteParticipanteIR_CONDICAO_TRABALHO: TStringField
      FieldName = 'IR_CONDICAO_TRABALHO'
      Size = 1
    end
    object qryEmiteParticipanteCD_GRUPO_CALCULO: TFloatField
      FieldName = 'CD_GRUPO_CALCULO'
    end
    object qryEmiteParticipanteDS_REGIONAL: TStringField
      FieldName = 'DS_REGIONAL'
      Size = 60
    end
    object qryEmiteParticipanteCD_SITUACAO_PATROC: TFloatField
      FieldName = 'CD_SITUACAO_PATROC'
    end
    object qryEmiteParticipanteCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
    end
    object qryEmiteParticipanteNR_CPF: TStringField
      FieldName = 'NR_CPF'
      Size = 11
    end
    object qryEmiteParticipantePATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryEmiteParticipanteDS_TIPO_CAT_PROF_ESP: TStringField
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object qryEmiteParticipanteDS_ESTADO_CIVIL: TStringField
      FieldName = 'DS_ESTADO_CIVIL'
    end
    object qryEmiteParticipanteDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 30
    end
    object qryEmiteParticipanteDS_IR_CONDICAO_TRABALHO: TStringField
      FieldName = 'DS_IR_CONDICAO_TRABALHO'
    end
    object qryEmiteParticipanteDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Size = 50
    end
    object qryEmiteParticipanteDS_SITUACAO_PATROC: TStringField
      FieldName = 'DS_SITUACAO_PATROC'
      Size = 60
    end
  end
  object dsEmiteParticipante: TwwDataSource
    DataSet = qryEmiteParticipante
    Left = 365
    Top = 15
  end
  object qryEmiteDependente: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipante
    SQL.Strings = (
      'Select a.*, b.DS_GRAU_INSTRUCAO, c.DS_GRAU_DEPENDENCIA,'
      '       d.DS_DURACAO, e.DS_SEXO, f.DS_IR_E_TITULAR_PENSAO'
      'from FI_DEPENDENTE a, FI_GRAU_INSTRUCAO b,'
      '     FI_GRAU_DEPENDENCIA c, FI_DURACAO d,'
      '     FI_SEXO e, FI_TITULAR_PENSAO f'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_GRAU_INSTRUCAO = b.CD_GRAU_INSTRUCAO (+)'
      '  and a.CD_GRAU_DEPENDENCIA = c.CD_GRAU_DEPENDENCIA (+)'
      '  and a.CD_DURACAO = d.CD_DURACAO (+)'
      '  and a.IR_SEXO = e.IR_SEXO (+)'
      '  and a.IR_E_TITULAR_PENSAO = f.IR_E_TITULAR_PENSAO (+)'
      'order by NR_MATRICULA, NO_DEPENDENTE')
    ValidateWithMask = True
    Left = 337
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteDependenteCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteDependenteCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteDependenteCD_DEPENDENTE: TFloatField
      FieldName = 'CD_DEPENDENTE'
    end
    object qryEmiteDependenteNO_DEPENDENTE: TStringField
      FieldName = 'NO_DEPENDENTE'
      Size = 60
    end
    object qryEmiteDependenteCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
    end
    object qryEmiteDependenteCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryEmiteDependenteCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
    end
    object qryEmiteDependenteNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object qryEmiteDependenteDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
    end
    object qryEmiteDependenteIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Size = 1
    end
    object qryEmiteDependenteNR_ANOS_DEPENDENTE: TFloatField
      FieldName = 'NR_ANOS_DEPENDENTE'
    end
    object qryEmiteDependenteIR_E_TITULAR_PENSAO: TStringField
      FieldName = 'IR_E_TITULAR_PENSAO'
      Size = 1
    end
    object qryEmiteDependenteDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Size = 30
    end
    object qryEmiteDependenteDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Size = 30
    end
    object qryEmiteDependenteDS_DURACAO: TStringField
      FieldName = 'DS_DURACAO'
      Size = 60
    end
    object qryEmiteDependenteDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 30
    end
    object qryEmiteDependenteDS_IR_E_TITULAR_PENSAO: TStringField
      FieldName = 'DS_IR_E_TITULAR_PENSAO'
      Size = 3
    end
  end
  object dsEmiteDependente: TwwDataSource
    DataSet = qryEmiteDependente
    Left = 365
    Top = 44
  end
  object qryEmiteTempo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipante
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_TEMPO'
      'from FI_TEMPO_PARTICIPANTE a, FI_TIPO_TEMPO b'
      'where a.CD_PARTIC = :CD_PARTIC'
      '   and a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_TIPO_TEMPO = b.CD_TIPO_TEMPO (+)'
      'order by DT_TEMPO')
    ValidateWithMask = True
    Left = 337
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteTempoCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteTempoCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteTempoCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
    end
    object qryEmiteTempoDT_TEMPO: TDateTimeField
      FieldName = 'DT_TEMPO'
    end
    object qryEmiteTempoQT_DIA_TEMPO: TFloatField
      FieldName = 'QT_DIA_TEMPO'
    end
    object qryEmiteTempoQT_MES_TEMPO: TFloatField
      FieldName = 'QT_MES_TEMPO'
    end
    object qryEmiteTempoQT_ANO_TEMPO: TFloatField
      FieldName = 'QT_ANO_TEMPO'
    end
    object qryEmiteTempoDS_TIPO_TEMPO: TStringField
      FieldName = 'DS_TIPO_TEMPO'
      Size = 60
    end
  end
  object dsEmiteTempo: TwwDataSource
    DataSet = qryEmiteTempo
    Left = 365
    Top = 73
  end
  object qryEmiteValor: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipante
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_VALOR'
      'from FI_VALOR_PARTICIPANTE a, FI_TIPO_VALOR b'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_TIPO_VALOR = b.CD_TIPO_VALOR (+)'
      'order by b.DS_TIPO_VALOR')
    ValidateWithMask = True
    Left = 337
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteValorCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteValorCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteValorCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
    end
    object qryEmiteValorVL_PARTICIPANTE: TFloatField
      FieldName = 'VL_PARTICIPANTE'
    end
    object qryEmiteValorDS_TIPO_VALOR: TStringField
      FieldName = 'DS_TIPO_VALOR'
      Size = 60
    end
  end
  object dsEmiteValor: TwwDataSource
    DataSet = qryEmiteValor
    Left = 365
    Top = 102
  end
  object qryEmiteBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipante
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_BENEF, c.NO_PLANO'
      
        'From FI_BENEFICIO_CONCEDIDO a, FI_TIPO_BENEFICIO b, FI_PLANO_PAT' +
        'RONAL c'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_TIPO_BENEF = b.CD_TIPO_BENEF'
      '  and a.CD_PESSOA_PATROC = c.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID = c.CD_PESSOA_ENTID'
      '  and a.CD_PLANO = c.CD_PLANO')
    ValidateWithMask = True
    Left = 337
    Top = 131
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteBeneficioCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_VERSAO'
    end
    object qryEmiteBeneficioCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PARTIC'
    end
    object qryEmiteBeneficioCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PESSOA_PATROC'
    end
    object qryEmiteBeneficioCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PESSOA_ENTID'
    end
    object qryEmiteBeneficioCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_PLANO'
    end
    object qryEmiteBeneficioCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF'
    end
    object qryEmiteBeneficioDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      Size = 60
    end
    object qryEmiteBeneficioNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
  end
  object dsEmiteBeneficio: TwwDataSource
    DataSet = qryEmiteBeneficio
    Left = 365
    Top = 131
  end
  object rpParticipante: TppReport
    AutoStop = False
    DataPipeline = pplParticipante
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
    Left = 421
    Top = 73
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'Ficha de Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 77523
        mmTop = 17463
        mmWidth = 42333
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25135
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel49: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel49'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 10319
        mmWidth = 29633
        BandType = 0
      end
      object rpParticipanteLabel29: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'rpParticipanteLabel29'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 55298
      mmPrintPosition = 0
      object rpParticipanteSubReport1: TppSubReport
        UserName = 'rpParticipanteSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplDependente
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 286
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object rpParticipanteLabel1: TppLabel
              UserName = 'rpParticipanteLabel1'
              Caption = 'Dependentes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 21960
              BandType = 0
            end
            object rpParticipanteLine1: TppLine
              UserName = 'rpParticipanteLine1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 24342
              mmTop = 4763
              mmWidth = 172509
              BandType = 0
            end
            object rpParticipanteLabel2: TppLabel
              UserName = 'rpParticipanteLabel2'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 8202
              mmWidth = 8731
              BandType = 0
            end
            object rpParticipanteLabel3: TppLabel
              UserName = 'rpParticipanteLabel3'
              Caption = 'Sexo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 71967
              mmTop = 8202
              mmWidth = 7673
              BandType = 0
            end
            object rpParticipanteLabel4: TppLabel
              UserName = 'rpParticipanteLabel4'
              Caption = 'Dt. Nasc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 102659
              mmTop = 8202
              mmWidth = 13229
              BandType = 0
            end
            object rpParticipanteLabel5: TppLabel
              UserName = 'rpParticipanteLabel5'
              Caption = 'Grau de Instrução'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 125677
              mmTop = 8202
              mmWidth = 26723
              BandType = 0
            end
            object rpParticipanteLabel6: TppLabel
              UserName = 'rpParticipanteLabel6'
              Caption = 'Grau de Parentesco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 163513
              mmTop = 8202
              mmWidth = 29898
              BandType = 0
            end
          end
          object rpParticipanteDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpParticipanteDBText1: TppDBText
              UserName = 'rpParticipanteDBText1'
              DataField = 'NO_DEPENDENTE'
              DataPipeline = pplDependente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 68263
              BandType = 4
            end
            object rpParticipanteDBText2: TppDBText
              UserName = 'rpParticipanteDBText2'
              DataField = 'DS_SEXO'
              DataPipeline = pplDependente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 72231
              mmTop = 794
              mmWidth = 28575
              BandType = 4
            end
            object rpParticipanteDBText3: TppDBText
              UserName = 'rpParticipanteDBText3'
              DataField = 'DT_NASC'
              DataPipeline = pplDependente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 102129
              mmTop = 794
              mmWidth = 21431
              BandType = 4
            end
            object rpParticipanteDBText4: TppDBText
              UserName = 'rpParticipanteDBText4'
              DataField = 'DS_GRAU_INSTRUCAO'
              DataPipeline = pplDependente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 125677
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
            object rpParticipanteDBText5: TppDBText
              UserName = 'rpParticipanteDBText5'
              DataField = 'DS_GRAU_DEPENDENCIA'
              DataPipeline = pplDependente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 163777
              mmTop = 794
              mmWidth = 33338
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteSubReport2: TppSubReport
        UserName = 'rpParticipanteSubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 35983
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplTempo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport2'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 306
          Top = 212
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object rpParticipanteLabel7: TppLabel
              UserName = 'rpParticipanteLabel7'
              Caption = 'Tempo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 11642
              BandType = 0
            end
            object rpParticipanteLine2: TppLine
              UserName = 'rpParticipanteLine2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 14552
              mmTop = 4763
              mmWidth = 182298
              BandType = 0
            end
            object rpParticipanteLabel8: TppLabel
              UserName = 'rpParticipanteLabel8'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 7673
              mmWidth = 15346
              BandType = 0
            end
            object rpParticipanteLabel9: TppLabel
              UserName = 'rpParticipanteLabel9'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 113506
              mmTop = 7673
              mmWidth = 6879
              BandType = 0
            end
            object rpParticipanteLabel10: TppLabel
              UserName = 'rpParticipanteLabel10'
              Caption = 'Dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 136261
              mmTop = 7673
              mmWidth = 6615
              BandType = 0
            end
            object rpParticipanteLabel11: TppLabel
              UserName = 'rpParticipanteLabel11'
              Caption = 'Meses'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 151077
              mmTop = 7673
              mmWidth = 10054
              BandType = 0
            end
            object rpParticipanteLabel12: TppLabel
              UserName = 'rpParticipanteLabel12'
              Caption = 'Anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 169069
              mmTop = 7673
              mmWidth = 7673
              BandType = 0
            end
          end
          object rpParticipanteDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpParticipanteDBText6: TppDBText
              UserName = 'rpParticipanteDBText6'
              DataField = 'DS_TIPO_TEMPO'
              DataPipeline = pplTempo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 106892
              BandType = 4
            end
            object rpParticipanteDBText7: TppDBText
              UserName = 'rpParticipanteDBText7'
              DataField = 'DT_TEMPO'
              DataPipeline = pplTempo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 110861
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object rpParticipanteDBText8: TppDBText
              UserName = 'rpParticipanteDBText8'
              DataField = 'QT_DIA_TEMPO'
              DataPipeline = pplTempo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 137319
              mmTop = 794
              mmWidth = 11377
              BandType = 4
            end
            object rpParticipanteDBText9: TppDBText
              UserName = 'rpParticipanteDBText9'
              DataField = 'QT_MES_TEMPO'
              DataPipeline = pplTempo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 152400
              mmTop = 794
              mmWidth = 13758
              BandType = 4
            end
            object rpParticipanteDBText10: TppDBText
              UserName = 'rpParticipanteDBText10'
              DataField = 'QT_ANO_TEMPO'
              DataPipeline = pplTempo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 170392
              mmTop = 794
              mmWidth = 15346
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteSubReport3: TppSubReport
        UserName = 'rpParticipanteSubReport3'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteSubReport2
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 42333
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplValor
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport3'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 326
          Top = 232
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHeaderBand3: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 11906
            mmPrintPosition = 0
            object rpParticipanteLabel13: TppLabel
              UserName = 'rpParticipanteLabel13'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 8996
              BandType = 0
            end
            object rpParticipanteLine3: TppLine
              UserName = 'rpParticipanteLine3'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 11113
              mmTop = 4763
              mmWidth = 185738
              BandType = 0
            end
            object rpParticipanteLabel14: TppLabel
              UserName = 'rpParticipanteLabel14'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 7408
              mmWidth = 15346
              BandType = 0
            end
            object rpParticipanteLabel15: TppLabel
              UserName = 'rpParticipanteLabel15'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 131763
              mmTop = 7408
              mmWidth = 7938
              BandType = 0
            end
          end
          object rpParticipanteDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpParticipanteDBText11: TppDBText
              UserName = 'rpParticipanteDBText11'
              DataField = 'DS_TIPO_VALOR'
              DataPipeline = pplValor
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 98954
              BandType = 4
            end
            object rpParticipanteDBText12: TppDBText
              UserName = 'rpParticipanteDBText12'
              DataField = 'VL_PARTICIPANTE'
              DataPipeline = pplValor
              DisplayFormat = '#,###,###,##0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 103717
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteSubReport4: TppSubReport
        UserName = 'rpParticipanteSubReport4'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteSubReport3
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 48683
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplBeneficio
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport4'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 346
          Top = 252
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHeaderBand4: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpParticipanteLabel16: TppLabel
              UserName = 'rpParticipanteLabel16'
              Caption = 'Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1852
              mmWidth = 17463
              BandType = 0
            end
            object rpParticipanteLine4: TppLine
              UserName = 'rpParticipanteLine4'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 20638
              mmTop = 5292
              mmWidth = 177271
              BandType = 0
            end
            object rpParticipanteLabel17: TppLabel
              UserName = 'rpParticipanteLabel17'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 8202
              mmWidth = 8467
              BandType = 0
            end
            object rpParticipanteLabel18: TppLabel
              UserName = 'rpParticipanteLabel18'
              Caption = 'Tipo de Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 79111
              mmTop = 8202
              mmWidth = 25665
              BandType = 0
            end
          end
          object rpParticipanteDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpParticipanteDBText13: TppDBText
              UserName = 'rpParticipanteDBText13'
              DataField = 'NO_PLANO'
              DataPipeline = pplBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 75142
              BandType = 4
            end
            object rpParticipanteDBText14: TppDBText
              UserName = 'rpParticipanteDBText14'
              DataField = 'DS_TIPO_BENEF'
              DataPipeline = pplBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 79640
              mmTop = 794
              mmWidth = 101865
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteLabel19: TppLabel
        UserName = 'rpParticipanteLabel19'
        Caption = 'Dados Básicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
      object rpParticipanteLine5: TppLine
        UserName = 'rpParticipanteLine5'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 26194
        mmTop = 4233
        mmWidth = 170657
        BandType = 4
      end
      object rpParticipanteLabel20: TppLabel
        UserName = 'rpParticipanteLabel20'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 7938
        mmWidth = 15610
        BandType = 4
      end
      object rpParticipanteLabel21: TppLabel
        UserName = 'rpParticipanteLabel21'
        Caption = 'Nome: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 50271
        mmTop = 7938
        mmWidth = 10319
        BandType = 4
      end
      object rpParticipanteLabel22: TppLabel
        UserName = 'rpParticipanteLabel22'
        Caption = 'Sexo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 155840
        mmTop = 7938
        mmWidth = 9260
        BandType = 4
      end
      object rpParticipanteLabel23: TppLabel
        UserName = 'rpParticipanteLabel23'
        Caption = 'Estado Civil: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 13758
        mmWidth = 18785
        BandType = 4
      end
      object rpParticipanteLabel24: TppLabel
        UserName = 'rpParticipanteLabel24'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 13758
        mmWidth = 23019
        BandType = 4
      end
      object rpParticipanteLabel25: TppLabel
        UserName = 'rpParticipanteLabel25'
        Caption = 'Categoria Profissional: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 123825
        mmTop = 13758
        mmWidth = 34925
        BandType = 4
      end
      object rpParticipanteDBText15: TppDBText
        UserName = 'rpParticipanteDBText15'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 7938
        mmWidth = 30427
        BandType = 4
      end
      object rpParticipanteDBText16: TppDBText
        UserName = 'rpParticipanteDBText16'
        DataField = 'NO_PESSOA'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 61383
        mmTop = 7938
        mmWidth = 93663
        BandType = 4
      end
      object rpParticipanteDBText17: TppDBText
        UserName = 'rpParticipanteDBText17'
        DataField = 'DS_SEXO'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 7938
        mmWidth = 30956
        BandType = 4
      end
      object rpParticipanteDBText18: TppDBText
        UserName = 'rpParticipanteDBText18'
        DataField = 'DS_ESTADO_CIVIL'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 13758
        mmWidth = 23548
        BandType = 4
      end
      object rpParticipanteDBText19: TppDBText
        UserName = 'rpParticipanteDBText19'
        DataField = 'PATROCINADORA'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 70908
        mmTop = 13758
        mmWidth = 51858
        BandType = 4
      end
      object rpParticipanteDBText20: TppDBText
        UserName = 'rpParticipanteDBText20'
        DataField = 'DS_TIPO_CAT_PROF_ESP'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 13758
        mmWidth = 37306
        BandType = 4
      end
      object rpParticipanteLabel26: TppLabel
        UserName = 'rpParticipanteLabel26'
        Caption = 'Situação na Fundação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 19050
        mmWidth = 34660
        BandType = 4
      end
      object rpParticipanteDBText21: TppDBText
        UserName = 'rpParticipanteDBText21'
        DataField = 'DS_SITUACAO_FUNDACAO'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 19050
        mmWidth = 89429
        BandType = 4
      end
      object rpParticipanteLabel27: TppLabel
        UserName = 'rpParticipanteLabel27'
        Caption = 'Situação na Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 24077
        mmWidth = 41540
        BandType = 4
      end
      object rpParticipanteDBText22: TppDBText
        UserName = 'rpParticipanteDBText22'
        DataField = 'DS_SITUACAO_PATROC'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 44979
        mmTop = 24077
        mmWidth = 152136
        BandType = 4
      end
      object rpParticipanteLabel28: TppLabel
        UserName = 'rpParticipanteLabel28'
        Caption = 'Regional: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 19050
        mmWidth = 14552
        BandType = 4
      end
      object rpParticipanteDBText23: TppDBText
        UserName = 'rpParticipanteDBText23'
        DataField = 'DS_REGIONAL'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 19050
        mmWidth = 53446
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
      object ppLabel55: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel55'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
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
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplParticipanteHist: TppBDEPipeline
    DataSource = dsEmiteParticipanteHist
    UserName = 'lParticipanteHist'
    Left = 393
    Top = 161
  end
  object pplDependenteHist: TppBDEPipeline
    DataSource = dsEmiteDependenteHist
    UserName = 'lDependenteHist'
    Left = 393
    Top = 190
  end
  object pplTempoHist: TppBDEPipeline
    DataSource = dsEmiteTempoHist
    UserName = 'lTempoHist'
    Left = 393
    Top = 219
  end
  object pplValorHist: TppBDEPipeline
    DataSource = dsEmiteValorHist
    UserName = 'lValorHist'
    Left = 393
    Top = 248
  end
  object pplBeneficioHist: TppBDEPipeline
    DataSource = dsEmiteBeneficioHist
    UserName = 'lBeneficioHist'
    Left = 393
    Top = 277
  end
  object qryEmiteParticipanteHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.NO_PESSOA as PATROCINADORA, '
      '       c.DS_TIPO_CAT_PROF_ESP, d.DS_ESTADO_CIVIL,'
      '       e.DS_SEXO, f.DS_IR_CONDICAO_TRABALHO,'
      '       g.DS_SITUACAO_FUNDACAO, h.DS_SITUACAO_PATROC'
      'from FI_BK_PARTICIPANTE a, FI_PESSOA_JURIDICA b,'
      '     FI_TIPO_CATEG_PROF_ESPECIAL c, FI_ESTADO_CIVIL d,'
      '     FI_SEXO e, FI_CONDICAO_TRABALHO f,'
      '     FI_SITUACAO_FUNDACAO g, FI_SITUACAO_PATROC h'
      'where a.CD_PARTIC = :CD_PARTIC'
      '    and a.CD_VERSAO = :CD_VERSAO'
      '    and a.CD_PESSOA_PATROC = b.CD_PESSOA'
      '    and a.CD_TIPO_CAT_PROF_ESP = c.CD_TIPO_CAT_PROF_ESP (+)'
      '    and a.CD_ESTADO_CIVIL = d.CD_ESTADO_CIVIL (+)'
      '    and a.IR_SEXO = e.IR_SEXO (+)'
      '    and a.IR_CONDICAO_TRABALHO = f.IR_CONDICAO_TRABALHO (+)'
      '    and a.CD_SITUACAO_FUNDACAO = g.CD_SITUACAO_FUNDACAO (+)'
      '    and a.CD_SITUACAO_PATROC = h.CD_SITUACAO_PATROC (+)')
    ValidateWithMask = True
    Left = 337
    Top = 161
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteParticipanteHistCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteParticipanteHistCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteParticipanteHistCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
    end
    object qryEmiteParticipanteHistCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
    end
    object qryEmiteParticipanteHistCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
    end
    object qryEmiteParticipanteHistCD_TIPO_CAT_PROF_ESP: TFloatField
      FieldName = 'CD_TIPO_CAT_PROF_ESP'
    end
    object qryEmiteParticipanteHistNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object qryEmiteParticipanteHistNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Size = 60
    end
    object qryEmiteParticipanteHistCD_ESTADO_CIVIL: TStringField
      FieldName = 'CD_ESTADO_CIVIL'
      Size = 1
    end
    object qryEmiteParticipanteHistIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Size = 1
    end
    object qryEmiteParticipanteHistTP_PARTICIPANTE: TStringField
      FieldName = 'TP_PARTICIPANTE'
      Size = 1
    end
    object qryEmiteParticipanteHistIR_CONDICAO_TRABALHO: TStringField
      FieldName = 'IR_CONDICAO_TRABALHO'
      Size = 1
    end
    object qryEmiteParticipanteHistCD_GRUPO_CALCULO: TFloatField
      FieldName = 'CD_GRUPO_CALCULO'
    end
    object qryEmiteParticipanteHistDS_REGIONAL: TStringField
      FieldName = 'DS_REGIONAL'
      Size = 60
    end
    object qryEmiteParticipanteHistCD_SITUACAO_PATROC: TFloatField
      FieldName = 'CD_SITUACAO_PATROC'
    end
    object qryEmiteParticipanteHistCD_SITUACAO_FUNDACAO: TFloatField
      FieldName = 'CD_SITUACAO_FUNDACAO'
    end
    object qryEmiteParticipanteHistNR_CPF: TStringField
      FieldName = 'NR_CPF'
      Size = 11
    end
    object qryEmiteParticipanteHistPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryEmiteParticipanteHistDS_TIPO_CAT_PROF_ESP: TStringField
      FieldName = 'DS_TIPO_CAT_PROF_ESP'
      Size = 60
    end
    object qryEmiteParticipanteHistDS_ESTADO_CIVIL: TStringField
      FieldName = 'DS_ESTADO_CIVIL'
    end
    object qryEmiteParticipanteHistDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 30
    end
    object qryEmiteParticipanteHistDS_IR_CONDICAO_TRABALHO: TStringField
      FieldName = 'DS_IR_CONDICAO_TRABALHO'
    end
    object qryEmiteParticipanteHistDS_SITUACAO_FUNDACAO: TStringField
      FieldName = 'DS_SITUACAO_FUNDACAO'
      Size = 50
    end
    object qryEmiteParticipanteHistDS_SITUACAO_PATROC: TStringField
      FieldName = 'DS_SITUACAO_PATROC'
      Size = 60
    end
  end
  object dsEmiteParticipanteHist: TwwDataSource
    DataSet = qryEmiteParticipanteHist
    Left = 365
    Top = 161
  end
  object qryEmiteDependenteHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipanteHist
    SQL.Strings = (
      'Select a.*, b.DS_GRAU_INSTRUCAO, c.DS_GRAU_DEPENDENCIA,'
      '       d.DS_DURACAO, e.DS_SEXO, f.DS_IR_E_TITULAR_PENSAO'
      'from FI_BK_DEPENDENTE a, FI_GRAU_INSTRUCAO b,'
      '     FI_GRAU_DEPENDENCIA c, FI_DURACAO d,'
      '     FI_SEXO e, FI_TITULAR_PENSAO f'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_GRAU_INSTRUCAO = b.CD_GRAU_INSTRUCAO (+)'
      '  and a.CD_GRAU_DEPENDENCIA = c.CD_GRAU_DEPENDENCIA (+)'
      '  and a.CD_DURACAO = d.CD_DURACAO (+)'
      '  and a.IR_SEXO = e.IR_SEXO (+)'
      '  and a.IR_E_TITULAR_PENSAO = f.IR_E_TITULAR_PENSAO (+)'
      'order by NR_MATRICULA, NO_DEPENDENTE')
    ValidateWithMask = True
    Left = 337
    Top = 190
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteDependenteHistCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteDependenteHistCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteDependenteHistCD_DEPENDENTE: TFloatField
      FieldName = 'CD_DEPENDENTE'
    end
    object qryEmiteDependenteHistNO_DEPENDENTE: TStringField
      FieldName = 'NO_DEPENDENTE'
      Size = 60
    end
    object qryEmiteDependenteHistCD_GRAU_INSTRUCAO: TFloatField
      FieldName = 'CD_GRAU_INSTRUCAO'
    end
    object qryEmiteDependenteHistCD_GRAU_DEPENDENCIA: TStringField
      FieldName = 'CD_GRAU_DEPENDENCIA'
      Size = 3
    end
    object qryEmiteDependenteHistCD_DURACAO: TFloatField
      FieldName = 'CD_DURACAO'
    end
    object qryEmiteDependenteHistNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Size = 15
    end
    object qryEmiteDependenteHistDT_NASC: TDateTimeField
      FieldName = 'DT_NASC'
    end
    object qryEmiteDependenteHistIR_SEXO: TStringField
      FieldName = 'IR_SEXO'
      Size = 1
    end
    object qryEmiteDependenteHistNR_ANOS_DEPENDENTE: TFloatField
      FieldName = 'NR_ANOS_DEPENDENTE'
    end
    object qryEmiteDependenteHistIR_E_TITULAR_PENSAO: TStringField
      FieldName = 'IR_E_TITULAR_PENSAO'
      Size = 1
    end
    object qryEmiteDependenteHistDS_GRAU_INSTRUCAO: TStringField
      FieldName = 'DS_GRAU_INSTRUCAO'
      Size = 30
    end
    object qryEmiteDependenteHistDS_GRAU_DEPENDENCIA: TStringField
      FieldName = 'DS_GRAU_DEPENDENCIA'
      Size = 30
    end
    object qryEmiteDependenteHistDS_DURACAO: TStringField
      FieldName = 'DS_DURACAO'
      Size = 60
    end
    object qryEmiteDependenteHistDS_SEXO: TStringField
      FieldName = 'DS_SEXO'
      Size = 30
    end
    object qryEmiteDependenteHistDS_IR_E_TITULAR_PENSAO: TStringField
      FieldName = 'DS_IR_E_TITULAR_PENSAO'
      Size = 3
    end
  end
  object dsEmiteDependenteHist: TwwDataSource
    DataSet = qryEmiteDependenteHist
    Left = 365
    Top = 190
  end
  object qryEmiteTempoHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipanteHist
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_TEMPO'
      'from FI_BK_TEMPO_PARTICIPANTE a, FI_TIPO_TEMPO b'
      'where a.CD_PARTIC = :CD_PARTIC'
      '   and a.CD_VERSAO = :CD_VERSAO'
      '   and a.CD_TIPO_TEMPO = b.CD_TIPO_TEMPO (+)'
      'order by DT_TEMPO')
    ValidateWithMask = True
    Left = 337
    Top = 219
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteTempoHistCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteTempoHistCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteTempoHistCD_TIPO_TEMPO: TFloatField
      FieldName = 'CD_TIPO_TEMPO'
    end
    object qryEmiteTempoHistDT_TEMPO: TDateTimeField
      FieldName = 'DT_TEMPO'
    end
    object qryEmiteTempoHistQT_DIA_TEMPO: TFloatField
      FieldName = 'QT_DIA_TEMPO'
    end
    object qryEmiteTempoHistQT_MES_TEMPO: TFloatField
      FieldName = 'QT_MES_TEMPO'
    end
    object qryEmiteTempoHistQT_ANO_TEMPO: TFloatField
      FieldName = 'QT_ANO_TEMPO'
    end
    object qryEmiteTempoHistDS_TIPO_TEMPO: TStringField
      FieldName = 'DS_TIPO_TEMPO'
      Size = 60
    end
  end
  object dsEmiteTempoHist: TwwDataSource
    DataSet = qryEmiteTempoHist
    Left = 365
    Top = 219
  end
  object qryEmiteValorHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipanteHist
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_VALOR'
      'from FI_BK_VALOR_PARTICIPANTE a, FI_TIPO_VALOR b'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_TIPO_VALOR = b.CD_TIPO_VALOR (+)'
      'order by b.DS_TIPO_VALOR')
    ValidateWithMask = True
    Left = 337
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteValorHistCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
    end
    object qryEmiteValorHistCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
    end
    object qryEmiteValorHistCD_TIPO_VALOR: TFloatField
      FieldName = 'CD_TIPO_VALOR'
    end
    object qryEmiteValorHistVL_PARTICIPANTE: TFloatField
      FieldName = 'VL_PARTICIPANTE'
    end
    object qryEmiteValorHistDS_TIPO_VALOR: TStringField
      FieldName = 'DS_TIPO_VALOR'
      Size = 60
    end
  end
  object dsEmiteValorHist: TwwDataSource
    DataSet = qryEmiteValorHist
    Left = 365
    Top = 248
  end
  object qryEmiteBeneficioHist: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsEmiteParticipanteHist
    SQL.Strings = (
      'Select a.*, b.DS_TIPO_BENEF, c.NO_PLANO'
      
        'From FI_BK_BENEFICIO_CONCEDIDO a, FI_TIPO_BENEFICIO b, FI_PLANO_' +
        'PATRONAL c'
      'where a.CD_PARTIC = :CD_PARTIC'
      '  and a.CD_VERSAO = :CD_VERSAO'
      '  and a.CD_TIPO_BENEF = b.CD_TIPO_BENEF'
      '  and a.CD_PESSOA_PATROC = c.CD_PESSOA_PATROC'
      '  and a.CD_PESSOA_ENTID = c.CD_PESSOA_ENTID'
      '  and a.CD_PLANO = c.CD_PLANO')
    ValidateWithMask = True
    Left = 337
    Top = 277
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryEmiteBeneficioHistCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_VERSAO'
    end
    object qryEmiteBeneficioHistCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PARTIC'
    end
    object qryEmiteBeneficioHistCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PESSOA_PATROC'
    end
    object qryEmiteBeneficioHistCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PESSOA_ENTID'
    end
    object qryEmiteBeneficioHistCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_PLANO'
    end
    object qryEmiteBeneficioHistCD_TIPO_BENEF: TFloatField
      FieldName = 'CD_TIPO_BENEF'
      Origin = 'FI_BK_BENEFICIO_CONCEDIDO.CD_TIPO_BENEF'
    end
    object qryEmiteBeneficioHistDS_TIPO_BENEF: TStringField
      FieldName = 'DS_TIPO_BENEF'
      Origin = 'FI_TIPO_BENEFICIO.DS_TIPO_BENEF'
      Size = 60
    end
    object qryEmiteBeneficioHistNO_PLANO: TStringField
      FieldName = 'NO_PLANO'
      Origin = 'FI_PLANO_PATRONAL.NO_PLANO'
      Size = 60
    end
  end
  object dsEmiteBeneficioHist: TwwDataSource
    DataSet = qryEmiteBeneficioHist
    Left = 365
    Top = 277
  end
  object rpParticipanteHist: TppReport
    AutoStop = False
    DataPipeline = pplParticipanteHist
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
    Left = 421
    Top = 219
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'ppLabel51'
        Caption = 'Ficha de Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 77523
        mmTop = 18256
        mmWidth = 42333
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel53: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel53'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 11113
        mmWidth = 29633
        BandType = 0
      end
      object rpParticipanteHistLabel51: TppLabel
        UserName = 'rpParticipanteHistLabel51'
        Caption = '* * * H i s t ó r i c o * * *'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 20638
        mmWidth = 37306
        BandType = 0
      end
      object rpParticipanteHistLabel29: TppLabel
        OnPrint = LblEntidadeHistPrint
        UserName = 'rpParticipanteHistLabel29'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 57679
      mmPrintPosition = 0
      object rpParticipanteHistSubReport1: TppSubReport
        UserName = 'rpParticipanteHistSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 29369
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteHistChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplDependenteHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 286
          Top = 192
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHistHeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object rpParticipanteHistLabel1: TppLabel
              UserName = 'rpParticipanteHistLabel1'
              Caption = 'Dependentes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 21960
              BandType = 0
            end
            object rpParticipanteHistLine1: TppLine
              UserName = 'rpParticipanteHistLine1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 24342
              mmTop = 4763
              mmWidth = 172509
              BandType = 0
            end
            object rpParticipanteHistLabel2: TppLabel
              UserName = 'rpParticipanteHistLabel2'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 8202
              mmWidth = 8731
              BandType = 0
            end
            object rpParticipanteHistLabel3: TppLabel
              UserName = 'rpParticipanteHistLabel3'
              Caption = 'Sexo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 71967
              mmTop = 8202
              mmWidth = 7673
              BandType = 0
            end
            object rpParticipanteHistLabel4: TppLabel
              UserName = 'rpParticipanteHistLabel4'
              Caption = 'Dt. Nasc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 102659
              mmTop = 8202
              mmWidth = 13229
              BandType = 0
            end
            object rpParticipanteHistLabel5: TppLabel
              UserName = 'rpParticipanteHistLabel5'
              Caption = 'Grau de Instrução'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 125677
              mmTop = 8202
              mmWidth = 26723
              BandType = 0
            end
            object rpParticipanteHistLabel6: TppLabel
              UserName = 'rpParticipanteHistLabel6'
              Caption = 'Grau de Parentesco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 163513
              mmTop = 8202
              mmWidth = 29898
              BandType = 0
            end
          end
          object rpParticipanteHistDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpParticipanteHistDBText1: TppDBText
              UserName = 'rpParticipanteHistDBText1'
              DataField = 'NO_DEPENDENTE'
              DataPipeline = pplDependenteHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 68263
              BandType = 4
            end
            object rpParticipanteHistDBText2: TppDBText
              UserName = 'rpParticipanteHistDBText2'
              DataField = 'DS_SEXO'
              DataPipeline = pplDependenteHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 72231
              mmTop = 794
              mmWidth = 28575
              BandType = 4
            end
            object rpParticipanteHistDBText3: TppDBText
              UserName = 'rpParticipanteHistDBText3'
              DataField = 'DT_NASC'
              DataPipeline = pplDependenteHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 102129
              mmTop = 794
              mmWidth = 21431
              BandType = 4
            end
            object rpParticipanteHistDBText4: TppDBText
              UserName = 'rpParticipanteHistDBText4'
              DataField = 'DS_GRAU_INSTRUCAO'
              DataPipeline = pplDependenteHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 125677
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
            object rpParticipanteHistDBText5: TppDBText
              UserName = 'rpParticipanteHistDBText5'
              DataField = 'DS_GRAU_DEPENDENCIA'
              DataPipeline = pplDependenteHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 163777
              mmTop = 794
              mmWidth = 33338
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteHistSubReport2: TppSubReport
        UserName = 'rpParticipanteHistSubReport2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteHistSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 35719
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteHistChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplTempoHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport2'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 306
          Top = 212
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHistHeaderBand2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object rpParticipanteHistLabel7: TppLabel
              UserName = 'rpParticipanteHistLabel7'
              Caption = 'Tempo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 11642
              BandType = 0
            end
            object rpParticipanteHistLine2: TppLine
              UserName = 'rpParticipanteHistLine2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 14552
              mmTop = 4763
              mmWidth = 182298
              BandType = 0
            end
            object rpParticipanteHistLabel8: TppLabel
              UserName = 'rpParticipanteHistLabel8'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 7673
              mmWidth = 15346
              BandType = 0
            end
            object rpParticipanteHistLabel9: TppLabel
              UserName = 'rpParticipanteHistLabel9'
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 113506
              mmTop = 7673
              mmWidth = 6879
              BandType = 0
            end
            object rpParticipanteHistLabel10: TppLabel
              UserName = 'rpParticipanteHistLabel10'
              Caption = 'Dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 136261
              mmTop = 7673
              mmWidth = 6615
              BandType = 0
            end
            object rpParticipanteHistLabel11: TppLabel
              UserName = 'rpParticipanteHistLabel11'
              Caption = 'Meses'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 151077
              mmTop = 7673
              mmWidth = 10054
              BandType = 0
            end
            object rpParticipanteHistLabel12: TppLabel
              UserName = 'rpParticipanteHistLabel12'
              Caption = 'Anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 169069
              mmTop = 7673
              mmWidth = 7673
              BandType = 0
            end
          end
          object rpParticipanteHistDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpParticipanteHistDBText6: TppDBText
              UserName = 'rpParticipanteHistDBText6'
              DataField = 'DS_TIPO_TEMPO'
              DataPipeline = pplTempoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 106892
              BandType = 4
            end
            object rpParticipanteHistDBText7: TppDBText
              UserName = 'rpParticipanteHistDBText7'
              DataField = 'DT_TEMPO'
              DataPipeline = pplTempoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 110861
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object rpParticipanteHistDBText8: TppDBText
              UserName = 'rpParticipanteHistDBText8'
              DataField = 'QT_DIA_TEMPO'
              DataPipeline = pplTempoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 137319
              mmTop = 794
              mmWidth = 11377
              BandType = 4
            end
            object rpParticipanteHistDBText9: TppDBText
              UserName = 'rpParticipanteHistDBText9'
              DataField = 'QT_MES_TEMPO'
              DataPipeline = pplTempoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 152400
              mmTop = 794
              mmWidth = 13758
              BandType = 4
            end
            object rpParticipanteHistDBText10: TppDBText
              UserName = 'rpParticipanteHistDBText10'
              DataField = 'QT_ANO_TEMPO'
              DataPipeline = pplTempoHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 170392
              mmTop = 794
              mmWidth = 15346
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteHistSubReport3: TppSubReport
        UserName = 'rpParticipanteHistSubReport3'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteHistSubReport2
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 42069
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteHistChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplValorHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport3'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 326
          Top = 232
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHistHeaderBand3: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 11906
            mmPrintPosition = 0
            object rpParticipanteHistLabel13: TppLabel
              UserName = 'rpParticipanteHistLabel13'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1323
              mmWidth = 8996
              BandType = 0
            end
            object rpParticipanteHistLine3: TppLine
              UserName = 'rpParticipanteHistLine3'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 11113
              mmTop = 4763
              mmWidth = 185738
              BandType = 0
            end
            object rpParticipanteHistLabel14: TppLabel
              UserName = 'rpParticipanteHistLabel14'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 7408
              mmWidth = 15346
              BandType = 0
            end
            object rpParticipanteHistLabel15: TppLabel
              UserName = 'rpParticipanteHistLabel15'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 131763
              mmTop = 7408
              mmWidth = 7938
              BandType = 0
            end
          end
          object rpParticipanteHistDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpParticipanteHistDBText11: TppDBText
              UserName = 'rpParticipanteHistDBText11'
              DataField = 'DS_TIPO_VALOR'
              DataPipeline = pplValorHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 98954
              BandType = 4
            end
            object rpParticipanteHistDBText12: TppDBText
              UserName = 'rpParticipanteHistDBText12'
              DataField = 'VL_PARTICIPANTE'
              DataPipeline = pplValorHist
              DisplayFormat = '#,###,###,##0.00000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 103717
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteHistSubReport4: TppSubReport
        UserName = 'rpParticipanteHistSubReport4'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpParticipanteHistSubReport3
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 48419
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpParticipanteHistChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplBeneficioHist
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ppReportChildReport4'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 346
          Top = 252
          Version = '5.5'
          mmColumnWidth = 0
          object rpParticipanteHistHeaderBand4: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpParticipanteHistLabel16: TppLabel
              UserName = 'rpParticipanteHistLabel16'
              Caption = 'Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 1852
              mmWidth = 17463
              BandType = 0
            end
            object rpParticipanteHistLine4: TppLine
              UserName = 'rpParticipanteHistLine4'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 20638
              mmTop = 5292
              mmWidth = 177271
              BandType = 0
            end
            object rpParticipanteHistLabel17: TppLabel
              UserName = 'rpParticipanteHistLabel17'
              Caption = 'Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 8202
              mmWidth = 8467
              BandType = 0
            end
            object rpParticipanteHistLabel18: TppLabel
              UserName = 'rpParticipanteHistLabel18'
              Caption = 'Tipo de Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 79111
              mmTop = 8202
              mmWidth = 25665
              BandType = 0
            end
          end
          object rpParticipanteHistDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpParticipanteHistDBText13: TppDBText
              UserName = 'rpParticipanteHistDBText13'
              DataField = 'NO_PLANO'
              DataPipeline = pplBeneficioHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 2646
              mmTop = 794
              mmWidth = 75142
              BandType = 4
            end
            object rpParticipanteHistDBText14: TppDBText
              UserName = 'rpParticipanteHistDBText14'
              DataField = 'DS_TIPO_BENEF'
              DataPipeline = pplBeneficioHist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 79640
              mmTop = 794
              mmWidth = 101865
              BandType = 4
            end
          end
        end
      end
      object rpParticipanteHistLabel19: TppLabel
        UserName = 'rpParticipanteHistLabel19'
        Caption = 'Dados Básicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
      object rpParticipanteHistLine5: TppLine
        UserName = 'rpParticipanteHistLine5'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 26194
        mmTop = 4233
        mmWidth = 170657
        BandType = 4
      end
      object rpParticipanteHistDBText15: TppDBText
        UserName = 'rpParticipanteHistDBText15'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 7938
        mmWidth = 30427
        BandType = 4
      end
      object rpParticipanteHistDBText18: TppDBText
        UserName = 'rpParticipanteHistDBText18'
        DataField = 'DS_TIPO_CAT_PROF_ESP'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 13229
        mmWidth = 37306
        BandType = 4
      end
      object rpParticipanteHistLabel23: TppLabel
        UserName = 'rpParticipanteHistLabel23'
        Caption = 'Categoria Profissional: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 123825
        mmTop = 13229
        mmWidth = 34925
        BandType = 4
      end
      object rpParticipanteHistDBText19: TppDBText
        UserName = 'rpParticipanteHistDBText19'
        DataField = 'PATROCINADORA'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 70908
        mmTop = 13229
        mmWidth = 51858
        BandType = 4
      end
      object rpParticipanteHistLabel24: TppLabel
        UserName = 'rpParticipanteHistLabel24'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 13229
        mmWidth = 23019
        BandType = 4
      end
      object rpParticipanteHistDBText20: TppDBText
        UserName = 'rpParticipanteHistDBText20'
        DataField = 'DS_ESTADO_CIVIL'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 13229
        mmWidth = 23548
        BandType = 4
      end
      object rpParticipanteHistLabel25: TppLabel
        UserName = 'rpParticipanteHistLabel25'
        Caption = 'Estado Civil: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 13229
        mmWidth = 18785
        BandType = 4
      end
      object rpParticipanteHistLabel44: TppLabel
        UserName = 'rpParticipanteHistLabel44'
        Caption = 'Dados Básicos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
      object rpParticipanteHistLine10: TppLine
        UserName = 'rpParticipanteHistLine10'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 26194
        mmTop = 4233
        mmWidth = 170657
        BandType = 4
      end
      object rpParticipanteHistDBText36: TppDBText
        UserName = 'rpParticipanteHistDBText36'
        DataField = 'NO_PESSOA'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 61648
        mmTop = 7938
        mmWidth = 93398
        BandType = 4
      end
      object rpParticipanteHistDBText37: TppDBText
        UserName = 'rpParticipanteHistDBText37'
        DataField = 'DS_SEXO'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 7938
        mmWidth = 30956
        BandType = 4
      end
      object rpParticipanteHistDBText38: TppDBText
        UserName = 'rpParticipanteHistDBText38'
        DataField = 'DS_TIPO_CAT_PROF_ESP'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 159544
        mmTop = 13229
        mmWidth = 37306
        BandType = 4
      end
      object rpParticipanteHistLabel48: TppLabel
        UserName = 'rpParticipanteHistLabel48'
        Caption = 'Categoria Profissional: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 123825
        mmTop = 13229
        mmWidth = 34925
        BandType = 4
      end
      object rpParticipanteHistDBText39: TppDBText
        UserName = 'rpParticipanteHistDBText39'
        DataField = 'PATROCINADORA'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 70908
        mmTop = 13229
        mmWidth = 51858
        BandType = 4
      end
      object rpParticipanteHistLabel49: TppLabel
        UserName = 'rpParticipanteHistLabel49'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 13229
        mmWidth = 23019
        BandType = 4
      end
      object rpParticipanteHistDBText40: TppDBText
        UserName = 'rpParticipanteHistDBText40'
        DataField = 'DS_ESTADO_CIVIL'
        DataPipeline = pplParticipanteHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 13229
        mmWidth = 23548
        BandType = 4
      end
      object rpParticipanteHistLabel50: TppLabel
        UserName = 'rpParticipanteHistLabel50'
        Caption = 'Estado Civil: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 13229
        mmWidth = 18785
        BandType = 4
      end
      object rpParticipanteHistLabel26: TppLabel
        UserName = 'rpParticipanteHistLabel26'
        Caption = 'Situação na Fundação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 18521
        mmWidth = 34660
        BandType = 4
      end
      object rpParticipanteHistDBText21: TppDBText
        UserName = 'rpParticipanteHistDBText21'
        DataField = 'DS_SITUACAO_FUNDACAO'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 18521
        mmWidth = 89429
        BandType = 4
      end
      object rpParticipanteHistLabel27: TppLabel
        UserName = 'rpParticipanteHistLabel27'
        Caption = 'Situação na Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 23813
        mmWidth = 41540
        BandType = 4
      end
      object rpParticipanteHistDBText22: TppDBText
        UserName = 'rpParticipanteHistDBText22'
        DataField = 'DS_SITUACAO_PATROC'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 44979
        mmTop = 23813
        mmWidth = 152136
        BandType = 4
      end
      object rpParticipanteHistLabel28: TppLabel
        UserName = 'rpParticipanteHistLabel28'
        Caption = 'Regional: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 128323
        mmTop = 18521
        mmWidth = 14552
        BandType = 4
      end
      object rpParticipanteHistDBText23: TppDBText
        UserName = 'rpParticipanteHistDBText23'
        DataField = 'DS_REGIONAL'
        DataPipeline = pplParticipante
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 18521
        mmWidth = 53446
        BandType = 4
      end
      object rpParticipanteHistLabel20: TppLabel
        UserName = 'rpParticipanteHistLabel20'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 7938
        mmWidth = 15610
        BandType = 4
      end
      object rpParticipanteHistLabel21: TppLabel
        UserName = 'rpParticipanteHistLabel21'
        Caption = 'Nome: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 50271
        mmTop = 7938
        mmWidth = 10319
        BandType = 4
      end
      object rpParticipanteHistLabel22: TppLabel
        UserName = 'rpParticipanteHistLabel22'
        Caption = 'Sexo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 155840
        mmTop = 7938
        mmWidth = 9260
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel81: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel81'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplComparaVersao: TppBDEPipeline
    DataSource = dsComparaVersao
    UserName = 'lComparaVersao'
    Left = 213
    Top = 5
  end
  object qryComparaVersao: TwwQuery
    DatabaseName = 'dtbsTemporario'
    SQL.Strings = (
      'Select distinct Condicao, Partic, Matricula,'
      '                ValCampoAtual, ValCampoAnterior'
      'from TempComparaVersao '
      'order by Condicao')
    ValidateWithMask = True
    Left = 157
    Top = 5
    object qryComparaVersaoCondicao: TStringField
      FieldName = 'Condicao'
      Origin = '"TempComparaVersao.DB".Condicao'
      Size = 100
    end
    object qryComparaVersaoPartic: TIntegerField
      FieldName = 'Partic'
      Origin = '"TempComparaVersao.DB".Partic'
    end
    object qryComparaVersaoMatricula: TStringField
      FieldName = 'Matricula'
      Origin = '"TempComparaVersao.DB".Matricula'
      Size = 15
    end
    object qryComparaVersaoValCampoAtual: TStringField
      FieldName = 'ValCampoAtual'
      Origin = '"TempComparaVersao.DB".ValCampoAtual'
      Size = 60
    end
    object qryComparaVersaoValCampoAnterior: TStringField
      FieldName = 'ValCampoAnterior'
      Origin = '"TempComparaVersao.DB".ValCampoAnterior'
      Size = 60
    end
  end
  object dsComparaVersao: TwwDataSource
    DataSet = qryComparaVersao
    Left = 185
    Top = 5
  end
  object rpComparaVersao: TppReport
    AutoStop = False
    DataPipeline = pplComparaVersao
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
    Left = 241
    Top = 5
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'Comparação entre Versões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71173
        mmTop = 15875
        mmWidth = 55033
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel61'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 8731
        mmWidth = 29633
        BandType = 0
      end
      object rpComparaVersaoLabel1: TppLabel
        UserName = 'rpComparaVersaoLabel1'
        Caption = 'Versão Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 26194
        mmWidth = 20902
        BandType = 0
      end
      object rpComparaVersaoLabel6: TppLabel
        UserName = 'rpComparaVersaoLabel6'
        Caption = 'Versão Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 93927
        mmTop = 26194
        mmWidth = 25400
        BandType = 0
      end
      object QrlVersaoAtual: TppLabel
        UserName = 'QrlVersaoAtual'
        AutoSize = False
        Caption = 'Versão Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 22754
        mmTop = 26194
        mmWidth = 70115
        BandType = 0
      end
      object QrlVersaoAnterior: TppLabel
        UserName = 'QrlVersaoAnterior'
        AutoSize = False
        Caption = 'Versão Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 26194
        mmWidth = 76729
        BandType = 0
      end
      object rpComparaVersaoLabel7: TppLabel
        UserName = 'rpComparaVersaoLabel7'
        Caption = 'Grupo Exportação: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 794
        mmTop = 31221
        mmWidth = 28575
        BandType = 0
      end
      object QrlGrupoExportacao: TppLabel
        UserName = 'QrlGrupoExportacao'
        AutoSize = False
        Caption = 'Versão Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 30427
        mmTop = 31221
        mmWidth = 166688
        BandType = 0
      end
      object rpComparaVersaoLabel8: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'rpComparaVersaoLabel8'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 192352
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'Matricula'
        DataPipeline = pplComparaVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 794
        mmWidth = 38365
        BandType = 4
      end
      object rpComparaVersaoDBText1: TppDBText
        UserName = 'rpComparaVersaoDBText1'
        DataField = 'ValCampoAtual'
        DataPipeline = pplComparaVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 794
        mmWidth = 75406
        BandType = 4
      end
      object rpComparaVersaoDBText3: TppDBText
        UserName = 'rpComparaVersaoDBText3'
        DataField = 'ValCampoAnterior'
        DataPipeline = pplComparaVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 121444
        mmTop = 794
        mmWidth = 75406
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'ppLine39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel69: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
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
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
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
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpComparaVersaoGroup1: TppGroup
      BreakName = 'CONDICAO'
      DataPipeline = pplComparaVersao
      UserName = 'rpComparaVersaoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpComparaVersaoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpComparaVersaoShape1: TppShape
          UserName = 'rpComparaVersaoShape1'
          Brush.Color = clSilver
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 197644
          BandType = 3
          GroupNo = 0
        end
        object rpComparaVersaoLabel2: TppLabel
          UserName = 'rpComparaVersaoLabel2'
          Caption = 'Condição: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 1058
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpComparaVersaoDBText4: TppDBText
          UserName = 'rpComparaVersaoDBText4'
          DataField = 'Condicao'
          DataPipeline = pplComparaVersao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 18785
          mmTop = 1058
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpComparaVersaoLabel3: TppLabel
          UserName = 'rpComparaVersaoLabel3'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 6085
          mmTop = 7408
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpComparaVersaoLabel4: TppLabel
          UserName = 'rpComparaVersaoLabel4'
          Caption = 'Valor do Campo Versão Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 7408
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object rpComparaVersaoLabel5: TppLabel
          UserName = 'rpComparaVersaoLabel5'
          Caption = 'Valor do Campo Versão Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 120915
          mmTop = 7408
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
      end
      object rpComparaVersaoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
    end
  end
  object rptLayout: TppReport
    AutoStop = False
    DataPipeline = pplLayout
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
    Left = 241
    Top = 34
    Version = '5.5'
    mmColumnWidth = 197300
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
    end
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel58: TppLabel
        UserName = 'Label11'
        Caption = 'Layout de Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 80963
        mmTop = 8731
        mmWidth = 37042
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel59: TppLabel
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
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 33867
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Ordem do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7935
        mmTop = 2117
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'NR_ORDEM'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 40481
        mmTop = 2118
        mmWidth = 20108
        BandType = 4
      end
      object ppLabel71: TppLabel
        UserName = 'Label701'
        Caption = 'Nome do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 60061
        mmTop = 2118
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'NO_CAMPO_ARQUIVO'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 91017
        mmTop = 2118
        mmWidth = 38629
        BandType = 4
      end
      object ppLabel72: TppLabel
        UserName = 'Label702'
        Caption = 'Descrição do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4237
        mmLeft = 7935
        mmTop = 8202
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'DS_CAMPO_ARQUIVO'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 45508
        mmTop = 8202
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Tipo do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4237
        mmLeft = 7935
        mmTop = 14293
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        OnGetText = ppDBText19GetText
        AutoSize = True
        DataField = 'TP_ATRIBUTO'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35983
        mmTop = 14293
        mmWidth = 24606
        BandType = 4
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'Tamanho do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 14288
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'NR_TAM_CAMPO'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 14288
        mmWidth = 29633
        BandType = 4
      end
      object ppLabel75: TppLabel
        UserName = 'Label75'
        Caption = 'Casas Decimais: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 134409
        mmTop = 14288
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'NR_DECIMAL'
        DataPipeline = pplLayout
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 163777
        mmTop = 14288
        mmWidth = 22754
        BandType = 4
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'Ocorre em função do Campo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 26723
        mmWidth = 51065
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'NO_CAMPO_MASTER'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 26723
        mmWidth = 37042
        BandType = 4
      end
      object ppLabel77: TppLabel
        UserName = 'Label77'
        Caption = 'Emitido no relatório de Ocorrências: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 20373
        mmWidth = 62706
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        OnGetText = ppDBText23GetText
        AutoSize = True
        DataField = 'IR_RELATORIO_OCORRENCIA'
        DataPipeline = pplLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 70115
        mmTop = 20373
        mmWidth = 52123
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        OnPrint = LblSistemaPrint
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CD_ARQUIVO'
      DataPipeline = pplLayout
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 29369
        mmPrintPosition = 0
        object ppLabel63: TppLabel
          UserName = 'Label1'
          Caption = 'Nome do Layout: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3175
          mmTop = 2117
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'NO_ARQUIVO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 2117
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          OnGetText = ppDBText13GetText
          AutoSize = True
          DataField = 'TP_ARQUIVO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 9260
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          UserName = 'Label64'
          Caption = 'Tipo do Arquivo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 9260
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          Caption = 'Delimitador: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 77258
          mmTop = 9525
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          OnGetText = ppDBText14GetText
          AutoSize = True
          DataField = 'TP_DELIMITADOR_CAMPO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 98954
          mmTop = 9525
          mmWidth = 45773
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          OnGetText = ppDBText15GetText
          AutoSize = True
          DataField = 'TP_QUALIFICADOR_TEXTO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 166159
          mmTop = 9260
          mmWidth = 47096
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'Observações: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 15875
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo3: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = True
          DataField = 'DS_ARQUIVO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 5556
          mmLeft = 2910
          mmTop = 20638
          mmWidth = 184944
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          OnGetText = ppDBText24GetText
          AutoSize = True
          DataField = 'IR_PARA_IMPORTACAO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 119327
          mmTop = 2117
          mmWidth = 41540
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          OnGetText = ppDBText25GetText
          AutoSize = True
          DataField = 'IR_PARA_EXPORTACAO'
          DataPipeline = pplLayout
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 152929
          mmTop = 2117
          mmWidth = 42333
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'Line40'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 27252
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label67'
          Caption = 'Qualificador de Texto: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 127000
          mmTop = 9260
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplLayout: TppBDEPipeline
    DataSource = dsLayout
    UserName = 'lExemplo1'
    Left = 213
    Top = 34
    object pplLayoutppField1: TppField
      FieldAlias = 'NO_CAMPO_MASTER'
      FieldName = 'NO_CAMPO_MASTER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplLayoutppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CD_ARQUIVO'
      FieldName = 'CD_ARQUIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplLayoutppField3: TppField
      FieldAlias = 'NO_ARQUIVO'
      FieldName = 'NO_ARQUIVO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplLayoutppField4: TppField
      FieldAlias = 'DS_ARQUIVO'
      FieldName = 'DS_ARQUIVO'
      FieldLength = 2000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplLayoutppField5: TppField
      FieldAlias = 'TP_ARQUIVO'
      FieldName = 'TP_ARQUIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplLayoutppField6: TppField
      FieldAlias = 'TP_DELIMITADOR_CAMPO'
      FieldName = 'TP_DELIMITADOR_CAMPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplLayoutppField7: TppField
      FieldAlias = 'DS_OUTRO_DELIMITADOR'
      FieldName = 'DS_OUTRO_DELIMITADOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object pplLayoutppField8: TppField
      FieldAlias = 'TP_QUALIFICADOR_TEXTO'
      FieldName = 'TP_QUALIFICADOR_TEXTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object pplLayoutppField9: TppField
      FieldAlias = 'IR_PARA_IMPORTACAO'
      FieldName = 'IR_PARA_IMPORTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplLayoutppField10: TppField
      FieldAlias = 'IR_PARA_EXPORTACAO'
      FieldName = 'IR_PARA_EXPORTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplLayoutppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CD_ARQUIVO_1'
      FieldName = 'CD_ARQUIVO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplLayoutppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SQ_CAMPO'
      FieldName = 'SQ_CAMPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplLayoutppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_ORDEM'
      FieldName = 'NR_ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplLayoutppField14: TppField
      FieldAlias = 'NO_CAMPO_ARQUIVO'
      FieldName = 'NO_CAMPO_ARQUIVO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object pplLayoutppField15: TppField
      FieldAlias = 'DS_CAMPO_ARQUIVO'
      FieldName = 'DS_CAMPO_ARQUIVO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplLayoutppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_TAM_CAMPO'
      FieldName = 'NR_TAM_CAMPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplLayoutppField17: TppField
      FieldAlias = 'TP_ATRIBUTO'
      FieldName = 'TP_ATRIBUTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplLayoutppField18: TppField
      FieldAlias = 'DS_SIMBOLO_DECIMAL'
      FieldName = 'DS_SIMBOLO_DECIMAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object pplLayoutppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_DECIMAL'
      FieldName = 'NR_DECIMAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplLayoutppField20: TppField
      FieldAlias = 'DS_SIMBOLO_AGRUPADOR'
      FieldName = 'DS_SIMBOLO_AGRUPADOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplLayoutppField21: TppField
      FieldAlias = 'DS_MASCARA_DATA'
      FieldName = 'DS_MASCARA_DATA'
      FieldLength = 11
      DisplayWidth = 11
      Position = 20
    end
    object pplLayoutppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CD_ARQUIVO_MASTER'
      FieldName = 'CD_ARQUIVO_MASTER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplLayoutppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SQ_CAMPO_MASTER'
      FieldName = 'SQ_CAMPO_MASTER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplLayoutppField24: TppField
      FieldAlias = 'IR_RELATORIO_OCORRENCIA'
      FieldName = 'IR_RELATORIO_OCORRENCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
  end
  object qryLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FI_LAYOUT_MASTER.NO_CAMPO_ARQUIVO NO_CAMPO_MASTER,'
      '       FI_ARQUIVO.*, FI_LAYOUT_ARQUIVO.*'
      
        'FROM FI_ARQUIVO, FI_LAYOUT_ARQUIVO, FI_LAYOUT_ARQUIVO FI_LAYOUT_' +
        'MASTER'
      'WHERE FI_ARQUIVO.CD_ARQUIVO = FI_LAYOUT_ARQUIVO.CD_ARQUIVO'
      
        '  AND FI_LAYOUT_ARQUIVO.CD_ARQUIVO = FI_LAYOUT_MASTER.CD_ARQUIVO' +
        ' (+)'
      
        '  AND FI_LAYOUT_ARQUIVO.SQ_CAMPO_MASTER  = FI_LAYOUT_MASTER.SQ_C' +
        'AMPO (+)'
      '  AND FI_ARQUIVO.CD_ARQUIVO = :CD_ARQUIVO'
      'ORDER BY FI_LAYOUT_ARQUIVO.NR_ORDEM  ')
    ValidateWithMask = True
    Left = 157
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_ARQUIVO'
        ParamType = ptInput
      end>
    object qryLayoutNO_CAMPO_MASTER: TStringField
      FieldName = 'NO_CAMPO_MASTER'
      FixedChar = True
      Size = 60
    end
    object qryLayoutCD_ARQUIVO: TFloatField
      FieldName = 'CD_ARQUIVO'
    end
    object qryLayoutNO_ARQUIVO: TStringField
      FieldName = 'NO_ARQUIVO'
      FixedChar = True
      Size = 60
    end
    object qryLayoutDS_ARQUIVO: TMemoField
      FieldName = 'DS_ARQUIVO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryLayoutTP_ARQUIVO: TStringField
      FieldName = 'TP_ARQUIVO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutTP_DELIMITADOR_CAMPO: TStringField
      FieldName = 'TP_DELIMITADOR_CAMPO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutDS_OUTRO_DELIMITADOR: TStringField
      FieldName = 'DS_OUTRO_DELIMITADOR'
      FixedChar = True
      Size = 1
    end
    object qryLayoutTP_QUALIFICADOR_TEXTO: TStringField
      FieldName = 'TP_QUALIFICADOR_TEXTO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutIR_PARA_IMPORTACAO: TStringField
      FieldName = 'IR_PARA_IMPORTACAO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutIR_PARA_EXPORTACAO: TStringField
      FieldName = 'IR_PARA_EXPORTACAO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutCD_ARQUIVO_1: TFloatField
      FieldName = 'CD_ARQUIVO_1'
    end
    object qryLayoutSQ_CAMPO: TFloatField
      FieldName = 'SQ_CAMPO'
    end
    object qryLayoutNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
    end
    object qryLayoutNO_CAMPO_ARQUIVO: TStringField
      FieldName = 'NO_CAMPO_ARQUIVO'
      FixedChar = True
      Size = 60
    end
    object qryLayoutDS_CAMPO_ARQUIVO: TStringField
      FieldName = 'DS_CAMPO_ARQUIVO'
      FixedChar = True
      Size = 60
    end
    object qryLayoutNR_TAM_CAMPO: TFloatField
      FieldName = 'NR_TAM_CAMPO'
    end
    object qryLayoutTP_ATRIBUTO: TStringField
      FieldName = 'TP_ATRIBUTO'
      FixedChar = True
      Size = 1
    end
    object qryLayoutDS_SIMBOLO_DECIMAL: TStringField
      FieldName = 'DS_SIMBOLO_DECIMAL'
      FixedChar = True
      Size = 1
    end
    object qryLayoutNR_DECIMAL: TFloatField
      FieldName = 'NR_DECIMAL'
    end
    object qryLayoutDS_SIMBOLO_AGRUPADOR: TStringField
      FieldName = 'DS_SIMBOLO_AGRUPADOR'
      FixedChar = True
      Size = 1
    end
    object qryLayoutDS_MASCARA_DATA: TStringField
      FieldName = 'DS_MASCARA_DATA'
      FixedChar = True
      Size = 11
    end
    object qryLayoutCD_ARQUIVO_MASTER: TFloatField
      FieldName = 'CD_ARQUIVO_MASTER'
    end
    object qryLayoutSQ_CAMPO_MASTER: TFloatField
      FieldName = 'SQ_CAMPO_MASTER'
    end
    object qryLayoutIR_RELATORIO_OCORRENCIA: TStringField
      FieldName = 'IR_RELATORIO_OCORRENCIA'
      FixedChar = True
      Size = 1
    end
  end
  object dsLayout: TwwDataSource
    DataSet = qryLayout
    Left = 185
    Top = 34
  end
  object pplOcorrenciasIntegracaoContabil: TppBDEPipeline
    DataSource = dsOcorrenciasIntegracaoContabil
    UserName = 'lExemplo2'
    Left = 63
    Top = 274
    object pplOcorrenciasIntegracaoContabilppField1: TppField
      FieldAlias = 'DT_EFETIVACAO'
      FieldName = 'DT_EFETIVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField2: TppField
      FieldAlias = 'IR_CONTABILIZADO'
      FieldName = 'IR_CONTABILIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField3: TppField
      FieldAlias = 'IR_SIMULADO'
      FieldName = 'IR_SIMULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField4: TppField
      FieldAlias = 'DT_REFERENCIA'
      FieldName = 'DT_REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField5: TppField
      FieldAlias = 'CD_PLANO'
      FieldName = 'CD_PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField6: TppField
      FieldAlias = 'CD_GRUPO_CONTABIL'
      FieldName = 'CD_GRUPO_CONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField7: TppField
      FieldAlias = 'NO_VARIAVEL'
      FieldName = 'NO_VARIAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField8: TppField
      FieldAlias = 'CD_CONTA_CREDITO'
      FieldName = 'CD_CONTA_CREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField9: TppField
      FieldAlias = 'CD_CONTA_DEBITO'
      FieldName = 'CD_CONTA_DEBITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField10: TppField
      FieldAlias = 'VL_CALCULADO'
      FieldName = 'VL_CALCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField11: TppField
      FieldAlias = 'VL_SALDO_CONTA'
      FieldName = 'VL_SALDO_CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField12: TppField
      FieldAlias = 'VL_DIFERENCA'
      FieldName = 'VL_DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplOcorrenciasIntegracaoContabilppField13: TppField
      FieldAlias = 'DS_MENSAGEM'
      FieldName = 'DS_MENSAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object dsOcorrenciasIntegracaoContabil: TwwDataSource
    DataSet = ClntDtSttegracaoContabil
    Left = 35
    Top = 274
  end
  object ClntDtSttegracaoContabil: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DT_EFETIVACAO'
        DataType = ftDateTime
      end
      item
        Name = 'IR_CONTABILIZADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IR_SIMULADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DT_REFERENCIA'
        DataType = ftDateTime
      end
      item
        Name = 'CD_PLANO'
        DataType = ftInteger
      end
      item
        Name = 'CD_GRUPO_CONTABIL'
        DataType = ftInteger
      end
      item
        Name = 'NO_VARIAVEL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CD_CONTA_CREDITO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CD_CONTA_DEBITO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VL_CALCULADO'
        DataType = ftFloat
      end
      item
        Name = 'VL_SALDO_CONTA'
        DataType = ftFloat
      end
      item
        Name = 'VL_DIFERENCA'
        DataType = ftFloat
      end
      item
        Name = 'DS_MENSAGEM'
        DataType = ftString
        Size = 250
      end>
    IndexDefs = <
      item
        Name = 'IDX_PLANO'
        Fields = 'CD_PLANO;CD_GRUPO_CONTABIL;NO_VARIAVEL'
      end>
    Params = <>
    StoreDefs = True
    Left = 7
    Top = 274
    object ClntDtSttegracaoContabilDT_EFETIVACAO: TDateTimeField
      FieldName = 'DT_EFETIVACAO'
    end
    object ClntDtSttegracaoContabilIR_CONTABILIZADO: TStringField
      FieldName = 'IR_CONTABILIZADO'
    end
    object ClntDtSttegracaoContabilIR_SIMULADO: TStringField
      FieldName = 'IR_SIMULADO'
    end
    object ClntDtSttegracaoContabilDT_REFERENCIA: TDateTimeField
      FieldName = 'DT_REFERENCIA'
    end
    object ClntDtSttegracaoContabilCD_PLANO: TIntegerField
      FieldName = 'CD_PLANO'
    end
    object ClntDtSttegracaoContabilCD_GRUPO_CONTABIL: TIntegerField
      FieldName = 'CD_GRUPO_CONTABIL'
    end
    object ClntDtSttegracaoContabilNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
    end
    object ClntDtSttegracaoContabilCD_CONTA_CREDITO: TStringField
      FieldName = 'CD_CONTA_CREDITO'
    end
    object ClntDtSttegracaoContabilCD_CONTA_DEBITO: TStringField
      FieldName = 'CD_CONTA_DEBITO'
    end
    object ClntDtSttegracaoContabilVL_CALCULADO: TFloatField
      FieldName = 'VL_CALCULADO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object ClntDtSttegracaoContabilVL_SALDO_CONTA: TFloatField
      FieldName = 'VL_SALDO_CONTA'
      DisplayFormat = '#,###,###,##0.00'
    end
    object ClntDtSttegracaoContabilVL_DIFERENCA: TFloatField
      FieldName = 'VL_DIFERENCA'
      DisplayFormat = '#,###,###,##0.00'
    end
    object ClntDtSttegracaoContabilDS_MENSAGEM: TStringField
      FieldName = 'DS_MENSAGEM'
      Size = 250
    end
  end
  object rpOcorrenciasIntegracaoContabil: TppReport
    AutoStop = False
    DataPipeline = pplOcorrenciasIntegracaoContabil
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 91
    Top = 274
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel78: TppLabel
        UserName = 'ppLabel39'
        Caption = 'Atualizar Lançamentos Contábeis - Ocorrências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 97896
        mmTop = 8731
        mmWidth = 96044
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel79: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel40'
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
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'DT_REFERENCIA'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 259028
        mmTop = 19315
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label80'
        Caption = 'Referência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 239713
        mmTop = 19315
        mmWidth = 18521
        BandType = 0
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'C'
        BooleanTrue = 'E'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        DataField = 'IR_CONTABILIZADO'
        Transparent = True
        mmHeight = 6350
        mmLeft = 239184
        mmTop = 23548
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label801'
        Caption = 'Movimento Estornado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 244740
        mmTop = 24606
        mmWidth = 32544
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        OnGetText = ppDBText28GetText
        DataField = 'CD_GRUPO_CONTABIL'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 66675
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'NO_VARIAVEL'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68792
        mmTop = 1323
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'VL_CALCULADO'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84667
        mmTop = 1323
        mmWidth = 23400
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'VL_SALDO_CONTA'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109009
        mmTop = 1323
        mmWidth = 23400
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'VL_DIFERENCA'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 1323
        mmWidth = 23400
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText301'
        DataField = 'CD_CONTA_CREDITO'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1588
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CD_CONTA_DEBITO'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 1588
        mmWidth = 22490
        BandType = 4
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'DS_MENSAGEM'
        DataPipeline = pplOcorrenciasIntegracaoContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3969
        mmLeft = 207698
        mmTop = 1323
        mmWidth = 75936
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel96: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel52'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 256117
        BandType = 8
      end
      object ppLine43: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 3175
        mmWidth = 229130
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CD_PLANO'
      DataPipeline = pplOcorrenciasIntegracaoContabil
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'Label802'
          Caption = 'Plano: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          OnGetText = ppDBText27GetText
          AutoSize = True
          DataField = 'CD_PLANO'
          DataPipeline = pplOcorrenciasIntegracaoContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11906
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel84: TppLabel
          UserName = 'Label84'
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 7673
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label85'
          Caption = 'Subgrupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 68792
          mmTop = 7673
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'Label86'
          AutoSize = False
          Caption = 'Valor Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 84667
          mmTop = 7673
          mmWidth = 23400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel87: TppLabel
          UserName = 'Label87'
          AutoSize = False
          Caption = 'Saldo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 109009
          mmTop = 7673
          mmWidth = 23400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel88: TppLabel
          UserName = 'Label88'
          AutoSize = False
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 7673
          mmWidth = 23400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel89: TppLabel
          UserName = 'Label89'
          Caption = 'Conta Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 158750
          mmTop = 7673
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel90: TppLabel
          UserName = 'Label90'
          Caption = 'Conta Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 184150
          mmTop = 7673
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel91: TppLabel
          UserName = 'Label901'
          Caption = 'Mensagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 207698
          mmTop = 7673
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 11641
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
  object QryGrupoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_GRUPO_CONTABIL, DS_GRUPO_CONTABIL '
      'FROM FI_GRUPO_INTEGRACAO_CONTABIL'
      'WHERE CD_GRUPO_CONTABIL = :CD_GRUPO_CONTABIL')
    ValidateWithMask = True
    Left = 8
    Top = 301
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_GRUPO_CONTABIL'
        ParamType = ptUnknown
      end>
  end
  object QryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CD_PLANO, NO_PLANO '
      'FROM FI_PLANO'
      'WHERE CD_PLANO = :CD_PLANO')
    ValidateWithMask = True
    Left = 36
    Top = 301
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptInput
      end>
  end
  object QryCalcAtuarial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.DT_GERACAO,'
      '       B.CD_PESSOA_ENTID,'
      '       B.CD_PESSOA_PATROC,'
      '       B.CD_PLANO,'
      '       B.CD_PARTIC,'
      '       G.NO_GRUPO_PARTIC,'
      '       R.NOMEREGRA,'
      '       P.NO_PESSOA,'
      '       P.NR_MATRICULA,'
      '       P.CD_VERSAO,'
      '       B.NO_VARIAVEL,'
      '       B.VL_CALCULO_ATUARIAL'
      'FROM   FI_OCOR_CALCULO_ATUARIAL B,'
      '       FI_PARTICIPANTE P,'
      '       REGRA R,'
      '       FI_GRUPO_PARTICIPANTE G'
      'WHERE B.DT_GERACAO               = :DT_GERACAO AND'
      '               B.CD_PESSOA_ENTID     = :CD_PESSOA_ENTID AND'
      '               B.CD_PESSOA_PATROC = :CD_PESSOA_PATROC AND'
      '               B.CD_PLANO                    = :CD_PLANO AND'
      '               B.CD_PARTIC                   = :CD_PARTIC AND'
      '               B.CD_VERSAO                 = :CD_VERSAO AND'
      '               B.CD_PARTIC                   = P.CD_PARTIC AND'
      '               B.CD_VERSAO                 = P.CD_VERSAO AND'
      '               R.IDREGRA                      = B.CD_FORMULA AND'
      '               B.CD_GRUPO_PARTIC    = G.CD_GRUPO_PARTIC'
      'ORDER BY DT_GERACAO DESC, CD_PARTIC, NO_VARIAVEL'#9#9)
    ValidateWithMask = True
    Left = 336
    Top = 324
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PARTIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object QryCalcAtuarialDT_GERACAO: TDateTimeField
      FieldName = 'DT_GERACAO'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.DT_GERACAO'
    end
    object QryCalcAtuarialCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.CD_PESSOA_ENTID'
    end
    object QryCalcAtuarialCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.CD_PESSOA_PATROC'
    end
    object QryCalcAtuarialCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.CD_PLANO'
    end
    object QryCalcAtuarialCD_PARTIC: TFloatField
      FieldName = 'CD_PARTIC'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.CD_PARTIC'
    end
    object QryCalcAtuarialNO_GRUPO_PARTIC: TStringField
      FieldName = 'NO_GRUPO_PARTIC'
      Origin = 'BASEDADOS.FI_GRUPO_PARTICIPANTE.NO_GRUPO_PARTIC'
      FixedChar = True
      Size = 60
    end
    object QryCalcAtuarialNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS."CM.REGRA".NOMEREGRA'
      Size = 60
    end
    object QryCalcAtuarialNO_PESSOA: TStringField
      FieldName = 'NO_PESSOA'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.NO_PESSOA'
      FixedChar = True
      Size = 60
    end
    object QryCalcAtuarialNR_MATRICULA: TStringField
      FieldName = 'NR_MATRICULA'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.NR_MATRICULA'
      FixedChar = True
      Size = 15
    end
    object QryCalcAtuarialCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'BASEDADOS.FI_PARTICIPANTE.CD_VERSAO'
    end
    object QryCalcAtuarialNO_VARIAVEL: TStringField
      FieldName = 'NO_VARIAVEL'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.NO_VARIAVEL'
      FixedChar = True
    end
    object QryCalcAtuarialVL_CALCULO_ATUARIAL: TFloatField
      FieldName = 'VL_CALCULO_ATUARIAL'
      Origin = 'BASEDADOS.FI_OCOR_CALCULO_ATUARIAL.VL_CALCULO_ATUARIAL'
    end
  end
  object dsCalcAtuarial: TwwDataSource
    DataSet = QryCalcAtuarial
    Left = 364
    Top = 324
  end
  object pplCalcAtuarial: TppBDEPipeline
    DataSource = dsCalcAtuarial
    UserName = 'pplCalcAtuarial'
    Left = 392
    Top = 324
  end
  object rpCalcAtuarial: TppReport
    AutoStop = False
    DataPipeline = pplCalcAtuarial
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 420
    Top = 324
    Version = '5.5'
    mmColumnWidth = 0
    object ppTitleBand2: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel99: TppLabel
        UserName = 'Label99'
        Caption = 'Memória de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78581
        mmTop = 16140
        mmWidth = 40217
        BandType = 1
      end
      object ppLine48: TppLine
        UserName = 'Line48'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197300
        BandType = 1
      end
      object ppLabel100: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label100'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 8996
        mmWidth = 29633
        BandType = 1
      end
      object ppLabel101: TppLabel
        OnPrint = LblEntidadePrint
        UserName = 'Label101'
        AutoSize = False
        Caption = 'LblEntidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3175
        mmTop = 529
        mmWidth = 192352
        BandType = 1
      end
    end
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel92: TppLabel
        UserName = 'Label92'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 2646
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'Label93'
        Caption = 'Participante: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 2646
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'rpMemoriaCalculoLabel101'
        Caption = 'Grupo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 135202
        mmTop = 2646
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'Rotina de Cálculo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 9790
        mmWidth = 28840
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'NR_MATRICULA'
        DataPipeline = pplCalcAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 2646
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'NO_PESSOA'
        DataPipeline = pplCalcAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 64294
        mmTop = 2646
        mmWidth = 70115
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'NOMEREGRA'
        DataPipeline = pplCalcAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 9790
        mmWidth = 89959
        BandType = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'NO_GRUPO_PARTIC'
        DataPipeline = pplCalcAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 12700
        mmLeft = 146050
        mmTop = 2646
        mmWidth = 49477
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'Nome da Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 16669
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label98'
        Caption = 'Valor Calculado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 131234
        mmTop = 16669
        mmWidth = 23548
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 794
        mmTop = 19579
        mmWidth = 42069
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 71967
        mmTop = 19579
        mmWidth = 57944
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 156104
        mmTop = 19579
        mmWidth = 41010
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'NO_VARIAVEL'
        DataPipeline = pplCalcAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42863
        mmTop = 1852
        mmWidth = 60590
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'VL_CALCULO_ATUARIAL'
        DataPipeline = pplCalcAtuarial
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 115359
        mmTop = 1852
        mmWidth = 39423
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine49: TppLine
        UserName = 'Line49'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel102: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Cálculo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2381
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
        mmTop = 2381
        mmWidth = 197380
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
        mmLeft = 170657
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CD_PARTIC'
      DataPipeline = pplCalcAtuarial
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
