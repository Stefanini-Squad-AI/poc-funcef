inherited FrmCadGrupoFormula: TFrmCadGrupoFormula
  Left = 305
  Top = 192
  HelpContext = 450011
  Caption = 'Grupo de Formula'
  ClientHeight = 195
  ClientWidth = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 381
    Height = 109
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Código do Grupo'
    end
    object Label2: TLabel
      Left = 12
      Top = 57
      Width = 114
      Height = 13
      Caption = 'Descrição do Grupo'
    end
    object dedCodigo: TwwDBEdit
      Left = 12
      Top = 31
      Width = 121
      Height = 21
      DataField = 'CODGRUPOFORMULA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dedDescricao: TwwDBEdit
      Left = 12
      Top = 72
      Width = 357
      Height = 21
      DataField = 'DESCGRUPOFORMULA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 381
  end
  inherited Dock971: TDock97
    Top = 156
    Width = 381
    inherited tb97Fundo: TToolbar97
      Left = 208
      DockPos = 208
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 40
      DockPos = 40
    end
  end
  inherited qry: TwwQuery
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT'
      '   CODGRUPOFORMULA, DESCGRUPOFORMULA'
      'FROM'
      '   GRPFORMULA'
      'WHERE'
      '   CODGRUPOFORMULA = :COD  ')
    ParamData = <
      item
        DataType = ftString
        Name = 'COD'
        ParamType = ptUnknown
      end>
    object qryCODGRUPOFORMULA: TStringField
      DisplayWidth = 6
      FieldName = 'CODGRUPOFORMULA'
      Size = 6
    end
    object qryDESCGRUPOFORMULA: TStringField
      DisplayWidth = 40
      FieldName = 'DESCGRUPOFORMULA'
      Size = 40
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRPFORMULA'
      'set'
      '  CODGRUPOFORMULA = :CODGRUPOFORMULA,'
      '  DESCGRUPOFORMULA = :DESCGRUPOFORMULA'
      'where'
      '  CODGRUPOFORMULA = :OLD_CODGRUPOFORMULA')
    InsertSQL.Strings = (
      'insert into GRPFORMULA'
      '  (CODGRUPOFORMULA, DESCGRUPOFORMULA)'
      'values'
      '  (:CODGRUPOFORMULA, :DESCGRUPOFORMULA)')
    DeleteSQL.Strings = (
      'delete from GRPFORMULA'
      'where'
      '  CODGRUPOFORMULA = :OLD_CODGRUPOFORMULA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRPFORMULA.CODGRUPOFORMULA'
      'GRPFORMULA.DESCGRUPOFORMULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do Grupo'
      'Descrição do Grupo ')
    Tabelas.Strings = (
      'GRPFORMULA')
    CamposChave.Strings = (
      'GRPFORMULA.CODGRUPOFORMULA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '6'
      '40')
    Left = 237
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryTrab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 304
    Top = 55
  end
end
