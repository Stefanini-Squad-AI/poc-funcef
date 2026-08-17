object DtmCapCarMT: TDtmCapCarMT
  OldCreateOrder = False
  Left = 245
  Top = 143
  Height = 312
  Width = 508
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
    Left = 143
    Top = 16
  end
  object CdsPrevPendente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAdtoPendenteAfterOpen
    Left = 143
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
    Left = 246
    Top = 16
  end
  object CDSTestaRegAdianto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 246
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
    Left = 349
    Top = 16
  end
  object CdsTestaRad: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 349
    Top = 72
  end
  object dsPrevPendente: TwwDataSource
    DataSet = CdsPrevPendente
    Left = 144
    Top = 128
  end
  object dsAdtoPendente: TwwDataSource
    DataSet = CdsAdtoPendente
    Left = 40
    Top = 128
  end
  object SqlParam: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   IDPROCESSO '
      'FROM '
      '   LOTEPAGTO '
      'WHERE '
      '   NUMLOTE = :NUMLOTE')
    ClientDataSet = Cds
    Left = 453
    Top = 16
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 453
    Top = 72
  end
  object sqlConstaEmLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.FLAGCANCEL, L.NUMLOTE, LX.FLGBAIXA'
      'FROM'
      '  LOTEPAGTO L,'
      '  LOTEXDOCUM LX'
      'WHERE'
      '  L.NUMLOTE = LX.NUMLOTE AND'
      '  LX.CODDOCUMENTO = :CODDOCUMENTO'
      'ORDER BY'
      '  L.NUMLOTE DESC'
      '')
    ClientDataSet = cdsConstaEmLote
    Left = 235
    Top = 133
  end
  object cdsConstaEmLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 235
    Top = 189
  end
end
