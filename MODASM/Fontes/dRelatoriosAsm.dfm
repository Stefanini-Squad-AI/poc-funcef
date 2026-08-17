inherited dtmRelatoriosAsm: TdtmRelatoriosAsm
  Left = 325
  Top = 216
  Width = 288
  Height = 123
  Caption = 'dtmRelatoriosAsm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    SkipWhenNoRecords = False
    Left = 18
    Top = 43
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
    Left = 18
    Top = 30
  end
  inherited qryExemplo: TwwQuery
    Left = 18
  end
  inherited rpExemplo: TppReport
    PassSetting = psOnePass
    Units = utMillimeters
    Left = 18
    Top = 4
  end
  object rpTabCID: TppReport
    AutoStop = False
    DataPipeline = ppTabCID
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 79
    Top = 44
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTabCIDHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object rpTabCIDLbl1: TppLabel
        UserName = 'rpTabCIDLbl1'
        Caption = 'Listagem da Tabela de CID (Cod. Intl. de Doenças)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 53446
        mmTop = 9790
        mmWidth = 85196
        BandType = 0
      end
      object rpTabCIDLbl2: TppLabel
        UserName = 'rpTabCIDLbl2'
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
      object rpTabCIDLbl3: TppLabel
        UserName = 'rpTabCIDLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpTabCIDDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTabCID
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
      object rpTabCIDCalc1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
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
        mmWidth = 22225
        BandType = 0
      end
      object rpTabCIDCalc2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
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
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object rpTabCIDLine1: TppLine
        UserName = 'rpTabCIDLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180446
        BandType = 0
      end
      object rpTabCIDLbl4: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 17727
        mmWidth = 20638
        BandType = 0
      end
      object rpTabCIDLbl5: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 17727
        mmWidth = 156634
        BandType = 0
      end
    end
    object rpTabCIDDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpTabCIDDBTxt2: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'CODCID'
        DataPipeline = ppTabCID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object rpTabCIDDBTxt3: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'DESCRCID'
        DataPipeline = ppTabCID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 529
        mmWidth = 156634
        BandType = 4
      end
    end
    object rpTabCIDSmryBnd: TppSummaryBand
      AfterPrint = rpTabCIDSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object rpTabCIDGrp: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTabCID
      NewPage = True
      ResetPageNo = True
      UserName = 'rpTabCIDGrp'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTabCIDGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTabCIDGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpTabCIDLbl6: TppLabel
          UserName = 'rpTabCIDLbl6'
          AutoSize = False
          Caption = 'Total de CID'#39's Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 6615
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTabCIDDBCalc1: TppDBCalc
          UserName = 'rpTabCIDDBCalc1'
          DataField = 'CODCID'
          DataPipeline = ppTabCID
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpTabCIDGrp
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 6615
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTabCID: TppBDEPipeline
    DataSource = dsTabCID
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppTabCID'
    Left = 79
    Top = 31
  end
  object dsTabCID: TwwDataSource
    DataSet = qryTabCID
    Left = 79
    Top = 17
  end
  object qryTabCID: TwwQuery
    BeforeOpen = qryTabCIDBeforeOpen
    AfterOpen = qryTabCIDAfterOpen
    AfterScroll = qryTabCIDAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  CODCID, DESCRCID'
      'FROM'
      '  CID'
      'ORDER BY'
      '  DESCRCID')
    ValidateWithMask = True
    Left = 79
    Top = 4
  end
  object rpOcorrExames: TppReport
    AutoStop = False
    DataPipeline = ppOcorrExames
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 159
    Top = 44
    Version = '5.5'
    mmColumnWidth = 197300
    object rpOcorrExamesHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object rpOcorrExamesLbl1: TppLabel
        UserName = 'rpTabCIDLbl1'
        Caption = 'Listagem da Tabela de Ocorrências, Testes e Exames'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 50800
        mmTop = 9790
        mmWidth = 90488
        BandType = 0
      end
      object rpOcorrExamesLbl2: TppLabel
        UserName = 'rpTabCIDLbl2'
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
      object rpOcorrExamesLbl3: TppLabel
        UserName = 'rpTabCIDLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrExamesDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppOcorrExames
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
      object ppSystemVariable1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
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
        mmWidth = 22225
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
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
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'rpTabCIDLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180446
        BandType = 0
      end
      object rpOcorrExamesLbl4: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 17727
        mmWidth = 22225
        BandType = 0
      end
      object rpOcorrExamesLbl5: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 34925
        mmTop = 17727
        mmWidth = 124090
        BandType = 0
      end
      object rpOcorrExamesLbl6: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Avaliação Mínima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 17727
        mmWidth = 26194
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'CODTIPOOCMED'
        DataPipeline = ppOcorrExames
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'DESCRTIPOOCMED'
        DataPipeline = ppOcorrExames
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34925
        mmTop = 529
        mmWidth = 124090
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'AVALMIN'
        DataPipeline = ppOcorrExames
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      AfterPrint = rpTabCIDSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object rpOcorrExamesGroup: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppOcorrExames
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpOcorrExamesGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpOcorrExamesLbl7: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Tipos de Ocorrência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 6615
          mmWidth = 45244
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'CODTIPOOCMED'
          DataPipeline = ppOcorrExames
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpOcorrExamesGroup
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 55298
          mmTop = 6615
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppOcorrExames: TppBDEPipeline
    DataSource = dsOcorrExames
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppTabCID1'
    Left = 159
    Top = 31
  end
  object dsOcorrExames: TwwDataSource
    DataSet = qryOcorrExames
    Left = 159
    Top = 17
  end
  object qryOcorrExames: TwwQuery
    BeforeOpen = qryOcorrExamesBeforeOpen
    AfterOpen = qryTabCIDAfterOpen
    AfterScroll = qryTabCIDAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  CODTIPOOCMED, DESCRTIPOOCMED, AVALMIN'
      'FROM '
      '  TIPOCMED '
      'ORDER BY '
      '  UPPER(DESCRTIPOOCMED)')
    ValidateWithMask = True
    Left = 159
    Top = 4
  end
  object rpTabPer: TppReport
    AutoStop = False
    DataPipeline = ppTabPer
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 231
    Top = 44
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTabPerHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object rpTabPerLbl1: TppLabel
        UserName = 'rpTabCIDLbl1'
        Caption = 'Listagem da Tabela de Ocorrências, Testes e Exames'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 50800
        mmTop = 9790
        mmWidth = 90488
        BandType = 0
      end
      object rpTabPerLbl2: TppLabel
        UserName = 'rpTabCIDLbl2'
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
      object rpTabPerLbl3: TppLabel
        UserName = 'rpTabCIDLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTabPer
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
      object rpTabPerCalc1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
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
        mmWidth = 22225
        BandType = 0
      end
      object rpTabPerCalc2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
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
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object rpTabPerLine: TppLine
        UserName = 'rpTabCIDLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8731
        mmTop = 26988
        mmWidth = 180446
        BandType = 0
      end
      object rpTabPerLbl4: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 22490
        mmWidth = 45244
        BandType = 0
      end
      object rpTabPerLbl5: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Baseado Em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 21960
        mmWidth = 19844
        BandType = 0
      end
      object rpTabPerLbl6: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 17463
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl7: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = '(Anos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 22225
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl8: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 17463
        mmWidth = 14288
        BandType = 0
      end
      object rpTabPerLbl9: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = '(Meses)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 22225
        mmWidth = 14288
        BandType = 0
      end
      object rpTabPerLbl10: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Centro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 17463
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl11: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 22225
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl12: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Cargo (Em Branco, para todos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 22490
        mmWidth = 63236
        BandType = 0
      end
    end
    object rpTabPerDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpTabPerDBTxt2: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRTIPOOCMED'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 529
        mmWidth = 45244
        BandType = 4
      end
      object rpTabPerDBTxt3: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'LIMINFERIOR'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 529
        mmWidth = 6350
        BandType = 4
      end
      object rpTabPerDBTxt4: TppDBText
        UserName = 'DBText4'
        DataField = 'LIMSUPERIOR'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PERIODO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText2'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText3'
        DataField = 'CARGO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 529
        mmWidth = 63236
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BASEADOEM'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object rpTabPerSmryBnd: TppSummaryBand
      AfterPrint = rpTabCIDSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object rpTabPerGroup: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTabPer
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTabPerGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTabPerGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpTabPerLbl13: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Tipos de Exame (e suas variações):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 6615
          mmWidth = 66146
          BandType = 5
          GroupNo = 0
        end
        object rpTabPerDBCalc: TppDBCalc
          UserName = 'rpTabPerDBCalc'
          DataField = 'CODTIPOOCMED'
          DataPipeline = ppTabPer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpTabPerGroup
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 75936
          mmTop = 6615
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTabPer: TppBDEPipeline
    DataSource = dsTabPer
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'TabPer'
    Left = 231
    Top = 31
  end
  object dsTabPer: TwwDataSource
    DataSet = qryTabPer
    Left = 231
    Top = 17
  end
  object qryTabPer: TwwQuery
    BeforeOpen = qryTabPerBeforeOpen
    AfterOpen = qryTabCIDAfterOpen
    AfterScroll = qryTabCIDAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  ('#39'CM'#39') AS EMPRESA,'
      '  TM.CODTIPOOCMED, TM.DESCRTIPOOCMED, TM.AVALMIN,'
      '  PE.LIMINFERIOR, PE.LIMSUPERIOR, PE.PERIODO, PE.CODCENTROCUSTO,'
      '  C.TITULO AS CARGO,'
      '  DECODE(PE.INDTEMPO, 1, '#39'Idade'#39', '#39'Exposição'#39') AS BASEADOEM'
      'FROM'
      '  TIPOCMED TM, PEREXAME PE, CARGO C'
      'WHERE'
      '  (TM.CODTIPOOCMED = PE.CODTIPOOCMED) AND'
      '  (PE.IDCARGO = C.IDCARGO(+))'
      'ORDER BY'
      '  UPPER(DESCRTIPOOCMED)')
    ValidateWithMask = True
    Left = 231
    Top = 4
  end
end
