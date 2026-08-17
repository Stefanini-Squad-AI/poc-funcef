inherited DmRelDemOpCustoRet: TDmRelDemOpCustoRet
  Left = 340
  Top = 151
  Caption = 'DmRelDemOpCustoRet'
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
  object pplDemoOpCustoRet: TppBDEPipeline
    DataSource = dsDemoOpCustoRet
    UserName = 'lDemoOpCustoRet'
    Left = 185
    Top = 70
  end
  object dsDemoOpCustoRet: TwwDataSource
    DataSet = qryDemoOpCustoRet
    Left = 185
    Top = 134
  end
  object qryDemoOpCustoRet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  TO_CHAR(HI.DATAMOVCARTINV,'#39'YYYYMM'#39') AS CODMES,'
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'01'#39','#39'Janeiro'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'02'#39','#39'Fevereiro'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'03'#39','#39'Março'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'04'#39','#39'Abril'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'05'#39','#39'Maio'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'06'#39','#39'Junho'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'07'#39','#39'Julho'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'08'#39','#39'Agosto'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'09'#39','#39'Setembro'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'10'#39','#39'Outubro'#39','
      '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'11'#39','#39'Novembro'#39','
      
        '        DECODE(TO_CHAR(HI.DATAMOVCARTINV,'#39'MM'#39'),'#39'12'#39','#39'Dezembro'#39'))' +
        ')))))))))) || '#39' de '#39' ||'
      '        TO_CHAR(HI.DATAMOVCARTINV,'#39'YYYY'#39') AS MES,'
      
        '        IV.DESCINVESTIMENTO, TPO.DESCTIPOOPERACAO, HI.DATAMOVCAR' +
        'TINV,'
      
        '        OI.DATAVENCOPER, HI.QTDEMOVINVCART, ABS(HI.VLRMOVCARTINV' +
        ') AS VLRMOVCARTINV, HI.SALDOQTDEINVCART,'
      '        0.00000000 AS VALCUSTO,'
      '        ((HI.SALDOAQUI * HI.QTDEMOVINVCART)/'
      
        '          DECODE(HI.SALDOQTDEINVCART,0,1,HI.SALDOQTDEINVCART) ) ' +
        'AS SLDCUSTO,'
      '        NVL(DS.TOTALDESPESAS,0) AS TOTALDESPESAS,'
      '        0 AS RESULTADO,'
      '        0 AS VLRIR, (1) CONTADOR,'
      
        '        HI.IDCARTEIRAINVEST, IV.IDINVESTIMENTO, TPO.IDTIPOOPERAC' +
        'AO, TPO.IDMERCADO,'
      
        '        TPO.FLGTRATAIR, TPO.NATUREZAOPERACAO, CR.CUSTO_RET, HI.I' +
        'DLOTE, HI.IDHISTCARTINV,'
      '        0.00 AS ALIQUOTA'
      'FROM HISTCARTINV HI, INVESTIMENTO IV, OPERACAOINVEST OI,'
      
        '     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTAL' +
        'DESPESAS'
      '      FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI'
      '      WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND'
      '             TDI.NATUREZAOPERACAO NOT IN ('#39'N'#39')'
      '      GROUP BY DOI.IDOPERACAOINVEST) DS,'
      '     (SELECT IDACAO, SUM(NVL(CUSTO_RET,0)) AS CUSTO_RET'
      '      FROM ACOESXBOLSA'
      '      GROUP BY IDACAO) CR,'
      '     TIPOOPERACAO  TPO'
      ''
      'WHERE'
      
        '       (HI.IDCARTEIRAINVEST    = :IDCARTEIRAINVEST)             ' +
        '    AND'
      
        '       (((:IDINVESTIMENTO IS NOT NULL)                          ' +
        '    AND'
      
        '         (HI.IDINVESTIMENTO    = :IDINVESTIMENTO))              ' +
        '    OR'
      
        '         (:IDINVESTIMENTO IS NULL) )                            ' +
        '    AND'
      
        '       (OI.DATAVENCOPER BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')  ' +
        '    AND'
      
        '                                TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39'))' +
        '    AND'
      
        '       (HI.NATURMOVCARTINV     IN ('#39'A'#39','#39'D'#39'))                    ' +
        '    AND'
      
        '       (HI.IDTIPOINVEST        = 2)                             ' +
        '    AND'
      
        '       (HI.IDOPERACAOINVEST    = OI.IDOPERACAOINVEST)           ' +
        '    AND'
      
        '       (HI.IDOPERACAOINVEST    = DS.IDOPERACAOINVEST(+))        ' +
        '    AND'
      
        '       (IV.IDINVESTIMENTO      = HI.IDINVESTIMENTO)             ' +
        '    AND'
      
        '       (HI.IDINVESTIMENTO      = CR.IDACAO)                     ' +
        '    AND'
      '       (TPO.IDTIPOOPERACAO     = HI.IDTIPOOPERACAO)'#9#9'    AND'
      
        '       (TPO.FLGOPDIREITO      <> '#39'S'#39')                           ' +
        '  '
      ''
      
        'ORDER BY CODMES, IV.DESCINVESTIMENTO, OI.DATAVENCOPER, HI.IDHIST' +
        'CARTINV'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDemoOpCustoRet
    ValidateWithMask = True
    Left = 49
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
    object qryDemoOpCustoRetDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDemoOpCustoRetDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryDemoOpCustoRetQTDEMOVINVCART: TFloatField
      FieldName = 'QTDEMOVINVCART'
    end
    object qryDemoOpCustoRetVLRMOVCARTINV: TFloatField
      FieldName = 'VLRMOVCARTINV'
    end
    object qryDemoOpCustoRetVALCUSTO: TFloatField
      FieldName = 'VALCUSTO'
    end
    object qryDemoOpCustoRetTOTALDESPESAS: TFloatField
      FieldName = 'TOTALDESPESAS'
    end
    object qryDemoOpCustoRetRESULTADO: TFloatField
      FieldName = 'RESULTADO'
    end
    object qryDemoOpCustoRetVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryDemoOpCustoRetCONTADOR: TFloatField
      FieldName = 'CONTADOR'
    end
    object qryDemoOpCustoRetIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryDemoOpCustoRetIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryDemoOpCustoRetIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object qryDemoOpCustoRetFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryDemoOpCustoRetIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryDemoOpCustoRetDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryDemoOpCustoRetDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDemoOpCustoRetNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryDemoOpCustoRetCUSTO_RET: TFloatField
      FieldName = 'CUSTO_RET'
    end
    object qryDemoOpCustoRetSALDOQTDEINVCART: TFloatField
      FieldName = 'SALDOQTDEINVCART'
    end
    object qryDemoOpCustoRetIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryDemoOpCustoRetIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryDemoOpCustoRetSLDCUSTO: TFloatField
      FieldName = 'SLDCUSTO'
    end
    object qryDemoOpCustoRetALIQUOTA: TFloatField
      FieldName = 'ALIQUOTA'
    end
    object qryDemoOpCustoRetMES: TStringField
      FieldName = 'MES'
      Size = 2
    end
    object qryDemoOpCustoRetCODMES: TStringField
      FieldName = 'CODMES'
      Size = 6
    end
  end
  object rptDemoOpCustoRet: TppReport
    AutoStop = False
    DataPipeline = pplDemoOpCustoRet
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Demonstrativo de Operações - Custo RET'
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
    BeforePrint = rptDemoOpCustoRetBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 49
    Top = 70
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDemoOpCustoRet'
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppLabel280: TppLabel
        UserName = 'ppLabel54'
        Caption = 'Demonstrativo de Operações - Custo RET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 7938
        mmWidth = 70379
        BandType = 0
      end
      object ppLabel281: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel55'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25135
        mmTop = 529
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel286: TppLabel
        UserName = 'RptOperRendaVarLabel16'
        Caption = 'até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 13494
        mmWidth = 4498
        BandType = 0
      end
      object ppShape38: TppShape
        UserName = 'RptOperRendaVarShape1'
        Brush.Color = clSilver
        mmHeight = 4233
        mmLeft = 0
        mmTop = 24077
        mmWidth = 284163
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
        mmLeft = 5821
        mmTop = 24606
        mmWidth = 5821
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
        mmLeft = 101600
        mmTop = 24606
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
        mmLeft = 122502
        mmTop = 24606
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
        mmLeft = 233098
        mmTop = 24606
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
        mmLeft = 269082
        mmTop = 24606
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel293: TppLabel
        UserName = 'RptOperRendaVarLabel15'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 192352
        mmTop = 24606
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel302: TppLabel
        UserName = 'Label302'
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 24606
        mmWidth = 12700
        BandType = 0
      end
      object ppDataIni: TppLabel
        UserName = 'DataIni'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 13494
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
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48683
        mmTop = 13494
        mmWidth = 16140
        BandType = 0
      end
      object ppCarteira: TppLabel
        UserName = 'Carteira'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 271463
        mmTop = 13494
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Saldo do Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 205846
        mmTop = 24606
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 27781
        mmTop = 24606
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Aliquota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 251355
        mmTop = 24606
        mmWidth = 11113
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
    object ppDetailBand30: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDet: TppShape
        OnPrint = shpDetPrint
        UserName = 'shpDet'
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText138: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'QTDEMOVINVCART'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 89694
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText139: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'VLRMOVCARTINV'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText142: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALCUSTO'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',##0.00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 186267
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText144: TppDBText
        UserName = 'DBText144'
        DataField = 'TOTALDESPESAS'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'RESULTADO'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',#00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 229130
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText141: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'VLRIR'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 275432
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText137: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAVENCOPER'
        DataPipeline = pplDemoOpCustoRet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'SLDCUSTO'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 210080
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = pplDemoOpCustoRet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 0
        mmWidth = 62442
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText11'
        DataField = 'ALIQUOTA'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 252942
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
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
        OnPrint = LblSistemaPrint
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
        mmTop = 1588
        mmWidth = 76729
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
      object shpResumo: TppShape
        UserName = 'shpResumo'
        Brush.Color = clSilver
        ParentHeight = True
        ParentWidth = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
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
        mmLeft = 4763
        mmTop = 0
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc41'
        DataField = 'VLRIR'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 266436
        mmTop = 0
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'RESULTADO'
        DataPipeline = pplDemoOpCustoRet
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemoOpCustoRet'
        mmHeight = 3175
        mmLeft = 225161
        mmTop = 0
        mmWidth = 21167
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MES'
      DataPipeline = pplDemoOpCustoRet
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemoOpCustoRet'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'shpCabInv1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText12'
          DataField = 'MES'
          DataPipeline = pplDemoOpCustoRet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 265
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object shpTotAcao: TppShape
          UserName = 'shpTotAcao'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4233
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel294: TppLabel
          UserName = 'Label294'
          Caption = 'Total no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'RESULTADO'
          DataPipeline = pplDemoOpCustoRet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 229130
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataField = 'VLRIR'
          DataPipeline = pplDemoOpCustoRet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 266436
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'DESCINVESTIMENTO'
      DataPipeline = pplDemoOpCustoRet
      OutlineSettings.CreateNode = True
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemoOpCustoRet'
      object grpcInvestimento: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 5556
          mmTop = 1058
          mmWidth = 278871
          BandType = 3
          GroupNo = 1
        end
        object ppdbDemVdDescInvestimento: TppDBText
          OnPrint = ppdbDemVdDescInvestimentoPrint
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DESCINVESTIMENTO'
          DataPipeline = pplDemoOpCustoRet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 28046
          mmTop = 1323
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
        end
        object ppLabel288: TppLabel
          UserName = 'RptOperRendaVarLabel2'
          Caption = 'Investimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 5292
          mmTop = 1323
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
      end
      object grpfInvestimento: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object linTotData: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 5821
          mmTop = 529
          mmWidth = 278607
          BandType = 5
          GroupNo = 1
        end
        object ppLabel296: TppLabel
          UserName = 'Label296'
          Caption = 'Total do Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 1058
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc32'
          DataField = 'TOTALDESPESAS'
          DataPipeline = pplDemoOpCustoRet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 150813
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc33'
          DataField = 'RESULTADO'
          DataPipeline = pplDemoOpCustoRet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 229130
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc34'
          DataField = 'VLRIR'
          DataPipeline = pplDemoOpCustoRet
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemoOpCustoRet'
          mmHeight = 3175
          mmLeft = 266965
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object lblTotValOper: TppLabel
          OnPrint = lblTotValOperPrint
          UserName = 'lblTotValOper'
          Caption = 'lblTotValOper'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 1058
          mmWidth = 18256
          BandType = 5
          GroupNo = 1
        end
        object lblTotQtdOper: TppLabel
          OnPrint = lblTotQtdOperPrint
          UserName = 'lblTotQtdOper'
          Caption = 'lblTotQtdOper'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 97631
          mmTop = 1058
          mmWidth = 18785
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updDemoOpCustoRet: TUpdateSQL
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
      '  FLGTRATAIR = :FLGTRATAIR,'
      '  ALIQUOTA = :ALIQUOTA'
      'where'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      '  (DESCINVESTIMENTO, DATAMOVCARTINV, QTDEMOVINVCART, '
      'VLRMOVCARTINV, VALCUSTO, '
      '   TOTALDESPESAS, RESULTADO, VLRIR, CONTADOR, IDCARTEIRAINVEST, '
      'IDINVESTIMENTO, '
      '   IDTIPOOPERACAO, IDMERCADO, FLGTRATAIR, ALIQUOTA)'
      'values'
      '  (:DESCINVESTIMENTO, :DATAMOVCARTINV, :QTDEMOVINVCART, '
      ':VLRMOVCARTINV, '
      '   :VALCUSTO, :TOTALDESPESAS, :RESULTADO, :VLRIR, :CONTADOR, '
      ':IDCARTEIRAINVEST, '
      '   :IDINVESTIMENTO, :IDTIPOOPERACAO, :IDMERCADO, :FLGTRATAIR, '
      'ALIQUOTA)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DESCINVESTIMENTO = :OLD_DESCINVESTIMENTO')
    Left = 49
    Top = 190
  end
end
