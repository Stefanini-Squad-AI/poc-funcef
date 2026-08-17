object DtmCapCarMT: TDtmCapCarMT
  OldCreateOrder = False
  Left = 404
  Top = 217
  Height = 312
  Width = 479
  object SQLAdtoPendente: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.VALR' +
        'ES,S.VALRES as VLRBAIXA,L.DATALANCTO,'
      
        '    D.DATAVENCTO, D.NODOCUMENTO ||'#39' '#39'|| D.COMPLDOCUMENTO as DOCU' +
        'M'
      'FROM'
      '    DOCUMENTO D, LANCTODOCUM L,'
      
        '    PESSOA P,(SELECT CODDOCUMENTO, DECODE('#39'P'#39','#39'R'#39',SUM(DECODE(DEB' +
        'CRE,'#39'D'#39',VALOR,VALOR*-1)),SUM(DECODE(DEBCRE,'#39'D'#39',VALOR*-1,VALOR)))' +
        ' AS VALRES'
      '               FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S'
      'WHERE 1=2'
      ' ')
    ClientDataSet = CdsAdtoPendente
    Left = 40
    Top = 16
  end
  object CdsAdtoPendente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAdtoPendenteAfterOpen
    Left = 40
    Top = 72
  end
  object SQLPrevPendente: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.VALR' +
        'ES,S.VALRES as VLRBAIXA,L.DATALANCTO,'
      
        '    D.DATAVENCTO, D.NODOCUMENTO ||'#39' '#39'|| D.COMPLDOCUMENTO as DOCU' +
        'M'
      'FROM'
      '    DOCUMENTO D, LANCTODOCUM L,'
      
        '    PESSOA P,(SELECT CODDOCUMENTO, DECODE('#39'P'#39','#39'R'#39',SUM(DECODE(DEB' +
        'CRE,'#39'D'#39',VALOR,VALOR*-1)),SUM(DECODE(DEBCRE,'#39'D'#39',VALOR*-1,VALOR)))' +
        ' AS VALRES'
      '               FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S'
      'WHERE 1=2'
      ' ')
    ClientDataSet = CdsPrevPendente
    Left = 93
    Top = 16
  end
  object CdsPrevPendente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAdtoPendenteAfterOpen
    Left = 93
    Top = 72
  end
  object SQLTestaRegAdianto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  NUMLANCTO'
      'FROM'
      '  LANCTODOCUM '
      'WHERE'
      '  (CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (RTRIM(OPERACAO) = :OPERACAO) AND'
      '  (ESTORNO IS NULL)')
    ClientDataSet = CDSTestaRegAdianto
    Left = 149
    Top = 16
  end
  object CDSTestaRegAdianto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 72
  end
  object SQLTestaRad: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPROCESSO '
      'FROM '
      '   LOTEPAGTO '
      'WHERE '
      '   NUMLOTE = :NUMLOTE')
    ClientDataSet = CdsTestaRad
    Left = 205
    Top = 16
  end
  object CdsTestaRad: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 205
    Top = 72
  end
  object dsPrevPendente: TwwDataSource
    DataSet = CdsPrevPendente
    Left = 96
    Top = 120
  end
  object dsAdtoPendente: TwwDataSource
    DataSet = CdsAdtoPendente
    Left = 40
    Top = 120
  end
end
