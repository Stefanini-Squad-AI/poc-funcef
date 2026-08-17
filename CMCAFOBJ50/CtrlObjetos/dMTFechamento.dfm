inherited dtmMTFechamento: TdtmMTFechamento
  OldCreateOrder = True
  Left = 65498
  Top = 116
  Height = 633
  Width = 1049
  object sqlFechamentoAcrescimoValor: TCMSqlParams
    SQL.Strings = (
      'SELECT M.* FROM ('
      '  SELECT /*+ RULE */'
      '         (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, A.IDBEM, A.IDPESSOA, A.IDACRESCIMO,'
      '         AM.MOECODIGO, AM.VALORG, AM.CMBEM, AM.DATAULTCM,'
      
        '         AD.IDACRESCIMOXDEP, AD.TAXADEP, AD.DEPLANC, AD.CMDEP, A' +
        'D.DATAULTDEP, AD.DATAULTCM AS DATAULTCMDEP, AD.FLGDEPREC,'
      '         A.DATAACRESCIMO, A.IDMOVIMENTACAO,'
      
        '         B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGO' +
        'C,'
      
        '         NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO, C' +
        '.IDRESPONSAVEL,'
      '         G.NOME AS DESCGRUPO,'
      '         H.TXDEP_ANO'
      '  FROM   ACRESCIMOVALOR A,'
      '         ACRESCVALORXMOEDA AM,'
      '         ACRESCVALORXDEP AD,'
      '         BEM B,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C,'
      '         HISTORICOVIDAUTIL H,'
      '         IMOVEL I,'
      '         IMOVELXBEM IB'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (A.DATAACRESCIMO <= :PDATAMOV )'
      '    AND (B.CONTROLE   = '#39'T'#39')'
      '    AND (A.IDBEM = B.IDBEM)'
      '    AND (A.IDPESSOA = B.IDPESSOA)'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO)'
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (A.IDACRESCIMO = AM.IDACRESCIMO)'
      '    AND (AM.IDACRESCIMO = AD.IDACRESCIMO)'
      '    AND (AM.MOECODIGO = AD.MOECODIGO)'
      '    AND (IB.IDBEM(+) = B.IDBEM)'
      '    AND (I.IDIMOVEL(+) = IB.IDIMOVEL)'
      '    AND (H.IDIMOVEL(+) = I.IDIMOVEL) '
      '    AND (H.VIGENTE(+) = '#39'S'#39')'
      
        '  ORDER BY B.IDGRUPO, A.IDBEM, A.IDACRESCIMO, AM.MOECODIGO, AD.I' +
        'DACRESCIMOXDEP ) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 656
    Top = 120
  end
  object sqlFechamentoReavaliacao: TCMSqlParams
    SQL.Strings = (
      'SELECT M.* FROM ('
      '  SELECT /*+ RULE */'
      '         (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, R.IDBEM, R.IDPESSOA, R.IDREAVALIACAO,'
      '         RM.MOECODIGO, RM.VALORG, RM.CMBEM, RM.DATAULTCM,'
      
        '         RD.IDREAVALXDEP, RD.TAXADEP, RD.DEPLANC, RD.CMDEP, RD.D' +
        'ATAULTDEP, RD.DATAULTCM AS DATAULTCMDEP, RD.FLGDEPREC,'
      '         R.DATAREAVALIACAO, R.FLGULTREAVAL, R.IDMOVIMENTACAO,'
      
        '         B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGO' +
        'C,'
      
        '         NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO,C.' +
        'IDRESPONSAVEL,'
      '         G.NOME AS DESCGRUPO,'
      '         H.TXDEP_ANO'
      '  FROM   REAVALIACAO R,'
      '         REAVALXMOEDA RM,'
      '         REAVALXDEP RD,'
      '         BEM B,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C,'
      '         HISTORICOVIDAUTIL H,'
      '         IMOVEL I,'
      '         IMOVELXBEM IB'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (R.DATAREAVALIACAO <= :PDATAMOV )'
      '    AND (B.CONTROLE   = '#39'T'#39')'
      '    AND (R.IDBEM = B.IDBEM)'
      '    AND (R.IDPESSOA = B.IDPESSOA)'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO)'
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '    AND (RM.IDREAVALIACAO = RD.IDREAVALIACAO)'
      '    AND (RM.MOECODIGO = RD.MOECODIGO)'
      '    AND (IB.IDBEM(+) = B.IDBEM)'
      '    AND (I.IDIMOVEL(+) = IB.IDIMOVEL)'
      '    AND (H.IDIMOVEL(+) = I.IDIMOVEL) '
      '    AND (H.VIGENTE(+) = '#39'S'#39')'
      
        '  ORDER BY B.IDGRUPO, R.IDBEM, R.IDREAVALIACAO, RM.MOECODIGO, RD' +
        '.IDREAVALXDEP) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39
      ''
      ' ')
    Left = 656
    Top = 8
  end
  object sqlFechamentoBem: TCMSqlParams
    SQL.Strings = (
      'SELECT M.* FROM ('
      '  SELECT (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, B.IDBEM, B.IDPESSOA,'
      '         BM.MOECODIGO, BM.VALORG, BM.CMBEM, BM.DATAULTCM,'
      
        '         BM.VALORRES, (NVL(BM.VALORG,0) - NVL(BM.VALORRES,0)) AS' +
        ' VALORCALC,'
      
        '         BD.IDBEMXDEP, BD.TAXADEP, BD.DEPLANC, BD.CMDEP, BD.DATA' +
        'ULTDEP, BD.DATAULTCM AS DATAULTCMDEP, BD.FLGDEPREC,'
      
        '         B.BAIXATOTAL, B.DATAINICIODEP, B.IDMODULO, B.UNIDNEGOC,' +
        ' B.DTAINCLUSAO,'
      
        '         B.DESBEM, B.IDCONJUNTO, NVL(B.CODSUBCONTA,0) AS CODSUBC' +
        'ONTA,'
      
        '         B.PLACA, C.IDLOCALIZACAO, C.IDRESPONSAVEL, G.NOME AS DE' +
        'SCGRUPO,'
      '         H.TXDEP_ANO'
      '  FROM   BEM B,'
      '         BEMXMOEDA BM,'
      '         BEMXDEP BD,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C,'
      '         HISTORICOVIDAUTIL H,'
      '         IMOVEL I,'
      '         IMOVELXBEM IB'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (B.DATAINICIODEP <= :PDATAMOV)'
      '    AND (B.CONTROLE = '#39'T'#39')'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO) '
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (B.IDBEM = BM.IDBEM)'
      '    AND (B.IDPESSOA = BM.IDPESSOA)'
      '    AND (BM.IDBEM = BD.IDBEM)'
      '    AND (BM.IDPESSOA = BD.IDPESSOA)'
      '    AND (BM.MOECODIGO = BD.MOECODIGO)'
      '    AND (IB.IDBEM(+) = B.IDBEM)'
      '    AND (I.IDIMOVEL(+) = IB.IDIMOVEL)'
      '    AND (H.IDIMOVEL(+) = I.IDIMOVEL) '
      '    AND (H.VIGENTE(+) = '#39'S'#39')'
      '  ORDER BY B.IDGRUPO, B.IDBEM, BM.MOECODIGO, BD.IDBEMXDEP) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39
      ''
      ''
      ' '
      ' ')
    Left = 656
    Top = 64
  end
  object sqlAtuAcresxDep2: TCMSqlParams
    SQL.Strings = (
      'UPDATE ACRESCVALORXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC = :FLGDEPREC'
      'WHERE (IDACRESCIMO = :IDACRESCIMO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDACRESCIMOXDEP = :IDTAXADEP)'
      '')
    Left = 88
    Top = 456
  end
  object sqlAtuAcresxDep1: TCMSqlParams
    SQL.Strings = (
      'UPDATE ACRESCVALORXDEP'
      'SET CMDEP = :CMDEP,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (IDACRESCIMO = :IDACRESCIMO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDACRESCIMOXDEP = :IDTAXADEP)')
    Left = 88
    Top = 400
  end
  object sqlAtuAcresxMoeda: TCMSqlParams
    SQL.Strings = (
      'UPDATE ACRESCVALORXMOEDA'
      'SET CMBEM = :CMBEM,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (IDACRESCIMO = :IDACRESCIMO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '')
    Left = 88
    Top = 344
  end
  object sqlAtuReavxDep2: TCMSqlParams
    SQL.Strings = (
      'UPDATE REAVALXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC = :FLGDEPREC'
      'WHERE (IDREAVALIACAO = :IDREAVALIACAO)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDREAVALXDEP = :IDTAXADEP)'
      '')
    Left = 88
    Top = 288
  end
  object sqlAtuReavxDep1: TCMSqlParams
    SQL.Strings = (
      'UPDATE REAVALXDEP'
      'SET CMDEP = :CMDEP,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (IDREAVALXDEP = :IDTAXADEP)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDREAVALIACAO = :IDREAVALIACAO)'
      '')
    Left = 88
    Top = 232
  end
  object sqlAtuReavxMoeda: TCMSqlParams
    SQL.Strings = (
      'UPDATE REAVALXMOEDA'
      'SET CMBEM = :CMBEM,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (MOECODIGO = :MOECODIGO)'
      '  AND (IDREAVALIACAO = :IDREAVALIACAO)'
      '')
    Left = 88
    Top = 176
  end
  object sqlAtuBemxDep2: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEMXDEP'
      'SET DEPLANC = :DEPLANC,'
      '    DATAULTDEP = :DATAULTDEP,'
      '    FLGDEPREC = :FLGDEPREC'
      'WHERE (IDBEMXDEP = :IDTAXADEP)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    Left = 88
    Top = 120
  end
  object sqlAtuBemxDep1: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEMXDEP'
      'SET CMDEP = :CMDEP,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (IDBEMXDEP = :IDTAXADEP)'
      '  AND (MOECODIGO = :MOECODIGO)'
      '  AND (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    Left = 88
    Top = 64
  end
  object sqlAtuBemxMoeda: TCMSqlParams
    SQL.Strings = (
      'UPDATE BEMXMOEDA'
      'SET CMBEM = :CMBEM,'
      '    DATAULTCM = :DATAULTCM'
      'WHERE (MOECODIGO = :MOECODIGO)'
      '  AND (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    Left = 88
    Top = 8
  end
  object sqlFecRemHistMovBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO HM1'
      'WHERE ( EXISTS (SELECT /*+ RULE */ HM.IDMOVIMENTACAO'
      '                FROM HISTORICOMOVIMENTACAO HM,'
      '                     BEM B,'
      '                     GRUPO G'
      '                WHERE (HM.DATAMOVIMENTACAO = :DATAMOV)'
      '                  AND (HM.TIPDEPPRORATA = 2)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 36) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 99))'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      
        '                  AND ((G.FLGIMOVEL = :GRUPODEPINI) OR (G.FLGIMO' +
        'VEL = :GRUPODEPFIM))'
      '                  AND (HM.IDBEM = B.IDBEM)'
      '                  AND (HM.IDPESSOA = B.IDPESSOA)'
      '                  AND (B.IDGRUPO = G.IDGRUPO)'
      
        '                  AND (HM1.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) )' +
        ')'
      ' ')
    Left = 496
    Top = 64
  end
  object sqlFecRemVlrHistMovBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM VLRHISTMOVBEM VM'
      'WHERE ( EXISTS (SELECT /*+ RULE */ HM.IDMOVIMENTACAO '
      '                FROM HISTORICOMOVIMENTACAO HM,'
      '                     BEM B,'
      '                     GRUPO G'
      '                WHERE (HM.DATAMOVIMENTACAO = :DATAMOV)'
      '                  AND (HM.TIPDEPPRORATA = 2)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 36) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 99))'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      
        '                  AND ((G.FLGIMOVEL = :GRUPODEPINI) OR (G.FLGIMO' +
        'VEL = :GRUPODEPFIM))'
      '                  AND (HM.IDBEM = B.IDBEM)'
      '                  AND (HM.IDPESSOA = B.IDPESSOA)'
      '                  AND (B.IDGRUPO = G.IDGRUPO)'
      '                  AND (VM.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ))'
      ' ')
    Left = 496
    Top = 8
  end
  object sqlFecRemSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SD'
      'WHERE (SD.DATASLDBEM >= :DATAMOV)'
      
        '  AND ( EXISTS (SELECT /*+ RULE */ DISTINCT HM.IDBEM, HM.IDPESSO' +
        'A'
      '                FROM HISTORICOMOVIMENTACAO HM,'
      '                     BEM B,'
      '                     GRUPO G'
      '                WHERE (HM.DATAMOVIMENTACAO = :DATAMOV)'
      '                  AND (HM.TIPDEPPRORATA = 2)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 36) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 99))'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      
        '                  AND ((G.FLGIMOVEL = :GRUPODEPINI) OR (G.FLGIMO' +
        'VEL = :GRUPODEPFIM))'
      '                  AND (HM.IDBEM = B.IDBEM)'
      '                  AND (HM.IDPESSOA = B.IDPESSOA)'
      '                  AND (B.IDGRUPO = G.IDGRUPO)'
      '                  AND (SD.IDBEM = HM.IDBEM)'
      '                  AND (SD.IDPESSOA = HM.IDPESSOA) ))'
      ' ')
    Left = 496
    Top = 176
  end
  object sqlFecRemSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SLDCTBBEMXDEP SD'
      'WHERE (SD.DATASLDBEM >= :DATAMOV)'
      
        '  AND ( EXISTS (SELECT /*+ RULE */ DISTINCT HM.IDBEM, HM.IDPESSO' +
        'A'
      '                FROM HISTORICOMOVIMENTACAO HM,'
      '                     BEM B,'
      '                     GRUPO G'
      '                WHERE (HM.DATAMOVIMENTACAO = :DATAMOV)'
      '                  AND (HM.TIPDEPPRORATA = 2)'
      
        '                  AND ((HM.IDTIPOMOVIMENTACAO = 15) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 22) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 34) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 14) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 18) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 35) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 21) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 19) OR'
      
        '                       (HM.IDTIPOMOVIMENTACAO = 36) OR (HM.IDTIP' +
        'OMOVIMENTACAO = 99))'
      '                  AND (HM.IDPESSOA = :IDPESSOA)'
      
        '                  AND ((G.FLGIMOVEL = :GRUPODEPINI) OR (G.FLGIMO' +
        'VEL = :GRUPODEPFIM))'
      '                  AND (HM.IDBEM = B.IDBEM)'
      '                  AND (HM.IDPESSOA = B.IDPESSOA)'
      '                  AND (B.IDGRUPO = G.IDGRUPO)'
      '                  AND (SD.IDBEM = HM.IDBEM)'
      '                  AND (SD.IDPESSOA = HM.IDPESSOA) ))'
      ''
      ' ')
    Left = 496
    Top = 120
  end
  object sqlSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, S' +
        'CB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '       SCB1.VALORG, SCB1.REAVVALORG, SCB1.ULTREAVVALORG,'
      '       SCB1.CMBEM, SCB1.REAVCMBEM, SCB1.ULTREAVCMBEM,'
      '       SCD1.DEPLANC, SCD1.REAVDEPLANC, SCD1.ULTREAVDEPLANC,'
      '       SCD1.CMDEP, SCD1.REAVCMDEP, SCD1.ULTREAVCMDEP,'
      '       SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SCB1,'
      '     SLDCTBBEMXDEP SCD1,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE DATASLDBEM <= :DATASLD'
      '        AND :IDBEM = IDBEM'
      '        AND :IDPESSOA = IDPESSOA'
      '        AND :MOECODIGO = MOECODIGO'
      '      GROUP BY IDBEM) DTAMAX'
      'WHERE :IDBEM = SCB1.IDBEM'
      '  AND :IDPESSOA = SCB1.IDPESSOA'
      '  AND :MOECODIGO = SCB1.MOECODIGO'
      '  AND :IDTAXADEP = SCD1.IDSLDCTBBEMXDEP'
      '  AND DTAMAX.DATA = SCB1.DATASLDBEM'
      '  AND DTAMAX.IDBEM = SCB1.IDBEM'
      '  AND SCD1.IDBEM = SCB1.IDBEM'
      '  AND SCD1.IDPESSOA = SCB1.IDPESSOA'
      '  AND SCD1.MOECODIGO = SCB1.MOECODIGO'
      '  AND SCD1.DATASLDBEM = SCB1.DATASLDBEM'
      '  AND SCD1.IDBEM = :IDBEM'
      '  AND SCD1.IDPESSOA = :IDPESSOA'
      '  AND SCD1.MOECODIGO = :MOECODIGO'
      '  AND SCD1.DATASLDBEM = DTAMAX.DATA'
      '  AND SCD1.IDBEM = DTAMAX.IDBEM'
      'ORDER BY SCB1.DATASLDBEM, SCB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP'
      '')
    Left = 224
    Top = 288
  end
  object sqlMovContabBem: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */'
      
        '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO, VBEM.MOECOD' +
        'IGO, VBEM.IDTAXADEP,'
      ''
      
        '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM - VBEM.BXVALBEMACUM -' +
        ' VBEM.BXVALACRESACUM)                     AS VALORG,'
      
        '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM - VBEM.BXVALCMBEM' +
        'ACUM - VBEM.BXVALCMACRESACUM)             AS CMBEM,'
      
        '   SUM(VBEM.VALDEPBEMACUM + VBEM.VALDEPACRESACUM - VBEM.BXVALDEP' +
        'BEMACUM - VBEM.BXVALDEPACRESACUM)         AS DEPLANC,'
      
        '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM - VBEM.BXVA' +
        'LCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM) AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)           AS REAVV' +
        'ALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)       AS REAVC' +
        'MBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)     AS REAVD' +
        'EPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM) AS REAVC' +
        'MDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)           AS' +
        ' ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)       AS' +
        ' ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)     AS' +
        ' ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM) AS' +
        ' ULTREAVCMDEP'
      ''
      'FROM'
      '  ('
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(VM.VALOR,0),'
      '                                            03,NVL(VM.VALOR,0),'
      '                                            07,NVL(VM.VALOR,0),'
      '                                            10,NVL(VM.VALOR,0),'
      '                                            81,NVL(VM.VALOR,0),'
      
        '                                            41,NVL(VM.VALOR,0),0' +
        ')) AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(VM.VALOR,0),'
      
        '                                            49,NVL(VM.VALOR,0),0' +
        ')) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(VM.VALOR,0),'
      
        '                                            42,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(VM.VALOR,0),'
      
        '                                            50,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(VM.VALOR,0),'
      '                                            16,NVL(VM.VALOR,0),'
      '                                            13,NVL(VM.VALOR,0),'
      
        '                                            83,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(VM.VALOR,0),'
      
        '                                            91,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(VM.VALOR,0),'
      
        '                                            84,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(VM.VALOR,0),'
      
        '                                            92,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(VM.VALOR,0),'
      '                                            17,NVL(VM.VALOR,0),'
      
        '                                            43,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(VM.VALOR,0),'
      '                                            51,NVL(VM.VALOR,0),'
      
        '                                            99,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(VM.VALOR,0),'
      
        '                                            44,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(VM.VALOR,0),'
      
        '                                            52,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(VM.VALOR,0),'
      
        '                                            85,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(VM.VALOR,0),'
      
        '                                            93,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(VM.VALOR,0),'
      
        '                                            86,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(VM.VALOR,0),'
      
        '                                            94,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM, VLRHISTMOVBEM VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            82,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0),'
      '                                            33,NVL(VM.VALOR,0),'
      
        '                                            47,NVL(VM.VALOR,0),0' +
        ')) AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0),'
      
        '                                            48,NVL(VM.VALOR,0),0' +
        ')) AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (R.FLGULTREAVAL = 0)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(VM.VALOR,0),'
      '                                            32,NVL(VM.VALOR,0),'
      '                                            82,NVL(VM.VALOR,0),'
      
        '                                            45,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(VM.VALOR,0),'
      
        '                                            46,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(VM.VALOR,0),'
      
        '                                            87,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(VM.VALOR,0),'
      
        '                                            88,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP) UNION'
      ''
      '   (SELECT /*+ RULE */'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           VM.MOECODIGO,'
      '           VM.IDTAXADEP,'
      
        '           (0)                                                  ' +
        '   AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  VALULTCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(VM.VALOR,0),'
      '                                            33,NVL(VM.VALOR,0),'
      
        '                                            47,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(VM.VALOR,0),'
      
        '                                            48,NVL(VM.VALOR,0),0' +
        ')) AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '   AS  BXVALULTCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(VM.VALOR,0),'
      
        '                                            89,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(VM.VALOR,0),'
      
        '                                            90,NVL(VM.VALOR,0),0' +
        ')) AS  BXVALULTCMDEPREAVACUM'
      
        '    FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R, VLRHISTMOVBEM ' +
        'VM'
      '    WHERE (HM.IDBEM = :IDBEM)'
      '      AND (HM.DATAMOVIMENTACAO >= :DATAMOV)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '      AND (VM.IDTAXADEP = :IDTAXADEP)'
      '      AND (VM.MOECODIGO = :MOECODIGO)'
      '      AND (R.FLGULTREAVAL = 1)'
      '      AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      
        '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO,VM.MOECODI' +
        'GO,VM.IDTAXADEP)'
      '  )  VBEM'
      ''
      
        'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO, VBEM.' +
        'MOECODIGO, VBEM.IDTAXADEP'
      ''
      ' ')
    Left = 224
    Top = 344
  end
  object sqlBemxMoedaxDep: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ MOECODIGO, IDBEMXDEP'
      'FROM BEMXDEP BD'
      'WHERE BD.IDBEM = :IDBEM'
      '  AND BD.IDPESSOA = :IDPESSOA'
      'ORDER BY BD.MOECODIGO, BD.IDBEMXDEP'
      '')
    Left = 224
    Top = 232
  end
  object sqlRemSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SLDCTBBEMXDEP'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (DATASLDBEM >= :DATASLD)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 352
    Top = 64
  end
  object sqlRemSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (DATASLDBEM >= :DATASLD)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 352
    Top = 8
  end
  object sqlInsSldCtbBemxDep: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SLDCTBBEMXDEP (IDBEM,'
      '                           IDPESSOA,'
      '                           DATASLDBEM,'
      '                           MOECODIGO,'
      '                           IDSLDCTBBEMXDEP,'
      '                           DEPLANC,'
      '                           CMDEP,'
      '                           REAVDEPLANC,'
      '                           REAVCMDEP,'
      '                           ULTREAVDEPLANC,'
      '                           ULTREAVCMDEP)'
      '                   VALUES (:IDBEM,'
      '                           :IDPESSOA,'
      '                           :DATASLDBEM,'
      '                           :MOECODIGO,'
      '                           :IDSLDCTBBEMXDEP,'
      '                           :DEPLANC,'
      '                           :CMDEP,'
      '                           :REAVDEPLANC,'
      '                           :REAVCMDEP,'
      '                           :ULTREAVDEPLANC,'
      '                           :ULTREAVCMDEP)'
      '')
    Left = 352
    Top = 240
  end
  object sqlInsSaldoContabBem: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SALDOCONTABBEM (IDBEM,'
      '                            IDPESSOA,'
      '                            DATASLDBEM,'
      '                            MOECODIGO,'
      '                            VALORG,'
      '                            CMBEM,'
      '                            REAVVALORG,'
      '                            REAVCMBEM,'
      '                            ULTREAVVALORG,'
      '                            ULTREAVCMBEM,'
      '                            IDGRUPO,'
      '                            IDLOCALIZACAO,'
      '                            IDRESPONSAVEL)'
      '                    VALUES (:IDBEM,'
      '                            :IDPESSOA,'
      '                            :DATASLDBEM,'
      '                            :MOECODIGO,'
      '                            :VALORG,'
      '                            :CMBEM,'
      '                            :REAVVALORG,'
      '                            :REAVCMBEM,'
      '                            :ULTREAVVALORG,'
      '                            :ULTREAVCMBEM,'
      '                            :IDGRUPO,'
      '                            :IDLOCALIZACAO,'
      '                            :IDRESPONSAVEL)'
      '')
    Left = 352
    Top = 184
  end
  object sqlMovTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO,'
      '       HM.IDTIPOMOVIMENTACAO, HM.DATAMOVIMENTACAO,'
      '       HM.IDGRUPANT, HM.IDLOCALANT, HM.IDRESPANT,'
      '       B.IDGRUPO, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     CONJUNTO C'
      'WHERE HM.IDBEM + 0 = :IDBEM'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 05 OR HM.IDTIPOMOVIMENTACAO = 11 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 12)'
      '  AND HM.DATAMOVIMENTACAO >= :DATAMOV'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND C.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      
        'ORDER BY HM.IDBEM, HM.IDPESSOA, HM.DATAMOVIMENTACAO DESC, HM.IDM' +
        'OVIMENTACAO'
      '')
    Left = 352
    Top = 128
  end
  object sqlHistFecCMBEM: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.IDTIPOMOVIMENTACAO, HM.DATAULTDEP, VM.MOEC' +
        'ODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND HM.IDTIPOMOVIMENTACAO = 15'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      '')
    Left = 352
    Top = 400
  end
  object sqlEstFechamentoAcrescimo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDGRUPO, A.IDBEM, A.IDPESSOA, A.IDACRESCIMO' +
        ','
      '       AM.MOECODIGO, AM.CMBEM,'
      '       AD.IDACRESCIMOXDEP, AD.DEPLANC, AD.CMDEP,'
      '       B.IDCONJUNTO, C.IDLOCALIZACAO,C.IDRESPONSAVEL'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       ACRESCIMOVALOR A,'
      '       ACRESCVALORXMOEDA AM,'
      '       ACRESCVALORXDEP AD,'
      '       BEM B,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND (HM.IDTIPOMOVIMENTACAO = 34 OR HM.IDTIPOMOVIMENTACAO = 35'
      
        '      OR HM.IDTIPOMOVIMENTACAO = 36 OR HM.IDTIPOMOVIMENTACAO = 9' +
        '9)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND A.IDPESSOA = :IDPESSOA'
      '  AND (G.FLGIMOVEL = :GRUPODEPINI OR G.FLGIMOVEL = :GRUPODEPFIM)'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = A.IDBEM'
      '  AND HM.IDPESSOA = A.IDPESSOA'
      '  AND HM.IDREAVALACRESC = A.IDACRESCIMO'
      '  AND A.IDBEM = B.IDBEM'
      '  AND A.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND A.IDACRESCIMO = AM.IDACRESCIMO'
      '  AND AM.IDACRESCIMO = AD.IDACRESCIMO'
      '  AND AM.MOECODIGO = AD.MOECODIGO'
      
        'ORDER BY B.IDGRUPO, A.IDBEM, A.IDACRESCIMO, AM.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 656
    Top = 288
  end
  object sqlEstFechamentoReavaliacao: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDGRUPO, R.IDBEM, R.IDPESSOA, R.IDREAVALIAC' +
        'AO,'
      '       RM.MOECODIGO, RM.CMBEM,'
      '       RD.IDREAVALXDEP, RD.DEPLANC, RD.CMDEP,'
      '       R.FLGULTREAVAL,'
      '       B.IDCONJUNTO, C.IDLOCALIZACAO,C.IDRESPONSAVEL'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       REAVALIACAO R,'
      '       REAVALXMOEDA RM,'
      '       REAVALXDEP RD,'
      '       BEM B,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO = 18 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 19)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND R.IDPESSOA = :IDPESSOA'
      '  AND (G.FLGIMOVEL = :GRUPODEPINI OR G.FLGIMOVEL = :GRUPODEPFIM)'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = R.IDBEM'
      '  AND HM.IDPESSOA = R.IDPESSOA'
      '  AND HM.IDREAVALACRESC = R.IDREAVALIACAO'
      '  AND R.IDBEM = B.IDBEM'
      '  AND R.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND R.IDREAVALIACAO = RM.IDREAVALIACAO'
      '  AND RM.IDREAVALIACAO = RD.IDREAVALIACAO'
      '  AND RM.MOECODIGO = RD.MOECODIGO'
      
        'ORDER BY B.IDGRUPO, R.IDBEM, R.IDREAVALIACAO, RM.MOECODIGO, RD.I' +
        'DREAVALXDEP'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 656
    Top = 232
  end
  object sqlEstFechamentoBem: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ B.IDGRUPO, B.IDBEM, B.IDPESSOA, '
      '       BM.MOECODIGO, BM.CMBEM,'
      '       BD.IDBEMXDEP, BD.DEPLANC, BD.CMDEP,'
      '       B.IDCONJUNTO, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       BEM B,'
      '       BEMXMOEDA BM,'
      '       BEMXDEP BD,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO = 14 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 21)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND BM.IDPESSOA = :IDPESSOA'
      '  AND BD.IDPESSOA = :IDPESSOA'
      '  AND (G.FLGIMOVEL = :GRUPODEPINI OR G.FLGIMOVEL = :GRUPODEPFIM)'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND B.IDBEM = BM.IDBEM'
      '  AND B.IDPESSOA = BM.IDPESSOA'
      '  AND BM.IDBEM = BD.IDBEM'
      '  AND BM.IDPESSOA = BD.IDPESSOA'
      '  AND BM.MOECODIGO = BD.MOECODIGO'
      'ORDER BY B.IDGRUPO, B.IDBEM, BM.MOECODIGO, BD.IDBEMXDEP'
      '')
    Left = 656
    Top = 176
  end
  object sqlHistFecCMBEMReav: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTACAO, HM.' +
        'DATAULTDEP, VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDREAVALACRESC = :IDREAVALIACAO'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND HM.IDTIPOMOVIMENTACAO = 22'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      '')
    Left = 224
    Top = 400
  end
  object sqlHistFecCMBEMAcres: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTACAO, HM.' +
        'DATAULTDEP, VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDREAVALACRESC = :IDACRESCIMO'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND HM.IDTIPOMOVIMENTACAO = 34'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      '')
    Left = 496
    Top = 400
  end
  object sqlHistFecDEP: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ HM.IDTIPOMOVIMENTACAO, HM.DATAULTDEP,'
      ' VM.MOECODIGO, VM.IDTAXADEP, SUM(VM.VALOR)as VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDBEM = :IDBEM'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND (HM.IDTIPOMOVIMENTACAO = 14 OR HM.IDTIPOMOVIMENTACAO = 21)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND VM.IDTAXADEP = :IDTAXADEP'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      
        'group by HM.IDTIPOMOVIMENTACAO, HM.DATAULTDEP, VM.MOECODIGO, VM.' +
        'IDTAXADEP')
    Left = 352
    Top = 456
  end
  object sqlHistFecDEPReav: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTACAO, HM.' +
        'DATAULTDEP, VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDREAVALACRESC = :IDREAVALIACAO'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND (HM.IDTIPOMOVIMENTACAO = 18 OR HM.IDTIPOMOVIMENTACAO = 19)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND VM.IDTAXADEP = :IDTAXADEP '
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      '')
    Left = 224
    Top = 456
  end
  object sqlHistFecDEPAcres: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ HM.IDREAVALACRESC, HM.IDTIPOMOVIMENTACAO, HM.' +
        'DATAULTDEP, VM.MOECODIGO, VM.IDTAXADEP, VM.VALOR'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM'
      'WHERE HM.IDREAVALACRESC = :IDACRESCIMO'
      '  AND HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      '  AND (HM.IDTIPOMOVIMENTACAO = 35 OR'
      '       HM.IDTIPOMOVIMENTACAO = 36 OR'
      '       HM.IDTIPOMOVIMENTACAO = 99)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND VM.MOECODIGO = :MOECODIGO'
      '  AND VM.IDTAXADEP = :IDTAXADEP'
      '  AND HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO'
      ''
      ' ')
    Left = 496
    Top = 456
  end
  object sqlEstFechamentoBens: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ DISTINCT HM.IDBEM, HM.IDPESSOA, B.IDGRUPO, C.' +
        'IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM   HISTORICOMOVIMENTACAO HM,'
      '       BEM B,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE HM.DATAMOVIMENTACAO = :DATAMOV'
      '  AND HM.TIPDEPPRORATA = 2'
      
        '  AND (HM.IDTIPOMOVIMENTACAO = 15 OR HM.IDTIPOMOVIMENTACAO = 14 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 21 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 22 OR HM.IDTIPOMOVIMENTACAO = 18 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 19 OR'
      
        '       HM.IDTIPOMOVIMENTACAO = 34 OR HM.IDTIPOMOVIMENTACAO = 35 ' +
        'OR HM.IDTIPOMOVIMENTACAO = 36 OR'
      '       HM.IDTIPOMOVIMENTACAO = 99)'
      '  AND HM.IDPESSOA = :IDPESSOA'
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND (G.FLGIMOVEL = :GRUPODEPINI OR G.FLGIMOVEL = :GRUPODEPFIM)'
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND HM.IDBEM = B.IDBEM'
      '  AND HM.IDPESSOA = B.IDPESSOA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      'ORDER BY HM.IDBEM'
      ''
      ' ')
    Left = 496
    Top = 240
  end
  object sqlRemHistPlnCodigo: TCMSqlParams
    SQL.Strings = (
      'UPDATE /*+ RULE */ HISTORICOMOVIMENTACAO'
      'SET PLNCODIGO = NULL'
      'WHERE IDMOVIMENTACAO IN ( SELECT HM.IDMOVIMENTACAO'
      '                          FROM HISTORICOMOVIMENTACAO HM,'
      '                               BEM B,'
      '                               GRUPO G'
      '                          WHERE HM.DATAMOVIMENTACAO = :DATAMOV'
      '                            AND HM.TIPDEPPRORATA = 2'
      
        '                            AND (HM.IDTIPOMOVIMENTACAO + 0 = 15 ' +
        'OR HM.IDTIPOMOVIMENTACAO + 0 = 22 OR HM.IDTIPOMOVIMENTACAO + 0 =' +
        ' 34 OR'
      
        '                                 HM.IDTIPOMOVIMENTACAO + 0 = 14 ' +
        'OR HM.IDTIPOMOVIMENTACAO + 0 = 18 OR HM.IDTIPOMOVIMENTACAO + 0 =' +
        ' 35 OR'
      
        '                                 HM.IDTIPOMOVIMENTACAO + 0 = 21 ' +
        'OR HM.IDTIPOMOVIMENTACAO + 0 = 19 OR HM.IDTIPOMOVIMENTACAO + 0 =' +
        ' 36 OR'
      
        '                                 HM.IDTIPOMOVIMENTACAO + 0 = 99 ' +
        'OR HM.IDTIPOMOVIMENTACAO + 0 = 97)'
      '                            AND HM.IDPESSOA = :IDPESSOA'
      '                            AND B.IDPESSOA = :IDPESSOA'
      
        '                            AND (G.FLGIMOVEL = :GRUPODEPINI OR G' +
        '.FLGIMOVEL = :GRUPODEPFIM)'
      '                            AND B.IDBEM = HM.IDBEM + 0'
      '                            AND B.IDPESSOA = HM.IDPESSOA'
      '                            AND B.IDGRUPO = G.IDGRUPO )'
      ''
      ''
      ' '
      ' ')
    Left = 352
    Top = 288
  end
  object sqlFechamentoAcrescimoValorSemCM: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDGRUPO, A.IDBEM, A.IDPESSOA, A.IDACRESCIMO' +
        ','
      '       AM.MOECODIGO, AM.VALORG, AM.CMBEM, AM.DATAULTCM,'
      
        '       AD.IDACRESCIMOXDEP, AD.TAXADEP, AD.DEPLANC, AD.CMDEP, AD.' +
        'DATAULTDEP, AD.DATAULTCM AS DATAULTCMDEP, A.FLGDEPREC,'
      '       A.DATAACRESCIMO, A.IDMOVIMENTACAO,'
      '       B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGOC,'
      
        '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO, C.I' +
        'DRESPONSAVEL,'
      '       G.NOME AS DESCGRUPO'
      'FROM   ACRESCIMOVALOR A,'
      '       ACRESCVALORXMOEDA AM,'
      '       ACRESCVALORXDEP AD,'
      '       BEM B,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (AD.TAXADEP <> 0)'
      '  AND (AD.FLGDEPREC = 0)'
      '  AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (A.DATAACRESCIMO <= :PDATAMOV )'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (A.IDPESSOA = :PIDPESSOA)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = PG.IDGRUPO)'
      '  AND (B.IDPESSOA = PG.IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA = C.IDPESSOA)'
      '  AND (A.IDACRESCIMO = AM.IDACRESCIMO)'
      '  AND (AM.IDACRESCIMO = AD.IDACRESCIMO)'
      '  AND (AM.MOECODIGO = AD.MOECODIGO)'
      
        'ORDER BY B.IDGRUPO, A.IDBEM, A.IDACRESCIMO, AM.MOECODIGO, AD.IDA' +
        'CRESCIMOXDEP'
      '')
    Left = 656
    Top = 456
  end
  object sqlFechamentoReavaliacaoSemCM: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDGRUPO, R.IDBEM, R.IDPESSOA, R.IDREAVALIAC' +
        'AO,'
      '       RM.MOECODIGO, RM.VALORG, RM.CMBEM, RM.DATAULTCM,'
      
        '       RD.IDREAVALXDEP, RD.TAXADEP, RD.DEPLANC, RD.CMDEP, RD.DAT' +
        'AULTDEP, RD.DATAULTCM AS DATAULTCMDEP, R.FLGDEPREC,'
      '       R.DATAREAVALIACAO, R.FLGULTREAVAL, R.IDMOVIMENTACAO,'
      '       B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGOC,'
      
        '       NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO,C.ID' +
        'RESPONSAVEL,'
      '       G.NOME AS DESCGRUPO'
      'FROM   REAVALIACAO R,'
      '       REAVALXMOEDA RM,'
      '       REAVALXDEP RD,'
      '       BEM B,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (RD.TAXADEP <> 0)'
      '  AND (RD.FLGDEPREC = 0)'
      '  AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (R.DATAREAVALIACAO <= :PDATAMOV)'
      '  AND (B.CONTROLE   = '#39'T'#39')'
      '  AND (R.IDPESSOA = :PIDPESSOA)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = PG.IDGRUPO)'
      '  AND (B.IDPESSOA = PG.IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA = C.IDPESSOA)'
      '  AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '  AND (RM.IDREAVALIACAO = RD.IDREAVALIACAO)'
      '  AND (RM.MOECODIGO = RD.MOECODIGO)'
      
        'ORDER BY B.IDGRUPO, R.IDBEM, R.IDREAVALIACAO, RM.MOECODIGO, RD.I' +
        'DREAVALXDEP'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 656
    Top = 400
  end
  object sqlFechamentoBemSemCM: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ B.IDGRUPO, B.IDBEM, B.IDPESSOA, '
      '       BM.MOECODIGO, BM.VALORG, BM.CMBEM, BM.DATAULTCM,'
      
        '       BD.IDBEMXDEP, BD.TAXADEP, BD.DEPLANC, BD.CMDEP, BD.DATAUL' +
        'TDEP, BD.DATAULTCM AS DATAULTCMDEP, BD.FLGDEPREC,'
      
        '       B.BAIXATOTAL, B.DATAINICIODEP, B.IDMODULO, B.UNIDNEGOC, B' +
        '.DTAINCLUSAO,'
      
        '       B.DESBEM, B.IDCONJUNTO, NVL(B.CODSUBCONTA,0) AS CODSUBCON' +
        'TA, '
      
        '       B.PLACA, C.IDLOCALIZACAO, C.IDRESPONSAVEL, G.NOME AS DESC' +
        'GRUPO'
      'FROM   BEM B,'
      '       BEMXMOEDA BM,'
      '       BEMXDEP BD,'
      '       PLANOGRUPO PG,'
      '       GRUPO G,'
      '       CONJUNTO C'
      'WHERE (BD.TAXADEP <> 0)'
      '  AND (BD.FLGDEPREC = 0)'
      '  AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '  AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGIMO' +
        'VELFIM))'
      '  AND (B.DATAINICIODEP <= :PDATAMOV)'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      '  AND (BM.IDPESSOA = :PIDPESSOA)'
      '  AND (BD.IDPESSOA = :PIDPESSOA)'
      '  AND (B.IDGRUPO = PG.IDGRUPO)'
      '  AND (B.IDPESSOA = PG.IDPESSOA)'
      '  AND (PG.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '  AND (B.IDPESSOA = C.IDPESSOA)'
      '  AND (B.IDBEM = BM.IDBEM)'
      '  AND (B.IDPESSOA = BM.IDPESSOA)'
      '  AND (BM.IDBEM = BD.IDBEM)'
      '  AND (BM.IDPESSOA = BD.IDPESSOA)'
      '  AND (BM.MOECODIGO = BD.MOECODIGO)'
      'ORDER BY B.IDGRUPO, B.IDBEM, BM.MOECODIGO, BD.IDBEMXDEP'
      '')
    Left = 656
    Top = 344
  end
  object sqlProjSaldoAcresc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDGRUPO, SB.IDBEM, A.IDPESSOA, A.IDACRESCI' +
        'MO, A.DATAACRESCIMO,'
      '       AM.MOECODIGO, AM.VALORG, AM.CMBEM, AM.DATAULTCM,'
      '       AD.IDACRESCIMOXDEP, AD.TAXADEP, AD.DEPLANC, AD.CMDEP,'
      '       AD.DATAULTDEP, AD.DATAULTCM AS DATAULTCMDEP, AD.FLGDEPREC'
      'FROM (SELECT SB1.IDGRUPO, SB1.IDBEM, MAX(SB1.DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM SB1,'
      '           BEM B1, GRUPO G1'
      '      WHERE SB1.DATASLDBEM <= :DATASLD'
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      ''
      
        '        AND (G1.FLGIMOVEL = :TIPOGRUPO1 OR G1.FLGIMOVEL = :TIPOG' +
        'RUPO2)'
      '        AND B1.CONTROLE = '#39'T'#39
      '        AND B1.BAIXATOTAL = '#39'N'#39
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDBEM) SB,'
      ''
      '     ACRESCIMOVALOR A, ACRESCVALORXMOEDA AM, ACRESCVALORXDEP AD'
      ''
      'WHERE A.IDPESSOA = :IDPESSOA'
      '  AND AM.MOECODIGO = :MOECODIGO'
      '  AND AD.MOECODIGO = :MOECODIGO'
      '  AND AD.IDACRESCIMOXDEP = :IDTAXADEP'
      '  AND SB.IDBEM = A.IDBEM'
      '  AND A.IDACRESCIMO = AM.IDACRESCIMO'
      '  AND AM.IDACRESCIMO = AD.IDACRESCIMO'
      '  AND AM.MOECODIGO = AD.MOECODIGO'
      'ORDER BY SB.IDGRUPO, SB.IDBEM, A.IDACRESCIMO'
      '')
    Left = 224
    Top = 176
  end
  object sqlProjSaldoReaval: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDGRUPO, SB.IDBEM, R.IDPESSOA, R.IDREAVALI' +
        'ACAO, R.DATAREAVALIACAO,'
      '       RM.MOECODIGO, RM.VALORG, RM.CMBEM, RM.DATAULTCM,'
      '       RD.IDREAVALXDEP, RD.TAXADEP, RD.DEPLANC, RD.CMDEP,'
      '       RD.DATAULTDEP, RD.DATAULTCM AS DATAULTCMDEP, RD.FLGDEPREC'
      'FROM (SELECT SB1.IDGRUPO, SB1.IDBEM, MAX(SB1.DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM SB1,'
      '           BEM B1, GRUPO G1'
      '      WHERE SB1.DATASLDBEM <= :DATASLD'
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      ''
      
        '        AND (G1.FLGIMOVEL = :TIPOGRUPO1 OR G1.FLGIMOVEL = :TIPOG' +
        'RUPO2)'
      '        AND B1.CONTROLE = '#39'T'#39
      '        AND B1.BAIXATOTAL = '#39'N'#39
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDBEM) SB,'
      ''
      '     REAVALIACAO R, REAVALXMOEDA RM, REAVALXDEP RD'
      ''
      'WHERE R.IDPESSOA = :IDPESSOA'
      '  AND RM.MOECODIGO = :MOECODIGO'
      '  AND RD.MOECODIGO = :MOECODIGO'
      '  AND RD.IDREAVALXDEP = :IDTAXADEP'
      '  AND SB.IDBEM = R.IDBEM'
      '  AND R.IDREAVALIACAO = RM.IDREAVALIACAO'
      '  AND RM.IDREAVALIACAO = RD.IDREAVALIACAO'
      '  AND RM.MOECODIGO = RD.MOECODIGO'
      'ORDER BY SB.IDGRUPO, SB.IDBEM, R.IDREAVALIACAO'
      '')
    Left = 224
    Top = 120
  end
  object sqlProjSaldoBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ SB.IDGRUPO, SB.IDBEM, B.IDPESSOA, B.DATAINICI' +
        'ODEP,'
      '       BM.MOECODIGO, BM.VALORG, BM.CMBEM, BM.DATAULTCM,'
      '       BD.IDBEMXDEP, BD.TAXADEP, BD.DEPLANC, BD.CMDEP,'
      '       BD.DATAULTDEP, BD.DATAULTCM AS DATAULTCMDEP, BD.FLGDEPREC'
      'FROM (SELECT SB1.IDGRUPO, SB1.IDBEM, MAX(SB1.DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM SB1,'
      '           BEM B1, GRUPO G1'
      '      WHERE SB1.DATASLDBEM <= :DATASLD'
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      ''
      
        '        AND (G1.FLGIMOVEL = :TIPOGRUPO1 OR G1.FLGIMOVEL = :TIPOG' +
        'RUPO2)'
      '        AND B1.CONTROLE = '#39'T'#39
      '        AND B1.BAIXATOTAL = '#39'N'#39
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDBEM) SB,'
      ''
      '     BEM B, BEMXMOEDA BM, BEMXDEP BD'
      ''
      'WHERE B.IDPESSOA = :IDPESSOA'
      '  AND BM.MOECODIGO = :MOECODIGO'
      '  AND BM.IDPESSOA = :IDPESSOA'
      '  AND BD.MOECODIGO = :MOECODIGO'
      '  AND BD.IDBEMXDEP = :IDTAXADEP'
      '  AND BD.IDPESSOA = :IDPESSOA'
      '  AND SB.IDBEM = B.IDBEM'
      '  AND B.IDBEM = BM.IDBEM'
      '  AND BM.IDBEM = BD.IDBEM'
      '  AND BM.MOECODIGO = BD.MOECODIGO'
      'ORDER BY SB.IDGRUPO, SB.IDBEM'
      '')
    Left = 224
    Top = 64
  end
  object sqlProjSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       A.ANO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO AS S_A,'
      '       (0.00) AS VALCUSTO,'
      '       (0.00) AS VALCMCUSTO,'
      '       (0.00) AS VALDEPREC,'
      '       (0.00) AS VALCMDEPREC,'
      '       (0.00) AS VALSALDO'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG,'
      '     (SELECT (:ANOINI + (IDTIPOMOVIMENTACAO - 1)) AS ANO'
      '      FROM TIPOMOVIMENTACAO'
      '      WHERE IDTIPOMOVIMENTACAO <= :ANOS'
      '      ORDER BY IDTIPOMOVIMENTACAO) A'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE, A.ANO'
      '')
    Left = 224
    Top = 8
  end
  object SqlSLDCTBBEM: TCMSqlParams
    SQL.Strings = (
      'SELECT TMP.DEPLANC'
      'FROM ('
      'SELECT SLD.DATASLDBEM, SLD.DEPLANC'
      '  FROM   SLDCTBBEMXDEP SLD'
      '  WHERE (SLD.IDPESSOA = :PIDPESSOA)    '
      '    AND  (SLD.IDBEM = :PIDBEM) '
      '    AND   (SLD.DATASLDBEM <= :PDATAMOV)'
      'ORDER BY SLD.DATASLDBEM DESC ) TMP'
      'WHERE ROWNUM <=1')
    Left = 816
    Top = 56
  end
  object SqlGrupoEstorno: TCMSqlParams
    SQL.Strings = (
      '--'
      '--reavaliação'
      '(SELECT distinct M.IDGRUPO FROM ('
      '  SELECT /*+ RULE */'
      '         (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, R.IDBEM, R.IDPESSOA, R.IDREAVALIACAO,'
      '         RM.MOECODIGO, RM.VALORG, RM.CMBEM, RM.DATAULTCM,'
      
        '         RD.IDREAVALXDEP, RD.TAXADEP, RD.DEPLANC, RD.CMDEP, RD.D' +
        'ATAULTDEP, RD.DATAULTCM AS DATAULTCMDEP, RD.FLGDEPREC,'
      '         R.DATAREAVALIACAO, R.FLGULTREAVAL, R.IDMOVIMENTACAO,'
      
        '         B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGO' +
        'C,'
      
        '         NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO,C.' +
        'IDRESPONSAVEL,'
      '         G.NOME AS DESCGRUPO'
      '  FROM   REAVALIACAO R,'
      '         REAVALXMOEDA RM,'
      '         REAVALXDEP RD,'
      '         BEM B,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (R.DATAREAVALIACAO <= :PDATAMOV )'
      '    AND (B.CONTROLE   = '#39'T'#39')'
      '    AND (R.IDBEM = B.IDBEM)'
      '    AND (R.IDPESSOA = B.IDPESSOA)'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO)'
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (R.IDREAVALIACAO = RM.IDREAVALIACAO)'
      '    AND (RM.IDREAVALIACAO = RD.IDREAVALIACAO)'
      '    AND (RM.MOECODIGO = RD.MOECODIGO)'
      
        '  ORDER BY B.IDGRUPO, R.IDBEM, R.IDREAVALIACAO, RM.MOECODIGO, RD' +
        '.IDREAVALXDEP) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39
      ')'
      '--'
      '--fechamento bem'
      ''
      'union'
      '(SELECT distinct M.IDGRUPO  FROM ('
      '  SELECT (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, B.IDBEM, B.IDPESSOA,'
      '         BM.MOECODIGO, BM.VALORG, BM.CMBEM, BM.DATAULTCM,'
      
        '         BM.VALORRES, (NVL(BM.VALORG,0) - NVL(BM.VALORRES,0)) AS' +
        ' VALORCALC,'
      
        '         BD.IDBEMXDEP, BD.TAXADEP, BD.DEPLANC, BD.CMDEP, BD.DATA' +
        'ULTDEP, BD.DATAULTCM AS DATAULTCMDEP, BD.FLGDEPREC,'
      
        '         B.BAIXATOTAL, B.DATAINICIODEP, B.IDMODULO, B.UNIDNEGOC,' +
        ' B.DTAINCLUSAO,'
      
        '         B.DESBEM, B.IDCONJUNTO, NVL(B.CODSUBCONTA,0) AS CODSUBC' +
        'ONTA,'
      
        '         B.PLACA, C.IDLOCALIZACAO, C.IDRESPONSAVEL, G.NOME AS DE' +
        'SCGRUPO'
      '  FROM   BEM B,'
      '         BEMXMOEDA BM,'
      '         BEMXDEP BD,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (B.DATAINICIODEP <= :PDATAMOV)'
      '    AND (B.CONTROLE = '#39'T'#39')'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO) '
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (B.IDBEM = BM.IDBEM)'
      '    AND (B.IDPESSOA = BM.IDPESSOA)'
      '    AND (BM.IDBEM = BD.IDBEM)'
      '    AND (BM.IDPESSOA = BD.IDPESSOA)'
      '    AND (BM.MOECODIGO = BD.MOECODIGO)'
      '  ORDER BY B.IDGRUPO, B.IDBEM, BM.MOECODIGO, BD.IDBEMXDEP) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39
      ''
      '---'
      '--fechamento acrescimo valor'
      ''
      '--sqlFechamentoAcrescimoValor'
      ')union('
      'SELECT distinct M.IDGRUPO  FROM ('
      '  SELECT /*+ RULE */'
      '         (SELECT DISTINCT FLGUSADEPRECIACAO'
      '          FROM TIPOSMOVIMENTOGRUPOS'
      '          WHERE IDGRUPO = B.IDGRUPO'
      '            AND FLGUSADEPRECIACAO = '#39'S'#39') AS FLGUSADEPRECIACAO,'
      '         B.IDGRUPO, A.IDBEM, A.IDPESSOA, A.IDACRESCIMO,'
      '         AM.MOECODIGO, AM.VALORG, AM.CMBEM, AM.DATAULTCM,'
      
        '         AD.IDACRESCIMOXDEP, AD.TAXADEP, AD.DEPLANC, AD.CMDEP, A' +
        'D.DATAULTDEP, AD.DATAULTCM AS DATAULTCMDEP, AD.FLGDEPREC,'
      '         A.DATAACRESCIMO, A.IDMOVIMENTACAO,'
      
        '         B.PLACA, B.IDMODULO, B.DESBEM, B.IDCONJUNTO, B.UNIDNEGO' +
        'C,'
      
        '         NVL(B.CODSUBCONTA,0) AS CODSUBCONTA, C.IDLOCALIZACAO, C' +
        '.IDRESPONSAVEL,'
      '         G.NOME AS DESCGRUPO'
      '  FROM   ACRESCIMOVALOR A,'
      '         ACRESCVALORXMOEDA AM,'
      '         ACRESCVALORXDEP AD,'
      '         BEM B,'
      '         PLANOGRUPO PG,'
      '         GRUPO G,'
      '         CONJUNTO C'
      '  WHERE (B.IDPESSOA = :PIDPESSOA)'
      '    AND (B.BAIXATOTAL <> '#39'S'#39')'
      
        '    AND ((G.FLGIMOVEL = :PFLGIMOVELINI) OR (G.FLGIMOVEL = :PFLGI' +
        'MOVELFIM))'
      '    AND (A.DATAACRESCIMO <= :PDATAMOV )'
      '    AND (B.CONTROLE   = '#39'T'#39')'
      '    AND (A.IDBEM = B.IDBEM)'
      '    AND (A.IDPESSOA = B.IDPESSOA)'
      '    AND (B.IDGRUPO = PG.IDGRUPO)'
      '    AND (B.IDPESSOA = PG.IDPESSOA)'
      '    AND (PG.IDGRUPO = G.IDGRUPO)'
      '    AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      '    AND (B.IDPESSOA = C.IDPESSOA)'
      '    AND (A.IDACRESCIMO = AM.IDACRESCIMO)'
      '    AND (AM.IDACRESCIMO = AD.IDACRESCIMO)'
      '    AND (AM.MOECODIGO = AD.MOECODIGO)'
      
        '  ORDER BY B.IDGRUPO, A.IDBEM, A.IDACRESCIMO, AM.MOECODIGO, AD.I' +
        'DACRESCIMOXDEP ) M'
      'WHERE M.FLGUSADEPRECIACAO = '#39'S'#39')')
    Left = 824
    Top = 112
  end
end
