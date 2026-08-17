inherited dtmRelBalCaf: TdtmRelBalCaf
  Left = 83
  Top = 81
  Width = 637
  Height = 465
  Color = clHighlightText
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 96
    Top = 119
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
  inherited dsExemplo: TwwDataSource
    Left = 96
    Top = 79
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 119
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 79
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited Label11: TppLabel [1]
        mmHeight = 5292
        mmLeft = 79640
        mmWidth = 37835
      end
      inherited LblEmpresa: TppLabel
        mmLeft = 84667
        mmWidth = 28046
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [1]
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 74877
        mmWidth = 71702
      end
      inherited LblSistema: TppLabel [3]
        mmLeft = 0
        mmWidth = 34131
      end
    end
  end
  object qryBalPatBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDPESSOA, B.IDBEM, B.PLACA, G.NOME, B.DESBEM, B.DTAINCL' +
        'USAO, B.TAXADEP,'
      
        '       B.DATAINICIODEP, B.DATAULTDEP, B.VALHISTORICO, B.FLGDEPRE' +
        'C, C.DESCCONJUNTO,'
      
        '       B.IDNOTA, B.COMPLNOTA, F.NOME AS NOMEFORN, G.CLASSE AS CO' +
        'DGRUPO, SB.IDGRUPO,'
      '       L.NOME AS DESCLOCALIZACAO, R.NOME AS NOMERESP,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                        AS DEPL' +
        'ANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALC' +
        'TB0'
      ''
      'FROM (SELECT SCB.IDGRUPO,  SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL,'
      '             SCB.IDPESSOA, SCB.IDBEM,         SCB.DATASLDBEM,'
      '             SCB.VALORG,   SCB.REAVVALORG,    SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,    SCB.REAVCMBEM,     SCB.ULTREAVCMBEM,'
      
        '             SCB.DEPLANC,  SCB.REAVDEPLANC,   SCB.ULTREAVDEPLANC' +
        ','
      '             SCB.CMDEP,    SCB.REAVCMDEP,     SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDPESSOA, IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDPESSOA, IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      
        '        AND (SCB.IDBEM = DTAMAX.IDBEM) AND (SCB.IDPESSOA = DTAMA' +
        'X.IDPESSOA) ) SB,'
      ''
      '     (SELECT ATX.IDPESSOA, ATX.IDBEM,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT'
      '                    HM.IDPESSOA, HM.IDBEM,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      
        '             WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM.D' +
        'ATAMOVIMENTACAO <= :PDATASLD))'
      '             GROUP BY HM.IDPESSOA, HM.IDBEM) UNION'
      ''
      '             ((SELECT'
      '                      HM.IDPESSOA, HM.IDBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM,'
      '                    REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDPESSOA, HM.IDBEM) UNION'
      ''
      '              (SELECT'
      '                      HM.IDPESSOA, HM.IDBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM,'
      '                    REAVALIACAO R'
      
        '               WHERE ((HM.DATAMOVIMENTACAO >= :PDATAINI) AND (HM' +
        '.DATAMOVIMENTACAO <= :PDATASLD))'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDPESSOA, HM.IDBEM))) ATX'
      '      GROUP BY ATX.IDPESSOA, ATX.IDBEM) ATU,'
      ''
      
        '     PESSOA F, PESSOA R, BEM B, CONJUNTO C, GRUPO G, LOCALIZACAO' +
        ' L'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      '  AND ((B.FLGDEPREC = :PDEPREC) OR (B.FLGDEPREC = :PNOTDEPREC))'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      ''
      ''
      '  AND (B.IDBEM          = SB.IDBEM)'
      '  AND (B.IDPESSOA       = SB.IDPESSOA)'
      '  AND (B.IDBEM          = ATU.IDBEM(+))'
      ''
      ''
      '  AND (B.IDPESSOA       = ATU.IDPESSOA(+))'
      '  AND (B.IDFORNSERV     = F.IDPESSOA(+))'
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (SB.IDGRUPO       = G.IDGRUPO)'
      '  AND (SB.IDLOCALIZACAO = L.IDLOCALIZACAO(+))'
      '  AND (SB.IDRESPONSAVEL = R.IDPESSOA(+))'
      'ORDER BY G.CLASSE, B.PLACA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 206
    Top = 331
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PNOTDEPREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsBalPatBem: TwwDataSource
    DataSet = qryBalPatBem
    Left = 271
    Top = 326
  end
  object ppBalPatBem: TppBDEPipeline
    DataSource = dsBalPatBem
    UserName = 'BalPatBem'
    Left = 255
    Top = 280
  end
  object rpBalPatBem: TppReport
    AutoStop = False
    DataPipeline = ppBalPatBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 199
    Top = 283
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppLabel60: TppLabel
        UserName = 'ppLabel60'
        Caption = 'Balancete Patrimonial por Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 69850
        mmTop = 8731
        mmWidth = 62706
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel61: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel61'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpBalPatBemLabel2: TppLabel
        UserName = 'rpBalPatBemLabel2'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 75406
        mmTop = 15081
        mmWidth = 30163
        BandType = 0
      end
      object rpBalPatBemLabel3: TppLabel
        UserName = 'rpBalPatBemLabel3'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 106098
        mmTop = 15081
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object rpBemResumLabel2: TppLabel
        UserName = 'rpBemResumLabel2'
        AutoSize = False
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object rpBemResumLabel3: TppLabel
        UserName = 'rpBemResumLabel3'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10319
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel4: TppLabel
        UserName = 'rpBemResumLabel4'
        AutoSize = False
        Caption = 'Ultima Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 6879
        mmWidth = 27517
        BandType = 4
      end
      object rpBemResumLabel5: TppLabel
        UserName = 'rpBemResumLabel5'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3440
        mmWidth = 15346
        BandType = 4
      end
      object rpBemResumLabel6: TppLabel
        UserName = 'rpBemResumLabel6'
        AutoSize = False
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 6879
        mmWidth = 6615
        BandType = 4
      end
      object rpBemResumLabel7: TppLabel
        UserName = 'rpBemResumLabel7'
        AutoSize = False
        Caption = 'Valor  Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object rpBemResumLabel8: TppLabel
        UserName = 'rpBemResumLabel8'
        AutoSize = False
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 3440
        mmWidth = 19844
        BandType = 4
      end
      object rpBemResumLabel9: TppLabel
        UserName = 'rpBemResumLabel9'
        AutoSize = False
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 6879
        mmWidth = 20108
        BandType = 4
      end
      object rpBemResumLabel10: TppLabel
        UserName = 'rpBemResumLabel10'
        AutoSize = False
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpBemResumLabel11: TppLabel
        UserName = 'rpBemResumLabel11'
        AutoSize = False
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 3440
        mmWidth = 19315
        BandType = 4
      end
      object rpBemResumLabel12: TppLabel
        UserName = 'rpBemResumLabel12'
        AutoSize = False
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 6879
        mmWidth = 19050
        BandType = 4
      end
      object rpBemResumDBText2: TppDBText
        UserName = 'rpBemResumDBText2'
        DataField = 'PLACA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object rpBemResumDBText4: TppDBText
        UserName = 'rpBemResumDBText4'
        DataField = 'DATAULTDEP'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 28310
        mmTop = 6879
        mmWidth = 19315
        BandType = 4
      end
      object rpBemResumDBText5: TppDBText
        UserName = 'rpBemResumDBText5'
        AutoSize = True
        DataField = 'DTAINCLUSAO'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 18785
        mmTop = 3440
        mmWidth = 20108
        BandType = 4
      end
      object rpBemResumDBText6: TppDBText
        UserName = 'rpBemResumDBText6'
        DataField = 'TAXADEP'
        DataPipeline = ppBalPatBem
        DisplayFormat = '0.000000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 6879
        mmWidth = 21960
        BandType = 4
      end
      object rpBemResumDBText7: TppDBText
        UserName = 'rpBemResumDBText7'
        DataField = 'VALORG0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText8: TppDBText
        UserName = 'rpBemResumDBText8'
        DataField = 'DEPLANC0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 3440
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText9: TppDBText
        UserName = 'rpBemResumDBText9'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 6879
        mmWidth = 26458
        BandType = 4
      end
      object rpBemResumDBText10: TppDBText
        UserName = 'rpBemResumDBText10'
        DataField = 'CMBEM0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText11: TppDBText
        UserName = 'rpBemResumDBText11'
        DataField = 'CMDEP0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 3440
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText12: TppDBText
        UserName = 'rpBemResumDBText12'
        DataField = 'VALCTB0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 6879
        mmWidth = 26723
        BandType = 4
      end
      object rpBemResumDBText3: TppDBText
        UserName = 'rpBemResumDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 10319
        mmWidth = 178330
        BandType = 4
      end
      object rpBemResumLine1: TppLine
        UserName = 'rpBemResumLine1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 25400
        mmWidth = 197115
        BandType = 4
      end
      object rpBemResumLabel27: TppLabel
        UserName = 'rpBemResumLabel27'
        AutoSize = False
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 13758
        mmWidth = 16933
        BandType = 4
      end
      object rpBemResumLabel28: TppLabel
        UserName = 'rpBemResumLabel28'
        Caption = 'a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 6879
        mmWidth = 4763
        BandType = 4
      end
      object rpBalPatBemLabel1: TppLabel
        UserName = 'rpBalPatBemLabel1'
        AutoSize = False
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatBemDBText1: TppDBText
        UserName = 'rpBalPatBemDBText1'
        DataField = 'VALHISTORICO'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object rpBalPatBemLabel4: TppLabel
        UserName = 'rpBalPatBemLabel4'
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 17198
        mmWidth = 17198
        BandType = 4
      end
      object rpBalPatBemDBText2: TppDBText
        UserName = 'rpBalPatBemDBText2'
        DataField = 'NOMEFORN'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 17198
        mmWidth = 79904
        BandType = 4
      end
      object rpBalPatBemLabel5: TppLabel
        UserName = 'rpBalPatBemLabel5'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 17198
        mmWidth = 16669
        BandType = 4
      end
      object rpBalPatBemDBText3: TppDBText
        UserName = 'rpBalPatBemDBText3'
        DataField = 'IDNOTA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 17198
        mmWidth = 26458
        BandType = 4
      end
      object rpBalPatBemDBText4: TppDBText
        UserName = 'rpBalPatBemDBText4'
        DataField = 'COMPLNOTA'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 17198
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCLOCALIZACAO'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 13758
        mmWidth = 79904
        BandType = 4
      end
      object ppLabel106: TppLabel
        UserName = 'Label106'
        AutoSize = False
        Caption = 'Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 13758
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMERESP'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 13758
        mmWidth = 76729
        BandType = 4
      end
      object ppLabel107: TppLabel
        UserName = 'Label107'
        AutoSize = False
        Caption = 'Conjunto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 20638
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCCONJUNTO'
        DataPipeline = ppBalPatBem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18785
        mmTop = 20638
        mmWidth = 178330
        BandType = 4
      end
      object ppLabel112: TppLabel
        UserName = 'Label112'
        AutoSize = False
        Caption = 'Inicio Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 3440
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DATAINICIODEP'
        DataPipeline = ppBalPatBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 71438
        mmTop = 3440
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel62: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel62'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 75406
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 794
        mmWidth = 39952
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBemResumSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object rpBemResumLabel20: TppLabel
        UserName = 'rpBemResumLabel20'
        Caption = 'Totalização do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 34396
        BandType = 7
      end
      object rpBemResumLabel21: TppLabel
        UserName = 'rpBemResumLabel21'
        Caption = 'Vl Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 0
        mmWidth = 17463
        BandType = 7
      end
      object rpBemResumLabel22: TppLabel
        UserName = 'rpBemResumLabel22'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 3440
        mmWidth = 17727
        BandType = 7
      end
      object rpBemResumLabel23: TppLabel
        UserName = 'rpBemResumLabel23'
        Caption = 'Depr.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 6879
        mmWidth = 19050
        BandType = 7
      end
      object rpBemResumDBCalc7: TppDBCalc
        UserName = 'rpBemResumDBCalc7'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 6879
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc8: TppDBCalc
        UserName = 'rpBemResumDBCalc8'
        DataField = 'DEPLANC0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 3440
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc9: TppDBCalc
        UserName = 'rpBemResumDBCalc9'
        DataField = 'VALORG0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumLabel24: TppLabel
        UserName = 'rpBemResumLabel24'
        Caption = 'C.M.Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 0
        mmWidth = 12965
        BandType = 7
      end
      object rpBemResumLabel25: TppLabel
        UserName = 'rpBemResumLabel25'
        Caption = 'C.M. Deprec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 3440
        mmWidth = 18256
        BandType = 7
      end
      object rpBemResumLabel26: TppLabel
        UserName = 'rpBemResumLabel26'
        Caption = 'Vl Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 6879
        mmWidth = 15610
        BandType = 7
      end
      object rpBemResumDBCalc10: TppDBCalc
        UserName = 'rpBemResumDBCalc10'
        DataField = 'VALCTB0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 6879
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc11: TppDBCalc
        UserName = 'rpBemResumDBCalc11'
        DataField = 'CMDEP0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3440
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumDBCalc12: TppDBCalc
        UserName = 'rpBemResumDBCalc12'
        DataField = 'CMBEM0'
        DataPipeline = ppBalPatBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 0
        mmWidth = 23813
        BandType = 7
      end
      object rpBemResumLine4: TppLine
        UserName = 'rpBemResumLine4'
        ParentWidth = True
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 11113
        mmWidth = 197300
        BandType = 7
      end
    end
    object rpBemResumGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppBalPatBem
      NewPage = True
      UserName = 'rpBemResumGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBemResumGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpBemResumLabel1: TppLabel
          UserName = 'rpBemResumLabel1'
          Caption = 'GRUPO  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpBemResumDBText1: TppDBText
          UserName = 'rpBemResumDBText1'
          DataField = 'NOME'
          DataPipeline = ppBalPatBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4763
          mmLeft = 17727
          mmTop = 0
          mmWidth = 166423
          BandType = 3
          GroupNo = 0
        end
        object rpBemResumLine2: TppLine
          UserName = 'rpBemResumLine2'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBemResumGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpBemResumLabel13: TppLabel
          UserName = 'rpBemResumLabel13'
          Caption = 'Totalização do Grupo '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBText13: TppDBText
          UserName = 'rpBemResumDBText13'
          DataField = 'NOME'
          DataPipeline = ppBalPatBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 3440
          mmWidth = 96044
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc1: TppDBCalc
          UserName = 'rpBemResumDBCalc1'
          DataField = 'VALORG0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc2: TppDBCalc
          UserName = 'rpBemResumDBCalc2'
          DataField = 'DEPLANC0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc3: TppDBCalc
          UserName = 'rpBemResumDBCalc3'
          DataField = 'DEPLANCATU0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 6879
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc4: TppDBCalc
          UserName = 'rpBemResumDBCalc4'
          DataField = 'CMBEM0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc5: TppDBCalc
          UserName = 'rpBemResumDBCalc5'
          DataField = 'CMDEP0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumDBCalc6: TppDBCalc
          UserName = 'rpBemResumDBCalc6'
          DataField = 'VALCTB0'
          DataPipeline = ppBalPatBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBemResumGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 6879
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel14: TppLabel
          UserName = 'rpBemResumLabel14'
          Caption = 'Vl Corrigido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 0
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel15: TppLabel
          UserName = 'rpBemResumLabel15'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 3440
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel16: TppLabel
          UserName = 'rpBemResumLabel16'
          Caption = 'Depr.Periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97102
          mmTop = 6879
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel17: TppLabel
          UserName = 'rpBemResumLabel17'
          Caption = 'C.M.Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 0
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel18: TppLabel
          UserName = 'rpBemResumLabel18'
          Caption = 'C.M. Deprec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 3440
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLabel19: TppLabel
          UserName = 'rpBemResumLabel19'
          Caption = 'Vl Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147902
          mmTop = 6879
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object rpBemResumLine3: TppLine
          UserName = 'rpBemResumLine3'
          ParentWidth = True
          Position = lpBottom
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updBalPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  DEPMES = :DEPMES,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB,'
      '  QUANT = :QUANT'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, DEPMES, CMDEP' +
        ', VALCTB, '
      '   QUANT)'
      'values'
      
        '  (:CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLANC, :DEPMES' +
        ', :CMDEP, '
      '   :VALCTB, :QUANT)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 512
    Top = 340
  end
  object qryBalPatGrp: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS DEPMES,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB,'
      '       (0)  AS QUANT'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE'
      ' ')
    UpdateObject = updBalPatGrp
    ValidateWithMask = True
    Left = 464
    Top = 343
    object qryBalPatGrpIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBalPatGrpCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryBalPatGrpDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBalPatGrpS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatGrpVALORG: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpCMBEM: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpCMDEP: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpVALCTB: TFloatField
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpDEPMES: TFloatField
      FieldName = 'DEPMES'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatGrpQUANT: TFloatField
      FieldName = 'QUANT'
      DisplayFormat = '#,000;(#,000)'
    end
  end
  object dsBalPatGrp: TwwDataSource
    DataSet = qryBalPatGrp
    Left = 568
    Top = 299
  end
  object ppBalPatGrp: TppBDEPipeline
    DataSource = dsBalPatGrp
    UserName = 'BalPatGrp'
    Left = 520
    Top = 286
    object ppBalPatGrpppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPO'
      FieldName = 'IDGRUPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatGrpppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppBalPatGrpppField3: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBalPatGrpppField4: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppBalPatGrpppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatGrpppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatGrpppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatGrpppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatGrpppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBalPatGrpppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPMES'
      FieldName = 'DEPMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBalPatGrpppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object rpBalPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppBalPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 464
    Top = 290
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Balancete Patrimonial por Grupo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 81492
        mmTop = 8731
        mmWidth = 101865
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29369
        mmWidth = 264107
        BandType = 0
      end
      object ppLabel67: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel67'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 116152
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpBalPatGrpLabel1: TppLabel
        UserName = 'rpBalPatGrpLabel1'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 24342
        mmWidth = 8202
        BandType = 0
      end
      object rpBalPatGrpLabel2: TppLabel
        UserName = 'rpBalPatGrpLabel2'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 24342
        mmWidth = 13494
        BandType = 0
      end
      object rpBalPatGrpLabel3: TppLabel
        UserName = 'rpBalPatGrpLabel3'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 93398
        mmTop = 24342
        mmWidth = 5821
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        AutoSize = False
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 24342
        mmWidth = 12700
        BandType = 0
      end
      object rpBalPatGrpLabel5: TppLabel
        UserName = 'rpBalPatGrpLabel5'
        AutoSize = False
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 24342
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatGrpLabel6: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        AutoSize = False
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 24342
        mmWidth = 25135
        BandType = 0
      end
      object rpBalPatGrpLabel7: TppLabel
        UserName = 'rpBalPatGrpLabel7'
        AutoSize = False
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 213519
        mmTop = 24342
        mmWidth = 23813
        BandType = 0
      end
      object rpBalPatGrpLabel8: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        AutoSize = False
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 24342
        mmWidth = 21167
        BandType = 0
      end
      object rpBalPatGrpLabel9: TppLabel
        UserName = 'rpBalPatGrpLabel9'
        AutoSize = False
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 211403
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatGrpLabel10: TppLabel
        UserName = 'rpBalPatGrpLabel10'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 241565
        mmTop = 9525
        mmWidth = 21960
        BandType = 0
      end
      object rpBalPatGrpLabel11: TppLabel
        UserName = 'rpBalPatGrpLabel11'
        AutoSize = False
        Caption = 'Deprec.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 191559
        mmTop = 24342
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatGrpLabel12: TppLabel
        UserName = 'rpBalPatGrpLabel12'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120386
        mmTop = 15875
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        AutoSize = False
        Caption = 'Quant'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 102394
        mmTop = 24342
        mmWidth = 8202
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpBalPatGrpDBText1: TppDBText
        OnPrint = rpBalPatGrpDBText1Print
        UserName = 'rpBalPatGrpDBText1'
        DataField = 'CLASSE'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpBalPatGrpDBText2: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 529
        mmWidth = 66675
        BandType = 4
      end
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 114036
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137848
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText6: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText7: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText8: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object rpBalPatGrpDBText3: TppDBText
        UserName = 'rpBalPatGrpDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object rpBalPatGrpDBText9: TppDBText
        UserName = 'rpBalPatGrpDBText9'
        BlankWhenZero = True
        DataField = 'DEPMES'
        DataPipeline = ppBalPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'QUANT'
        DataPipeline = ppBalPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 264107
        BandType = 8
      end
      object ppLabel68: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel68'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2910
        mmWidth = 63236
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
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
        mmLeft = 112448
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
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
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updBalPatCC: TUpdateSQL
    ModifySQL.Strings = (
      'update CENTCUST'
      'set'
      '  DESCCCUSTO = :DESCCCUSTO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPMES = :DEPMES,'
      '  VALCTB = :VALCTB'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    InsertSQL.Strings = (
      'insert into CENTCUST'
      
        '  (CODCENTROCUSTO, DESCCCUSTO, S_A, VALORG, CMBEM, DEPLANC, CMDE' +
        'P, DEPMES, '
      '   VALCTB)'
      'values'
      
        '  (:CODCENTROCUSTO, :DESCCCUSTO, :S_A, :VALORG, :CMBEM, :DEPLANC' +
        ', :CMDEP, '
      '   :DEPMES, :VALCTB)')
    DeleteSQL.Strings = (
      'delete from CENTCUST'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    Left = 200
    Top = 68
  end
  object qryBalPatCC: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,'
      '       NOME AS DESCCCUSTO,'
      '       STATUSGRUPOCDC AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS DEPMES,'
      '       (0)  AS VALCTB'
      'FROM CENTCUST'
      'WHERE (CODCENTROCUSTO IS NULL)'
      'ORDER BY CODCENTROCUSTO')
    UpdateObject = updBalPatCC
    ValidateWithMask = True
    Left = 264
    Top = 23
    object qryBalPatCCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryBalPatCCDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryBalPatCCS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatCCVALORG: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCCCMBEM: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCCDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCCCMDEP: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCCVALCTB: TFloatField
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCCDEPMES: TFloatField
      FieldName = 'DEPMES'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsBalPatCC: TwwDataSource
    DataSet = qryBalPatCC
    Left = 312
    Top = 11
  end
  object ppBalPatCC: TppBDEPipeline
    DataSource = dsBalPatCC
    UserName = 'BalPatCC'
    Left = 168
    Top = 14
    object ppBalPatCCppField1: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatCCppField2: TppField
      FieldAlias = 'DESCCCUSTO'
      FieldName = 'DESCCCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppBalPatCCppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppBalPatCCppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBalPatCCppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatCCppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatCCppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatCCppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatCCppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPMES'
      FieldName = 'DEPMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object rpBalPatCC: TppReport
    AutoStop = False
    DataPipeline = ppBalPatCC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 208
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78581
        mmTop = 8731
        mmWidth = 106627
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 264107
        BandType = 0
      end
      object ppLabel18: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel18'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 116152
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19315
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 19315
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 19315
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 117211
        mmTop = 19315
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139436
        mmTop = 19315
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 19315
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 210344
        mmTop = 19315
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 19315
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel29'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 214842
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'ppLabel30'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 243417
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatCCLabel1: TppLabel
        UserName = 'rpBalPatCCLabel1'
        Caption = 'Deprec.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 19315
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        OnPrint = ppDBText10Print
        UserName = 'ppDBText10'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataField = 'DESCCCUSTO'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 529
        mmWidth = 68263
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 106098
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 145521
        mmTop = 265
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 209550
        mmTop = 529
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 233892
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'S_A'
        DataPipeline = ppBalPatCC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 93663
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object rpBalPatCCDBText1: TppDBText
        UserName = 'rpBalPatCCDBText1'
        DataField = 'DEPMES'
        DataPipeline = ppBalPatCC
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 188119
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 264107
        BandType = 8
      end
      object ppLabel31: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel31'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryBemImovel2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDOPCIONAL, B.IDBEM, B.TAXADEP, B.DATAULTDEP, B.PLACA,'
      '       ('
      '       (DECODE(BEMACUM.VALBEMACUM,NULL,0,BEMACUM.VALBEMACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,NULL,0,ACRESACUM.VALACRESA' +
        'CUM)) -'
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,NULL,0,BXBEMACUM.BXVALBEMA' +
        'CUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,NULL,0,BXACRESACUM.BXV' +
        'ALACRESACUM))'
      '       ) AS VALORG0,'
      ''
      '       (REAVACUM.VALREAVACUM -'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,NULL,0,BXREAVACUM.BXVALR' +
        'EAVACUM)) AS VALREAVACUM0,'
      ''
      
        '       (DECODE(CMBEMATU.VALCMBEMATU    ,NULL,0,CMBEMATU.VALCMBEM' +
        'ATU) +'
      
        '        DECODE(CMREAVATU.VALCMREAVATU  ,NULL,0,CMREAVATU.VALCMRE' +
        'AVATU) +'
      
        '        DECODE(CMACRESATU.VALCMACRESATU,NULL,0,CMACRESATU.VALCMA' +
        'CRESATU)) AS CMBEMATU0,'
      ''
      
        '       (DECODE(CMBEMACUM.VALCMBEMACUM,NULL,0,CMBEMACUM.VALCMBEMA' +
        'CUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,NULL,0,CMREAVACUM.VALCMR' +
        'EAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,NULL,0,CMACRESACUM.VAL' +
        'CMACRESACUM) -'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,NULL,0,BXCMBEMACUM.BXV' +
        'ALCMBEMACUM) -'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,NULL,0,BXCMREAVACUM.' +
        'BXVALCMREAVACUM) -'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,NULL,0,BXCMACRESAC' +
        'UM.BXVALCMACRESACUM)) AS CMBEMACUM0,'
      ''
      
        '       (DECODE(DEPBEMATU.VALDEPBEMATU  ,NULL,0,DEPBEMATU.VALDEPB' +
        'EMATU) +'
      
        '        DECODE(DEPREAVATU.VALDEPREAVATU,NULL,0,DEPREAVATU.VALDEP' +
        'REAVATU) +'
      
        '        DECODE(DEPACRESATU.VALDEPACRESATU,NULL,0,DEPACRESATU.VAL' +
        'DEPACRESATU)) AS DEPLANCATU0,'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM  ,NULL,0,DEPBEMACUM.VALD' +
        'EPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,NULL,0,DEPREAVACUM.VAL' +
        'DEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,NULL,0,DEPACRESACUM.' +
        'VALDEPACRESACUM) -'
      
        '        DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM  ,NULL,0,BXDEPBEMACU' +
        'M.BXVALDEPBEMACUM) -'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,NULL,0,BXDEPREAVAC' +
        'UM.BXVALDEPREAVACUM) -'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM)) AS DEPLANCACUM0,'
      ''
      
        '       (DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM  ,NULL,0,CMDEPBEMACU' +
        'M.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,NULL,0,CMDEPREAVAC' +
        'UM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) -'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM  ,NULL,0,BXCMDEP' +
        'BEMACUM.BXVALCMDEPBEMACUM) -'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) -'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM)) AS CMDEPLANCACUM0,'
      '       (('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM,        NULL,0,DEPBEMACU' +
        'M.VALDEPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,      NULL,0,DEPREAVAC' +
        'UM.VALDEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,    NULL,0,DEPACRESA' +
        'CUM.VALDEPACRESACUM) +'
      
        '        DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM,    NULL,0,CMDEPBEMA' +
        'CUM.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,  NULL,0,CMDEPREAV' +
        'ACUM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM,    NULL,0,BXDEPBEMA' +
        'CUM.BXVALDEPBEMACUM) +'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,  NULL,0,BXDEPREAV' +
        'ACUM.BXVALDEPREAVACUM) +'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM) +'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,NULL,0,BXCMDEPBE' +
        'MACUM.BXVALCMDEPBEMACUM) +'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) +'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM) )'
      '       )) AS VALCTB0,'
      ''
      '       (ULTREAVACUM.VALULTREAVACUM -'
      
        '        DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM)) AS VALULTREAVACUM1,'
      '       ULTCMREAVATU.VALULTCMREAVATU,'
      '       (ULTCMREAVACUM.VALULTCMREAVACUM -'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM)) AS VALULTCMREAVACUM1,'
      '       ULTDEPREAVATU.VALULTDEPREAVATU,'
      '       (ULTDEPREAVACUM.VALULTDEPREAVACUM -'
      
        '        DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM)) AS VALULTDEPREAVACUM1,'
      '       (ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM -'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM)) AS VALULTCMDEPREAVACUM' +
        '1,'
      ''
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) ) -'
      
        '       (DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM,NULL,0,ULTDEPREA' +
        'VACUM.VALULTDEPREAVACUM) +'
      
        '        DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM,NULL,0,ULTCM' +
        'DEPREAVACUM.VALULTCMDEPREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) ) -'
      
        '       (DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM) +'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM) )'
      '       )) AS VALCTB1,'
      ''
      
        '       (DECODE(REAVACUM.VALREAVACUM      ,NULL,0,REAVACUM.VALREA' +
        'VACUM) +'
      
        '        DECODE(ULTREAVACUM.VALULTREAVACUM,NULL,0,ULTREAVACUM.VAL' +
        'ULTREAVACUM) -'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM  ,NULL,0,BXREAVACUM.BXVA' +
        'LREAVACUM) -'
      
        '        DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM)) AS SUMPARCREAV,'
      ''
      
        '       (DECODE(CMBEMATU.VALCMBEMATU  ,NULL,0,CMBEMATU.VALCMBEMAT' +
        'U) +'
      
        '        DECODE(CMREAVATU.VALCMREAVATU,NULL,0,CMREAVATU.VALCMREAV' +
        'ATU) +'
      
        '        DECODE(CMACRESATU.VALCMACRESATU,NULL,0,CMACRESATU.VALCMA' +
        'CRESATU) +'
      
        '        DECODE(ULTCMREAVATU.VALULTCMREAVATU,NULL,0,ULTCMREAVATU.' +
        'VALULTCMREAVATU)) AS SUMCMBEMATU,'
      ''
      
        '       (DECODE(CMBEMACUM.VALCMBEMACUM  ,NULL,0,CMBEMACUM.VALCMBE' +
        'MACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,NULL,0,CMREAVACUM.VALCMR' +
        'EAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,NULL,0,CMACRESACUM.VAL' +
        'CMACRESACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) -'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM  ,NULL,0,BXCMBEMACUM.B' +
        'XVALCMBEMACUM) -'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,NULL,0,BXCMREAVACUM.' +
        'BXVALCMREAVACUM) -'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,NULL,0,BXCMACRESAC' +
        'UM.BXVALCMACRESACUM) -'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM)) AS SUMCMBEMACUM,'
      ''
      
        '       (DECODE(DEPBEMATU.VALDEPBEMATU  ,NULL,0,DEPBEMATU.VALDEPB' +
        'EMATU) +'
      
        '        DECODE(DEPREAVATU.VALDEPREAVATU,NULL,0,DEPREAVATU.VALDEP' +
        'REAVATU) +'
      
        '        DECODE(DEPACRESATU.VALDEPACRESATU,NULL,0,DEPACRESATU.VAL' +
        'DEPACRESATU) +'
      
        '        DECODE(ULTDEPREAVATU.VALULTDEPREAVATU,NULL,0,ULTDEPREAVA' +
        'TU.VALULTDEPREAVATU)) AS SUMDEPATU,'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM  ,NULL,0,DEPBEMACUM.VALD' +
        'EPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,NULL,0,DEPREAVACUM.VAL' +
        'DEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,NULL,0,DEPACRESACUM.' +
        'VALDEPACRESACUM) +'
      
        '        DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM,NULL,0,ULTDEPREA' +
        'VACUM.VALULTDEPREAVACUM) -'
      
        '        DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM  ,NULL,0,BXDEPBEMACU' +
        'M.BXVALDEPBEMACUM) -'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,NULL,0,BXDEPREAVAC' +
        'UM.BXVALDEPREAVACUM) -'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM) -'
      
        '        DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM)) AS SUMDEPACUM,'
      ''
      
        '       (DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM  ,NULL,0,CMDEPBEMACU' +
        'M.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,NULL,0,CMDEPREAVAC' +
        'UM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) +'
      
        '        DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM,NULL,0,ULTCM' +
        'DEPREAVACUM.VALULTCMDEPREAVACUM) -'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM  ,NULL,0,BXCMDEP' +
        'BEMACUM.BXVALCMDEPBEMACUM) -'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) -'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM) -'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM)) AS SUMCMDEPACUM,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(DEPBEMACUM.VALDEPBEMACUM,        NULL,0,DEPBEMACU' +
        'M.VALDEPBEMACUM) +'
      
        '        DECODE(DEPREAVACUM.VALDEPREAVACUM,      NULL,0,DEPREAVAC' +
        'UM.VALDEPREAVACUM) +'
      
        '        DECODE(DEPACRESACUM.VALDEPACRESACUM,    NULL,0,DEPACRESA' +
        'CUM.VALDEPACRESACUM) +'
      
        '        DECODE(CMDEPBEMACUM.VALCMDEPBEMACUM,    NULL,0,CMDEPBEMA' +
        'CUM.VALCMDEPBEMACUM) +'
      
        '        DECODE(CMDEPREAVACUM.VALCMDEPREAVACUM,  NULL,0,CMDEPREAV' +
        'ACUM.VALCMDEPREAVACUM) +'
      
        '        DECODE(CMDEPACRESACUM.VALCMDEPACRESACUM,NULL,0,CMDEPACRE' +
        'SACUM.VALCMDEPACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) ) -'
      ''
      
        '       (DECODE(BXDEPBEMACUM.BXVALDEPBEMACUM,    NULL,0,BXDEPBEMA' +
        'CUM.BXVALDEPBEMACUM) +'
      
        '        DECODE(BXDEPREAVACUM.BXVALDEPREAVACUM,  NULL,0,BXDEPREAV' +
        'ACUM.BXVALDEPREAVACUM) +'
      
        '        DECODE(BXDEPACRESACUM.BXVALDEPACRESACUM,NULL,0,BXDEPACRE' +
        'SACUM.BXVALDEPACRESACUM) +'
      
        '        DECODE(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,NULL,0,BXCMDEPBE' +
        'MACUM.BXVALCMDEPBEMACUM) +'
      
        '        DECODE(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,NULL,0,BXCMDEP' +
        'REAVACUM.BXVALCMDEPREAVACUM) +'
      
        '        DECODE(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,NULL,0,BXCMD' +
        'EPACRESACUM.BXVALCMDEPACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) ) -'
      
        '       (DECODE(ULTDEPREAVACUM.VALULTDEPREAVACUM,NULL,0,ULTDEPREA' +
        'VACUM.VALULTDEPREAVACUM) +'
      
        '        DECODE(ULTCMDEPREAVACUM.VALULTCMDEPREAVACUM,NULL,0,ULTCM' +
        'DEPREAVACUM.VALULTCMDEPREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) ) -'
      
        '       (DECODE(BXULTDEPREAVACUM.BXVALULTDEPREAVACUM,NULL,0,BXULT' +
        'DEPREAVACUM.BXVALULTDEPREAVACUM) +'
      
        '        DECODE(BXULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM,NULL,0,B' +
        'XULTCMDEPREAVACUM.BXVALULTCMDEPREAVACUM) )'
      '       ))) AS SUMVALCTB,'
      ''
      '       ((('
      
        '       (DECODE(BEMACUM.VALBEMACUM,              NULL,0,BEMACUM.V' +
        'ALBEMACUM) +'
      
        '        DECODE(REAVACUM.VALREAVACUM,            NULL,0,REAVACUM.' +
        'VALREAVACUM) +'
      
        '        DECODE(ACRESACUM.VALACRESACUM,          NULL,0,ACRESACUM' +
        '.VALACRESACUM) +'
      
        '        DECODE(CMBEMACUM.VALCMBEMACUM,          NULL,0,CMBEMACUM' +
        '.VALCMBEMACUM) +'
      
        '        DECODE(CMREAVACUM.VALCMREAVACUM,        NULL,0,CMREAVACU' +
        'M.VALCMREAVACUM) +'
      
        '        DECODE(CMACRESACUM.VALCMACRESACUM,      NULL,0,CMACRESAC' +
        'UM.VALCMACRESACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXBEMACUM.BXVALBEMACUM,          NULL,0,BXBEMACUM' +
        '.BXVALBEMACUM) +'
      
        '        DECODE(BXREAVACUM.BXVALREAVACUM,        NULL,0,BXREAVACU' +
        'M.BXVALREAVACUM) +'
      
        '        DECODE(BXACRESACUM.BXVALACRESACUM,      NULL,0,BXACRESAC' +
        'UM.BXVALACRESACUM) +'
      
        '        DECODE(BXCMBEMACUM.BXVALCMBEMACUM,      NULL,0,BXCMBEMAC' +
        'UM.BXVALCMBEMACUM) +'
      
        '        DECODE(BXCMREAVACUM.BXVALCMREAVACUM,    NULL,0,BXCMREAVA' +
        'CUM.BXVALCMREAVACUM) +'
      
        '        DECODE(BXCMACRESACUM.BXVALCMACRESACUM,  NULL,0,BXCMACRES' +
        'ACUM.BXVALCMACRESACUM) )'
      '       )) +'
      '       (('
      
        '       (DECODE(ULTREAVACUM.VALULTREAVACUM    ,NULL,0,ULTREAVACUM' +
        '.VALULTREAVACUM) +'
      
        '        DECODE(ULTCMREAVACUM.VALULTCMREAVACUM,NULL,0,ULTCMREAVAC' +
        'UM.VALULTCMREAVACUM) )'
      '       ) -'
      '       ('
      
        '       (DECODE(BXULTREAVACUM.BXVALULTREAVACUM,NULL,0,BXULTREAVAC' +
        'UM.BXVALULTREAVACUM) +'
      
        '        DECODE(BXULTCMREAVACUM.BXVALULTCMREAVACUM,NULL,0,BXULTCM' +
        'REAVACUM.BXVALULTCMREAVACUM) )'
      '       ))) AS SUMVALCTBIMOB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM BEM B, CONJUNTO C, GRUPO G,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMATU,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,21,43))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAT' +
        'U'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'TU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,36,51))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VATU'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO = :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVATU,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTDEPREA' +
        'VACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALULTCMDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ULTCMDEPREAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRES' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPAC' +
        'RESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTDEPR' +
        'EAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALULTCMDE' +
        'PREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXULTCMDEPREAVACUM'
      ''
      'WHERE (G.FLGIMOVEL = 1)'
      ''
      ''
      ''
      
        '  AND ((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NUL' +
        'L))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDGRUPO    = G.IDGRUPO)'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVATU.IDBEM(+))'
      '  AND (B.IDBEM = ULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESATU.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXULTCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      ''
      'ORDER BY B.IDOPCIONAL, C.DESCCONJUNTO, B.IDGRUPO, B.DESBEM'
      '')
    ValidateWithMask = True
    Left = 464
    Top = 132
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDBEM'
    end
    object FloatField2: TFloatField
      FieldName = 'TAXADEP'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object FloatField3: TFloatField
      FieldName = 'PLACA'
    end
    object FloatField4: TFloatField
      DisplayWidth = 12
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField5: TFloatField
      DisplayWidth = 12
      FieldName = 'VALREAVACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField6: TFloatField
      DisplayWidth = 12
      FieldName = 'CMBEMATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField7: TFloatField
      DisplayWidth = 12
      FieldName = 'CMBEMACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField8: TFloatField
      DisplayWidth = 12
      FieldName = 'DEPLANCATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField9: TFloatField
      DisplayWidth = 12
      FieldName = 'DEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField10: TFloatField
      DisplayWidth = 12
      FieldName = 'CMDEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField11: TFloatField
      DisplayWidth = 12
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField12: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField13: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTCMREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField14: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTCMREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField15: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTDEPREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField16: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField17: TFloatField
      DisplayWidth = 12
      FieldName = 'VALULTCMDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField18: TFloatField
      DisplayWidth = 12
      FieldName = 'VALCTB1'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField19: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMPARCREAV'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField20: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMCMBEMATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField21: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMCMBEMACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField22: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMDEPATU'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField23: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField24: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMCMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField25: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object FloatField26: TFloatField
      DisplayWidth = 12
      FieldName = 'SUMVALCTBIMOB'
      DisplayFormat = '#,0.00;(#,0.00)'
      Precision = 2
    end
    object StringField1: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object FloatField27: TFloatField
      FieldName = 'IDGRUPO'
    end
    object FloatField28: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object StringField2: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object StringField3: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemImovel2IDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
  end
  object dsBemImovel2: TwwDataSource
    DataSet = qryBemImovel2
    Left = 464
    Top = 120
  end
  object ppBemImovel2: TppBDEPipeline
    DataSource = dsBemImovel2
    UserName = 'BemImovel2'
    Left = 464
    Top = 108
  end
  object rpBemImovel2: TppReport
    AutoStop = False
    DataPipeline = ppBemImovel2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 464
    Top = 96
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'ppLabel43'
        AutoSize = False
        Caption = 'Balancete Patrimonial de Bens Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 7408
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'ppLabel44'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 12965
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'ppLabel46'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 12965
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        UserName = 'ppLabel47'
        Caption = 'Valor Contábil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'VALREAVACUM0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 106363
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        AutoSize = True
        DataField = 'VALULTREAVACUM1'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100806
        mmTop = 6085
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        AutoSize = True
        DataField = 'CMBEMATU0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134938
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        AutoSize = True
        DataField = 'CMBEMACUM0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        AutoSize = True
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 794
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        AutoSize = True
        DataField = 'VALULTDEPREAVATU'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 5821
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        AutoSize = True
        DataField = 'CMDEPLANCACUM0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 229130
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        AutoSize = True
        DataField = 'DEPLANCACUM0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 204259
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        DataField = 'VALULTDEPREAVACUM1'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 202936
        mmTop = 5556
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
        AutoSize = True
        DataField = 'VALCTB0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 270669
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        DataField = 'VALCTB1'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259821
        mmTop = 5821
        mmWidth = 23283
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'Reavaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 5821
        mmWidth = 17463
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'ppLine24'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 4498
        mmTop = 14023
        mmWidth = 280194
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'ppDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppBemImovel2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 8731
        mmLeft = 4763
        mmTop = 794
        mmWidth = 45244
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText27: TppDBText
        UserName = 'ppDBText27'
        DataField = 'VALULTCMDEPREAVACUM1'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 230188
        mmTop = 5556
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        AutoSize = True
        DataField = 'VALULTCMREAVACUM1'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 5821
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
        AutoSize = True
        DataField = 'VALULTCMREAVATU'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 5821
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        AutoSize = True
        DataField = 'VALORG0'
        DataPipeline = ppBemImovel2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 89429
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
        DataField = 'PLACA'
        DataPipeline = ppBemImovel2
        DisplayFormat = '## ## ##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 9260
        mmWidth = 45508
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'ppLine25'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object rpBemImovel2Group1: TppGroup
      BreakName = 'IDOPCIONAL'
      DataPipeline = ppBemImovel2
      UserName = 'rpBemImovel2Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBemImovel2GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpBemImovel2DBText1: TppDBText
          UserName = 'rpBemImovel2DBText1'
          AutoSize = True
          DataField = 'IDOPCIONAL'
          DataPipeline = ppBemImovel2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 0
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpBemImovel2Label1: TppLabel
          UserName = 'rpBemImovel2Label1'
          Caption = 'Imóvel SAF : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object rpBemImovel2Line1: TppLine
          UserName = 'rpBemImovel2Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBemImovel2GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpBemImovel2Label2: TppLabel
          UserName = 'rpBemImovel2Label2'
          Caption = 'Soma do Imóvel SAF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc1: TppDBCalc
          UserName = 'rpBemImovel2DBCalc1'
          AutoSize = True
          DataField = 'VALORG0'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 79640
          mmTop = 1323
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc2: TppDBCalc
          UserName = 'rpBemImovel2DBCalc2'
          AutoSize = True
          DataField = 'SUMPARCREAV'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 97367
          mmTop = 1323
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc3: TppDBCalc
          UserName = 'rpBemImovel2DBCalc3'
          AutoSize = True
          DataField = 'SUMCMBEMATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 120386
          mmTop = 1323
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc4: TppDBCalc
          UserName = 'rpBemImovel2DBCalc4'
          AutoSize = True
          DataField = 'SUMCMBEMACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142611
          mmTop = 1323
          mmWidth = 34660
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc5: TppDBCalc
          UserName = 'rpBemImovel2DBCalc5'
          AutoSize = True
          DataField = 'SUMDEPATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 174625
          mmTop = 1323
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc6: TppDBCalc
          UserName = 'rpBemImovel2DBCalc6'
          AutoSize = True
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 197380
          mmTop = 1323
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc7: TppDBCalc
          UserName = 'rpBemImovel2DBCalc7'
          AutoSize = True
          DataField = 'SUMCMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221986
          mmTop = 1323
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2DBCalc8: TppDBCalc
          UserName = 'rpBemImovel2DBCalc8'
          AutoSize = True
          DataField = 'SUMVALCTB'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 257705
          mmTop = 1323
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovel2Line2: TppLine
          UserName = 'rpBemImovel2Line2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONJUNTO'
      DataPipeline = ppBemImovel2
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine26: TppLine
          UserName = 'ppLine26'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 5292
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel50: TppLabel
          UserName = 'ppLabel50'
          Caption = 'Imóvel TotalPrev : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 31750
          BandType = 3
          GroupNo = 1
        end
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
          AutoSize = True
          DataField = 'DESCCONJUNTO'
          DataPipeline = ppBemImovel2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 32279
          mmTop = 794
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 7408
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          AutoSize = True
          DataField = 'SUMPARCREAV'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 97367
          mmTop = 2117
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          AutoSize = True
          DataField = 'SUMCMBEMATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 120386
          mmTop = 2117
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'ppDBCalc3'
          AutoSize = True
          DataField = 'SUMCMBEMACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142611
          mmTop = 2117
          mmWidth = 34660
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          AutoSize = True
          DataField = 'SUMDEPATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 174625
          mmTop = 2117
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          AutoSize = True
          DataField = 'SUMVALCTB'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 257705
          mmTop = 1852
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'ppDBCalc6'
          AutoSize = True
          DataField = 'SUMCMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221986
          mmTop = 2117
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'ppDBCalc7'
          AutoSize = True
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 197380
          mmTop = 2117
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'ppDBCalc8'
          AutoSize = True
          DataField = 'VALORG0'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 79640
          mmTop = 2117
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'ppLabel51'
          Caption = 'Soma do Imóvel TotalPrev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2117
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = ppBemImovel2
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object ppLine28: TppLine
          UserName = 'ppLine28'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 4233
          mmTop = 5556
          mmWidth = 280194
          BandType = 3
          GroupNo = 2
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText33'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppBemImovel2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 19315
          mmTop = 794
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object ppLabel52: TppLabel
          UserName = 'ppLabel52'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 81227
          mmTop = 6615
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel53: TppLabel
          UserName = 'ppLabel53'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 118269
          mmTop = 6615
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLabel54: TppLabel
          UserName = 'ppLabel54'
          Caption = 'Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112184
          mmTop = 10054
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 94456
          mmTop = 10054
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel56'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141552
          mmTop = 10054
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'ppLabel58'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 6615
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object ppLabel59: TppLabel
          UserName = 'ppLabel59'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 161132
          mmTop = 10054
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel85: TppLabel
          UserName = 'ppLabel85'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 261409
          mmTop = 6615
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel87: TppLabel
          UserName = 'ppLabel87'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 209550
          mmTop = 6350
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel88: TppLabel
          UserName = 'ppLabel88'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 211138
          mmTop = 9790
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel89: TppLabel
          UserName = 'ppLabel89'
          Caption = 'Deprec. Acum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 236009
          mmTop = 9790
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object ppLabel90: TppLabel
          UserName = 'ppLabel90'
          Caption = 'Corr. Mon. da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 236803
          mmTop = 6350
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppLabel91: TppLabel
          UserName = 'ppLabel91'
          Caption = 'No Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 191294
          mmTop = 10054
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel92: TppLabel
          UserName = 'ppLabel92'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 184415
          mmTop = 6615
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLine29: TppLine
          UserName = 'ppLine29'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 4233
          mmTop = 14288
          mmWidth = 280194
          BandType = 3
          GroupNo = 1
        end
        object ppLabel93: TppLabel
          UserName = 'ppLabel93'
          Caption = 'Grupo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5292
          mmTop = 794
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLine30: TppLine
          UserName = 'ppLine30'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 4233
          mmTop = 6350
          mmWidth = 280194
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          AutoSize = True
          DataField = 'VALORG0'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 79640
          mmTop = 1588
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          AutoSize = True
          DataField = 'SUMPARCREAV'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 97367
          mmTop = 1588
          mmWidth = 31485
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          AutoSize = True
          DataField = 'SUMCMBEMATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 120386
          mmTop = 1588
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'ppDBCalc12'
          AutoSize = True
          DataField = 'SUMCMBEMACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142611
          mmTop = 1588
          mmWidth = 34660
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          AutoSize = True
          DataField = 'SUMDEPATU'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 174625
          mmTop = 1588
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          AutoSize = True
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 197380
          mmTop = 1588
          mmWidth = 29898
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc15'
          AutoSize = True
          DataField = 'SUMCMDEPACUM'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 221986
          mmTop = 1852
          mmWidth = 34396
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'ppDBCalc16'
          AutoSize = True
          DataField = 'SUMVALCTB'
          DataPipeline = ppBemImovel2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 257705
          mmTop = 1852
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppLabel94: TppLabel
          UserName = 'ppLabel94'
          Caption = 'Soma do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 1323
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qrySldCtbImoveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT I.IDIMOVELMESTRE, B.IDGRUPO, G.NOME AS DESCGRUPO, IMOMEST' +
        'RE.NOME,'
      '       I.IMONOME,  '
      '       (SB.VALORG + SB.CMBEM)                 AS CUSTOCORR0,'
      '       (SB.DEPLANC + SB.CMDEP)                AS DEPBEMACUM0,'
      '       (NVL(ATU.VALDEPBEM,0))                 AS DEPBEMATU0,'
      '       (((NVL(ATU.VALDEPBEM,0)) /'
      '         DECODE((SB.VALORG + SB.CMBEM), 0,'
      
        '                1, (SB.VALORG + SB.CMBEM))) * 12 * 100) AS TAXAD' +
        'EP,'
      '       (SB.REAVVALORG + SB.ULTREAVVALORG +'
      '        SB.REAVCMBEM  + SB.ULTREAVCMBEM)      AS CUSTOREAV0,'
      '       (SB.REAVDEPLANC + SB.ULTREAVDEPLANC +'
      '        SB.REAVCMDEP   + SB.ULTREAVCMDEP)     AS DEPREAVACUM0,'
      '       (NVL(ATU.VALDEPREAV,0) +'
      '        NVL(ATU.VALDEPULTREAV,0))             AS DEPREAVATU0,'
      '       (((NVL(ATU.VALDEPREAV,0) +'
      '          NVL(ATU.VALDEPULTREAV,0)) /'
      '         DECODE((SB.REAVVALORG + SB.ULTREAVVALORG +'
      '                 SB.REAVCMBEM + SB.ULTREAVCMBEM), 0,'
      '                1, (SB.REAVVALORG + SB.ULTREAVVALORG +'
      
        '                    SB.REAVCMBEM + SB.ULTREAVCMBEM))) * 12 * 100' +
        ') AS TAXADEPREAV,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)  AS VALCTB0'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     (SELECT IDIMOVEL, IMONOME AS NOME'
      '      FROM IMOVEL'
      '      WHERE IDIMOVELMESTRE IS NULL) IMOMESTRE,'
      ''
      '     IMOVEL I, IMOVELXBEM IXB, BEM B, GRUPO G'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      ''
      '  AND (G.FLGIMOVEL = 1)'
      
        '  AND (ABS(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEPLANC,0' +
        ') - NVL(SB.CMDEP,0) +'
      
        '           NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) - NVL(SB.R' +
        'EAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '           NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0) - NV' +
        'L(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,0)) >= 0.01)'
      '  AND (I.IDIMOVEL = IXB.IDIMOVEL)'
      '  AND (I.IDIMOVELMESTRE = IMOMESTRE.IDIMOVEL)'
      '  AND (IXB.IDBEM = B.IDBEM)'
      '  AND (IXB.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'ORDER BY IMOMESTRE.NOME, B.IDGRUPO, I.IMONOME'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 461
    Top = 51
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qrySldCtbImoveisIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qrySldCtbImoveisIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qrySldCtbImoveisDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySldCtbImoveisNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySldCtbImoveisIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object qrySldCtbImoveisCUSTOCORR0: TFloatField
      FieldName = 'CUSTOCORR0'
    end
    object qrySldCtbImoveisDEPBEMACUM0: TFloatField
      FieldName = 'DEPBEMACUM0'
    end
    object qrySldCtbImoveisDEPBEMATU0: TFloatField
      FieldName = 'DEPBEMATU0'
    end
    object qrySldCtbImoveisTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qrySldCtbImoveisCUSTOREAV0: TFloatField
      FieldName = 'CUSTOREAV0'
    end
    object qrySldCtbImoveisDEPREAVACUM0: TFloatField
      FieldName = 'DEPREAVACUM0'
    end
    object qrySldCtbImoveisDEPREAVATU0: TFloatField
      FieldName = 'DEPREAVATU0'
    end
    object qrySldCtbImoveisTAXADEPREAV: TFloatField
      FieldName = 'TAXADEPREAV'
    end
    object qrySldCtbImoveisVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
  object dsSldCtbImoveis: TwwDataSource
    DataSet = qrySldCtbImoveis
    Left = 471
    Top = 101
  end
  object ppSldCtbImoveis: TppBDEPipeline
    DataSource = dsSldCtbImoveis
    UserName = 'SldCtbImoveis'
    Left = 462
    Top = 23
  end
  object rpSldCtbImoveis: TppReport
    AutoStop = False
    DataPipeline = ppSldCtbImoveis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rpSldCtbImoveis'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 462
    Top = 9
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Balancete Patrimonial de Imóveis - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 98690
        mmTop = 7144
        mmWidth = 88900
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 12700
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel99: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel99'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 131234
        mmTop = 529
        mmWidth = 21960
        BandType = 0
      end
      object rpSldCtbImoveisLabel1: TppLabel
        UserName = 'rpSldCtbImoveisLabel1'
        Caption = 'Movimentados até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 237596
        mmTop = 7408
        mmWidth = 28840
        BandType = 0
      end
      object rpSldCtbImoveisLabel2: TppLabel
        UserName = 'rpSldCtbImoveisLabel2'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 266701
        mmTop = 7408
        mmWidth = 16933
        BandType = 0
      end
      object rpSldCtbImoveisLabel3: TppLabel
        UserName = 'rpSldCtbImoveisLabel3'
        Caption = 'Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 13229
        mmWidth = 11377
        BandType = 0
      end
      object rpSldCtbImoveisLabel4: TppLabel
        UserName = 'rpSldCtbImoveisLabel4'
        Caption = 'Custo Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 13229
        mmWidth = 23548
        BandType = 0
      end
      object rpSldCtbImoveisLabel5: TppLabel
        UserName = 'rpSldCtbImoveisLabel5'
        Caption = 'Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110067
        mmTop = 17727
        mmWidth = 17198
        BandType = 0
      end
      object rpSldCtbImoveisLabel6: TppLabel
        UserName = 'rpSldCtbImoveisLabel6'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 139700
        mmTop = 17727
        mmWidth = 6615
        BandType = 0
      end
      object rpSldCtbImoveisLabel8: TppLabel
        UserName = 'rpSldCtbImoveisLabel8'
        Caption = 'Sld.Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265113
        mmTop = 13229
        mmWidth = 18521
        BandType = 0
      end
      object rpSldCtbImoveisLabel9: TppLabel
        UserName = 'rpSldCtbImoveisLabel9'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 13229
        mmWidth = 19050
        BandType = 0
      end
      object rpSldCtbImoveisLabel10: TppLabel
        UserName = 'rpSldCtbImoveisLabel10'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 17727
        mmWidth = 6615
        BandType = 0
      end
      object rpSldCtbImoveisLine1: TppLine
        UserName = 'rpSldCtbImoveisLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284427
        BandType = 0
      end
      object rpSldCtbImoveisLabel12: TppLabel
        UserName = 'rpSldCtbImoveisLabel12'
        Caption = 'Taxa a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 242094
        mmTop = 17727
        mmWidth = 14288
        BandType = 0
      end
      object rpSldCtbImoveisLabel13: TppLabel
        UserName = 'rpSldCtbImoveisLabel13'
        Caption = 'Taxa a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 17727
        mmWidth = 14288
        BandType = 0
      end
      object rpSldCtbImoveisLabel14: TppLabel
        UserName = 'rpSldCtbImoveisLabel14'
        Caption = 'Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 198967
        mmTop = 17727
        mmWidth = 17198
        BandType = 0
      end
      object rpSldCtbImoveisLabel15: TppLabel
        UserName = 'rpSldCtbImoveisLabel15'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222250
        mmTop = 13229
        mmWidth = 19050
        BandType = 0
      end
      object rpSldCtbImoveisLabel16: TppLabel
        UserName = 'rpSldCtbImoveisLabel16'
        Caption = 'Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 172244
        mmTop = 13229
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpSldCtbImoveisDBText3: TppDBText
        UserName = 'rpSldCtbImoveisDBText3'
        DataField = 'IMONOME'
        DataPipeline = ppSldCtbImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 75671
        BandType = 4
      end
      object rpSldCtbImoveisDBText4: TppDBText
        UserName = 'rpSldCtbImoveisDBText4'
        DataField = 'CUSTOCORR0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 265
        mmWidth = 27940
        BandType = 4
      end
      object rpSldCtbImoveisDBText5: TppDBText
        UserName = 'rpSldCtbImoveisDBText5'
        DataField = 'DEPREAVATU0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object rpSldCtbImoveisDBText7: TppDBText
        UserName = 'rpSldCtbImoveisDBText7'
        DataField = 'DEPBEMACUM0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object rpSldCtbImoveisDBText8: TppDBText
        UserName = 'rpSldCtbImoveisDBText8'
        DataField = 'DEPBEMATU0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object rpSldCtbImoveisDBText9: TppDBText
        UserName = 'rpSldCtbImoveisDBText9'
        DataField = 'VALCTB0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256911
        mmTop = 265
        mmWidth = 27517
        BandType = 4
      end
      object rpSldCtbImoveisDBText6: TppDBText
        UserName = 'rpSldCtbImoveisDBText6'
        DataField = 'DEPREAVACUM0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object rpSldCtbImoveisDBText10: TppDBText
        UserName = 'rpSldCtbImoveisDBText10'
        DataField = 'CUSTOREAV0'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataPipeline = ppSldCtbImoveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 0
        mmLeft = 153723
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'TAXADEP'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'TAXADEPREAV'
        DataPipeline = ppSldCtbImoveis
        DisplayFormat = '#,0.0000;(#,0.0000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine38: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel100: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel100'
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
        mmTop = 1058
        mmWidth = 66940
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 1058
        mmWidth = 45244
        BandType = 8
      end
    end
    object rpSldCtbImoveisGroup1: TppGroup
      BreakName = 'IDIMOVELMESTRE'
      DataPipeline = ppSldCtbImoveis
      UserName = 'rpSldCtbImoveisGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSldCtbImoveisGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpSldCtbImoveisDBText1: TppDBText
          UserName = 'rpSldCtbImoveisDBText1'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppSldCtbImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 265
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpSldCtbImoveisLine2: TppLine
          UserName = 'rpSldCtbImoveisLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5291
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSldCtbImoveisGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpSldCtbImoveisDBCalc6: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc6'
          DataField = 'VALCTB0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 256911
          mmTop = 794
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc7: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc7'
          DataField = 'DEPREAVATU0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 220398
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc8: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc8'
          DataField = 'DEPBEMATU0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 132821
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc9: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc9'
          DataField = 'DEPBEMACUM0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 104511
          mmTop = 794
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc10: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc10'
          DataField = 'CUSTOCORR0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 76200
          mmTop = 794
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisLine5: TppLine
          UserName = 'rpSldCtbImoveisLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisLine6: TppLine
          UserName = 'rpSldCtbImoveisLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisLabel11: TppLabel
          UserName = 'rpSldCtbImoveisLabel11'
          Caption = 'Soma Imóvel Mestre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 794
          mmWidth = 33338
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc12: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc12'
          DataField = 'DEPREAVACUM0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 194998
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpSldCtbImoveisDBCalc14: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc14'
          DataField = 'CUSTOREAV0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSldCtbImoveisGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 169069
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpSldCtbImoveisGroup2: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = ppSldCtbImoveis
      UserName = 'rpSldCtbImoveisGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSldCtbImoveisGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpSldCtbImoveisDBText2: TppDBText
          UserName = 'rpSldCtbImoveisDBText2'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppSldCtbImoveis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 265
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object rpSldCtbImoveisLine3: TppLine
          UserName = 'rpSldCtbImoveisLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 284427
          BandType = 3
          GroupNo = 1
        end
      end
      object rpSldCtbImoveisGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpSldCtbImoveisDBCalc1: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc1'
          DataField = 'CUSTOCORR0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 76200
          mmTop = 794
          mmWidth = 27940
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc2: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc2'
          DataField = 'DEPBEMACUM0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 794
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc3: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc3'
          DataField = 'DEPBEMATU0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc4: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc4'
          DataField = 'DEPREAVATU0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 220398
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc5: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc5'
          DataField = 'VALCTB0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 256911
          mmTop = 794
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisLine4: TppLine
          UserName = 'rpSldCtbImoveisLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisLabel7: TppLabel
          UserName = 'rpSldCtbImoveisLabel7'
          Caption = 'Soma '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 794
          mmWidth = 7673
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc11: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc11'
          DataField = 'DEPREAVACUM0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 194734
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object rpSldCtbImoveisDBCalc13: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc13'
          DataField = 'CUSTOREAV0'
          DataPipeline = ppSldCtbImoveis
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSldCtbImoveisGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169069
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qrySldCtbImoMestre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IMOMESTRE.NOME, G.NOME AS DESCGRUPO,'
      
        '       ROUND(SUM(SB.VALORG + SB.CMBEM),2)                 AS CUS' +
        'TOCORR0,'
      
        '       ROUND(SUM(SB.DEPLANC + SB.CMDEP),2)                AS DEP' +
        'BEMACUM0,'
      
        '       ROUND(SUM(NVL(ATU.VALDEPBEM,0)),2)                 AS DEP' +
        'BEMATU0,'
      '       ROUND(((SUM(NVL(ATU.VALDEPBEM,0)) /'
      '             DECODE(SUM(SB.VALORG + SB.CMBEM), 0,'
      
        '                    1, SUM(SB.VALORG + SB.CMBEM))) * 12 * 100),6' +
        ') AS TAXADEP,'
      '       ROUND(SUM(SB.REAVVALORG + SB.ULTREAVVALORG +'
      
        '             SB.REAVCMBEM  + SB.ULTREAVCMBEM),2)      AS CUSTORE' +
        'AV0,'
      '       ROUND(SUM(SB.REAVDEPLANC + SB.ULTREAVDEPLANC +'
      
        '             SB.REAVCMDEP   + SB.ULTREAVCMDEP),2)     AS DEPREAV' +
        'ACUM0,'
      '       ROUND(SUM(NVL(ATU.VALDEPREAV,0) +'
      
        '                 NVL(ATU.VALDEPULTREAV,0)),2)         AS DEPREAV' +
        'ATU0,'
      '       ROUND(((SUM(NVL(ATU.VALDEPREAV,0) +'
      '                   NVL(ATU.VALDEPULTREAV,0)) /'
      '              DECODE(SUM(SB.REAVVALORG + SB.ULTREAVVALORG +'
      '                         SB.REAVCMBEM + SB.ULTREAVCMBEM), 0,'
      '                     1, SUM(SB.REAVVALORG + SB.ULTREAVVALORG +'
      
        '                            SB.REAVCMBEM + SB.ULTREAVCMBEM))) * ' +
        '12 * 100),6) AS TAXADEPREAV,'
      '       ROUND(SUM(SB.VALORG + SB.CMBEM -'
      '                 SB.DEPLANC - SB.CMDEP +'
      '                 SB.REAVVALORG + SB.REAVCMBEM -'
      '                 SB.REAVDEPLANC - SB.REAVCMDEP +'
      '                 SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '                 SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP),2)  AS VAL' +
        'CTB0'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     (SELECT IDIMOVEL, IMONOME AS NOME'
      '      FROM IMOVEL'
      '      WHERE IDIMOVELMESTRE IS NULL) IMOMESTRE,'
      ''
      '     IMOVEL I, IMOVELXBEM IXB, BEM B, GRUPO G'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 1)'
      
        '  AND (ABS(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEPLANC,0' +
        ') - NVL(SB.CMDEP,0) +'
      
        '           NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) - NVL(SB.R' +
        'EAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '           NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0) - NV' +
        'L(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,0)) >= 0.01)'
      '  AND (I.IDIMOVEL   = IXB.IDIMOVEL)'
      '  AND (I.IDIMOVELMESTRE = IMOMESTRE.IDIMOVEL)'
      '  AND (IXB.IDBEM    = B.IDBEM)'
      '  AND (IXB.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'GROUP BY IMOMESTRE.NOME, G.NOME'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 556
    Top = 49
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qrySldCtbImoMestreNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySldCtbImoMestreDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySldCtbImoMestreCUSTOCORR0: TFloatField
      FieldName = 'CUSTOCORR0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreDEPBEMACUM0: TFloatField
      FieldName = 'DEPBEMACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreDEPBEMATU0: TFloatField
      FieldName = 'DEPBEMATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreTAXADEP: TFloatField
      FieldName = 'TAXADEP'
      DisplayFormat = '#,0.0000;(#,0.0000)'
    end
    object qrySldCtbImoMestreCUSTOREAV0: TFloatField
      FieldName = 'CUSTOREAV0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreDEPREAVACUM0: TFloatField
      FieldName = 'DEPREAVACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreDEPREAVATU0: TFloatField
      FieldName = 'DEPREAVATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySldCtbImoMestreTAXADEPREAV: TFloatField
      FieldName = 'TAXADEPREAV'
      DisplayFormat = '#,0.0000;(#,0.0000)'
    end
    object qrySldCtbImoMestreVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsSldCtbImoMestre: TwwDataSource
    DataSet = qrySldCtbImoMestre
    Left = 564
    Top = 52
  end
  object ppSldCtbImoMestre: TppBDEPipeline
    DataSource = dsSldCtbImoMestre
    UserName = 'SldCtbImoMestre'
    Left = 556
    Top = 22
  end
  object rpSldCtbImoMestre: TppReport
    AutoStop = False
    DataPipeline = ppSldCtbImoMestre
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rpSldCtbImoveis'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 556
    Top = 9
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Balancete Patrimonial de Imóveis - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 98954
        mmTop = 7144
        mmWidth = 89165
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 12700
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel99'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 131763
        mmTop = 529
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'rpSldCtbImoveisLabel1'
        Caption = 'Movimentados até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 237596
        mmTop = 7408
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'rpSldCtbImoveisLabel2'
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 266701
        mmTop = 7408
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'rpSldCtbImoveisLabel3'
        Caption = 'Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 13229
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'rpSldCtbImoveisLabel4'
        Caption = 'Custo Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 13229
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'rpSldCtbImoveisLabel5'
        Caption = 'Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 110067
        mmTop = 17727
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'rpSldCtbImoveisLabel6'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 139700
        mmTop = 17727
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'rpSldCtbImoveisLabel8'
        Caption = 'Sld.Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265113
        mmTop = 13229
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'rpSldCtbImoveisLabel9'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 13229
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'rpSldCtbImoveisLabel10'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 17727
        mmWidth = 6615
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'rpSldCtbImoveisLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 22490
        mmWidth = 284427
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'rpSldCtbImoveisLabel12'
        Caption = 'Taxa a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 242094
        mmTop = 17727
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'rpSldCtbImoveisLabel13'
        Caption = 'Taxa a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 17727
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'rpSldCtbImoveisLabel14'
        Caption = 'Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 198967
        mmTop = 17727
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'rpSldCtbImoveisLabel15'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 222250
        mmTop = 13229
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'rpSldCtbImoveisLabel16'
        Caption = 'Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 172244
        mmTop = 13229
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'rpSldCtbImoveisDBText3'
        DataField = 'DESCGRUPO'
        DataPipeline = ppSldCtbImoMestre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 75671
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'rpSldCtbImoveisDBText4'
        DataField = 'CUSTOCORR0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 265
        mmWidth = 27940
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'rpSldCtbImoveisDBText5'
        DataField = 'DEPREAVATU0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'rpSldCtbImoveisDBText7'
        DataField = 'DEPBEMACUM0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'rpSldCtbImoveisDBText8'
        DataField = 'DEPBEMATU0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'rpSldCtbImoveisDBText9'
        DataField = 'VALCTB0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256911
        mmTop = 265
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'rpSldCtbImoveisDBText6'
        DataField = 'DEPREAVACUM0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'rpSldCtbImoveisDBText10'
        DataField = 'CUSTOREAV0'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'TAXADEP'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.000000;(#,0.000000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText402'
        DataField = 'TAXADEPREAV'
        DataPipeline = ppSldCtbImoMestre
        DisplayFormat = '#,0.000000;(#,0.000000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine38'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel36: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel100'
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
        mmTop = 1058
        mmWidth = 66940
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'ppCalc301'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119592
        mmTop = 1058
        mmWidth = 45244
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppSldCtbImoMestre
      UserName = 'rpSldCtbImoveisGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBText41: TppDBText
          UserName = 'rpSldCtbImoveisDBText2'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppSldCtbImoMestre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLine11: TppLine
          UserName = 'rpSldCtbImoveisLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4498
          mmWidth = 284427
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc24: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc1'
          DataField = 'CUSTOCORR0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 76200
          mmTop = 794
          mmWidth = 27940
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc25: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc2'
          DataField = 'DEPBEMACUM0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 794
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc3'
          DataField = 'DEPBEMATU0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc4'
          DataField = 'DEPREAVATU0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 220398
          mmTop = 794
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc5'
          DataField = 'VALCTB0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 256911
          mmTop = 794
          mmWidth = 27517
          BandType = 5
          GroupNo = 1
        end
        object ppLine12: TppLine
          UserName = 'rpSldCtbImoveisLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 1
        end
        object ppLabel38: TppLabel
          UserName = 'rpSldCtbImoveisLabel7'
          Caption = 'Soma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 794
          mmWidth = 7144
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc11'
          DataField = 'DEPREAVACUM0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 194734
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc30: TppDBCalc
          UserName = 'rpSldCtbImoveisDBCalc13'
          DataField = 'CUSTOREAV0'
          DataPipeline = ppSldCtbImoMestre
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169069
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryBemImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP, B.PLACA,'
      
        '       SB.VALORG                                            AS V' +
        'ALORG0,'
      
        '       SB.REAVVALORG                                        AS V' +
        'ALREAVACUM0,'
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))         AS C' +
        'MBEMATU0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM)                            AS C' +
        'MBEMACUM0,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0))       AS D' +
        'EPLANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC)                        AS D' +
        'EPLANCACUM0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP)                            AS C' +
        'MDEPLANCACUM0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      
        '        SB.REAVDEPLANC - SB.REAVCMDEP)                      AS V' +
        'ALCTB0,'
      ''
      
        '       SB.ULTREAVVALORG                                     AS V' +
        'ALULTREAVACUM1,'
      
        '       NVL(ATU.VALCMULTREAV,0)                              AS V' +
        'ALULTCMREAVATU,'
      
        '       SB.ULTREAVCMBEM                                      AS V' +
        'ALULTCMREAVACUM1,'
      
        '       NVL(ATU.VALDEPULTREAV,0)                             AS V' +
        'ALULTDEPREAVATU,'
      
        '       SB.ULTREAVDEPLANC                                    AS V' +
        'ALULTDEPREAVACUM1,'
      
        '       SB.ULTREAVCMDEP                                      AS V' +
        'ALULTCMDEPREAVACUM1,'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB1,'
      ''
      
        '       (SB.REAVVALORG + SB.ULTREAVVALORG)                   AS S' +
        'UMPARCREAV,'
      '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) +'
      
        '        NVL(ATU.VALCMULTREAV,0))                            AS S' +
        'UMCMBEMATU,'
      '       (SB.CMBEM + SB.REAVCMBEM +'
      
        '        SB.ULTREAVCMBEM)                                    AS S' +
        'UMCMBEMACUM,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                           AS S' +
        'UMDEPATU,'
      '       (SB.DEPLANC + SB.REAVDEPLANC +'
      
        '        SB.ULTREAVDEPLANC)                                  AS S' +
        'UMDEPACUM,'
      '       (SB.CMDEP + SB.REAVCMDEP +'
      
        '        SB.ULTREAVCMDEP)                                    AS S' +
        'UMCMDEPACUM,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS S' +
        'UMVALCTB,'
      ''
      
        '       B.DESBEM, C.DESCCONJUNTO, G.NOME AS DESCGRUPO, B.IDGRUPO,' +
        ' B.IDCONJUNTO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (G.FLGIMOVEL = 1)'
      ''
      ''
      ''
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      '  AND (B.IDBEM = SB.IDBEM(+))'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'ORDER BY C.DESCCONJUNTO, B.IDGRUPO, B.DESBEM'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 378
    Top = 47
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryBemImovelIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemImovelTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemImovelDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemImovelPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemImovelVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALREAVACUM0: TFloatField
      FieldName = 'VALREAVACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMBEMATU0: TFloatField
      FieldName = 'CMBEMATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMBEMACUM0: TFloatField
      FieldName = 'CMBEMACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDEPLANCATU0: TFloatField
      FieldName = 'DEPLANCATU0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDEPLANCACUM0: TFloatField
      FieldName = 'DEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelCMDEPLANCACUM0: TFloatField
      FieldName = 'CMDEPLANCACUM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTREAVACUM1: TFloatField
      FieldName = 'VALULTREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMREAVATU: TFloatField
      FieldName = 'VALULTCMREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMREAVACUM1: TFloatField
      FieldName = 'VALULTCMREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTDEPREAVATU: TFloatField
      FieldName = 'VALULTDEPREAVATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTDEPREAVACUM1: TFloatField
      FieldName = 'VALULTDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALULTCMDEPREAVACUM1: TFloatField
      FieldName = 'VALULTCMDEPREAVACUM1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelVALCTB1: TFloatField
      FieldName = 'VALCTB1'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMPARCREAV: TFloatField
      FieldName = 'SUMPARCREAV'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMBEMATU: TFloatField
      FieldName = 'SUMCMBEMATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMBEMACUM: TFloatField
      FieldName = 'SUMCMBEMACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMDEPATU: TFloatField
      FieldName = 'SUMDEPATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMDEPACUM: TFloatField
      FieldName = 'SUMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMCMDEPACUM: TFloatField
      FieldName = 'SUMCMDEPACUM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemImovelDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemImovelDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemImovelDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemImovelIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemImovelIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
  end
  object dsBemImovel: TwwDataSource
    DataSet = qryBemImovel
    Left = 378
    Top = 35
  end
  object ppBemImovel: TppBDEPipeline
    DataSource = dsBemImovel
    UserName = 'BemImovel'
    Left = 378
    Top = 22
  end
  object rpBemImovel: TppReport
    AutoStop = False
    DataPipeline = ppBemImovel
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 378
    Top = 10
    Version = '5.5'
    mmColumnWidth = 284300
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppLabel63: TppLabel
        UserName = 'ppLabel63'
        Caption = 'Posição Contábil dos Bens Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 106363
        mmTop = 6085
        mmWidth = 71702
        BandType = 0
      end
      object ppLabel64: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel64'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 0
        mmWidth = 28046
        BandType = 0
      end
      object rptCustoContabilLabel2: TppLabel
        UserName = 'rptCustoContabilLabel2'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 10848
        mmWidth = 28840
        BandType = 0
      end
      object lblDataMov: TppLabel
        OnPrint = lblDataMovPrint
        UserName = 'lblDataMov'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 148961
        mmTop = 10848
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object rptCustoContabilLabel34: TppLabel
        UserName = 'rptCustoContabilLabel34'
        Caption = 'Valor Contábil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object rptCustoContabilDBText4: TppDBText
        UserName = 'rptCustoContabilDBText4'
        DataField = 'VALREAVACUM0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText5: TppDBText
        UserName = 'rptCustoContabilDBText5'
        DataField = 'VALULTREAVACUM1'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText8: TppDBText
        UserName = 'rptCustoContabilDBText8'
        DataField = 'CMBEMATU0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText10: TppDBText
        UserName = 'rptCustoContabilDBText10'
        DataField = 'CMBEMACUM0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 148961
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText12: TppDBText
        UserName = 'rptCustoContabilDBText12'
        DataField = 'DEPLANCATU0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText13: TppDBText
        UserName = 'rptCustoContabilDBText13'
        DataField = 'VALULTDEPREAVATU'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText14: TppDBText
        UserName = 'rptCustoContabilDBText14'
        DataField = 'CMDEPLANCACUM0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText16: TppDBText
        UserName = 'rptCustoContabilDBText16'
        DataField = 'DEPLANCACUM0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText17: TppDBText
        UserName = 'rptCustoContabilDBText17'
        DataField = 'VALULTDEPREAVACUM1'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText18: TppDBText
        UserName = 'rptCustoContabilDBText18'
        DataField = 'VALCTB0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 254530
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText19: TppDBText
        UserName = 'rptCustoContabilDBText19'
        DataField = 'VALCTB1'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 254530
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilLabel6: TppLabel
        UserName = 'rptCustoContabilLabel6'
        Caption = 'Reavaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 5292
        mmWidth = 16933
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 13229
        mmWidth = 278871
        BandType = 4
      end
      object rptCustoContabilDBMemo1: TppDBMemo
        UserName = 'rptCustoContabilDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppBemImovel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 8731
        mmLeft = 794
        mmTop = 265
        mmWidth = 50271
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rptCustoContabilDBText7: TppDBText
        UserName = 'rptCustoContabilDBText7'
        DataField = 'VALULTCMDEPREAVACUM1'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 228071
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText9: TppDBText
        UserName = 'rptCustoContabilDBText9'
        DataField = 'VALULTCMREAVACUM1'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 148961
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText11: TppDBText
        UserName = 'rptCustoContabilDBText11'
        DataField = 'VALULTCMREAVATU'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 5292
        mmWidth = 24342
        BandType = 4
      end
      object rptCustoContabilDBText3: TppDBText
        UserName = 'rptCustoContabilDBText3'
        DataField = 'VALORG0'
        DataPipeline = ppBemImovel
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74613
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rpBemImovelDBText1: TppDBText
        UserName = 'rpBemImovelDBText1'
        DataField = 'PLACA'
        DataPipeline = ppBemImovel
        DisplayFormat = '## ## ##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 8731
        mmWidth = 45508
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284428
        BandType = 8
      end
      object ppLabel65: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel65'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 65617
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 1323
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 241300
        mmTop = 1323
        mmWidth = 35454
        BandType = 8
      end
    end
    object rptCustoContabilGroup2: TppGroup
      BreakName = 'IDCONJUNTO'
      DataPipeline = ppBemImovel
      UserName = 'rptCustoContabilGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptCustoContabilGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rptCustoContabilLine2: TppLine
          UserName = 'rptCustoContabilLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 4498
          mmWidth = 284428
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel7: TppLabel
          UserName = 'rptCustoContabilLabel7'
          Caption = 'Conjunto : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 0
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilDBText1: TppDBText
          UserName = 'rptCustoContabilDBText1'
          AutoSize = True
          DataField = 'DESCCONJUNTO'
          DataPipeline = ppBemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 19315
          mmTop = 0
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCustoContabilGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rptCustoContabilLine4: TppLine
          UserName = 'rptCustoContabilLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc2: TppDBCalc
          UserName = 'rptCustoContabilDBCalc2'
          DataField = 'SUMPARCREAV'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc3: TppDBCalc
          UserName = 'rptCustoContabilDBCalc3'
          DataField = 'SUMCMBEMATU'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 124090
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc5: TppDBCalc
          UserName = 'rptCustoContabilDBCalc5'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 148961
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc6: TppDBCalc
          UserName = 'rptCustoContabilDBCalc6'
          DataField = 'SUMDEPATU'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173832
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc12: TppDBCalc
          UserName = 'rptCustoContabilDBCalc12'
          DataField = 'SUMVALCTB'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 254530
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc13: TppDBCalc
          UserName = 'rptCustoContabilDBCalc13'
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 228071
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc14: TppDBCalc
          UserName = 'rptCustoContabilDBCalc14'
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 198967
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rptCustoContabilDBCalc16: TppDBCalc
          UserName = 'rptCustoContabilDBCalc16'
          DataField = 'VALORG0'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 74613
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpBemImovelLabel3: TppLabel
          UserName = 'rpBemImovelLabel3'
          Caption = 'Soma do Conjunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 265
          mmWidth = 28310
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rptCustoContabilGroup3: TppGroup
      BreakName = 'IDGRUPO'
      DataPipeline = ppBemImovel
      UserName = 'rptCustoContabilGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptCustoContabilGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object rptCustoContabilLine3: TppLine
          UserName = 'rptCustoContabilLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 529
          mmTop = 4763
          mmWidth = 279136
          BandType = 3
          GroupNo = 2
        end
        object rptCustoContabilDBText2: TppDBText
          UserName = 'rptCustoContabilDBText2'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppBemImovel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 19315
          mmTop = 265
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel1: TppLabel
          UserName = 'rptCustoContabilLabel1'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 77258
          mmTop = 6085
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel3: TppLabel
          UserName = 'rptCustoContabilLabel3'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 114300
          mmTop = 6085
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel4: TppLabel
          UserName = 'rptCustoContabilLabel4'
          Caption = 'Reavaliação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 109009
          mmTop = 9525
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel5: TppLabel
          UserName = 'rptCustoContabilLabel5'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 91281
          mmTop = 9525
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel9: TppLabel
          UserName = 'rptCustoContabilLabel9'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 6085
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel10: TppLabel
          UserName = 'rptCustoContabilLabel10'
          Caption = 'no Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 138907
          mmTop = 9260
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel11: TppLabel
          UserName = 'rptCustoContabilLabel11'
          Caption = 'Corr. Mon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 157957
          mmTop = 6085
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel12: TppLabel
          UserName = 'rptCustoContabilLabel12'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 158486
          mmTop = 9525
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel21: TppLabel
          UserName = 'rptCustoContabilLabel21'
          Caption = 'Custo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 259028
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel22: TppLabel
          UserName = 'rptCustoContabilLabel22'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 205582
          mmTop = 5821
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel23: TppLabel
          UserName = 'rptCustoContabilLabel23'
          Caption = 'Acumulada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 208492
          mmTop = 9260
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel24: TppLabel
          UserName = 'rptCustoContabilLabel24'
          Caption = 'Deprec. Acum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 233892
          mmTop = 9260
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel25: TppLabel
          UserName = 'rptCustoContabilLabel25'
          Caption = 'Corr. Mon. da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 232834
          mmTop = 5821
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel26: TppLabel
          UserName = 'rptCustoContabilLabel26'
          Caption = 'No Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 188384
          mmTop = 9525
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLabel27: TppLabel
          UserName = 'rptCustoContabilLabel27'
          Caption = 'Depreciação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 180446
          mmTop = 6085
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object rptCustoContabilLine1: TppLine
          UserName = 'rptCustoContabilLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 13758
          mmWidth = 279665
          BandType = 3
          GroupNo = 1
        end
        object rpBemImovelLabel1: TppLabel
          UserName = 'rpBemImovelLabel1'
          Caption = 'Grupo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 265
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
      end
      object rptCustoContabilGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rptCustoContabilLine5: TppLine
          UserName = 'rptCustoContabilLine5'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 794
          mmTop = 4763
          mmWidth = 280194
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc1: TppDBCalc
          UserName = 'rptCustoContabilDBCalc1'
          DataField = 'VALORG0'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 74613
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc4: TppDBCalc
          UserName = 'rptCustoContabilDBCalc4'
          DataField = 'SUMPARCREAV'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 100542
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc7: TppDBCalc
          UserName = 'rptCustoContabilDBCalc7'
          DataField = 'SUMCMBEMATU'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 124090
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc8: TppDBCalc
          UserName = 'rptCustoContabilDBCalc8'
          DataField = 'SUMCMBEMACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 148961
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc9: TppDBCalc
          UserName = 'rptCustoContabilDBCalc9'
          DataField = 'SUMDEPATU'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 173832
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc10: TppDBCalc
          UserName = 'rptCustoContabilDBCalc10'
          DataField = 'SUMDEPACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 198967
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc11: TppDBCalc
          UserName = 'rptCustoContabilDBCalc11'
          DataField = 'SUMCMDEPACUM'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 228071
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rptCustoContabilDBCalc15: TppDBCalc
          UserName = 'rptCustoContabilDBCalc15'
          DataField = 'SUMVALCTB'
          DataPipeline = ppBemImovel
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rptCustoContabilGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 254530
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object rpBemImovelLabel2: TppLabel
          UserName = 'rpBemImovelLabel2'
          Caption = 'Soma do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 265
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object updBalPatGrpbx: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDE' +
        'P, VALCTB)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLAN' +
        'C, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 728
    Top = 340
  end
  object qryBalPatGrpBx: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE')
    UpdateObject = updBalPatGrpbx
    ValidateWithMask = True
    Left = 696
    Top = 287
    object FloatField29: TFloatField
      FieldName = 'IDGRUPO'
    end
    object StringField4: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object StringField5: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object StringField6: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object FloatField31: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object FloatField32: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object FloatField33: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object FloatField34: TFloatField
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsBalPatGrpBx: TwwDataSource
    DataSet = qryBalPatGrpBx
    Left = 680
    Top = 339
  end
  object ppBalPatGrpBx: TppBDEPipeline
    DataSource = dsBalPatGrpBx
    UserName = 'BalPatGrp1'
    Left = 744
    Top = 286
  end
  object rpBalPatGrpBx: TppReport
    AutoStop = False
    DataPipeline = ppBalPatGrpBx
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 712
    Top = 386
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'ppLabel66'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Grupo Contábil - Bens Baixados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 71967
        mmTop = 6879
        mmWidth = 119856
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 31221
        mmWidth = 264107
        BandType = 0
      end
      object ppLabel39: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel67'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 118004
        mmTop = 0
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'rpBalPatGrpLabel1'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 27252
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'rpBalPatGrpLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25400
        mmTop = 27252
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'rpBalPatGrpLabel3'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 27252
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 27252
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'rpBalPatGrpLabel5'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 147109
        mmTop = 27252
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 177271
        mmTop = 27252
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'rpBalPatGrpLabel7'
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 210609
        mmTop = 27252
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 27252
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Movimentação de dd/mm/yyyy a dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 90223
        mmTop = 13494
        mmWidth = 82550
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 119856
        mmTop = 18785
        mmWidth = 23283
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 264107
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText45: TppDBText
        OnPrint = rpBalPatGrpDBText1Print
        UserName = 'ppDBText45'
        DataField = 'CLASSE'
        DataPipeline = ppBalPatGrpBx
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBalPatGrpBx
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 529
        mmWidth = 67733
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrpBx
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 102659
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatGrpBx
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 138377
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatGrpBx
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatGrpBx
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 209021
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrpBx
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'rpBalPatGrpDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrpBx
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 94192
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 264107
        BandType = 8
      end
      object ppLabel79: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel68'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 31750
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 112448
        mmTop = 1058
        mmWidth = 39158
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 237596
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object updBalPatGrpAnal2: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSEDEBEM'
      'set'
      '  CODHIERARQ = :CODHIERARQ,'
      '  DESCRICAO = :DESCRICAO,'
      '  S_A = :S_A,'
      '  PLACONTA = :PLACONTA,'
      '  QUANT = :QUANT,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    InsertSQL.Strings = (
      'insert into CLASSEDEBEM'
      
        '  (CODHIERARQ, DESCRICAO, S_A, PLACONTA, QUANT, VALORG, CMBEM, D' +
        'EPLANC, '
      '   CMDEP, VALCTB)'
      'values'
      
        '  (:CODHIERARQ, :DESCRICAO, :S_A, :PLACONTA, :QUANT, :VALORG, :C' +
        'MBEM, :DEPLANC, '
      '   :CMDEP, :VALCTB)')
    DeleteSQL.Strings = (
      'delete from CLASSEDEBEM'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    Left = 308
    Top = 180
  end
  object qryBalPatGrpAnal2: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       ('#39'                  '#39') AS PLACONTA,'
      '       (0)  AS QUANT,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE (CODHIERARQ IS NULL)'
      ''
      ' ')
    UpdateObject = updBalPatGrpAnal2
    ValidateWithMask = True
    Left = 284
    Top = 223
    object qryBalPatGrpAnal2CODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      FixedChar = True
      Size = 15
    end
    object qryBalPatGrpAnal2DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryBalPatGrpAnal2S_A: TStringField
      FieldName = 'S_A'
      FixedChar = True
      Size = 1
    end
    object qryBalPatGrpAnal2PLACONTA: TStringField
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object qryBalPatGrpAnal2QUANT: TFloatField
      FieldName = 'QUANT'
    end
    object qryBalPatGrpAnal2VALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryBalPatGrpAnal2CMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryBalPatGrpAnal2DEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryBalPatGrpAnal2CMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryBalPatGrpAnal2VALCTB: TFloatField
      FieldName = 'VALCTB'
    end
  end
  object dsBalPatGrpAnal2: TwwDataSource
    DataSet = qryBalPatGrpAnal2
    Left = 300
    Top = 107
  end
  object ppBalPatGrpAnal2: TppBDEPipeline
    DataSource = dsBalPatGrpAnal2
    UserName = 'BalPatClas1'
    Left = 244
    Top = 167
    object ppBalPatGrpAnal2ppField1: TppField
      FieldAlias = 'CODHIERARQ'
      FieldName = 'CODHIERARQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField4: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField5: TppField
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField6: TppField
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField7: TppField
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField8: TppField
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBalPatGrpAnal2ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 8
    end
    object ppBalPatGrpAnal2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpBalPatGrpAnal2: TppReport
    AutoStop = False
    DataPipeline = ppBalPatGrpAnal2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 3810
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBalPatGrpAnal2BeforePrint
    DeviceType = 'Screen'
    Left = 316
    Top = 227
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel76: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78581
        mmTop = 8467
        mmWidth = 129646
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 286967
        BandType = 0
      end
      object ppLabel81: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19315
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Descrição Grupo / Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 19315
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 19315
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel101: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 236273
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'rpBalPatClasLabel1'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'Label102'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 251884
        mmTop = 19315
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 19315
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'Label104'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 227542
        mmTop = 9525
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 258763
        mmTop = 9525
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      AfterPrint = ppDetailBand4AfterPrint
      BeforePrint = ppDetailBand4BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText101: TppDBText
        UserName = 'ppDBText101'
        DataField = 'CODHIERARQ'
        DataPipeline = ppBalPatGrpAnal2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText102: TppDBText
        UserName = 'ppDBText102'
        DataField = 'DESCRICAO'
        DataPipeline = ppBalPatGrpAnal2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 0
        mmWidth = 117475
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'ppDBText106'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrpAnal2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 214313
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText103: TppDBText
        UserName = 'ppDBText103'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrpAnal2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
        DataField = 'QUANT'
        DataPipeline = ppBalPatGrpAnal2
        DisplayFormat = '#0;(#0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText107: TppDBText
        UserName = 'ppDBText107'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrpAnal2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 247915
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText105'
        DataField = 'PLACONTA'
        DataPipeline = ppBalPatGrpAnal2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 174096
        mmTop = 0
        mmWidth = 36513
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 286967
        BandType = 8
      end
      object ppLabel109: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel86'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 31750
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 1058
        mmWidth = 39158
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSoma11: TppVariable
        UserName = 'ppSoma11'
        AutoSize = False
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#0;(#0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 1058
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel110: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppLine22: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 286967
        BandType = 7
      end
      object ppSoma12: TppVariable
        UserName = 'ppSoma12'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 216165
        mmTop = 1058
        mmWidth = 29369
        BandType = 7
      end
      object ppSoma13: TppVariable
        UserName = 'ppSoma13'
        AutoSize = False
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 248709
        mmTop = 1058
        mmWidth = 30427
        BandType = 7
      end
    end
  end
  object updBalPatClas: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSEDEBEM'
      'set'
      '  CODHIERARQ = :CODHIERARQ,'
      '  DESCRICAO = :DESCRICAO,'
      '  S_A = :S_A,'
      '  QUANT = :QUANT,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    InsertSQL.Strings = (
      'insert into CLASSEDEBEM'
      
        '  (CODHIERARQ, DESCRICAO, S_A, QUANT, VALORG, CMBEM, DEPLANC, CM' +
        'DEP, VALCTB)'
      'values'
      
        '  (:CODHIERARQ, :DESCRICAO, :S_A, :QUANT, :VALORG, :CMBEM, :DEPL' +
        'ANC, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from CLASSEDEBEM'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    Left = 20
    Top = 372
  end
  object qryBalPatClas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       (0)  AS QUANT, '
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'WHERE (CODHIERARQ IS NULL)'
      'ORDER BY CODHIERARQ'
      ''
      ' ')
    UpdateObject = updBalPatClas
    ValidateWithMask = True
    Left = 68
    Top = 263
    object qryBalPatClasCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Size = 15
    end
    object qryBalPatClasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryBalPatClasS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatClasQUANT: TFloatField
      FieldName = 'QUANT'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatClasVALORG: TFloatField
      FieldName = 'VALORG'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatClasCMBEM: TFloatField
      FieldName = 'CMBEM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatClasDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatClasCMDEP: TFloatField
      FieldName = 'CMDEP'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatClasVALCTB: TFloatField
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsBalPatClas: TwwDataSource
    DataSet = qryBalPatClas
    Left = 60
    Top = 315
  end
  object ppBalPatClas: TppBDEPipeline
    DataSource = dsBalPatClas
    UserName = 'BalPatClas'
    Left = 12
    Top = 311
    object ppBalPatClasppField1: TppField
      FieldAlias = 'CODHIERARQ'
      FieldName = 'CODHIERARQ'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatClasppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBalPatClasppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppBalPatClasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBalPatClasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatClasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatClasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatClasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatClasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object rpBalPatClas: TppReport
    AutoStop = False
    DataPipeline = ppBalPatClas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBalPatClasBeforePrint
    DeviceType = 'Screen'
    Left = 12
    Top = 259
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Balancete Patrimonial por Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 102923
        mmTop = 8731
        mmWidth = 81227
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 274267
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 19315
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 19315
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 138377
        mmTop = 19315
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160073
        mmTop = 19315
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 194998
        mmTop = 19315
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'ppLabel82'
        Caption = 'C.M.Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 218282
        mmTop = 19315
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 19315
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 224103
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatClasLabelData: TppLabel
        UserName = 'rpBalPatClasLabelData'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 254001
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatClasLabel1: TppLabel
        UserName = 'rpBalPatClasLabel1'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111125
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      AfterPrint = ppDetailBand2AfterPrint
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBalPatClasDBText1: TppDBText
        UserName = 'rpBalPatClasDBText1'
        DataField = 'CODHIERARQ'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatClasDBText2: TppDBText
        UserName = 'rpBalPatClasDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 0
        mmWidth = 80963
        BandType = 4
      end
      object rpBalPatClasDBText5: TppDBText
        UserName = 'ppDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object rpBalPatClasDBText7: TppDBText
        UserName = 'rpBalPatClasDBText7'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184944
        mmTop = 0
        mmWidth = 29898
        BandType = 4
      end
      object rpBalPatClasDBText8: TppDBText
        UserName = 'rpBalPatClasDBText8'
        BlankWhenZero = True
        DataField = 'CMDEP'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215900
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object rpBalPatClasDBText9: TppDBText
        UserName = 'rpBalPatClasDBText9'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatClasDBText3: TppDBText
        UserName = 'rpBalPatClasDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object rpBalPatClasDBText6: TppDBText
        UserName = 'rpBalPatClasDBText6'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154782
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object rpBalPatClasDBText4: TppDBText
        UserName = 'rpBalPatClasDBText4'
        DataField = 'QUANT'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#0;(#0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 8
      end
      object ppLabel86: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel86'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 31750
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 122502
        mmTop = 1058
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSoma1: TppVariable
        UserName = 'ppSoma1'
        AutoSize = False
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#0;(#0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 794
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel75: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 7
      end
      object ppSoma2: TppVariable
        UserName = 'ppSoma2'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 794
        mmWidth = 33073
        BandType = 7
      end
      object ppSoma3: TppVariable
        UserName = 'ppSoma3'
        AutoSize = False
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154252
        mmTop = 794
        mmWidth = 29369
        BandType = 7
      end
      object ppSoma4: TppVariable
        UserName = 'ppSoma4'
        AutoSize = False
        CalcOrder = 3
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 794
        mmWidth = 30427
        BandType = 7
      end
      object ppSoma5: TppVariable
        UserName = 'ppSoma5'
        AutoSize = False
        CalcOrder = 4
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215636
        mmTop = 794
        mmWidth = 29898
        BandType = 7
      end
      object ppSoma6: TppVariable
        UserName = 'ppSoma6'
        AutoSize = False
        CalcOrder = 5
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 794
        mmWidth = 28310
        BandType = 7
      end
    end
  end
end
