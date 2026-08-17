inherited frmCadFilial: TfrmCadFilial
  Left = 0
  Top = 66
  HelpContext = 690012
  Caption = 'Cadastro de Estabelecimentos'
  ClientWidth = 793
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 783
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Segmento (Ramo de Atividade)')
      inherited pgctrlDetalhe: TPageControl
        Width = 685
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 677
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 677
            inherited pnlFoto: TPanel
              Width = 187
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 187
                inherited btnAssociarimgPessoa: TButton
                  Caption = 'Associar &Logotipo'
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 185
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 677
            inherited grpTipoEnd: TGroupBox
              Left = 480
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 677
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 448
          end
          inherited Panel1: TPanel
            Width = 448
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 448
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 451
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 475
          end
          inherited Panel2: TPanel
            Width = 475
          end
          inherited dbgContato: TwwDBGrid
            Width = 475
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 478
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 677
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 677
          end
        end
        object tbshSegmento: TTabSheet
          Caption = 'Segmento (Ramo de Atividade)'
          object dblcRamo: TwwDBLookupCombo
            Left = 186
            Top = 69
            Width = 340
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRAMOFORNECEDOR'#9'40'#9'DESCRAMOFORNECEDOR')
            DataField = 'IDRAMOFORNECEDOR'
            DataSource = dsSubTipo
            LookupTable = CdsRamo
            LookupField = 'IDRAMOFORNECEDOR'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 775
      end
      inherited Dock974: TDock97
        Left = 689
      end
    end
    inherited pnlMestre: TPanel
      Width = 783
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
      inherited lblPdGrupo: TLabel
        Width = 63
        Caption = 'Pertence a'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Width = 793
    inherited tb97Fundo: TToolbar97
      Left = 623
      DockPos = 627
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 690012
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 456
      DockPos = 460
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 738
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 738
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 564
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Estabelecimento'
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Filial / Estab.')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FILIALPESSOA')
    CamposChave.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA')
    Filtro.Strings = (
      'FILIALPESSOA.IDFILIALPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '82')
    Left = 671
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 564
    Top = 16
  end
  inherited dsDet: TwwDataSource
    Left = 404
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 449
    Top = 3
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 725
    Top = 364
  end
  inherited ImlDocumentos: TImageList
    Left = 738
    Top = 26
  end
  inherited dsTelefone: TwwDataSource
    Left = 162
    Top = 412
  end
  inherited dsEndereco: TwwDataSource
    Left = 95
    Top = 412
  end
  inherited dsContato: TwwDataSource
    Left = 225
    Top = 411
  end
  inherited dsTelContato: TwwDataSource
    Left = 293
    Top = 411
  end
  inherited dsDocumento: TwwDataSource
    Left = 23
    Top = 413
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 724
    Top = 251
  end
  inherited dsImagem: TwwDataSource
    Left = 548
    Top = 412
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 373
    Top = 410
  end
  inherited MSGrupo: TMontaSelect
    Caption = 'Seleciona Empresa a que pertence'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'DECODE(EMPRESAPROP.NOMEEMPRESA,'#39#39','#39#39','#39'SIM'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Empresa Proprietária?')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'EMPRESAPROP')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39
      'PESSOA.IDPESSOA = EMPRESAPROP.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '10')
    Left = 671
    Top = 14
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 725
    Top = 308
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 23
    Top = 425
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 730
    Top = 167
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 95
    Top = 425
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 162
    Top = 425
  end
  inherited CdsContato: TCMClientDataSet
    Left = 225
    Top = 425
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 293
    Top = 425
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 548
    Top = 425
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 724
    Top = 264
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 373
    Top = 424
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 449
    Top = 17
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 725
    Top = 377
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 730
    Top = 181
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 725
    Top = 322
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 730
    Top = 194
  end
  inherited MsCidades: TMontaSelect
    Left = 671
    Top = 28
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 462
    Top = 412
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 462
    Top = 425
  end
  inherited MsBanco: TMontaSelect
    Left = 671
    Top = 41
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 730
    Top = 207
  end
  inherited ppmCaixa: TPopupMenu
    Left = 738
    Top = 38
  end
  object CdsRamo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 632
    Top = 249
  end
end
