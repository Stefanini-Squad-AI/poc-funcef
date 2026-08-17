inherited DMRelBoletaRenFixOper: TDMRelBoletaRenFixOper
  Left = 328
  Top = 203
  Caption = 'DMRelBoletaRenFixOper'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
    Left = 103
  end
  inherited qryExemplo: TwwQuery
    Left = 50
  end
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object pplBoletaRenFix: TppBDEPipeline
    DataSource = dsBoletaOper
    UserName = 'lBoletaRenFix'
    Left = 164
    Top = 88
    object pplBoletaRenFixppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 136
      DisplayWidth = 136
      Position = 0
    end
    object pplBoletaRenFixppField2: TppField
      FieldAlias = 'PLANPATRO'
      FieldName = 'PLANPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 1
    end
    object pplBoletaRenFixppField3: TppField
      FieldAlias = 'SIGLAEMISSOR'
      FieldName = 'SIGLAEMISSOR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object pplBoletaRenFixppField4: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplBoletaRenFixppField5: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplBoletaRenFixppField6: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplBoletaRenFixppField7: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplBoletaRenFixppField8: TppField
      FieldAlias = 'VENCOPERACAO'
      FieldName = 'VENCOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplBoletaRenFixppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUEMISSAO'
      FieldName = 'PUEMISSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplBoletaRenFixppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplBoletaRenFixppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplBoletaRenFixppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplBoletaRenFixppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERRENFIX'
      FieldName = 'IDOPERRENFIX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplBoletaRenFixppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplBoletaRenFixppField15: TppField
      FieldAlias = 'FLGNEGOCIACAO'
      FieldName = 'FLGNEGOCIACAO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 14
    end
    object pplBoletaRenFixppField16: TppField
      FieldAlias = 'NOMECLASSRISCO'
      FieldName = 'NOMECLASSRISCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object pplBoletaRenFixppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDCARTHIPO'
      FieldName = 'QTDCARTHIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplBoletaRenFixppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCARTHIPO'
      FieldName = 'VALCARTHIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplBoletaRenFixppField19: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object pplBoletaRenFixppField20: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplBoletaRenFixppField21: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 20
    end
    object pplBoletaRenFixppField22: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 21
    end
    object pplBoletaRenFixppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIAS'
      FieldName = 'DIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object rptBoletaRenFix: TppReport
    AutoStop = False
    DataPipeline = pplBoletaRenFix
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Renda Fixa'
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
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplBoletaRenFix'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Boleta de Operação de Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 57944
        BandType = 0
      end
      object lblNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 1323
        mmWidth = 24342
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
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object pplblDataOperacao: TppLabel
        UserName = 'lblPrazo1'
        Caption = 'Data Operação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 15346
        mmWidth = 24342
        BandType = 0
      end
      object ppdbDataOperacao: TppDBText
        UserName = 'dbDataOperacao'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 51329
        mmTop = 15346
        mmWidth = 17198
        BandType = 0
      end
      object pplblDataLiquidacao: TppLabel
        UserName = 'lblDataLiquidacao'
        Caption = 'Data Liquidação :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74348
        mmTop = 15346
        mmWidth = 26458
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 2117
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197115
        BandType = 0
      end
      object pplblBoleta: TppLabel
        UserName = 'Label3'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 21167
        mmWidth = 9790
        BandType = 0
      end
      object ppdbBoleta: TppDBText
        UserName = 'dbBoleta'
        DataField = 'BOLETA'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 37042
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object ppdbDtaLiq: TppDBText
        UserName = 'dbDataOperacao1'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 15346
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppbBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 41804
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Observação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 16933
        mmWidth = 16140
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197115
        BandType = 4
      end
      object pplblQuantidade: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 5821
        mmWidth = 15610
        BandType = 4
      end
      object pplblValor: TppLabel
        UserName = 'Label5'
        Caption = 'Valor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 7144
        BandType = 4
      end
      object ppdbQuantidade: TppDBText
        UserName = 'dbQuantidade'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###,###,###,###,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 5821
        mmWidth = 38364
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLROPERACAO'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 1058
        mmWidth = 38364
        BandType = 4
      end
      object pplblPrazo: TppLabel
        UserName = 'Label6'
        Caption = 'Prazo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 66940
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText101'
        DataField = 'VENCOPERACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 1058
        mmWidth = 34661
        BandType = 4
      end
      object pplblPuOperacao: TppLabel
        UserName = 'Label16'
        Caption = 'PU Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2117
        mmTop = 10583
        mmWidth = 17727
        BandType = 4
      end
      object ppdbPuOperacao: TppDBText
        UserName = 'dbPuOperacao'
        DataField = 'PUOPERACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 24341
        mmTop = 10583
        mmWidth = 38364
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = pplBoletaRenFix
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 19579
        mmLeft = 794
        mmTop = 20902
        mmWidth = 196586
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 529
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBPrazo: TppDBText
        UserName = 'ppDBPrazo'
        DataField = 'DIAS'
        DataPipeline = pplBoletaRenFix
        DisplayFormat = '###0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplBoletaRenFix'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 6085
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel7: TppLabel
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
        mmTop = 1323
        mmWidth = 196850
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
        mmTop = 1588
        mmWidth = 196850
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
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
        mmLeft = 258498
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable3'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'IDOPERRENFIX'
      DataPipeline = pplBoletaRenFix
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplBoletaRenFix'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 11906
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label1'
          Caption = 'Operação'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 6615
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object pplblTitulo: TppLabel
          UserName = 'Label2'
          Caption = 'Título'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescOperacao: TppDBText
          UserName = 'dbDescOperacao'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplBoletaRenFix
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplBoletaRenFix'
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 1852
          mmWidth = 70644
          BandType = 3
          GroupNo = 0
        end
        object ppdbDesInvestimento: TppDBText
          UserName = 'dbDesInvestimento'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplBoletaRenFix
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplBoletaRenFix'
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 6615
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescEmissor: TppDBText
          UserName = 'dbDescEmissor'
          DataField = 'SIGLAEMISSOR'
          DataPipeline = pplBoletaRenFix
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplBoletaRenFix'
          mmHeight = 3704
          mmLeft = 114036
          mmTop = 1852
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object ppdbDescCustodiante: TppDBText
          UserName = 'dbDescCustodiante'
          DataField = 'SGLCUSTODIANTE'
          DataPipeline = pplBoletaRenFix
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplBoletaRenFix'
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 6615
          mmWidth = 70645
          BandType = 3
          GroupNo = 0
        end
        object pplblEmissor: TppLabel
          UserName = 'Label7'
          Caption = 'Emissor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 91811
          mmTop = 1852
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object pplblCustodiante: TppLabel
          UserName = 'Label8'
          Caption = 'Custodiante'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 92075
          mmTop = 6615
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryBoletaOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   PP.PLANPRVCONTABPATRO, PP.PLANPATRO, EM.SIGLAEMISSOR, IV.DESC' +
        'INVESTIMENTO, AP.DATAOPERACAO AS DATAAPLICACAO,'
      
        '   OP.DATAOPERACAO, TP.DESCTIPOOPERACAO, OP.VENCOPERACAO, OP.PUE' +
        'MISSAO, OP.QTDEOPERACAO,'
      '   OP.PUOPERACAO, OP.VLROPERACAO, OP.IDOPERRENFIX, SLD.SALDO,'
      
        '   DECODE(OP.FLGNEGOCIACAO, '#39'S'#39', '#39'Sim'#39', DECODE(OP.FLGNEGOCIACAO,' +
        ' '#39'N'#39', '#39'Não'#39', '#39'Não definido'#39')) AS FLGNEGOCIACAO,'
      
        '   CR.NOMECLASSRISCO, OP.QTDCARTHIPO, (OP.PUOPERACAO * OP.QTDCAR' +
        'THIPO) AS VALCARTHIPO,'
      
        '   CT.SGLCUSTODIANTE, TP.NATUREZAOPERACAO, OP.OBSERVACAO, OP.BOL' +
        'ETA,'
      '  (AP.VENCOPERACAO - AP.DATAOPERACAO) AS DIAS'
      'FROM'
      
        '   OPERRENFIX OP, OPERRENFIX AP, INVESTIMENTO IV, TIPOOPERACAO T' +
        'P, CUSTODIANTE CT,'
      '   EMISSOR EM, CLASSRISCORENFIX CR,'
      '   (SELECT'
      
        '       PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || PL.NO' +
        'ME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO,'
      '       (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPATRO'
      
        '    FROM   PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '          (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      '   ) PP,'
      '   (SELECT'
      '       OP2.IDPLANPREVCTBPATR, EM2.IDEMISSOR, IV2.IDINVESTIMENTO,'
      '       SUM(DECODE(TP2.NATUREZAOPERACAO,'#39'A'#39',OP2.VLROPERACAO,'
      
        '                  DECODE(TP2.NATUREZAOPERACAO,'#39'D'#39',OP2.VLROPERACA' +
        'O*-1,0))) AS SALDO'
      
        '    FROM OPERRENFIX OP2, INVESTIMENTO IV2, TIPOOPERACAO TP2, EMI' +
        'SSOR EM2'
      '    WHERE'
      
        '       ((:IDOPERRENFIXAPLIC IS NULL)    OR (OP2.IDOPERRENFIXAPLI' +
        'C = :IDOPERRENFIXAPLIC)) AND'
      
        '       ((:IDPLANPREVCTBPATR IS NULL) OR (OP2.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR)) AND'
      
        '       ((:IDEMISSOR IS NULL)         OR (IV2.IDEMISSOR = :IDEMIS' +
        'SOR)) AND'
      
        '       ((:IDCLASSETIT IS NULL)       OR (IV2.IDCLASSETIT = :IDCL' +
        'ASSETIT)) AND'
      
        '       OP2.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      '       IV2.IDTIPOINVEST      = 1                 AND'
      '       TP2.IDTIPOINVEST      = 1                 AND'
      '       OP2.IDINVESTIMENTO = IV2.IDINVESTIMENTO   AND'
      '       OP2.IDTIPOOPERACAO = TP2.IDTIPOOPERACAO   AND'
      '       IV2.IDEMISSOR = EM2.IDEMISSOR'
      
        '    GROUP BY OP2.IDPLANPREVCTBPATR, EM2.IDEMISSOR, IV2.IDINVESTI' +
        'MENTO'
      '   ) SLD'
      'WHERE'
      
        '   ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR)) AND'
      
        '   ((:IDOPERRENFIXAPLIC IS NULL)    OR (OP.IDOPERRENFIXAPLIC = :' +
        'IDOPERRENFIXAPLIC)) AND'
      
        '   ((:IDEMISSOR IS NULL)         OR (IV.IDEMISSOR = :IDEMISSOR))' +
        ' AND'
      
        '   ((:IDCLASSETIT IS NULL)       OR (IV.IDCLASSETIT = :IDCLASSET' +
        'IT)) AND'
      
        '   OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '   AND IV.IDTIPOINVEST = 1'
      '   AND OP.IDCLASSRISCORENFIX = CR.IDCLASSRISCORENFIX(+)'
      '   AND OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '   AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '   AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '   AND OP.IDOPERRENFIXAPLIC = AP.IDOPERRENFIX(+)'
      '   AND OP.IDCUSTODIANTE = CT.IDCUSTODIANTE'
      '   AND IV.IDEMISSOR = EM.IDEMISSOR'
      '   AND IV.IDEMISSOR = SLD.IDEMISSOR'
      '   AND IV.IDINVESTIMENTO = SLD.IDINVESTIMENTO'
      '   AND OP.IDPLANPREVCTBPATR = SLD.IDPLANPREVCTBPATR'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, EM.SIGLAEMISSOR, IV.DESCINVESTIM' +
        'ENTO, OP.DATAOPERACAO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end>
    object qryBoletaOperPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object qryBoletaOperPLANPATRO: TStringField
      FieldName = 'PLANPATRO'
      Size = 113
    end
    object qryBoletaOperSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object qryBoletaOperDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBoletaOperDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
    end
    object qryBoletaOperDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBoletaOperDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBoletaOperVENCOPERACAO: TDateTimeField
      FieldName = 'VENCOPERACAO'
    end
    object qryBoletaOperPUEMISSAO: TFloatField
      FieldName = 'PUEMISSAO'
    end
    object qryBoletaOperQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBoletaOperPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
    end
    object qryBoletaOperVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBoletaOperIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
    end
    object qryBoletaOperSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryBoletaOperFLGNEGOCIACAO: TStringField
      FieldName = 'FLGNEGOCIACAO'
      Size = 12
    end
    object qryBoletaOperNOMECLASSRISCO: TStringField
      FieldName = 'NOMECLASSRISCO'
      Size = 60
    end
    object qryBoletaOperQTDCARTHIPO: TFloatField
      FieldName = 'QTDCARTHIPO'
    end
    object qryBoletaOperVALCARTHIPO: TFloatField
      FieldName = 'VALCARTHIPO'
    end
    object qryBoletaOperSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryBoletaOperNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryBoletaOperOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryBoletaOperBOLETA: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object qryBoletaOperDIAS: TFloatField
      FieldName = 'DIAS'
    end
  end
  object dsBoletaOper: TwwDataSource
    DataSet = qryBoletaOper
    Left = 95
    Top = 88
  end
end
