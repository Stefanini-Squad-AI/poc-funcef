inherited dtmRelFechamentoCarteiraLinear: TdtmRelFechamentoCarteiraLinear
  Left = 276
  Top = 240
  Width = 280
  Height = 167
  Caption = 'dtmRelFechamentoCarteiraLinear'
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
  end
  object pplFechamentoCarteiraCaixa: TppBDEPipeline
    DataSource = dsFechamentoCarteiraCaixa
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 152
    Top = 56
  end
  object dsFechamentoCarteiraCaixa: TwwDataSource
    AutoEdit = False
    DataSet = qryFechamentoCarteiraCaixa
    Left = 152
    Top = 68
  end
  object rptFechamentoCarteiraLinear: TppReport
    AutoStop = False
    DataPipeline = pplFechamentoCarteiraCaixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 152
    Top = 8
    Version = '5.5'
    mmColumnWidth = 183542
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 59002
      mmPrintPosition = 0
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
        mmTop = 54504
        mmWidth = 197115
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo da Carteira (Visão Caixa - Linear)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 17727
        mmTop = 9525
        mmWidth = 160867
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
        mmLeft = 18256
        mmTop = 2381
        mmWidth = 160602
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
        mmTop = 25400
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
        mmTop = 25400
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
        mmLeft = 125942
        mmTop = 47096
        mmWidth = 71173
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
        mmLeft = 3440
        mmTop = 47096
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
        mmLeft = 113506
        mmTop = 47096
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
        mmTop = 54504
        mmWidth = 197115
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
        mmLeft = 28310
        mmTop = 47096
        mmWidth = 71173
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 42069
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
        mmLeft = 104246
        mmTop = 42069
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
        mmTop = 42069
        mmWidth = 71173
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
        mmLeft = 125942
        mmTop = 42069
        mmWidth = 71173
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
        mmLeft = 112448
        mmTop = 25400
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
        mmLeft = 112448
        mmTop = 29633
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
        mmLeft = 112448
        mmTop = 33867
        mmWidth = 84667
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 81227
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentWidth = True
        mmHeight = 76465
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PARCELAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 20373
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AMORTIZACAO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 43127
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QUITACAO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 54504
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTALPARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 20373
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TOTALAMO_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 43127
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TOTALQUI_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 54504
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TOTALENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 31750
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText101'
        DataField = 'REC_PARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 20373
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOT_REC_PARC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 20373
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TOT_REC_PARC_ATRAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 65088
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'REC_PARC_ATRAS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 65088
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REC_ENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 32015
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'TOT_REC_ENC_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 32015
        mmWidth = 8731
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
        mmHeight = 2910
        mmLeft = 166688
        mmTop = 1058
        mmWidth = 17198
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
        mmHeight = 2910
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'REC_QUIT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 54769
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'TOT_REC_QUIT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 54769
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'REC_AMORT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 43392
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'TOT_REC_AMORT_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 43392
        mmWidth = 8731
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
        mmHeight = 3175
        mmLeft = 166688
        mmTop = 5027
        mmWidth = 17198
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
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 5027
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENCARGOS_CR'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 31750
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Valor Anterior em Aberto:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 134938
        mmTop = 1058
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Prestações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 20373
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Prestações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 23813
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'PARCELAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 23813
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'TOTALPARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 23813
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Prestações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 27252
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'PARCELAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 27252
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'TOTALPARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 27252
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Encargos (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 31750
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Amortizações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 43127
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label101'
        Caption = 'Quitações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 54504
        mmWidth = 26458
        BandType = 4
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
        mmLeft = 133086
        mmTop = 15081
        mmWidth = 25665
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 105040
        mmTop = 18521
        mmWidth = 81492
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Cobranças Geradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 35190
        mmTop = 15081
        mmWidth = 23019
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 10319
        mmTop = 18521
        mmWidth = 72761
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Prestações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 20373
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Prestações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 23813
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'REC_PARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 23813
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'TOT_REC_PARC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 23813
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Prestações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 27252
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'REC_PARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 27252
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'TOT_REC_PARC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 27252
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Prestações em Atraso (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 65088
        mmWidth = 40217
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Encargos (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 32015
        mmWidth = 25665
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Amortizações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 43392
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quitações (Financeiro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 54769
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Valor Atual em Aberto:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 138377
        mmTop = 5027
        mmWidth = 28575
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Abonos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 66146
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
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
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 66146
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
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
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 66146
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'Encargos (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 35190
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Encargos (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 38629
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText102'
        DataField = 'ENCARGOS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 35190
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'ENCARGOS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 38629
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'TOTALENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 35190
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'TOTALENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 38629
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Amortizações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 46567
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Amortizações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 50006
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'AMORTIZACAO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 46567
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'AMORTIZACAO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 50006
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'TOTALAMO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 46567
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'TOTALAMO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 50006
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Quitações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 57944
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Quitações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 61383
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'QUITACAO_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 57944
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'QUITACAO_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 55033
        mmTop = 61383
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'TOTALQUI_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 57944
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'TOTALQUI_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74348
        mmTop = 61383
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Prestações em Atraso (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 68527
        mmWidth = 41275
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Prestações em Atraso (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 2910
        mmLeft = 10319
        mmTop = 71967
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'REC_PARC_ATRAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 68527
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'REC_PARC_ATRAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 62442
        mmTop = 71967
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'TOT_REC_PARC_ATRAS_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 68527
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'TOT_REC_PARC_ATRAS_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 71967
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label201'
        Caption = 'Encargos (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 35454
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Encargos (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 38894
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'REC_ENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 35454
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        DataField = 'REC_ENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 38894
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText201'
        DataField = 'TOT_REC_ENC_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 35454
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        DataField = 'TOT_REC_ENC_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 38894
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = 'Amortizações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 46831
        mmWidth = 31750
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Amortizações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 50271
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        DataField = 'REC_AMORT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 46831
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        DataField = 'REC_AMORT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 50271
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'TOT_REC_AMORT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 46831
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        DataField = 'TOT_REC_AMORT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 50271
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel49: TppLabel
        UserName = 'Label102'
        Caption = 'Quitações (Folha Patro)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 58208
        mmWidth = 27517
        BandType = 4
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'Quitações (Folha Benefícios)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 61648
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        DataField = 'REC_QUIT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 58208
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        DataField = 'REC_QUIT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 61648
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        DataField = 'TOT_REC_QUIT_FP'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 58208
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText88'
        DataField = 'TOT_REC_QUIT_FB'
        DataPipeline = pplFechamentoCarteiraCaixa
        DisplayFormat = '#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 61648
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = 'Itens "Quitados"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 69586
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
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
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 69586
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 69586
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText2'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplFechamentoCarteiraCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 8731
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 117740
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 196770
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
        mmTop = 1588
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
        mmLeft = 50800
        mmTop = 1588
        mmWidth = 94986
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 170921
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplFechamentoCarteiraCaixa
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine4: TppLine
          OnPrint = ppLine4Print
          UserName = 'Line4'
          Pen.Color = clInfoBk
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplFechamentoCarteiraCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 194734
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
      end
    end
  end
  object qryFechamentoCarteiraCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      '   1000000 AS SALDO_ANT,'
      '     10000 AS TOTALSALDO_ANT,'
      ''
      '   1000000 AS CONCESSOES,'
      '   1000000 AS TOTALCONCESSOES,'
      ''
      '   1000000 AS PARCELAS_CR,'
      '   1000000 AS TOTALPARC_CR,'
      '   1000000 AS PARCELAS_FP,'
      '   1000000 AS TOTALPARC_FP,'
      '   1000000 AS PARCELAS_FB,'
      '   1000000 AS TOTALPARC_FB,'
      ''
      '   1000000 AS ENCARGOS_CR,'
      '   1000000 AS TOTALENC_CR,'
      '   1000000 AS ENCARGOS_FP,'
      '   1000000 AS TOTALENC_FP,'
      '   1000000 AS ENCARGOS_FB,'
      '   1000000 AS TOTALENC_FB,'
      ''
      '   1000000 AS AMORTIZACAO_CR,'
      '   1000000 AS TOTALAMO_CR,'
      '   1000000 AS AMORTIZACAO_FP,'
      '   1000000 AS TOTALAMO_FP,'
      '   1000000 AS AMORTIZACAO_FB,'
      '   1000000 AS TOTALAMO_FB,'
      ''
      '   1000000 AS QUITACAO_CR,'
      '   1000000 AS TOTALQUI_CR,'
      '   1000000 AS QUITACAO_FP,'
      '   1000000 AS TOTALQUI_FP,'
      '   1000000 AS QUITACAO_FB,'
      '   1000000 AS TOTALQUI_FB,'
      ''
      '/*'
      '   1000000 AS PARCELAS_ECR,'
      '   1000000 AS TOTALPARC_ECR,'
      '   1000000 AS PARCELAS_EFP,'
      '   1000000 AS TOTALPARC_EFP,'
      '   1000000 AS PARCELAS_EFB,'
      '   1000000 AS TOTALPARC_EFB,'
      ''
      '   1000000 AS ENCARGOS_ECR,'
      '   1000000 AS TOTALENC_ECR,'
      '   1000000 AS ENCARGOS_EFP,'
      '   1000000 AS TOTALENC_EFP,'
      '   1000000 AS ENCARGOS_EFB,'
      '   1000000 AS TOTALENC_EFB,'
      ''
      '   1000000 AS AMORTIZACAO_ECR,'
      '   1000000 AS TOTALAMO_ECR,'
      '   1000000 AS AMORTIZACAO_EFP,'
      '   1000000 AS TOTALAMO_EFP,'
      '   1000000 AS AMORTIZACAO_EFB,'
      '   1000000 AS TOTALAMO_EFB,'
      ''
      '   1000000 AS QUITACAO_ECR,'
      '   1000000 AS TOTALQUI_ECR,'
      '   1000000 AS QUITACAO_EFP,'
      '   1000000 AS TOTALQUI_EFP,'
      '   1000000 AS QUITACAO_EFB,'
      '   1000000 AS TOTALQUI_EFB,'
      '*/'
      ''
      '   1000000 AS REC_PARC_CR,'
      '   1000000 AS TOT_REC_PARC_CR,'
      ''
      '   1000000 AS REC_PARC_FP,'
      '   1000000 AS TOT_REC_PARC_FP,'
      ''
      '   1000000 AS REC_PARC_FB,'
      '   1000000 AS TOT_REC_PARC_FB,'
      ''
      '   1000000 AS REC_ENC_CR,'
      '   1000000 AS TOT_REC_ENC_CR,'
      '   1000000 AS REC_ENC_FP,'
      '   1000000 AS TOT_REC_ENC_FP,'
      '   1000000 AS REC_ENC_FB,'
      '   1000000 AS TOT_REC_ENC_FB,'
      ''
      '/*'
      '   1000000 AS REC_PARC_ATRAS_CR,'
      '   1000000 AS TOT_REC_PARC_ATRAS_CR,'
      '   1000000 AS REC_PARC_ATRAS_FP,'
      '   1000000 AS TOT_REC_PARC_ATRAS_FP,'
      '   1000000 AS REC_PARC_ATRAS_FB,'
      '   1000000 AS TOT_REC_PARC_ATRAS_FB,'
      '*/'
      ''
      '   1000000 AS REC_AMORT_CR,'
      '   1000000 AS TOT_REC_AMORT_CR,'
      '   1000000 AS REC_AMORT_FP,'
      '   1000000 AS TOT_REC_AMORT_FP,'
      '   1000000 AS REC_AMORT_FB,'
      '   1000000 AS TOT_REC_AMORT_FB,'
      ''
      '   1000000 AS REC_QUIT_CR,'
      '   1000000 AS TOT_REC_QUIT_CR,'
      '   1000000 AS REC_QUIT_FP,'
      '   1000000 AS TOT_REC_QUIT_FP,'
      '   1000000 AS REC_QUIT_FB,'
      '   1000000 AS TOT_REC_QUIT_FB,'
      ''
      '   1000000 AS ABONADO,'
      '   1000000 AS TOT_ABONADO,'
      ''
      '   1000000 AS QUITADO,'
      '   1000000 AS TOT_QUITADO,'
      ''
      '   1000000 AS SALDO_DEV,'
      '   1000000 AS TOTALSALDO_DEV'
      ''
      'FROM'
      '   DUAL'
      ''
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
    object qryFechamentoCarteiraCaixaPARCELAS_CR: TFloatField
      FieldName = 'PARCELAS_CR'
    end
    object qryFechamentoCarteiraCaixaTOTALPARC_CR: TFloatField
      FieldName = 'TOTALPARC_CR'
    end
    object qryFechamentoCarteiraCaixaPARCELAS_FP: TFloatField
      FieldName = 'PARCELAS_FP'
    end
    object qryFechamentoCarteiraCaixaTOTALPARC_FP: TFloatField
      FieldName = 'TOTALPARC_FP'
    end
    object qryFechamentoCarteiraCaixaPARCELAS_FB: TFloatField
      FieldName = 'PARCELAS_FB'
    end
    object qryFechamentoCarteiraCaixaTOTALPARC_FB: TFloatField
      FieldName = 'TOTALPARC_FB'
    end
    object qryFechamentoCarteiraCaixaENCARGOS_CR: TFloatField
      FieldName = 'ENCARGOS_CR'
    end
    object qryFechamentoCarteiraCaixaTOTALENC_CR: TFloatField
      FieldName = 'TOTALENC_CR'
    end
    object qryFechamentoCarteiraCaixaENCARGOS_FP: TFloatField
      FieldName = 'ENCARGOS_FP'
    end
    object qryFechamentoCarteiraCaixaTOTALENC_FP: TFloatField
      FieldName = 'TOTALENC_FP'
    end
    object qryFechamentoCarteiraCaixaENCARGOS_FB: TFloatField
      FieldName = 'ENCARGOS_FB'
    end
    object qryFechamentoCarteiraCaixaTOTALENC_FB: TFloatField
      FieldName = 'TOTALENC_FB'
    end
    object qryFechamentoCarteiraCaixaAMORTIZACAO_CR: TFloatField
      FieldName = 'AMORTIZACAO_CR'
    end
    object qryFechamentoCarteiraCaixaTOTALAMO_CR: TFloatField
      FieldName = 'TOTALAMO_CR'
    end
    object qryFechamentoCarteiraCaixaAMORTIZACAO_FP: TFloatField
      FieldName = 'AMORTIZACAO_FP'
    end
    object qryFechamentoCarteiraCaixaTOTALAMO_FP: TFloatField
      FieldName = 'TOTALAMO_FP'
    end
    object qryFechamentoCarteiraCaixaAMORTIZACAO_FB: TFloatField
      FieldName = 'AMORTIZACAO_FB'
    end
    object qryFechamentoCarteiraCaixaTOTALAMO_FB: TFloatField
      FieldName = 'TOTALAMO_FB'
    end
    object qryFechamentoCarteiraCaixaQUITACAO_CR: TFloatField
      FieldName = 'QUITACAO_CR'
    end
    object qryFechamentoCarteiraCaixaTOTALQUI_CR: TFloatField
      FieldName = 'TOTALQUI_CR'
    end
    object qryFechamentoCarteiraCaixaQUITACAO_FP: TFloatField
      FieldName = 'QUITACAO_FP'
    end
    object qryFechamentoCarteiraCaixaTOTALQUI_FP: TFloatField
      FieldName = 'TOTALQUI_FP'
    end
    object qryFechamentoCarteiraCaixaQUITACAO_FB: TFloatField
      FieldName = 'QUITACAO_FB'
    end
    object qryFechamentoCarteiraCaixaTOTALQUI_FB: TFloatField
      FieldName = 'TOTALQUI_FB'
    end
    object qryFechamentoCarteiraCaixaREC_PARC_CR: TFloatField
      FieldName = 'REC_PARC_CR'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_PARC_CR: TFloatField
      FieldName = 'TOT_REC_PARC_CR'
    end
    object qryFechamentoCarteiraCaixaREC_PARC_FP: TFloatField
      FieldName = 'REC_PARC_FP'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_PARC_FP: TFloatField
      FieldName = 'TOT_REC_PARC_FP'
    end
    object qryFechamentoCarteiraCaixaREC_PARC_FB: TFloatField
      FieldName = 'REC_PARC_FB'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_PARC_FB: TFloatField
      FieldName = 'TOT_REC_PARC_FB'
    end
    object qryFechamentoCarteiraCaixaREC_ENC_CR: TFloatField
      FieldName = 'REC_ENC_CR'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_ENC_CR: TFloatField
      FieldName = 'TOT_REC_ENC_CR'
    end
    object qryFechamentoCarteiraCaixaREC_ENC_FP: TFloatField
      FieldName = 'REC_ENC_FP'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_ENC_FP: TFloatField
      FieldName = 'TOT_REC_ENC_FP'
    end
    object qryFechamentoCarteiraCaixaREC_ENC_FB: TFloatField
      FieldName = 'REC_ENC_FB'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_ENC_FB: TFloatField
      FieldName = 'TOT_REC_ENC_FB'
    end
    object qryFechamentoCarteiraCaixaREC_AMORT_CR: TFloatField
      FieldName = 'REC_AMORT_CR'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_AMORT_CR: TFloatField
      FieldName = 'TOT_REC_AMORT_CR'
    end
    object qryFechamentoCarteiraCaixaREC_AMORT_FP: TFloatField
      FieldName = 'REC_AMORT_FP'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_AMORT_FP: TFloatField
      FieldName = 'TOT_REC_AMORT_FP'
    end
    object qryFechamentoCarteiraCaixaREC_AMORT_FB: TFloatField
      FieldName = 'REC_AMORT_FB'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_AMORT_FB: TFloatField
      FieldName = 'TOT_REC_AMORT_FB'
    end
    object qryFechamentoCarteiraCaixaREC_QUIT_CR: TFloatField
      FieldName = 'REC_QUIT_CR'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_QUIT_CR: TFloatField
      FieldName = 'TOT_REC_QUIT_CR'
    end
    object qryFechamentoCarteiraCaixaREC_QUIT_FP: TFloatField
      FieldName = 'REC_QUIT_FP'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_QUIT_FP: TFloatField
      FieldName = 'TOT_REC_QUIT_FP'
    end
    object qryFechamentoCarteiraCaixaREC_QUIT_FB: TFloatField
      FieldName = 'REC_QUIT_FB'
    end
    object qryFechamentoCarteiraCaixaTOT_REC_QUIT_FB: TFloatField
      FieldName = 'TOT_REC_QUIT_FB'
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
    object qryFechamentoCarteiraCaixaSALDO_DEV: TFloatField
      FieldName = 'SALDO_DEV'
    end
    object qryFechamentoCarteiraCaixaTOTALSALDO_DEV: TFloatField
      FieldName = 'TOTALSALDO_DEV'
    end
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  DESCTIPOEMPTMO = :DESCTIPOEMPTMO,'
      '  TCEDESCRICAO = :TCEDESCRICAO,'
      '  SALDO_ANT = :SALDO_ANT,'
      '  TOTALSALDO_ANT = :TOTALSALDO_ANT,'
      '  CONCESSOES = :CONCESSOES,'
      '  TOTALCONCESSOES = :TOTALCONCESSOES,'
      '  PARCELAS_CR = :PARCELAS_CR,'
      '  TOTALPARC_CR = :TOTALPARC_CR,'
      '  PARCELAS_FP = :PARCELAS_FP,'
      '  TOTALPARC_FP = :TOTALPARC_FP,'
      '  PARCELAS_FB = :PARCELAS_FB,'
      '  TOTALPARC_FB = :TOTALPARC_FB,'
      '  ENCARGOS = :ENCARGOS,'
      '  TOTALENC = :TOTALENC,'
      '  AMORTIZACAO = :AMORTIZACAO,'
      '  TOTALAMO = :TOTALAMO,'
      '  QUITACAO = :QUITACAO,'
      '  TOTALQUI = :TOTALQUI,'
      '  REC_PARC_CR = :REC_PARC_CR,'
      '  TOT_REC_PARC_CR = :TOT_REC_PARC_CR,'
      '  REC_PARC_FP = :REC_PARC_FP,'
      '  TOT_REC_PARC_FP = :TOT_REC_PARC_FP,'
      '  REC_PARC_FB = :REC_PARC_FB,'
      '  TOT_REC_PARC_FB = :TOT_REC_PARC_FB,'
      '  REC_ENC = :REC_ENC,'
      '  TOT_REC_ENC = :TOT_REC_ENC,'
      '  REC_PARC_ATRAS = :REC_PARC_ATRAS,'
      '  TOT_REC_PARC_ATRAS = :TOT_REC_PARC_ATRAS,'
      '  REC_AMORT = :REC_AMORT,'
      '  TOT_REC_AMORT = :TOT_REC_AMORT,'
      '  REC_QUIT = :REC_QUIT,'
      '  TOT_REC_QUIT = :TOT_REC_QUIT,'
      '  SALDO_DEV = :SALDO_DEV,'
      '  TOTALSALDO_DEV = :TOTALSALDO_DEV'
      'where'
      '  DESCTIPOEMPTMO = :OLD_DESCTIPOEMPTMO and'
      '  TCEDESCRICAO = :OLD_TCEDESCRICAO and'
      '  SALDO_ANT = :OLD_SALDO_ANT and'
      '  TOTALSALDO_ANT = :OLD_TOTALSALDO_ANT and'
      '  CONCESSOES = :OLD_CONCESSOES and'
      '  TOTALCONCESSOES = :OLD_TOTALCONCESSOES and'
      '  PARCELAS_CR = :OLD_PARCELAS_CR and'
      '  TOTALPARC_CR = :OLD_TOTALPARC_CR and'
      '  PARCELAS_FP = :OLD_PARCELAS_FP and'
      '  TOTALPARC_FP = :OLD_TOTALPARC_FP and'
      '  PARCELAS_FB = :OLD_PARCELAS_FB and'
      '  TOTALPARC_FB = :OLD_TOTALPARC_FB and'
      '  ENCARGOS = :OLD_ENCARGOS and'
      '  TOTALENC = :OLD_TOTALENC and'
      '  AMORTIZACAO = :OLD_AMORTIZACAO and'
      '  TOTALAMO = :OLD_TOTALAMO and'
      '  QUITACAO = :OLD_QUITACAO and'
      '  TOTALQUI = :OLD_TOTALQUI and'
      '  REC_PARC_CR = :OLD_REC_PARC_CR and'
      '  TOT_REC_PARC_CR = :OLD_TOT_REC_PARC_CR and'
      '  REC_PARC_FP = :OLD_REC_PARC_FP and'
      '  TOT_REC_PARC_FP = :OLD_TOT_REC_PARC_FP and'
      '  REC_PARC_FB = :OLD_REC_PARC_FB and'
      '  TOT_REC_PARC_FB = :OLD_TOT_REC_PARC_FB and'
      '  REC_ENC = :OLD_REC_ENC and'
      '  TOT_REC_ENC = :OLD_TOT_REC_ENC and'
      '  REC_PARC_ATRAS = :OLD_REC_PARC_ATRAS and'
      '  TOT_REC_PARC_ATRAS = :OLD_TOT_REC_PARC_ATRAS and'
      '  REC_AMORT = :OLD_REC_AMORT and'
      '  TOT_REC_AMORT = :OLD_TOT_REC_AMORT and'
      '  REC_QUIT = :OLD_REC_QUIT and'
      '  TOT_REC_QUIT = :OLD_TOT_REC_QUIT and'
      '  SALDO_DEV = :OLD_SALDO_DEV and'
      '  TOTALSALDO_DEV = :OLD_TOTALSALDO_DEV')
    InsertSQL.Strings = (
      'insert into DUAL'
      
        '  (DESCTIPOEMPTMO, TCEDESCRICAO, SALDO_ANT, TOTALSALDO_ANT, CONC' +
        'ESSOES, '
      
        '   TOTALCONCESSOES, PARCELAS_CR, TOTALPARC_CR, PARCELAS_FP, TOTA' +
        'LPARC_FP, '
      
        '   PARCELAS_FB, TOTALPARC_FB, ENCARGOS, TOTALENC, AMORTIZACAO, T' +
        'OTALAMO, '
      
        '   QUITACAO, TOTALQUI, REC_PARC_CR, TOT_REC_PARC_CR, REC_PARC_FP' +
        ', TOT_REC_PARC_FP, '
      
        '   REC_PARC_FB, TOT_REC_PARC_FB, REC_ENC, TOT_REC_ENC, REC_PARC_' +
        'ATRAS, '
      
        '   TOT_REC_PARC_ATRAS, REC_AMORT, TOT_REC_AMORT, REC_QUIT, TOT_R' +
        'EC_QUIT, '
      '   SALDO_DEV, TOTALSALDO_DEV)'
      'values'
      
        '  (:DESCTIPOEMPTMO, :TCEDESCRICAO, :SALDO_ANT, :TOTALSALDO_ANT, ' +
        ':CONCESSOES, '
      
        '   :TOTALCONCESSOES, :PARCELAS_CR, :TOTALPARC_CR, :PARCELAS_FP, ' +
        ':TOTALPARC_FP, '
      
        '   :PARCELAS_FB, :TOTALPARC_FB, :ENCARGOS, :TOTALENC, :AMORTIZAC' +
        'AO, :TOTALAMO, '
      
        '   :QUITACAO, :TOTALQUI, :REC_PARC_CR, :TOT_REC_PARC_CR, :REC_PA' +
        'RC_FP, '
      
        '   :TOT_REC_PARC_FP, :REC_PARC_FB, :TOT_REC_PARC_FB, :REC_ENC, :' +
        'TOT_REC_ENC, '
      
        '   :REC_PARC_ATRAS, :TOT_REC_PARC_ATRAS, :REC_AMORT, :TOT_REC_AM' +
        'ORT, :REC_QUIT, '
      '   :TOT_REC_QUIT, :SALDO_DEV, :TOTALSALDO_DEV)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  DESCTIPOEMPTMO = :OLD_DESCTIPOEMPTMO and'
      '  TCEDESCRICAO = :OLD_TCEDESCRICAO and'
      '  SALDO_ANT = :OLD_SALDO_ANT and'
      '  TOTALSALDO_ANT = :OLD_TOTALSALDO_ANT and'
      '  CONCESSOES = :OLD_CONCESSOES and'
      '  TOTALCONCESSOES = :OLD_TOTALCONCESSOES and'
      '  PARCELAS_CR = :OLD_PARCELAS_CR and'
      '  TOTALPARC_CR = :OLD_TOTALPARC_CR and'
      '  PARCELAS_FP = :OLD_PARCELAS_FP and'
      '  TOTALPARC_FP = :OLD_TOTALPARC_FP and'
      '  PARCELAS_FB = :OLD_PARCELAS_FB and'
      '  TOTALPARC_FB = :OLD_TOTALPARC_FB and'
      '  ENCARGOS = :OLD_ENCARGOS and'
      '  TOTALENC = :OLD_TOTALENC and'
      '  AMORTIZACAO = :OLD_AMORTIZACAO and'
      '  TOTALAMO = :OLD_TOTALAMO and'
      '  QUITACAO = :OLD_QUITACAO and'
      '  TOTALQUI = :OLD_TOTALQUI and'
      '  REC_PARC_CR = :OLD_REC_PARC_CR and'
      '  TOT_REC_PARC_CR = :OLD_TOT_REC_PARC_CR and'
      '  REC_PARC_FP = :OLD_REC_PARC_FP and'
      '  TOT_REC_PARC_FP = :OLD_TOT_REC_PARC_FP and'
      '  REC_PARC_FB = :OLD_REC_PARC_FB and'
      '  TOT_REC_PARC_FB = :OLD_TOT_REC_PARC_FB and'
      '  REC_ENC = :OLD_REC_ENC and'
      '  TOT_REC_ENC = :OLD_TOT_REC_ENC and'
      '  REC_PARC_ATRAS = :OLD_REC_PARC_ATRAS and'
      '  TOT_REC_PARC_ATRAS = :OLD_TOT_REC_PARC_ATRAS and'
      '  REC_AMORT = :OLD_REC_AMORT and'
      '  TOT_REC_AMORT = :OLD_TOT_REC_AMORT and'
      '  REC_QUIT = :OLD_REC_QUIT and'
      '  TOT_REC_QUIT = :OLD_TOT_REC_QUIT and'
      '  SALDO_DEV = :OLD_SALDO_DEV and'
      '  TOTALSALDO_DEV = :OLD_TOTALSALDO_DEV')
    Left = 248
    Top = 64
  end
end
