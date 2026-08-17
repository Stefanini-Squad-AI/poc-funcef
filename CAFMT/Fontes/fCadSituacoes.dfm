inherited frmCadSituacoes: TfrmCadSituacoes
  Left = 204
  Top = 157
  HelpContext = 70006
  Caption = 'Cadastro de Situações'
  ClientHeight = 281
  ClientWidth = 415
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 195
    object Label1: TLabel
      Left = 48
      Top = 64
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 48
      Top = 80
      Width = 313
      Height = 21
      DataField = 'DESCSITUACAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 415
  end
  inherited Dock971: TDock97
    Top = 242
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
      DockPos = 265
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
      DockPos = 89
    end
  end
  inherited qry: TwwQuery
    Left = 287
    Top = 65534
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 576
    Top = 502
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITUACAO'
      'set'
      '  IDSITUACAO = :IDSITUACAO,'
      '  DESCSITUACAO = :DESCSITUACAO'
      'where'
      '  IDSITUACAO = :OLD_IDSITUACAO')
    InsertSQL.Strings = (
      'insert into SITUACAO'
      '  (IDSITUACAO, DESCSITUACAO)'
      'values'
      '  (:IDSITUACAO, :DESCSITUACAO)')
    DeleteSQL.Strings = (
      'delete from SITUACAO'
      'where'
      '  IDSITUACAO = :OLD_IDSITUACAO')
    Left = 257
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SITUACAO.DESCSITUACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SITUACAO')
    CamposChave.Strings = (
      'SITUACAO.IDSITUACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '45')
    Left = 160
    Top = 56
  end
  inherited ds: TwwDataSource
    Left = 317
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 24
    Top = 56
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 88
    Top = 56
  end
end
