object DtmAlmoxarifado: TDtmAlmoxarifado
  OldCreateOrder = True
  Left = 40
  Top = 86
  Height = 559
  Width = 989
  object spListReqMat: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      NUMREQUISICAO,'
      '      IDUSUARIOINCLUSAO,                      '
      '      IDPESSOA,'
      '      IDEMPRESA,'
      '      CODCENTROCUSTO,'
      '      CODALMOXAORIGEM,'
      '      CUSTOTRANSF,'
      '      DATAEMISSAO,'
      '      REQATENDIDA,'
      '      DATANECESSIDADE,                         '
      '      IMPRESSO,'
      '      CODALMOXADESTINO,'
      '      IDPROCESSO,'
      '      UNIDNEGOC,'
      '      OBS         '
      'FROM'
      '     REQMAT'
      'WHERE ( NUMREQUISICAO = :NUMREQUISICAO )')
    Left = 32
    Top = 48
  end
  object spGetItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      I.NUMREQUISICAO,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.VALORUN,'
      '      I.QTDEPEDIDA,'
      '      I.QTDEPENDENTE,'
      '      (I.QTDEPEDIDA - I.QTDEPENDENTE) AS QTDEATENDIDA,'
      
        '      NVL(DECODE(SUB.FLGSTATUS, '#39'D'#39', SUB.QTDEENTREGA), 0) AS QTD' +
        'EDEVOLVIDA,'
      
        '      ( P.DESCPROD  || '#39' '#39' || A.CODCOR || '#39' '#39' ||  A.CODTAMANHO) ' +
        ' DESCRICAO,'
      '      P.CODGRUPOPROD,'
      '      (0) AS VALOR,'
      '      I.OBS,'
      
        '      DECODE(I.QTDEPEDIDA, I.QTDEPENDENTE,'#39'NÃO ATENDIDA'#39',DECODE(' +
        'SUB.CODARTIGO,NULL,'#39'ESTORNADO'#39',DECODE(I.QTDEPENDENTE, 0, '#39'ATEND.' +
        ' TOTAL'#39','#39' ATEND. PARCIAL'#39'))) AS STATUS'
      'FROM'
      '     ITEMPEDI I,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '    ('
      '     SELECT CODARTIGO, FLGSTATUS, QTDEENTREGA  FROM ITEMENTR'
      '     WHERE (NUMREQUISICAO = :NUMREQUISICAO)'
      '     )SUB'
      ''
      'WHERE'
      '       (I.NUMREQUISICAO = :NUMREQUISICAO )'
      '   AND ( A.CODARTIGO = I.CODARTIGO)'
      '   AND ( A.CODPRODUTO = P.CODPRODUTO)'
      '   AND ( A.CODARTIGO = SUB.CODARTIGO(+))'
      'ORDER BY  DESCRICAO'
      '')
    Left = 32
    Top = 104
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 8
  end
  object spReqManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    CODALMOXARIFADO,'
      '    DATAMOV AS DATAREQ,'
      '    IDPESSOA,'
      '    NUMDOCUMENTO AS NUMREQUISICAO,'
      '    UNIDNEGOC,'
      '    CODALMOXTRANSF,'
      '    CODCENTROCUSTO AS CENTROCUSTODESTINO'
      'FROM MOVIMENT'
      'WHERE (1=2)'
      '')
    Left = 32
    Top = 152
  end
  object spItemReqManual: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      CODARTIGO,'
      '      ('#39'    '#39') AS CODMEDIDA,'
      '      QTDEMOV AS QUANTIDADE,'
      '      VALORMOV AS VALOR,'
      
        '      ('#39'                                                        ' +
        '                 '#39') AS DESCRICAO,'
      '      ('#39'I'#39') AS FLGDEST,'
      '      (0)   AS PLANO,'
      '      ('#39'                  '#39') AS PLACONTA,'
      '      (0) AS CODSUBCONTA'
      'FROM MOVIMENT'
      'WHERE (1=2)'
      ' '
      ' ')
    Left = 32
    Top = 200
  end
  object spFichaTec: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     F.CODARTIGOSEC,'
      '     F.QTDE,'
      '     F.CODMEDIDA,'
      '     C.CUSTOMEDIO'
      'FROM FICHTECN F,'
      '     CUSTOMED C'
      'WHERE (F.CODARTIGOPRINC = :CODARTIGO)'
      '  AND (C.CODCUSTEIO = :CODCUSTEIO)'
      '  AND (F.CODARTIGOSEC = C.CODARTIGO)'
      ''
      ''
      '')
    Left = 32
    Top = 248
  end
  object spExisteRequisicao: TCMSqlParams
    SQL.Strings = (
      'SELECT COUNT(IDMOV) AS NUMREQ'
      'FROM MOVIMENT'
      'WHERE (CODARTIGO = :CODARTIGO)'
      '  AND (NUMDOCUMENTO = :NUMREQUISICAO)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ' ')
    Left = 120
    Top = 8
  end
  object spArqInvent: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '       DECODE(CodBarra,NULL,'#39'0000000000000'#39', LPAD(RTRIM(SUBSTR(C' +
        'odBarra,1,13)),13,'#39'0'#39')) ||'
      '       '#39' '#39' ||'
      '       '#39'000000000'#39'||'
      '       '#39' '#39'||'
      '        RPAD(P.DESCPROD,50) ||'
      '       '#39' '#39'||'
      '       '#39'00000000'#39' AS REGISTRO   '
      ''
      'FROM ARTIGO  A,'
      '     PRODUTO P'
      'WHERE'
      '     (A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY CODBARRA')
    Left = 120
    Top = 56
  end
  object spGeraItensiInvent: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO QTDECONT(IDINVENTARIO,CODARTIGO,CODMEDIDA)'
      '('
      ' SELECT I.IDINVENTARIO,S.CODARTIGO,P.CODMEDCUSTO'
      ' FROM INVENTAR I,'
      '      SALDO S,'
      '      PRODUTO P,'
      '      ARTIGO A'
      ' WHERE (I.IDINVENTARIO = :IDINVENTARIO )'
      '   AND (P.CODGRUPOPROD LIKE :CODGRUPOPROD )'
      '   AND (P.CODPRODUTO = A.CODPRODUTO)'
      '   AND (A.CODARTIGO = S.CODARTIGO)'
      '   AND (I.CODALMOXARIFADO = S.CODALMOXARIFADO)'
      '   AND (I.IDPESSOA = S.IDPESSOA)'
      ' )'
      ' '
      ' ')
    Left = 120
    Top = 104
  end
  object spExisteInvent: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODGRUPOPROD,'
      '     PARCIALTOTAL'
      'FROM'
      '    INVENTAR'
      'WHERE'
      '       (CODALMOXARIFADO = :CODALMOXARIFADO )'
      '   AND (CONTAGEMENCERRADA <> '#39'T'#39')'
      '   AND (IDPESSOA = :IDPESSOA)')
    Left = 120
    Top = 152
  end
  object spListContagem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    (RTRIM(P.DESCPROD) || '#39' '#39' || RTRIM(A.CODTAMANHO) || '#39' '#39' || R' +
        'TRIM(A.CODCOR) ) AS DESCRICAO,'
      '     RTRIM(A.CODARTIGO) AS CODARTIGO,'
      '     S.SALDOQTDE,'
      '     CM.CUSTOMEDIO,'
      '     QC.QTDECONTADA,'
      '     QC.CODMEDIDA,'
      '     QC.IDINVENTARIO,'
      '     P.CODMEDCUSTO,'
      '     P.CODPRODUTO,'
      '     P.CODGRUPOPROD'
      'FROM'
      '     QTDECONT QC,'
      '     SALDO S,'
      '     CUSTOMED CM,'
      '     ARTIGO A,'
      '     PRODUTO P'
      'WHERE'
      '       (S.CODALMOXARIFADO(+) = :CODALMOXARIFADO )'
      '   AND (CM.CODCUSTEIO(+) =     :CODCUSTEIO )'
      '   AND (QC.IDINVENTARIO = :IDINVENTARIO)'
      '   AND (P.ITEMESTOCAVEL = '#39'S'#39')'
      '   AND (P.CODPRODUTO = A.CODPRODUTO)'
      '   AND (A.CODARTIGO = S.CODARTIGO(+))'
      '   AND (A.CODARTIGO = CM.CODARTIGO(+))'
      '   AND (A.CODARTIGO = QC.CODARTIGO)')
    Left = 120
    Top = 200
  end
  object spListDiferencas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR) AS DE' +
        'SCRICAO,'
      '    CM.CUSTOMEDIO,'
      '    RC.SALDOINICIAL,'
      '    RC.QTDECONTADA,'
      '    RC.DIFERENCAATUAL'
      'FROM'
      '    RESCONT RC,'
      '    SALDO S,'
      '    CUSTOMED CM,'
      '    ARTIGO A,'
      '    PRODUTO P'
      'WHERE'
      '     (S.CODALMOXARIFADO(+) = :CODALMOXARIFADO)'
      ' AND (CM.CODCUSTEIO(+) = :CODCUSTEIO)'
      ' AND (RC.IDINVENTARIO =  :IDINVENTARIO )'
      ' AND (S.SALDOQTDE <> RC.QTDECONTADA)'
      ' AND (P.CODPRODUTO = A.CODPRODUTO)'
      ' AND (A.CODARTIGO = S.CODARTIGO(+))'
      ' AND (A.CODARTIGO = CM.CODARTIGO(+))'
      ' AND (A.CODARTIGO = RC.CODARTIGO)')
    Left = 120
    Top = 248
  end
  object spExisteContagem: TCMSqlParams
    SQL.Strings = (
      'SELECT CODARTIGO,CODMEDIDA, QTDECONTADA'
      'FROM QTDECONT'
      'WHERE  (IDINVENTARIO = :IDINVENTARIO )'
      '   AND (QTDECONTADA IS NOT NULL)')
    Left = 224
    Top = 8
  end
  object spGeraAnaliseInvent: TCMSqlParams
    SQL.Strings = (
      
        'INSERT INTO RESCONT(IDINVENTARIO,CODARTIGO,SALDOINICIAL,QTDECONT' +
        'ADA,DIFERENCAATUAL)'
      '('
      ' SELECT I.IDINVENTARIO,'
      '        S.CODARTIGO,'
      '        NVL(SALDOQTDE,0) AS SALDOINICIAL,'
      '        QC.QTDECONTADA,'
      '        (QC.QTDECONTADA - NVL(SALDOQTDE,0) ) AS DIFERENCA'
      ' FROM'
      '      QTDECONT QC,'
      '      SALDO S,'
      '      INVENTAR I'
      ' WHERE (I.IDINVENTARIO = :IDINVENTARIO )'
      '   AND (QC.QTDECONTADA IS NOT NULL)'
      '   AND (QC.IDINVENTARIO = I.IDINVENTARIO)'
      '   AND (QC.CODARTIGO(+) = S.CODARTIGO)'
      '   AND (I.CODALMOXARIFADO = S.CODALMOXARIFADO(+))'
      '   AND (I.IDPESSOA = S.IDPESSOA(+))'
      ' )'
      '')
    Left = 224
    Top = 56
  end
  object spListResultAnalise: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    I.IDINVENTARIO,'
      '    I.DATAINVENTARIO,'
      '    I.CODALMOXARIFADO,'
      '    AL.CODCUSTEIO,'
      '    AL.CODCENTROCUSTO,'
      '    AL.IDEMPRESA,'
      '    I.IDPESSOA,'
      '    R.CODARTIGO,'
      '    R.DIFERENCAATUAL,'
      '    P.CODMEDCUSTO'
      'FROM'
      '    RESCONT R,'
      '    ARTIGO A,'
      '    PRODUTO P,'
      '    ALMOX AL,'
      '    INVENTAR I'
      'WHERE'
      '       (I.IDINVENTARIO = :IDINVENTARIO)'
      '   AND (I.IDINVENTARIO = R.IDINVENTARIO)'
      '   AND (I.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      '   AND (R.DIFERENCAATUAL IS NOT NULL)'
      '   AND (R.DIFERENCAATUAL != 0)'
      '   AND (R.CODARTIGO = A.CODARTIGO)'
      '   AND (A.CODPRODUTO = P.CODPRODUTO)'
      ''
      ' ')
    Left = 224
    Top = 104
  end
  object spUpdResCont: TCMSqlParams
    SQL.Strings = (
      'UPDATE RESCONT SET IDMOV = :IDMOV'
      'WHERE (IDINVENTARIO = :IDINVENTARIO)'
      '  AND (CODARTIGO = :CODARTIGO)'
      ' ')
    Left = 224
    Top = 152
  end
  object spFechaInvetario: TCMSqlParams
    SQL.Strings = (
      'UPDATE INVENTAR SET'
      '   DATATRAVA = NULL,'
      '   CONTAGEMENCERRADA = '#39'T'#39
      'WHERE (IDINVENTARIO = :IDINVENTARIO) ')
    Left = 224
    Top = 200
  end
  object spAtualizaDataUltInvent: TCMSqlParams
    SQL.Strings = (
      'UPDATE UNCUSTEI SET'
      '   DATAULTINVENTARIO = :DATAULTINVENTARIO'
      'WHERE'
      '      (CODCUSTEIO = :CODCUSTEIO)'
      '  AND (IDPESSOA = :IDPESSOA)')
    Left = 224
    Top = 248
  end
  object spInsertContagem: TCMSqlParams
    SQL.Strings = (
      
        'INSERT INTO QTDECONT (IDINVENTARIO,CODARTIGO,CODMEDIDA,QTDECONTA' +
        'DA)'
      'VALUES (:IDINVENTARIO,:CODARTIGO,:CODMEDIDA,:QTDECONTADA)')
    Left = 320
    Top = 8
  end
  object spListAltCustoMed: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    C.CODCUSTEIO,'
      '    C.CODARTIGO,'
      '    C.CUSTOMEDIO,'
      '    C.SALDOQTDEUC,'
      '    P.CODMEDCUSTO,'
      '    (C.CUSTOMEDIO * C.SALDOQTDEUC ) VALOR,'
      
        '    (RTRIM(P.DESCPROD) || '#39' '#39' || RTRIM(A.CODCOR) || '#39' '#39' || RTRIM' +
        '(A.CODTAMANHO) ) AS DESCRICAO,'
      '    UC.DESCCUSTEIO'
      'FROM'
      '    CUSTOMED C,'
      '    ARTIGO A,'
      '    PRODUTO P,'
      '    UNCUSTEI UC'
      'WHERE'
      '      (C.CODCUSTEIO = :CODCUSTEIO )'
      '  AND (C.CODARTIGO  = :CODARTIGO)'
      '  AND (C.CODARTIGO  = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (C.CODCUSTEIO = UC.CODCUSTEIO )'
      '')
    Left = 320
    Top = 56
  end
  object spConverteValor: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     (SALDOQTDEUC * CUSTOMEDIO ) AS VALOR'
      'FROM'
      '    CUSTOMED'
      'WHERE'
      '      (CODCUSTEIO = :CODCUSTEIO)'
      '  AND (CODARTIGO  = :CODARTIGO)')
    Left = 320
    Top = 104
  end
  object spListTipoPerda: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOPERDA , DESCTIPOPERDA '
      'FROM TIPOPERDA'
      'ORDER BY 2')
    Left = 320
    Top = 152
  end
  object spListDifInventArtigo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     I.CODALMOXARIFADO,'
      '     A.DESCALMOX,'
      '     P.DESCPROD,'
      '     SUM(R.DIFERENCAATUAL) AS DIF,'
      
        '     DECODE(SUM(NVL(R.DIFERENCAATUAL,0)), 0, '#39#39', I.IDINVENTARIO)' +
        ' AS INVENTARIO'
      'FROM'
      '    RESCONT R,'
      '    INVENTAR I,'
      '    ALMOX A,'
      '    PRODUTO P'
      'WHERE'
      '      (I.DATAINVENTARIO >= :DATAINI)'
      '  AND (I.DATAINVENTARIO <= :DATAFIM)'
      '  AND (I.CODALMOXARIFADO IN (:LISTALMOX) )'
      '  AND (I.CODALMOXARIFADO = A.CODALMOXARIFADO)'
      '  AND (I.IDINVENTARIO = R.IDINVENTARIO)'
      '  AND (R.CODARTIGO = P.CODPRODUTO)'
      '  AND (R.DIFERENCAATUAL IS NOT NULL)'
      '  AND (R.DIFERENCAATUAL <> 0 )'
      '  AND ((R.CODARTIGO = :CODARTIGO) OR (:CODARTIGO IS NULL))'
      
        'GROUP BY  I.CODALMOXARIFADO,A.DESCALMOX, P.DESCPROD, R.DIFERENCA' +
        'ATUAL, I.IDINVENTARIO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = spListDifInventArtigoFormartParam
    Left = 320
    Top = 200
  end
  object spGetAtendItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IE.QTDEENTREGA,'
      '     IE.CODMEDIDA,'
      '     IE.DATARECEB,'
      '     IE.VALORUN,'
      '     IE.DATAENTREGA,'
      '     PA.NOME AS ATENDENTE,'
      '     PC.NOME AS CONFDEV,'
      
        '     DECODE(IE.FLGSTATUS,'#39'F'#39','#39'NÃO CONFIRMADO'#39',DECODE(IE.FLGSTATU' +
        'S,'#39'T'#39','#39'CONFIRMADO'#39','#39'DEVOLVIDO'#39' )) AS STATUS'
      'FROM'
      '     ITEMENTR IE,'
      '     PESSOA PA,'
      '     PESSOA PC'
      'WHERE'
      '         (NUMREQUISICAO  = :NUMREQUISICAO)'
      '     AND (CODARTIGO = :CODARTIGO)'
      '     AND (IE.IDATENDENTE = PA.IDPESSOA)'
      '     AND (IE.IDUSUARIOCONFDEV = PC.IDPESSOA(+))'
      'ORDER BY'
      '          IE.DATAENTREGA'
      ' ')
    Left = 320
    Top = 248
  end
  object spListProdAtuRepresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '        DISTINCT '
      '         A.CODARTIGO,'
      '         P.DESCPROD'
      'FROM'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     SALDO S,'
      '    CUSTOMED C'
      'WHERE'
      '          (A.CODPRODUTO = P.CODPRODUTO)'
      ' AND (A.CODPRODUTO = S.CODARTIGO)'
      ' AND (A.CODPRODUTO = C.CODARTIGO)'
      'ORDER BY   P.DESCPROD'
      '')
    Left = 424
    Top = 8
  end
  object spReqJaEntregue: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMREQUISICAO FROM ITEMPEDI'
      'WHERE (NUMREQUISICAO = :NUMREQUISICAO)'
      '  AND (QTDEPENDENTE <> 0 )')
    Left = 424
    Top = 56
  end
  object spListOutrasReq: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IP.CODARTIGO,'
      '     IP.QTDEPEDIDA,'
      '     IP.NUMREQUISICAO,'
      '     IP.CODMEDIDA,'
      '     IP.QTDEPENDENTE'
      'FROM'
      '     ITEMPEDI IP,'
      '     REQMAT R'
      'WHERE'
      '       (IP.CODARTIGO  = :CODARTIGO )'
      '   AND (R.CODALMOXAORIGEM = :CODALMOXAORIGEM)'
      '   AND (IP.NUMREQUISICAO <> :NUMREQUISICAO)'
      '   AND (R.IDPESSOA = :IDPESSOA)'
      '   AND (IP.QTDEPENDENTE <> 0 )'
      '   AND (IP.NUMREQUISICAO = R.NUMREQUISICAO)'
      ' '
      ' ')
    Left = 424
    Top = 104
  end
  object spListItemAtend: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      A.CODARTIGO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR) AS ' +
        'DESCRICAO,'
      '      IP.NUMREQUISICAO,'
      '      P.CODMEDCUSTO,'
      '      IP.QTDEPEDIDA,'
      '      IP.QTDEPENDENTE,'
      '      IP.VALORUN,'
      '      IP.CODMEDIDA,'
      '      IP.OBS,'
      '      R.IDUSUARIOINCLUSAO,'
      '      R.CODCENTROCUSTO,'
      '      R.CUSTOTRANSF,'
      '      R.CODALMOXADESTINO,'
      '      R.DATAEMISSAO AS DATAREQ,'
      '      R.CODALMOXAORIGEM,'
      '      R.UNIDNEGOC,'
      '      CC.NOME'
      'FROM'
      '      ARTIGO A,'
      '      PRODUTO P,'
      '      ITEMPEDI IP,'
      '      REQMAT R,'
      '      RADINSTPROCESSO RP,'
      '      CENTCUST CC'
      ' WHERE'
      '        (IP.QTDEPENDENTE > 0)'
      '    AND (R.CODALMOXAORIGEM = :CODALMOXAORIGEM)'
      '    AND (R.IDPESSOA = :IDPESSOA)'
      '    AND (IP.NUMREQUISICAO = :NUMREQUISICAO)'
      '    AND (RTRIM(R.CODCENTROCUSTO) = :CODCENTROCUSTO)'
      '    AND (R.DATAEMISSAO = :DATAEMISSAO)'
      '    AND (R.DATANECESSIDADE = :DATANECESSIDADE )'
      '    AND (A.CODPRODUTO = P.CODPRODUTO)'
      '    AND (A.CODARTIGO  = IP.CODARTIGO)'
      '    AND (R.IDPROCESSO = RP.IDPROCESSO(+))'
      
        '    AND ((R.IDPROCESSO IS NULL) OR ((RP.FLGOK = '#39'S'#39') AND (R.IDPR' +
        'OCESSO IS NOT NULL)))'
      '    AND (IP.NUMREQUISICAO = R.NUMREQUISICAO)'
      '    AND (R.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '    AND (R.IDEMPRESA = CC.IDEMPRESA)'
      ' ORDER BY DESCRICAO'
      ''
      ' '
      ' '
      ' ')
    Left = 424
    Top = 152
  end
  object spConfDevolAtend: TCMSqlParams
    SQL.Strings = (
      'UPDATE ITEMENTR SET'
      '   DATARECEB = :DATA'
      '  ,FLGSTATUS =  :STATUS '
      '  ,IDUSUARIOCONFDEV = :IDUSUARIO'
      'WHERE (IDITEMENTREGA = :IDITEMENTREGA)')
    Left = 424
    Top = 200
  end
  object spListItemConfAtend: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     A.CODARTIGO,'
      
        '     (P.DESCPROD || '#39' '#39' || T.CODTAMANHO || '#39' '#39' || C.CODCOR) AS D' +
        'ESCRICAO,'
      '     IE.NUMREQUISICAO,'
      '     IE.IDITEMENTREGA,'
      '     IE.QTDEENTREGA,'
      '     I.QTDEPENDENTE,'
      '     IE.VALORUN,'
      '     IE.CODMEDIDA,'
      '     R.CODCENTROCUSTO,'
      '     R.CUSTOTRANSF,'
      '     R.CODALMOXADESTINO,'
      '     R.CODALMOXAORIGEM,'
      '     R.UNIDNEGOC'
      'FROM'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     COR C,'
      '     TAMANHO T,'
      '     REQMAT R,'
      '     ITEMENTR IE,'
      '     ITEMPEDI I'
      'WHERE'
      '       (R.CODALMOXADESTINO = :CODALMOXADESTINO )'
      '   AND (R.IDPESSOA = :IDPESSOA)'
      '   AND (IE.DATARECEB IS NULL AND IE.FLGSTATUS = '#39'F'#39')'
      '   AND (IE.NUMREQUISICAO = :NUMREQUISICAO )'
      '   AND (RTRIM(R.CODCENTROCUSTO) = :CODCENTROCUSTO)'
      '   AND (R.DATAEMISSAO = :DATAEMISSAO)'
      '   AND (R.DATANECESSIDADE = :DATANECESSIDADE)'
      '   AND (A.CODPRODUTO = P.CODPRODUTO)'
      '   AND (A.CODTAMANHO = T.CODTAMANHO(+))'
      '   AND (A.CODCOR     = C.CODCOR(+))'
      '   AND (A.CODARTIGO  = IE.CODARTIGO)'
      '   AND (IE.NUMREQUISICAO = R.NUMREQUISICAO)'
      '   AND (A.CODARTIGO  = I.CODARTIGO)'
      '   AND (I.NUMREQUISICAO = R.NUMREQUISICAO)'
      'ORDER BY DESCRICAO')
    Left = 424
    Top = 248
  end
  object spAtuIntegraContab: TCMSqlParams
    SQL.Strings = (
      'UPDATE MOVIMENT SET PLNCODIGO = :PLNCODIGO'
      'WHERE'
      '     (PLNCODIGO IS NULL)'
      ' AND (CODTIPOMOV <> '#39'A'#39')'
      ' AND (CODTIPOMOV <> '#39'K'#39')'
      ' AND (CODTIPOMOV <> '#39'Z'#39')'
      ' AND (DATAMOV = :DATAREF)'
      ' AND (IDPESSOA = :IDPESSOA)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 528
    Top = 56
  end
  object spAtuDataUltIntegra: TCMSqlParams
    SQL.Strings = (
      'UPDATE PARALMOX SET DATAULTINTEGRA = :DATAULTINTEGRA'
      'WHERE (IDPESSOA = :IDPESSOA)')
    Left = 528
    Top = 104
  end
  object spListIntegraContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     M.IDMOV,'
      '     M.CODALMOXTRANSF,'
      '     M.CODALMOXARIFADO,'
      '     A.CODCUSTEIO,'
      '     A.DESCALMOX AS ALMOXORIGEM,'
      '     T.CODCUSTEIO AS CODCUSTRANSF,'
      '     T.CONTABIL,'
      '     T.CODCENTROCUSTO AS CODCENTROCUSTODESTINO,'
      '     T.DESCALMOX AS ALMOXDESTINO,'
      '     M.CODARTIGO,'
      '     M.DATAMOV,'
      '     M.VALORMOV,'
      '     M.CODCENTROCUSTO,'
      '     M.UNIDNEGOC,'
      '     M.CODTIPOMOV,'
      '     M.PLANO,'
      '     M.PLACONTA,'
      '     M.CODSUBCONTA,'
      '     P.CODGRUPOPROD,'
      '     CC.NOME AS NOMECENTROCUSTO'
      'FROM'
      '     MOVIMENT M,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     ALMOX A,'
      '     ALMOX T,'
      '     CENTCUST CC'
      'WHERE'
      '     (M.PLNCODIGO IS NULL)'
      ' AND (M.CODTIPOMOV <> '#39'A'#39')'
      ' AND (M.CODTIPOMOV <> '#39'K'#39')'
      ' AND (M.CODTIPOMOV <> '#39'Z'#39')'
      ' AND (M.DATAMOV BETWEEN :DATAINI AND :DATAFIM )'
      ' AND (M.IDPESSOA = :IDPESSOA)'
      ' AND (A.CONTABIL = '#39'T'#39')'
      ' AND (M.CODALMOXARIFADO = A.CODALMOXARIFADO)'
      ' AND (M.CODALMOXTRANSF = T.CODALMOXARIFADO(+))'
      ' AND (M.CODARTIGO = A.CODARTIGO)'
      ' AND (A.CODPRODUTO = P.CODPRODUTO)'
      ' AND (M.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      ' AND (M.IDPESSOA = CC.IDEMPRESA(+))'
      'ORDER BY M.DATAMOV')
    Left = 528
    Top = 8
  end
  object spConverte: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    UNVELHA.FATOR/UNNOVA.FATOR AS FATOR'
      'FROM'
      '    PRODUTO P,'
      '    CONVER UNVELHA,'
      '    CONVER UNNOVA'
      'WHERE'
      '     (RTRIM(P.CODPRODUTO) =:CODPRODUTO )'
      ' AND (P.CODPRODUTO = UNVELHA.CODPRODUTO)'
      ' AND (P.CODPRODUTO = UNNOVA.CODPRODUTO)'
      ' AND (RTRIM(UNVELHA.CODMEDIDA) = :CODUNVELHA )'
      ' AND (RTRIM(UNNOVA.CODMEDIDA)  = :CODUNNOVA )'
      ' ')
    Left = 528
    Top = 152
  end
  object spAtuMovUn: TCMSqlParams
    SQL.Strings = (
      'UPDATE MOVIMENT SET'
      '     QTDEMOV       = :QTDEMOV'
      '    ,SALDOQTDEMOV  = :SALDOQTDEMOV'
      '    ,CUSTOMEDIOMOV = :CUSTOMEDIOMOV'
      'WHERE (IDMOV = :IDMOV)'
      ' ')
    Left = 528
    Top = 200
  end
  object spAtuSaldoUn: TCMSqlParams
    SQL.Strings = (
      'UPDATE SALDO SET SALDOQTDE = :SALDOQTDE'
      'WHERE (RTRIM(CODARTIGO) = :CODARTIGO)'
      '  AND (CODALMOXARIFADO = :CODALMOXARIFADO)')
    Left = 528
    Top = 248
  end
  object spCustoMedUn: TCMSqlParams
    SQL.Strings = (
      'UPDATE CUSTOMED SET'
      '     SALDOQTDEUC = :SALDOQTDEUC'
      '    ,CUSTOMEDIO  = :CUSTOMEDIO'
      'WHERE  (RTRIM(CODARTIGO) = :CODARTIGO)'
      '   AND (CODCUSTEIO = :CODCUSTEIO)')
    Left = 624
    Top = 8
  end
  object spListMovPlanilha: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT PLNCODIGO'
      'FROM MOVIMENT'
      'WHERE (PLNCODIGO IS NOT NULL)'
      '  AND (DATAMOV >= :DATA )'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDMOVENTRADA NOT IN (SELECT I.IDMOV'
      
        '                             FROM NFRECEBDEVOL N, ITENSRECEBDEVO' +
        'L I'
      '                             WHERE  (N.IDPESSOA = :IDPESSOA)'
      '                                AND (I.FLGDESTINO = '#39'C'#39')'
      
        '                                AND (N.IDNFRECEBDEVOL = I.IDNFRE' +
        'CEBDEVOL))) OR (IDMOVENTRADA IS NULL))'
      ''
      ' '
      ''
      ' ')
    Left = 624
    Top = 56
  end
  object spListImpSlado: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '      A.CODARTIGO,'
      '      A.VALULTCOMPRA,'
      '      P.DESCPROD,'
      '      M.SALDOQTDEMOV,'
      '      M.CUSTOMEDIOMOV,'
      '      P.CODMEDCUSTO'
      ' FROM'
      '    ARTIGO  A,'
      '    PRODUTO P,'
      '    MOVIMENT M'
      ' WHERE'
      '     ( P.CODGRUPOPROD = :CODGRUPOPROD)'
      ' AND ( A.FLGATIVO = '#39'S'#39' )'
      ' AND ( P.CODPRODUTO = A.CODPRODUTO )'
      ' AND ( M.CODTIPOMOV(+) = '#39'Z'#39')'
      ' AND ( M.CODALMOXARIFADO(+) = :CODALMOXARIFADO)'
      ' AND ( A.CODARTIGO = M.CODARTIGO(+) )'
      ''
      ' ORDER BY P.DESCPROD')
    Left = 624
    Top = 104
  end
  object spListItemRecMerc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      /* Bruno Bastos - 25/11/2004 - Pend. 18113 - Início */'
      '      I.IDPLANOPREV,'
      '      I.IDPATRO,'
      '      I.IDPROGRAMA,'
      '      /* Bruno Bastos - 25/11/2004 - Pend. 18113 - Fim */'
      ''
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDITEMOC,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,'
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      I.IDPRODVARI,'
      '      I.IDRESERVAORCAMEN,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      P.CODGRUPOPROD,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      (0) AS QTDETOTAL,'
      '      I.CODMEDIDA AS CODMEDORI,'
      '      '#39'T'#39' AS FLGPARCTOT,'
      '      (0) AS CODCUSTEIO,'
      '      (0) AS CODCUSTEIOLOGIN,'
      '      (0) AS CODALMOXARIFADOLOGIN,'
      '      ('#39'          '#39') AS CODCENTROCUSTOLOGIN,'
      '      NF.DATAENTDEVOL,'
      '      RO.NUMRESERVA,'
      '      RO.VLRRESERVA,'
      '      (0) AS IDSEGREGACRITER,'
      '      (0) AS NUMSOLCOMPRA'
      '      /* amf 08.02.2006 - Quantidade Pendente */'
      '      , TI.QTDEPENDENTE'
      '      /* amf 08.02.2006 - Quantidade Pendente */'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      NFRECEBDEVOL NF,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV,'
      '      RESERVAORCAMEN RO'
      '      /* amf 08.02.2006 - Quantidade Pendente */'
      '      , ITEMSOLI TI'
      '      /* amf 08.02.2006 - Quantidade Pendente */'
      'WHERE'
      '        ( I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '    AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)'
      '    AND (I.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      '    AND (RO.IDRESERVAORCAMEN(+) = I.IDRESERVAORCAMEN )'
      '    /* amf 08.02.2006  */'
      '    AND (TI.CODARTIGO(+) = I.CODARTIGO)'
      '    AND (TI.IDPRODVARI(+) = I.IDPRODVARI)'
      '    /* amf 08.02.2006  */'
      '')
    Left = 624
    Top = 200
  end
  object spListRecMerc: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '       N.IDNFRECEBDEVOL,'
      '       N.NUMNF,'
      '       N.COMPLNF,'
      '       N.IDPESSOA,'
      '       N.CODDOCUMENTO,'
      '       N.FLGTIPONOTA,'
      '       N.DATAEMISNF,'
      '       D.DATAVENCTO,'
      '       N.IDFORCLI,'
      '       N.DATAENTDEVOL,'
      '       N.VLRNOTAFISCAL,'
      '       N.PLNCODIGO,'
      '       N.IDNFREFERENCIA'
      ' FROM'
      '       NFRECEBDEVOL N,'
      '       DOCUMENTO D'
      '  WHERE'
      '       (N.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '   AND (D.CODDOCUMENTO(+) = N.CODDOCUMENTO)'
      ''
      ' '
      ' ')
    Left = 624
    Top = 152
  end
  object spListContab: TCMSqlParams
    SQL.Strings = (
      'SELECT L.*,'
      
        '     (L.LACHIST1||L.LACHIST2||L.LACHIST3||L.LACHIST4|| L.LACHIST' +
        '5) AS HISTORICO'
      'FROM LANCAMENTO L'
      'WHERE (L.PLNCODIGO = :PLNCODIGO)'
      '--ORDER BY LACDEBCRE DESC'
      '')
    Left = 32
    Top = 296
  end
  object spListDadosCAP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' L.HISTORICOCOMPL,  '
      ' D.NUMLEITCODBARRAS,'
      ' D.REFERENCIA,      '
      ' D.NUMDIGCODBARRAS, '
      ' D.CODFORMA,        '
      ' D.CODPORTFORMA,    '
      ' D.CODTIPDOC,'
      ' D.OBS,'
      ' D.OPERACAO,'
      ' D.NUMAPGR,'
      ' D.IDCBANCARIA'
      'FROM'
      '     DOCUMENTO D,'
      '     LANCTODOCUM L'
      'WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO)'
      ' AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ' AND (D.OPERACAO = L.OPERACAO )'
      ' '
      ' '
      ' ')
    Left = 120
    Top = 296
  end
  object spBaixaSCI: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     S.DATAENTREGA,'
      '     S.DATAEMISSAO,'
      '     S.CODALMOXARIFADO,'
      '     S.UNIDNEGOC,'
      '     S.CODCENTRORESPON,'
      '     S.NUMSOLCOMPRA,'
      '     SI.CODARTIGO,'
      '     SI.CODMEDIDA,'
      '     SI.SALDOACOMPRAR,'
      '     SI.QTDEPENDENTE,'
      '     SI.IDITEMSOLI'
      'FROM'
      '     ITEMSOLI SI,'
      '     SOLICOMP S'
      'WHERE'
      '        (SI.CODARTIGO       = :CODARTIGO)'
      '    AND (:IDPRODVARI IS NULL OR SI.IDPRODVARI = :IDPRODVARI)'
      '    AND (S.CODALMOXARIFADO  = :CODALMOXARIFADO )'
      '    AND (S.UNIDNEGOC        = :UNIDNEGOC)'
      '    AND (S.CODCENTRORESPON  = :CODCENTRORESPON)'
      
        '    AND (:NUMSOLCPMPRA IS NULL OR SI.NUMSOLCOMPRA = :NUMSOLCOMPR' +
        'A)'
      '    AND (S.IDPESSOA = :IDPESSOA)'
      '    AND (SI.QTDEPENDENTE <> 0)'
      '    AND (SI.NUMSOLCOMPRA = S.NUMSOLCOMPRA)'
      'ORDER BY S.DATAENTREGA'
      ' '
      ' ')
    Left = 224
    Top = 296
  end
  object spAtuItemSoli: TCMSqlParams
    SQL.Strings = (
      'UPDATE ITEMSOLI SET'
      '  QTDEPENDENTE  = :QTDEPENDENTE'
      ' ,SALDOACOMPRAR = :SALDOACOMPRAR'
      'WHERE'
      '    ( IDITEMSOLI =  :IDITEMSOLI )'
      'AND (:NUMSOLCOMPRA IS NULL OR NUMSOLCOMPRA = :NUMSOLCOMPRA )'
      ' ')
    Left = 320
    Top = 296
  end
  object spInsertSoliBaixadas: TCMSqlParams
    SQL.Strings = (
      'INSERT INTO SOLIBAIXADAS'
      
        '(IDITENSRECDEV,IDITEMSOLI,IDPESSOA,QTDEBAIXADA,DATAEMISSOLI,DATA' +
        'RECEB,NUMDIAS)'
      'VALUES'
      
        '(:IDITENSRECDEV,:IDITEMSOLI,:IDPESSOA,:QTDEBAIXADA,:DATAEMISSOLI' +
        ',:DATARECEB,:NUMDIAS)')
    Left = 424
    Top = 296
  end
  object spDelBaixaSCI: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      S.IDITEMSOLI,'
      '      S.IDITENSRECDEV,'
      '      S.IDPESSOA,'
      '      S.QTDEBAIXADA,'
      '      S.DATAEMISSOLI,'
      '      S.DATARECEB,'
      '      S.NUMDIAS'
      'FROM'
      '      SOLIBAIXADAS S,'
      '      ITEMSOLI I'
      'WHERE'
      '         (S.IDITENSRECDEV = :IDITENSRECDEV)'
      '     AND (I.CODARTIGO =  :CODARTIGO )'
      '     AND (I.IDPRODVARI = :IDPRODVARI)'
      '     AND (I.IDITEMSOLI = S.IDITEMSOLI)')
    Left = 528
    Top = 296
  end
  object spBaixaDir: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     M.IDMOV,'
      '     M.IDPESSOA,'
      '     M.CODTIPOMOV,'
      '     M.IDEMPRESA,'
      '     M.CODARTIGO,'
      '     M.CODCENTROCUSTO,'
      '     M.CODALMOXARIFADO,'
      '     M.DATAMOV,'
      '     M.QTDEMOV,'
      '     M.VALORMOV,'
      '     M.DATALANCMOV,'
      '     M.SALDOQTDEMOV,'
      '     M.NUMDOCUMENTO,'
      '     M.CODALMOXTRANSF,'
      '     M.PLNCODIGO,'
      '     M.IDMOVENTRADA,'
      '     M.UNIDNEGOC,'
      '     AL.CODCUSTEIO,'
      '     P.CODMEDCUSTO'
      'FROM'
      '     MOVIMENT M,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     ALMOX AL'
      ''
      'WHERE'
      '        ((M.IDMOVENTRADA = :IDMOV) OR (M.IDMOV = :IDMOV))'
      '    AND (M.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (M.CODALMOXARIFADO = AL.CODALMOXARIFADO)'
      'ORDER BY IDMOV DESC')
    Left = 624
    Top = 248
  end
  object spGetNotaCompl: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     N.IDNFRECEBDEVOL,'
      '     N.NUMNF,'
      '     N.COMPLNF,'
      '     N.DATAEMISNF,'
      '     D.DATAVENCTO,'
      '     N.CODFISCAL,'
      '     N.IDFORCLI,'
      '     N.DATAENTDEVOL,'
      '     N.IDPESSOA,'
      '     N.CODDOCUMENTO,'
      '     N.FLGTIPONOTA,'
      '     N.IDNFREFERENCIA,'
      '     N.VLRNOTAFISCAL,'
      '     N.PLNCODIGO'
      'FROM'
      '     NFRECEBDEVOL N,'
      '     DOCUMENTO D'
      'WHERE  (N.IDNFREFERENCIA= :IDNFREFERENCIA)'
      '   AND (N.FLGTIPONOTA ='#39'A'#39')'
      '   AND (D.CODDOCUMENTO(+) = N.CODDOCUMENTO)'
      '')
    Left = 624
    Top = 296
  end
  object spListAgregNFCompl: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     A.IDAGRNFRECDEV,'
      '     A.IDNFRECEBDEVOL,'
      '     A.IDNFCOMPLEMENTAR,'
      '     A.ALIQUOTA AS PERCENT,'
      '     A.BASECALCULO AS BASE,'
      '     A.VLRAGREGADO AS VALOR,'
      '     A.VLRRECUPERADO,'
      '     (0)  AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRNFRECDEV A'
      'WHERE'
      '        (T.FLGINCIDENFCOMPL = '#39'S'#39')'
      '    AND (T.TOTALITEM = '#39'T'#39')'
      '    AND (A.IDNFRECEBDEVOL(+) = :IDNFRECEBDEVOL)'
      '    AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))'
      ' ')
    Left = 32
    Top = 344
  end
  object spGetAgregItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     A.IDAGRITENSRECDEV,'
      '     A.IDITENSRECDEV,'
      '     A.ALIQUOTA AS PERCENT,'
      '     A.BASECALCULO AS BASE,'
      '     A.VLRAGREGADO AS VALOR,'
      '     A.VLRRECUPERADO,'
      '     (0)  AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRITENSRECDEV A'
      'WHERE'
      '         (T.FLGINCIDERECEB = '#39'S'#39')'
      '     AND (T.TOTALITEM = '#39'I'#39')'
      '     AND (T.CODTRATFISCE < '#39'8'#39' )'
      
        '     AND (A.IDITENSRECDEV IN (SELECT IDITENSRECDEV FROM ITENSREC' +
        'EBDEVOL WHERE (IDNFRECEBDEVOL = :IDNFRECEBDEVOL) ))'
      '     AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      'UNION'
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     (0) AS IDAGRITENSRECDEV,'
      '     (0) AS IDITENSRECDEV,'
      '     (0) AS PERCENT,'
      '     (0) AS BASE,'
      '     (0) AS VALOR,'
      '     (0) AS VLRRECUPERADO,'
      '     (0) AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T'
      'WHERE'
      '         (T.FLGINCIDERECEB = '#39'S'#39')'
      '     AND (T.TOTALITEM = '#39'I'#39')'
      '     AND (T.CODTRATFISCE < '#39'8'#39' )'
      '     AND (T.CODTIPOCUSTAGREG NOT IN (SELECT A.CODTIPOCUSTAGREG'
      
        '                                     FROM ITENSRECEBDEVOL I, AGR' +
        'ITENSRECDEV A'
      
        '                                     WHERE (I.IDNFRECEBDEVOL = :' +
        'IDNFRECEBDEVOL)'
      
        '                                       AND (I.IDITENSRECDEV = A.' +
        'IDITENSRECDEV )))'
      ''
      'ORDER BY FLGBASE DESC, DESCCUSTAGREG'
      ' '
      ' ')
    Left = 120
    Top = 344
  end
  object spGetAgregNota: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     A.IDAGRNFRECDEV,'
      '     A.IDNFRECEBDEVOL,'
      '     A.IDNFCOMPLEMENTAR,'
      '     A.ALIQUOTA AS PERCENT,'
      '     A.BASECALCULO AS BASE,'
      '     A.VLRAGREGADO AS VALOR,'
      '     A.VLRRECUPERADO,'
      '     (0)  AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRNFRECDEV A'
      'WHERE'
      '         (T.FLGINCIDERECEB = '#39'S'#39')'
      '     AND (T.TOTALITEM = '#39'T'#39')'
      '     AND (T.CODTRATFISCE < '#39'8'#39' )'
      '     AND (A.IDNFRECEBDEVOL(+) = :IDNFRECEBDEVOL)'
      '     AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))'
      ' '
      ' '
      ' ')
    Left = 224
    Top = 344
  end
  object spGetAgregItemForItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     A.IDAGRITENSRECDEV,'
      '     A.IDITENSRECDEV,'
      '     A.ALIQUOTA AS PERCENT,'
      '     A.BASECALCULO AS BASE,'
      '     A.VLRAGREGADO AS VALOR,'
      '     A.VLRRECUPERADO,'
      '     (0)  AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRITENSRECDEV A'
      'WHERE'
      '         (T.FLGINCIDERECEB = '#39'S'#39')'
      '     AND (T.TOTALITEM = '#39'I'#39')'
      '     AND (T.CODTRATFISCE < '#39'8'#39' )'
      
        '     AND (A.IDITENSRECDEV IN (SELECT IDITENSRECDEV FROM ITENSREC' +
        'EBDEVOL WHERE (IDNFRECEBDEVOL = :IDNFRECEBDEVOL) ))'
      '     AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      ''
      'ORDER BY FLGBASE DESC, DESCCUSTAGREG')
    Left = 320
    Top = 344
  end
  object spListBaixaDir: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     N.DATAENTDEVOL ,'
      '     N.NUMNF AS NUMNOTA,'
      '     I.IDITENSRECDEV,'
      '     I.CODALMOXARIFADO,'
      '     I.CODMEDIDA,'
      '     I.CODARTIGO,'
      '     I.NUMOC,'
      '     I.IDMOV,'
      '     I.QTDERECEBDEVOL,'
      '     I.QTDERECEBDEVOL AS QTDEBAIXA,'
      '     I.VLRUNITARIO,'
      '     I.VLRESTOQUE,'
      '     I.FLGDESTINO,'
      '     I.DATAVALIDADE,'
      '     I.IDITEMOC,'
      '     I.UNIDNEGOC,'
      
        '     (P.DESCPROD || '#39' '#39' ||  A.CODCOR || '#39' '#39' || A.CODTAMANHO) AS ' +
        'DESCRICAO,'
      '     (1) AS FLAG,'
      '     (0) AS CODALMOXTRANSF,'
      '     I.CODCENTROCUSTO AS CENTROCUSTODESTINO'
      'FROM'
      '     ITENSRECEBDEVOL I,'
      '     NFRECEBDEVOL N,'
      '     PRODUTO P,'
      '     ARTIGO A'
      'WHERE'
      '       (N.IDNFRECEBDEVOL =  :IDNFRECEBDEVOL )'
      '   AND (N.IDNFRECEBDEVOL =  I.IDNFRECEBDEVOL )'
      '   AND (A.CODARTIGO = I.CODARTIGO)'
      '   AND (P.CODPRODUTO = A.CODPRODUTO)'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 424
    Top = 344
  end
  object spListItemDevol: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDITEMOC,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.QTDERECEBDEVOL as QtdeDev,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      I.VLRESTOQUE as  VlrDev,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,'
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      I.IDPRODVARI,'
      '      I.IDRESERVAORCAMEN,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      P.CODGRUPOPROD,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      (0) AS QTDETOTAL,'
      '      I.CODMEDIDA AS CODMEDORI,'
      '      '#39'T'#39' AS FLGPARCTOT,'
      '      (0) AS CODCUSTEIO,'
      '      (0) AS CODCUSTEIOLOGIN,'
      '      (0) AS CODALMOXARIFADOLOGIN,'
      '      (0) AS CODCENTROCUSTOLOGIN,'
      '      NF.DATAENTDEVOL'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      NFRECEBDEVOL NF,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '        ( I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '    AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)'
      '    AND (I.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)')
    Left = 528
    Top = 344
  end
  object spGetAgregDevol: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRITENSRECDEV,'
      '         A.IDITENSRECDEV,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.BASECALCULO as BaseDev,'
      '         A.VLRAGREGADO,'
      '         A.VLRAGREGADO as VlrAgregDev,'
      '         A.VLRRECUPERADO as VlrRecupDev'
      'FROM'
      '         TIPOAGRE T,'
      '         AGRITENSRECDEV A,'
      '         ITENSRECEBDEVOL I '
      'WHERE'
      '            (T.FLGINCIDERECEB = '#39'S'#39')'
      '           AND  (T.TOTALITEM = '#39'T'#39')'
      '           AND ( I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL )'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      '  AND (I.IDITENSRECDEV = A.IDITENSRECDEV)')
    Left = 624
    Top = 344
  end
  object spAgregNFComplDevol: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRNFRECDEV,'
      '         A.IDNFRECEBDEVOL,'
      '         A.IDNFCOMPLEMENTAR,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.BASECALCULO as BaseDev,'
      '         A.VLRAGREGADO,  '
      '         A.VLRAGREGADO as VlrAgregDev,'
      '         A.VLRRECUPERADO as VlrRecupDev'
      ''
      'FROM'
      '         TIPOAGRE T,'
      '         AGRNFRECDEV A'
      'WHERE'
      '           ( T.FLGINCIDENFCOMPL = '#39'S'#39')'
      '           AND  (T.TOTALITEM = '#39'T'#39')'
      '           AND ( A.IDNFRECEBDEVOL = :IDNFRECEBDEVOL )'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      ' ')
    Left = 120
    Top = 392
  end
  object spGetAgergItemDevol: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '         T.CODTIPOCUSTAGREG,'
      '         T.CODTRATFISCE,'
      '         T.DESCCUSTAGREG,'
      '         T.PERCVALOR,'
      '         A.IDAGRITENSRECDEV,'
      '         A.IDITENSRECDEV,'
      '         A.ALIQUOTA,'
      '         A.BASECALCULO,'
      '         A.BASECALCULO as BaseDev,'
      '         A.VLRAGREGADO,'
      '         A.VLRAGREGADO as VlrAgregDev,'
      '         A.VLRRECUPERADO as VlrRecupDev'
      'FROM'
      '         TIPOAGRE T,'
      '         AGRITENSRECDEV A,'
      '         ITENSRECEBDEVOL I '
      'WHERE'
      '      (T.FLGINCIDERECEB = '#39'S'#39')'
      '  AND (T.TOTALITEM = '#39'I'#39')'
      '  AND (I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '  AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG)'
      '  AND (I.IDITENSRECDEV = A.IDITENSRECDEV)'
      ' ')
    Left = 32
    Top = 392
  end
  object spBaixaSCIComOC: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '     S.DATAENTREGA,'
      '     S.DATAEMISSAO,'
      '     S.CODALMOXARIFADO,'
      '     S.UNIDNEGOC,'
      '     S.CODCENTRORESPON,'
      '     S.NUMSOLCOMPRA,'
      '     SI.CODARTIGO,'
      '     SI.CODMEDIDA,'
      '     SI.SALDOACOMPRAR,'
      '     SI.QTDEPENDENTE,'
      '     SI.IDITEMSOLI'
      'FROM'
      '     ITEMSOLI SI,'
      '     SOLICOMP S,'
      '     SCITEMOC SCO,'
      '     ITEMOC IOC'
      'WHERE'
      '        (SI.CODARTIGO       = :CODARTIGO)'
      '    AND (:IDPRODVARI IS NULL OR SI.IDPRODVARI = :IDPRODVARI)'
      '    AND (S.CODALMOXARIFADO  = :CODALMOXARIFADO )'
      '    AND (S.UNIDNEGOC        = :UNIDNEGOC)'
      '    AND (S.CODCENTRORESPON  = :CODCENTRORESPON)'
      '    AND (SI.NUMSOLCOMPRA = :NUMSOLCOMPRA)'
      '    AND (S.IDPESSOA = :IDPESSOA)'
      '    AND (:PNUMOC IS NULL OR IOC.NUMOC = :PNUMOC)'
      '    AND  SCO.IDITEMOC = IOC.IDITEMOC'
      '    AND  SI.NUMSOLCOMPRA = SCO.NUMSOLCOMPRA'
      '    AND (SI.QTDEPENDENTE <> 0)'
      '    AND (SI.NUMSOLCOMPRA = S.NUMSOLCOMPRA)'
      'ORDER BY S.DATAENTREGA'
      ''
      ''
      ' '
      ' ')
    Left = 264
    Top = 408
  end
end
