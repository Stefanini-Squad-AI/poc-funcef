inherited frmPessoaProprietarioMT: TfrmPessoaProprietarioMT
  HelpContext = 640038
  Caption = 'Cadastro de Proprietários'
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
      'PROPRIETARIOUH')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = PROPRIETARIOUH.IDPROPRIETARIOUH')
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
