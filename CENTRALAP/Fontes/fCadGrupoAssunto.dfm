inherited frmCadGrupoAssunto: TfrmCadGrupoAssunto
  Left = 189
  Top = 183
  HelpContext = 190014
  Caption = 'Cadastro de Grupo de Assunto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      object Label1: TLabel
        Left = 24
        Top = 72
        Width = 114
        Height = 13
        Caption = 'Descrição do Grupo'
      end
      object EdtDescGrupo: TwwDBEdit
        Left = 24
        Top = 91
        Width = 497
        Height = 21
        DataField = 'DESCGRUPOASSUNTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Selected.Strings = (
        'DESCGRUPOASSUNTO'#9'60'#9'Descrição')
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '  IDGRUPOASSUNTO, DESCGRUPOASSUNTO '
      'FROM '
      '  GRUPOASSUNTO '
      'ORDER BY '
      '  DESCGRUPOASSUNTO')
    object qryDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOASSUNTO'
      Origin = '"CM.GRUPOASSUNTO".DESCGRUPOASSUNTO'
      Size = 60
    end
    object qryIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Origin = '"CM.GRUPOASSUNTO".IDGRUPOASSUNTO'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOASSUNTO'
      'set'
      '  IDGRUPOASSUNTO = :IDGRUPOASSUNTO,'
      '  DESCGRUPOASSUNTO = :DESCGRUPOASSUNTO'
      'where'
      '  IDGRUPOASSUNTO = :OLD_IDGRUPOASSUNTO')
    InsertSQL.Strings = (
      'insert into GRUPOASSUNTO'
      '  (IDGRUPOASSUNTO, DESCGRUPOASSUNTO)'
      'values'
      '  (:IDGRUPOASSUNTO, :DESCGRUPOASSUNTO)')
    DeleteSQL.Strings = (
      'delete from GRUPOASSUNTO'
      'where'
      '  IDGRUPOASSUNTO = :OLD_IDGRUPOASSUNTO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPOASSUNTO.DESCGRUPOASSUNTO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPOASSUNTO')
    CamposChave.Strings = (
      'GRUPOASSUNTO.IDGRUPOASSUNTO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
end
