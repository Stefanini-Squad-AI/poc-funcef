object DtmContab: TDtmContab
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 375
  Width = 544
  object sqlMoedaCorrente: TCMSqlParams
    SQL.Strings = (
      'SELECT P.MOEDACORRENTE, M.MOESIGLA'
      'FROM PARAMGLOBAL P,'
      '     MOEDA M'
      'WHERE (P.IDPESSOA = :IDPESSOA)'
      '  AND (P.MOEDACORRENTE = M.MOECODIGO)')
    ClientDataSet = cdsMoedaCorrente
    Left = 32
    Top = 21
  end
  object cdsMoedaCorrente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 69
  end
  object sqlVerificaBloqueados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   /*+ RULE */'
      '   P.PLNCODIGO'
      'FROM'
      '   PERIODO E, PLANILHA P'
      'WHERE'
      '   (P.PEREXERCICIO=:PEREXERCICIO) AND'
      '   (P.IDPESSOA=:IDPESSOA) AND'
      '   (P.PLNEFETIVADO='#39'N'#39') AND'
      '   ((E.PERBLOQUE='#39'S'#39') OR (E.PERBLOINT='#39'S'#39')) AND'
      '   (P.PEREXERCICIO=E.PEREXERCICIO) AND'
      '   (P.IDPESSOA=E.IDPESSOA) AND'
      '   (P.PERNUMERO=E.PERNUMERO)'
      ''
      ' '
      ' ')
    ClientDataSet = cdsVerificaBloqueados
    Left = 144
    Top = 21
  end
  object cdsVerificaBloqueados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 69
  end
end
