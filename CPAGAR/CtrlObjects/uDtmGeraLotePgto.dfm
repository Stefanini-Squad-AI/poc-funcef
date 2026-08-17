object DtmGeraLotePgto: TDtmGeraLotePgto
  OldCreateOrder = False
  Left = 65488
  Top = 112
  Height = 486
  Width = 812
  object SqlFormadePagto: TCMSqlParams
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :RECPAG) AND'
      '               (IDPESSOA = :IDPESSOA)')
    Left = 316
    Top = 114
  end
  object SqlNumlancto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  L.NUMLANCTO,L.DEBCRE'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO)')
    Left = 413
    Top = 114
  end
  object SqlDescPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  B.RAZAOSOCIAL, '
      '  PF.DESCRICAO, '
      '  PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA,'
      '  PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV  '
      'FROM '
      '  PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B '
      'WHERE 1=2')
    Left = 219
    Top = 114
  end
  object SqlRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT IDPROCESSO'
      'FROM'
      '((SELECT DISTINCT R.IDPROCESSO'
      ' FROM DOCUMENTO D, RATEIODOCUM R'
      ' WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (R.IDPROCESSO IS NOT NULL)'
      '   AND (D.OPERACAO = '#39'2 '#39')'
      '   AND (D.CODDOCUMENTO = :CODDOCUMENTO))'
      ' UNION ALL'
      '(SELECT DISTINCT R.IDPROCESSO'
      ' FROM RATEIODOCUM R,'
      '      (SELECT NUMFATURA FROM DOCUMENTO'
      '        WHERE (CODDOCUMENTO = :CODDOCUMENTO)'
      '          AND (OPERACAO = '#39'3 '#39')) D3,'
      '      DOCUMENTO D1'
      ' WHERE (D1.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (R.IDPROCESSO IS NOT NULL)'
      '   AND (D1.OPERACAO = '#39'1 '#39')'
      '   AND (D1.NUMFATURA = D3.NUMFATURA)))'
      ''
      '')
    Left = 606
    Top = 114
  end
  object SqlSaldoLoteNaoEmitido: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SUM(VALOR) AS VALORLOTE'
      'FROM'
      '  LOTEXDOCUM'
      'WHERE'
      '  (CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  ((FLGBAIXA IS NULL) OR (FLGBAIXA = '#39'N'#39'))')
    Left = 606
    Top = 42
  end
  object SqlTipoDocRecPag: TCMSqlParams
    SQL.Strings = (
      '  SELECT CODTIPDOC,DESCRICAO  FROM TIPODOCRECPAG a'
      '  WHERE a.RECPAG =  :recpag'
      '  and not exists (select 1 from UsuarioxTpdocto b where'
      '  b.idusuario=:idusuario and b.RECPAG = :recpag)'
      '  union SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a'
      '  WHERE a.RECPAG = :recpag and  exists'
      '  (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc'
      
        '  and b.idusuario=:idusuario and b.RECPAG = :recpag) ORDER BY DE' +
        'SCRICAO')
    Left = 504
    Top = 42
  end
  object SqlAux: TCMSqlParams
    Left = 408
    Top = 42
  end
  object Sqlseladiantpendent: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  1'
      'FROM'
      '  DOCUMENTO D , LANCTODOCUM L'
      'WHERE'
      '      (D.IDFORCLI=:IDFORCLI)'
      '  AND (RTRIM(D.STATUS) <> '#39'2'#39')'
      '  AND (RTRIM(D.OPERACAO)= '#39'15'#39')'
      '  AND (L.ESTORNO IS NULL)  '
      '  AND (D.OPERACAO=L.OPERACAO)'
      '  AND (D.CODDOCUMENTO=L.CODDOCUMENTO)'
      '')
    Left = 313
    Top = 42
  end
  object SqlLoteXDocumento: TCMSqlParams
    SQL.Strings = (
      
        'Select LOTEXDOCUM.NUMLOTE, LOTEXDOCUM.CODDOCUMENTO, LOTEXDOCUM.V' +
        'ALOR, LOTEXDOCUM.IDPROCESSO, '
      
        '       LOTEXDOCUM.CODBARRA, LOTEXDOCUM.CODBARRAVALOR, Pessoa.RAZ' +
        'AOSOCIAL AS nome,DOCUMENTO.DATAPROGRAMADA,'
      
        '       Documento.idpessoa,DOCUMENTO.DATAVENCTO,DOCUMENTO.NoDOCUM' +
        'ENTO,'
      
        '       DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, DOCUMENTO.I' +
        'DFORCLI,'
      '       0 AS VLRLIQUIDO, '
      
        '       '#39'                                                        ' +
        '                                                                ' +
        '                                                                ' +
        '                    '#39' AS PLANOPREV,'
      '       PB.NOME AS BANCO, AG.NUMAGENCIA, CC.CONTACORRENTE'
      
        'FROM LOTEXDOCUM,PESSOA,DOCUMENTO, CONTABANCARIA CC, AGENCIABANCA' +
        'RIA AG, PESSOA PB '
      'where  LOTEXDOCUM.numlote=0'
      ' AND PB.IDPESSOA(+) = AG.IDBANCO'
      '  AND AG.IDPESSOA(+) = CC.IDAGENCIA '
      '  AND DOCUMENTO.IDCBANCARIA = CC.IDCBANCARIA(+) ')
    Left = 122
    Top = 42
  end
  object SqlLotePagto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, FLGR' +
        'ADLOTEDOC,'
      '  NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL,'
      '  OBSERVACAO, IDUSUARIOINCLUSAO, DATADIFERIDO '
      'FROM '
      '  LOTEPAGTO WHERE (1=2)'
      ' ')
    Left = 27
    Top = 42
  end
  object SqlDocPendentes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  LANCTODOCUM.VLRLIQUIDO, (0) AS SALDO, DOCUMENTO.IDFORCLI,DOCUM' +
        'ENTO.OPERACAO,'
      
        '  DOCUMENTO.CODDOCUMENTO, DOCUMENTO.IDPESSOA,DOCUMENTO.NODOCUMEN' +
        'TO,'
      
        '  DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA, DOCUMENTO.D' +
        'ATAVENCTO,'
      
        '  DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL, PESSOA.NOME AS FORNECEDOR' +
        ', PESSOA.NOME,'
      
        '  DOCUMENTO.STATUS, DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIG' +
        'CODBARRAS'
      'FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (1=2)'
      ' '
      ' '
      ' ')
    Left = 219
    Top = 42
  end
  object sqlModulos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDMODULO, NOMEMODULO'
      'FROM'
      '  MODULO'
      'ORDER BY'
      '  NOMEMODULO')
    Left = 520
    Top = 120
  end
end
