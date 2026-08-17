object DtmConciliaCPMFMT: TDtmConciliaCPMFMT
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object CdsDocs: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end>
    Left = 90
    Top = 7
  end
  object CdsRateioDocs: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'PERCCPMF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end>
    Left = 153
    Top = 2
    object CdsRateioDocsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsRateioDocsCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsRateioDocsCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsRateioDocsIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object CdsRateioDocsVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsRateioDocsVLRPREVISTO: TFloatField
      FieldName = 'VLRPREVISTO'
    end
    object CdsRateioDocsVLREFETIVO: TFloatField
      FieldName = 'VLREFETIVO'
    end
    object CdsRateioDocsRATEIO_DESCRICAORD: TStringField
      FieldName = 'RATEIO_DESCRICAORD'
      Size = 35
    end
    object CdsRateioDocsRATEIO_NOMECC: TStringField
      FieldName = 'RATEIO_NOMECC'
      Size = 30
    end
    object CdsRateioDocsRATEIO_NOMEPRG: TStringField
      FieldName = 'RATEIO_NOMEPRG'
      Size = 60
    end
  end
  object SQLDocsManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO, '
      '   D.NUMAPGR, '
      '   L.DATALANCTO, '
      '   LB.VALOR AS VALOR,'
      '   P.RAZAOSOCIAL, '
      '   LB.NUMLOTEMANUAL AS NUMLOTE, '
      '   D.DATAPROGRAMADA,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L, LANCTODOCUM LB, PESSOA P'
      'WHERE'
      '   LB.NUMLOTEMANUAL = :NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      '   L.ESTORNO IS NULL AND'
      '   D.IDFORCLI = P.IDPESSOA AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   D.CODDOCUMENTO = LB.CODDOCUMENTO AND'
      '   ((RTRIM(LB.OPERACAO) = '#39'5'#39') OR (RTRIM(LB.OPERACAO) = '#39'10'#39'))'
      ' '
      ''
      ''
      ''
      ' ')
    Left = 600
    Top = 128
  end
  object SQLDocsTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT IMP.CODDOCUMENTO,'
      '       0 AS NUMAPGR,'
      '       IMP.DATARETENCAO AS DATALANCTO,'
      '       IMP.VLRRETIDO AS VALOR,'
      '       PES.NOME AS RAZAOSOCIAL,'
      '       IMP.NUMLOTE,'
      '       IMP.DATARETENCAO AS DATAPROGRAMADA,'
      '       '#39'0'#39' AS OPERACAO'
      'FROM'
      '      IMPOSTORETIDO IMP,'
      '      PESSOA PES'
      'WHERE'
      '     IMP.CODDOCUMENTO IS NULL'
      'AND  IMP.NUMLOTEMANUAL = :NUMLOTEMANUAL'
      
        'AND  (:DATAPROGRAMADA IS NULL OR IMP.DATARETENCAO = :DATAPROGRAM' +
        'ADA)'
      'AND  PES.IDPESSOA = IMP.IDFORCLI'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 600
    Top = 72
  end
  object SQLRateioDocsLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   R.CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   SUM((R.VALOR * LX.VALOR/L.VALOR)) AS VALOR,'
      
        '   SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2))/100)' +
        ') AS VLRPREVISTO,'
      
        '   SUM((((R.VALOR * LX.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG,NU' +
        'LL,0,TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLREFETIVO,'
      ''
      '   TIPORECEBDESEMB.DESCRICAO AS RATEIO_DESCRICAORD,'
      '   CENTCUST.NOME AS RATEIO_NOMECC,'
      '   PROGRAMA.DESCPROGRAMA AS RATEIO_NOMEPRG'
      'FROM'
      
        '   RATEIODOCUM R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXATIPOAGR' +
        'EG F,'
      '   DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX,'
      '   TIPORECEBDESEMB, CENTCUST, PROGRAMA'
      'WHERE'
      '   R.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   LX.NUMLOTE = :NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   LX.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '   R.RECPAG = T.RECPAG(+) AND'
      '   R.IDPESSOA = T.IDPESSOA(+) AND'
      ''
      '   R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '   R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '   R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '   R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      '   R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = T.IDEMPRESA(+) AND'
      
        '   DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROGRA' +
        'MA(+),NULL,-1,T.IDPROGRAMA(+)) AND'
      '   T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '   TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '   TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      'GROUP BY'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA' +
        ','
      
        '  TIPORECEBDESEMB.DESCRICAO , CENTCUST.NOME , PROGRAMA.DESCPROGR' +
        'AMA'
      ' '
      ' '
      ' '
      ' ')
    Left = 600
    Top = 304
  end
  object SQLRateioManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA' +
        ','
      '  SUM((R.VALOR * LB.VALOR/L.VALOR)) AS VALOR,'
      
        '  SUM((((R.VALOR * LB.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2))/100))' +
        ' AS VLRPREVISTO,'
      
        '  SUM((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG,NUL' +
        'L,0,TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLREFETIVO,'
      '  TIPORECEBDESEMB.DESCRICAO AS RATEIO_DESCRICAORD,'
      '  CENTCUST.NOME AS RATEIO_NOMECC,'
      '  PROGRAMA.DESCPROGRAMA AS RATEIO_NOMEPRG'
      'FROM'
      
        '   RATEIODOCUM R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXATIPOAGR' +
        'EG F,'
      '   LANCTODOCUM LB, DOCUMENTO D, LANCTODOCUM L,'
      '   TIPORECEBDESEMB, CENTCUST, PROGRAMA'
      'WHERE'
      '   LB.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   LB.NUMLOTEMANUAL =:NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      
        '   ((RTRIM(LB.OPERACAO) = '#39'5'#39') OR (RTRIM(LB.OPERACAO) = '#39'10'#39')) A' +
        'ND'
      '   R.CODDOCUMENTO = LB.CODDOCUMENTO AND'
      '   R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '   R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   R.RECPAG = T.RECPAG(+) AND'
      '   R.IDPESSOA = T.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = T.IDEMPRESA(+) AND'
      ''
      '   R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '   R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '   R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '   R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      
        '   DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROGRA' +
        'MA(+),NULL,-1,T.IDPROGRAMA(+)) AND'
      '   T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '   TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '   TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      'GROUP BY'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, R.CODCENTROCUSTO, R.IDPROGRAMA' +
        ','
      
        '  TIPORECEBDESEMB.DESCRICAO , CENTCUST.NOME , PROGRAMA.DESCPROGR' +
        'AMA'
      ' '
      ' '
      ' '
      ' ')
    Left = 600
    Top = 368
  end
  object SQLRateioManualParc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, CENTCUST.CODEXTERNO AS CODCENT' +
        'ROCUSTO, R.IDPROGRAMA,'
      '  SUM((R.VALOR * LB.VALOR/L.VALOR)) AS VALOR,'
      
        '  SUM((((R.VALOR * LB.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2))/100))' +
        ' AS VLRPREVISTO,'
      
        '  SUM((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG,NUL' +
        'L,0,TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLREFETIVO,'
      '  TIPORECEBDESEMB.DESCRICAO AS RATEIO_DESCRICAORD,'
      '  CENTCUST.NOME AS RATEIO_NOMECC,'
      '  PROGRAMA.DESCPROGRAMA AS RATEIO_NOMEPRG'
      'FROM'
      
        '   VWRATEIOPARCELADO R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXAT' +
        'IPOAGREG F,'
      '   LANCTODOCUM LB, DOCUMENTO D, LANCTODOCUM L,'
      '   TIPORECEBDESEMB, CENTCUST, PROGRAMA'
      'WHERE'
      '   LB.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   LB.NUMLOTEMANUAL =:NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      
        '   ((RTRIM(LB.OPERACAO) = '#39'5'#39') OR (RTRIM(LB.OPERACAO) = '#39'10'#39')) A' +
        'ND'
      '   R.CODDOCUMENTO = LB.CODDOCUMENTO AND'
      '   R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '   R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   R.RECPAG = T.RECPAG(+) AND'
      '   R.IDPESSOA = T.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = T.IDEMPRESA(+) AND'
      ''
      '   R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '   R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '   R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '   R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      
        '   DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROGRA' +
        'MA,NULL,-1,T.IDPROGRAMA) AND'
      '   T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '   TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '   TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      'GROUP BY'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, CENTCUST.CODEXTERNO, R.IDPROGR' +
        'AMA,'
      '  TIPORECEBDESEMB.DESCRICAO,'
      '  CENTCUST.NOME,'
      '  PROGRAMA.DESCPROGRAMA'
      ''
      ''
      ' '
      ' '
      ''
      ' ')
    Left = 602
    Top = 248
  end
  object SQLRateioDocsLoteParc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   CENTCUST.CODEXTERNO AS CODCENTROCUSTO,'
      '   R.IDPROGRAMA,'
      '   SUM((R.VALOR * LX.VALOR/L.VALOR)) AS VALOR,'
      
        '   SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2))/100)' +
        ') AS VLRPREVISTO,'
      
        '   SUM((((R.VALOR * LX.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG,NU' +
        'LL,0,TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLREFETIVO,'
      ''
      '   TIPORECEBDESEMB.DESCRICAO AS RATEIO_DESCRICAORD,'
      '   CENTCUST.NOME AS RATEIO_NOMECC,'
      '   PROGRAMA.DESCPROGRAMA AS RATEIO_NOMEPRG'
      'FROM'
      
        '   VWRATEIOPARCELADO R, TIPRECDESXTIPAGRE T, TIPOAGRE TA, FAIXAT' +
        'IPOAGREG F,'
      '   DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX,'
      '   TIPORECEBDESEMB, CENTCUST, PROGRAMA'
      'WHERE'
      '   R.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   LX.NUMLOTE = :NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   LX.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   R.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '   R.CODTIPRECDES = T.CODTIPRECDES(+) AND'
      '   R.RECPAG = T.RECPAG(+) AND'
      '   R.IDPESSOA = T.IDPESSOA(+) AND'
      ''
      '   R.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      '   R.RECPAG = TIPORECEBDESEMB.RECPAG(+) AND'
      '   R.IDPESSOA = TIPORECEBDESEMB.IDPESSOA(+) AND'
      '   R.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = CENTCUST.IDEMPRESA(+) AND'
      '   R.IDPROGRAMA = PROGRAMA.IDPROGRAMA(+) AND'
      ''
      '   R.CODCENTROCUSTO = T.CODCENTROCUSTO(+) AND'
      '   R.IDEMPRESA = T.IDEMPRESA(+) AND'
      
        '   DECODE(R.IDPROGRAMA,NULL,-1,R.IDPROGRAMA) = DECODE(T.IDPROGRA' +
        'MA(+),NULL,-1,T.IDPROGRAMA(+)) AND'
      '   T.CODTIPOCUSTAGREG = TA.CODTIPOCUSTAGREG(+) AND'
      '   TA.CODTRATFISCE(+) = '#39'B'#39' AND'
      '   TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+)'
      'GROUP BY'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   CENTCUST.CODEXTERNO,'
      '   R.IDPROGRAMA,'
      '   TIPORECEBDESEMB.DESCRICAO,'
      '   CENTCUST.NOME,'
      '   PROGRAMA.DESCPROGRAMA'
      ''
      ''
      ''
      ' ')
    Left = 602
    Top = 184
  end
  object RptConsAnalCpmf: TppReport
    AutoStop = False
    DataPipeline = PpConciliaCpmf
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listagem de CPMF'
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
    Left = 32
    Top = 200
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpConciliaCpmf'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'Funcef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 91281
        mmTop = 1588
        mmWidth = 15875
        BandType = 0
      end
      object MemTituloAnal: TppMemo
        UserName = 'MemTitulo'
        Caption = 'MemTitulo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 529
        mmTop = 8731
        mmWidth = 195527
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel24: TppLabel
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
      object ppSystemVariable3: TppSystemVariable
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
      object ppSystemVariable4: TppSystemVariable
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
      BreakName = 'LOTE_DATARETENCAO'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText26: TppDBText
          UserName = 'RptConciliaCpmfDBText1'
          AutoSize = True
          DataField = 'LOTE_DATARETENCAO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 0
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'RptConciliaCpmfLabel1'
          Caption = 'Data Retenção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          AutoSize = True
          DataField = 'RATEIO_VLREFETIVO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 0
          mmWidth = 45773
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          AutoSize = True
          DataField = 'RATEIO_VLRPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 120386
          mmTop = 0
          mmWidth = 48154
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          AutoSize = True
          DataField = 'RATEIO_VALOR'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 103452
          mmTop = 0
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Sub-total data Retenção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 65881
          mmTop = 0
          mmWidth = 36513
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAPROGRAMADA'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'RptConciliaCpmfGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel22: TppLabel
          UserName = 'RptConciliaCpmfLabel8'
          Caption = 'Valor Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 123031
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'RptConciliaCpmfLabel7'
          Caption = 'CPMF Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 143934
          mmTop = 0
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'RptConciliaCpmfLabel6'
          Caption = 'CPMF Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 174625
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'RptConciliaCpmfLabel9'
          Caption = 'Data Progr.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 20108
          mmTop = 0
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'RptConciliaCpmfLabel5'
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 44979
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'RptConciliaCpmfLabel4'
          Caption = 'Nº Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 0
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          AutoSize = True
          DataField = 'RATEIO_VLREFETIVO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 265
          mmWidth = 45773
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          AutoSize = True
          DataField = 'RATEIO_VLRPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 120386
          mmTop = 265
          mmWidth = 48154
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          AutoSize = True
          DataField = 'RATEIO_VALOR'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 103452
          mmTop = 265
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Sub-total data Programada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 61648
          mmTop = 265
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DOCUMENTO_CODDOCUMENTO'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DOCUMENTO_NUMLOTE'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'GrpCodDocumento'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'RATEIO_VLREFETIVO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 0
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = 'RATEIO_VLRPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 120386
          mmTop = 0
          mmWidth = 48154
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = 'RATEIO_VALOR'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 103452
          mmTop = 0
          mmWidth = 36777
          BandType = 5
          GroupNo = 2
        end
        object ppDBText33: TppDBText
          UserName = 'DBText18'
          DataField = 'DOCUMENTO_NUMLOTE'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 529
          mmTop = 0
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object ppDBText34: TppDBText
          UserName = 'DBText19'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 20108
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 2
        end
        object ppDBText35: TppDBText
          UserName = 'DBText20'
          DataField = 'DOCUMENTO_RAZAOSOCIAL'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 44979
          mmTop = 0
          mmWidth = 57679
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object RptConciliaCpmf: TppReport
    AutoStop = False
    DataPipeline = PpConciliaCpmf
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listagem de CPMF'
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
    Left = 32
    Top = 248
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpConciliaCpmf'
    object HeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object LblEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'Funcef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 90752
        mmTop = 1588
        mmWidth = 16933
        BandType = 0
      end
      object RptConciliaCpmfRegion1: TppRegion
        UserName = 'RptConciliaCpmfRegion1'
        Brush.Style = bsClear
        Pen.Style = psClear
        ShiftRelativeTo = MemTitulo
        Transparent = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object Line1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 15610
          mmWidth = 197380
          BandType = 0
        end
        object RptConciliaCpmfLine1: TppLine
          UserName = 'RptConciliaCpmfLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 20108
          mmWidth = 197380
          BandType = 0
        end
        object RptConciliaCpmfLabel4: TppLabel
          UserName = 'RptConciliaCpmfLabel4'
          Caption = 'Nº Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 15875
          mmWidth = 12171
          BandType = 0
        end
        object RptConciliaCpmfLabel5: TppLabel
          UserName = 'RptConciliaCpmfLabel5'
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 43921
          mmTop = 15874
          mmWidth = 18785
          BandType = 0
        end
        object RptConciliaCpmfLabel6: TppLabel
          UserName = 'RptConciliaCpmfLabel6'
          Caption = 'CPMF Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 174625
          mmTop = 15875
          mmWidth = 22490
          BandType = 0
        end
        object RptConciliaCpmfLabel7: TppLabel
          UserName = 'RptConciliaCpmfLabel7'
          Caption = 'CPMF Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 143934
          mmTop = 15875
          mmWidth = 24606
          BandType = 0
        end
        object RptConciliaCpmfLabel8: TppLabel
          UserName = 'RptConciliaCpmfLabel8'
          Caption = 'Valor Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 123031
          mmTop = 15875
          mmWidth = 17198
          BandType = 0
        end
        object RptConciliaCpmfLabel9: TppLabel
          UserName = 'RptConciliaCpmfLabel9'
          Caption = 'Data Geração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17727
          mmTop = 15875
          mmWidth = 30427
          BandType = 0
        end
      end
      object MemTitulo: TppMemo
        UserName = 'MemTitulo'
        Caption = 'MemTitulo'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 529
        mmTop = 8731
        mmWidth = 195527
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object DetRateio: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'RATEIO_CODTIPRECDES'
        DataPipeline = PpConciliaCpmf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'RATEIO_CODCENTROCUSTO'
        DataPipeline = PpConciliaCpmf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'RATEIO_NOMEPRG'
        DataPipeline = PpConciliaCpmf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 265
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'RATEIO_VALOR'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'RATEIO_VLRPREVISTO'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 265
        mmWidth = 35719
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'RATEIO_VLREFETIVO'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 265
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'RATEIO_DESCRICAORD'
        DataPipeline = PpConciliaCpmf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 265
        mmWidth = 35983
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'RATEIO_NOMECC'
        DataPipeline = PpConciliaCpmf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 76729
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
    end
    object FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Line2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
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
      object Calc2: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3440
        mmWidth = 197380
        BandType = 8
      end
      object Calc1: TppSystemVariable
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
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 60854
        mmTop = 1588
        mmWidth = 7673
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        AutoSize = True
        DataField = 'RATEIO_VLREFETIVO'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 151342
        mmTop = 1588
        mmWidth = 45773
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        AutoSize = True
        DataField = 'RATEIO_VLRPREVISTO'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 1588
        mmWidth = 48154
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        AutoSize = True
        DataField = 'RATEIO_VALOR'
        DataPipeline = PpConciliaCpmf
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpConciliaCpmf'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 1588
        mmWidth = 36777
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5292
        mmWidth = 197300
        BandType = 7
      end
    end
    object RptConciliaCpmfGroup1: TppGroup
      BreakName = 'LOTE_DATARETENCAO'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'RptConciliaCpmfGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object RptConciliaCpmfGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object RptConciliaCpmfDBText1: TppDBText
          UserName = 'RptConciliaCpmfDBText1'
          AutoSize = True
          DataField = 'LOTE_DATARETENCAO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 265
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
        object RptConciliaCpmfLabel1: TppLabel
          UserName = 'RptConciliaCpmfLabel1'
          Caption = 'Data Programada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
      end
      object RptConciliaCpmfGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object GrpNumlote: TppGroup
      BreakName = 'LOTE_NUMLOTE'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'GrpNumlote'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object RptConciliaCpmfDBText2: TppDBText
          UserName = 'RptConciliaCpmfDBText2'
          DataField = 'LOTE_NUMLOTE'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object RptConciliaCpmfDBText3: TppDBText
          UserName = 'RptConciliaCpmfDBText3'
          DataField = 'LOTE_FAVORECIDO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 42863
          mmTop = 0
          mmWidth = 51858
          BandType = 3
          GroupNo = 1
        end
        object RptConciliaCpmfDBText4: TppDBText
          UserName = 'RptConciliaCpmfDBText4'
          AutoSize = True
          DataField = 'LOTE_VALCALCULADO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 157957
          mmTop = 0
          mmWidth = 39158
          BandType = 3
          GroupNo = 1
        end
        object RptConciliaCpmfDBText5: TppDBText
          UserName = 'RptConciliaCpmfDBText5'
          AutoSize = True
          DataField = 'LOTE_VALPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 0
          mmWidth = 35454
          BandType = 3
          GroupNo = 1
        end
        object RptConciliaCpmfDBText6: TppDBText
          UserName = 'RptConciliaCpmfDBText6'
          AutoSize = True
          DataField = 'LOTE_VALORLOTE'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 107950
          mmTop = 0
          mmWidth = 32279
          BandType = 3
          GroupNo = 1
        end
        object RptConciliaCpmfDBText7: TppDBText
          UserName = 'RptConciliaCpmfDBText7'
          DataField = 'LOTE_DATEEMISSAO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 16669
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object RgTituloDocs: TppRegion
          UserName = 'RgTituloDocs'
          Brush.Style = bsClear
          Caption = 'RgTituloDocs'
          ParentWidth = True
          Pen.Style = psClear
          Transparent = True
          mmHeight = 6879
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel6: TppLabel
            UserName = 'Label6'
            Caption = 'AP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 5027
            mmTop = 6085
            mmWidth = 5027
            BandType = 3
            GroupNo = 1
          end
          object ppLabel7: TppLabel
            UserName = 'Label7'
            Caption = 'Data Lancto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 23283
            mmTop = 6085
            mmWidth = 17992
            BandType = 3
            GroupNo = 1
          end
          object ppLabel8: TppLabel
            UserName = 'Label8'
            Caption = 'Favorecido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 50536
            mmTop = 6085
            mmWidth = 25400
            BandType = 3
            GroupNo = 1
          end
          object ppLabel9: TppLabel
            UserName = 'Label9'
            Caption = 'Valor Doc'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 125677
            mmTop = 6085
            mmWidth = 14552
            BandType = 3
            GroupNo = 1
          end
          object ppShape2: TppShape
            UserName = 'Shape2'
            Brush.Style = bsClear
            mmHeight = 4763
            mmLeft = 3969
            mmTop = 5821
            mmWidth = 193940
            BandType = 3
            GroupNo = 1
          end
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object GrpCodDocumento: TppGroup
      BreakName = 'DOCUMENTO_CODDOCUMENTO'
      DataPipeline = PpConciliaCpmf
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'GrpCodDocumento'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpConciliaCpmf'
      object GrDocumento: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'DOCUMENTO_NUMAPGR'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 5027
          mmTop = 0
          mmWidth = 19050
          BandType = 3
          GroupNo = 2
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'DOCUMENTO_DATALANCTO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 24871
          mmTop = 0
          mmWidth = 24342
          BandType = 3
          GroupNo = 2
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'DOCUMENTO_RAZAOSOCIAL'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 4233
          mmLeft = 50271
          mmTop = 0
          mmWidth = 28046
          BandType = 3
          GroupNo = 2
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'DOCUMENTO_VALOR'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 110861
          mmTop = 0
          mmWidth = 29369
          BandType = 3
          GroupNo = 2
        end
        object RgTituloRateio: TppRegion
          UserName = 'RgTituloDocs1'
          Brush.Style = bsClear
          Caption = 'RgTituloDocs'
          ParentWidth = True
          Pen.Style = psClear
          Transparent = True
          mmHeight = 6879
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppShape1: TppShape
            UserName = 'Shape1'
            Brush.Style = bsClear
            mmHeight = 4763
            mmLeft = 8996
            mmTop = 5821
            mmWidth = 188913
            BandType = 3
            GroupNo = 2
          end
          object ppLabel13: TppLabel
            UserName = 'Label13'
            Caption = 'Tipo Desembolso'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 10319
            mmTop = 6086
            mmWidth = 26458
            BandType = 3
            GroupNo = 2
          end
          object ppLabel14: TppLabel
            UserName = 'Label14'
            Caption = 'Centro de Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 60854
            mmTop = 6086
            mmWidth = 38100
            BandType = 3
            GroupNo = 2
          end
          object ppLabel15: TppLabel
            UserName = 'Label15'
            Caption = 'Programa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 101071
            mmTop = 6086
            mmWidth = 20373
            BandType = 3
            GroupNo = 2
          end
          object ppLabel16: TppLabel
            UserName = 'Label101'
            Caption = 'CPMF Prevista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3704
            mmLeft = 146315
            mmTop = 6350
            mmWidth = 22225
            BandType = 3
            GroupNo = 2
          end
          object ppLabel17: TppLabel
            UserName = 'Label17'
            Caption = 'CPMF Efetiva'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3704
            mmLeft = 176742
            mmTop = 6086
            mmWidth = 20373
            BandType = 3
            GroupNo = 2
          end
          object ppLabel12: TppLabel
            UserName = 'Label12'
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 4233
            mmLeft = 127529
            mmTop = 6086
            mmWidth = 12700
            BandType = 3
            GroupNo = 2
          end
        end
        object DbtPrevDoc: TppDBText
          UserName = 'DbtPrevDoc'
          DataField = 'RATEIO_VLRPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 139171
          mmTop = 0
          mmWidth = 29369
          BandType = 3
          GroupNo = 2
        end
        object DbtPrevEfetivo: TppDBText
          UserName = 'DbtPrevEfetivo'
          DataField = 'RATEIO_VLREFETIVO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3969
          mmLeft = 167746
          mmTop = 0
          mmWidth = 29369
          BandType = 3
          GroupNo = 2
        end
      end
      object GfoterDocumento: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object LblTotDoc: TppLabel
          UserName = 'LblTotDoc'
          Caption = 'Total Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 60854
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 2
        end
        object EdtSumEfet: TppDBCalc
          UserName = 'EdtSumEfet'
          AutoSize = True
          DataField = 'RATEIO_VLREFETIVO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = GrpCodDocumento
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 0
          mmWidth = 45773
          BandType = 5
          GroupNo = 2
        end
        object EdtSumPrev: TppDBCalc
          UserName = 'EdtSumPrev'
          AutoSize = True
          DataField = 'RATEIO_VLRPREVISTO'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = GrpCodDocumento
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 120386
          mmTop = 0
          mmWidth = 48154
          BandType = 5
          GroupNo = 2
        end
        object EdtSumValor: TppDBCalc
          UserName = 'EdtSumValor'
          AutoSize = True
          DataField = 'RATEIO_VALOR'
          DataPipeline = PpConciliaCpmf
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = GrpCodDocumento
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3704
          mmLeft = 103452
          mmTop = 0
          mmWidth = 36777
          BandType = 5
          GroupNo = 2
        end
        object LineSum: TppLine
          UserName = 'LineSum'
          Pen.Color = clNavy
          Weight = 0.75
          mmHeight = 265
          mmLeft = 8996
          mmTop = 5821
          mmWidth = 188913
          BandType = 5
          GroupNo = 2
        end
        object EdtDoc: TppDBText
          UserName = 'EdtDoc'
          DataField = 'DOCUMENTO_NUMAPGR'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3440
          mmLeft = 5027
          mmTop = 0
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object EdtData: TppDBText
          UserName = 'EdtData'
          DataField = 'DOCUMENTO_DATALANCTO'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3440
          mmLeft = 24871
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 2
        end
        object EdtRazaoSoc: TppDBText
          UserName = 'DBText201'
          DataField = 'DOCUMENTO_RAZAOSOCIAL'
          DataPipeline = PpConciliaCpmf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'PpConciliaCpmf'
          mmHeight = 3440
          mmLeft = 50271
          mmTop = 0
          mmWidth = 28046
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object PpConciliaCpmf: TppBDEPipeline
    DataSource = DsConciliaCpmf
    SkipWhenNoRecords = False
    UserName = 'PpConciliaCpmf'
    Left = 234
    Top = 177
    object PpConciliaCpmfppField1: TppField
      FieldAlias = 'LOTE_ORIGEM'
      FieldName = 'LOTE_ORIGEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpConciliaCpmfppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_NUMLOTE'
      FieldName = 'LOTE_NUMLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpConciliaCpmfppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_IDFORCLI'
      FieldName = 'LOTE_IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpConciliaCpmfppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_IDPESSOA'
      FieldName = 'LOTE_IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpConciliaCpmfppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_VALCALCULADO'
      FieldName = 'LOTE_VALCALCULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpConciliaCpmfppField6: TppField
      FieldAlias = 'LOTE_DATARETENCAO'
      FieldName = 'LOTE_DATARETENCAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object PpConciliaCpmfppField7: TppField
      FieldAlias = 'LOTE_FLGCONFIRMARECPAG'
      FieldName = 'LOTE_FLGCONFIRMARECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object PpConciliaCpmfppField8: TppField
      FieldAlias = 'LOTE_FAVORECIDO'
      FieldName = 'LOTE_FAVORECIDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object PpConciliaCpmfppField9: TppField
      FieldAlias = 'LOTE_NUMCHQBORDERO'
      FieldName = 'LOTE_NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object PpConciliaCpmfppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_VALORLOTE'
      FieldName = 'LOTE_VALORLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpConciliaCpmfppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_VALPREVISTO'
      FieldName = 'LOTE_VALPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpConciliaCpmfppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'LOTE_VALORAUDITORIA'
      FieldName = 'LOTE_VALORAUDITORIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpConciliaCpmfppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCUMENTO_CODDOCUMENTO'
      FieldName = 'DOCUMENTO_CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object PpConciliaCpmfppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCUMENTO_NUMAPGR'
      FieldName = 'DOCUMENTO_NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object PpConciliaCpmfppField15: TppField
      FieldAlias = 'DOCUMENTO_DATALANCTO'
      FieldName = 'DOCUMENTO_DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object PpConciliaCpmfppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCUMENTO_VALOR'
      FieldName = 'DOCUMENTO_VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object PpConciliaCpmfppField17: TppField
      FieldAlias = 'DOCUMENTO_RAZAOSOCIAL'
      FieldName = 'DOCUMENTO_RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object PpConciliaCpmfppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'DOCUMENTO_NUMLOTE'
      FieldName = 'DOCUMENTO_NUMLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object PpConciliaCpmfppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_IDTIPRECDESXAGRE'
      FieldName = 'RATEIO_IDTIPRECDESXAGRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object PpConciliaCpmfppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_CODDOCUMENTO'
      FieldName = 'RATEIO_CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object PpConciliaCpmfppField21: TppField
      FieldAlias = 'RATEIO_CODTIPRECDES'
      FieldName = 'RATEIO_CODTIPRECDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 20
    end
    object PpConciliaCpmfppField22: TppField
      FieldAlias = 'RATEIO_CODCENTROCUSTO'
      FieldName = 'RATEIO_CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object PpConciliaCpmfppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_IDPROGRAMA'
      FieldName = 'RATEIO_IDPROGRAMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpConciliaCpmfppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_VALOR'
      FieldName = 'RATEIO_VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object PpConciliaCpmfppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_VLRPREVISTO'
      FieldName = 'RATEIO_VLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object PpConciliaCpmfppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATEIO_VLREFETIVO'
      FieldName = 'RATEIO_VLREFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object PpConciliaCpmfppField27: TppField
      FieldAlias = 'LOTE_DATEEMISSAO'
      FieldName = 'LOTE_DATEEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 26
    end
    object PpConciliaCpmfppField28: TppField
      FieldAlias = 'RATEIO_DESCRICAORD'
      FieldName = 'RATEIO_DESCRICAORD'
      FieldLength = 35
      DisplayWidth = 35
      Position = 27
    end
    object PpConciliaCpmfppField29: TppField
      FieldAlias = 'RATEIO_NOMECC'
      FieldName = 'RATEIO_NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 28
    end
    object PpConciliaCpmfppField30: TppField
      FieldAlias = 'RATEIO_NOMEPRG'
      FieldName = 'RATEIO_NOMEPRG'
      FieldLength = 60
      DisplayWidth = 60
      Position = 29
    end
    object PpConciliaCpmfppField31: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 30
    end
  end
  object DsConciliaCpmf: TwwDataSource
    AutoEdit = False
    DataSet = CdsRptConciliaCpmf
    Left = 113
    Top = 129
  end
  object CdsRptConciliaCpmf: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'LOTE_ORIGEM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOTE_NUMLOTE'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_IDFORCLI'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_VALCALCULADO'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_DATARETENCAO'
        DataType = ftDateTime
      end
      item
        Name = 'LOTE_FLGCONFIRMARECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'LOTE_FAVORECIDO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOTE_NUMCHQBORDERO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'LOTE_VALORLOTE'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_VALPREVISTO'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_VALORAUDITORIA'
        DataType = ftFloat
      end
      item
        Name = 'DOCUMENTO_CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'DOCUMENTO_NUMAPGR'
        DataType = ftFloat
      end
      item
        Name = 'DOCUMENTO_DATALANCTO'
        DataType = ftDateTime
      end
      item
        Name = 'DOCUMENTO_VALOR'
        DataType = ftFloat
      end
      item
        Name = 'DOCUMENTO_RAZAOSOCIAL'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DOCUMENTO_NUMLOTE'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_IDTIPRECDESXAGRE'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RATEIO_CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RATEIO_IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_VALOR'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_VLRPREVISTO'
        DataType = ftFloat
      end
      item
        Name = 'RATEIO_VLREFETIVO'
        DataType = ftFloat
      end
      item
        Name = 'LOTE_DATEEMISSAO'
        DataType = ftDateTime
      end
      item
        Name = 'RATEIO_DESCRICAORD'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'RATEIO_NOMECC'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RATEIO_NOMEPRG'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATAPROGRAMADA'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'IDXANALITICO'
        Fields = 
          'LOTE_DATARETENCAO;DATAPROGRAMADA;LOTE_NUMLOTE;DOCUMENTO_CODDOCUM' +
          'ENTO'
      end>
    Params = <>
    StoreDefs = True
    Left = 152
    Top = 145
  end
  object RptSintetico: TppReport
    AutoStop = False
    DataPipeline = PpRptSintetico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Listagem de CPMF'
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
    Left = 228
    Top = 224
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpRptSintetico'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel29: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'Funcef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 91017
        mmTop = 1588
        mmWidth = 16140
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'RptConciliaCpmfRegion1'
        Brush.Style = bsClear
        Pen.Style = psClear
        Transparent = True
        mmHeight = 6615
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLine7: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 15610
          mmWidth = 197380
          BandType = 0
        end
        object ppLine8: TppLine
          UserName = 'RptConciliaCpmfLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 20108
          mmWidth = 197380
          BandType = 0
        end
        object ppLabel30: TppLabel
          UserName = 'RptConciliaCpmfLabel4'
          Caption = 'Nº Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 15875
          mmWidth = 12171
          BandType = 0
        end
        object ppLabel31: TppLabel
          UserName = 'RptConciliaCpmfLabel5'
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 43921
          mmTop = 15875
          mmWidth = 18785
          BandType = 0
        end
        object ppLabel32: TppLabel
          UserName = 'RptConciliaCpmfLabel6'
          Caption = 'CPMF Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 174625
          mmTop = 15875
          mmWidth = 22490
          BandType = 0
        end
        object ppLabel33: TppLabel
          UserName = 'RptConciliaCpmfLabel7'
          Caption = 'CPMF Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 143934
          mmTop = 15875
          mmWidth = 24606
          BandType = 0
        end
        object ppLabel34: TppLabel
          UserName = 'RptConciliaCpmfLabel8'
          Caption = 'Valor Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 123031
          mmTop = 15875
          mmWidth = 17198
          BandType = 0
        end
        object ppLabel35: TppLabel
          UserName = 'RptConciliaCpmfLabel9'
          Caption = 'Data Geração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 17727
          mmTop = 15875
          mmWidth = 22754
          BandType = 0
        end
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Listagem Sintética de Lançamento de CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 53975
        mmTop = 8202
        mmWidth = 89165
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText28: TppDBText
        UserName = 'RptConciliaCpmfDBText2'
        DataField = 'NUMLOTE'
        DataPipeline = PpRptSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 4233
        mmLeft = 794
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'RptConciliaCpmfDBText3'
        DataField = 'FAVORECIDO'
        DataPipeline = PpRptSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 4233
        mmLeft = 43921
        mmTop = 0
        mmWidth = 62971
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'RptConciliaCpmfDBText4'
        AutoSize = True
        DataField = 'VALCALCULADO'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'RptConciliaCpmfDBText5'
        AutoSize = True
        DataField = 'VALPREVISTO'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3969
        mmLeft = 144198
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'RptConciliaCpmfDBText6'
        AutoSize = True
        DataField = 'VALORLOTE'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3969
        mmLeft = 119063
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'RptConciliaCpmfDBText7'
        DataField = 'DATAEMISSAO'
        DataPipeline = PpRptSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel36: TppLabel
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
      object ppSystemVariable5: TppSystemVariable
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
        mmLeft = 0
        mmTop = 3440
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'Label28'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 60854
        mmTop = 1588
        mmWidth = 7673
        BandType = 7
      end
      object ppDBCalc16: TppDBCalc
        UserName = 'DBCalc13'
        AutoSize = True
        DataField = 'VALCALCULADO'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 1588
        mmWidth = 38365
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc14'
        AutoSize = True
        DataField = 'VALPREVISTO'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 1588
        mmWidth = 34396
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc15'
        AutoSize = True
        DataField = 'VALORLOTE'
        DataPipeline = PpRptSintetico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptSintetico'
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 1588
        mmWidth = 31485
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5292
        mmWidth = 197300
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATARETENCAO'
      DataPipeline = PpRptSintetico
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'RptConciliaCpmfGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRptSintetico'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText27: TppDBText
          UserName = 'RptConciliaCpmfDBText1'
          AutoSize = True
          DataField = 'DATARETENCAO'
          DataPipeline = PpRptSintetico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpRptSintetico'
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 265
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'RptConciliaCpmfLabel1'
          Caption = 'Data Programada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object PpRptSintetico: TppBDEPipeline
    DataSource = DsConciliaCpmf
    SkipWhenNoRecords = False
    UserName = 'PpRptSintetico'
    Left = 266
    Top = 224
  end
  object SQLRptConciliaCpmf: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  ('#39'L'#39') AS LOTE_ORIGEM,'
      '  IMPOSTORETIDO.NUMLOTE AS LOTE_NUMLOTE,'
      '  PORTADORFORMA.IDFORCLI AS LOTE_IDFORCLI,'
      '  PORTADORFORMA.IDPESSOA AS LOTE_IDPESSOA,'
      '  IMPOSTORETIDO.VLRRETIDO AS LOTE_VALCALCULADO,'
      '  IMPOSTORETIDO.DATARETENCAO AS LOTE_DATARETENCAO,'
      '  DOCUMENTO.FLGCONFIRMARECPAG AS LOTE_FLGCONFIRMARECPAG,'
      '  LOTEPAGTO.FAVORECIDO AS LOTE_FAVORECIDO,'
      '  LOTEPAGTO.NUMCHQBORDERO AS LOTE_NUMCHQBORDERO,'
      '  LOTEPAGTO.DATAEMISSAO AS LOTE_DATEEMISSAO,'
      '  (0) AS LOTE_VALORLOTE,'
      '  (0) AS LOTE_VALPREVISTO,'
      '  (0) AS LOTE_VALORAUDITORIA,'
      '  DOCUMENTO.CODDOCUMENTO AS DOCUMENTO_CODDOCUMENTO,'
      '  DOCUMENTO.NUMAPGR AS DOCUMENTO_NUMAPGR,'
      '  DOCUMENTO.DATAEMISSAO AS DOCUMENTO_DATALANCTO,'
      '  LOTEXDOCUM.VALOR AS DOCUMENTO_VALOR,'
      '  PESSOA.RAZAOSOCIAL AS DOCUMENTO_RAZAOSOCIAL,'
      '  LOTEXDOCUM.NUMLOTE AS DOCUMENTO_NUMLOTE,'
      '  TIPRECDESXTIPAGRE.IDTIPRECDESXAGRE AS RATEIO_IDTIPRECDESXAGRE,'
      '  RATEIODOCUM.CODDOCUMENTO AS RATEIO_CODDOCUMENTO,'
      '  RATEIODOCUM.CODTIPRECDES AS RATEIO_CODTIPRECDES,'
      '  RATEIODOCUM.CODCENTROCUSTO AS RATEIO_CODCENTROCUSTO,'
      '  RATEIODOCUM.IDPROGRAMA AS RATEIO_IDPROGRAMA,'
      '  RATEIODOCUM.VALOR AS RATEIO_VALOR,'
      '  RATEIODOCUM.VALOR AS RATEIO_VLRPREVISTO,'
      '  RATEIODOCUM.VALOR AS RATEIO_VLREFETIVO,'
      '  TIPORECEBDESEMB.DESCRICAO AS RATEIO_DESCRICAORD,'
      '  CENTCUST.NOME AS RATEIO_NOMECC,'
      '  PROGRAMA.DESCPROGRAMA AS RATEIO_NOMEPRG,'
      '  DOCUMENTO.DATAPROGRAMADA'
      'FROM'
      
        '  DOCUMENTO, LOTEPAGTO, PORTADORFORMA, IMPOSTORETIDO, LOTEXDOCUM' +
        ', PESSOA,'
      
        '  TIPRECDESXTIPAGRE, RATEIODOCUM, TIPORECEBDESEMB, CENTCUST, PRO' +
        'GRAMA'
      'WHERE'
      '  1=2')
    ClientDataSet = CdsRptConciliaCpmf
    Left = 189
    Top = 224
  end
  object CdsResultado: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'ANASINT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODEXTERNO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCPROGRAMA'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DspResultado'
    StoreDefs = True
    ValidateWithMask = True
    Left = 74
    Top = 392
    object CdsResultadoCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASECAPUTIL.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object CdsResultadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASECAPUTIL.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object CdsResultadoANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASECAPUTIL.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
    object CdsResultadoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASECAPUTIL.CENTCUST.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsResultadoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASECAPUTIL.CENTCUST.NOME'
      Size = 30
    end
    object CdsResultadoDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Origin = 'BASECAPUTIL.PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object CdsResultadoCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
  end
  object DsDados: TDataSource
    AutoEdit = False
    DataSet = CdsResultado
    Left = 121
    Top = 296
  end
  object PpDados: TppDBPipeline
    DataSource = DsDados
    CloseDataSource = True
    UserName = 'PpDados'
    Left = 152
    Top = 296
    object PpDadosppField1: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDadosppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDadosppField3: TppField
      FieldAlias = 'ANASINT'
      FieldName = 'ANASINT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDadosppField4: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDadosppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDadosppField6: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDadosppField7: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object RptDados: TppReport
    AutoStop = False
    DataPipeline = PpDados
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
    AllowPrintToFile = True
    DeviceType = 'ReportTextFile'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 189
    Top = 392
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpDados'
    object HbnAuditoria: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 
          'Tipo de Desembolso, Centro de Custo e Programas nao Associados a' +
          ' CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 47096
        mmTop = 4763
        mmWidth = 102923
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 10848
        mmWidth = 45773
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 10848
        mmWidth = 38100
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Programa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 10848
        mmWidth = 20373
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10319
        mmWidth = 197300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 3175
        mmLeft = 0
        mmTop = 12435
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Funcef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 0
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODTIPRECDES'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCRICAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 18256
        mmTop = 265
        mmWidth = 67469
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CODEXTERNO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 265
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCPROGRAMA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 265
        mmWidth = 38100
        BandType = 4
      end
    end
    object FbdAuditoria: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 82021
        mmTop = 1323
        mmWidth = 33073
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 149490
        mmTop = 1323
        mmWidth = 48154
        BandType = 8
      end
    end
  end
  object ExoDados: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 228
    Top = 392
  end
  object SQLTrdxCCxImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  RTRIM(CODTIPRECDES) AS CODTIPRECDES, RTRIM(CODCENTROCUSTO) AS ' +
        'CODCENTROCUSTO, DECODE(IDPROGRAMA,NULL,-1,IDPROGRAMA) AS IDPROGR' +
        'AMA'
      'FROM'
      '  TIPRECDESXTIPAGRE')
    ClientDataSet = CdsTrdxCCxImposto
    Left = 32
    Top = 296
  end
  object SQLResultado: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '   TRD.CODTIPRECDES, TRD.DESCRICAO, TRD.ANASINT, C.CODCENTROCUST' +
        'O, C.CODEXTERNO,  C.NOME, P.DESCPROGRAMA '
      'FROM '
      '   TIPORECEBDESEMB TRD, CENTCUST C, PROGRAMA P'
      'WHERE'
      '   1=2 ')
    ClientDataSet = CdsResultado
    Left = 32
    Top = 392
  end
  object SQLTipoRecebDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TRD.CODTIPRECDES, TRD.DESCRICAO'
      'FROM'
      ' TIPORECEBDESEMB TRD, RATEIODOCUM R'
      'WHERE'
      '    TRD.ANASINT = '#39'A'#39'  AND'
      '    TRD.RECPAG = '#39'P'#39' AND'
      '    R.RECPAG = TRD.RECPAG AND'
      '    R.IDPESSOA = TRD.IDPESSOA AND'
      '    R.CODTIPRECDES = TRD.CODTIPRECDES'
      'ORDER BY'
      '  TRD.CODTIPRECDES, TRD.DESCRICAO'
      ' ')
    ClientDataSet = CdsTipoRecebDesemb
    Left = 74
    Top = 296
  end
  object SQLCCust: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '   RTRIM(C.CODEXTERNO) AS CODCENTROCUSTO, C.NOME'
      ' FROM'
      '   CENTCUST C, (SELECT IDPLANCENTCUST FROM PARAMGLOBAL) P'
      ' WHERE'
      '   C.STATUSGRUPOCDC = '#39'A'#39' AND'
      '   C.ATIVO = '#39'S'#39' AND'
      '   C.IDPLANCENTCUST = P.IDPLANCENTCUST AND'
      '   C.CODCENTROCUSTO IN'
      
        ' (SELECT DISTINCT R.CODCENTROCUSTO FROM RATEIODOCUM R, DOCUMENTO' +
        ' D WHERE'
      '  R.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = '#39'P'#39')'
      ' '
      ' ')
    ClientDataSet = CdsCCust
    Left = 113
    Top = 296
  end
  object SQLPrograma: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA')
    ClientDataSet = CdsPrograma
    Left = 184
    Top = 146
  end
  object CdsTrdxCCxImposto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 344
  end
  object CdsTipoRecebDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 74
    Top = 344
  end
  object CdsCCust: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 344
  end
  object CdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 344
  end
  object SQLUpdFaixaAgreg: TCMSqlParams
    SQL.Strings = (
      
        'update FAIXATIPOAGREG set PERCCUSTAGREG=:PERCCUSTAGREG where NUM' +
        'FAIXA = :NUMFAIXA ')
    Left = 344
    Top = 8
  end
  object SQLValManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VALORLOTE) AS VALORLOTE,'
      '   SUM(VLRPREVISTO) AS VLRPREVISTO,'
      '   SUM(VLRAUDITORIA) AS VLRAUDITORIA'
      'FROM'
      '   ('
      '   SELECT'
      '      SUM(R.VALOR * LB.VALOR/L.VALOR) AS VALORLOTE,'
      
        '      SUM((((R.VALOR * LB.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2)) /' +
        '100)) AS VLRPREVISTO,'
      
        '      SUM((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG' +
        ', NULL, 0, TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLRAUDITORIA'
      '   FROM'
      '      RATEIODOCUM       R,'
      '      TIPRECDESXTIPAGRE T,'
      '      TIPOAGRE          TA,'
      '      FAIXATIPOAGREG    F,'
      '      LANCTODOCUM       LB,'
      '      DOCUMENTO         D,'
      '      LANCTODOCUM       L'
      '   WHERE'
      '          ( LB.NUMLOTEMANUAL     = :NUMLOTE )'
      
        '      AND (( RTRIM(LB.OPERACAO)   = '#39'5'#39' ) OR ( RTRIM(LB.OPERACAO' +
        ')   = '#39'10'#39' ))'
      '      AND ( R.CODDOCUMENTO       = LB.CODDOCUMENTO )'
      '      AND ( R.CODTIPRECDES       = T.CODTIPRECDES(+) )'
      '      AND ( R.CODDOCUMENTO       = D.CODDOCUMENTO )'
      '      AND ( D.CODDOCUMENTO       = L.CODDOCUMENTO )'
      '      AND ( D.OPERACAO           = L.OPERACAO )'
      '      AND ( R.RECPAG             = T.RECPAG(+) )'
      '      AND ( R.IDPESSOA           = T.IDPESSOA(+) )'
      '      AND ( R.CODCENTROCUSTO     = T.CODCENTROCUSTO(+) )'
      '      AND ( R.IDEMPRESA          = T.IDEMPRESA(+) )'
      
        '      AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA) = DECOD' +
        'E(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '      AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+) )'
      '      AND ( TA.CODTRATFISCE(+)   = '#39'B'#39' )'
      '      AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+) )'
      
        '      AND ( (L.DATALANCTO        BETWEEN F.DATAINI AND F.DATAFIM' +
        ') OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      '      SUM(R.VALOR * LB.VALOR/L.VALOR) AS VALORLOTE,'
      
        '      SUM((((R.VALOR * LB.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2)) /' +
        '100)) AS VLRPREVISTO,'
      
        '      SUM((((R.VALOR * LB.VALOR/L.VALOR)* DECODE(F.PERCCUSTAGREG' +
        ',NULL,0,TRUNC(F.PERCCUSTAGREG,2))) /100)) AS VLRAUDITORIA'
      '   FROM'
      '      VWRATEIOPARCELADO R,'
      '      TIPRECDESXTIPAGRE T,'
      '      TIPOAGRE          TA,'
      '      FAIXATIPOAGREG    F,'
      '      LANCTODOCUM       LB,'
      '      DOCUMENTO         D,'
      '      LANCTODOCUM       L'
      '   WHERE'
      '          ( LB.NUMLOTEMANUAL     =:NUMLOTE )'
      
        '      AND (( RTRIM(LB.OPERACAO)   = '#39'5'#39' ) OR ( RTRIM(LB.OPERACAO' +
        ')   = '#39'10'#39' ))'
      '      AND ( R.CODDOCUMENTO       = LB.CODDOCUMENTO )'
      '      AND ( R.CODTIPRECDES       = T.CODTIPRECDES(+) )'
      '      AND ( R.CODDOCUMENTO       = D.CODDOCUMENTO )'
      '      AND ( D.CODDOCUMENTO       = L.CODDOCUMENTO )'
      '      AND ( D.OPERACAO           = L.OPERACAO )'
      '      AND ( R.RECPAG             = T.RECPAG(+) )'
      '      AND ( R.IDPESSOA           = T.IDPESSOA(+) )'
      '      AND ( R.CODCENTROCUSTO     = T.CODCENTROCUSTO(+) )'
      '      AND ( R.IDEMPRESA          = T.IDEMPRESA(+) )'
      
        '      AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA) = DECOD' +
        'E(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '      AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+) )'
      '      AND ( TA.CODTRATFISCE(+)   = '#39'B'#39' )'
      '      AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '      AND ( (L.DATALANCTO        BETWEEN F.DATAINI AND F.DATAFIM' +
        ') OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )'
      '   )'
      ' ')
    ClientDataSet = CdsValManual
    Left = 392
    Top = 56
  end
  object SQLValLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VALORLOTE) AS VALORLOTE,'
      '   SUM(VLRPREVISTO) AS VLRPREVISTO,'
      '   SUM(VLRAUDITORIA) AS VLRAUDITORIA'
      'FROM'
      '   ('
      '   SELECT'
      '      SUM(R.VALOR * LX.VALOR/L.VALOR) AS VALORLOTE,'
      
        '      SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2)) /' +
        '100)) AS VLRPREVISTO,'
      
        '      SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(F.PERCCUSTAGREG' +
        ',2)) /100)) AS VLRAUDITORIA'
      '   FROM'
      '      RATEIODOCUM       R,'
      '      TIPRECDESXTIPAGRE T,'
      '      TIPOAGRE          TA,'
      '      FAIXATIPOAGREG    F,'
      '      DOCUMENTO         D,'
      '      LANCTODOCUM       L,'
      '      LOTEXDOCUM        LX,'
      '      LOTEPAGTO         LP'
      '   WHERE'
      '          ( LX.NUMLOTE           =:NUMLOTE )'
      '      AND ( TA.CODTRATFISCE(+)   = '#39'B'#39' )'
      '      AND ( L.ESTORNO            IS NULL)'
      '      AND ( D.CODDOCUMENTO       = L.CODDOCUMENTO)'
      '      AND ( RTRIM(D.OPERACAO)    = RTRIM(L.OPERACAO))'
      '      AND ( LX.CODDOCUMENTO      = D.CODDOCUMENTO)'
      '      AND ( R.CODDOCUMENTO       = D.CODDOCUMENTO)'
      '      AND ( R.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '      AND ( R.RECPAG             = T.RECPAG(+))'
      '      AND ( R.IDPESSOA           = T.IDPESSOA(+))'
      '      AND ( R.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '      AND ( R.IDEMPRESA          = T.IDEMPRESA(+))'
      
        '-- andre tavares - pendencia 17753 - 22/09/2004 AND ( T.CODTIPOC' +
        'USTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '      AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG)'
      '      AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      '      AND ( LX.NUMLOTE           = LP.NUMLOTE )'
      
        '      AND ( (LP.DATAEMISSAO      BETWEEN F.DATAINI AND F.DATAFIM' +
        ') OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )'
      
        '      AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA ) = DECO' +
        'DE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      ''
      '   UNION ALL'
      ''
      '   SELECT'
      '      SUM(R.VALOR * LX.VALOR/L.VALOR) AS VALORLOTE,'
      
        '      SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(:PERCCPMF,2)) /' +
        '100)) AS VLRPREVISTO,'
      
        '      SUM((((R.VALOR * LX.VALOR/L.VALOR) * TRUNC(F.PERCCUSTAGREG' +
        ',2)) /100)) AS VLRAUDITORIA'
      '   FROM'
      '      VWRATEIOPARCELADO R,'
      '      TIPRECDESXTIPAGRE T,'
      '      TIPOAGRE          TA,'
      '      FAIXATIPOAGREG    F,'
      '      DOCUMENTO         D,'
      '      LANCTODOCUM       L,'
      '      LOTEXDOCUM        LX,'
      '      LOTEPAGTO         LP'
      '   WHERE'
      '          ( LX.NUMLOTE           = :NUMLOTE )'
      '      AND ( TA.CODTRATFISCE(+)   = '#39'B'#39' )'
      '      AND ( L.ESTORNO            IS NULL )'
      '      AND ( D.CODDOCUMENTO       = L.CODDOCUMENTO )'
      '      AND ( RTRIM(D.OPERACAO)    = RTRIM(L.OPERACAO) )'
      '      AND ( LX.CODDOCUMENTO      = D.CODDOCUMENTO )'
      '      AND ( R.CODDOCUMENTO       = D.CODDOCUMENTO )'
      '      AND ( R.CODTIPRECDES       = T.CODTIPRECDES(+) )'
      '      AND ( R.RECPAG             = T.RECPAG(+) )'
      '      AND ( R.IDPESSOA           = T.IDPESSOA(+) )'
      '      AND ( R.CODCENTROCUSTO     = T.CODCENTROCUSTO(+) )'
      '      AND ( R.IDEMPRESA          = T.IDEMPRESA(+) )'
      
        '-- andre tavares - pendencia 17753 - 22/09/2004 AND ( T.CODTIPOC' +
        'USTAGREG   = TA.CODTIPOCUSTAGREG(+) )'
      '      AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG )'
      '      AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+) )'
      '      AND ( LX.NUMLOTE           = LP.NUMLOTE )'
      
        '      AND ( (LP.DATAEMISSAO      BETWEEN F.DATAINI AND F.DATAFIM' +
        ') OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )'
      
        '      AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA) = DECOD' +
        'E(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '   )'
      ' '
      ' ')
    ClientDataSet = CdsValLote
    Left = 400
    Top = 104
  end
  object CdsValManual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 56
  end
  object CdsValLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 104
  end
  object SQLDocs: TCMSqlParams
    ClientDataSet = CdsDocs
    Left = 32
    Top = 8
  end
  object SQLRateioDocs: TCMSqlParams
    ClientDataSet = CdsRateioDocs
    Left = 248
    Top = 10
  end
  object SQLLoteImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  LP.NUMLOTE, LP.DATAEMISSAO, D.OPERACAO, D.IDFORCLI, D.CODDOCUM' +
        'ENTO,'
      '  L.NUMLANCTO, L.DEBCRE, LX.VALOR, LP.CODPORTFORMA, D.CODTIPDOC'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L, LOTEPAGTO LP, LOTEXDOCUM LX'
      'WHERE'
      '  LP.NUMLOTE = :NUMLOTE AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '  D.OPERACAO = L.OPERACAO AND'
      '  L.ESTORNO IS NULL AND'
      '  D.CODDOCUMENTO = LX.CODDOCUMENTO AND'
      '  LX.NUMLOTE = LP.NUMLOTE'
      '')
    ClientDataSet = CdsLoteImposto
    Left = 392
    Top = 152
  end
  object CdsLoteImposto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 152
  end
  object SQLDocsBaixaLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSU' +
        'ARIOINCLUSAO,'
      '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA,'
      
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENT' +
        'O,'
      '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO,'
      '  LANCTODOCUM.VALOR,'
      '  LANCTODOCUM.VALOR AS VALORIMPOSTO,'
      
        '  LANCTODOCUM.VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMEN' +
        'TO.PLACONTA, LANCTODOCUM.DEBCRE,'
      
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOC' +
        'NAB, DOCUMENTO.NOSSONUMERO,'
      '  LANCTODOCUM.VLRLIQUIDO, DOCUMENTO.CODTIPDOC,'
      '  DOCUMENTO.IDMODULO'
      'FROM'
      '  DOCUMENTO,'
      '  PESSOA,'
      '  LANCTODOCUM,'
      '  IMPOSTORETIDO'
      'WHERE'
      '  1=2 AND'
      '  IMPOSTORETIDO.NUMLOTEMANUAL = 48 AND'
      '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND'
      '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND'
      '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND'
      '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO'
      ' '
      ' '
      '')
    ClientDataSet = CdsDocsBaixaLote
    Left = 416
    Top = 200
  end
  object CdsDocsBaixaLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 200
  end
  object CdsVerArredBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 256
  end
  object SQLVerArredBaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DOCUMENTO.CODDOCUMENTO, LANCTODOCUM.NUMLANCTO, DOCUMENTO.IDUSU' +
        'ARIOINCLUSAO,'
      '  PESSOA.RAZAOSOCIAL AS NOME, DOCUMENTO.DATAPROGRAMADA,'
      
        '  DOCUMENTO.IDPESSOA, DOCUMENTO.DATAVENCTO, DOCUMENTO.NODOCUMENT' +
        'O,'
      '  DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO,'
      '  LANCTODOCUM.VALOR,'
      '  LANCTODOCUM.VALOR AS VALORIMPOSTO,'
      
        '  LANCTODOCUM.VALOROUTRAMOEDA, DOCUMENTO.CODCENTROCUSTO, DOCUMEN' +
        'TO.PLACONTA, LANCTODOCUM.DEBCRE,'
      
        '  DOCUMENTO.CODSUBCONTA, DOCUMENTO.IDFORCLI, DOCUMENTO.CODGRUPOC' +
        'NAB, DOCUMENTO.NOSSONUMERO,'
      '  LANCTODOCUM.VLRLIQUIDO, DOCUMENTO.CODTIPDOC'
      'FROM'
      '  DOCUMENTO,'
      '  PESSOA,'
      '  LANCTODOCUM,'
      '  IMPOSTORETIDO'
      'WHERE'
      '  1=2 AND'
      '  IMPOSTORETIDO.NUMLOTEMANUAL = 48 AND'
      '  IMPOSTORETIDO.CODDOCLANCADO = DOCUMENTO.CODDOCUMENTO AND'
      '  DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA AND'
      '  DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND'
      '  DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO'
      ' '
      ' '
      '')
    ClientDataSet = CdsVerArredBaixa
    Left = 392
    Top = 256
  end
  object SQLUpdDocLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DOCUMENTO.CODDOCUMENTO,'
      '  DOCUMENTO.FLGCONFIRMARECPAG,'
      '  DOCUMENTO.DATAVENCTO,'
      '  DOCUMENTO.DATAPROGRAMADA,'
      '  DOCUMENTO.DATAEMISSAO'
      'FROM'
      '  IMPOSTORETIDO, DOCUMENTO, LOTEPAGTO'
      'WHERE'
      '  IMPOSTORETIDO.NUMLOTE =  :NUMLOTE AND'
      '  DOCUMENTO.CODDOCUMENTO = IMPOSTORETIDO.CODDOCLANCADO AND'
      '  LOTEPAGTO.NUMLOTE = IMPOSTORETIDO.NUMLOTE AND'
      
        '  ((LOTEPAGTO.FLAGEMISSAO  <> '#39'C'#39' AND LOTEPAGTO.FLAGEMISSAO  <> ' +
        #39'B'#39') OR'
      '    LOTEPAGTO.FLAGEMISSAO  IS NULL)')
    ClientDataSet = CdsUpdDocLote
    Left = 392
    Top = 304
  end
  object SQLExecUpdDocLote: TCMSqlParams
    SQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  FLGCONFIRMARECPAG = :FLGCONFIRMARECPAG,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  DATAEMISSAO = :DATAEMISSAO'
      'where'
      '  CODDOCUMENTO = :CODDOCUMENTO')
    Left = 496
    Top = 304
  end
  object CdsUpdDocLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 304
  end
  object SQLExecUpdDocManual: TCMSqlParams
    SQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  FLGCONFIRMARECPAG = :FLGCONFIRMARECPAG,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA'
      'where'
      '  CODDOCUMENTO = :CODDOCUMENTO')
    Left = 608
    Top = 432
  end
  object SQLUpdDocManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DOCUMENTO.CODDOCUMENTO,'
      '  DOCUMENTO.FLGCONFIRMARECPAG,'
      '  DOCUMENTO.DATAVENCTO,'
      '  DOCUMENTO.DATAPROGRAMADA,'
      '  DOCUMENTO.DATAEMISSAO'
      'FROM'
      '  IMPOSTORETIDO, DOCUMENTO, LANCTODOCUM'
      'WHERE'
      '  IMPOSTORETIDO.NUMLOTEMANUAL =  :NUMLOTEMANUAL AND'
      '  DOCUMENTO.CODDOCUMENTO = IMPOSTORETIDO.CODDOCLANCADO AND'
      '  LANCTODOCUM.NUMLOTEMANUAL = IMPOSTORETIDO.NUMLOTEMANUAL AND'
      '  LANCTODOCUM.ESTORNO IS NULL')
    ClientDataSet = CdsUpdDocManual
    Left = 464
    Top = 360
  end
  object CdsUpdDocManual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 352
  end
  object SQLUpdImpostoManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IMPOSTORETIDO.DATARETENCAO,'
      '  IMPOSTORETIDO.IDIMPOSTORETIDO,'
      '  IMPOSTORETIDO.CODDOCUMENTO'
      ''
      'FROM'
      '  IMPOSTORETIDO, LANCTODOCUM, DOCUMENTO'
      ''
      'WHERE'
      '  IMPOSTORETIDO.NUMLOTEMANUAL =  :NUMLOTE  AND'
      '  RTRIM(DOCUMENTO.STATUS) = '#39'2'#39' AND'
      '  IMPOSTORETIDO.NUMLOTEMANUAL = LANCTODOCUM.NUMLOTEMANUAL AND'
      '  LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      ' ')
    ClientDataSet = CdsUpdImpostoManual
    Left = 408
    Top = 472
  end
  object ExecUpdImpostoManual: TCMSqlParams
    SQL.Strings = (
      'update IMPOSTORETIDO'
      'set'
      '  DATARETENCAO = :DATARETENCAO'
      'where'
      '  IDIMPOSTORETIDO = :IDIMPOSTORETIDO')
    Left = 488
    Top = 432
  end
  object CdsUpdImpostoManual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 400
  end
  object ExecUpdImposto: TCMSqlParams
    SQL.Strings = (
      'update IMPOSTORETIDO'
      'set'
      '  DATARETENCAO = :DATARETENCAO'
      'where'
      '  IDIMPOSTORETIDO = :IDIMPOSTORETIDO')
    Left = 488
    Top = 408
  end
  object SQLUpdImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IMPOSTORETIDO.DATARETENCAO,'
      '  IMPOSTORETIDO.IDIMPOSTORETIDO,'
      '  IMPOSTORETIDO.CODDOCUMENTO'
      'FROM'
      '  IMPOSTORETIDO, LOTEPAGTO'
      'WHERE'
      '  IMPOSTORETIDO.NUMLOTE =  :NUMLOTE AND'
      '  LOTEPAGTO.NUMLOTE = IMPOSTORETIDO.NUMLOTE AND'
      
        '  ((LOTEPAGTO.FLAGEMISSAO  <> '#39'C'#39' AND LOTEPAGTO.FLAGEMISSAO  <> ' +
        #39'B'#39') OR'
      '    LOTEPAGTO.FLAGEMISSAO  IS NULL)'
      ' ')
    ClientDataSet = CdsUpdImposto
    Left = 392
    Top = 392
  end
  object CdsUpdImposto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 448
  end
  object sqlDocsLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   L.DATALANCTO,'
      '   LX.VALOR AS VALOR,'
      '   P.RAZAOSOCIAL,'
      '   LX.NUMLOTE,'
      '   D.DATAPROGRAMADA,'
      '   D.OPERACAO'
      'FROM'
      '   DOCUMENTO D, LANCTODOCUM L, LOTEXDOCUM LX, PESSOA P'
      'WHERE'
      '   LX.NUMLOTE = :NUMLOTE AND'
      
        '   (:DATAPROGRAMADA IS NULL OR D.DATAPROGRAMADA = :DATAPROGRAMAD' +
        'A) AND'
      '   L.ESTORNO IS NULL AND'
      '   D.IDFORCLI = P.IDPESSOA AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO AND'
      '   D.CODDOCUMENTO = LX.CODDOCUMENTO'
      ''
      ''
      ''
      ''
      '')
    Left = 592
    Top = 16
  end
end
