inherited DmRelConsCartRenVar: TDmRelConsCartRenVar
  Left = 461
  Top = 205
  Width = 244
  Caption = 'DmRelConsCartRenVar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 155
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
    Left = 155
  end
  inherited qryExemplo: TwwQuery
    Left = 154
  end
  inherited rpExemplo: TppReport
    Left = 154
    DataPipelineName = 'pplExemplo'
  end
  object dtsConsCartRendVar: TwwDataSource
    DataSet = qryConsCartRendVar
    Left = 158
    Top = 111
  end
  object updConsCartRendVar: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  OBSERVACAO = :OBSERVACAO,'
      '  QTDTITULOS = :QTDTITULOS,'
      '  QTDE = :QTDE,'
      '  COTACAO = :COTACAO,'
      '  SALDOANTERIOR = :SALDOANTERIOR,'
      '  SALDO = :SALDO,'
      '  VARIACAO = :VARIACAO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (OBSERVACAO, QTDTITULOS, QTDE, COTACAO, SALDOANTERIOR, SALDO, '
      'VARIACAO)'
      'values'
      
        '  (:OBSERVACAO, :QTDTITULOS, :QTDE, :COTACAO, :SALDOANTERIOR, :S' +
        'ALDO, '
      ':VARIACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 46
    Top = 175
  end
  object ppBDEConsCartRendVar: TppBDEPipeline
    DataSource = dtsConsCartRendVar
    UserName = 'BDEConsCartRendVar'
    Left = 46
    Top = 55
    object ppBDEConsCartRendVarppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 22
      Position = 0
    end
    object ppBDEConsCartRendVarppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 1
    end
    object ppBDEConsCartRendVarppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 2
    end
    object ppBDEConsCartRendVarppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 3
    end
    object ppBDEConsCartRendVarppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CUSTOATUAL'
      FieldName = 'CUSTOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppBDEConsCartRendVarppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUCUSTO'
      FieldName = 'PUCUSTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 5
    end
    object ppBDEConsCartRendVarppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTACAO'
      FieldName = 'COTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 6
    end
    object ppBDEConsCartRendVarppField8: TppField
      FieldAlias = 'DATACOTACAO'
      FieldName = 'DATACOTACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 7
    end
    object ppBDEConsCartRendVarppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAOMES'
      FieldName = 'VARIACAOMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 8
    end
    object ppBDEConsCartRendVarppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAOCONTABIL'
      FieldName = 'VARIACAOCONTABIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 9
    end
    object ppBDEConsCartRendVarppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCOMPRA'
      FieldName = 'VALCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 10
    end
    object ppBDEConsCartRendVarppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALVENDAS'
      FieldName = 'VALVENDAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 11
    end
    object ppBDEConsCartRendVarppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDELOTE'
      FieldName = 'QTDELOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEConsCartRendVarppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECC'
      FieldName = 'QTDECC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 13
    end
    object ppBDEConsCartRendVarppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECCI'
      FieldName = 'QTDECCI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 14
    end
    object ppBDEConsCartRendVarppField16: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 50
      Position = 15
    end
    object ppBDEConsCartRendVarppField17: TppField
      FieldAlias = 'DATAMOVCARTINV'
      FieldName = 'DATAMOVCARTINV'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 16
    end
    object ppBDEConsCartRendVarppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVARIACAO'
      FieldName = 'SALDOVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 17
    end
    object ppBDEConsCartRendVarppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 18
    end
    object ppBDEConsCartRendVarppField20: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 1
      DisplayWidth = 9
      Position = 19
    end
    object ppBDEConsCartRendVarppField21: TppField
      FieldAlias = 'CODISIN'
      FieldName = 'CODISIN'
      FieldLength = 14
      DisplayWidth = 15
      Position = 20
    end
    object ppBDEConsCartRendVarppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTITULOS'
      FieldName = 'QTDTITULOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 21
    end
    object ppBDEConsCartRendVarppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEDIVERGENTE'
      FieldName = 'QTDEDIVERGENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 22
    end
    object ppBDEConsCartRendVarppField24: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 200
      DisplayWidth = 100
      Position = 23
    end
    object ppBDEConsCartRendVarppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECUSTODIANTE'
      FieldName = 'QTDECUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 24
    end
    object ppBDEConsCartRendVarppField26: TppField
      FieldAlias = 'SIGLAEMISSOR'
      FieldName = 'SIGLAEMISSOR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 25
    end
    object ppBDEConsCartRendVarppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppBDEConsCartRendVarppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppBDEConsCartRendVarppField29: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 28
    end
    object ppBDEConsCartRendVarppField30: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppBDEConsCartRendVarppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONCILIACUSTODIA'
      FieldName = 'IDCONCILIACUSTODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppBDEConsCartRendVarppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDO'
      FieldName = 'TOTALSALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object ppBDEConsCartRendVarppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSALDOANT'
      FieldName = 'TOTALSALDOANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppBDEConsCartRendVarppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEANTERIOR'
      FieldName = 'QTDEANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object ppBDEConsCartRendVarppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEMISSOR'
      FieldName = 'IDEMISSOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object ppBDEConsCartRendVarppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCC'
      FieldName = 'TOTALCC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object ppBDEConsCartRendVarppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCCI'
      FieldName = 'TOTALCCI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object ppBDEConsCartRendVarppField38: TppField
      FieldAlias = 'SIGLAACAOBOLSA'
      FieldName = 'SIGLAACAOBOLSA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
  end
  object RpConsCartRendVar: TppReport
    AutoStop = False
    DataPipeline = ppBDEConsCartRendVar
    OnStartPage = RpConsCartRendVarStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Posição Carteira de Renda Variável'
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
    Left = 46
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEConsCartRendVar'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText4'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = ppBDEConsCartRendVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 9260
        mmWidth = 161396
        BandType = 0
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        Caption = 'Consulta de Carteira de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8730
        mmWidth = 66146
        BandType = 0
      end
      object ppLabel219: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
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
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo1'
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
      object ppLData: TppLabel
        UserName = 'LData'
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
      object RpConsCartRendVarShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 10054
        mmLeft = 0
        mmTop = 19314
        mmWidth = 284428
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 21167
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'ppLabel108'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 83873
        mmTop = 25400
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'ppLabel1104'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 100277
        mmTop = 25400
        mmWidth = 11113
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 29104
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'ppLabel112'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 163513
        mmTop = 21431
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label2'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 64029
        mmTop = 25400
        mmWidth = 16933
        BandType = 0
      end
      object RpConsCartRendVarLabel3: TppLabel
        UserName = 'RpConsCartRendVarLabel3'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 143934
        mmTop = 21960
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel277: TppLabel
        UserName = 'Label277'
        Caption = 'Compras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 25665
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel278: TppLabel
        UserName = 'Label278'
        Caption = 'Vendas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 207434
        mmTop = 25665
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Data da Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 111919
        mmTop = 21960
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Variação Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 227807
        mmTop = 21431
        mmWidth = 12965
        BandType = 0
      end
      object RpConsCartRendVarLabel2: TppLabel
        UserName = 'RpConsCartRendVarLabel2'
        Caption = 'Variação Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 249503
        mmTop = 21431
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel279: TppLabel
        UserName = 'Label279'
        Caption = 'Custo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 273315
        mmTop = 21431
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCCARTINVEST'
        DataPipeline = ppBDEConsCartRendVar
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 14023
        mmWidth = 147373
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label6'
        Caption = 'Cód. BOVESPA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 41804
        mmTop = 20902
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label7'
        Caption = 'Cód. ISIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 77258
        mmTop = 20902
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'Shape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 8731
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEConsCartRendVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText501'
        DataField = 'QTDELOTE'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 82550
        mmTop = 4763
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText2'
        DataField = 'COTACAO'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 91017
        mmTop = 4763
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        DataField = 'SALDOANTERIOR'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 4763
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText3'
        DataField = 'QTDE'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 60061
        mmTop = 4763
        mmWidth = 20902
        BandType = 4
      end
      object RpConsCartRendVarDBText2: TppDBText
        UserName = 'RpConsCartRendVarDBText2'
        DataField = 'SALDO'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 4763
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText136: TppDBText
        UserName = 'DBText136'
        DataField = 'VALCOMPRA'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '####,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 4763
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText145: TppDBText
        UserName = 'DBText145'
        DataField = 'VALVENDAS'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '####,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 197644
        mmTop = 4763
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DATACOTACAO'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 4763
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VARIACAOMES'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '####,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 4763
        mmWidth = 22754
        BandType = 4
      end
      object RpConsCartRendVarDBText1: TppDBText
        UserName = 'RpConsCartRendVarDBText1'
        DataField = 'VARIACAOCONTABIL'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 4763
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText146: TppDBText
        UserName = 'DBText146'
        DataField = 'CUSTOATUAL'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '####,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 261938
        mmTop = 4763
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText6'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = ppBDEConsCartRendVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText7'
        DataField = 'CODISIN'
        DataPipeline = ppBDEConsCartRendVar
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 3704
        mmLeft = 61648
        mmTop = 265
        mmWidth = 28310
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine44: TppLine
        UserName = 'ppLine44'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel117: TppLabel
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
      object ppCalc29: TppSystemVariable
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
        mmWidth = 283898
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256911
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpRodPlano1'
        ParentWidth = True
        Pen.Style = psInsideFrame
        mmHeight = 4233
        mmLeft = 0
        mmTop = 6615
        mmWidth = 284300
        BandType = 7
      end
      object ppLine45: TppLine
        UserName = 'ppLine45'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 4498
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'ppDBCalc5'
        DataField = 'SALDOANTERIOR'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 143934
        mmTop = 7408
        mmWidth = 22754
        BandType = 7
      end
      object ppLabel118: TppLabel
        UserName = 'ppLabel118'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3969
        mmTop = 7144
        mmWidth = 19812
        BandType = 7
      end
      object RpConsCartRendVarDBCalc1: TppDBCalc
        UserName = 'RpConsCartRendVarDBCalc1'
        DataField = 'VARIACAOCONTABIL'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 236803
        mmTop = 7408
        mmWidth = 19844
        BandType = 7
      end
      object RpConsCartRendVarDBCalc2: TppDBCalc
        UserName = 'RpConsCartRendVarDBCalc2'
        DataField = 'SALDO'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 119856
        mmTop = 7408
        mmWidth = 22754
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc16'
        DataField = 'VALCOMPRA'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 166952
        mmTop = 7408
        mmWidth = 22754
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VALVENDAS'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 190236
        mmTop = 7408
        mmWidth = 22754
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CUSTOATUAL'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 257176
        mmTop = 7408
        mmWidth = 25929
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VARIACAOMES'
        DataPipeline = ppBDEConsCartRendVar
        DisplayFormat = '####,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsCartRendVar'
        mmHeight = 2921
        mmLeft = 213519
        mmTop = 7408
        mmWidth = 22754
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppBDEConsCartRendVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsCartRendVar'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object shpRodPlano: TppShape
          UserName = 'shpRodPlano'
          ParentWidth = True
          Pen.Style = psInsideFrame
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label4'
          Caption = 'Total do Plano / Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 3969
          mmTop = 794
          mmWidth = 41021
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'SALDO'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 129646
          mmTop = 1058
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'SALDOANTERIOR'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 153459
          mmTop = 1058
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VALCOMPRA'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 177271
          mmTop = 1058
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'VALVENDAS'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 197644
          mmTop = 1058
          mmWidth = 19579
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VARIACAOMES'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '####,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 218017
          mmTop = 1058
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VARIACAOCONTABIL'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 241300
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'CUSTOATUAL'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 261938
          mmTop = 1058
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = ppBDEConsCartRendVar
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsCartRendVar'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object shpRodCart: TppShape
          UserName = 'shpRodCart'
          ParentWidth = True
          Pen.Style = psInsideFrame
          mmHeight = 4498
          mmLeft = 0
          mmTop = 264
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label5'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 3969
          mmTop = 794
          mmWidth = 22310
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'SALDO'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 129646
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'SALDOANTERIOR'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 153459
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'VALCOMPRA'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 177271
          mmTop = 1323
          mmWidth = 19579
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'VALVENDAS'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 197644
          mmTop = 1323
          mmWidth = 19579
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VARIACAOMES'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '####,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 218017
          mmTop = 1323
          mmWidth = 22754
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'VARIACAOCONTABIL'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2921
          mmLeft = 241300
          mmTop = 1323
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'CUSTOATUAL'
          DataPipeline = ppBDEConsCartRendVar
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEConsCartRendVar'
          mmHeight = 2910
          mmLeft = 261938
          mmTop = 1323
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryConsCartRendVar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  ('#39'Plano / Patrocinadora: '#39' || PP.PLANPRVCONTABPATRO) AS PLANPR' +
        'VCONTABPATRO,'
      '  EM.SIGLAEMISSOR,'
      
        '  DECODE(NULL, NULL, CA.DESCCARTINVEST, CG.DESCCARTGERENC) AS DE' +
        'SCCARTINVEST,'
      '  IV.DESCINVESTIMENTO, '
      '  H1.IDCARTEIRAINVEST,'
      '  H1.IDINVESTIMENTO, AB2.SIGLAACAOBOLSA,'
      '  IV.CODISIN, IV.IDEMISSOR, H1.IDLOTE,'
      '  AB.QTDELOTE,'
      '  (0) AS QTDEDIVERGENTE,'
      '  (0) AS QTDECUSTODIANTE,'
      '  (0) AS QTDTITULOS,'
      '  '#39' '#39' AS OBSERVACAO,'
      '  (0) AS IDCONCILIACUSTODIA,'
      '  NVL(H1.SALDOQTDECPMF,0) AS QTDECC,'
      
        '  (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS QTDE' +
        'CCI,'
      '  NVL(H1.SALDOQTDEINVCART,0) AS QTDE,'
      '  NVL(H1.SALDOVARIACAO,0) AS SALDOVARIACAO,'
      '  COTACAOINVEST.COTACAO,'
      '  COTACAOINVEST.DATACOTACAO,'
      '  H1.DATAMOVCARTINV,'
      '  H1.SALDOVLRINVCART AS SALDO,'
      '  SALDOANTERIOR.SALDOQTDEINVCART AS QTDEANTERIOR,'
      '  SALDOANTERIOR.SALDOVLRINVCART AS SALDOANTERIOR,'
      
        '  (H1.SALDOVLRINVCART - SALDOANTERIOR.SALDOVLRINVCART) AS VARIAC' +
        'AO,'
      '  NVL(COMPRAS.VALOPER,0) AS VALCOMPRA,'
      '  NVL(VENDAS.VALOPER,0)  AS VALVENDAS,'
      
        '  (((H1.SALDOVLRINVCART - SALDOANTERIOR.SALDOVLRINVCART) - NVL(V' +
        'ENDAS.VALOPER,0)) - NVL(COMPRAS.VALOPER,0)) AS VARIACAOCONTABIL,'
      '  ROUND((H1.SALDOAQUI),2) AS CUSTOATUAL,'
      '  (H1.SALDOVLRINVCART-H1.SALDOAQUI) AS VARIACAOMES,'
      '  '#39' '#39' AS STATUS,'
      '  SALDOTOTALANT.TOTALSALDO AS TOTALSALDOANT,'
      '  SALDOTOTAL.TOTALSALDO,'
      '  SALDOTOTAL.TOTALCC,'
      '  SALDOTOTAL.TOTALCCI,'
      '  ROUND(H1.SALDOAQUI / NVL(H1.SALDOQTDEINVCART,0),8) AS PUCUSTO'
      'FROM'
      '   HISTCARTINV H1,'
      
        '   INVESTIMENTO IV, ACOESXBOLSA AB, EMISSOR EM, CARTEIRAINVEST C' +
        'A, CARTEIRAGERENC CG, VWPLANPREVCTBPATR PP,'
      ''
      
        '   (SELECT H1.IDHISTCARTINV, H1.IDPLANPREVCTBPATR, H1.IDCARTEIRA' +
        'INVEST, H1.DATAMOVCARTINV, H1.IDINVESTIMENTO,'
      
        '           H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV, H1.SALDOQTD' +
        'EINVCART, H1.SALDOVLRINVCART,'
      
        '           H1.SALDOATU, H1.SALDOCAR, H1.SALDOAQUI, H1.SALDOREND,' +
        ' H1.SALDOVARIACAO, H1.SALDOJUROS,'
      
        '           H1.SALDOPREMIO, H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SAL' +
        'DOIOFPROV, H1.SALDOIOFAPU, H1.SALDOAGIO'
      '    FROM HISTCARTINV H1'
      '    WHERE (H1.IDHISTCARTINV IN'
      '              (SELECT MAX(H2.IDHISTCARTINV)'
      '               FROM  HISTCARTINV H2'
      '               WHERE (H2.IDTIPOINVEST = 2)'
      
        '                 AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLAN' +
        'PREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                 AND ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTE' +
        'IRAINVEST = :IDCARTEIRAINVEST))'
      
        '                 AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (H2.I' +
        'DCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      
        '                      ((:IDCARTEIRAGERENC IS NULL)     AND (H2.I' +
        'DCARTEIRAGERENC IS NULL) ) )'
      
        '                 AND (H2.DATAMOVCARTINV = TO_DATE(:DATAANTERIOR,' +
        #39'DD/MM/YYYY'#39'))'
      
        '               GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H' +
        '2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC, H2.IDINVESTIMENTO) )'
      '      AND (SALDOVLRINVCART IS NOT NULL ) ) SALDOANTERIOR,'
      ''
      
        '   (SELECT HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, HC.IDINVES' +
        'TIMENTO, SUM(HC.VLRMOVCARTINV) AS VALOPER'
      '    FROM HISTCARTINV HC'
      '    WHERE (HC.IDTIPOINVEST = 2)'
      '      AND (HC.IDPLANPREVCTBPATR > 0)'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR))'
      
        '      AND ((:IDCARTEIRAINVEST IS NULL) OR (HC.IDCARTEIRAINVEST =' +
        ' :IDCARTEIRAINVEST))'
      
        '      AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (HC.IDCARTEIRAGE' +
        'RENC = :IDCARTEIRAGERENC)) OR'
      
        '           ((:IDCARTEIRAGERENC IS NULL)     AND (HC.IDCARTEIRAGE' +
        'RENC IS NULL)) )'
      '      AND HC.DATAMOVCARTINV   = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      '      AND HC.NATURMOVCARTINV IN ('#39'A'#39','#39'M'#39','#39'U'#39','#39'V'#39')'
      
        '    GROUP BY HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIR' +
        'AINVEST, HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO) COMPRAS,'
      ''
      
        '   (SELECT HV.IDPLANPREVCTBPATR, HV.IDCARTEIRAINVEST, HV.IDINVES' +
        'TIMENTO, SUM(HV.VLRMOVCARTINV) AS VALOPER'
      '    FROM HISTCARTINV HV'
      '    WHERE (HV.IDTIPOINVEST = 2)'
      
        '      AND ((:IDPLANPREVCTBPATR IS NULL) OR (HV.IDPLANPREVCTBPATR' +
        ' = :IDPLANPREVCTBPATR))'
      
        '      AND ((:IDCARTEIRAINVEST IS NULL) OR (HV.IDCARTEIRAINVEST =' +
        ' :IDCARTEIRAINVEST))'
      
        '      AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (HV.IDCARTEIRAGE' +
        'RENC = :IDCARTEIRAGERENC)) OR'
      
        '           ((:IDCARTEIRAGERENC IS NULL)     AND (HV.IDCARTEIRAGE' +
        'RENC IS NULL)) )'
      '      AND HV.DATAMOVCARTINV   = TO_DATE(:DATAATUAL,'#39'DD/MM/YYYY'#39')'
      '      AND HV.NATURMOVCARTINV  IN ('#39'D'#39','#39'I'#39','#39'O'#39','#39'S'#39')'
      
        '    GROUP BY HV.IDTIPOINVEST, HV.IDPLANPREVCTBPATR, HV.IDCARTEIR' +
        'AINVEST, HV.IDCARTEIRAGERENC, HV.IDINVESTIMENTO) VENDAS,'
      ''
      '   (SELECT SUM(NVL(TOTAL.SALDO,0)) AS TOTALSALDO,'
      '           SUM(NVL(TOTAL.QTDECC,0)) AS TOTALCC,'
      '           SUM(NVL(TOTAL.QTDECCI,0)) AS TOTALCCI'
      
        '    FROM (SELECT DISTINCT EM.SIGLAEMISSOR, H1.IDCARTEIRAINVEST, ' +
        'H1.IDINVESTIMENTO,'
      
        '                 DECODE(:IDCARTEIRAGERENC, NULL, CA.DESCCARTINVE' +
        'ST, CG.DESCCARTGERENC) AS DESCCARTINVEST,'
      
        '                 IV.DESCINVESTIMENTO, IV.CODISIN, H1.IDLOTE, AB.' +
        'QTDELOTE, (0) AS QTDEDIVERGENTE,'
      
        '                 (0) AS QTDECUSTODIANTE, (0) AS QTDTITULOS, '#39' '#39' ' +
        'AS OBSERVACAO, (0) AS IDCONCILIACUSTODIA,'
      
        '                 NVL(H1.SALDOQTDECPMF,0) AS QTDECC, (NVL(H1.SALD' +
        'OQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS QTDECCI,'
      '                 NVL(H1.SALDOQTDEINVCART,0) AS QTDE,'
      
        '                 (H1.SALDOVLRINVCART/DECODE(NVL(H1.SALDOQTDEINVC' +
        'ART,0),0,1,H1.SALDOQTDEINVCART)) AS COTACAO,'
      '                 H1.SALDOVLRINVCART AS SALDO'
      
        '          FROM  HISTCARTINV H1, INVESTIMENTO IV, ACOESXBOLSA AB,' +
        ' EMISSOR EM, CARTEIRAINVEST CA, CARTEIRAGERENC CG'
      '          WHERE (H1.IDHISTCARTINV  IN'
      '                    (SELECT MAX(H2.IDHISTCARTINV)'
      '                     FROM HISTCARTINV H2'
      '                     WHERE (H2.IDTIPOINVEST = 2)'
      
        '                       AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.' +
        'IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                       AND  ((:IDCARTEIRAINVEST IS NULL) OR (H2.' +
        'IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                       AND (((:IDCARTEIRAGERENC IS NOT NULL) AND' +
        ' (H2.IDCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      
        '                            ((:IDCARTEIRAGERENC IS NULL)     AND' +
        ' (H2.IDCARTEIRAGERENC IS NULL)) )'
      
        '                       AND(H2.DATAMOVCARTINV   = TO_DATE(:DATAAT' +
        'UAL,'#39'DD/MM/YYYY'#39'))'
      
        '                     GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBP' +
        'ATR, H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC, H2.IDINVESTIMENTO' +
        '))'
      
        '            AND ((:IDEMISSOR IS NULL) OR (EM.IDEMISSOR = :IDEMIS' +
        'SOR))'
      '            AND (NVL(H1.SALDOQTDEINVCART,0) <> 0)'
      '            AND (IV.IDTIPOINVEST          = H1.IDTIPOINVEST)'
      '            AND (IV.IDINVESTIMENTO        = H1.IDINVESTIMENTO)'
      '            AND (EM.IDEMISSOR(+)          = IV.IDEMISSOR)'
      '            AND (CA.IDCARTEIRAINVEST(+)   = H1.IDCARTEIRAINVEST)'
      
        '            AND (CG.IDCARTEIRAGERENC(+)   = H1.IDCARTEIRAGERENC ' +
        ')'
      
        '            AND (AB.IDACAO(+)             = H1.IDINVESTIMENTO)) ' +
        'TOTAL) SALDOTOTAL,'
      ''
      '   (SELECT SUM(NVL(TOTAL.SALDO,0)) AS TOTALSALDO'
      
        '    FROM (SELECT DISTINCT EM.SIGLAEMISSOR, H1.IDCARTEIRAINVEST, ' +
        'H1.IDINVESTIMENTO,'
      
        '                 DECODE(:IDCARTEIRAGERENC, NULL, CA.DESCCARTINVE' +
        'ST, CG.DESCCARTGERENC) AS DESCCARTINVEST,'
      
        '                 IV.DESCINVESTIMENTO, IV.CODISIN, H1.IDLOTE, AB.' +
        'QTDELOTE,'
      
        '                 (0) AS QTDEDIVERGENTE, (0) AS QTDECUSTODIANTE, ' +
        '(0) AS QTDTITULOS, '#39' '#39' AS OBSERVACAO,'
      
        '                 (0) AS IDCONCILIACUSTODIA, NVL(H1.SALDOQTDEINVC' +
        'ART,0) AS QTDE,'
      
        '                 (H1.SALDOVLRINVCART/DECODE(NVL(H1.SALDOQTDEINVC' +
        'ART,0),0,1,H1.SALDOQTDEINVCART)) AS COTACAO,'
      '                 H1.SALDOVLRINVCART AS SALDO'
      
        '          FROM HISTCARTINV H1, INVESTIMENTO IV, ACOESXBOLSA AB, ' +
        'EMISSOR EM, CARTEIRAINVEST CA,'
      '               CARTEIRAGERENC CG'
      '          WHERE (H1.IDHISTCARTINV  IN'
      '                    (SELECT MAX(H2.IDHISTCARTINV)'
      '                     FROM HISTCARTINV H2'
      '                     WHERE (H2.IDTIPOINVEST = 2)'
      
        '                       AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.' +
        'IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                       AND ((:IDCARTEIRAINVEST IS NULL) OR (H2.I' +
        'DCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                       AND (((:IDCARTEIRAGERENC IS NOT NULL) AND' +
        ' (H2.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                            ((:IDCARTEIRAGERENC IS NULL)     AND' +
        ' (H2.IDCARTEIRAGERENC IS NULL)) )'
      
        '                       AND (H2.DATAMOVCARTINV   = TO_DATE(:DATAA' +
        'NTERIOR,'#39'DD/MM/YYYY'#39'))'
      
        '                     GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBP' +
        'ATR, H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC, H2.IDINVESTIMENTO' +
        '))'
      
        '            AND ((:IDEMISSOR IS NULL) OR (EM.IDEMISSOR = :IDEMIS' +
        'SOR))'
      '            AND (NVL(H1.SALDOQTDEINVCART,0) <> 0)'
      '            AND (IV.IDTIPOINVEST          = H1.IDTIPOINVEST)'
      '            AND (IV.IDINVESTIMENTO        = H1.IDINVESTIMENTO)'
      '            AND (IV.IDEMISSOR             = EM.IDEMISSOR(+))'
      '            AND (CA.IDCARTEIRAINVEST(+)   = H1.IDCARTEIRAINVEST)'
      '            AND (CG.IDCARTEIRAGERENC(+)   = H1.IDCARTEIRAGERENC)'
      
        '            AND (AB.IDACAO(+)             = H1.IDINVESTIMENTO)  ' +
        ') TOTAL) SALDOTOTALANT,'
      ''
      '   (SELECT DATACOTACAO,'
      
        '           DECODE(NVL(QTDTITLOTE,0),0,VLRCONTABIL,(VLRCONTABIL/Q' +
        'TDTITLOTE)) AS COTACAO,'
      '           IDINVESTIMENTO'
      '    FROM   COTACAOINVEST'
      '    WHERE (IDINVESTIMENTO || DATACOTACAO) IN'
      '                  (SELECT (IDINVESTIMENTO || MAX(DATACOTACAO))'
      '                   FROM   COTACAOINVEST'
      
        '                   WHERE (DATACOTACAO <= TO_DATE(:DATAATUAL,'#39'DD/' +
        'MM/YYYY'#39'))'
      '                   GROUP BY IDINVESTIMENTO)) COTACAOINVEST,'
      ''
      '   (SELECT IDACAO, SIGLAACAOBOLSA'
      '    FROM ACOESXBOLSA A, PARAMINVEST P'
      '    WHERE A.IDBOLSAVALORES = P.IDBVSP) AB2'
      ''
      'WHERE (H1.IDHISTCARTINV  IN'
      '          (SELECT MAX(H2.IDHISTCARTINV)'
      '           FROM HISTCARTINV H2'
      '           WHERE (H2.IDTIPOINVEST = 2)'
      
        '             AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      
        '             AND ((:IDCARTEIRAINVEST IS NULL) OR (H2.IDCARTEIRAI' +
        'NVEST = :IDCARTEIRAINVEST))'
      
        '             AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (H2.IDCAR' +
        'TEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                  ((:IDCARTEIRAGERENC IS NULL)     AND (H2.IDCAR' +
        'TEIRAGERENC IS NULL) ) )'
      
        '             AND (H2.DATAMOVCARTINV  = TO_DATE(:DATAATUAL,'#39'DD/MM' +
        '/YYYY'#39'))'
      
        '           GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.ID' +
        'CARTEIRAINVEST, H2.IDCARTEIRAGERENC, H2.IDINVESTIMENTO))'
      '  AND ((:IDEMISSOR IS NULL) OR (EM.IDEMISSOR = :IDEMISSOR))'
      '  AND (NVL(H1.SALDOQTDEINVCART,0)     <> 0)'
      '  AND (IV.IDTIPOINVEST                 = H1.IDTIPOINVEST)'
      '  AND (IV.IDINVESTIMENTO               = H1.IDINVESTIMENTO)'
      '  AND (EM.IDEMISSOR(+)                 = IV.IDEMISSOR)'
      '  AND (CA.IDCARTEIRAINVEST(+)          = H1.IDCARTEIRAINVEST)'
      '  AND (CG.IDCARTEIRAGERENC(+)          = H1.IDCARTEIRAGERENC)'
      '  AND (AB2.IDACAO(+)                   = H1.IDINVESTIMENTO)'
      '  AND (AB.IDACAO(+)                    = H1.IDINVESTIMENTO)'
      '  AND (PP.IDPLANPREVCTBPATR(+)         = H1.IDPLANPREVCTBPATR)'
      '  AND (SALDOANTERIOR.IDINVESTIMENTO(+)    = H1.IDINVESTIMENTO)'
      '  AND (SALDOANTERIOR.IDCARTEIRAINVEST(+)  = H1.IDCARTEIRAINVEST)'
      
        '  AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+) = H1.IDPLANPREVCTBPATR' +
        ')'
      '  AND (COMPRAS.IDPLANPREVCTBPATR(+)    = H1.IDPLANPREVCTBPATR)'
      '  AND (COMPRAS.IDCARTEIRAINVEST(+)     = H1.IDCARTEIRAINVEST)'
      '  AND (COMPRAS.IDINVESTIMENTO(+)       = H1.IDINVESTIMENTO)'
      '  AND (VENDAS.IDPLANPREVCTBPATR(+)     = H1.IDPLANPREVCTBPATR)'
      '  AND (VENDAS.IDCARTEIRAINVEST(+)      = H1.IDCARTEIRAINVEST)'
      '  AND (VENDAS.IDINVESTIMENTO(+)        = H1.IDINVESTIMENTO)'
      '  AND (COTACAOINVEST.IDINVESTIMENTO(+) = H1.IDINVESTIMENTO)'
      'ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, IV.DESCINVESTIMENTO'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updConsCartRendVar
    ControlType.Strings = (
      'STATUS;CheckBox;S;N')
    ValidateWithMask = True
    Left = 46
    Top = 111
    ParamData = <
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANTERIOR'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
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
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANTERIOR'
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
        DataType = ftString
        Name = 'DATAATUAL'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATUAL'
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
      end>
    object qryConsCartRendVarDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 22
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryConsCartRendVarQTDE: TFloatField
      DisplayLabel = 'Quantidade~ Atual'
      DisplayWidth = 15
      FieldName = 'QTDE'
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarSALDO: TFloatField
      DisplayLabel = 'Saldo Atual'
      DisplayWidth = 18
      FieldName = 'SALDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarSALDOANTERIOR: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANTERIOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarCUSTOATUAL: TFloatField
      DisplayLabel = 'Custo Atual'
      DisplayWidth = 15
      FieldName = 'CUSTOATUAL'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarPUCUSTO: TFloatField
      DisplayLabel = 'PU Custo'
      DisplayWidth = 14
      FieldName = 'PUCUSTO'
    end
    object qryConsCartRendVarCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 16
      FieldName = 'COTACAO'
      DisplayFormat = '###,###,##0.000000000'
    end
    object qryConsCartRendVarDATACOTACAO: TDateTimeField
      DisplayLabel = 'Data da~Cotação'
      DisplayWidth = 10
      FieldName = 'DATACOTACAO'
    end
    object qryConsCartRendVarVARIACAOMES: TFloatField
      DisplayLabel = 'Variação Atual'
      DisplayWidth = 15
      FieldName = 'VARIACAOMES'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarVARIACAOCONTABIL: TFloatField
      DisplayLabel = 'Variação Dia'
      DisplayWidth = 12
      FieldName = 'VARIACAOCONTABIL'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarVALCOMPRA: TFloatField
      DisplayLabel = 'Compras'
      DisplayWidth = 15
      FieldName = 'VALCOMPRA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarVALVENDAS: TFloatField
      DisplayLabel = 'Vendas'
      DisplayWidth = 15
      FieldName = 'VALVENDAS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object q: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'QTDELOTE'
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarQTDECC: TFloatField
      DisplayLabel = 'Quantidade~Antiga'
      DisplayWidth = 15
      FieldName = 'QTDECC'
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarQTDECCI: TFloatField
      DisplayLabel = 'Quantidade~Nova'
      DisplayWidth = 15
      FieldName = 'QTDECCI'
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 50
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryConsCartRendVarDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data da~Cotação'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Visible = False
    end
    object qryConsCartRendVarSALDOVARIACAO: TFloatField
      DisplayLabel = 'Saldo de Variação'
      DisplayWidth = 16
      FieldName = 'SALDOVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarVARIACAO: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 16
      FieldName = 'VARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsCartRendVarSTATUS: TStringField
      DisplayLabel = 'Divergente'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryConsCartRendVarCODISIN: TStringField
      DisplayLabel = 'Código ISIN'
      DisplayWidth = 15
      FieldName = 'CODISIN'
      Visible = False
      FixedChar = True
      Size = 14
    end
    object qryConsCartRendVarQTDTITULOS: TFloatField
      DisplayLabel = 'Quantidade~ de Conciliação'
      DisplayWidth = 17
      FieldName = 'QTDTITULOS'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarQTDEDIVERGENTE: TFloatField
      DisplayLabel = 'Quantidade~ de Divergência'
      DisplayWidth = 17
      FieldName = 'QTDEDIVERGENTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 100
      FieldName = 'OBSERVACAO'
      Visible = False
      FixedChar = True
      Size = 200
    end
    object qryConsCartRendVarQTDECUSTODIANTE: TFloatField
      DisplayLabel = 'Quantidade~ de Conciliação'
      DisplayWidth = 20
      FieldName = 'QTDECUSTODIANTE'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarSIGLAEMISSOR: TStringField
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object qryConsCartRendVarIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryConsCartRendVarIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryConsCartRendVarDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object qryConsCartRendVarIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryConsCartRendVarIDCONCILIACUSTODIA: TFloatField
      FieldName = 'IDCONCILIACUSTODIA'
      Visible = False
    end
    object qryConsCartRendVarTOTALSALDO: TFloatField
      FieldName = 'TOTALSALDO'
      Visible = False
    end
    object qryConsCartRendVarTOTALSALDOANT: TFloatField
      FieldName = 'TOTALSALDOANT'
      Visible = False
    end
    object qryConsCartRendVarQTDEANTERIOR: TFloatField
      FieldName = 'QTDEANTERIOR'
      Visible = False
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryConsCartRendVarIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryConsCartRendVarTOTALCC: TFloatField
      FieldName = 'TOTALCC'
      Visible = False
    end
    object qryConsCartRendVarTOTALCCI: TFloatField
      FieldName = 'TOTALCCI'
      Visible = False
    end
    object qryConsCartRendVarSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Visible = False
      Size = 10
    end
  end
end
