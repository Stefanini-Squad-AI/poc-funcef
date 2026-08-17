inherited dtmRelItensEnvioAnalCAPCAR: TdtmRelItensEnvioAnalCAPCAR
  Left = 255
  Top = 219
  Width = 253
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
  object pplItensEnvioAnalCAPCAR: TppBDEPipeline
    DataSource = dtsItensEnvioAnalCAPCAR
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 144
    Top = 56
    object pplItensEnvioAnalCAPCARppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplItensEnvioAnalCAPCARppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplItensEnvioAnalCAPCARppField3: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplItensEnvioAnalCAPCARppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplItensEnvioAnalCAPCARppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplItensEnvioAnalCAPCARppField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplItensEnvioAnalCAPCARppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEPARCELA'
      FieldName = 'HMEPARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplItensEnvioAnalCAPCARppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMENUMPARCELAS'
      FieldName = 'HMENUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplItensEnvioAnalCAPCARppField9: TppField
      FieldAlias = 'DESC_EVENTO'
      FieldName = 'DESC_EVENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 8
    end
    object pplItensEnvioAnalCAPCARppField10: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 25
      DisplayWidth = 25
      Position = 9
    end
    object pplItensEnvioAnalCAPCARppField11: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object pplItensEnvioAnalCAPCARppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTODOCREC'
      FieldName = 'HMEVLRPREVISTODOCREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplItensEnvioAnalCAPCARppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTOREC'
      FieldName = 'HMEVLRPREVISTOREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplItensEnvioAnalCAPCARppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTODOCPAG'
      FieldName = 'HMEVLRPREVISTODOCPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplItensEnvioAnalCAPCARppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTOPAG'
      FieldName = 'HMEVLRPREVISTOPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplItensEnvioAnalCAPCARppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLREFETIVOPAG'
      FieldName = 'HMEVLREFETIVOPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplItensEnvioAnalCAPCARppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLREFETIVOREC'
      FieldName = 'HMEVLREFETIVOREC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object dtsItensEnvioAnalCAPCAR: TwwDataSource
    AutoEdit = False
    DataSet = qryItensEnvioAnalCAPCAR
    Left = 144
    Top = 68
  end
  object rptItensEnvioAnalCAPCAR: TppReport
    AutoStop = False
    DataPipeline = pplItensEnvioAnalCAPCAR
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
    DataPipelineName = 'pplItensEnvioAnalCAPCAR'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 63765
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores Enviados/Recebidos (Financeiro) - analítico'
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
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Situação dos Participantes:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 37835
        mmWidth = 42863
        BandType = 0
      end
      object dtmRelItensEnviolAnal_lblSitPart: TppLabel
        UserName = 'dtmRelItensEnviolAnal_lblSitPart'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 42863
        mmTop = 37835
        mmWidth = 12700
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
      object ppLabel13: TppLabel
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
        mmTop = 37835
        mmWidth = 67204
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
      object ppLabel32: TppLabel
        UserName = 'Label32'
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
        mmTop = 51858
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel34: TppLabel
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
        mmLeft = 153723
        mmTop = 51858
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
        mmTop = 59267
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
        mmTop = 51858
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
        mmLeft = 166159
        mmTop = 51858
        mmWidth = 104775
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
        mmTop = 59267
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
        mmTop = 46831
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
        mmTop = 46831
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
        mmTop = 46831
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
        mmTop = 46831
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
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
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 43921
        mmTop = 794
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HMEVLRPREVISTODOCPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 180711
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEVLRPREVISTOPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 195527
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HMEVLREFETIVOPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 210344
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEVLRPREVISTODOCREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 226219
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 529
        mmTop = 794
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 18521
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 97631
        mmTop = 794
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 31221
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 134144
        mmTop = 794
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'HMEPARCELA'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 168011
        mmTop = 794
        mmWidth = 3704
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'HMEPARCELA'
        DataPipeline = pplItensEnvioAnalCAPCAR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 173038
        mmTop = 794
        mmWidth = 3440
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label13'
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 171450
        mmTop = 794
        mmWidth = 1852
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'HMEVLRPREVISTOREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 241036
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText101'
        DataField = 'HMEVLREFETIVOREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 255853
        mmTop = 794
        mmWidth = 12965
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
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 163777
        mmTop = 5292
        mmWidth = 15610
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5556
        mmLeft = 179388
        mmTop = 3969
        mmWidth = 91546
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'HMEVLRPREVISTOPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 195527
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'HMEVLREFETIVOPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 210344
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'HMEVLRPREVISTODOCREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 226219
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'HMEVLRPREVISTODOCPAG'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 180711
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 18785
        mmTop = 4233
        mmWidth = 29104
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Contrato(s)  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 31750
        mmTop = 5556
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2910
        mmLeft = 20108
        mmTop = 5556
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'HMEVLRPREVISTOREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 241036
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'HMEVLREFETIVOREC'
        DataPipeline = pplItensEnvioAnalCAPCAR
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplItensEnvioAnalCAPCAR'
        mmHeight = 2646
        mmLeft = 255853
        mmTop = 5292
        mmWidth = 12965
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplItensEnvioAnalCAPCAR
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplItensEnvioAnalCAPCAR'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 16140
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PATRO'
          DataPipeline = pplItensEnvioAnalCAPCAR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
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
          mmTop = 10848
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'c/ Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 180711
          mmTop = 7938
          mmWidth = 12965
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
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 210344
          mmTop = 7938
          mmWidth = 12965
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
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 255853
          mmTop = 7938
          mmWidth = 12965
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
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 7938
          mmWidth = 10848
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
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 18521
          mmTop = 7938
          mmWidth = 11377
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
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 43921
          mmTop = 7938
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 226219
          mmTop = 4498
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 180446
          mmTop = 4233
          mmWidth = 42598
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
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 97631
          mmTop = 7938
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 31221
          mmTop = 7938
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 134144
          mmTop = 7938
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 168011
          mmTop = 7938
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Financeiro a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 180446
          mmTop = 1058
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 180711
          mmTop = 5027
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Financeiro a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 226219
          mmTop = 1058
          mmWidth = 42598
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 195527
          mmTop = 5027
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 's/ Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 195527
          mmTop = 7938
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 's/ Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 241036
          mmTop = 7938
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 241036
          mmTop = 5027
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 226219
          mmTop = 5027
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'c/ Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 226219
          mmTop = 7938
          mmWidth = 12965
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
          mmHeight = 5556
          mmLeft = 18785
          mmTop = 2381
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5292
          mmLeft = 179123
          mmTop = 2381
          mmWidth = 91017
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
          DataField = 'HMEVLRPREVISTODOCPAG'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 180711
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'HMEVLRPREVISTODOCREC'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 226219
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'HMEVLRPREVISTOPAG'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 195527
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'HMEVLREFETIVOPAG'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 210344
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Total da Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 149490
          mmTop = 3704
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Contrato(s)  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 31750
          mmTop = 3704
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2910
          mmLeft = 20108
          mmTop = 3704
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'HMEVLRPREVISTOREC'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 241036
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'HMEVLREFETIVOREC'
          DataPipeline = pplItensEnvioAnalCAPCAR
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplItensEnvioAnalCAPCAR'
          mmHeight = 2646
          mmLeft = 255853
          mmTop = 3704
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryItensEnvioAnalCAPCAR: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDPATRO, PTR.NOME AS PATRO,'
      '   CON.NOME, CON.MATRICULA,'
      ''
      '   CON.TCEDESCRICAO,'
      ''
      '   HME.ITEDESCRICAO,'
      '   HME.HMEPARCELA,'
      '   HME.HMENUMPARCELAS,'
      '   HME.DESC_EVENTO,'
      '   HME.ORIGEM,'
      ''
      '   1000000 AS HMEVLRPREVISTODOCREC,'
      '   1000000 AS HMEVLRPREVISTOREC,'
      '   1000000 AS HMEVLRPREVISTODOCPAG,'
      '   1000000 AS HMEVLRPREVISTOPAG,'
      '   1000000 AS HMEVLREFETIVOPAG,'
      '   1000000 AS HMEVLREFETIVOREC'
      ''
      'FROM'
      '   PESSOA       PTR,'
      '   VW_MOVEP     HME,'
      '   VWCONTRATOEP CON'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP    = 1'
      '   AND 1 = 2'
      '   AND HME.HMEANOCOBRANCA   = 2000'
      '   AND HME.HMEMESCOBRANCA   = 2'
      '   AND HME.HMETIPOMOV       NOT IN (5, 8)'
      '   AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0) )'
      '   AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) )'
      '   AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) )'
      '   AND CON.IDPATRO          = PTR.IDPESSOA'
      '   AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME')
    ValidateWithMask = True
    Left = 144
    Top = 80
    object qryItensEnvioAnalCAPCARIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDCONTRATOEMPTMO'
    end
    object qryItensEnvioAnalCAPCARIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWCONTRATOEP.IDPATRO'
    end
    object qryItensEnvioAnalCAPCARPATRO: TStringField
      FieldName = 'PATRO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryItensEnvioAnalCAPCARNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.VWCONTRATOEP.NOME'
      Size = 60
    end
    object qryItensEnvioAnalCAPCARMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.VWCONTRATOEP.MATRICULA'
      Size = 15
    end
    object qryItensEnvioAnalCAPCARTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.VWCONTRATOEP.TCEDESCRICAO'
      Size = 60
    end
    object qryItensEnvioAnalCAPCARHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
      Origin = 'BASEDADOS.VW_MOVEP.HMEPARCELA'
    end
    object qryItensEnvioAnalCAPCARHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
      Origin = 'BASEDADOS.VW_MOVEP.HMENUMPARCELAS'
    end
    object qryItensEnvioAnalCAPCARDESC_EVENTO: TStringField
      FieldName = 'DESC_EVENTO'
      Origin = 'BASEDADOS.VW_MOVEP.DESC_EVENTO'
      Size = 18
    end
    object qryItensEnvioAnalCAPCARORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'BASEDADOS.VW_MOVEP.ORIGEM'
      Size = 25
    end
    object qryItensEnvioAnalCAPCARITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.VW_MOVEP.ITEDESCRICAO'
      Size = 40
    end
    object qryItensEnvioAnalCAPCARHMEVLRPREVISTODOCREC: TFloatField
      FieldName = 'HMEVLRPREVISTODOCREC'
    end
    object qryItensEnvioAnalCAPCARHMEVLRPREVISTOREC: TFloatField
      FieldName = 'HMEVLRPREVISTOREC'
    end
    object qryItensEnvioAnalCAPCARHMEVLRPREVISTODOCPAG: TFloatField
      FieldName = 'HMEVLRPREVISTODOCPAG'
    end
    object qryItensEnvioAnalCAPCARHMEVLRPREVISTOPAG: TFloatField
      FieldName = 'HMEVLRPREVISTOPAG'
    end
    object qryItensEnvioAnalCAPCARHMEVLREFETIVOPAG: TFloatField
      FieldName = 'HMEVLREFETIVOPAG'
    end
    object qryItensEnvioAnalCAPCARHMEVLREFETIVOREC: TFloatField
      FieldName = 'HMEVLREFETIVOREC'
    end
  end
end
