inherited frmCadTipoCliente: TfrmCadTipoCliente
  Left = 74
  Top = 130
  Caption = 'Tipo de Cliente'
  ClientHeight = 275
  ClientWidth = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 374
    Height = 189
    inherited pnlControles: TPanel
      Width = 364
      Height = 179
      object lblDescricao: TLabel
        Left = 39
        Top = 60
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedDescricao: TwwDBEdit
        Left = 39
        Top = 75
        Width = 301
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 364
      Height = 179
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Descrição')
      TitleAlignment = taCenter
    end
  end
  inherited Dock972: TDock97
    Width = 374
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 374
    inherited tb97Fundo: TToolbar97
      Left = 198
      DockPos = 198
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 30
      DockPos = 30
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT IDTIPOCLIENTE,DESCRICAO FROM TIPOCLIENTE ORDER BY DESCRIC' +
        'AO')
    Top = 104
    object qryIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCLIENTE'
      'set'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    InsertSQL.Strings = (
      'insert into TIPOCLIENTE'
      '  (IDTIPOCLIENTE, DESCRICAO)'
      'values'
      '  (:IDTIPOCLIENTE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOCLIENTE'
      'where'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    Left = 249
    Top = 72
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCLIENTE.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOCLIENTE')
    CamposChave.Strings = (
      'TIPOCLIENTE.IDTIPOCLIENTE')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 317
    Top = 16
  end
  inherited ds: TwwDataSource
    Left = 263
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 58
  end
end
