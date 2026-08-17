inherited FrmPessoaAdvogadoAlex: TFrmPessoaAdvogadoAlex
  Caption = 'FrmPessoaAdvogadoAlex'
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
        'Outros')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        inherited tbsTelefone: TTabSheet
          inherited PnlContatol_Padrao: TPanel
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 176
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited PnlTelefones_Padrao: TPanel
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 176
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited GrdContaBancaria_Padrao: TwwDBGrid [0]
          end
          inherited PnlDadosBancarios_Padrao: TPanel [1]
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Outros'
          ImageIndex = 5
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 684
            Height = 189
            Selected.Strings = (
              'NOMEBANCO'#9'30'#9'Banco'
              'NUMBANCO'#9'8'#9'Num.'
              'NUMAGENCIA'#9'15'#9'Num. Agência'
              'NOMEAGENCIA'#9'25'#9'Nome Agência'
              'CONTACORRENTE'#9'15'#9'Conta'
              'TIPOCONTA'#9'1'#9'Tipo'
              'FLGCONTAPREF'#9'4'#9'Pref.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsContaBancaria
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 684
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 34
              Top = 37
              Width = 89
              Height = 13
              Caption = 'Fator Honorário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object wwDBEdit1: TwwDBEdit
              Left = 34
              Top = 52
              Width = 124
              Height = 21
              DataField = 'FATORHONORADVOG'
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
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'CPF / CGC')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ADVOGADO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ADVOGADO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  inherited MsCidades: TMontaSelect
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
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
      '')
  end
  inherited MsBanco: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
  end
end
