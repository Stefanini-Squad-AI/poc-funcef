inherited frmPessoaAvalistaMT: TfrmPessoaAvalistaMT
  HelpContext = 640037
  Caption = 'Cadastro de Avalistas / Fiadores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'AVALISTA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = AVALISTA.IDAVALISTA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60')
  end
end
