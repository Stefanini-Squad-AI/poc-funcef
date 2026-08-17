inherited DmRelIRPeriodo: TDmRelIRPeriodo
  Left = 293
  Top = 174
  Height = 187
  Caption = 'DmRelIRPeriodo'
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
  object qryIRPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   A.VLRRENDIMENTO,'
      '   A.VLRIRLITIGIO,'
      '   A.IDORIGEMIRLITIGIO,A.IDPLANOPREV,A.IDPATROCINADORA,'
      '   A.DESFATOGERADOR AS DESCRICAO,'
      '   A.DATAFATOGERADOR,'
      '   PE.NOME AS PATRO,'
      '   PL.NOME AS PLANOPREV,'
      '   O.DESORIGEMLITIGIO,'
      '   B.VLRRENDIMENTO AS SBTOTRENDIMENTO,'
      '   B.VLRIRLITIGIO AS SBTOTIRLITIGIO,'
      '   C.VLRRENDIMENTO AS TOTALRENDIMENTO,'
      '   C.VLRIRLITIGIO AS TOTALIRLITIGIO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABIL PL,'
      '   ORIGEMIRLITIGIO O,'
      '   ('
      '   SELECT'
      '      VLRRENDIMENTO,'
      '      VLRIRLITIGIO,'
      '      IDORIGEMIRLITIGIO,IDPLANOPREV,IDPATROCINADORA,'
      '      DATAFATOGERADOR,'
      '      DESFATOGERADOR'
      '   FROM'
      '      IRLITIGIO'
      '   WHERE'
      '      DATAFATOGERADOR >= TO_DATE(:DDATAINI,'#39'DD/MM/YYYY'#39')'
      '      AND DATAFATOGERADOR <= TO_DATE(:DDATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '      AND (((:IDORIGEMIRLITIGIO IS NOT NULL) AND (IDORIGEMIRLITI' +
        'GIO = :IDORIGEMIRLITIGIO)) OR (:IDORIGEMIRLITIGIO IS NULL))'
      '   ) A,'
      '   ('
      '   SELECT'
      '      SUM(VLRRENDIMENTO) AS VLRRENDIMENTO,'
      '      SUM(VLRIRLITIGIO) AS VLRIRLITIGIO,'
      '      IDORIGEMIRLITIGIO,IDPLANOPREV,IDPATROCINADORA,'
      '      TO_DATE(:DDATAFIM,'#39'DD/MM/YYYY'#39') AS DATAFATOGERADOR,'
      '      DECODE(IDORIGEMIRLITIGIO,1,'#39'TOTAL RENDA FIXA'#39','
      '      DECODE(IDORIGEMIRLITIGIO,2,'#39'TOTAL RENDA VARIAVEL'#39','
      '      DECODE(IDORIGEMIRLITIGIO,3,'#39'TOTAL BM&F'#39','
      '      DECODE(IDORIGEMIRLITIGIO,4,'#39'TOTAL FDO RENDA FIXA'#39','
      '      DECODE(IDORIGEMIRLITIGIO,5,'#39'TOTAL FDO ACOES'#39','
      
        '      DECODE(IDORIGEMIRLITIGIO,7,'#39'TOTAL FDO IMOBILIARIO'#39',NULL)))' +
        '))) AS DESFATOGERADOR'
      '   FROM'
      '      IRLITIGIO'
      '   WHERE'
      '      DATAFATOGERADOR >= TO_DATE(:DDATAINI,'#39'DD/MM/YYYY'#39')'
      '      AND DATAFATOGERADOR <= TO_DATE(:DDATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '      AND (((:IDORIGEMIRLITIGIO IS NOT NULL) AND (IDORIGEMIRLITI' +
        'GIO = :IDORIGEMIRLITIGIO)) OR (:IDORIGEMIRLITIGIO IS NULL))'
      '   GROUP BY'
      '      IDORIGEMIRLITIGIO,IDPLANOPREV,IDPATROCINADORA'
      '   ) B,'
      '   ('
      '   SELECT'
      '      SUM(VLRRENDIMENTO) AS VLRRENDIMENTO,'
      '      SUM(VLRIRLITIGIO) AS VLRIRLITIGIO'
      '   FROM'
      '      IRLITIGIO'
      '   WHERE'
      '      DATAFATOGERADOR >= TO_DATE(:DDATAINI,'#39'DD/MM/YYYY'#39')'
      '      AND DATAFATOGERADOR <= TO_DATE(:DDATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '      AND (((:IDORIGEMIRLITIGIO IS NOT NULL) AND (IDORIGEMIRLITI' +
        'GIO = :IDORIGEMIRLITIGIO)) OR (:IDORIGEMIRLITIGIO IS NULL))'
      '    ) C'
      'WHERE'
      '   (A.IDPATROCINADORA = PE.IDPESSOA(+))  AND'
      '   (A.IDPLANOPREV = PL.IDPLANOPREV) AND'
      
        '   (((:IDORIGEMIRLITIGIO IS NOT NULL) AND (A.IDORIGEMIRLITIGIO =' +
        ' :IDORIGEMIRLITIGIO)) OR (:IDORIGEMIRLITIGIO IS NULL)) AND'
      '   (A.IDORIGEMIRLITIGIO = O.IDORIGEMIRLITIGIO) AND'
      '   (A.IDORIGEMIRLITIGIO = B.IDORIGEMIRLITIGIO) AND'
      '   (A.IDPATROCINADORA = B.IDPATROCINADORA)  AND'
      '   (A.IDPLANOPREV = B.IDPLANOPREV)'
      'ORDER BY'
      '   A.IDORIGEMIRLITIGIO,A.DATAFATOGERADOR,'
      '   A.IDPLANOPREV,A.IDPATROCINADORA'
      '')
    ValidateWithMask = True
    Left = 26
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'DDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DDATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDORIGEMIRLITIGIO'
        ParamType = ptUnknown
      end>
    object qryIRPeriodoDESORIGEMLITIGIO: TStringField
      DisplayLabel = 'Origem'
      DisplayWidth = 30
      FieldName = 'DESORIGEMLITIGIO'
      Size = 60
    end
    object qryIRPeriodoDATAFATOGERADOR: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAFATOGERADOR'
    end
    object qryIRPeriodoVLRRENDIMENTO: TFloatField
      DisplayLabel = 'Rendimento'
      DisplayWidth = 18
      FieldName = 'VLRRENDIMENTO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryIRPeriodoVLRIRLITIGIO: TFloatField
      DisplayLabel = 'I.R.R.F'
      DisplayWidth = 17
      FieldName = 'VLRIRLITIGIO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryIRPeriodoPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 32
      FieldName = 'PATRO'
      Size = 60
    end
    object qryIRPeriodoPLANOPREV: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 21
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryIRPeriodoDESCRICAO: TStringField
      DisplayLabel = 'Fato Gerador'
      DisplayWidth = 80
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryIRPeriodoIDORIGEMIRLITIGIO: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Visible = False
    end
    object qryIRPeriodoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryIRPeriodoIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object qryIRPeriodoTOTALRENDIMENTO: TFloatField
      FieldName = 'TOTALRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryIRPeriodoTOTALIRLITIGIO: TFloatField
      FieldName = 'TOTALIRLITIGIO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryIRPeriodoSBTOTRENDIMENTO: TFloatField
      FieldName = 'SBTOTRENDIMENTO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryIRPeriodoSBTOTIRLITIGIO: TFloatField
      FieldName = 'SBTOTIRLITIGIO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsIRPeriodo: TwwDataSource
    DataSet = qryIRPeriodo
    Left = 95
    Top = 80
  end
  object ppIRPeriodo: TppBDEPipeline
    DataSource = dsIRPeriodo
    UserName = 'IRPeriodo'
    Left = 157
    Top = 80
    object ppIRPeriodoppField1: TppField
      FieldAlias = 'DESORIGEMLITIGIO'
      FieldName = 'DESORIGEMLITIGIO'
      FieldLength = 60
      DisplayWidth = 30
      Position = 0
    end
    object ppIRPeriodoppField2: TppField
      FieldAlias = 'DATAFATOGERADOR'
      FieldName = 'DATAFATOGERADOR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppIRPeriodoppField3: TppField
      FieldAlias = 'PLANOPREV'
      FieldName = 'PLANOPREV'
      FieldLength = 50
      DisplayWidth = 21
      Position = 2
    end
    object ppIRPeriodoppField4: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 32
      Position = 3
    end
    object ppIRPeriodoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 4
    end
    object ppIRPeriodoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRLITIGIO'
      FieldName = 'VLRIRLITIGIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 5
    end
    object ppIRPeriodoppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 200
      DisplayWidth = 80
      Position = 6
    end
    object ppIRPeriodoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDORIGEMIRLITIGIO'
      FieldName = 'IDORIGEMIRLITIGIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppIRPeriodoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppIRPeriodoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATROCINADORA'
      FieldName = 'IDPATROCINADORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppIRPeriodoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALRENDIMENTO'
      FieldName = 'TOTALRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppIRPeriodoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALIRLITIGIO'
      FieldName = 'TOTALIRLITIGIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppIRPeriodoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SBTOTRENDIMENTO'
      FieldName = 'SBTOTRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppIRPeriodoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SBTOTIRLITIGIO'
      FieldName = 'SBTOTIRLITIGIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object pprIRPeriodo: TppReport
    AutoStop = False
    DataPipeline = ppIRPeriodo
    OnStartPage = pprIRPeriodoStartPage
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
    Left = 218
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppIRPeriodo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'I.R.R.F. no Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8730
        mmWidth = 31485
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19579
        mmWidth = 284300
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
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 21431
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 21696
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'I.R.R.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 101336
        mmTop = 21696
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Rendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 74877
        mmTop = 21696
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 112713
        mmTop = 21696
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 146579
        mmTop = 21696
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Fato Gerador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 180182
        mmTop = 21696
        mmWidth = 21960
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Período : xx/xx/xxxx até xx/xx/xxxx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 14023
        mmWidth = 47890
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAFATOGERADOR'
        DataPipeline = ppIRPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESORIGEMLITIGIO'
        DataPipeline = ppIRPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 47890
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRRENDIMENTO'
        DataPipeline = ppIRPeriodo
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 68527
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'VLRIRLITIGIO'
        DataPipeline = ppIRPeriodo
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCRICAO'
        DataPipeline = ppIRPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 180182
        mmTop = 529
        mmWidth = 103717
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PATRO'
        DataPipeline = ppIRPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 112713
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PLANOPREV'
        DataPipeline = ppIRPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppIRPeriodo'
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 529
        mmWidth = 33073
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmTop = 1588
        mmWidth = 284163
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
        mmWidth = 284163
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
        mmLeft = 255853
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object shpResumo: TppShape
        UserName = 'shpResumo'
        Brush.Color = clSilver
        mmHeight = 6879
        mmLeft = 0
        mmTop = 2910
        mmWidth = 284428
        BandType = 7
      end
      object lblTotalRendto: TppLabel
        UserName = 'lblTotalRendto'
        AutoSize = False
        Caption = 'Total do Rendimento : R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 4498
        mmWidth = 99748
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 88106
        mmTop = 3175
        mmWidth = 2381
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 190500
        mmTop = 3175
        mmWidth = 2381
        BandType = 7
      end
      object lblTotalIR: TppLabel
        UserName = 'lblTotalIR'
        Caption = 'Total de I.R.R.F. : R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 191823
        mmTop = 4498
        mmWidth = 35454
        BandType = 7
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 2117
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDORIGEMIRLITIGIO'
      DataPipeline = ppIRPeriodo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppIRPeriodo'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'SBTOTRENDIMENTO'
          DataPipeline = ppIRPeriodo
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppIRPeriodo'
          mmHeight = 3175
          mmLeft = 68263
          mmTop = 1852
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'SBTOTIRLITIGIO'
          DataPipeline = ppIRPeriodo
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppIRPeriodo'
          mmHeight = 3175
          mmLeft = 91811
          mmTop = 1852
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 51594
          mmTop = 1588
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
