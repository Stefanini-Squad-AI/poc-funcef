object DtmImpostoObj: TDtmImpostoObj
  OldCreateOrder = False
  Left = 178
  Top = 123
  Height = 480
  Width = 696
  object CdsAcumula: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 8
    Data = {
      FF0000009619E0BD010000001800000009000000000003000000FF0010434F44
      5449504F43555354414752454708000400000000000C44415441524554454E43
      414F080008000000000007564C5242415345080004000000000009564C525245
      5449444F0800040000000000084944464F52434C490800040000000000084944
      504553534F410800040000000000065245435041470100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020001
      000D444553434355535441475245470100490000000100055749445448020002
      003C0008414C4951554F544108000400000000000100044C4349440400010009
      080000}
  end
  object SQLAcumula: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' I.CODTIPOCUSTAGREG,'
      ' I.DATARETENCAO,'
      ' I.VLRBASE,'
      ' I.VLRRETIDO,'
      ' I.IDFORCLI,'
      ' I.IDPESSOA,'
      ' I.RECPAG,'
      ' TA.DESCCUSTAGREG,'
      ' I.ALIQUOTA'
      'FROM'
      ' IMPOSTORETIDO I, TIPOAGRE TA'
      'WHERE 1=2'
      ' ')
    ClientDataSet = CdsAcumula
    Left = 24
    Top = 56
  end
  object CdsImposto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 8
  end
  object SQLImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        ' T.CODTIPOCUSTAGREG, T.FLGACUMULA, T.VLRABATFIXO, T.FLGTIPOCALC,' +
        ' T.CODALTERADOR,'
      
        ' T.VLRMINIMO, T.DESCCUSTAGREG, T.VALPORDEPENDENTE, T.LANCAMENTOI' +
        'MPOSTO,'
      
        ' T.CODTRATFISCD, T.FLGCALCVALBRUTO, TA.ACRESDECRES, T.FLGLANCAIM' +
        'POSTO, QTOTALPORDESEMB.VALORIMPOSTO AS VALORIMPOSTO,'
      
        ' T.FLGALTERARETENCAO, T.FLGSEMPRECALCULA, ('#39'S'#39') FLGCALCULAIMPOST' +
        'O,'
      ' T.FLGUSAVALFORCLI'
      'FROM'
      ' TIPOAGRE T, FORCLIXAGREG F, TIPOALTERADOR TA,'
      ' (SELECT'
      '   SUM(((:VALORLANCADO * Q2.VALOR)/ Q3.VALOR)) AS VALORIMPOSTO'
      ' FROM'
      '   (SELECT'
      '      DOC.NUMFATURA,'
      '      LAN.VALOR'
      '   FROM'
      '      DOCUMENTO DOC,'
      '      LANCTODOCUM LAN'
      '   WHERE'
      '     (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      '  (SELECT'
      '    D.NUMFATURA,'
      '    RD.VALOR'
      '   FROM'
      '    RATEIODOCUM RD, DOCUMENTO D, TIPORECEBDESEMB TRD'
      '   WHERE'
      '    (D.NUMFATURA IS NOT NULL) AND'
      '    (TRD.FLGCALCULAIMPOSTO = '#39'S'#39') AND'
      '    (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '    (RD.CODTIPRECDES = TRD.CODTIPRECDES) AND'
      '    (RD.RECPAG       = TRD.RECPAG) AND'
      '    (RD.IDPESSOA     = TRD.IDPESSOA)) Q2,'
      '   (SELECT'
      '     D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '    FROM'
      '     LANCTODOCUM L, DOCUMENTO D'
      '    WHERE'
      '     ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '     (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.NUMFATURA IS NOT NULL)'
      '    GROUP BY D.NUMFATURA) Q3'
      ' WHERE'
      '   (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '   (Q3.NUMFATURA = Q2.NUMFATURA)) QTOTALPORDESEMB'
      'WHERE'
      ' (F.IDPESSOA = :IDPESSOA)  AND'
      ' (F.IDFORCLI = :IDFORCLI)  AND'
      ' (F.RECPAG = :RECPAG)       AND'
      ' (T.CODALTERADOR = TA.CODALTERADOR(+)) AND'
      ' (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG)'
      ''
      ' '
      ' '
      ''
      ' ')
    ClientDataSet = CdsImposto
    Left = 96
    Top = 56
  end
  object CdsFaixaImposto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 8
  end
  object SQLFaixaImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   VLRINICIALFAIXA, VLRFINALFAIXA, DATAINI, DATAFIM,'
      '   VLRABATVALOR, VLRABATCALC, PERCCUSTAGREG, VLRFIXO, PERCBASE'
      'FROM'
      '   FAIXATIPOAGREG'
      'WHERE'
      '       ( CODTIPOCUSTAGREG         = :PCODTIPOCUSTAGREG )'
      '   AND ( NVL(VLRINICIALFAIXA, 0) <= :PVLRINICIALFAIXA )'
      
        '   AND ( (NVL(VLRFINALFAIXA, 0)  >= :PVLRINICIALFAIXA) OR (NVL(V' +
        'LRFINALFAIXA, 0) = 0) )'
      '   AND (( :PDATA IS NULL)'
      '         OR ( (:PDATA >= DATAINI or dataini is null) AND'
      '              (:PDATA <= DATAFIM or datafim is null) )'
      '       )'
      ''
      ''
      '/*'
      'SELECT'
      '   VLRINICIALFAIXA, VLRFINALFAIXA, DATAINI, DATAFIM,'
      '   VLRABATVALOR, VLRABATCALC, PERCCUSTAGREG, VLRFIXO, PERCBASE'
      'FROM'
      '   FAIXATIPOAGREG'
      'WHERE'
      '       ( CODTIPOCUSTAGREG         =PCODTIPOCUSTAGREG )'
      '   AND ( NVL(VLRINICIALFAIXA, 0) <=PVLRINICIALFAIXA )'
      
        '   AND ( (NVL(VLRFINALFAIXA, 0)  >=PVLRINICIALFAIXA) OR (NVL(VLR' +
        'FINALFAIXA, 0) = 0) )'
      '   AND (    (PDATA              IS NULL)'
      '         OR (PDATA              BETWEEN DATAINI   AND DATAFIM)'
      
        '         OR (DATAINI             IS NULL           AND DATAFIM I' +
        'S NULL)'
      '       )'
      '*/')
    ClientDataSet = CdsFaixaImposto
    Left = 136
    Top = 56
  end
  object CdsPortForma: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 8
  end
  object SQLPortForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PF.IDFORCLI,'
      '  DC.CONTACCLIENTE AS CONTACONTABIL,'
      '  DC.CODCENTROCUSTO,'
      '  DC.CODSUBCONTA,'
      '  DC.UNIDNEGOC'
      'FROM'
      '  PORTADORFORMA PF, EMPRESACLIENTE DC'
      'WHERE'
      '  PF.CODPORTFORMA = :CODPORTFORMA AND'
      '  DC.IDPESSOA = :IDPESSOA AND'
      '  PF.IDFORCLI = DC.IDFORCLI'
      '')
    ClientDataSet = CdsPortForma
    Left = 192
    Top = 56
  end
  object SQLClasFisCliFor: TCMSqlParams
    ClientDataSet = CdsClasFisCliFor
    Left = 248
    Top = 56
  end
  object CdsClasFisCliFor: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 8
  end
  object SQLRateioImposto: TCMSqlParams
    ClientDataSet = CdsRateioImposto
    Left = 304
    Top = 56
  end
  object CdsRateioImposto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 8
  end
  object SQLRateioImposto2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' RD.VALOR AS VALOR,'
      ' TDR.DESCRICAO,'
      ' TDR.CODTIPRECDES'
      'FROM'
      ' RATEIODOCUM RD, TIPORECEBDESEMB TDR'
      'WHERE'
      ' (RD.CODDOCUMENTO = :CODDOCUMENTO)            AND'
      ' (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES)      AND'
      ' (TDR.RECPAG(+)       = RD.RECPAG)            AND'
      ' (TDR.IDPESSOA(+)     = RD.IDPESSOA)          '
      ''
      ' ')
    Left = 360
    Top = 56
  end
  object SQLRateioImposto3: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  Q2.DESCTDR, SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALOR,'
      '  Q2.CODTIPRECDES'
      'FROM'
      '  (SELECT'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR'
      '  FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN'
      '  WHERE'
      '    (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   RD.VALOR,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   TDR.CODTIPRECDES'
      '  FROM'
      '   RATEIODOCUM RD,'
      '   TIPORECEBDESEMB TDR, DOCUMENTO D'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL)                    AND'
      '--   (TDR.FLGCALCULAIMPOSTO = '#39'S'#39')                AND'
      '   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND'
      '   (TDR.CODTIPRECDES(+)   = RD.CODTIPRECDES)    AND'
      '   (TDR.RECPAG(+)         = RD.RECPAG)          AND'
      '   (TDR.IDPESSOA(+)       = RD.IDPESSOA)) Q2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'GROUP BY'
      '   Q2.DESCTDR,'
      '   Q2.CODTIPRECDES'
      '')
    Left = 360
    Top = 8
  end
  object SQLBaseMes: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(VLRBASE) AS VALORBASE, SUM(VLRRETIDO) AS VALORRETIDO'
      'FROM IMPOSTORETIDO'
      'WHERE'
      ' (CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG) AND'
      ' (IDFORCLI = :PIDFORCLI)                 AND'
      ' (IDPESSOA = :PIDPESSOA)                 AND'
      ' (RECPAG   = :PRECPAG)                   AND'
      ' (TO_CHAR(DATARETENCAO,'#39'MM/YYYY'#39') = :PDATARETENCAO)')
    ClientDataSet = CdsBaseMes
    Left = 416
    Top = 56
  end
  object CdsBaseMes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 8
  end
  object SQLDadosLancImp: TCMSqlParams
    ClientDataSet = CdsDadosLancImp
    Left = 24
    Top = 152
  end
  object CdsDadosLancImp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 104
  end
  object SQLDadosLancImpR: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  T.DESCCUSTAGREG,'
      '  T.CODTIPDOC,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.CODCENTRORESPON,'
      '  T.UNIDNEGOC,'
      '  T.IDFORCLI,'
      '  C.CODSUBCONTA AS CODSUBCONTACONTAB,'
      '  C.UNIDNEGOC AS UNIDNEGOCCONTAB,'
      '  C.CODCENTROCUSTO,'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  E.CONTACCLIENTE AS CONTACLIFOR,'
      '  E.CODCENTROCUSTO AS CCUSTOCLIFOR,'
      '  E.UNIDNEGOC AS UNIDNEGOCCLIFOR,'
      '  E.CODSUBCONTA AS SUBCONTACLIFOR,'
      '  P.RAZAOSOCIAL'
      'FROM'
      '  TIPOAGRE T,'
      '  TIPCUSTAGREGCONTA C,'
      '  EMPRESACLIENTE E,'
      '  PESSOA P'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '  (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND'
      '  (T.IDFORCLI = E.IDFORCLI(+)) AND'
      '  ((E.IDPESSOA = :IDPESSOA) OR (E.IDPESSOA IS NULL)) AND'
      '  (E.IDFORCLI = P.IDPESSOA(+))'
      ' '
      '')
    Left = 80
    Top = 152
  end
  object SQLDadosLancImpP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  T.DESCCUSTAGREG,'
      '  T.CODTIPDOC,'
      '  T.CODTIPRECDES,'
      '  T.RECPAG,'
      '  T.CODCENTRORESPON,'
      '  T.UNIDNEGOC,'
      '  T.IDFORCLI,'
      '  C.CODSUBCONTA AS CODSUBCONTACONTAB,'
      '  C.UNIDNEGOC AS UNIDNEGOCCONTAB,'
      '  C.CODCENTROCUSTO,'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  E.CONTACFORN AS CONTACLIFOR,'
      '  E.CODCENTROCUSTO AS CCUSTOCLIFOR,'
      '  E.UNIDNEGOC AS UNIDNEGOCCLIFOR,'
      '  E.CODSUBCONTA AS SUBCONTACLIFOR,'
      '  P.RAZAOSOCIAL'
      'FROM'
      '  TIPOAGRE T,'
      '  TIPCUSTAGREGCONTA C,'
      '  EMPRESAFORN E,'
      '  PESSOA P'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '  (T.CODTIPOCUSTAGREG = C.CODTIPOCUSTAGREG) AND'
      '  (T.IDFORCLI = E.IDFORCLI(+)) AND'
      '  (E.IDFORCLI = P.IDPESSOA(+))  AND'
      '  ((E.IDPESSOA = :IDPESSOA) OR (E.IDPESSOA IS NULL))'
      ''
      ' '
      ''
      ' ')
    Left = 80
    Top = 104
  end
  object SQLAtuImpostoRetido: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO IMPOSTORETIDO'
      ' (IDIMPOSTORETIDO,DATARETENCAO,CODTIPOCUSTAGREG,VLRBASE,'
      
        '  VLRRETIDO,IDFORCLI,IDPESSOA,CODDOCUMENTO,RECPAG,NUMLANCTO,NUML' +
        'ANCTOORIGEM,'
      '  CODDOCLANCADO,NUMLOTE,NUMLOTEMANUAL, ALIQUOTA)'
      'VALUES'
      ' (:PIDIMPOSTORETIDO,:PDATARETENCAO,:PCODTIPOCUSTAGREG,:PVLRBASE,'
      
        '  :PVLRRETIDO,:PIDFORCLI,:PIDPESSOA,:PCODDOCUMENTO,:PRECPAG,:PNU' +
        'MLANCTO,:PNUMLANCTOORIGEM,'
      '  :CODDOCLANCADO,:NUMLOTE,:NUMLOTEMANUAL, :ALIQUOTA)'
      ''
      ' '
      ' ')
    Left = 136
    Top = 104
  end
  object SQLImpostoPorDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' T.CODTIPOCUSTAGREG, T.FLGCALCVALBRUTO, I.NUMLANCTO'
      'FROM'
      ' TIPOAGRE T, IMPOSTORETIDO I'
      'WHERE'
      ' (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG) AND'
      ' (I.CODDOCUMENTO = :CODDOCUMENTO)')
    ClientDataSet = CdsImpostoPorDoc
    Left = 192
    Top = 152
  end
  object CdsImpostoPorDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 104
  end
  object CdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 152
  end
  object SQLAltNumLanc: TCMSqlParams
    SQL.Strings = (
      'UPDATE'
      '  IMPOSTORETIDO'
      'SET'
      '  NUMLANCTOORIGEM = :NEWNUMLANCTOORIGEM'
      'WHERE'
      '  IDIMPOSTORETIDO IN'
      '  (SELECT'
      '    I.IDIMPOSTORETIDO'
      '   FROM'
      '    IMPOSTORETIDO I, TIPOAGRE T'
      '   WHERE'
      '    (T.FLGLANCAIMPOSTO = '#39'B'#39')                  AND'
      '    (T.CODTIPOCUSTAGREG  = I.CODTIPOCUSTAGREG) AND'
      '    (I.NUMLANCTOORIGEM = :NUMLANCTOORIGEM))'
      '')
    Left = 248
    Top = 104
  end
  object SQLAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' T.CODTIPOCUSTAGREG, T.FLGCALCVALBRUTO, I.NUMLANCTO'
      'FROM'
      ' TIPOAGRE T, IMPOSTORETIDO I'
      'WHERE'
      ' (T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG) AND'
      ' (I.CODDOCUMENTO = :CODDOCUMENTO)')
    ClientDataSet = CdsAux
    Left = 288
    Top = 200
  end
  object SQLLancAcumula: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO IMPOSTORETIDO'
      
        '  (IDIMPOSTORETIDO,DATARETENCAO,CODTIPOCUSTAGREG,VLRBASE,VLRRETI' +
        'DO,IDFORCLI,IDPESSOA,CODDOCLANCADO,NUMLOTE,RECPAG, NUMLOTEMANUAL' +
        ', ALIQUOTA)'
      'VALUES'
      
        '  (:IDIMPOSTORETIDO,:DATARETENCAO,:CODTIPOCUSTAGREG,:VLRBASE,:VL' +
        'RRETIDO,:IDFORCLI,:IDPESSOA,:CODDOCLANCADO,:NUMLOTE,:RECPAG,:NUM' +
        'LOTEMANUAL, :ALIQUOTA)'
      ' ')
    Left = 360
    Top = 104
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 152
  end
  object Sql: TCMSqlParams
    ClientDataSet = Cds
    Left = 336
    Top = 200
  end
  object SQLContabSCV: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODSUBCONTA AS CODSUBCONTACONTAB,'
      '  UNIDNEGOC AS UNIDNEGOCCONTAB,'
      '  CODCENTROCUSTO,'
      '  PLANO,'
      '  PLACONTA,'
      '  DEBCRE'
      'FROM'
      '  TIPCUSTAGREGCONTA'
      'WHERE'
      '  (CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG)'
      ' '
      ' ')
    ClientDataSet = CdsContabSCV
    Left = 24
    Top = 248
  end
  object CdsContabSCV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 200
  end
  object SQLContabOrigemSCV: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LC.PLACONTA,'
      '  LC.CODSUBCONTA,'
      '  LC.LACDEBCRE,'
      '  ((:VALOR * LC.LACVALOR)/L.VALOR) AS VALORRATEIOIMPOSTO,'
      '  LC.LACNUMLAN,'
      '  LC.UNIDNEGOC,'
      '  LC.PLANO,'
      '  LC.CODCENTROCUSTO,'
      '  LC.IDPLANOPREV,'
      '  LC.IDPATRO,'
      '  LC.IDSEGREGACRITER,'
      '  LC.DATASEGREGACRITER,'
      '  D.RECPAG,'
      '  D.IDPESSOA,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  P.RAZAOSOCIAL'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  LANCAMENTO LC,'
      '  PESSOA P'
      'WHERE'
      ' (LC.PLNCODIGO = L.PLNCODIGO) AND'
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      ' (D.OPERACAO = L.OPERACAO) AND'
      ' (L.ESTORNO IS NULL) AND'
      ' (D.IDFORCLI = P.IDPESSOA) AND'
      ' (D.CODDOCUMENTO = :CODDOCUMENTO)'
      'ORDER BY'
      ' LACNUMLAN'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsContabOrigemSCV
    Left = 83
    Top = 247
  end
  object CdsContabOrigemSCV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 198
  end
end
