inherited DmRelLanContPerRF: TDmRelLanContPerRF
  Left = 516
  Top = 164
  Width = 248
  Height = 373
  Caption = 'DmRelLanContPerRF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 34
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
    Left = 34
  end
  inherited rpExemplo: TppReport
    Left = 34
    DataPipelineName = 'pplExemplo'
  end
  object dsLanContPerRF: TwwDataSource
    AutoEdit = False
    DataSet = qryLancContPerRF
    Left = 40
    Top = 80
  end
  object pplLanContRF: TppBDEPipeline
    DataSource = dsLanContPerRF
    UserName = 'pplLanContRF'
    Left = 133
    Top = 80
  end
  object pprLanContPerRF: TppReport
    AutoStop = False
    DataPipeline = pplLanContRF
    OnEndFirstPass = pprLanContPerRFEndFirstPass
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Contábeis de Renda Fixa'
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
    Left = 130
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLanContRF'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Width = 2
        mmHeight = 4572
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object pplblInvestimento: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 19844
        mmWidth = 17198
        BandType = 0
      end
      object pplblPlanilha: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 19844
        mmWidth = 12435
        BandType = 0
      end
      object pplblHistorico: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 93663
        mmTop = 19845
        mmWidth = 21696
        BandType = 0
      end
      object pplblVlrLancto: TppLabel
        UserName = 'Label4'
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
        mmLeft = 178859
        mmTop = 19844
        mmWidth = 27781
        BandType = 0
      end
      object pplblDtAplicacao: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 19844
        mmWidth = 15346
        BandType = 0
      end
      object rptRenFixSaldoTitulo: TppLabel
        UserName = 'rptRenFixSaldoTitulo'
        Caption = 'Lançamentos Contábeis de Renda Fixa por Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 87048
        BandType = 0
      end
      object ppLabel16: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Período :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 13229
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
        mmLeft = 6085
        mmTop = 1588
        mmWidth = 13229
        BandType = 0
      end
      object pplblDtLancto: TppLabel
        UserName = 'Label6'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 19844
        mmWidth = 5821
        BandType = 0
      end
      object pplblConta: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Conta Lançada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 221721
        mmTop = 19844
        mmWidth = 25929
        BandType = 0
      end
      object pplblPlanoPatro: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Plano / Patro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 19844
        mmWidth = 25929
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpCabecalho1'
        ParentWidth = True
        Pen.Style = psClear
        Pen.Width = 0
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbPlnPlanil: TppDBText
        UserName = 'dbPlnPlanil'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 529
        mmWidth = 56356
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HISTORICO'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 93927
        mmTop = 529
        mmWidth = 83344
        BandType = 4
      end
      object ppdbValLanc: TppDBText
        UserName = 'dbValLanc'
        DataField = 'LACVALOR'
        DataPipeline = pplLanContRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 178859
        mmTop = 529
        mmWidth = 27517
        BandType = 4
      end
      object ppdbData: TppDBText
        UserName = 'dbPlnPlanil1'
        DataField = 'DATA'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 529
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbPlnPlanil2'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 529
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PLNPLANIL'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 207698
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object ppdbConta: TppDBText
        UserName = 'dbConta'
        DataField = 'PLACONTA'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 221457
        mmTop = 529
        mmWidth = 26988
        BandType = 4
      end
      object ppdbPlanoPatro: TppDBText
        UserName = 'dbPlanoPatro'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplLanContRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContRF'
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 529
        mmWidth = 34660
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8202
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
        mmWidth = 283369
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
        mmLeft = 256117
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updLanContPerRF: TUpdateSQL
    Left = 40
    Top = 192
  end
  object qryLancContPerRF: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT'
      
        '   A.DATA, A.PLANPRVCONTABPATRO, A.DESCINVESTIMENTO, A.DATAOPERA' +
        'CAO, A.PLANO, A.PLACONTA,'
      '   A.PLNCODIGO, A.PLNPLANIL, A.HISTORICO, A.IDINVESTIMENTO, '
      
        '   DECODE(P.PLANATUREZA, '#39'C'#39', A.LACVALOR * -1, A.LACVALOR) AS LA' +
        'CVALOR,'
      '   A.IDPLANPREVCTBPATR, A.TIPOOPER, 0 AS COR'
      'FROM'
      '   ('
      '    SELECT'
      
        '       TB.DATAHISTRENFIX AS DATA, PP.PLANPRVCONTABPATRO, IV.DESC' +
        'INVESTIMENTO, OP.DATAOPERACAO,'
      
        '       LC.PLANO, LC.PLACONTA, TB.PLNCODIGO, PL.PLNPLANIL, (LC.LA' +
        'CHIST1 || LC.LACHIST2) AS HISTORICO,'
      
        '       (IV.DESCINVESTIMENTO || OP.IDOPERRENFIX || OP.DATAOPERACA' +
        'O) AS IDINVESTIMENTO,'
      '       LC.LACVALOR, TB.IDPLANPREVCTBPATR, '#39'ATU'#39' AS TIPOOPER'
      
        '    FROM LANCAMENTO LC, PLANILHA PL, OPERRENFIX OP, INVESTIMENTO' +
        ' IV,'
      
        '       (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME)' +
        ' AS PLANPRVCONTABPATRO'
      
        '        FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL' +
        ' PL'
      '        WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '          AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      
        '       (SELECT HR.IDHISTRENFIX, HR.PLNCODIGO, HR.DATAHISTRENFIX,' +
        ' HR.IDINVESTIMENTO, HR.IDOPERRENFIXAPLIC,'
      '               HR.SALDOVLRHISTRENFI, HR.IDPLANPREVCTBPATR'
      '        FROM   HISTRENFIX HR'
      
        '        WHERE  HR.DATAHISTRENFIX  BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '          AND  ((:IDINVESTIMENTO IS NULL)    OR (HR.IDINVESTIMEN' +
        'TO = :IDINVESTIMENTO))'
      
        '          AND  ((:IDOPERRENFIXAPLIC IS NULL) OR (HR.IDOPERRENFIX' +
        'APLIC = :IDOPERRENFIXAPLIC))'
      '          AND  (HR.IDHISTRENFIX IN (SELECT MAX(IDHISTRENFIX)'
      '                                    FROM HISTRENFIX'
      
        '                                    WHERE DATAHISTRENFIX  BETWEE' +
        'N TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYY' +
        'Y'#39')'
      
        '                                      AND ((:IDINVESTIMENTO IS N' +
        'ULL)    OR (IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                                      AND ((:IDOPERRENFIXAPLIC I' +
        'S NULL) OR (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      
        '                                      AND (TIPMOVHISRENFIX = '#39'AT' +
        'U'#39' )'
      
        '                                    GROUP BY DATAHISTRENFIX, IDI' +
        'NVESTIMENTO, IDOPERRENFIXAPLIC))) TB'
      
        '    WHERE ((:IDINVESTIMENTO IS NULL)    OR (OP.IDINVESTIMENTO = ' +
        ':IDINVESTIMENTO))'
      
        '      AND ((:IDOPERRENFIXAPLIC IS NULL) OR (OP.IDOPERRENFIXAPLIC' +
        ' = :IDOPERRENFIXAPLIC))'
      '      AND LC.IDMODULO = 79'
      '      AND PL.IDMODULO = 79'
      '      AND LC.LACDEBCRE = '#39'D'#39
      
        '      AND PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AN' +
        'D TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      '      AND TB.PLNCODIGO = LC.PLNCODIGO'
      '      AND TB.PLNCODIGO = PL.PLNCODIGO'
      '      AND TB.IDINVESTIMENTO = OP.IDINVESTIMENTO'
      '      AND TB.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND TB.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX'
      '      AND TB.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      '    UNION'
      ''
      '    SELECT'
      
        '       OP.DATAOPERACAO AS DATA, PP.PLANPRVCONTABPATRO, IV.DESCIN' +
        'VESTIMENTO,'
      
        '       DECODE(OPERAP.DATAOPERACAO,NULL,AP.DATAOPERACAO,OPERAP.DA' +
        'TAOPERACAO) AS DATAOPERACAO,'
      
        '       LC.PLANO, LC.PLACONTA, OP.PLNCODIGO, PL.PLNPLANIL, (LC.LA' +
        'CHIST1 || LC.LACHIST2) AS HISTORICO,'
      
        '       (IV.DESCINVESTIMENTO || OP.IDOPERRENFIX || OP.DATAOPERACA' +
        'O) AS IDINVESTIMENTO,'
      '       LC.LACVALOR, OP.IDPLANPREVCTBPATR, '#39'OPE'#39' AS TIPOOPER'
      '    FROM'
      
        '       OPERRENFIX OP, OPERRENFIX AP, INVESTIMENTO IV, LANCAMENTO' +
        ' LC, PLANILHA PL,'
      
        '      (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) ' +
        'AS PLANPRVCONTABPATRO,'
      '          (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPATRO'
      
        '       FROM   PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABI' +
        'L PL'
      '       WHERE (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '             (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '      (SELECT OPE.DATAOPERACAO,OPI.IDOPERRENFIX,OPI.BOLETA'
      '       FROM OPERRENFIX OPI,'
      
        '           (SELECT OP.DATAOPERACAO, OP.IDOPERRENFIXAPLIC,OPA.BOL' +
        'ETA'
      '            FROM OPERRENFIX OP,'
      '                (SELECT OP1.IDOPERRENFIXAPLIC, OP1.BOLETA'
      '                 FROM OPERRENFIX OP1, INVESTIMENTO IV'
      
        '                 WHERE (OP1.DATAOPERACAO BETWEEN TO_DATE(:DATAIN' +
        'I,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '                   AND ((:IDINVESTIMENTO IS NULL)    OR (OP1.IDI' +
        'NVESTIMENTO = :IDINVESTIMENTO))'
      
        '                   AND ((:IDOPERRENFIXAPLIC IS NULL) OR (OP1.IDO' +
        'PERRENFIXAPLIC = :IDOPERRENFIXAPLIC))'
      '                   AND (OP1.IDTIPOOPERACAO = -97)'
      
        '                   AND (OP1.IDINVESTIMENTO = IV.IDINVESTIMENTO))' +
        ' OPA'
      '            WHERE (OP.IDOPERRENFIX = OPA.IDOPERRENFIXAPLIC)'
      '              AND (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '           ) OPE'
      '       WHERE (OPI.BOLETA = OPE.BOLETA)'
      '         AND (OPI.IDTIPOOPERACAO = -98)) OPERAP'
      
        '    WHERE OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ' AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '      AND ((:IDINVESTIMENTO IS NULL) OR (OP.IDINVESTIMENTO = :ID' +
        'INVESTIMENTO))'
      
        '      AND ((:IDOPERRENFIXAPLIC IS NULL) OR (OP.IDOPERRENFIXAPLIC' +
        ' = :IDOPERRENFIXAPLIC))'
      '      AND LC.IDMODULO = 79'
      '      AND PL.IDMODULO = 79'
      '      AND LC.LACDEBCRE = '#39'D'#39
      
        '      AND (PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') A' +
        'ND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '      AND OP.PLNCODIGO = LC.PLNCODIGO'
      '      AND OP.PLNCODIGO = PL.PLNCODIGO'
      '      AND OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '      AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '      AND OP.IDOPERRENFIXAPLIC = AP.IDOPERRENFIX(+)'
      '      AND OP.IDOPERRENFIX = OPERAP.IDOPERRENFIX(+) ) A,'
      '    (SELECT PLANATUREZA, PLACONTA, PLANO'
      '     FROM PLANOCONTA'
      '     WHERE PLANATUREZA IN ('#39'D'#39','#39'C'#39')'
      '       AND PLATIPO = '#39'A'#39') P'
      'WHERE A.PLACONTA = P.PLACONTA'
      '  AND A.PLANO = P.PLANO'
      ''
      'ORDER BY'
      
        '   A.DATA,  A.TIPOOPER, A.PLANPRVCONTABPATRO, A.DESCINVESTIMENTO' +
        ', A.DATAOPERACAO, A.IDINVESTIMENTO'
      ' ')
    UpdateObject = updLanContPerRF
    ValidateWithMask = True
    Left = 40
    Top = 136
    ParamData = <
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIXAPLIC'
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
    object qryLancContPerRFDATA: TDateTimeField
      DisplayLabel = 'Data Lançamento'
      DisplayWidth = 18
      FieldName = 'DATA'
    end
    object qryLancContPerRFDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 27
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryLancContPerRFDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryLancContPerRFPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 6
      FieldName = 'PLNPLANIL'
    end
    object qryLancContPerRFHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICO'
      Size = 80
    end
    object qryLancContPerRFLACVALOR: TFloatField
      DisplayLabel = 'Valor do Lançamento'
      DisplayWidth = 20
      FieldName = 'LACVALOR'
    end
    object qryLancContPerRFPLNCODIGO: TFloatField
      DisplayLabel = 'PlnCodigo'
      DisplayWidth = 13
      FieldName = 'PLNCODIGO'
    end
    object qryLancContPerRFPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 25
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryLancContPerRFPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 39
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryLancContPerRFIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryLancContPerRFCOR: TFloatField
      FieldName = 'COR'
      Visible = False
    end
    object qryLancContPerRFPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryLancContPerRFIDINVESTIMENTO: TStringField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
      Size = 108
    end
    object qryLancContPerRFTIPOOPER: TStringField
      FieldName = 'TIPOOPER'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qryPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANATUREZA'
      'FROM PLANOCONTA'
      'WHERE PLANATUREZA IN ('#39'D'#39','#39'C'#39')'
      '  AND PLATIPO = '#39'A'#39
      '  AND PLACONTA = :PLACONTA'
      '  AND PLANO = :PLANO'
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'PLACONTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptResult
      end>
    object qryPlanoContaPLANATUREZA: TStringField
      DisplayLabel = 'Natureza'
      DisplayWidth = 20
      FieldName = 'PLANATUREZA'
      FixedChar = True
      Size = 1
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT I.IDINVESTIMENTO, I.DESCINVESTIMENTO'
      'FROM INVESTIMENTO I, OPERRENFIX O'
      'WHERE I.IDTIPOINVEST = 1'
      '  AND ((I.FLGRFXANTIGO <> '#39'S'#39') OR (FLGRFXANTIGO IS NULL))  '
      '  AND I.IDINVESTIMENTO = O.IDINVESTIMENTO'
      'GROUP BY I.IDINVESTIMENTO, I.DESCINVESTIMENTO'
      'ORDER BY I.DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 49
    Top = 255
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.DATAOPERACAO, PP.PLANPRVCONTABPATRO, OP.QTDEOPERACAO, ' +
        'OP.VLROPERACAO,'
      '       OP.IDOPERRENFIX'
      'FROM OPERRENFIX OP,'
      
        '     (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) A' +
        'S PLANPRVCONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      'WHERE (OP.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '  AND (OP.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      'ORDER BY OP.DATAOPERACAO, PP.PLANPRVCONTABPATRO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 137
    Top = 255
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryOperacaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object qryOperacaoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryOperacaoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEOPERACAO'
    end
    object qryOperacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
    end
    object qryOperacaoIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
      Visible = False
    end
  end
end
