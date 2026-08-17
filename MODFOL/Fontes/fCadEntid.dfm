inherited frmCadEntid: TfrmCadEntid
  Left = -4
  Top = -4
  Caption = 'Empresas de Transporte'
  ClientHeight = 581
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 495
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 792
      inherited lblDocumento: TLabel
        Width = 32
        Caption = 'CNPJ'
      end
      inherited lblPdGrupo: TLabel
        Width = 63
        Caption = 'Pertence a'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 109
      Width = 792
      Height = 382
      inherited pgctrlDetalhe: TPageControl
        Width = 694
        Height = 323
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 686
            Height = 295
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 686
            Height = 295
            inherited pnlItemsDoc: TPanel
              Height = 293
            end
            inherited pnlFoto: TPanel
              Width = 196
              Height = 293
              Visible = False
              inherited Bevel1: TBevel
                Height = 262
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 262
                Width = 196
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 194
                Height = 262
              end
            end
            inherited lstDocumentos: TListView
              Height = 293
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 686
            Height = 295
          end
          inherited pnlControlesDet: TPanel
            Width = 686
            Height = 295
            inherited grpTipoEnd: TGroupBox
              Left = 489
              Height = 295
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Width = 686
            Height = 295
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 686
            Height = 295
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 686
            Height = 295
          end
          inherited dbgContato: TwwDBGrid
            Width = 686
            Height = 295
          end
        end
      end
      inherited Dock973: TDock97
        Width = 784
      end
      inherited Dock974: TDock97
        Left = 698
        Height = 323
      end
    end
  end
  inherited Dock971: TDock97
    Top = 542
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
    SQL.Strings = (
      'SELECT'
      ' PESSOA.IDPESSOA ,'
      ' PESSOA.IDIMAGEM,'
      ' PESSOA.NOME ,'
      ' PESSOA.TIPO ,'
      ' PESSOA.RAZAOSOCIAL ,'
      ' PESSOA.NUMDOCUMENTO ,'
      ' PESSOA.IDDOCUMENTO ,'
      ' PESSOA.EMAIL ,'
      ' PESSOA.IDGRUPO,'
      ' PESSOA.IDENDCOMERCIAL,'
      ' PESSOA.IDENDRESIDENCIAL,'
      ' PESSOA.IDENDENTREGA,'
      ' PESSOA.IDENDCOBRANCA,'
      ' PESSOA.IDENDCORRESP,'
      ' G.NOME AS NOMEGRUPO,'
      ' PESSOA.HOMEPAGE,'
      ' PESSOA.IDMODULORESPON,'
      ' MODULO.NOMEMODULO'
      ''
      'FROM PESSOA, PESSOA g, MODULO'
      'WHERE ( PESSOA.IDPESSOA =:IdPessoa )  AND'
      '      ( G.IDPESSOA(+) = PESSOA.IDGRUPO ) AND'
      '      ( MODULO.IDMODULO(+) = PESSOA.IDMODULORESPON )')
    inherited qryNUMDOCUMENTO: TStringField
      EditMask = '99\.999\.999\/9999\-99;0; '
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empresas de Transporte'
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
    Filtro.Strings = (
      'TERCEIRO.IDPESSOA = PESSOA.IDPESSOA')
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
  inherited qryEscolhePessoa: TwwQuery
    Left = 250
    Top = 55
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    SubTipo = stTerceiro
    FormCaption = 'Empresas de Transporte'
    MostraFoto = False
  end
  inherited MSGrupo: TMontaSelect
    SensivelACaixa.Strings = (
      'N'
      'N')
  end
end
