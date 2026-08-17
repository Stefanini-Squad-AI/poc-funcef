inherited frmTipoMercadoBMF: TfrmTipoMercadoBMF
  Left = 297
  Top = 192
  HelpContext = 790141
  Caption = 'Tipo de Mercado de BM&F'
  ClientHeight = 155
  ClientWidth = 342
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 342
    Height = 69
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeDescricao: TDBEdit
      Left = 12
      Top = 28
      Width = 317
      Height = 21
      DataField = 'DESCTPMERCADOBMF'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 342
  end
  inherited Dock971: TDock97
    Top = 116
    Width = 342
    inherited tb97Fundo: TToolbar97
      Left = 170
      DockPos = 173
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 1
      DockPos = 4
    end
  end
  inherited ds: TwwDataSource
    Left = 253
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOMERCADOBMF'
      'set '
      '  IDMERCADO = :IDMERCADO,'
      '  DESCTPMERCADOBMF = :DESCTPMERCADOBMF'
      'where'
      '  IDTIPOMERCADOBMF = :OLD_IDTIPOMERCADOBMF')
    InsertSQL.Strings = (
      'insert into TIPOMERCADOBMF'
      '  (IDTIPOMERCADOBMF, IDMERCADO, DESCTPMERCADOBMF)'
      'values'
      '  (:IDTIPOMERCADOBMF, :IDMERCADO, :DESCTPMERCADOBMF)')
    DeleteSQL.Strings = (
      'delete from TIPOMERCADOBMF'
      'where'
      '  IDTIPOMERCADOBMF = :OLD_IDTIPOMERCADOBMF')
    Left = 193
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOMERCADOBMF.DESCTPMERCADOBMF')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Mercado BM&&F')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOMERCADOBMF')
    CamposChave.Strings = (
      'TIPOMERCADOBMF.IDTIPOMERCADOBMF')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 301
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOMERCADOBMF,'
      '  IDMERCADO,'
      '  DESCTPMERCADOBMF'
      'FROM'
      '  TIPOMERCADOBMF'
      'WHERE'
      '  IDMERCADO = :P_IDMERCADO AND'
      '  IDTIPOMERCADOBMF = :P_IDTIPOMERCADOBMF  '
      'ORDER BY'
      '  DESCTPMERCADOBMF')
    Left = 223
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_IDMERCADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'P_IDTIPOMERCADOBMF'
        ParamType = ptUnknown
      end>
    object qryIDTIPOMERCADOBMF: TFloatField
      FieldName = 'IDTIPOMERCADOBMF'
      Origin = 'TIPOMERCADOBMF.IDTIPOMERCADOBMF'
    end
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOMERCADOBMF.IDMERCADO'
    end
    object qryDESCTPMERCADOBMF: TStringField
      FieldName = 'DESCTPMERCADOBMF'
      Origin = 'TIPOMERCADOBMF.DESCTPMERCADOBMF'
      Size = 60
    end
  end
end
