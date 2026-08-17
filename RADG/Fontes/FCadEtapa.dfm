inherited frmCadEtapa: TfrmCadEtapa
  Left = 163
  Top = 164
  Caption = 'Cadastro de Tipos de Etapa'
  ClientHeight = 315
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 536
    Height = 229
    object lblNome: TLabel
      Left = 16
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Nome da Etapa'
      FocusControl = dbedNome
    end
    object lblDescEtapa: TLabel
      Left = 16
      Top = 64
      Width = 113
      Height = 13
      Caption = 'Descrição da Etapa'
    end
    object dbedNome: TDBEdit
      Left = 16
      Top = 32
      Width = 505
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object dbmeDescEtapa: TDBMemo
      Left = 16
      Top = 80
      Width = 505
      Height = 105
      DataField = 'DESCRICAO'
      DataSource = ds
      MaxLength = 200
      TabOrder = 1
    end
    object dbchkautoriz: TDBCheckBox
      Left = 16
      Top = 192
      Width = 153
      Height = 17
      Caption = 'Possui Autorização'
      DataField = 'FLGAUTORIZACAO'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbchkRetorna: TDBCheckBox
      Left = 232
      Top = 192
      Width = 169
      Height = 17
      Caption = 'Retorna a Etapa Anterior'
      DataField = 'FLGRETORETAPA'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 536
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 536
    inherited tb97Fundo: TToolbar97
      Left = 281
      DockPos = 281
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 113
      DockPos = 113
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDTIPOETAPA,'
      '      NOME,'
      '      FLGAUTOMATICA,'
      '      FLGAUTORIZACAO,'
      '      FLGRETORETAPA, '
      '      DESCRICAO'
      'FROM '
      '      RADTIPOETAPA'
      'WHERE'
      '       IDTIPOETAPA =:IDRADTIP ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRADTIP'
        ParamType = ptUnknown
      end>
    object qryIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADTIPOETAPA.IDTIPOETAPA'
    end
    object qryFLGAUTOMATICA: TStringField
      FieldName = 'FLGAUTOMATICA'
      Origin = 'RADTIPOETAPA.FLGAUTOMATICA'
      Size = 1
    end
    object qryFLGAUTORIZACAO: TStringField
      FieldName = 'FLGAUTORIZACAO'
      Origin = 'RADTIPOETAPA.FLGAUTORIZACAO'
      Size = 1
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'RADTIPOETAPA.DESCRICAO'
      Size = 200
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
    object qryFLGRETORETAPA: TStringField
      FieldName = 'FLGRETORETAPA'
      Origin = 'RADTIPOETAPA.FLGRETORETAPA'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 523
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADTIPOETAPA'
      'set'
      '  IDTIPOETAPA = :IDTIPOETAPA,'
      '  NOME = :NOME,'
      '  FLGAUTOMATICA = :FLGAUTOMATICA,'
      '  FLGAUTORIZACAO = :FLGAUTORIZACAO,'
      '  FLGRETORETAPA = :FLGRETORETAPA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
    InsertSQL.Strings = (
      'insert into RADTIPOETAPA'
      '  (IDTIPOETAPA, NOME, FLGAUTOMATICA, FLGAUTORIZACAO, '
      'FLGRETORETAPA, DESCRICAO)'
      'values'
      '  (:IDTIPOETAPA, :NOME, :FLGAUTOMATICA, :FLGAUTORIZACAO, '
      ':FLGRETORETAPA, '
      '   :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from RADTIPOETAPA'
      'where'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOETAPA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Etapa')
    Tabelas.Strings = (
      'RADTIPOETAPA')
    CamposChave.Strings = (
      'RADTIPOETAPA.IDTIPOETAPA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
end
