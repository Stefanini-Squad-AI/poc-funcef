inherited frmCadTipoSaidaTemp: TfrmCadTipoSaidaTemp
  Left = 188
  Top = 191
  HelpContext = 70010
  Caption = 'Motivos para Saídas Temporárias'
  ClientHeight = 229
  ClientWidth = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 409
    Height = 143
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbeDescTipSaiTmp: TwwDBEdit
      Left = 32
      Top = 56
      Width = 345
      Height = 21
      DataField = 'DESCTIPSAITEMP'
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
    Top = 190
    Width = 409
    inherited tb97Fundo: TToolbar97
      Left = 235
      DockPos = 235
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70010
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDTIPOSAIDATEMP,'
      '       DESCTIPSAITEMP'
      'FROM TIPOSAIDATEMP'
      '       ')
    Left = 250
    Top = 0
    object qryIDTIPOSAIDATEMP: TFloatField
      FieldName = 'IDTIPOSAIDATEMP'
      Origin = 'TIPOSAIDATEMP.IDTIPOSAIDATEMP'
    end
    object qryDESCTIPSAITEMP: TStringField
      FieldName = 'DESCTIPSAITEMP'
      Origin = 'TIPOSAIDATEMP.DESCTIPSAITEMP'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 419
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSAIDATEMP'
      'set'
      '  IDTIPOSAIDATEMP = :IDTIPOSAIDATEMP,'
      '  DESCTIPSAITEMP = :DESCTIPSAITEMP'
      'where'
      '  IDTIPOSAIDATEMP = :OLD_IDTIPOSAIDATEMP')
    InsertSQL.Strings = (
      'insert into TIPOSAIDATEMP'
      '  (IDTIPOSAIDATEMP, DESCTIPSAITEMP)'
      'values'
      '  (:IDTIPOSAIDATEMP, :DESCTIPSAITEMP)')
    DeleteSQL.Strings = (
      'delete from TIPOSAIDATEMP'
      'where'
      '  IDTIPOSAIDATEMP = :OLD_IDTIPOSAIDATEMP')
    Left = 311
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOSAIDATEMP.DESCTIPSAITEMP')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOSAIDATEMP')
    CamposChave.Strings = (
      'TIPOSAIDATEMP.IDTIPOSAIDATEMP')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 360
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
