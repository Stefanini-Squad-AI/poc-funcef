object dtmMS: TdtmMS
  OldCreateOrder = False
  Left = 185
  Top = 306
  Height = 375
  Width = 400
  object MS_Contrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.DATAASSINATURA'
      'C.NOMECONTRATO'
      'C.CODCONTRATOEMPR')
    TipodeDado.Strings = (
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Data da Assinatura'
      'Nome do Contrato'
      'Nº do Processo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR C'
      'RADINSTPROCESSO R')
    CamposChave.Strings = (
      'C.IDCONTRATO'
      'C.NOMECONTRATO'
      'C.CODCONTRATOEMPR'
      'C.TIPOCONTRATO'
      'C.IDFORCLI')
    Filtro.Strings = (
      '( C.IDPROCESSORAD = R.IDPROCESSO(+) )')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '50'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 40
    Top = 15
  end
  object MS_Objeto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'O.NOMEOBJETO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Objeto')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'OBJETOCONTRATUAL O')
    CamposChave.Strings = (
      'O.IDOBJETO'
      'O.NOMEOBJETO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '70')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 117
    Top = 15
  end
  object MS_Item: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'I.NOME_ITEM')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Item')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'ITEMCONTRATUAL I')
    CamposChave.Strings = (
      'I.IDITEM'
      'I.NOME_ITEM')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 33
    Top = 79
  end
  object MS_CompOrcamto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      
        '(RESERVAORCAMEN.VLRRESERVA - RESERVAORCAMEN.VLRCOMPROMISSO) AS V' +
        'ALOR'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA'
      'RESERVAORCAMEN.IDOPERACAO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Nr. do Compromisso'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nome da Conta'
      'Número da Conta'
      'Observação'
      'Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '50'
      '20'
      '70'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 115
    Top = 77
  end
end
