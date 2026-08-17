object dtmGeraDados: TdtmGeraDados
  OldCreateOrder = False
  Left = 65316
  Top = 90
  Height = 648
  Width = 966
  object Parser: TParser
    Left = 669
    Top = 497
  end
  object sqlExercicio: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT '
      '   EXERCICIO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY '
      '   EXERCICIO')
    Left = 120
    Top = 24
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    DATAINIPERIODO, DATAFIMPERIODO, NOMEPERIODO'
      'FROM'
      '    PERIODOORCAMEN'
      'WHERE'
      '    IDPESSOA =:PESSOA AND'
      '    EXERCICIO =:EXERCICIO AND'
      '    PERIODO =:PERIODO')
    Left = 120
    Top = 91
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCENARIOORCAMEN, NOMECENARIO'
      'FROM CENARIOORCAMEN'
      'ORDER BY NOMECENARIO'
      ' ')
    Left = 120
    Top = 159
  end
  object sqlContasAuxR: TCMSqlParams
    SQL.Strings = (
      'SELECT FLGCALCREAL'
      'FROM CONTASORCAMEN'
      'WHERE (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '              (IDCONTAORCAMEN = :IDCONTAORCAMEN)')
    Left = 120
    Top = 226
  end
  object sqlVerificaSinal: TCMSqlParams
    SQL.Strings = (
      'SELECT FLGSINALCONTA, FLGATIVA'
      'FROM CONTASORCAMEN'
      'WHERE (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '      (IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      ' ')
    Left = 120
    Top = 294
  end
  object sqlSaldos: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM SALDOORCADO')
    Left = 576
    Top = 280
  end
  object sqlContasAux: TCMSqlParams
    Left = 576
    Top = 352
  end
  object sqlPeriodoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    Left = 576
    Top = 24
  end
  object sqlNaoCalculadas: TCMSqlParams
    Left = 120
    Top = 429
  end
  object sqlContasAuxO: TCMSqlParams
    SQL.Strings = (
      'SELECT FLGCALCORCADO'
      'FROM CONTASORCAMEN WHERE'
      '   (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN = :IDCONTAORCAMEN)')
    Left = 120
    Top = 361
  end
  object sqlFluxo: TCMSqlParams
    Left = 576
    Top = 432
  end
  object sqlDeletaValores: TCMSqlParams
    Left = 576
    Top = 497
  end
  object sqlComposicao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.IDCOMPCONTASORC, C.IDCONTAREFREAL, C.IDPLANOORCAMEN,'
      '   C.CODCENTRORESPON, C.IDPESSOA, C.UNIDNEGOC, C.IDEMPRESA,'
      '   C.CODCENTROCUSTO, C.PLANO, C.PLACONTA, C.CODTIPRECDES,'
      '   C.RECPAG, C.IDCONTAORCAMEN, C.IDCONTAREFORCADO,'
      '   C.PERCCONTAREFORC, C.PERCCONTAREFREA, O.FLGCALCORCADO,'
      '   O.FLGCALCREAL, C.IDCONTACONDINI, C.IDCONTACONDFIM,'
      '   C.IDCONTACONDRES, C.CONDICAO, C.TIPOCONDINI, C.TIPOCONDRES,'
      '   C.VLRCONDINI, C.VLRCONDRES, C.IDPLANOPREV, C.IDPATRO'
      'FROM'
      '   CONTASORCAMEN O,'
      '   COMPCONTASORCAMEN C'
      'WHERE'
      '   (C.IDPLANOORCAMEN =:PLANO) AND'
      '   (C.IDCONTAORCAMEN =:CONTA) AND'
      '   (O.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND'
      '   (O.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND'
      '   (1 = 1)'
      'ORDER BY'
      '   IDPLANOORCAMEN, IDCONTAORCAMEN')
    Left = 576
    Top = 160
  end
  object sqlContabilidade: TCMSqlParams
    Left = 576
    Top = 224
  end
  object sqlAcumulado2CAnt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0 AS REAL,'
      '   SUM(VLRORCCENARIO) AS ORC'
      'FROM'
      '   VALORESCENARIO'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND'
      '   (EXERCICIO = :EXERCICIO) AND'
      '   (PERIODO IS NULL)')
    Left = 120
    Top = 497
  end
  object sqlDataview: TCMSqlParams
    SQL.Strings = (
      'SELECT TEMPLATE'
      'FROM DATAVIEW'
      'WHERE'
      '   IDDATAVIEW=:IDDATAVIEW AND'
      '   ORIGEMCMDV = '#39'0'#39)
    Left = 264
    Top = 159
  end
  object sqlPeriodoContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    PERNUMERO, PEREXERCICIO'
      'FROM'
      '    PERIODO'
      'WHERE'
      '    (IDPESSOA =:PESSOA) AND'
      '    (TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') >= PERDATINI) AND'
      '    (TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39') <= PERDATFIM)'
      '')
    Left = 264
    Top = 92
  end
  object sqlPlanoData: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   PD.PLANO, PD.DATAINICIO, PD.DATAFIM, PD.PLANOANTERIOR, P.MASC' +
        'ARA'
      'FROM'
      '   PLANODATA PD, PLANO P'
      'WHERE'
      '   (:DATA BETWEEN PD.DATAINICIO AND PD.DATAFIM) AND'
      '   (PD.IDPESSOA=:IDPESSOA) AND'
      '   (PD.PLANO = P.PLANO)')
    Left = 264
    Top = 24
  end
  object sqlAcumulado2Ant: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRREALIZADO) AS REAL,'
      '   SUM(VLRORCADO) AS ORC'
      'FROM'
      '   SALDOORCADOANT'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (EXERCICIO = :EXERCICIO)'
      '')
    Left = 264
    Top = 497
  end
  object sqlFormula: TCMSqlParams
    Left = 264
    Top = 429
  end
  object sqlAcumulado3MC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0 AS REAL,'
      '   SUM(VLRORCCENARIO) AS ORC'
      'FROM'
      '   VALORESCENARIO'
      'WHERE'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (EXERCICIO =:EXERCICIO) AND'
      '   ((PERIODO <=:PERIODO) OR (PERIODO IS NULL)) AND'
      '   (IDCENARIOORCAMEN =:IDCENARIOORCAMEN)'
      ' ')
    Left = 264
    Top = 362
  end
  object sqlAcumulado3M: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   SUM(VLRREALACUM) AS REAL,'
      '   SUM(VLRORCACUM) AS ORC'
      'FROM'
      '   SALDOORCADO'
      'WHERE'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (TO_CHAR(DATAREFERENCIA,'#39'YYYYMM'#39')=:DATAREFERENCIA)')
    Left = 264
    Top = 294
  end
  object sqlAcumulado3: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   SUM(VLRREALACUM) AS REAL,'
      '   SUM(VLRORCACUM) AS ORC'
      'FROM'
      '   SALDOORCADO'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (DATAREFERENCIA=:DATAREFERENCIA) ')
    Left = 264
    Top = 227
  end
  object sqlCompContas: TCMSqlParams
    Left = 408
    Top = 24
  end
  object sqlAcumulado2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRREALIZADO) AS REAL,'
      '   SUM(VLRORCADO) AS ORC'
      'FROM'
      '   SALDOORCADO'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (DATAREFERENCIA=:DATAREFERENCIA) '
      ' ')
    Left = 408
    Top = 92
  end
  object sqlAcumulado2M: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(VLRREALIZADO) AS REAL,'
      '   SUM(VLRORCADO) AS ORC'
      'FROM'
      '   SALDOORCADO'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (TO_CHAR(DATAREFERENCIA,'#39'YYYYMM'#39')=:DATAREFERENCIA)')
    Left = 408
    Top = 159
  end
  object sqlAcumulado2MC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   0 AS REAL,'
      '   SUM(VLRORCCENARIO) AS ORC'
      'FROM'
      '   VALORESCENARIO'
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND'
      '   (EXERCICIO = :EXERCICIO) AND'
      '   (PERIODO  = :PERIODO)'
      ' '
      ' '
      ' ')
    Left = 408
    Top = 227
  end
  object sqlContas: TCMSqlParams
    SQL.Strings = (
      'SELECT                                            '
      '   IDPLANOORCAMEN, IDCONTAORCAMEN, FLGSINALCONTA, '
      '   FLGINFDIAMES, FORMULAORCADO, FORMULAREALIZADO, '
      '   IDDATAVIEW, ORIGEMCMDV, FLGACUMULADO, FLGATIVA '
      'FROM CONTASORCAMEN                                '
      'WHERE (1 = 2)')
    Left = 408
    Top = 497
  end
  object sqlGenericos: TCMSqlParams
    Left = 408
    Top = 429
  end
  object sqlFlagCalculo: TCMSqlParams
    Left = 408
    Top = 362
  end
  object sqlLancOrc: TCMSqlParams
    Left = 408
    Top = 294
  end
end
