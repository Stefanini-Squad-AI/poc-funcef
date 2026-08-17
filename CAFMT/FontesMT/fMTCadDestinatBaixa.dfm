inherited frmMTCadDestinatBaixa: TfrmMTCadDestinatBaixa
  Left = -1
  Top = 75
  Caption = 'Cadastro de Destinatários de Bens Baixados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Destinatário de Bens Baixados'
    Colunas.Strings = (
      'PESSOA.NOME'
      'DECODE(TERCEIRO.TIPOTERCEIRO,1,'#39'S'#39','#39'N'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Destinatário')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TERCEIRO'
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=TERCEIRO.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    Left = 304
    Top = 56
  end
  inherited MSGrupo: TMontaSelect
    Left = 545
  end
end
