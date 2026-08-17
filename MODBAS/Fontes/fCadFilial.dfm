inherited frmCadFilial: TfrmCadFilial
  Left = 62
  Top = 91
  Caption = 'Estabelecimentos'
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
      inherited lblPdGrupo: TLabel
        Width = 63
        Caption = 'Pertence a'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 692
      Height = 252
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Segmento (Ramo de Atividade)')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
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
              inherited Bevel1: TBevel
                Height = 132
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 132
                Width = 96
                inherited btnAssociarimgPessoa: TButton
                  Caption = 'Associar &Logotipo'
                end
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
            LookupTable = qryRamo
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
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '82')
    Left = 459
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FILIALPESSOA'
      'set'
      '  IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
    InsertSQL.Strings = (
      'insert into FILIALPESSOA'
      '  (IDFILIALPESSOA, IDRAMOFORNECEDOR)'
      'values'
      '  (:IDFILIALPESSOA, :IDRAMOFORNECEDOR)')
    DeleteSQL.Strings = (
      'delete from FILIALPESSOA'
      'where'
      '  IDFILIALPESSOA = :OLD_IDFILIALPESSOA')
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT FILIALPESSOA.IDFILIALPESSOA, '
      '              FILIALPESSOA.IDRAMOFORNECEDOR '
      'FROM FILIALPESSOA'
      'WHERE ( FILIALPESSOA.IDFILIALPESSOA =  :IdPessoa )')
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 317
    Top = 124
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    SubTipo = stFilial
    FormCaption = 'Estabelecimentos'
  end
  object qryRamo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR '
      'FROM'
      '  RAMOFORNECEDOR'
      'ORDER BY'
      '  DESCRAMOFORNECEDOR')
    ValidateWithMask = True
    Left = 340
    Top = 344
  end
end
