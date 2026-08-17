inherited DtMRelAugusto: TDtMRelAugusto
  Height = 293
  PixelsPerInch = 96
  TextHeight = 13
  object PpSPC: TppBDEPipeline
    DataSource = DsSPC
    UserName = 'PpSPC'
    Left = 173
    Top = 80
  end
  object DsSPC: TwwDataSource
    DataSet = QrySPC
    Left = 127
    Top = 80
  end
  object QrySPC: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#39'         '#39' AS CODBENEFSPC,'
      
        '       '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' +
        'XXXXXXXXXXXXXXXXXXXXXXXXXXX'#39
      '       AS DESCRICAO,'
      '       0 AS TOTANTERIOR,'
      '       0 AS TOTCONCEDIDO,'
      '       0 AS TOTCANCELADO,'
      '       0 AS TOTATUAL'
      'FROM DUAL'
      '')
    UpdateObject = UpdSPC
    ValidateWithMask = True
    Left = 34
    Top = 80
  end
  object RpSPC: TppReport
    AutoStop = False
    DataPipeline = PpSPC
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
    Left = 218
    Top = 80
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Relatório SPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 85196
        mmTop = 8731
        mmWidth = 28310
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 16404
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
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
      object CODIGO: TppLabel
        UserName = 'CODIGO'
        Caption = 'CODIGO - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 17727
        mmWidth = 16933
        BandType = 0
      end
      object RpSPCLabel1: TppLabel
        UserName = 'RpSPCLabel1'
        Caption = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 18521
        mmTop = 17727
        mmWidth = 20108
        BandType = 0
      end
      object RpSPCLabel2: TppLabel
        UserName = 'RpSPCLabel2'
        Caption = 'ANTERIOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 17727
        mmWidth = 17463
        BandType = 0
      end
      object RpSPCLabel3: TppLabel
        UserName = 'RpSPCLabel3'
        Caption = 'CANCELADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 146844
        mmTop = 17727
        mmWidth = 21167
        BandType = 0
      end
      object RpSPCLabel4: TppLabel
        UserName = 'RpSPCLabel4'
        Caption = 'ATUAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 182827
        mmTop = 17463
        mmWidth = 11377
        BandType = 0
      end
      object RpSPCLabel5: TppLabel
        UserName = 'RpSPCLabel5'
        Caption = 'CONCEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 121709
        mmTop = 17727
        mmWidth = 20373
        BandType = 0
      end
      object RpSPCLine1: TppLine
        UserName = 'RpSPCLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22490
        mmWidth = 197300
        BandType = 0
      end
      object LbMes: TppLabel
        UserName = 'LbMes'
        Caption = 'Mes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 11906
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RpSPCDBText2: TppDBText
        UserName = 'RpSPCDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = PpSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 94721
        BandType = 4
      end
      object RpSPCDBText3: TppDBText
        UserName = 'RpSPCDBText3'
        DataField = 'TOTANTERIOR'
        DataPipeline = PpSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 95250
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object RpSPCDBText4: TppDBText
        UserName = 'RpSPCDBText4'
        DataField = 'TOTCONCEDIDO'
        DataPipeline = PpSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object RpSPCDBText5: TppDBText
        UserName = 'RpSPCDBText5'
        DataField = 'TOTCANCELADO'
        DataPipeline = PpSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144727
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object RpSPCDBText6: TppDBText
        UserName = 'RpSPCDBText6'
        DataField = 'TOTATUAL'
        DataPipeline = PpSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 529
        mmWidth = 22754
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
  end
  object UpdSPC: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  CODBENEFSPC = :CODBENEFSPC,'
      '  DESCRICAO = :DESCRICAO,'
      '  TOTANTERIOR = :TOTANTERIOR,'
      '  TOTCONCEDIDO = :TOTCONCEDIDO,'
      '  TOTCANCELADO = :TOTCANCELADO,'
      '  TOTATUAL = :TOTATUAL'
      'where'
      '  CODBENEFSPC = :OLD_CODBENEFSPC')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (CODBENEFSPC, DESCRICAO, TOTANTERIOR, TOTCONCEDIDO, TOTCANCELA' +
        'DO, TOTATUAL)'
      'values'
      
        '  (:CODBENEFSPC, :DESCRICAO, :TOTANTERIOR, :TOTCONCEDIDO, :TOTCA' +
        'NCELADO, '
      '   :TOTATUAL)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  CODBENEFSPC = :OLD_CODBENEFSPC')
    Left = 80
    Top = 80
  end
end
