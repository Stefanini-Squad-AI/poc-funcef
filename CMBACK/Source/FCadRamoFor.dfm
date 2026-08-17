inherited frmCadRamoFor: TfrmCadRamoFor
  Left = 399
  Top = 191
  Caption = 'Cadastro de Ramo de Fornecedor'
  ClientHeight = 287
  ClientWidth = 372
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 372
    Height = 201
    inherited pnlControles: TPanel
      Width = 362
      Height = 191
      TabOrder = 0
      object Label1: TLabel
        Left = 32
        Top = 66
        Width = 119
        Height = 13
        Caption = 'Ramo de Fornecedor'
      end
      object dbedRamoFor: TwwDBEdit
        Left = 31
        Top = 81
        Width = 301
        Height = 21
        DataField = 'DESCRAMOFORNECEDOR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 362
      Height = 191
      Selected.Strings = (
        'DESCRAMOFORNECEDOR'#9'40'#9'Descríção')
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 372
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 372
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
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
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RAMOFORNECEDOR.DESCRAMOFORNECEDOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Ramo do Fornecedor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RAMOFORNECEDOR')
    CamposChave.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 293
    Top = 64
  end
  inherited ds: TwwDataSource
    Left = 241
    Top = 57
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 348
    Top = 58
  end
end
