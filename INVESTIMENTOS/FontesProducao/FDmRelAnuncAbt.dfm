inherited DmRelAnuncAbt: TDmRelAnuncAbt
  Left = 345
  Top = 195
  Height = 194
  Caption = 'DmRelAnuncAbt'
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object pplAnunciosAbt: TppBDEPipeline
    DataSource = dsAnunciosAbt
    UserName = 'lAnunciosAbt'
    Left = 157
    Top = 80
  end
  object dsAnunciosAbt: TwwDataSource
    AutoEdit = False
    DataSet = qryAnunciosAbt
    Left = 95
    Top = 80
  end
  object qryAnunciosAbt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT OI.NUMDOCUMENTO AS BOLETA, TP.DESCTIPOOPERACAO,'
      
        '       IV.DESCINVESTIMENTO, CI.DESCCARTINVEST, MB.SIGLAMOTBLOQ, ' +
        'MB.DESCMOTBLOQ,'
      
        '       OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREVISTA, OD.DAT' +
        'AEX AS DATABASE,'
      
        '       DECODE(OI.IDTIPOOPERACAO, -70, '#39'Comum'#39', '#39'Investimento'#39') A' +
        'S CONTA,'
      '       NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,'
      '       NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,'
      '       NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,'
      '       NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,'
      '       OI.PRECOUNITOPERACAO,'
      
        '       NVL(OI.VLROPERACAO,0) - NVL(REC.QTDEOPERACAO,0) - NVL(CAN' +
        '.QTDEOPERACAO,0) AS VLROPERACAO,'
      
        '       (OD.DATAEX || TP.DESCTIPOOPERACAO || OI.IDOPERACAODIREITO' +
        ') AS IDGRUPO'
      ''
      
        'FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPO' +
        'OPERACAO TP,'
      '     INVESTIMENTO IV, CARTEIRAINVEST CI, MOTIVOBLOQUEIO MB,'
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO'
      '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1'
      '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL'
      
        '        AND OI1.IDTIPOOPERACAO IN (PI1.IDTIPOOPERDIRDIV, PI1.IDT' +
        'IPOOPERDIRDIV + 10000,'
      
        '                                   PI1.IDTIPOOPERDIRJUR, PI1.IDT' +
        'IPOOPERDIRJUR + 10000,'
      
        '                                   PI1.IDTIPOOPERDIRMUL, PI1.IDT' +
        'IPOOPERDIRMUL + 10000)'
      
        '        AND ((:DATAREF IS NULL) OR (OI1.DATAOPERACAO <= TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39')))'
      '      GROUP BY IDOPERACAOORIGEM) REC,'
      ''
      
        '     (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS QTDEO' +
        'PERACAO'
      '      FROM OPERACAOINVEST OI1, PARAMINVEST PI1'
      '      WHERE OI1.IDOPERACAOORIGEM IS NOT NULL'
      '        AND OI1.IDTIPOOPERACAO IN (-170, -10170)'
      
        '        AND ((:DATAREF IS NULL) OR (OI1.DATAOPERACAO <= TO_DATE(' +
        ':DATAREF,'#39'DD/MM/YYYY'#39')))'
      '      GROUP BY IDOPERACAOORIGEM) CAN'
      ''
      'WHERE OI.IDCARTEIRAGERENC IS NULL'
      '  AND OI.IDTIPOOPERACAO IN (-70, -10070)'
      '  AND OI.ORIGDEST IS NOT NULL'
      
        '  AND ((:DATAREF IS NULL) OR (OD.DATAOPER <= TO_DATE(:DATAREF,'#39'D' +
        'D/MM/YYYY'#39')))'
      
        '  AND ((:DATAEX IS NULL) OR (OD.DATAEX = TO_DATE(:DATAEX, '#39'DD/MM' +
        '/YYYY'#39')))'
      
        '  AND ((:IDTIPOOPERACAO IS NULL) OR (TP.IDTIPOOPERACAO = :IDTIPO' +
        'OPERACAO))'
      
        '  AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :IDINVE' +
        'STIMENTO))'
      
        '  AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERDI' +
        'RJUR, PI.IDTIPOOPERDIRMUL)'
      '  AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '  AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '  AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)'
      '  AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+)'
      '  AND (((:TIPOREL = '#39'A'#39') AND'
      
        '        (NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + NVL(' +
        'CAN.QTDEOPERACAO,0))) AND'
      '        (NVL(OD.STATUS,'#39'P'#39') <> '#39'T'#39') ) OR'
      '       ((:TIPOREL = '#39'R'#39') AND (REC.QTDEOPERACAO IS NOT NULL)) OR'
      '       ((:TIPOREL = '#39'C'#39') AND (CAN.QTDEOPERACAO IS NOT NULL)))'
      ''
      ''
      ''
      
        'ORDER BY OD.DATAEX, TP.DESCTIPOOPERACAO, OI.IDOPERACAODIREITO, O' +
        'I.NUMDOCUMENTO, IV.DESCINVESTIMENTO'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
        Value = '08/12/2004'
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
        Value = '08/12/2004'
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
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
        Name = 'TIPOREL'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TIPOREL'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TIPOREL'
        ParamType = ptOutput
      end>
    object qryAnunciosAbtDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAnunciosAbtDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryAnunciosAbtBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 30
      FieldName = 'BOLETA'
      Size = 30
    end
    object qryAnunciosAbtDATAEX: TDateTimeField
      DisplayLabel = 'Data EX'
      DisplayWidth = 18
      FieldName = 'DATAEX'
    end
    object qryAnunciosAbtDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 18
      FieldName = 'DATAPREVISTA'
    end
    object qryAnunciosAbtDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 18
      FieldName = 'DATABASE'
    end
    object qryAnunciosAbtDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnunciosAbtQTDPREVISTA: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDPREVISTA'
    end
    object qryAnunciosAbtVALORPREVISTO: TFloatField
      DisplayLabel = 'Valor Anunciado'
      FieldName = 'VALORPREVISTO'
    end
    object qryAnunciosAbtQTDRECEBIDA: TFloatField
      DisplayLabel = 'Qtd Recebida'
      DisplayWidth = 10
      FieldName = 'QTDRECEBIDA'
    end
    object qryAnunciosAbtQTDCANCELADA: TFloatField
      FieldName = 'QTDCANCELADA'
    end
    object qryAnunciosAbtPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 10
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryAnunciosAbtVLROPERACAO: TFloatField
      DisplayLabel = 'Valor a Receber'
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
    end
    object qryAnunciosAbtIDGRUPO: TStringField
      DisplayWidth = 108
      FieldName = 'IDGRUPO'
      Size = 108
    end
    object qryAnunciosAbtSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryAnunciosAbtDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object qryAnunciosAbtCONTA: TStringField
      FieldName = 'CONTA'
      Size = 3
    end
  end
  object rptAnunciosAbt: TppReport
    AutoStop = False
    DataPipeline = pplAnunciosAbt
    OnStartPage = rptAnunciosAbtStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Anúncios de Proventos em Aberto'
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
    DataPipelineName = 'pplAnunciosAbt'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object lblNomeRel: TppLabel
        OnPrint = lblNomeRelPrint
        UserName = 'lblNomeRel'
        Caption = 'Anúncio de Proventos em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 55827
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
      object lblCarteira: TppLabel
        UserName = 'LCarteira'
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
        mmLeft = 271992
        mmTop = 12171
        mmWidth = 11906
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
      object lblFiltros: TppLabel
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
        mmWidth = 11113
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 19844
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 23548
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 151342
        mmTop = 23548
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3175
        mmLeft = 179652
        mmTop = 23283
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Recebido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 215107
        mmTop = 20638
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'PU de Anúncio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 252942
        mmTop = 20638
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor a Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 271198
        mmTop = 20638
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Valor Previsto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 198173
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Carteira de Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 265
        mmTop = 23548
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor Cancelado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 232834
        mmTop = 20638
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Bloqueio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 86784
        mmTop = 23548
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Conta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 132557
        mmTop = 23548
        mmWidth = 6879
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2910
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
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'BOLETA'
        DataPipeline = pplAnunciosAbt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplAnunciosAbt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 151342
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QTDPREVISTA'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDRECEBIDA'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 213519
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALORPREVISTO'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 196586
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 247915
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLROPERACAO'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 266171
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplAnunciosAbt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 265
        mmTop = 0
        mmWidth = 67998
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'QTDCANCELADA'
        DataPipeline = pplAnunciosAbt
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 231246
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DESCMOTBLOQ'
        DataPipeline = pplAnunciosAbt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 86784
        mmTop = 0
        mmWidth = 42863
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CONTA'
        DataPipeline = pplAnunciosAbt
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAnunciosAbt'
        mmHeight = 2910
        mmLeft = 132557
        mmTop = 0
        mmWidth = 14552
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
        mmWidth = 282576
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
        mmWidth = 282576
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
        mmLeft = 254001
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = pplAnunciosAbt
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplAnunciosAbt'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object shpGrupo: TppShape
          OnPrint = shpDetalhePrint
          UserName = 'shpDetalhe2'
          ParentWidth = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label1'
          Caption = 'Tipo de Operação:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 0
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOOPERACAO'
          DataPipeline = pplAnunciosAbt
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 22754
          mmTop = 0
          mmWidth = 57679
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Data EX:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 86784
          mmTop = 0
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DATAEX'
          DataPipeline = pplAnunciosAbt
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 97896
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Data Prevista:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 132557
          mmTop = 0
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'DATAPREVISTA'
          DataPipeline = pplAnunciosAbt
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 150548
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Data Base:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 2910
          mmLeft = 181769
          mmTop = 0
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'DATABASE'
          DataPipeline = pplAnunciosAbt
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 195527
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppgRodape: TppGroupFooterBand
        AfterPrint = ppgRodapeAfterPrint
        BeforePrint = ppgRodapeBeforePrint
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object shpTotal: TppShape
          OnPrint = shpDetalhePrint
          UserName = 'shpDetalhe1'
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdPrev: TppDBCalc
          UserName = 'dbtTotQtdPrev'
          DataField = 'QTDPREVISTA'
          DataPipeline = pplAnunciosAbt
          DisplayFormat = '###,###,###,###,##0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 178594
          mmTop = 1058
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdRec: TppDBCalc
          UserName = 'dbtTotQtdRec'
          DataField = 'QTDRECEBIDA'
          DataPipeline = pplAnunciosAbt
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 213255
          mmTop = 1058
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdRest: TppDBCalc
          UserName = 'dbtTotQtdRest'
          DataField = 'VALORPREVISTO'
          DataPipeline = pplAnunciosAbt
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 196586
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object dbtTovVlrOper: TppDBCalc
          UserName = 'dbtTovVlrOper'
          DataField = 'VLROPERACAO'
          DataPipeline = pplAnunciosAbt
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 257176
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object pplTotal: TppLine
          UserName = 'lTotal'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 178594
          mmTop = 265
          mmWidth = 105304
          BandType = 5
          GroupNo = 0
        end
        object lblTotais: TppLabel
          UserName = 'Label12'
          Caption = 'Totais'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 151342
          mmTop = 1058
          mmWidth = 7144
          BandType = 5
          GroupNo = 0
        end
        object dbcCount: TppDBCalc
          UserName = 'dbcCount'
          DataPipeline = pplAnunciosAbt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          Visible = False
          DBCalcType = dcCount
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 121444
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object dbtTotQtdCan: TppDBCalc
          UserName = 'dbtTotQtdCan'
          DataField = 'QTDCANCELADA'
          DataPipeline = pplAnunciosAbt
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplAnunciosAbt'
          mmHeight = 2910
          mmLeft = 231246
          mmTop = 1058
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
