inherited DmRelatorios: TDmRelatorios
  Left = 198
  Top = 86
  Width = 740
  Height = 526
  OnCreate = DmRelatoriosCreate
  OnDestroy = DmRelatoriosDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 3
    Top = 112
    Width = 729
    Height = 9
    Color = clHighlight
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 1
    Top = 232
    Width = 729
    Height = 9
    Color = clHighlight
    TabOrder = 1
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 360
    Width = 729
    Height = 9
    Color = clHighlight
    TabOrder = 2
  end
  inherited rpExemplo: TppReport [3]
    Left = 35
    Top = 7
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 20902
      inherited Label11: TppLabel
        Font.Charset = ANSI_CHARSET
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
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
      object ppLCarteira: TppLabel
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
  inherited qryExemplo: TwwQuery [4]
    Left = 35
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptResult
      end>
  end
  inherited pplExemplo: TppBDEPipeline [5]
    Left = 35
    Top = 62
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
  inherited dsExemplo: TwwDataSource [6]
    Left = 35
    Top = 62
  end
  object RelatCotacoesInvest: TppReport
    AutoStop = False
    DataPipeline = DpRelatCotacoesInvest
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RelatCotacoesInvest'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 441
    Top = 255
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'DpRelatCotacoesInvest'
    object RelatCotacoesInvestHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object RelatCotacoesInvestLabel2: TppLabel
        UserName = 'RelatCotacoesInvestLabel2'
        Caption = 'Data do Cotação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 20902
        mmWidth = 29104
        BandType = 0
      end
      object RelatCotacoesInvestLabel3: TppLabel
        UserName = 'RelatCotacoesInvestLabel3'
        Caption = 'Valor da Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 57944
        mmTop = 20902
        mmWidth = 29104
        BandType = 0
      end
      object RelatCotacoesInvestLabel4: TppLabel
        UserName = 'RelatCotacoesInvestLabel4'
        Caption = 'Variação Diária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 142082
        mmTop = 20902
        mmWidth = 25665
        BandType = 0
      end
      object RelatCotacoesInvestLabel6: TppLabel
        UserName = 'RelatCotacoesInvestLabel6'
        Caption = 'Qtd. Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 105569
        mmTop = 20902
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Relatório de Cotação dos Investimentos '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 68527
        BandType = 0
      end
      object ppLabel42: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label42'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraCotacaoInvest: TppLabel
        UserName = 'LCarteiraCotacaoInvest'
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
        mmLeft = 182563
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodoCotacaoInvest: TppLabel
        UserName = 'LbPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
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
    object RelatCotacoesInvestDetailBand1: TppDetailBand
      BeforePrint = RelatCotacoesInvestDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object RelatCotacoesInvestDBText3: TppDBText
        UserName = 'RelatCotacoesInvestDBText3'
        DataField = 'DATACOTACAO'
        DataPipeline = DpRelatCotacoesInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DpRelatCotacoesInvest'
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object EdVlrContabil: TppDBText
        UserName = 'EdVlrContabil'
        AutoSize = True
        DataField = 'VLRCONTABIL'
        DataPipeline = DpRelatCotacoesInvest
        DisplayFormat = '###,###,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DpRelatCotacoesInvest'
        mmHeight = 3969
        mmLeft = 62442
        mmTop = 265
        mmWidth = 24606
        BandType = 4
      end
      object LbVarDia: TppLabel
        UserName = 'LbVarDia'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 160867
        mmTop = 265
        mmWidth = 6879
        BandType = 4
      end
      object RelatCotacoesInvestDBText1: TppDBText
        UserName = 'RelatCotacoesInvestDBText1'
        DataField = 'QTDTITLOTE'
        DataPipeline = DpRelatCotacoesInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DpRelatCotacoesInvest'
        mmHeight = 4233
        mmLeft = 105569
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
    end
    object RelatCotacoesInvestFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16229
      mmPrintPosition = 0
      object RelatCotacoesInvestLine4: TppLine
        UserName = 'RelatCotacoesInvestLine4'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1852
        mmWidth = 194469
        BandType = 8
      end
      object RelatCotacoesInvestLabel5: TppLabel
        UserName = 'RelatCotacoesInvestLabel5'
        Caption = 'PÁG.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
      object RelatCotacoesInvestCalc1: TppSystemVariable
        UserName = 'RelatCotacoesInvestCalc1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 3704
        mmWidth = 31221
        BandType = 8
      end
      object RelatCotacoesInvestCalc3: TppSystemVariable
        UserName = 'RelatCotacoesInvestCalc3'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 185209
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
    end
    object RelatCotacoesInvestGroup1: TppGroup
      BreakName = 'IDINVESTIMENTO'
      DataPipeline = DpRelatCotacoesInvest
      OutlineSettings.CreateNode = True
      UserName = 'RelatCotacoesInvestGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DpRelatCotacoesInvest'
      object RelatCotacoesInvestGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object RelatCotacoesInvestDBText2: TppDBText
          UserName = 'RelatCotacoesInvestDBText2'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = DpRelatCotacoesInvest
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DpRelatCotacoesInvest'
          mmHeight = 4233
          mmLeft = 6350
          mmTop = 1058
          mmWidth = 121709
          BandType = 3
          GroupNo = 0
        end
        object RelatCotacoesInvestLine1: TppLine
          UserName = 'RelatCotacoesInvestLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 6085
          mmWidth = 194469
          BandType = 3
          GroupNo = 0
        end
        object RelatCotacoesInvestLine2: TppLine
          UserName = 'RelatCotacoesInvestLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 265
          mmWidth = 194469
          BandType = 3
          GroupNo = 0
        end
      end
      object RelatCotacoesInvestGroupFooterBand1: TppGroupFooterBand
        AfterPrint = RelatCotacoesInvestGroupFooterBand1AfterPrint
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object RelatCotacoesInvestDBCalc1: TppDBCalc
          UserName = 'RelatCotacoesInvestDBCalc1'
          DataField = 'VLRCONTABIL'
          DataPipeline = DpRelatCotacoesInvest
          DisplayFormat = '###,###,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = RelatCotacoesInvestGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'DpRelatCotacoesInvest'
          mmHeight = 4233
          mmLeft = 71173
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object RelatCotacoesInvestLine3: TppLine
          UserName = 'RelatCotacoesInvestLine3'
          Visible = False
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 57150
          mmTop = 265
          mmWidth = 30427
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object DpRelatCotacoesInvest: TppBDEPipeline
    DataSource = DsRelatCotacoesInvest
    UserName = 'DpRelatCotacoesInvest'
    Left = 441
    Top = 308
  end
  object DsRelatCotacoesInvest: TwwDataSource
    DataSet = QryRelatCotacoes
    Left = 441
    Top = 308
  end
  object DsRelatConsInvest: TwwDataSource
    DataSet = QryRelatConsInvest
    Left = 237
    Top = 62
  end
  object DpRelatConsInvest: TppBDEPipeline
    DataSource = DsRelatConsInvest
    UserName = 'DpRelatConsInvest'
    Left = 237
    Top = 62
  end
  object RelatConsInvest: TppReport
    AutoStop = False
    DataPipeline = DpRelatConsInvest
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
    Left = 237
    Top = 7
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'DpRelatConsInvest'
    object RelatConsInvestHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object RelatConsInvestLabel2: TppLabel
        UserName = 'RelatConsInvestLabel2'
        Caption = 'Descrição do Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 21696
        mmWidth = 45244
        BandType = 0
      end
      object LbDataInicial: TppLabel
        UserName = 'LbDataInicial'
        Caption = '01/01/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 21696
        mmWidth = 16933
        BandType = 0
      end
      object LbDataFinal: TppLabel
        UserName = 'LbDataFinal'
        Caption = '31/12/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 120915
        mmTop = 21696
        mmWidth = 16933
        BandType = 0
      end
      object RelatConsInvestLabel5: TppLabel
        UserName = 'RelatConsInvestLabel5'
        Caption = 'Variação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 155575
        mmTop = 21696
        mmWidth = 16140
        BandType = 0
      end
      object RelatConsInvestLine1: TppLine
        UserName = 'RelatConsInvestLine1'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 26723
        mmWidth = 194734
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Consulta Variação dos Investimentos '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 63765
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label29'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraVarInvest: TppLabel
        UserName = 'LCarteiraVarInvest'
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
      object ppPeriodoVarInvest: TppLabel
        UserName = 'PeriodoVarInvest'
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
      object ppDBImage16: TppDBImage
        UserName = 'DBImage16'
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
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 265
        mmTop = 20373
        mmWidth = 194734
        BandType = 0
      end
    end
    object RelatConsInvestDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object LblValInicial: TppLabel
        UserName = 'LblValInicial'
        Caption = 'Campo Valor Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 70379
        mmTop = 794
        mmWidth = 29633
        BandType = 4
      end
      object LblValFinal: TppLabel
        UserName = 'LblValFinal'
        Caption = 'Campo Valor Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 109538
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object LblValVariacao: TppLabel
        UserName = 'LblValVariacao'
        Caption = 'Campo Variacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 145257
        mmTop = 265
        mmWidth = 26458
        BandType = 4
      end
      object RelatConsInvestDBText1: TppDBText
        OnPrint = RelatConsInvestDBText1Print
        UserName = 'RelatConsInvestDBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = DpRelatConsInvest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DpRelatConsInvest'
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 794
        mmWidth = 58473
        BandType = 4
      end
    end
    object RelatConsInvestFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RelatConsInvestLine2: TppLine
        UserName = 'RelatConsInvestLine2'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1852
        mmWidth = 194469
        BandType = 8
      end
      object RelatConsInvestLabel6: TppLabel
        UserName = 'RelatConsInvestLabel6'
        Caption = 'PÁG.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
      object RelatConsInvestCalc1: TppSystemVariable
        UserName = 'RelatConsInvestCalc1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 3704
        mmWidth = 31221
        BandType = 8
      end
      object RelatConsInvestCalc2: TppSystemVariable
        UserName = 'RelatConsInvestCalc2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 182298
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
    end
  end
  object dsListInv: TwwDataSource
    DataSet = qryListInv
    Left = 133
    Top = 62
  end
  object RptListInv: TppReport
    AutoStop = False
    DataPipeline = bdeListInv
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
    BeforePrint = RptListInvBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 133
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeListInv'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34660
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28046
        mmWidth = 197300
        BandType = 0
      end
      object RptListInvLabel1: TppLabel
        UserName = 'RptListInvLabel1'
        Caption = 'Documento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 23283
        mmWidth = 16140
        BandType = 0
      end
      object RptListInvLabel2: TppLabel
        UserName = 'RptListInvLabel2'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 29633
        mmWidth = 19315
        BandType = 0
      end
      object RptListInvLabel3: TppLabel
        UserName = 'RptListInvLabel3'
        Caption = 'Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object RptListInvLabel4: TppLabel
        UserName = 'RptListInvLabel4'
        Caption = 'Bolsa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 29633
        mmWidth = 7938
        BandType = 0
      end
      object RptListInvLabel5: TppLabel
        UserName = 'RptListInvLabel5'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 29633
        mmWidth = 12700
        BandType = 0
      end
      object RptListInvLabel6: TppLabel
        UserName = 'RptListInvLabel6'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 29633
        mmWidth = 16404
        BandType = 0
      end
      object RptListInvLabel7: TppLabel
        UserName = 'RptListInvLabel7'
        Caption = 'Valor Unitário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 29633
        mmWidth = 19579
        BandType = 0
      end
      object RptListInvLabel8: TppLabel
        UserName = 'RptListInvLabel8'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 29633
        mmWidth = 22225
        BandType = 0
      end
      object RptListInvLabel9: TppLabel
        UserName = 'RptListInvLabel9'
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 183092
        mmTop = 29633
        mmWidth = 14288
        BandType = 0
      end
      object RptListInvLine1: TppLine
        UserName = 'RptListInvLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34131
        mmWidth = 197300
        BandType = 0
      end
      object RptListInvDBText9: TppDBText
        UserName = 'RptListInvDBText9'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 23283
        mmWidth = 22225
        BandType = 0
      end
      object RptListInvLabel10: TppLabel
        UserName = 'RptListInvLabel10'
        Caption = 'Corretora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 23283
        mmWidth = 15610
        BandType = 0
      end
      object RptListInvDBText12: TppDBText
        UserName = 'RptListInvDBText12'
        DataField = 'NOME'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 71173
        mmTop = 23283
        mmWidth = 55033
        BandType = 0
      end
      object RptListInvDBText13: TppDBText
        UserName = 'RptListInvDBText13'
        DataField = 'DATAOPERACAO'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14288
        mmWidth = 15875
        BandType = 0
      end
      object RptListInvLabel12: TppLabel
        UserName = 'RptListInvLabel12'
        Caption = 'Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 18785
        mmWidth = 14552
        BandType = 0
      end
      object RptListInvDBText14: TppDBText
        UserName = 'RptListInvDBText14'
        DataField = 'DATAVENCOPER'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 18785
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Consulta do Histórico de Caixa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 52388
        BandType = 0
      end
      object ppLabel26: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label26'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLHistCaixa: TppLabel
        UserName = 'LHistCaixa'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage23: TppDBImage
        UserName = 'DBImage23'
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
    object ppDetailBand5: TppDetailBand
      AfterPrint = ppDetailBand5AfterPrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptListInvDBText1: TppDBText
        UserName = 'RptListInvDBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object RptListInvDBText2: TppDBText
        UserName = 'RptListInvDBText2'
        DataField = 'DESCMERCADO'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object RptListInvDBText3: TppDBText
        UserName = 'RptListInvDBText3'
        DataField = 'SGLBOLSAVALORES'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object RptListInvDBText4: TppDBText
        UserName = 'RptListInvDBText4'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = bdeListInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 54504
        mmTop = 529
        mmWidth = 46038
        BandType = 4
      end
      object RptListInvDBText5: TppDBText
        UserName = 'RptListInvDBText5'
        DataField = 'QTDEOPERACAO'
        DataPipeline = bdeListInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object RptListInvDBText6: TppDBText
        UserName = 'RptListInvDBText6'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = bdeListInv
        DisplayFormat = '###,###,##0.00######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 529
        mmWidth = 23548
        BandType = 4
      end
      object RptListInvDBText7: TppDBText
        UserName = 'RptListInvDBText7'
        DataField = 'VLROPERACAO'
        DataPipeline = bdeListInv
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object RptListInvDBText8: TppDBText
        UserName = 'RptListInvDBText8'
        DataField = 'TOTALDESPESAS'
        DataPipeline = bdeListInv
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 11906
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 12435
        mmWidth = 62177
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
        mmLeft = 80433
        mmTop = 12435
        mmWidth = 58738
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
        mmTop = 12435
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptListInvSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 60590
      mmPrintPosition = 0
      object MemoCotacoes: TppMemo
        UserName = 'MemoCotacoes'
        Caption = 'MemoCotacoes'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 14288
        mmLeft = 0
        mmTop = 45508
        mmWidth = 197380
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptResFinanCCShape2: TppShape
        UserName = 'rptResFinanCCShape2'
        Pen.Width = 2
        mmHeight = 6879
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197644
        BandType = 7
      end
      object LblTotLiquido: TppLabel
        UserName = 'LblTotLiquido'
        Caption = 'Total Líquido a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 2910
        mmWidth = 32279
        BandType = 7
      end
      object LblDespesas: TppLabel
        UserName = 'LblDespesas'
        Caption = 'Total Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 44450
        mmTop = 2910
        mmWidth = 23813
        BandType = 7
      end
      object RptListInvDBText10: TppDBText
        UserName = 'RptListInvDBText10'
        AutoSize = True
        DataField = 'TOTALLIQUIDOBOLETA'
        DataPipeline = bdeListInv
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 4233
        mmLeft = 141023
        mmTop = 2910
        mmWidth = 41540
        BandType = 7
      end
      object RptListInvDBText11: TppDBText
        UserName = 'RptListInvDBText11'
        AutoSize = True
        DataField = 'TOTALDESPESABOLETA'
        DataPipeline = bdeListInv
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 4233
        mmLeft = 60325
        mmTop = 2910
        mmWidth = 43392
        BandType = 7
      end
      object RptListInvLine2: TppLine
        UserName = 'RptListInvLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 49213
        mmWidth = 197300
        BandType = 7
      end
      object RptListInvDBMemo1: TppDBMemo
        UserName = 'RptListInvDBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = bdeListInv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'bdeListInv'
        mmHeight = 20373
        mmLeft = 265
        mmTop = 24342
        mmWidth = 197115
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptListInvLabel13: TppLabel
        UserName = 'RptListInvLabel13'
        Caption = 'Observações '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 19844
        mmWidth = 20108
        BandType = 7
      end
      object RptListInvLine3: TppLine
        UserName = 'RptListInvLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197300
        BandType = 7
      end
      object RptListInvLabel14: TppLabel
        UserName = 'RptListInvLabel14'
        Caption = 'PU Médio de Compra :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 9525
        mmWidth = 35719
        BandType = 7
      end
      object RptListInvLabel15: TppLabel
        UserName = 'RptListInvLabel15'
        Caption = 'PU Médio de Venda :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 14552
        mmWidth = 32808
        BandType = 7
      end
      object RptListInvDBText16: TppDBText
        UserName = 'RptListInvDBText16'
        AutoSize = True
        DataField = 'PUMEDIOCOMPRA'
        DataPipeline = bdeListInv
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeListInv'
        mmHeight = 4233
        mmLeft = 37042
        mmTop = 9525
        mmWidth = 32279
        BandType = 7
      end
      object RptListInvDBText17: TppDBText
        UserName = 'RptListInvDBText17'
        AutoSize = True
        DataField = 'PUMEDIOVENDA'
        DataPipeline = bdeListInv
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeListInv'
        mmHeight = 4233
        mmLeft = 40481
        mmTop = 14817
        mmWidth = 28840
        BandType = 7
      end
    end
  end
  object dsDetBoleta: TwwDataSource
    DataSet = qryDetBoleta
    Left = 237
    Top = 183
  end
  object bdeDetBoleta: TppBDEPipeline
    DataSource = dsDetBoleta
    UserName = 'bdeDetBoleta'
    Left = 237
    Top = 183
    object bdeDetBoletappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOINVEST'
      FieldName = 'IDOPERACAOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object bdeDetBoletappField2: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object bdeDetBoletappField3: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object bdeDetBoletappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeDetBoletappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRECOUNITOPERACAO'
      FieldName = 'PRECOUNITOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeDetBoletappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeDetBoletappField7: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object bdeDetBoletappField8: TppField
      FieldAlias = 'SGLBOLSAVALORES'
      FieldName = 'SGLBOLSAVALORES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object bdeDetBoletappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDESPOPER'
      FieldName = 'VLRDESPOPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeDetBoletappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPODESPINVEST'
      FieldName = 'IDTIPODESPINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeDetBoletappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALDESPESAS'
      FieldName = 'TOTALDESPESAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeDetBoletappField12: TppField
      FieldAlias = 'DESCMERCADO'
      FieldName = 'DESCMERCADO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object bdeDetBoletappField13: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object bdeDetBoletappField14: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object bdeDetBoletappField15: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object bdeDetBoletappField16: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object bdeDetBoletappField17: TppField
      FieldAlias = 'DESCTIPODESPINV'
      FieldName = 'DESCTIPODESPINV'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object bdeDetBoletappField18: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object bdeDetBoletappField19: TppField
      FieldAlias = 'DESPNATUR'
      FieldName = 'DESPNATUR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
  end
  object RptDetBoleta: TppReport
    AutoStop = False
    DataPipeline = bdeDetBoleta
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
    BeforePrint = RptDetBoletaBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 237
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeDetBoleta'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Detalhamento de Boletas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel144: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label144'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraDetalhBoleta: TppLabel
        UserName = 'LCarteiraDetalhBoleta'
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
      object lbDataRef: TppLabel
        UserName = 'lbDataRef'
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
      object ppDBImage17: TppDBImage
        UserName = 'DBImage17'
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
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object RptDetBoletaDBText12: TppDBText
        UserName = 'RptDetBoletaDBText12'
        DataField = 'DESCTIPODESPINV'
        DataPipeline = bdeDetBoleta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeDetBoleta'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 60854
        BandType = 4
      end
      object RptDetBoletaLabel21: TppLabel
        OnPrint = RptDetBoletaLabel21Print
        UserName = 'RptDetBoletaLabel21'
        Caption = 'RptDetBoletaLabel21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 64823
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 2646
        mmWidth = 196321
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80433
        mmTop = 2646
        mmWidth = 60325
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptDetBoletaSummaryBand1: TppSummaryBand
      AfterPrint = RptDetBoletaSummaryBand1AfterPrint
      BeforePrint = RptDetBoletaSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object RptDetBoletaLine2: TppLine
        UserName = 'RptDetBoletaLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object RptDetBoletaLabel14: TppLabel
        UserName = 'RptDetBoletaLabel14'
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29633
        mmTop = 3969
        mmWidth = 16404
        BandType = 7
      end
      object RptDetBoletaLabel20: TppLabel
        UserName = 'RptDetBoletaLabel20'
        Caption = 'Total das Rubricas na Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 10054
        mmWidth = 40746
        BandType = 7
      end
      object RptDetBoletaLine4: TppLine
        UserName = 'RptDetBoletaLine4'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 43921
        mmTop = 11113
        mmWidth = 48948
        BandType = 7
      end
      object RptDetBoletaMemo1: TppMemo
        UserName = 'RptDetBoletaMemo1'
        Caption = 'RptDetBoletaMemo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 11642
        mmLeft = 2646
        mmTop = 15081
        mmWidth = 60854
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptDetBoletaMemo2: TppMemo
        UserName = 'RptDetBoletaMemo2'
        Caption = 'RptDetBoletaMemo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 11641
        mmLeft = 63765
        mmTop = 15081
        mmWidth = 29104
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptDetBoletaLabel17: TppLabel
        OnPrint = RptDetBoletaLabel17Print
        UserName = 'RptDetBoletaLabel17'
        Caption = 'RptDetBoletaLabel17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 61119
        mmTop = 3704
        mmWidth = 31485
        BandType = 7
      end
      object RptDetBoletaLabel18: TppLabel
        OnPrint = RptDetBoletaLabel18Print
        UserName = 'RptDetBoletaLabel18'
        Caption = 'Total a Receber:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 3704
        mmWidth = 24342
        BandType = 7
      end
      object RptDetBoletaLabel19: TppLabel
        OnPrint = RptDetBoletaLabel19Print
        UserName = 'RptDetBoletaLabel19'
        Caption = 'RptDetBoletaLabel19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157163
        mmTop = 3704
        mmWidth = 31485
        BandType = 7
      end
    end
    object RptDetBoletaGroup1: TppGroup
      BreakName = 'NUMDOCUMENTO'
      DataPipeline = bdeDetBoleta
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptDetBoletaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeDetBoleta'
      object RptDetBoletaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptListOSPenDBText6: TppDBText
          UserName = 'RptListOSPenDBText6'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 11906
          mmTop = 794
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object RptDetBoletaLabel2: TppLabel
          UserName = 'RptDetBoletaLabel2'
          Caption = 'Boleta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 794
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object RptDetBoletaLabel3: TppLabel
          UserName = 'RptDetBoletaLabel3'
          Caption = 'Corretora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 794
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object RptDetBoletaDBText1: TppDBText
          UserName = 'RptDetBoletaDBText1'
          DataField = 'NOME'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 64558
          mmTop = 794
          mmWidth = 94986
          BandType = 3
          GroupNo = 0
        end
      end
      object RptDetBoletaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptDetBoletaGroup2: TppGroup
      BreakName = 'IDOPERACAOINVEST'
      DataPipeline = bdeDetBoleta
      OutlineSettings.CreateNode = True
      UserName = 'RptDetBoletaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 25400
      DataPipelineName = 'bdeDetBoleta'
      object RptDetBoletaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 25400
        mmPrintPosition = 0
        object RptDetBoletaLabel4: TppLabel
          UserName = 'RptDetBoletaLabel4'
          Caption = 'Papel:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 529
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText2: TppDBText
          UserName = 'RptDetBoletaDBText2'
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 16933
          mmTop = 529
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel5: TppLabel
          UserName = 'RptDetBoletaLabel5'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 529
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText3: TppDBText
          UserName = 'RptDetBoletaDBText3'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 119592
          mmTop = 529
          mmWidth = 71173
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel6: TppLabel
          UserName = 'RptDetBoletaLabel6'
          Caption = 'Data Liquidação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 14023
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText4: TppDBText
          UserName = 'RptDetBoletaDBText4'
          DataField = 'DATAVENCOPER'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 131498
          mmTop = 14023
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel7: TppLabel
          UserName = 'RptDetBoletaLabel7'
          Caption = 'Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 5292
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText5: TppDBText
          UserName = 'RptDetBoletaDBText5'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 16933
          mmTop = 5292
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel8: TppLabel
          UserName = 'RptDetBoletaLabel8'
          Caption = 'Mercado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 5292
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText6: TppDBText
          UserName = 'RptDetBoletaDBText6'
          DataField = 'DESCMERCADO'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 119592
          mmTop = 5292
          mmWidth = 71173
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel9: TppLabel
          UserName = 'RptDetBoletaLabel9'
          Caption = 'Bolsa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 10054
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText7: TppDBText
          UserName = 'RptDetBoletaDBText7'
          DataField = 'SGLBOLSAVALORES'
          DataPipeline = bdeDetBoleta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 119592
          mmTop = 10054
          mmWidth = 71173
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel10: TppLabel
          UserName = 'RptDetBoletaLabel10'
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27517
          mmTop = 10054
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText8: TppDBText
          UserName = 'RptDetBoletaDBText8'
          DataField = 'QTDEOPERACAO'
          DataPipeline = bdeDetBoleta
          DisplayFormat = '###,###,###,###,###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 10054
          mmWidth = 40746
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel11: TppLabel
          UserName = 'RptDetBoletaLabel11'
          Caption = 'Preço Unitário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27517
          mmTop = 14023
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaDBText9: TppDBText
          UserName = 'RptDetBoletaDBText9'
          DataField = 'PRECOUNITOPERACAO'
          DataPipeline = bdeDetBoleta
          DisplayFormat = '###,###,###,##0.00####'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeDetBoleta'
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 14023
          mmWidth = 40746
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel12: TppLabel
          UserName = 'RptDetBoletaLabel12'
          Caption = 'Valor Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27517
          mmTop = 19315
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel15: TppLabel
          OnPrint = RptDetBoletaLabel15Print
          UserName = 'RptDetBoletaLabel15'
          Caption = 'RptDetBoletaLabel15'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 64029
          mmTop = 19315
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLine1: TppLine
          UserName = 'RptDetBoletaLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLine3: TppLine
          UserName = 'RptDetBoletaLine3'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 14552
          mmTop = 23283
          mmWidth = 75936
          BandType = 3
          GroupNo = 1
        end
        object RptDetBoletaLabel22: TppLabel
          UserName = 'RptDetBoletaLabel22'
          Caption = 'Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 22225
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
      end
      object RptDetBoletaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptDetBoletaLabel13: TppLabel
          UserName = 'RptDetBoletaLabel13'
          Caption = 'Valor Liquido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 132027
          mmTop = 529
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object RptDetBoletaLabel16: TppLabel
          OnPrint = RptDetBoletaLabel16Print
          UserName = 'RptDetBoletaLabel16'
          Caption = 'RptDetBoletaLabel16'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 158221
          mmTop = 529
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object dsDemCustoCarteira: TwwDataSource
    DataSet = qryDemCustoCarteira
    Left = 441
    Top = 62
  end
  object bdeDemCustoCarteira: TppBDEPipeline
    DataSource = dsDemCustoCarteira
    UserName = 'bdeDemCustoCarteira'
    Left = 441
    Top = 62
  end
  object RptDemCustoCarteira: TppReport
    AutoStop = False
    DataPipeline = bdeDemCustoCarteira
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
    BeforePrint = RptDemCustoCarteiraBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 441
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeDemCustoCarteira'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197300
        BandType = 0
      end
      object RptDemCustoCarteiraLine1: TppLine
        UserName = 'RptDemCustoCarteiraLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object RptDemCustoCarteiraLabel11: TppLabel
        UserName = 'RptDemCustoCarteiraLabel11'
        Caption = '________Valores Corrigidos______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 23019
        mmWidth = 50006
        BandType = 0
      end
      object RptDemCustoCarteiraLabel3: TppLabel
        UserName = 'RptDemCustoCarteiraLabel3'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 30692
        mmWidth = 7938
        BandType = 0
      end
      object RptDemCustoCarteiraLine2: TppLine
        UserName = 'RptDemCustoCarteiraLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34925
        mmWidth = 197300
        BandType = 0
      end
      object RptDemCustoCarteiraLabel4: TppLabel
        UserName = 'RptDemCustoCarteiraLabel4'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 30692
        mmWidth = 6615
        BandType = 0
      end
      object RptDemCustoCarteiraLabel5: TppLabel
        UserName = 'RptDemCustoCarteiraLabel5'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 45508
        mmTop = 30692
        mmWidth = 16404
        BandType = 0
      end
      object RptDemCustoCarteiraLabel6: TppLabel
        UserName = 'RptDemCustoCarteiraLabel6'
        Caption = 'Custo Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 30692
        mmWidth = 23813
        BandType = 0
      end
      object RptDemCustoCarteiraLabel7: TppLabel
        UserName = 'RptDemCustoCarteiraLabel7'
        Caption = 'Valor de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96309
        mmTop = 30692
        mmWidth = 25665
        BandType = 0
      end
      object RptDemCustoCarteiraLabel8: TppLabel
        UserName = 'RptDemCustoCarteiraLabel8'
        Caption = 'Rendimentos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 30692
        mmWidth = 20373
        BandType = 0
      end
      object RptDemCustoCarteiraLabel9: TppLabel
        UserName = 'RptDemCustoCarteiraLabel9'
        Caption = ' Custo Carreg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 30692
        mmWidth = 21167
        BandType = 0
      end
      object RptDemCustoCarteiraLabel10: TppLabel
        UserName = 'RptDemCustoCarteiraLabel10'
        Caption = 'Ganho (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 182298
        mmTop = 30692
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Demonstrativo do Custo da Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 60590
        BandType = 0
      end
      object ppLabel34: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label34'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraCustoCarteira: TppLabel
        UserName = 'LCarteiraCustoCarteira'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object lbDataRefC: TppLabel
        UserName = 'LPeriodoRendaFixa1'
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
      object ppDBImage8: TppDBImage
        UserName = 'DBImage8'
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
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RptDemCustoCarteiraDBText2: TppDBText
        UserName = 'RptDemCustoCarteiraDBText2'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeDemCustoCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object RptDemCustoCarteiraDBText3: TppDBText
        UserName = 'RptDemCustoCarteiraDBText3'
        DataField = 'IDLOTE'
        DataPipeline = bdeDemCustoCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 15610
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object RptDemCustoCarteiraDBText4: TppDBText
        UserName = 'RptDemCustoCarteiraDBText4'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeDemCustoCarteira
        DisplayFormat = '###,###,###,##0.00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 34131
        mmTop = 1058
        mmWidth = 27781
        BandType = 4
      end
      object RptDemCustoCarteiraDBText5: TppDBText
        UserName = 'RptDemCustoCarteiraDBText5'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeDemCustoCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 62971
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object RptDemCustoCarteiraDBText7: TppDBText
        UserName = 'RptDemCustoCarteiraDBText7'
        DataField = 'SALDOREND'
        DataPipeline = bdeDemCustoCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object RptDemCustoCarteiraDBText8: TppDBText
        UserName = 'RptDemCustoCarteiraDBText8'
        DataField = 'SALDOCAR'
        DataPipeline = bdeDemCustoCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeDemCustoCarteira'
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object RptDemCustoCarteiraLabel13: TppLabel
        OnPrint = RptDemCustoCarteiraLabel13Print
        UserName = 'RptDemCustoCarteiraLabel13'
        Caption = 'RptDemCustoCarteiraLabel13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 85461
        mmTop = 1058
        mmWidth = 36513
        BandType = 4
      end
      object RptDemCustoCarteiraLabel14: TppLabel
        OnPrint = RptDemCustoCarteiraLabel14Print
        UserName = 'RptDemCustoCarteiraLabel14'
        Caption = 'RptDemCustoCarteiraLabel14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 1058
        mmWidth = 39158
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptDemCustoCarteiraLine3: TppLine
        UserName = 'RptDemCustoCarteiraLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object RptDemCustoCarteiraLabel12: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'RptDemCustoCarteiraLabel12'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 61119
        BandType = 8
      end
      object RptDemCustoCarteiraCalc1: TppSystemVariable
        UserName = 'RptDemCustoCarteiraCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80433
        mmTop = 1058
        mmWidth = 60325
        BandType = 8
      end
      object RptDemCustoCarteiraCalc2: TppSystemVariable
        UserName = 'RptDemCustoCarteiraCalc2'
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
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptDemCustoCarteiraGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeDemCustoCarteira
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptDemCustoCarteiraGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeDemCustoCarteira'
      object RptDemCustoCarteiraGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
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
        object RptDemCustoCarteiraDBText1: TppDBText
          UserName = 'RptDemCustoCarteiraDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeDemCustoCarteira
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeDemCustoCarteira'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptDemCustoCarteiraLine4: TppLine
          UserName = 'RptDemCustoCarteiraLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptDemCustoCarteiraGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object RptDemCustoCarteiraDBCalc1: TppDBCalc
          UserName = 'RptDemCustoCarteiraDBCalc1'
          DataField = 'SALDOAQUI'
          DataPipeline = bdeDemCustoCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptDemCustoCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeDemCustoCarteira'
          mmHeight = 3704
          mmLeft = 62971
          mmTop = 2381
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object RptDemCustoCarteiraDBCalc2: TppDBCalc
          UserName = 'RptDemCustoCarteiraDBCalc2'
          DataField = 'SALDOREND'
          DataPipeline = bdeDemCustoCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptDemCustoCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeDemCustoCarteira'
          mmHeight = 3704
          mmLeft = 123031
          mmTop = 2381
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object RptDemCustoCarteiraDBCalc3: TppDBCalc
          UserName = 'RptDemCustoCarteiraDBCalc3'
          DataField = 'SALDOCAR'
          DataPipeline = bdeDemCustoCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptDemCustoCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeDemCustoCarteira'
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 2381
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object RptDemCustoCarteiraLine5: TppLine
          UserName = 'RptDemCustoCarteiraLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1588
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object RptDemCustoCarteiraLabel15: TppLabel
          UserName = 'RptDemCustoCarteiraLabel15'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 22754
          mmTop = 2381
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object TotMercado: TppLabel
          OnPrint = TotMercadoPrint
          UserName = 'TotMercado'
          Caption = 'TotMercado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 106363
          mmTop = 2381
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsGerCarteira: TwwDataSource
    DataSet = qryGerCarteira
    Left = 333
    Top = 308
  end
  object bdeGerCarteira: TppBDEPipeline
    DataSource = dsGerCarteira
    UserName = 'bdeGerCarteira'
    Left = 333
    Top = 308
  end
  object RptGerCarteira: TppReport
    AutoStop = False
    DataPipeline = bdeGerCarteira
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
    Left = 333
    Top = 255
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeGerCarteira'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34396
        mmWidth = 197300
        BandType = 0
      end
      object RptGerCarteiraLine1: TppLine
        UserName = 'RptGerCarteiraLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197300
        BandType = 0
      end
      object RptGerCarteiraLabel3: TppLabel
        UserName = 'RptGerCarteiraLabel3'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 30163
        mmWidth = 7938
        BandType = 0
      end
      object RptGerCarteiraLabel5: TppLabel
        UserName = 'RptGerCarteiraLabel5'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 30427
        mmWidth = 24342
        BandType = 0
      end
      object LblCusto: TppLabel
        UserName = 'LblCusto'
        Caption = 'Custo Carreg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 65881
        mmTop = 30427
        mmWidth = 20373
        BandType = 0
      end
      object RptGerCarteiraLabel6: TppLabel
        UserName = 'RptGerCarteiraLabel6'
        Caption = 'Cotacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96309
        mmTop = 30427
        mmWidth = 11642
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
        mmLeft = 112448
        mmTop = 30427
        mmWidth = 25665
        BandType = 0
      end
      object RptGerCarteiraLabel8: TppLabel
        UserName = 'RptGerCarteiraLabel8'
        Caption = '% Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 141817
        mmTop = 30427
        mmWidth = 14817
        BandType = 0
      end
      object RptGerCarteiraLabel9: TppLabel
        UserName = 'RptGerCarteiraLabel9'
        Caption = '____% CIA____'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 165629
        mmTop = 26194
        mmWidth = 19844
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
        mmLeft = 165365
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
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 30427
        mmWidth = 6615
        BandType = 0
      end
      object LblLote: TppLabel
        UserName = 'LblLote'
        Caption = 'LblLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 20902
        mmWidth = 41804
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Composição Gerencial da Carteira de Ações'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 74613
        BandType = 0
      end
      object ppLabel47: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label47'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraCompGerAcoes: TppLabel
        UserName = 'LCarteiraAplFinanc1'
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
        mmLeft = 173832
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptGerCarteiraLabel2: TppLabel
        UserName = 'RptBoletaRenFixaDataRef1'
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
      object ppDBImage13: TppDBImage
        UserName = 'DBImage13'
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
        DataPipeline = bdeGerCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
      object RptGerCarteiraDBText4: TppDBText
        UserName = 'RptGerCarteiraDBText4'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeGerCarteira
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object LblSaldoCarr: TppDBText
        UserName = 'LblSaldoCarr'
        DataField = 'SALDOCAR'
        DataPipeline = bdeGerCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 794
        mmWidth = 29104
        BandType = 4
      end
      object RptGerCarteiraLabel16: TppLabel
        OnPrint = RptGerCarteiraLabel16Print
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
        mmLeft = 110067
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object RptGerCarteiraLabel17: TppLabel
        OnPrint = RptGerCarteiraLabel17Print
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
        mmLeft = 128588
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object RptGerCarteiraLabel18: TppLabel
        OnPrint = RptGerCarteiraLabel18Print
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
        mmLeft = 143669
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object RptGerCarteiraLabel19: TppLabel
        OnPrint = RptGerCarteiraLabel19Print
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
        mmLeft = 158486
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object RptGerCarteiraDBText5: TppDBText
        UserName = 'RptGerCarteiraDBText5'
        DataField = 'COTACAO'
        DataPipeline = bdeGerCarteira
        DisplayFormat = '###,###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 794
        mmWidth = 20373
        BandType = 4
      end
      object LblSaldoAtu: TppDBText
        UserName = 'LblSaldoAtu'
        DataField = 'SALDOATU'
        DataPipeline = bdeGerCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 794
        mmWidth = 29104
        BandType = 4
      end
      object LblSaldoAqui: TppDBText
        UserName = 'LblSaldoAqui'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeGerCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeGerCarteira'
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 794
        mmWidth = 29104
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel14'
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
    end
    object RptGerCarteiraGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeGerCarteira
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptGerCarteiraGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeGerCarteira'
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
          mmLeft = 1058
          mmTop = 794
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object RptGerCarteiraDBText1: TppDBText
          UserName = 'RptGerCarteiraDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeGerCarteira
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeGerCarteira'
          mmHeight = 3969
          mmLeft = 14817
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
      DataPipeline = bdeGerCarteira
      OutlineSettings.CreateNode = True
      UserName = 'RptGerCarteiraGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeGerCarteira'
      object RptGerCarteiraGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = RptGerCarteiraGroupHeaderBand2BeforePrint
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
          mmLeft = 1058
          mmTop = 1588
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object RptGerCarteiraDBText2: TppDBText
          UserName = 'RptGerCarteiraDBText2'
          DataField = 'DESCSETOREMISSOR'
          DataPipeline = bdeGerCarteira
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeGerCarteira'
          mmHeight = 3704
          mmLeft = 14817
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
          mmWidth = 197300
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
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object RptGerCarteiraGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsGerCartSintetico: TwwDataSource
    DataSet = qryGerCartSintetico
    Left = 237
    Top = 308
  end
  object bdeGerCartSintetico: TppBDEPipeline
    DataSource = dsGerCartSintetico
    UserName = 'bdeGerCartSintetico'
    Left = 237
    Top = 308
    object bdeGerCartSinteticoppField1: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object bdeGerCartSinteticoppField2: TppField
      FieldAlias = 'DESCSETOREMISSOR'
      FieldName = 'DESCSETOREMISSOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object bdeGerCartSinteticoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object bdeGerCartSinteticoppField4: TppField
      FieldAlias = 'IDSETOREMISSOR'
      FieldName = 'IDSETOREMISSOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object bdeGerCartSinteticoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOAQUI'
      FieldName = 'SALDOAQUI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeGerCartSinteticoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMPRESAS'
      FieldName = 'EMPRESAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeGerCartSinteticoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORMERCADO'
      FieldName = 'VALORMERCADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeGerCartSinteticoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATU'
      FieldName = 'SALDOATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeGerCartSinteticoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOCAR'
      FieldName = 'SALDOCAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeGerCartSinteticoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCART'
      FieldName = 'TOTCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsProvisaoIR: TwwDataSource
    DataSet = qryProvisaoIR
    Left = 35
    Top = 437
  end
  object bdeProvisaoIR: TppBDEPipeline
    DataSource = dsProvisaoIR
    UserName = 'bdeProvisaoIR'
    Left = 35
    Top = 437
  end
  object RptProvisaoIR: TppReport
    AutoStop = False
    DataPipeline = bdeProvisaoIR
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
    Left = 35
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeProvisaoIR'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197300
        BandType = 0
      end
      object RptProvisaoIRLabel2: TppLabel
        UserName = 'RptProvisaoIRLabel2'
        Caption = 'RptProvisaoIRLabel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 29898
        BandType = 0
      end
      object RptProvisaoIRLabel4: TppLabel
        UserName = 'RptProvisaoIRLabel4'
        Caption = 'RptProvisaoIRLabel4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 48154
        mmTop = 14023
        mmWidth = 29898
        BandType = 0
      end
      object RptProvisaoIRLine1: TppLine
        UserName = 'RptProvisaoIRLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object RptProvisaoIRLabel5: TppLabel
        UserName = 'RptProvisaoIRLabel5'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 20902
        mmWidth = 7938
        BandType = 0
      end
      object RptProvisaoIRLabel6: TppLabel
        UserName = 'RptProvisaoIRLabel6'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 20902
        mmWidth = 11642
        BandType = 0
      end
      object RptProvisaoIRLabel7: TppLabel
        UserName = 'RptProvisaoIRLabel7'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 69850
        mmTop = 20902
        mmWidth = 16404
        BandType = 0
      end
      object RptProvisaoIRLabel8: TppLabel
        UserName = 'RptProvisaoIRLabel8'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 20902
        mmWidth = 11642
        BandType = 0
      end
      object RptProvisaoIRLabel9: TppLabel
        UserName = 'RptProvisaoIRLabel9'
        Caption = 'Valor de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 20902
        mmWidth = 25665
        BandType = 0
      end
      object RptProvisaoIRLabel10: TppLabel
        UserName = 'RptProvisaoIRLabel10'
        Caption = 'Custo em R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 148696
        mmTop = 20902
        mmWidth = 18521
        BandType = 0
      end
      object RptProvisaoIRLabel11: TppLabel
        UserName = 'RptProvisaoIRLabel11'
        Caption = 'Ganho de Capital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 20902
        mmWidth = 22754
        BandType = 0
      end
      object RptProvisaoIRLabel12: TppLabel
        UserName = 'RptProvisaoIRLabel12'
        Caption = 'IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 25400
        mmWidth = 4498
        BandType = 0
      end
      object RptProvisaoIRLabel13: TppLabel
        OnPrint = RptProvisaoIRLabel13Print
        UserName = 'RptProvisaoIRLabel13'
        Caption = 'RptProvisaoIRLabel13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167482
        mmTop = 25400
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo Provisão de Imposto de Renda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 77523
        BandType = 0
      end
      object ppLabel93: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraProvIR: TppLabel
        UserName = 'LCarteiraProvIR'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage26: TppDBImage
        UserName = 'DBImage26'
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
      object ppLabel22: TppLabel
        UserName = 'Label3'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44715
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object RptProvisaoIRDBText1: TppDBText
        UserName = 'RptProvisaoIRDBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeProvisaoIR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 23019
        BandType = 4
      end
      object RptProvisaoIRDBText3: TppDBText
        UserName = 'RptProvisaoIRDBText3'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeProvisaoIR
        DisplayFormat = '###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 1058
        mmWidth = 25135
        BandType = 4
      end
      object RptProvisaoIRDBText4: TppDBText
        UserName = 'RptProvisaoIRDBText4'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeProvisaoIR
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object RptProvisaoIRLabel15: TppLabel
        OnPrint = RptProvisaoIRLabel15Print
        UserName = 'RptProvisaoIRLabel15'
        Caption = 'RptProvisaoIRLabel15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 1058
        mmWidth = 26988
        BandType = 4
      end
      object RptProvisaoIRLabel19: TppLabel
        OnPrint = RptProvisaoIRLabel19Print
        UserName = 'RptProvisaoIRLabel19'
        Caption = 'RptProvisaoIRLabel19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 9525
        mmWidth = 26988
        BandType = 4
      end
      object RptProvisaoIRLabel20: TppLabel
        OnPrint = RptProvisaoIRLabel20Print
        UserName = 'RptProvisaoIRLabel20'
        Caption = 'RptProvisaoIRLabel20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 5292
        mmWidth = 26988
        BandType = 4
      end
      object RptProvisaoIRLabel21: TppLabel
        UserName = 'RptProvisaoIRLabel21'
        Caption = 'Apropriação no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 9525
        mmWidth = 29369
        BandType = 4
      end
      object RptProvisaoIRDBText5: TppDBText
        UserName = 'RptProvisaoIRDBText5'
        DataField = 'NOME'
        DataPipeline = bdeProvisaoIR
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 33867
        BandType = 4
      end
      object RptProvisaoIRDBText6: TppDBText
        UserName = 'RptProvisaoIRDBText6'
        DataField = 'SALDOVLRCARTINV'
        DataPipeline = bdeProvisaoIR
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 108479
        mmTop = 1058
        mmWidth = 29104
        BandType = 4
      end
      object RptProvisaoIRDBText2: TppDBText
        UserName = 'RptProvisaoIRDBText2'
        DataField = 'COTACAO'
        DataPipeline = bdeProvisaoIR
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeProvisaoIR'
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object dsCompGerLotes: TwwDataSource
    DataSet = qryCompGerLotes
    Left = 133
    Top = 183
  end
  object bdeCompGerLotes: TppBDEPipeline
    DataSource = dsCompGerLotes
    UserName = 'bdeCompGerLotes'
    Left = 133
    Top = 183
  end
  object RptCompGerLotes: TppReport
    AutoStop = False
    DataPipeline = bdeCompGerLotes
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
    Left = 133
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeCompGerLotes'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object RptCompGerLotesLine1: TppLine
        UserName = 'RptCompGerLotesLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197300
        BandType = 0
      end
      object RptCompGerLotesLabel3: TppLabel
        UserName = 'RptCompGerLotesLabel3'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 21960
        mmWidth = 7938
        BandType = 0
      end
      object RptCompGerLotesLabel4: TppLabel
        UserName = 'RptCompGerLotesLabel4'
        Caption = 'Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object RptCompGerLotesLabel5: TppLabel
        UserName = 'RptCompGerLotesLabel5'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 21960
        mmWidth = 17727
        BandType = 0
      end
      object RptCompGerLotesLabel6: TppLabel
        UserName = 'RptCompGerLotesLabel6'
        Caption = 'Preço Exercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 67733
        mmTop = 21960
        mmWidth = 22225
        BandType = 0
      end
      object RptCompGerLotesLabel7: TppLabel
        UserName = 'RptCompGerLotesLabel7'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 21960
        mmWidth = 6615
        BandType = 0
      end
      object RptCompGerLotesLabel8: TppLabel
        UserName = 'RptCompGerLotesLabel8'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 21960
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Composição Gerencial dos Lotes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 56092
        BandType = 0
      end
      object ppLabel54: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label54'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraGerLotes: TppLabel
        UserName = 'LCarteiraGerLotes'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptCompGerLotesLabel2: TppLabel
        UserName = 'RptCompGerLotesLabel2'
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
        UserName = 'DBImage22'
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
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RptCompGerLotesDBText1: TppDBText
        UserName = 'RptCompGerLotesDBText1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeCompGerLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object RptCompGerLotesDBText2: TppDBText
        UserName = 'RptCompGerLotesDBText2'
        DataField = 'SERIE'
        DataPipeline = bdeCompGerLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object RptCompGerLotesDBText3: TppDBText
        UserName = 'RptCompGerLotesDBText3'
        DataField = 'DATAVENCIM'
        DataPipeline = bdeCompGerLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object RptCompGerLotesDBText4: TppDBText
        UserName = 'RptCompGerLotesDBText4'
        DataField = 'PRECOVENCIM'
        DataPipeline = bdeCompGerLotes
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 64558
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
      object RptCompGerLotesDBText5: TppDBText
        UserName = 'RptCompGerLotesDBText5'
        DataField = 'IDLOTE'
        DataPipeline = bdeCompGerLotes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 101600
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object RptCompGerLotesDBText6: TppDBText
        UserName = 'RptCompGerLotesDBText6'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeCompGerLotes
        DisplayFormat = '###,###,###,##0.00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeCompGerLotes'
        mmHeight = 3704
        mmLeft = 128852
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel27: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel27'
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
        mmTop = 1588
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 1852
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
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptCompGerLotesGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeCompGerLotes
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptCompGerLotesGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeCompGerLotes'
      object RptCompGerLotesGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptCompGerLotesLabel9: TppLabel
          UserName = 'RptCompGerLotesLabel9'
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
        object RptCompGerLotesDBText7: TppDBText
          UserName = 'RptCompGerLotesDBText7'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeCompGerLotes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeCompGerLotes'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptCompGerLotesLine2: TppLine
          UserName = 'RptCompGerLotesLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptCompGerLotesGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object DsEnquadramento: TwwDataSource
    DataSet = QryEnquadramento
    Left = 333
    Top = 62
  end
  object DpEnquadramento: TppBDEPipeline
    DataSource = DsEnquadramento
    UserName = 'DpEnquadramento'
    Left = 333
    Top = 62
  end
  object PpEnquadramento: TppReport
    AutoStop = False
    DataPipeline = DpEnquadramento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 333
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'DpEnquadramento'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object PpEnquadramentoShape1: TppShape
        UserName = 'PpEnquadramentoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9525
        mmLeft = 0
        mmTop = 19579
        mmWidth = 284957
        BandType = 0
      end
      object PpEnquadramentoLine1: TppLine
        UserName = 'PpEnquadramentoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19579
        mmWidth = 284300
        BandType = 0
      end
      object LbTitMes2: TppLabel
        UserName = 'LbTitMes2'
        Caption = 'Mes2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 112713
        mmTop = 24606
        mmWidth = 8202
        BandType = 0
      end
      object LbTitMes3: TppLabel
        UserName = 'LbTitMes3'
        Caption = 'Mes3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 24606
        mmWidth = 8202
        BandType = 0
      end
      object LbTitMes21: TppLabel
        UserName = 'LbTitMes21'
        Caption = 'Mes1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 24606
        mmWidth = 8202
        BandType = 0
      end
      object LbTitMes22: TppLabel
        UserName = 'LbTitMes22'
        Caption = 'Mes2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 192882
        mmTop = 24606
        mmWidth = 7938
        BandType = 0
      end
      object LbTitMes23: TppLabel
        UserName = 'LbTitMes23'
        Caption = 'Mes3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 218282
        mmTop = 24605
        mmWidth = 7938
        BandType = 0
      end
      object LbTitMes1: TppLabel
        UserName = 'LbTitMes1'
        Caption = 'Mes1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 87313
        mmTop = 24871
        mmWidth = 8202
        BandType = 0
      end
      object PpEnquadramentoLabel1: TppLabel
        UserName = 'PpEnquadramentoLabel1'
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 98690
        mmTop = 19844
        mmWidth = 19579
        BandType = 0
      end
      object PpEnquadramentoLabel2: TppLabel
        UserName = 'PpEnquadramentoLabel2'
        Caption = 'VALOR DE MERCADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 176477
        mmTop = 19844
        mmWidth = 31485
        BandType = 0
      end
      object PpEnquadramentoLine5: TppLine
        UserName = 'PpEnquadramentoLine5'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 146844
        mmTop = 19579
        mmWidth = 2381
        BandType = 0
      end
      object PpEnquadramentoLine8: TppLine
        UserName = 'PpEnquadramentoLine8'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 226484
        mmTop = 19579
        mmWidth = 2381
        BandType = 0
      end
      object PpEnquadramentoLabel3: TppLabel
        UserName = 'PpEnquadramentoLabel3'
        Caption = '% Aplic.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 21167
        mmWidth = 12171
        BandType = 0
      end
      object PpEnquadramentoLine11: TppLine
        UserName = 'PpEnquadramentoLine11'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 254794
        mmTop = 19579
        mmWidth = 2381
        BandType = 0
      end
      object PpEnquadramentoLabel4: TppLabel
        UserName = 'PpEnquadramentoLabel4'
        Caption = '% Div.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 258498
        mmTop = 21167
        mmWidth = 9525
        BandType = 0
      end
      object LbDescRecursos: TppLabel
        UserName = 'LbDescRecursos'
        Caption = 'Recursos Garantidores em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 16404
        mmTop = 21167
        mmWidth = 35190
        BandType = 0
      end
      object LbVlrRecGarantidores: TppLabel
        UserName = 'LbVlrRecGarantidores'
        Caption = 'Valor Recursos Garantidores em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 11113
        mmTop = 25135
        mmWidth = 40481
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Demonstrativo Analítico de Enquadramento das Aplicações '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 101865
        BandType = 0
      end
      object ppLabel85: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label85'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraDemoAnalitEnqApl: TppLabel
        UserName = 'LCarteiraDemoAnalitEnqApl'
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
        mmLeft = 242359
        mmTop = 14288
        mmWidth = 12171
        BandType = 0
      end
      object RptEnquadraRenFixaDataRef: TppLabel
        UserName = 'RptEnquadraRenFixaDataRef'
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
      object ppDBImage15: TppDBImage
        UserName = 'DBImage15'
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
    object ppDetailBand11: TppDetailBand
      BeforePrint = ppDetailBand11BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object PnlFundoDetalhe: TppShape
        UserName = 'PnlFundoDetalhe'
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 12965
        mmTop = 265
        mmWidth = 284957
        BandType = 4
      end
      object LbDescInvestimento: TppLabel
        UserName = 'LbDescInvestimento'
        AutoSize = False
        Caption = 'LbDescInvestimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 1058
        mmWidth = 63500
        BandType = 4
      end
      object LbMes1: TppLabel
        UserName = 'LbMes1'
        AutoSize = False
        Caption = 'LbMes1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 70644
        mmTop = 1058
        mmWidth = 24871
        BandType = 4
      end
      object LbMes2: TppLabel
        UserName = 'LbMes2'
        AutoSize = False
        Caption = 'LbMes2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3703
        mmLeft = 96838
        mmTop = 1059
        mmWidth = 24872
        BandType = 4
      end
      object LbMes3: TppLabel
        UserName = 'LbMes3'
        AutoSize = False
        Caption = 'LbMes3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 1059
        mmWidth = 24871
        BandType = 4
      end
      object LbMes4: TppLabel
        UserName = 'LbMes4'
        AutoSize = False
        Caption = 'LbMes4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 150548
        mmTop = 1059
        mmWidth = 24871
        BandType = 4
      end
      object LbMes5: TppLabel
        UserName = 'LbMes5'
        AutoSize = False
        Caption = 'LbMes5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3703
        mmLeft = 176477
        mmTop = 1059
        mmWidth = 24872
        BandType = 4
      end
      object LbMes6: TppLabel
        UserName = 'LbMes6'
        AutoSize = False
        Caption = 'LbMes6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 202142
        mmTop = 1059
        mmWidth = 24871
        BandType = 4
      end
      object PpEnquadramentoLine3: TppLine
        UserName = 'PpEnquadramentoLine3'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 146844
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object PpEnquadramentoLine6: TppLine
        UserName = 'PpEnquadramentoLine6'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 226484
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object LbPerAplic: TppLabel
        UserName = 'LbPerAplic'
        AutoSize = False
        Caption = 'LbPerAplic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 230453
        mmTop = 1058
        mmWidth = 24871
        BandType = 4
      end
      object PpEnquadramentoLine9: TppLine
        UserName = 'PpEnquadramentoLine9'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7144
        mmLeft = 254794
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object LbPerDiv: TppLabel
        UserName = 'LbPerDiv'
        AutoSize = False
        Caption = 'LbPerDiv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 24871
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel30: TppLabel
        OnPrint = LblSistemaPrint
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
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
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
    object PpEnquadramentoGroup1: TppGroup
      BreakName = 'CODCLASSINVEST'
      DataPipeline = DpEnquadramento
      OutlineSettings.CreateNode = True
      UserName = 'PpEnquadramentoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DpEnquadramento'
      object PpEnquadramentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object PpEnquadramentoLine2: TppLine
          UserName = 'PpEnquadramentoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object PpEnquadramentoLine4: TppLine
          UserName = 'PpEnquadramentoLine4'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3175
          mmLeft = 146844
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object PpEnquadramentoLine7: TppLine
          UserName = 'PpEnquadramentoLine7'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3175
          mmLeft = 226484
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object PpEnquadramentoLine10: TppLine
          UserName = 'PpEnquadramentoLine10'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3175
          mmLeft = 254794
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
      end
      object PpEnquadramentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object updDemCustoCarteira: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOCAR = :SALDOCAR,'
      '  COTACAO = :COTACAO'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (SALDOCAR, COTACAO)'
      'values'
      '  (:SALDOCAR, :COTACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO and'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 441
    Top = 62
  end
  object updGerCarteira: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOATU = :SALDOATU,'
      '  QTDTITLOTE = :QTDTITLOTE,'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOCAR = :SALDOCAR,'
      '  COTACAO = :COTACAO,'
      '  TOTCART = :TOTCART,'
      '  TOTACAOTIPO = :TOTACAOTIPO,'
      '  TOTACAO = :TOTACAO'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOAQUI, SALDOATU, QTDTITLOTE, SALDOQTDEINVCART, SALDOCAR, ' +
        'COTACAO, '
      '   TOTCART, TOTACAOTIPO, TOTACAO)'
      'values'
      
        '  (:SALDOAQUI, :SALDOATU, :QTDTITLOTE, :SALDOQTDEINVCART, :SALDO' +
        'CAR, :COTACAO, '
      '   :TOTCART, :TOTACAOTIPO, :TOTACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 333
    Top = 308
  end
  object updProvisaoIR: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDOQTDEINVCART = :SALDOQTDEINVCART,'
      '  SALDOVLRCARTINV = :SALDOVLRCARTINV,'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOVLRANT = :SALDOVLRANT,'
      '  SALDOAQUIANT = :SALDOAQUIANT,'
      '  COTACAO = :COTACAO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (SALDOQTDEINVCART, SALDOVLRCARTINV, SALDOAQUI, SALDOVLRANT, SA' +
        'LDOAQUIANT, '
      '   COTACAO)'
      'values'
      
        '  (:SALDOQTDEINVCART, :SALDOVLRCARTINV, :SALDOAQUI, :SALDOVLRANT' +
        ', :SALDOAQUIANT, '
      '   :COTACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 35
    Top = 437
  end
  object DtsValIndic: TwwDataSource
    DataSet = QryValIndic
    Left = 669
    Top = 183
  end
  object BdeValIndic: TppBDEPipeline
    DataSource = DtsValIndic
    UserName = 'BdeValIndic'
    Left = 669
    Top = 183
  end
  object RptValIndic: TppReport
    AutoStop = False
    DataPipeline = BdeValIndic
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
    Left = 669
    Top = 131
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'BdeValIndic'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Sigla do Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 21960
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 21960
        mmWidth = 8996
        BandType = 0
      end
      object RptValIndicLine1: TppLine
        UserName = 'RptValIndicLine1'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 794
        mmTop = 27252
        mmWidth = 194734
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'Label134'
        Caption = 'Consulta Valor dos Indicadores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel135: TppLabel
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
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraEmissor: TppLabel
        UserName = 'Carteira1'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object LblPeriodo: TppLabel
        UserName = 'LData1'
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
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
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
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object RptValIndicDBText3: TppDBText
        UserName = 'RptValIndicDBText3'
        DataField = 'VLRPARAMEMISSOR'
        DataPipeline = BdeValIndic
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeValIndic'
        mmHeight = 4233
        mmLeft = 77788
        mmTop = 794
        mmWidth = 44979
        BandType = 4
      end
      object RptValIndicDBText1: TppDBText
        UserName = 'RptValIndicDBText1'
        DataField = 'DATAREFPREMISSOR'
        DataPipeline = BdeValIndic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeValIndic'
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 794
        mmWidth = 26988
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1852
        mmWidth = 194469
        BandType = 8
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
        Caption = 'PÁG.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 3704
        mmWidth = 31221
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 182298
        mmTop = 3969
        mmWidth = 9525
        BandType = 8
      end
    end
    object RptValIndicGroup1: TppGroup
      BreakName = 'IDEMISSOR'
      DataPipeline = BdeValIndic
      OutlineSettings.CreateNode = True
      UserName = 'RptValIndicGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeValIndic'
      object RptValIndicGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'ppDBText1'
          DataField = 'SIGLAEMISSOR'
          DataPipeline = BdeValIndic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          DataPipelineName = 'BdeValIndic'
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 1852
          mmWidth = 58473
          BandType = 3
          GroupNo = 0
        end
        object RptValIndicLine2: TppLine
          UserName = 'RptValIndicLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2910
          mmTop = 265
          mmWidth = 194734
          BandType = 3
          GroupNo = 0
        end
      end
      object RptValIndicGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptValIndicGroup2: TppGroup
      BreakName = 'DESCPARAMEMISSOR'
      DataPipeline = BdeValIndic
      OutlineSettings.CreateNode = True
      UserName = 'RptValIndicGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeValIndic'
      object RptValIndicGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine21: TppLine
          UserName = 'ppLine21'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2910
          mmTop = 6085
          mmWidth = 194734
          BandType = 3
          GroupNo = 1
        end
        object RptValIndicDBText2: TppDBText
          UserName = 'RptValIndicDBText2'
          DataField = 'DESCPARAMEMISSOR'
          DataPipeline = BdeValIndic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BdeValIndic'
          mmHeight = 4233
          mmLeft = 3704
          mmTop = 1588
          mmWidth = 57415
          BandType = 3
          GroupNo = 1
        end
      end
      object RptValIndicGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsEnquadraRenFixa: TwwDataSource
    DataSet = qryEnquadraRenFixa
    Left = 441
    Top = 437
  end
  object bdeEnquadraRenFixa: TppBDEPipeline
    DataSource = dsEnquadraRenFixa
    UserName = 'bdeEnquadraRenFixa'
    Left = 441
    Top = 437
  end
  object RptEnquadraRenFixa: TppReport
    AutoStop = False
    DataPipeline = bdeEnquadraRenFixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 441
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeEnquadraRenFixa'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21696
        mmWidth = 284300
        BandType = 0
      end
      object RptEnquadraRenFixaLine1: TppLine
        UserName = 'RptEnquadraRenFixaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object RptEnquadraRenFixaLabel2: TppLabel
        UserName = 'RptEnquadraRenFixaLabel2'
        Caption = 'Instituição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 265
        mmTop = 22754
        mmWidth = 10583
        BandType = 0
      end
      object RptEnquadraRenFixaLabel3: TppLabel
        UserName = 'RptEnquadraRenFixaLabel3'
        Caption = 'Dt.Aplic.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 42069
        mmTop = 22754
        mmWidth = 8467
        BandType = 0
      end
      object RptEnquadraRenFixaLabel5: TppLabel
        UserName = 'RptEnquadraRenFixaLabel5'
        Caption = 'Valor Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 76729
        mmTop = 22754
        mmWidth = 14817
        BandType = 0
      end
      object RptEnquadraRenFixaLabel6: TppLabel
        UserName = 'RptEnquadraRenFixaLabel6'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 107421
        mmTop = 22754
        mmWidth = 5821
        BandType = 0
      end
      object RptEnquadraRenFixaLabel7: TppLabel
        UserName = 'RptEnquadraRenFixaLabel7'
        Caption = 'Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 196850
        mmTop = 22754
        mmWidth = 8202
        BandType = 0
      end
      object RptEnquadraRenFixaLabel8: TppLabel
        UserName = 'RptEnquadraRenFixaLabel8'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 222780
        mmTop = 22754
        mmWidth = 5821
        BandType = 0
      end
      object RptEnquadraRenFixaLabel10: TppLabel
        UserName = 'RptEnquadraRenFixaLabel10'
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 230188
        mmTop = 22754
        mmWidth = 6085
        BandType = 0
      end
      object RptEnquadraRenFixaLabel11: TppLabel
        UserName = 'RptEnquadraRenFixaLabel11'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 254530
        mmTop = 22754
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = 'Dt. Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 55563
        mmTop = 22754
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 121179
        mmTop = 22754
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'Ágio / Deságio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 145257
        mmTop = 22754
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel131: TppLabel
        UserName = 'Label1301'
        Caption = 'Rendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 170921
        mmTop = 22754
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'Aplicações Financeiras por Classificação de Instituição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 93398
        BandType = 0
      end
      object ppLabel139: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label139'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraClassFinanc: TppLabel
        UserName = 'LCarteiraClassFinanc'
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
        mmLeft = 248180
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptEnquadraRenFixaDataRef1: TppLabel
        UserName = 'RptEnquadraRenFixaDataRef1'
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
      object ppDBImage11: TppDBImage
        UserName = 'DBImage11'
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
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object RptEnquadraRenFixaDBText3: TppDBText
        UserName = 'RptEnquadraRenFixaDBText3'
        DataField = 'NOME'
        DataPipeline = bdeEnquadraRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 41275
        BandType = 4
      end
      object RptEnquadraRenFixaDBText6: TppDBText
        UserName = 'RptEnquadraRenFixaDBText6'
        AutoSize = True
        DataField = 'VALAPLIC'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 81227
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object RptEnquadraRenFixaDBText7: TppDBText
        UserName = 'RptEnquadraRenFixaDBText7'
        DataField = 'JUROS'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object RptEnquadraRenFixaDBText8: TppDBText
        UserName = 'RptEnquadraRenFixaDBText8'
        DataField = 'RESGATE'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object RptEnquadraRenFixaDBText9: TppDBText
        UserName = 'RptEnquadraRenFixaDBText9'
        DataField = 'SALDO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 207434
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object RptEnquadraRenFixaDBText12: TppDBText
        UserName = 'RptEnquadraRenFixaDBText12'
        DataField = 'MOEDESC'
        DataPipeline = bdeEnquadraRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 230188
        mmTop = 529
        mmWidth = 24342
        BandType = 4
      end
      object RptEnquadraRenFixaDBText13: TppDBText
        UserName = 'RptEnquadraRenFixaDBText13'
        DataField = 'DESCTIPJUROS'
        DataPipeline = bdeEnquadraRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 266965
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object RptEnquadraRenFixaLabel17: TppLabel
        UserName = 'RptEnquadraRenFixaLabel17'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 264055
        mmTop = 529
        mmWidth = 1852
        BandType = 4
      end
      object RptEnquadraRenFixaDBText14: TppDBText
        UserName = 'RptEnquadraRenFixaDBText14'
        DataField = 'JUROSRENFIX'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 255059
        mmTop = 529
        mmWidth = 8202
        BandType = 4
      end
      object RptEnquadraRenFixaDBText5: TppDBText
        UserName = 'RptEnquadraRenFixaDBText5'
        AutoSize = True
        DataField = 'DATAINICIAL'
        DataPipeline = bdeEnquadraRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 42069
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        AutoSize = True
        DataField = 'DATAVENCTITRENFIX'
        DataPipeline = bdeEnquadraRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 55563
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'VARIACAO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'AGIO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 138377
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'RENDTO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 3175
        mmLeft = 161396
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
    end
    object RptEnquadraRenFixaFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object RptEnquadraRenFixaLine6: TppLine
        UserName = 'RptEnquadraRenFixaLine6'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 265
        mmTop = 8996
        mmWidth = 283898
        BandType = 8
      end
      object RptEnquadraRenFixaLabel21: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'RptEnquadraRenFixaLabel21'
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
        mmTop = 11113
        mmWidth = 197909
        BandType = 8
      end
      object RptEnquadraRenFixaCalc1: TppSystemVariable
        UserName = 'RptEnquadraRenFixaCalc1'
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
        mmTop = 11377
        mmWidth = 265378
        BandType = 8
      end
      object RptEnquadraRenFixaCalc2: TppSystemVariable
        UserName = 'RptEnquadraRenFixaCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 239713
        mmTop = 11377
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptEnquadraRenFixaSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptEnquadraRenFixaLabel19: TppLabel
        UserName = 'RptEnquadraRenFixaLabel19'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 65881
        mmTop = 8731
        mmWidth = 11113
        BandType = 7
      end
      object RptEnquadraRenFixaDBCalc9: TppDBCalc
        UserName = 'RptEnquadraRenFixaDBCalc9'
        DataField = 'VALAPLIC'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 83608
        mmTop = 8731
        mmWidth = 24871
        BandType = 7
      end
      object RptEnquadraRenFixaDBCalc10: TppDBCalc
        UserName = 'RptEnquadraRenFixaDBCalc10'
        DataField = 'RENDIMENTO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 109009
        mmTop = 8731
        mmWidth = 26194
        BandType = 7
      end
      object RptEnquadraRenFixaLine7: TppLine
        UserName = 'RptEnquadraRenFixaLine7'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 82550
        mmTop = 7408
        mmWidth = 110067
        BandType = 7
      end
      object RptEnquadraRenFixaDBCalc11: TppDBCalc
        UserName = 'RptEnquadraRenFixaDBCalc11'
        DataField = 'RESGATE'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 135732
        mmTop = 8731
        mmWidth = 27252
        BandType = 7
      end
      object RptEnquadraRenFixaDBCalc12: TppDBCalc
        UserName = 'RptEnquadraRenFixaDBCalc12'
        DataField = 'SALDO'
        DataPipeline = bdeEnquadraRenFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeEnquadraRenFixa'
        mmHeight = 2381
        mmLeft = 164042
        mmTop = 8731
        mmWidth = 28310
        BandType = 7
      end
    end
    object RptEnquadraRenFixaGroup2: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeEnquadraRenFixa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptEnquadraRenFixaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeEnquadraRenFixa'
      object RptEnquadraRenFixaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object RptEnquadraRenFixaLabel12: TppLabel
          UserName = 'RptEnquadraRenFixaLabel12'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 1058
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object RptEnquadraRenFixaLabel13: TppLabel
          UserName = 'RptEnquadraRenFixaLabel13'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 1058
          mmTop = 794
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object RptEnquadraRenFixaDBText2: TppDBText
          UserName = 'RptEnquadraRenFixaDBText2'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeEnquadraRenFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
      end
      object RptEnquadraRenFixaGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptEnquadraRenFixaDBCalc5: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc5'
          DataField = 'VALAPLIC'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 69055
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object RptEnquadraRenFixaDBCalc6: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc6'
          DataField = 'JUROS'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object RptEnquadraRenFixaDBCalc7: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc7'
          DataField = 'RESGATE'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 184415
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object RptEnquadraRenFixaDBCalc8: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc8'
          DataField = 'SALDO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 207434
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object RptEnquadraRenFixaLabel14: TppLabel
          UserName = 'RptEnquadraRenFixaLabel14'
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 48154
          mmTop = 1588
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object RptEnquadraRenFixaLine5: TppLine
          UserName = 'RptEnquadraRenFixaLine5'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 68527
          mmTop = 529
          mmWidth = 162560
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VARIACAO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 115095
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'AGIO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 138377
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'RENDTO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 161397
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptEnquadraRenFixaGroup3: TppGroup
      BreakName = 'CODCLASS'
      DataPipeline = bdeEnquadraRenFixa
      OutlineSettings.CreateNode = True
      UserName = 'RptEnquadraRenFixaGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 25400
      DataPipelineName = 'bdeEnquadraRenFixa'
      object RptEnquadraRenFixaGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptEnquadraRenFixaLabel16: TppLabel
          UserName = 'RptEnquadraRenFixaLabel16'
          Caption = 'Classif.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object RptEnquadraRenFixaDBText4: TppDBText
          UserName = 'RptEnquadraRenFixaDBText4'
          AutoSize = True
          DataField = 'DESCCLASS'
          DataPipeline = bdeEnquadraRenFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 2381
          mmLeft = 14817
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object RptEnquadraRenFixaLine2: TppLine
          UserName = 'RptEnquadraRenFixaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object RptEnquadraRenFixaLine3: TppLine
          UserName = 'RptEnquadraRenFixaLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object RptEnquadraRenFixaLine8: TppLine
          UserName = 'RptEnquadraRenFixaLine8'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object RptEnquadraRenFixaLine9: TppLine
          UserName = 'RptEnquadraRenFixaLine9'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object RptEnquadraRenFixaGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptEnquadraRenFixaDBCalc1: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc1'
          DataField = 'VALAPLIC'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 69055
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object RptEnquadraRenFixaDBCalc2: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc2'
          DataField = 'JUROS'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object RptEnquadraRenFixaDBCalc3: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc3'
          DataField = 'RESGATE'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 184415
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object RptEnquadraRenFixaDBCalc4: TppDBCalc
          UserName = 'RptEnquadraRenFixaDBCalc4'
          DataField = 'SALDO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 207434
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object RptEnquadraRenFixaLabel15: TppLabel
          UserName = 'RptEnquadraRenFixaLabel15'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 59531
          mmTop = 1852
          mmWidth = 5027
          BandType = 5
          GroupNo = 1
        end
        object RptEnquadraRenFixaLine4: TppLine
          UserName = 'RptEnquadraRenFixaLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 68580
          mmTop = 529
          mmWidth = 162560
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VARIACAO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 115095
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'AGIO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 138642
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'RENDTO'
          DataPipeline = bdeEnquadraRenFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = RptEnquadraRenFixaGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeEnquadraRenFixa'
          mmHeight = 3175
          mmLeft = 161397
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updEnquadraRenFixa: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  CODCLASS = :CODCLASS,'
      '  DESCCLASS = :DESCCLASS,'
      '  DATAINICIAL = :DATAINICIAL,'
      '  VALAPLIC = :VALAPLIC,'
      '  RENDIMENTO = :RENDIMENTO,'
      '  RESGATE = :RESGATE,'
      '  SALDO = :SALDO,'
      '  TAXAOVER = :TAXAOVER'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (CODCLASS, DESCCLASS, DATAINICIAL, VALAPLIC, RENDIMENTO, RESGA' +
        'TE, SALDO, '
      '   TAXAOVER)'
      'values'
      
        '  (:CODCLASS, :DESCCLASS, :DATAINICIAL, :VALAPLIC, :RENDIMENTO, ' +
        ':RESGATE, '
      '   :SALDO, :TAXAOVER)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 441
    Top = 437
  end
  object dsRentRendaFixa: TwwDataSource
    DataSet = qryRentRendaFixa
    Left = 567
    Top = 183
  end
  object bdeRentRendaFixa: TppBDEPipeline
    DataSource = dsRentRendaFixa
    UserName = 'bdeRentRendaFixa'
    Left = 567
    Top = 183
  end
  object RptRentRendaFixa: TppReport
    AutoStop = False
    DataPipeline = bdeRentRendaFixa
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
    Left = 567
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeRentRendaFixa'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197300
        BandType = 0
      end
      object RptRentRendaFixaLine1: TppLine
        UserName = 'RptRentRendaFixaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21696
        mmWidth = 197300
        BandType = 0
      end
      object RptRentRendaFixaLabel6: TppLabel
        UserName = 'RptRentRendaFixaLabel6'
        Caption = 'Tipo de Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 22754
        mmWidth = 25400
        BandType = 0
      end
      object RptRentRendaFixaLabel7: TppLabel
        UserName = 'RptRentRendaFixaLabel7'
        Caption = 'Rentabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 22754
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label1'
        Caption = 'Rentabilidade por Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 61383
        BandType = 0
      end
      object ppLabel113: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label113'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraRendaFixa: TppLabel
        UserName = 'LCarteiraRendaFixa'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptRentRendaFixaDtIni: TppLabel
        UserName = 'RptRentRendaFixaDtIni'
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
        UserName = 'DBImage6'
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
      object RptRentRendaFixaDtFim: TppLabel
        UserName = 'RptRentRendaFixaDtFim'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'Label83'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 37306
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptRentRendaFixaDBText2: TppDBText
        UserName = 'RptRentRendaFixaDBText2'
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeRentRendaFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeRentRendaFixa'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 794
        mmWidth = 79904
        BandType = 4
      end
      object RptRentRendaFixaDBText3: TppDBText
        UserName = 'RptRentRendaFixaDBText3'
        DataField = 'SALDOREND'
        DataPipeline = bdeRentRendaFixa
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeRentRendaFixa'
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel40: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel40'
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
        mmTop = 1323
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
        mmTop = 1588
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
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 27781
        BandType = 8
      end
    end
    object RptRentRendaFixaGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeRentRendaFixa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptRentRendaFixaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeRentRendaFixa'
      object RptRentRendaFixaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptRentRendaFixaLabel5: TppLabel
          UserName = 'RptRentRendaFixaLabel5'
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
        object RptRentRendaFixaDBText1: TppDBText
          UserName = 'RptRentRendaFixaDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeRentRendaFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeRentRendaFixa'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptRentRendaFixaLine2: TppLine
          UserName = 'RptRentRendaFixaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptRentRendaFixaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptRentRendaFixaDBCalc1: TppDBCalc
          UserName = 'RptRentRendaFixaDBCalc1'
          DataField = 'SALDOREND'
          DataPipeline = bdeRentRendaFixa
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeRentRendaFixa'
          mmHeight = 3704
          mmLeft = 83344
          mmTop = 1058
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object RptRentRendaFixaLine3: TppLine
          UserName = 'RptRentRendaFixaLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object RptRentRendaFixaLabel8: TppLabel
          UserName = 'RptRentRendaFixaLabel8'
          Caption = 'T O T A L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 65352
          mmTop = 1058
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updRentRendaFixa: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  RENDIMENTO = :RENDIMENTO'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (RENDIMENTO)'
      'values'
      '  (:RENDIMENTO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA')
    Left = 567
    Top = 183
  end
  object dsResumoOper: TwwDataSource
    DataSet = qryResumoOper
    Left = 567
    Top = 62
  end
  object bdeResumoOper: TppBDEPipeline
    DataSource = dsResumoOper
    UserName = 'bdeResumoOper'
    Left = 567
    Top = 62
  end
  object RptResumoOper: TppReport
    AutoStop = False
    DataPipeline = bdeResumoOper
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 567
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeResumoOper'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21167
        mmWidth = 284300
        BandType = 0
      end
      object RptResumoOperLine1: TppLine
        UserName = 'RptResumoOperLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21696
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
        mmLeft = 794
        mmTop = 23019
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
        mmLeft = 16933
        mmTop = 23019
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
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 23019
        mmWidth = 25400
        BandType = 0
      end
      object RptResumoOperLabel8: TppLabel
        UserName = 'RptResumoOperLabel8'
        Caption = 'Instituição Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 23283
        mmWidth = 30692
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
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 23283
        mmWidth = 20902
        BandType = 0
      end
      object RptResumoOperLabel10: TppLabel
        UserName = 'RptResumoOperLabel10'
        Caption = 'Rendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 183621
        mmTop = 23283
        mmWidth = 17727
        BandType = 0
      end
      object RptResumoOperLabel11: TppLabel
        UserName = 'RptResumoOperLabel11'
        Caption = 'Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 224632
        mmTop = 23283
        mmWidth = 11906
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 264055
        mmTop = 23283
        mmWidth = 7408
        BandType = 0
      end
      object RptResumoOperLine2: TppLine
        UserName = 'RptResumoOperLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 28575
        mmTop = 23019
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Resumo de Operações Financeiras por Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 77523
        BandType = 0
      end
      object ppLabel38: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label38'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraOperBoleta: TppLabel
        UserName = 'LCarteiraOperBoleta'
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
        mmLeft = 259292
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptResumoOperDataRef: TppLabel
        UserName = 'RptResumoOperDataRef'
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
      object ppDBImage7: TppDBImage
        UserName = 'DBImage7'
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
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptResumoOperDBText2: TppDBText
        UserName = 'RptResumoOperDBText2'
        DataField = 'IDLOTE'
        DataPipeline = bdeResumoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 11906
        BandType = 4
      end
      object RptResumoOperDBText4: TppDBText
        UserName = 'RptResumoOperDBText4'
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeResumoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
      object RptResumoOperDBText5: TppDBText
        UserName = 'RptResumoOperDBText5'
        DataField = 'NOME'
        DataPipeline = bdeResumoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 794
        mmWidth = 61913
        BandType = 4
      end
      object RptResumoOperDBText6: TppDBText
        UserName = 'RptResumoOperDBText6'
        DataField = 'VALAPLIC'
        DataPipeline = bdeResumoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 794
        mmWidth = 29633
        BandType = 4
      end
      object RptResumoOperDBText7: TppDBText
        UserName = 'RptResumoOperDBText7'
        DataField = 'RENDIMENTO'
        DataPipeline = bdeResumoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 794
        mmWidth = 30956
        BandType = 4
      end
      object RptResumoOperDBText8: TppDBText
        UserName = 'RptResumoOperDBText8'
        DataField = 'RESGATE'
        DataPipeline = bdeResumoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 201877
        mmTop = 794
        mmWidth = 34660
        BandType = 4
      end
      object RptResumoOperDBText9: TppDBText
        UserName = 'RptResumoOperDBText9'
        DataField = 'SALDO'
        DataPipeline = bdeResumoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 238390
        mmTop = 794
        mmWidth = 33602
        BandType = 4
      end
      object RptResumoOperDBText3: TppDBText
        UserName = 'RptResumoOperDBText3'
        AutoSize = True
        DataField = 'DATAINICIAL'
        DataPipeline = bdeResumoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3175
        mmLeft = 13229
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'FLGATIVO'
        DataPipeline = bdeResumoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3175
        mmLeft = 30692
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel36: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel36'
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
      object ppCalc23: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'Calc23'
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
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
    object RptResumoOperGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeResumoOper
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptResumoOperGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeResumoOper'
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
          mmLeft = 1058
          mmTop = 794
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object RptResumoOperDBText1: TppDBText
          UserName = 'RptResumoOperDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeResumoOper
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeResumoOper'
          mmHeight = 3704
          mmLeft = 14817
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
        object RptResumoOperDBCalc1: TppDBCalc
          UserName = 'RptResumoOperDBCalc1'
          DataField = 'VALAPLIC'
          DataPipeline = bdeResumoOper
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper'
          mmHeight = 3704
          mmLeft = 140229
          mmTop = 1323
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object RptResumoOperDBCalc2: TppDBCalc
          UserName = 'RptResumoOperDBCalc2'
          DataField = 'RENDIMENTO'
          DataPipeline = bdeResumoOper
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper'
          mmHeight = 3704
          mmLeft = 170392
          mmTop = 1323
          mmWidth = 30956
          BandType = 5
          GroupNo = 0
        end
        object RptResumoOperDBCalc3: TppDBCalc
          UserName = 'RptResumoOperDBCalc3'
          DataField = 'RESGATE'
          DataPipeline = bdeResumoOper
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper'
          mmHeight = 3704
          mmLeft = 202142
          mmTop = 1323
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object RptResumoOperDBCalc4: TppDBCalc
          UserName = 'RptResumoOperDBCalc4'
          DataField = 'SALDO'
          DataPipeline = bdeResumoOper
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeResumoOper'
          mmHeight = 3704
          mmLeft = 238390
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
          Caption = 'T O T A I S'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 77257
          mmTop = 1058
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updResumoOper: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAINICIAL = :DATAINICIAL,'
      '  VALAPLIC = :VALAPLIC,'
      '  RENDIMENTO = :RENDIMENTO,'
      '  RESGATE = :RESGATE,'
      '  SALDO = :SALDO'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA and'
      '  IDLOTE = :OLD_IDLOTE')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (DATAINICIAL, VALAPLIC, RENDIMENTO, RESGATE, SALDO)'
      'values'
      '  (:DATAINICIAL, :VALAPLIC, :RENDIMENTO, :RESGATE, :SALDO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCCARTINVEST = :OLD_DESCCARTINVEST and'
      '  DESCTIPRENFIXA = :OLD_DESCTIPRENFIXA and'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 567
    Top = 62
  end
  object dsBoletaRenFixa: TwwDataSource
    DataSet = qryBoletaRenFixa
    Left = 333
    Top = 437
  end
  object bdeBoletaRenFixa: TppBDEPipeline
    DataSource = dsBoletaRenFixa
    UserName = 'bdeBoletaRenFixa'
    Left = 333
    Top = 437
  end
  object updBoletaRenFixa: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  TAXAOVER = :TAXAOVER,'
      '  VALORJUROS = :VALORJUROS'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (TAXAOVER, VALORJUROS)'
      'values'
      '  (:TAXAOVER, :VALORJUROS)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 333
    Top = 437
  end
  object updGerCartSintetico: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  EMPRESAS = :EMPRESAS,'
      '  VALORMERCADO = :VALORMERCADO,'
      '  SALDOATU = :SALDOATU,'
      '  SALDOAQUI = :SALDOAQUI,'
      '  SALDOCAR = :SALDOCAR,'
      '  TOTCART = :TOTCART'
      'where'
      '  DESCSETOREMISSOR = :OLD_DESCSETOREMISSOR and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (EMPRESAS, VALORMERCADO, SALDOATU, SALDOAQUI, SALDOCAR, TOTCAR' +
        'T)'
      'values'
      
        '  (:EMPRESAS, :VALORMERCADO, :SALDOATU, :SALDOAQUI, :SALDOCAR, :' +
        'TOTCART)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCSETOREMISSOR = :OLD_DESCSETOREMISSOR and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST')
    Left = 237
    Top = 308
  end
  object dsLimBancos: TwwDataSource
    DataSet = qryLimBancos
    Left = 237
    Top = 437
  end
  object bdeLimBancos: TppBDEPipeline
    DataSource = dsLimBancos
    UserName = 'bdeLimBancos'
    Left = 237
    Top = 437
  end
  object RptLimBancos: TppReport
    AutoStop = False
    DataPipeline = bdeLimBancos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 237
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeLimBancos'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21167
        mmWidth = 284300
        BandType = 0
      end
      object RptLimBancosLabel3: TppLabel
        UserName = 'RptLimBancosLabel3'
        Caption = 'Instituição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 22225
        mmWidth = 15081
        BandType = 0
      end
      object RptLimBancosLabel4: TppLabel
        UserName = 'RptLimBancosLabel4'
        Caption = 'Class.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 22225
        mmWidth = 8996
        BandType = 0
      end
      object RptLimBancosLabel5: TppLabel
        UserName = 'RptLimBancosLabel5'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 37042
        mmTop = 22225
        mmWidth = 6085
        BandType = 0
      end
      object RptLimBancosLabel6: TppLabel
        UserName = 'RptLimBancosLabel6'
        Caption = 'Patr.  Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 22225
        mmWidth = 19050
        BandType = 0
      end
      object RptLimBancosLabel7: TppLabel
        UserName = 'RptLimBancosLabel7'
        Caption = 'Limites'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 22225
        mmWidth = 11906
        BandType = 0
      end
      object RptLimBancosLabel8: TppLabel
        UserName = 'RptLimBancosLabel8'
        Caption = 'Aplicações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 22225
        mmWidth = 15875
        BandType = 0
      end
      object RptLimBancosLabel9: TppLabel
        UserName = 'RptLimBancosLabel9'
        Caption = '01 Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 26988
        mmWidth = 8202
        BandType = 0
      end
      object RptLimBancosLabel10: TppLabel
        UserName = 'RptLimBancosLabel10'
        Caption = '30 Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127529
        mmTop = 26988
        mmWidth = 10054
        BandType = 0
      end
      object RptLimBancosLabel11: TppLabel
        UserName = 'RptLimBancosLabel11'
        Caption = '60 Dias ou mais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 26988
        mmWidth = 22490
        BandType = 0
      end
      object RptLimBancosLabel12: TppLabel
        UserName = 'RptLimBancosLabel12'
        Caption = '(A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 31750
        mmWidth = 4233
        BandType = 0
      end
      object RptLimBancosLabel13: TppLabel
        UserName = 'RptLimBancosLabel13'
        Caption = '(A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 108479
        mmTop = 31750
        mmWidth = 4233
        BandType = 0
      end
      object RptLimBancosLabel14: TppLabel
        UserName = 'RptLimBancosLabel14'
        Caption = '(A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 31750
        mmWidth = 4233
        BandType = 0
      end
      object RptLimBancosLabel15: TppLabel
        UserName = 'RptLimBancosLabel15'
        Caption = '(A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 31750
        mmWidth = 4233
        BandType = 0
      end
      object RptLimBancosLabel16: TppLabel
        UserName = 'RptLimBancosLabel16'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 26988
        mmWidth = 9790
        BandType = 0
      end
      object RptLimBancosLabel17: TppLabel
        UserName = 'RptLimBancosLabel17'
        Caption = 'Folga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 219340
        mmTop = 22225
        mmWidth = 7673
        BandType = 0
      end
      object RptLimBancosLabel18: TppLabel
        UserName = 'RptLimBancosLabel18'
        Caption = '(A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 32015
        mmWidth = 4233
        BandType = 0
      end
      object RptLimBancosLabel19: TppLabel
        UserName = 'RptLimBancosLabel19'
        Caption = '(A) - (E)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 194998
        mmTop = 32015
        mmWidth = 10583
        BandType = 0
      end
      object RptLimBancosLabel20: TppLabel
        UserName = 'RptLimBancosLabel20'
        Caption = '(E) / (A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 210080
        mmTop = 32015
        mmWidth = 10319
        BandType = 0
      end
      object RptLimBancosLabel21: TppLabel
        UserName = 'RptLimBancosLabel21'
        Caption = '(E+F) / (A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 222780
        mmTop = 32015
        mmWidth = 13494
        BandType = 0
      end
      object RptLimBancosLabel22: TppLabel
        UserName = 'RptLimBancosLabel22'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 213784
        mmTop = 27252
        mmWidth = 2381
        BandType = 0
      end
      object RptLimBancosLabel23: TppLabel
        UserName = 'RptLimBancosLabel23'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 227542
        mmTop = 27252
        mmWidth = 2381
        BandType = 0
      end
      object RptLimBancosLabel24: TppLabel
        UserName = 'RptLimBancosLabel24'
        Caption = 'Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 22225
        mmWidth = 10054
        BandType = 0
      end
      object RptLimBancosLabel25: TppLabel
        UserName = 'RptLimBancosLabel25'
        Caption = '(F)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 246328
        mmTop = 32015
        mmWidth = 3704
        BandType = 0
      end
      object RptLimBancosLabel26: TppLabel
        UserName = 'RptLimBancosLabel26'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 261673
        mmTop = 22225
        mmWidth = 2117
        BandType = 0
      end
      object RptLimBancosLabel27: TppLabel
        UserName = 'RptLimBancosLabel27'
        Caption = 'Part.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 32544
        mmWidth = 6085
        BandType = 0
      end
      object RptLimBancosLine1: TppLine
        UserName = 'RptLimBancosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35454
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Limite dos Bancos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel20: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label20'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraLimBco: TppLabel
        UserName = 'LCarteiraLimBco'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        mmHeight = 3704
        mmLeft = 251619
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object RptLimBancosDataRef: TppLabel
        UserName = 'RptLimBancosDataRef'
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
      object ppDBImage19: TppDBImage
        UserName = 'DBImage19'
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
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object RptLimBancosDBText1: TppDBText
        UserName = 'RptLimBancosDBText1'
        DataField = 'SIGLAEMISSOR'
        DataPipeline = bdeLimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptLimBancosDBText2: TppDBText
        UserName = 'RptLimBancosDBText2'
        DataField = 'SIGLACLASSINSTFIN'
        DataPipeline = bdeLimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object RptLimBancosDBText3: TppDBText
        UserName = 'RptLimBancosDBText3'
        DataField = 'DATA'
        DataPipeline = bdeLimBancos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 36513
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
      object RptLimBancosDBText4: TppDBText
        UserName = 'RptLimBancosDBText4'
        DataField = 'PATRIMONIO'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object RptLimBancosDBText5: TppDBText
        UserName = 'RptLimBancosDBText5'
        DataField = 'PARTICIPACAO'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object RptLimBancosDBText6: TppDBText
        UserName = 'RptLimBancosDBText6'
        DataField = 'FOLGA2'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object RptLimBancosDBText7: TppDBText
        UserName = 'RptLimBancosDBText7'
        DataField = 'LIMITE'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 75142
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object RptLimBancosDBText8: TppDBText
        UserName = 'RptLimBancosDBText8'
        DataField = 'APLIC1D'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object RptLimBancosDBText9: TppDBText
        UserName = 'RptLimBancosDBText9'
        DataField = 'APLIC30D'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object RptLimBancosDBText10: TppDBText
        UserName = 'RptLimBancosDBText10'
        DataField = 'APLIC60D'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object RptLimBancosDBText11: TppDBText
        UserName = 'RptLimBancosDBText11'
        DataField = 'TOTAL'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 167746
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object RptLimBancosDBText12: TppDBText
        UserName = 'RptLimBancosDBText12'
        DataField = 'FOLGA1'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 189707
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object RptLimBancosDBText13: TppDBText
        UserName = 'RptLimBancosDBText13'
        DataField = 'FOLGA3'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 223838
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object RptLimBancosDBText14: TppDBText
        UserName = 'RptLimBancosDBText14'
        DataField = 'FUNDOS'
        DataPipeline = bdeLimBancos
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeLimBancos'
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel51: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel51'
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
        mmWidth = 267230
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
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
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 240771
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updLimBancos: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATA = :DATA,'
      '  PATRIMONIO = :PATRIMONIO,'
      '  LIMITE = :LIMITE,'
      '  APLIC1D = :APLIC1D,'
      '  APLIC30D = :APLIC30D,'
      '  APLIC60D = :APLIC60D,'
      '  TOTAL = :TOTAL,'
      '  FOLGA1 = :FOLGA1,'
      '  FOLGA2 = :FOLGA2,'
      '  FOLGA3 = :FOLGA3,'
      '  FUNDOS = :FUNDOS,'
      '  PARTICIPACAO = :PARTICIPACAO'
      'where'
      '  SIGLAEMISSOR = :OLD_SIGLAEMISSOR')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATA, PATRIMONIO, LIMITE, APLIC1D, APLIC30D, APLIC60D, TOTAL,' +
        ' FOLGA1, '
      '   FOLGA2, FOLGA3, FUNDOS, PARTICIPACAO)'
      'values'
      
        '  (:DATA, :PATRIMONIO, :LIMITE, :APLIC1D, :APLIC30D, :APLIC60D, ' +
        ':TOTAL, '
      '   :FOLGA1, :FOLGA2, :FOLGA3, :FUNDOS, :PARTICIPACAO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  SIGLAEMISSOR = :OLD_SIGLAEMISSOR')
    Left = 237
    Top = 437
  end
  object dsTIRAnalitMov: TwwDataSource
    DataSet = qryTIRAnalitMov
    Left = 133
    Top = 437
  end
  object bdeTIRAnalitMov: TppBDEPipeline
    DataSource = dsTIRAnalitMov
    UserName = 'bdeTIRAnalitMov'
    Left = 133
    Top = 437
  end
  object RptTIRAnalitMov: TppReport
    AutoStop = False
    DataPipeline = bdeTIRAnalitMov
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
    Left = 133
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeTIRAnalitMov'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26458
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'ppLabel56'
        Caption = 'ppLabel56'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 21960
        mmWidth = 13758
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 31221
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'ppLabel58'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 27252
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'ppLabel59'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 27252
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'ppLabel61'
        Caption = 'Valor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 27252
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'ppLabel62'
        Caption = 'Carteira:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 27252
        mmWidth = 12435
        BandType = 0
      end
      object RptParamAnalitMovLabel1: TppLabel
        UserName = 'RptParamAnalitMovLabel1'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = 'Movimentações consideradas no Cálculo da TIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 81492
        BandType = 0
      end
      object ppLabel50: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label50'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraTIR: TppLabel
        UserName = 'LCarteiraTIR'
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
      object ppLabel55: TppLabel
        UserName = 'Label55'
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
      object ppDBImage20: TppDBImage
        UserName = 'DBImage20'
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
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'VALMOVIM'
        DataPipeline = bdeTIRAnalitMov
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
      object RptParamAnalitMovDBText1: TppDBText
        UserName = 'RptParamAnalitMovDBText1'
        DataField = 'CARTEIRA'
        DataPipeline = bdeTIRAnalitMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 794
        mmWidth = 30163
        BandType = 4
      end
      object RptParamAnalitMovDBText2: TppDBText
        UserName = 'RptParamAnalitMovDBText2'
        DataField = 'INVESTIMENTO'
        DataPipeline = bdeTIRAnalitMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 265
        mmTop = 794
        mmWidth = 53446
        BandType = 4
      end
      object RptParamAnalitMovDBText3: TppDBText
        UserName = 'RptParamAnalitMovDBText3'
        DataField = 'LOTE'
        DataPipeline = bdeTIRAnalitMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 56886
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object RptParamAnalitMovDBText4: TppDBText
        UserName = 'RptParamAnalitMovDBText4'
        DataField = 'HISTORICO'
        DataPipeline = bdeTIRAnalitMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 529
        mmWidth = 57415
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel66: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label66'
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
        mmTop = 2381
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable3'
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
        mmTop = 2117
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
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
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel67: TppLabel
        UserName = 'ppLabel67'
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 1058
        mmWidth = 7938
        BandType = 7
      end
      object RptParamAnalitMovDBCalc1: TppDBCalc
        UserName = 'RptParamAnalitMovDBCalc1'
        DataField = 'VALMOVIM'
        DataPipeline = bdeTIRAnalitMov
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitMov'
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 1058
        mmWidth = 25929
        BandType = 7
      end
    end
  end
  object updTIRAnalitMov: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  CARTEIRA = :CARTEIRA,'
      '  INVESTIMENTO = :INVESTIMENTO,'
      '  LOTE = :LOTE,'
      '  HISTORICO = :HISTORICO,'
      '  VALMOVIM = :VALMOVIM'
      'where'
      '  CARTEIRA = :OLD_CARTEIRA and'
      '  INVESTIMENTO = :OLD_INVESTIMENTO and'
      '  LOTE = :OLD_LOTE')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (CARTEIRA, INVESTIMENTO, LOTE, HISTORICO, VALMOVIM)'
      'values'
      '  (:CARTEIRA, :INVESTIMENTO, :LOTE, :HISTORICO, :VALMOVIM)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  CARTEIRA = :OLD_CARTEIRA and'
      '  INVESTIMENTO = :OLD_INVESTIMENTO and'
      '  LOTE = :OLD_LOTE')
    Left = 133
    Top = 437
  end
  object RptBoletaRenFixa: TppReport
    AutoStop = False
    DataPipeline = bdeBoletaRenFixa
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
    Left = 333
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeBoletaRenFixa'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Controle de Aplicações Financeiras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 60061
        BandType = 0
      end
      object ppLabel45: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label45'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraAplFinanc: TppLabel
        UserName = 'LCarteiraAplFinanc'
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
      object RptBoletaRenFixaDataRef: TppLabel
        UserName = 'RptBoletaRenFixaDataRef'
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
      object ppDBImage12: TppDBImage
        UserName = 'DBImage12'
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
    object ppDetailBand3: TppDetailBand
      BeforePrint = ppDetailBand3BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 151342
      mmPrintPosition = 0
      object RptBoletaRenFixaShape25: TppShape
        UserName = 'RptBoletaRenFixaShape25'
        mmHeight = 27781
        mmLeft = 116417
        mmTop = 115624
        mmWidth = 40481
        BandType = 4
      end
      object RptBoletaRenFixaShape1: TppShape
        UserName = 'RptBoletaRenFixaShape1'
        mmHeight = 7408
        mmLeft = 1058
        mmTop = 794
        mmWidth = 194469
        BandType = 4
      end
      object RptBoletaRenFixaLabel1: TppLabel
        UserName = 'RptBoletaRenFixaLabel1'
        Caption = 'Instituição Financeira:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 2646
        mmWidth = 31485
        BandType = 4
      end
      object RptBoletaRenFixaDBText2: TppDBText
        UserName = 'RptBoletaRenFixaDBText2'
        DataField = 'NOME'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 2646
        mmWidth = 152665
        BandType = 4
      end
      object RptBoletaRenFixaShape2: TppShape
        UserName = 'RptBoletaRenFixaShape2'
        mmHeight = 13229
        mmLeft = 1058
        mmTop = 7938
        mmWidth = 22490
        BandType = 4
      end
      object RptBoletaRenFixaShape3: TppShape
        UserName = 'RptBoletaRenFixaShape3'
        mmHeight = 13229
        mmLeft = 23283
        mmTop = 7938
        mmWidth = 25929
        BandType = 4
      end
      object RptBoletaRenFixaShape4: TppShape
        UserName = 'RptBoletaRenFixaShape4'
        mmHeight = 13229
        mmLeft = 48948
        mmTop = 7938
        mmWidth = 24606
        BandType = 4
      end
      object RptBoletaRenFixaShape5: TppShape
        UserName = 'RptBoletaRenFixaShape5'
        mmHeight = 13229
        mmLeft = 73290
        mmTop = 7938
        mmWidth = 21696
        BandType = 4
      end
      object RptBoletaRenFixaShape6: TppShape
        UserName = 'RptBoletaRenFixaShape6'
        mmHeight = 13229
        mmLeft = 94721
        mmTop = 7938
        mmWidth = 100806
        BandType = 4
      end
      object RptBoletaRenFixaLine1: TppLine
        UserName = 'RptBoletaRenFixaLine1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 115094
        mmTop = 14817
        mmWidth = 79904
        BandType = 4
      end
      object RptBoletaRenFixaLine2: TppLine
        UserName = 'RptBoletaRenFixaLine2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1323
        mmTop = 14817
        mmWidth = 114829
        BandType = 4
      end
      object RptBoletaRenFixaLabel2: TppLabel
        UserName = 'RptBoletaRenFixaLabel2'
        Caption = 'Data Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 10054
        mmWidth = 20638
        BandType = 4
      end
      object RptBoletaRenFixaLabel3: TppLabel
        UserName = 'RptBoletaRenFixaLabel3'
        Caption = 'Data Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 10054
        mmWidth = 23283
        BandType = 4
      end
      object RptBoletaRenFixaLabel4: TppLabel
        UserName = 'RptBoletaRenFixaLabel4'
        Caption = 'Data Liberação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 10054
        mmWidth = 21167
        BandType = 4
      end
      object RptBoletaRenFixaLabel5: TppLabel
        UserName = 'RptBoletaRenFixaLabel5'
        Caption = 'Prazo (dias)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 10054
        mmWidth = 17198
        BandType = 4
      end
      object RptBoletaRenFixaLabel6: TppLabel
        UserName = 'RptBoletaRenFixaLabel6'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 10054
        mmWidth = 13758
        BandType = 4
      end
      object RptBoletaRenFixaDBText3: TppDBText
        UserName = 'RptBoletaRenFixaDBText3'
        DataField = 'DATAOPERACAO'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 16140
        mmWidth = 17198
        BandType = 4
      end
      object RptBoletaRenFixaDBText4: TppDBText
        UserName = 'RptBoletaRenFixaDBText4'
        DataField = 'DATAVENCOPER'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 16140
        mmWidth = 17198
        BandType = 4
      end
      object RptBoletaRenFixaDBText5: TppDBText
        UserName = 'RptBoletaRenFixaDBText5'
        DataField = 'DATAVENCIM'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 51065
        mmTop = 16140
        mmWidth = 17198
        BandType = 4
      end
      object RptBoletaRenFixaDBText6: TppDBText
        UserName = 'RptBoletaRenFixaDBText6'
        DataField = 'PRZVENC'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 74613
        mmTop = 16140
        mmWidth = 17198
        BandType = 4
      end
      object RptBoletaRenFixaDBText7: TppDBText
        UserName = 'RptBoletaRenFixaDBText7'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 16140
        mmWidth = 95779
        BandType = 4
      end
      object RptBoletaRenFixaShape7: TppShape
        UserName = 'RptBoletaRenFixaShape7'
        mmHeight = 13229
        mmLeft = 1058
        mmTop = 24342
        mmWidth = 62971
        BandType = 4
      end
      object RptBoletaRenFixaShape8: TppShape
        UserName = 'RptBoletaRenFixaShape8'
        mmHeight = 13229
        mmLeft = 63765
        mmTop = 24342
        mmWidth = 62971
        BandType = 4
      end
      object RptBoletaRenFixaShape9: TppShape
        UserName = 'RptBoletaRenFixaShape9'
        mmHeight = 13229
        mmLeft = 126471
        mmTop = 24342
        mmWidth = 69056
        BandType = 4
      end
      object RptBoletaRenFixaLine3: TppLine
        UserName = 'RptBoletaRenFixaLine3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1058
        mmTop = 30956
        mmWidth = 194469
        BandType = 4
      end
      object RptBoletaRenFixaShape10: TppShape
        UserName = 'RptBoletaRenFixaShape10'
        mmHeight = 13229
        mmLeft = 1323
        mmTop = 41010
        mmWidth = 48948
        BandType = 4
      end
      object RptBoletaRenFixaShape11: TppShape
        UserName = 'RptBoletaRenFixaShape11'
        mmHeight = 13229
        mmLeft = 50006
        mmTop = 41010
        mmWidth = 47361
        BandType = 4
      end
      object RptBoletaRenFixaShape12: TppShape
        UserName = 'RptBoletaRenFixaShape12'
        mmHeight = 13229
        mmLeft = 97102
        mmTop = 41010
        mmWidth = 49477
        BandType = 4
      end
      object RptBoletaRenFixaShape13: TppShape
        UserName = 'RptBoletaRenFixaShape13'
        mmHeight = 13229
        mmLeft = 144463
        mmTop = 41010
        mmWidth = 50800
        BandType = 4
      end
      object RptBoletaRenFixaLine4: TppLine
        UserName = 'RptBoletaRenFixaLine4'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1588
        mmTop = 47890
        mmWidth = 193675
        BandType = 4
      end
      object RptBoletaRenFixaShape14: TppShape
        UserName = 'RptBoletaRenFixaShape14'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 58473
        mmWidth = 38100
        BandType = 4
      end
      object RptBoletaRenFixaShape15: TppShape
        UserName = 'RptBoletaRenFixaShape15'
        mmHeight = 25135
        mmLeft = 39158
        mmTop = 58473
        mmWidth = 56886
        BandType = 4
      end
      object RptBoletaRenFixaShape16: TppShape
        UserName = 'RptBoletaRenFixaShape16'
        mmHeight = 25135
        mmLeft = 95779
        mmTop = 58473
        mmWidth = 49477
        BandType = 4
      end
      object RptBoletaRenFixaShape17: TppShape
        UserName = 'RptBoletaRenFixaShape17'
        mmHeight = 25135
        mmLeft = 144727
        mmTop = 58473
        mmWidth = 50800
        BandType = 4
      end
      object RptBoletaRenFixaLine5: TppLine
        UserName = 'RptBoletaRenFixaLine5'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1323
        mmTop = 64029
        mmWidth = 194469
        BandType = 4
      end
      object RptBoletaRenFixaShape18: TppShape
        UserName = 'RptBoletaRenFixaShape18'
        mmHeight = 7408
        mmLeft = 529
        mmTop = 85990
        mmWidth = 194734
        BandType = 4
      end
      object RptBoletaRenFixaShape19: TppShape
        UserName = 'RptBoletaRenFixaShape19'
        mmHeight = 21431
        mmLeft = 529
        mmTop = 93134
        mmWidth = 194734
        BandType = 4
      end
      object RptBoletaRenFixaShape20: TppShape
        UserName = 'RptBoletaRenFixaShape20'
        mmHeight = 27781
        mmLeft = 794
        mmTop = 115623
        mmWidth = 39624
        BandType = 4
      end
      object RptBoletaRenFixaShape21: TppShape
        UserName = 'RptBoletaRenFixaShape21'
        mmHeight = 27781
        mmLeft = 38894
        mmTop = 115624
        mmWidth = 39688
        BandType = 4
      end
      object RptBoletaRenFixaShape22: TppShape
        UserName = 'RptBoletaRenFixaShape22'
        mmHeight = 27781
        mmLeft = 77258
        mmTop = 115624
        mmWidth = 39688
        BandType = 4
      end
      object RptBoletaRenFixaShape23: TppShape
        UserName = 'RptBoletaRenFixaShape23'
        mmHeight = 27781
        mmLeft = 156104
        mmTop = 115624
        mmWidth = 39158
        BandType = 4
      end
      object RptBoletaRenFixaLine6: TppLine
        UserName = 'RptBoletaRenFixaLine6'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1058
        mmTop = 120915
        mmWidth = 194469
        BandType = 4
      end
      object RptBoletaRenFixaLine7: TppLine
        UserName = 'RptBoletaRenFixaLine7'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1323
        mmTop = 132027
        mmWidth = 193675
        BandType = 4
      end
      object RptBoletaRenFixaShape24: TppShape
        UserName = 'RptBoletaRenFixaShape24'
        mmHeight = 6350
        mmLeft = 794
        mmTop = 144198
        mmWidth = 194734
        BandType = 4
      end
      object RptBoletaRenFixaLabel7: TppLabel
        UserName = 'RptBoletaRenFixaLabel7'
        Caption = 'Título / Emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 25929
        mmWidth = 23548
        BandType = 4
      end
      object RptBoletaRenFixaLabel8: TppLabel
        UserName = 'RptBoletaRenFixaLabel8'
        Caption = 'P U'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 91811
        mmTop = 25665
        mmWidth = 4498
        BandType = 4
      end
      object RptBoletaRenFixaLabel9: TppLabel
        UserName = 'RptBoletaRenFixaLabel9'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 25929
        mmWidth = 16404
        BandType = 4
      end
      object RptBoletaRenFixaLabel10: TppLabel
        UserName = 'RptBoletaRenFixaLabel10'
        Caption = 'Preço Unitário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 42863
        mmWidth = 20373
        BandType = 4
      end
      object RptBoletaRenFixaLabel11: TppLabel
        UserName = 'RptBoletaRenFixaLabel11'
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 42863
        mmWidth = 26458
        BandType = 4
      end
      object RptBoletaRenFixaLabel12: TppLabel
        UserName = 'RptBoletaRenFixaLabel12'
        Caption = 'Valor Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 42863
        mmWidth = 16933
        BandType = 4
      end
      object RptBoletaRenFixaLabel13: TppLabel
        UserName = 'RptBoletaRenFixaLabel13'
        Caption = 'Valor do Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 42598
        mmWidth = 24871
        BandType = 4
      end
      object RptBoletaRenFixaLabel14: TppLabel
        UserName = 'RptBoletaRenFixaLabel14'
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 59267
        mmWidth = 8202
        BandType = 4
      end
      object RptBoletaRenFixaLabel15: TppLabel
        UserName = 'RptBoletaRenFixaLabel15'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 59267
        mmWidth = 6615
        BandType = 4
      end
      object RptBoletaRenFixaLabel16: TppLabel
        UserName = 'RptBoletaRenFixaLabel16'
        Caption = 'Liquidação Física'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 59002
        mmWidth = 24606
        BandType = 4
      end
      object RptBoletaRenFixaLabel17: TppLabel
        UserName = 'RptBoletaRenFixaLabel17'
        Caption = 'Liquidação Fínanceira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 59002
        mmWidth = 31221
        BandType = 4
      end
      object RptBoletaRenFixaLabel18: TppLabel
        UserName = 'RptBoletaRenFixaLabel18'
        Caption = 'OBSERVAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 88106
        mmWidth = 19844
        BandType = 4
      end
      object RptBoletaRenFixaLabel19: TppLabel
        UserName = 'RptBoletaRenFixaLabel19'
        Caption = 'OPERADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 116417
        mmWidth = 15346
        BandType = 4
      end
      object RptBoletaRenFixaLabel20: TppLabel
        UserName = 'RptBoletaRenFixaLabel20'
        Caption = 'DEINV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53181
        mmTop = 116416
        mmWidth = 8202
        BandType = 4
      end
      object RptBoletaRenFixaLabel21: TppLabel
        UserName = 'RptBoletaRenFixaLabel21'
        Caption = 'SECOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 91281
        mmTop = 116416
        mmWidth = 10848
        BandType = 4
      end
      object RptBoletaRenFixaLabel22: TppLabel
        UserName = 'RptBoletaRenFixaLabel22'
        Caption = 'DIFIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 172244
        mmTop = 116416
        mmWidth = 6879
        BandType = 4
      end
      object RptBoletaRenFixaLabel23: TppLabel
        UserName = 'RptBoletaRenFixaLabel23'
        Caption = 'Rogélio C. Nogueira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 5556
        mmTop = 133350
        mmWidth = 28310
        BandType = 4
      end
      object RptBoletaRenFixaLabel24: TppLabel
        UserName = 'RptBoletaRenFixaLabel24'
        Caption = 'Carlos Alberto C. Ferreira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 38894
        mmTop = 133350
        mmWidth = 37835
        BandType = 4
      end
      object RptBoletaRenFixaLabel25: TppLabel
        UserName = 'RptBoletaRenFixaLabel25'
        Caption = 'Manoel Domingos G. Neto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 133350
        mmWidth = 37306
        BandType = 4
      end
      object RptBoletaRenFixaLabel26: TppLabel
        UserName = 'RptBoletaRenFixaLabel26'
        Caption = 'Carlos Alberto P. da Silva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 133350
        mmWidth = 36248
        BandType = 4
      end
      object RptBoletaRenFixaLabel27: TppLabel
        UserName = 'RptBoletaRenFixaLabel27'
        Caption = 'CHEFE DO DEINV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 46302
        mmTop = 138113
        mmWidth = 23548
        BandType = 4
      end
      object RptBoletaRenFixaLabel28: TppLabel
        UserName = 'RptBoletaRenFixaLabel28'
        Caption = 'CHEFE DO SECOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 138113
        mmWidth = 23813
        BandType = 4
      end
      object RptBoletaRenFixaLabel29: TppLabel
        UserName = 'RptBoletaRenFixaLabel29'
        Caption = 'DIRETOR FINANCEIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 160867
        mmTop = 138113
        mmWidth = 29369
        BandType = 4
      end
      object RptBoletaRenFixaDBText8: TppDBText
        UserName = 'RptBoletaRenFixaDBText8'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 32808
        mmWidth = 60061
        BandType = 4
      end
      object RptBoletaRenFixaDBText9: TppDBText
        UserName = 'RptBoletaRenFixaDBText9'
        DataField = 'QTDEOPERACAO'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,###,###,###,######0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 32808
        mmWidth = 40746
        BandType = 4
      end
      object RptBoletaRenFixaDBText10: TppDBText
        UserName = 'RptBoletaRenFixaDBText10'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,###,###,##0.00#######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 49477
        mmWidth = 40746
        BandType = 4
      end
      object RptBoletaRenFixaDBText11: TppDBText
        UserName = 'RptBoletaRenFixaDBText11'
        DataField = 'VLROPERACAO'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 52652
        mmTop = 49477
        mmWidth = 40746
        BandType = 4
      end
      object RptBoletaRenFixaDBText12: TppDBText
        UserName = 'RptBoletaRenFixaDBText12'
        DataField = 'VALORJUROS'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 49477
        mmWidth = 40746
        BandType = 4
      end
      object RptBoletaRenFixaDBText13: TppDBText
        UserName = 'RptBoletaRenFixaDBText13'
        DataField = 'VLRRESGATE'
        DataPipeline = bdeBoletaRenFixa
        DisplayFormat = '###,###,###,##0.00####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 49213
        mmWidth = 40746
        BandType = 4
      end
      object RptBoletaRenFixaDBText14: TppDBText
        UserName = 'RptBoletaRenFixaDBText14'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 65881
        mmWidth = 37835
        BandType = 4
      end
      object RptBoletaRenFixaMemo1: TppMemo
        UserName = 'RptBoletaRenFixaMemo1'
        Caption = 'RptBoletaRenFixaMemo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 16404
        mmLeft = 3175
        mmTop = 65352
        mmWidth = 34131
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptBoletaRenFixaMemo2: TppMemo
        UserName = 'RptBoletaRenFixaMemo2'
        Caption = 'RptBoletaRenFixaMemo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 16404
        mmLeft = 41540
        mmTop = 65352
        mmWidth = 49477
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptBoletaRenFixaDBMemo1: TppDBMemo
        UserName = 'RptBoletaRenFixaDBMemo1'
        CharWrap = True
        DataField = 'OBSERVACAO'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 8996
        mmLeft = 1852
        mmTop = 104775
        mmWidth = 191823
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptBoletaRenFixaDBMemo2: TppDBMemo
        UserName = 'RptBoletaRenFixaDBMemo2'
        CharWrap = False
        DataField = 'OBSINVESTIMENTO'
        DataPipeline = bdeBoletaRenFixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeBoletaRenFixa'
        mmHeight = 9790
        mmLeft = 1852
        mmTop = 94192
        mmWidth = 191823
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptBoletaRenFixaLabel32: TppLabel
        UserName = 'RptBoletaRenFixaLabel32'
        Caption = 'DEAFI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 116416
        mmWidth = 7938
        BandType = 4
      end
      object RptBoletaRenFixaLabel33: TppLabel
        UserName = 'RptBoletaRenFixaLabel33'
        Caption = 'Eduardo Gomes Pereira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 133350
        mmWidth = 34660
        BandType = 4
      end
      object RptBoletaRenFixaLabel34: TppLabel
        UserName = 'RptBoletaRenFixaLabel34'
        Caption = 'CHEFE DO DEAFI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 138113
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel48: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel48'
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
      object ppCalc29: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptBoletaRenFixaGroup1: TppGroup
      BreakName = 'NUMDOCUMENTO'
      DataPipeline = bdeBoletaRenFixa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptBoletaRenFixaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeBoletaRenFixa'
      object RptBoletaRenFixaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptBoletaRenFixaDBText1: TppDBText
          UserName = 'RptBoletaRenFixaDBText1'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = bdeBoletaRenFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeBoletaRenFixa'
          mmHeight = 5027
          mmLeft = 6615
          mmTop = 265
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object RptBoletaRenFixaDBText16: TppDBText
          UserName = 'RptBoletaRenFixaDBText16'
          DataField = 'IDLOTE'
          DataPipeline = bdeBoletaRenFixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeBoletaRenFixa'
          mmHeight = 3704
          mmLeft = 61383
          mmTop = 1588
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object RptBoletaRenFixaLabel31: TppLabel
          UserName = 'RptBoletaRenFixaLabel31'
          Caption = 'Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 54504
          mmTop = 1588
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
      end
      object RptBoletaRenFixaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
      end
    end
  end
  object RptExtratoOper: TppReport
    AutoStop = False
    DataPipeline = bdeExtratoOper
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 441
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeExtratoOper'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 55563
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 55298
        mmWidth = 284300
        BandType = 0
      end
      object RptExtratoOperLabel1: TppLabel
        UserName = 'RptExtratoOperLabel1'
        Caption = 'Boleta da Aplicação :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 21960
        mmWidth = 27781
        BandType = 0
      end
      object RptExtratoOperLabel3: TppLabel
        UserName = 'RptExtratoOperLabel3'
        Caption = 'Tipo de Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 31221
        mmWidth = 26194
        BandType = 0
      end
      object RptExtratoOperLine1: TppLine
        UserName = 'RptExtratoOperLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 50271
        mmWidth = 284300
        BandType = 0
      end
      object RptExtratoOperLabel5: TppLabel
        UserName = 'RptExtratoOperLabel5'
        Caption = 'Instituição Financeira:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 35719
        mmWidth = 29369
        BandType = 0
      end
      object RptExtratoOperLabel7: TppLabel
        UserName = 'RptExtratoOperLabel7'
        Caption = 'Valor da Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 40217
        mmWidth = 25665
        BandType = 0
      end
      object RptExtratoOperLabel9: TppLabel
        UserName = 'RptExtratoOperLabel9'
        Caption = 'Data da Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 44715
        mmWidth = 24606
        BandType = 0
      end
      object RptExtratoOperLabel11: TppLabel
        UserName = 'RptExtratoOperLabel11'
        Caption = 'Aplicação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 35719
        mmWidth = 14552
        BandType = 0
      end
      object RptExtratoOperLabel13: TppLabel
        UserName = 'RptExtratoOperLabel13'
        Caption = 'Indexador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 40217
        mmWidth = 15346
        BandType = 0
      end
      object RptExtratoOperLabel15: TppLabel
        UserName = 'RptExtratoOperLabel15'
        Caption = 'Taxa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 44715
        mmWidth = 7408
        BandType = 0
      end
      object RptExtratoOperLabel18: TppLabel
        UserName = 'RptExtratoOperLabel18'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 51065
        mmWidth = 5821
        BandType = 0
      end
      object RptExtratoOperLabel19: TppLabel
        UserName = 'RptExtratoOperLabel19'
        Caption = 'Taxa Over'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 51065
        mmWidth = 14288
        BandType = 0
      end
      object RptExtratoOperLabel21: TppLabel
        UserName = 'RptExtratoOperLabel21'
        Caption = 'Saldo de Abertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 37835
        mmTop = 51065
        mmWidth = 23813
        BandType = 0
      end
      object RptExtratoOperLabel22: TppLabel
        UserName = 'RptExtratoOperLabel22'
        AutoSize = False
        Caption = 'Outros Rendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 144992
        mmTop = 51065
        mmWidth = 31750
        BandType = 0
      end
      object RptExtratoOperLabel23: TppLabel
        UserName = 'RptExtratoOperLabel23'
        Caption = 'Resgate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 51065
        mmWidth = 11906
        BandType = 0
      end
      object RptExtratoOperLabel24: TppLabel
        UserName = 'RptExtratoOperLabel24'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 225161
        mmTop = 51065
        mmWidth = 7408
        BandType = 0
      end
      object RptExtratoOperLabel17: TppLabel
        UserName = 'RptExtratoOperLabel17'
        Caption = 'Boleta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 236538
        mmTop = 51065
        mmWidth = 8467
        BandType = 0
      end
      object RptExtratoOperDBText2: TppDBText
        UserName = 'RptExtratoOperDBText2'
        DataField = 'IDLOTE'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 21960
        mmWidth = 29369
        BandType = 0
      end
      object RptExtratoOperDBText3: TppDBText
        UserName = 'RptExtratoOperDBText3'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 44715
        mmWidth = 29369
        BandType = 0
      end
      object RptExtratoOperDBText4: TppDBText
        UserName = 'RptExtratoOperDBText4'
        DataField = 'MOEDESC'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 40217
        mmWidth = 66940
        BandType = 0
      end
      object RptExtratoOperDBText5: TppDBText
        UserName = 'RptExtratoOperDBText5'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 35719
        mmWidth = 66940
        BandType = 0
      end
      object RptExtratoOperDBText6: TppDBText
        UserName = 'RptExtratoOperDBText6'
        DataField = 'DESCCARTINVEST'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 13494
        mmWidth = 97367
        BandType = 0
      end
      object RptExtratoOperDBText7: TppDBText
        UserName = 'RptExtratoOperDBText7'
        DataField = 'DESCTIPRENFIXA'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 212196
        mmTop = 31221
        mmWidth = 66940
        BandType = 0
      end
      object RptExtratoOperDBText8: TppDBText
        UserName = 'RptExtratoOperDBText8'
        DataField = 'NOME'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 35719
        mmWidth = 66675
        BandType = 0
      end
      object RptExtratoOperDBText9: TppDBText
        UserName = 'RptExtratoOperDBText9'
        DataField = 'DATAINICIAL'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3175
        mmLeft = 37835
        mmTop = 44715
        mmWidth = 22225
        BandType = 0
      end
      object RptExtratoOperLabel4: TppLabel
        UserName = 'RptExtratoOperLabel4'
        Caption = 'Posição até:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 26723
        mmWidth = 17463
        BandType = 0
      end
      object RptExtratoOperDataRef: TppLabel
        UserName = 'RptExtratoOperDataRef'
        Caption = 'RptExtratoOperDataRef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 212196
        mmTop = 26723
        mmWidth = 28840
        BandType = 0
      end
      object RptExtratoOperDBText16: TppDBText
        UserName = 'RptExtratoOperDBText16'
        DataField = 'VALINICIAL'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 37835
        mmTop = 40217
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 94456
        mmTop = 51065
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Correção Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 109538
        mmTop = 51065
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Extrato de Operações Financeiras'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 57150
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage9: TppDBImage
        UserName = 'DBImage9'
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
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object RptExtratoOperDBText1: TppDBText
        UserName = 'RptExtratoOperDBText1'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object RptExtratoOperDBText14: TppDBText
        UserName = 'RptExtratoOperDBText14'
        DataPipeline = bdeResumoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeResumoOper'
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object RptExtratoOperDBText10: TppDBText
        UserName = 'RptExtratoOperDBText10'
        DataField = 'SALDOABERT'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 38365
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
      object RptExtratoOperDBText11: TppDBText
        UserName = 'RptExtratoOperDBText11'
        DataField = 'RENDIMENTO'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
      object RptExtratoOperDBText13: TppDBText
        UserName = 'RptExtratoOperDBText13'
        DataField = 'RESGATE'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
      object RptExtratoOperDBText12: TppDBText
        UserName = 'RptExtratoOperDBText12'
        DataField = 'SALDO'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
      object RptExtratoOperDBText15: TppDBText
        UserName = 'RptExtratoOperDBText15'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = bdeExtratoOper
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3704
        mmLeft = 236538
        mmTop = 529
        mmWidth = 42863
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText1'
        DataField = 'JUROS'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3440
        mmLeft = 71438
        mmTop = 794
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText2'
        DataField = 'VARIACAO'
        DataPipeline = bdeExtratoOper
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeExtratoOper'
        mmHeight = 3440
        mmLeft = 109009
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel43: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel43'
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
        mmWidth = 279401
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
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
        mmTop = 2117
        mmWidth = 279401
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 253207
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptExtratoOperGroup1: TppGroup
      BreakName = 'IDLOTE'
      DataPipeline = bdeExtratoOper
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptExtratoOperGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeExtratoOper'
      object RptExtratoOperGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
      object RptExtratoOperGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsExtratoOper: TwwDataSource
    DataSet = qryExtratoOper
    Left = 441
    Top = 183
  end
  object bdeExtratoOper: TppBDEPipeline
    DataSource = dsExtratoOper
    UserName = 'bdeExtratoOper'
    Left = 441
    Top = 183
  end
  object updExtratoOper: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAINICIAL = :DATAINICIAL,'
      '  VALINICIAL = :VALINICIAL,'
      '  SALDOABERT = :SALDOABERT,'
      '  RENDIMENTO = :RENDIMENTO,'
      '  RESGATE = :RESGATE,'
      '  SALDO = :SALDO'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATAINICIAL, VALINICIAL, SALDOABERT, RENDIMENTO, RESGATE, SAL' +
        'DO)'
      'values'
      
        '  (:DATAINICIAL, :VALINICIAL, :SALDOABERT, :RENDIMENTO, :RESGATE' +
        ', :SALDO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 441
    Top = 183
  end
  object qryExtratoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE,' +
        ' P.NOME,'
      
        '       H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.DATAMOVCARTINV' +
        ', '
      '       (0) AS SALDOVLRINVCART, OI.NUMDOCUMENTO, '
      
        '       IV.DESCINVESTIMENTO, MO.MOEDESC, TO_DATE('#39#39') AS DATAINICI' +
        'AL, (0) AS VALINICIAL, (0) AS SALDOABERT, '
      
        '       (0) AS RENDIMENTO, (0) AS RESGATE, (0) AS SALDO, (0) AS J' +
        'UROS, (0) AS VARIACAO'
      ''
      'FROM   PESSOA P, HISTCARTINV H1,  CARTEIRAINVEST CA, '
      '             INVESTIMENTO IV, OPERACAOINVEST OI,'
      '             TITRENFIXA TT, TIPOTITRENFIXA TP, MOEDA MO'
      ''
      'WHERE'
      '      (1 = 2) AND'
      '      (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO              = IV.IDINVESTIMENTO) AND'
      '      (H1.IDOPERACAOINVEST        = OI.IDOPERACAOINVEST(+)) AND'
      '      (IV.IDINVESTIMENTO               = TT.IDTITRENFIXA) AND'
      '      (TT.CODTIPRENFIXA                = TP.CODTIPRENFIXA) AND'
      '      (TT.INDEXRENFIX                     = MO.MOECODIGO(+)) AND'
      '      (P.IDPESSOA = IV.IDEMISSOR) AND'
      
        '      (H1.DATAMOVCARTINV   <= TO_DATE('#39'31/12/1999'#39','#39'DD/MM/YYYY'#39')' +
        ')'
      
        'ORDER BY CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE,  H1.DA' +
        'TAMOVCARTINV'
      ' ')
    UpdateObject = updExtratoOper
    ValidateWithMask = True
    Left = 441
    Top = 183
    object qryExtratoOperDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryExtratoOperDESCTIPRENFIXA: TStringField
      FieldName = 'DESCTIPRENFIXA'
      Size = 60
    end
    object qryExtratoOperIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryExtratoOperNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryExtratoOperIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryExtratoOperIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryExtratoOperDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryExtratoOperSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryExtratoOperNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryExtratoOperDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryExtratoOperMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryExtratoOperDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
    end
    object qryExtratoOperVALINICIAL: TFloatField
      FieldName = 'VALINICIAL'
    end
    object qryExtratoOperSALDOABERT: TFloatField
      FieldName = 'SALDOABERT'
    end
    object qryExtratoOperRENDIMENTO: TFloatField
      FieldName = 'RENDIMENTO'
    end
    object qryExtratoOperRESGATE: TFloatField
      FieldName = 'RESGATE'
    end
    object qryExtratoOperSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryExtratoOperJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryExtratoOperVARIACAO: TFloatField
      FieldName = 'VARIACAO'
    end
  end
  object updMemoria: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACAOMOEDA'
      'set'
      '  DATA = :DATA,'
      '  COTVALOR = :COTVALOR,'
      '  FATOR = :FATOR,'
      '  VARIACAO = :VARIACAO,'
      '  TAXA = :TAXA'
      'where'
      '  DATA = :OLD_DATA and'
      '  COTVALOR = :OLD_COTVALOR and'
      '  FATOR = :OLD_FATOR and'
      '  VARIACAO = :OLD_VARIACAO')
    InsertSQL.Strings = (
      'insert into COTACAOMOEDA'
      '  (DATA, COTVALOR, FATOR, VARIACAO, TAXA)'
      'values'
      '  (:DATA, :COTVALOR, :FATOR, :VARIACAO, :TAXA)')
    DeleteSQL.Strings = (
      'delete from COTACAOMOEDA'
      'where'
      '  DATA = :OLD_DATA and'
      '  COTVALOR = :OLD_COTVALOR and'
      '  FATOR = :OLD_FATOR and'
      '  VARIACAO = :OLD_VARIACAO')
    Left = 333
    Top = 183
  end
  object dsMemoria: TwwDataSource
    AutoEdit = False
    DataSet = qryMemoria
    Left = 333
    Top = 183
  end
  object rptConsIndMoeda: TppReport
    AutoStop = False
    DataPipeline = bdeConsIndMoeda
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Variação dos Indicadores'
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
    BeforePrint = rptConsIndMoedaBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 333
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeConsIndMoeda'
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 61119
      mmPrintPosition = 0
      object ppsVarComp: TppShape
        UserName = 'ppsVarComp'
        Brush.Color = clInfoBk
        Pen.Style = psClear
        mmHeight = 6085
        mmLeft = 20638
        mmTop = 46567
        mmWidth = 147638
        BandType = 0
      end
      object ppsVarIndComp: TppShape
        UserName = 'ppsVarIndComp'
        Brush.Color = clInfoBk
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 20638
        mmTop = 41275
        mmWidth = 147638
        BandType = 0
      end
      object ppsVarFundo: TppShape
        UserName = 'ppsVarFundo'
        Brush.Color = clInfoBk
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 20638
        mmTop = 36513
        mmWidth = 147638
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34396
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label69'
        Caption = 'Periodo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 24342
        mmWidth = 13758
        BandType = 0
      end
      object lblDataIni: TppLabel
        UserName = 'lblDataIni'
        Caption = 'lblDataIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14288
        mmWidth = 14023
        BandType = 0
      end
      object lblDataFim: TppLabel
        UserName = 'lblDataFim'
        Caption = 'lblDataFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 14288
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 14288
        mmWidth = 3704
        BandType = 0
      end
      object lblCapFundo: TppLabel
        UserName = 'lblCapFundo'
        AutoSize = False
        Caption = 'Fundo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 24606
        mmWidth = 35983
        BandType = 0
      end
      object lblFundo: TppLabel
        UserName = 'lblFundo'
        AutoSize = False
        Caption = 'lblFundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 130704
        mmTop = 24606
        mmWidth = 66411
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 20902
        mmTop = 56356
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 60854
        mmTop = 56621
        mmWidth = 7938
        BandType = 0
      end
      object lblTitFator: TppLabel
        UserName = 'lblTitFator'
        Caption = 'Fator'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 91811
        mmTop = 56621
        mmWidth = 7938
        BandType = 0
      end
      object lblTitFatAcu: TppLabel
        UserName = 'lblTitFatAcu'
        Caption = 'Fator Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 109538
        mmTop = 56621
        mmWidth = 26194
        BandType = 0
      end
      object lblCapIndComp: TppLabel
        UserName = 'lblCapIndComp'
        Caption = 'Indicador Comparativo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 29104
        mmWidth = 35719
        BandType = 0
      end
      object lblIndComp: TppLabel
        UserName = 'lblIndComp'
        AutoSize = False
        Caption = 'lblIndComp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 130440
        mmTop = 29104
        mmWidth = 66675
        BandType = 0
      end
      object lblTitVariacao: TppLabel
        UserName = 'lblTitVariacao'
        Caption = 'Variação Diária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 56621
        mmWidth = 23019
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 60590
        mmWidth = 173302
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 53711
        mmWidth = 197300
        BandType = 0
      end
      object lblCapVarFundo: TppLabel
        UserName = 'lblCapVarFundo'
        Caption = 'Variação do Fundo no Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 37042
        mmWidth = 57679
        BandType = 0
      end
      object lblVarFundo: TppLabel
        UserName = 'lblVarFundo'
        AutoSize = False
        Caption = 'lblVarFundo'
        Color = clInfoBk
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 37306
        mmWidth = 83873
        BandType = 0
      end
      object lblCapVarIndComp: TppLabel
        UserName = 'lblCapVarIndComp'
        Caption = 'Variação do Indicador no Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 42598
        mmWidth = 63500
        BandType = 0
      end
      object lblVarIndComp: TppLabel
        UserName = 'lblVarIndComp'
        AutoSize = False
        Caption = 'lblVarIndComp'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 42598
        mmWidth = 83608
        BandType = 0
      end
      object lblCapDifPer1: TppLabel
        UserName = 'lblCapDifPer1'
        Caption = 'Comparativo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 44450
        mmTop = 47890
        mmWidth = 26194
        BandType = 0
      end
      object lblDifPerc: TppLabel
        UserName = 'lblDifPerc'
        AutoSize = False
        Caption = 'lblDifPerc'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 47890
        mmWidth = 29633
        BandType = 0
      end
      object lblCapDifPer2: TppLabel
        UserName = 'lblCapDifPer2'
        Caption = ' do '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 100806
        mmTop = 47890
        mmWidth = 6879
        BandType = 0
      end
      object lblIndComp2: TppLabel
        UserName = 'lblIndComp2'
        AutoSize = False
        Caption = 'lblIndComp2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 107950
        mmTop = 47890
        mmWidth = 60325
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197300
        BandType = 0
      end
      object LblPlano: TppLabel
        UserName = 'LblPlano'
        Caption = 'LblPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 179388
        mmTop = 8731
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'lblTitVariacao1'
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 186002
        mmTop = 56621
        mmWidth = 7408
        BandType = 0
      end
      object lblNomeRelatorio: TppLabel
        UserName = 'lblNomeRelatorio'
        Caption = 'Composição Gerencial da Carteira de Ações'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 74613
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label13'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraMoeda: TppLabel
        UserName = 'LCarteiraMoeda'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 183621
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBImage14: TppDBImage
        UserName = 'DBImage14'
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
    object ppDetailBand21: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'DBText16'
        DataField = 'DATA'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3440
        mmLeft = 20638
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText17'
        DataField = 'COTVALOR'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = '#,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3969
        mmLeft = 40481
        mmTop = 794
        mmWidth = 28840
        BandType = 4
      end
      object dbtFator: TppDBText
        UserName = 'dbtFator'
        DataField = 'FATOR'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = '#,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object dbtFatAcu: TppDBText
        UserName = 'dbtFatAcu'
        DataField = 'FATACU'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = '#,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 794
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'VARIACAO'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = '#,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 794
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'TAXA'
        DataPipeline = bdeConsIndMoeda
        DisplayFormat = '#,##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeConsIndMoeda'
        mmHeight = 3969
        mmLeft = 172509
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel90: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label90'
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
        mmTop = 2117
        mmWidth = 279401
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
        mmTop = 2117
        mmWidth = 279401
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object bdeConsIndMoeda: TppBDEPipeline
    DataSource = dsMemoria
    UserName = 'bdeConsIndMoeda'
    Left = 333
    Top = 183
  end
  object bdeListInv: TppBDEPipeline
    DataSource = dsListInv
    UserName = 'bdeListInv'
    Left = 133
    Top = 62
  end
  object qryListInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BV.IDBOLSAVALORES, BV.SGLBOLSAVALORES, OI.DATAOPERACAO, O' +
        'I.DATAVENCOPER, OI.QTDEOPERACAO,'
      
        '       OI.PRECOUNITOPERACAO, OI.VLROPERACAO, DS.TOTALDESPESAS, S' +
        'UBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, PE.NOME AS EMPRESA,'
      
        '       PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIM' +
        'ENTO, TI.DESCTIPOOPERACAO, OI.NUMDOCUMENTO, TI.NATUREZAOPERACAO ' +
        ','
      
        '       1000 AS TOTALDESPESABOLETA, 2000 AS TOTALLIQUIDOBOLETA, B' +
        'O.OBSERVACAO, IV.IDINVESTIMENTO,'
      '       0 AS PUMEDIOCOMPRA, 0 AS PUMEDIOVENDA'
      ''
      
        'FROM   OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES B' +
        'V,'
      '       INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, PESSOA PE,'
      '       BOLETA BO,'
      
        '       (SELECT IDOPERACAOINVEST, SUM(VLRDESPOPER) AS TOTALDESPES' +
        'AS'
      '        FROM DESPOPERINVEST GROUP BY IDOPERACAOINVEST) DS'
      ''
      'WHERE (1 = 2) AND'
      '      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST) AND'
      '      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST) AND'
      '      (OI.IDCORRETVALORES  = PS.IDPESSOA)         AND'
      '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)   AND'
      '      (OA.IDACAO           = IV.IDINVESTIMENTO)   AND'
      '      (TI.IDMERCADO        = ME.IDMERCADO)        AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)   AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)   AND'
      '      (PE.IDPESSOA         = 1)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 62
    object qryListInvIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object qryListInvSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object p: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryListInvDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryListInvQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryListInvPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryListInvVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryListInvTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
    end
    object qryListInvDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object qryListInvEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Size = 60
    end
    object qryListInvNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryListInvDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object qryListInvDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryListInvNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryListInvNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryListInvTOTALDESPESABOLETA: TFloatField
      FieldName = 'TOTALDESPESABOLETA'
    end
    object qryListInvTOTALLIQUIDOBOLETA: TFloatField
      FieldName = 'TOTALLIQUIDOBOLETA'
    end
    object qryListInvOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryListInvPUMEDIOCOMPRA: TFloatField
      FieldName = 'PUMEDIOCOMPRA'
    end
    object qryListInvPUMEDIOVENDA: TFloatField
      FieldName = 'PUMEDIOVENDA'
    end
    object qryListInvIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
  end
  object QryRelatConsInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, CI.DATACOTACAO, C' +
        'I.VLRCONTABIL, CI.QTDTITLOTE'
      ''
      'FROM COTACAOINVEST CI,INVESTIMENTO IV  '
      ''
      'WHERE'
      ''
      '        (1 = 2) AND'
      '        (CI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      'ORDER BY CI.IDINVESTIMENTO, CI.DATACOTACAO'
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 62
  end
  object QryEnquadramento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  HCC.IDINVESTIMENTO, HCC.CODTABCLASSINV,   HCC.CODCLASSIN' +
        'VEST, HCC.DATAREFERENCIA,'
      
        #9'HCC.IDCARTEIRAINVEST, HCC.SALDOCLASSCART, TCI.DESCTABCLASSINV, ' +
        'CLI.DESCCLASSINVEST,'
      #9'INV.DESCINVESTIMENTO, HCC.SALDOQTDCLASSCART'
      ''
      
        'FROM HISTCLASSCART HCC, TABCLASSIFINVEST TCI, CLASSIFINVEST CLI,' +
        ' INVESTIMENTO INV '
      ''
      'WHERE'
      '        (1 = 2) AND'
      '        HCC.CODTABCLASSINV = '#39'SERPROS   '#39' AND'
      #9'HCC.CODTABCLASSINV = TCI.CODTABCLASSINV     AND       '
      #9'HCC.CODTABCLASSINV = CLI.CODTABCLASSINV     AND       '
      #9'HCC.CODCLASSINVEST = CLI.CODCLASSINVEST     AND       '
      #9'HCC.IDINVESTIMENTO = INV.IDINVESTIMENTO         '
      ''
      
        'ORDER BY TCI.DESCTABCLASSINV, CLI.DESCCLASSINVEST, INV.DESCINVES' +
        'TIMENTO, HCC.DATAREFERENCIA '
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 333
    Top = 62
  end
  object qryDemCustoCarteira: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE, H1.DAT' +
        'AMOVCARTINV, H1.IDHISTCARTINV, H1.IDINVESTIMENTO,'
      
        '           H1.SALDOQTDEINVCART, H1.VLRMOVCARTINV, H1.IDINVESTIME' +
        'NTO, H1.SALDOAQUI,'
      '           H1.SALDOREND, H1.SALDOCAR, (0) AS COTACAO'
      'FROM   HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV'
      'WHERE (1=2) AND'
      '      (H1.DATAMOVCARTINV ='
      '                    (SELECT MAX(H2.DATAMOVCARTINV)'
      '                     FROM   HISTCARTINV H2'
      '                     WHERE'
      
        '                           (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAI' +
        'NVEST) AND'
      
        '                           (H2.IDINVESTIMENTO   = H1.IDINVESTIME' +
        'NTO) AND'
      
        '                           (((H1.IDLOTE IS NOT NULL) AND (H2.IDL' +
        'OTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL)' +
        ')) AND'
      
        '                             (H2.DATAMOVCARTINV  <= TO_DATE('#39'23/' +
        '09/1999'#39','#39'dd/mm/yyyy'#39')))) AND'
      '      (H1.IDHISTCARTINV   ='
      '                    (SELECT MAX(H3.IDHISTCARTINV)'
      '                     FROM   HISTCARTINV H3'
      
        '                     WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAI' +
        'NVEST) AND'
      
        '                                    (H3.IDINVESTIMENTO   = H1.ID' +
        'INVESTIMENTO) AND'
      
        '                                    (((H1.IDLOTE IS NOT NULL) AN' +
        'D (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE' +
        ' IS NULL))) AND'
      
        '                                    (H3.DATAMOVCARTINV   = H1.DA' +
        'TAMOVCARTINV)))  AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (H1.IDINVESTIMENTO  IS NOT NULL)'
      'ORDER BY CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDemCustoCarteira
    ValidateWithMask = True
    Left = 441
    Top = 62
  end
  object qryResumoOper: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE, E.SIGLAE' +
        'MISSOR AS NOME,'
      
        '       H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCAR' +
        'T,'
      
        '       TO_DATE('#39#39') AS DATAINICIAL, (0) AS VALAPLIC, (0) AS RENDI' +
        'MENTO, (0) AS RESGATE,'
      '       (0) AS SALDO, IV.DESCINVESTIMENTO, IV.FLGATIVO'
      
        'FROM   EMISSOR E, HISTCARTINV H1,  CARTEIRAINVEST CA, INVESTIMEN' +
        'TO IV,'
      '       TITRENFIXA TT, TIPOTITRENFIXA TP'
      'WHERE'
      '      (1 = 2) AND'
      '      (H1.DATAMOVCARTINV ='
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
      '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND'
      '      (E.IDEMISSOR = IV.IDEMISSOR)'
      'ORDER BY CA.DESCCARTINVEST, TP.DESCTIPRENFIXA, H1.IDLOTE'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updResumoOper
    ValidateWithMask = True
    Left = 567
    Top = 62
  end
  object qryCompGerLotes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, HC.IDLOTE,'
      '       HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO,'
      
        '       CI.SERIE, CI.DATAVENCIM, CI.PRECOVENCIM, HC.SALDOQTDEINVC' +
        'ART'
      
        'FROM   HISTCARTINV HC,  CARTEIRAINVEST CA, INVESTIMENTO IV,  CON' +
        'TRATOINVESTIM CI'
      'WHERE'
      '              (1 = 2) AND'
      '              (HC.DATAMOVCARTINV ='
      '                    (SELECT MAX(H2.DATAMOVCARTINV)'
      '                     FROM   HISTCARTINV H2'
      
        '                      WHERE (H2.IDCARTEIRAINVEST = HC.IDCARTEIRA' +
        'INVEST) AND'
      
        '                                     (H2.IDINVESTIMENTO   = HC.I' +
        'DINVESTIMENTO) AND'
      
        '                                     (((HC.IDLOTE IS NOT NULL) A' +
        'ND (H2.IDLOTE =HC.IDLOTE)) OR ((HC.IDLOTE IS NULL) AND (H2.IDLOT' +
        'E IS NULL))) AND'
      
        '                                     (H2.DATAMOVCARTINV  <= TO_D' +
        'ATE('#39'23/09/1999'#39','#39'dd/mm/yyyy'#39')))) AND'
      '              (HC.IDHISTCARTINV   ='
      '                    (SELECT MAX(H3.IDHISTCARTINV)'
      '                     FROM   HISTCARTINV H3'
      
        '                     WHERE (H3.IDCARTEIRAINVEST = HC.IDCARTEIRAI' +
        'NVEST) AND'
      
        '                                    (H3.IDINVESTIMENTO   = HC.ID' +
        'INVESTIMENTO) AND'
      
        '                                    (((HC.IDLOTE IS NOT NULL) AN' +
        'D (H3.IDLOTE =HC.IDLOTE)) OR ((HC.IDLOTE IS NULL) AND (H3.IDLOTE' +
        ' IS NULL))) AND'
      
        '                                    (H3.DATAMOVCARTINV   = HC.DA' +
        'TAMOVCARTINV)))  AND'
      
        '              (HC.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AN' +
        'D'
      '              (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '              (HC.IDLOTE IS NOT NULL) AND'
      '              (HC.SALDOQTDEINVCART <> 0) AND'
      '              (HC.IDINVESTIMENTO       = CI.IDINVESTIMENTO) AND'
      '              (HC.IDLOTE               = CI.IDLOTE)'
      
        'ORDER BY CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, CI.SERIE, CI.DA' +
        'TAVENCIM, HC.IDLOTE'
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 183
  end
  object qryDetBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  OI.IDOPERACAOINVEST, OI.DATAOPERACAO, OI.DATAVENCOPER, O' +
        'I.QTDEOPERACAO,'
      
        #9'OI.PRECOUNITOPERACAO, OI.VLROPERACAO, OI.NUMDOCUMENTO, BV.SGLBO' +
        'LSAVALORES,'
      #9'DOP.VLRDESPOPER, DOP.IDTIPODESPINVEST, DS.TOTALDESPESAS,'
      #9'SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, PS.NOME,'
      
        #9'SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIMENTO, TI.DESCTI' +
        'POOPERACAO,'
      
        #9'TI.NATUREZAOPERACAO, TP.DESCTIPODESPINV, TP.NATUREZAOPERACAO AS' +
        ' DESPNATUR ,CA.DESCCARTINVEST'
      ''
      ''
      
        'FROM '#9'OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV' +
        ','
      
        #9'INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, DESPOPERINVEST DO' +
        'P,'
      '        TIPODESPINVEST TP, CARTEIRAINVEST CA,'
      #9'(SELECT IDOPERACAOINVEST, SUM(VLRDESPOPER) AS TOTALDESPESAS'
      '         FROM DESPOPERINVEST GROUP BY IDOPERACAOINVEST) DS'
      ''
      'WHERE'
      '        (1 = 2) AND'
      '        (OI.NUMDOCUMENTO        = '#39'RV-99/0070'#39') '#9'AND'
      #9'(TP.NATUREZAOPERACAO   <> '#39'N'#39') '#9#9#9'AND'
      #9'(OI.IDOPERACAOINVEST    = OA.IDOPERACAOINVEST)'#9'AND'
      #9'(OI.IDOPERACAOINVEST    = DS.IDOPERACAOINVEST) '#9'AND'
      #9'(OI.IDCORRETVALORES     = PS.IDPESSOA) '#9#9'AND'
      #9'(OA.IDBOLSAVALORES      = BV.IDBOLSAVALORES)'#9'AND'
      #9'(OA.IDACAO '#9'        = IV.IDINVESTIMENTO)    AND'
      #9'(TI.IDMERCADO '#9'        = ME.IDMERCADO)'#9#9'AND'
      #9'(OI.IDTIPOOPERACAO      = TI.IDTIPOOPERACAO)    AND'
      '       '#9'(DOP.IDTIPODESPINVEST   = TP.IDTIPODESPINVEST)  AND'
      '       '#9'(OI.IDOPERACAOINVEST    = DOP.IDOPERACAOINVEST) AND'
      '        (OI.IDCARTEIRAINVEST    = CA.IDCARTEIRAINVEST)'
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 183
    object qryDetBoletaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryDetBoletaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryDetBoletaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryDetBoletaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryDetBoletaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryDetBoletaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryDetBoletaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryDetBoletaSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object qryDetBoletaVLRDESPOPER: TFloatField
      FieldName = 'VLRDESPOPER'
    end
    object qryDetBoletaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
    end
    object qryDetBoletaTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
    end
    object qryDetBoletaDESCMERCADO: TStringField
      FieldName = 'DESCMERCADO'
      Size = 10
    end
    object qryDetBoletaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetBoletaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object qryDetBoletaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDetBoletaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object qryDetBoletaDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object qryDetBoletaDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryDetBoletaDESPNATUR: TStringField
      FieldName = 'DESPNATUR'
      Size = 1
    end
  end
  object qryGerCarteira: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT CA.DESCCARTINVEST, SE.DESCSETOREMISSOR,  IV.DESC' +
        'INVESTIMENTO,'
      
        '               H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, IV.IDEMIS' +
        'SOR, AC.CODTIPOACAO,'
      
        '               (0) AS SALDOAQUI, (0) AS SALDOATU, (0) AS QTDTITL' +
        'OTE,'
      '               (0) AS COTACAOAUX,'
      '               (0) AS SALDOQTDEINVCART, (0) AS SALDOCAR, '
      
        '               (0) AS COTACAO, (0) AS TOTCART, (0) AS TOTACAOTIP' +
        'O, (0) AS TOTACAO'
      'FROM   HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV,'
      '             EMISSOR EM, SETOREMISSOR SE, ACAO AC'
      'WHERE (1 = 2) AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (IV.IDINVESTIMENTO        = AC.IDACAO) AND'
      '      (IV.IDEMISSOR                      = EM.IDEMISSOR) AND'
      '      (H1.IDINVESTIMENTO  IS NOT NULL)  AND'
      '      (EM.IDSETOREMISSOR   = SE.CODSETOREMISSOR)'
      
        'ORDER BY CA.DESCCARTINVEST,SE.DESCSETOREMISSOR, IV.DESCINVESTIME' +
        'NTO'
      ''
      ' ')
    UpdateObject = updGerCarteira
    ValidateWithMask = True
    Left = 333
    Top = 308
    object qryGerCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryGerCarteiraDESCSETOREMISSOR: TStringField
      FieldName = 'DESCSETOREMISSOR'
      Size = 60
    end
    object qryGerCarteiraDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryGerCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryGerCarteiraIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryGerCarteiraIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryGerCarteiraCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object qryGerCarteiraSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryGerCarteiraSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryGerCarteiraSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qryGerCarteiraCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qryGerCarteiraTOTCART: TFloatField
      FieldName = 'TOTCART'
    end
    object qryGerCarteiraTOTACAOTIPO: TFloatField
      FieldName = 'TOTACAOTIPO'
    end
    object qryGerCarteiraTOTACAO: TFloatField
      FieldName = 'TOTACAO'
    end
    object qryGerCarteiraQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object qryGerCarteiraSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryGerCarteiraCOTACAOAUX: TFloatField
      FieldName = 'COTACAOAUX'
    end
  end
  object qryGerCartSintetico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.DESCCARTINVEST, SE.DESCSETOREMISSOR,'
      '       H1.IDCARTEIRAINVEST, EM.IDSETOREMISSOR, '
      '       COUNT( IV.IDEMISSOR) AS EMPRESAS,'
      '       (0) AS VALORMERCADO, (0) AS SALDOATU, (0) AS SALDOAQUI,'
      '       (0) AS SALDOCAR, (0) AS TOTCART'
      ''
      'FROM  HISTCARTINV H1, CARTEIRAINVEST CA, EMISSOR EM,'
      '      SETOREMISSOR SE, INVESTIMENTO IV'
      'WHERE (1 = 2) AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (H1.IDINVESTIMENTO  IS NOT NULL) AND'
      '      (IV.IDEMISSOR            = EM.IDEMISSOR) AND'
      '      (EM.IDSETOREMISSOR   = SE.CODSETOREMISSOR)'
      
        'GROUP BY CA.DESCCARTINVEST,SE.DESCSETOREMISSOR, H1.IDCARTEIRAINV' +
        'EST, EM.IDSETOREMISSOR'
      ''
      ''
      ' ')
    UpdateObject = updGerCartSintetico
    ValidateWithMask = True
    Left = 237
    Top = 308
    object qryGerCartSinteticoDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryGerCartSinteticoDESCSETOREMISSOR: TStringField
      FieldName = 'DESCSETOREMISSOR'
      Size = 60
    end
    object qryGerCartSinteticoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryGerCartSinteticoIDSETOREMISSOR: TStringField
      FieldName = 'IDSETOREMISSOR'
      Size = 10
    end
    object qryGerCartSinteticoSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryGerCartSinteticoEMPRESAS: TFloatField
      FieldName = 'EMPRESAS'
    end
    object qryGerCartSinteticoVALORMERCADO: TFloatField
      FieldName = 'VALORMERCADO'
    end
    object qryGerCartSinteticoSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryGerCartSinteticoSALDOCAR: TFloatField
      FieldName = 'SALDOCAR'
    end
    object qryGerCartSinteticoTOTCART: TFloatField
      FieldName = 'TOTCART'
    end
  end
  object qryProvisaoIR: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IV.DESCINVESTIMENTO, PE.NOME, H1.IDINVESTIMENTO,'
      
        '       (0) AS SALDOQTDEINVCART, (0) AS SALDOVLRCARTINV,  (0) AS ' +
        'SALDOAQUI,'
      '       (0) AS SALDOVLRANT, (0) AS SALDOAQUIANT, (0) AS COTACAO'
      'FROM   PESSOA PE, HISTCARTINV H1, INVESTIMENTO IV, ACAO AC'
      'WHERE (1 = 2) AND'
      '      (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '      (H1.IDINVESTIMENTO  IS NOT NULL)  AND'
      '     (IV.IDEMISSOR            = PE.IDPESSOA)'
      'ORDER BY IV.DESCINVESTIMENTO'
      ''
      ''
      ' ')
    UpdateObject = updProvisaoIR
    ValidateWithMask = True
    Left = 35
    Top = 437
  end
  object qryTIRAnalitMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT ('#39'                                                       ' +
        '           '#39') AS CARTEIRA,'
      
        '               ('#39'                                               ' +
        '                   '#39') AS INVESTIMENTO, '
      
        '               ('#39'                                               ' +
        '                   '#39') AS LOTE, '
      
        '               ('#39'                                               ' +
        '                   '#39') AS HISTORICO, '
      '               (0) AS VALMOVIM'
      'FROM   DUAL'
      'WHERE (1 = 2)')
    UpdateObject = updTIRAnalitMov
    ValidateWithMask = True
    Left = 133
    Top = 437
    object qryTIRAnalitMovCARTEIRA: TStringField
      FieldName = 'CARTEIRA'
      Size = 66
    end
    object qryTIRAnalitMovINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 66
    end
    object qryTIRAnalitMovLOTE: TStringField
      FieldName = 'LOTE'
      Size = 66
    end
    object qryTIRAnalitMovHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 66
    end
    object qryTIRAnalitMovVALMOVIM: TFloatField
      FieldName = 'VALMOVIM'
    end
  end
  object qryLimBancos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EM.SIGLAEMISSOR, CL.SIGLACLASSINSTFIN,  CL.PERCLIMINSTFIN' +
        ', TO_DATE('#39#39')  AS DATA, (0) AS PATRIMONIO, (0) AS LIMITE,'
      
        '       (0) AS APLIC1D, (0) AS APLIC30D, (0) AS APLIC60D, (0) AS ' +
        'TOTAL,'
      
        '       (0) AS FOLGA1, (0) AS FOLGA2, (0) AS FOLGA3, (0) AS FUNDO' +
        'S, (0) AS PARTICIPACAO'
      'FROM EMISSOR EM, CLASSINSTFIN CL'
      'WHERE (1 = 2) AND'
      '      (EM.FLGINSTFIN = '#39'S'#39') AND'
      '      (EM.IDCLASSINSTFIN = CL.IDCLASSINSTFIN)'
      ' ')
    UpdateObject = updLimBancos
    ValidateWithMask = True
    Left = 237
    Top = 437
  end
  object qryBoletaRenFixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  OI.IDOPERACAOINVEST, OI.DATAOPERACAO, OI.DATAVENCOPER, O' +
        'I.QTDEOPERACAO,'
      
        #9'     OI.PRECOUNITOPERACAO, OI.VLROPERACAO, OI.NUMDOCUMENTO, MO.' +
        'MOEDESC, PS.NOME, CS.SGLCUSTODIANTE,'
      
        #9'     IV.DESCINVESTIMENTO, IV.OBSINVESTIMENTO, TI.DESCTIPOOPERAC' +
        'AO, OI.OBSERVACAO,'
      
        #9'     TI.NATUREZAOPERACAO,CA.DESCCARTINVEST, TT.VLRRESGATE, CO.P' +
        'RZVENC,'
      '        CO.VLRCOMPRATITLOTE, CO.DATAVENCIM,  IV.IDINVESTIMENTO,'
      
        '        TT.INDEXRENFIX, TT.PERCINDEX, TT.CODTIPTXJUROS, TT.DATAI' +
        'NIJURRENFIX, TT.JUROSRENFIX, TT.PREMIORENFIX,'
      
        '        TT.CODTIPTXPREMIO,TJ.DESCTIPJUROS,TJ.TAMPERJUROS,TJ.EFET' +
        'NOMI,(0) AS TAXAOVER,OI.IDCARTEIRAINVEST, (0) AS VALORJUROS, TT.' +
        'JUROSDIA, OI.IDLOTE'
      ''
      ''
      
        'FROM '#9'OPERACAOINVEST OI, PESSOA PS, TITRENFIXA TT, TIPOTITRENFIX' +
        'A TP, CUSTODIANTE CS,'
      
        #9'   INVESTIMENTO IV, TIPOOPERACAO TI, CARTEIRAINVEST CA, CONTRAT' +
        'OINVESTIM CO,'
      '      MOEDA MO, TIPOJUROS TJ'
      ''
      'WHERE   (1 = 2) AND'
      '        (OI.NUMDOCUMENTO     = '#39'RF-99/0237'#39') '#9'    AND'
      '        (OI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND'
      '        (OI.IDINVESTIMENTO   = IV.IDINVESTIMENTO)   AND'
      '        (IV.IDINVESTIMENTO   = TT.IDTITRENFIXA)     AND'
      '        (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA)    AND'
      #9'(OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)   AND'
      '        (PS.IDPESSOA         = IV.IDEMISSOR)        AND'
      '        (CS.IDCUSTODIANTE(+) = OI.IDCUSTODIANTE)    AND'
      '        (OI.IDINVESTIMENTO   = CO.IDINVESTIMENTO)   AND'
      
        '        ((OI.IDLOTE IS NULL AND CO.IDLOTE IS NULL) OR (OI.IDLOTE' +
        ' = CO.IDLOTE))  AND'
      '        (TT.INDEXRENFIX      = MO.MOECODIGO(+)) AND'
      '        (TT.CODTIPTXJUROS    = TJ.CODTIPTXJUROS(+))'
      ' ')
    UpdateObject = updBoletaRenFixa
    ValidateWithMask = True
    Left = 333
    Top = 437
    object qryBoletaRenFixaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryBoletaRenFixaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBoletaRenFixaDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryBoletaRenFixaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryBoletaRenFixaPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryBoletaRenFixaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryBoletaRenFixaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryBoletaRenFixaMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryBoletaRenFixaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBoletaRenFixaSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryBoletaRenFixaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryBoletaRenFixaOBSINVESTIMENTO: TStringField
      FieldName = 'OBSINVESTIMENTO'
      Size = 200
    end
    object qryBoletaRenFixaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBoletaRenFixaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryBoletaRenFixaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
    object qryBoletaRenFixaDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryBoletaRenFixaVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
    end
    object qryBoletaRenFixaPRZVENC: TFloatField
      FieldName = 'PRZVENC'
    end
    object qryBoletaRenFixaVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
    end
    object qryBoletaRenFixaDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
    end
    object qryBoletaRenFixaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBoletaRenFixaINDEXRENFIX: TFloatField
      FieldName = 'INDEXRENFIX'
    end
    object qryBoletaRenFixaPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
    end
    object qryBoletaRenFixaCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
    end
    object qryBoletaRenFixaDATAINIJURRENFIX: TDateTimeField
      FieldName = 'DATAINIJURRENFIX'
    end
    object qryBoletaRenFixaJUROSRENFIX: TFloatField
      FieldName = 'JUROSRENFIX'
    end
    object qryBoletaRenFixaPREMIORENFIX: TFloatField
      FieldName = 'PREMIORENFIX'
    end
    object qryBoletaRenFixaCODTIPTXPREMIO: TFloatField
      FieldName = 'CODTIPTXPREMIO'
    end
    object qryBoletaRenFixaDESCTIPJUROS: TStringField
      FieldName = 'DESCTIPJUROS'
      Size = 60
    end
    object qryBoletaRenFixaTAXAOVER: TFloatField
      FieldName = 'TAXAOVER'
    end
    object qryBoletaRenFixaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryBoletaRenFixaVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object qryBoletaRenFixaJUROSDIA: TFloatField
      FieldName = 'JUROSDIA'
    end
    object qryBoletaRenFixaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryBoletaRenFixaTAMPERJUROS: TFloatField
      FieldName = 'TAMPERJUROS'
    end
    object qryBoletaRenFixaEFETNOMI: TStringField
      FieldName = 'EFETNOMI'
      Size = 1
    end
  end
  object qryRentRendaFixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT CA.DESCCARTINVEST, TP.CODTIPRENFIXA, TP.DESCTIPR' +
        'ENFIXA, (0) AS SALDOREND'
      'FROM   HISTCARTINV H1,  CARTEIRAINVEST CA,'
      '       TITRENFIXA TT, TIPOTITRENFIXA TP'
      'WHERE'
      '      (1 = 2) AND'
      '      (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND'
      '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA)  AND'
      '      (H1.SALDOREND <> 0)'
      'ORDER BY CA.DESCCARTINVEST, TP.DESCTIPRENFIXA'
      ' ')
    UpdateObject = updRentRendaFixa
    ValidateWithMask = True
    Left = 567
    Top = 183
  end
  object QryValIndic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   E.SIGLAEMISSOR,VPE.DATAREFPREMISSOR,  PE.DESCPARAMEMISS' +
        'OR,'
      '         VPE.VLRPARAMEMISSOR, VPE.IDPARAMEMISSOR,'
      '         VPE.IDEMISSOR,VPE.IDREGRAUSOEMISSOR'
      ''
      'FROM '#9' VALPARAMXEMISSOR VPE, EMISSOR E, PARAMEMISSOR PE'
      ''
      'WHERE'
      '      (1 = 2) AND'
      '       VPE.IDEMISSOR      =  E.IDEMISSOR AND'
      '       PE.IDPARAMEMISSOR  =  VPE.IDPARAMEMISSOR'
      ''
      
        'ORDER'#9' BY E.SIGLAEMISSOR, PE.DESCPARAMEMISSOR, VPE.DATAREFPREMIS' +
        'SOR'
      ' ')
    ValidateWithMask = True
    Left = 669
    Top = 183
  end
  object qryEnquadraRenFixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CA.DESCCARTINVEST, ('#39'A'#39') AS CODCLASS, P.NOME, H1.IDLOTE,'
      
        '       (0) AS DESCCLASS, MO.MOEDESC, TT.JUROSRENFIX, TJ.DESCTIPJ' +
        'UROS, TP.CODTIPRENFIXA,'
      
        '       H1.IDCARTEIRAINVEST, H1.IDINVESTIMENTO, H1.SALDOVLRINVCAR' +
        'T, TT.DATAVENCTITRENFIX, '
      
        '       TO_DATE('#39'01/01/1999'#39','#39'DD/MM/YYYY'#39') AS DATAINICIAL, (0) AS' +
        ' VALAPLIC, (0) AS RENDIMENTO, (0) AS RESGATE,'
      
        '       (0) AS VARIACAO, (0) AS JUROS, (0) AS AGIO, (0) AS RENDTO' +
        ','
      '       (0) AS SALDO, (0) AS TAXAOVER'
      
        'FROM   PESSOA P, HISTCARTINV H1,  CARTEIRAINVEST CA, CM.INVESTIM' +
        'ENTO IV, '
      
        '             TITRENFIXA TT, TIPOTITRENFIXA TP, MOEDA MO, TIPOJUR' +
        'OS TJ'
      'WHERE  1=2 AND'
      '       (H1.DATAMOVCARTINV ='
      '          (SELECT MAX(H2.DATAMOVCARTINV)'
      '           FROM   HISTCARTINV H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      
        '                 (H2.DATAMOVCARTINV  <= TO_DATE('#39'11/01/2000'#39','#39'dd' +
        '/mm/yyyy'#39')))) AND'
      '       (H1.IDHISTCARTINV   ='
      '          (SELECT MAX(H3.IDHISTCARTINV)'
      '           FROM   HISTCARTINV H3'
      '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                 (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.ID' +
        'LOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      
        '                 (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AN' +
        'D'
      '      (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) AND'
      '      (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO) AND'
      '      (IV.IDINVESTIMENTO   = TT.IDTITRENFIXA) AND'
      '      (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA) AND'
      '      (TT.INDEXRENFIX      = MO.MOECODIGO(+)) AND'
      '      (TT.CODTIPTXJUROS    = TJ.CODTIPTXJUROS(+)) AND'
      '      (P.IDPESSOA = IV.IDEMISSOR) AND'
      '      (H1.SALDOVLRINVCART <> 0)'
      'ORDER BY CA.DESCCARTINVEST, DESCCLASS, P.NOME, H1.IDLOTE'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updEnquadraRenFixa
    ValidateWithMask = True
    Left = 441
    Top = 437
  end
  object QryRelatCotacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CI.*, IV.*'
      ''
      'FROM COTACAOINVEST CI,INVESTIMENTO IV  '
      ''
      'WHERE '#9'(1 = 2) AND (CI.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      ''
      'ORDER BY CI.IDINVESTIMENTO, CI.DATACOTACAO'
      ' ')
    ValidateWithMask = True
    Left = 441
    Top = 308
  end
  object qryMemoria: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA AS DATA,'
      '       COTVALOR,'
      '       (0) AS FATOR,'
      '       (0) AS VARIACAO,'
      '       (0) AS FATACU,'
      '       (0) AS TAXA'
      'FROM COTACAOMOEDA'
      'WHERE MOECODIGO = :MOEDA AND'
      '      COTDATA BETWEEN :DATAINI AND :DATAFIM'
      'ORDER BY COTDATA'
      ' '
      ' '
      ' ')
    UpdateObject = updMemoria
    ValidateWithMask = True
    Left = 333
    Top = 183
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOEDA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryMemoriaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryMemoriaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      DisplayFormat = '#,##0.00000000'
    end
    object qryMemoriaFATOR: TFloatField
      FieldName = 'FATOR'
      DisplayFormat = '#,##0.00000000'
    end
    object qryMemoriaVARIACAO: TFloatField
      FieldName = 'VARIACAO'
      DisplayFormat = '#,##0.00000000'
    end
    object qryMemoriaFATACU: TFloatField
      FieldName = 'FATACU'
      DisplayFormat = '#,##0.00000000'
    end
    object qryMemoriaTAXA: TFloatField
      FieldName = 'TAXA'
      DisplayFormat = '#,##0.00000000'
    end
  end
  object qryTIRAnalitico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IV.DESCINVESTIMENTO, HC.IDLOTE,'
      '                                HC.IDINVESTIMENTO, '
      
        '                                HC.DATAMOVCARTINV,  (0) AS SALDO' +
        'DIA'
      'FROM   HISTCARTINV HC,  INVESTIMENTO IV'
      'WHERE         (1 = 2) AND'
      '              (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '              (HC.IDINVESTIMENTO  IS NOT NULL)  AND'
      
        '              (HC.DATAMOVCARTINV   >= TO_DATE('#39'01/09/1999'#39','#39'DD/M' +
        'M/YYYY'#39')) AND'
      
        '              (HC.DATAMOVCARTINV   <= TO_DATE('#39'30/09/1999'#39','#39'DD/M' +
        'M/YYYY'#39'))  AND'
      '              (HC.IDTIPOINVEST IN (1,2))'
      ''
      'ORDER BY IV.DESCINVESTIMENTO, HC.IDLOTE,  HC.DATAMOVCARTINV'
      ''
      ''
      ''
      ''
      ' ')
    UpdateObject = updTIRAnalitico
    ValidateWithMask = True
    Left = 133
    Top = 308
    object qryTIRAnaliticoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryTIRAnaliticoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryTIRAnaliticoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryTIRAnaliticoDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryTIRAnaliticoSALDODIA: TFloatField
      FieldName = 'SALDODIA'
    end
  end
  object dsTIRAnalitico: TwwDataSource
    DataSet = qryTIRAnalitico
    Left = 133
    Top = 308
  end
  object bdeTIRAnalitico: TppBDEPipeline
    DataSource = dsTIRAnalitico
    UserName = 'bdeTIRAnalitico'
    Left = 133
    Top = 308
  end
  object RptTIRAnalitico: TppReport
    AutoStop = False
    DataPipeline = bdeTIRAnalitico
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 133
    Top = 255
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeTIRAnalitico'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 22225
        mmWidth = 197300
        BandType = 0
      end
      object lbDataIniA: TppLabel
        UserName = 'lbDataIniA'
        Caption = 'lbDataIniA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 14552
        BandType = 0
      end
      object lbDataFimA: TppLabel
        UserName = 'lbDataFimA'
        Caption = 'lbDataFimA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 44186
        mmTop = 14023
        mmWidth = 16404
        BandType = 0
      end
      object RptTIRAnaliticoLine1: TppLine
        UserName = 'RptTIRAnaliticoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197300
        BandType = 0
      end
      object RptTIRAnaliticoLabel5: TppLabel
        UserName = 'RptTIRAnaliticoLabel5'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 23019
        mmWidth = 7938
        BandType = 0
      end
      object RptTIRAnaliticoLabel6: TppLabel
        UserName = 'RptTIRAnaliticoLabel6'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 23019
        mmWidth = 6615
        BandType = 0
      end
      object RptTIRAnaliticoLabel7: TppLabel
        UserName = 'RptTIRAnaliticoLabel7'
        Caption = 'Data '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 23019
        mmWidth = 6879
        BandType = 0
      end
      object RptTIRAnaliticoLabel8: TppLabel
        UserName = 'RptTIRAnaliticoLabel8'
        Caption = 'Valor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 23019
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Fluxo Financeiro para Cálculo da TIR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 62706
        BandType = 0
      end
      object ppLabel53: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label501'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object RptTIRAnaliticoCarteira: TppLabel
        UserName = 'LCarteiraTIR1'
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
      object ppDBImage21: TppDBImage
        UserName = 'DBImage201'
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
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      BeforePrint = ppDetailBand7BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object RptTIRAnaliticoDBText1: TppDBText
        UserName = 'RptTIRAnaliticoDBText1'
        DataField = 'SALDODIA'
        DataPipeline = bdeTIRAnalitico
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitico'
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 794
        mmWidth = 25665
        BandType = 4
      end
      object RptTIRAnaliticoDBText2: TppDBText
        UserName = 'RptTIRAnaliticoDBText2'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = bdeTIRAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeTIRAnalitico'
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object lbInvestimento: TppLabel
        OnPrint = lbInvestimentoPrint
        UserName = 'lbInvestimento'
        Caption = 'lbInvestimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object lbLote: TppLabel
        OnPrint = lbLotePrint
        UserName = 'lbLote'
        Caption = 'lbLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 794
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel18: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel18'
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
        mmLeft = 265
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
        mmLeft = 170392
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptTIRAnaliticoSummaryBand1: TppSummaryBand
      BeforeGenerate = RptTIRAnaliticoSummaryBand1BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object RptTIRAnaliticoLine3: TppLine
        UserName = 'RptTIRAnaliticoLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object RptTIRAnaliticolblTotal: TppLabel
        UserName = 'RptTIRAnaliticolblTotal'
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 1588
        mmWidth = 7673
        BandType = 7
      end
      object RptTIRAnaliticoMemo1: TppMemo
        UserName = 'RptTIRAnaliticoMemo1'
        Caption = 'MEMODADOS'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 23019
        mmLeft = 109009
        mmTop = 6350
        mmWidth = 25929
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptTIRAnaliticoMemo2: TppMemo
        UserName = 'RptTIRAnaliticoMemo2'
        Caption = 'MEMOVALORES'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 23019
        mmLeft = 136789
        mmTop = 6350
        mmWidth = 21431
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptTIRAnaliticolblTIR: TppLabel
        UserName = 'RptTIRAnaliticoLabel101'
        Caption = 'TIR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 2117
        mmWidth = 4498
        BandType = 7
      end
      object RptTIRAnaliticolblVlrTIR: TppLabel
        UserName = 'RptTIRAnaliticoLabel102'
        Caption = 'VlrTIR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 136790
        mmTop = 2117
        mmWidth = 8731
        BandType = 7
      end
    end
  end
  object updTIRAnalitico: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDODIA = :SALDODIA'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (SALDODIA)'
      'values'
      '  (:SALDODIA)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 133
    Top = 308
  end
  object bdeTIRSintetico: TppBDEPipeline
    DataSource = dsTIRSintetico
    UserName = 'bdeTIRSintetico'
    Left = 35
    Top = 308
    object bdeTIRSinteticoppField1: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object bdeTIRSinteticoppField2: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object bdeTIRSinteticoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object bdeTIRSinteticoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeTIRSinteticoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIR'
      FieldName = 'TIR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object bdeTIRSinteticoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeTIRSinteticoppField7: TppField
      FieldAlias = 'FLGERRO'
      FieldName = 'FLGERRO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
  end
  object dsTIRSintetico: TwwDataSource
    DataSet = qryTIRSintetico
    Left = 35
    Top = 308
  end
  object updTIRSintetico: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  TIR = :TIR,'
      '  VARIACAO = :VARIACAO,'
      '  FLGERRO = :FLGERRO'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (TIR, VARIACAO, FLGERRO)'
      'values'
      '  (:TIR, :VARIACAO, :FLGERRO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 35
    Top = 308
  end
  object qryTIRSintetico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IV.DESCINVESTIMENTO, HC.IDLOTE, P.NOME,'
      
        '                                HC.IDINVESTIMENTO, (0) AS TIR, (' +
        '0) AS VARIACAO,'
      '                                '#39#39#39#39' AS FLGERRO'
      'FROM   PESSOA P, HISTCARTINV HC,  INVESTIMENTO IV,  EMISSOR EM'
      'WHERE'
      '              (HC.IDINVESTIMENTO       = IV.IDINVESTIMENTO) AND'
      '              (EM.IDEMISSOR = IV.IDEMISSOR) AND'
      '              (P.IDPESSOA = EM.IDEMISSOR)    AND'
      '              (HC.IDTIPOINVEST IN (1,2))'
      'ORDER BY IV.DESCINVESTIMENTO, HC.IDLOTE'
      ''
      '')
    UpdateObject = updTIRSintetico
    ValidateWithMask = True
    Left = 35
    Top = 308
  end
  object RptTIRSintetico: TppReport
    AutoStop = False
    DataPipeline = bdeTIRSintetico
    OnStartPage = RptTIRSinteticoStartPage
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
    Left = 35
    Top = 255
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeTIRSintetico'
    object ppHeaderBand22: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26458
        mmWidth = 197300
        BandType = 0
      end
      object lbDataIni: TppLabel
        UserName = 'lbDataIni'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 17992
        BandType = 0
      end
      object lbDataFim: TppLabel
        UserName = 'lbDataFim'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 47890
        mmTop = 14023
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'RptTIRSinteticoLabel5'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 21960
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'RptTIRSinteticoLabel6'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 21960
        mmWidth = 6615
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'RptTIRSinteticoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'RptTIRSinteticoLabel7'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'RptTIRSinteticoLabel8'
        Caption = 'TIR / R$  (%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 179652
        mmTop = 22225
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Demonstrativo da Rentabilidade Bruta Mensalizada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 86519
        BandType = 0
      end
      object ppLabel152: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label152'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object RptTIRSinteticoCarteira: TppLabel
        UserName = 'RptTIRSinteticoCarteira'
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
      object ppDBImage25: TppDBImage
        UserName = 'DBImage25'
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
      object ppLabel88: TppLabel
        UserName = 'Label1'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 44979
        mmTop = 14023
        mmWidth = 1588
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      BeforePrint = ppDetailBand4BeforePrint
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object shpTIRSintDet: TppShape
        OnPrint = shpTIRSintDetPrint
        UserName = 'shpTIRSintDet'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'RptTIRSinteticoDBText2'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeTIRSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeTIRSintetico'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 529
        mmWidth = 70644
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'RptTIRSinteticoDBText3'
        DataField = 'IDLOTE'
        DataPipeline = bdeTIRSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeTIRSintetico'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'RptTIRSinteticoDBText4'
        DataField = 'NOME'
        DataPipeline = bdeTIRSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeTIRSintetico'
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 529
        mmWidth = 79904
        BandType = 4
      end
      object RptTIRSinteticoDBText5: TppDBText
        UserName = 'RptTIRSinteticoDBText5'
        DataField = 'TIR'
        DataPipeline = bdeTIRSintetico
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeTIRSintetico'
        mmHeight = 3704
        mmLeft = 178859
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object LblErroCalc: TppLabel
        UserName = 'LblErroCalc'
        Caption = 'Erro Calc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182298
        mmTop = 794
        mmWidth = 11642
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLine49: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel105: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel11'
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
      object ppSystemVariable9: TppSystemVariable
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
      object ppSystemVariable10: TppSystemVariable
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
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object shpTirTotal: TppShape
        UserName = 'shpTirTotal'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel106: TppLabel
        UserName = 'LbTotal'
        Caption = 'LbTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 9260
        BandType = 7
      end
      object ppLabel107: TppLabel
        UserName = 'Lbl1'
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5027
        mmWidth = 6879
        BandType = 7
      end
      object Lbl2: TppLabel
        UserName = 'Lbl2'
        Caption = 'Lbl2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 191294
        mmTop = 5292
        mmWidth = 5292
        BandType = 7
      end
      object srptFluxo: TppSubReport
        UserName = 'srptFluxo'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBDEFluxo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 15081
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEFluxo
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
          Left = 400
          Top = 240
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEFluxo'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 20902
            mmPrintPosition = 0
            object shpTitFluxo: TppShape
              UserName = 'shpTitFluxo'
              Brush.Color = clSilver
              mmHeight = 10848
              mmLeft = 51594
              mmTop = 9790
              mmWidth = 82550
              BandType = 1
            end
            object ppLabel109: TppLabel
              UserName = 'Label88'
              Caption = 'Fluxo para Cálculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 51594
              mmTop = 10054
              mmWidth = 82021
              BandType = 1
            end
            object ppLabel110: TppLabel
              UserName = 'Label92'
              Caption = 'Data do Fluxo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 51594
              mmTop = 15875
              mmWidth = 23548
              BandType = 1
            end
            object ppLabel111: TppLabel
              UserName = 'Label93'
              Caption = 'Valor do Fluxo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 108744
              mmTop = 15875
              mmWidth = 24871
              BandType = 1
            end
          end
          object ppDetailBand23: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object shpDetFluxo: TppShape
              OnPrint = shpDetFluxoPrint
              UserName = 'shpDetFluxo'
              Pen.Style = psClear
              mmHeight = 3175
              mmLeft = 51594
              mmTop = 0
              mmWidth = 82286
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText24'
              DataField = 'DATAMOVCARTINV'
              DataPipeline = ppBDEFluxo
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDEFluxo'
              mmHeight = 3175
              mmLeft = 51858
              mmTop = 0
              mmWidth = 21696
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText25'
              DataField = 'SALDODIA'
              DataPipeline = ppBDEFluxo
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEFluxo'
              mmHeight = 3175
              mmLeft = 85461
              mmTop = 0
              mmWidth = 48154
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
  end
  object ppBDEFluxo: TppBDEPipeline
    DataSource = dsFluxoTir
    UserName = 'BDEFluxo'
    Left = 35
    Top = 308
  end
  object qryFluxoTir: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT HC.DATAMOVCARTINV, (0) AS SALDODIA'
      'FROM   HISTCARTINV HC '
      'WHERE (1 = 2) ')
    UpdateObject = updFluxoTir
    ValidateWithMask = True
    Left = 35
    Top = 308
    object qryFluxoTirDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryFluxoTirSALDODIA: TFloatField
      FieldName = 'SALDODIA'
    end
  end
  object dsFluxoTir: TwwDataSource
    AutoEdit = False
    DataSet = qryFluxoTir
    Left = 35
    Top = 308
  end
  object updFluxoTir: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  SALDODIA = :SALDODIA'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (SALDODIA)'
      'values'
      '  (:SALDODIA)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 35
    Top = 308
  end
  object dsVarMesCarteira: TwwDataSource
    DataSet = qryVarMesCarteira
    Left = 75
    Top = 183
  end
  object bdeVarMesCarteira: TppBDEPipeline
    DataSource = dsVarMesCarteira
    UserName = 'bdeVarMesCarteira'
    Left = 19
    Top = 183
    object bdeVarMesCarteirappField1: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object bdeVarMesCarteirappField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object bdeVarMesCarteirappField3: TppField
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object bdeVarMesCarteirappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object bdeVarMesCarteirappField5: TppField
      FieldAlias = 'DATAMOV1'
      FieldName = 'DATAMOV1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object bdeVarMesCarteirappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeVarMesCarteirappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDEINVCART'
      FieldName = 'SALDOQTDEINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeVarMesCarteirappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRINVCART'
      FieldName = 'SALDOVLRINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeVarMesCarteirappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOAQUI'
      FieldName = 'SALDOAQUI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeVarMesCarteirappField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOATU'
      FieldName = 'SALDOATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeVarMesCarteirappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTACAO'
      FieldName = 'COTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeVarMesCarteirappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARATEMESANT'
      FieldName = 'VARATEMESANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object bdeVarMesCarteirappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARATEMES'
      FieldName = 'VARATEMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object bdeVarMesCarteirappField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMES'
      FieldName = 'VARMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object bdeVarMesCarteirappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCART'
      FieldName = 'TOTCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object bdeVarMesCarteirappField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object bdeVarMesCarteirappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'BAIXA'
      FieldName = 'BAIXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object bdeVarMesCarteirappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEANT'
      FieldName = 'QTDEANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object bdeVarMesCarteirappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  object updVarMesCarteira: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  COTACAO = :COTACAO,'
      '  VARATEMESANT = :VARATEMESANT,'
      '  VARATEMES = :VARATEMES,'
      '  VARMES = :VARMES,'
      '  TOTCART = :TOTCART,'
      '  VARIACAO = :VARIACAO,'
      '  BAIXA = :BAIXA,'
      '  QTDEANT = :QTDEANT'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (COTACAO, VARATEMESANT, VARATEMES, VARMES, TOTCART, VARIACAO, ' +
        'BAIXA, '
      '   QTDEANT)'
      'values'
      
        '  (:COTACAO, :VARATEMESANT, :VARATEMES, :VARMES, :TOTCART, :VARI' +
        'ACAO, :BAIXA, '
      '   :QTDEANT)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 59
    Top = 183
  end
  object qryVarMesCarteira: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE, H1.IDC' +
        'ARTEIRAINVEST,'
      
        '           H1.DATAMOVCARTINV AS DATAMOV1, H1.IDINVESTIMENTO, CA.' +
        'IDTIPOINVEST,'
      
        '           H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART, H1.SALDOAQUI' +
        ', H1.SALDOATU, (0) AS COTACAO,'
      
        '           (0) AS VARATEMESANT, (0) AS VARATEMES, (0) AS VARMES,' +
        ' (0) AS TOTCART, (0) AS VARIACAO,'
      '           (0) AS BAIXA, (0) AS QTDEANT'
      'FROM   HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV'
      'WHERE'
      ''
      '--              (1 = 2) AND'
      ''
      '          (H1.IDHISTCARTINV   IN'
      '          (SELECT MAX(IDHISTCARTINV)'
      '           FROM   HISTCARTINV'
      '           WHERE (IDTIPOINVEST = 2)'
      '             AND (DATAMOVCARTINV || IDINVESTIMENTO) IN'
      '                 (SELECT (MAX(DATAMOVCARTINV) || IDINVESTIMENTO)'
      '      '#9'           FROM    HISTCARTINV'
      '                  WHERE  (IDTIPOINVEST = 2)'
      
        '                   AND   (DATAMOVCARTINV  <= TO_DATE('#39'09/12/2004' +
        #39','#39'DD/MM/YYYY'#39'))'
      '                  GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO)'
      '           GROUP BY IDCARTEIRAINVEST,IDINVESTIMENTO))     AND'
      ''
      
        '              (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST) AN' +
        'D'
      '              (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)  AND'
      '              (H1.IDINVESTIMENTO  IS NOT NULL)'
      'ORDER BY CA.DESCCARTINVEST, IV.DESCINVESTIMENTO, H1.IDLOTE'
      '')
    UpdateObject = updVarMesCarteira
    ValidateWithMask = True
    Left = 35
    Top = 183
    object qryVarMesCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryVarMesCarteiraDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryVarMesCarteiraIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryVarMesCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryVarMesCarteiraDATAMOV1: TDateTimeField
      FieldName = 'DATAMOV1'
    end
    object qryVarMesCarteiraIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryVarMesCarteiraSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryVarMesCarteiraSALDOVLRINVCART: TFloatField
      FieldName = 'SALDOVLRINVCART'
    end
    object qryVarMesCarteiraSALDOAQUI: TFloatField
      FieldName = 'SALDOAQUI'
    end
    object qryVarMesCarteiraSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryVarMesCarteiraCOTACAO: TFloatField
      FieldName = 'COTACAO'
    end
    object qryVarMesCarteiraVARATEMESANT: TFloatField
      FieldName = 'VARATEMESANT'
    end
    object qryVarMesCarteiraVARATEMES: TFloatField
      FieldName = 'VARATEMES'
    end
    object qryVarMesCarteiraVARMES: TFloatField
      FieldName = 'VARMES'
    end
    object qryVarMesCarteiraTOTCART: TFloatField
      FieldName = 'TOTCART'
    end
    object qryVarMesCarteiraVARIACAO: TFloatField
      FieldName = 'VARIACAO'
    end
    object qryVarMesCarteiraBAIXA: TFloatField
      FieldName = 'BAIXA'
    end
    object qryVarMesCarteiraQTDEANT: TFloatField
      FieldName = 'QTDEANT'
    end
    object qryVarMesCarteiraIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
  end
  object dpLancCont: TppBDEPipeline
    DataSource = dsLancCont
    UserName = 'dpLancCont'
    Left = 669
    Top = 62
    object dpLancContppField1: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object dpLancContppField2: TppField
      FieldAlias = 'PAPEL'
      FieldName = 'PAPEL'
      FieldLength = 78
      DisplayWidth = 78
      Position = 1
    end
    object dpLancContppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEMOVINVCART'
      FieldName = 'QTDEMOVINVCART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object dpLancContppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOVCARTINV'
      FieldName = 'VLRMOVCARTINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object dpLancContppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object dpLancContppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object dpLancContppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object dpLancContppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object dpLancContppField9: TppField
      FieldAlias = 'TIPMOVCARTINV'
      FieldName = 'TIPMOVCARTINV'
      FieldLength = 3
      DisplayWidth = 3
      Position = 8
    end
    object dpLancContppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object dpLancContppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTCARTINV'
      FieldName = 'IDHISTCARTINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object dpLancContppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TQUANT'
      FieldName = 'TQUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object dpLancContppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TVALOR'
      FieldName = 'TVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object dpLancContppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TVARIACAO'
      FieldName = 'TVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object dpLancContppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TJUROS'
      FieldName = 'TJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object dpLancContppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOINVEST'
      FieldName = 'IDOPERACAOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object dpLancContppField17: TppField
      FieldAlias = 'PLNQUEBRA'
      FieldName = 'PLNQUEBRA'
      FieldLength = 84
      DisplayWidth = 84
      Position = 16
    end
    object dpLancContppField18: TppField
      FieldAlias = 'DESCOPER'
      FieldName = 'DESCOPER'
      FieldLength = 12
      DisplayWidth = 12
      Position = 17
    end
    object dpLancContppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object dpLancContppField20: TppField
      FieldAlias = 'DESCTPOPERACAO'
      FieldName = 'DESCTPOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
  end
  object dsLancCont: TwwDataSource
    DataSet = qryLancCont
    Left = 669
    Top = 62
  end
  object qryLancCont: TwwQuery
    AfterScroll = qryLancContAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DESCTIPOOPERACAO, PAPEL, QTDEMOVINVCART, VLRMOVCARTINV, V' +
        'LRVARIACAO, VLRJUROS, CODDOCUMENTO,'
      
        '       PLNCODIGO, TIPMOVCARTINV, IDTIPOOPERACAO, IDHISTCARTINV, ' +
        'TQUANT, TVALOR, TVARIACAO, TJUROS, IDOPERACAOINVEST,'
      
        '       DECODE(TIPMOVCARTINV,'#39'ATU'#39','#39'Atualizações'#39', '#39'Operações '#39' |' +
        '| PLNCODIGO) AS PLNQUEBRA,'
      
        '       DECODE(TIPMOVCARTINV,'#39'ATU'#39','#39'Atualizações'#39', '#39'Operações '#39') ' +
        'AS DESCOPER,'
      
        '       DECODE(TIPMOVCARTINV,'#39'ATU'#39','#39#39', DESCTIPOOPERACAO) AS DESCT' +
        'POPERACAO,'
      '       PLNPLANIL'
      
        'FROM (SELECT DESCTIPOOPERACAO, PAPEL, QTDEMOVINVCART, VLRMOVCART' +
        'INV, VLRVARIACAO, VLRJUROS,'
      
        '             CODDOCUMENTO, PLNCODIGO, TIPMOVCARTINV, IDTIPOOPERA' +
        'CAO, IDHISTCARTINV,'
      
        '             TQUANT, TVALOR, TVARIACAO, TJUROS, IDOPERACAOINVEST' +
        ', PLNPLANIL'
      
        '      FROM ( SELECT (DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39','#39'ATUALIZACAO'#39 +
        ','
      
        '                            DECODE(HI.IDDESPOPERINVEST,NULL,TP.D' +
        'ESCTIPOOPERACAO,HI.HISTMOVCARTINV))) AS DESCTIPOOPERACAO,'
      
        '                    (DECODE(HI.IDLOTE,NULL,IV.DESCINVESTIMENTO,I' +
        'V.DESCINVESTIMENTO || '#39' - Lote '#39' || HI.IDLOTE)) AS PAPEL,'
      '                     HI.QTDEMOVINVCART,'
      
        '                    (DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39',0,HI.VLRMOVCA' +
        'RTINV)) AS VLRMOVCARTINV,'
      
        '                     HI.VLRVARIACAO, HI.VLRJUROS, HI.CODDOCUMENT' +
        'O,'
      '                     HI.IDOPERACAOINVEST,'
      
        '                     DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLNCODIGO' +
        ', PLNOPER.PLNCODIGO) AS PLNCODIGO,'
      
        '                     HI.TIPMOVCARTINV, HI.IDTIPOOPERACAO, HI.IDH' +
        'ISTCARTINV,'
      
        '                     TBQUANT.TQUANT, TBVALOR.TVALOR, TBVARIACAO.' +
        'TVARIACAO, TBJUROS.TJUROS,'
      
        '                     DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39',PLA.PLNPLANIL' +
        ',PLO.PLNPLANIL) AS PLNPLANIL'
      
        '             FROM HISTCARTINV HI, TIPOOPERACAO TP, INVESTIMENTO ' +
        'IV, TIPODESPINVEST TD, PLANILHA PLA, PLANILHA PLO,'
      
        '                  (SELECT NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.' +
        'PLNCODIGO, PLNOPER.PLNCODIGO),0) AS PLNCODIGO,'
      '                          SUM(ABS(QTDEMOVINVCART)) AS TQUANT'
      '                   FROM HISTCARTINV HI,'
      
        '                        (SELECT DISTINCT PLNCODIGO, IDOPERACAOIN' +
        'VEST'
      '                         FROM HISTCARTINV'
      
        '                         WHERE DATAMOVCARTINV = to_date(:DATAMOV' +
        ','#39'dd/mm/yyyy'#39') AND'
      
        '                               IDTIPOINVEST = :TIPOINVEST AND ID' +
        'CARTEIRAINVEST = :CARTEIRA AND'
      
        '                               IDOPERACAOINVEST IS NOT NULL AND ' +
        'TIPMOVCARTINV = '#39'OPE'#39
      
        '                         GROUP BY PLNCODIGO, IDOPERACAOINVEST) P' +
        'LNOPER'
      
        '                   WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/m' +
        'm/yyyy'#39') AND'
      
        '                         IDTIPOINVEST = :TIPOINVEST AND IDCARTEI' +
        'RAINVEST = :CARTEIRA AND'
      
        '                         (HI.IDOPERACAOINVEST = PLNOPER.IDOPERAC' +
        'AOINVEST(+))'
      
        '                   GROUP BY NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', H' +
        'I.PLNCODIGO, PLNOPER.PLNCODIGO),0)) TbQUANT,'
      ''
      
        '                  (SELECT NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.' +
        'PLNCODIGO, PLNOPER.PLNCODIGO),0) AS PLNCODIGO,'
      
        '                          SUM(ABS(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39',' +
        '0,VLRMOVCARTINV))) AS TVALOR'
      '                   FROM HISTCARTINV HI,'
      
        '                        (SELECT DISTINCT PLNCODIGO, IDOPERACAOIN' +
        'VEST'
      '                         FROM HISTCARTINV'
      
        '                         WHERE DATAMOVCARTINV = to_date(:DATAMOV' +
        ','#39'dd/mm/yyyy'#39') AND'
      
        '                               IDTIPOINVEST = :TIPOINVEST AND ID' +
        'CARTEIRAINVEST = :CARTEIRA AND'
      
        '                               IDOPERACAOINVEST IS NOT NULL AND ' +
        'TIPMOVCARTINV = '#39'OPE'#39
      
        '                         GROUP BY PLNCODIGO, IDOPERACAOINVEST) P' +
        'LNOPER'
      
        '                   WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/m' +
        'm/yyyy'#39') AND'
      
        '                         IDTIPOINVEST = :TIPOINVEST AND IDCARTEI' +
        'RAINVEST = :CARTEIRA AND'
      
        '                         (HI.IDOPERACAOINVEST = PLNOPER.IDOPERAC' +
        'AOINVEST(+))'
      
        '                   GROUP BY NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', H' +
        'I.PLNCODIGO, PLNOPER.PLNCODIGO),0)) TBVALOR,'
      ''
      
        '                  (SELECT NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.' +
        'PLNCODIGO, PLNOPER.PLNCODIGO),0) AS PLNCODIGO,'
      '                          SUM(ABS(VLRVARIACAO)) AS TVARIACAO'
      '                   FROM HISTCARTINV HI,'
      
        '                        (SELECT DISTINCT PLNCODIGO, IDOPERACAOIN' +
        'VEST'
      '                         FROM HISTCARTINV'
      
        '                         WHERE DATAMOVCARTINV = to_date(:DATAMOV' +
        ','#39'dd/mm/yyyy'#39') AND'
      
        '                               IDTIPOINVEST = :TIPOINVEST AND ID' +
        'CARTEIRAINVEST = :CARTEIRA AND'
      
        '                               IDOPERACAOINVEST IS NOT NULL AND ' +
        'TIPMOVCARTINV = '#39'OPE'#39
      
        '                         GROUP BY PLNCODIGO, IDOPERACAOINVEST) P' +
        'LNOPER'
      
        '                   WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/m' +
        'm/yyyy'#39') AND'
      
        '                         IDTIPOINVEST = :TIPOINVEST AND IDCARTEI' +
        'RAINVEST = :CARTEIRA AND'
      
        '                         (HI.IDOPERACAOINVEST = PLNOPER.IDOPERAC' +
        'AOINVEST(+))'
      
        '                   GROUP BY NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', H' +
        'I.PLNCODIGO, PLNOPER.PLNCODIGO),0)) TBVARIACAO,'
      ''
      
        '                  (SELECT NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.' +
        'PLNCODIGO, PLNOPER.PLNCODIGO),0) AS PLNCODIGO,'
      '                          SUM(ABS(HI.VLRJUROS)) AS TJUROS'
      '                   FROM HISTCARTINV HI,'
      
        '                        (SELECT DISTINCT PLNCODIGO, IDOPERACAOIN' +
        'VEST'
      '                         FROM HISTCARTINV'
      
        '                         WHERE DATAMOVCARTINV = to_date(:DATAMOV' +
        ','#39'dd/mm/yyyy'#39') AND'
      
        '                               IDTIPOINVEST = :TIPOINVEST AND ID' +
        'CARTEIRAINVEST = :CARTEIRA AND'
      
        '                               IDOPERACAOINVEST IS NOT NULL AND ' +
        'TIPMOVCARTINV = '#39'OPE'#39
      
        '                         GROUP BY PLNCODIGO, IDOPERACAOINVEST) P' +
        'LNOPER'
      
        '                   WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/m' +
        'm/yyyy'#39') AND'
      
        '                         IDTIPOINVEST = :TIPOINVEST AND IDCARTEI' +
        'RAINVEST = :CARTEIRA AND'
      
        '                         (HI.IDOPERACAOINVEST = PLNOPER.IDOPERAC' +
        'AOINVEST(+))'
      
        '                   GROUP BY NVL(DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', H' +
        'I.PLNCODIGO, PLNOPER.PLNCODIGO),0)) TBJUROS,'
      ''
      
        '                  (SELECT DISTINCT NVL(PLNCODIGO,0) AS PLNCODIGO' +
        ', IDOPERACAOINVEST'
      '                   FROM HISTCARTINV'
      
        '                   WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/m' +
        'm/yyyy'#39') AND'
      
        '                         IDTIPOINVEST = :TIPOINVEST AND IDCARTEI' +
        'RAINVEST = :CARTEIRA AND'
      
        '                         IDOPERACAOINVEST IS NOT NULL AND TIPMOV' +
        'CARTINV = '#39'OPE'#39
      
        '                   GROUP BY NVL(PLNCODIGO,0), IDOPERACAOINVEST) ' +
        'PLNOPER'
      ''
      
        '             WHERE (HI.DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/mm/' +
        'yyyy'#39'))  AND'
      
        '                   (HI.IDCARTEIRAINVEST = :CARTEIRA )           ' +
        '         AND'
      
        '                   (HI.IDTIPOINVEST = :TIPOINVEST)              ' +
        '         AND'
      
        '                   (IV.IDINVESTIMENTO   = HI.IDINVESTIMENTO)    ' +
        '         AND'
      '                   ( ( ( :OPERACAO NOT IN (-2,-1) )      AND'
      '                       ( HI.IDTIPOOPERACAO = :OPERACAO ) AND'
      '                       ( :OPERACAO IS NOT NULL )         AND'
      
        '                       ( HI.TIPMOVCARTINV = '#39'OPE'#39') )            ' +
        ' OR'
      '                     ( ( :OPERACAO IN (-2,-1) )          AND'
      
        '                       ( HI.TIPMOVCARTINV = '#39'ATU'#39') )            ' +
        ' OR'
      
        '                       ( :OPERACAO IS NULL ) )                  ' +
        '        AND'
      
        '                   (HI.IDTIPOOPERACAO = TP.IDTIPOOPERACAO(+))   ' +
        '        AND'
      
        '                   (HI.PLNCODIGO = TBQUANT.PLNCODIGO(+))        ' +
        '        AND'
      
        '                   (DECODE(HI.TIPMOVCARTINV,'#39'ATU'#39', HI.PLNCODIGO,' +
        ' PLNOPER.PLNCODIGO) = TBVALOR.PLNCODIGO) AND'
      
        '                   (HI.PLNCODIGO = TBVARIACAO.PLNCODIGO(+))     ' +
        '        AND'
      
        '                   (HI.PLNCODIGO = TBJUROS.PLNCODIGO(+))        ' +
        '        AND'
      
        '                   (HI.IDOPERACAOINVEST = PLNOPER.IDOPERACAOINVE' +
        'ST(+))  AND'
      
        '                   (HI.PLNCODIGO = PLA.PLNCODIGO(+))            ' +
        '    AND'
      '                   (HI.PLNCODIGO = PLO.PLNCODIGO(+)))'
      '     UNION'
      
        '     (SELECT (DECODE(HI.TIPMOVFUNDO,'#39'ATU'#39','#39'ATUALIZACAO'#39',TP.DESCT' +
        'IPOOPERACAO)) AS DESCTIPOOPERACAO,'
      '             IV.DESCFUNDOINVEST AS PAPEL,'
      '             HI.SALDOQTDCOTAS AS QTDEMOVINVCART,'
      
        '            (DECODE(HI.TIPMOVFUNDO,'#39'ATU'#39',0,HI.SALDOVLRFUNDO)) AS' +
        ' VLRMOVCARTINV,'
      '             HI.VLRVARIACAO, 0 AS VLRJUROS, HI.CODDOCUMENTO,'
      
        '             DECODE(HI.TIPMOVFUNDO,'#39'ATU'#39', HI.PLNCODIGO, PLNOPER.' +
        'PLNCODIGO) AS PLNCODIGO,'
      
        '             HI.TIPMOVFUNDO AS TIPMOVCARTINV, HI.IDTIPOOPERACAO,' +
        ' HI.IDHISTFUNDO AS IDHISTCARTINV,'
      
        '             TBQUANT.TQUANT,TBVALOR.TVALOR, TBVARIACAO.TVARIACAO' +
        ', 0 AS TJUROS, HI.IDOPERACAOINVEST,'
      '             PL.PLNPLANIL'
      
        '      FROM HISTFUNDO HI,  FUNDOINVEST IV, TIPOOPERACAO TP, PLANI' +
        'LHA PL,'
      '          (SELECT PLNCODIGO, SUM(ABS(SALDOQTDCOTAS)) AS TQUANT'
      '           FROM HISTFUNDO'
      
        '           WHERE DATAMOVFUNDO = to_date(:DATAMOV,'#39'dd/mm/yyyy'#39') A' +
        'ND'
      
        '                 IDTIPOINVEST = :TIPOINVEST AND IDCARTEIRAINVEST' +
        ' = :CARTEIRA'
      '           GROUP BY PLNCODIGO ) TBQUANT,'
      
        '          (SELECT PLNCODIGO, SUM(ABS(DECODE(TIPMOVFUNDO,'#39'ATU'#39',0,' +
        'SALDOVLRFUNDO))) AS TVALOR'
      '           FROM HISTFUNDO'
      
        '           WHERE DATAMOVFUNDO = to_date(:DATAMOV,'#39'dd/mm/yyyy'#39') A' +
        'ND'
      
        '                 IDTIPOINVEST = :TIPOINVEST AND IDCARTEIRAINVEST' +
        ' = :CARTEIRA'
      '           GROUP BY PLNCODIGO) TBVALOR,'
      '          (SELECT PLNCODIGO, SUM(ABS(VLRVARIACAO)) AS TVARIACAO'
      '           FROM HISTFUNDO'
      
        '           WHERE DATAMOVFUNDO = to_date(:DATAMOV,'#39'dd/mm/yyyy'#39') A' +
        'ND'
      
        '                 IDTIPOINVEST = :TIPOINVEST AND IDCARTEIRAINVEST' +
        ' = :CARTEIRA'
      '           GROUP BY PLNCODIGO) TBVARIACAO,'
      '          (SELECT DISTINCT PLNCODIGO, IDOPERACAOINVEST'
      '           FROM HISTCARTINV'
      
        '           WHERE DATAMOVCARTINV = to_date(:DATAMOV,'#39'dd/mm/yyyy'#39')' +
        ' AND'
      
        '                 IDTIPOINVEST = :TIPOINVEST AND IDCARTEIRAINVEST' +
        ' = :CARTEIRA AND'
      
        '                 IDOPERACAOINVEST IS NOT NULL AND TIPMOVCARTINV ' +
        '= '#39'OPE'#39
      '           GROUP BY PLNCODIGO, IDOPERACAOINVEST) PLNOPER'
      '      WHERE (IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO)'
      '                             FROM HISTFUNDO HI'
      
        '                             WHERE (HI.DATAMOVFUNDO = TO_DATE(:D' +
        'ATAMOV,'#39'DD/MM/YYYY'#39'))  AND'
      
        '                                   (HI.IDCARTEIRAINVEST = :CARTE' +
        'IRA )                  AND'
      
        '                                   (HI.IDTIPOINVEST = :TIPOINVES' +
        'T)                     AND'
      
        '                                   ( ( ( :OPERACAO NOT IN (-2,-1' +
        ') )       AND'
      
        '                                       ( :OPERACAO IS NOT NULL )' +
        '          AND'
      
        '                                       ( HI.IDTIPOOPERACAO = :OP' +
        'ERACAO )  AND'
      
        '                                       ( HI.TIPMOVFUNDO = '#39'OPE'#39' ' +
        ') )            OR'
      
        '                                     ( ( :OPERACAO IN (-2,-1) ) ' +
        '          AND'
      
        '                                       ( HI.TIPMOVFUNDO = '#39'ATU'#39')' +
        ' )             OR'
      '                                     ( :OPERACAO IS NULL ) )'
      
        '                             GROUP BY IDFUNDOINVEST,DATAAPLICACA' +
        'O))  AND'
      
        '            (IV.IDFUNDOINVEST(+)   = HI.IDFUNDOINVEST)          ' +
        '     AND'
      
        '            (TP.IDTIPOOPERACAO(+) = HI.IDTIPOOPERACAO)          ' +
        '     AND'
      
        '            (HI.PLNCODIGO = TBQUANT.PLNCODIGO(+))               ' +
        '     AND'
      
        '            (HI.PLNCODIGO = TBVALOR.PLNCODIGO(+))               ' +
        '     AND'
      
        '            (HI.PLNCODIGO = TBVARIACAO.PLNCODIGO(+))            ' +
        '     AND'
      
        '            (HI.IDOPERACAOINVEST = PLNOPER.IDOPERACAOINVEST(+)) ' +
        '     AND'
      '            (HI.PLNCODIGO = PL.PLNCODIGO(+)))'
      '      ) MOVIMENTO'
      'ORDER BY PLNQUEBRA, PAPEL'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 669
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
        Value = '31/12/2002'
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
        Value = 2
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end>
    object qryLancContDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLancContPAPEL: TStringField
      FieldName = 'PAPEL'
      Size = 78
    end
    object qryLancContQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
      DisplayFormat = '###,###,##0.000000000'
    end
    object qryLancContVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContVLRJUROS: TFloatField
      FieldName = 'VLRJUROS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryLancContPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryLancContTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Size = 3
    end
    object qryLancContIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryLancContIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryLancContTQUANT: TFloatField
      FieldName = 'TQUANT'
      DisplayFormat = '###,###,##0.000000000'
    end
    object qryLancContTVALOR: TFloatField
      FieldName = 'TVALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContTVARIACAO: TFloatField
      FieldName = 'TVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContTJUROS: TFloatField
      FieldName = 'TJUROS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryLancContPLNQUEBRA: TStringField
      FieldName = 'PLNQUEBRA'
      Size = 84
    end
    object qryLancContDESCOPER: TStringField
      FieldName = 'DESCOPER'
      Size = 12
    end
    object qryLancContPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryLancContDESCTPOPERACAO: TStringField
      FieldName = 'DESCTPOPERACAO'
      Size = 60
    end
  end
  object RptLancCont: TppReport
    AutoStop = False
    DataPipeline = dpLancCont
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Contábeis'
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
    Left = 669
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'dpLancCont'
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 21167
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label1'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 150019
        mmTop = 21167
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 202407
        mmTop = 21167
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 235744
        mmTop = 21167
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label74'
        Caption = 'Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 266701
        mmTop = 21167
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Lançamentos Contábeis'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 41010
        BandType = 0
      end
      object ppLabel137: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object pplCarteiraContabil: TppLabel
        UserName = 'Carteira2'
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
        mmLeft = 268023
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object pplDataReferencia: TppLabel
        UserName = 'LData2'
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
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
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
    object ppDetailBand19: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PAPEL'
        DataPipeline = dpLancCont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dpLancCont'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 0
        mmWidth = 129911
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QTDEMOVINVCART'
        DataPipeline = dpLancCont
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dpLancCont'
        mmHeight = 3969
        mmLeft = 133086
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRJUROS'
        DataPipeline = dpLancCont
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dpLancCont'
        mmHeight = 3969
        mmLeft = 211138
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = dpLancCont
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dpLancCont'
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 0
        mmWidth = 42598
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VLRVARIACAO'
        DataPipeline = dpLancCont
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dpLancCont'
        mmHeight = 3969
        mmLeft = 245534
        mmTop = 0
        mmWidth = 34660
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel65: TppLabel
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
        mmWidth = 277284
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
        mmTop = 2646
        mmWidth = 277284
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
        mmLeft = 251619
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLNQUEBRA'
      DataPipeline = dpLancCont
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dpLancCont'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel75: TppLabel
          UserName = 'Label75'
          Caption = 'Tipo de Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 0
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'DESCOPER'
          DataPipeline = dpLancCont
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 0
          mmWidth = 81492
          BandType = 3
          GroupNo = 0
        end
      end
      object gfbRodaPePLNQUEBRA: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLNPLANIL'
      DataPipeline = dpLancCont
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dpLancCont'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object gfbRodaPePLNPLANIL: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'dpLancContItens'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 7144
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = dpLancContItens
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Lançamentos Contábeis'
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
            Left = 368
            Top = 264
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'dpLancContItens'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 794
              mmPrintPosition = 0
            end
            object ppDetailBand20: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object shpDetLancamento: TppShape
                OnPrint = shpDetLancamentoPrint
                UserName = 'shpDetLancamento'
                Brush.Color = clSilver
                Pen.Style = psClear
                mmHeight = 4498
                mmLeft = 17198
                mmTop = 0
                mmWidth = 245534
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'HISTORICO'
                DataPipeline = dpLancContItens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'dpLancContItens'
                mmHeight = 3969
                mmLeft = 39688
                mmTop = 0
                mmWidth = 144727
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText10'
                DataField = 'PLACONTA'
                DataPipeline = dpLancContItens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'dpLancContItens'
                mmHeight = 3969
                mmLeft = 186267
                mmTop = 0
                mmWidth = 23019
                BandType = 4
              end
              object ppDBTextValor: TppDBText
                UserName = 'DBTextValor'
                DataField = 'LACVALOR'
                DataPipeline = dpLancContItens
                DisplayFormat = '#,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'dpLancContItens'
                mmHeight = 3969
                mmLeft = 210609
                mmTop = 0
                mmWidth = 44715
                BandType = 4
              end
              object ppDBTextDC: TppDBText
                UserName = 'DBTextDC'
                DataField = 'LACDEBCRE'
                DataPipeline = dpLancContItens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'dpLancContItens'
                mmHeight = 3969
                mmLeft = 257705
                mmTop = 0
                mmWidth = 4498
                BandType = 4
              end
              object ppDBText11: TppDBText
                UserName = 'DBText9'
                DataField = 'PLNPLANIL'
                DataPipeline = dpLancContItens
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                SuppressRepeatedValues = True
                Transparent = True
                DataPipelineName = 'dpLancContItens'
                mmHeight = 3969
                mmLeft = 17727
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup1: TppGroup
              BreakName = 'PLNCODIGO'
              DataPipeline = dpLancContItens
              OutlineSettings.CreateNode = True
              UserName = 'Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'dpLancContItens'
              object ppGroupHeaderBand1: TppGroupHeaderBand
                AfterPrint = ppGroupHeaderBand1AfterPrint
                mmBottomOffset = 0
                mmHeight = 3969
                mmPrintPosition = 0
                object shpCabSubLancCont: TppShape
                  UserName = 'shpCabSubLancCont'
                  Brush.Color = clSilver
                  Pen.Style = psClear
                  mmHeight = 3969
                  mmLeft = 17198
                  mmTop = 0
                  mmWidth = 245535
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel76: TppLabel
                  UserName = 'Label70'
                  Caption = 'Planilha'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 17727
                  mmTop = 0
                  mmWidth = 11906
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel77: TppLabel
                  UserName = 'Label77'
                  Caption = 'Histórico'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 39952
                  mmTop = 0
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel78: TppLabel
                  UserName = 'Label78'
                  Caption = 'Conta Contábil'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 186532
                  mmTop = 0
                  mmWidth = 21696
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel79: TppLabel
                  UserName = 'Label79'
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 246592
                  mmTop = 0
                  mmWidth = 7938
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel80: TppLabel
                  UserName = 'Label80'
                  Caption = 'D/C'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 256911
                  mmTop = 0
                  mmWidth = 5027
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand1: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 9260
                mmPrintPosition = 0
                object ppShape4: TppShape
                  UserName = 'Shape4'
                  Brush.Color = clSilver
                  Pen.Style = psClear
                  mmHeight = 8731
                  mmLeft = 197909
                  mmTop = 265
                  mmWidth = 57944
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel81: TppLabel
                  UserName = 'Label81'
                  Caption = 'Crédito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 198173
                  mmTop = 265
                  mmWidth = 10848
                  BandType = 5
                  GroupNo = 0
                end
                object ppLabel82: TppLabel
                  UserName = 'Label82'
                  Caption = 'Débito'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 198173
                  mmTop = 4763
                  mmWidth = 9525
                  BandType = 5
                  GroupNo = 0
                end
                object ppDBCalc1: TppDBCalc
                  UserName = 'DBCalc1'
                  DataField = 'DEBITOS'
                  DataPipeline = dpLancContItens
                  DisplayFormat = '###,###,###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = []
                  ParentDataPipeline = False
                  ResetGroup = ppGroup1
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'dpLancContItens'
                  mmHeight = 3969
                  mmLeft = 211138
                  mmTop = 4763
                  mmWidth = 43656
                  BandType = 5
                  GroupNo = 0
                end
                object ppDBCalc2: TppDBCalc
                  UserName = 'DBCalc2'
                  DataField = 'CREDITOS'
                  DataPipeline = dpLancContItens
                  DisplayFormat = '###,###,###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 9
                  Font.Style = []
                  ParentDataPipeline = False
                  ResetGroup = ppGroup1
                  TextAlignment = taRightJustified
                  Transparent = True
                  DataPipelineName = 'dpLancContItens'
                  mmHeight = 3969
                  mmLeft = 210080
                  mmTop = 265
                  mmWidth = 44715
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object shpTotais: TppShape
          UserName = 'shpTotais'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 120915
          mmTop = 265
          mmWidth = 162984
          BandType = 5
          GroupNo = 1
        end
        object ppLabel84: TppLabel
          UserName = 'Label76'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 121973
          mmTop = 265
          mmWidth = 9260
          BandType = 5
          GroupNo = 1
        end
        object ppDBText19: TppDBText
          UserName = 'DBText18'
          DataField = 'TQUANT'
          DataPipeline = dpLancCont
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 265
          mmWidth = 33338
          BandType = 5
          GroupNo = 1
        end
        object ppDBText21: TppDBText
          UserName = 'DBText19'
          DataField = 'TVALOR'
          DataPipeline = dpLancCont
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3969
          mmLeft = 167746
          mmTop = 265
          mmWidth = 42069
          BandType = 5
          GroupNo = 1
        end
        object ppDBText22: TppDBText
          UserName = 'DBText21'
          DataField = 'TJUROS'
          DataPipeline = dpLancCont
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3969
          mmLeft = 211667
          mmTop = 529
          mmWidth = 32808
          BandType = 5
          GroupNo = 1
        end
        object ppDBText23: TppDBText
          UserName = 'DBText22'
          DataField = 'TVARIACAO'
          DataPipeline = dpLancCont
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3969
          mmLeft = 245798
          mmTop = 529
          mmWidth = 34396
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = dpLancCont
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dpLancCont'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object shpTitOper: TppShape
          UserName = 'shpTitOper'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText16: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTPOPERACAO'
          DataPipeline = dpLancCont
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dpLancCont'
          mmHeight = 3704
          mmLeft = 794
          mmTop = 0
          mmWidth = 81492
          BandType = 3
          GroupNo = 1
        end
      end
      object gfbRodaPeDESCTIPOOPERACAO: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsLancContItens: TwwDataSource
    AutoEdit = False
    DataSet = qryLancContItens
    Left = 669
    Top = 62
  end
  object dpLancContItens: TppBDEPipeline
    DataSource = dsLancContItens
    UserName = 'dpLancContItens'
    Left = 669
    Top = 62
  end
  object qryLancContItens: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT LC.PLNCODIGO,'
      '       LC.PLACONTA,'
      
        '       (LC.LACHIST1 || '#39' '#39' || LC.LACHIST2 || '#39' '#39' || LC.LACHIST3)' +
        ' AS HISTORICO,'
      '       LC.LACVALOR,'
      '       LC.LACDEBCRE,'
      '       DECODE(LC.LACDEBCRE,'#39'C'#39',LC.LACVALOR,0) AS CREDITOS,'
      '       DECODE(LC.LACDEBCRE,'#39'D'#39',LC.LACVALOR,0) AS DEBITOS,'
      '       TD.TDEBITOS, TC.TCREDITOS, PLN.PLNPLANIL'
      'FROM LANCAMENTO LC, PLANILHA PLN,'
      '     ( SELECT LC.PLNCODIGO, SUM(LC.LACVALOR) AS TDEBITOS'
      '       FROM LANCAMENTO LC, PLANILHA PL'
      '       WHERE PL.PLNDATDIA = TO_DATE(:DATAMOV,'#39'DD/MM/YYYY'#39') AND'
      '             PL.IDMODULO = 79 AND'
      '             LC.PLNCODIGO IN (SELECT DISTINCT PLNCODIGO'
      '                              FROM HISTCARTINV'
      
        '                              WHERE DATAMOVCARTINV = TO_DATE(:DA' +
        'TAMOV,'#39'DD/MM/YYYY'#39') AND'
      
        '                                    IDTIPOINVEST = :TIPOINVEST A' +
        'ND'
      
        '                                    IDCARTEIRAINVEST = :CARTEIRA' +
        ' AND'
      
        '                                    ( ( ( :OPERACAO NOT IN (-2,-' +
        '1) )      AND'
      
        '                                        ( IDTIPOOPERACAO = :OPER' +
        'ACAO ) AND'
      
        '                                        ( :OPERACAO IS NOT NULL ' +
        ')         AND'
      
        '                                        ( TIPMOVCARTINV = '#39'OPE'#39')' +
        ' )             OR'
      
        '                                      ( ( :OPERACAO IN (-2,-1) )' +
        '          AND'
      
        '                                        ( TIPMOVCARTINV = '#39'ATU'#39')' +
        ' )             OR'
      
        '                                      ( :OPERACAO IS NULL ) ) ) ' +
        '               AND'
      '             LC.LACDEBCRE = '#39'D'#39' AND'
      '             PL.PLNCODIGO = LC.PLNCODIGO'
      '       GROUP BY LC.PLNCODIGO) TD,'
      '     ( SELECT LC.PLNCODIGO, SUM(LC.LACVALOR) AS TCREDITOS'
      '       FROM LANCAMENTO LC, PLANILHA PL'
      '       WHERE PL.PLNDATDIA = TO_DATE(:DATAMOV,'#39'DD/MM/YYYY'#39') AND'
      '             PL.IDMODULO = 79 AND'
      '             LC.PLNCODIGO IN (SELECT DISTINCT PLNCODIGO'
      '                              FROM HISTCARTINV'
      
        '                              WHERE DATAMOVCARTINV = TO_DATE(:DA' +
        'TAMOV,'#39'DD/MM/YYYY'#39') AND'
      
        '                                    IDTIPOINVEST = :TIPOINVEST A' +
        'ND'
      
        '                                    IDCARTEIRAINVEST = :CARTEIRA' +
        ' AND'
      
        '                                    ( ( ( :OPERACAO NOT IN (-2,-' +
        '1) )      AND'
      
        '                                        ( IDTIPOOPERACAO = :OPER' +
        'ACAO ) AND'
      
        '                                        ( :OPERACAO IS NOT NULL ' +
        ')         AND'
      
        '                                        ( TIPMOVCARTINV = '#39'OPE'#39')' +
        ' )             OR'
      
        '                                      ( ( :OPERACAO IN (-2,-1) )' +
        '          AND'
      
        '                                        ( TIPMOVCARTINV = '#39'ATU'#39')' +
        ' )             OR'
      
        '                                      ( :OPERACAO IS NULL ) ) ) ' +
        '               AND'
      '             LC.LACDEBCRE = '#39'D'#39' AND'
      '             PL.PLNCODIGO = LC.PLNCODIGO'
      '       GROUP BY LC.PLNCODIGO) TC'
      ''
      'WHERE LC.PLNCODIGO IN (SELECT DISTINCT PLNCODIGO'
      '                       FROM HISTCARTINV'
      
        '                       WHERE DATAMOVCARTINV = TO_DATE(:DATAMOV,'#39 +
        'DD/MM/YYYY'#39') AND'
      '                             IDTIPOINVEST = :TIPOINVEST AND'
      '                             IDCARTEIRAINVEST = :CARTEIRA AND'
      
        '                             ( ( ( :OPERACAO NOT IN (-2,-1) )   ' +
        '   AND'
      
        '                                 ( IDTIPOOPERACAO = :OPERACAO ) ' +
        '   AND'
      
        '                                 ( :OPERACAO IS NOT NULL )      ' +
        '   AND'
      
        '                                 ( TIPMOVCARTINV = '#39'OPE'#39') )     ' +
        '        OR'
      
        '                               ( ( :OPERACAO IN (-2,-1) )       ' +
        '   AND'
      
        '                                 ( TIPMOVCARTINV = '#39'ATU'#39') )     ' +
        '        OR'
      
        '                               ( :OPERACAO IS NULL ) ) )        ' +
        '        AND'
      '      LC.PLNCODIGO = TC.PLNCODIGO(+) AND'
      '      LC.PLNCODIGO = TD.PLNCODIGO(+) AND'
      '      LC.PLNCODIGO = PLN.PLNCODIGO'
      ''
      'UNION'
      'SELECT 0    AS PLNCODIGO,'
      '       '#39'                  '#39' AS PLACONTA,'
      '       '#39'Lançamento Não Contabilizado '#39' AS HISTORICO,'
      '       0   AS LACVALOR,'
      '       '#39' '#39' AS LACDEBCRE,'
      '       0   AS CREDITOS,'
      '       0   AS DEBITOS,'
      '       0   AS TCREDITOS,'
      '       0   AS TDEBITOS,'
      '       0   AS PLNPLANIL'
      'FROM DUAL'
      'ORDER BY PLNCODIGO, HISTORICO, LACDEBCRE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 669
    Top = 62
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
        Value = '01/03/2002'
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
        Value = 2
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
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
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'TIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'CARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'OPERACAO'
        ParamType = ptResult
      end>
    object qryLancContItensPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCAMENTO.PLNCODIGO'
    end
    object qryLancContItensPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.LANCAMENTO.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryLancContItensHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST1'
      Size = 122
    end
    object qryLancContItensLACVALOR: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'BASEDADOS.LANCAMENTO.LACVALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContItensLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'BASEDADOS.LANCAMENTO.LACDEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryLancContItensCREDITOS: TFloatField
      FieldName = 'CREDITOS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContItensDEBITOS: TFloatField
      FieldName = 'DEBITOS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryLancContItensTDEBITOS: TFloatField
      FieldName = 'TDEBITOS'
    end
    object qryLancContItensTCREDITOS: TFloatField
      FieldName = 'TCREDITOS'
    end
    object qryLancContItensPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
  end
  object RptHitoricoCota: TppReport
    AutoStop = False
    DataPipeline = BdeHitoricoCota
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Evolução da Cota'
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
    Left = 669
    Top = 256
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeHitoricoCota'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'Consulta do Histórico de Cota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 51065
        BandType = 0
      end
      object ppLabel10: TppLabel
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
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppCarteira: TppLabel
        UserName = 'Carteira'
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
      object ppRepExeDireitoShape1: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197909
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
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
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 25400
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'Patrimônio Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 25400
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 60325
        mmTop = 25400
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Quantidade de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 120121
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'Label108'
        Caption = 'Quantidade Aplicada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 151342
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        Caption = 'Quantidade Resgatada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 176213
        mmTop = 20902
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'Índice IBOVESPA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 87048
        mmTop = 20902
        mmWidth = 14023
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
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
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 193146
        mmTop = 19844
        mmWidth = 4498
        BandType = 0
      end
      object ppLine56: TppLine
        UserName = 'Line56'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 0
        mmTop = 19844
        mmWidth = 4498
        BandType = 0
      end
      object ppLine58: TppLine
        UserName = 'Line58'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 12171
        mmTop = 19844
        mmWidth = 5556
        BandType = 0
      end
      object ppLine60: TppLine
        UserName = 'Line60'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 41010
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine61: TppLine
        UserName = 'Line601'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 73290
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine62: TppLine
        UserName = 'Line62'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 95779
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine63: TppLine
        UserName = 'Line63'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 129911
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12965
        mmLeft = 161132
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape6: TppShape
        OnPrint = ppShape5Print
        UserName = 'Shape6'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197909
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DATA'
        DataPipeline = BdeHitoricoCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 529
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'SALDO'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'COTA'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'QUANTIDADE'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'QTDEAPL'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 135732
        mmTop = 529
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'QTDERES'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'INDICEEQM'
        DataPipeline = BdeHitoricoCota
        DisplayFormat = '###,###,###,###0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCota'
        mmHeight = 3175
        mmLeft = 78846
        mmTop = 529
        mmWidth = 22225
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine55: TppLine
        UserName = 'Line55'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 193146
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 0
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object ppLine59: TppLine
        UserName = 'Line59'
        Position = lpRight
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 14552
        mmTop = 265
        mmWidth = 3175
        BandType = 4
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 43656
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine66: TppLine
        UserName = 'Line66'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 75936
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine67: TppLine
        UserName = 'Line67'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 98425
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 132557
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine69: TppLine
        UserName = 'Line69'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 163777
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel11: TppLabel
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
      object ppSystemVariable11: TppSystemVariable
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
      object ppSystemVariable12: TppSystemVariable
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
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 16933
        mmWidth = 32279
        BandType = 7
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 16933
        mmWidth = 39423
        BandType = 7
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 16933
        mmWidth = 60854
        BandType = 7
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        mmHeight = 10583
        mmLeft = 0
        mmTop = 265
        mmWidth = 197644
        BandType = 7
      end
      object ppShape33: TppShape
        UserName = 'Shape302'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 10848
        mmWidth = 39423
        BandType = 7
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 10848
        mmWidth = 32279
        BandType = 7
      end
      object lblTitPersInd: TppLabel
        UserName = 'lblTitPersInd'
        AutoSize = False
        Caption = '% sobre Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 12435
        mmWidth = 29104
        BandType = 7
      end
      object ppLabel260: TppLabel
        UserName = 'Label260'
        AutoSize = False
        Caption = 'Rentabilidade da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 12435
        mmWidth = 34925
        BandType = 7
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 0
        mmTop = 10848
        mmWidth = 89959
        BandType = 7
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        AutoSize = False
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 12435
        mmWidth = 20902
        BandType = 7
      end
      object lblIndicador: TppLabel
        UserName = 'lblIndicador'
        Caption = 'lblIndicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 17992
        mmWidth = 20108
        BandType = 7
      end
      object lblValorizacao: TppLabel
        UserName = 'lblValorizacao'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152929
        mmTop = 18521
        mmWidth = 11377
        BandType = 7
      end
      object lblPerIndicador: TppLabel
        UserName = 'lblPerIndicador'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 113506
        mmTop = 18521
        mmWidth = 11377
        BandType = 7
      end
      object lblPerSind: TppLabel
        UserName = 'lblPerSind'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184150
        mmTop = 18521
        mmWidth = 11377
        BandType = 7
      end
      object ppLine121: TppLine
        UserName = 'Line121'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197300
        BandType = 7
      end
      object ppLine122: TppLine
        UserName = 'Line122'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23018
        mmWidth = 197300
        BandType = 7
      end
      object ppLine125: TppLine
        UserName = 'Line125'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 0
        mmTop = 10848
        mmWidth = 5027
        BandType = 7
      end
      object ppLabel261: TppLabel
        UserName = 'Label261'
        Caption = 'VARIAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 85725
        mmTop = 2117
        mmWidth = 25400
        BandType = 7
      end
      object ppLine130: TppLine
        UserName = 'Line130'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 89694
        mmTop = 10848
        mmWidth = 36777
        BandType = 7
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 'Indicador + Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 101865
        mmTop = 12700
        mmWidth = 23019
        BandType = 7
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 89694
        mmTop = 17198
        mmWidth = 529
        BandType = 7
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 60590
        mmTop = 11113
        mmWidth = 2646
        BandType = 7
      end
      object ppLabel132: TppLabel
        UserName = 'Label132'
        Caption = 'EQM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 81492
        mmTop = 12965
        mmWidth = 6350
        BandType = 7
      end
      object lblEQM: TppLabel
        UserName = 'lblPerIndicador1'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 76465
        mmTop = 18521
        mmWidth = 11377
        BandType = 7
      end
    end
  end
  object BdeHitoricoCota: TppBDEPipeline
    DataSource = DsHitoricoCota
    UserName = 'lExemplo1'
    Left = 685
    Top = 308
    object BdeHitoricoCotappField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object BdeHitoricoCotappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 1
    end
    object BdeHitoricoCotappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTA'
      FieldName = 'COTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object BdeHitoricoCotappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDICEEQM'
      FieldName = 'INDICEEQM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 3
    end
    object BdeHitoricoCotappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 4
    end
    object BdeHitoricoCotappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEAPL'
      FieldName = 'QTDEAPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 5
    end
    object BdeHitoricoCotappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDERES'
      FieldName = 'QTDERES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 6
    end
    object BdeHitoricoCotappField8: TppField
      FieldAlias = 'CARTEIRA'
      FieldName = 'CARTEIRA'
      FieldLength = 79
      DisplayWidth = 30
      Position = 7
    end
  end
  object DsHitoricoCota: TwwDataSource
    DataSet = frmConsHistCota.Qry
    Left = 637
    Top = 308
  end
  object RptHitoricoCaixa: TppReport
    AutoStop = False
    DataPipeline = BdeHitoricoCaixa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico do Caixa'
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
    Left = 567
    Top = 255
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeHitoricoCaixa'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197909
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel117: TppLabel
        UserName = 'Label94'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 22490
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'Label97'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 19315
        mmTop = 22490
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'Label103'
        Caption = 'Bovespa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 61383
        mmTop = 22490
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'Label104'
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 88371
        mmTop = 22490
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'Label108'
        Caption = 'Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 22490
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label112'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 22490
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel116: TppLabel
        UserName = 'Label116'
        Caption = 'Consulta do Histórico de Caixa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 52388
        BandType = 0
      end
      object ppLabel124: TppLabel
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
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppCarteiraCxa: TppLabel
        UserName = 'Carteira4'
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
        mmLeft = 183092
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLDataCxa: TppLabel
        UserName = 'LData4'
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
        UserName = 'DBImage5'
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
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape51: TppShape
        OnPrint = ppShape51Print
        UserName = 'Shape51'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197909
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = BdeHitoricoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 529
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText301'
        DataField = 'SIGLAACAOBOLSA'
        DataPipeline = BdeHitoricoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 61119
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCCAIXACOTA'
        DataPipeline = BdeHitoricoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 88106
        mmTop = 529
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRHISTCAIXA'
        DataPipeline = BdeHitoricoCaixa
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 529
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText5'
        DataField = 'SLDHISTCAIXA'
        DataPipeline = BdeHitoricoCaixa
        DisplayFormat = '###,###,###,###0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 158750
        mmTop = 529
        mmWidth = 36513
        BandType = 4
      end
    end
    object ppFooterBand22: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine52: TppLine
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
      object ppSystemVariable13: TppSystemVariable
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
      object ppSystemVariable14: TppSystemVariable
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
    object ppGroup6: TppGroup
      BreakName = 'DATAHISTCAIXA'
      DataPipeline = BdeHitoricoCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeHitoricoCaixa'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText34: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAHISTCAIXA'
          DataPipeline = BdeHitoricoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'BdeHitoricoCaixa'
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 529
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLine71: TppLine
          UserName = 'Line71'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
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
  end
  object BdeHitoricoCaixa: TppBDEPipeline
    UserName = 'BdeHitoricoCaixa'
    Left = 567
    Top = 300
    object BdeHitoricoCaixappField1: TppField
      FieldAlias = 'DATAHISTCAIXA'
      FieldName = 'DATAHISTCAIXA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 0
    end
    object BdeHitoricoCaixappField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 31
      Position = 1
    end
    object BdeHitoricoCaixappField3: TppField
      FieldAlias = 'DESCCAIXACOTA'
      FieldName = 'DESCCAIXACOTA'
      FieldLength = 40
      DisplayWidth = 22
      Position = 2
    end
    object BdeHitoricoCaixappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRHISTCAIXA'
      FieldName = 'VLRHISTCAIXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 3
    end
    object BdeHitoricoCaixappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDHISTCAIXA'
      FieldName = 'SLDHISTCAIXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object BdeHitoricoCaixappField6: TppField
      FieldAlias = 'SIGLAACAOBOLSA'
      FieldName = 'SIGLAACAOBOLSA'
      FieldLength = 10
      DisplayWidth = 9
      Position = 5
    end
    object BdeHitoricoCaixappField7: TppField
      FieldAlias = 'DESCCARTGERENC'
      FieldName = 'DESCCARTGERENC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
  end
  object pprListaAcoes: TppReport
    AutoStop = False
    DataPipeline = pplListaAcoes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ações por Bolsa / Emissor'
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
    Left = 567
    Top = 384
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListaAcoes'
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Ações por Emissor / Bolsa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 44715
        BandType = 0
      end
      object ppLabel64: TppLabel
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
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraAcoesEmiBolsa: TppLabel
        UserName = 'Carteira3'
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
        mmLeft = 184680
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodoAcoesEmiBolsa: TppLabel
        UserName = 'LData3'
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
      object ppDBImage4: TppDBImage
        UserName = 'DBImage4'
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
    object ppDetailBand25: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpListaAcoesDetalhe: TppShape
        UserName = 'shpListaAcoesDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'BOLSA'
        DataPipeline = pplListaAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplListaAcoes'
        mmHeight = 3175
        mmLeft = 21960
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplListaAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaAcoes'
        mmHeight = 3175
        mmLeft = 58473
        mmTop = 265
        mmWidth = 37306
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'CODIGO'
        DataPipeline = pplListaAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaAcoes'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'LOTE'
        DataPipeline = pplListaAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplListaAcoes'
        mmHeight = 3175
        mmLeft = 162190
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'TIPO'
        DataPipeline = pplListaAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaAcoes'
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 265
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine54: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel125: TppLabel
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
      object ppSystemVariable15: TppSystemVariable
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
      object ppSystemVariable16: TppSystemVariable
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
    object ppGroup5: TppGroup
      BreakName = 'EMISSOR'
      DataPipeline = pplListaAcoes
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaAcoes'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object shpListaAcoesCabEmissor: TppShape
          UserName = 'shpListaAcoesCabEmissor'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText40: TppDBText
          UserName = 'DBText40'
          DataField = 'EMISSOR'
          DataPipeline = pplListaAcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplListaAcoes'
          mmHeight = 4233
          mmLeft = 21696
          mmTop = 265
          mmWidth = 102923
          BandType = 3
          GroupNo = 0
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'Emissor: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3175
          mmTop = 265
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object shpListaAcoesTitulo: TppShape
          UserName = 'shpListaAcoesDetalhe1'
          Brush.Color = clSilver
          mmHeight = 3704
          mmLeft = 21431
          mmTop = 5027
          mmWidth = 175948
          BandType = 3
          GroupNo = 0
        end
        object lblListaAcoesDetBolsa: TppLabel
          UserName = 'lblListaAcoesDetBolsa'
          AutoSize = False
          Caption = 'Bolsa de Valores: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 21960
          mmTop = 5292
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object lblListaAcoesTitInvestimento: TppLabel
          UserName = 'lblListaAcoesTitInvestimento'
          AutoSize = False
          Caption = 'Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 58473
          mmTop = 5292
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object lblListaAcoesTitCodBolsa: TppLabel
          UserName = 'lblListaAcoesTitCodBolsa'
          AutoSize = False
          Caption = 'Código na Bolsa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 125677
          mmTop = 5292
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object lblListaAcoesTitLote: TppLabel
          UserName = 'lblListaAcoesTitLote'
          AutoSize = False
          Caption = 'Lote Padrão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 159809
          mmTop = 5292
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object lblListaAcoesTitTipo: TppLabel
          UserName = 'lblListaAcoesTitTipo'
          AutoSize = False
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 101071
          mmTop = 5292
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
  object qryListaAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PE.NOME AS EMISSOR, BV.SGLBOLSAVALORES AS BOLSA, IV.DESCI' +
        'NVESTIMENTO,'
      
        '       AC.CODTIPOACAO AS TIPO, AB.SIGLAACAOBOLSA AS CODIGO, AB.Q' +
        'TDELOTE AS LOTE'
      ''
      
        'FROM PESSOA PE, INVESTIMENTO IV, EMISSOR EM, EMISSORXBOLSA EB, B' +
        'OLSAVALORES BV, ACOESXBOLSA AB,'
      '     ACAO AC'
      ''
      'WHERE'
      '      (1 = 2) '
      '  AND EM.IDEMISSOR = PE.IDPESSOA'
      '  AND EM.IDEMISSOR = IV.IDEMISSOR'
      '  AND EM.IDEMISSOR = EB.IDEMISSOR'
      '  AND EB.IDBOLSAVALORES = BV.IDBOLSAVALORES'
      '  AND IV.IDINVESTIMENTO = AC.IDACAO'
      '  AND AB.IDACAO = AC.IDACAO'
      '  AND EB.IDEMISSOR = AB.IDEMISSOR'
      '  AND EB.IDBOLSAVALORES = AB.IDBOLSAVALORES'
      ''
      'ORDER BY EMISSOR, BOLSA, DESCINVESTIMENTO, CODIGO'
      ' ')
    ValidateWithMask = True
    Left = 567
    Top = 437
    object qryListaAcoesEMISSOR: TStringField
      FieldName = 'EMISSOR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryListaAcoesBOLSA: TStringField
      FieldName = 'BOLSA'
      Origin = 'BASEDADOS.BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object qryListaAcoesDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryListaAcoesTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.ACAO.CODTIPOACAO'
      Size = 5
    end
    object qryListaAcoesCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'BASEDADOS.ACOESXBOLSA.SIGLAACAOBOLSA'
      Size = 10
    end
    object qryListaAcoesLOTE: TFloatField
      FieldName = 'LOTE'
      Origin = 'BASEDADOS.ACOESXBOLSA.QTDELOTE'
    end
  end
  object pplListaAcoes: TppBDEPipeline
    DataSource = dsListaAcoes
    UserName = 'pplListaAcoes'
    Left = 567
    Top = 437
  end
  object dsListaAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryListaAcoes
    Left = 567
    Top = 437
  end
  object RptGerCartSintetico: TppReport
    AutoStop = False
    DataPipeline = bdeGerCartSintetico
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
    Left = 237
    Top = 255
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeGerCartSintetico'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197300
        BandType = 0
      end
      object RptGerCartSinteticoLine1: TppLine
        UserName = 'RptGerCartSinteticoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object RptGerCartSinteticoLabel3: TppLabel
        UserName = 'RptGerCartSinteticoLabel3'
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 21696
        mmWidth = 7938
        BandType = 0
      end
      object RptGerCartSinteticoLabel4: TppLabel
        UserName = 'RptGerCartSinteticoLabel4'
        Caption = 'Empresas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 66675
        mmTop = 21696
        mmWidth = 14817
        BandType = 0
      end
      object RptGerCartSinteticoLabel5: TppLabel
        UserName = 'RptGerCartSinteticoLabel5'
        Caption = '% Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 21696
        mmWidth = 14817
        BandType = 0
      end
      object RptGerCartSinteticoLabel6: TppLabel
        UserName = 'RptGerCartSinteticoLabel6'
        Caption = 'Valor de Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115359
        mmTop = 21696
        mmWidth = 25665
        BandType = 0
      end
      object LblCustos: TppLabel
        UserName = 'LblCustos'
        Caption = 'Custo Carregamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 21696
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Composição Gerencial da Carteira de Ações (Sintético/Setor)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8996
        mmWidth = 103188
        BandType = 0
      end
      object ppLabel146: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label146'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraGerSintetico: TppLabel
        UserName = 'LCarteiraGerSintetico'
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
      object RptGerCartSinteticoLabel2: TppLabel
        UserName = 'RptGerCartSinteticoLabel2'
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
      object ppDBImage18: TppDBImage
        UserName = 'DBImage18'
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
    object ppDetailBand8: TppDetailBand
      BeforePrint = ppDetailBand8BeforePrint
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RptGerCartSinteticoDBText2: TppDBText
        UserName = 'RptGerCartSinteticoDBText2'
        DataField = 'DESCSETOREMISSOR'
        DataPipeline = bdeGerCartSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 62177
        BandType = 4
      end
      object RptGerCartSinteticoLabel9: TppLabel
        OnPrint = RptGerCartSinteticoLabel9Print
        UserName = 'RptGerCartSinteticoLabel9'
        Caption = 'RptGerCartSinteticoLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 1323
        mmWidth = 32544
        BandType = 4
      end
      object RptGerCartSinteticoDBText3: TppDBText
        UserName = 'RptGerCartSinteticoDBText3'
        DataField = 'EMPRESAS'
        DataPipeline = bdeGerCartSintetico
        DisplayFormat = '###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 64558
        mmTop = 1323
        mmWidth = 16933
        BandType = 4
      end
      object LblCarregamento: TppDBText
        UserName = 'LblCarregamento'
        DataField = 'SALDOCAR'
        DataPipeline = bdeGerCartSintetico
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 1323
        mmWidth = 25665
        BandType = 4
      end
      object RptGerCartSinteticoDBText4: TppDBText
        UserName = 'RptGerCartSinteticoDBText4'
        DataField = 'VALORMERCADO'
        DataPipeline = bdeGerCartSintetico
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 1323
        mmWidth = 28575
        BandType = 4
      end
      object LblAquisicao: TppDBText
        UserName = 'LblAquisicao'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeGerCartSintetico
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 1588
        mmWidth = 25665
        BandType = 4
      end
      object LblAtuarial: TppDBText
        UserName = 'LblAtuarial'
        DataField = 'SALDOATU'
        DataPipeline = bdeGerCartSintetico
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeGerCartSintetico'
        mmHeight = 3704
        mmLeft = 153194
        mmTop = 1323
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'ppLine15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel21: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel21'
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
        mmTop = 1323
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
        mmLeft = 0
        mmTop = 1323
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
        mmLeft = 170392
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptGerCartSinteticoGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeGerCartSintetico
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptGerCartSinteticoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeGerCartSintetico'
      object RptGerCartSinteticoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptGerCartSinteticoLabel8: TppLabel
          UserName = 'RptGerCartSinteticoLabel8'
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
        object RptGerCartSinteticoDBText1: TppDBText
          UserName = 'RptGerCartSinteticoDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeGerCartSintetico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3704
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptGerCartSinteticoLine2: TppLine
          UserName = 'RptGerCartSinteticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object RptGerCartSinteticoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object RptGerCartSinteticoLabel11: TppLabel
          UserName = 'RptGerCartSinteticoLabel11'
          Caption = 'TOTAIS NOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object TotSaldoCar: TppDBCalc
          UserName = 'TotSaldoCar'
          DataField = 'SALDOCAR'
          DataPipeline = bdeGerCartSintetico
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptGerCartSinteticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3704
          mmLeft = 152665
          mmTop = 1323
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object RptGerCartSinteticoDBCalc3: TppDBCalc
          UserName = 'RptGerCartSinteticoDBCalc3'
          DataField = 'VALORMERCADO'
          DataPipeline = bdeGerCartSintetico
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptGerCartSinteticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3704
          mmLeft = 112184
          mmTop = 1323
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object TotSaldoAqui: TppDBCalc
          UserName = 'TotSaldoAqui'
          DataField = 'SALDOAQUI'
          DataPipeline = bdeGerCartSintetico
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptGerCartSinteticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 1323
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object TotSaldoAtu: TppDBCalc
          UserName = 'TotSaldoAtu'
          DataField = 'SALDOATU'
          DataPipeline = bdeGerCartSintetico
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptGerCartSinteticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3704
          mmLeft = 152665
          mmTop = 1323
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object LblTotEmpr: TppLabel
          OnPrint = LblTotEmprPrint
          UserName = 'LblTotEmpr'
          AutoSize = False
          Caption = '00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 18785
          mmTop = 1323
          mmWidth = 4233
          BandType = 5
          GroupNo = 0
        end
        object RptGerCartSinteticoLine3: TppLine
          UserName = 'RptGerCartSinteticoLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'EMPRESAS'
          DataPipeline = bdeGerCartSintetico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptGerCartSinteticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeGerCartSintetico'
          mmHeight = 3175
          mmLeft = 64294
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'Label115'
          Caption = 'SETORES:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 24077
          mmTop = 1323
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object RptVarMesCarteira: TppReport
    AutoStop = False
    DataPipeline = bdeVarMesCarteira
    OnStartPage = RptVarMesCarteiraStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 35
    Top = 131
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeVarMesCarteira'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Mapa de Variação Mensal da Carteira de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25135
        mmTop = 9260
        mmWidth = 94721
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 32279
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel7'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 25400
        mmTop = 1852
        mmWidth = 28310
        BandType = 0
      end
      object RptVarMesCarteiraLabel1: TppLabel
        UserName = 'RptVarMesCarteiraLabel1'
        Caption = 'Data Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object RptVarMesCarteiraLabel2: TppLabel
        UserName = 'RptVarMesCarteiraLabel2'
        Caption = 'RptVarMesCarteiraLabel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 18521
        mmWidth = 31221
        BandType = 0
      end
      object RptVarMesCarteiraLine1: TppLine
        UserName = 'RptVarMesCarteiraLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284300
        BandType = 0
      end
      object RptVarMesCarteiraLabel3: TppLabel
        UserName = 'RptVarMesCarteiraLabel3'
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 18521
        mmWidth = 14288
        BandType = 0
      end
      object RptVarMesCarteiraLabel4: TppLabel
        UserName = 'RptVarMesCarteiraLabel4'
        Caption = 'RptVarMesCarteiraLabel4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 18521
        mmWidth = 31221
        BandType = 0
      end
      object RptVarMesCarteiraLabel7: TppLabel
        UserName = 'RptVarMesCarteiraLabel7'
        Caption = 'Papel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 24077
        mmWidth = 6615
        BandType = 0
      end
      object RptVarMesCarteiraLabel8: TppLabel
        UserName = 'RptVarMesCarteiraLabel8'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 74613
        mmTop = 24342
        mmWidth = 13494
        BandType = 0
      end
      object RptVarMesCarteiraLabel9: TppLabel
        UserName = 'RptVarMesCarteiraLabel9'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 97102
        mmTop = 24342
        mmWidth = 9790
        BandType = 0
      end
      object RptVarMesCarteiraLabel10: TppLabel
        UserName = 'RptVarMesCarteiraLabel10'
        Caption = 'Valor Mercado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 117475
        mmTop = 24342
        mmWidth = 16933
        BandType = 0
      end
      object RptVarMesCarteiraLabel11: TppLabel
        UserName = 'RptVarMesCarteiraLabel11'
        Caption = 'Custo de Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 136790
        mmTop = 24342
        mmWidth = 22754
        BandType = 0
      end
      object RptVarMesCarteiraLabel12: TppLabel
        UserName = 'RptVarMesCarteiraLabel12'
        Caption = 'Variação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 169863
        mmTop = 24342
        mmWidth = 15081
        BandType = 0
      end
      object RptVarMesCarteiraLabel13: TppLabel
        UserName = 'RptVarMesCarteiraLabel13'
        Caption = 'o mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 168011
        mmTop = 28046
        mmWidth = 17198
        BandType = 0
      end
      object RptVarMesCarteiraLabel14: TppLabel
        UserName = 'RptVarMesCarteiraLabel14'
        Caption = 'Variação até o Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 215107
        mmTop = 24342
        mmWidth = 21960
        BandType = 0
      end
      object RptVarMesCarteiraLabel15: TppLabel
        UserName = 'RptVarMesCarteiraLabel15'
        Caption = 'Variação no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 243153
        mmTop = 24342
        mmWidth = 19315
        BandType = 0
      end
      object RptVarMesCarteiraLabel16: TppLabel
        UserName = 'RptVarMesCarteiraLabel16'
        Caption = '% Part.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 264584
        mmTop = 24342
        mmWidth = 8202
        BandType = 0
      end
      object RptVarMesCarteiraLabel17: TppLabel
        UserName = 'RptVarMesCarteiraLabel17'
        Caption = '% Var.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 274638
        mmTop = 24342
        mmWidth = 7408
        BandType = 0
      end
      object RptVarMesCarteiraLabel18: TppLabel
        UserName = 'RptVarMesCarteiraLabel18'
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 49742
        mmTop = 24342
        mmWidth = 5292
        BandType = 0
      end
      object RptVarMesCarteiraLabel21: TppLabel
        UserName = 'RptVarMesCarteiraLabel21'
        Caption = 'Baixa de Variação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 190236
        mmTop = 24342
        mmWidth = 20902
        BandType = 0
      end
      object ppDBImage24: TppDBImage
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
    end
    object DetVarMesCarteira: TppDetailBand
      BeforePrint = DetVarMesCarteiraBeforePrint
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object shpMapaVarMensal: TppShape
        OnPrint = shpMapaVarMensalPrint
        UserName = 'shpMapaVarMensal'
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
      end
      object RptVarMesCarteiraDBText2: TppDBText
        UserName = 'RptVarMesCarteiraDBText2'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = bdeVarMesCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 529
        mmTop = 794
        mmWidth = 48419
        BandType = 4
      end
      object RptVarMesCarteiraDBText3: TppDBText
        UserName = 'RptVarMesCarteiraDBText3'
        DataField = 'IDLOTE'
        DataPipeline = bdeVarMesCarteira
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 49742
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object RptVarMesCarteiraDBText4: TppDBText
        UserName = 'RptVarMesCarteiraDBText4'
        DataField = 'SALDOQTDEINVCART'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 63236
        mmTop = 794
        mmWidth = 24605
        BandType = 4
      end
      object RptVarMesCarteiraDBText5: TppDBText
        UserName = 'RptVarMesCarteiraDBText5'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 109538
        mmTop = 794
        mmWidth = 24605
        BandType = 4
      end
      object RptVarMesCarteiraDBText6: TppDBText
        UserName = 'RptVarMesCarteiraDBText6'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 135467
        mmTop = 794
        mmWidth = 24605
        BandType = 4
      end
      object RptVarMesCarteiraDBText7: TppDBText
        UserName = 'RptVarMesCarteiraDBText7'
        DataField = 'COTACAO'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 88900
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object RptVarMesCarteiraDBText8: TppDBText
        UserName = 'RptVarMesCarteiraDBText8'
        DataField = 'VARATEMESANT'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 160867
        mmTop = 794
        mmWidth = 24605
        BandType = 4
      end
      object RptVarMesCarteiraDBText10: TppDBText
        UserName = 'RptVarMesCarteiraDBText10'
        DataField = 'VARATEMES'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 212461
        mmTop = 794
        mmWidth = 24606
        BandType = 4
      end
      object RptVarMesCarteiraDBText11: TppDBText
        UserName = 'RptVarMesCarteiraDBText11'
        DataField = 'VARMES'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 237861
        mmTop = 794
        mmWidth = 24606
        BandType = 4
      end
      object RptVarMesCarteiraDBText13: TppDBText
        UserName = 'RptVarMesCarteiraDBText13'
        DataField = 'VARIACAO'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 274373
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object RptVarMesCarteiraLabel20: TppLabel
        OnPrint = RptVarMesCarteiraLabel20Print
        UserName = 'RptVarMesCarteiraLabel20'
        AutoSize = False
        Caption = 'RptVarMesCarteiraLabel20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 262996
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object RptVarMesCarteiraDBText9: TppDBText
        UserName = 'RptVarMesCarteiraDBText9'
        DataField = 'BAIXA'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 186532
        mmTop = 794
        mmWidth = 24606
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel23: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel8'
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
        mmWidth = 282840
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
        mmLeft = 250032
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptVarMesCarteiraSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object RptVarMesCarteiraLabel19: TppLabel
        UserName = 'RptVarMesCarteiraLabel19'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 7144
        mmWidth = 13758
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc2: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc2'
        DataField = 'SALDOVLRINVCART'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 109538
        mmTop = 7144
        mmWidth = 24605
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc7: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc7'
        DataField = 'SALDOAQUI'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 7144
        mmWidth = 24605
        BandType = 7
      end
      object RptVarMesCarteiraLine4: TppLine
        UserName = 'RptVarMesCarteiraLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc8: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc8'
        DataField = 'VARATEMESANT'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 159809
        mmTop = 11377
        mmWidth = 24606
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc9: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc9'
        DataField = 'VARATEMES'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 212196
        mmTop = 7144
        mmWidth = 24605
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc10: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc10'
        DataField = 'VARMES'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 238125
        mmTop = 7144
        mmWidth = 24605
        BandType = 7
      end
      object RptVarMesCarteiraDBCalc12: TppDBCalc
        UserName = 'RptVarMesCarteiraDBCalc12'
        DataField = 'BAIXA'
        DataPipeline = bdeVarMesCarteira
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeVarMesCarteira'
        mmHeight = 2910
        mmLeft = 186532
        mmTop = 7144
        mmWidth = 24605
        BandType = 7
      end
      object RptVarMesCarteiralblVarMesAntTot: TppLabel
        UserName = 'RptVarMesCarteiralblVarMesAntTot'
        Caption = 'VariacaoMesAntTot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 161132
        mmTop = 6879
        mmWidth = 21696
        BandType = 7
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 5821
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel95: TppLabel
        UserName = 'Label1'
        Caption = 'Ações Vendidas no Mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 38100
        BandType = 7
      end
      object RptVarMesCarteiralblDifMesAnt: TppLabel
        UserName = 'RptVarMesCarteiraLabel101'
        Caption = 'VariacaoMesAnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 159809
        mmTop = 1588
        mmWidth = 24605
        BandType = 7
      end
    end
    object RptVarMesCarteiraGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = bdeVarMesCarteira
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'RptVarMesCarteiraGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeVarMesCarteira'
      object RptVarMesCarteiraGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object RptVarMesCarteiraLabel5: TppLabel
          UserName = 'RptVarMesCarteiraLabel5'
          Caption = 'Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 1058
          mmTop = 794
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object RptVarMesCarteiraDBText1: TppDBText
          UserName = 'RptVarMesCarteiraDBText1'
          DataField = 'DESCCARTINVEST'
          DataPipeline = bdeVarMesCarteira
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 14817
          mmTop = 794
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object RptVarMesCarteiraLine2: TppLine
          UserName = 'RptVarMesCarteiraLine2'
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
      object RptVarMesCarteiraGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object RptVarMesCarteiraLabel6: TppLabel
          UserName = 'RptVarMesCarteiraLabel6'
          Caption = 'Total da Carteira:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc1: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc1'
          DataField = 'SALDOVLRINVCART'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 109538
          mmTop = 2646
          mmWidth = 24605
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc3: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc3'
          DataField = 'SALDOAQUI'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 135202
          mmTop = 2646
          mmWidth = 24605
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraLine3: TppLine
          UserName = 'RptVarMesCarteiraLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc4: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc4'
          DataField = 'VARATEMESANT'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 161132
          mmTop = 2646
          mmWidth = 24605
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc5: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc5'
          DataField = 'VARATEMES'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 212461
          mmTop = 2646
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc6: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc6'
          DataField = 'VARMES'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 237861
          mmTop = 2646
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object RptVarMesCarteiraDBCalc11: TppDBCalc
          UserName = 'RptVarMesCarteiraDBCalc11'
          DataField = 'BAIXA'
          DataPipeline = bdeVarMesCarteira
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = RptVarMesCarteiraGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bdeVarMesCarteira'
          mmHeight = 2910
          mmLeft = 186532
          mmTop = 2646
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object DsHitoricoCaixa: TwwDataSource
    Left = 567
    Top = 324
  end
end
