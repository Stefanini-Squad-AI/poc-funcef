inherited frmConsultMovimCAF: TfrmConsultMovimCAF
  Left = 15
  Top = 111
  HelpContext = 540056
  Caption = 'Consulta Movimentação de Bens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MSBem: TMontaSelect
    Colunas.Strings = (
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'BEM.PLACA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Baixado'
      'Descrição do Bem'
      'Imóvel Mestre'
      'Imóvel'
      'Código Imóvel'
      'Placa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'IMOVEL I'
      'IMOVEL IM'
      'IMOVELXBEM IXB')
    CamposChave.Strings = (
      'BEM.IDPESSOA'
      'BEM.IDBEM'
      'BEM.PLACA'
      'BEM.DESBEM'
      'CONJUNTO.IDLOCALIZACAO'
      'BEM.IDCONJUNTO'
      'CONJUNTO.DESCCONJUNTO'
      'BEM.IDGRUPO'
      'GRUPO.NOME'
      'LOCALIZACAO.NOME')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDBEM=IXB.IDBEM'
      'IXB.IDIMOVEL=I.IDIMOVEL'
      'I.IDIMOVELMESTRE=IM.IDIMOVEL'
      '1=1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '1'
      '200'
      '60'
      '60'
      '15'
      '10')
  end
end
