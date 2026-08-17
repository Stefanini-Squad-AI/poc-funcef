inherited frmCadAdvog: TfrmCadAdvog
  Left = 78
  Top = 100
  HelpContext = 1100002
  Caption = 'Advogados, Assistentes Técnicos e Peritos'
  ClientHeight = 453
  ClientWidth = 702
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 367
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 692
      Height = 252
      inherited pgctrlDetalhe: TPageControl
        Width = 594
        Height = 193
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 586
            Height = 165
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 586
            Height = 165
            inherited pnlItemsDoc: TPanel
              Height = 163
            end
            inherited pnlFoto: TPanel
              Width = 96
              Height = 163
              Visible = False
              inherited Bevel1: TBevel
                Height = 132
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 132
                Width = 96
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 94
                Height = 132
              end
            end
            inherited lstDocumentos: TListView
              Height = 163
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 586
            Height = 165
            inherited grpTipoEnd: TGroupBox
              Left = 389
              Height = 165
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 586
            Height = 165
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 586
            Height = 165
          end
          inherited Panel1: TPanel
            Width = 586
            Height = 165
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 586
            Height = 165
          end
          inherited dbgContato: TwwDBGrid
            Width = 586
            Height = 165
          end
        end
      end
      inherited Dock973: TDock97
        Width = 684
      end
      inherited Dock974: TDock97
        Left = 598
        Height = 193
      end
    end
    inherited pnlMestre: TPanel
      Width = 692
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 702
    inherited Toolbar971: TToolbar97
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 702
    inherited tb97Fundo: TToolbar97
      Left = 532
      DockPos = 532
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1100002
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 364
    end
  end
  inherited qry: TwwQuery
    inherited qryNUMDOCUMENTO: TStringField
      EditMask = '99\.999\.999\/9999\-99;0; '
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'FORNSERV.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA')
    Larguras.Strings = (
      '60'
      '22')
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FORNSERV'
      'set'
      '  FLGASS = :FLGASS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FORNSERV'
      '  (IDPESSOA, FLGASS)'
      'values'
      '  (:IDPESSOA, :FLGASS)')
    DeleteSQL.Strings = (
      'delete from FORNSERV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    AfterInsert = qrySubTipoAfterInsert
    SQL.Strings = (
      'SELECT FORNSERV.* '
      'FROM FORNSERV'
      'WHERE ( FORNSERV.IDPESSOA =:IdPessoa )')
  end
  inherited updPessoaFisica: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOAFISICA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODESTADO = :CODESTADO,'
      '  IDPAIS = :IDPAIS,'
      '  IDFONTRECR = :IDFONTRECR,'
      '  IDGRINSTR = :IDGRINSTR,'
      '  IDPROFISS = :IDPROFISS,'
      '  NOMEPAI = :NOMEPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  DATAMORTE = :DATAMORTE,'
      '  DATANASC = :DATANASC,'
      '  SEXO = :SEXO,'
      '  TIPOSANG = :TIPOSANG,'
      '  ESTCIVIL = :ESTCIVIL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOAFISICA'
      
        '  (IDPESSOA, CODESTADO, IDPAIS, IDFONTRECR, IDGRINSTR, IDPROFISS' +
        ', '
      'NOMEPAI, '
      '   NOMEMAE, DATAMORTE, DATANASC, SEXO, TIPOSANG, ESTCIVIL)'
      'values'
      
        '  (:IDPESSOA, :CODESTADO, :IDPAIS, :IDFONTRECR, :IDGRINSTR, :IDP' +
        'ROFISS, '
      '   :NOMEPAI, :NOMEMAE, :DATAMORTE, :DATANASC, :SEXO, :TIPOSANG, '
      ':ESTCIVIL)')
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpOpcional
    SubTipo = stFornecedor
    FormCaption = 'Advogados, Assistentes Técnicos e Peritos'
    MostraFoto = False
  end
end
