inherited dtmRelatoriosCFinan: TdtmRelatoriosCFinan
  Left = 338
  Top = 219
  Width = 527
  Height = 450
  OnCreate = dtmRelatoriosCFinanCreate
  OnDestroy = dtmRelatoriosCFinanDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    CloseDataSource = True
    SkipWhenNoRecords = False
    Left = 24
    Top = 48
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
    Left = 24
    Top = 32
  end
  inherited qryExemplo: TwwQuery
    Left = 24
  end
  inherited rpExemplo: TppReport
    PrinterSetup.mmMarginBottom = 14000
    Units = utMillimeters
    Left = 24
    Top = 0
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Label11: TppLabel [2]
        mmHeight = 5292
        mmLeft = 79640
        mmWidth = 37835
      end
    end
  end
  object ppExtratoConta: TppBDEPipeline
    DataSource = dsExtratoConta
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ExtratoConta'
    Left = 96
    Top = 48
    object ppExtratoContappField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField2: TppField
      FieldAlias = 'BORDERO'
      FieldName = 'BORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField3: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField4: TppField
      FieldAlias = 'CODFINANC'
      FieldName = 'CODFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField5: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField6: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField7: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField8: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField10: TppField
      FieldAlias = 'VALORENTRADA'
      FieldName = 'VALORENTRADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField11: TppField
      FieldAlias = 'VALORSAIDA'
      FieldName = 'VALORSAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField12: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField13: TppField
      FieldAlias = 'SALDOREGISTRO'
      FieldName = 'SALDOREGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField14: TppField
      FieldAlias = 'SALDOTOTAL'
      FieldName = 'SALDOTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object dsExtratoConta: TwwDataSource
    DataSet = gryExtratoConta
    Left = 96
    Top = 32
  end
  object gryExtratoConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' M.CODPORTADOR AS CODIGO,'
      ' M.CODLANCFINANC AS CODFINANC,'
      ' M.NUMCHQBORDERO AS BORDERO,'
      ' M.DATALANCFINAN AS DATA,'
      ' M.ENTRADASAIDA,'
      ' M.HISTORICO,'
      ' M.STATUSCONCILIA AS STATUS,'
      ' C.DESCRICAO,'
      
        ' SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN*-1,M.VALORLANCFI' +
        'NAN)) AS VALOR,'
      
        ' SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',0,M.VALORLANCFINAN)) AS VALORENTR' +
        'ADA,'
      
        ' SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN,0)) AS VALORSAID' +
        'A,'
      ' (0) AS SALDOANTERIOR,'
      ' (0) AS SALDOREGISTRO,'
      ' (0) AS SALDOTOTAL'
      ' FROM MOVIMFINANC M, PORTADORCONTA C'
      'WHERE '
      '  (1=2) '
      'GROUP BY'
      '  M.CODPORTADOR,'
      '  M.CODLANCFINANC,'
      '  M.NUMCHQBORDERO,'
      '  M.DATALANCFINAN,'
      '  M.ENTRADASAIDA,'
      '  M.HISTORICO,'
      '  M.STATUSCONCILIA,'
      '  C.DESCRICAO '
      'ORDER BY'
      '  M.CODPORTADOR,'
      '  M.DATALANCFINAN'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updExtratoConta
    ValidateWithMask = True
    Left = 96
    Top = 16
    object gryExtratoContaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object gryExtratoContaBORDERO: TStringField
      FieldName = 'BORDERO'
      Size = 15
    end
    object v: TFloatField
      FieldName = 'CODIGO'
    end
    object gryExtratoContaCODFINANC: TFloatField
      FieldName = 'CODFINANC'
    end
    object gryExtratoContaENTRADASAIDA: TStringField
      FieldName = 'ENTRADASAIDA'
      Size = 1
    end
    object gryExtratoContaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object gryExtratoContaSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object gryExtratoContaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object gryExtratoContaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object gryExtratoContaVALORENTRADA: TFloatField
      FieldName = 'VALORENTRADA'
    end
    object gryExtratoContaVALORSAIDA: TFloatField
      FieldName = 'VALORSAIDA'
    end
    object gryExtratoContaSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object gryExtratoContaSALDOREGISTRO: TFloatField
      FieldName = 'SALDOREGISTRO'
    end
    object gryExtratoContaSALDOTOTAL: TFloatField
      FieldName = 'SALDOTOTAL'
    end
  end
  object rpExtratoConta: TppReport
    AutoStop = False
    DataPipeline = ppExtratoConta
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtratoConta'
    object ppHeader: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Extrato de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 124090
        mmTop = 6879
        mmWidth = 36248
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
        mmLeft = 127265
        mmTop = 529
        mmWidth = 29633
        BandType = 0
      end
      object rpExtratoContaLabel10: TppLabel
        UserName = 'rpExtratoContaLabel10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 197644
        mmTop = 4233
        mmWidth = 13494
        BandType = 0
      end
      object lbData: TppLabel
        UserName = 'lbData'
        Caption = 'lbData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 212461
        mmTop = 4233
        mmWidth = 7938
        BandType = 0
      end
      object rpExtratoContaLabel11: TppLabel
        UserName = 'rpExtratoContaLabel11'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 200555
        mmTop = 8467
        mmWidth = 10583
        BandType = 0
      end
      object lbStatus: TppLabel
        UserName = 'lbStatus'
        Caption = 'lbStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 212461
        mmTop = 8467
        mmWidth = 10319
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblData'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 14288
        mmWidth = 6085
        BandType = 0
      end
      object lblDoc: TppLabel
        UserName = 'lblDoc'
        Caption = 'Nº Doc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 16140
        mmTop = 14288
        mmWidth = 9790
        BandType = 0
      end
      object lblHistorico: TppLabel
        UserName = 'lblHistorico'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 48154
        mmTop = 14288
        mmWidth = 12965
        BandType = 0
      end
      object lblValor: TppLabel
        UserName = 'lblValor'
        Caption = 'Saídas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 14288
        mmWidth = 9525
        BandType = 0
      end
      object lblSaldo: TppLabel
        UserName = 'lblSaldo'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 14288
        mmWidth = 7938
        BandType = 0
      end
      object lblStatus: TppLabel
        UserName = 'lblStatus'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 262467
        mmTop = 14288
        mmWidth = 9260
        BandType = 0
      end
      object rpExtratoContaLine1: TppLine
        UserName = 'rpExtratoContaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 12435
        mmWidth = 284300
        BandType = 0
      end
      object rpExtratoContaLabel1: TppLabel
        UserName = 'rpExtratoContaLabel1'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173832
        mmTop = 14288
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetail: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object dbtData: TppDBText
        UserName = 'dbtData'
        AutoSize = True
        DataField = 'DATA'
        DataPipeline = ppExtratoConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object dbtBordero: TppDBText
        UserName = 'dbtBordero'
        DataField = 'BORDERO'
        DataPipeline = ppExtratoConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3704
        mmLeft = 16140
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object dbtHistorico: TppDBText
        UserName = 'dbtHistorico'
        DataField = 'HISTORICO'
        DataPipeline = ppExtratoConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3704
        mmLeft = 47890
        mmTop = 265
        mmWidth = 89165
        BandType = 4
      end
      object dbtValor: TppDBText
        UserName = 'dbtValor'
        AutoSize = True
        DataField = 'SALDOREGISTRO'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 231246
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object dbtStatus: TppDBText
        UserName = 'dbtStatus'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = ppExtratoConta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 261409
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object rpExtratoContaDBText2: TppDBText
        UserName = 'rpExtratoContaDBText2'
        AutoSize = True
        DataField = 'VALORSAIDA'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 203730
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object rpExtratoContaDBText3: TppDBText
        UserName = 'rpExtratoContaDBText3'
        AutoSize = True
        DataField = 'VALORENTRADA'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 163513
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooter: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
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
        mmLeft = 1852
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmLeft = 40481
        mmTop = 3175
        mmWidth = 203200
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
        mmLeft = 245269
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpExtratoContaSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object rpExtratoContaDBText1: TppDBText
        UserName = 'rpExtratoContaDBText1'
        AutoSize = True
        DataField = 'SALDOTOTAL'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 236803
        mmTop = 1588
        mmWidth = 18785
        BandType = 7
      end
      object rpExtratoContaDBCalc1: TppDBCalc
        UserName = 'rpExtratoContaDBCalc1'
        AutoSize = True
        DataField = 'VALORENTRADA'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 152929
        mmTop = 1588
        mmWidth = 33602
        BandType = 7
      end
      object rpExtratoContaDBCalc4: TppDBCalc
        UserName = 'rpExtratoContaDBCalc4'
        AutoSize = True
        DataField = 'VALORSAIDA'
        DataPipeline = ppExtratoConta
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoConta'
        mmHeight = 3175
        mmLeft = 193146
        mmTop = 1588
        mmWidth = 28575
        BandType = 7
      end
      object rpExtratoContaLine2: TppLine
        UserName = 'rpExtratoContaLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object rpExtratoContaLabel2: TppLabel
        UserName = 'rpExtratoContaLabel2'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 1588
        mmWidth = 19844
        BandType = 7
      end
    end
    object rpExtratoContaGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppExtratoConta
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpExtratoContaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtratoConta'
      object rpHeaderDescricao: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'ppLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object dbtDescricao: TppDBText
          UserName = 'dbtDescricao'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = ppExtratoConta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppExtratoConta'
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 1588
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpExtratoContaLine3: TppLine
          UserName = 'rpExtratoContaLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFooterDescricao: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpExtratoContaDBCalc2: TppDBCalc
          UserName = 'rpExtratoContaDBCalc2'
          AutoSize = True
          DataField = 'VALORENTRADA'
          DataPipeline = ppExtratoConta
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoConta'
          mmHeight = 3175
          mmLeft = 152929
          mmTop = 529
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBCalc3: TppDBCalc
          UserName = 'rpExtratoContaDBCalc3'
          AutoSize = True
          DataField = 'VALORSAIDA'
          DataPipeline = ppExtratoConta
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoConta'
          mmHeight = 3175
          mmLeft = 193146
          mmTop = 529
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplSaldo: TppBDEPipeline
    DataSource = dsSaldo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lSaldo'
    Left = 24
    Top = 144
  end
  object dsSaldo: TwwDataSource
    DataSet = grySaldo
    Left = 24
    Top = 128
  end
  object grySaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT UN.DESCRICAO, UN.CODPORTADOR, SUM(UN.SALDOANTERIOR) AS SA' +
        'LDOANTERIOR,'
      
        '       SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO, SUM(UN.SALDOATU) AS S' +
        'ALDOATU'
      'FROM'
      '   ((SELECT C.DESCRICAO, C.CODPORTADOR,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN*-1,M.' +
        'VALORLANCFINAN)) AS SALDOANTERIOR,'
      '            0 AS RECTOPAGTO,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN*-1,M.' +
        'VALORLANCFINAN)) AS SALDOATU'
      '     FROM PORTADORCONTA C, MOVIMFINANC M'
      
        '     WHERE (M.DATALANCFINAN <=  TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39'))' +
        ' AND'
      '           (M.STATUSCONCILIA IN ('#39'N'#39')) AND'
      '           (M.IDPESSOA = :pIdEmpresa) AND'
      '           (M.CODPORTADOR = C.CODPORTADOR) AND'
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)'
      '     UNION'
      
        '    (SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DE' +
        'SCRICAO) AS DESCRICAO, C.CODPORTADOR,'
      '            0 AS SALDOANTERIOR,'
      '            SUM(S.SALDO) AS RECBTOPAGTO,'
      '            SUM(S.SALDO) AS SALDOATU'
      '     FROM'
      
        '          (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,VALO' +
        'R*-1)) AS SALDO'
      '           FROM LANCTODOCUM'
      '           GROUP BY CODDOCUMENTO) S,'
      '           DOCUMENTO D,'
      '           LANCTODOCUM L,'
      '           PORTADORFORMA P,'
      '           PORTADORCONTA C,'
      '           PARAMFINANC PF'
      '     WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '           ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPE' +
        'RACAO = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '           (D.IDPESSOA = :pIdEmpresa) AND'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECP' +
        'AG = '#39'S'#39')) OR'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECP' +
        'AG IS NULL)) AND'
      
        '           ((D.DATAPROGRAMADA = TO_DATE(:pDataRef,'#39'DD/MM/YYYY'#39'))' +
        '))) AND'
      '           (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '           (D.OPERACAO = L.OPERACAO) AND'
      '           (L.ESTORNO IS NULL) AND'
      '           (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '           (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '           (D.IDPESSOA = PF.IDPESSOA) AND'
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)) UN'
      'GROUP BY  UN.DESCRICAO, UN.CODPORTADOR'
      'ORDER BY  UN.DESCRICAO'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 24
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'pIdEmpresa'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pIdEmpresa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDataRef'
        ParamType = ptInput
      end>
  end
  object rpSaldo: TppReport
    AutoStop = False
    DataPipeline = pplSaldo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 24
    Top = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object lbDataSaldo: TppLabel
        UserName = 'lbDataSaldo'
        AutoSize = False
        Caption = 'lbDataSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 8731
        mmWidth = 197115
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object rpSaldoLabel1: TppLabel
        UserName = 'rpSaldoLabel1'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object rpSaldoLabel2: TppLabel
        UserName = 'rpSaldoLabel2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 22225
        mmWidth = 7938
        BandType = 0
      end
      object rpSaldoLine1: TppLine
        UserName = 'rpSaldoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197300
        BandType = 0
      end
      object rpSaldoLabel3: TppLabel
        UserName = 'rpSaldoLabel3'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 22225
        mmWidth = 10319
        BandType = 0
      end
      object rpSaldoLabel6: TppLabel
        UserName = 'rpSaldoLabel6'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 157957
        mmTop = 14817
        mmWidth = 11377
        BandType = 0
      end
      object lbStatusSaldo: TppLabel
        UserName = 'lbStatusSaldo'
        Caption = 'lbStatusSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 170921
        mmTop = 15081
        mmWidth = 21960
        BandType = 0
      end
      object rpSaldoLabel5: TppLabel
        UserName = 'rpSaldoLabel5'
        Caption = 'Receb.- Pagto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 22225
        mmWidth = 20638
        BandType = 0
      end
      object rpSaldoLabel7: TppLabel
        UserName = 'rpSaldoLabel7'
        Caption = 'Saldo a Aplicar/Resg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166423
        mmTop = 22225
        mmWidth = 30163
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'DESCRICAO'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 265
        mmWidth = 77788
        BandType = 4
      end
      object rpSaldoDBText1: TppDBText
        UserName = 'rpSaldoDBText1'
        DataField = 'CODPORTADOR'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpSaldoDBText2: TppDBText
        UserName = 'rpSaldoDBText2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object rpSaldoDBText3: TppDBText
        UserName = 'rpSaldoDBText3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 181505
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object rpSaldoDBText4: TppDBText
        UserName = 'rpSaldoDBText4'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
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
        mmTop = 1852
        mmWidth = 196321
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
        mmTop = 1852
        mmWidth = 196321
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
        mmLeft = 170921
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
    end
    object rpSaldoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object rpSaldoLabel4: TppLabel
        UserName = 'rpSaldoLabel4'
        Caption = 'Saldo Geral das Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 52652
        mmTop = 1588
        mmWidth = 40481
        BandType = 7
      end
      object rpSaldoDBCalc1: TppDBCalc
        UserName = 'rpSaldoDBCalc1'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 96573
        mmTop = 2117
        mmWidth = 34660
        BandType = 7
      end
      object rpSaldoDBCalc2: TppDBCalc
        UserName = 'rpSaldoDBCalc2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 130440
        mmTop = 2117
        mmWidth = 33867
        BandType = 7
      end
      object rpSaldoDBCalc3: TppDBCalc
        UserName = 'rpSaldoDBCalc3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 2117
        mmWidth = 25665
        BandType = 7
      end
    end
  end
  object pplSaldoHist: TppBDEPipeline
    DataSource = dsSaldoHist
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lSaldoHist'
    Left = 176
    Top = 48
  end
  object dsSaldoHist: TwwDataSource
    DataSet = grySaldoHist
    Left = 176
    Top = 32
  end
  object grySaldoHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  M.CODPORTADOR,'
      '  M.HISTPADFINAN, '
      '  C.DESCRICAO,'
      '  H.DESCRICAO AS HISTORICO, '
      
        '  SUM(DECODE(ENTRADASAIDA,'#39'S'#39',VALORLANCFINAN*-1,VALORLANCFINAN))' +
        ' AS VALOR'
      'FROM '
      '  MOVIMFINANC M,'
      '  PORTADORCONTA C,'
      '  HISTORICOFINAN H'
      'WHERE '
      '  (1=2)'
      'GROUP BY '
      '  M.CODPORTADOR,'
      '  M.HISTPADFINAN, '
      '  C.DESCRICAO,'
      '  H.DESCRICAO'
      'ORDER BY '
      '  C.DESCRICAO,'
      '  H.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 16
  end
  object rpSaldoHist: TppReport
    AutoStop = False
    DataPipeline = pplSaldoHist
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 176
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldoHist'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object lbDataSaldoHist: TppLabel
        UserName = 'lbDataSaldoHist'
        Caption = 'lbDataSaldoHist'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197380
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lblEmpresa'
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
        mmTop = 3704
        mmWidth = 28046
        BandType = 0
      end
      object rpSaldoHistLabel2: TppLabel
        UserName = 'rpSaldoHistLabel2'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 17198
        mmWidth = 11377
        BandType = 0
      end
      object lbStatusSaldoHist: TppLabel
        UserName = 'lbStatusSaldoHist'
        Caption = 'lbStatusSaldoHist'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpSaldoHistDBText3: TppDBText
        UserName = 'rpSaldoHistDBText3'
        DataField = 'HISTORICO'
        DataPipeline = pplSaldoHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldoHist'
        mmHeight = 3704
        mmLeft = 39952
        mmTop = 0
        mmWidth = 95250
        BandType = 4
      end
      object rpSaldoHistDBText2: TppDBText
        UserName = 'rpSaldoHistDBText2'
        DataField = 'HISTPADFINAN'
        DataPipeline = pplSaldoHist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoHist'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object rpSaldoHistDBText4: TppDBText
        UserName = 'rpSaldoHistDBText4'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplSaldoHist
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoHist'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 8
      end
      object pplblSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lblSistema'
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
        mmTop = 5292
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
        mmLeft = 0
        mmTop = 5292
        mmWidth = 197644
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
        mmTop = 5292
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpSaldoHistGroup1: TppGroup
      BreakName = 'CODPORTADOR'
      DataPipeline = pplSaldoHist
      OutlineSettings.CreateNode = True
      UserName = 'rpSaldoHistGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoHist'
      object rpSaldoHistGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpSaldoHistLabel1: TppLabel
          UserName = 'rpSaldoHistLabel1'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 6615
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpSaldoHistLine1: TppLine
          UserName = 'rpSaldoHistLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpSaldoHistLabel3: TppLabel
          UserName = 'rpSaldoHistLabel3'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 39952
          mmTop = 6615
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpSaldoHistLabel4: TppLabel
          UserName = 'rpSaldoHistLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 168805
          mmTop = 6879
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpSaldoHistDBText1: TppDBText
          UserName = 'rpSaldoHistDBText1'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplSaldoHist
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSaldoHist'
          mmHeight = 3175
          mmLeft = 3969
          mmTop = 1058
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpSaldoHistLine2: TppLine
          UserName = 'rpSaldoHistLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSaldoHistGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplCompRecPag: TppBDEPipeline
    DataSource = dsCompRecPag
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lCompRecPag'
    Left = 96
    Top = 144
  end
  object dsCompRecPag: TwwDataSource
    DataSet = gryCompRecPag
    Left = 96
    Top = 128
  end
  object gryCompRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.DESCRICAO,'
      '  F.RECPAG,'
      '  F.CODTIPRECDES,'
      '  SUM(F.VALOR*CV.COTVALOR) AS VALORC '
      'FROM '
      '  FLUXOREAL F, '
      '  TIPORECEBDESEMB T,'
      '  (SELECT C.MOECODIGO,C.COTDATA,C.COTVALOR FROM COTACAOMOEDA C,'
      
        '                  (SELECT MOECODIGO,MAX(COTDATA) AS DATA FROM CO' +
        'TACAOMOEDA GROUP BY MOECODIGO) CD '
      '   WHERE'
      '     C.MOECODIGO = CD.MOECODIGO '
      '     AND C.COTDATA = CD.DATA) CV'
      'WHERE '
      '  (1=2) '
      'GROUP BY '
      '  T.DESCRICAO,'
      '  F.RECPAG,'
      '  F.CODTIPRECDES'
      'ORDER BY '
      '   VALORC'
      ' ')
    ValidateWithMask = True
    Left = 96
    Top = 112
  end
  object rpCompRecPag: TppReport
    AutoStop = False
    DataPipeline = pplCompRecPag
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    Left = 96
    Top = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCompRecPag'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 150813
      mmPrintPosition = 0
      object rpCompRecPagDBTeeChart1: TppDBTeeChart
        UserName = 'rpCompRecPagDBTeeChart1'
        mmHeight = 88636
        mmLeft = 44186
        mmTop = 53711
        mmWidth = 207434
        BandType = 0
        object TppDBTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Foot.AdjustFrame = False
          Foot.Visible = False
          LeftWall.Brush.Color = clYellow
          LeftWall.Brush.Style = bsHorizontal
          LeftWall.Pen.Color = -1
          MarginBottom = 5
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 5
          Title.AdjustFrame = False
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -21
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Title.Text.Strings = (
            '')
          Title.Visible = False
          BottomAxis.Labels = False
          Chart3DPercent = 25
          LeftAxis.AxisValuesFormat = '#,##0.00'
          LeftAxis.DateTimeFormat = 'dd/mm/yyyy'
          LeftAxis.Increment = 1
          LeftAxis.LabelsSeparation = 100
          LeftAxis.MinorTickCount = 1
          LeftAxis.RoundFirstLabel = False
          LeftAxis.TickInnerLength = 1
          LeftAxis.TickLength = 0
          LeftAxis.Title.Angle = 0
          Legend.DividingLines.Style = psDashDot
          Legend.Font.Charset = DEFAULT_CHARSET
          Legend.Font.Color = clBlack
          Legend.Font.Height = -12
          Legend.Font.Name = 'Arial'
          Legend.Font.Style = []
          Legend.HorizMargin = 25
          Legend.Inverted = True
          Legend.ShadowSize = 6
          Legend.TextStyle = ltsRightValue
          RightAxis.Labels = False
          BevelWidth = 10
          BevelOuter = bvNone
          Color = clWhite
          object Series4: TPieSeries
            Active = False
            Cursor = crArrow
            Marks.ArrowLength = 0
            Marks.Clip = True
            Marks.Frame.Visible = False
            Marks.Style = smsPercent
            Marks.Transparent = True
            Marks.Visible = False
            DataSource = gryCompRecPag
            PercentFormat = '00.00 %'
            SeriesColor = clRed
            Title = 'Pizza'
            ValueFormat = '#,##0.00      '
            XLabelsSource = 'DESCRICAO'
            Circled = True
            Dark3D = False
            OtherSlice.Text = 'Other'
            PieValues.DateTime = True
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'VALORC'
            RotationAngle = 15
          end
          object Series5: TBarSeries
            Active = False
            ColorEachPoint = True
            Cursor = crArrow
            Marks.ArrowLength = 0
            Marks.Style = smsLabelPercent
            Marks.Visible = False
            DataSource = gryCompRecPag
            PercentFormat = '00.00 %'
            SeriesColor = clGreen
            Title = 'Barra Vertical'
            ValueFormat = '#,##0.00      '
            XLabelsSource = 'DESCRICAO'
            BarWidthPercent = 100
            Dark3D = False
            SideMargins = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Multiplier = 1
            XValues.Order = loNone
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Multiplier = 1
            YValues.Order = loAscending
            YValues.ValueSource = 'VALORC'
          end
          object Series1: THorizBarSeries
            Active = False
            ColorEachPoint = True
            Marks.ArrowLength = -3
            Marks.Visible = False
            DataSource = gryCompRecPag
            SeriesColor = clYellow
            Title = 'Barra Horizontal'
            XLabelsSource = 'DESCRICAO'
            Dark3D = False
            SideMargins = False
            XValues.DateTime = False
            XValues.Name = 'Bar'
            XValues.Multiplier = 1
            XValues.Order = loNone
            XValues.ValueSource = 'VALORC'
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1
            YValues.Order = loNone
          end
        end
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
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
        mmLeft = 0
        mmTop = 265
        mmWidth = 284692
        BandType = 0
      end
      object rpBalanceteLabel1: TppLabel
        UserName = 'rpBalanceteLabel1'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 11113
        mmWidth = 13494
        BandType = 0
      end
      object lbDataComposicao: TppLabel
        UserName = 'lbDataComposicao'
        Caption = 'lbDataComposicao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 234421
        mmTop = 11113
        mmWidth = 23548
        BandType = 0
      end
      object rpCompRecPagLabel1: TppLabel
        UserName = 'rpCompRecPagLabel1'
        Caption = 'Centro de Responsabilidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 8467
        mmWidth = 42863
        BandType = 0
      end
      object lbCentroRespos: TppLabel
        UserName = 'lbCentroRespos'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44715
        mmTop = 8467
        mmWidth = 7938
        BandType = 0
      end
      object lbAtividade: TppLabel
        UserName = 'lbAtividade'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 44715
        mmTop = 12700
        mmWidth = 7938
        BandType = 0
      end
      object rpCompRecPagLabel4: TppLabel
        UserName = 'rpCompRecPagLabel4'
        Caption = 'Atividade/Projeto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 12700
        mmWidth = 42863
        BandType = 0
      end
      object lbTitulo: TppLabel
        UserName = 'lbTitulo'
        Caption = 'lbTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 132821
        mmTop = 9525
        mmWidth = 18521
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
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel12: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel12'
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
        mmWidth = 283634
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
        mmLeft = 245005
        mmTop = 3175
        mmWidth = 29898
        BandType = 8
      end
    end
  end
  object pplLancamento: TppBDEPipeline
    DataSource = dsLancamento
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lLancamento'
    Left = 200
    Top = 144
    object pplLancamentoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODLANCTRANSF'
      FieldName = 'CODLANCTRANSF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplLancamentoppField2: TppField
      FieldAlias = 'ES'
      FieldName = 'ES'
      FieldLength = 14
      DisplayWidth = 14
      Position = 1
    end
    object pplLancamentoppField3: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplLancamentoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LANC'
      FieldName = 'LANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplLancamentoppField5: TppField
      FieldAlias = 'CODDEB'
      FieldName = 'CODDEB'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplLancamentoppField6: TppField
      FieldAlias = 'DESCDEB'
      FieldName = 'DESCDEB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplLancamentoppField7: TppField
      FieldAlias = 'CODCRE'
      FieldName = 'CODCRE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object pplLancamentoppField8: TppField
      FieldAlias = 'DESCCRE'
      FieldName = 'DESCCRE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object pplLancamentoppField9: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplLancamentoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplLancamentoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORANT'
      FieldName = 'VALORANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplLancamentoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPER'
      FieldName = 'VALORPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplLancamentoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object dsLancamento: TwwDataSource
    DataSet = qryLancamento
    Left = 200
    Top = 128
  end
  object qryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.CODLANCTRANSF,'
      
        '   DECODE(M.CODLANCTRANSF,NULL,DECODE(M.ENTRADASAIDA,'#39'S'#39','#39'Saídas' +
        #39','#39'Entradas'#39'),'#39'Transferencias'#39') AS ES,'
      '   M.DATALANCFINAN AS DATA,'
      '   M.CODLANCFINANC AS LANC,'
      
        '   DECODE(M.CODLANCTRANSF,NULL,PO.NOCONTACORR,DECODE(M.ENTRADASA' +
        'IDA,'#39'E'#39','#39#39',PO.NOCONTACORR)) AS CODDEB,'
      
        '   DECODE(M.CODLANCTRANSF,NULL,PO.DESCRICAO,DECODE(M.ENTRADASAID' +
        'A,'#39'E'#39','#39#39',PO.DESCRICAO)) AS DESCDEB,'
      
        '   DECODE(M.CODLANCTRANSF,NULL,R.CODTIPRECDES,DECODE(M.ENTRADASA' +
        'IDA,'#39'S'#39','#39#39',PO.NOCONTACORR)) AS CODCRE,'
      
        '   DECODE(M.CODLANCTRANSF,NULL,T.DESCRICAO,DECODE(M.ENTRADASAIDA' +
        ','#39'S'#39','#39#39',PO.DESCRICAO)) AS DESCCRE,'
      '   M.HISTORICO,'
      
        '   DECODE(R.VALOR,NULL,DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINA' +
        'N,(M.VALORLANCFINAN*-1)),R.VALOR) AS VALOR,'
      '   DECODE(ANT.VLRANT,'#39#39', 0.00,ANT.VLRANT) AS VALORANT,'
      '   DECODE(PER.VLRPER,'#39#39', 0.00,PER.VLRPER) AS VALORPER,'
      
        '   DECODE(PER.VLRPER+ANT.VLRANT,'#39#39', 0.00,PER.VLRPER+ANT.VLRANT) ' +
        'AS VALORATUAL'
      
        'FROM MOVIMFINANC M, RATEIOFINANC R, PORTADORCONTA PO, TIPORECEBD' +
        'ESEMB T,'
      
        '    (SELECT SUM(DECODE (ENTRADASAIDA, '#39'S'#39',  VALORLANCFINAN*-1, V' +
        'ALORLANCFINAN)) AS VLRANT'
      '     FROM MOVIMFINANC'
      '     WHERE (STATUSCONCILIA <> '#39'J'#39')'
      '       AND (IDPESSOA = :IDPESSOA)'
      
        '       AND (DATALANCFINAN < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) )  A' +
        'NT,'
      
        '    (SELECT SUM(DECODE (ENTRADASAIDA, '#39'S'#39',  VALORLANCFINAN*-1, V' +
        'ALORLANCFINAN)) AS VLRPER'
      '     FROM MOVIMFINANC'
      '     WHERE (STATUSCONCILIA <> '#39'J'#39')'
      '       AND (IDPESSOA = :IDPESSOA)'
      '       AND (DATALANCFINAN >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '       AND (DATALANCFINAN <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) PE' +
        'R'
      'WHERE'
      '       (M.IDPESSOA = :IDPESSOA)'
      '   AND (M.IDPESSOA = T.IDPESSOA)'
      '   AND (M.DATALANCFINAN >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '   AND (M.DATALANCFINAN <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND (M.CODLANCFINANC = R.CODLANCFINANC(+))'
      '   AND (M.CODPORTADOR = PO.CODPORTADOR)'
      '   AND (R.CODTIPRECDES = T.CODTIPRECDES(+))'
      '   AND (R.RECPAG = T.RECPAG(+))'
      '   AND (R.IDPESSOA = T.IDPESSOA(+))'
      'ORDER BY ES, DATA, CODCRE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
  end
  object rpLancamento: TppReport
    AutoStop = False
    DataPipeline = pplLancamento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    Left = 200
    Top = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLancamento'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object rpLancamentoLabel2: TppLabel
        UserName = 'rpLancamentoLabel2'
        Caption = 'Lançamentos do Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 114300
        mmTop = 6879
        mmWidth = 56356
        BandType = 0
      end
      object rpLancamentoLabel3: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'rpLancamentoLabel3'
        Caption = 'CM Soluções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 126736
        mmTop = 529
        mmWidth = 32544
        BandType = 0
      end
      object lblDataLancamento: TppLabel
        UserName = 'lblDataLancamento'
        Caption = '27/08/1998 à 27/08/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 240507
        mmTop = 12435
        mmWidth = 31750
        BandType = 0
      end
      object rpLancamentoLabel4: TppLabel
        UserName = 'rpLancamentoLabel4'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 227278
        mmTop = 12435
        mmWidth = 12171
        BandType = 0
      end
      object rpLancamentoLabel15: TppLabel
        UserName = 'rpLancamentoLabel15'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 217753
        mmTop = 17198
        mmWidth = 21696
        BandType = 0
      end
      object rpLancamentoDBText6: TppDBText
        UserName = 'rpLancamentoDBText6'
        AutoSize = True
        DataField = 'VALORANT'
        DataPipeline = pplLancamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 240507
        mmTop = 17198
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpLancamentoDBText9: TppDBText
        UserName = 'rpLancamentoDBText9'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplLancamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 262732
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object rpLancamentoDBText2: TppDBText
        UserName = 'rpLancamentoDBText2'
        AutoSize = True
        DataField = 'LANC'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object rpLancamentoDBText4: TppDBText
        UserName = 'rpLancamentoDBText4'
        DataField = 'CODDEB'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rpLancamentoDBText5: TppDBText
        UserName = 'rpLancamentoDBText5'
        DataField = 'HISTORICO'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 0
        mmWidth = 91811
        BandType = 4
      end
      object rpLancamentoDBText10: TppDBText
        UserName = 'rpLancamentoDBText10'
        DataField = 'DESCDEB'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 0
        mmWidth = 45773
        BandType = 4
      end
      object rpLancamentoDBText3: TppDBText
        UserName = 'rpLancamentoDBText3'
        DataField = 'CODCRE'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3704
        mmLeft = 100013
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rpLancamentoDBText7: TppDBText
        UserName = 'rpLancamentoDBText7'
        DataField = 'DESCCRE'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 0
        mmWidth = 45773
        BandType = 4
      end
      object rpLancamentoDBText1: TppDBText
        UserName = 'rpLancamentoDBText1'
        AutoSize = True
        DataField = 'DATA'
        DataPipeline = pplLancamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object rpLancamentoLabel1: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'rpLancamentoLabel1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 275167
        BandType = 8
      end
      object rpLancamentoLine1: TppLine
        UserName = 'rpLancamentoLine1'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1323
        mmWidth = 277019
        BandType = 8
      end
      object rpLancamentoCalc1: TppSystemVariable
        UserName = 'rpLancamentoCalc1'
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
        mmWidth = 276226
        BandType = 8
      end
      object rpLancamentoCalc2: TppSystemVariable
        UserName = 'rpLancamentoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249503
        mmTop = 3175
        mmWidth = 25929
        BandType = 8
      end
    end
    object rpLancamentoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object rpLancamentoShape1: TppShape
        UserName = 'rpLancamentoShape1'
        mmHeight = 17727
        mmLeft = 265
        mmTop = 265
        mmWidth = 275696
        BandType = 7
      end
      object rpLancamentoLabel7: TppLabel
        UserName = 'rpLancamentoLabel7'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 224896
        mmTop = 2117
        mmWidth = 21696
        BandType = 7
      end
      object rpLancamentoDBText8: TppDBText
        UserName = 'rpLancamentoDBText8'
        AutoSize = True
        DataField = 'VALORANT'
        DataPipeline = pplLancamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 2117
        mmWidth = 15346
        BandType = 7
      end
      object rpLancamentoDBText12: TppDBText
        UserName = 'rpLancamentoDBText12'
        AutoSize = True
        DataField = 'VALORPER'
        DataPipeline = pplLancamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 256911
        mmTop = 7408
        mmWidth = 15346
        BandType = 7
      end
      object rpLancamentoDBText13: TppDBText
        UserName = 'rpLancamentoDBText13'
        AutoSize = True
        DataField = 'VALORATUAL'
        DataPipeline = pplLancamento
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancamento'
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 12700
        mmWidth = 19050
        BandType = 7
      end
      object rpLancamentoLabel12: TppLabel
        UserName = 'rpLancamentoLabel12'
        Caption = 'Saldo Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229659
        mmTop = 12700
        mmWidth = 16933
        BandType = 7
      end
      object rpLancamentoLabel16: TppLabel
        UserName = 'rpLancamentoLabel16'
        Caption = 'Movimento do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 7408
        mmWidth = 33867
        BandType = 7
      end
      object rpLancamentoSubReport1: TppSubReport
        UserName = 'rpLancamentoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplPrevisao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpLancamentoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplPrevisao
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplPrevisao'
          object rpLancamentoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 21696
            mmPrintPosition = 0
            object rpLancamentoChildReport1Shape1: TppShape
              UserName = 'rpLancamentoChildReport1Shape1'
              mmHeight = 19050
              mmLeft = 0
              mmTop = 529
              mmWidth = 275696
              BandType = 4
            end
            object rpLancamentoChildReport1Label1: TppLabel
              UserName = 'rpLancamentoChildReport1Label1'
              Caption = 'Recebimentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 3175
              mmTop = 2910
              mmWidth = 38100
              BandType = 4
            end
            object rpLancamentoChildReport1Label2: TppLabel
              UserName = 'rpLancamentoChildReport1Label2'
              Caption = 'Pagamentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 6085
              mmTop = 8202
              mmWidth = 35190
              BandType = 4
            end
            object rpLancamentoChildReport1DBText1: TppDBText
              UserName = 'rpLancamentoChildReport1DBText1'
              AutoSize = True
              DataField = 'VALORRNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 49477
              mmTop = 2910
              mmWidth = 21167
              BandType = 4
            end
            object rpLancamentoChildReport1DBText2: TppDBText
              UserName = 'rpLancamentoChildReport1DBText2'
              AutoSize = True
              DataField = 'VALORPNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 49742
              mmTop = 8202
              mmWidth = 20902
              BandType = 4
            end
            object rpLancamentoChildReport1Label3: TppLabel
              UserName = 'rpLancamentoChildReport1Label3'
              Caption = 'Recebimentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 103717
              mmTop = 2910
              mmWidth = 36248
              BandType = 4
            end
            object rpLancamentoChildReport1Label4: TppLabel
              UserName = 'rpLancamentoChildReport1Label4'
              Caption = 'Pagamentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 106627
              mmTop = 8202
              mmWidth = 33338
              BandType = 4
            end
            object rpLancamentoChildReport1DBText3: TppDBText
              UserName = 'rpLancamentoChildReport1DBText3'
              AutoSize = True
              DataField = 'VALORRHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 148432
              mmTop = 2910
              mmWidth = 19050
              BandType = 4
            end
            object rpLancamentoChildReport1DBText4: TppDBText
              UserName = 'rpLancamentoChildReport1DBText4'
              AutoSize = True
              DataField = 'VALORPHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 148696
              mmTop = 8202
              mmWidth = 18785
              BandType = 4
            end
            object rpLancamentoChildReport1Label5: TppLabel
              UserName = 'rpLancamentoChildReport1Label5'
              Caption = 'Recebimentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 190236
              mmTop = 2910
              mmWidth = 34131
              BandType = 4
            end
            object rpLancamentoChildReport1Label6: TppLabel
              UserName = 'rpLancamentoChildReport1Label6'
              Caption = 'Pagamentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 193146
              mmTop = 8202
              mmWidth = 31221
              BandType = 4
            end
            object rpLancamentoChildReport1DBText5: TppDBText
              UserName = 'rpLancamentoChildReport1DBText5'
              AutoSize = True
              DataField = 'VALORRMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 225955
              mmTop = 2910
              mmWidth = 21696
              BandType = 4
            end
            object rpLancamentoChildReport1DBText6: TppDBText
              UserName = 'rpLancamentoChildReport1DBText6'
              AutoSize = True
              DataField = 'VALORPMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 226219
              mmTop = 8202
              mmWidth = 21431
              BandType = 4
            end
            object rpLancamentoChildReport1Label7: TppLabel
              UserName = 'rpLancamentoChildReport1Label7'
              Caption = 'Disponibilidade Prevista:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 104246
              mmTop = 13758
              mmWidth = 32808
              BandType = 4
            end
            object rpLancamentoChildReport1Label8: TppLabel
              OnPrint = rpLancamentoChildReport1Label8Print
              UserName = 'rpLancamentoChildReport1Label8'
              Caption = 'rpLancamentoChildReport1Label8'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 122238
              mmTop = 13494
              mmWidth = 45244
              BandType = 4
            end
            object rpLancamentoChildReport1DBText7: TppDBText
              UserName = 'rpLancamentoChildReport1DBText7'
              AutoSize = True
              DataField = 'VALORATUAL'
              DataPipeline = pplLancamento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplLancamento'
              mmHeight = 3175
              mmLeft = 251884
              mmTop = 14817
              mmWidth = 19050
              BandType = 4
            end
            object rpLancamentoChildReport1DBText8: TppDBText
              UserName = 'rpLancamentoChildReport1DBText8'
              AutoSize = True
              DataField = 'VALORPHOJE'
              DataPipeline = pplPrevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 229130
              mmTop = 15081
              mmWidth = 18785
              BandType = 4
            end
            object rpLancamentoChildReport1DBText9: TppDBText
              UserName = 'rpLancamentoChildReport1DBText9'
              AutoSize = True
              DataField = 'VALORRHOJE'
              DataPipeline = pplPrevisao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 206375
              mmTop = 15081
              mmWidth = 19050
              BandType = 4
            end
          end
        end
      end
    end
    object rpLancamentoGroup4: TppGroup
      BreakName = 'ES'
      DataPipeline = pplLancamento
      OutlineSettings.CreateNode = True
      UserName = 'rpLancamentoGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLancamento'
      object rpLancamentoGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpLancamentoShape3: TppShape
          UserName = 'rpLancamentoShape3'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 275696
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoDBText11: TppDBText
          UserName = 'rpLancamentoDBText11'
          AutoSize = True
          DataField = 'ES'
          DataPipeline = pplLancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplLancamento'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel11: TppLabel
          UserName = 'rpLancamentoLabel11'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 165365
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel13: TppLabel
          UserName = 'rpLancamentoLabel13'
          Caption = 'Descrição Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 116417
          mmTop = 8731
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel8: TppLabel
          UserName = 'rpLancamentoLabel8'
          Caption = 'N.Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 19050
          mmTop = 8731
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel10: TppLabel
          UserName = 'rpLancamentoLabel10'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 41540
          mmTop = 8731
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel14: TppLabel
          UserName = 'rpLancamentoLabel14'
          Caption = 'Descrição Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 51858
          mmTop = 8731
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel9: TppLabel
          UserName = 'rpLancamentoLabel9'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 8731
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rpLancamentoLabel6: TppLabel
          UserName = 'rpLancamentoLabel6'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 5292
          mmTop = 8731
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object Label9: TppLabel
          UserName = 'Label9'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 265113
          mmTop = 8731
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
      end
      object rpLancamentoGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpLancamentoDBCalc2: TppDBCalc
          UserName = 'rpLancamentoDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplLancamento
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpLancamentoGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplLancamento'
          mmHeight = 3175
          mmLeft = 252148
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object rpLancamentoLabel5: TppLabel
          UserName = 'rpLancamentoLabel5'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 238655
          mmTop = 1852
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object updExtratoConta: TUpdateSQL
    Left = 360
    Top = 8
  end
  object qryEmisTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT LF.CODLANCFINANC,L.LACNUMLAN,LF.PLNCODIGO,'
      '       LF.DATALANCFINAN,L.PLACONTA,'
      '       (L.LACHIST1||'#39' '#39'||LACHIST2||'#39' '#39'||LACHIST3) AS HIST,'
      '       LF.CODLANCTRANSF,L.CODCENTROCUSTO,'
      '       L.UNIDNEGOC,L.CODSUBCONTA,'
      '       LF.VALORLANCFINAN,LF.HISTORICO,'
      '       L.LACDEBCRE,L.LACVALOR,'
      '       LF.NUMCHQBORDERO,CD.DESCRICAO,'
      '       CS.DESCRICAO AS DESCSAQUE '
      'FROM MOVIMFINANC LF, LANCAMENTO L, PORTADORCONTA CD,'
      
        '    (SELECT C.DESCRICAO,M.CODLANCFINANC FROM MOVIMFINANC M, PORT' +
        'ADORCONTA C'
      '     WHERE (M.CODPORTADOR = C.CODPORTADOR) AND'
      '           (M.IDPESSOA = C.IDPESSOA) AND'
      '           (M.IDPESSOA = :pIDPessoa )) CS'
      'WHERE (LF.DATALANCFINAN >= TO_DATE(:pDatIni, '#39'DD/MM/YYYY'#39')) AND'
      '      (LF.DATALANCFINAN <= TO_DATE(:pDatFim, '#39'DD/MM/YYYY'#39')) AND'
      '      (LF.CODLANCTRANSF IS NOT NULL) AND'
      '      (LF.ENTRADASAIDA = '#39'E'#39') AND'
      '      (LF.PLNCODIGO = L.PLNCODIGO) AND'
      '      (CD.CODPORTADOR = LF.CODPORTADOR) AND'
      '      (CS.CODLANCFINANC = LF.CODLANCTRANSF) AND'
      '      (LF.IDPESSOA = :pIDPessoa ) AND'
      '      (LF.IDPESSOA = L.IDPESSOA) AND'
      '      (LF.IDPESSOA = CD.IDPESSOA)'
      'ORDER BY LF.CODLANCFINANC,L.LACNUMLAN '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDatIni'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDatFim'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'pIDPessoa'
        ParamType = ptInput
      end>
  end
  object dsEmisTransf: TwwDataSource
    DataSet = qryEmisTransf
    Left = 24
    Top = 224
  end
  object pplEmisTransf: TppBDEPipeline
    DataSource = dsEmisTransf
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lEmisTransf'
    Left = 24
    Top = 208
  end
  object rpEmisTransf: TppReport
    AutoStop = False
    DataPipeline = pplEmisTransf
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 24
    Top = 192
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplEmisTransf'
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = pplEmisTransf
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'LACNUMLAN'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3175
        mmLeft = 12700
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'CODSUBCONTA'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 54240
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'UNIDNEGOC'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object rpEmisTransfDBText1: TppDBText
        UserName = 'rpEmisTransfDBText1'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 65881
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
      object rpEmisTransfDBText3: TppDBText
        UserName = 'rpEmisTransfDBText3'
        DataField = 'LACDEBCRE'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 189971
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object rpEmisTransfDBMemo2: TppDBMemo
        UserName = 'rpEmisTransfDBMemo2'
        CharWrap = False
        DataField = 'HIST'
        DataPipeline = pplEmisTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplEmisTransf'
        mmHeight = 3704
        mmLeft = 110331
        mmTop = 0
        mmWidth = 57415
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
      object rpEmisTransfShape3: TppShape
        UserName = 'rpEmisTransfShape3'
        mmHeight = 8996
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 195263
        BandType = 8
      end
      object rpEmisTransfShape6: TppShape
        UserName = 'rpEmisTransfShape6'
        mmHeight = 8996
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape7: TppShape
        UserName = 'rpEmisTransfShape7'
        mmHeight = 8996
        mmLeft = 33338
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape8: TppShape
        UserName = 'rpEmisTransfShape8'
        mmHeight = 8996
        mmLeft = 65617
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape9: TppShape
        UserName = 'rpEmisTransfShape9'
        mmHeight = 8996
        mmLeft = 97631
        mmTop = 1588
        mmWidth = 32544
        BandType = 8
      end
      object rpEmisTransfShape10: TppShape
        UserName = 'rpEmisTransfShape10'
        mmHeight = 8996
        mmLeft = 129646
        mmTop = 1588
        mmWidth = 33602
        BandType = 8
      end
      object rpEmisTransfLabel8: TppLabel
        UserName = 'rpEmisTransfLabel8'
        Caption = 'rpEmisTransfLabel8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 2381
        mmWidth = 26723
        BandType = 8
      end
      object rpEmisTransfLabel9: TppLabel
        UserName = 'rpEmisTransfLabel9'
        Caption = 'rpEmisTransfLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 35190
        mmTop = 2381
        mmWidth = 26723
        BandType = 8
      end
      object rpEmisTransfLabel10: TppLabel
        UserName = 'rpEmisTransfLabel10'
        Caption = 'rpEmisTransfLabel10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel11: TppLabel
        UserName = 'rpEmisTransfLabel11'
        Caption = 'rpEmisTransfLabel11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 98425
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel12: TppLabel
        UserName = 'rpEmisTransfLabel12'
        Caption = 'rpEmisTransfLabel12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
      object rpEmisTransfLabel13: TppLabel
        UserName = 'rpEmisTransfLabel13'
        Caption = 'rpEmisTransfLabel13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 2381
        mmWidth = 28310
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODLANCFINANC'
      DataPipeline = pplEmisTransf
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEmisTransf'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 66940
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'ppShape2'
          mmHeight = 14552
          mmLeft = 794
          mmTop = 2117
          mmWidth = 195263
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape1: TppShape
          UserName = 'rpEmisTransfShape1'
          mmHeight = 14552
          mmLeft = 794
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape2: TppShape
          UserName = 'rpEmisTransfShape2'
          mmHeight = 7144
          mmLeft = 794
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'ppDBText13'
          AutoSize = True
          DataField = 'DATALANCFINAN'
          DataPipeline = pplEmisTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 11377
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 110331
          mmTop = 61648
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'ppLabel21'
          Caption = 'N.Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 61648
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12700
          mmTop = 61648
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'ppLabel24'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 65881
          mmTop = 61648
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 61648
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel1: TppLabel
          UserName = 'rpEmisTransfLabel1'
          Caption = 'Sub- Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 54240
          mmTop = 57944
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel2: TppLabel
          UserName = 'rpEmisTransfLabel2'
          Caption = 'Ativ./Proj.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 92340
          mmTop = 61648
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel4: TppLabel
          UserName = 'rpEmisTransfLabel4'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 3440
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel5: TppLabel
          UserName = 'rpEmisTransfLabel5'
          AutoSize = False
          Caption = 'Transferência de Fundo entre Contas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 27517
          mmTop = 3440
          mmWidth = 141817
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape4: TppShape
          UserName = 'rpEmisTransfShape4'
          mmHeight = 14552
          mmLeft = 169069
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape5: TppShape
          UserName = 'rpEmisTransfShape5'
          mmHeight = 7144
          mmLeft = 169069
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText2: TppDBText
          UserName = 'rpEmisTransfDBText2'
          AutoSize = True
          DataField = 'CODLANCFINANC'
          DataPipeline = pplEmisTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 3175
          mmLeft = 170392
          mmTop = 11377
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel3: TppLabel
          UserName = 'rpEmisTransfLabel3'
          AutoSize = False
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 169069
          mmTop = 3440
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel6: TppLabel
          UserName = 'rpEmisTransfLabel6'
          Caption = 'D/C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 61648
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine2: TppLine
          UserName = 'rpEmisTransfLine2'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 265
          mmTop = 66411
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel7: TppLabel
          UserName = 'rpEmisTransfLabel7'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 80698
          mmTop = 17992
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText4: TppDBText
          UserName = 'rpEmisTransfDBText4'
          AutoSize = True
          DataField = 'VALORLANCFINAN'
          DataPipeline = pplEmisTransf
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 4233
          mmLeft = 91811
          mmTop = 17992
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine3: TppLine
          UserName = 'rpEmisTransfLine3'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 265
          mmTop = 31750
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel15: TppLabel
          UserName = 'rpEmisTransfLabel15'
          AutoSize = False
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 32544
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfShape11: TppShape
          UserName = 'rpEmisTransfShape11'
          mmHeight = 11113
          mmLeft = 265
          mmTop = 46038
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLine1: TppLine
          UserName = 'rpEmisTransfLine1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10848
          mmLeft = 97896
          mmTop = 46038
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel14: TppLabel
          UserName = 'rpEmisTransfLabel14'
          AutoSize = False
          Caption = 'Saque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 46831
          mmWidth = 97896
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfLabel16: TppLabel
          UserName = 'rpEmisTransfLabel16'
          AutoSize = False
          Caption = 'Depósito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 98161
          mmTop = 46831
          mmWidth = 97896
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfMemo1: TppMemo
          OnPrint = rpEmisTransfMemo1Print
          UserName = 'rpEmisTransfMemo1'
          Caption = 'rpEmisTransfMemo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 8202
          mmLeft = 265
          mmTop = 22754
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpEmisTransfDBMemo1: TppDBMemo
          UserName = 'rpEmisTransfDBMemo1'
          CharWrap = True
          DataField = 'HISTORICO'
          DataPipeline = pplEmisTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 8202
          mmLeft = 265
          mmTop = 37306
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpEmisTransfDBText5: TppDBText
          UserName = 'rpEmisTransfDBText5'
          AutoSize = True
          DataField = 'DESCSAQUE'
          DataPipeline = pplEmisTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 52652
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpEmisTransfDBText6: TppDBText
          UserName = 'rpEmisTransfDBText6'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplEmisTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplEmisTransf'
          mmHeight = 3175
          mmLeft = 99748
          mmTop = 52123
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryContabilidade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA AS CONTAD,'
      '   PLACONTA AS CONTAC,'
      '   PLACONTA AS NOMECONTAD,'
      '   PLACONTA AS NOMECONTAC,'
      '   LACHIST1||'#39' '#39'||LACHIST2 AS HISTORICO,'
      '   LACVALOR ,'#39'ENTRADA'#39' AS ENTRADASAIDA,'
      '   (TO_DATE('#39'01/01/1999'#39','#39'DD/MM/YYYY'#39')) AS DATALANC,'
      '   (TO_DATE('#39'01/01/1999'#39','#39'DD/MM/YYYY'#39')) AS DATACONT,'
      '   (0) AS PLNPLANIL'
      'FROM'
      '   LANCAMENTO'
      'WHERE'
      '   (1=2)'
      ' '
      ' '
      ' ')
    UpdateObject = updContabilidade
    ValidateWithMask = True
    Left = 128
    Top = 240
  end
  object dsContabilidade: TwwDataSource
    DataSet = qryContabilidade
    Left = 128
    Top = 224
  end
  object pplContabilidade: TppBDEPipeline
    DataSource = dsContabilidade
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lContabilidade'
    Left = 128
    Top = 208
    object pplContabilidadeppField1: TppField
      FieldAlias = 'CONTAD'
      FieldName = 'CONTAD'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplContabilidadeppField2: TppField
      FieldAlias = 'CONTAC'
      FieldName = 'CONTAC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object pplContabilidadeppField3: TppField
      FieldAlias = 'NOMECONTAD'
      FieldName = 'NOMECONTAD'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object pplContabilidadeppField4: TppField
      FieldAlias = 'NOMECONTAC'
      FieldName = 'NOMECONTAC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object pplContabilidadeppField5: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 81
      DisplayWidth = 81
      Position = 4
    end
    object pplContabilidadeppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplContabilidadeppField7: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object pplContabilidadeppField8: TppField
      FieldAlias = 'DATALANC'
      FieldName = 'DATALANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContabilidadeppField9: TppField
      FieldAlias = 'DATACONT'
      FieldName = 'DATACONT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplContabilidadeppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpContabilidade: TppReport
    AutoStop = False
    DataPipeline = pplContabilidade
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    Left = 128
    Top = 192
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContabilidade'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Contabilizações Diárias '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 119592
        mmTop = 6879
        mmWidth = 48683
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel29'
        Caption = 'CM Soluções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 126736
        mmTop = 529
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = '27/08/1998 a 27/08/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 241830
        mmTop = 12435
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 227278
        mmTop = 12435
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = pplContabilidade
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3175
        mmLeft = 257969
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        AutoSize = True
        DataField = 'PLNPLANIL'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3175
        mmLeft = 16404
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'CONTAD'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        DataField = 'HISTORICO'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 0
        mmWidth = 89429
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        DataField = 'NOMECONTAD'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 58208
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'CONTAC'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'NOMECONTAC'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object rpContabilidadeDBText1: TppDBText
        UserName = 'rpContabilidadeDBText1'
        AutoSize = True
        DataField = 'DATACONT'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLabel33: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel33'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 275167
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1323
        mmWidth = 277019
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 276226
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
        mmLeft = 249503
        mmTop = 3175
        mmWidth = 25929
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object rpContabilidadeSubReport1: TppSubReport
        UserName = 'rpContabilidadeSubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplPrevisao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpContabilidadeChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplPrevisao
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 14000
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplPrevisao'
          object rpContabilidadeChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 15081
            mmPrintPosition = 0
            object rpContabilidadeChildReport1Shape1: TppShape
              UserName = 'rpContabilidadeChildReport1Shape1'
              mmHeight = 13229
              mmLeft = 265
              mmTop = 794
              mmWidth = 275696
              BandType = 4
            end
            object rpContabilidadeChildReport1Label1: TppLabel
              UserName = 'rpContabilidadeChildReport1Label1'
              Caption = 'Recebimentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 3175
              mmTop = 2910
              mmWidth = 34131
              BandType = 4
            end
            object rpContabilidadeChildReport1Label2: TppLabel
              UserName = 'rpContabilidadeChildReport1Label2'
              Caption = 'Pagamentos em Atraso:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 6085
              mmTop = 8202
              mmWidth = 35190
              BandType = 4
            end
            object rpContabilidadeChildReport1Label3: TppLabel
              UserName = 'rpContabilidadeChildReport1Label3'
              Caption = 'Recebimentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 103717
              mmTop = 2910
              mmWidth = 36248
              BandType = 4
            end
            object rpContabilidadeChildReport1Label4: TppLabel
              UserName = 'rpContabilidadeChildReport1Label4'
              Caption = 'Pagamentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 193146
              mmTop = 8202
              mmWidth = 31221
              BandType = 4
            end
            object rpContabilidadeChildReport1Label5: TppLabel
              UserName = 'rpContabilidadeChildReport1Label5'
              Caption = 'Recebimentos Futuros:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 190236
              mmTop = 2910
              mmWidth = 30956
              BandType = 4
            end
            object rpContabilidadeChildReport1Label6: TppLabel
              UserName = 'rpContabilidadeChildReport1Label6'
              Caption = 'Pagamentos para Hoje:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 106627
              mmTop = 8202
              mmWidth = 33338
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText1: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText1'
              AutoSize = True
              DataField = 'VALORRNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 44715
              mmTop = 2910
              mmWidth = 21167
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText2: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText2'
              AutoSize = True
              DataField = 'VALORPNHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 44979
              mmTop = 8202
              mmWidth = 20902
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText3: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText3'
              AutoSize = True
              DataField = 'VALORRHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 143140
              mmTop = 2910
              mmWidth = 19050
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText4: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText4'
              AutoSize = True
              DataField = 'VALORPHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 143934
              mmTop = 8202
              mmWidth = 18785
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText5: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText5'
              AutoSize = True
              DataField = 'VALORRMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 225955
              mmTop = 2910
              mmWidth = 21696
              BandType = 4
            end
            object rpContabilidadeChildReport1DBText6: TppDBText
              UserName = 'rpContabilidadeChildReport1DBText6'
              AutoSize = True
              DataField = 'VALORPMHOJE'
              DataPipeline = pplPrevisao
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPrevisao'
              mmHeight = 3175
              mmLeft = 226219
              mmTop = 8202
              mmWidth = 21431
              BandType = 4
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ENTRADASAIDA'
      DataPipeline = pplContabilidade
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContabilidade'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'ppShape4'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 275696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'ppDBText26'
          AutoSize = True
          DataField = 'ENTRADASAIDA'
          DataPipeline = pplContabilidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'ppLabel37'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 163777
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'Descrição Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 8731
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 17727
          mmTop = 8731
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'ppLabel40'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 32808
          mmTop = 8731
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'ppLabel41'
          Caption = 'Descrição Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 58208
          mmTop = 8731
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'ppLabel42'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 98161
          mmTop = 8731
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'ppLabel43'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 5292
          mmTop = 8731
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'ppLabel44'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 263261
          mmTop = 8731
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel45: TppLabel
          UserName = 'ppLabel45'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 236538
          mmTop = 1058
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object rpContabilidadeDBCalc1: TppDBCalc
          UserName = 'rpContabilidadeDBCalc1'
          AutoSize = True
          DataField = 'LACVALOR'
          DataPipeline = pplContabilidade
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3175
          mmLeft = 246857
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpContabilidadeGroup1: TppGroup
      BreakName = 'DATALANC'
      DataPipeline = pplContabilidade
      OutlineSettings.CreateNode = True
      UserName = 'rpContabilidadeGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContabilidade'
      object rpContabilidadeGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppDBText22: TppDBText
          UserName = 'ppDBText22'
          AutoSize = True
          DataField = 'DATALANC'
          DataPipeline = pplContabilidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3175
          mmLeft = 37306
          mmTop = 2910
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLabel1: TppLabel
          UserName = 'rpContabilidadeLabel1'
          Caption = 'Data do Financeiro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 10319
          mmTop = 2910
          mmWidth = 25665
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLine1: TppLine
          UserName = 'rpContabilidadeLine1'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 8467
          mmWidth = 275696
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLine2: TppLine
          UserName = 'rpContabilidadeLine2'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 794
          mmTop = 1323
          mmWidth = 275696
          BandType = 3
          GroupNo = 1
        end
      end
      object rpContabilidadeGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object updContabilidade: TUpdateSQL
    Left = 128
    Top = 256
  end
  object qryPrevisao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(U.VALORRMHOJE) AS VALORRMHOJE,'
      '   SUM(U.VALORPMHOJE) AS VALORPMHOJE,'
      '   SUM(U.VALORPHOJE) AS VALORPHOJE,'
      '   SUM(U.VALORRHOJE) AS VALORRHOJE,'
      '   SUM(U.VALORPNHOJE) AS VALORPNHOJE,'
      '   SUM(U.VALORRNHOJE) AS VALORRNHOJE'
      'FROM'
      '-- 1'
      '   (SELECT'
      
        '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRMHOJE' +
        ','
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 2'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPMHOJE' +
        ','
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 3'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 4'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 5'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPNHOJE' +
        ','
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 6'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:sDataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)) U'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
        Value = '29/06/1999'
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sDataRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptUnknown
      end>
  end
  object dsPrevisao: TwwDataSource
    DataSet = qryPrevisao
    Left = 280
    Top = 32
  end
  object pplPrevisao: TppBDEPipeline
    DataSource = dsPrevisao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lPrevisao'
    Left = 280
    Top = 8
    object pplPrevisaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRMHOJE'
      FieldName = 'VALORRMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplPrevisaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPMHOJE'
      FieldName = 'VALORPMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplPrevisaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPHOJE'
      FieldName = 'VALORPHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplPrevisaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRHOJE'
      FieldName = 'VALORRHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplPrevisaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPNHOJE'
      FieldName = 'VALORPNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplPrevisaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRNHOJE'
      FieldName = 'VALORRNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object qryFluxoReaAna: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.UNIDNEGOC, R.CODTIPRECDES, R.RECPAG,'
      '       R.CODCENTRORESPON, M.DATALANCFINAN, R.VALOR AS VALTOT,'
      '       DECODE(R.RECPAG,'#39'P'#39',(R.VALOR*-1),R.VALOR) AS VALOR,'
      '       M.HISTORICO AS HISTORICO,'
      '       '#39#39' AS RAZAOSOCIAL, M.CODLANCFINANC AS DOCUMENTO,'
      '       C.DESCRICAO AS DESCCONTA,'
      '       CR.NOME AS DESCCR, TD.DESCRICAO AS DESCTD,'
      '       UN.NOME AS DESCUN, M.CODLANCFINANC'
      'FROM RATEIOFINANC R, MOVIMFINANC M, PORTADORCONTA C,'
      '     CENTRESPON CR, TIPORECEBDESEMB TD, UNIDNEGOCIO UN'
      'WHERE'
      '   (M.DATALANCFINAN >= TO_DATE (:pDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '   (M.DATALANCFINAN <= TO_DATE (:pDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '   ((C.FLGGRAVAFLUXO = '#39'S'#39') OR (C.FLGGRAVAFLUXO IS NULL)) AND'
      '   (M.IDPESSOA = :pIdPessoa) AND'
      '   (M.CODLANCFINANC = R.CODLANCFINANC) AND'
      '   (M.CODPORTADOR = C.CODPORTADOR) AND'
      '   (R.CODCENTRORESPON = CR.CODCENTRORESPON) AND'
      '   (R.IDPESSOA = CR.IDPESSOA) AND'
      '   (R.CODTIPRECDES = TD.CODTIPRECDES) AND'
      '   (R.RECPAG       = TD.RECPAG) AND'
      '   (R.IDPESSOA     = TD.IDPESSOA) AND'
      '   (R.UNIDNEGOC    = UN.UNIDNEGOC) AND'
      '   (R.IDPESSOA     = UN.IDPESSOA)'
      
        'ORDER BY R.CODCENTRORESPON, R.RECPAG, R.CODTIPRECDES, M.DATALANC' +
        'FINAN, M.CODLANCFINANC'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'pDataIni'
        ParamType = ptUnknown
        Value = '01/01/1999'
      end
      item
        DataType = ftString
        Name = 'pDataFim'
        ParamType = ptUnknown
        Value = '31/01/2000'
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object dsFluxoReaAna: TwwDataSource
    DataSet = qryFluxoReaAna
    Left = 48
    Top = 352
  end
  object pplFluxoReaAna: TppBDEPipeline
    DataSource = dsFluxoReaAna
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lFluxoReaAna'
    Left = 48
    Top = 336
  end
  object rpFluxoReaAna: TppReport
    AutoStop = False
    DataPipeline = pplFluxoReaAna
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 48
    Top = 320
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplFluxoReaAna'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Suporte ao Fluxo Realizado no Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 59002
        mmTop = 10848
        mmWidth = 79111
        BandType = 0
      end
      object ppLabel7: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel7'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 529
        mmTop = 3704
        mmWidth = 196586
        BandType = 0
      end
      object rpFluxoReaAnaLine1: TppLine
        UserName = 'rpFluxoReaAnaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 25135
        mmWidth = 197300
        BandType = 0
      end
      object rpFluxoReaAnaLine3: TppLine
        UserName = 'rpFluxoReaAnaLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object rpFluxoReaAnaLabel3: TppLabel
        UserName = 'rpFluxoReaAnaLabel3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object rpFluxoReaAnaLabel4: TppLabel
        UserName = 'rpFluxoReaAnaLabel4'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 20902
        mmWidth = 12965
        BandType = 0
      end
      object rpFluxoReaAnaLabel5: TppLabel
        UserName = 'rpFluxoReaAnaLabel5'
        Caption = 'Código Lanc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 20902
        mmWidth = 18785
        BandType = 0
      end
      object rpFluxoReaAnaLabel6: TppLabel
        UserName = 'rpFluxoReaAnaLabel6'
        Caption = 'Atividade/Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 20902
        mmWidth = 24871
        BandType = 0
      end
      object rpFluxoReaAnaLabel7: TppLabel
        UserName = 'rpFluxoReaAnaLabel7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 188913
        mmTop = 20902
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpFluxoReaAnaDBText5: TppDBText
        UserName = 'rpFluxoReaAnaDBText5'
        AutoSize = True
        DataField = 'DATALANCFINAN'
        DataPipeline = pplFluxoReaAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object rpFluxoReaAnaDBText6: TppDBText
        UserName = 'rpFluxoReaAnaDBText6'
        DataField = 'HISTORICO'
        DataPipeline = pplFluxoReaAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 265
        mmWidth = 82021
        BandType = 4
      end
      object rpFluxoReaAnaDBText7: TppDBText
        UserName = 'rpFluxoReaAnaDBText7'
        DataField = 'DESCUN'
        DataPipeline = pplFluxoReaAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 265
        mmWidth = 43392
        BandType = 4
      end
      object rpFluxoReaAnaDBText8: TppDBText
        UserName = 'rpFluxoReaAnaDBText8'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplFluxoReaAna
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 3175
        mmLeft = 186267
        mmTop = 265
        mmWidth = 9525
        BandType = 4
      end
      object rpFluxoReaAnaDBText9: TppDBText
        UserName = 'rpFluxoReaAnaDBText9'
        DataField = 'DOCUMENTO'
        DataPipeline = pplFluxoReaAna
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel14'
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
        mmTop = 5292
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
        mmTop = 5292
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 5292
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpFluxoReaAnaSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpFluxoReaAnaLabel10: TppLabel
        UserName = 'rpFluxoReaAnaLabel10'
        Caption = 'Total do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 138907
        mmTop = 1058
        mmWidth = 29104
        BandType = 7
      end
      object rpFluxoReaAnaDBCalc3: TppDBCalc
        UserName = 'rpFluxoReaAnaDBCalc3'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplFluxoReaAna
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoReaAna'
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 794
        mmWidth = 25665
        BandType = 7
      end
    end
    object rpFluxoReaAnaGroup1: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = pplFluxoReaAna
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpFluxoReaAnaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFluxoReaAna'
      object rpFluxoReaAnaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpFluxoReaAnaLabel1: TppLabel
          UserName = 'rpFluxoReaAnaLabel1'
          Caption = 'Centro de Responsabilidade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 794
          mmWidth = 49477
          BandType = 3
          GroupNo = 0
        end
        object rpFluxoReaAnaDBText1: TppDBText
          UserName = 'rpFluxoReaAnaDBText1'
          AutoSize = True
          DataField = 'CODCENTRORESPON'
          DataPipeline = pplFluxoReaAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 4233
          mmLeft = 59531
          mmTop = 794
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object rpFluxoReaAnaDBText2: TppDBText
          UserName = 'rpFluxoReaAnaDBText2'
          AutoSize = True
          DataField = 'DESCCR'
          DataPipeline = pplFluxoReaAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 4233
          mmLeft = 88371
          mmTop = 794
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFluxoReaAnaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpFluxoReaAnaDBCalc2: TppDBCalc
          UserName = 'rpFluxoReaAnaDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplFluxoReaAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpFluxoReaAnaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 4233
          mmLeft = 170127
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLabel9: TppLabel
          UserName = 'rpFluxoReaAnaLabel9'
          Caption = 'Total do Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 104775
          mmTop = 1323
          mmWidth = 63236
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLine7: TppLine
          UserName = 'rpFluxoReaAnaLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLine6: TppLine
          UserName = 'rpFluxoReaAnaLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpFluxoReaAnaGroup2: TppGroup
      BreakName = 'CODTIPRECDES'
      DataPipeline = pplFluxoReaAna
      OutlineSettings.CreateNode = True
      UserName = 'rpFluxoReaAnaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFluxoReaAna'
      object rpFluxoReaAnaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpFluxoReaAnaLine4: TppLine
          UserName = 'rpFluxoReaAnaLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaLabel2: TppLabel
          UserName = 'rpFluxoReaAnaLabel2'
          Caption = 'Tipo de Recebimento/Desembolso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 2381
          mmWidth = 51065
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaDBText3: TppDBText
          UserName = 'rpFluxoReaAnaDBText3'
          AutoSize = True
          DataField = 'CODTIPRECDES'
          DataPipeline = pplFluxoReaAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 3175
          mmLeft = 59531
          mmTop = 2117
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaDBText4: TppDBText
          UserName = 'rpFluxoReaAnaDBText4'
          AutoSize = True
          DataField = 'DESCTD'
          DataPipeline = pplFluxoReaAna
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 3175
          mmLeft = 88371
          mmTop = 2381
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaLine2: TppLine
          UserName = 'rpFluxoReaAnaLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpFluxoReaAnaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpFluxoReaAnaLabel8: TppLabel
          UserName = 'rpFluxoReaAnaLabel8'
          Caption = 'Total do Tipo de Recebimento/Desembolso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 1852
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object rpFluxoReaAnaDBCalc1: TppDBCalc
          UserName = 'rpFluxoReaAnaDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplFluxoReaAna
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpFluxoReaAnaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFluxoReaAna'
          mmHeight = 3175
          mmLeft = 175684
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object rpFluxoReaAnaLine5: TppLine
          UserName = 'rpFluxoReaAnaLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryOrcxRea: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(FLGINDICARECDES,'#39'N'#39','#39'X'#39','#39'Recebimentos - Pagamentos'#39') AS' +
        ' GR,'
      
        '  DECODE(FLGINDICARECDES,'#39'N'#39','#39'3. Outras Entradas e Saídas'#39',DECOD' +
        'E(RECPAG, '#39'R'#39', '#39'1. Recebimentos'#39', '#39'2. Pagamentos'#39')) AS RP,'
      
        '  ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, 0 AS VALORREA, 0 AS ' +
        'VALORORC,'
      
        '  0 AS DIFERENCA,0 AS PERC, 0 AS VALORREASIN, 0 AS VALORORCSIN, ' +
        '0 AS DIFERENCASIN,'
      '  0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  (1=2)'
      'ORDER BY RECPAG DESC, CODTIPRECDES'
      ''
      ' ')
    UpdateObject = updOrcxRea
    ValidateWithMask = True
    Left = 144
    Top = 368
  end
  object dsOrcxRea: TwwDataSource
    DataSet = qryOrcxRea
    Left = 144
    Top = 352
  end
  object pplOrcxRea: TppBDEPipeline
    DataSource = dsOrcxRea
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lOrcxRea'
    Left = 144
    Top = 336
  end
  object rpOrcxRea: TppReport
    AutoStop = False
    DataPipeline = pplOrcxRea
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMMThousandths
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 144
    Top = 320
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrcxRea'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
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
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17992
        mmWidth = 197300
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
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpOrcxReaLabel1: TppLabel
        UserName = 'rpOrcxReaLabel1'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 23813
        mmWidth = 14288
        BandType = 0
      end
      object rpOrcxReaLabel2: TppLabel
        UserName = 'rpOrcxReaLabel2'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 23813
        mmWidth = 13758
        BandType = 0
      end
      object rpOrcxReaLabel3: TppLabel
        UserName = 'rpOrcxReaLabel3'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 23813
        mmWidth = 10319
        BandType = 0
      end
      object rpOrcxReaLabel4: TppLabel
        UserName = 'rpOrcxReaLabel4'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 18785
        mmWidth = 13758
        BandType = 0
      end
      object rpOrcxReaLabel5: TppLabel
        UserName = 'rpOrcxReaLabel5'
        Caption = 'em Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 23813
        mmWidth = 13229
        BandType = 0
      end
      object rpOrcxReaLabel6: TppLabel
        UserName = 'rpOrcxReaLabel6'
        Caption = 'em %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 23813
        mmWidth = 7938
        BandType = 0
      end
      object rpOrcxReaLine2: TppLine
        UserName = 'rpOrcxReaLine2'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpOrcxReaLine3: TppLine
        UserName = 'rpOrcxReaLine3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 177800
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      BeforeGenerate = ppDetailBand8BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpOrcxReaDBText2: TppDBText
        UserName = 'rpOrcxReaDBText2'
        AutoSize = True
        DataField = 'VALORREA'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object rpOrcxReaDBText3: TppDBText
        UserName = 'rpOrcxReaDBText3'
        AutoSize = True
        DataField = 'VALORORC'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpOrcxReaDBText4: TppDBText
        UserName = 'rpOrcxReaDBText4'
        AutoSize = True
        DataField = 'DIFERENCA'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object rpOrcxReaDBText5: TppDBText
        UserName = 'rpOrcxReaDBText5'
        AutoSize = True
        DataField = 'PERC'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 529
        mmWidth = 7673
        BandType = 4
      end
      object rpOrcxReaDBText1: TppDBText
        UserName = 'rpOrcxReaDBText1'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = pplOrcxRea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel15: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel15'
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpOrcxReaSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpOrcxReaLabel8: TppLabel
        UserName = 'rpOrcxReaLabel8'
        Caption = 'ENTRADAS - SAIDAS DO PERÍODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 2381
        mmWidth = 57415
        BandType = 7
      end
      object rpOrcxReaDBCalc4: TppDBCalc
        UserName = 'rpOrcxReaDBCalc4'
        AutoSize = True
        DataField = 'VALORORCSIN'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 1852
        mmWidth = 39423
        BandType = 7
      end
      object rpOrcxReaDBCalc5: TppDBCalc
        UserName = 'rpOrcxReaDBCalc5'
        AutoSize = True
        DataField = 'VALORREASIN'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 1852
        mmWidth = 39158
        BandType = 7
      end
      object rpOrcxReaDBCalc6: TppDBCalc
        UserName = 'rpOrcxReaDBCalc6'
        AutoSize = True
        DataField = 'DIFERENCASIN'
        DataPipeline = pplOrcxRea
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 1852
        mmWidth = 39952
        BandType = 7
      end
      object rpOrcxReaLine4: TppLine
        UserName = 'rpOrcxReaLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object rpOrcxReaLine5: TppLine
        UserName = 'rpOrcxReaLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197300
        BandType = 7
      end
      object rpOrcxReaLabel12: TppLabel
        OnPrint = rpOrcxReaLabel12Print
        UserName = 'rpOrcxReaLabel12'
        Caption = 'rpOrcxReaLabel12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 1852
        mmWidth = 31221
        BandType = 7
      end
      object rpOrcxReaDBCalc15: TppDBCalc
        UserName = 'rpOrcxReaDBCalc15'
        AutoSize = True
        DataField = 'VALORREASIN'
        DataPipeline = pplOrcxRea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 6879
        mmWidth = 29633
        BandType = 7
      end
      object rpOrcxReaDBCalc14: TppDBCalc
        UserName = 'rpOrcxReaDBCalc14'
        AutoSize = True
        DataField = 'VALORORCSIN'
        DataPipeline = pplOrcxRea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplOrcxRea'
        mmHeight = 3175
        mmLeft = 26988
        mmTop = 6350
        mmWidth = 30163
        BandType = 7
      end
    end
    object rpOrcxReaGroup1: TppGroup
      BreakName = 'GR'
      DataPipeline = pplOrcxRea
      OutlineSettings.CreateNode = True
      UserName = 'rpOrcxReaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxRea'
      object rpOrcxReaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object rpOrcxReaLine7: TppLine
          UserName = 'rpOrcxReaLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 2910
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpOrcxReaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpOrcxReaLabel10: TppLabel
          UserName = 'rpOrcxReaLabel10'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6615
          mmTop = 1852
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBText8: TppDBText
          UserName = 'rpOrcxReaDBText8'
          AutoSize = True
          DataField = 'GR'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 1852
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaLabel11: TppLabel
          OnPrint = rpOrcxReaLabel11Print
          UserName = 'rpOrcxReaLabel11'
          Caption = 'rpOrcxReaLabel11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 161396
          mmTop = 1852
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBCalc7: TppDBCalc
          UserName = 'rpOrcxReaDBCalc7'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 1852
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBCalc8: TppDBCalc
          UserName = 'rpOrcxReaDBCalc8'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 100542
          mmTop = 1852
          mmWidth = 39158
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBCalc9: TppDBCalc
          UserName = 'rpOrcxReaDBCalc9'
          AutoSize = True
          DataField = 'DIFERENCASIN'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 125677
          mmTop = 1852
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBCalc12: TppDBCalc
          UserName = 'rpOrcxReaDBCalc12'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 3175
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaDBCalc13: TppDBCalc
          UserName = 'rpOrcxReaDBCalc13'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 3175
          mmLeft = 43921
          mmTop = 1588
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOrcxReaGroup2: TppGroup
      BreakName = 'RP'
      DataPipeline = pplOrcxRea
      OutlineSettings.CreateNode = True
      UserName = 'rpOrcxReaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxRea'
      object rpOrcxReaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpOrcxReaDBText6: TppDBText
          UserName = 'rpOrcxReaDBText6'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 19050
          mmTop = 1852
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
        object rpOrcxReaLine1: TppLine
          UserName = 'rpOrcxReaLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpOrcxReaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object rpOrcxReaLine6: TppLine
          UserName = 'rpOrcxReaLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaLabel7: TppLabel
          UserName = 'rpOrcxReaLabel7'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 1588
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBText7: TppDBText
          UserName = 'rpOrcxReaDBText7'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 20108
          mmTop = 1588
          mmWidth = 5027
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBCalc1: TppDBCalc
          UserName = 'rpOrcxReaDBCalc1'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 66146
          mmTop = 1588
          mmWidth = 41010
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBCalc2: TppDBCalc
          UserName = 'rpOrcxReaDBCalc2'
          AutoSize = True
          DataField = 'VALORREAANA'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 99219
          mmTop = 1588
          mmWidth = 40481
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBCalc3: TppDBCalc
          UserName = 'rpOrcxReaDBCalc3'
          AutoSize = True
          DataField = 'DIFERENCAANA'
          DataPipeline = pplOrcxRea
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 4233
          mmLeft = 124354
          mmTop = 1588
          mmWidth = 41275
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaLabel9: TppLabel
          OnPrint = rpOrcxReaLabel9Print
          UserName = 'rpOrcxReaLabel9'
          Caption = 'rpOrcxReaLabel9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 1588
          mmWidth = 29369
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBCalc10: TppDBCalc
          UserName = 'rpOrcxReaDBCalc10'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 3175
          mmLeft = 26723
          mmTop = 2117
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaDBCalc11: TppDBCalc
          UserName = 'rpOrcxReaDBCalc11'
          AutoSize = True
          DataField = 'VALORREAANA'
          DataPipeline = pplOrcxRea
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxRea'
          mmHeight = 3175
          mmLeft = 45508
          mmTop = 1588
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updOrcxRea: TUpdateSQL
    Left = 296
    Top = 192
  end
  object qryDispFinanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       D.CODDOCUMENTO,'
      
        '       (D.DATAPROGRAMADA+DECODE(P.DMAIS,NULL,0,P.DMAIS)) AS DATA' +
        'CFLOAT,'
      '       D.DATAPROGRAMADA,'
      '       D.DATAVENCTO,'
      '       S.SALDO,'
      '       PE.RAZAOSOCIAL,'
      '       L.DATALANCTO,'
      '       D.NODOCUMENTO||'#39'/'#39'||D.COMPLDOCUMENTO AS NUMDOC,'
      '       D.NUMAPGR,'
      '       D.FLGCONFIRMARECPAG'
      'FROM'
      
        '     (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,VALOR*-1)' +
        ') AS SALDO'
      '      FROM LANCTODOCUM'
      '      GROUP BY CODDOCUMENTO) S,'
      '      PESSOA PE,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      PORTADORFORMA P,'
      '      PORTADORCONTA C'
      'WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '      ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACAO' +
        ' = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '      (D.FLGCONFIRMARECPAG = '#39'S'#39')  AND'
      '      (D.IDPESSOA = :pIDPESSOA) AND'
      '      (D.IDFORCLI = PE.IDPESSOA) AND'
      '      (D.DATAPROGRAMADA = TO_DATE(:pDATAREF,'#39'DD/MM/YYYY'#39')) AND '
      '      (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '      (P.CODPORTADOR = C.CODPORTADOR(+))'
      'ORDER BY D.DATAPROGRAMADA'
      ' ')
    ValidateWithMask = True
    Left = 296
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'pDATAREF'
        ParamType = ptUnknown
      end>
  end
  object dsDispFinanc: TwwDataSource
    DataSet = qryDispFinanc
    Left = 296
    Top = 160
  end
  object pplDispFinanc: TppBDEPipeline
    DataSource = dsDispFinanc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDispFinanc'
    Left = 296
    Top = 144
    object pplDispFinancppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplDispFinancppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDispFinancppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDispFinancppField4: TppField
      FieldAlias = 'DATACFLOAT'
      FieldName = 'DATACFLOAT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplDispFinancppField5: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplDispFinancppField6: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplDispFinancppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDispFinancppField8: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplDispFinancppField9: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplDispFinancppField10: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 44
      DisplayWidth = 44
      Position = 9
    end
    object pplDispFinancppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDispFinancppField12: TppField
      FieldAlias = 'FLGCONFIRMARECPAG'
      FieldName = 'FLGCONFIRMARECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
  end
  object rpDispFinanc: TppReport
    AutoStop = False
    DataPipeline = pplDispFinanc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    Left = 296
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDispFinanc'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Documentos Marcados para serem Pagos e Recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 86784
        mmTop = 10848
        mmWidth = 110596
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
        mmLeft = 43921
        mmTop = 3704
        mmWidth = 196586
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 25135
        mmWidth = 284300
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 20902
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Cliente / Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 20902
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 105834
        mmTop = 20902
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 273051
        mmTop = 20902
        mmWidth = 7673
        BandType = 0
      end
      object rpDispFinancLabel1: TppLabel
        UserName = 'rpDispFinancLabel1'
        Caption = 'O.B.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 20902
        mmWidth = 8202
        BandType = 0
      end
      object rpDispFinancLabel2: TppLabel
        UserName = 'rpDispFinancLabel2'
        Caption = 'Conta Bancária/Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 199761
        mmTop = 20902
        mmWidth = 29898
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplDispFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplDispFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 0
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = pplDispFinanc
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3175
        mmLeft = 271198
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'NUMDOC'
        DataPipeline = pplDispFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object rpDispFinancDBText2: TppDBText
        UserName = 'rpDispFinancDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = pplDispFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3704
        mmLeft = 199761
        mmTop = 0
        mmWidth = 54240
        BandType = 4
      end
      object rpDispFinancObs: TppLabel
        OnPrint = rpDispFinancObsPrint
        UserName = 'rpDispFinancObs'
        AutoSize = False
        Caption = 'rpDispFinancObs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 0
        mmWidth = 74083
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel32'
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
        mmTop = 5292
        mmWidth = 278078
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 284300
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
        mmTop = 5292
        mmWidth = 277813
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
        mmLeft = 250825
        mmTop = 5292
        mmWidth = 27252
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object rpDispFinancLabel3: TppLabel
        UserName = 'rpDispFinancLabel3'
        Caption = 'Saldo do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 1323
        mmWidth = 25400
        BandType = 7
      end
      object rpDispFinancDBCalc1: TppDBCalc
        UserName = 'rpDispFinancDBCalc1'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = pplDispFinanc
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDispFinanc'
        mmHeight = 3175
        mmLeft = 261409
        mmTop = 1323
        mmWidth = 19315
        BandType = 7
      end
    end
  end
  object pplOrcxReaCR: TppBDEPipeline
    DataSource = dsOrcxReaCR
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lOrcxReaCR'
    Left = 408
    Top = 184
    object pplOrcxReaCRppField1: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplOrcxReaCRppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pplOrcxReaCRppField3: TppField
      FieldAlias = 'GR'
      FieldName = 'GR'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object pplOrcxReaCRppField4: TppField
      FieldAlias = 'RP'
      FieldName = 'RP'
      FieldLength = 27
      DisplayWidth = 27
      Position = 3
    end
    object pplOrcxReaCRppField5: TppField
      FieldAlias = 'ANASINT'
      FieldName = 'ANASINT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplOrcxReaCRppField6: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplOrcxReaCRppField7: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object pplOrcxReaCRppField8: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 7
    end
    object pplOrcxReaCRppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREA'
      FieldName = 'VALORREA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplOrcxReaCRppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORC'
      FieldName = 'VALORORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplOrcxReaCRppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplOrcxReaCRppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERC'
      FieldName = 'PERC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplOrcxReaCRppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREASIN'
      FieldName = 'VALORREASIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplOrcxReaCRppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORCSIN'
      FieldName = 'VALORORCSIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplOrcxReaCRppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCASIN'
      FieldName = 'DIFERENCASIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplOrcxReaCRppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORREAANA'
      FieldName = 'VALORREAANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplOrcxReaCRppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORCANA'
      FieldName = 'VALORORCANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplOrcxReaCRppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCAANA'
      FieldName = 'DIFERENCAANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
  end
  object rpOrcxReaCR: TppReport
    AutoStop = False
    DataPipeline = pplOrcxReaCR
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMMThousandths
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 408
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrcxReaCR'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
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
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17992
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel34: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel34'
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
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 23813
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 23813
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'ppLabel46'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 23813
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'ppLabel47'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 18785
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'em Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 23813
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'em %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 23813
        mmWidth = 7938
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 177800
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpOrcxReaCRDBText4: TppDBText
        UserName = 'rpOrcxReaCRDBText4'
        AutoSize = True
        DataField = 'VALORREA'
        DataPipeline = pplOrcxReaCR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxReaCR'
        mmHeight = 3175
        mmLeft = 124354
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object rpOrcxReaCRDBText3: TppDBText
        UserName = 'rpOrcxReaCRDBText3'
        AutoSize = True
        DataField = 'VALORORC'
        DataPipeline = pplOrcxReaCR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxReaCR'
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpOrcxReaCRDBText5: TppDBText
        UserName = 'rpOrcxReaCRDBText5'
        AutoSize = True
        DataField = 'DIFERENCA'
        DataPipeline = pplOrcxReaCR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxReaCR'
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object rpOrcxReaCRDBText6: TppDBText
        UserName = 'rpOrcxReaCRDBText6'
        AutoSize = True
        DataField = 'PERC'
        DataPipeline = pplOrcxReaCR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrcxReaCR'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 529
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = pplOrcxReaCR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrcxReaCR'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel50'
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
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpOrcxReaCRGroup1: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = pplOrcxReaCR
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'rpOrcxReaCRGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxReaCR'
      object rpOrcxReaCRGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpOrcxReaCRLabel1: TppLabel
          UserName = 'rpOrcxReaCRLabel1'
          Caption = 'Centro de Responsabilidade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 3704
          mmTop = 2117
          mmWidth = 60061
          BandType = 3
          GroupNo = 0
        end
        object rpOrcxReaCRDBText1: TppDBText
          UserName = 'rpOrcxReaCRDBText1'
          AutoSize = True
          DataField = 'CODCENTRORESPON'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 5292
          mmLeft = 65617
          mmTop = 2117
          mmWidth = 45244
          BandType = 3
          GroupNo = 0
        end
        object rpOrcxReaCRDBText2: TppDBText
          UserName = 'rpOrcxReaCRDBText2'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 5292
          mmLeft = 112977
          mmTop = 2117
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpOrcxReaCRLine1: TppLine
          UserName = 'rpOrcxReaCRLine1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpOrcxReaCRGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLine19: TppLine
          UserName = 'ppLine19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'ppLine20'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'ppLabel51'
          Caption = 'ENTRADAS - SAIDAS DO PERÍODO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 1588
          mmWidth = 57415
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaCRGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 16404
          mmTop = 2910
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOrcxReaCRGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 47096
          mmTop = 2381
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc7: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc7'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaCRGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 1588
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc8: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc8'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaCRGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 100542
          mmTop = 1588
          mmWidth = 39158
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc9: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc9'
          AutoSize = True
          DataField = 'DIFERENCASIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpOrcxReaCRGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 125677
          mmTop = 1588
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRLabel12: TppLabel
          OnPrint = rpOrcxReaCRLabel12Print
          UserName = 'rpOrcxReaCRLabel12'
          Caption = 'rpOrcxReaCRLabel12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 1588
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'GR'
      DataPipeline = pplOrcxReaCR
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxReaCR'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine21: TppLine
          UserName = 'ppLine21'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel53: TppLabel
          UserName = 'ppLabel53'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6615
          mmTop = 1852
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'ppDBText24'
          AutoSize = True
          DataField = 'GR'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 1852
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRLabel11: TppLabel
          OnPrint = rpOrcxReaCRLabel11Print
          UserName = 'rpOrcxReaCRLabel11'
          Caption = 'rpOrcxReaCRLabel11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 1852
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc4: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc4'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 1852
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc5: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc5'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 100542
          mmTop = 1852
          mmWidth = 39158
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxReaCRDBCalc6: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc6'
          AutoSize = True
          DataField = 'DIFERENCASIN'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 125677
          mmTop = 1852
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          AutoSize = True
          DataField = 'VALORREASIN'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 43921
          mmTop = 1588
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'RP'
      DataPipeline = pplOrcxReaCR
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrcxReaCR'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText25: TppDBText
          UserName = 'ppDBText25'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 19050
          mmTop = 1852
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
        object ppLine22: TppLine
          UserName = 'ppLine22'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine23: TppLine
          UserName = 'ppLine23'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 1588
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBText27: TppDBText
          UserName = 'ppDBText27'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 20108
          mmTop = 1588
          mmWidth = 5027
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaCRDBCalc1: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc1'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 66146
          mmTop = 1588
          mmWidth = 41010
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaCRDBCalc2: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc2'
          AutoSize = True
          DataField = 'VALORREAANA'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 99219
          mmTop = 1588
          mmWidth = 40481
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaCRDBCalc3: TppDBCalc
          UserName = 'rpOrcxReaCRDBCalc3'
          AutoSize = True
          DataField = 'DIFERENCAANA'
          DataPipeline = pplOrcxReaCR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 4233
          mmLeft = 124354
          mmTop = 1588
          mmWidth = 41275
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxReaCRLabel9: TppLabel
          OnPrint = rpOrcxReaCRLabel9Print
          UserName = 'rpOrcxReaCRLabel9'
          Caption = 'rpOrcxReaCRLabel9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 159015
          mmTop = 1588
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 26723
          mmTop = 2117
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc15'
          AutoSize = True
          DataField = 'VALORREAANA'
          DataPipeline = pplOrcxReaCR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'pplOrcxReaCR'
          mmHeight = 3175
          mmLeft = 45508
          mmTop = 1588
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryOrcxReaCR: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.CODCENTRORESPON, C.NOME,'
      
        '  DECODE(T.FLGINDICARECDES,'#39'N'#39','#39'X'#39','#39'Recebimentos - Pagamentos'#39') ' +
        'AS GR,'
      '  DECODE(T.FLGINDICARECDES,'#39'N'#39','#39'3. Outras Entradas e Saídas'#39','
      
        '  DECODE(T.RECPAG, '#39'R'#39', '#39'1. Recebimentos'#39', '#39'2. Pagamentos'#39')) AS ' +
        'RP,'
      '  T.ANASINT, T.RECPAG, T.CODTIPRECDES, T.DESCRICAO,'
      '  0 AS VALORREA, 0 AS VALORORC, 0 AS DIFERENCA,0 AS PERC,'
      '  0 AS VALORREASIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,'
      '  0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA'
      'FROM'
      '  TIPORECEBDESEMB T,'
      '  CENTRESPON C'
      'WHERE'
      '  (1=2)'
      'ORDER BY C.CODCENTRORESPON,'
      '         T.RECPAG DESC,'
      '         T.CODTIPRECDES'
      ''
      ' ')
    UpdateObject = updOrcxReaCR
    ValidateWithMask = True
    Left = 408
    Top = 168
  end
  object dsOrcxReaCR: TwwDataSource
    DataSet = qryOrcxReaCR
    Left = 408
    Top = 152
  end
  object updOrcxReaCR: TUpdateSQL
    Left = 296
    Top = 336
  end
  object qryFluxoReaAnaOri: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.UNIDNEGOC, R.CODTIPRECDES, R.RECPAG,'
      '       R.CODCENTRORESPON, M.DATALANCFINAN, R.VALOR AS VALTOT,'
      
        '       DECODE(CPR.VALOR, NULL, DECODE(R.RECPAG,'#39'P'#39',(R.VALOR*-1),' +
        'R.VALOR), (CPR.VALOR*R.VALOR)) AS VALOR,'
      '       DECODE(CPR.HISTORICOCOMPL,NULL,M.HISTORICO) AS HISTORICO,'
      '       CPR.RAZAOSOCIAL, CPR.DOCUMENTO,'
      '       C.DESCRICAO AS DESCCONTA,'
      '       CR.NOME AS DESCCR, TD.DESCRICAO AS DESCTD,'
      '       UN.NOME AS DESCUN, M.CODLANCFINANC'
      'FROM RATEIOFINANC R, MOVIMFINANC M, PORTADORCONTA C,'
      '     CENTRESPON CR, TIPORECEBDESEMB TD, UNIDNEGOCIO UN,'
      
        '     (SELECT RP.CODLANCFINANC, DECODE(LD.DEBCRE,'#39'C'#39',DECODE(TOT.V' +
        'ALTOT,0,0,(LD.VALOR/TOT.VALTOT)),DECODE(TOT.VALTOT,0,0,((LD.VALO' +
        'R/TOT.VALTOT)*-1))) AS VALOR,'
      '             LO.HISTORICOCOMPL, LO.RAZAOSOCIAL, LO.DOCUMENTO'
      '      FROM LANCTODOCUM LD, RECBTOPAGTO RP,'
      
        '           (SELECT RP.CODLANCFINANC, SUM(DECODE(LD.DEBCRE,'#39'C'#39',LD' +
        '.VALOR,(LD.VALOR*-1)))  AS VALTOT'
      '            FROM LANCTODOCUM LD, RECBTOPAGTO RP'
      '            WHERE (LD.CODDOCUMENTO = RP.CODDOCUMENTO) AND'
      '                  (LD.NUMLANCTO = RP.NUMLANCTO)'
      '            GROUP BY RP.CODLANCFINANC) TOT,'
      
        '           (SELECT D.CODDOCUMENTO, P.RAZAOSOCIAL, LD.HISTORICOCO' +
        'MPL,'
      
        '                   D.NODOCUMENTO||'#39'/'#39'||D.COMPLDOCUMENTO AS DOCUM' +
        'ENTO'
      '            FROM DOCUMENTO D, LANCTODOCUM LD, PESSOA P'
      '            WHERE (D.CODDOCUMENTO = LD.CODDOCUMENTO) AND'
      '                  (D.OPERACAO = LD.OPERACAO) AND'
      '                  (P.IDPESSOA = D.IDFORCLI)) LO'
      '      WHERE (LO.CODDOCUMENTO = LD.CODDOCUMENTO) AND'
      '            (TOT.CODLANCFINANC = RP.CODLANCFINANC) AND'
      '            (LD.CODDOCUMENTO = RP.CODDOCUMENTO) AND'
      '            (LD.NUMLANCTO = RP.NUMLANCTO)) CPR'
      'WHERE'
      '   (M.DATALANCFINAN >= TO_DATE (:pDataIni,'#39'DD/MM/YYYY'#39')) AND'
      '   (M.DATALANCFINAN <= TO_DATE (:pDataFim,'#39'DD/MM/YYYY'#39')) AND'
      '   ((C.FLGGRAVAFLUXO = '#39'S'#39') OR (C.FLGGRAVAFLUXO IS NULL)) AND'
      '   (M.IDPESSOA = :pIdPessoa) AND'
      '   (M.CODLANCFINANC = R.CODLANCFINANC) AND'
      '   (M.CODPORTADOR = C.CODPORTADOR) AND'
      '   (R.CODCENTRORESPON = CR.CODCENTRORESPON) AND'
      '   (R.IDPESSOA = CR.IDPESSOA) AND'
      '   (R.CODTIPRECDES = TD.CODTIPRECDES) AND'
      '   (R.RECPAG       = TD.RECPAG) AND'
      '   (R.IDPESSOA     = TD.IDPESSOA) AND'
      '   (R.UNIDNEGOC    = UN.UNIDNEGOC) AND'
      '   (R.IDPESSOA     = UN.IDPESSOA) AND'
      '   (CPR.CODLANCFINANC(+) = M.CODLANCFINANC)'
      
        'ORDER BY R.CODCENTRORESPON, R.RECPAG, R.CODTIPRECDES, M.DATALANC' +
        'FINAN, M.CODLANCFINANC'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'pDataIni'
        ParamType = ptUnknown
        Value = '01/01/1999'
      end
      item
        DataType = ftString
        Name = 'pDataFim'
        ParamType = ptUnknown
        Value = '31/01/2000'
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object Extenso: TExtensoCM
    TamanhoLinha = 0
    Idioma = iePortugues
    CompletaExtenso = False
    Left = 480
    Top = 8
  end
  object qryOrcxPrevisto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(FLGINDICARECDES,'#39'N'#39','#39'2. Outras Entradas - Outras Saídas' +
        #39','#39'1. Recebimentos - Pagamentos'#39') AS GR,'
      '  DECODE(FLGINDICARECDES,'#39'N'#39','
      
        '             DECODE(RECPAG, '#39'R'#39', '#39'2.1. Outras Entradas'#39', '#39'2.2. O' +
        'utras Saídas'#39'),'
      
        '             DECODE(RECPAG, '#39'R'#39', '#39'1.1. Recebimentos'#39', '#39'1.2. Paga' +
        'mentos'#39')) AS RP,'
      
        '  ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, 0 AS VALORPREV, 0 AS' +
        ' VALORORC,'
      
        '  0 AS DIFERENCA,0 AS PERC, 0 AS VALORPREVSIN, 0 AS VALORORCSIN,' +
        ' 0 AS DIFERENCASIN,'
      '  0 AS VALORPREVANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  (1=2)'
      'ORDER BY RECPAG DESC, CODTIPRECDES'
      ''
      ' ')
    UpdateObject = updOrcxPrevisto
    ValidateWithMask = True
    Left = 296
    Top = 320
  end
  object dsOrcxPrevisto: TwwDataSource
    DataSet = qryOrcxPrevisto
    Left = 296
    Top = 304
  end
  object ppOrcxPrevisto: TppBDEPipeline
    DataSource = dsOrcxPrevisto
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'OrcxPrevisto'
    Left = 296
    Top = 288
    object ppOrcxPrevistoppField1: TppField
      FieldAlias = 'GR'
      FieldName = 'GR'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppOrcxPrevistoppField2: TppField
      FieldAlias = 'RP'
      FieldName = 'RP'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppOrcxPrevistoppField3: TppField
      FieldAlias = 'ANASINT'
      FieldName = 'ANASINT'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppOrcxPrevistoppField4: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppOrcxPrevistoppField5: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppOrcxPrevistoppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 5
    end
    object ppOrcxPrevistoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREV'
      FieldName = 'VALORPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppOrcxPrevistoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORC'
      FieldName = 'VALORORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppOrcxPrevistoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppOrcxPrevistoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERC'
      FieldName = 'PERC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppOrcxPrevistoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREVSIN'
      FieldName = 'VALORPREVSIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppOrcxPrevistoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORCSIN'
      FieldName = 'VALORORCSIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppOrcxPrevistoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCASIN'
      FieldName = 'DIFERENCASIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppOrcxPrevistoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREVANA'
      FieldName = 'VALORPREVANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppOrcxPrevistoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORORCANA'
      FieldName = 'VALORORCANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppOrcxPrevistoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCAANA'
      FieldName = 'DIFERENCAANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object rpOrcxPrevisto: TppReport
    AutoStop = False
    DataPipeline = ppOrcxPrevisto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMMThousandths
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 296
    Top = 272
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppOrcxPrevisto'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabelTituloRelatorio: TppLabel
        UserName = 'ppLabelTituloRelatorio'
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
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17992
        mmWidth = 197300
        BandType = 0
      end
      object ppLabelEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabelEmpresa'
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
      object ppLabel56: TppLabel
        UserName = 'ppLabel56'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 23813
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'ppLabel57'
        Caption = 'Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 23813
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'ppLabel58'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97102
        mmTop = 23813
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'ppLabel59'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 18785
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'em Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 23813
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'em %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 23813
        mmWidth = 7938
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'ppLine26'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 177800
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpOrcxPrevistoDBText2: TppDBText
        UserName = 'rpOrcxPrevistoDBText2'
        AutoSize = True
        DataField = 'VALORPREV'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rpOrcxPrevistoDBText3: TppDBText
        UserName = 'rpOrcxPrevistoDBText3'
        AutoSize = True
        DataField = 'VALORORC'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 91281
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpOrcxPrevistoDBText4: TppDBText
        UserName = 'rpOrcxPrevistoDBText4'
        AutoSize = True
        DataField = 'DIFERENCA'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object rpOrcxPrevistoDBText5: TppDBText
        UserName = 'rpOrcxPrevistoDBText5'
        AutoSize = True
        DataField = 'PERC'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 529
        mmWidth = 7673
        BandType = 4
      end
      object rpOrcxPrevistoDBText1: TppDBText
        UserName = 'rpOrcxPrevistoDBText1'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppOrcxPrevisto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
        UserName = 'ppLabel62'
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel63: TppLabel
        UserName = 'ppLabel63'
        Caption = 'ENTRADAS - SAIDAS DO PERÍODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 2381
        mmWidth = 57415
        BandType = 7
      end
      object rpOrcxPrevistoDBCalc4: TppDBCalc
        UserName = 'rpOrcxPrevistoDBCalc4'
        AutoSize = True
        DataField = 'VALORORCSIN'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 1852
        mmWidth = 39423
        BandType = 7
      end
      object rpOrcxPrevistoDBCalc5: TppDBCalc
        UserName = 'rpOrcxPrevistoDBCalc5'
        AutoSize = True
        DataField = 'VALORPREVSIN'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 4233
        mmLeft = 98425
        mmTop = 1852
        mmWidth = 41275
        BandType = 7
      end
      object rpOrcxPrevistoDBCalc6: TppDBCalc
        UserName = 'rpOrcxPrevistoDBCalc6'
        AutoSize = True
        DataField = 'DIFERENCASIN'
        DataPipeline = ppOrcxPrevisto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 1852
        mmWidth = 39952
        BandType = 7
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197300
        BandType = 7
      end
      object rpOrcxPrevistoLabel12: TppLabel
        OnPrint = rpOrcxPrevistoLabel12Print
        UserName = 'rpOrcxPrevistoLabel12'
        Caption = 'rpOrcxReaLabel12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 1852
        mmWidth = 31221
        BandType = 7
      end
      object rpOrcxPrevistoDBCalc15: TppDBCalc
        UserName = 'rpOrcxPrevistoDBCalc15'
        AutoSize = True
        DataField = 'VALORPREVSIN'
        DataPipeline = ppOrcxPrevisto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 6879
        mmWidth = 31485
        BandType = 7
      end
      object rpOrcxPrevistoDBCalc14: TppDBCalc
        UserName = 'rpOrcxPrevistoDBCalc14'
        AutoSize = True
        DataField = 'VALORORCSIN'
        DataPipeline = ppOrcxPrevisto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'ppOrcxPrevisto'
        mmHeight = 3175
        mmLeft = 26988
        mmTop = 6350
        mmWidth = 30163
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'GR'
      DataPipeline = ppOrcxPrevisto
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppOrcxPrevisto'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppLine30: TppLine
          UserName = 'ppLine30'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 2910
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel65: TppLabel
          UserName = 'ppLabel65'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6615
          mmTop = 1852
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'ppDBText29'
          AutoSize = True
          DataField = 'GR'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 1852
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoLabel11: TppLabel
          OnPrint = rpOrcxPrevistoLabel11Print
          UserName = 'rpOrcxPrevistoLabel11'
          Caption = 'rpOrcxReaLabel11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 161396
          mmTop = 1852
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoDBCalc7: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc7'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 67733
          mmTop = 1852
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoDBCalc8: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc8'
          AutoSize = True
          DataField = 'VALORPREVSIN'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 98425
          mmTop = 1852
          mmWidth = 41275
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoDBCalc9: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc9'
          AutoSize = True
          DataField = 'DIFERENCASIN'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 125677
          mmTop = 1852
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoDBCalc12: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc12'
          AutoSize = True
          DataField = 'VALORORCSIN'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 3175
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object rpOrcxPrevistoDBCalc13: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc13'
          AutoSize = True
          DataField = 'VALORPREVSIN'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 3175
          mmLeft = 42069
          mmTop = 1588
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'RP'
      DataPipeline = ppOrcxPrevisto
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppOrcxPrevisto'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpOrcxPrevistoDBText6: TppDBText
          UserName = 'rpOrcxPrevistoDBText6'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 19050
          mmTop = 1852
          mmWidth = 5027
          BandType = 3
          GroupNo = 1
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLine32: TppLine
          UserName = 'ppLine32'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoLabel7: TppLabel
          UserName = 'rpOrcxPrevistoLabel7'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7144
          mmTop = 1588
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBText7: TppDBText
          UserName = 'rpOrcxPrevistoDBText7'
          AutoSize = True
          DataField = 'RP'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 20108
          mmTop = 1588
          mmWidth = 5027
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBCalc1: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc1'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 66146
          mmTop = 1588
          mmWidth = 41010
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBCalc2: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc2'
          AutoSize = True
          DataField = 'VALORPREVANA'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 96838
          mmTop = 1588
          mmWidth = 42863
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBCalc3: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc3'
          AutoSize = True
          DataField = 'DIFERENCAANA'
          DataPipeline = ppOrcxPrevisto
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 4233
          mmLeft = 124354
          mmTop = 1588
          mmWidth = 41275
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoLabel9: TppLabel
          OnPrint = rpOrcxPrevistoLabel9Print
          UserName = 'rpOrcxPrevistoLabel9'
          Caption = 'rpOrcxReaLabel9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 1588
          mmWidth = 29369
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBCalc10: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc10'
          AutoSize = True
          DataField = 'VALORORCANA'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 3175
          mmLeft = 26723
          mmTop = 2117
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object rpOrcxPrevistoDBCalc11: TppDBCalc
          UserName = 'rpOrcxPrevistoDBCalc11'
          AutoSize = True
          DataField = 'VALORPREVANA'
          DataPipeline = ppOrcxPrevisto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppOrcxPrevisto'
          mmHeight = 3175
          mmLeft = 43392
          mmTop = 1588
          mmWidth = 32808
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updOrcxPrevisto: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORECEBDESEMB'
      'set'
      '  GR = :GR,'
      '  RP = :RP,'
      '  ANASINT = :ANASINT,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  DESCRICAO = :DESCRICAO,'
      '  VALORPREV = :VALORPREV,'
      '  VALORORC = :VALORORC,'
      '  DIFERENCA = :DIFERENCA,'
      '  PERC = :PERC,'
      '  VALORPREVSIN = :VALORPREVSIN,'
      '  VALORORCSIN = :VALORORCSIN,'
      '  DIFERENCASIN = :DIFERENCASIN,'
      '  VALORPREVANA = :VALORPREVANA,'
      '  VALORORCANA = :VALORORCANA,'
      '  DIFERENCAANA = :DIFERENCAANA'
      'where'
      '  GR = :OLD_GR and'
      '  RP = :OLD_RP and'
      '  ANASINT = :OLD_ANASINT and'
      '  RECPAG = :OLD_RECPAG and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  VALORPREV = :OLD_VALORPREV and'
      '  VALORORC = :OLD_VALORORC and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  PERC = :OLD_PERC and'
      '  VALORPREVSIN = :OLD_VALORPREVSIN and'
      '  VALORORCSIN = :OLD_VALORORCSIN and'
      '  DIFERENCASIN = :OLD_DIFERENCASIN and'
      '  VALORPREVANA = :OLD_VALORPREVANA and'
      '  VALORORCANA = :OLD_VALORORCANA and'
      '  DIFERENCAANA = :OLD_DIFERENCAANA')
    InsertSQL.Strings = (
      'insert into TIPORECEBDESEMB'
      
        '  (GR, RP, ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, VALORPREV, ' +
        'VALORORC, '
      
        '   DIFERENCA, PERC, VALORPREVSIN, VALORORCSIN, DIFERENCASIN, VAL' +
        'ORPREVANA, '
      '   VALORORCANA, DIFERENCAANA)'
      'values'
      
        '  (:GR, :RP, :ANASINT, :RECPAG, :CODTIPRECDES, :DESCRICAO, :VALO' +
        'RPREV, '
      
        '   :VALORORC, :DIFERENCA, :PERC, :VALORPREVSIN, :VALORORCSIN, :D' +
        'IFERENCASIN, '
      '   :VALORPREVANA, :VALORORCANA, :DIFERENCAANA)')
    DeleteSQL.Strings = (
      'delete from TIPORECEBDESEMB'
      'where'
      '  GR = :OLD_GR and'
      '  RP = :OLD_RP and'
      '  ANASINT = :OLD_ANASINT and'
      '  RECPAG = :OLD_RECPAG and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  DESCRICAO = :OLD_DESCRICAO and'
      '  VALORPREV = :OLD_VALORPREV and'
      '  VALORORC = :OLD_VALORORC and'
      '  DIFERENCA = :OLD_DIFERENCA and'
      '  PERC = :OLD_PERC and'
      '  VALORPREVSIN = :OLD_VALORPREVSIN and'
      '  VALORORCSIN = :OLD_VALORORCSIN and'
      '  DIFERENCASIN = :OLD_DIFERENCASIN and'
      '  VALORPREVANA = :OLD_VALORPREVANA and'
      '  VALORORCANA = :OLD_VALORORCANA and'
      '  DIFERENCAANA = :OLD_DIFERENCAANA')
    Left = 408
    Top = 200
  end
  object qryObsDispFinanc: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DECODE(D.OBS,NULL,L.HISTORICOCOMPL,D.OBS) AS OBS'
      'FROM'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.CODDOCUMENTO = :CodDocumento)')
    Left = 296
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CodDocumento'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ppConferDocRegular: TppBDEPipeline
    DataSource = dsConferDocRegular
    UserName = 'lExemplo1'
    Left = 432
    Top = 288
  end
  object dsConferDocRegular: TwwDataSource
    DataSet = qryConferDocRegular
    Left = 432
    Top = 320
  end
  object qryConferDocRegular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   REL.CODLANCFINANC,'
      '   P.DESCRICAO,'
      '   M.HISTORICO,'
      '   M.VALORLANCFINAN,'
      '   M.DATALANCFINAN,'
      '   REL.IDRELACIONANI,'
      '   REL.FLGMARCADO,'
      '   RF.VALOR,'
      '   REL.FLGNI,'
      '   PC.NOME AS PLANO'
      'FROM'
      '   (SELECT '
      '       R.CODLANCFINANC,'
      '       R.IDRELACIONANI,'
      '       R.FLGMARCADO,'
      '       R.FLGNI'
      '    FROM'
      '       RelacionaNI R'
      '    WHERE'
      '       Exists(SELECT'
      '                 M1.CODLANCFINANC'
      '              FROM'
      '                 RelacionaNI R1,'
      '                 MovimFinanc M1'
      '              WHERE'
      '                 (R1.CODLANCFINANC=M1.CODLANCFINANC) AND'
      '                 (R1.IDRELACIONANI=R.IDRELACIONANI) AND'
      ''
      '                 -- DAVID 08/06/07 - Pendência 25545'
      '                 -- (R1.FLGMARCADO = :Marcado) AND'
      ''
      '                 (M1.IDPESSOA = :IDPessoa) AND'
      '                 (R1.FLGNI='#39'I'#39') AND'
      
        '                 ((M1.CODPORTADOR = :CodPortador) OR ( '#39'S'#39' = :To' +
        'dasContas)) AND'
      
        '                 (( (M1.DATALANCFINAN >= TO_DATE( :DataInicial,'#39 +
        'dd/mm/yyyy'#39')) AND'
      
        '                    (M1.DATALANCFINAN <= TO_DATE( :DataFinal,'#39'dd' +
        '/mm/yyyy'#39'  )) ) OR'
      '                  ( '#39'S'#39' = :TodasDatas )))) REL,'
      '                  '
      '   MovimFinanc M,'
      '   PortadorConta P,'
      '   RateioFinanc RF,'
      '   PlanPrevContabil PC'
      'WHERE'
      '   (REL.CODLANCFINANC=M.CODLANCFINANC) AND'
      '   (M.CODPORTADOR=P.CODPORTADOR) AND'
      '   (M.CODLANCFINANC=RF.CODLANCFINANC) AND'
      '   (RF.IDPLANOPREV=PC.IDPLANOPREV(+)) AND'
      '   (M.IDPESSOA = :IDPessoa)'
      'ORDER BY'
      '   REL.IDRELACIONANI,REL.FLGNI,P.DESCRICAO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'Marcado'
        ParamType = ptInput
        Value = #39#39
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'CodPortador'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'TodasContas'
        ParamType = ptInput
        Value = #39'T'#39
      end
      item
        DataType = ftString
        Name = 'DataInicial'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'DataFinal'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'TodasDatas'
        ParamType = ptInput
        Value = #39'T'#39
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
  end
  object rpConferDocRegular: TppReport
    AutoStop = False
    DataPipeline = ppConferDocRegular
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 432
    Top = 272
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConferDocRegular'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conferência de Documentos Regularizados'
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
        mmWidth = 197115
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel54: TppLabel
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
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      AfterPrint = ppDetailBand12AfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'DATALANCFINAN'
        DataPipeline = ppConferDocRegular
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 4233
        mmLeft = 27781
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CODLANCFINANC'
        DataPipeline = ppConferDocRegular
        DisplayFormat = '000,000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 4233
        mmLeft = 52123
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCRICAO'
        DataPipeline = ppConferDocRegular
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 265
        mmWidth = 88371
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR'
        DataPipeline = ppConferDocRegular
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'HISTORICO'
        DataPipeline = ppConferDocRegular
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 3175
        mmLeft = 78317
        mmTop = 5027
        mmWidth = 88371
        BandType = 4
      end
      object lblTipoDoc: TppLabel
        UserName = 'lblTipoDoc'
        Caption = 'Regularizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'PLANO'
        DataPipeline = ppConferDocRegular
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConferDocRegular'
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 8731
        mmWidth = 88371
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
      object ppLabel64: TppLabel
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
    object ppGroup7: TppGroup
      BreakName = 'IDRELACIONANI'
      DataPipeline = ppConferDocRegular
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConferDocRegular'
      object grpbIDRelaciona: TppGroupHeaderBand
        AfterPrint = grpbIDRelacionaAfterPrint
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'Line3'
          Pen.Width = 3
          Position = lpBottom
          Weight = 2.25
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label1'
          Caption = 'Grupo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 1323
          mmTop = 0
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object dbtGrupo: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'IDRELACIONANI'
          DataPipeline = ppConferDocRegular
          DisplayFormat = '000,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppConferDocRegular'
          mmHeight = 5292
          mmLeft = 17463
          mmTop = 0
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'Line38'
          Pen.Width = 3
          Position = lpBottom
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label2'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 7408
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 52388
          mmTop = 7408
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLabel69: TppLabel
          UserName = 'Label69'
          Caption = 'Descrição / Histórico / Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78317
          mmTop = 7408
          mmWidth = 73554
          BandType = 3
          GroupNo = 0
        end
        object ppLabel70: TppLabel
          UserName = 'Label70'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178330
          mmTop = 7408
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'FLGNI'
      DataPipeline = ppConferDocRegular
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConferDocRegular'
      object grpbFlgNI: TppGroupHeaderBand
        AfterPrint = grpbFlgNIAfterPrint
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
        object ppLine37: TppLine
          UserName = 'Line37'
          Pen.Width = 2
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 26988
          mmTop = 265
          mmWidth = 170392
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
      BreakName = 'CODLANCFINANC'
      DataPipeline = ppConferDocRegular
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppConferDocRegular'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine39: TppLine
          UserName = 'Line39'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 123561
          mmTop = 0
          mmWidth = 74348
          BandType = 5
          GroupNo = 2
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'VALORLANCFINAN'
          DataPipeline = ppConferDocRegular
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppConferDocRegular'
          mmHeight = 4233
          mmLeft = 162454
          mmTop = 1852
          mmWidth = 33602
          BandType = 5
          GroupNo = 2
        end
        object ppLine40: TppLine
          UserName = 'Line40'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 123561
          mmTop = 5556
          mmWidth = 74348
          BandType = 5
          GroupNo = 2
        end
        object ppLabel71: TppLabel
          UserName = 'Label701'
          Caption = 'Total do Lançamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 123561
          mmTop = 1852
          mmWidth = 37042
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
