inherited FrCotatipooper: TFrCotatipooper
  Left = 355
  Top = 217
  Caption = 'FrmCadReceitaMT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COTATIPOOPER.DESCTIPOOPER')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'DESCRIÇÃO')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'COTATIPOOPER')
    CamposChave.Strings = (
      'COTATIPOOPER.IDCOTATIPOOPER')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited ds: TwwDataSource
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    Top = 54
  end
end
