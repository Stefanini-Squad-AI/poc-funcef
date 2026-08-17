inherited frmCadEntid: TfrmCadEntid
  Left = 70
  Top = 99
  Caption = 'Empresas e Entidades'
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
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 692
      Height = 252
      inherited pgctrlDetalhe: TPageControl
        Width = 599
        Height = 193
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 591
            Height = 165
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 591
            Height = 165
            inherited pnlItemsDoc: TPanel
              Height = 163
            end
            inherited pnlFoto: TPanel
              Width = 101
              Height = 163
              Visible = False
              inherited Bevel1: TBevel
                Height = 132
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 132
                Width = 101
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 99
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
            Width = 591
            Height = 165
            inherited grpTipoEnd: TGroupBox
              Left = 394
              Height = 165
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 591
            Height = 165
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Width = 591
            Height = 165
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 591
            Height = 165
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 591
            Height = 165
          end
          inherited dbgContato: TwwDBGrid
            Width = 591
            Height = 165
          end
        end
      end
      inherited Dock973: TDock97
        Width = 684
      end
      inherited Dock974: TDock97
        Left = 603
        Height = 193
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
      'PESSOA.NUMDOCUMENTO'
      'TERCEIRO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome da Empresa/Entidade'
      'CGC'
      'Código no Sistema')
    Tabelas.Strings = (
      'PESSOA'
      'TERCEIRO')
    CamposChave.Strings = (
      'TERCEIRO.IDPESSOA')
    Larguras.Strings = (
      '60'
      '22'
      '18')
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update TERCEIRO'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TERCEIRO'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from TERCEIRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT TERCEIRO.IDPESSOA'
      'FROM TERCEIRO'
      'WHERE ( TERCEIRO.IDPESSOA =:IdPessoa )')
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpOpcional
    SubTipo = stTerceiro
    FormCaption = 'Empresas e Entidades'
    MostraFoto = False
    UsaPessoaFisica = True
  end
end
