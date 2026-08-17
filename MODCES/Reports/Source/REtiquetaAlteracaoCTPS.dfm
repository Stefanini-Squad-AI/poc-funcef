inherited RptEtiquetaAlteracaoCTPS: TRptEtiquetaAlteracaoCTPS
  Left = 220
  Top = 202
  Width = 334
  Height = 267
  Caption = 'RptEtiquetaAlteracaoCTPS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpEtiquetaAlteracaoCTPS
    ConnectionType = cntBDE
  end
  object rpEtiquetaAlteracaoCTPS: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '6350'
      '101116'
      '195882')
    DataPipeline = ppEtiquetaAlteracaoCTPS
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Etiquetas para Atualização de CTPS'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.Format = ftASCII
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 240
    Version = '7.04'
    mmColumnWidth = 94766
    DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
    object rpEtiquetaAlteracaoCTPSColHdrBnd1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpEtiquetaAlteracaoCTPSDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object EtiquetasAltCTPSDBTxt1: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt1'
        DataField = 'DATA'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 3704
        mmLeft = 26723
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt3: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt3'
        DataField = 'NOVAFUNCAO'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 5556
        mmWidth = 51594
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt4: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt4'
        DataField = 'CBO'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 10054
        mmWidth = 9790
        BandType = 4
      end
      object EtiquetasAltCTPSDBTxt5: TppDBText
        UserName = 'EtiquetasAltCTPSDBTxt5'
        DataField = 'MOTIVO'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 7938
        mmLeft = 5821
        mmTop = 10054
        mmWidth = 70644
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLbl1: TppLabel
        UserName = 'rpEtiquetaAlteracaoCTPSLbl1'
        AutoSize = False
        Caption = 'Aumentado em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 1058
        mmWidth = 20108
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSDBTxt2: TppDBText
        UserName = 'rpEtiquetaAlteracaoCTPSDBTxt2'
        DataField = 'NOVOSALARIO'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLbl2: TppLabel
        UserName = 'rpEtiquetaAlteracaoCTPSLbl2'
        AutoSize = False
        Caption = 'para R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 47361
        mmTop = 1058
        mmWidth = 10848
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLbl3: TppLabel
        UserName = 'rpEtiquetaAlteracaoCTPSLbl3'
        AutoSize = False
        Caption = 'Na função de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5821
        mmTop = 5556
        mmWidth = 18521
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLbl4: TppLabel
        UserName = 'rpEtiquetaAlteracaoCTPSLbl4'
        Caption = 'CBO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 5821
        mmTop = 10054
        mmWidth = 6879
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLine1: TppLine
        UserName = 'rpEtiquetaAlteracaoCTPSLine1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 14023
        mmTop = 21696
        mmWidth = 55563
        BandType = 4
      end
      object rpEtiquetaAlteracaoCTPSLbl6: TppLabel
        UserName = 'rpEtiquetaAlteracaoCTPSLbl6'
        AutoSize = False
        Caption = 'Assinatura do Empregador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24077
        mmTop = 22490
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppEtiquetaAlteracaoCTPS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEtiquetaAlteracaoCTPS'
        mmHeight = 3175
        mmLeft = 6350
        mmTop = 22754
        mmWidth = 13229
        BandType = 4
      end
    end
    object rpEtiquetaAlteracaoCTPSColFootBnd1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpEtiquetaAlteracaoCTPSSmryBnd: TppSummaryBand
      AfterPrint = rpEtiquetaAlteracaoCTPSSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
  end
  object ppEtiquetaAlteracaoCTPS: TppBDEPipeline
    DataSource = dsEtiquetaAlteracaoCTPS
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'EtiquetaAlteracaoCTPS'
    Left = 240
    Top = 48
    object ppEtiquetasAltCTPSppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppEtiquetasAltCTPSppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NOVOSALARIO'
      FieldName = 'NOVOSALARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppEtiquetasAltCTPSppField3: TppField
      FieldAlias = 'NOVAFUNCAO'
      FieldName = 'NOVAFUNCAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppEtiquetasAltCTPSppField4: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 89
      DisplayWidth = 89
      Position = 3
    end
    object ppEtiquetasAltCTPSppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CBO'
      FieldName = 'CBO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object MATRICULA: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsEtiquetaAlteracaoCTPS: TwwDataSource
    DataSet = CdsEtiquetaAlteracaoCTPS
    Left = 240
    Top = 96
  end
  object sqlEtiquetaAlteracaoCTPS: TCMSqlParams
    ClientDataSet = CdsEtiquetaAlteracaoCTPS
    Left = 240
    Top = 190
  end
  object CdsEtiquetaAlteracaoCTPS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsEtiquetaAlteracaoCTPSAfterOpen
    AfterScroll = CdsEtiquetaAlteracaoCTPSAfterScroll
    Left = 240
    Top = 144
  end
end
