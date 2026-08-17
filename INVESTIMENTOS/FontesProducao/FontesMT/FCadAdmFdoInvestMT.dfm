inherited FrmCadAdmFdoInvestMT: TFrmCadAdmFdoInvestMT
  Left = 210
  Top = 142
  HelpContext = 790051
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
        'Adm. de Fundos')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsAdmFdo
        object tbsAdmFdo: TTabSheet
          Caption = 'Adm. de Fundos'
          ImageIndex = 5
          object pnlSubTipo: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblAdmFdo: TLabel
              Left = 10
              Top = 6
              Width = 92
              Height = 13
              Caption = 'Adm. de Fundos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbeAdmFdo: TwwDBEdit
              Left = 10
              Top = 22
              Width = 383
              Height = 21
              DataField = 'DESADMFDOINVEST'
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
      'ADMFDOINVEST.DESADMFDOINVEST')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'CPF / CNPJ'
      'Nome'
      'Razão Social'
      'Administrador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ADMFDOINVEST')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ADMFDOINVEST.IDADMFDOINVEST')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '60'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    OperComparador.Strings = (
      '-1'
      '-1')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM ADMFDOINVEST'
      ' ')
    ClientDataSet = CdsSubTipo
    Left = 504
    Top = 143
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM ADMFDOINVEST'
      ' ')
    ClientDataSet = CdsSubTipo
    Left = 592
    Top = 151
  end
end
