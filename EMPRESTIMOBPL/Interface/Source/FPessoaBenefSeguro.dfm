inherited frmPessoaBenefSeguro: TfrmPessoaBenefSeguro
  Left = 34
  Top = 79
  HelpContext = 150034
  Caption = 'Beneficiários de Seguros'
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Height = 321
      inherited pgctrlDetalhe: TPageControl
        Height = 262
        ActivePage = tbsDocumento
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 234
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 234
            inherited pnlItemsDoc: TPanel
              Height = 232
            end
            inherited pnlFoto: TPanel
              Height = 232
              inherited Bevel1: TBevel
                Height = 201
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 201
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 201
              end
            end
            inherited lstDocumentos: TListView
              Height = 232
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 234
            inherited lblPdLocal: TLabel
              Visible = False
            end
            inherited dbedNomeEndereco: TDBEdit
              Visible = False
            end
            inherited grpTipoEnd: TGroupBox
              Height = 234
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 234
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 234
          end
          inherited Panel1: TPanel
            Height = 234
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 234
          end
          inherited dbgContato: TwwDBGrid
            Height = 234
          end
        end
      end
      inherited Dock973: TDock97
        inherited tb97TituloDetalhe: TToolbar97
          inherited dbedPaiDetalhe: TwwDBEdit
            Color = clBtnFace
            DataField = ''
            DataSource = nil
            Font.Color = clBtnFace
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Height = 262
      end
    end
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Descricao.Strings = (
      'CPF ou CNPJ'
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'BENEFSEGURO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BENEFSEGURO.IDBENEFSEGURO')
    Larguras.Strings = (
      '18'
      '40'
      '40')
    Left = 539
    Top = 115
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    BeforeConfirma = CmeDetalheBeforeConfirma
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFSEGURO'
      'set'
      '  IDBENEFSEGURO = :IDBENEFSEGURO'
      'where'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    InsertSQL.Strings = (
      'insert into BENEFSEGURO'
      '  (IDBENEFSEGURO)'
      'values'
      '  (:IDBENEFSEGURO)')
    DeleteSQL.Strings = (
      'delete from BENEFSEGURO'
      'where'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    Left = 380
    Top = 268
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT BENEFSEGURO.IDBENEFSEGURO'
      'FROM BENEFSEGURO'
      'WHERE ( BENEFSEGURO.IDBENEFSEGURO =:IdPessoa )')
    Left = 377
    Top = 220
    object qrySubTipoIDBENEFSEGURO: TFloatField
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.BENEFSEGURO.IDBENEFSEGURO'
    end
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpFisica
    SubTipo = stBenefSeguro
    FormCaption = 'Beneficiário'
  end
end
