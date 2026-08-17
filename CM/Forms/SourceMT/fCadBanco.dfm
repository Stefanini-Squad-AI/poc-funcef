inherited frmCadBanco: TfrmCadBanco
  Left = 147
  Top = 130
  HelpContext = 230056
  Caption = 'Cadastro de Banco'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolTelContato: TToolWindow97
    Left = 500
  end
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados do Banco')
      inherited pgctrlDetalhe: TPageControl
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            inherited RgTipoConta: TDBRadioGroup
              OnClick = nil
            end
          end
        end
        object TbsBanco: TTabSheet
          Caption = 'Dados do Banco'
          ImageIndex = 4
          object Label13: TLabel
            Left = 6
            Top = 4
            Width = 106
            Height = 13
            Caption = 'Número do Banco:'
          end
          object Label2: TLabel
            Left = 6
            Top = 91
            Width = 156
            Height = 13
            Caption = 'Máscara Nº Conta Corrente'
          end
          object Label3: TLabel
            Left = 6
            Top = 46
            Width = 117
            Height = 13
            Caption = 'Máscara Nº Agência'
          end
          object dbedNumBanco: TwwDBEdit
            Left = 6
            Top = 20
            Width = 158
            Height = 21
            DataField = 'NUMBANCO'
            DataSource = dsSubTipo
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit2: TwwDBEdit
            Left = 6
            Top = 62
            Width = 158
            Height = 21
            DataField = 'MASCARAAGENCIA'
            DataSource = dsSubTipo
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit3: TwwDBEdit
            Left = 6
            Top = 107
            Width = 158
            Height = 21
            DataField = 'MASCARACC'
            DataSource = dsSubTipo
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBCheckBox1: TDBCheckBox
            Left = 6
            Top = 138
            Width = 276
            Height = 17
            Caption = 'Valida Dígito Verificador da Conta Corrente'
            DataField = 'FLGVALIDACC'
            DataSource = dsSubTipo
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230056
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 19
    Top = 370
  end
  inherited Cds: TCMClientDataSet
    Left = 19
    Top = 324
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BANCO.NUMBANCO'
      'PESSOA.NOME'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Número do Banco'
      'Banco'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'BANCO.IDPESSOA=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10')
  end
  inherited dsSubTipo: TwwDataSource
    Left = 667
    Top = 370
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 296
    Top = 370
  end
  inherited dsTelefone: TwwDataSource
    Left = 208
    Top = 370
  end
  inherited dsEndereco: TwwDataSource
    Left = 160
    Top = 370
  end
  inherited dsContato: TwwDataSource
    Left = 254
    Top = 370
  end
  inherited dsTelContato: TwwDataSource
    Left = 486
    Top = 370
  end
  inherited dsDocumento: TwwDataSource
    Left = 65
    Top = 370
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 574
    Top = 370
  end
  inherited dsImagem: TwwDataSource
    Left = 529
    Top = 370
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 622
    Top = 370
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 392
    Top = 370
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 65
    Top = 324
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 112
    Top = 324
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 158
    Top = 324
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 204
    Top = 324
  end
  inherited CdsContato: TCMClientDataSet
    Left = 251
    Top = 324
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 483
    Top = 324
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 529
    Top = 324
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 575
    Top = 324
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 622
    Top = 324
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 668
    Top = 324
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 297
    Top = 324
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 344
    Top = 324
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 390
    Top = 324
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 436
    Top = 324
  end
end
