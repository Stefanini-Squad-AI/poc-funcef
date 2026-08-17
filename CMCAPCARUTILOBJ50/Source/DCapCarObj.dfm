object DtmCapCarObj: TDtmCapCarObj
  OldCreateOrder = False
  Left = 21
  Top = 83
  Height = 406
  Width = 776
  object SqlLancEstornoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  L.DEBCRE, L.PLNCODIGO,R.CODLANCFINANC, L.VALOR, L.VALOROUTRAMO' +
        'EDA,'
      
        '  L.NUMLANCTO, L.OPERACAO, L.HISTORICOCOMPL, R.CODPORTFORMA, R.N' +
        'UMLOTE,'
      
        '  R.NUMCHQBORDERO, L.CODALTERADOR, L.ESTORNO, D.OPERACAO AS OPER' +
        'ACAO_DOC'
      'FROM'
      '  LANCTODOCUM L,RECBTOPAGTO R, DOCUMENTO D'
      'WHERE'
      '  L.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  L.CODDOCUMENTO = D.CODDOCUMENTO AND'
      '  ((L.ESTORNO = 0) OR (L.ESTORNO IS NULL)) AND'
      '  L.CODDOCUMENTO = R.CODDOCUMENTO(+) AND'
      '  L.NUMLANCTO = R.NUMLANCTO(+)')
    ClientDataSet = CdsLancEstorno
    Left = 44
    Top = 56
  end
  object CdsLancEstorno: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 8
  end
  object SqlLancEstornoLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  L.DEBCRE, L.PLNCODIGO,R.CODLANCFINANC, L.VALOR, L.VALOROUTRAMO' +
        'EDA,'
      
        '  L.NUMLANCTO, L.OPERACAO, L.HISTORICOCOMPL, R.CODPORTFORMA, R.N' +
        'UMLOTE,'
      '  R.NUMCHQBORDERO, L.CODALTERADOR, L.ESTORNO'
      'FROM'
      '  LANCTODOCUM L,RECBTOPAGTO R'
      'WHERE'
      '  L.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  L.NUMLANCTO = :NUMLANCTO AND'
      '  L.CODDOCUMENTO = R.CODDOCUMENTO(+) AND'
      '  L.NUMLANCTO = R.NUMLANCTO(+) ')
    ClientDataSet = CdsLancEstorno
    Left = 44
    Top = 104
  end
  object SQLEstornoFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODLANCFINANC,PLNCODIGO,IDMODULO,HISTPADFINAN,MOECODIGO,'
      '   IDUSUARIOINCLUSAO,CODPORTADOR,VALORLANCFINAN,NUMCHQBORDERO,'
      '   DATALANCFINAN,DATACONCILIACAO,ENTRADASAIDA,HISTORICO,'
      '   STATUSCONCILIA,VALOROUTRAMOEDA,IDPESSOA,CODLANCTRANSF'
      'FROM'
      '   MOVIMFINANC'
      'WHERE'
      '   CODLANCFINANC = :CODLANCFINANC')
    ClientDataSet = CdsEstornoFinanc
    Left = 116
    Top = 56
  end
  object CdsEstornoFinanc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 116
    Top = 8
  end
  object SQLRateioFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, CODLANCFINANC, UNIDNEGOC, CODTIPRECDES,'
      '  RECPAG, CODCENTRORESPON, MOECODIGO, VALOR, VALOROUTRAMOEDA,'
      '  IDPROGRAMA, IDPLANOPREV, IDPATRO, CODTIPDOC,'
      '  IDSEGREGACRITER'
      'FROM'
      '  RATEIOFINANC'
      'WHERE'
      '  CODLANCFINANC = :CODLANCFINANC'
      ''
      ' ')
    ClientDataSet = CdsRateioFinanc
    Left = 180
    Top = 55
  end
  object CdsRateioFinanc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 180
    Top = 8
  end
  object SQLUpdLancEstorno: TCMSqlParams
    SQL.Strings = (
      'UPDATE'
      '  LANCTODOCUM SET ESTORNO = :ESTORNO'
      'WHERE'
      '  CODDOCUMENTO =  :CODDOCUMENTO AND NUMLANCTO = :NUMLANCTO')
    Left = 116
    Top = 104
  end
  object SQLNumDiasVencto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NUMDIASVENCTO'
      'FROM'
      '  PARAMCAP'
      'WHERE'
      '  IDPESSOA = :IDPESSOA AND'
      '  RECPAG = :RECPAG')
    Left = 48
    Top = 152
  end
  object SQLOperFuncDiasVencto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   OPERFUNC.IDOPERFUNC'
      'FROM'
      '   OBJETO, FROBFNOP, FORM, OPERFUNC'
      'WHERE'
      '   (UPPER(OBJETO.NOMEOBJETO) = '#39'LBLMESMADATA'#39') AND'
      '   (OPERFUNC.IDMODULO = :IDMODULO) AND'
      '   (FROBFNOP.IDFORM = FORM.IDFORM) AND'
      '   (FROBFNOP.IDOPERFUNC = OPERFUNC.IDOPERFUNC) AND'
      '   (OBJETO.IDOBJETO = FROBFNOP.IDOBJETO)'
      '')
    Left = 120
    Top = 152
  end
  object SQLAutorizaDiasVencto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   AUTORIZA.IDOPERFUNC'
      'FROM'
      '   AUTORIZA'
      'WHERE'
      '   (AUTORIZA.IDPESSOA = :IDPESSOA) AND'
      '   (AUTORIZA.IDOPERFUNC = :IDOPERFUNC) AND'
      '   ((AUTORIZA.IDESPACESSO = :IDESPACESSO) OR'
      '    (AUTORIZA.IDESPACESSO IN'
      '       (SELECT'
      '           GRUPOACESSO.IDESPACESSO'
      '        FROM'
      '           GRUPOACESSO, GRUPOUSU'
      '        WHERE'
      '           GRUPOUSU.IDUSUARIO = :IDUSUARIO AND'
      '           GRUPOACESSO.IDGRUPO = GRUPOUSU.IDGRUPO)))')
    Left = 180
    Top = 102
  end
  object SQLNumApGr: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NUMAPGR'
      'FROM'
      '  DOCUMENTO'
      'WHERE'
      '  NUMAPGR = :NUMAPGR AND'
      '  CODDOCUMENTO <> :CODDOCUMENTO AND'
      '  OPERACAO <> '#39'1'#39' AND '
      '  STATUS <> '#39'2'#39
      '')
    Left = 256
    Top = 104
  end
  object SQLBuscaContaAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PLACONTA'
      'FROM'
      '   ALTXCCXPRGXCONTA'
      'WHERE'
      '   CODALTERADOR = :CODALTERADOR AND'
      '   RTRIM(CODCENTROCUSTO) = RTRIM(:CODCENTROCUSTO) AND'
      '   IDEMPRESA = :IDEMPRESA AND'
      '   DECODE(IDPROGRAMA,NULL,0,IDPROGRAMA) = :IDPROGRAMA'
      ' ')
    ClientDataSet = CdsBuscaContaAlt
    Left = 398
    Top = 59
  end
  object SQLSubContaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODSUBCONTA'
      'FROM'
      '  DOCUMENTO'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO')
    ClientDataSet = CdsSubContaDoc
    Left = 328
    Top = 59
  end
  object SQLTestaSubConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  PLASUBCONTA '
      'FROM '
      '  PLANOCONTA '
      'WHERE '
      '  PLANO = :PLANO AND '
      '  PLACONTA = :PLACONTA'
      '')
    ClientDataSet = CdsTestaSubConta
    Left = 256
    Top = 56
  end
  object CdsTestaSubConta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 8
  end
  object CdsSubContaDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 8
  end
  object CdsBuscaContaAlt: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 396
    Top = 8
  end
  object SqlBuscaParamBaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.CODDOCUMENTO,'
      '   L.NUMLANCTO,'
      '   L.DATALANCTO,'
      '   P.DESCRICAO'
      'FROM'
      '   LANCTODOCUM L,'
      '   RECBTOPAGTO R,'
      '   PORTADORFORMA P'
      'WHERE'
      '   (L.CODDOCUMENTO = :CODDOCUMENTO) AND'
      
        '   ((RTRIM(L.OPERACAO) = '#39'5'#39') OR ((RTRIM(L.OPERACAO) = '#39'15'#39') AND' +
        ' (FLGLANCBAIXAADTO IS NULL OR FLGLANCBAIXAADTO <> '#39'S'#39'))) AND'
      '   (L.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (L.NUMLANCTO = R.NUMLANCTO) AND'
      '   (P.CODPORTFORMA(+) = R.CODPORTFORMA)'
      ''
      '')
    ClientDataSet = CdsBuscaParamBaixa
    Left = 46
    Top = 259
  end
  object CdsBuscaParamBaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 44
    Top = 208
  end
  object SqlParamDocs: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.DATALANCTO,'
      '  L.ESTORNO,'
      '  L.PLNCODIGO,'
      '  D.OPERACAO,'
      '  D.NUMFATURA,'
      '  D.IDPESSOA'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '  D.OPERACAO = L.OPERACAO'
      ' '
      ''
      ' ')
    ClientDataSet = CdsParamDocs
    Left = 118
    Top = 259
  end
  object CdsParamDocs: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 116
    Top = 208
  end
  object SqlDadosDelImpLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.CODDOCUMENTO,'
      '  L.NUMLANCTO,'
      '  L.PLNCODIGO,'
      '  L.OPERACAO AS OPERLANC,'
      '  D.OPERACAO AS OPERDOC,'
      '  L.ESTORNO,'
      '  D.IDPESSOA'
      'FROM'
      '  LANCTODOCUM L, DOCUMENTO D'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (RTRIM(D.OPERACAO) <> '#39'5'#39') AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ' ')
    ClientDataSet = CdsDadosDelImpLanc
    Left = 180
    Top = 259
  end
  object CdsDadosDelImpLanc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 180
    Top = 212
  end
  object SQLDadosDelOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   R.IDRESERVAORCAMEN, '
      '   O.NUMRESERVA, '
      '   R.VLRRESORCAMEN '
      'FROM '
      '   RATEIODOCUM R, RESERVAORCAMEN O'
      'WHERE '
      '   R.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   R.IDRESERVAORCAMEN = O.IDRESERVAORCAMEN')
    ClientDataSet = CdsDadosDelOrc
    Left = 262
    Top = 259
  end
  object CdsDadosDelOrc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 260
    Top = 208
  end
  object SqlDadosDelLote: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    L.FLAGCANCEL, L.NUMLOTE, LE.ESTORNO'
      'FROM '
      '    LOTEPAGTO L, '
      '    LOTEXDOCUM LX, (SELECT'
      '                   L.NUMLANCTO,'
      '                   L.ESTORNO,'
      '                   R.NUMLOTE,'
      '                   R.CODDOCUMENTO '
      '                 FROM LANCTODOCUM L, RECBTOPAGTO R'
      '                 WHERE L.NUMLANCTO         = R.NUMLANCTO'
      '                   AND L.CODDOCUMENTO      = R.CODDOCUMENTO'
      '                   AND L.ESTORNO IS NOT NULL) LE'
      'WHERE '
      '  L.NUMLOTE = LX.NUMLOTE AND'
      '  LX.CODDOCUMENTO = :CODDOCUMENTO AND'
      ' LX.CODDOCUMENTO = LE.CODDOCUMENTO(+) AND'
      ' LX.NUMLOTE = LE.NUMLOTE(+)'
      ''
      ''
      '/* '
      'SELECT '
      '  L.FLAGCANCEL, L.NUMLOTE'
      'FROM '
      '  LOTEPAGTO L, '
      '  LOTEXDOCUM LX '
      'WHERE '
      '  L.NUMLOTE = LX.NUMLOTE AND'
      '  LX.CODDOCUMENTO = CODDOCUMENTO'
      '*/')
    ClientDataSet = CdsDadosDelLote
    Left = 318
    Top = 259
  end
  object CdsDadosDelLote: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 316
    Top = 208
  end
  object SqlSelLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.CODDOCUMENTO,'
      '  L.NUMLANCTO,'
      '  L.PLNCODIGO,'
      '  L.OPERACAO AS OPERLANC,'
      '  D.OPERACAO AS OPERDOC,'
      '  L.ESTORNO'
      'FROM'
      '  LANCTODOCUM L, DOCUMENTO D'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (L.NUMLANCTO = :NUMLANCTO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO)')
    ClientDataSet = CdsSelLanc
    Left = 374
    Top = 259
  end
  object CdsSelLanc: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 372
    Top = 208
  end
  object SQLContabAltBaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     LC.CODDOCUMENTO,'
      '     LC.CODALTERADOR,'
      '     LC.ESTORNO,'
      '     LC.PLNCODIGO,'
      '     LC.NUMLANCTO,'
      '     A.DESCRICAO,'
      '     LC.DATALANCTO,'
      '     LC.VALOROUTRAMOEDA,'
      '     LC.VALOR,'
      '     LC.HISTORICOCOMPL,'
      '     LC.DEBCRE,'
      
        '     RTRIM(TO_CHAR(D.NODOCUMENTO)) || '#39' '#39' || D.COMPLDOCUMENTO AS' +
        ' DOCCOMPL,'
      '     D.DATAPROGRAMADA,'
      '     P.RAZAOSOCIAL,'
      '     D.MOECODIGO,'
      '     D.PLACONTA,'
      '     D.PLANO,   --TAVARES'
      '     D.CODCENTROCUSTO,'
      '     D.CODSUBCONTA,'
      '     LC.VLRLIQUIDO,'
      '     LC.UNIDNEGOC,'
      '     D.IDPESSOA'
      'FROM'
      '     LANCTODOCUM LC,'
      '     TIPOALTERADOR A,'
      '     DOCUMENTO D,'
      '     PESSOA P'
      'WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (LC.CODALTERADOR = A.CODALTERADOR) AND'
      '     (D.CODDOCUMENTO = LC.CODDOCUMENTO) AND'
      '     (D.IDFORCLI = P.IDPESSOA) AND'
      '     (A.FLGCONTABNABAIXA = '#39'S'#39') AND'
      '     (LC.PLNCODIGO IS NULL)'
      ''
      ''
      '')
    ClientDataSet = CdsContabAltBaixa
    Left = 470
    Top = 59
  end
  object CdsContabAltBaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 470
    Top = 8
  end
  object sqlValidaDoc: TCMSqlParams
    Left = 360
    Top = 112
  end
end
