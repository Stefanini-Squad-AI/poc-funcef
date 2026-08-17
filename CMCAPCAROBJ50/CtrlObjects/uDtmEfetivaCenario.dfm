object dtmEfetivaCenario: TdtmEfetivaCenario
  OldCreateOrder = False
  Left = 120
  Top = 177
  Height = 480
  Width = 696
  object sqlPeriodoFim: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '  PERIODO, NOMEPERIODO'
      'FROM '
      '  PERIODOORCAMEN'
      'WHERE'
      '  (IDPESSOA =:IDPESSOA) AND (EXERCICIO=:EXERCICIO)'
      'ORDER BY'
      '  PERIODO')
    Left = 40
    Top = 128
  end
  object sqlPeriodoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '  PERIODO, NOMEPERIODO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (IDPESSOA =:IDPESSOA) AND (EXERCICIO=:EXERCICIO)'
      'ORDER BY'
      '  PERIODO')
    Left = 160
    Top = 128
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCENARIOORCAMEN, NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN'
      'ORDER BY'
      '  NOMECENARIO')
    Left = 400
    Top = 16
  end
  object sqlTestaOrcAnt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO'
      'FROM'
      '  SALDOORCADOANT'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND (IDPLANOORCAMEN = :IDPLANOORCAMEN) ' +
        'AND'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (EXERCICIO = :EXERCICIO' +
        ')'
      '')
    Left = 400
    Top = 72
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE'
      '  (EXERCICIO = :EXERCICIO) AND (IDPESSOA = :PESSOA)'
      'ORDER BY'
      '  PERIODO')
    Left = 280
    Top = 16
  end
  object sqlSaldoCenarioAnt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  V.EXERCICIO, V.PERIODO, V.IDCONTAORCAMEN, V.IDPLANOORCAMEN, V.' +
        'VLRORCCENARIO,'
      '  V.IDPESSOA'
      'FROM'
      '  VALORESCENARIO V'
      'WHERE'
      '  (V.IDPESSOA = :IDPESSOA) AND (V.EXERCICIO = :EXERCICIO) AND '
      
        '  (V.PERIODO IS NULL) AND (V.IDCENARIOORCAMEN = :IDCENARIOORCAME' +
        'N)'
      '')
    Left = 280
    Top = 72
  end
  object sqlOrcadoAnt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN,'
      '  ROUND(SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)),2) AS VLRORCADO'
      'FROM'
      '  SALDOORCADOANT'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (EXERCICIO = :EXERCICIO)'
      'GROUP BY'
      '  EXERCICIO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN'
      'HAVING'
      '  ROUND(SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)),2) <> 0'
      ' ')
    Left = 160
    Top = 72
  end
  object sqlOrcado: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO, PERIODO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN,'
      '  ROUND(SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)),2) AS VLRORCADO'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (PERIODO  >= :PERIODOINI) AND '
      '  (PERIODO  <= :PERIODOFIM) AND (EXERCICIO = :EXERCICIO)'
      'GROUP BY'
      '  EXERCICIO, PERIODO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN'
      'HAVING'
      '  ROUND(SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)),2) <> 0')
    Left = 160
    Top = 16
  end
  object sqlTestaOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND (IDPLANOORCAMEN = :IDPLANOORCAMEN) ' +
        'AND'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (DATAREFERENCIA = :DATA' +
        'REFERENCIA)'
      '')
    Left = 40
    Top = 16
  end
  object sqlSaldoCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  V.EXERCICIO, V.PERIODO, V.IDCONTAORCAMEN, V.IDPLANOORCAMEN,  V' +
        '.VLRORCCENARIO,'
      '  V.IDPESSOA, P.DATAFIMPERIODO'
      'FROM'
      '  VALORESCENARIO V, PERIODOORCAMEN P'
      'WHERE'
      '  (V.IDPESSOA = :IDPESSOA) AND (V.EXERCICIO = :EXERCICIO) AND'
      
        '  (V.PERIODO  >= :PERIODOINI) AND (V.PERIODO  <= :PERIODOFIM) AN' +
        'D'
      
        '  (V.IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND (V.IDPESSOA = P.I' +
        'DPESSOA) AND'
      '  (V.EXERCICIO = P.EXERCICIO) AND (V.PERIODO = P.PERIODO)'
      '')
    Left = 40
    Top = 72
  end
end
