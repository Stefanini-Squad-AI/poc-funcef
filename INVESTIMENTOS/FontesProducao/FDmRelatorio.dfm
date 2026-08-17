inherited DtmRelatorio: TDtmRelatorio
  Left = 335
  Top = 0
  Width = 808
  Height = 648
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 176
    Top = 120
    Width = 609
    Height = 9
    Color = clHighlight
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = -1
    Top = 249
    Width = 790
    Height = 10
    Color = clHighlight
    TabOrder = 1
  end
  object Panel3: TPanel [2]
    Left = -1
    Top = 384
    Width = 787
    Height = 10
    Color = clHighlight
    TabOrder = 2
    object Panel5: TPanel
      Left = -9
      Top = 8
      Width = 787
      Height = 10
      Color = clHighlight
      TabOrder = 0
    end
  end
  object Panel4: TPanel [3]
    Left = -9
    Top = 120
    Width = 789
    Height = 9
    Color = clHighlight
    TabOrder = 3
  end
  inherited pplExemplo: TppBDEPipeline
    Left = 31
    Top = 63
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
    Left = 31
    Top = 63
  end
  inherited qryExemplo: TwwQuery
    Left = 31
    Top = 63
  end
  inherited rpExemplo: TppReport
    Left = 31
    Top = 7
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 20902
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmWidth = 31750
      end
      inherited Line1: TppLine
        mmTop = 20373
      end
      inherited LblEmpresa: TppLabel
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmWidth = 24342
      end
      object ppLCarteiraEx: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
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
    end
  end
  object RptConsHistInvest: TppReport
    AutoStop = False
    DataPipeline = BdeConsHistInvest
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RelatConsInvest'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 125
    Top = 7
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'BdeConsHistInvest'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41804
      mmPrintPosition = 0
      object LblInvestimento: TppLabel
        UserName = 'LblInvestimento'
        Caption = 'LblInvestimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 20638
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel281: TppLabel
        UserName = 'Label281'
        Caption = 'Histórico dos Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 47361
        BandType = 0
      end
      object ppLabel282: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa24'
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
      object LblCarteira: TppLabel
        UserName = 'LCarteira21'
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
        mmLeft = 267494
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object LblPeriodo: TppLabel
        UserName = 'LPeriodo14'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage24: TppDBImage
        UserName = 'DbLogo24'
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
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 11377
        mmLeft = 0
        mmTop = 30163
        mmWidth = 284692
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 36248
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'Saldo em Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 135202
        mmTop = 31485
        mmWidth = 15875
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'ppLine23'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 529
        mmTop = 30163
        mmWidth = 284163
        BandType = 0
      end
      object RptConsHistInvestLabel1: TppLabel
        UserName = 'RptConsHistInvestLabel1'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 36248
        mmWidth = 14552
        BandType = 0
      end
      object L: TppLabel
        UserName = 'L'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 78052
        mmTop = 36248
        mmWidth = 7408
        BandType = 0
      end
      object RptConsHistInvestLabel2: TppLabel
        UserName = 'RptConsHistInvestLabel2'
        Caption = 'Valor Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 89165
        mmTop = 32015
        mmWidth = 18785
        BandType = 0
      end
      object RptConsHistInvestLabel3: TppLabel
        UserName = 'RptConsHistInvestLabel3'
        Caption = 'Qtd Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 113771
        mmTop = 32015
        mmWidth = 16404
        BandType = 0
      end
      object RptConsHistInvestLabel4: TppLabel
        UserName = 'RptConsHistInvestLabel4'
        Caption = 'Saldo Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 157163
        mmTop = 32015
        mmWidth = 19579
        BandType = 0
      end
      object RptConsHistInvestLabel6: TppLabel
        UserName = 'RptConsHistInvestLabel6'
        Caption = 'Saldo Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 187061
        mmTop = 32015
        mmWidth = 13229
        BandType = 0
      end
      object RptConsHistInvestLine1: TppLine
        UserName = 'RptConsHistInvestLine1'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 529
        mmTop = 41275
        mmWidth = 284163
        BandType = 0
      end
      object LblLote: TppLabel
        UserName = 'LblLote'
        Caption = 'LblLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 25135
        mmWidth = 11377
        BandType = 0
      end
      object RptConsHistInvestLabel7: TppLabel
        UserName = 'RptConsHistInvestLabel7'
        Caption = 'Saldo Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 210080
        mmTop = 32015
        mmWidth = 16933
        BandType = 0
      end
      object RptConsHistInvestLabel9: TppLabel
        UserName = 'RptConsHistInvestLabel9'
        Caption = 'Saldo Carregamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 230982
        mmTop = 32015
        mmWidth = 24077
        BandType = 0
      end
      object TppLabel
        UserName = 'Label1'
        Caption = 'Saldo Rendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 259028
        mmTop = 32015
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'HISTMOVCARTINV'
        DataPipeline = BdeConsHistInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 529
        mmWidth = 49742
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = BdeConsHistInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object RptConsHistInvestDBText1: TppDBText
        UserName = 'RptConsHistInvestDBText1'
        DataField = 'IDLOTE'
        DataPipeline = BdeConsHistInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object RptConsHistInvestDBText2: TppDBText
        UserName = 'RptConsHistInvestDBText2'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object RptConsHistInvestDBText3: TppDBText
        UserName = 'RptConsHistInvestDBText3'
        DataField = 'QTDEMOVINVCART'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object RptConsHistInvestDBText4: TppDBText
        UserName = 'RptConsHistInvestDBText4'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object RptConsHistInvestDBText5: TppDBText
        UserName = 'RptConsHistInvestDBText5'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 154252
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object RptConsHistInvestDBText7: TppDBText
        UserName = 'RptConsHistInvestDBText7'
        DataField = 'SALDOATU'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 178330
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object RptConsHistInvestDBText9: TppDBText
        UserName = 'RptConsHistInvestDBText9'
        DataField = 'SALDOAQUI'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptConsHistInvestDBText11: TppDBText
        UserName = 'RptConsHistInvestDBText11'
        DataField = 'SALDOCAR'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 529
        mmWidth = 26194
        BandType = 4
      end
      object RptConsHistInvestDBText12: TppDBText
        UserName = 'RptConsHistInvestDBText12'
        DataField = 'SALDOREND'
        DataPipeline = BdeConsHistInvest
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeConsHistInvest'
        mmHeight = 3704
        mmLeft = 262467
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel33: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
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
        mmTop = 1323
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable26: TppSystemVariable
        UserName = 'SystemVariable26'
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
        mmTop = 1323
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable27: TppSystemVariable
        UserName = 'SystemVariable27'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object QryConsHistInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  HC.IDCARTEIRAINVEST, HC.DATAMOVCARTINV, HC.SALDOVLRINVCA' +
        'RT,'
      #9'HC.SALDOQTDEINVCART, HC.IDINVESTIMENTO, HC.IDTIPOOPERACAO,'
      #9'HC.HISTMOVCARTINV, HC.TIPMOVCARTINV, IDLOTE,'
      #9'IV.DESCINVESTIMENTO, HC.VLRMOVCARTINV, HC.COTASMOVCARTINV,'
      #9'HC.SALDOCOTASCARTINV, HC.IDOPERACAOINVEST, HC.QTDEMOVINVCART,'
      
        #9'HC.MOVIMATU, HC.SALDOATU, HC.MOVIMCAR, HC.SALDOCAR, HC.MOVIMAQU' +
        'I,'
      #9'HC.SALDOAQUI, HC.SALDOREND, HC.NATURMOVCARTINV'
      ''
      'FROM HISTCARTINV HC, INVESTIMENTO IV'
      ''
      'WHERE    1 = 2 AND'
      ''
      '         HC.IDINVESTIMENTO   = IV.IDINVESTIMENTO'
      ''
      'ORDER BY HC.DATAMOVCARTINV, HC.IDHISTCARTINV DESC '
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 125
    Top = 63
    object QryConsHistInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryConsHistInvestDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object QryConsHistInvestSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object QryConsHistInvestSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object QryConsHistInvestIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryConsHistInvestIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryConsHistInvestHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
    object QryConsHistInvestTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object QryConsHistInvestIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryConsHistInvestDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryConsHistInvestVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object QryConsHistInvestCOTASMOVCARTINV: TFloatField
      FieldName = 'COTASMOVCARTINV'
    end
    object QryConsHistInvestSALDOCOTASCARTINV: TFloatField
      FieldName = 'SALDOCOTASCARTINV'
    end
    object QryConsHistInvestIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryConsHistInvestQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object QryConsHistInvestMOVIMATU: TFloatField
      FieldName = 'MOVIMATU'
    end
    object QryConsHistInvestSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object QryConsHistInvestMOVIMCAR: TFloatField
      FieldName = 'MOVIMCAR'
    end
    object QryConsHistInvestSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object QryConsHistInvestMOVIMAQUI: TFloatField
      FieldName = 'MOVIMAQUI'
    end
    object QryConsHistInvestSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object QryConsHistInvestSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object QryConsHistInvestNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
  end
  object DtsConsHistInvest: TwwDataSource
    DataSet = QryConsHistInvest
    Left = 125
    Top = 63
  end
  object BdeConsHistInvest: TppBDEPipeline
    DataSource = DtsConsHistInvest
    UserName = 'BdeConsHistInvest'
    Left = 125
    Top = 63
  end
  object updMapaOper: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAINICIAL = :DATAINICIAL,'
      '  VALAPLIC = :VALAPLIC,'
      '  PU = :PU'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (DATAINICIAL, VALAPLIC, PU)'
      'values'
      '  (:DATAINICIAL, :VALAPLIC, :PU)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 125
    Top = 195
  end
  object RptMapaOper: TppReport
    AutoStop = False
    DataPipeline = bdeMapaOper
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Operações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptMapaOperBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 125
    Top = 137
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeMapaOper'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Mapa de Operações Financeiras por Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 72761
        BandType = 0
      end
      object ppLabel37: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa25'
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
      object ppLabel283: TppLabel
        UserName = 'LCarteira22'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 260880
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptMapaOperDataRef: TppLabel
        UserName = 'LPeriodo15'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage25: TppDBImage
        UserName = 'DbLogo25'
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
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284428
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284300
        BandType = 0
      end
      object RptResumoOperLabel5: TppLabel
        UserName = 'RptResumoOperLabel5'
        Caption = 'Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 24342
        mmWidth = 8996
        BandType = 0
      end
      object RptResumoOperLabel6: TppLabel
        UserName = 'RptResumoOperLabel6'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 24342
        mmWidth = 6085
        BandType = 0
      end
      object RptResumoOperLabel7: TppLabel
        UserName = 'RptResumoOperLabel7'
        Caption = 'Tipo de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 24077
        mmWidth = 23548
        BandType = 0
      end
      object RptResumoOperLabel9: TppLabel
        UserName = 'RptResumoOperLabel9'
        Caption = 'Valor Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 24342
        mmWidth = 19315
        BandType = 0
      end
      object RptResumoOperLabel10: TppLabel
        UserName = 'RptResumoOperLabel10'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 24342
        mmWidth = 15081
        BandType = 0
      end
      object RptResumoOperLine2: TppLine
        UserName = 'RptResumoOperLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28310
        mmWidth = 284300
        BandType = 0
      end
      object RptResumoOperLabel11: TppLabel
        UserName = 'RptResumoOperLabel11'
        Caption = 'P. U.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 230982
        mmTop = 24342
        mmWidth = 6085
        BandType = 0
      end
      object RptResumoOperLabel12: TppLabel
        UserName = 'RptResumoOperLabel12'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 265642
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptResumoOperDBText2: TppDBText
        UserName = 'RptResumoOperDBText2'
        DataField = 'IDLOTE'
        DataPipeline = bdeMapaOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object RptResumoOperDBText4: TppDBText
        UserName = 'RptResumoOperDBText4'
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeMapaOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 794
        mmWidth = 79375
        BandType = 4
      end
      object RptResumoOperDBText6: TppDBText
        UserName = 'RptResumoOperDBText6'
        DataField = 'VALAPLIC'
        DataPipeline = bdeMapaOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 35719
        BandType = 4
      end
      object RptResumoOperDBText7: TppDBText
        UserName = 'RptResumoOperDBText7'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeMapaOper
        DisplayFormat = '###,###,###,######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 794
        mmWidth = 35190
        BandType = 4
      end
      object RptResumoOperDBText8: TppDBText
        UserName = 'RptResumoOperDBText8'
        DataField = 'PU'
        DataPipeline = bdeMapaOper
        DisplayFormat = '###,###,###,##0.0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 202407
        mmTop = 794
        mmWidth = 34660
        BandType = 4
      end
      object RptResumoOperDBText9: TppDBText
        UserName = 'RptResumoOperDBText9'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = bdeMapaOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3704
        mmLeft = 239448
        mmTop = 794
        mmWidth = 33602
        BandType = 4
      end
      object RptResumoOperDBText3: TppDBText
        UserName = 'RptResumoOperDBText3'
        AutoSize = True
        DataField = 'DATAINICIAL'
        DataPipeline = bdeMapaOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeMapaOper'
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
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
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
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
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
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
    object RptResumoOperGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeMapaOper
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptResumoOperGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeMapaOper'
      object RptResumoOperGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptResumoOperLabel13: TppLabel
          UserName = 'RptResumoOperLabel13'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object RptResumoOperDBText1: TppDBText
          UserName = 'RptResumoOperDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeMapaOper
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeMapaOper'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptResumoOperLine3: TppLine
          UserName = 'RptResumoOperLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptResumoOperGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptResumoOperDBCalc4: TppDBCalc
          UserName = 'RptResumoOperDBCalc4'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = bdeMapaOper
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeMapaOper'
          mmHeight = 3704
          mmLeft = 239448
          mmTop = 1323
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object RptResumoOperLine4: TppLine
          UserName = 'RptResumoOperLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object RptResumoOperLabel14: TppLabel
          UserName = 'RptResumoOperLabel14'
          Caption = 'T O T A L    G E R A L   ====>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 43921
          mmTop = 1058
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object bdeMapaOper: TppBDEPipeline
    DataSource = DtsMapaOper
    UserName = 'bdeMapaOper'
    Left = 125
    Top = 195
    object bdeMapaOperppField1: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object bdeMapaOperppField2: TppField
      FieldAlias = 'DESCTIPRENFIXA'
      FieldName = 'DESCTIPRENFIXA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object bdeMapaOperppField3: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object bdeMapaOperppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeMapaOperppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeMapaOperppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRINVCART'
      FieldName = 'SALDOVLRINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeMapaOperppField7: TppField
      FieldAlias = 'DATAINICIAL'
      FieldName = 'DATAINICIAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object bdeMapaOperppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALAPLIC'
      FieldName = 'VALAPLIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeMapaOperppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PU'
      FieldName = 'PU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeMapaOperppField10: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object bdeMapaOperppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDEINVCART'
      FieldName = 'SALDOQTDEINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object qryMapaOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE,'
      
        '       H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCAR' +
        'T, '
      '       TO_DATE('#39#39') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS PU,'
      '        IV.DESCINVESTIMENTO, H1.SALDOQTDEINVCART'
      'FROM   HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV, '
      '       TITRENFIXA TT, TIPOTITRENFIXA TP'
      'WHERE (H1.DATAMOVCARTINV ='
      '          (SELECT MAX(H2.DATAMOVCARTINV)'
      '           FROM   HISTCARTINV H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      
        '                 (H2.DATAMOVCARTINV  <= TO_DATE('#39'11/01/2000'#39','#39'dd' +
        '/mm/yyyy'#39')))) AND'
      '      (H1.IDHISTCARTINV   ='
      '          (SELECT MAX(H3.IDHISTCARTINV)'
      '           FROM   HISTCARTINV H3'
      '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      
        '                 (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AN' +
        'D'
      '      (H1.SALDOVLRINVCART <> 0) AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (IV.IDINVESTIMENTO = TT.IDTITRENFIXA) AND'
      '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) '
      'ORDER BY CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE'
      ''
      ''
      '')
    UpdateObject = updMapaOper
    ValidateWithMask = True
    Left = 125
    Top = 195
    object qryMapaOperDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryMapaOperDESCTIPRENFIXA: TStringField
      FieldName = 'DESCTIPRENFIXA'
      Size = 60
    end
    object qryMapaOperIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryMapaOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryMapaOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryMapaOperSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryMapaOperDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
    end
    object qryMapaOperVALAPLIC: TFloatField
      FieldName = 'VALAPLIC'
    end
    object qryMapaOperPU: TFloatField
      FieldName = 'PU'
    end
    object qryMapaOperDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryMapaOperSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
  end
  object DtsMapaOper: TwwDataSource
    DataSet = qryMapaOper
    Left = 125
    Top = 195
  end
  object qryResumoOper2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE,'
      
        '       H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCAR' +
        'T, H1.SALDOQTDEINVCART,'
      
        '       TO_DATE('#39#39') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS COTAC' +
        'AO,'
      '       (0) AS SALDO, IV.DESCINVESTIMENTO'
      'FROM   HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMENTO IV, '
      '       TITRENFIXA TT, TIPOTITRENFIXA TP'
      'WHERE'
      '       1 = 2 AND'
      '      (H1.DATAMOVCARTINV ='
      '          (SELECT MAX(H2.DATAMOVCARTINV)'
      '           FROM   HISTCARTINV H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      
        '                 (H2.DATAMOVCARTINV  <= TO_DATE('#39'06/04/2000'#39','#39'dd' +
        '/mm/yyyy'#39')))) AND'
      '      (H1.IDHISTCARTINV   ='
      '          (SELECT MAX(H3.IDHISTCARTINV)'
      '           FROM   HISTCARTINV H3'
      '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      
        '                 (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AN' +
        'D'
      '      (H1.SALDOVLRINVCART <> 0) AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (IV.IDINVESTIMENTO = TT.IDTITRENFIXA) AND'
      '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) '
      'ORDER BY CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE'
      ''
      ''
      ''
      ' ')
    UpdateObject = updResumoOper2
    ValidateWithMask = True
    Left = 221
    Top = 63
  end
  object dsResumoOper2: TwwDataSource
    DataSet = qryResumoOper2
    Left = 221
    Top = 63
  end
  object bdeResumoOper2: TppBDEPipeline
    DataSource = dsResumoOper2
    UserName = 'bdeResumoOper2'
    Left = 221
    Top = 63
  end
  object RptResumoOper2: TppReport
    AutoStop = False
    DataPipeline = bdeResumoOper2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Resumo de Operações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptResumoOper2BeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 221
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeResumoOper2'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Mapa de Operações Financeiras por Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 72761
        BandType = 0
      end
      object ppLabel79: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa20'
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
      object ppLabel81: TppLabel
        UserName = 'LCarteira17'
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
        mmLeft = 261409
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptResumoOperDataRef: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage21: TppDBImage
        UserName = 'DbLogo20'
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
      object ppShape33: TppShape
        UserName = 'Shape33'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 23813
        mmWidth = 284428
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23548
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        Caption = 'Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 24871
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 24871
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Tipo de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 44186
        mmTop = 24871
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Valor Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 25135
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 25135
        mmWidth = 15081
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 227013
        mmTop = 25135
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 266171
        mmTop = 25135
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'IDLOTE'
        DataPipeline = bdeResumoOper2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 794
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        AutoSize = True
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeResumoOper2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3175
        mmLeft = 44186
        mmTop = 794
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        DataField = 'VALAPLIC'
        DataPipeline = bdeResumoOper2
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 794
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeResumoOper2
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 794
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        DataField = 'COTACAO'
        DataPipeline = bdeResumoOper2
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 794
        mmWidth = 34660
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        DataField = 'SALDO'
        DataPipeline = bdeResumoOper2
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 794
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        AutoSize = True
        DataField = 'DATAINICIAL'
        DataPipeline = bdeResumoOper2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper2'
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
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
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
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
    object ppGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeResumoOper2
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeResumoOper2'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLabel25: TppLabel
          UserName = 'ppLabel25'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 794
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'ppDBText17'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeResumoOper2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeResumoOper2'
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'ppLine12'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptResumoOperDBCalc1: TppDBCalc
          UserName = 'RptResumoOperDBCalc1'
          DataField = 'VALAPLIC'
          DataPipeline = bdeResumoOper2
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper2'
          mmHeight = 3704
          mmLeft = 134673
          mmTop = 1323
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'SALDO'
          DataPipeline = bdeResumoOper2
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper2'
          mmHeight = 3704
          mmLeft = 239978
          mmTop = 1323
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'ppLine13'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'ppLabel26'
          Caption = 'T O T A I S'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 72231
          mmTop = 1058
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updResumoOper2: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAINICIAL = :DATAINICIAL,'
      '  VALAPLIC = :VALAPLIC,'
      '  COTACAO = :COTACAO,'
      '  SALDO = :SALDO'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (DATAINICIAL, VALAPLIC, COTACAO, SALDO)'
      'values'
      '  (:DATAINICIAL, :VALAPLIC, :COTACAO, :SALDO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    Left = 221
    Top = 63
  end
  object QryFundos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  C.IDCONTRATOINVEST, C.IDEMISSOR, C.IDCORRETVALORES, C.ID' +
        'BOLSAVALORES,'
      '        C.IDTIPOCONTRINVEST, '
      '        C.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.SERIE, '
      
        '        C.IDLOTE, C.DATACOMPRALOTE, C.DATAVENCIM, C.VLRCOMPRATIT' +
        'LOTE, '
      '        C.QTDETITLOTE, C.SALDOTITLOTE, C.VLRRESGATE, '
      '        C.PRECOVENCIM, C.IDCARTLASTRO,                '
      '        C.IDCARTAVISTA, C.PRZVENC, C.QTDECOMPRATITLOTE, '
      '        C.DATACARENCIA, C.ANIVERSARIO,             '
      
        '        (0) AS ULTSALDOQTD,  (0) AS ULTSALDOVALOR               ' +
        '                                             '
      ''
      'FROM  CONTRATOINVESTIM C, INVESTIMENTO I'
      ''
      'WHERE'
      '       1 = 2 AND'
      '       I.IDINVESTIMENTO = C.IDINVESTIMENTO'
      ''
      'ORDER BY I.IDINVESTIMENTO, C.IDLOTE'
      ''
      ' ')
    UpdateObject = UpdtFundos
    ValidateWithMask = True
    Left = 220
    Top = 195
    object QryFundosIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
    end
    object QryFundosIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object QryFundosIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object QryFundosIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryFundosIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
    end
    object QryFundosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryFundosDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryFundosSERIE: TStringField
      FieldName = 'SERIE'
      Size = 60
    end
    object QryFundosIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryFundosDATACOMPRALOTE: TDateTimeField
      FieldName = 'DATACOMPRALOTE'
    end
    object QryFundosDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
    end
    object QryFundosVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
    end
    object QryFundosQTDETITLOTE: TFloatField
      FieldName = 'QTDETITLOTE'
    end
    object QryFundosSALDOTITLOTE: TFloatField
      FieldName = 'SALDOTITLOTE'
    end
    object QryFundosVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object QryFundosPRECOVENCIM: TFloatField
      FieldName = 'PRECOVENCIM'
    end
    object QryFundosIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
    end
    object QryFundosIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
    end
    object QryFundosPRZVENC: TFloatField
      FieldName = 'PRZVENC'
    end
    object QryFundosQTDECOMPRATITLOTE: TFloatField
      FieldName = 'QTDECOMPRATITLOTE'
    end
    object QryFundosDATACARENCIA: TDateTimeField
      FieldName = 'DATACARENCIA'
    end
    object QryFundosANIVERSARIO: TFloatField
      FieldName = 'ANIVERSARIO'
    end
    object QryFundosULTSALDOQTD: TFloatField
      FieldName = 'ULTSALDOQTD'
    end
    object QryFundosULTSALDOVALOR: TFloatField
      FieldName = 'ULTSALDOVALOR'
    end
  end
  object DtsFundos: TwwDataSource
    DataSet = QryFundos
    Left = 220
    Top = 195
  end
  object BdeFundos: TppBDEPipeline
    DataSource = DtsFundos
    UserName = 'BdeFundos'
    Left = 220
    Top = 195
  end
  object RptFundos: TppReport
    AutoStop = False
    DataPipeline = BdeFundos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lista de Fundos de Investimento'
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
    Left = 220
    Top = 137
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeFundos'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Listagem de Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel14: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa21'
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
      object ppLabel15: TppLabel
        UserName = 'LCarteira18'
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
        mmLeft = 170127
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'LPeriodo11'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage22: TppDBImage
        UserName = 'DbLogo21'
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
      object ppShape34: TppShape
        UserName = 'Shape34'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197644
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
        Caption = 'Certificado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 25400
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Saldo Qtd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 25400
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        Caption = 'Saldo Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 25400
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'Aniversário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 25400
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'ppLabel50'
        Caption = 'Data Carência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 25400
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'ppLabel51'
        Caption = 'Data Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 59002
        mmTop = 25400
        mmWidth = 17198
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        DataField = 'IDLOTE'
        DataPipeline = BdeFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        DataField = 'ULTSALDOQTD'
        DataPipeline = BdeFundos
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 794
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'ULTSALDOVALOR'
        DataPipeline = BdeFundos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 148167
        mmTop = 794
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'DATAVENCIM'
        DataPipeline = BdeFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 794
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'DATACOMPRALOTE'
        DataPipeline = BdeFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        DataField = 'DATACARENCIA'
        DataPipeline = BdeFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeFundos'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 794
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel56: TppLabel
        UserName = 'ppLabel56'
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
        mmTop = 1852
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDINVESTIMENTO'
      DataPipeline = BdeFundos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeFundos'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'Fundo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 265
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'ppDBText27'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = BdeFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BdeFundos'
          mmHeight = 3969
          mmLeft = 25400
          mmTop = 265
          mmWidth = 146315
          BandType = 3
          GroupNo = 0
        end
        object RptFundosLine1: TppLine
          UserName = 'RptFundosLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
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
  end
  object UpdtFundos: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOINVESTIM'
      'set'
      '  ULTSALDOQTD = :ULTSALDOQTD,'
      '  ULTSALDOVALOR = :ULTSALDOVALOR'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CONTRATOINVESTIM'
      '  (ULTSALDOQTD, ULTSALDOVALOR)'
      'values'
      '  (:ULTSALDOQTD, :ULTSALDOVALOR)')
    DeleteSQL.Strings = (
      'delete from CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 220
    Top = 195
  end
  object qryIRRendaVar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.DATAMOVCARTINV, H.IDHISTCARTINV, E.SIGLAEMISSOR, A.CODT' +
        'IPOACAO, H.QTDEMOVINVCART,'
      '       ABS(H.VLRMOVCARTINV) AS VLRMOVCARTINV, DOP.TOTALDESP,'
      '       H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE,'
      
        '       (0) AS VLRUNITVENDA, (0) AS VLRUNITCOMPRA, (0) AS LOTE, (' +
        '0) AS LUCRO, (0) AS PREJUIZO'
      'FROM HISTCARTINV H, INVESTIMENTO I, ACAO A, EMISSOR E,'
      
        '     (SELECT  H1.IDOPERACAOINVEST, SUM(H1.VLRMOVCARTINV) AS TOTA' +
        'LDESP '
      '      FROM HISTCARTINV H1                        '
      '      WHERE 1 = 2 AND'
      '           (H1.TIPMOVCARTINV    = '#39'DOP'#39')'
      '      GROUP BY H1.IDOPERACAOINVEST ) DOP'
      ''
      'WHERE'
      '      1 = 2 AND'
      '      H.NATURMOVCARTINV = '#39'D'#39' AND'
      '      H.DATAMOVCARTINV >= TO_DATE('#39'01/10/1999'#39','#39'DD/MM/YYYY'#39') AND'
      '      H.DATAMOVCARTINV <= TO_DATE('#39'31/10/1999'#39','#39'DD/MM/YYYY'#39') AND'
      '      H.IDINVESTIMENTO = I.IDINVESTIMENTO AND'
      '      H.IDINVESTIMENTO = A.IDACAO AND'
      '      I.IDEMISSOR = E.IDEMISSOR AND '
      '      H.IDOPERACAOINVEST = DOP.IDOPERACAOINVEST'
      ''
      'ORDER BY H.DATAMOVCARTINV, H.IDHISTCARTINV'
      ' ')
    UpdateObject = updIRRendaVar
    ValidateWithMask = True
    Left = 322
    Top = 63
    object qryIRRendaVarIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryIRRendaVarSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object qryIRRendaVarCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object qryIRRendaVarDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryIRRendaVarQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qryIRRendaVarTOTALDESP: TFloatField
      FieldName = 'TOTALDESP'
    end
    object qryIRRendaVarVLRUNITVENDA: TFloatField
      FieldName = 'VLRUNITVENDA'
    end
    object qryIRRendaVarLOTE: TFloatField
      FieldName = 'LOTE'
    end
    object qryIRRendaVarLUCRO: TFloatField
      FieldName = 'LUCRO'
    end
    object qryIRRendaVarPREJUIZO: TFloatField
      FieldName = 'PREJUIZO'
    end
    object qryIRRendaVarVLRUNITCOMPRA: TFloatField
      FieldName = 'VLRUNITCOMPRA'
    end
    object qryIRRendaVarIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryIRRendaVarIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryIRRendaVarIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryIRRendaVarVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
  end
  object dsIRRendaVar: TwwDataSource
    DataSet = qryIRRendaVar
    Left = 322
    Top = 63
  end
  object bdeIRRendaVar: TppBDEPipeline
    DataSource = dsIRRendaVar
    UserName = 'bdeIRRendaVar'
    Left = 322
    Top = 63
  end
  object RptIRRendaVar: TppReport
    AutoStop = False
    DataPipeline = bdeIRRendaVar
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Provisão IR'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 322
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeIRRendaVar'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object RptIRRendaVarLabel2: TppLabel
        UserName = 'RptIRRendaVarLabel2'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptIRRendaVarLabel4: TppLabel
        UserName = 'RptIRRendaVarLabel4'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptIRRendaVarLabel5: TppLabel
        UserName = 'RptIRRendaVarLabel5'
        Caption = 'Data de Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 18521
        mmWidth = 29898
        BandType = 0
      end
      object RptIRRendaVarLabel6: TppLabel
        UserName = 'RptIRRendaVarLabel6'
        Caption = 'RptIRRendaVarLabel6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55827
        mmTop = 18521
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 
          'Provisão para Imposto de Renda sobre Aplicações Financeiras - Re' +
          'nda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 134673
        BandType = 0
      end
      object ppLabel60: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa19'
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
      object ppLCarteiraIrAplRendVar: TppLabel
        UserName = 'LCarteira16'
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
        mmLeft = 241300
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage20: TppDBImage
        UserName = 'DbLogo19'
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
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284428
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 32015
        mmWidth = 284300
        BandType = 0
      end
      object RptIRRendaVarLine1: TppLine
        UserName = 'RptIRRendaVarLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object RptIRRendaVarLabel7: TppLabel
        UserName = 'RptIRRendaVarLabel7'
        Caption = 'Data '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 27781
        mmWidth = 6615
        BandType = 0
      end
      object Empresa: TppLabel
        UserName = 'Empresa'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 27781
        mmWidth = 12965
        BandType = 0
      end
      object RptIRRendaVarLabel9: TppLabel
        UserName = 'RptIRRendaVarLabel9'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 27781
        mmWidth = 6350
        BandType = 0
      end
      object RptIRRendaVarLabel10: TppLabel
        UserName = 'RptIRRendaVarLabel10'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47361
        mmTop = 27781
        mmWidth = 6615
        BandType = 0
      end
      object RptIRRendaVarLabel11: TppLabel
        UserName = 'RptIRRendaVarLabel11'
        Caption = 'Qtde. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 27781
        mmWidth = 17727
        BandType = 0
      end
      object RptIRRendaVarLabel8: TppLabel
        UserName = 'RptIRRendaVarLabel8'
        Caption = 'Vlr. Unit. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 27781
        mmWidth = 22225
        BandType = 0
      end
      object RptIRRendaVarLabel12: TppLabel
        UserName = 'RptIRRendaVarLabel12'
        Caption = 'Vlr. Unit. Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 113771
        mmTop = 27781
        mmWidth = 24606
        BandType = 0
      end
      object RptIRRendaVarLabel13: TppLabel
        UserName = 'RptIRRendaVarLabel13'
        Caption = 'Vlr. Bruto Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 27781
        mmWidth = 23813
        BandType = 0
      end
      object RptIRRendaVarLabel14: TppLabel
        UserName = 'RptIRRendaVarLabel14'
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 27781
        mmWidth = 14552
        BandType = 0
      end
      object RptIRRendaVarLabel15: TppLabel
        UserName = 'RptIRRendaVarLabel15'
        Caption = 'Lucro na Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 202142
        mmTop = 27781
        mmWidth = 22754
        BandType = 0
      end
      object RptIRRendaVarLabel16: TppLabel
        UserName = 'RptIRRendaVarLabel16'
        Caption = 'Prejuízo na Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 229659
        mmTop = 27781
        mmWidth = 23813
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object RptIRRendaVarDBText1: TppDBText
        UserName = 'RptIRRendaVarDBText1'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = bdeIRRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object RptIRRendaVarDBText2: TppDBText
        UserName = 'RptIRRendaVarDBText2'
        DataField = 'VLRUNITVENDA'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 88106
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object RptIRRendaVarDBText3: TppDBText
        UserName = 'RptIRRendaVarDBText3'
        DataField = 'QTDEMOVINVCART'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.0000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 55563
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
      object RptIRRendaVarDBText4: TppDBText
        UserName = 'RptIRRendaVarDBText4'
        DataField = 'SIGLAEMISSOR'
        DataPipeline = bdeIRRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object RptIRRendaVarDBText5: TppDBText
        UserName = 'RptIRRendaVarDBText5'
        DataField = 'CODTIPOACAO'
        DataPipeline = bdeIRRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object RptIRRendaVarDBText6: TppDBText
        UserName = 'RptIRRendaVarDBText6'
        DataField = 'LOTE'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object RptIRRendaVarDBText7: TppDBText
        UserName = 'RptIRRendaVarDBText7'
        DataField = 'VLRUNITCOMPRA'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 111919
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
      object RptIRRendaVarDBText8: TppDBText
        UserName = 'RptIRRendaVarDBText8'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 794
        mmWidth = 29633
        BandType = 4
      end
      object RptIRRendaVarDBText9: TppDBText
        UserName = 'RptIRRendaVarDBText9'
        DataField = 'TOTALDESP'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object RptIRRendaVarDBText10: TppDBText
        UserName = 'RptIRRendaVarDBText10'
        DataField = 'LUCRO'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 198438
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
      object RptIRRendaVarDBText11: TppDBText
        UserName = 'RptIRRendaVarDBText11'
        DataField = 'PREJUIZO'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3704
        mmLeft = 225690
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
    end
    object RptIRRendaVarSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object RptIRRendaVarLabel18: TppLabel
        UserName = 'RptIRRendaVarLabel18'
        Caption = 'T O T A I S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 107156
        mmTop = 794
        mmWidth = 14023
        BandType = 7
      end
      object RptIRRendaVarDBCalc1: TppDBCalc
        UserName = 'RptIRRendaVarDBCalc1'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3175
        mmLeft = 139171
        mmTop = 794
        mmWidth = 30692
        BandType = 7
      end
      object RptIRRendaVarDBCalc2: TppDBCalc
        UserName = 'RptIRRendaVarDBCalc2'
        DataField = 'TOTALDESP'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 794
        mmWidth = 31485
        BandType = 7
      end
      object RptIRRendaVarDBCalc3: TppDBCalc
        UserName = 'RptIRRendaVarDBCalc3'
        DataField = 'LUCRO'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 794
        mmWidth = 27781
        BandType = 7
      end
      object RptIRRendaVarDBCalc4: TppDBCalc
        UserName = 'RptIRRendaVarDBCalc4'
        DataField = 'PREJUIZO'
        DataPipeline = bdeIRRendaVar
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeIRRendaVar'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 794
        mmWidth = 27781
        BandType = 7
      end
    end
  end
  object updIRRendaVar: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  VLRUNITVENDA = :VLRUNITVENDA,'
      '  VLRUNITCOMPRA = :VLRUNITCOMPRA,'
      '  LOTE = :LOTE,'
      '  LUCRO = :LUCRO,'
      '  PREJUIZO = :PREJUIZO'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (VLRUNITVENDA, VLRUNITCOMPRA, LOTE, LUCRO, PREJUIZO)'
      'values'
      '  (:VLRUNITVENDA, :VLRUNITCOMPRA, :LOTE, :LUCRO, :PREJUIZO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 322
    Top = 63
  end
  object RptEvolImpostos: TppReport
    AutoStop = False
    DataPipeline = bdeEvolImpostos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Evolução dos Impostos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptEvolImpostosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 314
    Top = 137
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeEvolImpostos'
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42863
      mmPrintPosition = 0
      object ppLabel64: TppLabel
        UserName = 'ppLabel64'
        Caption = 'Tipo de Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122238
        mmTop = 19844
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'ppLabel65'
        Caption = 'Instituição Financeira:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 24342
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
        Caption = 'Valor da Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 28840
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        Caption = 'Data da Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 33073
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        Caption = 'Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 24342
        mmWidth = 14552
        BandType = 0
      end
      object RptEvolImpostosppLabel71: TppLabel
        UserName = 'RptEvolImpostosppLabel71'
        Caption = 'Indexador 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 33073
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Taxa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 28840
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'JUROSRENFIX'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 28840
        mmWidth = 12435
        BandType = 0
      end
      object RptEvolImpostosDBText25: TppDBText
        UserName = 'RptEvolImpostosDBText25'
        DataField = 'MOESIGLA2'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 33073
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 24342
        mmWidth = 66940
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        DataField = 'DESCCARTINVEST'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 195527
        mmTop = 14023
        mmWidth = 66411
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 19844
        mmWidth = 66940
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        DataField = 'NOME'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 24342
        mmWidth = 64294
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
        DataField = 'DATAEMTITRENFIX'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 33073
        mmWidth = 22225
        BandType = 0
      end
      object RptEvolImpostosLabel82: TppLabel
        UserName = 'RptEvolImpostosLabel82'
        Caption = '01/01/2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 13758
        BandType = 0
      end
      object RptEvolImpostosLabel2: TppLabel
        UserName = 'RptEvolImpostosLabel2'
        Caption = 'Indexador 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 28840
        mmWidth = 17727
        BandType = 0
      end
      object RptEvolImpostosDBText1: TppDBText
        UserName = 'RptEvolImpostosDBText1'
        DataField = 'MOESIGLA1'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 182563
        mmTop = 28840
        mmWidth = 29633
        BandType = 0
      end
      object RptEvolImpostosDBText3: TppDBText
        UserName = 'RptEvolImpostosDBText3'
        DataField = 'PERCINDEX'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 28840
        mmWidth = 7938
        BandType = 0
      end
      object RptEvolImpostosDBText4: TppDBText
        UserName = 'RptEvolImpostosDBText4'
        DataField = 'PERCINDEX2'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 33073
        mmWidth = 7938
        BandType = 0
      end
      object RptEvolImpostosLabel4: TppLabel
        UserName = 'RptEvolImpostosLabel4'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object RptEvolImpostosLabel5: TppLabel
        UserName = 'RptEvolImpostosLabel5'
        Caption = '01/01/2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 14023
        mmWidth = 13758
        BandType = 0
      end
      object RptEvolImpostosLabel7: TppLabel
        UserName = 'RptEvolImpostosLabel7'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 28840
        mmWidth = 2381
        BandType = 0
      end
      object RptEvolImpostosLabel8: TppLabel
        UserName = 'RptEvolImpostosLabel8'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 33073
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Boleta :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122238
        mmTop = 33073
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        DataField = 'IDLOTE'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 33073
        mmWidth = 16933
        BandType = 0
      end
      object RptEvolImpostosDBText7: TppDBText
        UserName = 'RptEvolImpostosDBText7'
        DataField = 'VLRCOMPRATITLOTE'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 28840
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'Evolução dos Impostos no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 52917
        BandType = 0
      end
      object ppLabel280: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa18'
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
      object ppDBImage19: TppDBImage
        UserName = 'DbLogo18'
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
      object ppShape31: TppShape
        UserName = 'Shape31'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 37835
        mmWidth = 284428
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 42333
        mmWidth = 277549
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'ppLine39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 37835
        mmWidth = 277549
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 38894
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 15875
        mmTop = 38894
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Rend. Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 122238
        mmTop = 38894
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'IR Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 151342
        mmTop = 38894
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'IR Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 179652
        mmTop = 38894
        mmWidth = 6085
        BandType = 0
      end
      object RptEvolImpostosLabel9: TppLabel
        UserName = 'RptEvolImpostosLabel9'
        Caption = 'Rend. Acum. Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 92075
        mmTop = 38894
        mmWidth = 17463
        BandType = 0
      end
      object RptEvolImpostosLabel3: TppLabel
        UserName = 'RptEvolImpostosLabel3'
        Caption = 'IR Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 204259
        mmTop = 38894
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        Caption = 'IOF Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 226219
        mmTop = 38894
        mmWidth = 10319
        BandType = 0
      end
      object RptEvolImpostosLabel1: TppLabel
        UserName = 'RptEvolImpostosLabel1'
        Caption = 'IOF Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 254530
        mmTop = 38894
        mmWidth = 7408
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText33: TppDBText
        UserName = 'ppDBText33'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 529
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText34'
        DataField = 'HISTMOVCARTINV'
        DataPipeline = bdeEvolImpostos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 15875
        mmTop = 529
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText35'
        DataField = 'RENDIMENTO'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 110331
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        DataField = 'SALDOIRPROV'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 135996
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText37'
        DataField = 'VLRIR'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 161396
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText38'
        DataField = 'SALDOIOFPROV'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 212196
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object RptEvolImpostosDBText2: TppDBText
        UserName = 'RptEvolImpostosDBText2'
        DataField = 'VLRIOF'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 237596
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object RptEvolImpostosDBText5: TppDBText
        UserName = 'RptEvolImpostosDBText5'
        DataField = 'IRACUMMES'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 186796
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object RptEvolImpostosDBText6: TppDBText
        UserName = 'RptEvolImpostosDBText6'
        DataField = 'RENDACUMMES'
        DataPipeline = bdeEvolImpostos
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolImpostos'
        mmHeight = 2646
        mmLeft = 85196
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine40: TppLine
        UserName = 'ppLine40'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 277549
        BandType = 8
      end
      object ppLabel83: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel83'
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
        mmTop = 2117
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc35: TppSystemVariable
        UserName = 'Calc35'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc36: TppSystemVariable
        UserName = 'Calc36'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDLOTE'
      DataPipeline = bdeEvolImpostos
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeEvolImpostos'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryEvolImpostos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DISTINCT'
      
        '   HI.IDCARTEIRAINVEST, HI.IDINVESTIMENTO, HI.DATAMOVCARTINV, HI' +
        '.TIPMOVCARTINV, '
      
        '   HI.VLRJUROS,HI.VLRVARIACAO,HI.SALDOIRPROV,HI.IDLOTE,HI.SALDOI' +
        'OFPROV, '
      '   HI.NATURMOVCARTINV,HI.VLRMOVCARTINV,HI.HISTMOVCARTINV,'
      '   (HI.VLRIRAPU+HI.VLRIRPROV) AS VLRIR,'
      '   (HI.VLRIOFAPU+HI.VLRIOFPROV) AS VLRIOF,'
      '   (HI.VLRJUROS+HI.VLRVARIACAO) AS RENDIMENTO,'
      '   (0) AS RENDACUMMES,'
      '   CA.DESCCARTINVEST, '
      '   IV.DESCINVESTIMENTO,'
      
        '   TT.DATAEMTITRENFIX, TT.JUROSRENFIX, TT.INDEXRENFIX, TT.PERCIN' +
        'DEX, '
      '   TT.INDEXRENFIX2, TT.PERCINDEX2,'
      '   TP.DESCTIPRENFIXA,'
      '   PE.NOME,'
      '   CT.VLRCOMPRATITLOTE,'
      '   MO1.MOESIGLA AS MOESIGLA1, '
      '   MO2.MOESIGLA AS MOESIGLA2,'
      '   (0) AS IRACUMMES, (0) AS POSSUISALDO'
      'FROM      '
      '   HISTCARTINV HI,'
      '   INVESTIMENTO IV,'
      '   CARTEIRAINVEST CA,'
      '   TIPOTITRENFIXA TP,'
      '   TITRENFIXA TT,'
      '   PESSOA PE,'
      '   CONTRATOINVESTIM CT,'
      '   MOEDA MO1,'
      '   MOEDA MO2'
      'WHERE'
      '        1 = 2 '
      '   AND (HI.IDTIPOINVEST = 1)'
      '   AND (HI.NATURMOVCARTINV <> '#39'L'#39')'
      
        '   AND (HI.DATAMOVCARTINV  <= TO_DATE('#39'28/08/2000'#39','#39'DD/MM/YYYY'#39')' +
        ') '
      
        '   AND (HI.IDINVESTIMENTO = 2206) AND (IV.IDINVESTIMENTO = 2206)' +
        ' '
      
        '   AND (HI.IDCARTEIRAINVEST = 10)   AND (CA.IDCARTEIRAINVEST = 1' +
        '0)'
      
        '   AND (HI.IDINVESTIMENTO = 2206)   AND (TT.IDTITRENFIXA = 2206)' +
        ' '
      
        '   AND (HI.IDINVESTIMENTO = 2206)   AND (CT.IDINVESTIMENTO = 220' +
        '6) '
      
        '   AND (TT.CODTIPRENFIXA = '#39'CDPRE'#39') AND (TP.CODTIPRENFIXA = '#39'CDP' +
        'RE'#39')            '
      '   AND (PE.IDPESSOA = 1524289)      AND (IV.IDEMISSOR=1524289)'
      '   AND (TT.INDEXRENFIX  = MO1.MOECODIGO (+))'
      '   AND (TT.INDEXRENFIX2 = MO2.MOECODIGO (+))'
      'ORDER BY'
      '   HI.DATAMOVCARTINV  '
      ' ')
    UpdateObject = updEvolImpostos
    ValidateWithMask = True
    Left = 322
    Top = 195
    object qryEvolImpostosIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryEvolImpostosIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryEvolImpostosDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryEvolImpostosTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object m: TFloatField
      FieldName = 'VLRJUROS'
    end
    object qryEvolImpostosVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
    end
    object qryEvolImpostosSALDOIRPROV: TFloatField
      FieldName = 'SALDOIRPROV'
    end
    object qryEvolImpostosIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryEvolImpostosVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryEvolImpostosSALDOIOFPROV: TFloatField
      FieldName = 'SALDOIOFPROV'
    end
    object qryEvolImpostosDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryEvolImpostosDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryEvolImpostosDATAEMTITRENFIX: TDateTimeField
      FieldName = 'DATAEMTITRENFIX'
    end
    object qryEvolImpostosJUROSRENFIX: TFloatField
      FieldName = 'JUROSRENFIX'
    end
    object qryEvolImpostosINDEXRENFIX: TFloatField
      FieldName = 'INDEXRENFIX'
    end
    object qryEvolImpostosPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
    end
    object qryEvolImpostosINDEXRENFIX2: TFloatField
      FieldName = 'INDEXRENFIX2'
    end
    object qryEvolImpostosPERCINDEX2: TFloatField
      FieldName = 'PERCINDEX2'
    end
    object qryEvolImpostosDESCTIPRENFIXA: TStringField
      FieldName = 'DESCTIPRENFIXA'
      Size = 60
    end
    object qryEvolImpostosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryEvolImpostosMOESIGLA1: TStringField
      FieldName = 'MOESIGLA1'
      Size = 10
    end
    object qryEvolImpostosMOESIGLA2: TStringField
      FieldName = 'MOESIGLA2'
      Size = 10
    end
    object qryEvolImpostosIRACUMMES: TFloatField
      FieldName = 'IRACUMMES'
    end
    object qryEvolImpostosPOSSUISALDO: TFloatField
      FieldName = 'POSSUISALDO'
    end
    object qryEvolImpostosVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object qryEvolImpostosNATURMOVCARTINV: TStringField
      FieldName = 'NATURMOVCARTINV'
      Size = 1
    end
    object qryEvolImpostosVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qryEvolImpostosHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
    object qryEvolImpostosRENDIMENTO: TFloatField
      FieldName = 'RENDIMENTO'
    end
    object qryEvolImpostosRENDACUMMES: TFloatField
      FieldName = 'RENDACUMMES'
    end
    object qryEvolImpostosVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsEvolImpostos: TwwDataSource
    DataSet = qryEvolImpostos
    Left = 322
    Top = 195
  end
  object bdeEvolImpostos: TppBDEPipeline
    DataSource = dsEvolImpostos
    UserName = 'bdeEvolImpostos'
    Left = 322
    Top = 195
  end
  object updEvolImpostos: TUpdateSQL
    Left = 322
    Top = 195
  end
  object RptIntegraFinContabil: TppReport
    AutoStop = False
    DataPipeline = bdeIntegraFinContabil
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Int. Fin. Contábil'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptIntegraFinContabilBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 417
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeIntegraFinContabil'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31221
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 30956
        mmWidth = 277549
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 24871
        mmWidth = 277549
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'ppShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 25400
        mmWidth = 277813
        BandType = 0
      end
      object RptIntegraFinContabilLabel3: TppLabel
        UserName = 'RptIntegraFinContabilLabel3'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 26458
        mmWidth = 8467
        BandType = 0
      end
      object RptIntegraFinContabilLabel4: TppLabel
        UserName = 'RptIntegraFinContabilLabel4'
        Caption = 'Tipo de Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30692
        mmTop = 26458
        mmWidth = 14817
        BandType = 0
      end
      object RptIntegraFinContabilLabel5: TppLabel
        UserName = 'RptIntegraFinContabilLabel5'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 26458
        mmWidth = 14552
        BandType = 0
      end
      object RptIntegraFinContabilLabel6: TppLabel
        UserName = 'RptIntegraFinContabilLabel6'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 94456
        mmTop = 26458
        mmWidth = 8731
        BandType = 0
      end
      object RptIntegraFinContabilLabel7: TppLabel
        UserName = 'RptIntegraFinContabilLabel7'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 106098
        mmTop = 26458
        mmWidth = 9790
        BandType = 0
      end
      object RptIntegraFinContabilLabel8: TppLabel
        UserName = 'RptIntegraFinContabilLabel8'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 161396
        mmTop = 26458
        mmWidth = 4498
        BandType = 0
      end
      object RptIntegraFinContabilLabel9: TppLabel
        UserName = 'RptIntegraFinContabilLabel9'
        Caption = 'Tipo de Oper.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 166952
        mmTop = 26458
        mmWidth = 14817
        BandType = 0
      end
      object RptIntegraFinContabilLabel10: TppLabel
        UserName = 'RptIntegraFinContabilLabel10'
        Caption = 'Conta Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 26458
        mmWidth = 14552
        BandType = 0
      end
      object RptIntegraFinContabilLabel11: TppLabel
        UserName = 'RptIntegraFinContabilLabel11'
        Caption = 'Conta Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 235480
        mmTop = 26458
        mmWidth = 15081
        BandType = 0
      end
      object RptIntegraFinContabilLine3: TppLine
        UserName = 'RptIntegraFinContabilLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25135
        mmWidth = 277549
        BandType = 0
      end
      object RptIntegraFinContabilLabel2: TppLabel
        UserName = 'RptIntegraFinContabilLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 214313
        mmTop = 26458
        mmWidth = 10848
        BandType = 0
      end
      object RptIntegraFinContabilLabel13: TppLabel
        UserName = 'RptIntegraFinContabilLabel13'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 259292
        mmTop = 26458
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Integração Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel67: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa12'
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
      object ppLCarteiraIntContab: TppLabel
        UserName = 'LCarteira10'
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
        mmLeft = 258234
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel260: TppLabel
        UserName = 'LPeriodo8'
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
      object ppDBImage13: TppDBImage
        UserName = 'DbLogo12'
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
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape23: TppShape
        OnPrint = ppShape23Print
        UserName = 'ppShape23'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 277813
        BandType = 4
      end
      object RptIntegraFinContabilDBText3: TppDBText
        UserName = 'RptIntegraFinContabilDBText3'
        DataField = 'RUBRICA'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object RptIntegraFinContabilDBText4: TppDBText
        UserName = 'RptIntegraFinContabilDBText4'
        DataField = 'TIPOTITULO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 30692
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
      object RptIntegraFinContabilDBText5: TppDBText
        UserName = 'RptIntegraFinContabilDBText5'
        DataField = 'INVESTIMENTO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 529
        mmWidth = 32808
        BandType = 4
      end
      object RptIntegraFinContabilDBText6: TppDBText
        UserName = 'RptIntegraFinContabilDBText6'
        DataField = 'CARTEIRA'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 94456
        mmTop = 529
        mmWidth = 8202
        BandType = 4
      end
      object RptIntegraFinContabilDBText7: TppDBText
        UserName = 'RptIntegraFinContabilDBText7'
        DataField = 'HISTORICO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 529
        mmWidth = 56886
        BandType = 4
      end
      object RptIntegraFinContabilDBText8: TppDBText
        UserName = 'RptIntegraFinContabilDBText8'
        DataField = 'TIPOLANCTO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 529
        mmWidth = 2646
        BandType = 4
      end
      object RptIntegraFinContabilDBText9: TppDBText
        UserName = 'RptIntegraFinContabilDBText9'
        DataField = 'TIPOOPERCONTABIL'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object RptIntegraFinContabilDBText10: TppDBText
        UserName = 'RptIntegraFinContabilDBText10'
        DataField = 'CONTADEBITO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptIntegraFinContabilDBText11: TppDBText
        UserName = 'RptIntegraFinContabilDBText11'
        DataField = 'CONTACREDITO'
        DataPipeline = bdeIntegraFinContabil
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeIntegraFinContabil'
        mmHeight = 3175
        mmLeft = 235480
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptIntegraFinContabilLabel14: TppLabel
        UserName = 'RptIntegraFinContabilLabel14'
        Caption = 'RptIntegraFinContabilLabel14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 214313
        mmTop = 529
        mmWidth = 32279
        BandType = 4
      end
      object RptIntegraFinContabilLabel15: TppLabel
        UserName = 'RptIntegraFinContabilLabel15'
        Caption = 'RptIntegraFinContabilLabel15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 259292
        mmTop = 529
        mmWidth = 32279
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 277549
        BandType = 8
      end
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
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
        mmTop = 2117
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptIntegraFinContabilGroup1: TppGroup
      BreakName = 'TIPOINVESTIMENTO'
      DataPipeline = bdeIntegraFinContabil
      OutlineSettings.CreateNode = True
      UserName = 'RptIntegraFinContabilGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeIntegraFinContabil'
      object RptIntegraFinContabilGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptIntegraFinContabilGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptIntegraFinContabilGroup2: TppGroup
      BreakName = 'OPERACAO'
      DataPipeline = bdeIntegraFinContabil
      OutlineSettings.CreateNode = True
      UserName = 'RptIntegraFinContabilGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeIntegraFinContabil'
      object RptIntegraFinContabilGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptIntegraFinContabilDBText2: TppDBText
          UserName = 'RptIntegraFinContabilDBText2'
          DataField = 'OPERACAO'
          DataPipeline = bdeIntegraFinContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeIntegraFinContabil'
          mmHeight = 2910
          mmLeft = 137319
          mmTop = 1058
          mmWidth = 100277
          BandType = 3
          GroupNo = 1
        end
        object RptIntegraFinContabilLabel12: TppLabel
          UserName = 'RptIntegraFinContabilLabel12'
          Caption = 'Tipo de Operação :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 112448
          mmTop = 1058
          mmWidth = 20902
          BandType = 3
          GroupNo = 1
        end
        object RptIntegraFinContabilLabel1: TppLabel
          UserName = 'RptIntegraFinContabilLabel1'
          Caption = 'Tipo de Investimento :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object RptIntegraFinContabilDBText1: TppDBText
          UserName = 'RptIntegraFinContabilDBText1'
          DataField = 'TIPOINVESTIMENTO'
          DataPipeline = bdeIntegraFinContabil
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeIntegraFinContabil'
          mmHeight = 2910
          mmLeft = 28046
          mmTop = 1058
          mmWidth = 78317
          BandType = 3
          GroupNo = 1
        end
        object RptIntegraFinContabilLine1: TppLine
          UserName = 'RptIntegraFinContabilLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4763
          mmWidth = 277549
          BandType = 3
          GroupNo = 1
        end
        object RptIntegraFinContabilLine2: TppLine
          UserName = 'RptIntegraFinContabilLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 277549
          BandType = 3
          GroupNo = 1
        end
      end
      object RptIntegraFinContabilGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object bdeIntegraFinContabil: TppBDEPipeline
    DataSource = dsIntegraFinContabil
    UserName = 'bdeIntegraFinContabil'
    Left = 417
    Top = 63
  end
  object updIntegraFinContabil: TUpdateSQL
    Left = 449
    Top = 63
  end
  object qryIntegraFinContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      'TIPOINVEST.DESCTIPOINVEST AS TIPOINVESTIMENTO,'
      'TIPOOPERACAO.DESCTIPOOPERACAO AS OPERACAO,'
      'TIPODESPINVEST.DESCTIPODESPINV AS RUBRICA,'
      
        'TIPOACAO.DESCTIPOACAO||TIPOTITRENFIXA.DESCTIPRENFIXA AS TIPOTITU' +
        'LO,'
      'INVESTIMENTO.DESCINVESTIMENTO AS INVESTIMENTO,'
      'CARTEIRAINVEST.DESCCARTINVEST AS CARTEIRA,'
      'PADRLANCCONTINV.HISTLANCINVEST AS HISTORICO,'
      'PADRLANCCONTINV.FLGPAGRECNAO AS TIPOLANCTO,'
      'TIPOPER.TIPDESCRICAO AS TIPOOPERCONTABIL,'
      'PADRLANCCONTINV.CONTADOPERFIN  AS CONTADEBITO,'
      'PADRLANCCONTINV.CONTACOPERFIN  AS CONTACREDITO'
      ''
      ''
      'FROM'
      ''
      'PADRLANCCONTINV,'
      'TIPOINVEST,'
      'TIPOOPERACAO,'
      'PESSOA,'
      'TIPOACAO,'
      'TIPOTITRENFIXA,'
      'CARTEIRAINVEST,'
      'TIPODESPINVEST,'
      'INVESTIMENTO,'
      'TIPOPER'
      ''
      'WHERE'
      ''
      '1 = 2 AND'
      'PADRLANCCONTINV.TIPCODIGO = TIPOPER.TIPCODIGO(+) AND'
      'PADRLANCCONTINV.IDTIPOINVEST=TIPOINVEST.IDTIPOINVEST(+) AND'
      
        'PADRLANCCONTINV.IDTIPOOPERACAO=TIPOOPERACAO.IDTIPOOPERACAO(+) AN' +
        'D'
      'PADRLANCCONTINV.IDPESSOA=PESSOA.IDPESSOA(+) AND'
      'PADRLANCCONTINV.CODTIPTITULO=TIPOACAO.CODTIPOACAO(+) AND'
      'PADRLANCCONTINV.CODTIPTITULO=TIPOTITRENFIXA.CODTIPRENFIXA(+) AND'
      
        'PADRLANCCONTINV.IDCARTEIRAINVEST=CARTEIRAINVEST.IDCARTEIRAINVEST' +
        '(+) AND'
      
        'PADRLANCCONTINV.IDTIPODESPINVEST=TIPODESPINVEST.IDTIPODESPINVEST' +
        '(+) AND'
      'PADRLANCCONTINV.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO(+)'
      ''
      
        'ORDER BY TIPOINVESTIMENTO, OPERACAO, RUBRICA , TIPOTITULO, INVES' +
        'TIMENTO,HISTORICO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 401
    Top = 63
    object qryIntegraFinContabilTIPOINVESTIMENTO: TStringField
      FieldName = 'TIPOINVESTIMENTO'
      Size = 60
    end
    object qryIntegraFinContabilOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 60
    end
    object qryIntegraFinContabilRUBRICA: TStringField
      FieldName = 'RUBRICA'
      Size = 60
    end
    object qryIntegraFinContabilTIPOTITULO: TStringField
      FieldName = 'TIPOTITULO'
      Size = 120
    end
    object qryIntegraFinContabilINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryIntegraFinContabilCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 60
    end
    object qryIntegraFinContabilHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object qryIntegraFinContabilTIPOLANCTO: TStringField
      FieldName = 'TIPOLANCTO'
      Size = 1
    end
    object qryIntegraFinContabilTIPOOPERCONTABIL: TStringField
      FieldName = 'TIPOOPERCONTABIL'
      Size = 25
    end
    object qryIntegraFinContabilCONTADEBITO: TStringField
      FieldName = 'CONTADEBITO'
      Size = 18
    end
    object qryIntegraFinContabilCONTACREDITO: TStringField
      FieldName = 'CONTACREDITO'
      Size = 18
    end
  end
  object dsIntegraFinContabil: TwwDataSource
    DataSet = qryIntegraFinContabil
    Left = 449
    Top = 63
  end
  object QryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 219
    Top = 458
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    ValidateWithMask = True
    Left = 219
    Top = 458
  end
  object bdeEvolIRLit: TppBDEPipeline
    DataSource = dtsEvolIRLit
    UserName = 'bdeEvolIRLit'
    Left = 47
    Top = 331
  end
  object dtsEvolIRLit: TwwDataSource
    DataSet = qryEvolIRLit
    Left = 47
    Top = 331
  end
  object qryEvolIRLit: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OL.DESORIGEMLITIGIO,'
      '       SL.DATAATUALIZACAO AS DATAFATOR,'
      '       '#39'RENDA FIXA'#39' AS DESFATOGERADOR,'
      '       SUM(IR.VLRIRLITIGIO) AS VLRIRLITIGIO,'
      '       SUM(SL.VLRSLDIRLITIGIO) AS VLRSLDIRLITIGIO,'
      '       SL.DATAATUALIZACAO,'
      '       TR.DESCTIPRENFIXA'
      'FROM SALDOIRLITIGIO SL , IRLITIGIO IR ,'
      '     ORIGEMIRLITIGIO OL , TITRENFIXA TI,'
      '     TIPOTITRENFIXA TR'
      'WHERE'
      '   IR.IDORIGEMIRLITIGIO = OL.IDORIGEMIRLITIGIO AND'
      '   IR.IDINVESTIMENTO    = TI.IDTITRENFIXA AND'
      '   IR.IDIRLITIGIO       = SL.IDIRLITIGIO AND'
      '   TI.CODTIPRENFIXA     = TR.CODTIPRENFIXA AND'
      '   IR.IDORIGEMIRLITIGIO = 1 AND'
      '   SL.DATAATUALIZACAO   = :P_DATAATUALIZACAO'
      
        'GROUP BY OL.DESORIGEMLITIGIO, SL.DATAATUALIZACAO, TR.DESCTIPRENF' +
        'IXA'
      'UNION'
      'SELECT OL.DESORIGEMLITIGIO,'
      '       SL.DATAATUALIZACAO AS DATAFATOR,'
      '       '#39'RENDA VARIAVEL'#39' AS DESFATOGERADOR,'
      '       SUM(IR.VLRIRLITIGIO) VLRIRLITIGIO,'
      '       SUM(SL.VLRSLDIRLITIGIO) VLRSLDIRLITIGIO,'
      '       SL.DATAATUALIZACAO,'
      '       '#39' '#39' AS DESCTIPRENFIXA'
      'FROM SALDOIRLITIGIO SL , IRLITIGIO IR ,'
      '     ORIGEMIRLITIGIO OL'
      'WHERE'
      '   IR.IDORIGEMIRLITIGIO = OL.IDORIGEMIRLITIGIO AND'
      '   IR.IDIRLITIGIO       = SL.IDIRLITIGIO AND'
      '   IR.IDORIGEMIRLITIGIO = 2 AND'
      '   SL.DATAATUALIZACAO   = :P_DATAATUALIZACAO'
      'GROUP BY OL.DESORIGEMLITIGIO, SL.DATAATUALIZACAO'
      ' ')
    ValidateWithMask = True
    Left = 47
    Top = 331
    ParamData = <
      item
        DataType = ftDate
        Name = 'P_DATAATUALIZACAO'
        ParamType = ptResult
      end
      item
        DataType = ftDate
        Name = 'P_DATAATUALIZACAO'
        ParamType = ptResult
      end>
  end
  object RpEvolIRLit: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '0'
      '0')
    DataPipeline = bdeEvolIRLit
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Evolução do IR Litígio'
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
    BeforePrint = RpEvolIRLitBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 47
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeEvolIRLit'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel94: TppLabel
        UserName = 'Label1'
        Caption = 'Evolução do IR Litígio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel134: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa27'
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
      object ppLabel312: TppLabel
        UserName = 'LCarteira24'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RpEvolIRLitLabel7: TppLabel
        UserName = 'LPeriodo17'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage27: TppDBImage
        UserName = 'DbLogo27'
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
      object ppShape43: TppShape
        UserName = 'Shape43'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284428
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 197300
        BandType = 0
      end
      object RpEvolIRLitLabel1: TppLabel
        UserName = 'RpEvolIRLitLabel1'
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 22754
        mmWidth = 7408
        BandType = 0
      end
      object RpEvolIRLitLabel2: TppLabel
        UserName = 'RpEvolIRLitLabel2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 41275
        mmTop = 22754
        mmWidth = 4498
        BandType = 0
      end
      object RpEvolIRLitLabel3: TppLabel
        UserName = 'RpEvolIRLitLabel3'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 59796
        mmTop = 22754
        mmWidth = 9525
        BandType = 0
      end
      object RpEvolIRLitLabel4: TppLabel
        UserName = 'RpEvolIRLitLabel4'
        Caption = 'Tipo do Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 117740
        mmTop = 22754
        mmWidth = 14023
        BandType = 0
      end
      object RpEvolIRLitLabel5: TppLabel
        UserName = 'RpEvolIRLitLabel5'
        Caption = 'Valor IR Litígio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 157427
        mmTop = 22754
        mmWidth = 14552
        BandType = 0
      end
      object RpEvolIRLitLabel6: TppLabel
        UserName = 'RpEvolIRLitLabel6'
        Caption = 'Valor Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 180446
        mmTop = 22754
        mmWidth = 16404
        BandType = 0
      end
      object RpEvolIRLitLine1: TppLine
        UserName = 'RpEvolIRLitLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25665
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
      object RpEvolIRLitDBText2: TppDBText
        UserName = 'RpEvolIRLitDBText2'
        AutoSize = True
        DataField = 'DATAFATOR'
        DataPipeline = bdeEvolIRLit
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2381
        mmLeft = 41275
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object RpEvolIRLitDBText3: TppDBText
        UserName = 'RpEvolIRLitDBText3'
        AutoSize = True
        DataField = 'DESFATOGERADOR'
        DataPipeline = bdeEvolIRLit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2381
        mmLeft = 59796
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object RpEvolIRLitDBText4: TppDBText
        UserName = 'RpEvolIRLitDBText4'
        AutoSize = True
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeEvolIRLit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2381
        mmLeft = 117740
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object RpEvolIRLitDBText5: TppDBText
        UserName = 'RpEvolIRLitDBText5'
        AutoSize = True
        DataField = 'VLRIRLITIGIO'
        DataPipeline = bdeEvolIRLit
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2381
        mmLeft = 158750
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object RpEvolIRLitDBText6: TppDBText
        UserName = 'RpEvolIRLitDBText6'
        AutoSize = True
        DataField = 'VLRSLDIRLITIGIO'
        DataPipeline = bdeEvolIRLit
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2381
        mmLeft = 179388
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object RpEvolIRLitDBText1: TppDBText
        UserName = 'RpEvolIRLitDBText1'
        DataField = 'DESORIGEMLITIGIO'
        DataPipeline = bdeEvolIRLit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeEvolIRLit'
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel63: TppLabel
        UserName = 'ppLabel63'
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
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
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
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
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
    object RpEvolIRLitGroup1: TppGroup
      BreakName = 'DESORIGEMLITIGIO'
      DataPipeline = bdeEvolIRLit
      OutlineSettings.CreateNode = True
      UserName = 'RpEvolIRLitGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeEvolIRLit'
      object RpEvolIRLitGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RpEvolIRLitGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object RpEvolIRLitDBCalc1: TppDBCalc
          UserName = 'RpEvolIRLitDBCalc1'
          DataField = 'VLRIRLITIGIO'
          DataPipeline = bdeEvolIRLit
          DisplayFormat = ',#00.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = RpEvolIRLitGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEvolIRLit'
          mmHeight = 2646
          mmLeft = 156104
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object RpEvolIRLitDBCalc2: TppDBCalc
          UserName = 'RpEvolIRLitDBCalc2'
          DataField = 'VLRSLDIRLITIGIO'
          DataPipeline = bdeEvolIRLit
          DisplayFormat = ',#00.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = RpEvolIRLitGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEvolIRLit'
          mmHeight = 2646
          mmLeft = 180975
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryHistCotAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IV.DESCINVESTIMENTO,'
      '   EM.SIGLAEMISSOR,'
      '   BV.SGLBOLSAVALORES,'
      '   CA.IDBOLSAVALORES,'
      '   CA.DATACOTAACAO,'
      '   CA.IDACAO,'
      '   CA.VLRABERTURA,'
      '   CA.VLRFECHAMENTO,'
      '   CA.VLRMAXIMA,'
      '   CA.VLRMINIMA,'
      '   CA.VLRMEDIA,'
      '   CA.VOLNEGOCIADO,'
      '   CA.QTDELOTE,'
      '   ROUND((CA.VLRMEDIA/CA.QTDELOTE),8) AS VLRDIVMEDIA'
      
        'FROM EMISSOR EM, COTACAOACAO CA, BOLSAVALORES BV, INVESTIMENTO I' +
        'V'
      'WHERE CA.IDEMISSOR = EM.IDEMISSOR AND'
      '      CA.IDBOLSAVALORES = BV.IDBOLSAVALORES AND'
      '      CA.IDACAO = IV.IDINVESTIMENTO AND'
      '      IV.IDTIPOINVEST = 2 AND'
      '      CA.DATACOTAACAO >= :DATAINICIAL AND'
      '      CA.DATACOTAACAO <= :DATAFINAL AND'
      '      CA.IDBOLSAVALORES = :P_IDBOLSAVALORES'
      'ORDER BY IV.DESCINVESTIMENTO,  CA.DATACOTAACAO DESC'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 524
    Top = 195
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINICIAL'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFINAL'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'P_IDBOLSAVALORES'
        ParamType = ptResult
      end>
  end
  object dtsHistCotAcao: TwwDataSource
    DataSet = qryHistCotAcao
    Left = 524
    Top = 195
  end
  object bdeHistCotAcao: TppBDEPipeline
    DataSource = dtsHistCotAcao
    UserName = 'bdeHistCotAcao'
    Left = 524
    Top = 195
    object bdeHistCotAcaoppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object bdeHistCotAcaoppField2: TppField
      FieldAlias = 'SIGLAEMISSOR'
      FieldName = 'SIGLAEMISSOR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object bdeHistCotAcaoppField3: TppField
      FieldAlias = 'SGLBOLSAVALORES'
      FieldName = 'SGLBOLSAVALORES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object bdeHistCotAcaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBOLSAVALORES'
      FieldName = 'IDBOLSAVALORES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeHistCotAcaoppField5: TppField
      FieldAlias = 'DATACOTAACAO'
      FieldName = 'DATACOTAACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object bdeHistCotAcaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDACAO'
      FieldName = 'IDACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeHistCotAcaoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRABERTURA'
      FieldName = 'VLRABERTURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeHistCotAcaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRFECHAMENTO'
      FieldName = 'VLRFECHAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeHistCotAcaoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMAXIMA'
      FieldName = 'VLRMAXIMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeHistCotAcaoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMINIMA'
      FieldName = 'VLRMINIMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeHistCotAcaoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMEDIA'
      FieldName = 'VLRMEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeHistCotAcaoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VOLNEGOCIADO'
      FieldName = 'VOLNEGOCIADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object bdeHistCotAcaoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDELOTE'
      FieldName = 'QTDELOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object bdeHistCotAcaoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDIVMEDIA'
      FieldName = 'VLRDIVMEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object RptHistCotAcao: TppReport
    AutoStop = False
    DataPipeline = bdeHistCotAcao
    OnStartPage = RptHistCotAcaoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Cotações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptHistCotAcaoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 524
    Top = 137
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeHistCotAcao'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object RptHistCotAcaoLabel11: TppLabel
        UserName = 'RptHistCotAcaoLabel11'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object RptHistCotAcaoLabel12: TppLabel
        UserName = 'RptHistCotAcaoLabel12'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptHistCotAcaoLabel13: TppLabel
        UserName = 'RptHistCotAcaoLabel13'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47096
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptHistCotAcaoLabel14: TppLabel
        UserName = 'RptHistCotAcaoLabel14'
        Caption = 'Bolsa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 22490
        mmWidth = 72761
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label1'
        Caption = 'Histórico de Cotação de Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel157: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa10'
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
      object ppLCotacaoAcao: TppLabel
        UserName = 'LCarteira9'
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
        mmLeft = 259557
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage11: TppDBImage
        UserName = 'DbLogo10'
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
      object ppShape29: TppShape
        UserName = 'Shape29'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284428
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27517
        mmWidth = 284300
        BandType = 0
      end
      object RptHistCotAcaoLine1: TppLine
        UserName = 'RptHistCotAcaoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 284300
        BandType = 0
      end
      object RptHistCotAcaoLabel3: TppLabel
        UserName = 'RptHistCotAcaoLabel3'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 112184
        mmTop = 28575
        mmWidth = 5821
        BandType = 0
      end
      object RptHistCotAcaoLabel5: TppLabel
        UserName = 'RptHistCotAcaoLabel5'
        Caption = 'Abertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 28575
        mmWidth = 11642
        BandType = 0
      end
      object RptHistCotAcaoLabel6: TppLabel
        UserName = 'RptHistCotAcaoLabel6'
        Caption = 'Fechamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 28575
        mmWidth = 16140
        BandType = 0
      end
      object RptHistCotAcaoLabel7: TppLabel
        UserName = 'RptHistCotAcaoLabel7'
        Caption = 'Mínima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 28575
        mmWidth = 9525
        BandType = 0
      end
      object RptHistCotAcaoLabel8: TppLabel
        UserName = 'RptHistCotAcaoLabel8'
        Caption = 'Máxima'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 28575
        mmWidth = 10319
        BandType = 0
      end
      object RptHistCotAcaoLabel9: TppLabel
        UserName = 'RptHistCotAcaoLabel9'
        Caption = 'Média'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 212196
        mmTop = 28575
        mmWidth = 7938
        BandType = 0
      end
      object RptHistCotAcaoLabel10: TppLabel
        UserName = 'RptHistCotAcaoLabel10'
        Caption = 'Vol. Negociado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 251884
        mmTop = 28575
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Cotação/Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 229743
        mmTop = 28575
        mmWidth = 17907
        BandType = 0
      end
      object RptHistCotAcaoLabel2: TppLabel
        UserName = 'RptHistCotAcaoLabel2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 28575
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 28575
        mmWidth = 6615
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape24: TppShape
        OnPrint = ppShape24Print
        UserName = 'Shape24'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object RptHistCotAcaoDBText2: TppDBText
        UserName = 'RptHistCotAcaoDBText2'
        DataField = 'DATACOTAACAO'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object RptHistCotAcaoDBText3: TppDBText
        UserName = 'RptHistCotAcaoDBText3'
        AutoSize = True
        DataField = 'QTDELOTE'
        DataPipeline = bdeHistCotAcao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 102723
        mmTop = 265
        mmWidth = 15282
        BandType = 4
      end
      object RptHistCotAcaoDBText5: TppDBText
        UserName = 'RptHistCotAcaoDBText5'
        AutoSize = True
        DataField = 'VLRABERTURA'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 121392
        mmTop = 265
        mmWidth = 20955
        BandType = 4
      end
      object RptHistCotAcaoDBText6: TppDBText
        UserName = 'RptHistCotAcaoDBText6'
        AutoSize = True
        DataField = 'VLRFECHAMENTO'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 144283
        mmTop = 265
        mmWidth = 25315
        BandType = 4
      end
      object RptHistCotAcaoDBText7: TppDBText
        UserName = 'RptHistCotAcaoDBText7'
        AutoSize = True
        DataField = 'VLRMINIMA'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 170826
        mmTop = 265
        mmWidth = 15706
        BandType = 4
      end
      object RptHistCotAcaoDBText8: TppDBText
        UserName = 'RptHistCotAcaoDBText8'
        AutoSize = True
        DataField = 'VLRMAXIMA'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 187664
        mmTop = 265
        mmWidth = 16595
        BandType = 4
      end
      object RptHistCotAcaoDBText9: TppDBText
        UserName = 'RptHistCotAcaoDBText9'
        AutoSize = True
        DataField = 'VLRMEDIA'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 205656
        mmTop = 265
        mmWidth = 14478
        BandType = 4
      end
      object RptHistCotAcaoDBText10: TppDBText
        UserName = 'RptHistCotAcaoDBText10'
        AutoSize = True
        DataField = 'VOLNEGOCIADO'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3260
        mmLeft = 248740
        mmTop = 265
        mmWidth = 22987
        BandType = 4
      end
      object ppDBText114: TppDBText
        UserName = 'DBText114'
        DataField = 'VLRDIVMEDIA'
        DataPipeline = bdeHistCotAcao
        DisplayFormat = '###,###,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeHistCotAcao'
        mmHeight = 3175
        mmLeft = 230453
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel53: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel53'
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
        mmWidth = 284163
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = bdeHistCotAcao
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeHistCotAcao'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object ppDBText113: TppDBText
          UserName = 'DBText113'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = bdeHistCotAcao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeHistCotAcao'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 0
          mmWidth = 79375
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1852
        mmPrintPosition = 0
        object ppLine48: TppLine
          UserName = 'Line48'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryCompCartCust: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        '          SELECT DISTINCT CA.DESCCARTINVEST,  IV.DESCINVESTIMENT' +
        'O, CUS.SGLCUSTODIANTE,'
      
        '                         H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO,' +
        ' IV.IDEMISSOR, AC.CODTIPOACAO,'
      
        '                         MB.IDMOTIVOBLOQUEIO,  AB.SIGLAACAOBOLSA' +
        ', H1.IDLOTE,'
      
        '                         DECODE(HC.IDMOTIVOBLOQUEIO, -1, '#39#39', MB.' +
        'DESCMOTBLOQ) DESCMOTBLOQ,'
      '                         HC.IDCUSTODIANTE,'
      
        '                         (0) AS SALDOAQUI, (0) AS SALDOATU, (0) ' +
        'AS QTDTITLOTE,'
      '                         (0) AS COTACAOAUX,'
      
        '                         (0) AS SALDOQTDEINVCART, (0) AS SALDOCA' +
        'R,'
      
        '                         (0) AS COTACAO, (0) AS TOTCART, (0) AS ' +
        'TOTACAOTIPO, (0) AS TOTACAO,'
      
        '                         (0) AS TOTLIBERADO, (0) AS TOTBLOQUEADO' +
        ', (0) AS PUCUSTO, (0) AS TOTLIBBLOQ,'
      '                         (1) AS VISIVEL,'
      '                         (0) As VALMERCADO'
      
        '          FROM   HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO' +
        ' IV,'
      '                 EMISSOR EM, ACAO AC, HISTCUSTODIA HC,'
      
        '                 MOTIVOBLOQUEIO MB, ACOESXBOLSA AB, BOLSAVALORES' +
        ' BV,'
      '                 PARAMINVEST PI, CUSTODIANTE CUS'
      '          WHERE'
      '                1 = 2 AND'
      
        '                (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) ' +
        'AND'
      
        '                (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AN' +
        'D'
      '                (IV.IDINVESTIMENTO       = AC.IDACAO) AND'
      '                (IV.IDEMISSOR            = EM.IDEMISSOR) AND'
      '                (H1.IDINVESTIMENTO  IS NOT NULL)  AND'
      
        '                (HC.IDCARTEIRAINVEST(+) = H1.IDCARTEIRAINVEST) A' +
        'ND'
      '                (HC.IDINVESTIMENTO  (+) = H1.IDINVESTIMENTO) AND'
      
        '                (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)) A' +
        'ND'
      '                (CUS.IDCUSTODIANTE(+) = HC.IDCUSTODIANTE) AND'
      '                (BV.IDCUSTODIANTE(+) = CUS.IDCUSTODIANTE) AND'
      '                (AB.IDACAO = H1.IDINVESTIMENTO) AND'
      '                (AC.IDACAO = AB.IDACAO) AND'
      '                (AB.IDBOLSAVALORES = PI.IDBVSP)'
      
        '          ORDER BY CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, CUS.S' +
        'GLCUSTODIANTE, DECODE(HC.IDMOTIVOBLOQUEIO, -1, '#39#39', MB.DESCMOTBLO' +
        'Q)'
      ''
      ' ')
    UpdateObject = updCompCartCust
    ValidateWithMask = True
    Left = 525
    Top = 63
    object StringField1: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object FloatField1: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object FloatField2: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object FloatField3: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object StringField4: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object FloatField4: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object FloatField5: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object FloatField6: TFloatField
      FieldName = 'SALDOCAR'
    end
    object FloatField7: TFloatField
      FieldName = 'COTACAO'
    end
    object FloatField8: TFloatField
      FieldName = 'TOTCART'
    end
    object FloatField9: TFloatField
      FieldName = 'TOTACAOTIPO'
    end
    object FloatField10: TFloatField
      FieldName = 'TOTACAO'
    end
    object FloatField11: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object FloatField12: TFloatField
      FieldName = 'SALDOATU'
    end
    object FloatField13: TFloatField
      FieldName = 'COTACAOAUX'
    end
    object FloatField14: TFloatField
      FieldName = 'TOTLIBERADO'
    end
    object FloatField15: TFloatField
      FieldName = 'TOTBLOQUEADO'
    end
    object FloatField16: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object FloatField17: TFloatField
      FieldName = 'VISIVEL'
    end
    object StringField6: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object FloatField18: TFloatField
      FieldName = 'PUCUSTO'
    end
    object qryCompCartCustDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object qryCompCartCustIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryCompCartCustSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCompCartCustTOTLIBBLOQ: TFloatField
      FieldName = 'TOTLIBBLOQ'
    end
    object qryCompCartCustVALMERCADO: TFloatField
      FieldName = 'VALMERCADO'
    end
    object qryCompCartCustIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
  end
  object dtsCompCartCust: TwwDataSource
    DataSet = qryCompCartCust
    Left = 525
    Top = 63
  end
  object bdeCompCartCust: TppBDEPipeline
    DataSource = dtsCompCartCust
    UserName = 'bdeCompCartCust'
    Left = 525
    Top = 63
  end
  object RptCompCartCust: TppReport
    AutoStop = False
    DataPipeline = bdeCompCartCust
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Comp. da Carteira de Custódia'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptCompCartCustBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 517
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeCompCartCust'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object RptCompCartCustShape2: TppShape
        UserName = 'RptCompCartCustShape2'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9525
        mmLeft = 0
        mmTop = 24871
        mmWidth = 284692
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33867
        mmWidth = 284427
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'ppLabel85'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 195527
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'ppLabel86'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 225955
        mmTop = 29633
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250561
        mmTop = 29633
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel89'
        Caption = 'Motivo Bloqueio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 29633
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'Código Neg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 170392
        mmTop = 29633
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 233363
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'ppLabel99'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 180711
        mmTop = 25135
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 273580
        mmTop = 29633
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'ppLabel101'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 266965
        mmTop = 25929
        mmWidth = 8731
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'DESCCARTINVEST'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3704
        mmLeft = 195792
        mmTop = 14023
        mmWidth = 79904
        BandType = 0
      end
      object RptCompCartCustLabel1: TppLabel
        UserName = 'RptCompCartCustLabel1'
        Caption = 'Custodiante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 69850
        mmTop = 29633
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = 'Composição da Carteira de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel52: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa11'
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
      object ppLabel82: TppLabel
        UserName = 'LPeriodo7'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage12: TppDBImage
        UserName = 'DbLogo11'
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
    end
    object ppDetailBand12: TppDetailBand
      BeforePrint = ppDetailBand12BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object RptCompCartCustShape1: TppShape
        OnPrint = RptCompCartCustShape1Print
        UserName = 'RptCompCartCustShape1'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'ppDBText45'
        DataField = 'DESCMOTBLOQ'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText32'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 26988
        mmTop = 0
        mmWidth = 42069
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText40'
        DataField = 'TOTLIBBLOQ'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        DataField = 'COTACAO'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 212196
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'PUCUSTO'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 6879
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppLabel105: TppLabel
        OnPrint = ppLabel105Print
        UserName = 'ppLabel105'
        Caption = 'ppLabel105'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 262996
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'ppDBCalc2'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = ppGroup5
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 2646
        mmLeft = 0
        mmTop = 265
        mmWidth = 4233
        BandType = 4
      end
      object RptCompCartCustDBText1: TppDBText
        UserName = 'RptCompCartCustDBText1'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = bdeCompCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 69850
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object RptCompCartCustDBText2: TppDBText
        UserName = 'RptCompCartCustDBText2'
        DataField = 'VALMERCADO'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 238919
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText47: TppDBText
        OnPrint = ppDBText47Print
        UserName = 'ppDBText47'
        DataField = 'SALDOATU'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 2910
        mmLeft = 183092
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText46: TppDBText
        OnPrint = ppDBText47Print
        UserName = 'ppDBText46'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 183357
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText41: TppDBText
        OnPrint = ppDBText41Print
        UserName = 'ppDBText41'
        DataField = 'SALDOCAR'
        DataPipeline = bdeCompCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompCartCust'
        mmHeight = 3175
        mmLeft = 183357
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLabel106: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel106'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 1852
        mmWidth = 251355
        BandType = 8
      end
      object RptCompCartCustLine1: TppLine
        UserName = 'RptCompCartCustLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284427
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284428
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeCompCartCust
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCompCartCust'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel109: TppLabel
          UserName = 'ppLabel109'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 69850
          mmTop = 794
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object RptCompCartCustDBCalc1: TppDBCalc
          UserName = 'RptCompCartCustDBCalc1'
          BlankWhenZero = True
          DataField = 'SALDOCAR'
          DataPipeline = bdeCompCartCust
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCompCartCust'
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 794
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object RptCompCartCustDBCalc2: TppDBCalc
          UserName = 'RptCompCartCustDBCalc2'
          DataField = 'VALMERCADO'
          DataPipeline = bdeCompCartCust
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCompCartCust'
          mmHeight = 2910
          mmLeft = 238919
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object RptCompCartCustDBCalc3: TppDBCalc
          UserName = 'RptCompCartCustDBCalc3'
          BlankWhenZero = True
          DataField = 'SALDOAQUI'
          DataPipeline = bdeCompCartCust
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCompCartCust'
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 794
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object RptCompCartCustDBCalc4: TppDBCalc
          UserName = 'RptCompCartCustDBCalc4'
          BlankWhenZero = True
          DataField = 'SALDOATU'
          DataPipeline = bdeCompCartCust
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeCompCartCust'
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 794
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object RptCompCartCustLine2: TppLine
          UserName = 'RptCompCartCustLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = bdeCompCartCust
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCompCartCust'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptCompCartCustGroup1: TppGroup
      BreakName = 'SGLCUSTODIANTE'
      DataPipeline = bdeCompCartCust
      OutlineSettings.CreateNode = True
      UserName = 'RptCompCartCustGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCompCartCust'
      object RptCompCartCustGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptCompCartCustGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object updCompCartCust: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOATU = :SALDOATU,'
      '  QTDTITLOTE = :QTDTITLOTE,'
      '  COTACAOAUX = :COTACAOAUX,'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOCAR = :SALDOCAR,'
      '  COTACAO = :COTACAO,'
      '  TOTCART = :TOTCART,'
      '  TOTACAOTIPO = :TOTACAOTIPO,'
      '  TOTACAO = :TOTACAO,'
      '  TOTLIBERADO = :TOTLIBERADO,'
      '  TOTBLOQUEADO = :TOTBLOQUEADO,'
      '  VISIVEL = :VISIVEL'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  SIGLAMOTBLOQ = :OLD_SIGLAMOTBLOQ')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOAQUI, SALDOATU, QTDTITLOTE, COTACAOAUX, SALDOQTDEINVCART' +
        ', SALDOCAR, '
      
        '   COTACAO, TOTCART, TOTACAOTIPO, TOTACAO, TOTLIBERADO, TOTBLOQU' +
        'EADO, VISIVEL)'
      'values'
      
        '  (:SALDOAQUI, :SALDOATU, :QTDTITLOTE, :COTACAOAUX, :SALDOQTDEIN' +
        'VCART, '
      
        '   :SALDOCAR, :COTACAO, :TOTCART, :TOTACAOTIPO, :TOTACAO, :TOTLI' +
        'BERADO, '
      '   :TOTBLOQUEADO, :VISIVEL)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  SIGLAMOTBLOQ = :OLD_SIGLAMOTBLOQ')
    Left = 525
    Top = 63
  end
  object bdeOperBolsa: TppBDEPipeline
    DataSource = dtsOperBolsa
    UserName = 'bdeOperBolsa'
    Left = 417
    Top = 331
  end
  object dtsOperBolsa: TwwDataSource
    DataSet = qryOperBolsa
    Left = 417
    Top = 331
  end
  object qryOperBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CV.SGLCORRETVALORES, TPO.DESCTIPOOPERACAO, M.DESCMERCADO,'
      '       I.DESCINVESTIMENTO, OPI.DATAOPERACAO , OPI.QTDEOPERACAO ,'
      '       OPI.PRECOUNITOPERACAO, OPI.VLROPERACAO, OPI.DATALIQOPER ,'
      '       OPP.QTDEPENDENTE'
      
        'FROM  OPERACAOPENDENTE OPP, OPERACAOINVEST OPI,  TIPOOPERACAO TP' +
        'O,'
      '      MERCADO M, INVESTIMENTO I , CORRETVALORES CV'
      'WHERE'
      '      1 = 2 AND'
      '      OPI.IDINVESTIMENTO = I.IDINVESTIMENTO AND'
      '      OPI.IDTIPOINVEST =  TPO.IDTIPOINVEST AND'
      '      OPI.IDTIPOOPERACAO = TPO.IDTIPOOPERACAO AND'
      '      TPO.IDMERCADO = M.IDMERCADO  AND'
      '      OPI.IDCORRETVALORES = CV.IDCORRETVALORES AND'
      '      OPP.IDOPERACAOINVEST (+) = OPI.IDOPERACAOINVEST  AND'
      '      OPI.IDOPERACAOORIGEM IS NOT NULL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 417
    Top = 331
    object qryOperBolsaSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object qryOperBolsaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperBolsaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Origin = 'MERCADO.DESCMERCADO'
      Size = 60
    end
    object qryOperBolsaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryOperBolsaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object qryOperBolsaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
    end
    object qryOperBolsaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'OPERACAOINVEST.PRECOUNITOPERACAO'
    end
    object qryOperBolsaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
    end
    object qryOperBolsaDATALIQOPER: TDateTimeField
      FieldName = 'DATALIQOPER'
      Origin = 'OPERACAOINVEST.DATALIQOPER'
    end
    object qryOperBolsaQTDEPENDENTE: TFloatField
      FieldName = 'QTDEPENDENTE'
    end
  end
  object RpOperBolsa: TppReport
    AutoStop = False
    DataPipeline = bdeOperBolsa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico Operações Pendentes na Bolsa'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 417
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeOperBolsa'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 284300
        BandType = 0
      end
      object RpOperBolsaLabel2: TppLabel
        UserName = 'RpOperBolsaLabel2'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 29633
        mmWidth = 7144
        BandType = 0
      end
      object RpOperBolsaDBText2: TppDBText
        UserName = 'RpOperBolsaDBText2'
        AutoSize = True
        DataField = 'SGLCORRETVALORES'
        DataPipeline = bdeOperBolsa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 19050
        mmWidth = 35454
        BandType = 0
      end
      object RpOperBolsaLabel3: TppLabel
        UserName = 'RpOperBolsaLabel3'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 29633
        mmWidth = 13758
        BandType = 0
      end
      object RpOperBolsaLabel4: TppLabel
        UserName = 'RpOperBolsaLabel4'
        Caption = 'Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 29633
        mmWidth = 12700
        BandType = 0
      end
      object RpOperBolsaLabel5: TppLabel
        UserName = 'RpOperBolsaLabel5'
        Caption = 'Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 29633
        mmWidth = 15610
        BandType = 0
      end
      object RpOperBolsaLabel6: TppLabel
        UserName = 'RpOperBolsaLabel6'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 29633
        mmWidth = 16404
        BandType = 0
      end
      object RpOperBolsaLabel7: TppLabel
        UserName = 'RpOperBolsaLabel7'
        Caption = 'Preço Unitário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 29633
        mmWidth = 20373
        BandType = 0
      end
      object RpOperBolsaLabel8: TppLabel
        UserName = 'RpOperBolsaLabel8'
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 211667
        mmTop = 29633
        mmWidth = 26458
        BandType = 0
      end
      object RpOperBolsaLine1: TppLine
        UserName = 'RpOperBolsaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33602
        mmWidth = 284300
        BandType = 0
      end
      object ppLPeriodoOperPend: TppDBText
        UserName = 'LPeriodoOperPend'
        AutoSize = True
        DataField = 'DATAOPERACAO'
        DataPipeline = bdeOperBolsa
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 14023
        mmWidth = 26458
        BandType = 0
      end
      object RpOperBolsaLabel1: TppLabel
        UserName = 'RpOperBolsaLabel1'
        Caption = 'Qtde Pendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250032
        mmTop = 29633
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Histórico das Operações Pendentes de Bolsa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 76200
        BandType = 0
      end
      object ppLabel28: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa14'
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
      object ppLabel71: TppLabel
        UserName = 'LCarteira12'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage15: TppDBImage
        UserName = 'DbLogo14'
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
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RpOperBolsaDBText1: TppDBText
        UserName = 'RpOperBolsaDBText1'
        AutoSize = True
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeOperBolsa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 9790
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object RpOperBolsaDBText3: TppDBText
        UserName = 'RpOperBolsaDBText3'
        AutoSize = True
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = bdeOperBolsa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object RpOperBolsaDBText4: TppDBText
        UserName = 'RpOperBolsaDBText4'
        AutoSize = True
        DataField = 'DESCMERCADO'
        DataPipeline = bdeOperBolsa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object RpOperBolsaDBText5: TppDBText
        UserName = 'RpOperBolsaDBText5'
        AutoSize = True
        DataField = 'DATALIQOPER'
        DataPipeline = bdeOperBolsa
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object RpOperBolsaDBText6: TppDBText
        UserName = 'RpOperBolsaDBText6'
        AutoSize = True
        DataField = 'QTDEOPERACAO'
        DataPipeline = bdeOperBolsa
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 141552
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object RpOperBolsaDBText7: TppDBText
        UserName = 'RpOperBolsaDBText7'
        AutoSize = True
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = bdeOperBolsa
        DisplayFormat = ',##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 0
        mmWidth = 32544
        BandType = 4
      end
      object RpOperBolsaDBText8: TppDBText
        UserName = 'RpOperBolsaDBText8'
        AutoSize = True
        DataField = 'VLROPERACAO'
        DataPipeline = bdeOperBolsa
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 216694
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object RpOperBolsaDBText10: TppDBText
        UserName = 'RpOperBolsaDBText10'
        AutoSize = True
        DataField = 'QTDEPENDENTE'
        DataPipeline = bdeOperBolsa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperBolsa'
        mmHeight = 3175
        mmLeft = 246063
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
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
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
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
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
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
        mmWidth = 97631
        BandType = 8
      end
    end
    object RpOperBolsaGroup1: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = bdeOperBolsa
      OutlineSettings.CreateNode = True
      UserName = 'RpOperBolsaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperBolsa'
      object RpOperBolsaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RpOperBolsaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object RpOperBolsaLabel9: TppLabel
          UserName = 'RpOperBolsaLabel9'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 265
          mmWidth = 7144
          BandType = 5
          GroupNo = 0
        end
        object RpOperBolsaDBCalc1: TppDBCalc
          UserName = 'RpOperBolsaDBCalc1'
          AutoSize = True
          DataField = 'QTDEOPERACAO'
          DataPipeline = bdeOperBolsa
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RpOperBolsaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperBolsa'
          mmHeight = 3175
          mmLeft = 131234
          mmTop = 265
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object RpOperBolsaDBCalc2: TppDBCalc
          UserName = 'RpOperBolsaDBCalc2'
          AutoSize = True
          DataField = 'VLROPERACAO'
          DataPipeline = bdeOperBolsa
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RpOperBolsaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperBolsa'
          mmHeight = 3175
          mmLeft = 206111
          mmTop = 265
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object bdeOperRendaVar: TppBDEPipeline
    DataSource = dtsOperRendaVar
    UserName = 'bdeOperRendaVar'
    Left = 725
    Top = 458
    object bdeOperRendaVarppField1: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object bdeOperRendaVarppField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object bdeOperRendaVarppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object bdeOperRendaVarppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeOperRendaVarppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESULTADO'
      FieldName = 'RESULTADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeOperRendaVarppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeOperRendaVarppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTADOR'
      FieldName = 'CONTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeOperRendaVarppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCUSTO'
      FieldName = 'VALCUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object dtsOperRendaVar: TwwDataSource
    DataSet = qryOperRendaVar
    Left = 725
    Top = 458
  end
  object qryOperRendaVar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OI.DATAOPERACAO,'
      '        INV.DESCINVESTIMENTO,'
      '            OI.QTDEOPERACAO,'
      '       OI.VLROPERACAO,'
      
        '       DECODE(HCI.SALDOQTDEINVCART, 0, 0, (OI.VLROPERACAO - ((HC' +
        'I.SALDOAQUI * OI.QTDEOPERACAO)/ HCI.SALDOQTDEINVCART ))) AS RESU' +
        'LTADO,'
      
        '       ((HCI.SALDOAQUI * OI.QTDEOPERACAO)/ HCI.SALDOQTDEINVCART ' +
        ') As VALCUSTO,       '
      '       NVL(OI.VLRIR, 0) VLRIR,'
      '       (1) CONTADOR'
      'FROM'
      '   INVESTIMENTO INV,'
      '   OPERACAOINVEST OI,'
      '   HISTCARTINV HCI,'
      '   CARTEIRAINVEST CI'
      'WHERE'
      '  OI.IDINVESTIMENTO = INV.IDINVESTIMENTO  AND'
      '  OI.IDINVESTIMENTO = HCI.IDINVESTIMENTO AND'
      '  OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST  AND'
      '  OI.IDCARTEIRAINVEST = HCI.IDCARTEIRAINVEST  AND'
      '  OI.QTDEOPERACAO <> 0 AND'
      '  INV.IDTIPOINVEST = 2  AND'
      '  HCI.TIPMOVCARTINV = '#39'OPE'#39' AND'
      '  OI.DATAOPERACAO >= :DATAINICIAL AND'
      '  OI.DATAOPERACAO <= :DATAFINAL AND'
      '  HCI.IDCARTEIRAINVEST = :P_IDCARTEIRAINVEST'
      'ORDER BY OI.DATAOPERACAO DESC')
    ValidateWithMask = True
    Left = 725
    Top = 458
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINICIAL'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFINAL'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'P_IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
    object qryOperRendaVarDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryOperRendaVarDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOperRendaVarQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryOperRendaVarVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryOperRendaVarRESULTADO: TFloatField
      FieldName = 'RESULTADO'
    end
    object qryOperRendaVarVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryOperRendaVarCONTADOR: TFloatField
      FieldName = 'CONTADOR'
    end
    object qryOperRendaVarVALCUSTO: TFloatField
      FieldName = 'VALCUSTO'
    end
  end
  object RptOperRendaVar: TppReport
    AutoStop = False
    DataPipeline = bdeOperRendaVar
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Operações de Renda Variável'
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
    Left = 725
    Top = 400
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeOperRendaVar'
    object ppHeaderBand10: TppHeaderBand
      BeforePrint = ppHeaderBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object RptOperRendaVarLabel8: TppLabel
        UserName = 'RptOperRendaVarLabel8'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptOperRendaVarLabel10: TppLabel
        UserName = 'RptOperRendaVarLabel10'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object RptOperRendaVarLabel16: TppLabel
        UserName = 'RptOperRendaVarLabel16'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42863
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object RptOperRendaVarShape1: TppShape
        UserName = 'RptOperRendaVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 6350
        mmLeft = 0
        mmTop = 26458
        mmWidth = 197644
        BandType = 0
      end
      object RptOperRendaVarLine1: TppLine
        UserName = 'RptOperRendaVarLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197300
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197300
        BandType = 0
      end
      object RptOperRendaVarLabel1: TppLabel
        UserName = 'RptOperRendaVarLabel1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 27517
        mmWidth = 5556
        BandType = 0
      end
      object RptOperRendaVarLabel2: TppLabel
        UserName = 'RptOperRendaVarLabel2'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 27517
        mmWidth = 6085
        BandType = 0
      end
      object RptOperRendaVarLabel3: TppLabel
        UserName = 'RptOperRendaVarLabel3'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 27517
        mmWidth = 14552
        BandType = 0
      end
      object RptOperRendaVarLabel4: TppLabel
        UserName = 'RptOperRendaVarLabel4'
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 27517
        mmWidth = 24342
        BandType = 0
      end
      object RptOperRendaVarLabel5: TppLabel
        UserName = 'RptOperRendaVarLabel5'
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 27517
        mmWidth = 12700
        BandType = 0
      end
      object RptOperRendaVarLabel6: TppLabel
        UserName = 'RptOperRendaVarLabel6'
        Caption = 'Valor do IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 180711
        mmTop = 27517
        mmWidth = 13494
        BandType = 0
      end
      object RptOperRendaVarLabel15: TppLabel
        UserName = 'RptOperRendaVarLabel15'
        Caption = 'Valor de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 27517
        mmWidth = 19050
        BandType = 0
      end
      object RptOperRendaVarLabel9: TppLabel
        UserName = 'RptOperRendaVarLabel9'
        Caption = 'RptOperRendaVarLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel234: TppLabel
        UserName = 'Label234'
        Caption = 'Demonstrativo de Operações de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 80698
        BandType = 0
      end
      object ppLabel254: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa7'
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
      object RptOperRendaVarLabel11: TppLabel
        UserName = 'LCarteira6'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage8: TppDBImage
        UserName = 'DbLogo7'
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
      object RptOperRendaVarLabelParam: TppLabel
        UserName = 'RptOperRendaVarLabelParam'
        Caption = 'RptOperRendaVarLabelParam'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 19050
        mmWidth = 50800
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object RptOperRendaVarDBText1: TppDBText
        UserName = 'RptOperRendaVarDBText1'
        DataField = 'DATAOPERACAO'
        DataPipeline = bdeOperRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptOperRendaVarDBText3: TppDBText
        UserName = 'RptOperRendaVarDBText3'
        AutoSize = True
        DataField = 'QTDEOPERACAO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 52652
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object RptOperRendaVarDBText4: TppDBText
        UserName = 'RptOperRendaVarDBText4'
        AutoSize = True
        DataField = 'VLROPERACAO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 90488
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object RptOperRendaVarDBText5: TppDBText
        UserName = 'RptOperRendaVarDBText5'
        AutoSize = True
        DataField = 'RESULTADO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 155311
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptOperRendaVarDBText6: TppDBText
        UserName = 'RptOperRendaVarDBText6'
        AutoSize = True
        DataField = 'VLRIR'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 186532
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object RptOperRendaVarDBCalc8: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc8'
        DataPipeline = bdeOperRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = RptOperRendaVarGroup2
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3704
        mmLeft = 169334
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptOperRendaVarDBCalc7: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc7'
        DataPipeline = bdeOperRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = RptOperRendaVarGroup1
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptOperRendaVarDBText7: TppDBText
        UserName = 'RptOperRendaVarDBText7'
        AutoSize = True
        DataField = 'VALCUSTO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 127000
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object RptOperRendaVarDBText2: TppDBText
        UserName = 'RptOperRendaVarDBText2'
        AutoSize = True
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeOperRendaVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object LBTESTE: TppLabel
        UserName = 'LBTESTE'
        Caption = 'LBTESTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel58: TppLabel
        UserName = 'ppLabel58'
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
        mmTop = 1852
        mmWidth = 76729
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptOperRendaVarSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptOperRendaVarLabel14: TppLabel
        UserName = 'RptOperRendaVarLabel14'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 0
        mmWidth = 15610
        BandType = 7
      end
      object RptOperRendaVarDBCalc11: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc11'
        AutoSize = True
        DataField = 'QTDEOPERACAO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 0
        mmWidth = 34131
        BandType = 7
      end
      object RptOperRendaVarDBCalc12: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc12'
        AutoSize = True
        DataField = 'VLROPERACAO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 79375
        mmTop = 0
        mmWidth = 32015
        BandType = 7
      end
      object RptOperRendaVarDBCalc13: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc13'
        AutoSize = True
        DataField = 'RESULTADO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 0
        mmWidth = 27781
        BandType = 7
      end
      object RptOperRendaVarDBCalc14: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc14'
        AutoSize = True
        DataField = 'VLRIR'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 176213
        mmTop = 0
        mmWidth = 18785
        BandType = 7
      end
      object RptOperRendaVarDBCalc17: TppDBCalc
        UserName = 'RptOperRendaVarDBCalc17'
        AutoSize = True
        DataField = 'VALCUSTO'
        DataPipeline = bdeOperRendaVar
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperRendaVar'
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 0
        mmWidth = 25665
        BandType = 7
      end
    end
    object RptOperRendaVarGroup1: TppGroup
      BreakName = 'DATAOPERACAO'
      DataPipeline = bdeOperRendaVar
      OutlineSettings.CreateNode = True
      UserName = 'RptOperRendaVarGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperRendaVar'
      object RptOperRendaVarGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptOperRendaVarGroupFooterBand1: TppGroupFooterBand
        BeforePrint = RptOperRendaVarGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object RptOperRendaVarDBCalc4: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc4'
          AutoSize = True
          DataField = 'VLROPERACAO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 79904
          mmTop = 265
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarDBCalc5: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc5'
          AutoSize = True
          DataField = 'RESULTADO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 144992
          mmTop = 265
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarDBCalc6: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc6'
          AutoSize = True
          DataField = 'VLRIR'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 265
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarLabel13: TppLabel
          OnPrint = RptOperRendaVarLabel13Print
          UserName = 'RptOperRendaVarLabel13'
          Caption = 'Total da Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 265
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarDBCalc10: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc10'
          AutoSize = True
          DataField = 'QTDEOPERACAO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 42333
          mmTop = 265
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarDBCalc16: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc16'
          AutoSize = True
          DataField = 'VALCUSTO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 116417
          mmTop = 265
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object RptOperRendaVarLabelDescInvest: TppLabel
          UserName = 'RptOperRendaVarLabelDescInvest'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 25400
          mmTop = 265
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptOperRendaVarGroup2: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = bdeOperRendaVar
      OutlineSettings.CreateNode = True
      UserName = 'RptOperRendaVarGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperRendaVar'
      object RptOperRendaVarGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptOperRendaVarGroupFooterBand2: TppGroupFooterBand
        BeforePrint = RptOperRendaVarGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptOperRendaVarDBCalc1: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc1'
          AutoSize = True
          DataField = 'VLROPERACAO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 79904
          mmTop = 0
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object RptOperRendaVarDBCalc2: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc2'
          AutoSize = True
          DataField = 'RESULTADO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 144727
          mmTop = 0
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
        object RptOperRendaVarDBCalc3: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc3'
          AutoSize = True
          DataField = 'VLRIR'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 175948
          mmTop = 0
          mmWidth = 18785
          BandType = 5
          GroupNo = 1
        end
        object RptOperRendaVarLabel12: TppLabel
          UserName = 'RptOperRendaVarLabel12'
          Caption = 'Total da Ação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 0
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object RptOperRendaVarDBCalc9: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc9'
          AutoSize = True
          DataField = 'QTDEOPERACAO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 42333
          mmTop = 0
          mmWidth = 34131
          BandType = 5
          GroupNo = 1
        end
        object RptOperRendaVarDBCalc15: TppDBCalc
          UserName = 'RptOperRendaVarDBCalc15'
          AutoSize = True
          DataField = 'VALCUSTO'
          DataPipeline = bdeOperRendaVar
          DisplayFormat = ',##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptOperRendaVarGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeOperRendaVar'
          mmHeight = 3175
          mmLeft = 116417
          mmTop = 0
          mmWidth = 25665
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object RpConsMovBMF: TppReport
    AutoStop = False
    DataPipeline = ppBDEConsMovBMF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Operações do Mercado Futuro'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 633
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEConsMovBMF'
    object ppHeaderBand21: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284300
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 97102
        mmTop = 25135
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Valor Operado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 25135
        mmWidth = 20373
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label125'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 25400
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'ppLabel1101'
        Caption = 'Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 25135
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label129'
        Caption = 'Vencto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 215107
        mmTop = 25135
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel162: TppLabel
        UserName = 'Label130'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 18711
        mmTop = 25400
        mmWidth = 13039
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 128059
        mmTop = 25135
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel230: TppLabel
        UserName = 'Label230'
        Caption = 'Operações do Mercado Futuro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 51594
        BandType = 0
      end
      object ppLabel231: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa5'
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
      object ppLCarteiraOperMerFut: TppLabel
        UserName = 'LCarteira4'
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
        mmLeft = 183357
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel248: TppLabel
        UserName = 'LPeriodo5'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DbLogo5'
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
      object ppPeriodoConsMovBMF: TppLabel
        UserName = 'PeriodoConsMovBMF'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel211: TppLabel
        UserName = 'Label1301'
        Caption = 'Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 230453
        mmTop = 25400
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'ppDBText44'
        DataField = 'VLROPERADO'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 529
        mmWidth = 43656
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'ppDBText50'
        DataField = 'QTDEOPERADA'
        DataPipeline = ppBDEConsMovBMF
        DisplayFormat = '###,###,###,###0.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLROPERADO'
        DataPipeline = ppBDEConsMovBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 529
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'ppDBText53'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'DATAVENCOPER'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 212461
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 529
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 230453
        mmTop = 529
        mmWidth = 52123
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBDEConsMovBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsMovBMF'
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 529
        mmWidth = 60590
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLine63: TppLine
        UserName = 'Line52'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
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
      object ppLabel164: TppLabel
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
      object ppSystemVariable4: TppSystemVariable
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
      object ppLabel165: TppLabel
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
      object ppSystemVariable8: TppSystemVariable
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
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLine64: TppLine
        UserName = 'ppLine45'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 7
      end
      object pplblTotalCorretora: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Total Corretora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 8467
        mmWidth = 27517
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'Line54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 6615
        mmWidth = 284300
        BandType = 7
      end
      object pplblTotalOperado: TppLabel
        UserName = 'Label132'
        Caption = 'Total Operado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 2117
        mmWidth = 26194
        BandType = 7
      end
      object ppLine66: TppLine
        UserName = 'Line55'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 12964
        mmWidth = 284300
        BandType = 7
      end
      object ppTotalOperado: TppLabel
        UserName = 'Label134'
        Caption = 'Total Operado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 2117
        mmWidth = 23813
        BandType = 7
      end
      object ppTotalCorretora: TppLabel
        UserName = 'TotalCorretora'
        Caption = 'Total Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 8467
        mmWidth = 25400
        BandType = 7
      end
      object ppOperadoCV: TppLabel
        UserName = 'OperadoCV'
        Caption = 'C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34660
        mmTop = 2117
        mmWidth = 2646
        BandType = 7
      end
      object ppCorretoraCV: TppLabel
        UserName = 'TotalCorretora1'
        Caption = 'C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34660
        mmTop = 8467
        mmWidth = 2646
        BandType = 7
      end
    end
  end
  object ppBDEConsMovBMF: TppBDEPipeline
    DataSource = frmConsMovBMF.dsBuscaOperacoes
    UserName = 'BDEConsMovBMF'
    Left = 641
    Top = 331
    object ppBDEConsMovBMFppField1: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField2: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField3: TppField
      FieldAlias = 'QTDEOPERADA'
      FieldName = 'QTDEOPERADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField4: TppField
      FieldAlias = 'VLROPERADO'
      FieldName = 'VLROPERADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField5: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField6: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEConsMovBMFppField7: TppField
      FieldAlias = 'SGLCORRETVALORES'
      FieldName = 'SGLCORRETVALORES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object RpConsAjstBMF: TppReport
    AutoStop = False
    DataPipeline = ppPeriodoConsAjstBMF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ajustes de Mercado Futuro'
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
    Left = 525
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPeriodoConsAjstBMF'
    object ppHeaderBand22: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape8: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 24077
        mmWidth = 197380
        BandType = 0
      end
      object ppLine67: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel161: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 33338
        mmTop = 24871
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel163: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Valor Operado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 63236
        mmTop = 24872
        mmWidth = 20373
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28575
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel168: TppLabel
        UserName = 'Label125'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 24892
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label130'
        Caption = 'Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 175155
        mmTop = 24872
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel227: TppLabel
        UserName = 'ppLabel1102'
        Caption = 'I.R.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 97631
        mmTop = 24872
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel228: TppLabel
        UserName = 'ppLabel1103'
        Caption = 'CPMF Prov.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 118798
        mmTop = 24872
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel229: TppLabel
        UserName = 'Label229'
        Caption = 'CPMF Apurado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143510
        mmTop = 24871
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel170: TppLabel
        UserName = 'Label1701'
        Caption = 'Ajustes do Mercado Futuro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel256: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa9'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraAjuMerFut: TppLabel
        UserName = 'LCarteira8'
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
      object ppPeriodoAjusteBMF: TppLabel
        UserName = 'LPeriodo6'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DbLogo9'
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
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 197358
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'ppDBText44'
        DataField = 'TIPOOPERACAO'
        DataPipeline = ppPeriodoConsAjstBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 529
        mmWidth = 40481
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLRAJUSTE'
        DataPipeline = ppPeriodoConsAjstBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 60590
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'ppDBText53'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = ppPeriodoConsAjstBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText2'
        DataField = 'CORRETORA'
        DataPipeline = ppPeriodoConsAjstBMF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 528
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText95: TppDBText
        UserName = 'DBText95'
        DataField = 'VLRIR'
        DataPipeline = ppPeriodoConsAjstBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 87313
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'DBText96'
        DataField = 'VLRCPMFPROV'
        DataPipeline = ppPeriodoConsAjstBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'VLRCPMFAPU'
        DataPipeline = ppPeriodoConsAjstBMF
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPeriodoConsAjstBMF'
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine69: TppLine
        UserName = 'Line52'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
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
      object ppLine72: TppLine
        UserName = 'Line72'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel166: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label166'
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
      object ppSystemVariable6: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable6'
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
      object ppLabel169: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label169'
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
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
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
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLine70: TppLine
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
      object ppLabel174: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Total Ajustes (+) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 2117
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel175: TppLabel
        UserName = 'Label132'
        Caption = 'Total Ajustes (-) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 65352
        mmTop = 2117
        mmWidth = 28575
        BandType = 7
      end
      object rTotalAjustesNeg: TppLabel
        UserName = 'Label134'
        Caption = 'Total Ajustes (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 2117
        mmWidth = 26458
        BandType = 7
      end
      object rTotalAjustesPos: TppLabel
        UserName = 'TotalCorretora'
        Caption = 'Total Ajustes (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34925
        mmTop = 2117
        mmWidth = 27517
        BandType = 7
      end
      object ppLabel167: TppLabel
        UserName = 'Label167'
        Caption = 'Total Ajustes :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 124460
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object rTotalAjustes: TppLabel
        UserName = 'rTotalAjustes'
        Caption = 'Total Ajustes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 149860
        mmTop = 2117
        mmWidth = 21960
        BandType = 7
      end
      object ppLine71: TppLine
        UserName = 'Line71'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 6614
        mmWidth = 197300
        BandType = 7
      end
    end
  end
  object ppPeriodoConsAjstBMF: TppBDEPipeline
    DataSource = frmConsMovBMF.dsBuscaAjustes
    UserName = 'BDEConsMovBMF1'
    Left = 525
    Top = 331
    object ppPeriodoConsAjstBMFppField1: TppField
      FieldAlias = 'DATAMOVCARTINV'
      FieldName = 'DATAMOVCARTINV'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppPeriodoConsAjstBMFppField2: TppField
      FieldAlias = 'TIPOOPERACAO'
      FieldName = 'TIPOOPERACAO'
      FieldLength = 15
      DisplayWidth = 20
      Position = 1
    end
    object ppPeriodoConsAjstBMFppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAJUSTE'
      FieldName = 'VLRAJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object ppPeriodoConsAjstBMFppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 3
    end
    object ppPeriodoConsAjstBMFppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCPMFPROV'
      FieldName = 'VLRCPMFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppPeriodoConsAjstBMFppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCPMFAPU'
      FieldName = 'VLRCPMFAPU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 5
    end
    object ppPeriodoConsAjstBMFppField7: TppField
      FieldAlias = 'CORRETORA'
      FieldName = 'CORRETORA'
      FieldLength = 10
      DisplayWidth = 14
      Position = 6
    end
    object ppPeriodoConsAjstBMFppField8: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object updOperDireito: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  DATAREFERENCIA = :DATAREFERENCIA,'
      '  QTDE = :QTDE,'
      '  QTDEDIREITO = :QTDEDIREITO,'
      '  VALOREXERCIDO = :VALOREXERCIDO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      '  (DATAREFERENCIA, QTDE, QTDEDIREITO, VALOREXERCIDO)'
      'values'
      '  (:DATAREFERENCIA, :QTDE, :QTDEDIREITO, :VALOREXERCIDO)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 322
    Top = 458
  end
  object qryOperDireito: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   EM.SIGLAEMISSOR,'
      '   OP.DATAAGE,'
      '   TOP.DESCTIPOOPERACAO,'
      '   OP.STATUS,'
      '   OP.OBSERVACAO,'
      '   INV.DESCINVESTIMENTO,'
      '   CA. DESCCARTINVEST,'
      '   C.SGLCUSTODIANTE,'
      '   MB.SIGLAMOTBLOQ,'
      '   HC.IDLOTE,'
      '   SYSDATE  AS DATAREFERENCIA,'
      '   0 AS QTDE,'
      '   0 AS QTDEDIREITO,'
      '   0 AS VALOREXERCIDO,'
      '   HC.IDCARTEIRAINVEST,'
      '   HC.IDINVESTIMENTO,'
      '   HC.IDCUSTODIANTE,'
      '   HC.IDMOTIVOBLOQUEIO,'
      '   OP.IDTIPOOPERACAO,'
      '   OP.IDEMISSOR,'
      '   OP.IDOPERACAODIREITO,'
      '   AXB.QTDELOTE,'
      '   OP.DATAEX,'
      '   OPIV.NUMDOCUMENTO,'
      '   OP.DIVPORACAO PU,'
      '   OP.DATACOM'
      'FROM'
      
        '   HISTCUSTODIA HC, OPERACAOINVEST OPIV, INVESTIMENTO  INV, OPER' +
        'ACAODIREITO OP,'
      
        '   OPERDIREITOXINV OPINV, EMISSOR EM, ACOESXBOLSA AXB, CUSTODIAN' +
        'TE C, '
      
        '   TIPOOPERACAO TOP, CARTEIRAINVEST CA, MOTIVOBLOQUEIO MB, PARAM' +
        'INVEST PAR'
      'WHERE'
      '   1 = 2 AND'
      '   HC.IDINVESTIMENTO       = OPINV.IDINVESTIMENTO   AND'
      '   HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST    AND'
      '   HC.IDINVESTIMENTO       = INV.IDINVESTIMENTO     AND'
      '   HC.IDCUSTODIANTE        = C.IDCUSTODIANTE(+)     AND'
      '   HC.IDMOTIVOBLOQUEIO     = MB.IDMOTIVOBLOQUEIO(+) AND'
      '   OPINV.ORIGDEST          = '#39'O'#39' '#9#9#9'    AND'
      '   OPINV.IDOPERACAODIREITO = OP.IDOPERACAODIREITO   AND'
      '   OP.IDEMISSOR            = EM.IDEMISSOR           AND'
      '   OP.IDTIPOOPERACAO       = TOP.IDTIPOOPERACAO     AND'
      '   OP.IDOPERACAODIREITO    = OPIV.IDOPERACAODIREITO(+) AND'
      '   AXB.IDACAO '#9#9'   = HC.IDINVESTIMENTO      AND'
      '   AXB.IDBOLSAVALORES '#9'   = PAR.IDBVSP'
      'ORDER BY DATACOM '
      ' ')
    UpdateObject = updOperDireito
    ValidateWithMask = True
    Left = 322
    Top = 458
    object qryOperDireitoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object qryOperDireitoDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object qryOperDireitoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperDireitoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryOperDireitoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryOperDireitoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOperDireitoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryOperDireitoSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryOperDireitoSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryOperDireitoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryOperDireitoDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryOperDireitoQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryOperDireitoQTDEDIREITO: TFloatField
      FieldName = 'QTDEDIREITO'
    end
    object qryOperDireitoVALOREXERCIDO: TFloatField
      FieldName = 'VALOREXERCIDO'
    end
    object qryOperDireitoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryOperDireitoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryOperDireitoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryOperDireitoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryOperDireitoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryOperDireitoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryOperDireitoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryOperDireitoDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object qryOperDireitoPU: TFloatField
      FieldName = 'PU'
    end
    object qryOperDireitoDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryOperDireitoQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
    end
    object qryOperDireitoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
  end
  object dtsOperDireito: TwwDataSource
    DataSet = qryOperDireito
    Left = 322
    Top = 458
  end
  object bdeOperDireito: TppBDEPipeline
    DataSource = dtsOperDireito
    UserName = 'bdeOperDireito'
    Left = 322
    Top = 458
  end
  object RptOperDireito: TppReport
    AutoStop = False
    DataPipeline = bdeOperDireito
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Operações de Direito'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 322
    Top = 400
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeOperDireito'
    object ppHeaderBand11: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Operações de Direito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel261: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa16'
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
      object ppLCarteiraOperDir: TppLabel
        UserName = 'LCarteira14'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 263526
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodoOperDir: TppLabel
        UserName = 'LPeriodo10'
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
      object ppDBImage17: TppDBImage
        UserName = 'DbLogo16'
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
      object ppShape30: TppShape
        UserName = 'Shape30'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 22225
        mmWidth = 284428
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 284300
        BandType = 0
      end
      object RptOperDireitoLabel1: TppLabel
        UserName = 'RptOperDireitoLabel1'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 2910
        mmTop = 22754
        mmWidth = 8467
        BandType = 0
      end
      object RptOperDireitoLabel2: TppLabel
        UserName = 'RptOperDireitoLabel2'
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 34660
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object RptOperDireitoLabel3: TppLabel
        UserName = 'RptOperDireitoLabel3'
        Caption = 'Tipo Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 67733
        mmTop = 22754
        mmWidth = 14817
        BandType = 0
      end
      object RptOperDireitoLabel4: TppLabel
        UserName = 'RptOperDireitoLabel4'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 110596
        mmTop = 22754
        mmWidth = 7938
        BandType = 0
      end
      object RptOperDireitoLabel8: TppLabel
        UserName = 'RptOperDireitoLabel8'
        Caption = 'Custodiante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 174890
        mmTop = 22754
        mmWidth = 12171
        BandType = 0
      end
      object RptOperDireitoLine1: TppLine
        UserName = 'RptOperDireitoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25665
        mmWidth = 284300
        BandType = 0
      end
      object RptOperDireitoLabel11: TppLabel
        UserName = 'RptOperDireitoLabel11'
        Caption = 'Motivo bloqueio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 199232
        mmTop = 22754
        mmWidth = 16404
        BandType = 0
      end
      object RptOperDireitoLabel9: TppLabel
        UserName = 'RptOperDireitoLabel9'
        Caption = 'Data Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 48948
        mmTop = 22754
        mmWidth = 13494
        BandType = 0
      end
      object RptOperDireitoLabel5: TppLabel
        UserName = 'RptOperDireitoLabel5'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 221192
        mmTop = 22754
        mmWidth = 11377
        BandType = 0
      end
      object RptOperDireitoLabel6: TppLabel
        UserName = 'RptOperDireitoLabel6'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 244740
        mmTop = 22754
        mmWidth = 2910
        BandType = 0
      end
      object RptOperDireitoLabel10: TppLabel
        UserName = 'RptOperDireitoLabel10'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 270405
        mmTop = 22754
        mmWidth = 5292
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptOperDireitoDBText2: TppDBText
        UserName = 'RptOperDireitoDBText2'
        DataField = 'DATAEX'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2646
        mmLeft = 34660
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object RptOperDireitoDBText3: TppDBText
        UserName = 'RptOperDireitoDBText3'
        AutoSize = True
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2646
        mmLeft = 67733
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object RptOperDireitoDBText4: TppDBText
        UserName = 'RptOperDireitoDBText4'
        AutoSize = True
        DataField = 'DESCCARTINVEST'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 110596
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object RptOperDireitoDBText7: TppDBText
        UserName = 'RptOperDireitoDBText7'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 2910
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object RptOperDireitoDBText8: TppDBText
        UserName = 'RptOperDireitoDBText8'
        AutoSize = True
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 174890
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object RptOperDireitoDBText10: TppDBText
        UserName = 'RptOperDireitoDBText10'
        AutoSize = True
        DataField = 'VALOREXERCIDO'
        DataPipeline = bdeOperDireito
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 257440
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object RptOperDireitoDBText11: TppDBText
        UserName = 'RptOperDireitoDBText11'
        AutoSize = True
        DataField = 'SIGLAMOTBLOQ'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 199232
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object RptOperDireitoDBText5: TppDBText
        UserName = 'RptOperDireitoDBText5'
        AutoSize = True
        DataField = 'QTDE'
        DataPipeline = bdeOperDireito
        DisplayFormat = ',##0.###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 226748
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
      object RptOperDireitoDBText9: TppDBText
        UserName = 'RptOperDireitoDBText9'
        DataField = 'DATACOM'
        DataPipeline = bdeOperDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2646
        mmLeft = 48948
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object RptOperDireitoDBText1: TppDBText
        UserName = 'RptOperDireitoDBText1'
        AutoSize = True
        DataField = 'PU'
        DataPipeline = bdeOperDireito
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeOperDireito'
        mmHeight = 2381
        mmLeft = 243946
        mmTop = 529
        mmWidth = 2910
        BandType = 4
      end
      object ppLine94: TppLine
        UserName = 'Line94'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel62: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel62'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 93134
        mmTop = 3175
        mmWidth = 12700
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 179652
        mmTop = 3175
        mmWidth = 17992
        BandType = 8
      end
    end
    object RptOperDireitoGroup1: TppGroup
      BreakName = 'SIGLAEMISSOR'
      DataPipeline = bdeOperDireito
      OutlineSettings.CreateNode = True
      UserName = 'RptOperDireitoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperDireito'
      object RptOperDireitoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptOperDireitoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptOperDireitoGroup2: TppGroup
      BreakName = 'DATAAGE'
      DataPipeline = bdeOperDireito
      OutlineSettings.CreateNode = True
      UserName = 'RptOperDireitoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperDireito'
      object RptOperDireitoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptOperDireitoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptOperDireitoGroup3: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = bdeOperDireito
      OutlineSettings.CreateNode = True
      UserName = 'RptOperDireitoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOperDireito'
      object RptOperDireitoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptOperDireitoGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object RpAnuncioSubscricao: TppReport
    AutoStop = False
    DataPipeline = ppBDEAnuncioSubscricao
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anuncio de Subscrição'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 525
    Top = 400
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEAnuncioSubscricao'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 262996
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape1'
        mmHeight = 13229
        mmLeft = 0
        mmTop = 18256
        mmWidth = 197300
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape7'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 12700
        mmLeft = 265
        mmTop = 18521
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel172: TppLabel
        UserName = 'Label153'
        Caption = 'ANÚNCIO DE SUBSCRIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 73025
        mmTop = 22754
        mmWidth = 51065
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape2'
        mmHeight = 13229
        mmLeft = 265
        mmTop = 35454
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel173: TppLabel
        UserName = 'Label160'
        Caption = 'Empresa/Tipo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 5027
        mmTop = 39952
        mmWidth = 28310
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape3'
        mmHeight = 23283
        mmLeft = 51065
        mmTop = 110067
        mmWidth = 101336
        BandType = 0
      end
      object ppLine73: TppLine
        UserName = 'Line62'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 51065
        mmTop = 118534
        mmWidth = 101071
        BandType = 0
      end
      object ppLine74: TppLine
        UserName = 'Line63'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 51065
        mmTop = 125677
        mmWidth = 101071
        BandType = 0
      end
      object ppLine75: TppLine
        UserName = 'Line64'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 14552
        mmLeft = 87313
        mmTop = 118798
        mmWidth = 794
        BandType = 0
      end
      object ppLine76: TppLine
        UserName = 'Line65'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 14552
        mmLeft = 114300
        mmTop = 118534
        mmWidth = 794
        BandType = 0
      end
      object ppLabel176: TppLabel
        UserName = 'Label163'
        Caption = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 120386
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel177: TppLabel
        UserName = 'Label164'
        Caption = 'Qtd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 120386
        mmWidth = 6085
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape10'
        mmHeight = 23283
        mmLeft = 51065
        mmTop = 143669
        mmWidth = 101336
        BandType = 0
      end
      object ppLine77: TppLine
        UserName = 'Line66'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 51065
        mmTop = 152136
        mmWidth = 101071
        BandType = 0
      end
      object ppLine78: TppLine
        UserName = 'Line67'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 51065
        mmTop = 159279
        mmWidth = 101071
        BandType = 0
      end
      object ppLine79: TppLine
        UserName = 'Line68'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 14552
        mmLeft = 87313
        mmTop = 152400
        mmWidth = 794
        BandType = 0
      end
      object ppLine80: TppLine
        UserName = 'Line69'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 14552
        mmLeft = 114300
        mmTop = 152136
        mmWidth = 794
        BandType = 0
      end
      object ppLabel178: TppLabel
        UserName = 'Label166'
        Caption = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 153988
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel179: TppLabel
        UserName = 'Label167'
        Caption = 'Qtd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 153988
        mmWidth = 6085
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape11'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 8202
        mmLeft = 51329
        mmTop = 110331
        mmWidth = 100806
        BandType = 0
      end
      object ppLabel180: TppLabel
        UserName = 'Label162'
        Caption = 'Quantidade Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 112713
        mmWidth = 24606
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape12'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 8202
        mmLeft = 51329
        mmTop = 143934
        mmWidth = 100806
        BandType = 0
      end
      object ppLabel181: TppLabel
        UserName = 'Label165'
        Caption = 'Quantidade a Subscrever'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 146315
        mmWidth = 36248
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape4'
        mmHeight = 19844
        mmLeft = 0
        mmTop = 176742
        mmWidth = 197115
        BandType = 0
      end
      object ppLine81: TppLine
        UserName = 'Line70'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 265
        mmTop = 182827
        mmWidth = 196850
        BandType = 0
      end
      object ppLine82: TppLine
        UserName = 'Line701'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 265
        mmTop = 189442
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel182: TppLabel
        UserName = 'Label169'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 190765
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel183: TppLabel
        UserName = 'Label170'
        Caption = 'Data do débito :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 191030
        mmWidth = 24342
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape5'
        mmHeight = 38365
        mmLeft = 0
        mmTop = 203730
        mmWidth = 197115
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape15'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 6615
        mmLeft = 265
        mmTop = 204259
        mmWidth = 196586
        BandType = 0
      end
      object ppLine83: TppLine
        UserName = 'Line72'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 210609
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel184: TppLabel
        UserName = 'Label171'
        Caption = 'Parecer da Diretória'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 205846
        mmWidth = 30692
        BandType = 0
      end
      object ppLine84: TppLine
        UserName = 'Line73'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 30956
        mmLeft = 147109
        mmTop = 210873
        mmWidth = 1323
        BandType = 0
      end
      object ppLine85: TppLine
        UserName = 'Line74'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 226219
        mmWidth = 196850
        BandType = 0
      end
      object ppLine86: TppLine
        UserName = 'Line75'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 265
        mmTop = 233892
        mmWidth = 196850
        BandType = 0
      end
      object ppLine87: TppLine
        UserName = 'Line76'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 147373
        mmTop = 218811
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel185: TppLabel
        UserName = 'Label172'
        Caption = 'Prazo Operacional até :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 213255
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel186: TppLabel
        UserName = 'Label173'
        Caption = 'Subscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 221457
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel187: TppLabel
        UserName = 'Label174'
        Caption = 'Sobras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 228336
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel188: TppLabel
        UserName = 'Label175'
        Caption = 'Negoc. Direitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 236538
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel189: TppLabel
        UserName = 'Label176'
        Caption = 'Sim  (   )     Não   (   )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62971
        mmTop = 221457
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel190: TppLabel
        UserName = 'Label177'
        Caption = 'Sim  (   )     Não   (   )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62971
        mmTop = 228336
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel191: TppLabel
        UserName = 'Label178'
        Caption = 'Sim  (   )     Não   (   )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62971
        mmTop = 236538
        mmWidth = 30692
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape16'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 529
        mmTop = 177007
        mmWidth = 196586
        BandType = 0
      end
      object ppLabel192: TppLabel
        UserName = 'Label168'
        Caption = 'Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 177800
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel193: TppLabel
        UserName = 'Label179'
        Caption = 'Ass. do Diretor :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 253471
        mmWidth = 25135
        BandType = 0
      end
      object ppLine88: TppLine
        UserName = 'Line77'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 30692
        mmTop = 257176
        mmWidth = 116152
        BandType = 0
      end
      object ppLabel194: TppLabel
        UserName = 'Label180'
        Caption = 'Em :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148432
        mmTop = 253471
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel195: TppLabel
        UserName = 'Label181'
        Caption = '___/___/______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 228336
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel196: TppLabel
        UserName = 'Label182'
        Caption = '___/___/______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 236538
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel197: TppLabel
        UserName = 'Label183'
        Caption = '___/___/______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 221457
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel198: TppLabel
        UserName = 'Label184'
        Caption = '___/___/______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 163513
        mmTop = 191030
        mmWidth = 23283
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape6'
        mmHeight = 41010
        mmLeft = 265
        mmTop = 57415
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel199: TppLabel
        UserName = 'Label154'
        Caption = 'Data da Subscrição :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 60061
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText80: TppDBText
        UserName = 'DBText72'
        DataField = 'DATAAGE'
        DataPipeline = ppBDEAnuncioSubscricao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAnuncioSubscricao'
        mmHeight = 3704
        mmLeft = 45244
        mmTop = 60325
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel200: TppLabel
        UserName = 'Label155'
        Caption = 'PU/LM - R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 69321
        mmWidth = 16669
        BandType = 0
      end
      object ppDBText83: TppDBText
        UserName = 'DBText74'
        DataField = 'DIVPORACAO'
        DataPipeline = ppBDEAnuncioSubscricao
        DisplayFormat = '###,#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAnuncioSubscricao'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 75671
        mmWidth = 38894
        BandType = 0
      end
      object ppLabel201: TppLabel
        UserName = 'Label156'
        Caption = '/MIL -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66940
        mmTop = 69321
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel202: TppLabel
        UserName = 'Label157'
        Caption = '/MIL -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66675
        mmTop = 75671
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel203: TppLabel
        UserName = 'Label158'
        Caption = 'Negociação de Direitos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 86254
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText84: TppDBText
        UserName = 'DBText77'
        DataField = 'DATACOM'
        DataPipeline = ppBDEAnuncioSubscricao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAnuncioSubscricao'
        mmHeight = 3704
        mmLeft = 45244
        mmTop = 86254
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel204: TppLabel
        UserName = 'Label159'
        Caption = 'Ações c/direito em  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 86254
        mmWidth = 29369
        BandType = 0
      end
      object ppDBText86: TppDBText
        UserName = 'DBText78'
        DataField = 'DATAEX'
        DataPipeline = ppBDEAnuncioSubscricao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnuncioSubscricao'
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 86254
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel205: TppLabel
        UserName = 'Label161'
        Caption = 'Índice :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 93398
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText87: TppDBText
        UserName = 'DBText80'
        DataField = 'PERCENTUAL'
        DataPipeline = ppBDEAnuncioSubscricao
        DisplayFormat = '###,#0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAnuncioSubscricao'
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 93398
        mmWidth = 39688
        BandType = 0
      end
      object ppLine89: TppLine
        UserName = 'Line78'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 529
        mmTop = 73819
        mmWidth = 196850
        BandType = 0
      end
      object ppLine90: TppLine
        UserName = 'Line79'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 265
        mmTop = 80169
        mmWidth = 196850
        BandType = 0
      end
      object ppLine91: TppLine
        UserName = 'Line80'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 265
        mmTop = 91017
        mmWidth = 196850
        BandType = 0
      end
      object pplTipoOrig: TppLabel
        UserName = 'lTipoOrig'
        Caption = 'lTipoOrig'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 69321
        mmWidth = 13229
        BandType = 0
      end
      object pplTipoDest: TppLabel
        UserName = 'lTipoOrig1'
        Caption = 'lTipoDest'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 75671
        mmWidth = 13494
        BandType = 0
      end
      object ppLBovBase: TppLabel
        UserName = 'LBovBase'
        Caption = 'LBovBase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57415
        mmTop = 127794
        mmWidth = 14552
        BandType = 0
      end
      object ppLTipoBase: TppLabel
        UserName = 'LTipoBase'
        Caption = 'LTipoBase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 127794
        mmWidth = 15346
        BandType = 0
      end
      object ppLTipoSubs: TppLabel
        UserName = 'LTipoSubs'
        Caption = 'LTipoSubs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 161661
        mmWidth = 15346
        BandType = 0
      end
      object ppLBovSubs: TppLabel
        UserName = 'LBovSubs'
        Caption = 'LBovSubs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 161661
        mmWidth = 14552
        BandType = 0
      end
      object ppLQtdBase: TppLabel
        UserName = 'LTipoBase1'
        Caption = 'LQtdBase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 127794
        mmWidth = 14288
        BandType = 0
      end
      object ppLQtdSubs: TppLabel
        UserName = 'LQtdSubs'
        Caption = 'LQtdSubs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 161661
        mmWidth = 14288
        BandType = 0
      end
      object pplTipoFinDes: TppLabel
        UserName = 'lTipoFinDes'
        Caption = 'lTipoFinDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 184415
        mmWidth = 17198
        BandType = 0
      end
      object pplFinDes: TppLabel
        UserName = 'lFinDes'
        Caption = 'lFinDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 48154
        mmTop = 184415
        mmWidth = 10848
        BandType = 0
      end
      object pplTotFinDes: TppLabel
        UserName = 'lTotFinDes'
        Caption = 'lTotFinDes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 191294
        mmWidth = 16669
        BandType = 0
      end
      object pplEmpresa: TppLabel
        UserName = 'lEmpresa'
        Caption = 'lEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 73025
        mmTop = 39952
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel206: TppLabel
        UserName = 'Label185'
        Caption = '___/___/______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 156634
        mmTop = 253471
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel207: TppLabel
        UserName = 'Label186'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58738
        mmTop = 93398
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel55: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa8'
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
      object ppLabel222: TppLabel
        UserName = 'LCarteira7'
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
      object ppLabel255: TppLabel
        UserName = 'LPeriodo1'
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
      object ppDBImage9: TppDBImage
        UserName = 'DbLogo8'
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
    end
    object ppDetailBand23: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand22: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel208: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label152'
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
        mmWidth = 196321
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
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
        mmWidth = 137848
        BandType = 8
      end
      object ppLine92: TppLine
        UserName = 'Line61'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1323
        mmWidth = 196321
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable6'
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
  object ppBDEAnuncioSubscricao: TppBDEPipeline
    UserName = 'BDEConsCartRendVar2'
    Left = 533
    Top = 458
  end
  object RpConciliacaoCustodia: TppReport
    AutoStop = False
    DataPipeline = ppBDEConciliacaoCustodia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Conciliação de Custódia'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 47
    Top = 400
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEConciliacaoCustodia'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 10319
        mmLeft = 0
        mmTop = 21696
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel139: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 26988
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel143: TppLabel
        UserName = 'ppLabel113'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 87842
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'Label150'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 26988
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel140: TppLabel
        UserName = 'Label140'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 124884
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel141: TppLabel
        UserName = 'Label1501'
        Caption = 'de Conciliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120386
        mmTop = 26988
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel142: TppLabel
        UserName = 'Label1401'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159544
        mmTop = 23019
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'Label146'
        Caption = 'de Divergência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155046
        mmTop = 26988
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'Label1'
        Caption = 'Divergente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 26988
        mmWidth = 14288
        BandType = 0
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 21431
        mmWidth = 284427
        BandType = 0
      end
      object ppLine58: TppLine
        UserName = 'Line58'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 31750
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label2'
        Caption = 'Código ISIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 48948
        mmTop = 26988
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label3'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 26988
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Conciliação de Custódia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 41275
        BandType = 0
      end
      object ppLabel47: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa28'
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
      object ppLabel138: TppLabel
        UserName = 'LCarteira25'
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
      object ppLDataConcilia: TppLabel
        UserName = 'LPeriodo18'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage28: TppDBImage
        UserName = 'DbLogo28'
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
    end
    object ppDetailBand20: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284427
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'ppDBText44'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEConciliacaoCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 3969
        mmTop = 265
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'ppDBText53'
        DataField = 'QTDE'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = 'QTDTITULOS'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = 'QTDEDIVERGENTE'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = 'CODISIN'
        DataPipeline = ppBDEConciliacaoCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText1'
        DataField = 'OBSERVACAO'
        DataPipeline = ppBDEConciliacaoCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3704
        mmLeft = 198967
        mmTop = 265
        mmWidth = 84931
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel148: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel117'
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
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'Calc29'
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
      object ppLine59: TppLine
        UserName = 'Line59'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284427
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel149: TppLabel
        UserName = 'ppLabel118'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 2646
        mmWidth = 11906
        BandType = 7
      end
      object ppLine60: TppLine
        UserName = 'Line60'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 794
        mmWidth = 284427
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'QTDE'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3175
        mmLeft = 75671
        mmTop = 3704
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'QTDTITULOS'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3175
        mmLeft = 112713
        mmTop = 3704
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'QTDEDIVERGENTE'
        DataPipeline = ppBDEConciliacaoCustodia
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConciliacaoCustodia'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 3704
        mmWidth = 27252
        BandType = 7
      end
    end
  end
  object QryConciliacaoCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     H1.IDCARTEIRAINVEST,'
      '     H1.IDINVESTIMENTO,'
      '     CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, COC.CODISIN,'
      '     H1.IDLOTE,'
      '     AB.QTDELOTE,'
      '     OBSERVACAO,'
      '     IDCONCILIACUSTODIA,'
      
        '     DECODE((QTDTITULOS-SALDO.SALDOQTDEINVCART),0,'#39'N'#39','#39'S'#39') AS ST' +
        'ATUS,'
      
        '    (NVL(QTDTITULOS,0)-NVL(SALDO.SALDOQTDEINVCART,0)) AS QTDEDIV' +
        'ERGENTE,'
      '     NVL(QTDTITULOS,0) AS QTDTITULOS,'
      '     NVL(SALDO.SALDOQTDEINVCART,0) AS QTDE,'
      '     SALDOTOTAL.TOTALQTDE,'
      '     SALDOTOTAL.TOTALQTDTITULOS,'
      '     SALDOTOTAL.TOTALQTDEDIVERGENTE'
      'FROM'
      '     HISTCARTINV H1,'
      '    ('
      '     SELECT'
      
        '          H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTI' +
        'NV, H1.IDINVESTIMENTO,'
      '          H1.SALDOCOTASCARTINV,'
      '          H1.SALDOVLRCARTINV,'
      '          H1.SALDOQTDEINVCART,'
      '          H1.SALDOVLRINVCART,'
      '          H1.SALDOATU,'
      '          H1.SALDOCAR,'
      '          H1.SALDOAQUI,'
      '          H1.SALDOREND,'
      '          H1.SALDOVARIACAO,'
      '          H1.SALDOJUROS,'
      '          H1.SALDOPREMIO,'
      '          H1.SALDOIRPROV,'
      '          H1.SALDOIRAPU,'
      '          H1.SALDOIOFPROV,'
      '          H1.SALDOIOFAPU,'
      '          H1.SALDOAGIO'
      '     FROM'
      '          HISTCARTINV H1'
      '     WHERE'
      '         (IDCARTEIRAINVEST  =:IDCARTEIRAINVEST)    AND'
      '       (((NULL IS NOT NULL) AND (IDLOTE =NULL) )   OR'
      '        ((NULL IS NULL)     AND (IDLOTE IS NULL))) AND'
      '         (H1.DATAMOVCARTINV ='
      '         ('
      '          SELECT'
      '               MAX(H2.DATAMOVCARTINV)'
      '          FROM'
      '               HISTCARTINV H2'
      '          WHERE'
      
        '              (H2.IDCARTEIRAINVEST  = H1.IDCARTEIRAINVEST )     ' +
        ' AND'
      
        '              (H2.IDINVESTIMENTO    = H1.IDINVESTIMENTO )       ' +
        '   AND'
      
        '            (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE = H1.IDLOTE' +
        ') ) OR'
      
        '             ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL) ) )  A' +
        'ND'
      '            (((H2.DATAMOVCARTINV <:DATAMOVCARTINV) )  OR'
      
        '             ((H2.DATAMOVCARTINV   =:DATAMOVCARTINV)    AND (H2.' +
        'IDHISTCARTINV <9999999999) ) ) ) )   AND'
      '              (H1.IDHISTCARTINV ='
      '              ('
      '               SELECT'
      '                    MAX(H3.IDHISTCARTINV)'
      '               FROM'
      '                    HISTCARTINV H3'
      '               WHERE'
      
        '                   (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST ) ' +
        'AND'
      
        '                   (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO )   ' +
        '  AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.ID' +
        'LOTE) )  OR'
      
        '                  ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL) )' +
        ' ) AND'
      
        '                  ((H3.DATAMOVCARTINV  = H1.DATAMOVCARTINV) )   ' +
        '    AND'
      
        '                  ((H3.DATAMOVCARTINV  < :DATAMOVCARTINV) OR (H3' +
        '.IDHISTCARTINV <999999999) ) ) )   AND'
      '                   ( SALDOVLRINVCART IS NOT NULL )'
      '    ) SALDO,'
      '   ('
      '    SELECT'
      
        '         SUM(DECODE(:TIPO,1,TOTAL.QTDE,DECODE(TOTAL.QTDEDIVERGEN' +
        'TE,0,0,TOTAL.QTDE)))  AS TOTALQTDE,'
      
        '         SUM(DECODE(:TIPO,1,TOTAL.QTDTITULOS,DECODE(TOTAL.QTDEDI' +
        'VERGENTE,0,0,TOTAL.QTDTITULOS)))  AS TOTALQTDTITULOS,'
      '         SUM(TOTAL.QTDEDIVERGENTE) AS TOTALQTDEDIVERGENTE'
      '    FROM'
      '        ('
      '         SELECT DISTINCT'
      '              H1.IDCARTEIRAINVEST,'
      '              H1.IDINVESTIMENTO,'
      
        '              CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, COC.CODISI' +
        'N,'
      '              H1.IDLOTE,'
      '              AB.QTDELOTE,'
      '              OBSERVACAO,'
      '              IDCONCILIACUSTODIA,'
      
        '              DECODE((QTDTITULOS-SALDO.SALDOQTDEINVCART),0,'#39'N'#39','#39 +
        'S'#39') AS STATUS,'
      
        '             (QTDTITULOS-NVL(SALDO.SALDOQTDEINVCART,0)) AS QTDED' +
        'IVERGENTE,'
      '              QTDTITULOS,'
      '              SALDO.SALDOQTDEINVCART AS QTDE'
      '         FROM'
      '              HISTCARTINV H1,'
      '            ('
      '             SELECT'
      
        '                  H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATA' +
        'MOVCARTINV, H1.IDINVESTIMENTO,'
      '                  H1.SALDOCOTASCARTINV,'
      '                  H1.SALDOVLRCARTINV,'
      '                  H1.SALDOQTDEINVCART,'
      '                  H1.SALDOVLRINVCART,'
      '                  H1.SALDOATU,'
      '                  H1.SALDOCAR,'
      '                  H1.SALDOAQUI,'
      '                  H1.SALDOREND,'
      '                  H1.SALDOVARIACAO,'
      '                  H1.SALDOJUROS,'
      '                  H1.SALDOPREMIO,'
      '                  H1.SALDOIRPROV,'
      '                  H1.SALDOIRAPU,'
      '                  H1.SALDOIOFPROV,'
      '                  H1.SALDOIOFAPU,'
      '                  H1.SALDOAGIO'
      '             FROM'
      '                  HISTCARTINV H1'
      '             WHERE'
      '                 (IDCARTEIRAINVEST =:IDCARTEIRAINVEST)     AND'
      '               (((NULL IS NOT NULL) AND (IDLOTE =NULL) )   OR'
      '                ((NULL IS NULL)     AND (IDLOTE IS NULL))) AND'
      '                 (H1.DATAMOVCARTINV  ='
      '                 ('
      '                  SELECT'
      '                       MAX(H2.DATAMOVCARTINV)'
      '                  FROM'
      '                       HISTCARTINV H2'
      '                  WHERE'
      
        '                      (H2.IDCARTEIRAINVEST  = H1.IDCARTEIRAINVES' +
        'T )      AND'
      
        '                      (H2.IDINVESTIMENTO    = H1.IDINVESTIMENTO ' +
        ')          AND'
      
        '                    (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE = H' +
        '1.IDLOTE) ) OR'
      
        '                     ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL' +
        ') ) )  AND'
      '                    (((H2.DATAMOVCARTINV <:DATAMOVCARTINV) )  OR'
      
        '                     ((H2.DATAMOVCARTINV   =:DATAMOVCARTINV)    ' +
        'AND (H2.IDHISTCARTINV <9999999999) ) ) ) )   AND'
      '                      (H1.IDHISTCARTINV ='
      '                      ('
      '                       SELECT'
      '                            MAX(H3.IDHISTCARTINV)'
      '                       FROM'
      '                            HISTCARTINV H3'
      '                       WHERE'
      
        '                           (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAI' +
        'NVEST ) AND'
      
        '                           (H3.IDINVESTIMENTO   = H1.IDINVESTIME' +
        'NTO )     AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE) )  OR'
      
        '                          ((H1.IDLOTE IS NULL)       AND (H3.IDL' +
        'OTE IS NULL) ) ) AND'
      
        '                          ((H3.DATAMOVCARTINV  = H1.DATAMOVCARTI' +
        'NV) )       AND'
      
        '                          ((H3.DATAMOVCARTINV  <:DATAMOVCARTINV)' +
        ' OR (H3.IDHISTCARTINV <999999999) ) ) )   AND'
      
        '                           (SALDOVLRINVCART IS NOT NULL )) SALDO' +
        ','
      '              CONCILIACUSTODIA COC, INVESTIMENTO IV,'
      '              ACOESXBOLSA AB,'
      '              CARTEIRAINVEST CA'
      '         WHERE'
      
        '             (IV.CODISIN(+)           = COC.CODISIN)            ' +
        'AND'
      
        '             (COC.DATAREFERENCIA      =:DATAMOVCARTINV)         ' +
        'AND'
      
        '             (H1.IDINVESTIMENTO(+)    = IV.IDINVESTIMENTO)      ' +
        'AND'
      
        '             (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST(+)) ' +
        'AND'
      
        '             (AB.IDACAO(+)            = H1.IDINVESTIMENTO)      ' +
        'AND'
      '             (SALDO.IDINVESTIMENTO(+) = IV.IDINVESTIMENTO)'
      '             ) TOTAL) SALDOTOTAL,'
      '        CONCILIACUSTODIA COC, INVESTIMENTO IV,'
      '        ACOESXBOLSA AB, CARTEIRAINVEST CA'
      ' WHERE'
      '      (IV.CODISIN(+)           = COC.CODISIN)            AND'
      '      (COC.DATAREFERENCIA      =:DATAMOVCARTINV)         AND'
      '      (H1.IDINVESTIMENTO(+)    = IV.IDINVESTIMENTO)      AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST(+)) AND'
      '      (AB.IDACAO(+)            = H1.IDINVESTIMENTO)      AND'
      '      (SALDO.IDINVESTIMENTO(+) = IV.IDINVESTIMENTO)'
      ''
      'ORDER BY IV.DESCINVESTIMENTO'
      ' '
      ' '
      ' ')
    UpdateObject = UpdConciliacaoCustodia
    ControlType.Strings = (
      'STATUS;CheckBox;S;N')
    ValidateWithMask = True
    Left = 55
    Top = 458
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptResult
      end>
    object QryConciliacaoCustodiaSTATUS: TStringField
      DisplayLabel = 'Divergente'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Size = 1
    end
    object QryConciliacaoCustodiaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 23
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryConciliacaoCustodiaCODISIN: TStringField
      DisplayLabel = 'Código ISIN'
      DisplayWidth = 15
      FieldName = 'CODISIN'
      FixedChar = True
      Size = 14
    end
    object QryConciliacaoCustodiaQTDE: TFloatField
      DisplayLabel = 'Quantidade~ Atual'
      DisplayWidth = 17
      FieldName = 'QTDE'
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaQTDTITULOS: TFloatField
      DisplayLabel = 'Quantidade~ de Conciliação'
      DisplayWidth = 17
      FieldName = 'QTDTITULOS'
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaQTDEDIVERGENTE: TFloatField
      DisplayLabel = 'Quantidade~ de Divergência'
      DisplayWidth = 17
      FieldName = 'QTDEDIVERGENTE'
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 70
      FieldName = 'OBSERVACAO'
      FixedChar = True
      Size = 200
    end
    object QryConciliacaoCustodiaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConciliacaoCustodiaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryConciliacaoCustodiaDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object QryConciliacaoCustodiaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryConciliacaoCustodiaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaIDCONCILIACUSTODIA: TFloatField
      FieldName = 'IDCONCILIACUSTODIA'
      Visible = False
    end
    object QryConciliacaoCustodiaTOTALQTDEDIVERGENTE: TFloatField
      FieldName = 'TOTALQTDEDIVERGENTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaTOTALQTDTITULOS: TFloatField
      FieldName = 'TOTALQTDTITULOS'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConciliacaoCustodiaTOTALQTDE: TFloatField
      FieldName = 'TOTALQTDE'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
  end
  object DsConciliacaoCustodia: TwwDataSource
    DataSet = QryConciliacaoCustodia
    Left = 55
    Top = 458
  end
  object UpdConciliacaoCustodia: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDCONCILIACUSTODIA = :OLD_IDCONCILIACUSTODIA')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (OBSERVACAO)'
      'values'
      '  (:OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDCONCILIACUSTODIA = :OLD_IDCONCILIACUSTODIA')
    Left = 55
    Top = 458
  end
  object ppBDEConciliacaoCustodia: TppBDEPipeline
    DataSource = DsConciliacaoCustodia
    UserName = 'BDEConsCartRendVar3'
    Left = 47
    Top = 426
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ajustes de Mercado Futuro'
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
    Left = 725
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPipeline2'
    object ppHeaderBand25: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape25: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 24606
        mmWidth = 197380
        BandType = 0
      end
      object ppLine99: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel232: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 25400
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel233: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Valor Operado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 65617
        mmTop = 25400
        mmWidth = 19844
        BandType = 0
      end
      object ppLine100: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel235: TppLabel
        UserName = 'Label125'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 25400
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel236: TppLabel
        UserName = 'Label130'
        Caption = 'Corretora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 167482
        mmTop = 25400
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel237: TppLabel
        UserName = 'ppLabel1102'
        Caption = 'I.R.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 108215
        mmTop = 25400
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel238: TppLabel
        UserName = 'ppLabel1103'
        Caption = 'CPMF Prov.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 25400
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel239: TppLabel
        UserName = 'Label229'
        Caption = 'CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 157957
        mmTop = 25400
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel221: TppLabel
        UserName = 'Label221'
        Caption = 'Ajustes do Mercado Futuro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 46038
        BandType = 0
      end
      object ppLabel225: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
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
      object ppLCarteiraReport: TppLabel
        UserName = 'LCarteira3'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel249: TppLabel
        UserName = 'LPeriodo4'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'DbLogo4'
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
      object ppLPeriodoReport: TppLabel
        UserName = 'LPeriodoReport'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape26: TppShape
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 197358
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'ppDBText44'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBDEPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 529
        mmWidth = 40481
        BandType = 4
      end
      object ppDBText99: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEPipeline2
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 60590
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText100: TppDBText
        UserName = 'ppDBText53'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = ppBDEPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText2'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = ppBDEPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 528
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'DBText95'
        DataField = 'VLRIR'
        DataPipeline = ppBDEPipeline2
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 87313
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'DBText96'
        DataField = 'VLRCPMFPROV'
        DataPipeline = ppBDEPipeline2
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 114036
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'DBText97'
        DataField = 'VLRCPMF'
        DataPipeline = ppBDEPipeline2
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 528
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine101: TppLine
        UserName = 'Line52'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
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
      object ppLine102: TppLine
        UserName = 'Line72'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel240: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label166'
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
      object ppSystemVariable16: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable6'
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
      object ppLabel241: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label169'
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
      object ppSystemVariable17: TppSystemVariable
        UserName = 'SystemVariable9'
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
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLine103: TppLine
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
      object ppLabel242: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Total Ajustes (+) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 2117
        mmWidth = 29633
        BandType = 7
      end
      object ppLabel243: TppLabel
        UserName = 'Label132'
        Caption = 'Total Ajustes (-) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 65352
        mmTop = 2117
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel244: TppLabel
        UserName = 'Label134'
        Caption = 'Total Ajustes (-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 2117
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel245: TppLabel
        UserName = 'TotalCorretora'
        Caption = 'Total Ajustes (+)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34925
        mmTop = 2117
        mmWidth = 27517
        BandType = 7
      end
      object ppLabel246: TppLabel
        UserName = 'Label167'
        Caption = 'Total Ajustes :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 124460
        mmTop = 2117
        mmWidth = 24077
        BandType = 7
      end
      object ppLabel247: TppLabel
        UserName = 'rTotalAjustes'
        Caption = 'Total Ajustes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 149860
        mmTop = 2117
        mmWidth = 21960
        BandType = 7
      end
      object ppLine104: TppLine
        UserName = 'Line71'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 6614
        mmWidth = 197300
        BandType = 7
      end
    end
  end
  object ppBDEPipeline2: TppBDEPipeline
    DataSource = frmConsMovBMF.dsBuscaAjustes
    UserName = 'BDEPipeline2'
    Left = 733
    Top = 331
    object ppBDEPipeline2ppField1: TppField
      FieldAlias = 'DATAMOVCARTINV'
      FieldName = 'DATAMOVCARTINV'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPipeline2ppField2: TppField
      FieldAlias = 'TIPOOPERACAO'
      FieldName = 'TIPOOPERACAO'
      FieldLength = 15
      DisplayWidth = 20
      Position = 1
    end
    object ppBDEPipeline2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAJUSTE'
      FieldName = 'VLRAJUSTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object ppBDEPipeline2ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 3
    end
    object ppBDEPipeline2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCPMFPROV'
      FieldName = 'VLRCPMFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppBDEPipeline2ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCPMFAPU'
      FieldName = 'VLRCPMFAPU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 5
    end
    object ppBDEPipeline2ppField7: TppField
      FieldAlias = 'CORRETORA'
      FieldName = 'CORRETORA'
      FieldLength = 10
      DisplayWidth = 14
      Position = 6
    end
    object ppBDEPipeline2ppField8: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object updGerCartCust: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOATU = :SALDOATU,'
      '  QTDTITLOTE = :QTDTITLOTE,'
      '  COTACAOAUX = :COTACAOAUX,'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOCAR = :SALDOCAR,'
      '  COTACAO = :COTACAO,'
      '  TOTCART = :TOTCART,'
      '  TOTACAOTIPO = :TOTACAOTIPO,'
      '  TOTACAO = :TOTACAO,'
      '  TOTLIBERADO = :TOTLIBERADO,'
      '  TOTBLOQUEADO = :TOTBLOQUEADO,'
      '  VISIVEL = :VISIVEL'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  SIGLAMOTBLOQ = :OLD_SIGLAMOTBLOQ')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOAQUI, SALDOATU, QTDTITLOTE, COTACAOAUX, SALDOQTDEINVCART' +
        ', SALDOCAR, '
      
        '   COTACAO, TOTCART, TOTACAOTIPO, TOTACAO, TOTLIBERADO, TOTBLOQU' +
        'EADO, VISIVEL)'
      'values'
      
        '  (:SALDOAQUI, :SALDOATU, :QTDTITLOTE, :COTACAOAUX, :SALDOQTDEIN' +
        'VCART, '
      
        '   :SALDOCAR, :COTACAO, :TOTCART, :TOTACAOTIPO, :TOTACAO, :TOTLI' +
        'BERADO, '
      '   :TOTBLOQUEADO, :VISIVEL)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  SIGLAMOTBLOQ = :OLD_SIGLAMOTBLOQ')
    Left = 417
    Top = 195
  end
  object qryGerCartCust: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO,'
      '     IV.DESCINVESTIMENTO,IV.IDEMISSOR,'
      '     CA.DESCCARTINVEST,'
      '     SE.DESCSETOREMISSOR,'
      '     AC.CODTIPOACAO,'
      '     AB.SIGLAACAOBOLSA,'
      '     MB.IDMOTIVOBLOQUEIO, MB.SIGLAMOTBLOQ,'
      
        '     (0) AS SALDOAQUI,        (0) AS SALDOATU,     (0) AS QTDTIT' +
        'LOTE,'
      
        '     (0) AS SALDOQTDEINVCART, (0) AS SALDOCAR,     (0) AS COTACA' +
        'OAUX,'
      
        '     (0) AS COTACAO,          (0) AS TOTCART,      (0) AS TOTACA' +
        'OTIPO,'
      
        '     (0) AS TOTLIBERADO,      (0) AS TOTBLOQUEADO, (1) AS VISIVE' +
        'L,'
      '     (0) AS TOTACAO'
      'FROM'
      '     HISTCARTINV H1,'
      '     HISTCUSTODIA HC,'
      '     INVESTIMENTO IV,'
      '     ACAO AC,'
      '     EMISSOR EM,'
      '     ACOESXBOLSA AB,'
      '     SETOREMISSOR SE,'
      '     CARTEIRAINVEST CA,'
      '     MOTIVOBLOQUEIO MB'
      'WHERE'
      '         1 = 2'
      '    AND (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)'
      '    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)'
      '    AND (IV.IDINVESTIMENTO       = AC.IDACAO)'
      '    AND (IV.IDEMISSOR            = EM.IDEMISSOR)'
      '    AND (EM.IDSETOREMISSOR       = SE.CODSETOREMISSOR)'
      '    AND (AC.IDACAO               = AB.IDACAO)'
      '    AND (HC.IDCARTEIRAINVEST(+)  = H1.IDCARTEIRAINVEST)'
      '    AND (HC.IDINVESTIMENTO(+)    = H1.IDINVESTIMENTO)'
      '    AND (HC.IDMOTIVOBLOQUEIO     = MB.IDMOTIVOBLOQUEIO(+))'
      '    AND (H1.IDINVESTIMENTO  IS NOT NULL)'
      '    AND (HC.IDMOTIVOBLOQUEIO(+) <> -1)'
      'ORDER BY'
      '        CA.DESCCARTINVEST,'
      '        SE.DESCSETOREMISSOR,'
      '        IV.DESCINVESTIMENTO,'
      '        MB.SIGLAMOTBLOQ'
      ''
      ' '
      ' ')
    UpdateObject = updGerCartCust
    ValidateWithMask = True
    Left = 417
    Top = 195
    object qryGerCartCustIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryGerCartCustIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryGerCartCustDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryGerCartCustIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryGerCartCustDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryGerCartCustDESCSETOREMISSOR: TStringField
      FieldName = 'DESCSETOREMISSOR'
      Size = 60
    end
    object qryGerCartCustCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object qryGerCartCustSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object qryGerCartCustIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryGerCartCustSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryGerCartCustSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryGerCartCustSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryGerCartCustQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object qryGerCartCustSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryGerCartCustSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qryGerCartCustCOTACAOAUX: TFloatField
      FieldName = 'COTACAOAUX'
    end
    object qryGerCartCustCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qryGerCartCustTOTCART: TFloatField
      FieldName = 'TOTCART'
    end
    object qryGerCartCustTOTACAOTIPO: TFloatField
      FieldName = 'TOTACAOTIPO'
    end
    object qryGerCartCustTOTLIBERADO: TFloatField
      FieldName = 'TOTLIBERADO'
    end
    object qryGerCartCustTOTBLOQUEADO: TFloatField
      FieldName = 'TOTBLOQUEADO'
    end
    object qryGerCartCustVISIVEL: TFloatField
      FieldName = 'VISIVEL'
    end
    object qryGerCartCustTOTACAO: TFloatField
      FieldName = 'TOTACAO'
    end
  end
  object dsGerCartCust: TwwDataSource
    DataSet = qryGerCartCust
    Left = 417
    Top = 195
  end
  object bdeGerCartCust: TppBDEPipeline
    DataSource = dsGerCartCust
    UserName = 'bdeGerCartCust'
    Left = 417
    Top = 195
  end
  object RptGerCartCust: TppReport
    AutoStop = False
    DataPipeline = bdeGerCartCust
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Gerencial Carteira Ações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptGerCartCustBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 417
    Top = 137
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeGerCartCust'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object RptGerCartCustLine4: TppLine
        UserName = 'RptGerCartCustLine4'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 262467
        mmTop = 29898
        mmWidth = 21167
        BandType = 0
      end
      object RptGerCartCustLine3: TppLine
        UserName = 'RptGerCartCustLine3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 29898
        mmWidth = 29898
        BandType = 0
      end
      object RptGerCartCustLine2: TppLine
        UserName = 'RptGerCartCustLine2'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 204523
        mmTop = 29898
        mmWidth = 33867
        BandType = 0
      end
      object RptGerCartCustLine1: TppLine
        UserName = 'RptGerCartCustLine1'
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 29898
        mmWidth = 72761
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34660
        mmWidth = 284300
        BandType = 0
      end
      object RptGerCarteiraLine1: TppLine
        UserName = 'RptGerCarteiraLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25665
        mmWidth = 284300
        BandType = 0
      end
      object RptGerCarteiraLabel3: TppLabel
        UserName = 'RptGerCarteiraLabel3'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 30427
        mmWidth = 7144
        BandType = 0
      end
      object RptGerCarteiraLabel5: TppLabel
        UserName = 'RptGerCarteiraLabel5'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 30427
        mmWidth = 7144
        BandType = 0
      end
      object LblCusto: TppLabel
        UserName = 'LblCusto'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 30427
        mmWidth = 7673
        BandType = 0
      end
      object RptGerCarteiraLabel6: TppLabel
        UserName = 'RptGerCarteiraLabel6'
        Caption = 'P.U.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 204523
        mmTop = 30427
        mmWidth = 5292
        BandType = 0
      end
      object RptGerCarteiraLabel7: TppLabel
        UserName = 'RptGerCarteiraLabel7'
        Caption = 'Valor de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 30427
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel29'
        Caption = 'LblLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 21167
        mmWidth = 41804
        BandType = 0
      end
      object RptGerCartCustLabel1: TppLabel
        UserName = 'RptGerCartCustLabel1'
        Caption = 'Liberado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 30427
        mmWidth = 12965
        BandType = 0
      end
      object RptGerCartCustLabel2: TppLabel
        UserName = 'RptGerCartCustLabel2'
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 30427
        mmWidth = 15346
        BandType = 0
      end
      object RptGerCartCustLabel3: TppLabel
        UserName = 'RptGerCartCustLabel3'
        Caption = 'Mot.Bloq.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47096
        mmTop = 30427
        mmWidth = 13494
        BandType = 0
      end
      object RptGerCartCustLabel4: TppLabel
        UserName = 'RptGerCartCustLabel4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 26194
        mmWidth = 16404
        BandType = 0
      end
      object RptGerCarteiraLabel9: TppLabel
        UserName = 'RptGerCarteiraLabel9'
        Caption = '% CIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 269082
        mmTop = 25929
        mmWidth = 7673
        BandType = 0
      end
      object RptGerCarteiraLabel10: TppLabel
        UserName = 'RptGerCarteiraLabel10'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 262467
        mmTop = 30427
        mmWidth = 6350
        BandType = 0
      end
      object RptGerCarteiraLabel11: TppLabel
        UserName = 'RptGerCarteiraLabel11'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 276490
        mmTop = 30427
        mmWidth = 7144
        BandType = 0
      end
      object RptGerCartCustLabel5: TppLabel
        UserName = 'RptGerCartCustLabel5'
        Caption = 'Código Negoc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 3704
        mmTop = 26723
        mmWidth = 9525
        BandType = 0
      end
      object RptGerCartCustLabel6: TppLabel
        UserName = 'RptGerCartCustLabel6'
        Caption = 'P.U.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 30427
        mmWidth = 5292
        BandType = 0
      end
      object RptGerCartCustLabel7: TppLabel
        UserName = 'RptGerCartCustLabel7'
        Caption = 'Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 214048
        mmTop = 25929
        mmWidth = 12700
        BandType = 0
      end
      object RptGerCartCustLabel8: TppLabel
        UserName = 'RptGerCartCustLabel8'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 25929
        mmWidth = 8731
        BandType = 0
      end
      object RptGerCartCustLabel9: TppLabel
        UserName = 'RptGerCartCustLabel9'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 246592
        mmTop = 30427
        mmWidth = 2381
        BandType = 0
      end
      object RptGerCarteiraLabel8: TppLabel
        UserName = 'RptGerCarteiraLabel8'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 241830
        mmTop = 25929
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Composição Gerencial da Carteira de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 74613
        BandType = 0
      end
      object ppLabel45: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa13'
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
      object ppLCarteiraCompGerCartAcoes: TppLabel
        UserName = 'LCarteira11'
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
        mmLeft = 264584
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptGerCarteiraLabel2: TppLabel
        UserName = 'LPeriodo9'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage14: TppDBImage
        UserName = 'DbLogo13'
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
    end
    object ppDetailBand6: TppDetailBand
      BeforePrint = ppDetailBand6BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptGerCarteiraDBText3: TppDBText
        UserName = 'RptGerCarteiraDBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeGerCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object RptGerCarteiraDBText4: TppDBText
        UserName = 'RptGerCarteiraDBText4'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object LblSaldoCarr: TppDBText
        UserName = 'LblSaldoCarr'
        DataField = 'SALDOCAR'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 795
        mmWidth = 23283
        BandType = 4
      end
      object RptGerCarteiraDBText5: TppDBText
        UserName = 'RptGerCarteiraDBText5'
        DataField = 'COTACAO'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 794
        mmWidth = 20373
        BandType = 4
      end
      object RptGerCartCustDBText1: TppDBText
        UserName = 'RptGerCartCustDBText1'
        DataField = 'TOTLIBERADO'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 87313
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object RptGerCartCustDBText2: TppDBText
        UserName = 'RptGerCartCustDBText2'
        DataField = 'TOTBLOQUEADO'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object RptGerCartCustDBText3: TppDBText
        UserName = 'RptGerCartCustDBText3'
        DataField = 'SIGLAMOTBLOQ'
        DataPipeline = bdeGerCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 47096
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object LblSaldoAqui: TppDBText
        UserName = 'LblSaldoAqui'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeGerCartCust
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 795
        mmWidth = 23283
        BandType = 4
      end
      object LblSaldoAtu: TppDBText
        UserName = 'LblSaldoAtu'
        DataField = 'SALDOATU'
        DataPipeline = pplExemplo
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplExemplo'
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 795
        mmWidth = 23283
        BandType = 4
      end
      object RptGerCartCustDBText5: TppDBText
        UserName = 'RptGerCartCustDBText5'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = bdeGerCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
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
        mmTop = 1852
        mmWidth = 197909
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
      object RptGerCarteiraLabel16: TppLabel
        UserName = 'RptGerCarteiraLabel16'
        Caption = 'RptGerCarteiraLabel16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 5027
        mmWidth = 29104
        BandType = 8
      end
      object RptGerCarteiraLabel18: TppLabel
        UserName = 'RptGerCarteiraLabel18'
        Caption = 'RptGerCarteiraLabel18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 9260
        mmWidth = 29104
        BandType = 8
      end
      object RptGerCarteiraLabel19: TppLabel
        UserName = 'RptGerCarteiraLabel19'
        Caption = 'RptGerCarteiraLabel19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 185738
        mmTop = 7408
        mmWidth = 29104
        BandType = 8
      end
      object RptGerCartCustDBText4: TppDBText
        UserName = 'RptGerCartCustDBText4'
        DataPipeline = bdeGerCartCust
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeGerCartCust'
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 6879
        mmWidth = 17992
        BandType = 8
      end
      object RptGerCarteiraLabel17: TppLabel
        UserName = 'RptGerCarteiraLabel17'
        Caption = 'RptGerCarteiraLabel17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250825
        mmTop = 4763
        mmWidth = 29104
        BandType = 8
      end
    end
    object RptGerCarteiraGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeGerCartCust
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptGerCarteiraGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeGerCartCust'
      object RptGerCarteiraGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptGerCarteiraLabel12: TppLabel
          UserName = 'RptGerCarteiraLabel12'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 23283
          mmTop = 794
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object RptGerCarteiraDBText1: TppDBText
          UserName = 'RptGerCarteiraDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeGerCartCust
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeGerCartCust'
          mmHeight = 3969
          mmLeft = 37042
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGerCarteiraGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptGerCarteiraGroup2: TppGroup
      BreakName = 'DESCSETOREMISSOR'
      DataPipeline = bdeGerCartCust
      OutlineSettings.CreateNode = True
      UserName = 'RptGerCarteiraGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeGerCartCust'
      object RptGerCarteiraGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object RptGerCarteiraLabel13: TppLabel
          UserName = 'RptGerCarteiraLabel13'
          Caption = 'Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 23283
          mmTop = 1588
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object RptGerCarteiraDBText2: TppDBText
          UserName = 'RptGerCarteiraDBText2'
          DataField = 'DESCSETOREMISSOR'
          DataPipeline = bdeGerCartCust
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeGerCartCust'
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 1588
          mmWidth = 79904
          BandType = 3
          GroupNo = 1
        end
        object RptGerCarteiraLine3: TppLine
          UserName = 'RptGerCarteiraLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object RptGerCarteiraLine4: TppLine
          UserName = 'RptGerCarteiraLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object RptGerCarteiraGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptGerCartCustLabel10: TppLabel
          UserName = 'RptGerCartCustLabel10'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 212196
          mmTop = 0
          mmWidth = 26195
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object BdeDemoOpVd: TppBDEPipeline
    DataSource = DsDemoOpVd
    UserName = 'BdeDemoOpVd'
    Left = 633
    Top = 458
  end
  object DsDemoOpVd: TwwDataSource
    DataSet = QryDemoOpVd
    Left = 633
    Top = 458
  end
  object QryDemoOpVd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  IV.DESCINVESTIMENTO, HI.DATAMOVCARTINV, OI.DATAVENCOPER,' +
        ' HI.QTDEMOVINVCART,'
      '        ABS(HI.VLRMOVCARTINV) AS VLRMOVCARTINV,'
      
        '        ((HI.SALDOAQUI * HI.QTDEMOVINVCART)/ DECODE(HI.SALDOQTDE' +
        'INVCART,0,1,HI.SALDOQTDEINVCART) ) AS VALCUSTO,'
      '        NVL(DS.TOTALDESPESAS,0) AS TOTALDESPESAS,'
      
        '        NVL(ABS(HI.VLRMOVCARTINV)-(((HI.SALDOAQUI * HI.QTDEMOVIN' +
        'VCART)/'
      
        '            DECODE(HI.SALDOQTDEINVCART,0,1,HI.SALDOQTDEINVCART) ' +
        ')+DS.TOTALDESPESAS),0) AS RESULTADO,'
      '        0 AS VLRIR, (1) CONTADOR,'
      
        '        HI.IDCARTEIRAINVEST, IV.IDINVESTIMENTO, TPO.IDTIPOOPERAC' +
        'AO, TPO.IDMERCADO, TPO.FLGTRATAIR'
      ''
      'FROM HISTCARTINV HI, INVESTIMENTO IV, OPERACAOINVEST OI,'
      
        '     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTAL' +
        'DESPESAS'
      '      FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      '      WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND'
      '             TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      '      GROUP BY DOI.IDOPERACAOINVEST) DS,'
      '      TIPOOPERACAO  TPO'
      ''
      'WHERE'
      
        '       (HI.IDCARTEIRAINVEST    = :IDCARTEIRAINVEST)             ' +
        '    AND'
      ''
      
        '       (((:IDINVESTIMENTO IS NOT NULL)                          ' +
        '    AND'
      
        '         (HI.IDINVESTIMENTO      = :IDINVESTIMENTO))            ' +
        '    OR'
      
        '         (:IDINVESTIMENTO IS NULL) )                            ' +
        '    AND'
      ''
      
        '       (OI.DATAVENCOPER BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')  ' +
        '    AND'
      
        '                                TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39'))' +
        '    AND'
      ''
      
        '       (HI.NATURMOVCARTINV     = '#39'D'#39')                           ' +
        '    AND'
      
        '       (HI.IDTIPOINVEST        = 2)                             ' +
        '    AND'
      
        '       (HI.IDOPERACAOINVEST    = OI.IDOPERACAOINVEST)           ' +
        '    AND'
      
        '       (HI.IDOPERACAOINVEST    = DS.IDOPERACAOINVEST(+))        ' +
        '    AND'
      
        '       (IV.IDINVESTIMENTO      = HI.IDINVESTIMENTO)             ' +
        '    AND'
      '       (TPO.IDTIPOOPERACAO     = HI.IDTIPOOPERACAO)'#9#9'    AND'
      '       (TPO.FLGOPDIREITO      <> '#39'S'#39')'
      ''
      'ORDER BY OI.DATAVENCOPER, IV.DESCINVESTIMENTO')
    UpdateObject = UpdDemoOpVd
    ValidateWithMask = True
    Left = 633
    Top = 458
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object QryDemoOpVdDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryDemoOpVdDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object QryDemoOpVdQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object QryDemoOpVdVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object QryDemoOpVdVALCUSTO: TFloatField
      FieldName = 'VALCUSTO'
    end
    object QryDemoOpVdTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
    end
    object QryDemoOpVdRESULTADO: TFloatField
      FieldName = 'RESULTADO'
    end
    object QryDemoOpVdVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object QryDemoOpVdCONTADOR: TFloatField
      FieldName = 'CONTADOR'
    end
    object QryDemoOpVdIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryDemoOpVdIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object QryDemoOpVdIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object QryDemoOpVdFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object QryDemoOpVdIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryDemoOpVdDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
  end
  object RpDemoOpVd: TppReport
    AutoStop = False
    DataPipeline = BdeDemoOpVd
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Demonstrativo de Venda de Ações'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RpDemoOpVdBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 633
    Top = 400
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeDemoOpVd'
    object ppHeaderBand28: TppHeaderBand
      BeforePrint = ppHeaderBand10BeforePrint
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel286: TppLabel
        UserName = 'RptOperRendaVarLabel16'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 14288
        mmWidth = 1852
        BandType = 0
      end
      object ppShape38: TppShape
        UserName = 'RptOperRendaVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 6879
        mmLeft = 0
        mmTop = 23548
        mmWidth = 284692
        BandType = 0
      end
      object ppLine145: TppLine
        UserName = 'RptOperRendaVarLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30163
        mmWidth = 284300
        BandType = 0
      end
      object ppLine146: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23283
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel287: TppLabel
        UserName = 'RptOperRendaVarLabel1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3969
        mmTop = 25135
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel288: TppLabel
        UserName = 'RptOperRendaVarLabel2'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 25135
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel289: TppLabel
        UserName = 'RptOperRendaVarLabel3'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94192
        mmTop = 25135
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel290: TppLabel
        UserName = 'RptOperRendaVarLabel4'
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 118004
        mmTop = 25135
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel291: TppLabel
        UserName = 'RptOperRendaVarLabel5'
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 25135
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel292: TppLabel
        UserName = 'RptOperRendaVarLabel6'
        Caption = 'Valor do IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250825
        mmTop = 25135
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel293: TppLabel
        UserName = 'RptOperRendaVarLabel15'
        Caption = 'Valor de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 25135
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel302: TppLabel
        UserName = 'Label302'
        Caption = 'Total de Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 186532
        mmTop = 25135
        mmWidth = 24342
        BandType = 0
      end
      object ppDataIni: TppLabel
        UserName = 'DataIni'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14288
        mmWidth = 16140
        BandType = 0
      end
      object ppDataFim: TppLabel
        UserName = 'DataFim'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 48154
        mmTop = 14288
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel151: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo de Venda de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel152: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa6'
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
      object ppCarteira: TppLabel
        UserName = 'LCarteira5'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'DbLogo6'
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
    end
    object ppDetailBand30: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape39: TppShape
        OnPrint = ppShape39Print
        UserName = 'Shape39'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText138: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'QTDEMOVINVCART'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText139: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'VLRMOVCARTINV'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText142: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALCUSTO'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText144: TppDBText
        UserName = 'DBText144'
        DataField = 'TOTALDESPESAS'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 193675
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppContadorData: TppDBCalc
        UserName = 'ContadorData'
        DataField = 'CONTADOR'
        DataPipeline = BdeDemoOpVd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = ppGroup13
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3969
        mmLeft = 61648
        mmTop = 264
        mmWidth = 17198
        BandType = 4
      end
      object ppContadorAcao: TppDBCalc
        UserName = 'ContadorAcao'
        DataField = 'CONTADOR'
        DataPipeline = BdeDemoOpVd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = ppGroup14
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 264
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'RESULTADO'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 221192
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'VLRIR'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 257176
        mmTop = 265
        mmWidth = 8202
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLine147: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel297: TppLabel
        UserName = 'ppLabel58'
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
        mmTop = 1852
        mmWidth = 76729
        BandType = 8
      end
      object ppSystemVariable22: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284428
        BandType = 8
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLabel298: TppLabel
        UserName = 'RptOperRendaVarLabel14'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 0
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc41'
        DataField = 'VLRIR'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 248180
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc42: TppDBCalc
        UserName = 'DBCalc42'
        DataField = 'RESULTADO'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 221192
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc43: TppDBCalc
        UserName = 'DBCalc43'
        DataField = 'TOTALDESPESAS'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 193675
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc44: TppDBCalc
        UserName = 'DBCalc44'
        DataField = 'VALCUSTO'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc45: TppDBCalc
        UserName = 'DBCalc45'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc46: TppDBCalc
        UserName = 'DBCalc46'
        DataField = 'QTDEMOVINVCART'
        DataPipeline = BdeDemoOpVd
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeDemoOpVd'
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'DATAVENCOPER'
      DataPipeline = BdeDemoOpVd
      OutlineSettings.CreateNode = True
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeDemoOpVd'
      object ppRpDemoOpVdGroup1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText137: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAVENCOPER'
          DataPipeline = BdeDemoOpVd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ReprintOnSubsequent = True
          SuppressRepeatedValues = True
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand13BeforePrint
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel296: TppLabel
          UserName = 'Label296'
          Caption = 'Total da Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 265
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc35'
          DataField = 'QTDEMOVINVCART'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc36'
          DataField = 'VLRMOVCARTINV'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 125148
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'VALCUSTO'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 164307
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'TOTALDESPESAS'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 193675
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'RESULTADO'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 221192
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataField = 'VLRIR'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = BdeDemoOpVd
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeDemoOpVd'
      object ppRpDemoOpVdGroup2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText143: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = BdeDemoOpVd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 25400
          mmTop = 0
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand14BeforePrint
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel294: TppLabel
          UserName = 'Label294'
          Caption = 'Total da Ação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 25400
          mmTop = 0
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'QTDEMOVINVCART'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'VLRMOVCARTINV'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 125148
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc31: TppDBCalc
          UserName = 'DBCalc31'
          DataField = 'VALCUSTO'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 164307
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc32'
          DataField = 'TOTALDESPESAS'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 193675
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc33'
          DataField = 'RESULTADO'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 221192
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc34'
          DataField = 'VLRIR'
          DataPipeline = BdeDemoOpVd
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeDemoOpVd'
          mmHeight = 3175
          mmLeft = 248180
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object UpdDemoOpVd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  QTDEMOVINVCART = :QTDEMOVINVCART,'
      '  VLRMOVCARTINV = :VLRMOVCARTINV,'
      '  VALCUSTO = :VALCUSTO,'
      '  TOTALDESPESAS = :TOTALDESPESAS,'
      '  RESULTADO = :RESULTADO,'
      '  VLRIR = :VLRIR,'
      '  CONTADOR = :CONTADOR,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDMERCADO = :IDMERCADO,'
      '  FLGTRATAIR = :FLGTRATAIR'
      'where'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DESCINVESTIMENTO, DATAMOVCARTINV, QTDEMOVINVCART, VLRMOVCARTI' +
        'NV, VALCUSTO, '
      
        '   TOTALDESPESAS, RESULTADO, VLRIR, CONTADOR, IDCARTEIRAINVEST, ' +
        'IDINVESTIMENTO, '
      '   IDTIPOOPERACAO, IDMERCADO, FLGTRATAIR)'
      'values'
      
        '  (:DESCINVESTIMENTO, :DATAMOVCARTINV, :QTDEMOVINVCART, :VLRMOVC' +
        'ARTINV, '
      
        '   :VALCUSTO, :TOTALDESPESAS, :RESULTADO, :VLRIR, :CONTADOR, :ID' +
        'CARTEIRAINVEST, '
      '   :IDINVESTIMENTO, :IDTIPOOPERACAO, :IDMERCADO, :FLGTRATAIR)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    Left = 633
    Top = 458
  end
  object RptSaldoInv: TppReport
    AutoStop = False
    DataPipeline = BdeSaldoInv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RelatConsInvest'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 47
    Top = 137
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'BdeSaldoInv'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saldos dos Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 43392
        BandType = 0
      end
      object ppLabel310: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa26'
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
      object ppLabel311: TppLabel
        UserName = 'LCarteira23'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184150
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object LblPeriodoInv: TppLabel
        UserName = 'LPeriodo16'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage26: TppDBImage
        UserName = 'DbLogo26'
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
      object ppShape42: TppShape
        UserName = 'Shape42'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 23283
        mmWidth = 284428
        BandType = 0
      end
      object RptSaldoInvLabel5: TppLabel
        UserName = 'RptSaldoInvLabel5'
        Caption = 'RptSaldoInvLabel5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 24342
        mmWidth = 24871
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 23283
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59796
        mmTop = 24342
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Vlr. Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 155046
        mmTop = 24342
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Saldo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 183092
        mmTop = 24342
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 24342
        mmWidth = 11642
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 28575
        mmWidth = 284163
        BandType = 0
      end
      object RptSaldoInvLabel1: TppLabel
        UserName = 'RptSaldoInvLabel1'
        Caption = 'Sdo Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 24342
        mmWidth = 21696
        BandType = 0
      end
      object RptSaldoInvLabel3: TppLabel
        UserName = 'RptSaldoInvLabel3'
        Caption = 'Sdo Liberado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 24342
        mmWidth = 19315
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'IDLOTE'
        DataPipeline = BdeSaldoInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 48419
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'SALDOAQUI'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 173832
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object edtCotacao: TppDBText
        UserName = 'edtCotacao'
        DataField = 'COTACAO'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 136525
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object RptSaldoInvDBText1: TppDBText
        UserName = 'RptSaldoInvDBText1'
        DataField = 'SALDOBLOQUEADO'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptSaldoInvDBText2: TppDBText
        UserName = 'RptSaldoInvDBText2'
        DataField = 'SALDOLIBERADO'
        DataPipeline = BdeSaldoInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeSaldoInv'
        mmHeight = 3704
        mmLeft = 64823
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptSaldoInvLabel4: TppLabel
        OnPrint = RptSaldoInvLabel4Print
        UserName = 'RptSaldoInvLabel4'
        AutoSize = False
        Caption = 'RptSaldoInvLabel4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 529
        mmWidth = 46831
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 284163
        BandType = 8
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
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
        mmWidth = 284428
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable12'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptSaldoInvSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object RptSaldoInvGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = BdeSaldoInv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptSaldoInvGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeSaldoInv'
      object RptSaldoInvGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptDemCustoCarteiraLabel2: TppLabel
          UserName = 'RptDemCustoCarteiraLabel2'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object RptSaldoInvDBText3: TppDBText
          UserName = 'RptSaldoInvDBText3'
          DataField = 'DESCCARTINVEST'
          DataPipeline = BdeSaldoInv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BdeSaldoInv'
          mmHeight = 3704
          mmLeft = 15081
          mmTop = 794
          mmWidth = 90752
          BandType = 3
          GroupNo = 0
        end
      end
      object RptSaldoInvGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object LblValCont: TppDBCalc
          UserName = 'LblValCont'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = BdeSaldoInv
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptSaldoInvGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeSaldoInv'
          mmHeight = 3704
          mmLeft = 150548
          mmTop = 2646
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object LblAqui: TppDBCalc
          UserName = 'LblAqui'
          DataField = 'SALDOAQUI'
          DataPipeline = BdeSaldoInv
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptSaldoInvGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BdeSaldoInv'
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 2646
          mmWidth = 22490
          BandType = 5
          GroupNo = 0
        end
        object RptSaldoInvLine2: TppLine
          UserName = 'RptSaldoInvLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 1323
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object RptSaldoInvLabel2: TppLabel
          UserName = 'RptSaldoInvLabel2'
          Caption = 'TOTAIS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 11113
          mmTop = 2381
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qrySaldoInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   H1.DATAMOVCARTINV, H1.IDLOTE, H1.IDINVESTIMENTO, H1.IDCARTEIR' +
        'AINVEST,'
      
        '   H1.IDHISTCARTINV, H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, H1' +
        '.IDCARTEIRAINVEST,'
      '   H1.VLRMOVCARTINV, H1.SALDOAQUI, H1.SALDOATU,'
      '   H1.SALDOREND, H1.SALDOCAR, H1.QTDEMOVINVCART,'
      '   CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, P.NOME,'
      '   (0) AS COTACAO,'
      '   (0) AS QTDTITLOTE,'
      '   (0) AS SALDOLIBERADO,'
      '   (0) AS SALDOBLOQUEADO'
      'FROM'
      '   PESSOA P,'
      '   HISTCARTINV H1,'
      '   CARTEIRAINVEST CA,'
      '   INVESTIMENTO IV'
      'WHERE'
      '   (H1.DATAMOVCARTINV = (SELECT'
      '                            MAX(H2.DATAMOVCARTINV)'
      '                         FROM'
      '                            HISTCARTINV H2'
      '                         WHERE'
      
        '                            (H2.IDCARTEIRAINVEST = H1.IDCARTEIRA' +
        'INVEST) AND'
      
        '                            (H2.IDINVESTIMENTO   = H1.IDINVESTIM' +
        'ENTO) AND'
      '                            (H2.IDTIPOINVEST = 2) AND'
      
        '                            (((H1.IDLOTE IS NOT NULL) AND (H2.ID' +
        'LOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL' +
        '))) AND'
      
        '                            (H2.DATAMOVCARTINV  <= TO_DATE(:dDat' +
        'aRef,'#39'DD/MM/YYYY'#39')))) AND'
      '   (H1.IDHISTCARTINV = (SELECT'
      '                           MAX(H3.IDHISTCARTINV)'
      '                        FROM'
      '                           HISTCARTINV H3'
      '                        WHERE'
      
        '                           (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAI' +
        'NVEST) AND'
      
        '                           (H3.IDINVESTIMENTO   = H1.IDINVESTIME' +
        'NTO) AND'
      '                           (H3.IDTIPOINVEST = 2) AND'
      
        '                           (((H1.IDLOTE IS NOT NULL) AND (H3.IDL' +
        'OTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)' +
        ')) AND'
      
        '                           (H3.DATAMOVCARTINV   = H1.DATAMOVCART' +
        'INV))) AND'
      '   (H1.IDCARTEIRAINVEST = :IDCARTEIRAINVEST) AND'
      '   (CA.IDTIPOINVEST = 2) AND'
      '   (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '   (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '   (P.IDPESSOA = IV.IDEMISSOR) AND'
      '   (H1.SALDOQTDEINVCART     <> 0) AND'
      '   (H1.IDINVESTIMENTO  IS NOT NULL)'
      'ORDER BY'
      '    IV.DESCINVESTIMENTO,'
      '    H1.IDLOTE'
      '')
    UpdateObject = updSaldoInv
    ValidateWithMask = True
    Left = 47
    Top = 195
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end>
    object qrySaldoInvDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qrySaldoInvDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qrySaldoInvIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qrySaldoInvDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qrySaldoInvIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qrySaldoInvSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qrySaldoInvVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qrySaldoInvIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qrySaldoInvIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qrySaldoInvSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qrySaldoInvSALDOREND: TFloatField
      FieldName = 'SALDOREND'
    end
    object qrySaldoInvSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qrySaldoInvQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qrySaldoInvSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qrySaldoInvCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qrySaldoInvSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qrySaldoInvIDCARTEIRAINVEST_1: TFloatField
      FieldName = 'IDCARTEIRAINVEST_1'
    end
    object qrySaldoInvQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object qrySaldoInvSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
    object qrySaldoInvSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qrySaldoInvNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object DtsSaldoInv: TwwDataSource
    DataSet = qrySaldoInv
    Left = 47
    Top = 195
  end
  object BdeSaldoInv: TppBDEPipeline
    DataSource = DtsSaldoInv
    UserName = 'BdeSaldoInv'
    Left = 47
    Top = 195
  end
  object updSaldoInv: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOREND = :SALDOREND,'
      '  SALDOCAR = :SALDOCAR,'
      '  SALDOATU = :SALDOATU,'
      '  COTACAO = :COTACAO,'
      '  SALDOVLRINVCART = :SALDOVLRINVCART,'
      '  QTDTITLOTE = :QTDTITLOTE,'
      '  SALDOLIBERADO = :SALDOLIBERADO,'
      '  SALDOBLOQUEADO = :SALDOBLOQUEADO'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOQTDEINVCART, SALDOAQUI, SALDOREND, SALDOCAR, SALDOATU, C' +
        'OTACAO, '
      '   SALDOVLRINVCART, QTDTITLOTE, SALDOLIBERADO, SALDOBLOQUEADO)'
      'values'
      
        '  (:SALDOQTDEINVCART, :SALDOAQUI, :SALDOREND, :SALDOCAR, :SALDOA' +
        'TU, :COTACAO, '
      
        '   :SALDOVLRINVCART, :QTDTITLOTE, :SALDOLIBERADO, :SALDOBLOQUEAD' +
        'O)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 47
    Top = 195
  end
  object ppBDEPConciliacaoCustodiaFechto: TppBDEPipeline
    DataSource = DsConciliacaoCustodiaFechto
    UserName = 'BDEConciliacaoCustodiaFechto'
    Left = 218
    Top = 331
  end
  object ppRConciliacaoCustodiaFechto: TppReport
    AutoStop = False
    DataPipeline = ppBDEPConciliacaoCustodiaFechto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 218
    Top = 270
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPConciliacaoCustodiaFechto'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'Label11'
        Caption = 'Conciliação de Custódia - Fechamento Diário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 76465
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel111: TppLabel
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
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object pplCarteiraFechto: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodoFechto: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
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
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 10319
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197644
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30691
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label119'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 24606
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'Label124'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 108479
        mmTop = 24606
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label1'
        Caption = 'Saldo de Custódia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137319
        mmTop = 24606
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Divergência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 24606
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 197358
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEPConciliacaoCustodiaFechto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPConciliacaoCustodiaFechto'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 529
        mmWidth = 78846
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'DIFERENCA'
        DataPipeline = ppBDEPConciliacaoCustodiaFechto
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConciliacaoCustodiaFechto'
        mmHeight = 3704
        mmLeft = 162454
        mmTop = 529
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'CARTINVSLDQTD'
        DataPipeline = ppBDEPConciliacaoCustodiaFechto
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConciliacaoCustodiaFechto'
        mmHeight = 3704
        mmLeft = 84138
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText601'
        DataField = 'CUSTODIASLDQTD'
        DataPipeline = ppBDEPConciliacaoCustodiaFechto
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConciliacaoCustodiaFechto'
        mmHeight = 3704
        mmLeft = 125148
        mmTop = 529
        mmWidth = 36248
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel123: TppLabel
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
  object QryConciliacaoCustodiaFechto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(HISTCARTINV.IDINVESTIMENTO, NULL, HISTCUSTODIA.IDINVEST' +
        'IMENTO, HISTCARTINV.IDINVESTIMENTO) AS IDINVESTIMENTO,'
      
        '  DECODE(HISTCARTINV.DESCINVESTIMENTO, NULL, HISTCUSTODIA.DESCIN' +
        'VESTIMENTO, HISTCARTINV.DESCINVESTIMENTO) AS DESCINVESTIMENTO,'
      
        '  DECODE(HISTCARTINV.IDCARTEIRAINVEST, NULL,  HISTCUSTODIA.IDCAR' +
        'TEIRAINVEST, HISTCARTINV.IDCARTEIRAINVEST) AS IDCARTEIRAINVEST,'
      
        '  DECODE(HISTCARTINV.DESCCARTINVEST, NULL,  HISTCUSTODIA.DESCCAR' +
        'TINVEST, HISTCARTINV.DESCCARTINVEST) AS DESCCARTINVEST,'
      
        '  DECODE(HISTCARTINV.IDPLANPREVCTBPATR, NULL,  HISTCUSTODIA.IDPL' +
        'ANPREVCTBPATR, HISTCARTINV.IDPLANPREVCTBPATR) AS IDPLANPREVCTBPA' +
        'TR,'
      
        '  DECODE(HISTCARTINV.PLANPRVCONTABPATRO, NULL,  HISTCUSTODIA.PLA' +
        'NPRVCONTABPATRO, HISTCARTINV.PLANPRVCONTABPATRO) AS PLANPRVCONTA' +
        'BPATRO,'
      '     NVL(HISTCARTINV.CARTINVSALDOQTD,0) AS CARTINVSLDQTD,'
      '     NVL(HISTCUSTODIA.CUSTODIASALDOQTD,0) AS CUSTODIASLDQTD,'
      
        '    (NVL(HISTCARTINV.CARTINVSALDOQTD,0)-NVL(HISTCUSTODIA.CUSTODI' +
        'ASALDOQTD,0)) AS DIFERENCA'
      'FROM'
      '('
      'SELECT DISTINCT'
      '  IV.DESCINVESTIMENTO,'
      '  CA.DESCCARTINVEST,'
      '  NVL(H1.SALDOQTDEINVCART,0) AS CARTINVSALDOQTD,'
      '  H1.IDINVESTIMENTO,'
      '  H1.IDPLANPREVCTBPATR,'
      '  H1.IDCARTEIRAINVEST,'
      '  PLN.PLANPRVCONTABPATRO'
      'FROM'
      '     HISTCARTINV H1,  INVESTIMENTO IV,  CARTEIRAINVEST CA,'
      
        '     (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME || '#39' - '#39' || PE.NOME)' +
        ' AS PLANPRVCONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLN'
      'WHERE'
      
        '   (H1.IDTIPOINVEST = 2)                                        ' +
        '               AND'
      
        '    ((:IDCARTEIRAINVEST IS NULL) OR (H1.IDCARTEIRAINVEST = :IDCA' +
        'RTEIRAINVEST)) AND'
      
        '    ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCTBPATR = :ID' +
        'PLANPREVCTBPATR)) AND'
      ''
      
        '   (((:IDCARTEIRAGERENC IS NOT NULL) AND (H1.IDCARTEIRAGERENC = ' +
        ':IDCARTEIRAGERENC))    OR'
      
        '    ((:IDCARTEIRAGERENC IS NULL)     AND (H1.IDCARTEIRAGERENC IS' +
        ' NULL) ) )             AND'
      ''
      '   (H1.IDHISTCARTINV    IN'
      '      (SELECT MAX(H2.IDHISTCARTINV)'
      '       FROM   HISTCARTINV H2'
      '       WHERE'
      
        '         (H2.IDTIPOINVEST = 2)                                  ' +
        '                    AND'
      
        '          ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRAINVEST =' +
        ' :IDCARTEIRAINVEST)) AND'
      
        '          ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR)) AND'
      ''
      
        '         (((:IDCARTEIRAGERENC IS NOT NULL) AND (H2.IDCARTEIRAGER' +
        'ENC = :IDCARTEIRAGERENC))    OR'
      
        '          ((:IDCARTEIRAGERENC IS NULL)     AND (H2.IDCARTEIRAGER' +
        'ENC IS NULL) ) )             AND'
      ''
      
        '         (H2.DATAMOVCARTINV || H2.IDINVESTIMENTO || H2.IDCARTEIR' +
        'AINVEST || H2.IDPLANPREVCTBPATR) IN'
      
        '                             (SELECT (MAX(H3.DATAMOVCARTINV) || ' +
        'H3.IDINVESTIMENTO || H3.IDCARTEIRAINVEST || H3.IDPLANPREVCTBPATR' +
        ')'
      '                              FROM HISTCARTINV H3'
      '                              WHERE'
      
        '                                 (H3.IDTIPOINVEST = 2)          ' +
        '               AND'
      
        '                                 ((:IDCARTEIRAINVEST IS NULL) OR' +
        ' (H3.IDCARTEIRAINVEST = :IDCARTEIRAINVEST)) AND'
      
        '                                 ((:IDPLANPREVCTBPATR IS NULL) O' +
        'R (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)) AND'
      ''
      
        '                                (((:IDCARTEIRAGERENC IS NOT NULL' +
        ') AND (H3.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                                 ((:IDCARTEIRAGERENC IS NULL)   ' +
        '  AND (H3.IDCARTEIRAGERENC IS NULL) ) )             AND'
      ''
      
        #9#9'                 ((H3.DATAMOVCARTINV   = TO_DATE(:DATAMOV,'#39'DD/' +
        'MM/YYYY'#39'))  OR'
      
        #9'                         ((H3.DATAMOVCARTINV   < TO_DATE(:DATAM' +
        'OV,'#39'DD/MM/YYYY'#39'))))'
      
        '                              GROUP BY H3.IDINVESTIMENTO, H3.IDC' +
        'ARTEIRAINVEST, H3.IDPLANPREVCTBPATR)'
      
        '       GROUP BY H2.IDINVESTIMENTO, H2.IDCARTEIRAINVEST, H2.IDPLA' +
        'NPREVCTBPATR))                          AND'
      '    (NVL(H1.SALDOQTDEINVCART,0)     <> 0)                    AND'
      '    (IV.IDINVESTIMENTO(+)            = H1.IDINVESTIMENTO)    AND'
      '    (CA.IDCARTEIRAINVEST(+)          = H1.IDCARTEIRAINVEST)  AND'
      '    (H1.IDPLANPREVCTBPATR(+)         = PLN.IDPLANPREVCTBPATR)'
      ') HISTCARTINV,'
      ''
      '('
      'SELECT'
      '   IV.DESCINVESTIMENTO,'
      '   CA.DESCCARTINVEST,'
      '   SUM(H1.SALDOBLOQUEADO+H1.SALDOLIBERADO) AS CUSTODIASALDOQTD,'
      '   H1.IDINVESTIMENTO,'
      '   H1.IDPLANPREVCTBPATR,'
      '   H1.IDCARTEIRAINVEST,'
      '   PLN.PLANPRVCONTABPATRO'
      'FROM'
      '   HISTCUSTODIA H1, INVESTIMENTO IV, CARTEIRAINVEST CA,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME || '#39' - '#39' || PE.NOME) A' +
        'S PLANPRVCONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PLN'
      'WHERE'
      
        '  ((:IDCARTEIRAINVEST IS NULL) OR (H1.IDCARTEIRAINVEST = :IDCART' +
        'EIRAINVEST))        AND'
      
        '  ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCTBPATR = :IDPL' +
        'ANPREVCTBPATR))        AND'
      '   (H1.IDCUSTODIA   IN'
      '         (SELECT MAX(H2.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H2'
      
        '          WHERE ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRAIN' +
        'VEST = :IDCARTEIRAINVEST))           '#9#9'    AND'
      
        '                ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))           '#9#9'    AND'
      
        '               ((H2.DATAMOVCUSTOD||H2.IDCUSTODIANTE||H2.IDMOTIVO' +
        'BLOQUEIO||H2.IDINVESTIMENTO||H2.IDPLANPREVCTBPATR||H2.IDCARTEIRA' +
        'INVEST) IN'
      
        #9'              (SELECT MAX(H3.DATAMOVCUSTOD)||H3.IDCUSTODIANTE||' +
        'H3.IDMOTIVOBLOQUEIO||H3.IDINVESTIMENTO||H3.IDPLANPREVCTBPATR||H3' +
        '.IDCARTEIRAINVEST'
      #9#9#9'   FROM   HISTCUSTODIA H3'
      
        #9#9#9'   WHERE ((:IDCARTEIRAINVEST IS NULL) OR (H3.IDCARTEIRAINVEST' +
        ' = :IDCARTEIRAINVEST))          AND'
      
        #9#9#9'         ((:IDPLANPREVCTBPATR IS NULL) OR (H3.IDPLANPREVCTBPA' +
        'TR = :IDPLANPREVCTBPATR))          AND'
      
        '                                 ((:IDCUSTODIANTE IS NULL) OR (H' +
        '3.IDCUSTODIANTE = :IDCUSTODIANTE))     AND'
      
        #9'                         (H3.DATAMOVCUSTOD   <= TO_DATE(:DATAMO' +
        'V,'#39'DD/MM/YYYY'#39'))'
      
        #9#9#9'   GROUP BY H3.IDCUSTODIANTE, H3.IDMOTIVOBLOQUEIO, H3.IDINVES' +
        'TIMENTO, H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST))'
      
        #9'    GROUP BY H2.IDCUSTODIANTE, H2.IDMOTIVOBLOQUEIO, H2.IDINVEST' +
        'IMENTO, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST))     AND'
      
        '  (IV.IDINVESTIMENTO      = H1.IDINVESTIMENTO)   '#9#9'             ' +
        '       AND'
      
        '  (CA.IDCARTEIRAINVEST(+) = H1.IDCARTEIRAINVEST)                ' +
        '                    AND'
      
        '((H1.SALDOBLOQUEADO+H1.SALDOLIBERADO)  <> 0)                    ' +
        '       AND'
      '(PLN.IDPLANPREVCTBPATR(+) = H1.IDPLANPREVCTBPATR)'
      
        'GROUP BY IV.DESCINVESTIMENTO, CA.DESCCARTINVEST, H1.IDINVESTIMEN' +
        'TO, PLN.PLANPRVCONTABPATRO, H1.IDPLANPREVCTBPATR, H1.IDCARTEIRAI' +
        'NVEST) HISTCUSTODIA'
      'WHERE'
      
        '     (HISTCARTINV.IDINVESTIMENTO(+)  = HISTCUSTODIA.IDINVESTIMEN' +
        'TO)    AND'
      
        '     (HISTCARTINV.IDCARTEIRAINVEST(+)  = HISTCUSTODIA.IDCARTEIRA' +
        'INVEST)    AND'
      
        '     (HISTCARTINV.IDPLANPREVCTBPATR(+)  = HISTCUSTODIA.IDPLANPRE' +
        'VCTBPATR)    AND'
      
        '((:IDCUSTODIANTE IS NULL) and (NVL(HISTCARTINV.CARTINVSALDOQTD,0' +
        ') - NVL(HISTCUSTODIA.CUSTODIASALDOQTD,0)) <> 0)'
      ''
      
        'ORDER BY DECODE(HISTCARTINV.PLANPRVCONTABPATRO, NULL, HISTCUSTOD' +
        'IA.PLANPRVCONTABPATRO, HISTCARTINV.PLANPRVCONTABPATRO),'
      
        '         DECODE(HISTCARTINV.DESCCARTINVEST, NULL, HISTCUSTODIA.D' +
        'ESCCARTINVEST, HISTCARTINV.DESCCARTINVEST),'
      
        '         DECODE(HISTCARTINV.DESCINVESTIMENTO, NULL, HISTCUSTODIA' +
        '.DESCINVESTIMENTO,HISTCARTINV.DESCINVESTIMENTO)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 186
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end>
    object QryConciliacaoCustodiaFechtoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryConciliacaoCustodiaFechtoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryConciliacaoCustodiaFechtoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryConciliacaoCustodiaFechtoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryConciliacaoCustodiaFechtoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QryConciliacaoCustodiaFechtoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryConciliacaoCustodiaFechtoCARTINVSLDQTD: TFloatField
      FieldName = 'CARTINVSLDQTD'
    end
    object QryConciliacaoCustodiaFechtoCUSTODIASLDQTD: TFloatField
      FieldName = 'CUSTODIASLDQTD'
    end
    object QryConciliacaoCustodiaFechtoDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
  end
  object DsConciliacaoCustodiaFechto: TwwDataSource
    DataSet = QryConciliacaoCustodiaFechto
    Left = 250
    Top = 331
  end
  object ppBDEExeDireito: TppBDEPipeline
    DataSource = dsExeDireito
    UserName = 'BDEExeDireito'
    Left = 415
    Top = 465
  end
  object dsExeDireito: TwwDataSource
    DataSet = qryExeDireito
    Left = 231
    Top = 409
  end
  object qryExeDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INVEST.DESCINVESTIMENTO, -- AL_32'
      '   TIPOPER.DESCTIPOOPERACAO, -- AL_32'
      '   OPINV.IDOPERACAOINVEST, -- AL_32'
      '   OPINV.DATAOPERACAO,'
      '   OPDIR.DATAEX,'
      '   OPDIR.DATAOPER,'
      
        '   TIPOPER.SIGLATIPOOPER||'#39' - '#39'||INVEST.DESCINVESTIMENTO HISTORI' +
        'CO,'
      '   OPINV.NUMDOCUMENTO,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CART.DESCCARTINVEST,'
      '   OPINV.QTDEOPERACAO,'
      '   SM.IDSEGMENTACAO  ,'
      '   SM.DESCSEGMENTACAO ,'
      '    -- Direito de subscricao terá este campo zerado'
      '   DECODE(OPINV.IDTIPOOPERACAO,P.IDTIPOOPERDIRDSU, 0,'
      '                               P.IDTIPOOPERDIRDSU+10000,0,'
      '                               P.IDTIPOOPERDIRBON, 0,'
      '                               P.IDTIPOOPERDIRBON+10000,0,'
      
        '                               OPINV.PRECOUNITOPERACAO) AS DIVPO' +
        'RACAO,'
      ''
      ''
      
        '   -- Somente Bonificacao e Direito de Subscricao não possuem fi' +
        'nanceiro'
      '   DECODE(OPINV.IDTIPOOPERACAO, P.IDTIPOOPERDIRDSU, 0,'
      '                                P.IDTIPOOPERDIRDSU+10000, 0,'
      '                                P.IDTIPOOPERDIRBON, 0,'
      '                                P.IDTIPOOPERDIRBON+10000,0,'
      
        '                                NVL(OPINV.VLROPERACAO,0)) AS VLR' +
        'OPERACAO,'
      ''
      '   NVL(OPINV.VLRREMUNERACAO,0) AS VLRREMUNERACAO,'
      ''
      '   DECODE(OPINV.IDTIPOOPERACAO, P.IDTIPOOPERDIRDSU, 0,'
      '                                (P.IDTIPOOPERDIRDSU+10000), 0,'
      '                                P.IDTIPOOPERDIRBON, 0,'
      '                                P.IDTIPOOPERDIRBON+10000,0,'
      
        '                                (OPINV.VLROPERACAO + NVL(OPINV.V' +
        'LRREMUNERACAO,0))) AS VLRTOTOPERACAO,'
      ''
      '   OPDIR.IDOPERACAODIREITO,'
      '   OPINV.IDCARTEIRAINVEST,'
      ''
      
        '   DECODE(OPINV.IDCARTEIRAGERENC,NULL,0, OPINV.IDCARTEIRAINVEST+' +
        '1000) AS IDCARTEIRAGERENC,'
      ''
      ''
      
        '   --  Se é gerencial, o valor (vloperacao) saira na coluna prop' +
        'ria'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,NVL(OPINV.VLROPERACAO,' +
        '0),'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '),0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      '                                        0) AS VLROPERPROP,'
      ''
      
        '    -- Se é gerencial, o valor (vloperacao) saira na coluna gere' +
        'ncial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        NVL(OPINV.VLROPERACAO,0)' +
        ') AS VLROPERGERE,'
      ''
      
        '    -- Se é propria, o valor (vlrremuneracao) saira na coluna pr' +
        'opria'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,NVL(OPINV.VLRREMUNERAC' +
        'AO,0),'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      '                                        0) AS VLRREMUNPROP,'
      ''
      
        '   -- Se é gerencial, o valor (vlrremuneracao) saira na coluna g' +
        'erencial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        NVL(OPINV.VLRREMUNERACAO' +
        ',0)) AS VLRREMUNGERE,'
      ''
      
        '    -- Se é propria, o valor (VLROPERACAO) saira na coluna propr' +
        'ia'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0) ,0,(NVL(OPINV.VLROPERACA' +
        'O,0) + NVL(OPINV.VLRREMUNERACAO,0)),'
      '                                         P.IDTIPOOPERDIRDSU, 0,'
      
        '                                        (P.IDTIPOOPERDIRDSU+1000' +
        '0), 0,'
      '                                         P.IDTIPOOPERDIRBON, 0,'
      
        '                                         P.IDTIPOOPERDIRBON+1000' +
        '0,0,'
      '                                         0) AS VLRTOTPROP,'
      
        '   -- Se é gerencial, o valor (VLROPERACAO) saira na coluna gere' +
        'ncial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                        (P.IDTIPOOPERDIRDSU+1000' +
        '0), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        (NVL(OPINV.VLROPERACAO,0' +
        ') + NVL(OPINV.VLRREMUNERACAO,0))) AS VLRTOTGERE'
      ''
      ''
      
        'FROM OPERACAOINVEST OPINV, BOLETA BOL, TIPOOPERACAO TIPOPER, INV' +
        'ESTIMENTO INVEST, OPERACAODIREITO OPDIR, EMISSOR EM, SEGMENTACAO' +
        'MERCADO SM,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39')|| NULL AS IDCARTEIRA,I' +
        'DCARTEIRAINVEST,NULL AS IDCARTEIRAGERENC,DESCCARTINVEST,IDTIPOIN' +
        'VEST,IDMERCADO FROM CARTEIRAINVEST'
      '       WHERE IDTIPOINVEST = 2'
      '       UNION'
      
        '       SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTE' +
        'IRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST as DESCCARTI' +
        'NVEST,'
      
        '              CG.IDCARTEIRAGERENC AS IDCARTEIRAGERENC, CG.DESCCA' +
        'RTGERENC, CI.IDTIPOINVEST, CI.IDMERCADO'
      '       FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '       WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '             AND (CI.IDTIPOINVEST = 2)'
      '             AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      '                  ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND'
      
        '                   ((PI.DATAMOVCDBLIB > TO_DATE(:dDataFim,'#39'DD/MM' +
        '/YYYY'#39'))))) ) CART,'
      '     PARAMINVEST P, VWPLANPREVCTBPATR PP'
      'WHERE'
      
        '      (DECODE(:TIPODATA, 0, OPINV.DATAOPERACAO, OPINV.DATAVENCOP' +
        'ER) >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (DECODE(:TIPODATA, 0, OPINV.DATAOPERACAO, OPINV.DATAVENCOP' +
        'ER) <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39'))'
      ''
      '  AND ((:IDEMISSOR IS NULL) OR (INVEST.IDEMISSOR = :IDEMISSOR))'
      '  AND ((:IDCART IS NULL)    OR (CART.IDCARTEIRA      = :IDCART))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OPINV.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      
        '  AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO =:IDSEGMENT' +
        'ACAO))'
      ''
      '  -- Irá considerar somente o destino destas operacoes'
      
        '  AND ( --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRSUB) AND (OP' +
        'INV.ORIGDEST='#39'D'#39')) OR -- Direito de sub(destino)'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRSUB+10000) AND' +
        ' (OPINV.ORIGDEST='#39'D'#39')) OR'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRDSU) AND (OPIN' +
        'V.ORIGDEST='#39'D'#39')) OR -- Subscricao(destino)'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRDSU+10000) AND' +
        ' (OPINV.ORIGDEST='#39'D'#39')) OR'
      
        '        (OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR) OR -- JUROS ' +
        'SOBRE CAPITAL'
      '        (OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR+10000) OR'
      
        '        (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRDIV) OR -- Dividend' +
        'os'
      '        (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRDIV+10000) --OR'
      
        '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRRES) OR -- Restit' +
        'uicao de Capital'
      '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRRES+10000) OR'
      
        '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERRFRAC) OR -- Recebim' +
        'ento Fracionado'
      '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERRFRAC+10000)'
      '      )'
      ''
      ''
      
        '  AND ((BOL.TIPMOVBOLETA       <> '#39'DTA'#39') OR (BOL.TIPMOVBOLETA IS' +
        ' NULL))'
      '  AND (BOL.IDBOLETA            = OPINV.NUMDOCUMENTO)'
      '  AND (OPINV.IDOPERACAODIREITO = OPDIR.IDOPERACAODIREITO)'
      '  AND (OPDIR.IDTIPOOPERACAO    = TIPOPER.IDTIPOOPERACAO)'
      '  AND (OPINV.IDINVESTIMENTO    = INVEST.IDINVESTIMENTO)'
      
        '  AND (CART.IDCARTEIRA = (LPAD(OPINV.IDCARTEIRAINVEST,2,'#39'0'#39') || ' +
        'LPAD(OPINV.IDCARTEIRAGERENC,2,'#39'0'#39')))'
      '  AND (OPINV.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (INVEST.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (EM.IDSEGMENTACAO = SM.IDSEGMENTACAO)'
      ''
      
        'ORDER BY PP.PLANPRVCONTABPATRO, SM.IDSEGMENTACAO, OPDIR.IDOPERAC' +
        'AODIREITO, DATAOPERACAO, OPINV.IDOPERACAOINVEST, NUMDOCUMENTO,'
      
        '         OPINV.IDCARTEIRAGERENC, OPINV.IDCARTEIRAINVEST,  HISTOR' +
        'ICO'
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
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLROPERACAO'#9'###,###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 87
    Top = 529
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object qryExeDireitoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 13
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object qryExeDireitoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 32
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryExeDireitoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 37
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryExeDireitoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 65
      FieldName = 'HISTORICO'
      Origin = 'TIPOOPERACAO.SIGLATIPOOPER'
      Size = 65
    end
    object qryExeDireitoDATAEX: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAEX'
    end
    object qryExeDireitoDATAOPER: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 11
      FieldName = 'DATAOPER'
    end
    object qryExeDireitoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 19
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0.'
    end
    object qryExeDireitoDIVPORACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 25
      FieldName = 'DIVPORACAO'
      DisplayFormat = '###,###,###,##0.000000000000000'
    end
    object qryExeDireitoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 17
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRTOTOPERACAO: TFloatField
      DisplayLabel = 'Total Recebido'
      DisplayWidth = 18
      FieldName = 'VLRTOTOPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object qryExeDireitoDESCSEGMENTACAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCSEGMENTACAO'
      Visible = False
      Size = 100
    end
    object qryExeDireitoDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryExeDireitoDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object qryExeDireitoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryExeDireitoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryExeDireitoNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object qryExeDireitoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryExeDireitoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryExeDireitoVLROPERPROP: TFloatField
      FieldName = 'VLROPERPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLROPERGERE: TFloatField
      FieldName = 'VLROPERGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRREMUNPROP: TFloatField
      FieldName = 'VLRREMUNPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRREMUNGERE: TFloatField
      FieldName = 'VLRREMUNGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRTOTPROP: TFloatField
      FieldName = 'VLRTOTPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryExeDireitoVLRTOTGERE: TFloatField
      FieldName = 'VLRTOTGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object ppRepExeDireito: TppReport
    AutoStop = False
    DataPipeline = ppBDEExeDireito
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Exercícios de Direito'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppRepExeDireitoConBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 418
    Top = 400
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEExeDireito'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppRepExeDireitoLabel4: TppLabel
        UserName = 'ppRepExeDireitoLabel4'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object ppDtaIni: TppLabel
        UserName = 'ppDtaIni'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 15875
        BandType = 0
      end
      object ppDtaFim: TppLabel
        UserName = 'ppDtaFim'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label88'
        Caption = 'Exercício de Direitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel90: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa15'
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
      object ppLCarteiraExecDir: TppLabel
        UserName = 'LCarteira13'
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
        mmLeft = 271463
        mmTop = 14023
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage16: TppDBImage
        UserName = 'DbLogo15'
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
      object ppRepExeDireitoShape1: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284692
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 31750
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'ppLabel115'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 140759
        mmTop = 27252
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'ppLabel116'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 193146
        mmTop = 27252
        mmWidth = 3969
        BandType = 0
      end
      object lblTotRecebido: TppLabel
        UserName = 'lblTotRecebido'
        Caption = 'Total Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 260615
        mmTop = 27252
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 40746
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label122'
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 101071
        mmTop = 27252
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'Label114'
        Caption = 'Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 27252
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = 'Remuneração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 236538
        mmTop = 27252
        mmWidth = 18785
        BandType = 0
      end
      object lblVrlRecebido: TppLabel
        UserName = 'lblVrlRecebido'
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 205846
        mmTop = 27252
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Data EX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 119327
        mmTop = 27252
        mmWidth = 10414
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppRepExeDireitoShape2: TppShape
        OnPrint = ppRepExeDireitoShape2Print
        UserName = 'ppRepExeDireitoShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'ppDBText55'
        DataField = 'QTDEOPERACAO'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###0.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'ppDBText56'
        DataField = 'DIVPORACAO'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,##0.000000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object pdbTotRecebido: TppDBText
        UserName = 'pdbTotRecebido'
        DataField = 'VLRTOTOPERACAO'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 529
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DESCCARTINVEST'
        DataPipeline = ppBDEExeDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 529
        mmWidth = 58738
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'DATAEX'
        DataPipeline = ppBDEExeDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEExeDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = ppBDEExeDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppdbVlrRecebido: TppDBText
        UserName = 'dbVlrRecebido'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 198438
        mmTop = 529
        mmWidth = 29103
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DATAOPER'
        DataPipeline = ppBDEExeDireito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppRepExeDireitoLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppRepExeDireitoLabel3'
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
        mmTop = 794
        mmWidth = 197909
        BandType = 8
      end
      object ppRepExeDireitoCalc1: TppSystemVariable
        UserName = 'RepExeDireitoCalc1'
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
        mmTop = 529
        mmWidth = 283369
        BandType = 8
      end
      object ppRepExeDireitoCalc2: TppSystemVariable
        UserName = 'RepExeDireitoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppShape45: TppShape
        UserName = 'Shape45'
        Brush.Color = clSilver
        mmHeight = 11377
        mmLeft = 0
        mmTop = 2381
        mmWidth = 284428
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'VLRREMUNPROP'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 228071
        mmTop = 3175
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'VLRTOTPROP'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 256646
        mmTop = 3175
        mmWidth = 26723
        BandType = 7
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLROPERPROP'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 198438
        mmTop = 3175
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc51: TppDBCalc
        UserName = 'DBCalc51'
        DataField = 'VLRTOTGERE'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 256646
        mmTop = 8996
        mmWidth = 26723
        BandType = 7
      end
      object ppDBCalc52: TppDBCalc
        UserName = 'DBCalc52'
        DataField = 'VLRREMUNGERE'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 227807
        mmTop = 8996
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc53: TppDBCalc
        UserName = 'DBCalc53'
        DataField = 'VLROPERGERE'
        DataPipeline = ppBDEExeDireito
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEExeDireito'
        mmHeight = 3440
        mmLeft = 198438
        mmTop = 8996
        mmWidth = 28046
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label1203'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 156898
        mmTop = 3704
        mmWidth = 15875
        BandType = 7
      end
      object ppLabel120: TppLabel
        UserName = 'Label1'
        Caption = 'Total Geral - (Gerencial):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 139700
        mmTop = 8996
        mmWidth = 33073
        BandType = 7
      end
    end
    object ppGroup23: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppBDEExeDireito
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group23'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand21: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape57: TppShape
          UserName = 'Shape57'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText127: TppDBText
          UserName = 'DBText127'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppBDEExeDireito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 794
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand23: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppShape58: TppShape
          UserName = 'Shape58'
          Brush.Color = clSilver
          mmHeight = 10583
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc61: TppDBCalc
          UserName = 'DBCalc61'
          DataField = 'VLROPERPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 198702
          mmTop = 529
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc62: TppDBCalc
          UserName = 'DBCalc62'
          DataField = 'VLRREMUNPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 228071
          mmTop = 529
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc64: TppDBCalc
          UserName = 'DBCalc64'
          DataField = 'VLROPERPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 256646
          mmTop = 529
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc65: TppDBCalc
          UserName = 'DBCalc65'
          DataField = 'VLROPERGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 198702
          mmTop = 5292
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc67: TppDBCalc
          UserName = 'DBCalc67'
          DataField = 'VLRREMUNGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 228071
          mmTop = 5292
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc68: TppDBCalc
          UserName = 'DBCalc68'
          DataField = 'VLRTOTGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 256646
          mmTop = 5292
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLabel275: TppLabel
          UserName = 'Label275'
          Caption = 'Total  Plano/Patrocinadora - (Gerencial):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 120386
          mmTop = 5821
          mmWidth = 54240
          BandType = 5
          GroupNo = 0
        end
        object ppLabel276: TppLabel
          UserName = 'Label2101'
          Caption = 'Total Plano/Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 138642
          mmTop = 529
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = ppBDEExeDireito
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape22: TppShape
          UserName = 'Shape22'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = ppBDEExeDireito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 2910
          mmTop = 264
          mmWidth = 76200
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand11BeforePrint
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppShape44: TppShape
          UserName = 'Shape44'
          Brush.Color = clSilver
          mmHeight = 10583
          mmLeft = 0
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLROPERPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 198702
          mmTop = 794
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc102'
          DataField = 'VLRREMUNPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 228071
          mmTop = 794
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLROPERPROP'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 256646
          mmTop = 794
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc54: TppDBCalc
          UserName = 'DBCalc54'
          DataField = 'VLROPERGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 198702
          mmTop = 5556
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc55: TppDBCalc
          UserName = 'DBCalc55'
          DataField = 'VLRREMUNGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 228071
          mmTop = 5556
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc56: TppDBCalc
          UserName = 'DBCalc56'
          DataField = 'VLRTOTGERE'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3440
          mmLeft = 256646
          mmTop = 5556
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLabel137: TppLabel
          UserName = 'Label137'
          Caption = 'Total  Segmentação de Mercado - (Gerencial):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 118534
          mmTop = 6085
          mmWidth = 61637
          BandType = 5
          GroupNo = 0
        end
        object ppLabel210: TppLabel
          UserName = 'Label210'
          Caption = 'Total Segmentação de Mercado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 136525
          mmTop = 794
          mmWidth = 43519
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'IDOPERACAODIREITO'
      DataPipeline = ppBDEExeDireito
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'HISTORICO'
      DataPipeline = ppBDEExeDireito
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape46: TppShape
          UserName = 'Shape46'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 284428
          BandType = 3
          GroupNo = 2
        end
        object ppDBText58: TppDBText
          UserName = 'ppDBText58'
          DataField = 'HISTORICO'
          DataPipeline = ppBDEExeDireito
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 1323
          mmWidth = 76729
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
        object ppLine54: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'IDCARTEIRAINVEST'
      DataPipeline = ppBDEExeDireito
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'IDCARTEIRAGERENC'
      DataPipeline = ppBDEExeDireito
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEExeDireito'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand8BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand8BeforePrint
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VLRTOTOPERACAO'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3260
          mmLeft = 256647
          mmTop = 1588
          mmWidth = 26723
          BandType = 5
          GroupNo = 2
        end
        object ppLine49: TppLine
          UserName = 'Line49'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 161132
          mmTop = 265
          mmWidth = 123296
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLRREMUNERACAO'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3260
          mmLeft = 228072
          mmTop = 1588
          mmWidth = 28047
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'VLROPERACAO'
          DataPipeline = ppBDEExeDireito
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEExeDireito'
          mmHeight = 3260
          mmLeft = 198702
          mmTop = 1588
          mmWidth = 28575
          BandType = 5
          GroupNo = 3
        end
        object ppLabel61: TppLabel
          UserName = 'Label61'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 165629
          mmTop = 1588
          mmWidth = 7112
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object ppRepExeDireitoCon: TppReport
    AutoStop = False
    DataPipeline = pplRepExeDireitoCon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Exercícios de Direito'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = ppRepExeDireitoConBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 394
    Top = 520
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRepExeDireitoCon'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object lbla: TppLabel
        UserName = 'pplbla'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object lblDtaIniCon: TppLabel
        UserName = 'ppDtaIniCon'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 15875
        BandType = 0
      end
      object lblDtaFimCon: TppLabel
        UserName = 'ppDtaFimCon'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label88'
        Caption = 'Exercício de Direitos - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 88519
        BandType = 0
      end
      object lblempresaCon: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa15'
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
      object ppLabel117: TppLabel
        UserName = 'LCarteira13'
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
        mmLeft = 271463
        mmTop = 14023
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo15'
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
      object ppShape27: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        mmHeight = 11377
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284692
        BandType = 0
      end
      object ppLine44: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 31750
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'ppLabel115'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 149225
        mmTop = 27252
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'ppLabel116'
        Caption = 'PU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 194734
        mmTop = 27252
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'lblTotRecebido'
        Caption = 'Total Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 261673
        mmTop = 27252
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label31'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 49213
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label122'
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 109273
        mmTop = 27252
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label114'
        Caption = 'Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 27252
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel132: TppLabel
        UserName = 'Label59'
        Caption = 'Remuneração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 237596
        mmTop = 27252
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'lblVrlRecebido'
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 206905
        mmTop = 27252
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'Label32'
        Caption = 'Data EX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 124619
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label110'
        Caption = 'Plano/ Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 17992
        mmTop = 21696
        mmWidth = 21960
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape28: TppShape
        OnPrint = ppShape28Print
        UserName = 'ppRepExeDireitoShape2'
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'ppDBText55'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###0.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 139965
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText56'
        DataField = 'DIVPORACAO'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,##0.000000000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 165629
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'pdbTotRecebido'
        DataField = 'VLRTOTOPERACAO'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 257705
        mmTop = 529
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText10'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplRepExeDireitoCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 49213
        mmTop = 529
        mmWidth = 58738
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText63'
        DataField = 'DATAEX'
        DataPipeline = pplRepExeDireitoCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 109273
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText54'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplRepExeDireitoCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 17992
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText43'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = pplRepExeDireitoCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 529
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'DBText64'
        DataField = 'VLRREMUNERACAO'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 229130
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'dbVlrRecebido'
        DataField = 'VLROPERACAO'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 199496
        mmTop = 529
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText90: TppDBText
        UserName = 'DBText25'
        DataField = 'DATAOPER'
        DataPipeline = pplRepExeDireitoCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2879
        mmLeft = 124619
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'ppLine48'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel136: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppRepExeDireitoLabel3'
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
        mmTop = 794
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        UserName = 'RepExeDireitoCalc1'
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
        mmTop = 794
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
        UserName = 'RepExeDireitoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppShape41: TppShape
        UserName = 'Shape41'
        Brush.Color = clSilver
        mmHeight = 10583
        mmLeft = 529
        mmTop = 2117
        mmWidth = 284163
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLROPERPROP'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 198967
        mmTop = 3175
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel209: TppLabel
        UserName = 'Label120'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 169334
        mmTop = 3175
        mmWidth = 13589
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'VLRREMUNPROP'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 3175
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'VLRTOTPROP'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 256911
        mmTop = 3175
        mmWidth = 26723
        BandType = 7
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'Total Geral - (Gerencial):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 154252
        mmTop = 8467
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLROPERGERE'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 198967
        mmTop = 8202
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLRREMUNGERE'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 228336
        mmTop = 8202
        mmWidth = 28046
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'VLRTOTGERE'
        DataPipeline = pplRepExeDireitoCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepExeDireitoCon'
        mmHeight = 2910
        mmLeft = 256911
        mmTop = 8202
        mmWidth = 26723
        BandType = 7
      end
    end
    object ppGroup24: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = pplRepExeDireitoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group24'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRepExeDireitoCon'
      object ppGroupHeaderBand22: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape60: TppShape
          UserName = 'Shape402'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText128: TppDBText
          UserName = 'DBText128'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = pplRepExeDireitoCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 265
          mmTop = 1058
          mmWidth = 126736
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand24: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape61: TppShape
          UserName = 'Shape61'
          Brush.Color = clSilver
          mmHeight = 9525
          mmLeft = 0
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel277: TppLabel
          UserName = 'Label277'
          Caption = 'Total da Segmentação de Mercado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 141817
          mmTop = 1058
          mmWidth = 41011
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc69: TppDBCalc
          UserName = 'DBCalc69'
          DataField = 'VLROPERPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 1058
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc70: TppDBCalc
          UserName = 'DBCalc70'
          DataField = 'VLRREMUNPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 1058
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc72: TppDBCalc
          UserName = 'DBCalc72'
          DataField = 'VLRTOTPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLabel278: TppLabel
          UserName = 'Label278'
          Caption = 'Total da Segmentação de Mercado - (Gerencial):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 141817
          mmTop = 5027
          mmWidth = 41011
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc73: TppDBCalc
          UserName = 'DBCalc73'
          DataField = 'VLROPERGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 5821
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc74: TppDBCalc
          UserName = 'DBCalc301'
          DataField = 'VLRREMUNGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 5821
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc75: TppDBCalc
          UserName = 'DBCalc75'
          DataField = 'VLRTOTGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 5821
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplRepExeDireitoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group12'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRepExeDireitoCon'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape36: TppShape
          UserName = 'Shape36'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 284692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText92: TppDBText
          UserName = 'DBText92'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplRepExeDireitoCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 3260
          mmLeft = 1588
          mmTop = 1323
          mmWidth = 138642
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape47: TppShape
          UserName = 'Shape47'
          Brush.Color = clSilver
          mmHeight = 9525
          mmLeft = 0
          mmTop = 265
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel108: TppLabel
          UserName = 'Label1202'
          Caption = 'Total do Investimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 156898
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'DBCalc25'
          DataField = 'VLROPERPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 1058
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'VLRREMUNPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 1058
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataField = 'VLRTOTPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'Label113'
          Caption = 'Total do Investimento - (Gerencial):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 141817
          mmTop = 5027
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc29'
          DataField = 'VLROPERGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 5821
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'DBCalc30'
          DataField = 'VLRREMUNGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 5821
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc47: TppDBCalc
          UserName = 'DBCalc47'
          DataField = 'VLRTOTGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup12
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 5821
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplRepExeDireitoCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRepExeDireitoCon'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape40: TppShape
          UserName = 'Shape40'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 284957
          BandType = 3
          GroupNo = 1
        end
        object ppDBText91: TppDBText
          UserName = 'DBText91'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplRepExeDireitoCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 265
          mmTop = 529
          mmWidth = 126736
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLabel107: TppLabel
          UserName = 'Label1201'
          Caption = 'Total Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2879
          mmLeft = 166159
          mmTop = 2381
          mmWidth = 17526
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLROPERPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 2381
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'VLRREMUNPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 2381
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object ppLine37: TppLine
          UserName = 'Line37'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 161661
          mmTop = 529
          mmWidth = 123296
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc23'
          DataField = 'VLRTOTPROP'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 2381
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
        object ppLabel130: TppLabel
          UserName = 'Label1'
          Caption = 'Total Operação - (Gerencial):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2879
          mmLeft = 166423
          mmTop = 6615
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc48: TppDBCalc
          UserName = 'DBCalc48'
          DataField = 'VLROPERGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 198967
          mmTop = 6615
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc49: TppDBCalc
          UserName = 'DBCalc49'
          DataField = 'VLRREMUNGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 228336
          mmTop = 6615
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc50: TppDBCalc
          UserName = 'DBCalc50'
          DataField = 'VLRTOTGERE'
          DataPipeline = pplRepExeDireitoCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepExeDireitoCon'
          mmHeight = 2910
          mmLeft = 256911
          mmTop = 6615
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object DsExeDireitoCon: TwwDataSource
    DataSet = QryExeDireitoCon
    Left = 391
    Top = 569
  end
  object pplRepExeDireitoCon: TppBDEPipeline
    DataSource = DsExeDireitoCon
    UserName = 'IlRepExeDireitoCon'
    Left = 303
    Top = 505
  end
  object QryExeDireitoCon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- Query criada em tempo de execucao a partir da QryExeDireito'
      'SELECT'
      '   INVEST.DESCINVESTIMENTO, -- AL_32'
      '   TIPOPER.DESCTIPOOPERACAO, -- AL_32'
      '   OPINV.IDOPERACAOINVEST, -- AL_32'
      '   OPINV.DATAOPERACAO,'
      '   OPDIR.DATAEX,'
      '   OPDIR.DATAOPER,'
      
        '   TIPOPER.SIGLATIPOOPER||'#39' - '#39'||INVEST.DESCINVESTIMENTO HISTORI' +
        'CO,'
      '   OPINV.NUMDOCUMENTO,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CART.DESCCARTINVEST,'
      '   OPINV.QTDEOPERACAO,'
      '   SM.IDSEGMENTACAO  ,'
      '   SM.DESCSEGMENTACAO ,'
      '    -- Direito de subscricao terá este campo zerado'
      '   DECODE(OPINV.IDTIPOOPERACAO,P.IDTIPOOPERDIRDSU, 0,'
      '                               P.IDTIPOOPERDIRDSU+10000,0,'
      '                               P.IDTIPOOPERDIRBON, 0,'
      '                               P.IDTIPOOPERDIRBON+10000,0,'
      
        '                               OPINV.PRECOUNITOPERACAO) AS DIVPO' +
        'RACAO,'
      ''
      ''
      
        '   -- Somente Bonificacao e Direito de Subscricao não possuem fi' +
        'nanceiro'
      '   DECODE(OPINV.IDTIPOOPERACAO, P.IDTIPOOPERDIRDSU, 0,'
      '                                P.IDTIPOOPERDIRDSU+10000, 0,'
      '                                P.IDTIPOOPERDIRBON, 0,'
      '                                P.IDTIPOOPERDIRBON+10000,0,'
      
        '                                NVL(OPINV.VLROPERACAO,0)) AS VLR' +
        'OPERACAO,'
      ''
      '   NVL(OPINV.VLRREMUNERACAO,0) AS VLRREMUNERACAO,'
      ''
      '   DECODE(OPINV.IDTIPOOPERACAO, P.IDTIPOOPERDIRDSU, 0,'
      '                                (P.IDTIPOOPERDIRDSU+10000), 0,'
      '                                P.IDTIPOOPERDIRBON, 0,'
      '                                P.IDTIPOOPERDIRBON+10000,0,'
      
        '                                (OPINV.VLROPERACAO + NVL(OPINV.V' +
        'LRREMUNERACAO,0))) AS VLRTOTOPERACAO,'
      ''
      '   OPDIR.IDOPERACAODIREITO,'
      '   OPINV.IDCARTEIRAINVEST,'
      '   '
      
        '   DECODE(OPINV.IDCARTEIRAGERENC,NULL,0, OPINV.IDCARTEIRAINVEST+' +
        '1000) AS IDCARTEIRAGERENC,'
      ''
      ''
      
        '   --  Se é gerencial, o valor (vloperacao) saira na coluna prop' +
        'ria'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,NVL(OPINV.VLROPERACAO,' +
        '0),'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '),0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      '                                        0) AS VLROPERPROP,'
      ''
      
        '    -- Se é gerencial, o valor (vloperacao) saira na coluna gere' +
        'ncial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        NVL(OPINV.VLROPERACAO,0)' +
        ') AS VLROPERGERE,'
      ''
      
        '    -- Se é propria, o valor (vlrremuneracao) saira na coluna pr' +
        'opria'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,NVL(OPINV.VLRREMUNERAC' +
        'AO,0),'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      '                                        0) AS VLRREMUNPROP,'
      ''
      
        '   -- Se é gerencial, o valor (vlrremuneracao) saira na coluna g' +
        'erencial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                       (P.IDTIPOOPERDIRDSU+10000' +
        '), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        NVL(OPINV.VLRREMUNERACAO' +
        ',0)) AS VLRREMUNGERE,'
      ''
      
        '    -- Se é propria, o valor (VLROPERACAO) saira na coluna propr' +
        'ia'
      
        '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0) ,0,(NVL(OPINV.VLROPERACA' +
        'O,0) + NVL(OPINV.VLRREMUNERACAO,0)),'
      '                                         P.IDTIPOOPERDIRDSU, 0,'
      
        '                                        (P.IDTIPOOPERDIRDSU+1000' +
        '0), 0,'
      '                                         P.IDTIPOOPERDIRBON, 0,'
      
        '                                         P.IDTIPOOPERDIRBON+1000' +
        '0,0,'
      '                                         0) AS VLRTOTPROP,'
      
        '   -- Se é gerencial, o valor (VLROPERACAO) saira na coluna gere' +
        'ncial'
      '   DECODE(NVL(OPINV.IDCARTEIRAGERENC,0),0,0,'
      '                                        P.IDTIPOOPERDIRDSU, 0,'
      
        '                                        (P.IDTIPOOPERDIRDSU+1000' +
        '0), 0,'
      '                                        P.IDTIPOOPERDIRBON, 0,'
      
        '                                        P.IDTIPOOPERDIRBON+10000' +
        ',0,'
      
        '                                        (NVL(OPINV.VLROPERACAO,0' +
        ') + NVL(OPINV.VLRREMUNERACAO,0))) AS VLRTOTGERE'
      ''
      ''
      
        'FROM OPERACAOINVEST OPINV, BOLETA BOL, TIPOOPERACAO TIPOPER, INV' +
        'ESTIMENTO INVEST, OPERACAODIREITO OPDIR, EMISSOR EM, SEGMENTACAO' +
        'MERCADO SM,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39')|| NULL AS IDCARTEIRA,I' +
        'DCARTEIRAINVEST,NULL AS IDCARTEIRAGERENC,DESCCARTINVEST,IDTIPOIN' +
        'VEST,IDMERCADO FROM CARTEIRAINVEST'
      '       WHERE IDTIPOINVEST = 2'
      '       UNION'
      
        '       SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTE' +
        'IRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST as DESCCARTI' +
        'NVEST,'
      
        '              CG.IDCARTEIRAGERENC AS IDCARTEIRAGERENC, CG.DESCCA' +
        'RTGERENC, CI.IDTIPOINVEST, CI.IDMERCADO'
      '       FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '       WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '             AND (CI.IDTIPOINVEST = 2)'
      '             AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      '                  ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND'
      
        '                   ((PI.DATAMOVCDBLIB > TO_DATE(:dDataFim,'#39'DD/MM' +
        '/YYYY'#39'))))) ) CART,'
      '     PARAMINVEST P, VWPLANPREVCTBPATR PP'
      'WHERE '
      
        '      (DECODE(:TIPODATA, 0, OPINV.DATAOPERACAO, OPINV.DATAVENCOP' +
        'ER) >= TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39'))'
      
        '  AND (DECODE(:TIPODATA, 0, OPINV.DATAOPERACAO, OPINV.DATAVENCOP' +
        'ER) <= TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39'))'
      '  AND ((:IDEMISSOR IS NULL) OR (INVEST.IDEMISSOR = :IDEMISSOR))'
      '  AND ((:IDCART IS NULL)    OR (CART.IDCARTEIRA      = :IDCART))'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (OPINV.IDPLANPREVCTBPATR ' +
        '= :IDPLANPREVCTBPATR))'
      
        '  AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO =:IDSEGMENT' +
        'ACAO))'
      ''
      '  -- Irá considerar somente o destino destas operacoes'
      
        '  AND ( --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRSUB) AND (OP' +
        'INV.ORIGDEST='#39'D'#39')) OR -- Direito de sub(destino)'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRSUB+10000) AND' +
        ' (OPINV.ORIGDEST='#39'D'#39')) OR'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRDSU) AND (OPIN' +
        'V.ORIGDEST='#39'D'#39')) OR -- Subscricao(destino)'
      
        '      --  ((OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRDSU+10000) AND' +
        ' (OPINV.ORIGDEST='#39'D'#39')) OR'
      
        '        (OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR) OR -- JUROS ' +
        'SOBRE CAPITAL'
      '        (OPINV.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR+10000) OR'
      
        '        (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRDIV) OR -- Dividend' +
        'os'
      '        (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRDIV+10000) --OR'
      
        '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRRES) OR -- Restit' +
        'uicao de Capital'
      '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERDIRRES+10000) OR'
      
        '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERRFRAC) OR -- Recebim' +
        'ento Fracionado'
      '      --  (OPINV.IDTIPOOPERACAO = IDTIPOOPERRFRAC+10000)'
      '      )'
      ''
      ''
      
        '  AND ((BOL.TIPMOVBOLETA       <> '#39'DTA'#39') OR (BOL.TIPMOVBOLETA IS' +
        ' NULL))'
      '  AND (BOL.IDBOLETA            = OPINV.NUMDOCUMENTO)'
      '  AND (OPINV.IDOPERACAODIREITO = OPDIR.IDOPERACAODIREITO)'
      '  AND (OPDIR.IDTIPOOPERACAO    = TIPOPER.IDTIPOOPERACAO)'
      '  AND (OPINV.IDINVESTIMENTO    = INVEST.IDINVESTIMENTO)'
      
        '  AND (CART.IDCARTEIRA = (LPAD(OPINV.IDCARTEIRAINVEST,2,'#39'0'#39') || ' +
        'LPAD(OPINV.IDCARTEIRAGERENC,2,'#39'0'#39')))'
      '  AND (OPINV.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (INVEST.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (EM.IDSEGMENTACAO = SM.IDSEGMENTACAO)'
      ''
      
        'ORDER BY PP.PLANPRVCONTABPATRO, SM.IDSEGMENTACAO, OPDIR.IDOPERAC' +
        'AODIREITO, DATAOPERACAO, OPINV.IDOPERACAOINVEST, NUMDOCUMENTO,'
      
        '         OPINV.IDCARTEIRAGERENC, OPINV.IDCARTEIRAINVEST,  HISTOR' +
        'ICO'
      ''
      ' ')
    PictureMasks.Strings = (
      'VLROPERACAO'#9'###,###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 183
    Top = 537
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDSEGMENTACAO'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 13
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object StringField7: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 32
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object StringField8: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 37
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object StringField9: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 65
      FieldName = 'HISTORICO'
      Origin = 'TIPOOPERACAO.SIGLATIPOOPER'
      Size = 65
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 11
      FieldName = 'DATAEX'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 11
      FieldName = 'DATAOPER'
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 19
      FieldName = 'QTDEOPERACAO'
      Origin = 'OPERACAOINVEST.QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0.'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 25
      FieldName = 'DIVPORACAO'
      DisplayFormat = '###,###,###,##0.000000000000000'
    end
    object FloatField21: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      Origin = 'OPERACAOINVEST.VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField22: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 17
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField23: TFloatField
      DisplayLabel = 'Total Recebido'
      DisplayWidth = 18
      FieldName = 'VLRTOTOPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object StringField10: TStringField
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object FloatField24: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField26: TFloatField
      FieldName = 'VLROPERPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField27: TFloatField
      FieldName = 'VLROPERGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField28: TFloatField
      FieldName = 'VLRREMUNPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField29: TFloatField
      FieldName = 'VLRREMUNGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField30: TFloatField
      FieldName = 'VLRTOTPROP'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField31: TFloatField
      FieldName = 'VLRTOTGERE'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryExeDireitoConDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryExeDireitoConDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryExeDireitoConIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryExeDireitoConIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryExeDireitoConIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
    object QryExeDireitoConDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
  end
  object QryAnunRece: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       ANUNCIO.DATAOPERACAO'
      '     , RECEBIMENTO.SIGLATIPOOPER'
      '     , ANUNCIO.IDTIPOOPERACAO AS ANUNIDTIPOOPERACAO'
      '     , RECEBIMENTO.IDTIPOOPERACAO AS RECIDTIPOOPERACAO'
      '     , ANUNCIO.STATUS'
      '     , RECEBIMENTO.DESCINVESTIMENTO'
      '     , ANUNCIO.DESCTIPOOPERACAO'
      '     , ANUNCIO.PLANPRVCONTABPATRO AS PLANOPATRO'
      '     , ANUNCIO.DESCCARTINVEST AS CARTEIRAINVESTIMENTO'
      '     , ANUNCIO.VLROPERACAO ANUNCIO'
      '     , SUM(RECEBIMENTO.VLROPERACAO) RECEBIMENTO'
      
        '     , (ANUNCIO.VLROPERACAO - sum(RECEBIMENTO.VLROPERACAO)) DIFE' +
        'RENCA'
      '     , ANUNCIO.DATAOPER AS DATABASE'
      '     , ANUNCIO.DATABASE AS DATAEX'
      '     , ANUNCIO.IDCARTEIRAINVEST'
      
        '     , RECEBIMENTO.SIGLATIPOOPER||'#39' - '#39'||RECEBIMENTO.DESCINVESTI' +
        'MENTO AS DESCRICAOINVESTIMENTO'
      '     , ANUNCIO.NUMDOCUMENTO AS BOLETA'
      '     , ANUNCIO.DESCSEGMENTACAO'
      '     , ANUNCIO.IDSEGMENTACAO'
      ''
      ' FROM '
      ''
      ' (SELECT'
      '    OI.DATAOPERACAO'
      '  , OI.NUMDOCUMENTO'
      '  , IV.DESCINVESTIMENTO'
      '  , IV.IDEMISSOR'
      '  , TP.SIGLATIPOOPER'
      '  , OD.DATAEX AS DATABASE'
      '  , OD.DATAOPER'
      '  , TP.DESCTIPOOPERACAO'
      '  , PP.PLANPRVCONTABPATRO'
      '  , CI.DESCCARTINVEST'
      '  , OI.IDOPERACAOINVEST'
      '  , OI.VLROPERACAO'
      '  , OI.IDINVESTIMENTO'
      '  , OI.IDCARTEIRAINVEST'
      '  , OI.IDTIPOINVEST'
      '  , OI.IDTIPOOPERACAO'
      '  , OI.IDCUSTODIANTE'
      '  , OI.IDOPERACAODIREITO'
      '  , OI.IDCARTEIRAGERENC'
      '  , OI.IDPLANPREVCTBPATR'
      '  , OI.IDOPERCUSTODIA'
      '  , OI.IDMOTIVOBLOQUEIO'
      
        '  , DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N'#39', '#39'S'#39') AS CARTGEREN' +
        'CIAL'
      '  ,NVL(OD.STATUS,'#39'P'#39') AS STATUS'
      '  , SM.IDSEGMENTACAO'
      '  , SM.DESCSEGMENTACAO '
      ''
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, EMISSOR' +
        ' EM, SEGMENTACAOMERCADO SM, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      ''
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      ''
      '     UNION'
      ' '
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL))))'
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      ''
      '   AND TP.IDTIPOINVEST = 2     '
      '   AND OI.IDTIPOOPERACAO    in (-70, -10070)'
      '   AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '   AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '   AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGE' +
        'RENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '   AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '   AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '   AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '   AND IV.IDEMISSOR         = EM.IDEMISSOR(+)     '
      '   AND EM.IDSEGMENTACAO     = SM.IDSEGMENTACAO(+) '
      ') ANUNCIO'
      ''
      ','
      ''
      '(SELECT '
      '        OI.DATAOPERACAO'
      '      , TP.SIGLATIPOOPER'
      '      , TP.DESCTIPOOPERACAO'
      '      , OI.VLROPERACAO'
      '      , IV.DESCINVESTIMENTO'
      '      , OI.IDOPERACAOINVEST'
      '      , OI.IDINVESTIMENTO'
      '      , OI.IDCARTEIRAINVEST'
      '      , OI.IDTIPOINVEST'
      '      , OI.IDTIPOOPERACAO'
      '      , OI.IDCUSTODIANTE'
      '      , OI.IDOPERACAODIREITO'
      '      , OI.IDCARTEIRAGERENC'
      '      , OI.IDPLANPREVCTBPATR'
      '      , OI.IDOPERCUSTODIA'
      '      , OI.IDCUSTORIG'
      '      , OI.IDMOTIVOBLOQUEIO'
      '      , TP.NATUREZAOPERACAO'
      '      , CI.IDCARTEIRA'
      '      , OI.IDOPERACAOORIGEM'
      
        '      , DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N'#39', '#39'S'#39') AS CARTG' +
        'ERENCIAL'
      '      , SM.IDSEGMENTACAO '
      '      , SM.DESCSEGMENTACAO '
      ''
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, EMISSOR' +
        ' EM, SEGMENTACAOMERCADO SM, '
      ''
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      ''
      '      UNION'
      ''
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '             (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS ' +
        'NULL)))) '
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO =  OD.IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST = 2'
      
        '  AND ((OI.IDTIPOOPERACAO  = OD.IDTIPOOPERACAO) OR (OI.IDTIPOOPE' +
        'RACAO = OD.IDTIPOOPERACAO+10000))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND IV.IDEMISSOR         = EM.IDEMISSOR(+)     '
      '  AND EM.IDSEGMENTACAO     = SM.IDSEGMENTACAO(+) '
      
        '  AND OI.DATAOPERACAO BETWEEN TO_DATE(:pDATAINI,'#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE(:pDATAFIM,'#39'DD/MM/YYYY'#39')'
      ''
      'ORDER BY CARTGERENCIAL, OI.IDOPERACAOINVEST'
      ''
      ')RECEBIMENTO'
      ''
      
        'WHERE((:pIDEMISSOR IS NULL) OR (ANUNCIO.IDEMISSOR = :pIDEMISSOR)' +
        ') '
      
        'AND  ((:pIDCART IS NULL)    OR (ANUNCIO.IDCARTEIRAINVEST = :pIDC' +
        'ART))'
      
        'AND  ((:pIDPLANPREVCTBPATR IS NULL) OR (ANUNCIO.IDPLANPREVCTBPAT' +
        'R = :pIDPLANPREVCTBPATR))'
      
        'AND  ((:pIDSEGMENTACAO IS NULL) OR (ANUNCIO.IDSEGMENTACAO = :pID' +
        'SEGMENTACAO)) '
      'AND  RECEBIMENTO.IDPLANPREVCTBPATR = ANUNCIO.IDPLANPREVCTBPATR '
      'AND  RECEBIMENTO.IDCARTEIRAINVEST = ANUNCIO.IDCARTEIRAINVEST'
      'AND  ANUNCIO.STATUS = '#39'T'#39' --RECEBIMENTO TOTAL'
      
        'AND  NVL(RECEBIMENTO.IDCARTEIRAGERENC,0) = NVL(ANUNCIO.IDCARTEIR' +
        'AGERENC,0)'
      'AND  RECEBIMENTO.IDCUSTODIANTE    = ANUNCIO.IDCUSTODIANTE '
      
        'AND  ( (RECEBIMENTO.IDMOTIVOBLOQUEIO = ANUNCIO.IDMOTIVOBLOQUEIO)' +
        ' or (RECEBIMENTO.IDOPERACAOORIGEM = ANUNCIO.IDOPERACAOINVEST))'
      'AND  ANUNCIO.IDOPERACAODIREITO = RECEBIMENTO.IDOPERACAODIREITO'
      'AND  ANUNCIO.IDOPERACAODIREITO = RECEBIMENTO.IDOPERACAODIREITO '
      
        'AND  ANUNCIO.IDTIPOOPERACAO = (CASE WHEN RECEBIMENTO.IDTIPOOPERA' +
        'CAO IN (5,8) THEN -70'
      ''
      
        '                                   WHEN RECEBIMENTO.IDTIPOOPERAC' +
        'AO IN (10008,10005) THEN -10070 END)'
      'AND (ANUNCIO.VLROPERACAO -RECEBIMENTO.VLROPERACAO) <> 0'
      ''
      'group by'
      '       ANUNCIO.DATAOPERACAO'
      '     , RECEBIMENTO.SIGLATIPOOPER'
      '     , ANUNCIO.IDTIPOOPERACAO'
      '     , RECEBIMENTO.IDTIPOOPERACAO'
      '     , ANUNCIO.STATUS'
      '     , RECEBIMENTO.DESCINVESTIMENTO'
      '     , ANUNCIO.DESCTIPOOPERACAO'
      '     , ANUNCIO.PLANPRVCONTABPATRO'
      '     , ANUNCIO.DESCCARTINVEST'
      '     , ANUNCIO.VLROPERACAO'
      ''
      '     , ANUNCIO.DATAOPER'
      '     , ANUNCIO.DATABASE'
      '     , ANUNCIO.IDCARTEIRAINVEST'
      '     , ANUNCIO.SIGLATIPOOPER'
      '     , ANUNCIO.DESCINVESTIMENTO'
      '     , ANUNCIO.NUMDOCUMENTO'
      '     , ANUNCIO.DESCSEGMENTACAO'
      '     , ANUNCIO.IDSEGMENTACAO'
      ''
      
        'ORDER BY PLANOPATRO, ANUNCIO.IDSEGMENTACAO, DESCINVESTIMENTO, DE' +
        'SCRICAOINVESTIMENTO, SIGLATIPOOPER')
    PictureMasks.Strings = (
      'VLROPERACAO'#9'###,###,###,###,##0.00'#9'T'#9'T'
      'DIFERENCA'#9'###,###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 575
    Top = 569
    ParamData = <
      item
        DataType = ftString
        Name = 'pDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'pIDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object QryAnunReceDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 18
      FieldName = 'DATAOPERACAO'
    end
    object QryAnunRecePLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 50
      FieldName = 'PLANOPATRO'
      Size = 113
    end
    object QryAnunReceBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 30
      FieldName = 'BOLETA'
      Size = 30
    end
    object QryAnunReceDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição do Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryAnunReceCARTEIRAINVESTIMENTO: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'CARTEIRAINVESTIMENTO'
      Size = 60
    end
    object QryAnunReceSIGLATIPOOPER: TStringField
      DisplayLabel = 'Sigla da Operação'
      DisplayWidth = 8
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object QryAnunReceDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 18
      FieldName = 'DATABASE'
    end
    object QryAnunReceDATAEX: TDateTimeField
      DisplayLabel = 'Data Ex'
      DisplayWidth = 18
      FieldName = 'DATAEX'
    end
    object QryAnunReceANUNCIO: TFloatField
      DisplayLabel = 'Valor de Anuncio'
      DisplayWidth = 10
      FieldName = 'ANUNCIO'
    end
    object QryAnunReceRECEBIMENTO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 10
      FieldName = 'RECEBIMENTO'
    end
    object QryAnunReceDIFERENCA: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 10
      FieldName = 'DIFERENCA'
    end
    object QryAnunReceIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Visible = False
    end
    object QryAnunReceANUNIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'ANUNIDTIPOOPERACAO'
      Visible = False
    end
    object QryAnunReceRECIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'RECIDTIPOOPERACAO'
      Visible = False
    end
    object QryAnunReceSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object QryAnunReceDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo da Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryAnunReceIDCARTEIRAINVEST: TFloatField
      DisplayLabel = 'ID da Carteira Invest'
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryAnunReceDESCRICAOINVESTIMENTO: TStringField
      DisplayLabel = 'Sigla Operação / Investimento'
      DisplayWidth = 67
      FieldName = 'DESCRICAOINVESTIMENTO'
      Visible = False
      Size = 67
    end
    object QryAnunReceDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Visible = False
      Size = 100
    end
  end
  object DsAnunRece: TwwDataSource
    DataSet = QryAnunRece
    Left = 503
    Top = 569
  end
  object ppBDEAnunRece: TppBDEPipeline
    DataSource = DsAnunRece
    UserName = 'IlRepAnunRece'
    Left = 575
    Top = 529
  end
  object ppRepAnunRece: TppReport
    AutoStop = False
    DataPipeline = ppBDEAnunRece
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Exercícios de Direito'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 490
    Top = 520
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEAnunRece'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppShape48: TppShape
        UserName = 'Shape48'
        Brush.Color = clSilver
        mmHeight = 6085
        mmLeft = 529
        mmTop = 25929
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel212: TppLabel
        UserName = 'ppRepExeDireitoLabel4'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object ppDtaIniAR: TppLabel
        UserName = 'ppDtaIniAR'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 15875
        BandType = 0
      end
      object ppDtaFimAR: TppLabel
        UserName = 'ppDtaFimAR'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel215: TppLabel
        UserName = 'Label88'
        Caption = 'Diferença Anúncio x Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 57065
        BandType = 0
      end
      object ppLabel216: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa15'
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
      object ppDBImage3: TppDBImage
        UserName = 'DbLogo15'
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
      object ppLabel218: TppLabel
        UserName = 'ppLabel115'
        Caption = 'Valor Anunciado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 185738
        mmTop = 27252
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel219: TppLabel
        UserName = 'ppLabel116'
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 220928
        mmTop = 27252
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel223: TppLabel
        UserName = 'Label31'
        Caption = 'Boleta de Anúncio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 29898
        mmTop = 27252
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel224: TppLabel
        UserName = 'Label122'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 84402
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel250: TppLabel
        UserName = 'Label114'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9790
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel252: TppLabel
        UserName = 'lblVrlRecebido'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 258234
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel253: TppLabel
        UserName = 'Label32'
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 27252
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel217: TppLabel
        UserName = 'Label217'
        Caption = 'Data Ex'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 162190
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape49: TppShape
        OnPrint = ppRepExeDireitoShape2Print
        UserName = 'ppRepExeDireitoShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 529
        mmTop = 0
        mmWidth = 284692
        BandType = 4
      end
      object ppDBText94: TppDBText
        UserName = 'ppDBText55'
        DataField = 'ANUNCIO'
        DataPipeline = ppBDEAnunRece
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText56'
        DataField = 'RECEBIMENTO'
        DataPipeline = ppBDEAnunRece
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 214842
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'DBText10'
        DataField = 'BOLETA'
        DataPipeline = ppBDEAnunRece
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 529
        mmWidth = 53181
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'DBText63'
        DataField = 'CARTEIRAINVESTIMENTO'
        DataPipeline = ppBDEAnunRece
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 84402
        mmTop = 529
        mmWidth = 58473
        BandType = 4
      end
      object ppDBText110: TppDBText
        UserName = 'DBText43'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEAnunRece
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'dbVlrRecebido'
        DataField = 'DIFERENCA'
        DataPipeline = ppBDEAnunRece
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'DBText25'
        DataField = 'DATABASE'
        DataPipeline = ppBDEAnunRece
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText109: TppDBText
        UserName = 'DBText109'
        DataField = 'DATAEX'
        DataPipeline = ppBDEAnunRece
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLabel257: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppRepExeDireitoLabel3'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'RepExeDireitoCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'RepExeDireitoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 0
        mmWidth = 26194
        BandType = 8
      end
      object ppLine52: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppShape50: TppShape
        UserName = 'Shape45'
        Brush.Color = clSilver
        mmHeight = 6615
        mmLeft = 529
        mmTop = 1852
        mmWidth = 284428
        BandType = 7
      end
      object ppLabel258: TppLabel
        UserName = 'Label1203'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 222515
        mmTop = 3704
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc59: TppDBCalc
        UserName = 'DBCalc59'
        DataField = 'DIFERENCA'
        DataPipeline = ppBDEAnunRece
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunRece'
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 3440
        mmWidth = 33073
        BandType = 7
      end
    end
    object ppGroup25: TppGroup
      BreakName = 'PLANOPATRO'
      DataPipeline = ppBDEAnunRece
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group25'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunRece'
      object ppGroupHeaderBand23: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape62: TppShape
          UserName = 'Shape62'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 529
          mmTop = 265
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText129: TppDBText
          UserName = 'DBText129'
          DataField = 'PLANOPATRO'
          DataPipeline = ppBDEAnunRece
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 529
          mmWidth = 76729
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand25: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppShape63: TppShape
          UserName = 'Shape63'
          Brush.Color = clSilver
          mmHeight = 11906
          mmLeft = 529
          mmTop = 0
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel279: TppLabel
          UserName = 'Label279'
          Caption = 'Total por Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 216694
          mmTop = 4498
          mmWidth = 21632
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc76: TppDBCalc
          UserName = 'DBCalc76'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunRece
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup25
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 4233
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = ppBDEAnunRece
      OutlineSettings.CreateNode = True
      UserName = 'Group17'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunRece'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape51: TppShape
          UserName = 'Shape401'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 529
          mmTop = 0
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText106: TppDBText
          UserName = 'DBText106'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = ppBDEAnunRece
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 265
          mmWidth = 76729
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppShape53: TppShape
          UserName = 'Shape53'
          Brush.Color = clSilver
          mmHeight = 11906
          mmLeft = 529
          mmTop = 0
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLabel213: TppLabel
          UserName = 'Label213'
          Caption = 'Total por Segmentação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 206111
          mmTop = 4763
          mmWidth = 32300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc63: TppDBCalc
          UserName = 'DBCalc63'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunRece
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 4498
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = ppBDEAnunRece
      OutlineSettings.CreateNode = True
      UserName = 'Group19'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunRece'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel214: TppLabel
          UserName = 'Label214'
          Caption = 'Total Investimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 212461
          mmTop = 3175
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
        object ppLine56: TppLine
          UserName = 'Line56'
          Pen.Width = 0
          Weight = 0.25
          mmHeight = 1852
          mmLeft = 203994
          mmTop = 0
          mmWidth = 80963
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc60: TppDBCalc
          UserName = 'DBCalc60'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunRece
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup19
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 2910
          mmWidth = 33073
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'DESCRICAOINVESTIMENTO'
      DataPipeline = ppBDEAnunRece
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunRece'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape59: TppShape
          UserName = 'Shape59'
          mmHeight = 5556
          mmLeft = 529
          mmTop = 0
          mmWidth = 284428
          BandType = 3
          GroupNo = 2
        end
        object ppDBText117: TppDBText
          UserName = 'ppDBText58'
          DataField = 'DESCRICAOINVESTIMENTO'
          DataPipeline = ppBDEAnunRece
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 794
          mmWidth = 76729
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'SIGLATIPOOPER'
      DataPipeline = ppBDEAnunRece
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunRece'
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel226: TppLabel
          UserName = 'Label226'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 230717
          mmTop = 3175
          mmWidth = 7673
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc57: TppDBCalc
          UserName = 'DBCalc601'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunRece
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunRece'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 2910
          mmWidth = 33073
          BandType = 5
          GroupNo = 2
        end
        object ppLine53: TppLine
          UserName = 'Line53'
          Pen.Width = 0
          Weight = 0.25
          mmHeight = 1852
          mmLeft = 203994
          mmTop = 0
          mmWidth = 80963
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object QryAnunReceCon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       ANUNCIO.DATAOPERACAO'
      '     , RECEBIMENTO.SIGLATIPOOPER'
      '     , ANUNCIO.IDTIPOOPERACAO AS ANUNIDTIPOOPERACAO'
      '     , RECEBIMENTO.IDTIPOOPERACAO AS RECIDTIPOOPERACAO'
      '     , ANUNCIO.STATUS'
      '     , RECEBIMENTO.DESCINVESTIMENTO'
      '     , ANUNCIO.DESCTIPOOPERACAO'
      '     , ANUNCIO.PLANPRVCONTABPATRO AS PLANOPATRO'
      '     , ANUNCIO.DESCCARTINVEST AS CARTEIRAINVESTIMENTO'
      '     , ANUNCIO.VLROPERACAO ANUNCIO'
      '     , SUM(RECEBIMENTO.VLROPERACAO) RECEBIMENTO'
      
        '     , (ANUNCIO.VLROPERACAO - sum(RECEBIMENTO.VLROPERACAO)) DIFE' +
        'RENCA'
      '     , ANUNCIO.DATAOPER AS DATABASE'
      '     , ANUNCIO.DATABASE AS DATAEX'
      '     , ANUNCIO.IDCARTEIRAINVEST'
      
        '     , RECEBIMENTO.SIGLATIPOOPER||'#39' - '#39'||RECEBIMENTO.DESCINVESTI' +
        'MENTO AS DESCRICAOINVESTIMENTO'
      '     , ANUNCIO.NUMDOCUMENTO AS BOLETA'
      '     , ANUNCIO.DESCSEGMENTACAO'
      '     , ANUNCIO.IDSEGMENTACAO'
      ''
      ' FROM '
      ''
      ' (SELECT'
      '    OI.DATAOPERACAO'
      '  , OI.NUMDOCUMENTO'
      '  , IV.DESCINVESTIMENTO'
      '  , IV.IDEMISSOR'
      '  , TP.SIGLATIPOOPER'
      '  , OD.DATAEX AS DATABASE'
      '  , OD.DATAOPER'
      '  , TP.DESCTIPOOPERACAO'
      '  , PP.PLANPRVCONTABPATRO'
      '  , CI.DESCCARTINVEST'
      '  , OI.IDOPERACAOINVEST'
      '  , OI.VLROPERACAO'
      '  , OI.IDINVESTIMENTO'
      '  , OI.IDCARTEIRAINVEST'
      '  , OI.IDTIPOINVEST'
      '  , OI.IDTIPOOPERACAO'
      '  , OI.IDCUSTODIANTE'
      '  , OI.IDOPERACAODIREITO'
      '  , OI.IDCARTEIRAGERENC'
      '  , OI.IDPLANPREVCTBPATR'
      '  , OI.IDOPERCUSTODIA'
      '  , OI.IDMOTIVOBLOQUEIO'
      
        '  , DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N'#39', '#39'S'#39') AS CARTGEREN' +
        'CIAL'
      '  ,NVL(OD.STATUS,'#39'P'#39') AS STATUS'
      '  , SM.IDSEGMENTACAO'
      '  , SM.DESCSEGMENTACAO '
      ''
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, EMISSOR' +
        ' EM, SEGMENTACAOMERCADO SM, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      ''
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      ''
      '     UNION'
      ' '
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL))))'
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      ''
      '   AND TP.IDTIPOINVEST = 2     '
      '   AND OI.IDTIPOOPERACAO    in (-70, -10070)'
      '   AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '   AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '   AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGE' +
        'RENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '   AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '   AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '   AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '   AND IV.IDEMISSOR         = EM.IDEMISSOR(+)     '
      '   AND EM.IDSEGMENTACAO     = SM.IDSEGMENTACAO(+) '
      ') ANUNCIO'
      ''
      ','
      ''
      '(SELECT '
      '        OI.DATAOPERACAO'
      '      , TP.SIGLATIPOOPER'
      '      , TP.DESCTIPOOPERACAO'
      '      , OI.VLROPERACAO'
      '      , IV.DESCINVESTIMENTO'
      '      , OI.IDOPERACAOINVEST'
      '      , OI.IDINVESTIMENTO'
      '      , OI.IDCARTEIRAINVEST'
      '      , OI.IDTIPOINVEST'
      '      , OI.IDTIPOOPERACAO'
      '      , OI.IDCUSTODIANTE'
      '      , OI.IDOPERACAODIREITO'
      '      , OI.IDCARTEIRAGERENC'
      '      , OI.IDPLANPREVCTBPATR'
      '      , OI.IDOPERCUSTODIA'
      '      , OI.IDCUSTORIG'
      '      , OI.IDMOTIVOBLOQUEIO'
      '      , TP.NATUREZAOPERACAO'
      '      , CI.IDCARTEIRA'
      '      , OI.IDOPERACAOORIGEM'
      
        '      , DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N'#39', '#39'S'#39') AS CARTG' +
        'ERENCIAL'
      '      , SM.IDSEGMENTACAO '
      '      , SM.DESCSEGMENTACAO '
      ''
      
        'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT, EMISSOR' +
        ' EM, SEGMENTACAOMERCADO SM, '
      ''
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      ''
      '      UNION'
      ''
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '             (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS ' +
        'NULL)))) '
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO =  OD.IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST = 2'
      
        '  AND ((OI.IDTIPOOPERACAO  = OD.IDTIPOOPERACAO) OR (OI.IDTIPOOPE' +
        'RACAO = OD.IDTIPOOPERACAO+10000))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND IV.IDEMISSOR         = EM.IDEMISSOR(+)     '
      '  AND EM.IDSEGMENTACAO     = SM.IDSEGMENTACAO(+) '
      
        '  AND OI.DATAOPERACAO BETWEEN TO_DATE(:pDATAINI,'#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE(:pDATAFIM,'#39'DD/MM/YYYY'#39')'
      ''
      'ORDER BY CARTGERENCIAL, OI.IDOPERACAOINVEST'
      ''
      ')RECEBIMENTO'
      ''
      
        'WHERE((:pIDEMISSOR IS NULL) OR (ANUNCIO.IDEMISSOR = :pIDEMISSOR)' +
        ') '
      
        'AND  ((:pIDCART IS NULL)    OR (ANUNCIO.IDCARTEIRAINVEST = :pIDC' +
        'ART))'
      
        'AND  ((:pIDPLANPREVCTBPATR IS NULL) OR (ANUNCIO.IDPLANPREVCTBPAT' +
        'R = :pIDPLANPREVCTBPATR))'
      
        'AND  ((:pIDSEGMENTACAO IS NULL) OR (ANUNCIO.IDSEGMENTACAO = :pID' +
        'SEGMENTACAO)) '
      'AND  RECEBIMENTO.IDPLANPREVCTBPATR = ANUNCIO.IDPLANPREVCTBPATR '
      'AND  RECEBIMENTO.IDCARTEIRAINVEST = ANUNCIO.IDCARTEIRAINVEST'
      'AND  ANUNCIO.STATUS = '#39'T'#39' --RECEBIMENTO TOTAL'
      
        'AND  NVL(RECEBIMENTO.IDCARTEIRAGERENC,0) = NVL(ANUNCIO.IDCARTEIR' +
        'AGERENC,0)'
      'AND  RECEBIMENTO.IDCUSTODIANTE    = ANUNCIO.IDCUSTODIANTE '
      
        'AND  ( (RECEBIMENTO.IDMOTIVOBLOQUEIO = ANUNCIO.IDMOTIVOBLOQUEIO)' +
        ' or (RECEBIMENTO.IDOPERACAOORIGEM = ANUNCIO.IDOPERACAOINVEST))'
      'AND  ANUNCIO.IDOPERACAODIREITO = RECEBIMENTO.IDOPERACAODIREITO'
      'AND  ANUNCIO.IDOPERACAODIREITO = RECEBIMENTO.IDOPERACAODIREITO '
      
        'AND  ANUNCIO.IDTIPOOPERACAO = (CASE WHEN RECEBIMENTO.IDTIPOOPERA' +
        'CAO IN (5,8) THEN -70'
      ''
      
        '                                   WHEN RECEBIMENTO.IDTIPOOPERAC' +
        'AO IN (10008,10005) THEN -10070 END)'
      'AND (ANUNCIO.VLROPERACAO -RECEBIMENTO.VLROPERACAO) <> 0'
      ''
      'group by'
      '       ANUNCIO.DATAOPERACAO'
      '     , RECEBIMENTO.SIGLATIPOOPER'
      '     , ANUNCIO.IDTIPOOPERACAO'
      '     , RECEBIMENTO.IDTIPOOPERACAO'
      '     , ANUNCIO.STATUS'
      '     , RECEBIMENTO.DESCINVESTIMENTO'
      '     , ANUNCIO.DESCTIPOOPERACAO'
      '     , ANUNCIO.PLANPRVCONTABPATRO'
      '     , ANUNCIO.DESCCARTINVEST'
      '     , ANUNCIO.VLROPERACAO'
      ''
      '     , ANUNCIO.DATAOPER'
      '     , ANUNCIO.DATABASE'
      '     , ANUNCIO.IDCARTEIRAINVEST'
      '     , ANUNCIO.SIGLATIPOOPER'
      '     , ANUNCIO.DESCINVESTIMENTO'
      '     , ANUNCIO.NUMDOCUMENTO'
      '     , ANUNCIO.DESCSEGMENTACAO'
      '     , ANUNCIO.IDSEGMENTACAO'
      ''
      
        'ORDER BY PLANOPATRO, ANUNCIO.IDSEGMENTACAO, DESCINVESTIMENTO, DE' +
        'SCRICAOINVESTIMENTO, SIGLATIPOOPER'
      '')
    PictureMasks.Strings = (
      'VLROPERACAO'#9'###,###,###,###,##0.00'#9'T'#9'T'
      'DIFERENCA'#9'###,###,###,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 727
    Top = 569
    ParamData = <
      item
        DataType = ftString
        Name = 'pDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDCART'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANPREVCTBPATR'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'pIDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDSEGMENTACAO'
        ParamType = ptUnknown
      end>
    object StringField11: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 50
      FieldName = 'PLANOPATRO'
      Size = 113
    end
    object StringField12: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 30
      FieldName = 'BOLETA'
      Size = 30
    end
    object StringField13: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField14: TStringField
      DisplayLabel = 'Carteira de Investimento'
      DisplayWidth = 40
      FieldName = 'CARTEIRAINVESTIMENTO'
      Size = 60
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 18
      FieldName = 'DATABASE'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Data Ex'
      DisplayWidth = 18
      FieldName = 'DATAEX'
    end
    object FloatField32: TFloatField
      DisplayLabel = 'Valor de Anuncio'
      DisplayWidth = 10
      FieldName = 'ANUNCIO'
    end
    object FloatField33: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 10
      FieldName = 'RECEBIMENTO'
    end
    object FloatField34: TFloatField
      DisplayLabel = 'Diferença'
      DisplayWidth = 10
      FieldName = 'DIFERENCA'
    end
    object StringField15: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object StringField16: TStringField
      DisplayLabel = 'Tipo da Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object FloatField37: TFloatField
      DisplayLabel = 'ID da Carteira Invest'
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object StringField17: TStringField
      DisplayLabel = 'Sigla Operação / Investimento'
      DisplayWidth = 67
      FieldName = 'DESCRICAOINVESTIMENTO'
      Visible = False
      Size = 67
    end
    object QryAnunReceConANUNIDTIPOOPERACAO: TFloatField
      FieldName = 'ANUNIDTIPOOPERACAO'
    end
    object QryAnunReceConRECIDTIPOOPERACAO: TFloatField
      FieldName = 'RECIDTIPOOPERACAO'
    end
    object QryAnunReceConDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object QryAnunReceConSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object QryAnunReceConDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Size = 100
    end
    object QryAnunReceConIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
    end
  end
  object DsAnunReceCon: TwwDataSource
    DataSet = QryAnunReceCon
    Left = 655
    Top = 569
  end
  object ppBDEAnunReceCon: TppBDEPipeline
    DataSource = DsAnunReceCon
    UserName = 'IlRepAnunReceCon'
    Left = 719
    Top = 529
  end
  object ppRepAnunReceCon: TppReport
    AutoStop = False
    DataPipeline = ppBDEAnunReceCon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Exercícios de Direito'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 650
    Top = 512
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEAnunReceCon'
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppShape52: TppShape
        UserName = 'Shape48'
        Brush.Color = clSilver
        mmHeight = 6085
        mmLeft = 529
        mmTop = 25929
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel220: TppLabel
        UserName = 'ppRepExeDireitoLabel4'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object ppDtaIniARCon: TppLabel
        UserName = 'ppDtaIniAR'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 15875
        BandType = 0
      end
      object ppDtaFimARCon: TppLabel
        UserName = 'ppDtaFimAR'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 14023
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel259: TppLabel
        UserName = 'Label88'
        Caption = 'Diferença Anúncio x Recebimento - Consolidado por Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 110871
        BandType = 0
      end
      object ppLabel262: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa15'
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
        UserName = 'DbLogo15'
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
      object ppLabel263: TppLabel
        UserName = 'ppLabel115'
        Caption = 'Valor Anunciado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 185738
        mmTop = 27252
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel264: TppLabel
        UserName = 'ppLabel116'
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 220928
        mmTop = 27252
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel265: TppLabel
        UserName = 'Label31'
        Caption = 'Boleta de Anúncio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 27517
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel266: TppLabel
        UserName = 'Label122'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 104775
        mmTop = 27252
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel267: TppLabel
        UserName = 'Label114'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5027
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel268: TppLabel
        UserName = 'lblVrlRecebido'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 258234
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel269: TppLabel
        UserName = 'Label32'
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 27252
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel270: TppLabel
        UserName = 'Label217'
        Caption = 'Data Ex'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 162190
        mmTop = 27252
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel251: TppLabel
        UserName = 'Label251'
        Caption = 'Plano / Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 52388
        mmTop = 27517
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape54: TppShape
        OnPrint = ppRepExeDireitoShape2Print
        UserName = 'ppRepExeDireitoShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 529
        mmTop = 0
        mmWidth = 284692
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'ppDBText55'
        DataField = 'ANUNCIO'
        DataPipeline = ppBDEAnunReceCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 180446
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText116: TppDBText
        UserName = 'ppDBText56'
        DataField = 'RECEBIMENTO'
        DataPipeline = ppBDEAnunReceCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 214842
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText118: TppDBText
        UserName = 'DBText10'
        DataField = 'BOLETA'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText63'
        DataField = 'CARTEIRAINVESTIMENTO'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 529
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText120: TppDBText
        UserName = 'DBText43'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText121: TppDBText
        UserName = 'dbVlrRecebido'
        DataField = 'DIFERENCA'
        DataPipeline = ppBDEAnunReceCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText122: TppDBText
        UserName = 'DBText25'
        DataField = 'DATABASE'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 143934
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText123: TppDBText
        UserName = 'DBText109'
        DataField = 'DATAEX'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText126: TppDBText
        UserName = 'DBText101'
        DataField = 'PLANOPATRO'
        DataPipeline = ppBDEAnunReceCon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 529
        mmWidth = 50271
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLabel271: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppRepExeDireitoLabel3'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'RepExeDireitoCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'RepExeDireitoCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 0
        mmWidth = 26194
        BandType = 8
      end
      object ppLine51: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 8
      end
    end
    object ppSummaryBand9: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppShape55: TppShape
        UserName = 'Shape45'
        Brush.Color = clSilver
        mmHeight = 6615
        mmLeft = 529
        mmTop = 1852
        mmWidth = 284428
        BandType = 7
      end
      object ppLabel272: TppLabel
        UserName = 'Label1203'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 217753
        mmTop = 3704
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc66: TppDBCalc
        UserName = 'DBCalc59'
        DataField = 'DIFERENCA'
        DataPipeline = ppBDEAnunReceCon
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEAnunReceCon'
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 3440
        mmWidth = 33073
        BandType = 7
      end
    end
    object ppGroup26: TppGroup
      BreakName = 'DESCSEGMENTACAO'
      DataPipeline = ppBDEAnunReceCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group26'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunReceCon'
      object ppGroupHeaderBand24: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape64: TppShape
          UserName = 'Shape64'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 5027
          mmLeft = 529
          mmTop = 0
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText130: TppDBText
          UserName = 'DBText130'
          DataField = 'DESCSEGMENTACAO'
          DataPipeline = ppBDEAnunReceCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunReceCon'
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 76729
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand26: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup20: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = ppBDEAnunReceCon
      OutlineSettings.CreateNode = True
      UserName = 'Group17'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunReceCon'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape56: TppShape
          UserName = 'Shape56'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 5027
          mmLeft = 529
          mmTop = 0
          mmWidth = 284957
          BandType = 3
          GroupNo = 0
        end
        object ppDBText124: TppDBText
          UserName = 'DBText106'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = ppBDEAnunReceCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunReceCon'
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 529
          mmWidth = 76729
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand20: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel273: TppLabel
          UserName = 'Label213'
          Caption = 'Total Investimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 207698
          mmTop = 2646
          mmWidth = 25993
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc71: TppDBCalc
          UserName = 'DBCalc63'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunReceCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup20
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunReceCon'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 2381
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'Line501'
          Pen.Width = 0
          Weight = 0.25
          mmHeight = 529
          mmLeft = 198967
          mmTop = 0
          mmWidth = 86519
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup21: TppGroup
      BreakName = 'SIGLATIPOOPER'
      DataPipeline = ppBDEAnunReceCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunReceCon'
      object ppGroupHeaderBand19: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText125: TppDBText
          UserName = 'DBText125'
          DataField = 'SIGLATIPOOPER'
          DataPipeline = ppBDEAnunReceCon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAnunReceCon'
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 265
          mmWidth = 76729
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel274: TppLabel
          UserName = 'Label274'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 226484
          mmTop = 2381
          mmWidth = 7673
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc58: TppDBCalc
          UserName = 'DBCalc58'
          DataField = 'DIFERENCA'
          DataPipeline = ppBDEAnunReceCon
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup21
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEAnunReceCon'
          mmHeight = 3704
          mmLeft = 250032
          mmTop = 2117
          mmWidth = 33073
          BandType = 5
          GroupNo = 1
        end
        object ppLine50: TppLine
          UserName = 'Line50'
          Pen.Width = 0
          Weight = 0.25
          mmHeight = 529
          mmLeft = 198967
          mmTop = 0
          mmWidth = 86519
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup22: TppGroup
      BreakName = 'RECIDTIPOOPERACAO'
      DataPipeline = ppBDEAnunReceCon
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAnunReceCon'
      object ppGroupHeaderBand20: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand22: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
