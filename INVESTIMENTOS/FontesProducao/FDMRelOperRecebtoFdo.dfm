inherited DMRelOperRecebtoFdo: TDMRelOperRecebtoFdo
  Left = 224
  Top = 136
  Caption = 'DMRelOperRecebtoFdo'
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
  object ppOperRecebtoFdo: TppBDEPipeline
    DataSource = dsOperRecebtoFdo
    UserName = 'lExemplo1'
    Left = 37
    Top = 83
  end
  object rptOperRecebtoFdo: TppReport
    AutoStop = False
    DataPipeline = ppOperRecebtoFdo
    OnStartPage = rptOperRecebtoFdoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Operações de Recebimentos'
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
    Left = 162
    Top = 83
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppOperRecebtoFdo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        mmHeight = 5292
        mmLeft = 0
        mmTop = 20373
        mmWidth = 284163
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Operações de Recebimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 48154
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
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
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 15346
        mmWidth = 1852
        BandType = 0
      end
      object lblData: TppLabel
        UserName = 'lblDtaOper'
        Caption = 'Dt. Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 21430
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'lblVlrLiq'
        Caption = 'Valor Líquido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 21431
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lblDtaLiq'
        Caption = 'Dt. Liquidação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 21430
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblVlrBruto'
        Caption = 'Valor Bruto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120386
        mmTop = 21431
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblVlrIR'
        Caption = 'I.R.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 21431
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lblVlrIOF'
        Caption = 'I.O.F.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167482
        mmTop = 21431
        mmWidth = 7144
        BandType = 0
      end
      object lblDtaIni: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object lblDtaFin: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 66675
        mmTop = 15346
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'lblPlanoPatro'
        Caption = 'Plano / Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 187325
        mmTop = 15346
        mmWidth = 29104
        BandType = 0
      end
      object ppdbPlanoPatro: TppDBText
        UserName = 'dbPlanoPatro'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = ppOperRecebtoFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3440
        mmLeft = 219340
        mmTop = 15346
        mmWidth = 64294
        BandType = 0
      end
      object lblTipoOper: TppLabel
        UserName = 'lblFundoInvest1'
        Caption = 'Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 21430
        mmWidth = 12965
        BandType = 0
      end
      object lblQuantidade: TppLabel
        UserName = 'lblQuantidade'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 219869
        mmTop = 21431
        mmWidth = 14552
        BandType = 0
      end
      object lblPU: TppLabel
        UserName = 'lblPU'
        Caption = 'PU'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 21431
        mmWidth = 3969
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpTitData2'
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 283898
        BandType = 4
      end
      object ppdbDtaIni: TppDBText
        UserName = 'dbDtaIni'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppOperRecebtoFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 66411
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppdbDtaLiq: TppDBText
        UserName = 'dbDtaLiq'
        DataField = 'DATALIQUIDACAO'
        DataPipeline = ppOperRecebtoFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 85990
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppdbVlrBruto: TppDBText
        UserName = 'dbVlrBruto'
        DataField = 'VLROPERACAO'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 104511
        mmTop = 794
        mmWidth = 30163
        BandType = 4
      end
      object ppdbVlrIR: TppDBText
        UserName = 'dbVlrIR'
        DataField = 'VLRIR'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 135202
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppdbVlrIOF: TppDBText
        UserName = 'dbVlrIOF'
        DataField = 'VLRIOF'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 794
        mmWidth = 16933
        BandType = 4
      end
      object ppdbTipoOper: TppDBText
        UserName = 'dbDescFundo1'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppOperRecebtoFdo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 794
        mmWidth = 62706
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbVlrLiq1'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 202142
        mmTop = 794
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbVlrLiq2'
        DataField = 'VLRCOTA'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 794
        mmWidth = 29104
        BandType = 4
      end
      object ppdbVlrLiq: TppDBText
        UserName = 'dbVlrLiq'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppOperRecebtoFdo
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppOperRecebtoFdo'
        mmHeight = 3175
        mmLeft = 175684
        mmTop = 794
        mmWidth = 26194
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel5: TppLabel
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
    object ppGroup2: TppGroup
      BreakName = 'IDPLANPREVCTBPATR'
      DataPipeline = ppOperRecebtoFdo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppOperRecebtoFdo'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDFUNDOINVEST'
      DataPipeline = ppOperRecebtoFdo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppOperRecebtoFdo'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'lblFundoInvest'
          Caption = 'Fundo de Investimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3969
          mmTop = 1058
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
        end
        object ppdbDescFundo: TppDBText
          UserName = 'dbDescFundo'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = ppOperRecebtoFdo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppOperRecebtoFdo'
          mmHeight = 3440
          mmLeft = 42598
          mmTop = 1058
          mmWidth = 115623
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDTIPOOPERACAO'
      DataPipeline = ppOperRecebtoFdo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppOperRecebtoFdo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1588
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryOperRecebtoFdo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OP.IDOPERACAOFUNDO, OP.IDCARTEIRAINVEST,  OP.IDPEDIDOFUNDO, OP' +
        '.IDTIPOINVEST,'
      
        '  OP.IDTIPOOPERACAO,  OP.IDFUNDOINVEST,     OP.DATAOPERACAO,  OP' +
        '.DATALIQUIDACAO,'
      '  OP.QTDOPERACAO,     OP.QTDUSUFRUTO,'
      
        '  OP.STACONFIRMA,     OP.IDOPERACAOORIGEM,  OP.IDPLANPREVCTBPATR' +
        ',OP.DATACOTIZACAO,'
      '  NVL(OP.VLROPERACAO,0) AS VLROPERACAO,'
      '  NVL(OP.VLRCOTA,0) AS VLRCOTA,'
      '  NVL(OP.VLRIR,0) AS VLRIR,'
      '  NVL(OP.VLRIOF,0) AS VLRIOF,'
      '  NVL(OP.VLRRENDIMENTO,0) AS VLRRENDIMENTO,'
      '  NVL(OP.VLROPERACAO,0) AS VLRLIQUIDO,'
      '  NVL(OP.VLRDESCONTO,0) AS VLRDESCONTO,'
      '  TP.DESCTIPOOPERACAO,'
      '  FD.DESCFUNDOINVEST, PL.PLANPRVCONTABPATRO'
      'FROM'
      '   OPERACAOFUNDO OP, TIPOOPERACAO TP, FUNDOINVEST FD,'
      ''
      '   (SELECT'
      
        '       PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      '    FROM'
      '       PESSOA PE,'
      '       PLANPREVCONTABPATRO PA,'
      '       PLANPREVCONTABIL PL'
      '    WHERE'
      '       (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '       (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL'
      'WHERE'
      
        '   ((:DTOPERINI IS NULL) OR (OP.DATAOPERACAO BETWEEN TO_DATE(:DT' +
        'OPERINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                     TO_DATE(:DT' +
        'OPERFIN,'#39'DD/MM/YYYY'#39'))) AND'
      
        '   ((:IDFUNDOINVEST IS NULL) OR (OP.IDFUNDOINVEST = :IDFUNDOINVE' +
        'ST)) AND'
      
        '   ((:IDTIPOOPERACAO IS NULL) OR (OP.IDTIPOOPERACAO = :IDTIPOOPE' +
        'RACAO)) AND'
      
        '   ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR)) AND'
      '   (TP.NATUREZAOPERACAO = '#39'R'#39') AND'
      '   (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDFUNDOINVEST = FD.IDFUNDOINVEST) AND'
      '   (OP.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      'ORDER BY OP.IDPLANPREVCTBPATR ,OP.DATAOPERACAO DESC')
    UpdateObject = updOperRecebtoFdo
    ValidateWithMask = True
    Left = 37
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'DTOPERINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTOPERINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DTOPERFIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
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
      end>
    object qryOperRecebtoFdoIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object qryOperRecebtoFdoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryOperRecebtoFdoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
    end
    object qryOperRecebtoFdoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryOperRecebtoFdoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryOperRecebtoFdoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryOperRecebtoFdoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryOperRecebtoFdoDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
    end
    object qryOperRecebtoFdoQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryOperRecebtoFdoQTDUSUFRUTO: TFloatField
      FieldName = 'QTDUSUFRUTO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryOperRecebtoFdoSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      FixedChar = True
      Size = 1
    end
    object qryOperRecebtoFdoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryOperRecebtoFdoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryOperRecebtoFdoDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
    end
    object qryOperRecebtoFdoVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRIR: TFloatField
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoVLRDESCONTO: TFloatField
      FieldName = 'VLRDESCONTO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryOperRecebtoFdoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperRecebtoFdoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryOperRecebtoFdoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object dsOperRecebtoFdo: TwwDataSource
    AutoEdit = False
    DataSet = qryOperRecebtoFdo
    Left = 165
    Top = 144
  end
  object updOperRecebtoFdo: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDOPERACAOFUNDO = :IDOPERACAOFUNDO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRDESCONTO = :VLRDESCONTO,'
      '  QTDUSUFRUTO = :QTDUSUFRUTO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO, IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVES' +
        'T, '
      'IDTIPOOPERACAO, '
      '   IDFUNDOINVEST, DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, '
      'VLROPERACAO, '
      '   VLRCOTA, VLRIR, VLRIOF, VLRRENDIMENTO, STACONFIRMA, '
      'IDOPERACAOORIGEM, '
      '   IDPLANPREVCTBPATR, DATACOTIZACAO, VLRDESCONTO, QTDUSUFRUTO)'
      'values'
      '  (:IDOPERACAOFUNDO, :IDCARTEIRAINVEST, :IDPEDIDOFUNDO, '
      ':IDTIPOINVEST, '
      
        '   :IDTIPOOPERACAO, :IDFUNDOINVEST, :DATAOPERACAO, :DATALIQUIDAC' +
        'AO, '
      ':QTDOPERACAO, '
      '   :VLROPERACAO, :VLRCOTA, :VLRIR, :VLRIOF, :VLRRENDIMENTO, '
      ':STACONFIRMA, '
      '   :IDOPERACAOORIGEM, :IDPLANPREVCTBPATR, :DATACOTIZACAO, '
      ':VLRDESCONTO, :QTDUSUFRUTO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 161
    Top = 192
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM VWPLANPREVCTBPATR')
    ValidateWithMask = True
    Left = 34
    Top = 192
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanPrevCtbPatrPLANOCONTABIL: TStringField
      FieldName = 'PLANOCONTABIL'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PLANOCONTABIL'
      Size = 50
    end
    object qryPlanPrevCtbPatrPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PATROCINADORA'
      Size = 60
    end
    object qryPlanPrevCtbPatrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPLANOPREV'
    end
    object qryPlanPrevCtbPatrIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPATRO'
    end
  end
end
