inherited frmCadAndamento: TfrmCadAndamento
  Left = 129
  Top = 180
  Caption = 'Cadastro de Andamentos'
  ClientHeight = 168
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 129
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 334
      DockPos = 334
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 166
      DockPos = 166
    end
  end
  inherited Dock972: TDock97
    Width = 504
  end
  inherited pnlFundo: TPanel [2]
    Width = 504
    Height = 82
    object lblNome: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedNome: TwwDBEdit
      Left = 16
      Top = 32
      Width = 465
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '     IDANDAMENTO,'
      '     NOME'
      'FROM'
      '     RADANDAMENTO'
      'WHERE'
      '     IDANDAMENTO = :IDAND')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDAND'
        ParamType = ptUnknown
      end>
    object qryIDANDAMENTO: TFloatField
      FieldName = 'IDANDAMENTO'
      Origin = 'RADANDAMENTO.IDANDAMENTO'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADANDAMENTO.NOME'
      Size = 30
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 531
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADANDAMENTO'
      'set'
      '  IDANDAMENTO = :IDANDAMENTO,'
      '  NOME = :NOME'
      'where'
      '  IDANDAMENTO = :OLD_IDANDAMENTO')
    InsertSQL.Strings = (
      'insert into RADANDAMENTO'
      '  (IDANDAMENTO, NOME)'
      'values'
      '  (:IDANDAMENTO, :NOME)')
    DeleteSQL.Strings = (
      'delete from RADANDAMENTO'
      'where'
      '  IDANDAMENTO = :OLD_IDANDAMENTO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADANDAMENTO.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'RADANDAMENTO')
    CamposChave.Strings = (
      'RADANDAMENTO.IDANDAMENTO')
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
