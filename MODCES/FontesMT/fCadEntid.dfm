inherited frmCadEntid: TfrmCadEntid
  Left = -2
  Top = 79
  Caption = ''
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
    inherited Toolbar971: TToolbar97
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
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
    Left = 739
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 739
    Top = 19
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 513
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'TERCEIRO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'CGC'
      'Código no Sistema')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'TERCEIRO')
    CamposChave.Strings = (
      'TERCEIRO.IDPESSOA')
    Filtro.Strings = (
      'TERCEIRO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '18')
    Left = 583
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 513
    Top = 14
  end
  inherited dsDet: TwwDataSource
    Left = 406
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 452
    Top = 1
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 725
    Top = 354
  end
  inherited ImlDocumentos: TImageList
    Left = 739
    Top = 33
  end
  inherited dsTelefone: TwwDataSource
    Left = 167
    Top = 411
  end
  inherited dsEndereco: TwwDataSource
    Left = 99
    Top = 411
  end
  inherited dsContato: TwwDataSource
    Left = 231
    Top = 410
  end
  inherited dsTelContato: TwwDataSource
    Left = 299
    Top = 409
  end
  inherited dsDocumento: TwwDataSource
    Left = 25
    Top = 410
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 725
    Top = 241
  end
  inherited dsImagem: TwwDataSource
    Left = 546
    Top = 408
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 379
    Top = 409
  end
  inherited MSGrupo: TMontaSelect
    Left = 583
    Top = 14
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 725
    Top = 297
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 25
    Top = 424
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 725
    Top = 124
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 99
    Top = 424
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 167
    Top = 424
  end
  inherited CdsContato: TCMClientDataSet
    Left = 231
    Top = 423
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 299
    Top = 423
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 546
    Top = 422
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 725
    Top = 254
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 379
    Top = 423
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 452
    Top = 14
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 725
    Top = 368
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 725
    Top = 138
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 725
    Top = 311
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 725
    Top = 152
  end
  inherited MsCidades: TMontaSelect
    Left = 583
    Top = 27
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 467
    Top = 409
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 467
    Top = 423
  end
  inherited MsBanco: TMontaSelect
    Left = 583
    Top = 40
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 725
    Top = 166
  end
  inherited ppmCaixa: TPopupMenu
    Left = 739
    Top = 46
  end
end
