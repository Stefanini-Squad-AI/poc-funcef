inherited dtmRelDivergContrib: TdtmRelDivergContrib
  Left = 245
  Top = 245
  Width = 271
  Height = 232
  Caption = 'dtmRelDivergContrib'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 29
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
    Left = 29
    Top = 104
  end
  inherited qryExemplo: TwwQuery
    Left = 29
    Top = 152
  end
  inherited rpExemplo: TppReport
    Left = 29
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryRelDivergContrib: TwwQuery
    BeforeOpen = qryRelDivergContribBeforeOpen
    AfterOpen = qryRelDivergContribAfterOpen
    AfterClose = qryRelDivergContribAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.MATRICULA,'
      '  PP.INSCRICAONUMERO,'
      '  P.NOME,'
      '  C.NOME AS CONTRIBUICAO,'
      '  H1.VALORESPERADO AS VALOR_MES_ATUAL,'
      '  H2.VALORESPERADO AS VALOR_MES_ANTERIOR,'
      '  H1.VALORESPERADO-H2.VALORESPERADO AS DIFERENCA'
      ''
      'FROM'
      '  HSTCONTRIBPREV H1,'
      '  HSTCONTRIBPREV H2,'
      '  ELEGPATRO E,'
      '  CONTRIBUICAO C,'
      '  PARTPREVPLAN PP,'
      '  PESSOA P'
      ''
      'WHERE'
      '  H1.IDPESSOA       = H2.IDPESSOA             AND'
      '  H1.IDCONTRIBUICAO = H2.IDCONTRIBUICAO       AND'
      '  H1.IDPESSJUR      = H1.IDPESSJUR            AND'
      '  H1.IDPLANOPREV    = H1.IDPLANOPREV          AND'
      '  H1.IDLOTE         = 2262                    AND'
      
        '  (((:PMESREF    IS NOT NULL) AND (H1.MESREFERENCIA = :PMESREF))' +
        '    OR (:PMESREF    IS NULL)) AND'
      
        '  (((:PMESCOB    IS NOT NULL) AND (H2.MESCOBRANCA   = :PMESCOB))' +
        '    OR (:PMESCOB    IS NULL)) AND'
      
        '  (((:PMESREFANT IS NOT NULL) AND (H2.MESREFERENCIA = :PMESREFAN' +
        'T)) OR (:PMESREFANT IS NULL)) AND'
      '  H1.VALORESPERADO  - H2.VALORESPERADO > 0.01 AND'
      '  PP.IDPESSOA       = H1.IDPESSOA             AND'
      '  PP.IDPLANOPREV    = H1.IDPLANOPREV          AND'
      '  PP.IDPESSJUR      = H1.IDPESSJUR            AND'
      '  P.IDPESSOA        = H1.IDPESSOA             AND'
      '  E.IDPESSOA        = H1.IDPESSOA             AND'
      '  E.IDPESSJUR       = H1.IDPESSJUR            AND'
      '  C.IDCONTRIBUICAO  = H1.IDCONTRIBUICAO'
      ''
      'ORDER BY E.MATRICULA')
    ValidateWithMask = True
    Left = 113
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREFANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREFANT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREFANT'
        ParamType = ptUnknown
      end>
  end
  object dsRelDivergContrib: TwwDataSource
    DataSet = qryRelDivergContrib
    Left = 112
    Top = 104
  end
  object ppRelDivergContrib: TppBDEPipeline
    DataSource = dsRelDivergContrib
    UserName = 'RelDivergContrib'
    Left = 112
    Top = 56
  end
  object rpRelDivergContrib: TppReport
    AutoStop = False
    DataPipeline = ppRelDivergContrib
    OnStartPage = rpRelDivergContribStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    BeforePrint = rpRelDivergContribBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppRelDivergContrib'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42598
      mmPrintPosition = 0
      object ppDBImage7: TppDBImage
        UserName = 'ppDBImage7'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1058
        mmTop = 794
        mmWidth = 34396
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText7: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText7'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 36513
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText10: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText10'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 36513
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText9: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText9'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 36513
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText8: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText8'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText1: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 36513
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object lblTituloRel: TppLabel
        UserName = 'lblTituloRel'
        AutoSize = False
        Caption = 'Relatório de Divergência de Contribuição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 31750
        mmWidth = 197644
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object shpCor: TppShape
        OnPrint = shpCorPrint
        UserName = 'shpCor'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object dbMatric: TppDBText
        UserName = 'dbMatric'
        DataField = 'MATRICULA'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object dbInscricao: TppDBText
        UserName = 'dbInscricao'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object dbNome: TppDBText
        UserName = 'dbNome'
        DataField = 'NOME'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 265
        mmWidth = 85461
        BandType = 4
      end
      object dbMesAtual: TppDBText
        UserName = 'dbMesAtual'
        DataField = 'VALOR_MES_ATUAL'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 131234
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object dbMesAnt: TppDBText
        UserName = 'dbMesAnt'
        DataField = 'VALOR_MES_ANTERIOR'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 152665
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object dbDif: TppDBText
        UserName = 'dbDif'
        DataField = 'DIFERENCA'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 3969
        mmLeft = 176477
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object rpRelaEntSaiFolhaCalc2: TppSystemVariable
        UserName = 'rpRelaEntSaiFolhaCalc2'
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
      object rpRelaEntSaiFolhaLine2: TppLine
        UserName = 'rpRelaEntSaiFolhaLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89165
        mmTop = 1588
        mmWidth = 18785
        BandType = 8
      end
      object ppLabel175: TppLabel
        UserName = 'ppLabel175'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object lblValoresTotais: TppLabel
        UserName = 'lblValoresTotais'
        AutoSize = False
        Caption = 'Total do Valores:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 98161
        mmTop = 529
        mmWidth = 29633
        BandType = 7
      end
      object dbCalcTotMesAtual: TppDBCalc
        UserName = 'dbCalcTotMesAtual'
        DataField = 'VALOR_MES_ATUAL'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 4233
        mmLeft = 131234
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
      object dbCalcTotMesAnt: TppDBCalc
        UserName = 'dbCalcTotMesAnt'
        DataField = 'VALOR_MES_ANTERIOR'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 4233
        mmLeft = 152665
        mmTop = 529
        mmWidth = 19579
        BandType = 7
      end
      object dbCalcTotDif: TppDBCalc
        UserName = 'dbCalcTotDif'
        DataField = 'DIFERENCA'
        DataPipeline = ppRelDivergContrib
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRelDivergContrib'
        mmHeight = 4233
        mmLeft = 176477
        mmTop = 529
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CONTRIBUICAO'
      DataPipeline = ppRelDivergContrib
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelDivergContrib'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 30163
        mmPrintPosition = 0
        object lblVlrMesAnt: TppLabel
          UserName = 'lblVlrMesAnt'
          Caption = 'Mês Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 25400
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object lblValor2: TppLabel
          UserName = 'lblValor2'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 21167
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 29633
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object lblMatricula: TppLabel
          UserName = 'lblMatricula'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 25400
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object lblInscricao: TppLabel
          UserName = 'lblInscricao'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 23019
          mmTop = 25400
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object lblNome: TppLabel
          UserName = 'lblNome'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 42333
          mmTop = 25400
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object lblValor1: TppLabel
          UserName = 'lblValor1'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 131234
          mmTop = 21167
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object lblMesAtual: TppLabel
          UserName = 'lblMesAtual'
          Caption = 'Mês Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 131234
          mmTop = 25400
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object lblDif: TppLabel
          UserName = 'lblDif'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 176477
          mmTop = 25400
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object lblContrib: TppLabel
          UserName = 'lblContrib'
          AutoSize = False
          Caption = 'Contribuição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 8731
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object lblLoteRef: TppLabel
          UserName = 'lblLoteRef'
          AutoSize = False
          Caption = 'Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 3440
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object lblMostraLoteRef: TppLabel
          UserName = 'lblMostraLoteRef'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 28310
          mmTop = 3440
          mmWidth = 135467
          BandType = 3
          GroupNo = 0
        end
        object dbContrib: TppDBText
          UserName = 'dbContrib'
          DataField = 'CONTRIBUICAO'
          DataPipeline = ppRelDivergContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelDivergContrib'
          mmHeight = 3969
          mmLeft = 28310
          mmTop = 8731
          mmWidth = 135467
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 15610
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1852
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object lblQuant: TppLabel
          UserName = 'lblQuant'
          AutoSize = False
          Caption = 'Quantidade por Contribuição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3175
          mmTop = 1058
          mmWidth = 50271
          BandType = 5
          GroupNo = 0
        end
        object dbQuant: TppDBCalc
          UserName = 'dbQuant'
          DataField = 'INSCRICAONUMERO'
          DataPipeline = ppRelDivergContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppRelDivergContrib'
          mmHeight = 4233
          mmLeft = 55827
          mmTop = 1058
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object lblVlrMesAtual: TppLabel
          UserName = 'lblVlrMesAtual'
          AutoSize = False
          Caption = 'Total por Contribuição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 88371
          mmTop = 1058
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object dbCalcTotContribMesAtual: TppDBCalc
          UserName = 'dbCalcTotContribMesAtual'
          DataField = 'VALOR_MES_ATUAL'
          DataPipeline = ppRelDivergContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppRelDivergContrib'
          mmHeight = 4233
          mmLeft = 131234
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbCalcTotContribMesAnt: TppDBCalc
          UserName = 'dbCalcTotContribMesAnt'
          DataField = 'VALOR_MES_ANTERIOR'
          DataPipeline = ppRelDivergContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppRelDivergContrib'
          mmHeight = 4233
          mmLeft = 152665
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbCalcTotContribDif: TppDBCalc
          UserName = 'dbCalcTotContribDif'
          DataField = 'DIFERENCA'
          DataPipeline = ppRelDivergContrib
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'ppRelDivergContrib'
          mmHeight = 4233
          mmLeft = 176477
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 203
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 203
    Top = 104
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 203
    Top = 56
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
end
