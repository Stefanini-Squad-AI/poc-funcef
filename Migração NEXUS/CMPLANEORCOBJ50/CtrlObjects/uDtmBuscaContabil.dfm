object dtmBuscaContabil: TdtmBuscaContabil
  OldCreateOrder = False
  Left = 241
  Top = 224
  Height = 480
  Width = 696
  object sqlSaldos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  :CAMPOS'
      'FROM'
      '  :TABELAS'
      'WHERE'
      '  :CONDICOES')
    OnFormartParam = sqlSaldosFormartParam
    Left = 48
    Top = 29
  end
  object sqlContasOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  :CAMPOS'
      'FROM'
      '  :TABELAS'
      'WHERE'
      '  :CONDICOES')
    OnFormartParam = sqlContasOrcamenFormartParam
    Left = 235
    Top = 29
  end
  object sqlComposicao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCOMPCONTASORC, C.IDCONTAREFREAL, C.IDPLANOORCAMEN, C.CODCE' +
        'NTRORESPON,'
      
        '  C.IDPESSOA, C.UNIDNEGOC, C.IDEMPRESA, C.CODCENTROCUSTO, C.PLAN' +
        'O, C.PLACONTA,'
      
        '  C.CODTIPRECDES, C.RECPAG, C.IDCONTAORCAMEN, C.IDCONTAREFORCADO' +
        ','
      
        '  C.PERCCONTAREFORC, C.PERCCONTAREFREA, O.FLGCALCORCADO, O.FLGCA' +
        'LCREAL,'
      
        '  C.IDCONTACONDINI, C.IDCONTACONDFIM, C.IDCONTACONDRES, C.CONDIC' +
        'AO,'
      
        '  C.TIPOCONDINI, C.TIPOCONDRES, C.VLRCONDINI, C.VLRCONDRES, C.ID' +
        'PLANOPREV,'
      '  C.IDPATRO'
      'FROM'
      '  CONTASORCAMEN O, COMPCONTASORCAMEN C'
      'WHERE'
      
        '  (C.IDPLANOORCAMEN = :PLANO) AND (C.IDCONTAORCAMEN = :CONTA) AN' +
        'D'
      
        '  (C.PLACONTA IS NOT NULL) AND (O.IDPLANOORCAMEN = C.IDPLANOORCA' +
        'MEN) AND'
      '  (O.IDCONTAORCAMEN = C.IDCONTAORCAMEN)'
      'ORDER BY'
      '  IDPLANOORCAMEN, IDCONTAORCAMEN'
      '')
    Left = 333
    Top = 29
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO, NOMEPER' +
        'IODO, EXERCICIO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (EXERCICIO = :EXERCICIO) AND (IDPESSOA = :PESSOA) AND '
      '  (PERIODO >= :PERIODOINI) AND (PERIODO <= :PERIODOFIM)'
      'ORDER BY'
      '  PERIODO'
      '')
    Left = 122
    Top = 93
  end
  object sqlContabilidade: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  :CAMPOS'
      'FROM'
      '  :TABELAS'
      'WHERE'
      '  :CONDICOES')
    OnFormartParam = sqlContabilidadeFormartParam
    Left = 124
    Top = 29
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  :CAMPOS'
      'FROM'
      '  :TABELAS'
      'WHERE'
      '  :CONDICOES')
    OnFormartParam = sqlAuxFormartParam
    Left = 43
    Top = 96
  end
end
