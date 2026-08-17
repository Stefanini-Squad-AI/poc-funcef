object dtmTermo: TdtmTermo
  Left = 198
  Top = 157
  Width = 428
  Height = 143
  Caption = 'dtmTermoDiario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rptTermos: TppReport
    AutoStop = False
    DataPipeline = pplTermos
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 205
    Top = 24
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplTermos'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 137848
      mmPrintPosition = 0
      object rptTermosDBRichText1: TppDBRichText
        UserName = 'rptTermosDBRichText1'
        DataField = 'TERTEXTO'
        DataPipeline = pplTermos
        Stretch = True
        DataPipelineName = 'pplTermos'
        mmHeight = 116417
        mmLeft = 7673
        mmTop = 11113
        mmWidth = 266965
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object rptTermosLine1: TppLine
        UserName = 'rptTermosLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object rptTermosLabel1: TppLabel
        UserName = 'rptTermosLabel1'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 4763
        mmWidth = 9525
        BandType = 8
      end
      object rptTermosDBText1: TppDBText
        UserName = 'rptTermosDBText1'
        DataField = 'PAGINA'
        DataPipeline = pplTermos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTermos'
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 4763
        mmWidth = 11642
        BandType = 8
      end
    end
    object rptTermosGroup1: TppGroup
      BreakName = 'ABERTFECHAM'
      DataPipeline = pplTermos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rptTermosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplTermos'
      object rptTermosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rptTermosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplTermos: TppBDEPipeline
    DataSource = dsTermos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lTermos'
    Left = 141
    Top = 24
    object pplTermosppField1: TppField
      FieldAlias = 'TERTEXTO'
      FieldName = 'TERTEXTO'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplTermosppField2: TppField
      FieldAlias = 'ABERTFECHAM'
      FieldName = 'ABERTFECHAM'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object pplTermosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAGINA'
      FieldName = 'PAGINA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsTermos: TwwDataSource
    DataSet = cdsTermo
    Left = 80
    Top = 24
  end
  object cdsTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 24
  end
end
