inherited frmExecRecalculoDocumentoAlienacao: TfrmExecRecalculoDocumentoAlienacao
  HelpContext = 1350015
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PagControle: TPageControl
      ActivePage = tabSelecao
    end
  end
  inherited MS_Documento: TMontaSelect
    Colunas.Strings = (
      'CI.CONNUMERO'
      'CI.CONNOME'
      'P.RAZAOSOCIAL'
      'R.NOME'
      'PF.CODDOCUMENTO'
      'PF.NUMPARCELA'
      'PF.DATAVENCIMENTO'
      'PF.VLRPRESTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. Contrato'
      'Nome do Contrato'
      'Comprador'
      'Responsável'
      'Cod. Documento'
      'Parcela'
      'Vencimento'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL CI'
      'PESSOA P'
      'PESSOA R'
      'CONDPAGIMOVEL CP'
      'PARCFINANCIMOV PF')
    CamposChave.Strings = (
      'PF.CODDOCUMENTO')
    Filtro.Strings = (
      'CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'
      'CP.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL'
      'PF.FLGLANCINTEGRA = 2'
      'CI.IDLOCATARIO = P.IDPESSOA(+)'
      'CI.IDRESPONSAVEL = R.IDPESSOA(+)'
      'CI.FLGTIPOCONTRATO IN ('#39'C'#39','#39'A'#39')')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy'
      '###,##0.00')
    Larguras.Strings = (
      '20'
      '60'
      '60'
      '60'
      '10'
      '10'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
  end
end
