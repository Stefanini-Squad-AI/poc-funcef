inherited frmCadResponsavelMT: TfrmCadResponsavelMT
  Left = 88
  Top = 178
  HelpContext = 120012
  Caption = 'Cadastro de Responsáveis'
  ClientHeight = 470
  ClientWidth = 804
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 384
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 53
      Width = 802
      Height = 330
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Responsável')
      inherited pgctrlDetalhe: TPageControl
        Width = 704
        Height = 271
        ActivePage = tbsResponsavel
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 696
            Height = 243
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 696
            Height = 243
            inherited pnlItemsDoc: TPanel
              Height = 241
            end
            inherited pnlFoto: TPanel
              Width = 206
              Height = 241
              inherited BvlImagem: TBevel
                Height = 210
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 210
                Width = 206
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 204
                Height = 210
              end
            end
            inherited lstDocumentos: TListView
              Height = 241
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 696
            Height = 243
            inherited grpTipoEnd: TGroupBox
              Left = 499
              Height = 243
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 696
            Height = 243
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 467
            Height = 243
          end
          inherited Panel1: TPanel
            Width = 467
            Height = 243
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 467
            Height = 243
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 470
            Height = 243
            inherited GrdExibeContatos_Padrao: TwwDBGrid
              Height = 222
            end
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 494
            Height = 243
          end
          inherited Panel2: TPanel
            Width = 494
            Height = 243
          end
          inherited dbgContato: TwwDBGrid
            Width = 494
            Height = 243
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 497
            Height = 243
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 222
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 696
            Height = 243
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 696
            Height = 243
          end
        end
        object tbsResponsavel: TTabSheet
          Caption = 'Responsável'
          ImageIndex = 5
          object plnRespon: TPanel
            Left = 136
            Top = 21
            Width = 401
            Height = 161
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object chkAtivoFixo: TDBCheckBox
              Left = 16
              Top = 56
              Width = 241
              Height = 17
              Caption = 'Responsável pelos bens do Ativo Fixo'
              DataField = 'FLGATIVOFIXO'
              DataSource = dsSubTipo
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkContrato: TDBCheckBox
              Left = 16
              Top = 88
              Width = 241
              Height = 17
              Caption = 'Responsável pelo Contrato'
              DataField = 'FLGCONTRATO'
              DataSource = dsSubTipo
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkProjeto: TDBCheckBox
              Left = 16
              Top = 120
              Width = 233
              Height = 17
              Caption = 'Responsável pelo Projeto'
              DataField = 'FLGPROJETO'
              DataSource = dsSubTipo
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object plnCapBem: TPanel
              Left = 2
              Top = 2
              Width = 397
              Height = 31
              Align = alTop
              BevelInner = bvLowered
              Caption = 'Responsabilidades'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 794
      end
      inherited Dock974: TDock97
        Left = 708
        Height = 271
      end
    end
    inherited pnlMestre: TPanel
      Width = 802
      Height = 52
    end
  end
  inherited Dock972: TDock97
    Width = 804
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 804
  end
  inherited ds: TwwDataSource
    Left = 328
    Top = 56
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 56
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=RESPONSAVEL.IDRESPONSAVEL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '10')
  end
  inherited dsSubTipo: TwwDataSource
    Left = 496
    Top = 264
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 360
    Top = 384
  end
  inherited dsTelefone: TwwDataSource
    Left = 664
    Top = 336
  end
  inherited dsEndereco: TwwDataSource
    Left = 664
    Top = 208
  end
  inherited dsContato: TwwDataSource
    Left = 48
    Top = 368
  end
  inherited dsTelContato: TwwDataSource
    Left = 272
    Top = 384
  end
  inherited dsDocumento: TwwDataSource
    Left = 72
    Top = 192
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 664
    Top = 272
  end
  inherited dsImagem: TwwDataSource
    Left = 584
    Top = 272
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 584
    Top = 208
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 48
    Top = 304
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 584
    Top = 336
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 584
    Top = 320
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 664
    Top = 192
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 664
    Top = 320
  end
  inherited CdsContato: TCMClientDataSet
    Left = 48
    Top = 352
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 272
    Top = 368
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 584
    Top = 256
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 664
    Top = 256
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 584
    Top = 192
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 496
    Top = 248
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 360
    Top = 368
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 24
    Top = 240
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 48
    Top = 288
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 72
    Top = 240
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 496
    Top = 336
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 496
    Top = 320
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 24
    Top = 192
  end
end
