object dtmCopiaContaOrcamen: TdtmCopiaContaOrcamen
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qryCCustoOri: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM '
      '   CENTCUST '
      'WHERE'
      '   IDEMPRESA =:IDEMPRESA '
      'ORDER BY'
      '   NOME')
    Left = 32
    Top = 16
  end
  object qryContasOri: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, IDPLANOORCAMEN,'
      '   IDGRUPOORCAMEN, NOMECONTAORCAMEN,'
      '   TIPOCALCREALIZADO, TIPOCALCORCADO,'
      '   FORMULAREALIZADO, FORMULAORCADO,'
      '   OBSERVACAO, VLRINFORMADOREAL,'
      '   VLRINFORMADOORC, FLGCONTAMONETARIA, IDPESSOA,'
      '   FLGSINALCONTA, FLGCALCORCADO,'
      '   FLGCALCREAL, CODCENTRORESPON, FLGINFDIAMES,'
      '   IDDATAVIEW, ORIGEMCMDV, FLGACUMULADO, FLGTRANSFSALDO,'
      
        '   FLGATIVA, TO_CHAR(DATAATIVA,'#39'DD/MM/YYYY'#39') AS DATAATIVA, TO_CH' +
        'AR(DATAINATIVA,'#39'DD/MM/YYYY'#39') AS DATAINATIVA,'
      '   CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, IDPATRO, IDPLANOPREV'
      'FROM'
      '   CONTASORCAMEN'
      'WHERE'
      '   ( IDCONTAORCAMEN LIKE :IDCONTAORCAMEN) AND'
      '   ( IDCONTAORCAMEN LIKE :IDCONTAORCAMENI) AND'
      '   ( IDPLANOORCAMEN =:IDPLANOORCAMEN)'
      'ORDER BY'
      '   IDCONTAORCAMEN'
      ' ')
    Left = 32
    Top = 302
  end
  object qryBuscaContaDes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCONTAORCAMEN, IDPLANOORCAMEN, NOMECONTAORCAMEN'
      'FROM '
      '   CONTASORCAMEN'
      'WHERE'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN)')
    Left = 237
    Top = 302
  end
  object qryCCustoDes: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTROCUSTO, NOME, STATUSGRUPOCDC'
      'FROM '
      '   CENTCUST '
      'WHERE'
      '         (IDEMPRESA =:IDEMPRESA)'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY'
      '   NOME'
      '')
    Left = 237
    Top = 16
  end
  object qryCRespOri: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   CODCENTRORESPON, NOME,ANALITICOSINTET,CODEXTERNO'
      'FROM '
      '   CENTRESPON '
      'WHERE'
      '      (IDPESSOA =:IDPESSOA)'
      'ORDER BY'
      '   NOME')
    Left = 32
    Top = 73
  end
  object qrySaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA,'
      '  IDPLANOORCAMEN,'
      '  IDCONTAORCAMEN,'
      '  DATAREFERENCIA,'
      '  EXERCICIO,'
      '  PERIODO,'
      '  VLRREALIZADO,'
      '  VLRORCADO,'
      '  VLRRESERVADO,'
      '  VLRCOMPROMETIDO,'
      '  VLRORCACUM,'
      '  VLRREALACUM,'
      '  FLGSIMULAATIVO,'
      '  IDCRITERIORATORC,'
      '  PERCUTILRATEIO,'
      '  VLRRATEIOORI'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      '  (IDCONTAORCAMEN = :IDCONTAORI) AND'
      '  (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (DATAREFERENCIA >= :DATAREFER)'
      '')
    Left = 32
    Top = 359
  end
  object qryCRespDes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME, ANALITICOSINTET, CODEXTERNO'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '      (IDPESSOA =:IDPESSOA)'
      '  AND (ATIVO = '#39'S'#39')'
      'ORDER BY'
      '   NOME')
    Left = 237
    Top = 73
  end
  object qryAtivProjDes: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC, NOME, UNECODIGO'
      'FROM  '
      '   UNIDNEGOCIO '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY'
      '   NOME')
    Left = 237
    Top = 130
  end
  object qryPatroDes: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   PA.IDPESSOA, PE.NOME'
      'FROM'
      '   PESSOA PE,'
      '   PATRO PA'
      'WHERE'
      '   (PA.IDPESSOA = PE.IDPESSOA)'
      'ORDER BY'
      '   PE.NOME')
    Left = 237
    Top = 245
  end
  object qryPlanoPrevDes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY'
      '   NOME')
    Left = 237
    Top = 188
  end
  object qryPlanoPrevOri: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY'
      '   NOME')
    Left = 32
    Top = 187
  end
  object qryPatroOri: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   PA.IDPESSOA, PE.NOME'
      'FROM'
      '   PESSOA PE,'
      '   PATRO PA'
      'WHERE'
      '   (PA.IDPESSOA = PE.IDPESSOA)'
      'ORDER BY'
      '   PE.NOME')
    Left = 32
    Top = 245
  end
  object qryCompOri: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCOMPCONTASORC, IDCONTACONDRES, IDCONTACONDFIM,'
      '   IDCONTACONDINI, IDCONTAREFREAL, IDPLANOORCAMEN,'
      '   CODCENTRORESPON, IDPESSOA, UNIDNEGOC, IDEMPRESA,'
      '   CODCENTROCUSTO, PLANO, PLACONTA, CODTIPRECDES,'
      '   RECPAG, IDCONTAORCAMEN, IDCONTAREFORCADO, PERCCONTAREFORC,'
      '   PERCCONTAREFREA, CONDICAO, TIPOCONDINI, TIPOCONDRES,'
      '   VLRCONDINI, VLRCONDRES, IDPLANOPREV, IDPATRO'
      'FROM'
      '   COMPCONTASORCAMEN'
      'WHERE'
      '   (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND'
      '   (IDCONTAORCAMEN =:IDCONTAORCAMEN)'
      'ORDER BY'
      '   IDCOMPCONTASORC')
    Left = 32
    Top = 416
  end
  object qryInsContasDes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCONTAORCAMEN,'
      '  IDPLANOORCAMEN,'
      '  IDGRUPOORCAMEN,'
      '  IDDATAVIEW,'
      '  ORIGEMCMDV,'
      '  CODCENTRORESPON,'
      '  NOMECONTAORCAMEN,'
      '  IDPESSOA,'
      '  TIPOCALCREALIZADO,'
      '  TIPOCALCORCADO,'
      '  FORMULAREALIZADO,'
      '  FORMULAORCADO,'
      '  OBSERVACAO,'
      '  VLRINFORMADOREAL,'
      '  VLRINFORMADOORC,'
      '  FLGCONTAMONETARIA,'
      '  FLGSINALCONTA,'
      '  FLGCALCORCADO,'
      '  FLGCALCREAL,'
      '  FLGINFDIAMES,'
      '  FLGACUMULADO,'
      '  FLGTRANSFSALDO,'
      '  FLGATIVA,'
      '  DATAATIVA,'
      '  DATAINATIVA,'
      '  IDEMPRESA,'
      '  CODCENTROCUSTO,'
      '  IDPLANOPREV,'
      '  IDPATRO,'
      '  UNIDNEGOC'
      'FROM'
      '  CONTASORCAMEN'
      'WHERE'
      '  ( IDCONTAORCAMEN = :IDCONTAORCAMEN ) AND'
      '  ( IDPLANOORCAMEN = :IDPLANOORCAMEN )')
    Left = 245
    Top = 359
  end
  object qryAtivProjOri: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC, NOME, UNECODIGO'
      'FROM  '
      '   UNIDNEGOCIO '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY'
      '   NOME')
    Left = 32
    Top = 130
  end
end
