inherited DmRelHistCaixa: TDmRelHistCaixa
  Left = 456
  Top = 169
  Caption = ''
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
  object RptHistoricoCaixa: TppReport
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
    Left = 219
    Top = 87
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeHitoricoCaixa'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'ppRepExeDireitoShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 21696
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
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 22490
        mmWidth = 6085
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
        mmHeight = 3440
        mmLeft = 187590
        mmTop = 22490
        mmWidth = 7673
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
        mmWidth = 51858
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
        mmWidth = 11113
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
      object pdbCartGerenc: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCCARTGERENC'
        DataPipeline = BdeHitoricoCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 3175
        mmLeft = 128059
        mmTop = 14023
        mmWidth = 67204
        BandType = 0
      end
      object pdbPlano: TppDBText
        UserName = 'DBText7'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BdeHitoricoCaixa
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BdeHitoricoCaixa'
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 8996
        mmWidth = 67204
        BandType = 0
      end
    end
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppsHistCaixa: TppShape
        OnPrint = ppsHistCaixaPrint
        UserName = 'sHistCaixa'
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
        mmLeft = 159544
        mmTop = 529
        mmWidth = 35719
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
    object ppGroup1: TppGroup
      BreakName = 'IDPLANPREVCTBPATR'
      DataPipeline = BdeHitoricoCaixa
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeHitoricoCaixa'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDCARTEIRAGERENC'
      DataPipeline = BdeHitoricoCaixa
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeHitoricoCaixa'
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
      BreakName = 'DATAHISTCAIXA'
      DataPipeline = BdeHitoricoCaixa
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeHitoricoCaixa'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAHISTCAIXA'
          DataPipeline = BdeHitoricoCaixa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BdeHitoricoCaixa'
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 794
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
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
    DataSource = DsHitoricoCaixa
    UserName = 'BdeHitoricoCaixa'
    Left = 155
    Top = 87
  end
  object DsHitoricoCaixa: TwwDataSource
    DataSet = QryHistCaixa
    Left = 91
    Top = 87
  end
  object QryHistCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HC.IDHISTCAIXA, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAGERENC, HC' +
        '.DATAHISTCAIXA, HC.DESCCARTGERENC,'
      
        '   HC.DESCINVESTIMENTO, HC.SIGLAACAOBOLSA, HC.DESCCAIXACOTA, HC.' +
        'VLRHISTCAIXA, HC.SLDHISTCAIXA,'
      '   PL.PLANPRVCONTABPATRO'
      'FROM'
      '('
      '   SELECT'
      
        '       HC.IDHISTCAIXA, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAGERENC' +
        ', HC.DATAHISTCAIXA, CG.DESCCARTGERENC,'
      
        '       DECODE(HC.DESCINVESTIMENTO, NULL, IV.DESCINVESTIMENTO, HC' +
        '.DESCINVESTIMENTO) AS DESCINVESTIMENTO,'
      
        '       AB.SIGLAACAOBOLSA, EC.DESCCAIXACOTA, HC.VLRHISTCAIXA, HC.' +
        'SLDHISTCAIXA'
      '   FROM'
      
        '      HISTCAIXA HC, OPERACAOINVEST OI, INVESTIMENTO IV, CARTEIRA' +
        'XEVENTO CE, EVENTOCAIXACOTA EC, ACOESXBOLSA AB,'
      '      CARTEIRAGERENC CG'
      '   WHERE'
      
        '        ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      '   AND (HC.IDCARTEIRAINVEST     >  0)'
      
        '   AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRAGERENC  =' +
        ' :IDCARTEIRAGERENC))'
      
        '   AND (HC.DATAHISTCAIXA BETWEEN TO_DATE(:DATAINICIO,'#39'DD/MM/YYYY' +
        #39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '   AND (OI.IDOPERACAOINVEST(+)   = HC.IDOPERACAOINVEST)'
      '   AND (IV.IDINVESTIMENTO(+)     = OI.IDINVESTIMENTO)'
      '   AND (AB.IDACAO(+)             = IV.IDINVESTIMENTO)'
      '   AND (CE.IDCARTEIRAXEVENTO     = HC.IDCARTEIRAXEVENTO)'
      '   AND (EC.IDEVENTOCAIXACOTA    <> -6)'
      '   AND (EC.IDEVENTOCAIXACOTA     = CE.IDEVENTOCAIXACOTA)'
      '   AND (CG.IDCARTEIRAGERENC      = HC.IDCARTEIRAGERENC)'
      '   AND (CG.IDCARTEIRAINVEST      = HC.IDCARTEIRAINVEST)'
      ''
      '   UNION'
      ''
      '   SELECT'
      
        '      HC.IDHISTCAIXA, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAGERENC,' +
        ' HC.DATAHISTCAIXA, CG.DESCCARTGERENC,'
      
        '      '#39' '#39' AS DESCINVESTIMENTO, '#39' '#39' AS SIGLAACAOBOLSA, EC.DESCCAI' +
        'XACOTA, HC.VLRHISTCAIXA, HC.SLDHISTCAIXA'
      '   FROM'
      
        '      HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC, CART' +
        'EIRAGERENC CG'
      '   WHERE'
      '      HC.IDHISTCAIXA IN'
      '           (SELECT MAX(IDHISTCAIXA) AS IDHISTCAIXA'
      
        '            FROM   HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXA' +
        'COTA EC'
      '            WHERE'
      
        '                 ((:IDPLANPREVCTBPATR IS NULL) OR (HC.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '            AND (HC.IDCARTEIRAINVEST  >  0)'
      
        '            AND  ((:IDCARTEIRAGERENC  IS NULL) OR (HC.IDCARTEIRA' +
        'GERENC  = :IDCARTEIRAGERENC))'
      
        '            AND (HC.DATAHISTCAIXA BETWEEN TO_DATE(:DATAINICIO,'#39'D' +
        'D/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '            AND (CE.IDCARTEIRAXEVENTO  = HC.IDCARTEIRAXEVENTO)'
      '            AND (EC.IDEVENTOCAIXACOTA  = -6)'
      '            AND (EC.IDEVENTOCAIXACOTA  = CE.IDEVENTOCAIXACOTA)'
      
        '            GROUP BY HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, ' +
        'HC.IDCARTEIRAGERENC, HC.DATAHISTCAIXA)'
      '   AND (CE.IDCARTEIRAXEVENTO    = HC.IDCARTEIRAXEVENTO)'
      '   AND (EC.IDEVENTOCAIXACOTA    = CE.IDEVENTOCAIXACOTA)'
      '   AND (CG.IDCARTEIRAGERENC     = HC.IDCARTEIRAGERENC)'
      '   AND (CG.IDCARTEIRAINVEST     = HC.IDCARTEIRAINVEST)) HC,'
      '('
      '   SELECT'
      '      PA.IDPLANPREVCTBPATR,'
      '      PA.IDPLANOPREV,'
      '      PA.IDPATRO,'
      '      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '   FROM'
      '      PESSOA PE,'
      '      PLANPREVCONTABPATRO PA,'
      '      PLANPREVCONTABIL PL'
      '   WHERE'
      '      (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '      (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL'
      'WHERE'
      '   (PL.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR)'
      
        'ORDER BY PL.PLANPRVCONTABPATRO, HC.DESCCARTGERENC, HC.DATAHISTCA' +
        'IXA, HC.IDHISTCAIXA, HC.DESCINVESTIMENTO,'
      '         HC.DESCCAIXACOTA')
    ValidateWithMask = True
    Left = 33
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        Name = 'DATAINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object QryHistCaixaDATAHISTCAIXA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAHISTCAIXA'
    end
    object QryHistCaixaPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano/Patrocinadora'
      DisplayWidth = 26
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryHistCaixaDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira Gerencial'
      DisplayWidth = 30
      FieldName = 'DESCCARTGERENC'
      Size = 40
    end
    object QryHistCaixaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 28
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryHistCaixaDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 26
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object QryHistCaixaVLRHISTCAIXA: TFloatField
      DisplayLabel = 'Financeiro'
      DisplayWidth = 18
      FieldName = 'VLRHISTCAIXA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryHistCaixaSLDHISTCAIXA: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 18
      FieldName = 'SLDHISTCAIXA'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryHistCaixaIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Visible = False
    end
    object QryHistCaixaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryHistCaixaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object QryHistCaixaSIGLAACAOBOLSA: TStringField
      FieldName = 'SIGLAACAOBOLSA'
      Visible = False
      Size = 10
    end
  end
end
