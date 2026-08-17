inherited dtmRelItensEnvioSintCAPCAR: TdtmRelItensEnvioSintCAPCAR
  Left = 333
  Top = 244
  Width = 334
  Height = 167
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplItensEnvioSintCAPCAR: TppBDEPipeline
    DataSource = dtsItensEnvioSintCAPCAR
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 144
    Top = 56
    object pplItensEnvioSintCAPCARppField1: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplItensEnvioSintCAPCARppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplItensEnvioSintCAPCARppField3: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplItensEnvioSintCAPCARppField4: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplItensEnvioSintCAPCARppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_CAP'
      FieldName = 'QUANT_CAP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplItensEnvioSintCAPCARppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CAP'
      FieldName = 'VLR_CAP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplItensEnvioSintCAPCARppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CAPDOC'
      FieldName = 'VLR_CAPDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplItensEnvioSintCAPCARppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REC_CAP'
      FieldName = 'VLR_REC_CAP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplItensEnvioSintCAPCARppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT_CAR'
      FieldName = 'QUANT_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplItensEnvioSintCAPCARppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CARDOC'
      FieldName = 'VLR_CARDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplItensEnvioSintCAPCARppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CAR'
      FieldName = 'VLR_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplItensEnvioSintCAPCARppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REC_CAR'
      FieldName = 'VLR_REC_CAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object dtsItensEnvioSintCAPCAR: TwwDataSource
    DataSet = qryItensEnvioSintCAPCAR
    Left = 144
    Top = 68
  end
  object rptItensEnviadosSintCAPCAR: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioSintCAPCAR
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Itens Enviados (Sintético)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
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
    Left = 144
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplItensEnvioSintCAPCAR'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 55033
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores Enviados/Recebidos (Financeiro) - sintético por Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object lblPositivoNegativo: TppLabel
        UserName = 'lblPositivoNegativo'
        AutoSize = False
        Caption = 'Valores negativos tratados como Positivos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 202142
        mmTop = 30427
        mmWidth = 67204
        BandType = 0
      end
      object lblMesCobranca: TppLabel
        UserName = 'Label3'
        Caption = 'lblMesCobranca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 21960
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        AutoSize = False
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 21960
        mmWidth = 42863
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Datas Efetivas entre:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 30427
        mmWidth = 42863
        BandType = 0
      end
      object lblDataEfetivaIni: TppLabel
        UserName = 'lblDataEfetivaIni'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 30427
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = ' e '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 58473
        mmTop = 30163
        mmWidth = 3175
        BandType = 0
      end
      object lblDataEfetivaFim: TppLabel
        UserName = 'lblDataEfetivaFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 62177
        mmTop = 30427
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Datas de Vencimento entre:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 26194
        mmWidth = 42863
        BandType = 0
      end
      object lblDataVenctoIni: TppLabel
        UserName = 'lblDataVenctoIni'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 26194
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = ' e '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 58473
        mmTop = 25929
        mmWidth = 3175
        BandType = 0
      end
      object lblDataVenctoFim: TppLabel
        UserName = 'lblDataVenctoFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 62177
        mmTop = 26194
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 43127
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153459
        mmTop = 43127
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 50536
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 43127
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 165894
        mmTop = 43127
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 50536
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 38100
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 38100
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 38100
        mmWidth = 102659
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 165894
        mmTop = 38100
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensEnvioSintCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 6350
        mmTop = 1058
        mmWidth = 90488
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'QUANT_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 117740
        mmTop = 1058
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_CAPDOC'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 129382
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_REC_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QUANT_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 196057
        mmTop = 1058
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_CARDOC'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 207698
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLR_REC_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 250561
        mmTop = 1058
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLR_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 150548
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText101'
        DataField = 'VLR_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 229130
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23813
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
        mmLeft = 87842
        mmTop = 3175
        mmWidth = 94986
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
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 1588
        mmWidth = 270542
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 98425
        mmTop = 7408
        mmWidth = 17727
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 116152
        mmTop = 6085
        mmWidth = 155046
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'QUANT_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 117740
        mmTop = 7408
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VLR_CAPDOC'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 129382
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLR_REC_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'QUANT_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 196057
        mmTop = 7408
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLR_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 229130
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_REC_CAR'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 250561
        mmTop = 7408
        mmWidth = 18785
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'VLR_CARDOC'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 207434
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLR_CAP'
        DataPipeline = pplItensEnvioSintCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioSintCAPCAR'
        mmHeight = 3440
        mmLeft = 150548
        mmTop = 7408
        mmWidth = 20373
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplItensEnvioSintCAPCAR
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensEnvioSintCAPCAR'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 6879
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3704
          mmLeft = 529
          mmTop = 1588
          mmWidth = 61648
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplItensEnvioSintCAPCAR
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensEnvioSintCAPCAR'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 83608
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label2'
          Caption = 'Total Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 87048
          mmTop = 2117
          mmWidth = 29104
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 6350
          mmLeft = 116152
          mmTop = 1058
          mmWidth = 154517
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'QUANT_CAP'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 117740
          mmTop = 2381
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VLR_CAPDOC'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 129382
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VLR_REC_CAP'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 171715
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'QUANT_CAR'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 196057
          mmTop = 2381
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLR_CAR'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 229130
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'VLR_REC_CAR'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 250561
          mmTop = 2381
          mmWidth = 18785
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_CARDOC'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 207698
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_CAP'
          DataPipeline = pplItensEnvioSintCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 150548
          mmTop = 2381
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplItensEnvioSintCAPCAR
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensEnvioSintCAPCAR'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 13758
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 5556
          mmWidth = 92604
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 13494
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 10054
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 117740
          mmTop = 5556
          mmWidth = 74348
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155575
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 175155
          mmTop = 10054
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label203'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 198173
          mmTop = 10054
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Vlr.Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 252413
          mmTop = 10054
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioSintCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplItensEnvioSintCAPCAR'
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 83608
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label1'
          Caption = 'c/ Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 131498
          mmTop = 10054
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 134409
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 's/ Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 152665
          mmTop = 10054
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'c/ Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 209815
          mmTop = 10054
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 212725
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 's/ Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 231246
          mmTop = 10054
          mmWidth = 18256
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Vlr.Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 234157
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 194998
          mmTop = 5556
          mmWidth = 74348
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Financeiro (a Pagar)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 141552
          mmTop = 1852
          mmWidth = 26458
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Financeiro (a Receber)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 219605
          mmTop = 1852
          mmWidth = 29898
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
      end
    end
  end
  object qryItensEnvioSintCAPCAR: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '   '#39'                                                            ' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'                                                            ' +
        #39' AS PATRO,'
      
        '   '#39'                                                            ' +
        #39' AS TCEDESCRICAO,'
      
        '   '#39'                                                            ' +
        #39' AS ITEDESCRICAO,'
      ''
      '   0 AS QUANT_CAP,'
      '   0 AS VLR_CAP,'
      '   0 AS VLR_CAPDOC,'
      '   0 AS VLR_REC_CAP,'
      ''
      '   0 AS QUANT_CAR,'
      '   0 AS VLR_CARDOC,'
      '   0 AS VLR_CAR,'
      '   0 AS VLR_REC_CAR'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    UpdateObject = UpdateSQL
    ValidateWithMask = True
    Left = 144
    Top = 80
    object qryItensEnvioSintCAPCARDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintCAPCARPATRO: TStringField
      FieldName = 'PATRO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintCAPCARTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintCAPCARITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryItensEnvioSintCAPCARQUANT_CAP: TFloatField
      FieldName = 'QUANT_CAP'
    end
    object qryItensEnvioSintCAPCARVLR_CAP: TFloatField
      FieldName = 'VLR_CAP'
    end
    object qryItensEnvioSintCAPCARVLR_CAPDOC: TFloatField
      FieldName = 'VLR_CAPDOC'
    end
    object qryItensEnvioSintCAPCARVLR_REC_CAP: TFloatField
      FieldName = 'VLR_REC_CAP'
    end
    object qryItensEnvioSintCAPCARQUANT_CAR: TFloatField
      FieldName = 'QUANT_CAR'
    end
    object qryItensEnvioSintCAPCARVLR_CARDOC: TFloatField
      FieldName = 'VLR_CARDOC'
    end
    object qryItensEnvioSintCAPCARVLR_CAR: TFloatField
      FieldName = 'VLR_CAR'
    end
    object qryItensEnvioSintCAPCARVLR_REC_CAR: TFloatField
      FieldName = 'VLR_REC_CAR'
    end
  end
  object UpdateSQL: TUpdateSQL
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (DESCTIPOEMPTMO, TCEDESCRICAO, ITEDESCRICAO, QUANT_PATRO, '
      'VLR_PATRO, '
      '   VLR_REC_PATRO, QUANT_BENEF, VLR_BENEF, VLR_REC_BENEF, '
      'QUANT_CAR, VLR_CAR, '
      '   VLR_REC_CAR)'
      'values'
      '  (:DESCTIPOEMPTMO, :TCEDESCRICAO, :ITEDESCRICAO, :QUANT_PATRO, '
      ':VLR_PATRO, '
      '   :VLR_REC_PATRO, :QUANT_BENEF, :VLR_BENEF, :VLR_REC_BENEF, '
      ':QUANT_CAR, '
      '   :VLR_CAR, :VLR_REC_CAR)')
    Left = 256
    Top = 56
  end
end
