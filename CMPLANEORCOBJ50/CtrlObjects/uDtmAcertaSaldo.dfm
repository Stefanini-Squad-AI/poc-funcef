object dtmAcertaSaldo: TdtmAcertaSaldo
  OldCreateOrder = False
  Left = 171
  Top = 375
  Height = 308
  Width = 696
  object sqlValorCorreto: TCMSqlParams
    SQL.Strings = (
      'SELECT  U.EXERCICIO,U.IDPLANOORCAMEN,U.FLGRESCOMP,'
      '        U.IDCONTAORCAMEN,U.PERIODO,U.DATAREFERENCIA,'
      '        SUM(U.VLRCOMPROMISSO) AS VLRCOMPROMISSO,'
      '        SUM(U.VLRRESERVA) AS VLRRESERVA'
      ' FROM (SELECT EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '              IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP,'
      '              SUM(NVL(VLRCOMPROMISSO,0)) AS VLRCOMPROMISSO,'
      '              0 AS VLRRESERVA'
      '       FROM RESERVAORCAMEN'
      '       WHERE ( IDPLANOORCAMEN = :IDPLANO ) AND'
      
        '             ( (:IDCONTA IS NULL OR IDCONTAORCAMEN = :IDCONTA) )' +
        ' AND'
      '             (IDPESSOA       = :IDPESSOA) AND'
      '             (FLGRESERVA <> '#39'C'#39')'
      '       GROUP BY EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '                IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP'
      ''
      '       UNION ALL'
      '       SELECT EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '              IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP,'
      ''
      
        ' SUM(NVL(VLRRESERVA,0)-NVL(VLRCOMPROMISSO,0)-NVL(VLRDEVOLVIDO,0)' +
        ') AS'
      ' VLRCOMPROMISSO,'
      '              0 AS VLRRESERVA'
      '       FROM RESERVAORCAMEN'
      '       WHERE (IDPLANOORCAMEN = :IDPLANO) AND'
      
        '             ( (:IDCONTA IS NULL OR IDCONTAORCAMEN = :IDCONTA) )' +
        ' AND'
      '             (IDPESSOA       = :IDPESSOA) AND'
      '             (FLGRESERVA IN ('#39'A'#39','#39'U'#39')) AND'
      '             (FLGRESCOMP = '#39'C'#39')'
      '       GROUP BY EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '                IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP'
      ''
      '       UNION ALL'
      '       SELECT EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '              IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP,'
      '              0 AS  VLRCOMPROMISSO,'
      ''
      
        ' SUM(NVL(VLRRESERVA,0)-NVL(VLRCOMPROMISSO,0)-NVL(VLRDEVOLVIDO,0)' +
        ') AS'
      ' VLRRESERVA'
      '       FROM RESERVAORCAMEN'
      '       WHERE (IDPLANOORCAMEN = :IDPLANO) AND'
      
        '             ( (:IDCONTA IS NULL OR IDCONTAORCAMEN = :IDCONTA) )' +
        ' AND'
      '             (IDPESSOA       = :IDPESSOA) AND'
      '             (FLGRESERVA IN ('#39'A'#39','#39'U'#39')) AND'
      '             (FLGRESCOMP = '#39'R'#39')'
      '       GROUP BY EXERCICIO,PERIODO,IDPLANOORCAMEN,'
      '                IDCONTAORCAMEN,DATAREFERENCIA,FLGRESCOMP ) U'
      ' GROUP BY U.EXERCICIO,U.PERIODO,U.IDPLANOORCAMEN,'
      '          U.IDCONTAORCAMEN,U.DATAREFERENCIA,U.FLGRESCOMP'
      '        '
      ''
      ' '
      ''
      ''
      ' '
      ' '
      '')
    ClientDataSet = cdsValorCorreto
    Left = 48
    Top = 16
  end
  object cdsValorCorreto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 136
    Top = 16
  end
  object cdsValorCorreto1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 80
  end
  object cdsContaSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 299
    Top = 133
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
      ''
      ' ')
    ClientDataSet = cdsContaSaldo
    Left = 187
    Top = 141
  end
  object sqlValorCorreto1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, PERIODO, DATAREFERE' +
        'NCIA,'
      '  SUM(DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)) AS VALOR'
      'FROM'
      '  RESERVAORCAMEN'
      'WHERE'
      
        '  (FLGRESERVA = '#39'E'#39') AND (FLGRESCOMP = '#39'C'#39') AND (IDPESSOA = :IDP' +
        'ESSOA) AND'
      '  (IDCONTAORCAMEN IS NOT NULL)'
      'GROUP BY'
      
        '  IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, PERIODO, DATAREFERE' +
        'NCIA')
    ClientDataSet = cdsValorCorreto1
    Left = 184
    Top = 80
  end
end
