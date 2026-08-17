inherited DmRelAtuarial: TDmRelAtuarial
  Left = 209
  Top = 161
  Height = 238
  Caption = 'DmRelAtuarial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qryExemplo: TwwQuery
    SQL.Strings = (
      'SELECT DISTINCT '
      '       HC.DATAMOVCARTINV, '
      '       SALDODIA.VLRMOV, '
      '       HC.HISTMOVCARTINV, '
      '       (0.0) AS VLRINDICE,'
      '       (0.0) AS FATORINDICE,'
      '       (0)   AS DIFDIAS,'
      '       (0)   AS DIFDIASACU,'
      '       (0.0) AS RENTPERIODO,'
      '       (0.0) AS RENTACU,'
      '       (0.0) AS TAXAJUROS,'
      '       (0.0) AS FATORTOTAL,'
      '       (0.0) AS QTDCOTAS,'
      '       (0.0) AS VALORCORRIGIDO,'
      '       HC.TIPMOVCARTINV,'
      '       HC.IDCARTEIRAGERENC,'
      '       HC.IDINVESTIMENTO'
      '       '
      'FROM HISTCARTINV HC,'
      '     (SELECT DATAMOVCARTINV,'
      '             SUM(VLRMOVCARTINV) AS VLRMOV'
      '      FROM HISTCARTINV'
      '      WHERE IDCARTEIRAGERENC IS NULL'
      '        AND IDINVESTIMENTO = 2020'
      '        AND TIPMOVCARTINV IN ('#39'OPE'#39')'
      '      GROUP BY DATAMOVCARTINV'
      '      HAVING SUM(VLRMOVCARTINV) > 0'
      '      ORDER BY DATAMOVCARTINV) SALDODIA'
      ''
      'WHERE HC.IDCARTEIRAGERENC IS NULL'
      '  AND HC.IDINVESTIMENTO = 2020'
      '  AND HC.TIPMOVCARTINV IN ('#39'OPE'#39')'
      '  AND SALDODIA.DATAMOVCARTINV = HC.DATAMOVCARTINV'
      ''
      'ORDER BY HC.DATAMOVCARTINV ')
  end
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object pplAtuarial: TppBDEPipeline
    DataSource = dsAtuarial
    UserName = 'pplAtuarial'
    Left = 157
    Top = 104
    object pplAtuarialppField1: TppField
      FieldAlias = 'DATAMOVCARTINV'
      FieldName = 'DATAMOVCARTINV'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 0
    end
    object pplAtuarialppField2: TppField
      FieldAlias = 'HISTMOVCARTINV'
      FieldName = 'HISTMOVCARTINV'
      FieldLength = 60
      DisplayWidth = 40
      Position = 1
    end
    object pplAtuarialppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOV'
      FieldName = 'VLRMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 2
    end
    object pplAtuarialppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDMOV'
      FieldName = 'QTDMOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 3
    end
    object pplAtuarialppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORINDICE'
      FieldName = 'FATORINDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 4
    end
    object pplAtuarialppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFDIAS'
      FieldName = 'DIFDIAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 5
    end
    object pplAtuarialppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFDIASACU'
      FieldName = 'DIFDIASACU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplAtuarialppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTPERIODO'
      FieldName = 'RENTPERIODO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 7
    end
    object pplAtuarialppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTACU'
      FieldName = 'RENTACU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 8
    end
    object pplAtuarialppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORJUROS'
      FieldName = 'FATORJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 9
    end
    object pplAtuarialppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATORTOTAL'
      FieldName = 'FATORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 10
    end
    object pplAtuarialppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDCOTAS'
      FieldName = 'QTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 24
      Position = 11
    end
    object pplAtuarialppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCORRIGIDO'
      FieldName = 'VALORCORRIGIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 12
    end
    object pplAtuarialppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINDICE'
      FieldName = 'VLRINDICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplAtuarialppField15: TppField
      FieldAlias = 'TIPMOVCARTINV'
      FieldName = 'TIPMOVCARTINV'
      FieldLength = 3
      DisplayWidth = 14
      Position = 14
    end
    object pplAtuarialppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAGERENC'
      FieldName = 'IDCARTEIRAGERENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 15
    end
    object pplAtuarialppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 16
    end
    object pplAtuarialppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTD'
      FieldName = 'QTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplAtuarialppField19: TppField
      FieldAlias = 'NATUREZAOPERACAO'
      FieldName = 'NATUREZAOPERACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object pplAtuarialppField20: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object pplAtuarialppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PU'
      FieldName = 'PU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplAtuarialppField22: TppField
      FieldAlias = 'FLGOPDIREITO'
      FieldName = 'FLGOPDIREITO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
  end
  object dsAtuarial: TwwDataSource
    AutoEdit = False
    DataSet = qryAtuarial
    Left = 95
    Top = 104
  end
  object qryAtuarial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       HC.DATAMOVCARTINV,'
      '       HC.HISTMOVCARTINV,'
      '       NVL(SUM(HC.QTDEMOVINVCART),0) AS QTDMOV,'
      '       SUM(HC.VLRMOVCARTINV)  AS VLRMOV,'
      '       (0.0) AS VLRINDICE,'
      '       (0.0) AS FATORINDICE,'
      '       (0)   AS DIFDIAS,'
      '       (0)   AS DIFDIASACU,'
      '       (0.0) AS RENTPERIODO,'
      '       (0.0) AS RENTACU,'
      '       (0.0) AS FATORJUROS,'
      '       (0.0) AS FATORTOTAL,'
      '       (0.0) AS QTDCOTAS,'
      '       (0.0) AS VALORCORRIGIDO,'
      '       (0.0) AS PU,'
      '       NVL(SALDOQTDDIA.QTD,0) AS QTD,'
      '       HC.TIPMOVCARTINV,'
      '       HC.IDCARTEIRAGERENC,'
      '       HC.IDINVESTIMENTO,'
      '       IV.DESCINVESTIMENTO,'
      '       TP.NATUREZAOPERACAO,'
      '       TP.FLGOPDIREITO'
      ''
      
        'FROM HISTCARTINV HC, EMISSOR EM, INVESTIMENTO IV, TIPOOPERACAO T' +
        'P,'
      ''
      
        '     (SELECT DATAMOVCARTINV, HC.IDINVESTIMENTO, SALDOQTDEINVCART' +
        ' AS QTD'
      '      FROM HISTCARTINV HC'
      '      WHERE IDHISTCARTINV IN (SELECT MAX(IDHISTCARTINV)'
      
        '                              FROM HISTCARTINV HC, EMISSOR EM, I' +
        'NVESTIMENTO IV'
      '                              WHERE HC.IDCARTEIRAGERENC IS NULL'
      ''
      
        '                                AND (((:IDEMISSOR IS NOT NULL) A' +
        'ND (EM.IDEMISSOR = :IDEMISSOR)) OR'
      
        '                                     ((:IDEMISSOR IS NULL)     A' +
        'ND (EM.IDEMISSOR IS NOT NULL)))'
      ''
      
        '                                AND (IV.IDEMISSOR = EM.IDEMISSOR' +
        '(+))'
      ''
      
        '                                AND (((:IDINVESTIMENTO IS NOT NU' +
        'LL) AND (IV.IDINVESTIMENTO = :IDINVESTIMENTO)) OR'
      
        '                                     ((:IDINVESTIMENTO IS NULL) ' +
        '    AND (IV.IDINVESTIMENTO IS NOT NULL)))'
      ''
      
        '                                AND (HC.IDINVESTIMENTO = IV.IDIN' +
        'VESTIMENTO(+))'
      ''
      
        '                                AND (HC.DATAMOVCARTINV >= TO_DAT' +
        'E(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                     HC.DATAMOVCARTINV <= TO_DAT' +
        'E(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      ''
      
        '                              GROUP BY DATAMOVCARTINV)) SALDOQTD' +
        'DIA'
      ''
      ''
      'WHERE HC.IDCARTEIRAGERENC IS NULL'
      
        ' AND (((:IDEMISSOR IS NOT NULL) AND (EM.IDEMISSOR = :IDEMISSOR))' +
        ' OR'
      '      ((:IDEMISSOR IS NULL)     AND (EM.IDEMISSOR IS NOT NULL)))'
      ''
      ' AND  (IV.IDEMISSOR = EM.IDEMISSOR(+))'
      ''
      
        ' AND  (((:IDINVESTIMENTO IS NOT NULL) AND (IV.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR'
      
        '       ((:IDINVESTIMENTO IS NULL)     AND (IV.IDINVESTIMENTO IS ' +
        'NOT NULL)))'
      ''
      ' AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO(+))'
      ''
      ' AND (HC.TIPMOVCARTINV IN ('#39'OPE'#39'))'
      ''
      ' AND (SALDOQTDDIA.DATAMOVCARTINV(+) = HC.DATAMOVCARTINV)'
      ' AND (SALDOQTDDIA.IDINVESTIMENTO(+) = HC.IDINVESTIMENTO)'
      ''
      ' AND (TP.IDTIPOOPERACAO          = HC.IDTIPOOPERACAO)'
      ''
      ' AND (HC.DATAMOVCARTINV >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      '      HC.DATAMOVCARTINV <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      ''
      
        'GROUP BY HC.DATAMOVCARTINV, HC.IDINVESTIMENTO, HC.HISTMOVCARTINV' +
        ','
      '         SALDOQTDDIA.QTD,'
      '         HC.TIPMOVCARTINV,'
      '         HC.IDCARTEIRAGERENC,'
      '         IV.DESCINVESTIMENTO,'
      '         TP.NATUREZAOPERACAO,'
      '         TP.FLGOPDIREITO'
      ''
      'HAVING SUM(HC.VLRMOVCARTINV) > 0'
      ''
      'ORDER BY HC.DATAMOVCARTINV'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updAtuarial
    ValidateWithMask = True
    Left = 34
    Top = 104
    ParamData = <
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
    object qryAtuarialDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryAtuarialHISTMOVCARTINV: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
    object qryAtuarialVLRMOV: TFloatField
      DisplayLabel = 'Valor~Movimentado'
      DisplayWidth = 15
      FieldName = 'VLRMOV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryAtuarialQTDMOV: TFloatField
      DisplayLabel = 'Quantidade~Movimentada'
      DisplayWidth = 15
      FieldName = 'QTDMOV'
      DisplayFormat = '###,###,###,###,###0'
    end
    object qryAtuarialFATORINDICE: TFloatField
      DisplayLabel = 'Fator Índice'
      DisplayWidth = 12
      FieldName = 'FATORINDICE'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialDIFDIAS: TFloatField
      DisplayLabel = 'Dias~ no Período'
      DisplayWidth = 13
      FieldName = 'DIFDIAS'
    end
    object qryAtuarialDIFDIASACU: TFloatField
      DisplayLabel = 'Dias~ Totais'
      DisplayWidth = 10
      FieldName = 'DIFDIASACU'
    end
    object qryAtuarialRENTPERIODO: TFloatField
      DisplayLabel = 'Rentabilidade~no Período'
      DisplayWidth = 16
      FieldName = 'RENTPERIODO'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialRENTACU: TFloatField
      DisplayLabel = 'Rentabilidade~Acumulada'
      DisplayWidth = 16
      FieldName = 'RENTACU'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialFATORJUROS: TFloatField
      DisplayLabel = 'Fator de Juros'
      DisplayWidth = 15
      FieldName = 'FATORJUROS'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialFATORTOTAL: TFloatField
      DisplayLabel = 'Fator de Correção'
      DisplayWidth = 16
      FieldName = 'FATORTOTAL'
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialQTDCOTAS: TFloatField
      DisplayLabel = 'Quantdade de Cotas'
      DisplayWidth = 24
      FieldName = 'QTDCOTAS'
      DisplayFormat = '###,###,##0.00000000'
    end
    object qryAtuarialVALORCORRIGIDO: TFloatField
      DisplayLabel = 'Valor Corrigído'
      DisplayWidth = 17
      FieldName = 'VALORCORRIGIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryAtuarialVLRINDICE: TFloatField
      DisplayLabel = 'Indice'
      DisplayWidth = 10
      FieldName = 'VLRINDICE'
      Visible = False
      DisplayFormat = '###,###,##0.0000'
    end
    object qryAtuarialTIPMOVCARTINV: TStringField
      DisplayWidth = 14
      FieldName = 'TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object qryAtuarialIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryAtuarialIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAtuarialQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTD'
      Visible = False
    end
    object qryAtuarialNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryAtuarialDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryAtuarialPU: TFloatField
      FieldName = 'PU'
      Visible = False
    end
    object qryAtuarialFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object pprAtuarial: TppReport
    AutoStop = False
    DataPipeline = pplAtuarial
    OnStartPage = pprAtuarialStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Análise Atuarial dos Investimentos'
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
    Top = 104
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplAtuarial'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 9260
        mmLeft = 0
        mmTop = 27781
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 33073
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 33073
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Fator Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 127000
        mmTop = 29104
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Quantidade de Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 29104
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 33073
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Acumulados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 33073
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Rentabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 29104
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 33073
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 33073
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Fator de Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 202407
        mmTop = 29104
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Correção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 221986
        mmTop = 33073
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Fator de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 223044
        mmTop = 29104
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 240771
        mmTop = 29104
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'de Cotas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 240242
        mmTop = 33073
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 269346
        mmTop = 29104
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Corrigído'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 265907
        mmTop = 33073
        mmWidth = 17198
        BandType = 0
      end
      object ppPeriodo: TppLabel
        UserName = 'Label20'
        Caption = 'Período 99/99/9999 a  99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 13229
        mmWidth = 53711
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111125
        mmTop = 29104
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 29104
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Movimentado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 85196
        mmTop = 33073
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Movimentada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 33073
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Análise Atuarial dos Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 58738
        BandType = 0
      end
      object ppLabel25: TppLabel
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
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
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
      object ppLabel26: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 271992
        mmTop = 13229
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
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
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = pplAtuarial
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'HISTMOVCARTINV'
        DataPipeline = pplAtuarial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 17992
        mmTop = 0
        mmWidth = 62177
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRMOV'
        DataPipeline = pplAtuarial
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 80433
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FATORINDICE'
        DataPipeline = pplAtuarial
        DisplayFormat = '###,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DIFDIAS'
        DataPipeline = pplAtuarial
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DIFDIASACU'
        DataPipeline = pplAtuarial
        DisplayFormat = '000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RENTPERIODO'
        DataPipeline = pplAtuarial
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 172773
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RENTACU'
        DataPipeline = pplAtuarial
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'FATORJUROS'
        DataPipeline = pplAtuarial
        DisplayFormat = '###,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FATORTOTAL'
        DataPipeline = pplAtuarial
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 220134
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QTDCOTAS'
        DataPipeline = pplAtuarial
        DisplayFormat = '###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VALORCORRIGIDO'
        DataPipeline = pplAtuarial
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 260615
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'QTDMOV'
        DataPipeline = pplAtuarial
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplAtuarial'
        mmHeight = 3175
        mmLeft = 103452
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
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
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3440
        mmWidth = 283634
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
        mmLeft = 257705
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object shpResumo: TppShape
        UserName = 'shpResumo'
        Brush.Color = clSilver
        mmHeight = 6879
        mmLeft = 0
        mmTop = 265
        mmWidth = 284428
        BandType = 7
      end
      object lblValor: TppLabel
        UserName = 'Label19'
        Caption = 'Valor Atuarial: R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 85725
        BandType = 7
      end
      object lblQtdAtual: TppLabel
        UserName = 'lblQtdAtual'
        AutoSize = False
        Caption = 'Quantidade Atual: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 1852
        mmWidth = 99748
        BandType = 7
      end
      object lblPU: TppLabel
        UserName = 'lblPU'
        Caption = 'P.U. Atuarial: R$ '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 191823
        mmTop = 1852
        mmWidth = 91811
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 190500
        mmTop = 529
        mmWidth = 2381
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 88106
        mmTop = 529
        mmWidth = 2381
        BandType = 7
      end
    end
  end
  object updAtuarial: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  VLRMOV = :VLRMOV,'
      '  HISTMOVCARTINV = :HISTMOVCARTINV,'
      '  VLRINDICE = :VLRINDICE,'
      '  FATORINDICE = :FATORINDICE,'
      '  DIFDIAS = :DIFDIAS,'
      '  DIFDIASACU = :DIFDIASACU,'
      '  RENTPERIODO = :RENTPERIODO,'
      '  RENTACU = :RENTACU,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  FATORTOTAL = :FATORTOTAL,'
      '  QTDCOTAS = :QTDCOTAS,'
      '  VALORCORRIGIDO = :VALORCORRIGIDO,'
      '  TIPMOVCARTINV = :TIPMOVCARTINV,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATAMOVCARTINV, VLRMOV, HISTMOVCARTINV, VLRINDICE, FATORINDIC' +
        'E, DIFDIAS, '
      
        '   DIFDIASACU, RENTPERIODO, RENTACU, TAXAJUROS, FATORTOTAL, QTDC' +
        'OTAS, VALORCORRIGIDO, '
      '   TIPMOVCARTINV, IDCARTEIRAGERENC, IDINVESTIMENTO)'
      'values'
      
        '  (:DATAMOVCARTINV, :VLRMOV, :HISTMOVCARTINV, :VLRINDICE, :FATOR' +
        'INDICE, '
      
        '   :DIFDIAS, :DIFDIASACU, :RENTPERIODO, :RENTACU, :TAXAJUROS, :F' +
        'ATORTOTAL, '
      
        '   :QTDCOTAS, :VALORCORRIGIDO, :TIPMOVCARTINV, :IDCARTEIRAGERENC' +
        ', :IDINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 34
    Top = 157
  end
  object wwQuery1: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       HC.DATAMOVCARTINV,'
      '       SALDODIA.VLRMOV,'
      '       HC.HISTMOVCARTINV,'
      '       (0.0) AS VLRINDICE,'
      '       (0.0) AS FATORINDICE,'
      '       (0)   AS DIFDIAS,'
      '       (0)   AS DIFDIASACU,'
      '       (0.0) AS RENTPERIODO,'
      '       (0.0) AS RENTACU,'
      '       (0.0) AS FATORJUROS,'
      '       (0.0) AS FATORTOTAL,'
      '       (0.0) AS QTDCOTAS,'
      '       (0.0) AS VALORCORRIGIDO,'
      '       (0.0) AS PU,'
      '       SALDOQTDDIA.QTD,'
      '       HC.TIPMOVCARTINV,'
      '       HC.IDCARTEIRAGERENC,'
      '       HC.IDINVESTIMENTO,'
      '       IV.DESCINVESTIMENTO,'
      '       TP.NATUREZAOPERACAO,'
      '       TP.FLGOPDIREITO'
      ''
      ''
      
        'FROM HISTCARTINV HC, EMISSOR EM, INVESTIMENTO IV, TIPOOPERACAO T' +
        'P,'
      '     (SELECT HC.DATAMOVCARTINV, HC.IDINVESTIMENTO,'
      '             SUM(HC.VLRMOVCARTINV) AS VLRMOV'
      '      FROM HISTCARTINV HC, EMISSOR EM, INVESTIMENTO IV'
      '      WHERE '
      '           HC.IDCARTEIRAGERENC IS NULL'
      ''
      
        '      AND (((:IDEMISSOR IS NOT NULL) AND (EM.IDEMISSOR = :IDEMIS' +
        'SOR)) OR'
      
        '           ((:IDEMISSOR IS NULL)     AND (EM.IDEMISSOR IS NOT NU' +
        'LL)))'
      ''
      '      AND  (IV.IDEMISSOR = EM.IDEMISSOR(+))'
      ''
      
        '      AND  (((:IDINVESTIMENTO IS NOT NULL) AND (IV.IDINVESTIMENT' +
        'O = :IDINVESTIMENTO)) OR'
      
        '           ((:IDINVESTIMENTO IS NULL)     AND (IV.IDINVESTIMENTO' +
        ' IS NOT NULL)))'
      ''
      '      AND (HC.IDINVESTIMENTO  = IV.IDINVESTIMENTO(+))'
      '      AND (HC.TIPMOVCARTINV IN ('#39'OPE'#39'))'
      
        '      AND (HC.DATAMOVCARTINV BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYY' +
        'Y'#39') AND'
      
        '                                     TO_DATE(:DATAFIM,'#39'DD/MM/YYY' +
        'Y'#39'))'
      '      GROUP BY HC.DATAMOVCARTINV, HC.IDINVESTIMENTO'
      ''
      '      HAVING SUM(HC.VLRMOVCARTINV) > 0'
      '      ORDER BY HC.DATAMOVCARTINV) SALDODIA,'
      ''
      
        '     (SELECT DATAMOVCARTINV, HC.IDINVESTIMENTO, SALDOQTDEINVCART' +
        ' AS QTD'
      '      FROM HISTCARTINV HC'
      '      WHERE IDHISTCARTINV IN (SELECT MAX(IDHISTCARTINV)'
      
        '                              FROM HISTCARTINV HC, EMISSOR EM, I' +
        'NVESTIMENTO IV'
      '                              WHERE HC.IDCARTEIRAGERENC IS NULL'
      ''
      
        '                                AND (((:IDEMISSOR IS NOT NULL) A' +
        'ND (EM.IDEMISSOR = :IDEMISSOR)) OR'
      
        '                                     ((:IDEMISSOR IS NULL)     A' +
        'ND (EM.IDEMISSOR IS NOT NULL)))'
      ''
      
        '                                AND (IV.IDEMISSOR = EM.IDEMISSOR' +
        '(+))'
      ''
      
        '                                AND (((:IDINVESTIMENTO IS NOT NU' +
        'LL) AND (IV.IDINVESTIMENTO = :IDINVESTIMENTO)) OR'
      
        '                                     ((:IDINVESTIMENTO IS NULL) ' +
        '    AND (IV.IDINVESTIMENTO IS NOT NULL)))'
      ''
      
        '                                AND (HC.IDINVESTIMENTO = IV.IDIN' +
        'VESTIMENTO(+))'
      ''
      
        '                                AND (HC.DATAMOVCARTINV BETWEEN T' +
        'O_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                               T' +
        'O_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '                              GROUP BY DATAMOVCARTINV)) SALDOQTD' +
        'DIA'
      ''
      ''
      'WHERE HC.IDCARTEIRAGERENC IS NULL'
      
        ' AND (((:IDEMISSOR IS NOT NULL) AND (EM.IDEMISSOR = :IDEMISSOR))' +
        ' OR'
      '      ((:IDEMISSOR IS NULL)     AND (EM.IDEMISSOR IS NOT NULL)))'
      ''
      ' AND  (IV.IDEMISSOR = EM.IDEMISSOR(+))'
      ''
      
        ' AND  (((:IDINVESTIMENTO IS NOT NULL) AND (IV.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO)) OR'
      
        '       ((:IDINVESTIMENTO IS NULL)     AND (IV.IDINVESTIMENTO IS ' +
        'NOT NULL)))'
      ''
      ' AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO(+))'
      ''
      ' AND (HC.TIPMOVCARTINV IN ('#39'OPE'#39'))'
      ''
      ' AND (SALDODIA.DATAMOVCARTINV    = HC.DATAMOVCARTINV)'
      ' AND (SALDODIA.IDINVESTIMENTO    = HC.IDINVESTIMENTO)'
      ' AND (SALDOQTDDIA.DATAMOVCARTINV = HC.DATAMOVCARTINV(+))'
      ' AND (SALDOQTDDIA.IDINVESTIMENTO = HC.IDINVESTIMENTO(+))'
      ' AND (TP.IDTIPOOPERACAO          = HC.IDTIPOOPERACAO)'
      
        ' AND (HC.DATAMOVCARTINV BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND'
      '                                TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      ''
      'ORDER BY HC.DATAMOVCARTINV'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 122
    Top = 152
    ParamData = <
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
        Value = 2020
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
        Value = '30/04/2002'
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Movimentações'
      DisplayWidth = 15
      FieldName = 'VLRMOV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object StringField1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Fator Indice'
      DisplayWidth = 12
      FieldName = 'FATORINDICE'
      DisplayFormat = '###,###,##0.0000'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Dias no Período'
      DisplayWidth = 13
      FieldName = 'DIFDIAS'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Dias Totais'
      DisplayWidth = 10
      FieldName = 'DIFDIASACU'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Rent. no Período'
      DisplayWidth = 16
      FieldName = 'RENTPERIODO'
      DisplayFormat = '###,###,##0.0000'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'Rent. Acumulada'
      DisplayWidth = 16
      FieldName = 'RENTACU'
      DisplayFormat = '###,###,##0.0000'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Fator de Juros'
      DisplayWidth = 15
      FieldName = 'FATORJUROS'
      DisplayFormat = '###,###,##0.0000'
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Fator de Correção'
      DisplayWidth = 16
      FieldName = 'FATORTOTAL'
      DisplayFormat = '###,###,##0.0000'
    end
    object FloatField9: TFloatField
      DisplayLabel = 'Quant. de Cotas'
      DisplayWidth = 24
      FieldName = 'QTDCOTAS'
      DisplayFormat = '###,###,##0.00000000'
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Valor Corrigido'
      DisplayWidth = 17
      FieldName = 'VALORCORRIGIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Indice'
      DisplayWidth = 10
      FieldName = 'VLRINDICE'
      Visible = False
      DisplayFormat = '###,###,##0.0000'
    end
    object StringField2: TStringField
      DisplayWidth = 14
      FieldName = 'TIPMOVCARTINV'
      Visible = False
      Size = 3
    end
    object FloatField12: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object FloatField13: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField14: TFloatField
      DisplayWidth = 10
      FieldName = 'QTD'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object FloatField15: TFloatField
      FieldName = 'PU'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
