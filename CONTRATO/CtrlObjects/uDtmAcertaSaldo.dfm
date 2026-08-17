object dtmAcertaSaldo: TdtmAcertaSaldo
  OldCreateOrder = False
  Left = 171
  Top = 375
  Height = 308
  Width = 696
  object sqlValorCorreto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, PERIODO, DATAREFERE' +
        'NCIA,'
      
        '  SUM(VLRRESERVA - (DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)' +
        ') -'
      '  (DECODE(VLRDEVOLVIDO,NULL,0,VLRDEVOLVIDO))) AS VALOR'
      'FROM'
      '  RESERVAORCAMEN'
      'WHERE'
      
        '  (FLGRESERVA = '#39'A'#39') AND (FLGRESCOMP = :RESCOMP) AND (IDPESSOA =' +
        ' :IDPESSOA) AND'
      '  (IDCONTAORCAMEN IS NOT NULL)'
      'GROUP BY'
      
        '  IDPLANOORCAMEN, IDCONTAORCAMEN, EXERCICIO, PERIODO, DATAREFERE' +
        'NCIA'
      ' ')
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
    Left = 275
    Top = 149
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
