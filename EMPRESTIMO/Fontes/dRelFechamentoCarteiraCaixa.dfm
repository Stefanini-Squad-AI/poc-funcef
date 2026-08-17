inherited dtmRelFechamentoCarteiraCaixa: TdtmRelFechamentoCarteiraCaixa
  Left = 392
  Top = 361
  Width = 356
  Height = 156
  Caption = 'dtmRelFechamentoCarteiraCaixa'
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
  object pplFechamentoCarteiraCaixa: TppBDEPipeline
    DataSource = dsFechamentoCarteiraCaixa
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplFechamentoCarteiraCaixa'
    Left = 152
    Top = 56
    object pplFechamentoCarteiraCaixappField1: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplFechamentoCarteiraCaixappField2: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplFechamentoCarteiraCaixappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_ANT'
      FieldName = 'SALDO_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplFechamentoCarteiraCaixappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDO_ANT'
      FieldName = 'TOTALSALDO_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplFechamentoCarteiraCaixappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONCESSOES'
      FieldName = 'CONCESSOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplFechamentoCarteiraCaixappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCONCESSOES'
      FieldName = 'TOTALCONCESSOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplFechamentoCarteiraCaixappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS'
      FieldName = 'PARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplFechamentoCarteiraCaixappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPARC'
      FieldName = 'TOTALPARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplFechamentoCarteiraCaixappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS'
      FieldName = 'ENCARGOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplFechamentoCarteiraCaixappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALENC'
      FieldName = 'TOTALENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplFechamentoCarteiraCaixappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO'
      FieldName = 'AMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplFechamentoCarteiraCaixappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAMO'
      FieldName = 'TOTALAMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplFechamentoCarteiraCaixappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO'
      FieldName = 'QUITACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplFechamentoCarteiraCaixappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALQUI'
      FieldName = 'TOTALQUI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplFechamentoCarteiraCaixappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC'
      FieldName = 'REC_PARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplFechamentoCarteiraCaixappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC'
      FieldName = 'TOT_REC_PARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplFechamentoCarteiraCaixappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_ENC'
      FieldName = 'REC_ENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplFechamentoCarteiraCaixappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_ENC'
      FieldName = 'TOT_REC_ENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplFechamentoCarteiraCaixappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC_ATRAS'
      FieldName = 'REC_PARC_ATRAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplFechamentoCarteiraCaixappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_PARC_ATRAS'
      FieldName = 'TOT_REC_PARC_ATRAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplFechamentoCarteiraCaixappField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AMORT'
      FieldName = 'REC_AMORT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplFechamentoCarteiraCaixappField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_AMORT'
      FieldName = 'TOT_REC_AMORT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplFechamentoCarteiraCaixappField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QUIT'
      FieldName = 'REC_QUIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplFechamentoCarteiraCaixappField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_QUIT'
      FieldName = 'TOT_REC_QUIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplFechamentoCarteiraCaixappField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_DEV'
      FieldName = 'SALDO_DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplFechamentoCarteiraCaixappField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDO_DEV'
      FieldName = 'TOTALSALDO_DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplFechamentoCarteiraCaixappField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABONADO'
      FieldName = 'ABONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplFechamentoCarteiraCaixappField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ABONADO'
      FieldName = 'TOT_ABONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplFechamentoCarteiraCaixappField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITADO'
      FieldName = 'QUITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplFechamentoCarteiraCaixappField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_QUITADO'
      FieldName = 'TOT_QUITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
  end
  object dsFechamentoCarteiraCaixa: TwwDataSource
    AutoEdit = False
    DataSet = qryFechamentoCarteiraCaixa
    Left = 152
    Top = 68
  end
  object rptFechamentoCarteiraCaixa: TppReport
    AutoStop = False
    DataPipeline = pplFechamentoCarteiraCaixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira'
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
    Left = 152
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplFechamentoCarteiraCaixa'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 53181
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo da Carteira (Visão Caixa)'
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
        mmLeft = 30427
        mmTop = 20638
        mmWidth = 8467
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
        mmLeft = 1058
        mmTop = 20638
        mmWidth = 28310
        BandType = 0
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
        mmTop = 41275
        mmWidth = 105040
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
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
        mmTop = 41275
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel54: TppLabel
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
        mmTop = 41275
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
        mmTop = 48683
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
        mmTop = 41275
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
        mmTop = 48683
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
        mmTop = 36248
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
        mmTop = 36248
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
        mmTop = 36248
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
        mmTop = 36248
        mmWidth = 105040
        BandType = 0
      end
      object lblApropriado: TppLabel
        UserName = 'lblApropriado'
        AutoSize = False
        Caption = 'Considerando apenas itens apropriados, se abonados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184680
        mmTop = 20638
        mmWidth = 84667
        BandType = 0
      end
      object lblAbonoContab: TppLabel
        UserName = 'lblAbonado1'
        AutoSize = False
        Caption = 'Considerando apenas abonos contabilizados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184680
        mmTop = 24871
        mmWidth = 84667
        BandType = 0
      end
      object lblRenovacao: TppLabel
        UserName = 'lblRenovacao'
        AutoSize = False
        Caption = 'NÃO Considerando quitações por renovação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184680
        mmTop = 29104
        mmWidth = 84667
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 8202
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
        mmHeight = 8202
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 6350
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 54240
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PARCELAS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AMORTIZACAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QUITACAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTALPARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 4498
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TOTALAMO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TOTALQUI'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 4498
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TOTALENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 4498
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText101'
        DataField = 'REC_PARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOT_REC_PARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 4498
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REC_ENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 165365
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TOT_REC_ENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 165365
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'SALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 59267
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'TOTALSALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 59267
        mmTop = 4498
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'REC_QUIT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 1058
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'TOT_REC_QUIT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 4498
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'REC_AMORT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 182298
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TOT_REC_AMORT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 182298
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 253207
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TOTALSALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 253207
        mmTop = 4498
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENCARGOS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 1058
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText201'
        DataField = 'QUITADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ABONADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 219340
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'TOT_ABONADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 219340
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TOT_QUITADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 4498
        mmWidth = 15081
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
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 9260
        mmLeft = 56886
        mmTop = 4233
        mmWidth = 214313
        BandType = 7
      end
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
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'PARCELAS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 5556
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'AMORTIZACAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 5556
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'QUITACAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 5556
        mmWidth = 16140
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
        mmLeft = 41275
        mmTop = 7144
        mmWidth = 15610
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'TOTALPARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 77523
        mmTop = 8996
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc33'
        DataField = 'TOTALAMO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 110331
        mmTop = 8996
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc34'
        DataField = 'TOTALQUI'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 8996
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc23'
        DataField = 'ENCARGOS'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 5556
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc26'
        DataField = 'TOTALENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 8996
        mmWidth = 12965
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc102'
        DataField = 'REC_PARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc27: TppDBCalc
        UserName = 'DBCalc27'
        DataField = 'TOT_REC_PARC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 145257
        mmTop = 8996
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'REC_ENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 165365
        mmTop = 5556
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc36'
        DataField = 'TOT_REC_ENC'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 165365
        mmTop = 8996
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc39: TppDBCalc
        UserName = 'DBCalc39'
        DataField = 'SALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 59267
        mmTop = 5556
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        UserName = 'DBCalc40'
        DataField = 'TOTALSALDO_ANT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 59267
        mmTop = 8996
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc47: TppDBCalc
        UserName = 'DBCalc47'
        DataField = 'SALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 253207
        mmTop = 5556
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc48: TppDBCalc
        UserName = 'DBCalc48'
        DataField = 'TOTALSALDO_DEV'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 253207
        mmTop = 8996
        mmWidth = 16140
        BandType = 7
      end
      object ppDBCalc49: TppDBCalc
        UserName = 'DBCalc49'
        DataField = 'REC_AMORT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 182298
        mmTop = 5556
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc50: TppDBCalc
        UserName = 'DBCalc50'
        DataField = 'TOT_REC_AMORT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 182298
        mmTop = 8996
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'DBCalc51'
        DataField = 'REC_QUIT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 5556
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc52: TppDBCalc
        UserName = 'DBCalc52'
        DataField = 'TOT_REC_QUIT'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 8996
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'ABONADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 219340
        mmTop = 5556
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'TOT_ABONADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 219340
        mmTop = 8996
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        DataField = 'QUITADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 5556
        mmWidth = 15081
        BandType = 7
      end
      object ppDBCalc29: TppDBCalc
        UserName = 'DBCalc29'
        DataField = 'TOT_QUITADO'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFechamentoCarteiraCaixa'
        mmHeight = 2910
        mmLeft = 236273
        mmTop = 8996
        mmWidth = 15081
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplFechamentoCarteiraCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFechamentoCarteiraCaixa'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 13229
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplFechamentoCarteiraCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 109538
          mmTop = 9525
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 63236
          mmTop = 9525
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Valor Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 59002
          mmTop = 6350
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Prestações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 80698
          mmTop = 9525
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 131763
          mmTop = 9525
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 97367
          mmTop = 9525
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 169334
          mmTop = 9525
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 145257
          mmTop = 8467
          mmWidth = 72231
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Recebimentos no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 168540
          mmTop = 5027
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 257176
          mmTop = 9525
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Valor Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 256382
          mmTop = 6350
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 205846
          mmTop = 9525
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 181505
          mmTop = 9525
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Prestações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 150548
          mmTop = 9525
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label102'
          Caption = 'Abonados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 222515
          mmTop = 9525
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = '"Quitados"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 238390
          mmTop = 9525
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 228865
          mmTop = 6350
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 245798
          mmTop = 6350
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 14288
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object rptContratosAdminAnalShape1: TppShape
          UserName = 'rptContratosAdminAnalShape1'
          mmHeight = 8467
          mmLeft = 56886
          mmTop = 1852
          mmWidth = 213784
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'PARCELAS'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 77523
          mmTop = 2910
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'AMORTIZACAO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 110331
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'QUITACAO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 127265
          mmTop = 2910
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'TOTALPARC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 77523
          mmTop = 6350
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'TOTALAMO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 110331
          mmTop = 6350
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'TOTALQUI'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 127265
          mmTop = 6350
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'ENCARGOS'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 2910
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'TOTALENC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 6350
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'REC_PARC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 145257
          mmTop = 2910
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'TOT_REC_PARC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 145257
          mmTop = 6350
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'REC_ENC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 165365
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'TOT_REC_ENC'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 165365
          mmTop = 6350
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'SALDO_ANT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 59267
          mmTop = 2910
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'TOTALSALDO_ANT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 59267
          mmTop = 6350
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc41: TppDBCalc
          UserName = 'DBCalc41'
          DataField = 'REC_AMORT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 182298
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc42'
          DataField = 'TOT_REC_AMORT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 182298
          mmTop = 6350
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc43: TppDBCalc
          UserName = 'DBCalc43'
          DataField = 'REC_QUIT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 199232
          mmTop = 2910
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc44'
          DataField = 'TOT_REC_QUIT'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 199232
          mmTop = 6350
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDO_DEV'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 253207
          mmTop = 2910
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'TOTALSALDO_DEV'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 253207
          mmTop = 6350
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'ABONADO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 219340
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'QUITADO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 236273
          mmTop = 2910
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'TOT_ABONADO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 219340
          mmTop = 6350
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'TOT_QUITADO'
          DataPipeline = pplFechamentoCarteiraCaixa
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFechamentoCarteiraCaixa'
          mmHeight = 2910
          mmLeft = 236273
          mmTop = 6350
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryFechamentoCarteiraCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '     1000000 AS SALDO_ANT,'
      '        1000 AS TOTALSALDO_ANT,'
      ''
      '    10000000 AS CONCESSOES,'
      '       10000 AS TOTALCONCESSOES,'
      ''
      '    10000000 AS PARCELAS,'
      '       10000 AS TOTALPARC,'
      ''
      '      100000 AS ENCARGOS,'
      '        1000 AS TOTALENC,'
      ''
      '     1000000 AS AMORTIZACAO,'
      '         100 AS TOTALAMO,'
      ''
      '    10000000 AS QUITACAO,'
      '        1000 AS TOTALQUI,'
      ''
      '    10000000 AS REC_PARC,'
      '       10000 AS TOT_REC_PARC,'
      ''
      '      100000 AS REC_ENC,'
      '        1000 AS TOT_REC_ENC,'
      ''
      '      100000 AS REC_PARC_ATRAS,'
      '         100 AS TOT_REC_PARC_ATRAS,'
      ''
      '      100000 AS REC_AMORT,'
      '         100 AS TOT_REC_AMORT,'
      ''
      '    10000000 AS REC_QUIT,'
      '        1000 AS TOT_REC_QUIT,'
      ''
      '      100000 AS ABONADO,'
      '         100 AS TOT_ABONADO,'
      ''
      '      100000 AS QUITADO,'
      '         100 AS TOT_QUITADO,'
      ''
      '     1000000 AS SALDO_DEV,'
      '        1000 AS TOTALSALDO_DEV'
      ''
      'FROM'
      '   DUAL'
      'WHERE'
      '   1 = 2')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 152
    Top = 80
    object qryFechamentoCarteiraCaixaDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryFechamentoCarteiraCaixaTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryFechamentoCarteiraCaixaSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qryFechamentoCarteiraCaixaTOTALSALDO_ANT: TFloatField
      FieldName = 'TOTALSALDO_ANT'
    end
    object qryFechamentoCarteiraCaixaCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryFechamentoCarteiraCaixaTOTALCONCESSOES: TFloatField
      FieldName = 'TOTALCONCESSOES'
    end
    object qryFechamentoCarteiraCaixaPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryFechamentoCarteiraCaixaTOTALPARC: TFloatField
      FieldName = 'TOTALPARC'
    end
    object qryFechamentoCarteiraCaixaENCARGOS: TFloatField
      FieldName = 'ENCARGOS'
    end
    object qryFechamentoCarteiraCaixaTOTALENC: TFloatField
      FieldName = 'TOTALENC'
    end
    object qryFechamentoCarteiraCaixaAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryFechamentoCarteiraCaixaTOTALAMO: TFloatField
      FieldName = 'TOTALAMO'
    end
    object qryFechamentoCarteiraCaixaQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryFechamentoCarteiraCaixaTOTALQUI: TFloatField
      FieldName = 'TOTALQUI'
    end
    object qryFechamentoCarteiraCaixaREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_PARC: TFloatField
      FieldName = 'TOT_REC_PARC'
    end
    object qryFechamentoCarteiraCaixaREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_ENC: TFloatField
      FieldName = 'TOT_REC_ENC'
    end
    object qryFechamentoCarteiraCaixaREC_PARC_ATRAS: TFloatField
      FieldName = 'REC_PARC_ATRAS'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_PARC_ATRAS: TFloatField
      FieldName = 'TOT_REC_PARC_ATRAS'
    end
    object qryFechamentoCarteiraCaixaREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_AMORT: TFloatField
      FieldName = 'TOT_REC_AMORT'
    end
    object qryFechamentoCarteiraCaixaREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_QUIT: TFloatField
      FieldName = 'TOT_REC_QUIT'
    end
    object qryFechamentoCarteiraCaixaSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryFechamentoCarteiraCaixaTOTALSALDO_DEV: TFloatField
      FieldName = 'TOTALSALDO_DEV'
    end
    object qryFechamentoCarteiraCaixaABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryFechamentoCarteiraCaixaTOT_ABONADO: TFloatField
      FieldName = 'TOT_ABONADO'
    end
    object qryFechamentoCarteiraCaixaQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
    object qryFechamentoCarteiraCaixaTOT_QUITADO: TFloatField
      FieldName = 'TOT_QUITADO'
    end
  end
  object upd: TUpdateSQL
    Left = 272
    Top = 56
  end
end
