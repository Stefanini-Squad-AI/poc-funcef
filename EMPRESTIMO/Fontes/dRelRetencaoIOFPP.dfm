inherited dtmRelRetencaoIOFPP: TdtmRelRetencaoIOFPP
  Left = 316
  Top = 238
  Width = 387
  Height = 236
  Caption = 'dRelRetencaoIOFPP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
    Left = 32
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplRetencaoIOFPP: TppBDEPipeline
    DataSource = dtsRetencaoIOFPP
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplRetencaoIOFPPppField1: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplRetencaoIOFPPppField2: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object pplRetencaoIOFPPppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplRetencaoIOFPPppField4: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object pplRetencaoIOFPPppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplRetencaoIOFPPppField6: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplRetencaoIOFPPppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMESALDODEV'
      FieldName = 'HMESALDODEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRetencaoIOFPPppField8: TppField
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 48
      DisplayWidth = 48
      Position = 7
    end
    object pplRetencaoIOFPPppField9: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplRetencaoIOFPPppField10: TppField
      FieldAlias = 'HMEDATAEFETIVA'
      FieldName = 'HMEDATAEFETIVA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplRetencaoIOFPPppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IOF_PREVISTO'
      FieldName = 'IOF_PREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplRetencaoIOFPPppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IOF_EFETIVO'
      FieldName = 'IOF_EFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplRetencaoIOFPPppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IOF_RECOLHIDO'
      FieldName = 'IOF_RECOLHIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplRetencaoIOFPPppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRBASE'
      FieldName = 'HMEVLRBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRetencaoIOFPPppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCONTRATO'
      FieldName = 'VLRCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRetencaoIOFPPppField16: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 27
      DisplayWidth = 27
      Position = 15
    end
    object pplRetencaoIOFPPppField17: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object pplRetencaoIOFPPppField18: TppField
      FieldAlias = 'NOMEPERFIL'
      FieldName = 'NOMEPERFIL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
  end
  object dtsRetencaoIOFPP: TwwDataSource
    DataSet = qryRetencaoIOFPP
    Left = 120
    Top = 68
  end
  object qryRetencaoIOFPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DISTINCT'
      ''
      
        '  PTR.NOME AS NOMEPATRO, PPC.NOME AS NOMEPLANO,                 ' +
        '                                 '
      ''
      
        '  CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,                ' +
        '                                 '
      ''
      
        '  TCE.TCEDESCRICAO, IOF.HMESALDODEV,                            ' +
        '                                 '
      ''
      
        '  IOF.HMENUMPARCELAS || '#39' Vez(es)'#39' AS PRAZO,                    ' +
        '                               '
      ''
      
        '  CRE.HMEDATAPREVISTA, CRE.HMEDATAEFETIVA,                      ' +
        '                                 '
      ''
      
        '  IOF.HMEVLRPREVISTO                                  AS IOF_PRE' +
        'VISTO,                           '
      ''
      
        '  DECODE(CRE.FLGBAIXADO, 0, 0, IOF.HMEVLRPREVISTO)    AS IOF_EFE' +
        'TIVO,                            '
      ''
      
        '  DECODE(IOF.IDLANCIRRF, NULL, 0, IOF.HMEVLRPREVISTO) AS IOF_REC' +
        'OLHIDO,                          '
      ''
      
        '  NVL(IOF.HMEVLRBASE, 0)                              AS HMEVLRB' +
        'ASE,                             '
      ''
      
        '  CON.VLRCONTRATO,                                              ' +
        '                                 '
      ''
      
        '  DECODE(CRE.HMETIPOMOV,                                        ' +
        '                                 '
      ''
      
        '         0, '#39'Concessão'#39',                                        ' +
        '                               '
      ''
      
        '         1, '#39'Prestação '#39',                                       ' +
        '                               '
      ''
      
        '         2, '#39'Amortização/Refinanciamento'#39',                      ' +
        '                               '
      ''
      
        '         3, '#39'Quitação'#39',                                         ' +
        '                               '
      ''
      
        '         4, '#39'Atualização de Débito'#39',                            ' +
        '                               '
      ''
      
        '         5, '#39'Atualização de Saldo'#39' ,                            ' +
        '                               '
      ''
      
        '         6, '#39'CARGA'#39',                                            ' +
        '                               '
      ''
      
        '         7, '#39'Ajustes de Valores'#39'                                ' +
        '                               '
      ''
      
        '        ) AS EVENTO,                                            ' +
        '                                 '
      ''
      '  ITE.ITEDESCRICAO,'
      ''
      '  PI.NOME AS NOMEPERFIL'
      ''
      
        'FROM                                                            ' +
        '                                 '
      ''
      
        '   PESSOA            MUT,                                       ' +
        '                                 '
      ''
      
        '   PESSOA            PTR,                                       ' +
        '                                 '
      ''
      
        '   PLANPREVCONTABIL  PPC,                                       ' +
        '                                 '
      ''
      
        '   DEPENTIT          DEP,                                       ' +
        '                                 '
      ''
      
        '   TIPOCONTREMPTMO   TCE,                                       ' +
        '                                 '
      ''
      
        '   TIPOEMPTMO        TEP,                                       ' +
        '                                 '
      ''
      
        '   ITEMEMPTMO        ITE,                                       ' +
        '                                 '
      ''
      '   CONTRATOEMPTMO    CON,'
      ''
      '   PERFILINVEST      PI,'
      ''
      
        '   (                                                            ' +
        '                                 '
      ''
      '    SELECT  DISTINCT '
      ''
      
        '         HME.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO, HME.HMEVLRBAS' +
        'E,                               '
      ''
      
        '         HME.IDITEMEMPTMO,                                      ' +
        '                                 '
      ''
      
        '         HME.HMEDATAPREVISTA, HME.IDLANCIRRF, HME.HMENUMPARCELAS' +
        ', HME.HMETIPOMOV, HME.HMESALDODEV,               '
      ''
      
        '         NVL(MIG.IDPATROANT,CON.IDPATRO) AS IDPATRO,            ' +
        '                                 '
      ''
      
        '         NVL(MIG.IDPLANOCONTANT,CON.IDPLANOORIGEM) AS IDPLANO   ' +
        '                                 '
      ''
      
        '    FROM                                                        ' +
        '                                 '
      ''
      
        '         CONTRATOEMPTMO CON,                                    ' +
        '                                 '
      ''
      
        '         HISTMOVEMPTMO  HME                                     ' +
        '                                 '
      ''
      
        '         left outer join MIGRACONTRATOEP MIG                    ' +
        '                                 '
      ''
      
        '           ON (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND  ' +
        '                                 '
      ''
      
        '               MIG.DATAMIGRA        = F_MIGRAEP_DATA(HME.IDCONTR' +
        'ATOEMPTMO, HME.HMEDATAPREVISTA)) '
      ''
      
        '    WHERE                                                       ' +
        '                                 '
      ''
      
        '          (HME.FLGESTORNADO IS NULL OR HME.FLGESTORNADO  = 0)   ' +
        '                                 '
      ''
      
        '      AND HME.HMECENTRALIZA         = 0                         ' +
        '                                 '
      ''
      
        '      AND HME.HMEDESTACADO          = 0                         ' +
        '                                 '
      ''
      
        '      AND HME.IDITEMEMPTMO          IN (SELECT IDITEMEMPTMO     ' +
        '                                 '
      ''
      
        '                                        FROM   ITEMXPROCESSOEP I' +
        'TP                               '
      ''
      
        '                                        WHERE  ITP.FLGTIPOITEM =' +
        ' 4                               '
      ''
      
        '                                        AND    ITP.IDTIPOCONTREM' +
        'PTMO = CON.IDTIPOCONTREMPTMO     '
      ''
      
        '                                       )                        ' +
        '                                 '
      ''
      
        '      AND CON.FLGSITUACAO           <> '#39'C'#39'                      ' +
        '                               '
      ''
      
        '      AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO      ' +
        '                                 '
      ''
      
        '      AND ( HME.HMEDATAPREVISTA    BETWEEN TO_DATE('#39'11/10/2009'#39',' +
        #39'dd/mm/yyyy'#39')      '
      ''
      'AND TO_DATE('#39'17/10/2009'#39','#39'dd/mm/yyyy'#39') )    '
      ''
      
        '   ) IOF,                                                       ' +
        '                                 '
      ''
      
        '   (                                                            ' +
        '                                 '
      ''
      '    SELECT  DISTINCT '
      ''
      
        '        HME.IDCONTRATOEMPTMO, HME.HMEDATAPREVISTA, HME.HMETIPOMO' +
        'V,                               '
      ''
      
        '        HME.HMEDATAEFETIVA, HME.HMESALDODEV, NVL(HME.FLGBAIXADO,' +
        ' 1) AS FLGBAIXADO,               '
      ''
      
        '        NVL(MIG.IDPATROANT,CON.IDPATRO) AS IDPATRO,             ' +
        '                                 '
      ''
      
        '        NVL(MIG.IDPLANOCONTANT,CON.IDPLANOORIGEM) AS IDPLANO    ' +
        '                                 '
      ''
      
        '    FROM                                                        ' +
        '                                 '
      ''
      
        '        CONTRATOEMPTMO CON,                                     ' +
        '                                 '
      ''
      
        '        HISTMOVEMPTMO  HME                                      ' +
        '                                 '
      ''
      
        '        left outer join MIGRACONTRATOEP MIG                     ' +
        '                                 '
      ''
      
        '        ON (MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO AND     ' +
        '                                 '
      ''
      
        '            MIG.DATAMIGRA = F_MIGRAEP_DATA(HME.IDCONTRATOEMPTMO,' +
        ' HME.HMEDATAPREVISTA))'
      ''
      
        '    WHERE                                                       ' +
        '                                 '
      ''
      
        '        HME.HMECENTRALIZA         = 1                           ' +
        '                                 '
      ''
      
        '    AND (HME.FLGESTORNADO IS NULL OR HME.FLGESTORNADO  = 0)     ' +
        '                                 '
      ''
      
        '    AND CON.FLGSITUACAO           <> '#39'C'#39'                        ' +
        '                               '
      ''
      
        '    AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO        ' +
        '                                 '
      ''
      
        '    AND ( HME.HMEDATAPREVISTA     BETWEEN TO_DATE('#39'11/10/2009'#39','#39 +
        'dd/mm/yyyy'#39')                                       AND TO_DATE('#39 +
        '17/10/2009'#39','#39'dd/mm/yyyy'#39') ) '
      ''
      
        '   ) CRE                                                        ' +
        '                       '
      ''
      
        'WHERE                                                           ' +
        '                       '
      ''
      '      TEP.IDEMPRESAPROP            = 1'
      ''
      
        '  AND IOF.IDPATRO                  IN (91008, 1, 994886)        ' +
        '        '
      ''
      
        '  AND IOF.IDPLANO                  IN (5, 3, 74, 75, 29, 66, 79,' +
        ' 25, 1, 19, 2, 28, 22)                '
      ''
      
        '  AND IOF.IDPLANO                  = PPC.IDPLANOPREV            ' +
        '                       '
      ''
      
        '  AND IOF.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO       ' +
        '                       '
      ''
      
        '  AND IOF.HMETIPOMOV               = CRE.HMETIPOMOV             ' +
        '                       '
      ''
      
        '  AND IOF.HMEDATAPREVISTA          = CRE.HMEDATAPREVISTA        ' +
        '                       '
      ''
      
        '  AND CON.IDCONTRATOEMPTMO         = IOF.IDCONTRATOEMPTMO       ' +
        '                       '
      ''
      
        '  AND ITE.IDITEMEMPTMO             = IOF.IDITEMEMPTMO           ' +
        '                       '
      ''
      
        '  AND CON.IDCONTRATOEMPTMO         = CRE.IDCONTRATOEMPTMO       ' +
        '                       '
      ''
      
        '  AND CON.IDBENEF                  = MUT.IDPESSOA               ' +
        '                       '
      ''
      
        '  AND CON.IDBENEF                  = DEP.IDPESSOA               ' +
        '                       '
      ''
      
        '  AND CON.IDPESSOA                 = DEP.IDTITULAR              ' +
        '                       '
      ''
      
        '  AND CON.IDPATRO                  = PTR.IDPESSOA               ' +
        '                       '
      ''
      
        '  AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO      ' +
        '                       '
      ''
      '  AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO'
      ''
      '  AND CON.IDPERFILINVEST           = PI.IDPERFILINVEST(+)'
      ''
      
        'UNION                                                           ' +
        '                       '
      ''
      'SELECT                          '
      ''
      
        '    PTR.NOME AS NOMEPATRO, PPC.NOME AS NOMEPLANO,               ' +
        '                       '
      ''
      
        '    CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,              ' +
        '                       '
      ''
      
        '    TCE.TCEDESCRICAO,HME.HMESALDODEV,                           ' +
        '                       '
      ''
      
        '    HME.HMENUMPARCELAS || '#39'Vez(es)'#39' AS PRAZO,                   ' +
        '                     '
      ''
      
        '    HME.HMEDATAPREVISTA, HME.HMEDATAEFETIVA,                    ' +
        '                       '
      ''
      
        '    HME.HMEVLRPREVISTO                                  AS IOF_P' +
        'REVISTO,               '
      ''
      
        '    DECODE(HME.FLGBAIXADO, 0, 0, HME.HMEVLRPREVISTO)    AS IOF_E' +
        'FETIVO,                '
      ''
      
        '    DECODE(HME.IDLANCIRRF, NULL, 0, HME.HMEVLRPREVISTO) AS IOF_R' +
        'ECOLHIDO,              '
      ''
      
        '    NVL(HME.HMEVLRBASE, 0)                              AS HMEVL' +
        'RBASE,                 '
      ''
      
        '    CON.VLRCONTRATO,                                            ' +
        '                       '
      ''
      
        '    DECODE(HME.HMETIPOMOV,                                      ' +
        '                       '
      ''
      
        '           0, '#39'Concessão'#39',                                      ' +
        '                     '
      ''
      
        '           1, '#39'Prestação '#39',                                     ' +
        '                     '
      ''
      
        '           2, '#39'Amortização/Refinanciamento'#39',                    ' +
        '                     '
      ''
      
        '           3, '#39'Quitação'#39',                                       ' +
        '                     '
      ''
      
        '           4, '#39'Atualização de Débito'#39',                          ' +
        '                     '
      ''
      
        '           5, '#39'Atualização de Saldo'#39' ,                          ' +
        '                     '
      ''
      
        '           6, '#39'CARGA'#39',                                          ' +
        '                     '
      ''
      
        '           7, '#39'Ajustes de Valores'#39'                              ' +
        '                     '
      ''
      
        '           ) AS EVENTO,                                         ' +
        '                       '
      ''
      '    ITE.ITEDESCRICAO,'
      ''
      '    PI.NOME AS NOMEPERFIL'
      ''
      
        'FROM                                                            ' +
        '                       '
      ''
      
        '    PESSOA            MUT,                                      ' +
        '                       '
      ''
      
        '    PESSOA            PTR,                                      ' +
        '                       '
      ''
      
        '    PLANPREVCONTABIL  PPC,                                      ' +
        '                       '
      ''
      
        '    DEPENTIT          DEP,                                      ' +
        '                       '
      ''
      
        '    TIPOCONTREMPTMO   TCE,                                      ' +
        '                       '
      ''
      
        '    TIPOEMPTMO        TEP,                                      ' +
        '                       '
      ''
      
        '    ITEMEMPTMO        ITE,                                      ' +
        '                       '
      ''
      '    CONTRATOEMPTMO    CON,'
      ''
      '    PERFILINVEST      PI,'
      ''
      '   (SELECT  DISTINCT '
      ''
      
        '        H.IDCONTRATOEMPTMO,                                     ' +
        '                       '
      ''
      
        '        H.IDITEMEMPTMO,                                         ' +
        '                       '
      ''
      
        '        H.HMENUMPARCELAS,                                       ' +
        '                       '
      ''
      
        '        H.HMEDATAPREVISTA,                                      ' +
        '                       '
      ''
      
        '        H.HMEDATAEFETIVA,                                       ' +
        '                       '
      ''
      
        '        H.HMEVLRPREVISTO,                                       ' +
        '                       '
      ''
      
        '        H.FLGBAIXADO,                                           ' +
        '                       '
      ''
      
        '        H.IDLANCIRRF,                                           ' +
        '                       '
      ''
      
        '        H.HMEVLRBASE,                                           ' +
        '                       '
      ''
      
        '        H.HMETIPOMOV,                                           ' +
        '                       '
      ''
      
        '        H.HMESALDODEV,                                          ' +
        '                       '
      ''
      
        '        NVL(M.IDPATROANT,C.IDPATRO) AS IDPATRO,                 ' +
        '                       '
      ''
      
        '        NVL(M.IDPLANOCONTANT,C.IDPLANOORIGEM) AS IDPLANO        ' +
        '                       '
      ''
      
        '     FROM                                                       ' +
        '                       '
      ''
      
        '        CONTRATOEMPTMO C,                                       ' +
        '                       '
      ''
      
        '        HISTMOVEMPTMO  H                                        ' +
        '                       '
      ''
      
        '        left outer join MIGRACONTRATOEP M                       ' +
        '                       '
      ''
      
        '          ON (M.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO AND       ' +
        '                       '
      ''
      
        '              M.DATAMIGRA = F_MIGRAEP_DATA(H.IDCONTRATOEMPTMO, H' +
        '.HMEDATAPREVISTA))'
      ''
      
        '     WHERE                                                      ' +
        '                      '
      ''
      
        '         NVL(H.FLGESTORNADO,0) = 0                              ' +
        '                      '
      ''
      
        '     AND H.HMEDESTACADO        = 1                              ' +
        '                      '
      ''
      
        '     AND H.IDITEMEMPTMO        IN (SELECT IDITEMEMPTMO          ' +
        '                      '
      ''
      
        '                                   FROM   ITEMXPROCESSOEP       ' +
        '                      '
      ''
      
        '                                   WHERE  FLGTIPOITEM = 4       ' +
        '                      '
      ''
      
        '                                   AND    IDTIPOCONTREMPTMO = C.' +
        'IDTIPOCONTREMPTMO     '
      ''
      
        '                                  )                             ' +
        '                      '
      ''
      
        '     AND C.FLGSITUACAO         <> '#39'C'#39'                           ' +
        '                    '
      ''
      
        '     AND C.IDCONTRATOEMPTMO    = H.IDCONTRATOEMPTMO             ' +
        '                      '
      ''
      
        '    AND ( H.HMEDATAPREVISTA     BETWEEN TO_DATE('#39'11/10/2009'#39','#39'dd' +
        '/mm/yyyy'#39')                                       AND TO_DATE('#39'17' +
        '/10/2009'#39','#39'dd/mm/yyyy'#39') ) '
      ''
      
        '   ) HME                                                        ' +
        '                      '
      ''
      
        'WHERE                                                           ' +
        '                      '
      ''
      '      TEP.IDEMPRESAPROP       = 1'
      ''
      
        '  AND HME.IDPATRO             IN (91008, 1, 994886)             ' +
        '       '
      ''
      
        '  AND HME.IDPLANO             IN (5, 3, 74, 75, 29, 66, 79, 25, ' +
        '1, 19, 2, 28, 22)                    '
      ''
      
        '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO           ' +
        '                      '
      ''
      
        '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                ' +
        '                      '
      ''
      
        '  AND CON.FLGSITUACAO         <> '#39'C'#39'                            ' +
        '                    '
      ''
      
        '  AND CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO            ' +
        '                      '
      ''
      
        '  AND CON.IDBENEF             = MUT.IDPESSOA                    ' +
        '                      '
      ''
      
        '  AND CON.IDBENEF             = DEP.IDPESSOA                    ' +
        '                      '
      ''
      
        '  AND CON.IDPESSOA            = DEP.IDTITULAR                   ' +
        '                      '
      ''
      
        '  AND CON.IDPATRO             = PTR.IDPESSOA                    ' +
        '                      '
      ''
      
        '  AND ITE.IDITEMEMPTMO        = HME.IDITEMEMPTMO                ' +
        '                      '
      ''
      
        '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO           ' +
        '                      '
      ''
      
        '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                ' +
        '                      '
      ''
      '  AND HME.IDPLANO             = PPC.IDPLANOPREV'
      ''
      '  AND CON.IDPERFILINVEST           = PI.IDPERFILINVEST(+)'
      ''
      
        'ORDER BY                                                        ' +
        '                      '
      ''
      
        '  NOMEPLANO, NOMEPATRO, NOME                                    ' +
        '                      '
      ''
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 80
    object qryRetencaoIOFPPNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryRetencaoIOFPPNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryRetencaoIOFPPIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryRetencaoIOFPPMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRetencaoIOFPPNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRetencaoIOFPPTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryRetencaoIOFPPHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryRetencaoIOFPPPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 48
    end
    object qryRetencaoIOFPPHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryRetencaoIOFPPHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryRetencaoIOFPPIOF_PREVISTO: TFloatField
      FieldName = 'IOF_PREVISTO'
    end
    object qryRetencaoIOFPPIOF_EFETIVO: TFloatField
      FieldName = 'IOF_EFETIVO'
    end
    object qryRetencaoIOFPPIOF_RECOLHIDO: TFloatField
      FieldName = 'IOF_RECOLHIDO'
    end
    object qryRetencaoIOFPPHMEVLRBASE: TFloatField
      FieldName = 'HMEVLRBASE'
    end
    object qryRetencaoIOFPPVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryRetencaoIOFPPEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 27
    end
    object qryRetencaoIOFPPITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryRetencaoIOFPPNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 60
    end
  end
  object rptRetencaoIOFPP: TppReport
    AutoStop = False
    DataPipeline = pplRetencaoIOFPP
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Retenção de IOF'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270670
    DataPipelineName = 'pplRetencaoIOFPP'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      mmBottomOffset = 40
      mmHeight = 32015
      mmPrintPosition = 0
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Retenção de I.O.F. - por Plano e Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 54504
        mmTop = 9790
        mmWidth = 161396
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
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
        mmLeft = 54504
        mmTop = 2910
        mmWidth = 161396
        BandType = 0
      end
      object lblTipoData: TppLabel
        UserName = 'lblTipoData'
        AutoSize = False
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 21431
        mmWidth = 17992
        BandType = 0
      end
      object rptRetencaoIOF_lblDataIni: TppLabel
        UserName = 'rptRetencaoIOF_lblDataIni'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 21431
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lbCompetenciaIni2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 21431
        mmWidth = 1323
        BandType = 0
      end
      object rptRetencaoIOF_lblDataFim: TppLabel
        UserName = 'rptRetencaoIOF_lblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 38100
        mmTop = 21431
        mmWidth = 14817
        BandType = 0
      end
      object rptRetencaoIOFPP_lblTipoData: TppLabel
        UserName = 'Label5'
        Caption = '(Datas Previstas)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 25929
        mmWidth = 20902
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      BeforePrint = ppItensContratoBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3969
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = ppShape1Print
        UserName = 'rptContrato'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 33867
        mmTop = 529
        mmWidth = 61913
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'HMEVLRBASE'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 20902
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IOF_PREVISTO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 205317
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 180446
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'HMEDATAEFETIVA'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 193411
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'IOF_EFETIVO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 217223
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'IOF_RECOLHIDO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 229130
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'EVENTO'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 138377
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 529
        mmWidth = 41275
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NOMEPERFIL'
        DataPipeline = pplRetencaoIOFPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 241300
        mmTop = 529
        mmWidth = 28310
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 270670
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 20638
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 270670
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 163777
        mmTop = 6085
        mmWidth = 106627
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 147373
        mmTop = 7144
        mmWidth = 15536
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 5292
        mmTop = 6085
        mmWidth = 27517
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 6350
        mmTop = 7144
        mmWidth = 7673
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Item(ns)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15346
        mmTop = 7144
        mmWidth = 9525
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'HMEVLRBASE'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 7144
        mmWidth = 14288
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'IOF_PREVISTO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 205317
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'IOF_EFETIVO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 217223
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'IOF_RECOLHIDO'
        DataPipeline = pplRetencaoIOFPP
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRetencaoIOFPP'
        mmHeight = 2910
        mmLeft = 229130
        mmTop = 7144
        mmWidth = 10848
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = pplRetencaoIOFPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRetencaoIOFPP'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'NOMEPLANO'
          DataPipeline = pplRetencaoIOFPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 3810
          mmLeft = 1058
          mmTop = 794
          mmWidth = 21251
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 5821
          mmTop = 6350
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 20902
          mmTop = 6350
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 33867
          mmTop = 6350
          mmWidth = 6816
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 96309
          mmTop = 6350
          mmWidth = 19431
          BandType = 3
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 138377
          mmTop = 6879
          mmWidth = 8086
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Valor Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 165629
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Prevista'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 180975
          mmTop = 6350
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 190236
          mmTop = 2381
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 180711
          mmTop = 5556
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Efetiva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 194998
          mmTop = 6350
          mmWidth = 7959
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 207349
          mmTop = 6350
          mmWidth = 9610
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 205052
          mmTop = 5556
          mmWidth = 34131
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'I.O.F.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 220398
          mmTop = 2381
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 219720
          mmTop = 6350
          mmWidth = 8086
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Recolh.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2921
          mmLeft = 230379
          mmTop = 6350
          mmWidth = 8805
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Perfil Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 241300
          mmTop = 6350
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = pplRetencaoIOFPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRetencaoIOFPP'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 4498
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 3
          GroupNo = 1
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataPipeline = pplRetencaoIOFPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 3387
          mmLeft = 2646
          mmTop = 529
          mmWidth = 38142
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label102'
          Caption = 'Total:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 154252
          mmTop = 2381
          mmWidth = 9790
          BandType = 5
          GroupNo = 1
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 4498
          mmLeft = 163777
          mmTop = 1588
          mmWidth = 106627
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'HMEVLRBASE'
          DataPipeline = pplRetencaoIOFPP
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 2381
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'IOF_PREVISTO'
          DataPipeline = pplRetencaoIOFPP
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 2910
          mmLeft = 205317
          mmTop = 2381
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'IOF_EFETIVO'
          DataPipeline = pplRetencaoIOFPP
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 2910
          mmLeft = 217223
          mmTop = 2381
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'IOF_RECOLHIDO'
          DataPipeline = pplRetencaoIOFPP
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 2381
          mmWidth = 10848
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 270670
          BandType = 5
          GroupNo = 1
        end
        object ppShape7: TppShape
          UserName = 'Shape7'
          mmHeight = 4763
          mmLeft = 5292
          mmTop = 1588
          mmWidth = 26458
          BandType = 5
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Item(ns)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 15346
          mmTop = 2381
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplRetencaoIOFPP
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 2910
          mmLeft = 6350
          mmTop = 2381
          mmWidth = 7673
          BandType = 5
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          OnPrint = ppDBText13Print
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'NOMEPATRO'
          DataPipeline = pplRetencaoIOFPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRetencaoIOFPP'
          mmHeight = 3387
          mmLeft = 38629
          mmTop = 2381
          mmWidth = 38142
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
