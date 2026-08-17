object dtmLookIRRF: TdtmLookIRRF
  OldCreateOrder = False
  Left = 318
  Top = 141
  Height = 544
  Width = 696
  object cdsLookTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 152
  end
  object cdsLookFormaPagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object cdsLookTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 200
  end
  object cdsLookNatureza: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 296
  end
  object cdsLookPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 160
    Top = 56
  end
  object cdsLookPatro: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 160
    Top = 8
  end
  object cdsLookPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 160
    Top = 104
  end
  object cdsLookCidades: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 104
  end
  object cdsEmpresaProp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 8
  end
  object cdsParamIRRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 288
    Top = 56
  end
  object MS_DocumentoCaP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOC.CODDOCUMENTO'
      'DOC.NODOCUMENTO'
      'DOC.COMPLDOCUMENTO'
      'ROUND(LDC.VALOR, 2)'
      'PES.NOME'
      'DOC.NUMAPGR'
      'LDC.DATALANCTO'
      'DOC.DATAEMISSAO'
      'DOC.DATAPROGRAMADA'
      'LDC.HISTORICOCOMPL')
    TipodeDado.Strings = (
      'N'
      'N'
      'C'
      'N'
      'C'
      'N'
      'D'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Código'
      'Nº Documento'
      'Compl.'
      'Valor'
      'Favorecido'
      'Nº AP'
      'Data Lancto.'
      'Data Emissão'
      'Data Prog.'
      'Histórico')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA      PES'
      'DOCUMENTO   DOC'
      'LANCTODOCUM LDC')
    CamposChave.Strings = (
      'DOC.CODDOCUMENTO'
      'DOC.NODOCUMENTO'
      'DOC.COMPLDOCUMENTO'
      'ROUND(LDC.VALOR, 2)'
      'PES.NOME'
      'DOC.NUMAPGR'
      'LDC.DATALANCTO'
      'DOC.DATAEMISSAO'
      'DOC.DATAPROGRAMADA'
      'LDC.HISTORICOCOMPL')
    Filtro.Strings = (
      'DOC.IDFORCLI      = PES.IDPESSOA'
      'DOC.CODDOCUMENTO  = LDC.CODDOCUMENTO'
      'DOC.OPERACAO      = LDC.OPERACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,#0.00'
      ''
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '10'
      '12'
      '3'
      '10'
      '25'
      '6'
      '12'
      '12'
      '12'
      '60')
    OperComparador.Strings = (
      '0'
      '0'
      '1'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 403
    Top = 228
  end
  object cdsLookCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 56
  end
  object cdsLookCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 8
  end
  object cdsLookModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 200
  end
  object cdsLookMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 248
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDPLANCRESPON,    C.CODCENTRORESPON,    C.CODEXTERNO,    C.I' +
        'DEMPRESA,    C.CODCENTROCUSTO,'
      
        '  C.IDPESSOA,    C.RESPONSAVEL,    C.NOME,    C.IDUSUARIOINCLUSA' +
        'O,    C.IDUSUARIO,    C.ATIVO,'
      '  C.ANALITICOSINTET,'
      
        '  PCR.DESCPLANCRESPON,    P.NOME AS NOMEPESSOA,    U.NOMEUSUARIO' +
        ','
      '  E.NOMEEMPRESA,    T.NOME AS NOMECENTROCUSTO'
      ''
      'FROM'
      '  PESSOA         P,'
      '  PESSOA         Q,'
      '  CENTRESPON     C,'
      '  CENTCUST       T,'
      '  USUARIOSISTEMA U,'
      '  PLANCENTRESPON PCR,'
      '  EMPRESAPROP    E'
      ''
      'WHERE'
      '      C.IDPESSOA          = 2'
      '  AND C.IDPLANCRESPON     = 2'
      '  AND C.ANALITICOSINTET   = '#39'A'#39
      '  AND C.ATIVO             = '#39'S'#39
      '  AND C.IDPESSOA          = E.IDPESSOA(+)'
      '  AND C.IDPLANCRESPON     = PCR.IDPLANCRESPON(+)'
      '  AND C.IDUSUARIOINCLUSAO = P.IDPESSOA(+)'
      '  AND C.IDUSUARIO         = U.IDUSUARIO(+)'
      '  AND C.IDEMPRESA         = Q.IDPESSOA(+)'
      '  AND C.IDEMPRESA         = T.IDEMPRESA(+)'
      '  AND C.CODCENTROCUSTO    = T.CODCENTROCUSTO(+)'
      ''
      'ORDER BY'
      '  C.NOME')
    Left = 224
    Top = 328
  end
  object cdsLancIRRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 104
  end
end
