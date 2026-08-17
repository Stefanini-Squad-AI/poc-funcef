inherited FrmFormaAtend: TFrmFormaAtend
  Left = 245
  Top = 242
  HelpContext = 190012
  Caption = 'Forma de Atendimento'
  ClientHeight = 226
  ClientWidth = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 474
    Height = 140
    inherited pnlControles: TPanel
      Width = 464
      Height = 130
      object Label1: TLabel
        Left = 16
        Top = 22
        Width = 181
        Height = 13
        Caption = 'Nome da Forma de Atendimento'
      end
      object DbeDescricao: TDBEdit
        Left = 16
        Top = 40
        Width = 425
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 80
        Width = 257
        Height = 17
        Caption = 'Emite Rubs no momento do atendimento'
        DataField = 'FLGEMITERUBS'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 464
      Height = 130
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição')
    end
  end
  inherited Dock972: TDock97
    Width = 474
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 474
    inherited tb97Fundo: TToolbar97
      Left = 304
      DockPos = 304
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 136
      DockPos = 136
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOATEND,            '
      '  NOME, FLGEMITERUBS                       '
      'FROM '
      '  TIPOATEND'
      'ORDER BY '
      '  NOME')
    object qryNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'TIPOATEND.NOME'
      Required = True
      Size = 60
    end
    object qryIDTIPOATEND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOATEND'
      Origin = 'TIPOATEND.IDTIPOATEND'
      Visible = False
    end
    object qryFLGEMITERUBS: TStringField
      FieldName = 'FLGEMITERUBS'
      Origin = 'TIPOATEND.FLGEMITERUBS'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 112
    Top = 102
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOATEND'
      'set'
      '  IDTIPOATEND = :IDTIPOATEND,'
      '  NOME = :NOME,'
      '  FLGEMITERUBS = :FLGEMITERUBS'
      'where'
      '  IDTIPOATEND = :OLD_IDTIPOATEND')
    InsertSQL.Strings = (
      'insert into TIPOATEND'
      '  (IDTIPOATEND, NOME, FLGEMITERUBS)'
      'values'
      '  (:IDTIPOATEND, :NOME, :FLGEMITERUBS)')
    DeleteSQL.Strings = (
      'delete from TIPOATEND'
      'where'
      '  IDTIPOATEND = :OLD_IDTIPOATEND')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOATEND.IDTIPOATEND'
      'TIPOATEND.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOATEND')
    CamposChave.Strings = (
      'TIPOATEND.IDTIPOATEND')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
  end
  inherited ImlPadrao: TImageList
    Left = 241
    Top = 101
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 374
    Top = 38
  end
end
