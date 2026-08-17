inherited dtmRelResumoContratoCaixa: TdtmRelResumoContratoCaixa
  Left = 276
  Top = 240
  Width = 302
  Height = 167
  Caption = 'dtmRelResumoContratoCaixa'
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
  object pplResumoContratoCaixa: TppBDEPipeline
    DataSource = dsResumoContratoCaixa
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 152
    Top = 56
    object pplResumoContratoCaixappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplResumoContratoCaixappField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplResumoContratoCaixappField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object pplResumoContratoCaixappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplResumoContratoCaixappField5: TppField
      FieldAlias = 'DESCTIPOEMPTMO'
      FieldName = 'DESCTIPOEMPTMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplResumoContratoCaixappField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplResumoContratoCaixappField7: TppField
      FieldAlias = 'NOME_PLANO'
      FieldName = 'NOME_PLANO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplResumoContratoCaixappField8: TppField
      FieldAlias = 'NOME_PATRO'
      FieldName = 'NOME_PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplResumoContratoCaixappField9: TppField
      FieldAlias = 'SITDESCRICAO'
      FieldName = 'SITDESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object pplResumoContratoCaixappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_ANT'
      FieldName = 'SALDO_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplResumoContratoCaixappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONCESSOES'
      FieldName = 'CONCESSOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplResumoContratoCaixappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELAS'
      FieldName = 'PARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplResumoContratoCaixappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENCARGOS'
      FieldName = 'ENCARGOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplResumoContratoCaixappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMORTIZACAO'
      FieldName = 'AMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplResumoContratoCaixappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITACAO'
      FieldName = 'QUITACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplResumoContratoCaixappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'AJUSTES'
      FieldName = 'AJUSTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplResumoContratoCaixappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_PARC'
      FieldName = 'REC_PARC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplResumoContratoCaixappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_ENC'
      FieldName = 'REC_ENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplResumoContratoCaixappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AMORT'
      FieldName = 'REC_AMORT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplResumoContratoCaixappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_QUIT'
      FieldName = 'REC_QUIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplResumoContratoCaixappField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_DEV'
      FieldName = 'SALDO_DEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplResumoContratoCaixappField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'REC_AJUSTES'
      FieldName = 'REC_AJUSTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplResumoContratoCaixappField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'ABONADO'
      FieldName = 'ABONADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplResumoContratoCaixappField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUITADO'
      FieldName = 'QUITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
  end
  object dsResumoContratoCaixa: TwwDataSource
    DataSet = qryResumoContratoCaixa
    Left = 152
    Top = 68
  end
  object rptResumoContratoCaixa: TppReport
    AutoStop = False
    DataPipeline = pplResumoContratoCaixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo de Contratos'
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
    DataPipelineName = 'pplResumoContratoCaixa'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 53446
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo de Contratos (visão Caixa)'
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
        mmTop = 41540
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
        mmTop = 41540
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
        mmTop = 41540
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
        mmTop = 48948
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
        mmTop = 41540
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
        mmTop = 48948
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
        mmLeft = 0
        mmTop = 36513
        mmWidth = 28575
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
        mmTop = 36513
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
        mmTop = 36513
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
        mmTop = 36513
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
      object lblEmAberto: TppLabel
        UserName = 'lblEmAberto'
        AutoSize = False
        Caption = 'Exibindo apenas contratos com itens em aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 29104
        mmWidth = 84667
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3969
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplResumoContratoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 529
        mmTop = 794
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'MATRICULA'
        DataPipeline = pplResumoContratoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 16669
        mmTop = 794
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NOME'
        DataPipeline = pplResumoContratoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 30163
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'PARCELAS'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 79640
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ENCARGOS'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 93927
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'AMORTIZACAO'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 108215
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AJUSTES'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 122502
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'REC_PARC'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 151077
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'REC_ENC'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 166952
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REC_AMORT'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 181769
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'REC_AJUSTES'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 196586
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'REC_QUIT'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 211403
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDO_DEV'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 256911
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'SALDO_ANT'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 65352
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'QUITACAO'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 136790
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText11'
        DataField = 'ABONADO'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 227278
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'QUITADO'
        DataPipeline = pplResumoContratoCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoCaixa'
        mmHeight = 2646
        mmLeft = 242094
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
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOME_PLANO'
      DataPipeline = pplResumoContratoCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoCaixa'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText2'
          DataPipeline = pplResumoContratoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2910
          mmLeft = 265
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplResumoContratoCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoCaixa'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppDBText11: TppDBText
          UserName = 'DBText3'
          DataPipeline = pplResumoContratoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplResumoContratoCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoCaixa'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplResumoContratoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 794
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 6085
          mmTop = 8996
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 16669
          mmTop = 8996
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 30163
          mmTop = 8996
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 106892
          mmTop = 8996
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 67204
          mmTop = 8996
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Valor Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 63765
          mmTop = 6085
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Prestações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 80698
          mmTop = 8996
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 138907
          mmTop = 8996
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 96838
          mmTop = 8996
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 169863
          mmTop = 8996
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 151077
          mmTop = 7938
          mmWidth = 74348
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Recebimentos no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2646
          mmLeft = 177007
          mmTop = 4763
          mmWidth = 22490
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 215107
          mmTop = 8996
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Amortizações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 180446
          mmTop = 8996
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Prestações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 153723
          mmTop = 8996
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label102'
          Caption = 'Abonados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 229923
          mmTop = 8996
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = '"Quitados"'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 243682
          mmTop = 8996
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 235215
          mmTop = 6085
          mmWidth = 5027
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 258763
          mmTop = 8996
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Valor Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 258234
          mmTop = 6085
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 250032
          mmTop = 6085
          mmWidth = 5027
          BandType = 3
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Ajustes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 127265
          mmTop = 8996
          mmWidth = 7673
          BandType = 3
          GroupNo = 2
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Ajustes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 201877
          mmTop = 8996
          mmWidth = 7673
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 11113
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 4763
          mmLeft = 63500
          mmTop = 1323
          mmWidth = 207169
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'ENCARGOS'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 93927
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'AJUSTES'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 122502
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'QUITACAO'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 136790
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'AMORTIZACAO'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 108215
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'PARCELAS'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 79640
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'REC_ENC'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 166952
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'REC_AMORT'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 181769
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc42: TppDBCalc
          UserName = 'DBCalc42'
          DataField = 'REC_ENC'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 196586
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc44: TppDBCalc
          UserName = 'DBCalc44'
          DataField = 'REC_QUIT'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 211403
          mmTop = 2381
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc46: TppDBCalc
          UserName = 'DBCalc46'
          DataField = 'SALDO_DEV'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 256911
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 1
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Total:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 55827
          mmTop = 2381
          mmWidth = 7673
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDO_ANT'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 65352
          mmTop = 2381
          mmWidth = 12435
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'REC_PARC'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 151077
          mmTop = 2381
          mmWidth = 14023
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'QUITADO'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 242094
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'ABONADO'
          DataPipeline = pplResumoContratoCaixa
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 227278
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplResumoContratoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplResumoContratoCaixa'
          mmHeight = 2381
          mmLeft = 2910
          mmTop = 2381
          mmWidth = 11906
          BandType = 5
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label4'
          Caption = 'Contratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 15875
          mmTop = 2381
          mmWidth = 10054
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryResumoContratoCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   3000000025412                                                ' +
        '  AS IDCONTRATOEMPTMO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME,'
      
        '   '#39'987587-00    '#39'                                              ' +
        '  AS MATRICULA,'
      
        '   1234567                                                      ' +
        '  AS INSCRICAONUMERO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME_PLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME_PATRO,'
      ''
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39' AS SITDE' +
        'SCRICAO,'
      ''
      '    10000000 AS SALDO_ANT,'
      '    10000000 AS CONCESSOES,'
      '    10000000 AS PARCELAS,'
      '     1000000 AS ENCARGOS,'
      '    10000000 AS AMORTIZACAO,'
      '    10000000 AS QUITACAO,'
      '     1000000 AS AJUSTES,'
      '   -10000000 AS REC_PARC,'
      '    -1000000 AS REC_ENC,'
      '    -1000000 AS REC_AMORT,'
      '   -10000000 AS REC_QUIT,'
      ''
      '    -1000000 AS ABONADO,'
      '    -1000000 AS QUITADO,'
      ''
      '    -1000000 AS REC_AJUSTES,'
      '    10000000 AS SALDO_DEV'
      ''
      'FROM'
      '   DUAL'
      ''
      'where'
      '   1 = 2')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 152
    Top = 80
    object qryResumoContratoCaixaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryResumoContratoCaixaNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoCaixaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryResumoContratoCaixaINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryResumoContratoCaixaDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoCaixaTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoCaixaNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoCaixaNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoCaixaSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryResumoContratoCaixaSALDO_ANT: TFloatField
      FieldName = 'SALDO_ANT'
    end
    object qryResumoContratoCaixaCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryResumoContratoCaixaPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryResumoContratoCaixaENCARGOS: TFloatField
      FieldName = 'ENCARGOS'
    end
    object qryResumoContratoCaixaAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryResumoContratoCaixaQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryResumoContratoCaixaAJUSTES: TFloatField
      FieldName = 'AJUSTES'
    end
    object qryResumoContratoCaixaREC_PARC: TFloatField
      FieldName = 'REC_PARC'
    end
    object qryResumoContratoCaixaREC_ENC: TFloatField
      FieldName = 'REC_ENC'
    end
    object qryResumoContratoCaixaREC_AMORT: TFloatField
      FieldName = 'REC_AMORT'
    end
    object qryResumoContratoCaixaREC_QUIT: TFloatField
      FieldName = 'REC_QUIT'
    end
    object qryResumoContratoCaixaSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryResumoContratoCaixaREC_AJUSTES: TFloatField
      FieldName = 'REC_AJUSTES'
    end
    object qryResumoContratoCaixaABONADO: TFloatField
      FieldName = 'ABONADO'
    end
    object qryResumoContratoCaixaQUITADO: TFloatField
      FieldName = 'QUITADO'
    end
  end
  object upd: TUpdateSQL
    Left = 240
    Top = 56
  end
end
