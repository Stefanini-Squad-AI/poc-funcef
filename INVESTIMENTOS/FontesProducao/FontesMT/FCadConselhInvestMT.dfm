inherited FrmCadConselhInvestMT: TFrmCadConselhInvestMT
  Left = 174
  Top = 139
  HelpContext = 790070
  Caption = 'Cadastro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Conselheiro')
      inherited pgctrlDetalhe: TPageControl
        object tbsConselheiro: TTabSheet
          Caption = 'Conselheiro'
          ImageIndex = 5
          object pnlSubTipo: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblConselheiro: TLabel
              Left = 10
              Top = 6
              Width = 67
              Height = 13
              Caption = 'Conselheiro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbeConselheiro: TwwDBEdit
              Left = 10
              Top = 22
              Width = 383
              Height = 21
              DataField = 'DESCONSELINVEST'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnEnter = dbedContaEnter
            end
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'CONSELHINVEST.DESCONSELINVEST')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social'
      'Conselheiro')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'CONSELHINVEST')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = CONSELHINVEST.IDCONSELHINVEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
  end
  inherited dsDet: TwwDataSource
    Left = 354
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM CONSELHINVEST'
      ' ')
    ClientDataSet = CdsSubTipo
    Left = 592
    Top = 151
  end
end
