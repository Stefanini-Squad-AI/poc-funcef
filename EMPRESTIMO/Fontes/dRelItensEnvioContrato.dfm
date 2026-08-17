inherited dtmRelItensEnvioContrato: TdtmRelItensEnvioContrato
  Left = 255
  Top = 219
  Width = 217
  Height = 165
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
  object pplItensEnvioContrato: TppBDEPipeline
    DataSource = dtsItensEnvioContrato
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplItensEnvioContratoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplItensEnvioContratoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplItensEnvioContratoppField3: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplItensEnvioContratoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplItensEnvioContratoppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pplItensEnvioContratoppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplItensEnvioContratoppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object pplItensEnvioContratoppField8: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplItensEnvioContratoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREV_BENEF'
      FieldName = 'VLR_PREV_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplItensEnvioContratoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_EFET_BENEF'
      FieldName = 'VLR_EFET_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplItensEnvioContratoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREV_PATRO'
      FieldName = 'VLR_PREV_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplItensEnvioContratoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_EFET_PATRO'
      FieldName = 'VLR_EFET_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object dtsItensEnvioContrato: TwwDataSource
    AutoEdit = False
    DataSet = qryItensEnvioContrato
    Left = 136
    Top = 68
  end
  object rtpItensEnvioContrato: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioContrato
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
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplItensEnvioContrato'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Valores Enviados/Recebidos por Patrocinadora (sintético por Cont' +
          'rato)'
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
      object ppLabel13: TppLabel
        OnPrint = ppLabel13Print
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 16669
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Situação dos Participantes:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 21167
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 11377
        mmTop = 16669
        mmWidth = 28046
        BandType = 0
      end
      object dtmRelItensEnviolContrato_lblSitPart: TppLabel
        UserName = 'dtmRelItensEnviolContrato_lblSitPart'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 21167
        mmWidth = 12700
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
        mmTop = 33867
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
        mmTop = 33867
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
        mmTop = 41275
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
        mmTop = 33867
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
        mmTop = 33867
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
        mmTop = 41275
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
        mmTop = 28840
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
        mmTop = 28840
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
        mmTop = 28840
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
        mmTop = 28840
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
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
        DataField = 'NOME'
        DataPipeline = pplItensEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 40217
        mmTop = 1058
        mmWidth = 65881
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 159544
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 178594
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 199761
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 218811
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplItensEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 22225
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplItensEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3440
        mmLeft = 107950
        mmTop = 1058
        mmWidth = 47625
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
        mmLeft = 242888
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
        mmLeft = 140229
        mmTop = 5556
        mmWidth = 17727
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 157957
        mmTop = 4233
        mmWidth = 80698
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLR_EFET_PATRO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 178594
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_PREV_BENEF'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 199761
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLR_EFET_BENEF'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 218811
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLR_PREV_PATRO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 159544
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLR_PREV_FIN'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 218546
        mmTop = 16933
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLR_EFET_FIN'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 237596
        mmTop = 16933
        mmWidth = 18256
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Pen.Width = 2
        mmHeight = 6350
        mmLeft = 18785
        mmTop = 4233
        mmWidth = 32544
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Contrato(s)  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 5556
        mmWidth = 16404
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioContrato
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplItensEnvioContrato'
        mmHeight = 3175
        mmLeft = 20108
        mmTop = 5556
        mmWidth = 10848
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplItensEnvioContrato
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensEnvioContrato'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 11113
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 529
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
          mmTop = 10583
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 159544
          mmTop = 7144
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Folha da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 163777
          mmTop = 2381
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 178330
          mmTop = 7144
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 199761
          mmTop = 7144
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 218546
          mmTop = 7144
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Folha de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 206375
          mmTop = 2646
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 6879
          mmTop = 7144
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 22225
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40217
          mmTop = 7144
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 201613
          mmTop = 6085
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 161396
          mmTop = 6085
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 107950
          mmTop = 7144
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 18785
          mmTop = 2381
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Width = 2
          mmHeight = 6350
          mmLeft = 157957
          mmTop = 2381
          mmWidth = 80698
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_PREV_PATRO'
          DataPipeline = pplItensEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 159544
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_EFET_BENEF'
          DataPipeline = pplItensEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 218811
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLR_EFET_PATRO'
          DataPipeline = pplItensEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 178594
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLR_PREV_BENEF'
          DataPipeline = pplItensEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 199761
          mmTop = 3704
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Total da Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 123825
          mmTop = 3440
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Contrato(s)  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31750
          mmTop = 3704
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplItensEnvioContrato
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplItensEnvioContrato'
          mmHeight = 3175
          mmLeft = 20108
          mmTop = 3704
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryItensEnvioContrato: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryItensEnvioContratoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      ''
      '   CON.IDPATRO, PTR.NOME AS PATRO,'
      '   CON.IDPLANOPREV, PLP.NOME AS PLANO,'
      ''
      '   CON.NOME, CON.MATRICULA, CON.TCEDESCRICAO,'
      ''
      '   NVL(HBP.VLRPREVISTO, 0) AS VLR_PREV_BENEF,'
      '   NVL(HBE.VLREFETIVO, 0)  AS VLR_EFET_BENEF,'
      '   NVL(HPP.VLRPREVISTO, 0) AS VLR_PREV_PATRO,'
      '   NVL(HPE.VLREFETIVO, 0)  AS VLR_EFET_PATRO,'
      '   NVL(HFP.VLRPREVISTO, 0) AS VLR_PREV_FIN,'
      '   NVL(HFE.VLREFETIVO, 0)  AS VLR_EFET_FIN'
      'FROM'
      '   PESSOA       PTR,'
      '   VWCONTRATOEP CON,'
      '   PLANPREV     PLP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBE,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPE,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'C'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HFP,'
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'C'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HFE'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP    = 1'
      '   AND CON.IDPATRO          = PTR.IDPESSOA'
      '   AND CON.IDPLANOPREV      = PLP.IDPLANOPREV'
      '   AND CON.IDCONTRATOEMPTMO = HBP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HBE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HFP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HFE.IDCONTRATOEMPTMO(+)'
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME')
    ValidateWithMask = True
    Left = 136
    Top = 80
    object qryItensEnvioContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryItensEnvioContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryItensEnvioContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryItensEnvioContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryItensEnvioContratoPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryItensEnvioContratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryItensEnvioContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryItensEnvioContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryItensEnvioContratoVLR_PREV_BENEF: TFloatField
      FieldName = 'VLR_PREV_BENEF'
    end
    object qryItensEnvioContratoVLR_EFET_BENEF: TFloatField
      FieldName = 'VLR_EFET_BENEF'
    end
    object qryItensEnvioContratoVLR_PREV_PATRO: TFloatField
      FieldName = 'VLR_PREV_PATRO'
    end
    object qryItensEnvioContratoVLR_EFET_PATRO: TFloatField
      FieldName = 'VLR_EFET_PATRO'
    end
  end
end
