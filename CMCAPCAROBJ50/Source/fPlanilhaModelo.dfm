inherited FrmPlanilhaModelo: TFrmPlanilhaModelo
  Caption = 'Exportação de Planilha Modelo para Rateio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 2
    Top = 64
    Height = 168
    Align = alNone
  end
  object Button1: TButton [2]
    Left = 400
    Top = 14
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object SqlUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   NOME,UNIDNEGOC'
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :IDPESSOA) '
      'AND UNETIPO = '#39'A'#39' AND ATIVO = '#39'S'#39
      'ORDER BY '
      '  NOME'
      ' ')
    ClientDataSet = CdsUnidNegoc
    Left = 7
    Top = 67
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CEN.NOME,'
      '  CEN.CODCENTRORESPON'
      'FROM'
      '  CENTRESPON CEN,'
      '  PESSOAXCRESP PES'
      'WHERE'
      '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)'
      'AND CEN.ANALITICOSINTET = '#39'A'#39'  '
      'AND CEN.ATIVO = '#39'S'#39
      'GROUP BY CEN.NOME,CEN.CODCENTRORESPON'
      'ORDER BY CEN.NOME')
    ClientDataSet = CdsCentroRespon
    Left = 88
    Top = 66
  end
  object SQLTipoDesembolso: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   DESCRICAO,'
      '   CODTIPRECDES'
      'FROM'
      '   TIPORECEBDESEMB'
      '   WHERE ATIVO = '#39'S'#39
      'order by DESCRICAO')
    ClientDataSet = CdsTipoDesenbolso
    Left = 184
    Top = 71
  end
  object SqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   NOME,'
      '   CODCENTROCUSTO'
      'FROM '
      '   CENTCUST '
      'WHERE ATIVO = '#39'S'#39' '
      'AND STATUSGRUPOCDC = '#39'A'#39' '
      'ORDER BY NOME')
    ClientDataSet = CdsCentroCusto
    Left = 273
    Top = 68
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 115
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 11
    Top = 116
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 87
    Top = 112
  end
  object CdsTipoDesenbolso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 112
  end
  object SqlProgramaPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DESCPROGRAMA,'
      '   IDPROGRAMA'
      'FROM'
      '   PROGRAMA'
      'ORDER BY'
      '   DESCPROGRAMA')
    ClientDataSet = CdsProgramaPrev
    Left = 354
    Top = 68
  end
  object CdsProgramaPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 355
    Top = 117
  end
  object SqlPatroPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PESSOA.NOME,'
      '   PATRO.IDPESSOA as IDPATRO'
      'FROM'
      '   PESSOA,'
      '   PATRO'
      'WHERE'
      '   PESSOA.IDPESSOA = PATRO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.NOME')
    ClientDataSet = CdsPatroPrev
    Left = 430
    Top = 68
  end
  object CdsPatroPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 116
  end
  object SqlPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   NOME,'
      '   IDPLANOPREV'
      'FROM'
      '   PLANPREVCONTABIL'
      'WHERE'
      '   NVL(ATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY'
      '   NOME'
      ' '
      ' ')
    ClientDataSet = CdsPlanoPrev
    Left = 486
    Top = 71
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 486
    Top = 118
  end
end
