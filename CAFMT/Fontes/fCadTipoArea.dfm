inherited frmCadTipoArea: TfrmCadTipoArea
  Left = 204
  Top = 160
  HelpContext = 70007
  Caption = 'Cadastro de Tipos de Áreas'
  ClientHeight = 259
  ClientWidth = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 409
    Height = 173
    object Label1: TLabel
      Left = 48
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 48
      Top = 72
      Width = 313
      Height = 21
      DataField = 'DESCTIPOAREA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 409
  end
  inherited Dock971: TDock97
    Top = 220
    Width = 409
    inherited tb97Fundo: TToolbar97
      Left = 201
      DockPos = 201
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70007
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 33
      DockPos = 33
    end
  end
  inherited qry: TwwQuery
    Left = 287
    Top = 65534
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 664
    Top = 448
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update tipoarea'
      'set'
      '  IDTIPOAREA = :IDTIPOAREA,'
      '  DESCTIPOAREA = :DESCTIPOAREA'
      'where'
      '  IDTIPOAREA = :OLD_IDTIPOAREA'
      '')
    InsertSQL.Strings = (
      'insert into tipoarea'
      '  (IDTIPOAREA, DESCTIPOAREA)'
      'values'
      '  (:IDTIPOAREA, :DESCTIPOAREA)'
      '')
    DeleteSQL.Strings = (
      'delete from tipoarea'
      'where'
      '  IDTIPOAREA = :OLD_IDTIPOAREA'
      '')
    Left = 257
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAREA.DESCTIPOAREA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'TIPOAREA')
    CamposChave.Strings = (
      'TIPOAREA.IDTIPOAREA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 280
    Top = 56
  end
  inherited ds: TwwDataSource
    Left = 317
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 48
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 208
    Top = 56
  end
end
