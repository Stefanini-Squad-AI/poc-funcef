object DtmBaixaIntBanco: TDtmBaixaIntBanco
  OldCreateOrder = False
  Left = 130
  Top = 355
  Height = 245
  Width = 686
  object SqlDocumentos: TCMSqlParams
    SQL.Strings = (
      
        'SELECT D.CODDOCUMENTO, D.IDPESSOA, D.PLACONTA, D.CODCENTROCUSTO,' +
        ' D.IDFORCLI,'
      
        '       D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.D' +
        'ATAEMISSAO,'
      '       D.CODSUBCONTA, D.CODTIPDOC, '#39'D'#39' AS DEBCRE,'
      
        '       D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO, L.VALOR, L.VA' +
        'LOROUTRAMOEDA,'
      
        '        R.NUMLOTE, R.CODLANCFINANC, D.NOSSONUMERO, D.IDMODULO, P' +
        '.RAZAOSOCIAL,'
      '      (0) AS JUROS, (0) AS DESCONTOS, (0) AS ABATIMENTO,'
      
        '      (TO_DATE('#39'15/01/1999'#39','#39'DD/MM/YYYY'#39')) AS DATABAIXA, D.CODPO' +
        'RTFORMA, P.NOME,'
      
        '      (0) AS TARIFABANCARIA, (0) AS VALORNOMINAL, (0) AS CODALTE' +
        'RADORBAIXA,'
      '      '#39'N'#39' AS FLGCONTABALTERADOR,'
      
        '      D.RECPAG, D.STATUS, D.PLANO, D.CODGRUPOCNAB, L.NUMLANCTO, ' +
        'L.VLRLIQUIDO,'
      '      '#39'00'#39' AS CODLIQBAIXA,'
      '      '#39'00'#39' AS CODFORMAPAG,'
      '      '#39'00'#39' AS FLOATFORMAPAG'
      'FROM DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R, PESSOA P'
      'WHERE 1 = 2'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 32
    Top = 24
  end
  object SqlAuxCodDoc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT D.CODDOCUMENTO, D.IDPESSOA,D.CODSUBCONTA, D.PLACONTA, D.C' +
        'ODCENTROCUSTO, D.IDFORCLI,'
      
        '       D.IDUSUARIOINCLUSAO, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.D' +
        'ATAEMISSAO, L.VALOR, L.VALOROUTRAMOEDA,'
      '       D.DATAVENCTO, D.DATAPROGRAMADA, D.OPERACAO,  L.DEBCRE,'
      
        '       D.NOSSONUMERO, P.RAZAOSOCIAL, D.STATUS, D.CODPORTFORMA, P' +
        '.NOME,'
      '       '#39#39'00'#39#39' AS CODLIQBAIXA,'
      '       '#39#39'00'#39#39' AS CODFORMAPAG,'
      '       '#39#39'00'#39#39' AS FLOATFORMAPAG'
      'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P'
      'WHERE (1 = 2)'
      ''
      ' '
      ' ')
    Left = 124
    Top = 24
  end
  object SqlPortaDorForma: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CODPORTFORMA , PLACONTA, DMAIS, LANCAFINANC, DESCRICAO,DE' +
        'SCFINAN  '
      'FROM PORTADORFORMA '
      'WHERE '
      '(CODPORTFORMA = :PCODPORTFORMA) AND'
      '(NVL(PORTADORFORMA.FLGATIVO, '#39'S'#39') = '#39'S'#39')'
      ''
      '')
    Left = 216
    Top = 24
  end
  object SqlParamCAP: TCMSqlParams
    Left = 307
    Top = 24
  end
  object SqlOcorrencia: TCMSqlParams
    Left = 399
    Top = 24
  end
  object SqlAux: TCMSqlParams
    Left = 74
    Top = 96
  end
  object SqlUnid: TCMSqlParams
    Left = 167
    Top = 96
  end
  object SqlModelosCnab: TCMSqlParams
    SQL.Strings = (
      'SELECT IDMODELOSCNAB,DESCRICAO'
      'FROM MODELOSCNAB'
      'WHERE RECPAG = :PRECPAG'
      'ORDER BY DESCRICAO')
    Left = 261
    Top = 96
  end
  object SqlAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT CODALTERADOR, ACRESDECRES, PLACONTA, CONVERTE,'
      'CODCENTROCUSTO, DESCRICAO'
      'FROM TIPOALTERADOR'
      'WHERE IDPESSOA = :PIDPESSOA AND CODALTERADOR = :PCODALTERADOR')
    Left = 354
    Top = 96
  end
end
