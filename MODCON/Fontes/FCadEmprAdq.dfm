inherited frmCadEmprAdq: TfrmCadEmprAdq
  Left = 66
  Top = 100
  Caption = 'Empresa Adquirida ou Adquirente'
  ClientHeight = 453
  ClientWidth = 702
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 367
    inherited pnlMestre: TPanel
      Width = 692
    end
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
          inherited dbgrdDet: TwwDBGrid
            Width = 586
            Height = 165
          end
          inherited pnlControlesDet: TPanel
            Width = 586
            Height = 165
            inherited grpTipoEnd: TGroupBox
              Left = 389
              Height = 165
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Width = 586
            Height = 165
          end
          inherited dbgTelefone: TwwDBGrid
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
  end
  inherited Dock972: TDock97
    Width = 702
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 702
    inherited tb97Fundo: TToolbar97
      Left = 532
      DockPos = 532
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 364
      DockPos = 364
    end
  end
  inherited MontaSelect: TMontaSelect
    Descricao.Strings = (
      'Nome Fantasia'
      'Razão Social'
      'CNPJ ou Equiv.')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA')
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FORNSERV'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FORNSERV'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from FORNSERV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT FORNSERV.IDPESSOA '
      'FROM FORNSERV'
      'WHERE ( FORNSERV.IDPESSOA =:IdPessoa )')
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    SubTipo = stFornecedor
    FormCaption = 'Empresa Adquirida ou Adquirente'
    MostraFoto = False
  end
end
