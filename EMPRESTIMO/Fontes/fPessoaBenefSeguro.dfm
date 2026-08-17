inherited frmPessoaBenefSeguro: TfrmPessoaBenefSeguro
  Left = 100
  Top = 70
  Caption = 'Beneficiários de Seguros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      Height = 53
      inherited lblNome: TLabel
        Width = 33
        Caption = 'Nome'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 58
      Height = 356
      inherited pgctrlDetalhe: TPageControl
        Height = 297
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 269
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 269
            inherited pnlItemsDoc: TPanel
              Height = 267
            end
            inherited pnlFoto: TPanel
              Height = 267
              inherited Bevel1: TBevel
                Height = 236
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 236
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 236
              end
            end
            inherited lstDocumentos: TListView
              Height = 267
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Height = 269
          end
          inherited pnlControlesDet: TPanel
            Height = 269
            inherited grpTipoEnd: TGroupBox
              Height = 269
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Height = 269
          end
          inherited dbgTelefone: TwwDBGrid
            Height = 269
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 269
          end
          inherited dbgContato: TwwDBGrid
            Height = 269
          end
        end
      end
      inherited Dock974: TDock97
        Height = 297
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
