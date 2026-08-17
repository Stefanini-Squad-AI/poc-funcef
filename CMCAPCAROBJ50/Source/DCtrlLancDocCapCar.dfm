object DtmCtrlLancDocCapCar: TDtmCtrlLancDocCapCar
  OldCreateOrder = False
  Left = 204
  Top = 150
  Height = 480
  Width = 696
  object SQLRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   R.RECPAG,'
      '   R.IDPESSOA,'
      '   R.IDRESERVAORCAMEN,'
      '   R.CODCENTRORESPON,'
      '   R.UNIDNEGOC,'
      '   R.MOECODIGO,'
      '   R.VALOR,'
      '   R.VALOROUTRAMOEDA,'
      '   t.PLACONTACREDITO,'
      '   R.IDUSUARIOINCLUSAO,'
      '   U.NOME,'
      '   C.NOME,'
      '   R.CODCENTROCUSTO,'
      '   R.IDRATEIODOCUM,'
      '   T.DESCRICAO,'
      '   I.MOESIGLA,'
      '   CC.NOME AS NOMECENTROCUSTO,'
      '   R.PLANO,'
      '   R.IDPATRO,'
      '   R.IDPROGRAMA,'
      '   R.NUMIMOVEL,'
      '   PATRO.NOME AS NOMEPATRO,'
      '   PLANO.NOME AS DESCPLANO,'
      '   PROGRAMA.DESCPROGRAMA,'
      '   T.HITCODHIST,'
      '   R.IDPLANOPREV,'
      '   RESERVAORCAMEN.NUMRESERVA,'
      '   T.FLGOBRIGARESERVA,'
      '   RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,'
      '   R.VALOR AS VALORRESERVAOLD,'
      '   R.VLRRESORCAMEN'
      'FROM'
      '   RATEIODOCUM R,'
      '   UNIDNEGOCIO U,'
      '   CENTRESPON C,'
      '   TIPORECEBDESEMB T,'
      '   MOEDA I,'
      '   CENTCUST CC,'
      '   PESSOA PATRO,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA, RESERVAORCAMEN'
      'WHERE'
      '   (R.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (T.CODTIPRECDES = R.CODTIPRECDES) AND'
      '   (T.RECPAG = R.RECPAG) AND'
      '   (T.IDPESSOA = R.IDPESSOA) AND'
      '   (U.UNIDNEGOC = R.UNIDNEGOC) AND'
      '   (U.IDPESSOA = R.IDPESSOA) AND'
      '   (I.MOECODIGO(+) = R.MOECODIGO) AND'
      '   (C.CODCENTRORESPON(+) = R.CODCENTRORESPON) AND'
      '   (CC.IDEMPRESA(+) = R.IDPESSOA) AND'
      '   (R.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'
      '   (C.IDPESSOA(+) = R.IDPESSOA) AND'
      '   (PLANO.IDPLANOPREV(+) = R.IDPLANOPREV) AND'
      '   (PROGRAMA.IDPROGRAMA(+) = R.IDPROGRAMA) AND'
      '   (PATRO.IDPESSOA(+) = R.IDPATRO) AND'
      '   (RESERVAORCAMEN.IDRESERVAORCAMEN(+) = R.IDRESERVAORCAMEN)'
      ''
      ' ')
    ClientDataSet = CdsRateio
    Left = 53
    Top = 15
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 53
    Top = 110
  end
  object SqlUpdValorCompromisso: TCMSqlParams
    SQL.Strings = (
      'UPDATE'
      '  RATEIODOCUM   '
      'SET'
      '  VLRRESORCAMEN = :VLRRESORCAMEN'
      'WHERE'
      '  IDRATEIODOCUM = :IDRATEIODOCUM')
    ClientDataSet = CdsRateio
    Left = 53
    Top = 63
  end
  object SQLDocImposto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.DATAPROGRAMADA,'
      '  D.OPERACAO,'
      '  D.IDFORCLI,'
      '  D.CODDOCUMENTO,'
      '  L.NUMLANCTO,'
      '  L.VALOR,'
      '  L.DATALANCTO,'
      '  D.DATAEMISSAO,'
      '  L.DEBCRE,'
      '  D.CODTIPDOC,'
      '  D.RECPAG,'
      '  D.IDUSUARIOINCLUSAO,'
      '  D.IDMODULO'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L'
      'WHERE'
      '  (D.NUMFATURA = :NUMFATURA) AND'
      '  (RTRIM(D.OPERACAO) = :OPERACAO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO)'
      ''
      ''
      '')
    ClientDataSet = CdsDocImposto
    Left = 117
    Top = 15
  end
  object CdsDocImposto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 117
    Top = 62
  end
end
