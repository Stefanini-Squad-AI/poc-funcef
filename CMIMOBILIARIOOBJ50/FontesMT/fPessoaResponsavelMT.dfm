inherited frmPessoaResponsavelMT: TfrmPessoaResponsavelMT
  HelpContext = 640039
  Caption = 'Cadastro de Responsáveis'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '18'
      '60')
  end
end
