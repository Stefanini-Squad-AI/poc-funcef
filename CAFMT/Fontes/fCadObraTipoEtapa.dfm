inherited frmCadObraTipoEtapa: TfrmCadObraTipoEtapa
  Left = 183
  Top = 177
  HelpContext = 70011
  Caption = 'Cadastro de Tipos de Etapas de Obras'
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
      DataField = 'DESCOBRATIPOETAPA'
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
        HelpContext = 70011
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      DockPos = 67
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDOBRATIPOETAPA, DESCOBRATIPOETAPA'
      'FROM CAFOBRATIPOETAPA'
      '       ')
    Left = 250
    Top = 0
    object qryIDOBRATIPOETAPA: TFloatField
      FieldName = 'IDOBRATIPOETAPA'
      Origin = 'BASEDADOS.CAFOBRATIPOETAPA.IDOBRATIPOETAPA'
    end
    object qryDESCOBRATIPOETAPA: TStringField
      FieldName = 'DESCOBRATIPOETAPA'
      Origin = 'BASEDADOS.CAFOBRATIPOETAPA.DESCOBRATIPOETAPA'
      Size = 50
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 419
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CAFOBRATIPOETAPA'
      'set'
      '  DESCOBRATIPOETAPA = :DESCOBRATIPOETAPA'
      'where'
      '  IDOBRATIPOETAPA = :OLD_IDOBRATIPOETAPA')
    InsertSQL.Strings = (
      'insert into CAFOBRATIPOETAPA'
      '  (IDOBRATIPOETAPA, DESCOBRATIPOETAPA)'
      'values'
      '  (:IDOBRATIPOETAPA, :DESCOBRATIPOETAPA)')
    DeleteSQL.Strings = (
      'delete from CAFOBRATIPOETAPA'
      'where'
      '  IDOBRATIPOETAPA = :OLD_IDOBRATIPOETAPA')
    Left = 311
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CAFOBRATIPOETAPA.DESCOBRATIPOETAPA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Etapa')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CAFOBRATIPOETAPA')
    CamposChave.Strings = (
      'CAFOBRATIPOETAPA.IDOBRATIPOETAPA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
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
