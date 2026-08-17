inherited frmCadTipoInvestidor: TfrmCadTipoInvestidor
  HelpContext = 790140
  Caption = 'Cadastro Tipo de Investidor'
  ClientHeight = 167
  ClientWidth = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 439
    Height = 81
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeDescricao: TwwDBEdit
      Left = 16
      Top = 32
      Width = 401
      Height = 21
      DataField = 'DESCTPINVESTIDOR'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 439
  end
  inherited Dock971: TDock97
    Top = 128
    Width = 439
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 270
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 101
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOINVESTIDOR'
      'set'
      '  DESCTPINVESTIDOR = :DESCTPINVESTIDOR'
      'where'
      '  IDTIPOINVESTIDOR = :OLD_IDTIPOINVESTIDOR')
    InsertSQL.Strings = (
      'insert into TIPOINVESTIDOR'
      '  (IDTIPOINVESTIDOR, DESCTPINVESTIDOR)'
      'values'
      '  (:IDTIPOINVESTIDOR, :DESCTPINVESTIDOR)')
    DeleteSQL.Strings = (
      'delete from TIPOINVESTIDOR'
      'where'
      '  IDTIPOINVESTIDOR = :OLD_IDTIPOINVESTIDOR')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVESTIDOR.DESCTPINVESTIDOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Investidor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOINVESTIDOR')
    CamposChave.Strings = (
      'TIPOINVESTIDOR.IDTIPOINVESTIDOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDTIPOINVESTIDOR,'
      '  DESCTPINVESTIDOR'
      'FROM'
      '  TIPOINVESTIDOR'
      'WHERE'
      '  IDTIPOINVESTIDOR = :P_IDTIPOINVESTIDOR')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOINVESTIDOR'
        ParamType = ptUnknown
      end>
    object qryIDTIPOINVESTIDOR: TFloatField
      FieldName = 'IDTIPOINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.IDTIPOINVESTIDOR'
    end
    object qryDESCTPINVESTIDOR: TStringField
      FieldName = 'DESCTPINVESTIDOR'
      Origin = 'TIPOINVESTIDOR.DESCTPINVESTIDOR'
      Size = 60
    end
  end
end
