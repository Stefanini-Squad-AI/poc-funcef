inherited dtmRelatoriosCes: TdtmRelatoriosCes
  Left = 295
  Top = 211
  Width = 228
  Height = 209
  Caption = 'dtmRelatoriosCes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 19
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
    Left = 19
    Top = 30
  end
  inherited qryExemplo: TwwQuery
    Left = 19
    Top = 18
  end
  inherited rpExemplo: TppReport
    Left = 19
    Top = 5
  end
  object rpInconsistSal: TppReport
    AutoStop = False
    DataPipeline = ppInconsistSal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 155
    Top = 43
    Version = '5.5'
    mmColumnWidth = 197300
    object InconsistSalHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object InconsistSalLbl1: TppLabel
        UserName = 'InconsistSalLbl1'
        Caption = 'Listagem de Inconsistências Salariais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 64558
        mmTop = 9790
        mmWidth = 62971
        BandType = 0
      end
      object InconsistSalLbl2: TppLabel
        UserName = 'InconsistSalLbl2'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 6085
        mmWidth = 8467
        BandType = 0
      end
      object InconsistSalLbl3: TppLabel
        UserName = 'InconsistSalLbl3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 10319
        mmWidth = 13229
        BandType = 0
      end
      object InconsistSalLbl4: TppLabel
        UserName = 'InconsistSalLbl4'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 17727
        mmWidth = 14288
        BandType = 0
      end
      object InconsistSalLbl5: TppLabel
        UserName = 'InconsistSalLbl5'
        AutoSize = False
        Caption = 'Nome / Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 17727
        mmWidth = 24871
        BandType = 0
      end
      object InconsistSalLine1: TppLine
        UserName = 'InconsistSalLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180446
        BandType = 0
      end
      object InconsistSalDBTxt1: TppDBText
        UserName = 'InconsistSalDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 2381
        mmWidth = 17463
        BandType = 0
      end
      object InconsistSalLbl6: TppLabel
        UserName = 'InconsistSalLbl6'
        AutoSize = False
        Caption = 'Salário Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 17727
        mmWidth = 26194
        BandType = 0
      end
      object InconsistSalLbl7: TppLabel
        UserName = 'InconsistSalLbl7'
        AutoSize = False
        Caption = 'Valor Ref./ Observ.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 17727
        mmWidth = 29898
        BandType = 0
      end
      object InconsistSalCalc1: TppSystemVariable
        UserName = 'InconsistSalCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object InconsistSalCalc2: TppSystemVariable
        UserName = 'InconsistSalCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
    end
    object InconsistSalDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object InconsistSalDBTxt2: TppDBText
        UserName = 'InconsistSalDBTxt2'
        DataField = 'MATRICULA'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object InconsistSalDBTxt3: TppDBText
        UserName = 'InconsistSalDBTxt3'
        DataField = 'EMPREGADO'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 794
        mmWidth = 81492
        BandType = 4
      end
      object InconsistSalDBTxt4: TppDBText
        UserName = 'InconsistSalDBTxt4'
        DataField = 'CARGO'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26458
        mmTop = 5821
        mmWidth = 81492
        BandType = 4
      end
      object InconsistSalDBTxt5: TppDBText
        UserName = 'InconsistSalDBTxt5'
        DataField = 'SALARIOATUAL'
        DataPipeline = ppInconsistSal
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object InconsistSalDBTxt6: TppDBText
        UserName = 'InconsistSalDBTxt6'
        DataField = 'TIPOPAGAMENTO'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'OBSERV'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151342
        mmTop = 6350
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR_REF'
        DataPipeline = ppInconsistSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151342
        mmTop = 794
        mmWidth = 37571
        BandType = 4
      end
    end
    object InconsistSalFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object rpInconsistSalSmryBnd: TppSummaryBand
      AfterPrint = rpFaixaSalBeforePrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object rpInconsistSalGroup1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppInconsistSal
      UserName = 'rpInconsistSalGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object InconsistSalGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object InconsistSalGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpInconsistSalLabel1: TppLabel
          UserName = 'rpInconsistSalLabel1'
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 794
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object rpInconsistSalDBCalc1: TppDBCalc
          UserName = 'rpInconsistSalDBCalc1'
          DataField = 'MATRICULA'
          DataPipeline = ppInconsistSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpInconsistSalGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 32544
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpInconsistSalLabel2: TppLabel
          UserName = 'rpInconsistSalLabel2'
          AutoSize = False
          Caption = 'Abaixo do Mínimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 60325
          mmTop = 794
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpInconsistSalLabel3: TppLabel
          UserName = 'rpInconsistSalLabel3'
          AutoSize = False
          Caption = 'Acima do Máximo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 124354
          mmTop = 794
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'ABAIXO_MINIMO'
          DataPipeline = ppInconsistSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpInconsistSalGroup1
          Transparent = True
          mmHeight = 3704
          mmLeft = 85196
          mmTop = 794
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'ACIMA_MINIMO'
          DataPipeline = ppInconsistSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpInconsistSalGroup1
          Transparent = True
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 794
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppInconsistSal: TppBDEPipeline
    DataSource = dsInconsistSal
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'InconsistSal'
    Left = 155
    Top = 30
  end
  object dsInconsistSal: TwwDataSource
    DataSet = qryInconsistSal
    Left = 155
    Top = 17
  end
  object qryInconsistSal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      '  '#39'12345678901234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      '  '#39'123456789012345678901234567890'#39' AS TIPOPAGAMENTO,'
      '  0 AS SALARIOATUAL,'
      '  0 AS ABAIXO_MINIMO,'
      '  0 AS ACIMA_MINIMO,'
      '  0 AS VALOR_REF,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS OBSERV'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ValidateWithMask = True
    Left = 155
    Top = 5
  end
  object rpPesqSal: TppReport
    AutoStop = False
    DataPipeline = ppPesqSal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 14
    Top = 133
    Version = '5.5'
    mmColumnWidth = 197300
    object rpPesqSalHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object rpPesqSalLblTITULO: TppLabel
        UserName = 'rpPesqSalLblTITULO'
        Caption = 'Tabulação de Pesquisa por Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 9790
        mmWidth = 57415
        BandType = 0
      end
      object rpPesqSalLbl1: TppLabel
        UserName = 'rpPesqSalLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpPesqSalLbl2: TppLabel
        UserName = 'rpPesqSalLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object rpPesqSalLine1: TppLine
        UserName = 'rpPesqSalLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 6615
        mmTop = 21960
        mmWidth = 183886
        BandType = 0
      end
      object rpPesqSalDBTxt1: TppDBText
        UserName = 'rpPesqSalDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 2381
        mmWidth = 17463
        BandType = 0
      end
      object rpPesqSalDBTxt2: TppDBText
        UserName = 'rpPesqSalDBTxt2'
        DataField = 'NOMEPESQSALAR'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 17463
        mmWidth = 87842
        BandType = 0
      end
      object rpPesqSalDBTxt3: TppDBText
        UserName = 'rpPesqSalDBTxt3'
        DataField = 'DATAREFPESQ'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 17463
        mmWidth = 21960
        BandType = 0
      end
      object rpPesqSalCalc1: TppSystemVariable
        UserName = 'rpPesqSalCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object rpPesqSalCalc2: TppSystemVariable
        UserName = 'rpPesqSalCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
    end
    object rpPesqSalDtlBnd: TppDetailBand
      BeforePrint = rpPesqSalDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object rpPesqSalDBTxt6: TppDBText
        UserName = 'rpPesqSalDBTxt6'
        DataField = 'FREQ'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
      object rpPesqSalDBTxt5: TppDBText
        UserName = 'rpPesqSalDBTxt5'
        DataField = 'DESCRICAO'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 794
        mmWidth = 48948
        BandType = 4
      end
      object rpPesqSalLbl11: TppLabel
        UserName = 'rpPesqSalLbl11'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rpPesqSalLbl12: TppLabel
        UserName = 'rpPesqSalLbl12'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 12435
        BandType = 4
      end
      object rpPesqSalLblMENOR1: TppLabel
        UserName = 'rpPesqSalLblMENOR1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblPRIQUA1: TppLabel
        UserName = 'rpPesqSalLblPRIQUA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMODA1: TppLabel
        UserName = 'rpPesqSalLblMODA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIA1: TppLabel
        UserName = 'rpPesqSalLblMEDIA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIANA1: TppLabel
        UserName = 'rpPesqSalLblMEDIANA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblTERQUA1: TppLabel
        UserName = 'rpPesqSalLblTERQUA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMAIOR1: TppLabel
        UserName = 'rpPesqSalLblMAIOR1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMENOR2: TppLabel
        UserName = 'rpPesqSalLblMENOR2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblPRIQUA2: TppLabel
        UserName = 'rpPesqSalLblPRIQUA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMODA2: TppLabel
        UserName = 'rpPesqSalLblMODA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIA2: TppLabel
        UserName = 'rpPesqSalLblMEDIA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128588
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIANA2: TppLabel
        UserName = 'rpPesqSalLblMEDIANA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblTERQUA2: TppLabel
        UserName = 'rpPesqSalLblTERQUA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMAIOR2: TppLabel
        UserName = 'rpPesqSalLblMAIOR2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
    end
    object rpPesqSalFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object rpPesqSalSmryBnd: TppSummaryBand
      AfterPrint = rpFaixaSalBeforePrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object rpPesqSalGroup1: TppGroup
      BreakName = 'DATAREFPESQ'
      DataPipeline = ppPesqSal
      UserName = 'rpPesqSalGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPesqSalGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpPesqSalDBTxt4: TppDBText
          UserName = 'rpPesqSalDBTxt4'
          DataField = 'NOME'
          DataPipeline = ppPesqSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 529
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl3: TppLabel
          UserName = 'rpPesqSalLbl3'
          AutoSize = False
          Caption = 'Frequência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 529
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl10: TppLabel
          UserName = 'rpPesqSalLbl10'
          AutoSize = False
          Caption = 'Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl4: TppLabel
          UserName = 'rpPesqSalLbl4'
          AutoSize = False
          Caption = 'Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 80698
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl5: TppLabel
          UserName = 'rpPesqSalLbl5'
          AutoSize = False
          Caption = '1.Quartil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 96573
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl6: TppLabel
          UserName = 'rpPesqSalLbl6'
          AutoSize = False
          Caption = 'Moda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 112448
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl7: TppLabel
          UserName = 'rpPesqSalLbl7'
          AutoSize = False
          Caption = 'Média'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl8: TppLabel
          UserName = 'rpPesqSalLbl8'
          AutoSize = False
          Caption = 'Mediana'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl9: TppLabel
          UserName = 'rpPesqSalLbl9'
          AutoSize = False
          Caption = '3.Quartil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 160073
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLine2: TppLine
          UserName = 'rpPesqSalLine2'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 4498
          mmWidth = 183886
          BandType = 3
          GroupNo = 0
        end
      end
      object rpPesqSalGrpFootBnd: TppGroupFooterBand
        AfterPrint = rpPesqSalGrpFootBndAfterPrint
        BeforePrint = rpPesqSalGrpFootBndBeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpPesqSalLbl13: TppLabel
          UserName = 'rpPesqSalLbl13'
          Caption = 'Apuração Referente ao Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 1058
          mmWidth = 46831
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLine3: TppLine
          UserName = 'rpPesqSalLine3'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 0
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLbl14: TppLabel
          UserName = 'rpPesqSalLbl14'
          AutoSize = False
          Caption = 'Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 794
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLbl15: TppLabel
          UserName = 'rpPesqSalLbl15'
          AutoSize = False
          Caption = 'Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 67204
          mmTop = 5556
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLine4: TppLine
          UserName = 'rpPesqSalLine4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 9525
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMENOR1_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMENOR2_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIA1_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIA2_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMAIOR1_TOT: TppLabel
          UserName = 'rpPesqSalLblMAIOR1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 176213
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMAIOR2_TOT: TppLabel
          UserName = 'rpPesqSalLblMAIOR2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 176213
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalDBCalc1: TppDBCalc
          UserName = 'rpPesqSalDBCalc1'
          DataField = 'FREQ'
          DataPipeline = ppPesqSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpPesqSalGroup1
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 57150
          mmTop = 794
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppPesqSal: TppBDEPipeline
    DataSource = dsPesqSal
    SkipWhenNoRecords = False
    UserName = 'PesqSal'
    Left = 14
    Top = 120
  end
  object dsPesqSal: TwwDataSource
    DataSet = qryPesqSal
    Left = 14
    Top = 107
  end
  object qryPesqSal: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryPesqSalBeforeOpen
    AfterOpen = qryPesqSalAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  PJ.NOME, C.TITULO AS DESCRICAO, AJU.FATOR,'
      '  ('#39'Profissionais de TI'#39') AS NOMEPESQSALAR,'
      '  ('#39'10/10/2000'#39') AS DATAREFPESQ,'
      
        '  TEN.MENOR, TEN.MENOR_R, TEN.MAIOR, TEN.MAIOR_R, TEN.MEDIA, TEN' +
        '.MEDIA_R,'
      
        '  TEN.MODA, TEN.MODA_R, TEN.MEDIANA, TEN.MEDIANA_R, TEN.PRIMQUA,' +
        ' TEN.PRIMQUA_R,'
      '  TEN.TERCQUA, TEN.TERCQUA_R, TEN.FREQ'
      'FROM'
      '  PESSOA PJ, AJUSTPESQ AJU, CARGO C, TENDPESQSAL TEN'
      'WHERE'
      '  (TEN.IDPESQSALAR     = -1) AND'
      '  (TEN.IDEMPRESAPARTIC = PJ.IDPESSOA) AND'
      '  (TEN.IDCARGO         = C.IDCARGO) AND'
      '  (TEN.IDPESQSALAR     = AJU.IDPESQSALAR(+)) AND'
      '  (TEN.IDEMPRESAPARTIC = AJU.IDEMPRESAPARTIC(+)) '
      ' ')
    ValidateWithMask = True
    Left = 14
    Top = 95
  end
  object updSQL: TUpdateSQL
    Left = 80
    Top = 104
  end
  object dsgnRelatorios: TppDesigner
    Caption = 'Alteração do Layout de Etiquetas de Atualização de CTPS'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.SQLType = sqBDELocal
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 153
    Top = 117
  end
end
