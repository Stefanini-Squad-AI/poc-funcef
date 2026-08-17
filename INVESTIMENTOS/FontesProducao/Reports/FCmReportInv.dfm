inherited FrmCmReportInv: TFrmCmReportInv
  Left = 556
  Top = 349
  Width = 239
  Height = 247
  Caption = 'FrmCmReportInv'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    Report = rpt
  end
  object cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 72
    Data = {
      8E0100009619E0BD010000001800000008000300000003000000D70009444154
      41464C55584F0800080000000000044449415308000400000000000C4355504F
      4D454D495353414F08000400000000000B4355504F4D434F4D50524108000400
      0000000005505550415208000400000000000A50554A5552454D495353080004
      00000000000B50554A5552434F4D505241080004000000000006554C54494D4F
      010049000000010005574944544802000200010002000D44454641554C545F4F
      5244455202008200010000000100044C43494404000100090800000000000000
      12E260CACC420000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E0000000000F41738
      CCCC420000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E0000000000D64D0FCECC42
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000153}
  end
  object spr: TCMSqlParams
    SQL.Strings = (
      '')
    ClientDataSet = cds
    Left = 24
    Top = 72
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = cds
    Left = 152
    Top = 72
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'l'
    Left = 53
    Top = 136
    object pplppField1: TppField
      FieldAlias = 'DATAFLUXO'
      FieldName = 'DATAFLUXO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object pplppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMEMISSAO'
      FieldName = 'CUPOMEMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUPOMCOMPRA'
      FieldName = 'CUPOMCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUPAR'
      FieldName = 'PUPAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJUREMISS'
      FieldName = 'PUJUREMISS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUJURCOMPRA'
      FieldName = 'PUJURCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      FieldAlias = 'ULTIMO'
      FieldName = 'ULTIMO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
  end
  object rpt: TppReport
    AutoStop = False
    DataPipeline = ppl
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valor de Mercado de NTN'
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
    Left = 130
    Top = 136
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object lblCabDireito: TppLabel
        UserName = 'Label1'
        Caption = 'lblCabDireito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 263822
        mmTop = 14552
        mmWidth = 19812
        BandType = 0
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'lblTituloRelatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 28956
        BandType = 0
      end
      object lblEmpresa: TppLabel
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
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3683
        mmLeft = 24871
        mmTop = 14552
        mmWidth = 15579
        BandType = 0
      end
      object linCabecalho: TppLine
        UserName = 'linCabecalho'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 18521
        mmWidth = 284300
        BandType = 0
      end
      object shpCustodiante: TppShape
        UserName = 'shpDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 20109
        mmWidth = 284300
        BandType = 0
      end
      object lblCapInvestimento: TppLabel
        UserName = 'lblCapInvestimento'
        Caption = 'LblCabecalho'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 24871
        mmTop = 20638
        mmWidth = 20913
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object lblSistema: TppLabel
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 283369
        BandType = 8
      end
      object pplRodape: TppLine
        UserName = 'lRodape'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
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
        mmLeft = 257440
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
