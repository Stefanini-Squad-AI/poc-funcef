inherited dtmRelatoriosComumJurid: TdtmRelatoriosComumJurid
  Left = 375
  Top = 170
  Width = 338
  Height = 226
  Caption = 'dtmRelatoriosComumJurid'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 17
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
    Left = 17
    Top = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 17
    Top = 15
  end
  inherited rpExemplo: TppReport
    Left = 17
    Top = 2
  end
  object rpVara: TppReport
    AutoStop = False
    DataPipeline = ppVara
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 77
    Top = 38
    Version = '5.5'
    mmColumnWidth = 197300
    object rpVaraHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpVaraLbl1: TppLabel
        UserName = 'rpVaraLbl1'
        Caption = 'Listagem das Varas de Justiça'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 72761
        mmTop = 10054
        mmWidth = 51594
        BandType = 0
      end
      object rpVaraLbl2: TppLabel
        UserName = 'rpVaraLbl2'
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
        mmLeft = 143669
        mmTop = 6350
        mmWidth = 9260
        BandType = 0
      end
      object rpVaraLbl3: TppLabel
        UserName = 'rpVaraLbl3'
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
        mmLeft = 138642
        mmTop = 10583
        mmWidth = 14288
        BandType = 0
      end
      object rpVaraLbl4: TppLabel
        UserName = 'rpVaraLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 18256
        mmWidth = 22490
        BandType = 0
      end
      object rpVaraLbl5: TppLabel
        UserName = 'rpVaraLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 18256
        mmWidth = 126207
        BandType = 0
      end
      object rpVaraLine1: TppLine
        UserName = 'rpVaraLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpVaraDBTxt1: TppDBText
        UserName = 'rpVaraDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppVara
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
      object rpVaraSysVar1: TppSystemVariable
        UserName = 'rpVaraSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpVaraSysVar2: TppSystemVariable
        UserName = 'rpVaraSysVar2'
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
        mmLeft = 153723
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpVaraDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpVaraDBTxt3: TppDBText
        UserName = 'rpVaraDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 794
        mmWidth = 126207
        BandType = 4
      end
      object rpVaraDBTxt2: TppDBText
        UserName = 'rpVaraDBTxt2'
        DataField = 'IDVARAJUSTICA'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpVaraFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpVaraSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpVaraGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppVara
      UserName = 'rpVaraGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpVaraGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpVaraGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpVaraLbl6: TppLabel
          UserName = 'rpVaraLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpVaraDBCalc1: TppDBCalc
          UserName = 'rpVaraDBCalc1'
          DataField = 'IDVARAJUSTICA'
          DataPipeline = ppVara
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpVaraGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppVara: TppBDEPipeline
    DataSource = dsVara
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Vara'
    Left = 77
    Top = 26
    object ppVarappField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppVarappField2: TppField
      FieldAlias = 'IDVARAJUSTICA'
      FieldName = 'IDVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppVarappField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsVara: TwwDataSource
    DataSet = qryVara
    Left = 77
    Top = 14
  end
  object qryVara: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS IDVARAJUSTICA, '#39'1'#39' AS DESCRICAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 77
    Top = 2
  end
  object rpTipProc: TppReport
    AutoStop = False
    DataPipeline = ppTipProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 138
    Top = 38
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipProcHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipProcLbl1: TppLabel
        UserName = 'rpTipProcLbl1'
        Caption = 'Listagem dos Tipos de Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 10054
        mmWidth = 55827
        BandType = 0
      end
      object rpTipProcLbl2: TppLabel
        UserName = 'rpTipProcLbl2'
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
        mmLeft = 143669
        mmTop = 6615
        mmWidth = 9260
        BandType = 0
      end
      object rpTipProcLbl3: TppLabel
        UserName = 'rpTipProcLbl3'
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
        mmLeft = 138642
        mmTop = 10848
        mmWidth = 14288
        BandType = 0
      end
      object rpTipProcLbl4: TppLabel
        UserName = 'rpTipProcLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipProcLbl5: TppLabel
        UserName = 'rpTipProcLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 17992
        mmWidth = 126207
        BandType = 0
      end
      object rpTipProcLine1: TppLine
        UserName = 'rpTipProcLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpTipProcDBTxt1: TppDBText
        UserName = 'rpTipProcDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipProc
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
      object rpTipProcSysVar1: TppSystemVariable
        UserName = 'rpTipProcSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 6615
        mmWidth = 23283
        BandType = 0
      end
      object rpTipProcSysVar2: TppSystemVariable
        UserName = 'rpTipProcSysVar2'
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
        mmLeft = 153723
        mmTop = 10848
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpTipProcDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipProcDBTxt3: TppDBText
        UserName = 'rpTipProcDBTxt3'
        DataField = 'NOMETIPOPROC'
        DataPipeline = ppTipProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 529
        mmWidth = 126207
        BandType = 4
      end
      object rpTipProcDBTxt2: TppDBText
        UserName = 'rpTipProcDBTxt2'
        DataField = 'IDTIPOPROC'
        DataPipeline = ppTipProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpTipProcFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipProcSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipProcGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipProc
      UserName = 'rpTipProcGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipProcGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipProcGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipProcLbl6: TppLabel
          UserName = 'rpTipProcLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24342
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipProcDBCalc1: TppDBCalc
          UserName = 'rpTipProcDBCalc1'
          DataField = 'IDTIPOPROC'
          DataPipeline = ppTipProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipProcGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipProc: TppBDEPipeline
    DataSource = dsTipProc
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo1'
    Left = 138
    Top = 26
    object ppTipProcppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipProcppField2: TppField
      FieldAlias = 'IDTIPOPROC'
      FieldName = 'IDTIPOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipProcppField3: TppField
      FieldAlias = 'NOMETIPOPROC'
      FieldName = 'NOMETIPOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsTipProc: TwwDataSource
    DataSet = qryTipProc
    Left = 138
    Top = 14
  end
  object qryTipProc: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS IDTIPOPROC, '#39'1'#39' AS NOMETIPOPROC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2) ')
    ValidateWithMask = True
    Left = 138
    Top = 2
  end
  object rpTipAcao: TppReport
    AutoStop = False
    DataPipeline = ppTipAcao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 207
    Top = 38
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipAcaoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipAcaoLbl1: TppLabel
        UserName = 'rpTipAcaoLbl1'
        Caption = 'Listagem dos Tipos de Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74348
        mmTop = 10054
        mmWidth = 48419
        BandType = 0
      end
      object rpTipAcaoLbl2: TppLabel
        UserName = 'rpTipAcaoLbl2'
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
        mmLeft = 143669
        mmTop = 6350
        mmWidth = 9260
        BandType = 0
      end
      object rpTipAcaoLbl3: TppLabel
        UserName = 'rpTipAcaoLbl3'
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
        mmLeft = 138642
        mmTop = 10583
        mmWidth = 14288
        BandType = 0
      end
      object rpTipAcaoLbl4: TppLabel
        UserName = 'rpTipAcaoLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipAcaoLbl5: TppLabel
        UserName = 'rpTipAcaoLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 17992
        mmWidth = 126207
        BandType = 0
      end
      object rpTipAcaoLine1: TppLine
        UserName = 'rpTipAcaoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpTipAcaoDBTxt1: TppDBText
        UserName = 'rpTipAcaoDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipAcao
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
      object rpTipAcaoSysVar1: TppSystemVariable
        UserName = 'rpTipAcaoSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpTipAcaoSysVar2: TppSystemVariable
        UserName = 'rpTipAcaoSysVar2'
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
        mmLeft = 153723
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpTipAcaoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipAcaoDBTxt3: TppDBText
        UserName = 'rpTipAcaoDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipAcao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 794
        mmWidth = 126207
        BandType = 4
      end
      object rpTipAcaoDBTxt2: TppDBText
        UserName = 'rpTipAcaoDBTxt2'
        DataField = 'IDTIPOACAO'
        DataPipeline = ppTipAcao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpTipAcaoFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipAcaoSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipAcaoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipAcao
      UserName = 'rpTipAcaoGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipAcaoGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipAcaoGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipAcaoLbl6: TppLabel
          UserName = 'rpTipAcaoLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipAcaoDBCalc1: TppDBCalc
          UserName = 'rpTipAcaoDBCalc1'
          DataField = 'IDTIPOACAO'
          DataPipeline = ppTipAcao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipAcaoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipAcao: TppBDEPipeline
    DataSource = dsTipAcao
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo2'
    Left = 207
    Top = 26
    object ppTipAcaoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipAcaoppField2: TppField
      FieldAlias = 'IDTIPOACAO'
      FieldName = 'IDTIPOACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipAcaoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsTipAcao: TwwDataSource
    DataSet = qryTipAcao
    Left = 207
    Top = 14
  end
  object qryTipAcao: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS IDTIPOACAO, '#39'1'#39' AS DESCRICAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 207
    Top = 2
  end
  object rpMotivoJur: TppReport
    AutoStop = False
    DataPipeline = ppMotivoJur
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 280
    Top = 38
    Version = '5.5'
    mmColumnWidth = 197300
    object rpMotivoJurHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpMotivoJurLbl1: TppLabel
        UserName = 'rpMotivoJurLbl1'
        Caption = 'Listagem dos Motivos de Exclusão de Pessoas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 10054
        mmWidth = 79640
        BandType = 0
      end
      object rpMotivoJurLbl2: TppLabel
        UserName = 'rpMotivoJurLbl2'
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
        mmLeft = 155311
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object rpMotivoJurLbl3: TppLabel
        UserName = 'rpMotivoJurLbl3'
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
        mmLeft = 150548
        mmTop = 10583
        mmWidth = 14288
        BandType = 0
      end
      object rpMotivoJurLbl4: TppLabel
        UserName = 'rpMotivoJurLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpMotivoJurLbl5: TppLabel
        UserName = 'rpMotivoJurLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 17992
        mmWidth = 93398
        BandType = 0
      end
      object rpMotivoJurLine1: TppLine
        UserName = 'rpMotivoJurLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object rpMotivoJurDBTxt1: TppDBText
        UserName = 'rpMotivoJurDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppMotivoJur
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
      object rpMotivoJurLbl6: TppLabel
        UserName = 'rpMotivoJurLbl6'
        AutoSize = False
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 17992
        mmWidth = 61119
        BandType = 0
      end
      object rpMotivoJurSysVar1: TppSystemVariable
        UserName = 'rpMotivoJurSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 6350
        mmWidth = 23548
        BandType = 0
      end
      object rpMotivoJurSysVar2: TppSystemVariable
        UserName = 'rpMotivoJurSysVar2'
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
        mmLeft = 165629
        mmTop = 10583
        mmWidth = 23548
        BandType = 0
      end
    end
    object rpMotivoJurDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object rpMotivoJurDBTxt3: TppDBText
        UserName = 'rpMotivoJurDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 1588
        mmWidth = 93398
        BandType = 4
      end
      object rpMotivoJurDBTxt2: TppDBText
        UserName = 'rpMotivoJurDBTxt2'
        DataField = 'IDMOTIVO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 1588
        mmWidth = 22490
        BandType = 4
      end
      object rpMotivoJurDBMemo1: TppDBMemo
        UserName = 'rpMotivoJurDBMemo1'
        KeepTogether = True
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 20373
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 60590
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpMotivoJurFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpMotivoJurSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpMotivoJurGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppMotivoJur
      UserName = 'rpMotivoJurGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMotivoJurGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpMotivoJurGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpMotivoJurLbl7: TppLabel
          UserName = 'rpMotivoJurLbl7'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpMotivoJurDBCalc1: TppDBCalc
          UserName = 'rpMotivoJurDBCalc1'
          DataField = 'IDMOTIVO'
          DataPipeline = ppMotivoJur
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpMotivoJurGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 46567
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppMotivoJur: TppBDEPipeline
    DataSource = dsMotivoJur
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo3'
    Left = 280
    Top = 26
    object ppMotivoJurppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField2: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField4: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsMotivoJur: TwwDataSource
    DataSet = qryMotivoJur
    Left = 280
    Top = 14
  end
  object qryMotivoJur: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS IDMOTIVO, '#39'1'#39' AS DESCRICAO, '#39'1'#39' AS OBSERVACAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 280
    Top = 2
  end
  object rpGrpObjeto: TppReport
    AutoStop = False
    DataPipeline = ppGrpObjeto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 21
    Top = 150
    Version = '5.5'
    mmColumnWidth = 197300
    object rpGrpObjetoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpGrpObjetoLbl1: TppLabel
        UserName = 'rpGrpObjetoLbl1'
        AutoSize = False
        Caption = 'Listagem dos Grupos de Objetos Reclamados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 69586
        mmTop = 7938
        mmWidth = 57944
        BandType = 0
      end
      object rpGrpObjetoLbl2: TppLabel
        UserName = 'rpGrpObjetoLbl2'
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
        mmLeft = 142346
        mmTop = 6350
        mmWidth = 9260
        BandType = 0
      end
      object rpGrpObjetoLbl3: TppLabel
        UserName = 'rpGrpObjetoLbl3'
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
        mmLeft = 137319
        mmTop = 10583
        mmWidth = 14228
        BandType = 0
      end
      object rpGrpObjetoLbl4: TppLabel
        UserName = 'rpGrpObjetoLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpGrpObjetoLbl5: TppLabel
        UserName = 'rpGrpObjetoLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 17992
        mmWidth = 126207
        BandType = 0
      end
      object rpGrpObjetoLine1: TppLine
        UserName = 'rpGrpObjetoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpGrpObjetoDBTxt1: TppDBText
        UserName = 'rpGrpObjetoDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppGrpObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object rpGrpObjetoSysVar1: TppSystemVariable
        UserName = 'rpGrpObjetoSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpGrpObjetoSysVar2: TppSystemVariable
        UserName = 'rpGrpObjetoSysVar2'
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
        mmLeft = 152400
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpGrpObjetoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpGrpObjetoDBTxt3: TppDBText
        UserName = 'rpGrpObjetoDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppGrpObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 794
        mmWidth = 126207
        BandType = 4
      end
      object rpGrpObjetoDBTxt2: TppDBText
        UserName = 'rpGrpObjetoDBTxt2'
        DataField = 'IDGRUPOOBJETO'
        DataPipeline = ppGrpObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpGrpObjetoFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpGrpObjetoSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppGrpObjeto
      UserName = 'MotivoGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGrpObjetoGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpGrpObjetoGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpGrpObjetoLbl6: TppLabel
          UserName = 'rpGrpObjetoLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpGrpObjetoDBCalc1: TppDBCalc
          UserName = 'rpGrpObjetoDBCalc1'
          DataField = 'IDGRUPOOBJETO'
          DataPipeline = ppGrpObjeto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppGrpObjeto: TppBDEPipeline
    DataSource = dsGrpObjeto
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo4'
    Left = 21
    Top = 138
    object ppGrpObjetoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGrpObjetoppField2: TppField
      FieldAlias = 'IDGRUPOOBJETO'
      FieldName = 'IDGRUPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGrpObjetoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsGrpObjeto: TwwDataSource
    DataSet = qryGrpObjeto
    Left = 21
    Top = 126
  end
  object qryGrpObjeto: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS IDGRUPOOBJETO, '#39'1'#39' AS DESCRICAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 21
    Top = 114
  end
  object rpTipObjeto: TppReport
    AutoStop = False
    DataPipeline = ppTipObjeto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 99
    Top = 150
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipObjetoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipObjetoLbl1: TppLabel
        UserName = 'rpTipObjetoLbl1'
        Caption = 'Listagem dos Tipos de Objetos Reclamados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 104775
        mmTop = 9790
        mmWidth = 74877
        BandType = 0
      end
      object rpTipObjetoLbl2: TppLabel
        UserName = 'rpTipObjetoLbl2'
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
        mmLeft = 219340
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object rpTipObjetoLbl3: TppLabel
        UserName = 'rpTipObjetoLbl3'
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
        mmLeft = 213784
        mmTop = 10583
        mmWidth = 15081
        BandType = 0
      end
      object rpTipObjetoLbl4: TppLabel
        UserName = 'rpTipObjetoLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipObjetoLbl5: TppLabel
        UserName = 'rpTipObjetoLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 17992
        mmWidth = 115094
        BandType = 0
      end
      object rpTipObjetoLine1: TppLine
        UserName = 'rpTipObjetoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 13494
        mmTop = 22490
        mmWidth = 257440
        BandType = 0
      end
      object rpTipObjetoDBTxt1: TppDBText
        UserName = 'rpTipObjetoDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 132292
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object rpTipObjetoLbl6: TppLabel
        UserName = 'rpTipObjetoLbl6'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 17992
        mmWidth = 44715
        BandType = 0
      end
      object rpTipObjetoSysVar1: TppSystemVariable
        UserName = 'rpTipObjetoSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpTipObjetoSysVar2: TppSystemVariable
        UserName = 'rpTipObjetoSysVar2'
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
        mmLeft = 229659
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
      object rpTipObjetoLbl7: TppLabel
        UserName = 'rpTipObjetoLbl7'
        AutoSize = False
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 17992
        mmWidth = 70644
        BandType = 0
      end
    end
    object rpTipObjetoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipObjetoDBTxt3: TppDBText
        UserName = 'rpTipObjetoDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 794
        mmWidth = 115094
        BandType = 4
      end
      object rpTipObjetoDBTxt2: TppDBText
        UserName = 'rpTipObjetoDBTxt2'
        DataField = 'CODTIPOOBJETO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object rpTipObjetoDBTxt4: TppDBText
        UserName = 'rpTipObjetoDBTxt4'
        DataField = 'GRUPOOBJETO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153988
        mmTop = 794
        mmWidth = 44715
        BandType = 4
      end
      object rpTipObjetoDBTxt5: TppDBText
        UserName = 'rpTipObjetoDBTxt5'
        DataField = 'PROVENTO'
        DataPipeline = ppTipObjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 794
        mmWidth = 70644
        BandType = 4
      end
    end
    object rpTipObjetoFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipObjetoSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipObjetoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipObjeto
      UserName = 'rpTipObjetoGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipObjetoGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipObjetoGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipObjetoLbl8: TppLabel
          UserName = 'rpTipObjetoLbl8'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 13494
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipObjetoDBCalc1: TppDBCalc
          UserName = 'rpTipObjetoDBCalc1'
          DataField = 'CODTIPOOBJETO'
          DataPipeline = ppTipObjeto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipObjetoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 51329
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipObjeto: TppBDEPipeline
    DataSource = dsTipObjeto
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo5'
    Left = 99
    Top = 138
    object ppTipObjetoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField2: TppField
      FieldAlias = 'CODTIPOOBJETO'
      FieldName = 'CODTIPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField4: TppField
      FieldAlias = 'GRUPOOBJETO'
      FieldName = 'GRUPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppTipObjetoppField5: TppField
      FieldAlias = 'PROVENTO'
      FieldName = 'PROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsTipObjeto: TwwDataSource
    DataSet = qryTipObjeto
    Left = 99
    Top = 126
  end
  object qryTipObjeto: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS CODTIPOOBJETO, '#39'1'#39' AS DESCRICAO,'
      '  '#39'1'#39' AS GRUPOOBJETO, '#39'1'#39' AS PROVENTO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 99
    Top = 114
  end
  object rpTipSent: TppReport
    AutoStop = False
    DataPipeline = ppTipSent
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 173
    Top = 150
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipSentHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipSentLbl1: TppLabel
        UserName = 'rpTipSentLbl1'
        Caption = 'Listagem dos Tipos de Sentença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 10054
        mmWidth = 55563
        BandType = 0
      end
      object rpTipSentLbl2: TppLabel
        UserName = 'rpTipSentLbl2'
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
        mmLeft = 143669
        mmTop = 6085
        mmWidth = 9260
        BandType = 0
      end
      object rpTipSentLbl3: TppLabel
        UserName = 'rpTipSentLbl3'
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
        mmLeft = 138642
        mmTop = 10583
        mmWidth = 14228
        BandType = 0
      end
      object rpTipSentLbl4: TppLabel
        UserName = 'rpTipSentLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipSentLbl5: TppLabel
        UserName = 'rpTipSentLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 17992
        mmWidth = 126207
        BandType = 0
      end
      object rpTipSentLine1: TppLine
        UserName = 'rpTipSentLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpTipSentDBTxt1: TppDBText
        UserName = 'rpTipSentDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object rpTipSentSysVar1: TppSystemVariable
        UserName = 'rpTipSentSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpTipSentSysVar2: TppSystemVariable
        UserName = 'rpTipSentSysVar2'
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
        mmLeft = 153723
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpTipSentDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipSentDBTxt3: TppDBText
        UserName = 'rpTipSentDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 529
        mmWidth = 126207
        BandType = 4
      end
      object rpTipSentDBTxt2: TppDBText
        UserName = 'rpTipSentDBTxt2'
        DataField = 'CODTIPOSENT'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpTipSentFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipSentSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipSentGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipSent
      UserName = 'rpTipSentGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipSentGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipSentGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipSentLbl6: TppLabel
          UserName = 'rpTipSentLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipSentDBCalc1: TppDBCalc
          UserName = 'rpTipSentDBCalc1'
          DataField = 'CODTIPOSENT'
          DataPipeline = ppTipSent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipSentGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipSent: TppBDEPipeline
    DataSource = dsTipSent
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo6'
    Left = 173
    Top = 138
    object ppTipSentppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipSentppField2: TppField
      FieldAlias = 'CODTIPOSENT'
      FieldName = 'CODTIPOSENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipSentppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsTipSent: TwwDataSource
    DataSet = qryTipSent
    Left = 173
    Top = 126
  end
  object qryTipSent: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS CODTIPOSENT, '#39'1'#39' AS DESCRICAO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 173
    Top = 114
  end
  object rpTipRec: TppReport
    AutoStop = False
    DataPipeline = ppTipRec
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 242
    Top = 150
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipRecHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipRecLbl1: TppLabel
        UserName = 'rpTipRecLbl1'
        Caption = 'Listagem dos Tipos de Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 73819
        mmTop = 10054
        mmWidth = 49477
        BandType = 0
      end
      object rpTipRecLbl2: TppLabel
        UserName = 'rpTipRecLbl2'
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
        mmLeft = 151607
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object rpTipRecLbl3: TppLabel
        UserName = 'rpTipRecLbl3'
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
        mmLeft = 146315
        mmTop = 10583
        mmWidth = 14817
        BandType = 0
      end
      object rpTipRecLbl4: TppLabel
        UserName = 'rpTipRecLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipRecLbl5: TppLabel
        UserName = 'rpTipRecLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 17992
        mmWidth = 115094
        BandType = 0
      end
      object rpTipRecLine1: TppLine
        UserName = 'rpTipRecLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object rpTipRecDBTxt1: TppDBText
        UserName = 'rpTipRecDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object rpTipRecLbl6: TppLabel
        UserName = 'rpTipRecLbl6'
        AutoSize = False
        Caption = 'Honorários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 17992
        mmWidth = 39688
        BandType = 0
      end
      object rpTipRecSysVar1: TppSystemVariable
        UserName = 'rpTipRecSysVar1'
        AutoSize = False
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
        mmWidth = 23283
        BandType = 0
      end
      object rpTipRecSysVar2: TppSystemVariable
        UserName = 'rpTipRecSysVar2'
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
        mmLeft = 161925
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpTipRecDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipRecDBTxt3: TppDBText
        UserName = 'rpTipRecDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 794
        mmWidth = 115094
        BandType = 4
      end
      object rpTipRecDBTxt2: TppDBText
        UserName = 'rpTipRecDBTxt2'
        DataField = 'CODTIPORECURSO'
        DataPipeline = ppTipRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object rpTipRecDBTxt4: TppDBText
        UserName = 'rpTipRecDBTxt4'
        DataField = 'VALORHONOR'
        DataPipeline = ppTipRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
    end
    object rpTipRecFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipRecSmryBnd: TppSummaryBand
      AfterPrint = rpVaraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipRecGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipRec
      UserName = 'rpTipRecGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipRecGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipRecGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipRecLbl7: TppLabel
          UserName = 'rpTipRecLbl7'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipRecDBCalc1: TppDBCalc
          UserName = 'rpTipRecDBCalc1'
          DataField = 'CODTIPORECURSO'
          DataPipeline = ppTipRec
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipRecGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 46567
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipRec: TppBDEPipeline
    DataSource = dsTipRec
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo7'
    Left = 242
    Top = 138
    object ppTipRecppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipRecppField2: TppField
      FieldAlias = 'CODTIPORECURSO'
      FieldName = 'CODTIPORECURSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipRecppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppTipRecppField4: TppField
      FieldAlias = 'VALORHONOR'
      FieldName = 'VALORHONOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsTipRec: TwwDataSource
    DataSet = qryTipRec
    Left = 242
    Top = 126
  end
  object qryTipRec: TwwQuery
    AfterOpen = qryVaraAfterOpen
    AfterScroll = qryVaraAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  0 AS CODTIPORECURSO, '#39'1'#39' AS DESCRICAO, 0 AS VALORHONOR'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ValidateWithMask = True
    Left = 242
    Top = 114
  end
end
