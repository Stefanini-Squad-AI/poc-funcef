inherited dtmRelCPMFPlanoxPatro: TdtmRelCPMFPlanoxPatro
  Left = 300
  Top = 206
  Width = 480
  Height = 433
  Caption = 'dtmRelCPMFPlanoxPatro'
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
  object pplLogoEmpresa: TppDBPipeline
    DataSource = dsLogoEmpresa
    UserName = 'lLogoEmpresa'
    Left = 56
    Top = 120
  end
  object CdsLogoEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 176
  end
  object SqlLogoEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   I.IMAGEM'
      'FROM'
      '   PESSOA P,'
      '   ENDPESS E,'
      '   IMAGENS I,'
      '   CIDADES C'
      'WHERE'
      '    (P.IDPESSOA    = 1)'
      'AND (E.IDPESSOA(+) = P.IDPESSOA)'
      'AND (E.IDCIDADES   = C.IDCIDADES(+))'
      'AND (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ClientDataSet = CdsLogoEmpresa
    Left = 56
    Top = 232
  end
  object dsLogoEmpresa: TwwDataSource
    DataSet = CdsLogoEmpresa
    Left = 56
    Top = 288
  end
  object dsCPMFPlano: TwwDataSource
    DataSet = CdsCPMFPlano
    Left = 232
    Top = 288
  end
  object SqlCPMFPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CPMFCALCLOTE.DATAEMISSAO,'
      '   I.NUMLOTE,'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   PE.NOME AS FAVORECIDO,'
      '   CPMFCALCLOTE.IDPLANOPREV,'
      '   CPMFCALCLOTE.PLANO,'
      '   CPMFCALCLOTE.IDPATRO,'
      '   CPMFCALCLOTE.PATROCINADORA,'
      '   CPMFCALCLOTE.VLRBASE,'
      '   CPMFCALCLOTE.VLRCPMF AS CPMFCALC,'
      '   LD.VALOR AS VALORDOCUMENTO,'
      '   ROUND(((LD.VALOR * I.ALIQUOTA)/100),2) AS CPMFPREV'
      'FROM'
      '    PESSOA PE, FORNSERV FO, DOCUMENTO D, LOTEXDOCUM LD,'
      '    IMPOSTORETIDO I,'
      '   ( SELECT NUMLOTE, SUM(VALOR) AS TOTLOTE'
      '     FROM LOTEXDOCUM'
      '     GROUP BY NUMLOTE'
      '   ) LOTE,'
      
        '   ( SELECT NUMLOTE, SUM(VLRBASE) AS VLRBASE, SUM(VLRRETIDO) AS ' +
        'VLRRETIDO'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATAPROG AND NUMLOTEMANUAL IS NULL'
      '     GROUP BY NUMLOTE'
      '   ) IR,'
      '   ('
      '     SELECT'
      '       PLA.IDPLANOPREV,'
      '       LP.DATAEMISSAO,'
      '       PATRO.IDPATRO,'
      
        '       I.NUMLOTE, D.CODDOCUMENTO, PLA.NOME AS PLANO, PATRO.NOME ' +
        'AS PATROCINADORA,'
      
        '       ROUND(SUM(DECODE(F.PERCCUSTAGREG, NULL, 0, LD.VALOR / L.V' +
        'ALOR * R.VALOR)),2) AS VLRBASE,'
      
        '       ROUND(SUM((LD.VALOR / L.VALOR * R.VALOR * ( F.PERCCUSTAGR' +
        'EG /100 ))),2) AS VLRCPMF'
      '     FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       RATEIODOCUM R,'
      '       PLANPREVCONTABIL PLA,'
      '       LOTEXDOCUM LD,'
      '       LOTEPAGTO LP,'
      '       PORTADORFORMA PF,'
      '       TIPRECDESXTIPAGRE T,'
      '       TIPOAGRE          TA,'
      '       FAIXATIPOAGREG    F,'
      
        '      (SELECT PAT.IDPESSOA AS IDPATRO, PESS.NOME FROM PATRO PAT,' +
        ' PESSOA PESS'
      '       WHERE PESS.IDPESSOA = PAT.IDPESSOA) PATRO,'
      ''
      '       ( SELECT DISTINCT NUMLOTE'
      '         FROM IMPOSTORETIDO'
      '         WHERE DATARETENCAO = :DATAPROG'
      '           AND NUMLOTEMANUAL IS NULL'
      '       )I'
      '     WHERE'
      '           D.CODDOCUMENTO        = L.CODDOCUMENTO'
      '       AND D.OPERACAO            = L.OPERACAO'
      '       AND D.CODDOCUMENTO        = R.CODDOCUMENTO'
      '       AND R.IDPLANOPREV         = PLA.IDPLANOPREV'
      '       AND R.IDPATRO             = PATRO.IDPATRO'
      '       AND D.CODDOCUMENTO        = LD.CODDOCUMENTO'
      '       AND LD.NUMLOTE            = I.NUMLOTE'
      '       AND I.NUMLOTE             = LP.NUMLOTE'
      '       AND LP.CODPORTFORMA       = PF.CODPORTFORMA'
      '       AND ( R.CODTIPRECDES      = T.CODTIPRECDES(+))'
      '       AND ( R.RECPAG            = T.RECPAG(+))'
      '       AND ( R.IDPESSOA          = T.IDPESSOA(+))'
      '       AND ( R.CODCENTROCUSTO    = T.CODCENTROCUSTO(+))'
      '       AND ( R.IDEMPRESA         = T.IDEMPRESA(+))'
      '       AND ( T.CODTIPOCUSTAGREG  = TA.CODTIPOCUSTAGREG(+))'
      '       AND ( TA.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG(+))'
      
        '       AND ((:CODPORTADOR IS NULL) OR (PF.CODPORTADOR = :CODPORT' +
        'ADOR))'
      
        '/*       AND ( (:DATAPROG      BETWEEN F.DATAINI AND F.DATAFIM) ' +
        'OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )*/'
      
        '       AND (  (    (:DATAPROG >= F.DATAINI OR F.DATAINI IS NULL)' +
        ' AND    (:DATAPROG <= F.DATAFIM OR F.DATAFIM IS NULL)  )      )'
      ''
      
        '       AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA ) = DEC' +
        'ODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '     GROUP BY'
      
        '        I.NUMLOTE, D.CODDOCUMENTO, PLA.NOME, PATRO.NOME, PLA.IDP' +
        'LANOPREV, PATRO.IDPATRO, LP.DATAEMISSAO'
      '   ) CPMFCALCLOTE'
      ''
      'WHERE'
      '        I.DATARETENCAO = :DATAPROG'
      '   AND (PE.IDPESSOA    = FO.IDPESSOA)'
      '   AND (FO.IDPESSOA    = D.IDFORCLI)'
      '   AND (D.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '   AND (LD.NUMLOTE     = I.NUMLOTE)'
      '   AND (I.NUMLOTE      = LOTE.NUMLOTE)'
      '   AND (I.NUMLOTE      = IR.NUMLOTE)'
      '   AND (I.NUMLOTE      = CPMFCALCLOTE.NUMLOTE)'
      '   AND (D.CODDOCUMENTO = CPMFCALCLOTE.CODDOCUMENTO)'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (CPMFCALCLOTE.IDPLANOPREV = :I' +
        'DPLANOPREV))'
      '   AND ((:IDPATRO IS NULL) OR (CPMFCALCLOTE.IDPATRO = :IDPATRO))'
      ''
      ''
      ''
      'UNION'
      ''
      'SELECT DISTINCT'
      '   CPMFCALCDOC.DATABAIXA,'
      '   I.NUMLOTEMANUAL AS NUMLOTE,'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   PE.NOME,'
      '   CPMFCALCDOC.IDPLANOPREV,'
      '   CPMFCALCDOC.PLANO,'
      '   CPMFCALCDOC.IDPATRO,'
      '   CPMFCALCDOC.PATROCINADORA,'
      '   CPMFCALCDOC.VLRBASE,'
      '   CPMFCALCDOC.VLRCPMF AS CPMFCALC,'
      '   L.VALOR AS VALRODOCUMENTO,'
      '   ROUND(((L.VALOR * I.ALIQUOTA)/100),2) AS CPMFPREV'
      'FROM'
      '    PESSOA PE, FORNSERV FO, DOCUMENTO D,'
      
        '    ( SELECT L.CODDOCUMENTO, L.NUMLOTEMANUAL, SUM(L.VALOR) AS VA' +
        'LOR'
      '      FROM LANCTODOCUM L'
      
        '      WHERE ((RTRIM(L.OPERACAO) = '#39'5'#39') OR  (RTRIM(L.OPERACAO) = ' +
        #39'10'#39'))'
      '        AND (L.ESTORNO IS NULL)'
      '      GROUP BY L.CODDOCUMENTO, L.NUMLOTEMANUAL'
      '    ) L,'
      '    IMPOSTORETIDO I,'
      
        '   ( SELECT NUMLOTEMANUAL, SUM(VLRBASE) AS VLRBASE, SUM(VLRRETID' +
        'O) AS VLRRETIDO'
      '     FROM IMPOSTORETIDO'
      '     WHERE DATARETENCAO = :DATAPROG AND NUMLOTE IS NULL'
      '     GROUP BY NUMLOTEMANUAL'
      '   ) IR,'
      '   ('
      '     SELECT'
      '        RP.DATABAIXA,'
      '        I.NUMLOTEMANUAL,'
      '        D.CODDOCUMENTO,'
      '        PLA.IDPLANOPREV,'
      '        PATRO.IDPATRO,'
      '        PLA.NOME AS PLANO,'
      '        PATRO.NOME AS PATROCINADORA,'
      
        '        ROUND(SUM(DECODE(F.PERCCUSTAGREG, NULL, 0, LB.VALOR / L.' +
        'VALOR * R.VALOR)),2) AS VLRBASE,'
      
        '        ROUND(SUM((LB.VALOR / L.VALOR * R.VALOR * ( F.PERCCUSTAG' +
        'REG /100 ))),2) AS VLRCPMF'
      '     FROM'
      '        DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        RATEIODOCUM R,'
      '        RECBTOPAGTO RP,'
      '        PORTADORFORMA PF,'
      '        PLANPREVCONTABIL PLA,'
      '        TIPRECDESXTIPAGRE T,'
      '        TIPOAGRE          TA,'
      '        FAIXATIPOAGREG    F,'
      
        '       (SELECT PAT.IDPESSOA AS IDPATRO, PESS.NOME FROM PATRO PAT' +
        ', PESSOA PESS'
      '        WHERE PESS.IDPESSOA = PAT.IDPESSOA) PATRO,'
      ''
      
        '        ( SELECT L.CODDOCUMENTO, L.NUMLOTEMANUAL, SUM(L.VALOR) A' +
        'S VALOR'
      '          FROM LANCTODOCUM L'
      
        '          WHERE ((RTRIM(L.OPERACAO) = '#39'5'#39') OR  (RTRIM(L.OPERACAO' +
        ') = '#39'10'#39'))'
      '            AND (L.ESTORNO IS NULL)'
      '          GROUP BY L.CODDOCUMENTO, L.NUMLOTEMANUAL'
      '        ) LB,'
      '        ( SELECT DISTINCT NUMLOTEMANUAL'
      '          FROM IMPOSTORETIDO'
      '          WHERE DATARETENCAO = :DATAPROG'
      '          AND NUMLOTE IS NULL'
      '        )I'
      '     WHERE'
      '            D.CODDOCUMENTO         = L.CODDOCUMENTO'
      '        AND D.OPERACAO             = L.OPERACAO'
      '        AND D.CODDOCUMENTO         = R.CODDOCUMENTO'
      '        AND D.CODDOCUMENTO         = RP.CODDOCUMENTO'
      '        AND RP.NUMLOTE             = I.NUMLOTEMANUAL'
      '        AND RP.CODPORTFORMA        = PF.CODPORTFORMA'
      '        AND R.IDPLANOPREV          = PLA.IDPLANOPREV'
      '        AND R.IDPATRO              = PATRO.IDPATRO'
      '        AND D.CODDOCUMENTO         = LB.CODDOCUMENTO'
      '        AND ( LB.NUMLOTEMANUAL     = I.NUMLOTEMANUAL)'
      '        AND ( R.CODTIPRECDES       = T.CODTIPRECDES(+))'
      '        AND ( R.RECPAG             = T.RECPAG(+))'
      '        AND ( R.IDPESSOA           = T.IDPESSOA(+))'
      '        AND ( R.CODCENTROCUSTO     = T.CODCENTROCUSTO(+))'
      '        AND ( R.IDEMPRESA          = T.IDEMPRESA(+))'
      '        AND ( T.CODTIPOCUSTAGREG   = TA.CODTIPOCUSTAGREG(+))'
      '        AND ( TA.CODTIPOCUSTAGREG  = F.CODTIPOCUSTAGREG(+))'
      
        '        AND ((:CODPORTADOR IS NULL) OR (PF.CODPORTADOR = :CODPOR' +
        'TADOR))'
      
        '/*        AND ( (:DATAPROG      BETWEEN F.DATAINI AND F.DATAFIM)' +
        ' OR (F.DATAINI IS NULL AND F.DATAFIM IS NULL) )*/'
      
        '        AND (  (    (:DATAPROG >= F.DATAINI OR F.DATAINI IS NULL' +
        ') AND    (:DATAPROG <= F.DATAFIM OR F.DATAFIM IS NULL)  )      )'
      ''
      
        '        AND ( DECODE(R.IDPROGRAMA, NULL, -1, R.IDPROGRAMA ) = DE' +
        'CODE(T.IDPROGRAMA(+), NULL, -1, T.IDPROGRAMA(+)) )'
      '     GROUP BY'
      
        '        I.NUMLOTEMANUAL, D.CODDOCUMENTO, PLA.NOME, PATRO.NOME, P' +
        'LA.IDPLANOPREV, PATRO.IDPATRO, RP.DATABAIXA'
      '   ) CPMFCALCDOC'
      'WHERE'
      '        I.DATARETENCAO  = :DATAPROG'
      '   AND (PE.IDPESSOA     = FO.IDPESSOA)'
      '   AND (FO.IDPESSOA     = D.IDFORCLI)'
      '   AND (D.CODDOCUMENTO  = L.CODDOCUMENTO)'
      '   AND (L.NUMLOTEMANUAL = I.NUMLOTEMANUAL)'
      '   AND (I.NUMLOTEMANUAL = IR.NUMLOTEMANUAL)'
      '   AND (I.NUMLOTEMANUAL = CPMFCALCDOC.NUMLOTEMANUAL)'
      '   AND (D.CODDOCUMENTO  = CPMFCALCDOC.CODDOCUMENTO)'
      
        '   AND ((:IDPLANOPREV IS NULL) OR (CPMFCALCDOC.IDPLANOPREV = :ID' +
        'PLANOPREV))'
      '   AND ((:IDPATRO IS NULL) OR (CPMFCALCDOC.IDPATRO = :IDPATRO))'
      ''
      'ORDER BY'
      
        '    DATAEMISSAO, NUMLOTE, CODDOCUMENTO, FAVORECIDO, PATROCINADOR' +
        'A, PLANO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsCPMFPlano
    Left = 232
    Top = 232
  end
  object CdsCPMFPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 176
    Data = {
      CE0400009619E0BD01000000180000000D0006000000030000005801074E554D
      4C4F544508000400000000000C434F44444F43554D454E544F08000400000000
      00074E554D4150475208000400000000000A4641564F52454349444F01004900
      00000100055749445448020002003C000B44415441454D495353414F08000800
      000000000B4944504C414E4F50524556080004000000000005504C414E4F0100
      490000000100055749445448020002003200074944504154524F080004000000
      00000D504154524F43494E41444F524101004900000001000557494454480200
      02003C0007564C524241534508000400000000000843504D4643414C43080004
      00000000000E56414C4F52444F43554D454E544F08000400000000000843504D
      4650524556080004000000000002000D44454641554C545F4F52444552020082
      000500000001000200040009000700044C434944040001001608000000100000
      00000000000076A3400000000000BFDB401F434D20534F4C55434F4553204445
      20494E464F524D4154494341204C544441000028A0D1C1CC42000000000000F0
      3F104F50455241C7D5455320434F4D554E5300000000E06DE840124252415349
      4C2054454C45434F4D20532F41713D0AD7A37BA340F6285C8FC2F52240713D0A
      D7A37BA340F6285C8FC2F522400010000000000000000076A3400000000040BF
      DB401F434D20534F4C55434F455320444520494E464F524D4154494341204C54
      4441000028A0D1C1CC42000000000000F03F104F50455241C7D5455320434F4D
      554E5300000000E06DE8401242524153494C2054454C45434F4D20532F4115AE
      47E16A8BF440B81E85EB51FC734015AE47E16A8BF440B81E85EB51FC73400000
      000000000000000078A3400000000080A5DB40000000000048BC401F434D2053
      4F4C55434F455320444520494E464F524D4154494341204C5444410000E699BF
      C1CC42000000000000F03F104F50455241C7D5455320434F4D554E5300000000
      E06DE8401242524153494C2054454C45434F4D20532F41295C8FC2F5BE9C40F6
      285C8FC2F51B40295C8FC2F5BE9C40F6285C8FC2F51B40000000000000000000
      0078A34000000000C0A5DB40000000000049BC401F434D20534F4C55434F4553
      20444520494E464F524D4154494341204C5444410000E699BFC1CC4200000000
      0000F03F104F50455241C7D5455320434F4D554E5300000000E06DE840124252
      4153494C2054454C45434F4D20532F41000000000080A7405C8FC2F528DC2640
      000000000080A7405C8FC2F528DC26400010000000000000000040AC40000000
      0040B2DB401F434D20534F4C55434F455320444520494E464F524D4154494341
      204C54444100007E19F3C1CC42000000000000F03F104F50455241C7D5455320
      434F4D554E5300000000E06DE8401242524153494C2054454C45434F4D20532F
      410000000000C06C40D7A3703D0AD7EB3F0000000000C06C40D7A3703D0AD7EB
      3F0010000000000000000042AC400000000040B2DB401F434D20534F4C55434F
      455320444520494E464F524D4154494341204C54444100007E19F3C1CC420000
      00000000F03F104F50455241C7D5455320434F4D554E5300000000E06DE84012
      42524153494C2054454C45434F4D20532F410000000000108C4048E17A14AE47
      0B400000000000108C4048E17A14AE470B40}
  end
  object pplCPMFPLano: TppDBPipeline
    DataSource = dsCPMFPlano
    UserName = 'lCPMFPLano'
    Left = 232
    Top = 120
    object pplCPMFPLanoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplCPMFPLanoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCPMFPLanoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCPMFPLanoppField4: TppField
      FieldAlias = 'FAVORECIDO'
      FieldName = 'FAVORECIDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplCPMFPLanoppField5: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplCPMFPLanoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCPMFPLanoppField7: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object pplCPMFPLanoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCPMFPLanoppField9: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object pplCPMFPLanoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCPMFPLanoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMFCALC'
      FieldName = 'CPMFCALC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplCPMFPLanoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORDOCUMENTO'
      FieldName = 'VALORDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplCPMFPLanoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CPMFPREV'
      FieldName = 'CPMFPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object rptCPMFPlano: TppReport
    AutoStop = False
    DataPipeline = pplCPMFPLano
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
    Top = 88
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplCPMFPLano'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplLogoEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplLogoEmpresa'
        mmHeight = 13229
        mmLeft = 1852
        mmTop = 4498
        mmWidth = 13229
        BandType = 1
      end
      object ppLbEmpresa: TppLabel
        OnPrint = ppLbEmpresaPrint
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 23813
        mmTop = 7673
        mmWidth = 165365
        BandType = 1
      end
      object ppLbTituloRelatorio: TppLabel
        UserName = 'LbTituloRelatorio'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23813
        mmTop = 14023
        mmWidth = 31221
        BandType = 1
      end
      object ppLbPeriodo: TppLabel
        UserName = 'LbPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 27517
        mmWidth = 11113
        BandType = 1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 36248
        mmWidth = 197300
        BandType = 1
      end
      object ppLbPlano: TppLabel
        UserName = 'LbPlano'
        Caption = 'Plano:   Todos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 19315
        mmWidth = 20638
        BandType = 1
      end
      object ppLbPatro: TppLabel
        UserName = 'LbPatro'
        Caption = 'Patrocinadora:   Todas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 23548
        mmWidth = 32279
        BandType = 1
      end
      object ppLbContaBancaria: TppLabel
        UserName = 'LbContaBancaria'
        Caption = 'Conta bancária:   Todas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 27781
        mmWidth = 34131
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShpCorLinha: TppShape
        OnPrint = ppShpCorLinhaPrint
        UserName = 'ShpCorLinha'
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 0
        mmWidth = 184150
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'FAVORECIDO'
        DataPipeline = pplCPMFPLano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3175
        mmLeft = 59796
        mmTop = 529
        mmWidth = 74877
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = pplCPMFPLano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3260
        mmLeft = 31485
        mmTop = 529
        mmWidth = 14139
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplCPMFPLano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3175
        mmLeft = 13758
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NUMLOTE'
        DataPipeline = pplCPMFPLano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 529
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRBASE'
        DataPipeline = pplCPMFPLano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3175
        mmLeft = 156634
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CPMFCALC'
        DataPipeline = pplCPMFPLano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3175
        mmLeft = 180975
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppLbNomeSistema: TppLabel
        OnPrint = ppLbNomeSistemaPrint
        UserName = 'LbNomeSistema'
        Caption = 'LbNomeSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1852
        mmWidth = 22225
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 86519
        mmTop = 1852
        mmWidth = 24342
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
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 12965
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'CPMFCALC'
        DataPipeline = pplCPMFPLano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3440
        mmLeft = 175948
        mmTop = 15610
        mmWidth = 17198
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLRBASE'
        DataPipeline = pplCPMFPLano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCPMFPLano'
        mmHeight = 3440
        mmLeft = 156634
        mmTop = 15610
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Total dos Planos x Patrocinadoras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 41804
        mmTop = 15610
        mmWidth = 46567
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplCPMFPLano
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCPMFPLano'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1058
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = pplCPMFPLano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3810
          mmLeft = 11906
          mmTop = 1058
          mmWidth = 35179
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 19050
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 3969
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Total do plano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1852
          mmTop = 1852
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = pplCPMFPLano
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3387
          mmLeft = 24871
          mmTop = 1852
          mmWidth = 31411
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRBASE'
          DataPipeline = pplCPMFPLano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3440
          mmLeft = 156634
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'CPMFCALC'
          DataPipeline = pplCPMFPLano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3440
          mmLeft = 175948
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = pplCPMFPLano
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCPMFPLano'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 12965
          mmTop = 7408
          mmWidth = 184415
          BandType = 3
          GroupNo = 1
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 3969
          mmLeft = 12965
          mmTop = 794
          mmWidth = 184415
          BandType = 3
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'PATROCINADORA'
          DataPipeline = pplCPMFPLano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3440
          mmLeft = 35983
          mmTop = 1058
          mmWidth = 41275
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 13758
          mmTop = 1058
          mmWidth = 20108
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Cód.Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 13758
          mmTop = 7673
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Data Geração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 31485
          mmTop = 7673
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 59796
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Num.Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 143669
          mmTop = 7673
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Valor doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 161132
          mmTop = 7673
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Valor CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 177800
          mmTop = 7673
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 12965
          mmTop = 529
          mmWidth = 184150
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRBASE'
          DataPipeline = pplCPMFPLano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3440
          mmLeft = 156634
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'CPMFCALC'
          DataPipeline = pplCPMFPLano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3440
          mmLeft = 175948
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Total da patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 12965
          mmTop = 1323
          mmWidth = 30427
          BandType = 5
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = pplCPMFPLano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCPMFPLano'
          mmHeight = 3387
          mmLeft = 48683
          mmTop = 1323
          mmWidth = 30522
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
