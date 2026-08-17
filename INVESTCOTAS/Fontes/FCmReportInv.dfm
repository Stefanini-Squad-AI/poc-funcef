inherited FrmCmReportInv: TFrmCmReportInv
  Width = 312
  Height = 217
  Caption = 'FrmCmReportInv'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
  end
  inherited CrmRptCM: TCmRptManager
    Report = rptReport
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object pplReport: TppBDEPipeline
    DataSource = ds
    UserName = 'lReport'
    Left = 29
    Top = 128
  end
  object spl: TCMSqlParams
    SQL.Strings = (
      '')
    Left = 21
    Top = 73
  end
  object cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 62
    Top = 73
    Data = {
      520200009619E0BD010000001800000017000000000003000000520207494446
      554E444F08000400000000000D494446554E444F494E56455354080004000000
      0000044953494E0100490000000100055749445448020002000C0004434E504A
      0100490000000100055749445448020002000E00044E4F4D4501004900000001
      00055749445448020002003200094454504F534943414F080008000000000007
      4E4F4D4541444D010049000000010005574944544802000200320007434E504A
      41444D0100490000000100055749445448020002000E000A4E4F4D4547455354
      4F5201004900000001000557494454480200020032000A434E504A474553544F
      520100490000000100055749445448020002000E000F4E4F4D45435553544F44
      49414E544501004900000001000557494454480200020032000F434E504A4355
      53544F4449414E54450100490000000100055749445448020002000E00095641
      4C4F52434F544108000400000000000A5155414E544944414445080004000000
      0000065041544C495108000400000000000B56414C4F52415449564F53080004
      00000000000C56414C4F525245434542455208000400000000000A56414C4F52
      504147415208000400000000000D564C434F544153454D495449520800040000
      0000000F564C434F5441535245534741544152080004000000000008434F4441
      4E4249440100490000000100055749445448020002000600095449504F46554E
      444F0800040000000000084E4956454C52534301004900000001000557494454
      480200020002000100044C4349440400010009080000}
  end
  object ds: TDataSource
    DataSet = cds
    Left = 102
    Top = 73
  end
  object rptReport: TppReport
    AutoStop = False
    DataPipeline = pplReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos Cancelados'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 82
    Top = 128
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplReport'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object lblNomeRelatorio: TppLabel
        UserName = 'lblNomeRelatorio'
        Caption = 'Nome do Relatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 31284
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
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppLogoTipo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLogoTipo'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
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
        mmTop = 794
        mmWidth = 282576
        BandType = 8
      end
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
        mmTop = 794
        mmWidth = 282576
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 254001
        mmTop = 794
        mmWidth = 28840
        BandType = 8
      end
    end
  end
  object cdsLogoTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 9
  end
  object ppLogoTipo: TppBDEPipeline
    DataSource = dsLogoTipo
    UserName = 'LogoTipo'
    Left = 205
    Top = 42
  end
  object dsLogoTipo: TDataSource
    DataSet = cdsLogoTipo
    Left = 206
    Top = 73
  end
end
