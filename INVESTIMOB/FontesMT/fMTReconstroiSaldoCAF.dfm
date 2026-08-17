inherited frmMTReconstroiSaldoCAF: TfrmMTReconstroiSaldoCAF
  HelpContext = 540087
  Caption = 'Reconstrói Saldos Contábeis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited rdgTipoBem: TRadioGroup
      Enabled = False
      ItemIndex = 1
    end
  end
  inherited MSBem: TMontaSelect
    Colunas.Strings = (
      'BEM.PLACA'
      'BEM.BAIXATOTAL'
      'BEM.DESBEM'
      'CONJUNTO.DESCCONJUNTO'
      'CLASSEDEBEM.DESCRICAO'
      'GRUPO.NOME'
      '(BEM.VALORG+BEM.CMBEM-BEM.DEPLANC-BEM.CMDEP)'
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº de Tombamento'
      'Baixado'
      'Descrição'
      'Conjunto'
      'Classe'
      'Grupo Contábil'
      'Valor Residual'
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel')
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
      'N')
    Tabelas.Strings = (
      'BEM'
      'CONJUNTO'
      'GRUPO'
      'LOCALIZACAO'
      'CLASSEDEBEM'
      'PESSOA PESSOARESP'
      'PESSOA PESSOAFORN'
      'PLANOGRUPO'
      'IMOVELXBEM'
      'IMOVEL I'
      'IMOVEL IM')
    Filtro.Strings = (
      'BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO'
      'BEM.IDPESSOA=CONJUNTO.IDPESSOA'
      'BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM'
      'CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO'
      'CONJUNTO.IDPESSOA=LOCALIZACAO.IDPESSOA'
      'CONJUNTO.IDRESPONSAVEL=PESSOARESP.IDPESSOA'
      'BEM.IDGRUPO=PLANOGRUPO.IDGRUPO'
      'PLANOGRUPO.IDGRUPO=GRUPO.IDGRUPO'
      'BEM.IDFORNSERV=PESSOAFORN.IDPESSOA(+)'
      '1=1'
      'BEM.IDBEM = IMOVELXBEM.IDBEM'
      'I.IDIMOVEL = IMOVELXBEM.IDIMOVEL'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL')
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
      '')
    Larguras.Strings = (
      '10'
      '1'
      '80'
      '100'
      '60'
      '60'
      '10'
      '60'
      '60'
      '15')
  end
end
