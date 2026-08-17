object dtmCadContasOrcamen: TdtmCadContasOrcamen
  OldCreateOrder = False
  Left = 26
  Top = 145
  Height = 578
  Width = 894
  object qryAuxContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PLANO'
      'FROM'
      '  PARAMCONTAB'
      'WHERE'
      '  IDPESSOA =:IDPESSOA ')
    Left = 340
    Top = 161
  end
  object QryDataView: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   NAME, IDDATAVIEW, CLASSNAME, ORIGEMCMDV, TEMPLATE'
      'FROM'
      '   CM.DATAVIEW'
      'WHERE'
      '   (IDDATAVIEW =:IDDATAVIEW) AND'
      '   (ORIGEMCMDV = '#39'0'#39')'
      ' ')
    Left = 135
    Top = 9
  end
  object QryDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.PLANO,'
      '  C.PLACONTA,'
      '  C.UNIDNEGOC,'
      '  C.CODCENTROCUSTO,'
      '  C.IDPLANOPREV,'
      '  C.IDPATRO,'
      '  C.IDEMPRESA,'
      '  C.IDPESSOA,'
      '  C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN,'
      '  C.IDCOMPCONTASORC,'
      '  P.PLANOME,'
      '  CC.NOME AS NOMECC,'
      '  U.NOME  AS NOMEAP,'
      '  PP.NOME AS NOMEPLANO,'
      '  PT.NOME AS NOMEPATRO,'
      '  U.UNECODIGO,'
      '  PC.DESCPLANO'
      'FROM COMPCONTASORCAMEN C, PLANOCONTA P,'
      '     CENTCUST CC, UNIDNEGOCIO U,'
      '     PLANPREV PP,PESSOA PT, PLANO PC'
      'WHERE (C.IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (C.IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (C.PLACONTA IS NOT NULL)'
      '  AND (C.PLANO = PC.PLANO(+))'
      '  AND (C.PLACONTA = P.PLACONTA(+))'
      '  AND (C.PLANO    = P.PLANO(+))'
      '  AND (C.UNIDNEGOC = U.UNIDNEGOC(+))'
      '  AND (C.IDPESSOA  = U.IDPESSOA(+))'
      '  AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (C.IDEMPRESA  = CC.IDEMPRESA(+))'
      '  AND (C.IDPATRO = PT.IDPESSOA(+))'
      '  AND (C.IDPLANOPREV = PP.IDPLANOPREV(+))'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 340
    Top = 84
  end
  object qryDetContaOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT C.IDCONTAREFORCADO, C.PERCCONTAREFORC, C.IDCONTAORCAMEN,'
      '       C.IDPLANOORCAMEN, C.IDCOMPCONTASORC, CO.NOMECONTAORCAMEN'
      'FROM COMPCONTASORCAMEN C, CONTASORCAMEN CO'
      'WHERE (C.IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (C.IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (C.IDCONTAREFORCADO IS NOT NULL)'
      '  AND (C.IDCONTAREFORCADO = CO.IDCONTAORCAMEN(+))'
      '  AND (C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN(+))'
      ' '
      ' ')
    Left = 32
    Top = 161
  end
  object qryDetContaRea: TCMSqlParams
    SQL.Strings = (
      'SELECT C.IDCONTAREFREAL, C.PERCCONTAREFREA, C.IDCONTAORCAMEN,'
      '       C.IDPLANOORCAMEN, C.IDCOMPCONTASORC, CO.NOMECONTAORCAMEN'
      'FROM COMPCONTASORCAMEN C, CONTASORCAMEN CO'
      'WHERE (C.IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (C.IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (C.IDCONTAREFREAL IS NOT NULL)'
      '  AND (C.IDCONTAREFREAL = CO.IDCONTAORCAMEN(+))'
      '  AND (C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN(+))'
      ' ')
    Left = 32
    Top = 84
  end
  object qryDetCond: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCONTACONDINI,'
      '  IDCONTACONDFIM,'
      '  IDCONTACONDRES,'
      '  CONDICAO,'
      '  TIPOCONDINI,'
      '  TIPOCONDRES,'
      '  VLRCONDINI,'
      '  VLRCONDRES,'
      '  IDCONTAORCAMEN,'
      '  IDPLANOORCAMEN,'
      '  IDCOMPCONTASORC,'
      
        '  '#39'                                                             ' +
        '                                                                ' +
        '     '#39'    AS CondDescricao'
      'FROM'
      '  COMPCONTASORCAMEN'
      'WHERE'
      '  IDPLANOORCAMEN = :IDPLANOORCAMEN AND'
      '  IDCONTAORCAMEN = :IDCONTAORCAMEN AND'
      '  IDCONTACONDINI IS NOT NULL'
      ' '
      ' ')
    Left = 32
    Top = 239
  end
  object qryDetFluxo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.CODTIPRECDES,'
      '  C.RECPAG,'
      '  C.CODCENTRORESPON,'
      '  C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN,'
      '  C.IDPLANOPREV,'
      '  C.IDPATRO,'
      '  C.IDCOMPCONTASORC,'
      '  C.UNIDNEGOC,'
      '  C.IDPESSOA,'
      '  C.IDEMPRESA,'
      '  C.CODCENTROCUSTO,'
      '  T.DESCRICAO AS NOMETR,'
      '  CC.NOME AS NOMECC,'
      '  U.NOME AS NOMEAP,'
      '  PP.NOME AS NOMEPLANO,'
      '  PT.NOME AS NOMEPATRO,'
      '  CR.NOME AS NOMECR'
      'FROM'
      '  COMPCONTASORCAMEN C,'
      '  TIPORECEBDESEMB T,'
      '  CENTCUST CC,'
      '  UNIDNEGOCIO U,'
      '  PLANPREV PP,'
      '  PESSOA PT,'
      '  CENTRESPON CR'
      'WHERE'
      '  ( C.IDPLANOORCAMEN  = :IDPLANOORCAMEN )     AND'
      '  ( C.IDCONTAORCAMEN  = :IDCONTAORCAMEN)      AND'
      '  ( C.CODTIPRECDES    IS NOT NULL)            AND'
      '  ( C.CODTIPRECDES    = T.CODTIPRECDES(+))    AND'
      '  ( C.RECPAG          = T.RECPAG(+))          AND'
      '  ( C.IDPESSOA        = T.IDPESSOA(+))        AND'
      '  ( C.IDPESSOA        = U.IDPESSOA(+))        AND'
      '  ( C.UNIDNEGOC       = U.UNIDNEGOC(+))       AND'
      '  ( C.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND'
      '  ( C.IDEMPRESA       = CC.IDEMPRESA(+))      AND'
      '  ( C.IDPATRO         = PT.IDPESSOA(+))       AND'
      '  ( C.IDPLANOPREV     = PP.IDPLANOPREV(+))    AND'
      '  ( C.IDPESSOA        = CR.IDPESSOA(+))       AND'
      '  ( C.CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      ' ')
    Left = 32
    Top = 311
  end
  object qryGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPOORCAMEN, NOMEGRUPOORCAMEN, '
      '   FLGANALSINT, CODGRUPOORC, FLGSINALGRUPO'
      'FROM'
      '   GRUPOORCAMEN'
      'WHERE'
      '  (RTRIM(CODGRUPOORC) = :CODGRUPOORC)')
    Left = 340
    Top = 9
  end
  object qryCenRespConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTRORESPON, NOME'
      'FROM '
      '   CENTRESPON '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND'
      '   (ATIVO = '#39'S'#39')'
      'ORDER BY '
      '  NOME')
    Left = 443
    Top = 239
  end
  object qryContasOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, NOMECONTAORCAMEN'
      'FROM '
      '   CONTASORCAMEN '
      'WHERE'
      '   IDPLANOORCAMEN = :IDPLANOORCAMEN'
      'ORDER BY'
      '   NOMECONTAORCAMEN')
    Left = 340
    Top = 311
  end
  object qryContaCondIni: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, NOMECONTAORCAMEN'
      'FROM '
      '   CONTASORCAMEN '
      'WHERE'
      '   IDPLANOORCAMEN =:IDPLANOORCAMEN'
      'ORDER BY'
      '   NOMECONTAORCAMEN')
    Left = 340
    Top = 239
  end
  object qryContaCondFim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, NOMECONTAORCAMEN'
      'FROM '
      '   CONTASORCAMEN '
      'WHERE'
      '   IDPLANOORCAMEN =:IDPLANOORCAMEN'
      'ORDER BY'
      '   NOMECONTAORCAMEN')
    Left = 443
    Top = 9
  end
  object qryContaCondRes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, NOMECONTAORCAMEN'
      'FROM '
      '   CONTASORCAMEN '
      'WHERE'
      '   IDPLANOORCAMEN =:IDPLANOORCAMEN'
      'ORDER BY'
      '   NOMECONTAORCAMEN')
    Left = 135
    Top = 84
  end
  object qryTipoRD: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM '
      '   TIPORECEBDESEMB '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY'
      '   RECPAG,CODTIPRECDES')
    Left = 443
    Top = 84
  end
  object qryUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC, NOME, UNECODIGO, UNETIPO'
      'FROM  '
      '   UNIDNEGOCIO '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY'
      '   NOME')
    Left = 135
    Top = 161
  end
  object qryUnidNegocConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC, NOME, UNETIPO'
      'FROM  '
      '   UNIDNEGOCIO '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY'
      '   NOME')
    Left = 443
    Top = 161
  end
  object qryCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTRORESPON, NOME'
      'FROM '
      '   CENTRESPON '
      'WHERE'
      '         (IDPESSOA =:IDPESSOA)'
      'AND (ATIVO = '#39'S'#39')'
      'ORDER BY'
      '   NOME')
    Left = 135
    Top = 239
  end
  object qryCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, NOME'
      'FROM '
      '   CENTCUST '
      'WHERE'
      '   IDEMPRESA =:IDEMPRESA AND '
      '   ATIVO = '#39'S'#39' '
      'ORDER BY'
      '   NOME')
    Left = 545
    Top = 161
  end
  object qryCCustoConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, NOME'
      'FROM '
      '   CENTCUST '
      'WHERE'
      '   IDEMPRESA =:IDEMPRESA AND '
      '   ATIVO = '#39'S'#39' '
      'ORDER BY'
      '   NOME')
    Left = 135
    Top = 311
  end
  object qryCCustoFluxo: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, NOME'
      'FROM '
      '   CENTCUST '
      'WHERE'
      '   IDEMPRESA =:IDEMPRESA AND '
      '   ATIVO <> '#39'N'#39' '
      'ORDER BY'
      '   NOME')
    Left = 545
    Top = 239
  end
  object qryGrupoAux: TCMSqlParams
    Left = 545
    Top = 9
  end
  object qryAux: TCMSqlParams
    Left = 443
    Top = 311
  end
  object Parser: TParser
    Left = 648
    Top = 311
  end
  object QryTestaComposicao: TCMSqlParams
    Left = 237
    Top = 9
  end
  object qryPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME')
    Left = 237
    Top = 84
  end
  object qryPlanoPrevConta: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME '
      '')
    Left = 545
    Top = 84
  end
  object qryPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    Left = 237
    Top = 161
  end
  object qryTodoDet: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM COMPCONTASORCAMEN'
      'WHERE (IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (IDPLANOORCAMEN = :IDPLANOORCAMEN)')
    Left = 237
    Top = 239
  end
  object qryPatroConta: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    Left = 237
    Top = 311
  end
  object qryPlanoContabil: TCMSqlParams
    SQL.Strings = (
      'SELECT PLANO, DESCPLANO, MASCARA'
      'FROM PLANO'
      'ORDER BY DESCPLANO')
    Left = 648
    Top = 84
  end
  object qryContasRef: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN'
      'FROM CONTASORCAMEN'
      'WHERE (1=2)')
    Left = 648
    Top = 161
  end
  object qryMovOrcamento: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM SALDOORCADO '
      'WHERE (IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (IDPLANOORCAMEN = :IDPLANOORCAMEN)')
    Left = 648
    Top = 239
  end
  object qryContaContab: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   PLACONTA, PLANOME '
      'FROM '
      '   PLANOCONTA'
      'WHERE'
      '   ( PLANO =:PLANO )'
      '   AND'
      '   ( RTRIM(PLACONTA) =:PLACONTA )')
    Left = 545
    Top = 311
  end
  object qryContaContabil: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   PLANOME,PLACONTA,PLATIPO,PLACCUST,PLASUBCONTA'
      'FROM  '
      '   PLANOCONTA '
      'WHERE'
      '   PLANO =:PL  AND '
      '   PLAINATIVA = '#39'A'#39
      'ORDER BY'
      '   PLACONTA')
    Left = 648
    Top = 9
  end
  object Qry: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.IDCONTAORCAMEN,'
      '  C.IDPLANOORCAMEN,'
      '  C.IDGRUPOORCAMEN,'
      '  C.NOMECONTAORCAMEN,'
      '  C.TIPOCALCREALIZADO,'
      '  C.TIPOCALCORCADO,'
      '  C.FORMULAREALIZADO,'
      '  C.FORMULAORCADO,'
      '  C.OBSERVACAO,'
      '  C.VLRINFORMADOREAL,'
      '  C.VLRINFORMADOORC,'
      '  C.FLGCONTAMONETARIA,'
      '  C.IDPESSOA,'
      '  C.FLGSINALCONTA,'
      '  C.FLGCALCORCADO,'
      '  C.FLGCALCREAL,'
      '  C.CODCENTRORESPON,'
      '  C.FLGINFDIAMES,'
      '  C.ORIGEMCMDV,'
      '  C.IDDATAVIEW,'
      '  C.FLGACUMULADO,'
      '  C.FLGTRANSFSALDO,'
      '  C.FLGATIVA,'
      '  C.DATAATIVA,'
      '  C.DATAINATIVA,'
      '  G.CODGRUPOORC,'
      '  C.CODCENTROCUSTO,'
      '  C.IDEMPRESA,'
      '  C.UNIDNEGOC,'
      '  C.IDPATRO,'
      '  C.IDPLANOPREV,'
      
        '  '#39'                                                             ' +
        '              '#39' As DESCGRUPO'
      'FROM'
      '  CONTASORCAMEN C,'
      '  GRUPOORCAMEN G'
      'WHERE'
      '  C.IDPLANOORCAMEN = :IDPLANOORCAMEN AND'
      '  C.IDCONTAORCAMEN = :IDCONTAORCAMEN AND'
      '  C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN'
      ' '
      ' '
      ' ')
    Left = 32
    Top = 9
  end
end
