inherited DmRelSldQtdCotasInteg: TDmRelSldQtdCotasInteg
  Left = 393
  Top = 225
  Width = 522
  Height = 300
  Caption = 'DmRelSldQtdCotasInteg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 174
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
    Left = 112
  end
  inherited qryExemplo: TwwQuery
    Left = 43
  end
  inherited rpExemplo: TppReport
    Left = 283
    DataPipelineName = 'pplExemplo'
  end
  object pplSldQtdCotasInteg: TppBDEPipeline
    DataSource = DsSldQtdCotasInteg
    UserName = 'pplSldQtdCotasInteg'
    Left = 206
    Top = 68
  end
  object DsSldQtdCotasInteg: TwwDataSource
    DataSet = QrySldQtdCotasInteg
    Left = 136
    Top = 68
  end
  object QrySldQtdCotasInteg: TwwQuery
    CachedUpdates = True
    AfterScroll = QrySldQtdCotasIntegAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ID,'
      '  PLANPRVCONTABPATRO,'
      '  DESCFUNDOINVEST,'
      '  DESCTIPOFUNDOINV,'
      '  SUM(QTDHISTCOTAINTEGR) AS QTDHISTCOTAINTEGR ,'
      '  SUM(VLRHISTCOTAINTEGR) AS VLRHISTCOTAINTEGR ,'
      '  SUM(VLRVARIACAODIA) AS VLRVARIACAODIA'
      'FROM'
      '(SELECT'
      
        '    TF.IDTIPOINVEST||PL.IDPLANPREVCTBPATR||FI.IDFUNDOINVEST||TF.' +
        'IDTIPOFUNDOINVEST AS ID,'
      
        '    FI.DESCFUNDOINVEST,   HC.QTDHISTCOTAINTEGR, HC.DATAAPLICACAO' +
        ', HC.DATAHISTCOTAINTEG,'
      
        '    HC.VLRCOTAINTEGR,     HC.VLRHISTCOTAINTEGR, VAR.VLRVARIACAOD' +
        'IA, TC.DESCTIPOCOTA,'
      
        '    FI.QTDDECQTD,         FI.QTDDECVALOR      , PL.PLANPRVCONTAB' +
        'PATRO,'
      '    TF.DESCTIPOFUNDOINV'
      'FROM'
      '    HISTCOTAINTEGRALIZA HC,'
      ''
      
        '   (SELECT HC2.IDTIPOINVEST, HC2.IDPLANPREVCTBPATR, HC2.IDFUNDOI' +
        'NVEST, HC2.IDTIPOCOTA,'
      
        '           HC2.IDOPERACAOFUNDO,  SUM(HC2.VLRVARIACAODIA) AS VLRV' +
        'ARIACAODIA'
      '    FROM   HISTCOTAINTEGRALIZA HC2,'
      '          (SELECT IDFUNDOINVEST'
      '           FROM FUNDOINVEST'
      '           WHERE'
      
        '            (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFUNDOI' +
        'NVEST =:IDTIPOFUNDOINVEST)) OR'
      '              (:IDTIPOFUNDOINVEST IS NULL)) ) FI2'
      '    WHERE'
      '        (HC2.IDTIPOINVEST       =:IDTIPOINVEST)'
      
        '    AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HC2.IDPLANPREVC' +
        'TBPATR =:IDPLANPREVCTBPATR)) OR'
      '           (:IDPLANPREVCTBPATR IS NULL))'
      '    AND ((HC2.IDFUNDOINVEST||HC2.DATAHISTCOTAINTEG) IN'
      '       (SELECT (HC1.IDFUNDOINVEST||MAX(HC1.DATAHISTCOTAINTEG))'
      '        FROM   HISTCOTAINTEGRALIZA HC1,'
      '              (SELECT IDFUNDOINVEST'
      '               FROM FUNDOINVEST'
      '               WHERE'
      
        '                (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFU' +
        'NDOINVEST =:IDTIPOFUNDOINVEST)) OR'
      '                  (:IDTIPOFUNDOINVEST IS NULL)) ) FI1'
      '        WHERE'
      '            (HC1.IDTIPOINVEST       =:IDTIPOINVEST)'
      
        '        AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HC1.IDPLANP' +
        'REVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      '               (:IDPLANPREVCTBPATR IS NULL))'
      
        '        AND  (((:IDFUNDOINVEST IS NOT NULL)     AND (HC1.IDFUNDO' +
        'INVEST =:IDFUNDOINVEST)) OR'
      '               (:IDFUNDOINVEST IS NULL))'
      
        '        AND (HC1.DATAHISTCOTAINTEG  = TO_DATE(:DATAHISTCOTAINTEG' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '        AND  (((:IDTIPOCOTA IS NOT NULL)        AND (HC1.IDTIPOC' +
        'OTA    =:IDTIPOCOTA))    OR'
      '               (:IDTIPOCOTA IS NULL))'
      '        AND (FI1.IDFUNDOINVEST      = HC1.IDFUNDOINVEST)'
      
        '        GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANPREVCTBPATR, HC1.ID' +
        'FUNDOINVEST, HC1.DATAAPLICACAO, HC1.IDTIPOCOTA))'
      ''
      '    AND (FI2.IDFUNDOINVEST          = HC2.IDFUNDOINVEST)'
      ''
      
        '    GROUP BY HC2.IDTIPOINVEST, HC2.IDPLANPREVCTBPATR, HC2.IDFUND' +
        'OINVEST, HC2.DATAAPLICACAO, HC2.IDTIPOCOTA, HC2.IDOPERACAOFUNDO)' +
        ' VAR,'
      ''
      ''
      
        '   (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST, QT' +
        'DDECQTD, QTDDECVALOR'
      '    FROM HISTFUNDOINVEST'
      
        '    WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN'
      
        '               (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (HF.DTAVIGENCIA < TO_DATE(:DATAHISTCOTAINTEG' +
        ','#39'DD/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      '                GROUP BY IDFUNDOINVEST))) FI,'
      ''
      
        '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS ' +
        'PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL,'
      ''
      '    TIPOFUNDOINVEST TF, TIPOCOTA TC'
      ''
      'WHERE'
      '    (HC.IDHISTCOTAINTEGR IN (SELECT MAX(HC1.IDHISTCOTAINTEGR)'
      '                             FROM   HISTCOTAINTEGRALIZA HC1,'
      '                                   (SELECT IDFUNDOINVEST'
      '                                    FROM FUNDOINVEST'
      '                                    WHERE'
      
        '                                     (((:IDTIPOFUNDOINVEST IS NO' +
        'T NULL) AND (IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST)) OR'
      
        '                                       (:IDTIPOFUNDOINVEST IS NU' +
        'LL)) ) FI1'
      '                             WHERE'
      
        '                                 (HC1.IDTIPOINVEST       =:IDTIP' +
        'OINVEST)'
      
        '                             AND  (((:IDPLANPREVCTBPATR IS NOT N' +
        'ULL) AND (HC1.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      
        '                                    (:IDPLANPREVCTBPATR IS NULL)' +
        ')'
      
        '                             AND  (((:IDFUNDOINVEST IS NOT NULL)' +
        '     AND (HC1.IDFUNDOINVEST =:IDFUNDOINVEST)) OR'
      '                                    (:IDFUNDOINVEST IS NULL))'
      
        '                             AND (HC1.DATAHISTCOTAINTEG  = TO_DA' +
        'TE(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND  (((:IDTIPOCOTA IS NOT NULL)   ' +
        '     AND (HC1.IDTIPOCOTA    =:IDTIPOCOTA))    OR'
      '                                    (:IDTIPOCOTA IS NULL))'
      
        '                             AND (FI1.IDFUNDOINVEST      = HC1.I' +
        'DFUNDOINVEST)'
      
        '                             GROUP BY HC1.IDTIPOINVEST, HC1.IDPL' +
        'ANPREVCTBPATR, HC1.IDFUNDOINVEST,'
      
        '                                      HC1.DATAAPLICACAO, HC1.IDT' +
        'IPOCOTA))'
      'AND (HC.QTDHISTCOTAINTEGR  > 0)'
      'AND (FI.IDFUNDOINVEST      = HC.IDFUNDOINVEST)'
      'AND (TF.IDTIPOFUNDOINVEST  = FI.IDTIPOFUNDOINVEST)'
      'AND (TC.IDTIPOCOTA(+)      = NVL(HC.IDTIPOCOTA,0))'
      'AND (HC.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR)'
      'AND (VAR.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR)'
      'AND (VAR.IDFUNDOINVEST     = HC.IDFUNDOINVEST)'
      'AND (NVL(VAR.IDTIPOCOTA,0) = NVL(HC.IDTIPOCOTA,0))'
      'AND (VAR.IDOPERACAOFUNDO   = HC.IDOPERACAOFUNDO)'
      ''
      
        'ORDER BY TF.DESCTIPOFUNDOINV, PL.PLANPRVCONTABPATRO, FI.DESCFUND' +
        'OINVEST,'
      '         HC.DATAHISTCOTAINTEG, HC.DATAAPLICACAO, TC.DESCTIPOCOTA'
      ')'
      ''
      
        'GROUP BY ID, PLANPRVCONTABPATRO, DESCFUNDOINVEST, DESCTIPOFUNDOI' +
        'NV'
      ''
      'ORDER BY DESCTIPOFUNDOINV, PLANPRVCONTABPATRO, DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 43
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
    object QrySldQtdCotasIntegID: TStringField
      DisplayWidth = 120
      FieldName = 'ID'
      Size = 120
    end
    object QrySldQtdCotasIntegDESCFUNDOINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySldQtdCotasIntegQTDHISTCOTAINTEGR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDHISTCOTAINTEGR'
    end
    object QrySldQtdCotasIntegVLRHISTCOTAINTEGR: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRHISTCOTAINTEGR'
    end
    object QrySldQtdCotasIntegVLRVARIACAODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRVARIACAODIA'
    end
    object QrySldQtdCotasIntegPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QrySldQtdCotasIntegDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
  end
  object rpSldQtdCotasIntegX: TppReport
    AutoStop = False
    DataPipeline = pplSldQtdCotasInteg
    OnStartPage = rpSldQtdCotasIntegXStartPage
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
    Left = 387
    Top = 20
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSldQtdCotasInteg'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo da Quantidade de Cotas a Integralizar - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 76623
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
      object lblPeriodoRefx: TppLabel
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
      object ppShape2: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        Caption = 'Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21696
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Quantidade a Integralizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 21696
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label3'
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 106627
        mmTop = 21696
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label4'
        Caption = 'Data da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label5'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 21696
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 21696
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label7'
        Caption = 'Variação do Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 262996
        mmTop = 21696
        mmWidth = 20638
        BandType = 0
      end
      object ppTipoCota: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 184944
        mmTop = 21696
        mmWidth = 23283
        BandType = 0
      end
      object pplPlanox: TppLabel
        UserName = 'Label9'
        Caption = 'Label9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 234421
        mmTop = 8202
        mmWidth = 49213
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 8467
        mmWidth = 88900
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDbQtd: TppDBText
        UserName = 'DbQtd'
        DataField = 'QTDHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 1058
        mmWidth = 36513
        BandType = 4
      end
      object ppDbDtaFlx: TppDBText
        UserName = 'DbDtaFlx'
        DataField = 'DATAAPLICACAO'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDbDtaCta: TppDBText
        UserName = 'DbDtaCta'
        DataField = 'DATAHISTCOTAINTEG'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDbVlrCta: TppDBText
        UserName = 'DbVlrCta'
        DataField = 'VLRCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 145786
        mmTop = 1058
        mmWidth = 35719
        BandType = 4
      end
      object ppDbVlrAtu: TppDBText
        UserName = 'DbVlrAtu'
        DataField = 'VLRHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 1058
        mmWidth = 33338
        BandType = 4
      end
      object ppDbVarDia: TppDBText
        UserName = 'DbVarDia'
        DataField = 'VLRVARIACAODIA'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 259557
        mmTop = 1058
        mmWidth = 24077
        BandType = 4
      end
      object ppDbTipoCota: TppDBText
        UserName = 'DbTipoCota'
        DataField = 'DESCTIPOCOTA'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 184944
        mmTop = 1058
        mmWidth = 40217
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object DbVarTotal: TppDBCalc
        UserName = 'DbVarTotal'
        DataField = 'VLRVARIACAODIA'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 259557
        mmTop = 4498
        mmWidth = 24077
        BandType = 7
      end
      object DbVlrTotal: TppDBCalc
        UserName = 'DbVlrAtu1'
        DataField = 'VLRHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 225690
        mmTop = 4498
        mmWidth = 33338
        BandType = 7
      end
      object dbQtdTotal: TppDBCalc
        UserName = 'dbQtdTotal'
        DataField = 'QTDHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 4498
        mmWidth = 45508
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284300
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 8731
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 4498
        mmWidth = 19812
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = pplSldQtdCotasInteg
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplSldQtdCotasInteg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText29: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplSldQtdCotasInteg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object pplSomatorio: TppLine
          UserName = 'lSomatorio'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object dbcVar: TppDBCalc
          UserName = 'dbcVar'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 259557
          mmTop = 6085
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object dbcVlrAtu: TppDBCalc
          UserName = 'dbcVlrAtu'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 225690
          mmTop = 6085
          mmWidth = 33338
          BandType = 5
          GroupNo = 1
        end
        object dbcQtd: TppDBCalc
          UserName = 'dbcQtd'
          OnGetText = dbcQtdGetText
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 57150
          mmTop = 6085
          mmWidth = 46302
          BandType = 5
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label10'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3302
          mmLeft = 2910
          mmTop = 6085
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'lSomatorio1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplSldQtdCotasInteg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppDbFundos: TppDBText
          UserName = 'DbFundos'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = pplSldQtdCotasInteg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 265
          mmWidth = 101336
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand3AfterGenerate
        BeforePrint = ppGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'lSomatorio2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 57150
          mmTop = 1323
          mmWidth = 46302
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 225690
          mmTop = 1323
          mmWidth = 33338
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 259557
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label12'
          Caption = 'Total do Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3302
          mmLeft = 2910
          mmTop = 1323
          mmWidth = 20066
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object rpSldQtdCotasIntegXX: TppReport
    AutoStop = False
    DataPipeline = pplSldQtdCotasInteg
    OnStartPage = rpSldQtdCotasIntegXStartPage
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
    Left = 395
    Top = 108
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSldQtdCotasInteg'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo da Quantidade de Cotas a Integralizar - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 76623
        BandType = 0
      end
      object ppLabel15: TppLabel
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
      object ppDBImage2: TppDBImage
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
      object ppLabel16: TppLabel
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
      object ppShape1: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label1'
        Caption = 'Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21696
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label2'
        Caption = 'Quantidade a Integralizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 21696
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label3'
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 106627
        mmTop = 21696
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label4'
        Caption = 'Data da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label5'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 21696
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 21696
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label7'
        Caption = 'Variação do Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 262996
        mmTop = 21696
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 184944
        mmTop = 21696
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        Caption = 'Label9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 234421
        mmTop = 8202
        mmWidth = 49213
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplSldQtdCotasIntegAn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasIntegAn'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 8467
        mmWidth = 88900
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DbFundos1'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 529
        mmWidth = 101336
        BandType = 4
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplSldQtdCotasIntegAn'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 7144
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = pplSldQtdCotasIntegAn
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplSldQtdCotasIntegAn'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'shpConsRentFndCab1'
              Brush.Color = clSilver
              mmHeight = 5027
              mmLeft = 51858
              mmTop = 1585
              mmWidth = 232569
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'Quantidade a Integralizar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 67998
              mmTop = 2646
              mmWidth = 35983
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Data Inicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 107156
              mmTop = 2381
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'Data da Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 125942
              mmTop = 2381
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'Valor da Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 161132
              mmTop = 2646
              mmWidth = 20902
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'Tipo de Cota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 185473
              mmTop = 2381
              mmWidth = 23283
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'Valor Atualizado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 235744
              mmTop = 2646
              mmWidth = 23813
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'Variação do Dia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 262467
              mmTop = 2646
              mmWidth = 20638
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              mmHeight = 6879
              mmLeft = 51858
              mmTop = 0
              mmWidth = 232569
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DbQtd1'
              DataField = 'QTDHISTCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '###,#0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 67469
              mmTop = 1588
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DbDtaFlx1'
              DataField = 'DATAAPLICACAO'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 107156
              mmTop = 1588
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DbDtaCta1'
              DataField = 'DATAHISTCOTAINTEG'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 125942
              mmTop = 1588
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DbVlrCta1'
              DataField = 'VLRCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '###,#0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 146315
              mmTop = 1588
              mmWidth = 35719
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DbVlrAtu2'
              DataField = 'VLRHISTCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 226219
              mmTop = 1588
              mmWidth = 33338
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DbVarDia1'
              DataField = 'VLRVARIACAODIA'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 259028
              mmTop = 1588
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DbTipoCota1'
              DataField = 'DESCTIPOCOTA'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 185473
              mmTop = 1588
              mmWidth = 40217
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
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
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel26: TppLabel
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
        mmWidth = 284163
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DbVarTotal'
        DataField = 'VLRVARIACAODIA'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 259557
        mmTop = 4498
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DbVlrAtu1'
        DataField = 'VLRHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 225690
        mmTop = 4498
        mmWidth = 33338
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'dbQtdTotal'
        DataField = 'QTDHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 4498
        mmWidth = 45508
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284300
        BandType = 7
      end
      object ppLine10: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 8731
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label13'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 4498
        mmWidth = 19812
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = pplSldQtdCotasInteg
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplSldQtdCotasInteg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplSldQtdCotasIntegAn
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasIntegAn'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine11: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine12: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object ppLine13: TppLine
          UserName = 'lSomatorio'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'dbcVar'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 259557
          mmTop = 6085
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'dbcVlrAtu'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 225690
          mmTop = 6085
          mmWidth = 33338
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'dbcQtd'
          OnGetText = dbcQtdGetText
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 67204
          mmTop = 6085
          mmWidth = 36513
          BandType = 5
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label10'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3302
          mmLeft = 2910
          mmTop = 6085
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppLine14: TppLine
          UserName = 'lSomatorio1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplSldQtdCotasInteg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand3AfterGenerate
        BeforePrint = ppGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLine15: TppLine
          UserName = 'lSomatorio2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label12'
          Caption = 'Total do Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3387
          mmLeft = 67204
          mmTop = 1323
          mmWidth = 36513
          BandType = 5
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3440
          mmLeft = 225690
          mmTop = 1323
          mmWidth = 33338
          BandType = 5
          GroupNo = 2
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3440
          mmLeft = 259558
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object pplSldQtdCotasIntegAn: TppBDEPipeline
    DataSource = DsSldQtdCotasIntegAn
    UserName = 'pplSldQtdCotasIntegAn'
    Left = 310
    Top = 186
    object pplSldQtdCotasIntegAnppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 25
      Position = 0
    end
    object pplSldQtdCotasIntegAnppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 30
      Position = 1
    end
    object pplSldQtdCotasIntegAnppField3: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 11
      Position = 2
    end
    object pplSldQtdCotasIntegAnppField4: TppField
      FieldAlias = 'DATAHISTCOTAINTEG'
      FieldName = 'DATAHISTCOTAINTEG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 3
    end
    object pplSldQtdCotasIntegAnppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDHISTCOTAINTEGR'
      FieldName = 'QTDHISTCOTAINTEGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 26
      Position = 4
    end
    object pplSldQtdCotasIntegAnppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAINTEGR'
      FieldName = 'VLRCOTAINTEGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 5
    end
    object pplSldQtdCotasIntegAnppField7: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 20
      Position = 6
    end
    object pplSldQtdCotasIntegAnppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRHISTCOTAINTEGR'
      FieldName = 'VLRHISTCOTAINTEGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 7
    end
    object pplSldQtdCotasIntegAnppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAODIA'
      FieldName = 'VLRVARIACAODIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 8
    end
    object pplSldQtdCotasIntegAnppField10: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 120
      DisplayWidth = 120
      Position = 9
    end
    object pplSldQtdCotasIntegAnppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECQTD'
      FieldName = 'QTDDECQTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplSldQtdCotasIntegAnppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDECVALOR'
      FieldName = 'QTDDECVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplSldQtdCotasIntegAnppField13: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 12
    end
  end
  object DsSldQtdCotasIntegAn: TwwDataSource
    DataSet = QrySldQtdCotasIntegAn
    Left = 184
    Top = 186
  end
  object QrySldQtdCotasIntegAn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    TF.IDTIPOINVEST||PL.IDPLANPREVCTBPATR||FI.IDFUNDOINVEST||TF.' +
        'IDTIPOFUNDOINVEST AS ID,'
      
        '    FI.DESCFUNDOINVEST,   HC.QTDHISTCOTAINTEGR, HC.DATAAPLICACAO' +
        ', HC.DATAHISTCOTAINTEG,'
      
        '    HC.VLRCOTAINTEGR,     HC.VLRHISTCOTAINTEGR, VAR.VLRVARIACAOD' +
        'IA, TC.DESCTIPOCOTA,'
      
        '    FI.QTDDECQTD,         FI.QTDDECVALOR      , PL.PLANPRVCONTAB' +
        'PATRO,'
      '    TF.DESCTIPOFUNDOINV'
      'FROM'
      '    HISTCOTAINTEGRALIZA HC,'
      ''
      
        '   (SELECT HC2.IDTIPOINVEST, HC2.IDPLANPREVCTBPATR, HC2.IDFUNDOI' +
        'NVEST, HC2.IDTIPOCOTA,'
      
        '           HC2.IDOPERACAOFUNDO,  SUM(HC2.VLRVARIACAODIA) AS VLRV' +
        'ARIACAODIA'
      '    FROM   HISTCOTAINTEGRALIZA HC2,'
      '          (SELECT IDFUNDOINVEST'
      '           FROM FUNDOINVEST'
      '           WHERE'
      
        '            (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFUNDOI' +
        'NVEST =:IDTIPOFUNDOINVEST)) OR'
      '              (:IDTIPOFUNDOINVEST IS NULL)) ) FI2'
      '    WHERE'
      '        (HC2.IDTIPOINVEST       =:IDTIPOINVEST)'
      
        '    AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HC2.IDPLANPREVC' +
        'TBPATR =:IDPLANPREVCTBPATR)) OR'
      '           (:IDPLANPREVCTBPATR IS NULL))'
      '    AND ((HC2.IDFUNDOINVEST||HC2.DATAHISTCOTAINTEG) IN'
      '       (SELECT (HC1.IDFUNDOINVEST||MAX(HC1.DATAHISTCOTAINTEG))'
      '        FROM   HISTCOTAINTEGRALIZA HC1,'
      '              (SELECT IDFUNDOINVEST'
      '               FROM FUNDOINVEST'
      '               WHERE'
      
        '                (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFU' +
        'NDOINVEST =:IDTIPOFUNDOINVEST)) OR'
      '                  (:IDTIPOFUNDOINVEST IS NULL)) ) FI1'
      '        WHERE'
      '            (HC1.IDTIPOINVEST       =:IDTIPOINVEST)'
      
        '        AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (HC1.IDPLANP' +
        'REVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      '               (:IDPLANPREVCTBPATR IS NULL))'
      
        '        AND  (((:IDFUNDOINVEST IS NOT NULL)     AND (HC1.IDFUNDO' +
        'INVEST =:IDFUNDOINVEST)) OR'
      '               (:IDFUNDOINVEST IS NULL))'
      
        '        AND (HC1.DATAHISTCOTAINTEG  = TO_DATE(:DATAHISTCOTAINTEG' +
        ','#39'DD/MM/YYYY'#39'))'
      
        '        AND  (((:IDTIPOCOTA IS NOT NULL)        AND (HC1.IDTIPOC' +
        'OTA    =:IDTIPOCOTA))    OR'
      '               (:IDTIPOCOTA IS NULL))'
      '        AND (FI1.IDFUNDOINVEST      = HC1.IDFUNDOINVEST)'
      
        '        GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANPREVCTBPATR, HC1.ID' +
        'FUNDOINVEST, HC1.DATAAPLICACAO, HC1.IDTIPOCOTA))'
      ''
      '    AND (FI2.IDFUNDOINVEST          = HC2.IDFUNDOINVEST)'
      ''
      
        '    GROUP BY HC2.IDTIPOINVEST, HC2.IDPLANPREVCTBPATR, HC2.IDFUND' +
        'OINVEST, HC2.DATAAPLICACAO, HC2.IDTIPOCOTA, HC2.IDOPERACAOFUNDO)' +
        ' VAR,'
      ''
      ''
      
        '   (SELECT DESCFUNDOINVEST, IDFUNDOINVEST, IDTIPOFUNDOINVEST, QT' +
        'DDECQTD, QTDDECVALOR'
      '    FROM HISTFUNDOINVEST'
      
        '    WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN'
      
        '               (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' +
        ','#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND (HF.DTAVIGENCIA < TO_DATE(:DATAHISTCOTAINTEG' +
        ','#39'DD/MM/YYYY'#39')+1)'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      '                GROUP BY IDFUNDOINVEST))) FI,'
      ''
      
        '   (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS ' +
        'PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PL,'
      ''
      '    TIPOFUNDOINVEST TF, TIPOCOTA TC'
      ''
      'WHERE'
      '    (HC.IDHISTCOTAINTEGR IN (SELECT MAX(HC1.IDHISTCOTAINTEGR)'
      '                             FROM   HISTCOTAINTEGRALIZA HC1,'
      '                                   (SELECT IDFUNDOINVEST'
      '                                    FROM FUNDOINVEST'
      '                                    WHERE'
      
        '                                     (((:IDTIPOFUNDOINVEST IS NO' +
        'T NULL) AND (IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST)) OR'
      
        '                                       (:IDTIPOFUNDOINVEST IS NU' +
        'LL)) ) FI1'
      '                             WHERE'
      
        '                                 (HC1.IDTIPOINVEST       =:IDTIP' +
        'OINVEST)'
      
        '                             AND  (((:IDPLANPREVCTBPATR IS NOT N' +
        'ULL) AND (HC1.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR)) OR'
      
        '                                    (:IDPLANPREVCTBPATR IS NULL)' +
        ')'
      
        '                             AND  (((:IDFUNDOINVEST IS NOT NULL)' +
        '     AND (HC1.IDFUNDOINVEST =:IDFUNDOINVEST)) OR'
      '                                    (:IDFUNDOINVEST IS NULL))'
      
        '                             AND (HC1.DATAHISTCOTAINTEG  = TO_DA' +
        'TE(:DATAHISTCOTAINTEG,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND  (((:IDTIPOCOTA IS NOT NULL)   ' +
        '     AND (HC1.IDTIPOCOTA    =:IDTIPOCOTA))    OR'
      '                                    (:IDTIPOCOTA IS NULL))'
      
        '                             AND (FI1.IDFUNDOINVEST      = HC1.I' +
        'DFUNDOINVEST)'
      
        '                             GROUP BY HC1.IDTIPOINVEST, HC1.IDPL' +
        'ANPREVCTBPATR, HC1.IDFUNDOINVEST,'
      
        '                                      HC1.DATAAPLICACAO, HC1.IDT' +
        'IPOCOTA))'
      'AND (HC.QTDHISTCOTAINTEGR  > 0)'
      'AND (FI.IDFUNDOINVEST      = HC.IDFUNDOINVEST)'
      'AND (TF.IDTIPOFUNDOINVEST  = FI.IDTIPOFUNDOINVEST)'
      'AND (TC.IDTIPOCOTA(+)      = NVL(HC.IDTIPOCOTA,0))'
      'AND (HC.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR)'
      'AND (VAR.IDPLANPREVCTBPATR = HC.IDPLANPREVCTBPATR)'
      'AND (VAR.IDFUNDOINVEST     = HC.IDFUNDOINVEST)'
      'AND (NVL(VAR.IDTIPOCOTA,0) = NVL(HC.IDTIPOCOTA,0))'
      'AND (VAR.IDOPERACAOFUNDO   = HC.IDOPERACAOFUNDO)'
      ''
      
        'ORDER BY TF.DESCTIPOFUNDOINV, PL.PLANPRVCONTABPATRO, FI.DESCFUND' +
        'OINVEST,'
      '         HC.DATAHISTCOTAINTEG, HC.DATAAPLICACAO, TC.DESCTIPOCOTA'
      '')
    ValidateWithMask = True
    Left = 51
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAHISTCOTAINTEG'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
    object QrySldQtdCotasIntegAnPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QrySldQtdCotasIntegAnDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundos de Investimentos'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySldQtdCotasIntegAnDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Data Inicial'
      DisplayWidth = 11
      FieldName = 'DATAAPLICACAO'
    end
    object QrySldQtdCotasIntegAnDATAHISTCOTAINTEG: TDateTimeField
      DisplayLabel = 'Data da cota'
      DisplayWidth = 10
      FieldName = 'DATAHISTCOTAINTEG'
    end
    object QrySldQtdCotasIntegAnQTDHISTCOTAINTEGR: TFloatField
      DisplayLabel = 'Quantidade a Integralizar'
      DisplayWidth = 26
      FieldName = 'QTDHISTCOTAINTEGR'
    end
    object QrySldQtdCotasIntegAnVLRCOTAINTEGR: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 22
      FieldName = 'VLRCOTAINTEGR'
    end
    object QrySldQtdCotasIntegAnDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QrySldQtdCotasIntegAnVLRHISTCOTAINTEGR: TFloatField
      DisplayLabel = 'Valor Atualizado'
      DisplayWidth = 16
      FieldName = 'VLRHISTCOTAINTEGR'
    end
    object QrySldQtdCotasIntegAnVLRVARIACAODIA: TFloatField
      DisplayLabel = 'Variação Dia'
      DisplayWidth = 12
      FieldName = 'VLRVARIACAODIA'
    end
    object QrySldQtdCotasIntegAnID: TStringField
      DisplayWidth = 120
      FieldName = 'ID'
      Visible = False
      Size = 120
    end
    object QrySldQtdCotasIntegAnQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QrySldQtdCotasIntegAnQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QrySldQtdCotasIntegAnDESCTIPOFUNDOINV: TStringField
      DisplayWidth = 80
      FieldName = 'DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
  end
  object rpSldQtdCotasInteg: TppReport
    AutoStop = False
    DataPipeline = pplSldQtdCotasInteg
    OnStartPage = rpSldQtdCotasIntegXStartPage
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
    Left = 299
    Top = 68
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSldQtdCotasInteg'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo da Quantidade de Cotas a Integralizar - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 76623
        BandType = 0
      end
      object ppLabel38: TppLabel
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
      object ppDBImage3: TppDBImage
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
      object lblPeriodoRef: TppLabel
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
      object ppShape3: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label1'
        Caption = 'Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21696
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label2'
        Caption = 'Quantidade a Integralizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 21696
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label3'
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 106627
        mmTop = 21696
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label4'
        Caption = 'Data da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label5'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 21696
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 21696
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label7'
        Caption = 'Variação do Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 262996
        mmTop = 21696
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label8'
        Caption = 'Tipo de Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 184944
        mmTop = 21696
        mmWidth = 23283
        BandType = 0
      end
      object pplPlano: TppLabel
        UserName = 'Label9'
        Caption = 'Label9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 234421
        mmTop = 8202
        mmWidth = 49213
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 8467
        mmWidth = 88900
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DbFundos1'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplSldQtdCotasInteg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 529
        mmWidth = 101336
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplSldQtdCotasIntegAn'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 3969
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplSldQtdCotasIntegAn
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Movimentação'
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
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplSldQtdCotasIntegAn'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppShape4: TppShape
              OnPrint = shpDetalhePrint
              UserName = 'shpDetalhe2'
              Brush.Color = 14935011
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 5292
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DbQtd1'
              DataField = 'QTDHISTCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '###,#0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 67469
              mmTop = 794
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DbDtaFlx1'
              DataField = 'DATAAPLICACAO'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 107156
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DbDtaCta1'
              DataField = 'DATAHISTCOTAINTEG'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 125942
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DbVlrCta1'
              DataField = 'VLRCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '###,#0.000000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 146315
              mmTop = 794
              mmWidth = 35719
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DbVlrAtu2'
              DataField = 'VLRHISTCOTAINTEGR'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 226219
              mmTop = 794
              mmWidth = 33338
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DbVarDia1'
              DataField = 'VLRVARIACAODIA'
              DataPipeline = pplSldQtdCotasIntegAn
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 259028
              mmTop = 794
              mmWidth = 24077
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DbTipoCota1'
              DataField = 'DESCTIPOCOTA'
              DataPipeline = pplSldQtdCotasIntegAn
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSldQtdCotasIntegAn'
              mmHeight = 3175
              mmLeft = 185473
              mmTop = 794
              mmWidth = 40217
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
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel56: TppLabel
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 284163
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
        mmLeft = 258234
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc10: TppDBCalc
        UserName = 'DbVarTotal'
        DataField = 'VLRVARIACAODIA'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 259557
        mmTop = 4498
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DbVlrAtu1'
        DataField = 'VLRHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 225690
        mmTop = 4498
        mmWidth = 33338
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'dbQtdTotal'
        DataField = 'QTDHISTCOTAINTEGR'
        DataPipeline = pplSldQtdCotasInteg
        DisplayFormat = '###,#0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSldQtdCotasInteg'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 4498
        mmWidth = 45508
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284300
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 8731
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel57: TppLabel
        UserName = 'Label13'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 4498
        mmWidth = 19812
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = pplSldQtdCotasInteg
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplSldQtdCotasInteg
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText24: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplSldQtdCotasIntegAn
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasIntegAn'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine19: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine20: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand2AfterGenerate
        BeforePrint = ppGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object ppLine21: TppLine
          UserName = 'lSomatorio'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'dbcVar'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 259557
          mmTop = 6085
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'dbcVlrAtu'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 225690
          mmTop = 6085
          mmWidth = 33338
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'dbcQtd'
          OnGetText = dbcQtdGetText
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3175
          mmLeft = 67204
          mmTop = 6085
          mmWidth = 36513
          BandType = 5
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'Label10'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3302
          mmLeft = 2910
          mmTop = 6085
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object ppLine22: TppLine
          UserName = 'lSomatorio1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = pplSldQtdCotasInteg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSldQtdCotasInteg'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand3AfterGenerate
        BeforePrint = ppGroupFooterBand3BeforePrint
        Visible = False
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLine23: TppLine
          UserName = 'lSomatorio2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'Label12'
          Caption = 'Total do Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object ppDBText25: TppDBText
          UserName = 'DBText12'
          DataField = 'QTDHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '###,#0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3387
          mmLeft = 67204
          mmTop = 1323
          mmWidth = 36513
          BandType = 5
          GroupNo = 2
        end
        object ppDBText26: TppDBText
          UserName = 'DBText13'
          DataField = 'VLRHISTCOTAINTEGR'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3440
          mmLeft = 225690
          mmTop = 1323
          mmWidth = 33338
          BandType = 5
          GroupNo = 2
        end
        object ppDBText27: TppDBText
          UserName = 'DBText14'
          DataField = 'VLRVARIACAODIA'
          DataPipeline = pplSldQtdCotasInteg
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSldQtdCotasInteg'
          mmHeight = 3440
          mmLeft = 259558
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
