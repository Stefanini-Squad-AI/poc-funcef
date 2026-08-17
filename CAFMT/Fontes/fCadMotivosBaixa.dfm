inherited frmCadMotivosBaixa: TfrmCadMotivosBaixa
  Left = 192
  Top = 127
  HelpContext = 70009
  Caption = 'Cadastro de Motivos de Baixa de Bens'
  ClientHeight = 270
  ClientWidth = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 395
    Height = 184
    object Label1: TLabel
      Left = 40
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 40
      Top = 72
      Width = 329
      Height = 21
      DataField = 'DESCMOTIVOBAIXA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 395
  end
  inherited Dock971: TDock97
    Top = 231
    Width = 395
    inherited tb97Fundo: TToolbar97
      Left = 201
      DockPos = 201
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70009
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 33
      DockPos = 33
    end
  end
  inherited qry: TwwQuery
    Left = 296
    Top = 0
    object qryIDMOTIVOBAIXA: TFloatField
      FieldName = 'IDMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.IDMOTIVOBAIXA'
    end
    object qryDESCMOTIVOBAIXA: TStringField
      FieldName = 'DESCMOTIVOBAIXA'
      Origin = 'MOTIVOBAIXA.DESCMOTIVOBAIXA'
      Size = 30
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 768
    Top = 518
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update motivobaixa'
      'set'
      '  IDMOTIVOBAIXA = :IDMOTIVOBAIXA,'
      '  DESCMOTIVOBAIXA = :DESCMOTIVOBAIXA'
      'where'
      '  IDMOTIVOBAIXA = :OLD_IDMOTIVOBAIXA')
    InsertSQL.Strings = (
      'insert into motivobaixa'
      '  (IDMOTIVOBAIXA, DESCMOTIVOBAIXA)'
      'values'
      '  (:IDMOTIVOBAIXA, :DESCMOTIVOBAIXA)'
      '')
    DeleteSQL.Strings = (
      'delete from motivobaixa'
      'where'
      '  IDMOTIVOBAIXA = :OLD_IDMOTIVOBAIXA')
    Left = 264
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOTIVOBAIXA.DESCMOTIVOBAIXA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'MOTIVOBAIXA')
    CamposChave.Strings = (
      'MOTIVOBAIXA.IDMOTIVOBAIXA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 288
    Top = 176
  end
  inherited ds: TwwDataSource
    Left = 328
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 144
    Top = 176
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 216
    Top = 176
  end
end
