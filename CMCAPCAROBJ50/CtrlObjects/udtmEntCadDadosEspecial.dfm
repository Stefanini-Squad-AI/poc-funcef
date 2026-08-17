object dtmEntCadDadosEspecial: TdtmEntCadDadosEspecial
  OldCreateOrder = False
  Left = 227
  Top = 180
  Height = 373
  Width = 696
  object sqlSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.CODCENTROCUSTO, CC.NOME, C.FLGSINALCONTA, C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN, C.NOMECONTAORCAMEN, 0 AS VALORCC,'
      '  NVL(SUM(S.VLRORCADO),0) AS VLRORCADO,'
      '  NVL(SUM(S.VLRRATEIOORI),0) AS VLRRATEIOORI, 0 AS FATORRATEIO'
      'FROM'
      '  SALDOORCADO S, CONTASORCAMEN C, CENTCUST CC'
      'WHERE'
      '  (S.IDPESSOA(+) = :IDPESSOA) AND'
      '  (S.EXERCICIO(+) = :EXERCICIO) AND'
      '  :PERIODO'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  (C.IDPESSOA = :IDPESSOA) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      '  (S.IDCONTAORCAMEN(+) = C.IDCONTAORCAMEN) AND'
      '  (S.IDPLANOORCAMEN(+) = C.IDPLANOORCAMEN) AND'
      '  (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND'
      '  (C.IDEMPRESA = CC.IDEMPRESA) AND'
      '  (C.TIPOCALCORCADO = '#39'V'#39') AND'
      '  (CC.ATIVO = '#39'S'#39') AND'
      '  (CC.STATUSGRUPOCDC = '#39'A'#39')'
      'GROUP BY'
      '  C.CODCENTROCUSTO, CC.NOME, C.FLGSINALCONTA, C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN, C.NOMECONTAORCAMEN,'
      '  C.IDCONTAORCAMEN'
      'ORDER BY'
      '  C.CODCENTROCUSTO')
    OnFormartParam = sqlSaldoFormartParam
    Left = 48
    Top = 24
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO,'
      '  DATAINIPERIODO,'
      '  DATAFIMPERIODO,'
      '  NOMEPERIODO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  ( IDPESSOA       = :IDPESSOA )  AND'
      '  ( EXERCICIO      = :EXERCICIO ) AND'
      '  ( ( FLGBLOQUEADO = '#39'N'#39' ) OR ( FLGBLOQUEADO IS NULL ) )'
      'UNION'
      'SELECT DISTINCT'
      '  0 as PERIODO,'
      '  SYSDATE AS DATAINIPERIODO,'
      '  SYSDATE AS DATAFIMPERIODO,'
      '  '#39'Anual'#39' As NOMEPERIODO'
      'FROM'
      '  PERIODOORCAMEN P1'
      'WHERE'
      '  ( P1.IDPESSOA       = :IDPESSOA )  AND'
      '  ( P1.EXERCICIO      = :EXERCICIO ) AND'
      '  ( ( P1.FLGBLOQUEADO = '#39'N'#39' ) OR ( P1.FLGBLOQUEADO IS NULL ) )'
      'ORDER BY'
      '  PERIODO'
      ' '
      ' ')
    Left = 48
    Top = 88
  end
  object sqlValorCCustAux: TCMSqlParams
    Left = 48
    Top = 149
  end
  object sqlCompOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DISTINCT CC.PLACONTA'
      'FROM'
      '  CONTASORCAMEN C, COMPCONTASORCAMEN CC'
      'WHERE'
      
        '  (CC.PLACONTA IS NOT NULL) AND (C.IDCONTAORCAMEN = CC.IDCONTAOR' +
        'CAMEN) AND'
      '  (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND'
      '  (C.IDGRUPOORCAMEN = :IDGRUPOORCAMEN) AND'
      '  :UNIDNEGOC'
      '  :IDPLANOPREV'
      '  :IDPATRO'
      '')
    OnFormartParam = sqlCompOrcamenFormartParam
    Left = 48
    Top = 208
  end
  object sqlPatroConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  P.NOME, PT.IDPESSOA'
      'FROM'
      '  PESSOA P, PATRO PT'
      'WHERE'
      '  (P.IDPESSOA = PT.IDPESSOA)   '
      '')
    Left = 168
    Top = 208
  end
  object sqlSaldoContabil: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  ABS(SUM(PLSCREDITOCOR - PLSDEBITOCORRENTE)) AS SALDOCONTAB'
      'FROM'
      '  PLANOSALDO'
      'WHERE'
      
        '  (PERNUMERO = :PERNUMERO) AND (PEREXERCICIO = :PEREXERCICIO) AN' +
        'D'
      '  (IDPESSOA = :IDPESSOA) AND :PLACONTA'
      '')
    OnFormartParam = sqlSaldoContabilFormartParam
    Left = 168
    Top = 147
  end
  object sqlCriterio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCRITERIORATORC, C.DESCRICAO, C.TIPORATEIO, C.IDDATAVIEW, C' +
        '.PERNUMERO,'
      '  C.PEREXERCICIO, P.PERDATINI, P.PERDATFIM'
      'FROM'
      '  CRITERIORATORC C, PERIODO P'
      'WHERE'
      
        '  (C.IDPESSOA = :IDPESSOA) AND (C.PERNUMERO = P.PERNUMERO(+)) AN' +
        'D'
      
        '  (C.PEREXERCICIO = P.PEREXERCICIO(+)) AND (C.IDPESSOA = P.IDPES' +
        'SOA(+))'
      'ORDER BY'
      '  C.DESCRICAO'
      ''
      ' ')
    Left = 168
    Top = 85
  end
  object sqlPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DISTINCT O.DESCRICAO, O.IDPLANOTRABALHO, O.UNIDNEGOC, U.NOME A' +
        'S NOMEUN,'
      '  CR.NOME AS NOMECR'
      'FROM'
      
        '  PLANOTRABALHOORC O, PESSOAXCRESP C, CENTRESPON CR, UNIDNEGOCIO' +
        ' U'
      'WHERE'
      
        '  (O.CODCENTRORESPON = C.CODCENTRORESPON ) AND (O.IDPESSOA = C.I' +
        'DPESSOA) AND'
      
        '  (C.IDPESSOAACESSO = :IDUSUARIO) AND (C.IDPESSOA = :IDPESSOA) A' +
        'ND'
      
        '  (CR.CODCENTRORESPON = O.CODCENTRORESPON) AND (CR.IDPESSOA = O.' +
        'IDPESSOA) AND'
      '  (U.UNIDNEGOC = O.UNIDNEGOC) AND (U.IDPESSOA = O.IDPESSOA)'
      'ORDER BY'
      '  O.DESCRICAO'
      '')
    Left = 168
    Top = 24
  end
  object sqlValorCentCust: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SUM(VLRCRIRATORC) AS VLRCRIRATORC'
      'FROM'
      '  VALORCRIRATORC'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND(EXERCICIO = :EXERCICIO) AND :PERIOD' +
        'O AND'
      
        '  (CODCENTROCUSTO = :CODCENTROCUSTO) AND (IDEMPRESA = :IDEMPRESA' +
        ') AND'
      '  (IDCRITERIORATORC = :IDCRITERIORATORC)'
      '')
    OnFormartParam = sqlValorCentCustFormartParam
    Left = 408
    Top = 24
  end
  object sqlDataView: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NAME, IDDATAVIEW, CLASSNAME, ORIGEMCMDV, TEMPLATE, DESCRIPTION'
      'FROM'
      '  DATAVIEW'
      'WHERE'
      '  (IDDATAVIEW = :IDDATAVIEW) AND (ORIGEMCMDV = '#39'0'#39')'
      '')
    Left = 288
    Top = 24
  end
  object sqlPlanoPrevConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      'FROM'
      '  PLANPREVCONTABIL'
      'ORDER BY'
      '  NOME'
      '')
    Left = 288
    Top = 85
  end
  object sqlExercicio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DISTINCT EXERCICIO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      
        '  ((FLGBLOQUEADO = '#39'N'#39') OR (FLGBLOQUEADO IS NULL)) AND (IDPESSOA' +
        ' = :IDPESSOA)'
      'ORDER BY'
      '  EXERCICIO'
      '')
    Left = 288
    Top = 147
  end
  object sqlContaSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPLANOORCAMEN, IDCONTAORCAMEN, DATAREFERENCIA, IDPESSOA'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      
        '  (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND (IDCONTAORCAMEN =:IDCONT' +
        'AORCAMEN) AND'
      '  (DATAREFERENCIA =:DATAREFERENCIA) AND (IDPESSOA =:IDPESSOA)'
      '')
    Left = 288
    Top = 208
  end
end
