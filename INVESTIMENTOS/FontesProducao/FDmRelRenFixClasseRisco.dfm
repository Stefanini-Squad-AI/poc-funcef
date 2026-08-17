inherited DmRelRenFixClasseRisco: TDmRelRenFixClasseRisco
  Left = 398
  Top = 193
  Width = 239
  Height = 249
  Caption = 'DmRelRenFixClasseRisco'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
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
    Left = 29
  end
  inherited qryExemplo: TwwQuery
    Left = 29
  end
  inherited rpExemplo: TppReport
    Left = 29
  end
  object pplClasseRiscoRenFix: TppBDEPipeline
    DataSource = dsClasseRiscoRenFix
    UserName = 'pplClasseRiscoRenFix'
    Left = 122
    Top = 64
    object pplClasseRiscoRenFixppField1: TppField
      FieldAlias = 'NOMECLASSRISCO'
      FieldName = 'NOMECLASSRISCO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplClasseRiscoRenFixppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NIVELCLASSRISCO'
      FieldName = 'NIVELCLASSRISCO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplClasseRiscoRenFixppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORCLASSRISCO'
      FieldName = 'CORCLASSRISCO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsClasseRiscoRenFix: TwwDataSource
    AutoEdit = False
    DataSet = qryClasseRiscoRenFix
    Left = 122
    Top = 112
  end
  object qryClasseRiscoRenFix: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMECLASSRISCO, NIVELCLASSRISCO, CORCLASSRISCO'
      'FROM CLASSRISCORENFIX'
      'ORDER BY NIVELCLASSRISCO, NOMECLASSRISCO')
    ValidateWithMask = True
    Left = 122
    Top = 160
    object qryClasseRiscoRenFixNOMECLASSRISCO: TStringField
      FieldName = 'NOMECLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.NOMECLASSRISCO'
      Size = 60
    end
    object qryClasseRiscoRenFixNIVELCLASSRISCO: TFloatField
      FieldName = 'NIVELCLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.NIVELCLASSRISCO'
    end
    object qryClasseRiscoRenFixCORCLASSRISCO: TFloatField
      FieldName = 'CORCLASSRISCO'
      Origin = 'BASEDADOS.CLASSRISCORENFIX.CORCLASSRISCO'
    end
  end
  object rptClasseRiscoRenFix: TppReport
    AutoStop = False
    DataPipeline = pplClasseRiscoRenFix
    OnStartPage = rptClasseRiscoRenFixStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Classe de Risco de Títulos de Renda Fixa'
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
    Left = 122
    Top = 16
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Classe de Risco de Títulos de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 69850
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
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
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        Caption = 'Nível'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 19844
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 54504
        mmTop = 19844
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label3'
        Caption = 'Cor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 19844
        mmWidth = 4763
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NIVELCLASSRISCO'
        DataPipeline = pplClasseRiscoRenFix
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMECLASSRISCO'
        DataPipeline = pplClasseRiscoRenFix
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 54504
        mmTop = 529
        mmWidth = 91017
        BandType = 4
      end
      object shpCORCLASSRISCO: TppShape
        UserName = 'shpCORCLASSRISCO'
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel5: TppLabel
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
  end
end
