inherited frmCadRamo: TfrmCadRamo
  Left = 198
  Top = 148
  Caption = 'Tabela dos Segmentos (Ramos de Atividade)'
  ClientHeight = 331
  ClientWidth = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 378
    Height = 245
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 370
      Height = 237
      object Label1: TLabel
        Left = 22
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label2: TLabel
        Left = 22
        Top = 103
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedCodigo: TDBEdit
        Left = 22
        Top = 64
        Width = 48
        Height = 21
        DataField = 'IDRAMOFORNECEDOR'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 22
        Top = 118
        Width = 327
        Height = 21
        DataField = 'DESCRAMOFORNECEDOR'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 370
      Height = 237
      Selected.Strings = (
        'IDRAMOFORNECEDOR'#9'10'#9'Código'#9'F'
        'DESCRAMOFORNECEDOR'#9'30'#9'Descrição'#9'F')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 378
  end
  inherited Dock971: TDock97
    Top = 292
    Width = 378
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
    SQL.Strings = (
      'SELECT'
      '  IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR'
      'FROM'
      '  RAMOFORNECEDOR'
      'ORDER BY'
      '  DESCRAMOFORNECEDOR')
    Top = 2
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 302
    Top = 107
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RAMOFORNECEDOR'
      'set'
      '  IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR,'
      '  DESCRAMOFORNECEDOR = :DESCRAMOFORNECEDOR'
      'where'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    InsertSQL.Strings = (
      'insert into RAMOFORNECEDOR'
      '  (IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR)'
      'values'
      '  (:IDRAMOFORNECEDOR, :DESCRAMOFORNECEDOR)')
    DeleteSQL.Strings = (
      'delete from RAMOFORNECEDOR'
      'where'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Segmentos (Ramos de Atividade)'
    Colunas.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR'
      'RAMOFORNECEDOR.DESCRAMOFORNECEDOR')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RAMOFORNECEDOR')
    CamposChave.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 302
    Top = 58
  end
  inherited ds: TwwDataSource
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 222
    Top = 66
  end
end
