inherited RptPotencCandReq: TRptPotencCandReq
  Left = 226
  Top = 204
  Width = 290
  Height = 268
  Caption = 'RptPotencCandReq'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpPotencCandReq
  end
  object sqlPotencCandReq: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENTIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS IDENT,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS INSTRUTOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOCAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDSETOR,'
      '  '#39'1234567890'#39' AS DATAINI,'
      '  '#39'1234567890'#39' AS DATAFIM'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsPotencCandReq
    Left = 214
    Top = 192
  end
  object CdsPotencCandReq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 144
  end
  object dsPotencCandReq: TwwDataSource
    DataSet = CdsPotencCandReq
    Left = 214
    Top = 96
  end
  object ppPotencCandReq: TppBDEPipeline
    DataSource = dsPotencCandReq
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PotencCandReq'
    Left = 214
    Top = 48
  end
  object rpPotencCandReq: TppReport
    AutoStop = False
    DataPipeline = ppPotencCandReq
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 214
    Version = '5.5'
    mmColumnWidth = 197300
    object rpPotencCandReqHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object rpPotencCandReqLbl3: TppLabel
        UserName = 'rpPotencCandReqLbl3'
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
        mmLeft = 156369
        mmTop = 16140
        mmWidth = 9790
        BandType = 0
      end
      object rpPotencCandReqLbl4: TppLabel
        UserName = 'rpPotencCandReqLbl4'
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
        mmLeft = 151342
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object rpPotencCandReqCalc1: TppSystemVariable
        UserName = 'rpPotencCandReqCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 16140
        mmWidth = 23548
        BandType = 0
      end
      object rpPotencCandReqCalc2: TppSystemVariable
        UserName = 'rpPotencCandReqCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 20373
        mmWidth = 23548
        BandType = 0
      end
      object rpPotencCandReqLbl7: TppLabel
        UserName = 'rpPotencCandReqLbl7'
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 25665
        mmWidth = 65088
        BandType = 0
      end
      object rpPotencCandReqLbl6: TppLabel
        UserName = 'rpPotencCandReqLbl6'
        AutoSize = False
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 25665
        mmWidth = 37042
        BandType = 0
      end
      object rpPotencCandReqLbl5: TppLabel
        UserName = 'rpPotencCandReqLbl5'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 25665
        mmWidth = 62971
        BandType = 0
      end
      object rpPotencCandReqLbl1: TppLabel
        UserName = 'rpPotencCandReqLbl1'
        AutoSize = False
        Caption = 'Listagem das Pessoas Selecionadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 15
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 34131
        mmTop = 8202
        mmWidth = 129117
        BandType = 0
      end
      object rpPotencCandReqLbl8: TppLabel
        UserName = 'rpPotencCandReqLbl8'
        AutoSize = False
        Caption = 'Data Nasc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 25665
        mmWidth = 15081
        BandType = 0
      end
      object rpPotencCandReqLine1: TppLine
        UserName = 'rpPotencCandReqLine1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7144
        mmTop = 28575
        mmWidth = 183357
        BandType = 0
      end
      object rpPotencCandReqDBTxt1: TppDBText
        UserName = 'rpPotencCandReqDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppPotencCandReq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 15
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 34131
        mmTop = 1058
        mmWidth = 129117
        BandType = 0
      end
    end
    object rpPotencCandReqDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpPotencCandReqDBTxt2: TppDBText
        UserName = 'rpPotencCandReqDBTxt2'
        DataField = 'NOME'
        DataPipeline = ppPotencCandReq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 7144
        mmTop = 794
        mmWidth = 62971
        BandType = 4
      end
      object rpPotencCandReqDBTxt3: TppDBText
        UserName = 'rpPotencCandReqDBTxt3'
        DataField = 'SITUACAO'
        DataPipeline = ppPotencCandReq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 71173
        mmTop = 794
        mmWidth = 37042
        BandType = 4
      end
      object rpPotencCandReqDBTxt4: TppDBText
        UserName = 'rpPotencCandReqDBTxt4'
        DataField = 'CARGO'
        DataPipeline = ppPotencCandReq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 109273
        mmTop = 794
        mmWidth = 65088
        BandType = 4
      end
      object rpPotencCandReqDBTxt5: TppDBText
        UserName = 'rpPotencCandReqDBTxt5'
        DataField = 'DATANASC'
        DataPipeline = ppPotencCandReq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
    end
    object rpPotencCandReqSmryBnd: TppSummaryBand
      AfterPrint = rpPotencCandReqSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object rpPotencCandReqGrpEMPRESA: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppPotencCandReq
      NewPage = True
      ResetPageNo = True
      UserName = 'rpPotencCandReqGrpEMPRESA'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPotencCandReqGrpHdrBnd: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpPotencCandReqGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpPotencCandReqLine2: TppLine
          UserName = 'rpPotencCandReqLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 7144
          mmTop = 0
          mmWidth = 183357
          BandType = 5
          GroupNo = 0
        end
        object rpPotencCandReqLbl9: TppLabel
          UserName = 'rpPotencCandReqLbl9'
          AutoSize = False
          Caption = 'Total de Pessoas Selecionadas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 2117
          mmWidth = 50536
          BandType = 5
          GroupNo = 0
        end
        object rpPotencCandReqDBCalc1: TppDBCalc
          UserName = 'rpPotencCandReqDBCalc1'
          DataField = 'NOME'
          DataPipeline = ppPotencCandReq
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpPotencCandReqGrpEMPRESA
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 156898
          mmTop = 2117
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
