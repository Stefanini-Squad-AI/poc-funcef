inherited frmCadTipoDespAV: TfrmCadTipoDespAV
  Left = 212
  Top = 205
  HelpContext = 70008
  Caption = 'Cadastro de Tipos de Despesa para Acréscimo de Valor'
  ClientHeight = 236
  ClientWidth = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 429
    Height = 150
    object Label1: TLabel
      Left = 32
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 32
      Top = 64
      Width = 361
      Height = 21
      DataField = 'DESTIPODESPESA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 429
  end
  inherited Dock971: TDock97
    Top = 197
    Width = 429
    inherited tb97Fundo: TToolbar97
      Left = 241
      DockPos = 241
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70008
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 73
      DockPos = 73
    end
  end
  inherited qry: TwwQuery
    Left = 288
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 704
    Top = 486
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODESPESAAV'
      'set'
      '  IDTIPODESPESA = :IDTIPODESPESA,'
      '  DESTIPODESPESA = :DESTIPODESPESA'
      'where'
      '  IDTIPODESPESA = :OLD_IDTIPODESPESA'
      '')
    InsertSQL.Strings = (
      'insert into TIPODESPESAAV'
      '  (IDTIPODESPESA, DESTIPODESPESA)'
      'values'
      '  (:IDTIPODESPESA, :DESTIPODESPESA)'
      '')
    DeleteSQL.Strings = (
      'delete from TIPODESPESAAV'
      'where'
      '  IDTIPODESPESA = :OLD_IDTIPODESPESA'
      '')
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPODESPESAAV.DESTIPODESPESA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição ')
    Tabelas.Strings = (
      'TIPODESPESAAV')
    CamposChave.Strings = (
      'TIPODESPESAAV.IDTIPODESPESA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 280
    Top = 144
  end
  inherited ds: TwwDataSource
    Left = 320
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 216
    Top = 144
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 352
    Top = 144
  end
end
