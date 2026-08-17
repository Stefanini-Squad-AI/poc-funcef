inherited RptRentabilidadeContabil: TRptRentabilidadeContabil
  Left = 217
  Top = 225
  Width = 341
  Height = 211
  Caption = 'Rentabilidade Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relat[orio de Rentabilidade Contábil'
    DataBaseName = 'BaseDados'
  end
  inherited CrmRptCM: TCmRptManager
    DataBaseName = 'BaseDados'
    Report = rptRentContabil
  end
  object pplRentContabil: TppBDEPipeline
    DataSource = dsRentContabil
    CloseDataSource = True
    UserName = 'lRentContabil'
    Left = 24
    Top = 56
  end
  object rptRentContabil: TppReport
    AutoStop = False
    DataPipeline = pplRentContabil
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
    Left = 88
    Top = 56
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object dsRentContabil: TwwDataSource
    DataSet = cdsRentContabil
    Left = 200
    Top = 8
  end
  object cdsRentContabil: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ATIVO;PASSIVO;RECEITA;DESPESA;'
    Params = <>
    Left = 200
    Top = 48
  end
  object sqlRentContabil: TCMSqlParams
    ClientDataSet = cdsRentContabil
    Left = 200
    Top = 88
  end
end
