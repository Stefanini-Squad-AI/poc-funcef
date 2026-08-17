inherited rptExemplo: TrptExemplo
  Left = 379
  Top = 236
  Width = 412
  Height = 233
  Caption = 'rptExemplo'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    Report = rpt
    LabelEmpresa = LblSistema
    LabelSistema = LblEmpresa
    ConnectionType = cntBDE
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 64
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 119
    Top = 64
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'l'
    Left = 164
    Top = 64
  end
  object rpt: TppReport
    AutoStop = False
    DataPipeline = ppl
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
    Left = 209
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object Label11: TppLabel
        UserName = 'Label11'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4498
        mmLeft = 25135
        mmTop = 11113
        mmWidth = 31750
        BandType = 0
      end
      object Line1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 28575
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 25135
        mmTop = 5027
        mmWidth = 24299
        BandType = 0
      end
      object imgLogo: TppDBImage
        UserName = 'imgLogo'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplLogo'
        mmHeight = 15081
        mmLeft = 4763
        mmTop = 5027
        mmWidth = 17727
        BandType = 0
      end
      object LbAdicionais: TppLabel
        UserName = 'LbAdicionais'
        Caption = 'Informações adocionais, como por exemplo o filtro adicionado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 16140
        mmWidth = 87842
        BandType = 0
      end
    end
    object DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object LblSistema: TppLabel
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
        mmTop = 2117
        mmWidth = 197909
        BandType = 8
      end
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 8
      end
      object Calc2: TppSystemVariable
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
        mmTop = 2381
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
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
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object CdsLogo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 120
  end
  object dsLogo: TDataSource
    DataSet = CdsLogo
    Left = 120
    Top = 120
  end
  object pplLogo: TppBDEPipeline
    DataSource = dsLogo
    UserName = 'lLogo'
    Left = 167
    Top = 120
  end
end
