inherited DmRelLanContAtuRV: TDmRelLanContAtuRV
  Left = 439
  Top = 161
  Width = 226
  Height = 243
  Caption = 'DmRelLanContAtuRV'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 26
    Top = 8
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
    Left = 26
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 26
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 26
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplLanContAtuRV: TppBDEPipeline
    DataSource = dsLanContAtuRv
    UserName = 'lLanContAtuRV'
    Left = 144
    Top = 64
  end
  object rptLanContAtuRV: TppReport
    AutoStop = False
    DataPipeline = pplLanContAtuRV
    OnStartPage = rptLanContAtuRVStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos Contábeis de Renda Variável'
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
    Left = 144
    Top = 9
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLanContAtuRV'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Lançamentos Contábeis de Atualização de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 21696
        mmTop = 8996
        mmWidth = 97367
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
        mmLeft = 21696
        mmTop = 1323
        mmWidth = 24342
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284300
        BandType = 0
      end
      object pplInvestimento: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1588
        mmTop = 21431
        mmWidth = 15081
        BandType = 0
      end
      object pplVlrContab: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Vlr. Contabil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 131763
        mmTop = 21431
        mmWidth = 21697
        BandType = 0
      end
      object pplVlrDif: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Vlr. Divergência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 21430
        mmWidth = 21697
        BandType = 0
      end
      object pplCarteira: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 34660
        mmTop = 21430
        mmWidth = 11906
        BandType = 0
      end
      object pplCodigo: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 94721
        mmTop = 21430
        mmWidth = 12965
        BandType = 0
      end
      object pplContaD: TppLabel
        UserName = 'Label12'
        Caption = 'Conta à Débilto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 233892
        mmTop = 21431
        mmWidth = 17992
        BandType = 0
      end
      object pplHistContab: TppLabel
        UserName = 'Label13'
        Caption = 'Histórico Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 180711
        mmTop = 21431
        mmWidth = 23548
        BandType = 0
      end
      object pplVlrAtu: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Vlr.Atualizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 108215
        mmTop = 21430
        mmWidth = 21697
        BandType = 0
      end
      object pplDataRef: TppLabel
        UserName = 'Label8'
        Caption = 'Data :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 21696
        mmTop = 14023
        mmWidth = 7578
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DbLogo6'
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
      object pplContaC: TppLabel
        UserName = 'lContaC'
        Caption = 'Conta à Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 259557
        mmTop = 21431
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'dbCarteira1'
        DataField = 'DATAMOVCARTINV'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3260
        mmLeft = 30692
        mmTop = 14023
        mmWidth = 23813
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText1'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 8996
        mmWidth = 103188
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDet: TppShape
        OnPrint = shpDetPrint
        UserName = 'shpDet'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbInvestimento: TppDBText
        UserName = 'dbInvestimento'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 265
        mmWidth = 31485
        BandType = 4
      end
      object ppdbPlanilha: TppDBText
        UserName = 'dbPlanilha'
        DataField = 'PLNCODIGO'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 94721
        mmTop = 264
        mmWidth = 11906
        BandType = 4
      end
      object ppdbVlrDif: TppDBText
        UserName = 'dbVlrDif'
        DataField = 'DIF'
        DataPipeline = pplLanContAtuRV
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 154782
        mmTop = 264
        mmWidth = 24342
        BandType = 4
      end
      object ppdbVlrAtu: TppDBText
        UserName = 'dbVlrAtu'
        DataField = 'VLRMOVCARTINV'
        DataPipeline = pplLanContAtuRV
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 108215
        mmTop = 264
        mmWidth = 21696
        BandType = 4
      end
      object ppdbCarteira: TppDBText
        UserName = 'dbCarteira'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 34660
        mmTop = 265
        mmWidth = 58473
        BandType = 4
      end
      object ppdbVlrContab: TppDBText
        UserName = 'dbVlrContab'
        DataField = 'LACVALOR'
        DataPipeline = pplLanContAtuRV
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 131498
        mmTop = 264
        mmWidth = 21696
        BandType = 4
      end
      object ppdbHistContab: TppDBText
        UserName = 'dbHistContab'
        DataField = 'HISTCONTAB'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 180446
        mmTop = 265
        mmWidth = 52123
        BandType = 4
      end
      object ppdbContaD: TppDBText
        UserName = 'dbHistContab1'
        DataField = 'PLACONTAD'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 233892
        mmTop = 264
        mmWidth = 24077
        BandType = 4
      end
      object ppdbContaC: TppDBText
        UserName = 'dbContaC'
        DataField = 'PLACONTAC'
        DataPipeline = pplLanContAtuRV
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLanContAtuRV'
        mmHeight = 3440
        mmLeft = 259292
        mmTop = 264
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
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
        mmTop = 1323
        mmWidth = 283898
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
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
        mmTop = 1323
        mmWidth = 283898
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
        mmLeft = 257969
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplLanContAtuRV
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLanContAtuRV'
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
  end
  object dsLanContAtuRv: TwwDataSource
    DataSet = qryLanContAtuRV
    Left = 144
    Top = 168
  end
  object qryLanContAtuRV: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   HI.PLNCODIGO, HI.DATAMOVCARTINV, PP.PLANPRVCONTABPATRO,'
      '   HI.VLRMOVCARTINV,    '
      '   (ABS(HI.VLRMOVCARTINV) - LC.LACVALOR) AS DIF,'
      '   LC.LACVALOR,'
      '   HI.SALDOVLRINVCART, HI.SALDOQTDEINVCART, '
      '   HI.HISTMOVCARTINV,'
      '   IV.DESCINVESTIMENTO,'
      '   CA.DESCCARTINVEST,'
      '   HI.IDINVESTIMENTO,  HI.IDCARTEIRAINVEST,'
      
        '   (LC.LACHIST1 ||'#39' '#39' ||LC.LACHIST2 ||'#39' '#39'|| LC.LACHIST3) AS HIST' +
        'CONTAB,'
      '   LC.PLACONTAD, LC.PLACONTAC,'
      '   TP.DESCTIPOOPERACAO'
      'FROM'
      
        '   HISTCARTINV HI, INVESTIMENTO IV, CARTEIRAINVEST CA, TIPOOPERA' +
        'CAO TP,'
      
        '  (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, PA.' +
        'IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      '   FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '   WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '     AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '   (SELECT D.PLNCODIGO, D.LACVALOR, D.PLACONTA AS PLACONTAD, C.P' +
        'LACONTA AS PLACONTAC,'
      '           D.LACHIST1, D.LACHIST2, D.LACHIST3'
      '    FROM PLANILHA P,'
      
        '         (SELECT PLNCODIGO, LACVALOR, PLACONTA, LACHIST1, LACHIS' +
        'T2, LACHIST3'
      '          FROM LANCAMENTO WHERE LACDEBCRE = '#39'D'#39') D,'
      
        '         (SELECT PLNCODIGO, LACVALOR, PLACONTA, LACHIST1, LACHIS' +
        'T2, LACHIST3'
      '          FROM LANCAMENTO WHERE LACDEBCRE = '#39'C'#39') C'
      '    WHERE (P.PLNDATDIA = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '      AND (P.IDMODULO  = 79)'
      '      AND (P.PLNCODIGO = D.PLNCODIGO)'
      '      AND (P.PLNCODIGO = C.PLNCODIGO)'
      '   ) LC,'
      '   (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '    FROM COTACAOINVEST'
      
        '    WHERE ((:IDINVESTIMENTO IS NULL) OR (IDINVESTIMENTO = :IDINV' +
        'ESTIMENTO))'
      '      AND (DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                          FROM COTACAOINVEST'
      
        '                          WHERE DATACOTACAO <= TO_DATE(:DATAREF,' +
        #39'DD/MM/YYYY'#39')'
      
        '                             AND ((:IDINVESTIMENTO IS NULL) OR (' +
        'IDINVESTIMENTO = :IDINVESTIMENTO))))'
      '   ) QTL'
      'WHERE (HI.IDHISTCARTINV  IN'
      '          (SELECT MAX(HI1.IDHISTCARTINV)'
      '           FROM HISTCARTINV HI1'
      '           WHERE'
      '                  (HI1.IDTIPOINVEST  = 2)'
      
        '             AND    ((:IDPLANPREVCTBPATR IS NULL)   OR (HI1.IDPL' +
        'ANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '             AND    ((:IDCARTEIRAINVEST IS NULL) OR (HI1.IDCARTE' +
        'IRAINVEST = :IDCARTEIRAINVEST))'
      '             AND  (HI1.IDCARTEIRAGERENC IS NULL)'
      '             AND ((HI1.IDINVESTIMENTO||HI1.DATAMOVCARTINV) IN'
      
        '                      (SELECT (HI2.IDINVESTIMENTO||MAX(HI2.DATAM' +
        'OVCARTINV))'
      '                       FROM HISTCARTINV HI2'
      '                       WHERE'
      '                             (HI2.IDTIPOINVEST   = 2)'
      
        '                         AND   ((:IDPLANPREVCTBPATR IS NULL) OR ' +
        '(HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                         AND   ((:IDINVESTIMENTO IS NULL)    OR ' +
        '(HI2.IDINVESTIMENTO = :IDINVESTIMENTO))'
      
        '                         AND   ((:IDCARTEIRAINVEST IS NULL)  OR ' +
        '(HI2.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      '                         AND (HI2.IDCARTEIRAGERENC IS NULL)'
      
        '                         AND (HI2.DATAMOVCARTINV = TO_DATE(:DATA' +
        'REF,'#39'DD/MM/YYYY'#39'))'
      '                         AND (HI2.TIPMOVCARTINV  = '#39'ATU'#39')'
      
        '                       GROUP BY HI2.IDPLANPREVCTBPATR, HI2.IDINV' +
        'ESTIMENTO, HI2.IDCARTEIRAINVEST))'
      '             AND  (HI1.TIPMOVCARTINV = '#39'ATU'#39')'
      
        '           GROUP BY HI1.IDPLANPREVCTBPATR, HI1.IDINVESTIMENTO, H' +
        'I1.IDCARTEIRAINVEST))'
      '  AND (NVL(HI.SALDOQTDEINVCART,0) > 0)'
      '  AND (HI.PLNCODIGO         = LC.PLNCODIGO(+))'
      '  AND (HI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+))'
      '  AND (HI.IDINVESTIMENTO    = QTL.IDINVESTIMENTO)'
      '  AND (HI.IDCARTEIRAINVEST  = CA.IDCARTEIRAINVEST)'
      '  AND (HI.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+))'
      '  AND (HI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO)'
      
        'ORDER BY PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, CA.DESCCART' +
        'INVEST')
    ValidateWithMask = True
    Left = 144
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
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
        Name = 'DATAREF'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptInput
      end>
    object qryLanContAtuRVDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAMOVCARTINV'
    end
    object qryLanContAtuRVDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 35
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryLanContAtuRVDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 27
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryLanContAtuRVPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryLanContAtuRVPLNCODIGO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 11
      FieldName = 'PLNCODIGO'
    end
    object qryLanContAtuRVVLRMOVCARTINV: TFloatField
      DisplayLabel = 'Vlr. Atualização'
      DisplayWidth = 15
      FieldName = 'VLRMOVCARTINV'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryLanContAtuRVLACVALOR: TFloatField
      DisplayLabel = 'Vlr. Contabilizado'
      DisplayWidth = 15
      FieldName = 'LACVALOR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryLanContAtuRVDIF: TFloatField
      DisplayLabel = 'Divergência'
      DisplayWidth = 15
      FieldName = 'DIF'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryLanContAtuRVSALDOQTDEINVCART: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 14
      FieldName = 'SALDOQTDEINVCART'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryLanContAtuRVSALDOVLRINVCART: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 15
      FieldName = 'SALDOVLRINVCART'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryLanContAtuRVHISTCONTAB: TStringField
      DisplayLabel = 'Histórico Contábil'
      DisplayWidth = 43
      FieldName = 'HISTCONTAB'
      Size = 122
    end
    object qryLanContAtuRVPLACONTAC: TStringField
      DisplayLabel = 'Conta à Crédito'
      DisplayWidth = 18
      FieldName = 'PLACONTAC'
      FixedChar = True
      Size = 18
    end
    object qryLanContAtuRVPLACONTAD: TStringField
      DisplayLabel = 'Conta à Débito'
      DisplayWidth = 18
      FieldName = 'PLACONTAD'
      FixedChar = True
      Size = 18
    end
    object qryLanContAtuRVHISTMOVCARTINV: TStringField
      DisplayLabel = 'Histórico da Atualização'
      DisplayWidth = 40
      FieldName = 'HISTMOVCARTINV'
      Visible = False
      Size = 60
    end
    object qryLanContAtuRVIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryLanContAtuRVIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryLanContAtuRVDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 120
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCARTINVEST, DATAULTFECH, IDCARTEIRAINVEST'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 64
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object QryPlanoPatro: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 26
    Top = 168
    object QryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
