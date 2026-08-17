inherited FrmCadGrpProcesso: TFrmCadGrpProcesso
  Left = 165
  Top = 266
  Caption = 'Grupo de Processo'
  ClientHeight = 178
  ClientWidth = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 536
    Height = 92
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDesc
    end
    object edDesc: TDBEdit
      Left = 24
      Top = 40
      Width = 484
      Height = 21
      DataField = 'DESCGRUPOPROCESSO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 536
  end
  inherited Dock971: TDock97
    Top = 139
    Width = 536
    inherited tb97Fundo: TToolbar97
      Left = 198
      DockPos = 198
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 368
      DockPos = 368
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOPROCESSO,'
      '      DESCGRUPOPROCESSO'
      'FROM'
      '      RADGRUPOPROCESSO'
      'WHERE'
      '     (IDGRUPOPROCESSO = :IDGRUPOPROCESSO)')
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOPROCESSO'
        ParamType = ptUnknown
      end>
    object qryIDGRUPOPROCESSO: TFloatField
      FieldName = 'IDGRUPOPROCESSO'
      Origin = 'RADGRUPOPROCESSO.IDGRUPOPROCESSO'
    end
    object qryDESCGRUPOPROCESSO: TStringField
      FieldName = 'DESCGRUPOPROCESSO'
      Origin = 'RADGRUPOPROCESSO.DESCGRUPOPROCESSO'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADGRUPOPROCESSO'
      'set'
      '  DESCGRUPOPROCESSO = :DESCGRUPOPROCESSO'
      'where'
      '  IDGRUPOPROCESSO = :OLD_IDGRUPOPROCESSO')
    InsertSQL.Strings = (
      'insert into RADGRUPOPROCESSO'
      '  (IDGRUPOPROCESSO, DESCGRUPOPROCESSO)'
      'values'
      '  (:IDGRUPOPROCESSO, :DESCGRUPOPROCESSO)')
    DeleteSQL.Strings = (
      'delete from RADGRUPOPROCESSO'
      'where'
      '  IDGRUPOPROCESSO = :OLD_IDGRUPOPROCESSO')
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADGRUPOPROCESSO.DESCGRUPOPROCESSO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADGRUPOPROCESSO')
    CamposChave.Strings = (
      'RADGRUPOPROCESSO.IDGRUPOPROCESSO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited ds: TwwDataSource
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
end
