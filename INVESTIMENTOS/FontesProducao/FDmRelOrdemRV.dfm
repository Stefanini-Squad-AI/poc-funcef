inherited DmRelOrdemRV: TDmRelOrdemRV
  Left = 411
  Top = 189
  Caption = 'DmRelOrdemRV'
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
  object pplOrdemRV: TppBDEPipeline
    DataSource = dsOrdemRV
    UserName = 'pplOrdemRV'
    Left = 157
    Top = 97
    object pplOrdemRVppField1: TppField
      FieldAlias = 'NUMDOCMOVINV'
      FieldName = 'NUMDOCMOVINV'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplOrdemRVppField2: TppField
      FieldAlias = 'SGLCORRETVALORES'
      FieldName = 'SGLCORRETVALORES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplOrdemRVppField3: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplOrdemRVppField4: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplOrdemRVppField5: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplOrdemRVppField6: TppField
      FieldAlias = 'SGLBOLSAVALORES'
      FieldName = 'SGLBOLSAVALORES'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object pplOrdemRVppField7: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplOrdemRVppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PUORDMOVINV'
      FieldName = 'PUORDMOVINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplOrdemRVppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEORDENADA'
      FieldName = 'QTDEORDENADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplOrdemRVppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEORDMOVINV'
      FieldName = 'QTDEORDMOVINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplOrdemRVppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDELOTE'
      FieldName = 'QTDELOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplOrdemRVppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object dsOrdemRV: TwwDataSource
    AutoEdit = False
    DataSet = qryOrdemRV
    Left = 95
    Top = 97
  end
  object qryOrdemRV: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OD.NUMDOCMOVINV, ('#39'Corretora '#39' || CV.SGLCORRETVALORES) AS' +
        ' SGLCORRETVALORES, '
      
        '       TP.DESCTIPOOPERACAO, CA.DESCCARTINVEST, IV.DESCINVESTIMEN' +
        'TO, BV.SGLBOLSAVALORES, '
      
        '       CS.SGLCUSTODIANTE, OD.PUORDMOVINV, OD.QTDEORDENADA, OD.QT' +
        'DEORDMOVINV, AB.QTDELOTE,'
      
        '       ((OD.PUORDMOVINV * OD.QTDEORDENADA) / AB.QTDELOTE) AS VAL' +
        'OR'
      
        'FROM ORDMOVINV OD, CORRETVALORES CV, TIPOOPERACAO TP, INVESTIMEN' +
        'TO IV, BOLSAVALORES BV,'
      '     CUSTODIANTE CS, ACOESXBOLSA AB,'
      '     (SELECT (IDCARTEIRAINVEST+IDCARTEIRAGERENC+1) AS ID,'
      '             IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '             DESCCARTGERENC AS DESCCARTINVEST'
      '      FROM   CARTEIRAGERENC'
      '      UNION'
      '      SELECT (IDCARTEIRAINVEST+1) AS ID,'
      '             IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC,'
      '             DESCCARTINVEST'
      '      FROM  CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      
        '        AND IDCARTEIRAINVEST NOT IN (SELECT IDCARTEIRAINVEST FRO' +
        'M CARTEIRAGERENC)'
      '      ORDER BY DESCCARTINVEST) CA'
      ''
      
        'WHERE OD.DATAORDMOVINV LIKE TO_DATE(:DATAORDMOVINV, '#39'DD/MM/YYYY'#39 +
        ')'
      '  AND ((:BOLETA IS NULL) OR (OD.NUMDOCMOVINV = :BOLETA))'
      '  AND IV.IDTIPOINVEST = 2'
      '  AND OD.IDCORRETVALORES = CV.IDCORRETVALORES'
      '  AND OD.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)'
      '  AND OD.IDCARTEIRAGERENC = CA.IDCARTEIRAGERENC(+)'
      '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OD.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OD.IDBOLSAVALORES = BV.IDBOLSAVALORES'
      '  AND OD.IDCUSTODIANTE = CS.IDCUSTODIANTE'
      '  AND OD.IDINVESTIMENTO = AB.IDACAO'
      '  AND OD.IDBOLSAVALORES = AB.IDBOLSAVALORES'
      
        'ORDER BY OD.NUMDOCMOVINV, CV.SGLCORRETVALORES, TP.DESCTIPOOPERAC' +
        'AO, CA.DESCCARTINVEST,'
      
        '         IV.DESCINVESTIMENTO, BV.SGLBOLSAVALORES, CS.SGLCUSTODIA' +
        'NTE'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 97
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAORDMOVINV'
        ParamType = ptResult
        Value = '15/10/2004'
      end
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptResult
      end>
    object qryOrdemRVNUMDOCMOVINV: TStringField
      FieldName = 'NUMDOCMOVINV'
      Size = 30
    end
    object qryOrdemRVSGLCORRETVALORES: TStringField
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object qryOrdemRVDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryOrdemRVDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOrdemRVDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdemRVSGLBOLSAVALORES: TStringField
      FieldName = 'SGLBOLSAVALORES'
      Size = 10
    end
    object qryOrdemRVSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryOrdemRVPUORDMOVINV: TFloatField
      FieldName = 'PUORDMOVINV'
    end
    object qryOrdemRVQTDEORDENADA: TFloatField
      FieldName = 'QTDEORDENADA'
    end
    object qryOrdemRVQTDEORDMOVINV: TFloatField
      FieldName = 'QTDEORDMOVINV'
    end
    object qryOrdemRVQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
    end
    object qryOrdemRVVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object rptOrdemRV: TppReport
    AutoStop = False
    DataPipeline = pplOrdemRV
    OnStartPage = rptOrdemRVStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ordem de Movimentação'
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
    Top = 97
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplOrdemRV'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SGLCORRETVALORES'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 12171
        mmWidth = 111654
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Ordens de Movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 43392
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
        mmHeight = 5292
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
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMDOCMOVINV'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 13758
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'Boleta:  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 13758
        mmWidth = 12700
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 19579
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 19579
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 60590
        mmTop = 19579
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Bolsa de Valores'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 19579
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Custodiante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'P.U. da Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 19579
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Quant. Ordenada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177536
        mmTop = 19579
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Quant. Autorizada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 202936
        mmTop = 19579
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Lote Padrão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 234950
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Valor da Ordem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 258234
        mmTop = 19579
        mmWidth = 25665
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = ppGroup2
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 0
        mmWidth = 52652
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 60590
        mmTop = 0
        mmWidth = 38894
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SGLBOLSAVALORES'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = pplOrdemRV
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PUORDMOVINV'
        DataPipeline = pplOrdemRV
        DisplayFormat = '###,###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 151342
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDEORDENADA'
        DataPipeline = pplOrdemRV
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 177536
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'QTDEORDMOVINV'
        DataPipeline = pplOrdemRV
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 204523
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'QTDELOTE'
        DataPipeline = pplOrdemRV
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 228600
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VALOR'
        DataPipeline = pplOrdemRV
        DisplayFormat = '###,###,###,###.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplOrdemRV'
        mmHeight = 3175
        mmLeft = 261673
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmWidth = 283369
        BandType = 8
      end
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
        mmWidth = 283369
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
        mmLeft = 257440
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMDOCMOVINV'
      DataPipeline = pplOrdemRV
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrdemRV'
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
      BreakName = 'DESCTIPOOPERACAO'
      DataPipeline = pplOrdemRV
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplOrdemRV'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplOrdemRV
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplOrdemRV'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 90488
          BandType = 3
          GroupNo = 1
        end
        object pplTipoOperacao: TppLine
          UserName = 'lTipoOperacao'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3439
          mmWidth = 283898
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
