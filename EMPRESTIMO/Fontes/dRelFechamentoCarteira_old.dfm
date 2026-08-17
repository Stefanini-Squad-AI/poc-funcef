inherited dtmRelFechamentoCarteira_old: TdtmRelFechamentoCarteira_old
  Left = 21
  Top = 416
  Width = 244
  Height = 167
  Caption = 'dtmRelFechamentoCarteira_old'
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
  object pplFechamentoCarteira: TppBDEPipeline
    DataSource = dsFechamentoCarteira
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
  end
  object dsFechamentoCarteira: TwwDataSource
    DataSet = qryFechamentoCarteira
    Left = 136
    Top = 68
  end
  object rptFechamentoCarteira: TppReport
    AutoStop = False
    DataPipeline = pplFechamentoCarteira
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = '210 x 297 mm'
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
    Left = 136
    Top = 8
    Version = '5.5'
    mmColumnWidth = 270542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo da Carteira'
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
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35719
        mmTop = 16669
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16669
        mmWidth = 34925
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 8996
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
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplFechamentoCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 79375
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SALDODEV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 83079
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CONCESSOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 103188
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'RENOVACOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 121444
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PARCELAS'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 139700
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ENCARGOS'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 176213
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'AMORTIZACAO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 194205
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QUITACAO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 212461
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QUIT_MORT'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 230717
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SALDOATU'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 250032
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TOTALSLDDEV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 91546
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TOTALCONCESSOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 109802
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TOTALRENOV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 128059
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTALPARC'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 146315
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'TOTALENC'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 182563
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'TOTALAMO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 200819
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'TOTALQUI'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 219075
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TOTALQUM'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 237332
        mmTop = 4498
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText101'
        DataField = 'TOTALSLA'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 258498
        mmTop = 4498
        mmWidth = 10848
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
        mmHeight = 8996
        mmLeft = 82021
        mmTop = 4498
        mmWidth = 188648
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
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'RENOVACOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 121444
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'PARCELAS'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 139700
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'SALDODEV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 83079
        mmTop = 5556
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'CONCESSOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 103188
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'ENCARGOS'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 175948
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'AMORTIZACAO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 194205
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'QUITACAO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 212461
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'QUIT_MORT'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 230717
        mmTop = 5556
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'SALDOATU'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 250032
        mmTop = 5556
        mmWidth = 19315
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
        mmHeight = 3440
        mmLeft = 63765
        mmTop = 7408
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc28: TppDBCalc
        UserName = 'DBCalc28'
        DataField = 'TOTALSLDDEV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 91546
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc29: TppDBCalc
        UserName = 'DBCalc29'
        DataField = 'TOTALCONCESSOES'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 109802
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc30: TppDBCalc
        UserName = 'DBCalc101'
        DataField = 'TOTALRENOV'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 128059
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'TOTALPARC'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 146315
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc32: TppDBCalc
        UserName = 'DBCalc32'
        DataField = 'TOTALENC'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 182563
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc33: TppDBCalc
        UserName = 'DBCalc33'
        DataField = 'TOTALAMO'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 200819
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc34: TppDBCalc
        UserName = 'DBCalc34'
        DataField = 'TOTALQUI'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 219075
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc35: TppDBCalc
        UserName = 'DBCalc35'
        DataField = 'TOTALQUM'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 237332
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc36: TppDBCalc
        UserName = 'DBCalc36'
        DataField = 'TOTALSLA'
        DataPipeline = pplFechamentoCarteira
        DisplayFormat = '(0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 258498
        mmTop = 9260
        mmWidth = 10848
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplFechamentoCarteira
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8996
          mmLeft = 0
          mmTop = 529
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplFechamentoCarteira
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7938
          mmLeft = 0
          mmTop = 1323
          mmWidth = 81492
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 255853
          mmTop = 6350
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'por Morte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 236803
          mmTop = 6350
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Antecipadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 215371
          mmTop = 6350
          mmWidth = 14552
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
          mmLeft = 195792
          mmTop = 6350
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 182298
          mmTop = 6350
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Geradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 147373
          mmTop = 6350
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Renovações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 124619
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Concessões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 106363
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 92869
          mmTop = 6350
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 95779
          mmTop = 3704
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 147109
          mmTop = 3704
          mmWidth = 10054
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
          mmLeft = 218282
          mmTop = 3704
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Quitações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 236538
          mmTop = 3704
          mmWidth = 11642
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
          mmLeft = 82021
          mmTop = 1852
          mmWidth = 188384
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'RENOVACOES'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 121444
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'PARCELAS'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 139700
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDODEV'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 83079
          mmTop = 2910
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'CONCESSOES'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 103188
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'ENCARGOS'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175948
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'AMORTIZACAO'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 194205
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'QUITACAO'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 212461
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'QUIT_MORT'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 230717
          mmTop = 2910
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'SALDOATU'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 250032
          mmTop = 2910
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'TOTALSLDDEV'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 91546
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'TOTALCONCESSOES'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 109802
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'TOTALRENOV'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 128059
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          DataField = 'TOTALPARC'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 146315
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'TOTALENC'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 182563
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'TOTALAMO'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 200819
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'TOTALQUI'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 219075
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'TOTALQUM'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 237332
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'TOTALSLA'
          DataPipeline = pplFechamentoCarteira
          DisplayFormat = '(0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 258498
          mmTop = 6615
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryFechamentoCarteira: TwwQuery
    BeforeOpen = qryFechamentoCarteiraBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ ORDERED */'
      ''
      '   TEP.DESCTIPOEMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   NVL(SALDOANT.SALDODEV, 0)           AS SALDODEV,'
      '   NVL(SALDOANT.TOTALSLDDEV, 0)        AS TOTALSLDDEV,'
      '   NVL(CONCESSOES.CONCESSOES, 0)       AS CONCESSOES,'
      '   NVL(CONCESSOES.TOTALCONCESSOES, 0)  AS TOTALCONCESSOES,'
      '   NVL(RENOVACOES.RENOVACOES, 0)       AS RENOVACOES,'
      '   NVL(RENOVACOES.TOTALRENOV, 0)       AS TOTALRENOV,'
      '   NVL(PARCELAS.PARCELAS, 0)           AS PARCELAS,'
      '   NVL(PARCELAS.TOTALPARC, 0)          AS TOTALPARC,'
      '   NVL(ENCARGOS.ENCARGOS, 0)           AS ENCARGOS,'
      '   NVL(ENCARGOS.TOTALENC, 0)           AS TOTALENC,'
      '   NVL(AMORT.AMORTIZACAO, 0)           AS AMORTIZACAO,'
      '   NVL(AMORT.TOTALAMO, 0)              AS TOTALAMO,'
      '   NVL(QUITACAO.QUITACAO, 0)           AS QUITACAO,'
      '   NVL(QUITACAO.TOTALQUI, 0)           AS TOTALQUI,'
      '   NVL(QUITMORT.QUIT_MORT, 0)          AS QUIT_MORT,'
      '   NVL(QUITMORT.TOTALQUM, 0)           AS TOTALQUM,'
      '   NVL(SALDOATU.SALDOATU, 0)           AS SALDOATU,'
      '   NVL(SALDOATU.TOTALSLA, 0)           AS TOTALSLA'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TCE, TIPOEMPTMO TEP,'
      ''
      
        '-- SALDO ANTERIOR ----------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDO' +
        'DEV,'
      '      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLDDEV'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      '         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,'
      '         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '      FROM'
      '         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '         ('
      '         SELECT  /*+ INDEX(ITC) */'
      
        '            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHIST' +
        'MOVEMPTMO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO ' +
        'TCE'
      '         WHERE'
      '                ( ITC.ITCTRATASALDODEV   <> 0 )'
      '            AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      
        '            AND ( HME.HMEDATAATUALIZA    <= TO_DATE(:PDATASLDANT' +
        ', '#39'DD/MM/YYYY'#39') )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      
        '            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ' +
        ')'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      '            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) M'
      '      WHERE'
      '             M.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO'
      '         AND M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO'
      '         AND H.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '            TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO'
      '      ) SLD'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) SALDOANT,'
      ''
      
        '-- FIM SALDO ANTERIOR ------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- CONCESSOES --------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS CO' +
        'NCESSOES,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALCONCESSOES'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             C.IDCONTRQUITACAO      IS NULL'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND HMETIPOMOV             = 0'
      '         AND HMEPARCELA             = 0'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      '         AND ITC.ITCSEQCALCULO      = ('
      
        '                                      SELECT /*+ INDEX(ITEMXTIPO' +
        'CONTR) */'
      
        '                                         MIN(ITCSEQCALCULO) AS I' +
        'TCSEQCALCULO'
      '                                      FROM'
      '                                         ITEMXTIPOCONTR'
      '                                      WHERE'
      '                                             ITCEVENTO = 0'
      
        '                                         AND IDTIPOCONTREMPTMO =' +
        ' TC.IDTIPOCONTREMPTMO'
      '                                      )'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) CONCESSOES,'
      ''
      
        '-- FIM CONCESSÕES ----------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- RENOVAÇÕES --------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS RE' +
        'NOVACOES,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALRENOV'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C, CONTRATOEMPTMO A,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC,'
      '         ('
      '         SELECT /*+ INDEX(ITEMXTIPOCONTR) */'
      
        '            MIN(ITCSEQCALCULO) AS ITCSEQCALCULO, IDITEMEMPTMO, I' +
        'DTIPOCONTREMPTMO'
      '         FROM'
      '            ITEMXTIPOCONTR'
      '         WHERE'
      '            ITCEVENTO = 0'
      '         GROUP BY'
      '            IDITEMEMPTMO, IDTIPOCONTREMPTMO'
      '   '#9'   ) ITS'
      '      WHERE'
      '             A.IDCONTRQUITACAO      IS NOT NULL'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND C.IDCONTRATOEMPTMO     = A.IDCONTRQUITACAO'
      '         AND HMETIPOMOV             = 0'
      '         AND HMEPARCELA             = 0'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITS.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITS.IDITEMEMPTMO'
      '      ) CON'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) RENOVACOES,'
      ''
      
        '-- FIM RENOVAÇÕES ----------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- PARCELAS ----------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS PA' +
        'RCELAS,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO),0) AS TOTALPARC'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             HMETIPOMOV             = 1'
      '         AND HMECENTRALIZA          = 1'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND FLGESTORNADO           IS NULL'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      
        '         AND ((:PITCTRATASALDODEV   IS NULL) OR (ITC.ITCTRATASAL' +
        'DODEV <> :PITCTRATASALDODEV ))'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) PARCELAS,'
      ''
      
        '-- FIM PARCELAS ------------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- ENCARGOS ----------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS EN' +
        'CARGOS,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALENC'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT /*+ INDEX(ITC) */'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             HMETIPOMOV             = 4'
      '         AND HMECENTRALIZA          = 0'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND FLGESTORNADO           IS NULL'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      
        '         AND ((:PITCTRATASALDODEV   IS NULL) OR (ITC.ITCTRATASAL' +
        'DODEV <> :PITCTRATASALDODEV ))'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) ENCARGOS,'
      ''
      
        '-- FIM ENCARGOS ------------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- AMORTIZAÇÃO -------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      '      A.IDTIPOCONTREMPTMO,'
      '      NVL(SUM(CON.HMEVLRPREVISTO), 0) AS AMORTIZACAO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALAMO'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT /*+ INDEX(ITC) */'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             HMETIPOMOV             = 2'
      '         AND HMECENTRALIZA          = 1'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND FLGESTORNADO           IS NULL'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      
        '         AND ((:PITCTRATASALDODEV   IS NULL) OR (ITC.ITCTRATASAL' +
        'DODEV <> :PITCTRATASALDODEV ))'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) AMORT,'
      ''
      
        '-- FIM AMORTIZAÇÃO ---------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- QUITAÇÂO ----------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QU' +
        'ITACAO,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUI'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT /*+ INDEX(ITC) */'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             HMETIPOMOV             = 3'
      '         AND HMEORIGEM             <> 8'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND FLGESTORNADO           IS NULL'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND ITC.ITCTRATASALDODEV  <> 0'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) QUITACAO,'
      ''
      
        '-- FIM QUITAÇÃO ------------------------------------------------' +
        '------------------------------------'
      ''
      
        '-- QUITAÇÃO POR MORTE ------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(CON.HMEVLRPREVISTO), 0) AS QU' +
        'IT_MORT,'
      '      NVL(COUNT(CON.IDCONTRATOEMPTMO), 0) AS TOTALQUM'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT /*+ INDEX(ITC) */'
      
        '         TC.TCEDESCRICAO, HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMP' +
        'TMO,'
      '         TC.IDTIPOCONTREMPTMO, HME.HMEVLRPREVISTO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '         ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      '      WHERE'
      '             HMETIPOMOV             = 3'
      '         AND HMEORIGEM              = 8'
      '         AND C.FLGSITUACAO         <> '#39'C'#39
      '         AND FLGESTORNADO           IS NULL'
      '         AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '         AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '         AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS' +
        ' NULL) )'
      '         AND ITC.ITCTRATASALDODEV  <> 0'
      '         AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '         AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '         AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      ) CON'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) QUITMORT,'
      ''
      
        '-- FIM QUITAÇÃO POR MORTE --------------------------------------' +
        '------------------------------------'
      ''
      
        '-- SALDO ATUAL -------------------------------------------------' +
        '------------------------------------'
      '   ('
      '   SELECT'
      
        '      A.IDTIPOCONTREMPTMO, NVL(SUM(SLD.HMESALDODEV), 0) AS SALDO' +
        'ATU,'
      '      NVL(COUNT(SLD.IDCONTRATOEMPTMO),0) AS TOTALSLA'
      '   FROM'
      '      TIPOCONTREMPTMO A,'
      '      ('
      '      SELECT'
      '         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO,'
      '         NVL(SUM(H.HMESALDODEV),0) AS HMESALDODEV'
      '      FROM'
      '         TIPOCONTREMPTMO TC, HISTMOVEMPTMO H, CONTRATOEMPTMO C,'
      '         ('
      '         SELECT  /*+ INDEX(ITC) */'
      
        '            CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHIST' +
        'MOVEMPTMO'
      '         FROM'
      '            HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '            ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO ' +
        'TCE'
      '         WHERE'
      '                ( ITC.ITCTRATASALDODEV   <> 0 )'
      '            AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      
        '            AND ( HME.HMEDATAATUALIZA    <= TO_DATE(:PDATASLDATU' +
        'AL, '#39'DD/MM/YYYY'#39') )'
      
        '            AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO' +
        ' IS NULL) )'
      
        '            AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ' +
        ')'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO' +
        ' )'
      
        '            AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO' +
        ' )'
      '            AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '            AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '            AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         GROUP BY'
      '            CON.IDCONTRATOEMPTMO'
      '         ) M'
      '      WHERE'
      '             M.IDHISTMOVEMPTMO   = H.IDHISTMOVEMPTMO'
      '         AND M.IDCONTRATOEMPTMO  = H.IDCONTRATOEMPTMO'
      '         AND H.IDCONTRATOEMPTMO  = C.IDCONTRATOEMPTMO'
      '         AND C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO'
      '      GROUP BY'
      '         TC.IDTIPOCONTREMPTMO, M.IDCONTRATOEMPTMO'
      '      ) SLD'
      '   WHERE'
      '      A.IDTIPOCONTREMPTMO = SLD.IDTIPOCONTREMPTMO(+)'
      '   GROUP BY'
      '      A.IDTIPOCONTREMPTMO'
      '   ) SALDOATU'
      ''
      
        '-- FIM SALDO ATUAL ---------------------------------------------' +
        '------------------------------------'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TEP.IDTIPOEMPTMO     ' +
        '  =:PIDTIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TCE.IDTIPOCONTREMPTMO' +
        '  =:PIDTIPOCONTREMPTMO) )'
      '   AND TCE.IDTIPOCONTREMPTMO  = SALDOANT.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = CONCESSOES.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = RENOVACOES.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = PARCELAS.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = ENCARGOS.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = AMORT.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = QUITACAO.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = QUITMORT.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOCONTREMPTMO  = SALDOATU.IDTIPOCONTREMPTMO(+)'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   TEP.DESCTIPOEMPTMO, TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 136
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'PDATASLDANT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
        Value = '2002'
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PDATASLDATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'SALDODEV'
    end
    object FloatField2: TFloatField
      FieldName = 'TOTALSLDDEV'
    end
    object FloatField3: TFloatField
      FieldName = 'CONCESSOES'
    end
    object FloatField4: TFloatField
      FieldName = 'TOTALCONCESSOES'
    end
    object FloatField5: TFloatField
      FieldName = 'RENOVACOES'
    end
    object FloatField6: TFloatField
      FieldName = 'TOTALRENOV'
    end
    object FloatField7: TFloatField
      FieldName = 'PARCELAS'
    end
    object FloatField8: TFloatField
      FieldName = 'TOTALPARC'
    end
    object FloatField9: TFloatField
      FieldName = 'ENCARGOS'
    end
    object FloatField10: TFloatField
      FieldName = 'TOTALENC'
    end
    object FloatField11: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object FloatField12: TFloatField
      FieldName = 'TOTALAMO'
    end
    object FloatField13: TFloatField
      FieldName = 'QUITACAO'
    end
    object FloatField14: TFloatField
      FieldName = 'TOTALQUI'
    end
    object FloatField15: TFloatField
      FieldName = 'QUIT_MORT'
    end
    object FloatField16: TFloatField
      FieldName = 'TOTALQUM'
    end
    object FloatField17: TFloatField
      FieldName = 'SALDOATU'
    end
    object FloatField18: TFloatField
      FieldName = 'TOTALSLA'
    end
  end
end
