inherited dtmRelatorios: TdtmRelatorios
  Left = 218
  Top = 233
  Width = 278
  Height = 129
  Caption = 'dtmRelatorios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 16
    Top = 42
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 16
    Top = 30
  end
  inherited qryExemplo: TwwQuery
    Left = 16
    Top = 17
  end
  inherited rpExemplo: TppReport
    Left = 16
    Top = 3
  end
  object rpProfis: TppReport
    AutoStop = False
    DataPipeline = ppProfis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 166
    Top = 38
    Version = '5.5'
    mmColumnWidth = 197300
    object ProfisHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ProfisLbl1: TppLabel
        UserName = 'ProfisLbl1'
        Caption = 'LISTAGEM DE PROFISSÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 10054
        mmWidth = 46831
        BandType = 0
      end
      object ProfisLbl2: TppLabel
        UserName = 'ProfisLbl2'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 6350
        mmWidth = 8467
        BandType = 0
      end
      object ProfisLbl3: TppLabel
        UserName = 'ProfisLbl3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 10583
        mmWidth = 13229
        BandType = 0
      end
      object ProfisLbl4: TppLabel
        UserName = 'ProfisLbl4'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object ProfisLbl5: TppLabel
        UserName = 'ProfisLbl5'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 17992
        mmWidth = 123825
        BandType = 0
      end
      object ProfisLine1: TppLine
        UserName = 'ProfisLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object ProfisDBTxt1: TppDBText
        UserName = 'ProfisDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppProfis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object ProfisCalc1: TppSystemVariable
        UserName = 'ProfisCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 6350
        mmWidth = 7938
        BandType = 0
      end
      object ProfisCalc2: TppSystemVariable
        UserName = 'ProfisCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 10583
        mmWidth = 22225
        BandType = 0
      end
    end
    object ProfisDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ProfisDBTxt2: TppDBText
        UserName = 'ProfisDBTxt2'
        DataField = 'DESCRICAO'
        DataPipeline = ppProfis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 794
        mmWidth = 123825
        BandType = 4
      end
      object ProfisDBTxt3: TppDBText
        UserName = 'ProfisDBTxt3'
        DataField = 'IDPROFISS'
        DataPipeline = ppProfis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object ProfisFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object ProfisSmryBnd1: TppSummaryBand
      AfterPrint = CargosSmryBnd1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ProfisGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProfis
      UserName = 'ProfisGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ProfisGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ProfisGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ProfisLbl6: TppLabel
          UserName = 'ProfisLbl6'
          Caption = 'Total de Profissões Listadas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 2117
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ProfisDBCalc1: TppDBCalc
          UserName = 'ProfisDBCalc1'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppProfis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ProfisGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 51065
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppProfis: TppBDEPipeline
    DataSource = dsProfis
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Profis'
    Left = 166
    Top = 26
  end
  object dsProfis: TwwDataSource
    DataSet = qryProfis
    Left = 166
    Top = 14
  end
  object qryProfis: TwwQuery
    AfterOpen = qryCCustoAfterOpen
    AfterScroll = qryCargosAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  IDPROFISS, DESCRICAO'
      'FROM'
      '  PROFISS')
    ValidateWithMask = True
    Left = 166
    Top = 2
  end
end
