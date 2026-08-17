inherited DmRelBoletaBMF: TDmRelBoletaBMF
  Left = 449
  Top = 150
  Width = 285
  Height = 243
  Caption = 'DmRelBoletaBMF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object RpBoletaBMF: TppReport
    AutoStop = False
    DataPipeline = ppBDEBoletaBMF
    OnStartPage = RpBoletaBMFStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Boletas de BM&F'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 41
    Top = 81
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEBoletaBMF'
    object ppHeaderBand26: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape27: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel250: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 29898
        mmTop = 25400
        mmWidth = 12965
        BandType = 0
      end
      object lblVlrOperacao: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 128059
        mmTop = 25400
        mmWidth = 20902
        BandType = 0
      end
      object ppLine106: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 197300
        BandType = 0
      end
      object lblDtOper: TppLabel
        UserName = 'Periodo'
        Caption = 'Data Operação :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel253: TppLabel
        UserName = 'Label125'
        Caption = 'Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 528
        mmTop = 25400
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel257: TppLabel
        UserName = 'Label1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 74348
        mmTop = 25400
        mmWidth = 15610
        BandType = 0
      end
      object lblDtLiquid: TppLabel
        UserName = 'Periodo1'
        Caption = 'Data Liquidação :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74877
        mmTop = 14023
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel226: TppLabel
        UserName = 'Label226'
        Caption = 'Boleta de Mercado Futuro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLabel252: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa3'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage4: TppDBImage
        UserName = 'DbLogo3'
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
      object ppLine55: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 0
      end
      object lblNumDocumento: TppLabel
        UserName = 'Label8'
        Caption = 'Boleta :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 19050
        mmWidth = 10848
        BandType = 0
      end
      object ppdbeSglCorretora: TppDBText
        UserName = 'dbeSglCorretora'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = ppBDEBoletaBMF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 19050
        mmWidth = 74348
        BandType = 0
      end
      object pplDtOper: TppLabel
        UserName = 'Periodo2'
        Caption = 'Data Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 14023
        mmWidth = 21696
        BandType = 0
      end
      object pplDtLiquid: TppLabel
        UserName = 'Periodo3'
        Caption = 'Data Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 14023
        mmWidth = 21696
        BandType = 0
      end
      object lblPrecoAjuste: TppLabel
        UserName = 'ppLabel1101'
        Caption = 'Preço / Ajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 97102
        mmTop = 25400
        mmWidth = 18785
        BandType = 0
      end
      object pplNumDocumento: TppLabel
        UserName = 'Label7'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 19050
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label10'
        Caption = 'Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 14288
        mmWidth = 13494
        BandType = 0
      end
    end
    object ppDetailBand26: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape28: TppShape
        OnPrint = ppShape28Print
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197358
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText44'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBDEBoletaBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 265
        mmWidth = 43656
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'ppDBText50'
        DataField = 'QTDEMOVINVCART'
        DataPipeline = ppBDEBoletaBMF
        DisplayFormat = '###,###,###,###0.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLRAJOPER'
        DataPipeline = ppBDEBoletaBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'ppDBText53'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEBoletaBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VRLPUOPER'
        DataPipeline = ppBDEBoletaBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEBoletaBMF'
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLine107: TppLine
        UserName = 'Line52'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'SystemVariable2'
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
      object ppLabel258: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label164'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable4'
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
      object ppLabel259: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label165'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'SystemVariable8'
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
    object ppSummaryBand9: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 55827
      mmPrintPosition = 0
      object ppLine108: TppLine
        UserName = 'ppLine45'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 7
      end
      object lblVlrNegocios: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Valor dos Negócios :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 3175
        mmWidth = 26194
        BandType = 7
      end
      object ppLine109: TppLine
        UserName = 'Line54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 7
      end
      object lblTxReg: TppLabel
        UserName = 'Label132'
        Caption = 'Taxa de Registro :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 8996
        mmWidth = 23283
        BandType = 7
      end
      object lblTxOper: TppLabel
        UserName = 'Label134'
        Caption = 'Taxa Operacional :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 3175
        mmWidth = 24077
        BandType = 7
      end
      object lblVlrLiqNota: TppLabel
        UserName = 'TotalCorretora'
        Caption = 'Total Líquido da Nota :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 14817
        mmWidth = 28575
        BandType = 7
      end
      object blTxBolsa: TppLabel
        UserName = 'OperadoCV'
        Caption = 'Taxas da Bolsa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 14817
        mmWidth = 21167
        BandType = 7
      end
      object lblTtDesp: TppLabel
        UserName = 'TotalCorretora1'
        Caption = 'Total de Despesas :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 20373
        mmWidth = 25400
        BandType = 7
      end
      object pplVlrNegocios: TppLabel
        UserName = 'TotalCorretora2'
        Caption = 'Valor dos Negocios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 48154
        mmTop = 3175
        mmWidth = 24606
        BandType = 7
      end
      object pplAjustePosicao: TppLabel
        UserName = 'TotalCorretora3'
        Caption = 'Ajuste de Posicao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 50271
        mmTop = 8996
        mmWidth = 22754
        BandType = 7
      end
      object lblAjustePosicao: TppLabel
        UserName = 'lblAjustePosicao'
        Caption = 'Ajuste de Posição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 8996
        mmWidth = 22754
        BandType = 7
      end
      object pplVlrLiqNota: TppLabel
        UserName = 'Label2'
        Caption = 'Total Liquido da Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 14817
        mmWidth = 26988
        BandType = 7
      end
      object pplTxOper: TppLabel
        UserName = 'Label3'
        Caption = 'Taxa Operacional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 138642
        mmTop = 3175
        mmWidth = 22225
        BandType = 7
      end
      object pplTxReg: TppLabel
        UserName = 'Label4'
        Caption = 'Taxa de Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 139171
        mmTop = 8996
        mmWidth = 21696
        BandType = 7
      end
      object pplTxBolsa: TppLabel
        UserName = 'Label5'
        Caption = 'Taxas da Bolsa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 141288
        mmTop = 14817
        mmWidth = 19579
        BandType = 7
      end
      object pplTtDesp: TppLabel
        UserName = 'Label6'
        Caption = 'Total de Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 20373
        mmWidth = 23548
        BandType = 7
      end
      object lblPUAjuste: TppLabel
        UserName = 'TotalCorretora4'
        Caption = 'PU de Ajuste :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 20373
        mmWidth = 18256
        BandType = 7
      end
      object pplPUAjuste: TppLabel
        UserName = 'Label9'
        Caption = 'PUAjuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 61119
        mmTop = 20373
        mmWidth = 11906
        BandType = 7
      end
      object RptBoletaRenFixaShape21: TppShape
        UserName = 'RptBoletaRenFixaShape21'
        mmHeight = 27781
        mmLeft = 1588
        mmTop = 26988
        mmWidth = 63765
        BandType = 7
      end
      object RptBoletaRenFixaShape22: TppShape
        UserName = 'RptBoletaRenFixaShape22'
        mmHeight = 27781
        mmLeft = 65088
        mmTop = 26988
        mmWidth = 65617
        BandType = 7
      end
      object RptBoletaRenFixaShape25: TppShape
        UserName = 'RptBoletaRenFixaShape25'
        mmHeight = 27781
        mmLeft = 130440
        mmTop = 26988
        mmWidth = 65616
        BandType = 7
      end
      object RptBoletaRenFixaLabel32: TppLabel
        UserName = 'RptBoletaRenFixaLabel32'
        Caption = 'DIFIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 158750
        mmTop = 26988
        mmWidth = 7408
        BandType = 7
      end
      object RptBoletaRenFixaLabel21: TppLabel
        UserName = 'RptBoletaRenFixaLabel21'
        Caption = 'GECOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 93134
        mmTop = 26988
        mmWidth = 10054
        BandType = 7
      end
      object RptBoletaRenFixaLabel20: TppLabel
        UserName = 'RptBoletaRenFixaLabel20'
        Caption = 'GEINV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 29369
        mmTop = 26988
        mmWidth = 8996
        BandType = 7
      end
      object RptBoletaRenFixaLabel24: TppLabel
        UserName = 'RptBoletaRenFixaLabel24'
        Caption = 'Bruno Grain'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 25665
        mmTop = 46038
        mmWidth = 16669
        BandType = 7
      end
      object RptBoletaRenFixaLabel27: TppLabel
        UserName = 'RptBoletaRenFixaLabel27'
        Caption = 'Gerente de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 15081
        mmTop = 50006
        mmWidth = 34660
        BandType = 7
      end
      object RptBoletaRenFixaLabel28: TppLabel
        UserName = 'RptBoletaRenFixaLabel28'
        Caption = 'Gerente de Cont. Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 79640
        mmTop = 50271
        mmWidth = 38100
        BandType = 7
      end
      object RptBoletaRenFixaLabel25: TppLabel
        UserName = 'RptBoletaRenFixaLabel25'
        Caption = 'José Lopes da Silva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 85461
        mmTop = 46038
        mmWidth = 27252
        BandType = 7
      end
      object RptBoletaRenFixaLabel34: TppLabel
        UserName = 'RptBoletaRenFixaLabel34'
        Caption = 'Diretor Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 150813
        mmTop = 50271
        mmWidth = 26988
        BandType = 7
      end
      object RptBoletaRenFixaLabel33: TppLabel
        UserName = 'RptBoletaRenFixaLabel33'
        Caption = 'Adalto Carmona'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 153723
        mmTop = 45773
        mmWidth = 21696
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 45244
        mmWidth = 197300
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 30956
        mmWidth = 197300
        BandType = 7
      end
    end
  end
  object ppBDEBoletaBMF: TppBDEPipeline
    DataSource = dsBuscaOperacoes
    UserName = 'BDEBoletaBMF'
    Left = 145
    Top = 83
  end
  object qryBuscaOperacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HI.IDHISTCARTINV,HI.IDOPERACAOINVEST,HI.IDCARTEIRAINVEST,HI.I' +
        'DTIPOOPERACAO,'
      
        '   HI.IDDESPOPERINVEST,HI.IDINVESTIMENTO,HI.QTDEMOVINVCART,HI.NA' +
        'TURMOVCARTINV,'
      
        '   HI.IDLOTE,HI.VLRMOVCARTINV,HI.PLANO,HI.PLNCODIGO,HI.CODDOCUME' +
        'NTO,'
      
        '   IV.DESCINVESTIMENTO,TP.DESCTIPOOPERACAO,OPP.DATAVENCOPER,OPP.' +
        'NUMDOCUMENTO,'
      '   HI.IDCARTEIRAGERENC,CT.SGLCORRETVALORES,'
      '   PU.PESOCONTRATO,PU.VLRAJUSTE,'
      
        '   DECODE(SIGN(HI.IDTIPOOPERACAO),1,((HI.VLRMOVCARTINV/PU.PESOCO' +
        'NTRATO)/HI.QTDEMOVINVCART),PU.VLRAJUSTE) AS VRLPUOPER,'
      
        '   DECODE(SIGN((HI.VLRMOVCARTINV/PU.PESOCONTRATO)/HI.QTDEMOVINVC' +
        'ART),1,(DECODE(SIGN(HI.IDTIPOOPERACAO),1,((PU.VLRAJUSTE - ((HI.V' +
        'LRMOVCARTINV/PU.PESOCONTRATO)/HI.QTDEMOVINVCART)) * PU.PESOCONTR' +
        'ATO * HI.QTDEMOVINVCART),HI.VLRMOVCARTINV)),0) AS VLRAJOPER'
      'FROM'
      
        '   HISTCARTINV HI, INVESTIMENTO IV, TIPOOPERACAO TP,CORRETVALORE' +
        'S CT,'
      '   ('
      '    SELECT DISTINCT OP1.IDLOTE,OP1.DATAVENCOPER,OP1.NUMDOCUMENTO'
      '    FROM OPERACAOINVEST OP1'
      '    WHERE'
      '        (OP1.IDLOTE = :sBoleta) AND'
      '        (OP1.DATAOPERACAO = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39'))'
      '   ) OPP,'
      '   (SELECT'
      '       CF.VLRAJUSTE,CF.IDINVESTIMENTO,PB.PESOCONTRATO'
      '    FROM'
      '         COTACAOBMF CF,'
      '         PARAMCONTRATOBMF PB,'
      
        '         (SELECT MAX(PR.DATAVIGENCIA) AS DATAVIG,PR.IDTIPOCONTRI' +
        'NVEST'
      '          FROM PARAMCONTRATOBMF PR'
      '          WHERE'
      '              PR.DATAVIGENCIA <= TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')'
      '          GROUP BY PR.IDTIPOCONTRINVEST'
      '         ) VG'
      '    WHERE'
      '      (CF.DATACOTACAOBMF = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39')) AND'
      '      (CF.IDTIPOCONTRINVEST = VG.IDTIPOCONTRINVEST) AND'
      '      (PB.IDTIPOCONTRINVEST = VG.IDTIPOCONTRINVEST) AND'
      '      (PB.DATAVIGENCIA      = VG.DATAVIG)'
      '    ) PU'
      'WHERE'
      '   (HI.IDLOTE = :sBoleta)  AND'
      '   (HI.DATAMOVCARTINV = TO_DATE(:dDataAtu,'#39'DD/MM/YYYY'#39') ) AND'
      '   (HI.TIPMOVCARTINV IN('#39'ATU'#39','#39'OPE'#39','#39'INI'#39')) AND'
      '   (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND'
      '   (HI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (HI.IDTIPOINVEST = TP.IDTIPOINVEST) AND'
      '   (HI.IDINVESTIMENTO = PU.IDINVESTIMENTO) AND'
      '   (HI.IDCORRETVALORES = CT.IDCORRETVALORES)'
      'ORDER BY IDTIPOOPERACAO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 63
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'sBoleta'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'dDataAtu'
        ParamType = ptUnknown
      end>
    object qryBuscaOperacoesIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryBuscaOperacoesIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBuscaOperacoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaOperacoesIDDESPOPERINVEST: TFloatField
      FieldName = 'IDDESPOPERINVEST'
    end
    object qryBuscaOperacoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaOperacoesQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      DisplayFormat = '###,###,###,###'
    end
    object qryBuscaOperacoesNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      FixedChar = True
      Size = 1
    end
    object qryBuscaOperacoesIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBuscaOperacoesVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryBuscaOperacoesPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBuscaOperacoesPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaOperacoesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBuscaOperacoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBuscaOperacoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaOperacoesDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryBuscaOperacoesNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBuscaOperacoesSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object qryBuscaOperacoesPESOCONTRATO: TFloatField
      FieldName = 'PESOCONTRATO'
    end
    object qryBuscaOperacoesVLRAJOPER: TFloatField
      FieldName = 'VLRAJOPER'
      DisplayFormat = '###,###,###,#00'
    end
    object qryBuscaOperacoesVLRAJUSTE: TFloatField
      FieldName = 'VLRAJUSTE'
      DisplayFormat = '###,###,###,#00'
    end
    object qryBuscaOperacoesVRLPUOPER: TFloatField
      FieldName = 'VRLPUOPER'
      DisplayFormat = '###,###,###,#00'
    end
  end
  object dsBuscaOperacoes: TwwDataSource
    AutoEdit = False
    DataSet = qryBuscaOperacoes
    Left = 101
    Top = 136
  end
end
