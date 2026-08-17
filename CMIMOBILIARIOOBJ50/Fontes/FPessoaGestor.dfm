inherited frmPessoaGestor: TfrmPessoaGestor
  Left = -20
  Top = 55
  Caption = 'Gestor de carteira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      inherited lblNome: TLabel
        Left = 160
        Top = 10
      end
      inherited LabelRAZAOSOCIAL: TLabel
        Top = 50
      end
      inherited lblEMail: TLabel
        Left = 456
        Top = 10
      end
      inherited lblPdGrupo: TLabel
        Left = 456
        Top = 50
      end
      inherited SpeedButton1: TSpeedButton
        Left = 748
        Top = 62
        Width = 25
        Height = 25
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 600
        Top = 10
      end
      inherited dbedNomeFantasia: TDBEdit
        Left = 160
        Top = 24
        Width = 281
      end
      inherited dbedDocumento: TwwDBEdit
        Top = 24
      end
      inherited dbedRazaoSocial: TDBEdit
        Top = 64
      end
      inherited dbedemail: TwwDBEdit
        Left = 456
        Top = 24
      end
      inherited edDBGrupo: TwwDBEdit
        Left = 456
        Top = 64
        Width = 292
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 600
        Top = 24
        Width = 173
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        Width = 690
        TabOrder = 2
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 682
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 682
            inherited pnlItemsDoc: TPanel
              inherited pnlNomeDoc: TPanel
                Caption = 'pnlNomeDoc'
              end
              inherited pnlOrgao: TPanel
                Caption = 'pnlOrgao'
              end
              inherited pnlEmissao: TPanel
                Caption = 'pnlEmissao'
              end
              inherited pnlUF: TPanel
                Caption = 'pnlUF'
              end
            end
            inherited pnlFoto: TPanel
              Width = 192
              Visible = False
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 192
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 190
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 682
            Caption = 'pnlControlesDet'
            inherited grpTipoEnd: TGroupBox
              Left = 485
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 682
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Width = 682
            Caption = 'Panel1'
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 682
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 682
            Caption = 'Panel2'
          end
          inherited dbgContato: TwwDBGrid
            Width = 682
          end
        end
      end
      inherited Dock973: TDock97
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnExcluiDet: TToolbarButton97
            DisplayMode = dmBoth
            Caption = 'E&xcluir'
          end
        end
        inherited tb97TituloDetalhe: TToolbar97
          inherited dbedPaiDetalhe: TwwDBEdit
            Width = 500
          end
        end
      end
      inherited Dock974: TDock97
        Left = 694
        Width = 92
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Width = 87
            Margin = 4
          end
          inherited bbtnCancelarDet: TBitBtn
            Width = 87
            Margin = 4
          end
          inherited bbtnVoltarDet: TBitBtn
            Width = 87
            Visible = False
            Margin = 4
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
  end
  inherited qry: TwwQuery
    Left = 413
    Top = 11
  end
  inherited dsDet: TwwDataSource
    Left = 303
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65497
    Top = 65497
  end
  inherited upd: TUpdateSQL
    Left = 457
    Top = 17
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Razão Social')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CM.GESTORCARTEIRA'
      'CM.PESSOA')
    CamposChave.Strings = (
      'IDGESTORCARTEIRA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 360
  end
  inherited ds: TwwDataSource
    Left = 500
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.GESTORCARTEIRA'
      'set'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA'
      'where'
      '  IDGESTORCARTEIRA = :OLD_IDGESTORCARTEIRA')
    InsertSQL.Strings = (
      'insert into CM.GESTORCARTEIRA'
      '  (IDGESTORCARTEIRA)'
      'values'
      '  (:IDGESTORCARTEIRA)')
    DeleteSQL.Strings = (
      'delete from CM.GESTORCARTEIRA'
      'where'
      '  IDGESTORCARTEIRA = :OLD_IDGESTORCARTEIRA')
    Left = 585
    Top = 72
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT       G.IDGESTORCARTEIRA'
      ''
      'FROM          CM.GESTORCARTEIRA G'
      ''
      'WHERE ( G.IDGESTORCARTEIRA =:IdPessoa )')
    Left = 513
    Top = 72
  end
  inherited dsSubTipo: TwwDataSource
    Top = 64
  end
  inherited ImageList1: TImageList
    Left = 320
    Top = 252
  end
  inherited qryDocumento: TwwQuery
    Left = 487
    Top = 250
  end
  inherited dsDocumento: TwwDataSource
    Left = 375
  end
  inherited updDocumento: TUpdateSQL
    Left = 382
    Top = 322
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 380
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 285
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpOpcional
    SubTipo = stGestorCarteira
    MostraFoto = False
    Left = 253
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 390
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 486
    Top = 408
  end
  inherited qryImagensDoc: TwwQuery
    Left = 284
    Top = 335
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 485
    Top = 299
  end
  inherited MSGrupo: TMontaSelect
    Left = 690
    Top = 88
  end
  inherited qryEstado: TwwQuery
    Left = 343
    Top = 116
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 205
    Top = 316
  end
end
