inherited frmCadEmprAdq: TfrmCadEmprAdq
  Left = 0
  Top = 66
  Caption = 'Cadastro de Empresas Adquiridas ou Adquirentes'
  ClientWidth = 793
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 783
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
              Visible = False
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 187
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
    end
  end
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Width = 793
    inherited tb97Fundo: TToolbar97
      Left = 623
      DockPos = 631
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 456
      DockPos = 464
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 741
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 741
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 517
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empresa Adquirida ou Adquirente'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome Fantasia'
      'Razão Social'
      'CNPJ ou Equiv.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA')
    Filtro.Strings = (
      'FORNSERV.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18')
    Left = 670
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 517
    Top = 14
  end
  inherited dsDet: TwwDataSource
    Left = 404
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 450
    Top = 1
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 726
    Top = 364
  end
  inherited ImlDocumentos: TImageList
    Left = 741
    Top = 27
  end
  inherited dsTelefone: TwwDataSource
    Left = 165
    Top = 412
  end
  inherited dsEndereco: TwwDataSource
    Left = 97
    Top = 411
  end
  inherited dsContato: TwwDataSource
    Left = 228
    Top = 411
  end
  inherited dsTelContato: TwwDataSource
    Left = 296
    Top = 412
  end
  inherited dsDocumento: TwwDataSource
    Left = 22
    Top = 411
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 723
    Top = 254
  end
  inherited dsImagem: TwwDataSource
    Left = 540
    Top = 412
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 375
    Top = 411
  end
  inherited MSGrupo: TMontaSelect
    Left = 670
    Top = 14
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 725
    Top = 309
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 22
    Top = 425
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 725
    Top = 173
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 97
    Top = 425
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 165
    Top = 425
  end
  inherited CdsContato: TCMClientDataSet
    Left = 228
    Top = 425
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 296
    Top = 425
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 540
    Top = 425
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 723
    Top = 267
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 375
    Top = 425
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 450
    Top = 15
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 726
    Top = 377
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 725
    Top = 186
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 725
    Top = 322
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 725
    Top = 199
  end
  inherited MsCidades: TMontaSelect
    Left = 670
    Top = 27
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
    Left = 670
    Top = 40
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 724
    Top = 212
  end
  inherited ppmCaixa: TPopupMenu
    Left = 741
    Top = 40
  end
end
