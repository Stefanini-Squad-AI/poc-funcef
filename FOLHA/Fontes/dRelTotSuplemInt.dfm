inherited dtmRelTotSuplemInt: TdtmRelTotSuplemInt
  Left = 252
  Top = 172
  Width = 236
  Height = 223
  Caption = 'dtmRelTotSuplemInt'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 17
    Top = 47
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
    Left = 17
    Top = 95
  end
  inherited qryExemplo: TwwQuery
    Left = 17
    Top = 144
  end
  inherited rpExemplo: TppReport
    Left = 17
    Top = 2
  end
  object qryTotSuplemInt: TwwQuery
    BeforeOpen = qryTotSuplemIntBeforeOpen
    AfterOpen = qryTotSuplemIntAfterOpen
    AfterClose = qryTotSuplemIntAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE,'
      '  NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB,'
      '  NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS,'
      '  SUM(G3.VALORSUP) AS TOTALSUPHSTBENEF,'
      '  SUM(G4.VALORLIQUIDO) AS TOTALLIQUIDO,'
      '  SUM(G4.VALORPROV) AS TOTALPROVENTO,'
      '  SUM(G4.VALORDESC) AS TOTALDESCONTO,'
      '  G3.IDPLANOPREV, G3.IDPESSJUR, G3.IDBENEFICIO,'
      '  G3.NOMEBENEF, PL.NOME AS NOMEPLANO, PT.NOME AS NOMEPATRO'
      'FROM (SELECT'
      
        '         DISTINCT G2.VALORSUP, G2.IDPLANOPREV, G2.IDPESSJUR, G2.' +
        'IDPESSOA, G2.IDRESPONSAVEL,'
      '         B.IDBENEFICIO, B.NOME AS NOMEBENEF'
      '         FROM (SELECT'
      
        '                  SUM(G.VALORINTEGRAL) AS VALORSUP, G.IDPLANOPRE' +
        'V, G.IDPESSJUR, G.IDPESSOA,'
      '                  G.IDRESPONSAVEL'
      '               FROM (SELECT'
      
        '                        HSB.VALORINTEGRAL, HSB.IDPESSOA, BFC.IDR' +
        'ESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR,'
      '                        HSB.IDBENEFICIO, B.TIPOBENEFICIO'
      
        '                      FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN' +
        ' BFC, BENEFPLANPREV BP, BENEFICIO B'
      '                      WHERE HSB.IDHSTFOLHABENEF = 308'
      '                      AND 1 = 2'
      '                            AND HSB.IDTITULAR = BFC.IDTITULAR'
      '                            AND HSB.IDPESSOA = BFC.IDPESSOA'
      
        '                            AND HSB.IDBENEFICIO = BFC.IDBENEFICI' +
        'O'
      
        '                            AND HSB.IDPLANOPREV = BFC.IDPLANOPRE' +
        'V'
      '                            AND HSB.IDPESSJUR = BFC.IDPESSJUR'
      '                            AND HSB.IDBENEFICIO = BP.IDBENEFICIO'
      '                            AND HSB.IDPLANOPREV = BP.IDPLANOPREV'
      
        '                            AND (BP.FLGREFERENCIA = 0 OR (BP.FLG' +
        'REFERENCIA = 1 AND BP.FLGPAGAINSS = 1))'
      
        '                            AND HSB.IDBENEFICIO = B.IDBENEFICIO)' +
        ' G'
      
        '                      GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDP' +
        'ESSOA,'
      
        '                      G.IDRESPONSAVEL) G2, HSTBENEFBFCIARIO HST2' +
        ', BENEFPLANPREV BP, BENEFICIO B'
      '                      WHERE HST2.IDHSTFOLHABENEF = 308'
      '                      AND 1 = 2'
      '                            AND HST2.IDPESSOA = G2.IDPESSOA'
      
        '                            AND HST2.IDBENEFICIO = BP.IDBENEFICI' +
        'O'
      
        '                            AND HST2.IDPLANOPREV = BP.IDPLANOPRE' +
        'V'
      
        '                            AND (BP.FLGREFERENCIA = 0 OR (BP.FLG' +
        'REFERENCIA = 1 AND BP.FLGPAGAINSS = 1))'
      '                            AND HST2.IDBENEFICIO = B.IDBENEFICIO'
      '                            AND B.TIPOBENEFICIO < 99) G3,'
      '                           (SELECT'
      
        '                                   HB.IDPLANOPREV, HB.IDPATRO, H' +
        'B.IDRESPONSAVEL,'
      '                                   SUM(DECODE(PR.FLGESPECIAL,0,'
      
        '                                   DECODE(PR.FLGDESCONTO,0,HB.VA' +
        'LORPROVENTO, 1,(-1)*HB.VALORPROVENTO, 0), 0)) AS VALORLIQUIDO,'
      '                                   SUM(DECODE(PR.FLGESPECIAL,0,'
      
        '                                   DECODE(PR.FLGDESCONTO,0,HB.VA' +
        'LORPROVENTO, 1,0, 0), 0)) AS VALORPROV,'
      
        '                                   SUM(DECODE(PR.FLGESPECIAL,0, ' +
        'DECODE(PR.FLGDESCONTO,0,0, 1,HB.VALORPROVENTO, 0), 0)) AS VALORD' +
        'ESC'
      '                           FROM HISTRUBSAL HB, PROVDESC PR'
      '                           WHERE HB.IDHSTFOLHABENEF = 308'
      '                           AND 1 = 2'
      
        '                                 AND HB.IDRUBRICA = PR.IDPROVENT' +
        'O'
      
        '                           GROUP BY HB.IDPLANOPREV, HB.IDPATRO, ' +
        'HB.IDRESPONSAVEL) G4,'
      '                           (SELECT'
      
        '                              SUM(G.VALORSRB) AS VALORSRB, G.IDP' +
        'LANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL'
      
        '                            FROM ( SELECT HSB.VALORSRB, HSB.IDPE' +
        'SSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR,'
      
        '                                          HSB.IDBENEFICIO, B.TIP' +
        'OBENEFICIO'
      
        '                                   FROM HSTBENEFBFCIARIO HSB, BF' +
        'CIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B'
      
        '                                   WHERE HSB.IDHSTFOLHABENEF = 3' +
        '08'
      '                                   AND 1 = 2'
      
        '                                         AND HSB.IDTITULAR = BFC' +
        '.IDTITULAR'
      
        '                                         AND HSB.IDPESSOA = BFC.' +
        'IDPESSOA'
      
        '                                         AND HSB.IDBENEFICIO = B' +
        'FC.IDBENEFICIO'
      
        '                                         AND HSB.IDPLANOPREV = B' +
        'FC.IDPLANOPREV'
      
        '                                         AND HSB.IDPESSJUR = BFC' +
        '.IDPESSJUR'
      
        '                                         AND HSB.IDBENEFICIO = B' +
        'P.IDBENEFICIO'
      
        '                                         AND HSB.IDPLANOPREV = B' +
        'P.IDPLANOPREV'
      
        '                                         AND (BP.FLGREFERENCIA =' +
        ' 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1))'
      
        '                                         AND HSB.IDBENEFICIO = B' +
        '.IDBENEFICIO) G'
      
        '                                   GROUP BY G.IDPLANOPREV, G.IDP' +
        'ESSJUR, G.IDRESPONSAVEL) G5,'
      
        '                                   (SELECT SUM(G.VALORINTEGRAL) ' +
        'AS VALORINSS, G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL'
      
        '                                    FROM (SELECT HSB.VALORINTEGR' +
        'AL, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESS' +
        'JUR,'
      
        '                                                 HSB.IDBENEFICIO' +
        ', B.TIPOBENEFICIO'
      
        '                                          FROM HSTBENEFBFCIARIO ' +
        'HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B'
      
        '                                          WHERE HSB.IDHSTFOLHABE' +
        'NEF = 308'
      '                                          AND 1 = 2'
      
        '                                                AND HSB.IDTITULA' +
        'R = BFC.IDTITULAR'
      
        '                                                AND HSB.IDPESSOA' +
        ' = BFC.IDPESSOA'
      
        '                                                AND HSB.IDBENEFI' +
        'CIO = BFC.IDBENEFICIO'
      
        '                                                AND HSB.IDPLANOP' +
        'REV = BFC.IDPLANOPREV'
      
        '                                                AND HSB.IDPESSJU' +
        'R = BFC.IDPESSJUR'
      
        '                                                AND HSB.IDBENEFI' +
        'CIO = BP.IDBENEFICIO'
      
        '                                                AND HSB.IDPLANOP' +
        'REV = BP.IDPLANOPREV'
      
        '                                                AND BP.FLGREFERE' +
        'NCIA = 1'
      
        '                                                AND BP.FLGPAGAIN' +
        'SS = 0'
      
        '                                                AND HSB.IDBENEFI' +
        'CIO = B.IDBENEFICIO) G'
      
        '                                           GROUP BY G.IDPLANOPRE' +
        'V, G.IDPESSJUR, G.IDRESPONSAVEL ) G6, PESSOA PT, PLANPREV PL'
      
        '                                           WHERE PT.IDPESSOA = G' +
        '3.IDPESSJUR'
      
        '                                                 AND PL.IDPLANOP' +
        'REV = G3.IDPLANOPREV'
      
        '                                                 AND G3.IDRESPON' +
        'SAVEL = G4.IDRESPONSAVEL'
      
        '                                                 AND G3.IDPLANOP' +
        'REV = G4.IDPLANOPREV'
      
        '                                                 AND G3.IDPESSJU' +
        'R = G4.IDPATRO'
      
        '                                                 AND G3.IDRESPON' +
        'SAVEL = G5.IDRESPONSAVEL(+)'
      
        '                                                 AND G3.IDPLANOP' +
        'REV = G5.IDPLANOPREV(+)'
      
        '                                                 AND G3.IDPESSJU' +
        'R = G5.IDPESSJUR(+)'
      
        '                                                 AND G3.IDRESPON' +
        'SAVEL = G6.IDRESPONSAVEL(+)'
      
        '                                                 AND G3.IDPLANOP' +
        'REV = G6.IDPLANOPREV(+)'
      
        '                                                 AND G3.IDPESSJU' +
        'R = G6.IDPESSJUR(+)'
      
        '                                           GROUP BY G3.IDPLANOPR' +
        'EV, G3.IDPESSJUR, G3.IDBENEFICIO, G3.NOMEBENEF, PL.NOME, PT.NOME')
    ValidateWithMask = True
    Left = 97
    Top = 144
  end
  object dsTotSuplemInt: TwwDataSource
    DataSet = qryTotSuplemInt
    Left = 97
    Top = 95
  end
  object ppTotSuplemInt: TppBDEPipeline
    DataSource = dsTotSuplemInt
    UserName = 'ppTotSuplemInt'
    Left = 97
    Top = 47
    object ppTotSuplemIntppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppTotSuplemIntppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSRB'
      FieldName = 'TOTALSRB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppTotSuplemIntppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALINSS'
      FieldName = 'TOTALINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppTotSuplemIntppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALSUPHSTBENEF'
      FieldName = 'TOTALSUPHSTBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppTotSuplemIntppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALLIQUIDO'
      FieldName = 'TOTALLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppTotSuplemIntppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPROVENTO'
      FieldName = 'TOTALPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppTotSuplemIntppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALDESCONTO'
      FieldName = 'TOTALDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppTotSuplemIntppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppTotSuplemIntppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppTotSuplemIntppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppTotSuplemIntppField11: TppField
      FieldAlias = 'NOMEBENEF'
      FieldName = 'NOMEBENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppTotSuplemIntppField12: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppTotSuplemIntppField13: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
  end
  object rpTotSuplemInt: TppReport
    AutoStop = False
    DataPipeline = ppTotSuplemInt
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Totais de Suplementações Integrais'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpTotSuplemIntBeforePrint
    DeviceType = 'Screen'
    Left = 97
    Top = 2
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46831
      mmPrintPosition = 0
      object ppDBImage11: TppDBImage
        UserName = 'DBImage11'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText116: TppDBText
        UserName = 'DBText116'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText118: TppDBText
        UserName = 'DBText118'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText120: TppDBText
        UserName = 'DBText120'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label113'
        Caption = 
          'Relatório de Totais de Suplementações Integrais por Patrocinador' +
          'a, Plano e Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 38894
        mmTop = 29104
        mmWidth = 173302
        BandType = 0
      end
      object LbVersao: TppLabel
        UserName = 'LbVersao'
        Caption = 'Versão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 41275
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand29: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'NOMEBENEF'
        DataPipeline = ppTotSuplemInt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 121444
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'QTDE'
        DataPipeline = ppTotSuplemInt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 529
        mmWidth = 13228
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        DataField = 'TOTALPROVENTO'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 220928
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText101: TppDBText
        UserName = 'DBText101'
        DataField = 'TOTALINSS'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TOTALSRB'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 153723
        mmTop = 529
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand28: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
        mmTop = 1058
        mmWidth = 283369
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256646
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppLabel114: TppLabel
        UserName = 'Label1002'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1058
        mmWidth = 283898
        BandType = 8
      end
      object ppLine79: TppLine
        UserName = 'Line79'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'lblTotPatro1'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 1588
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'QTDE'
        DataPipeline = ppTotSuplemInt
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 1588
        mmWidth = 15346
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'LneQuant1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 125148
        mmTop = 794
        mmWidth = 15346
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'TOTALSRB'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 1588
        mmWidth = 27781
        BandType = 7
      end
      object ppLine3: TppLine
        UserName = 'LneTotSRB1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 150019
        mmTop = 794
        mmWidth = 27781
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc9'
        DataField = 'TOTALINSS'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 1588
        mmWidth = 27252
        BandType = 7
      end
      object ppLine4: TppLine
        UserName = 'LneTotINSS1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 184680
        mmTop = 794
        mmWidth = 27252
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'dbTotProv1'
        DataField = 'TOTALPROVENTO'
        DataPipeline = ppTotSuplemInt
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 1588
        mmWidth = 27252
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'LneTotProv1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 217753
        mmTop = 794
        mmWidth = 27252
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = ppTotSuplemInt
      KeepTogether = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel105: TppLabel
          UserName = 'Label105'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 1588
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText53: TppDBText
          UserName = 'DBText53'
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataPipeline = ppTotSuplemInt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 26988
          mmTop = 1588
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppLine73: TppLine
          UserName = 'Line73'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 0
          mmWidth = 283634
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object lblTotPatro: TppLabel
          UserName = 'lblTotPatro'
          AutoSize = False
          Caption = 'Totais por Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 87048
          mmTop = 794
          mmWidth = 37306
          BandType = 5
          GroupNo = 0
        end
        object dbQuant: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'QTDE'
          DataPipeline = ppTotSuplemInt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 125148
          mmTop = 794
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object dbTotSRB: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'TOTALSRB'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 150019
          mmTop = 794
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object dbTotINSS: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'TOTALINSS'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 184680
          mmTop = 794
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object dbTotProv: TppDBCalc
          UserName = 'dbTotProv'
          DataField = 'TOTALPROVENTO'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 217753
          mmTop = 794
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object LneQuant: TppLine
          UserName = 'LneQuant'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 125148
          mmTop = 265
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object LneTotSRB: TppLine
          UserName = 'LneTotSRB'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 150019
          mmTop = 265
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object LneTotINSS: TppLine
          UserName = 'LneTotINSS'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 184680
          mmTop = 265
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object LneTotProv: TppLine
          UserName = 'LneTotProv'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 217753
          mmTop = 265
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppTotSuplemInt
      KeepTogether = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppDBText76: TppDBText
          UserName = 'DBText76'
          AutoSize = True
          DataField = 'NOMEPLANO'
          DataPipeline = ppTotSuplemInt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 13494
          mmTop = 2381
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel107: TppLabel
          UserName = 'Label107'
          Caption = 'Plano: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 2381
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel108: TppLabel
          UserName = 'Label108'
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 134144
          mmTop = 7673
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppLabel106: TppLabel
          UserName = 'Label106'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 7673
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel109: TppLabel
          UserName = 'Label109'
          Caption = 'Suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 224367
          mmTop = 7673
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object ppLine74: TppLine
          UserName = 'Line74'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 1852
          mmWidth = 283369
          BandType = 3
          GroupNo = 1
        end
        object ppLabel110: TppLabel
          UserName = 'Label110'
          Caption = 'Total INSS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 198173
          mmTop = 7673
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Total SRB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 164042
          mmTop = 7673
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'TOTALPROVENTO'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 220928
          mmTop = 794
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLine75: TppLine
          UserName = 'Line75'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 187855
          mmTop = 265
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object ppLine76: TppLine
          UserName = 'Line76'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 127265
          mmTop = 265
          mmWidth = 13228
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QTDE'
          DataPipeline = ppTotSuplemInt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 794
          mmWidth = 13228
          BandType = 5
          GroupNo = 1
        end
        object ppLine78: TppLine
          UserName = 'Line78'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 153723
          mmTop = 265
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'TOTALINSS'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 187855
          mmTop = 794
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object lblTotPlano: TppLabel
          UserName = 'lblTotPlano'
          AutoSize = False
          Caption = 'Totais por Plano: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99219
          mmTop = 794
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'TOTALSRB'
          DataPipeline = ppTotSuplemInt
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153723
          mmTop = 794
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 220928
          mmTop = 265
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 175
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 175
    Top = 95
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 175
    Top = 47
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
end
