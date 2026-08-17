inherited frmMTConsultSaldoContabBemCAF: TfrmMTConsultSaldoContabBemCAF
  Left = 15
  Top = 167
  HelpContext = 540057
  Caption = 'Consulta Saldo Contábil do Bem'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MSBem: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'GRUPO.NOME'
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'LOCALIZACAO.NOME'
      'PESSOARESP.NOME'
      'CLASSEDEBEM.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Nome do Imóvel'
      'Código do Imóvel'
      'Grupo Contábil'
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Localização'
      'Responsável'
      'Classe')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'IMOVELXBEM IXB'
      'IMOVEL I'
      'IMOVEL IM')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'BEM.IDBEM = IXB.IDBEM'
      'IXB.IDIMOVEL = I.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA(+)'
      'BEM.IDGRUPO=GRUPO.IDGRUPO(+)'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+)'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      'BEM.IDMODULO = 54'
      '1=1')
    Mascaras.Strings = (
      ''
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
    Larguras.Strings = (
      '25'
      '20'
      '20'
      '60'
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '60')
  end
end
