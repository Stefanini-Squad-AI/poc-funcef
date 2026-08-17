inherited frmCadHotel: TfrmCadHotel
  Left = 169
  Top = 117
  Caption = 'Cadastro de Hotel'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label2: TLabel [6]
        Left = 786
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Estrelas'
      end
      inherited dbedRazaoSocial: TDBEdit
        TabOrder = 5
      end
      object dbedEstrelas: TwwDBEdit
        Left = 786
        Top = 23
        Width = 50
        Height = 21
        DataField = 'QTDESTRELAS'
        DataSource = dsSubTipo
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Hotel'
    Colunas.Strings = (
      'P.NOME'
      'P.RAZAOSOCIAL'
      'H.QTDESTRELAS')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Estrelas')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'HOTEL H')
    CamposChave.Strings = (
      'H.IDHOTEL')
    Filtro.Strings = (
      'P.IDPESSOA = H.IDHOTEL')
    Larguras.Strings = (
      '60'
      '60'
      '12')
    ExibePergunta = False
  end
end
