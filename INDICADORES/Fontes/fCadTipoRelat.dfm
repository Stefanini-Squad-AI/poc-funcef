inherited frmCadTipoRelat: TfrmCadTipoRelat
  Left = 130
  Top = 265
  Caption = 'Cadastro de Tipo de Relatório'
  ClientHeight = 217
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 131
    object Label1: TLabel
      Left = 37
      Top = 40
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object edDescricao: TwwDBEdit
      Left = 37
      Top = 56
      Width = 433
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 178
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 256
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 304
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 424
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    Left = 396
    Top = 65535
    object CdsIDTIPO: TFloatField
      FieldName = 'IDTIPO'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'T.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'IND_TIPOINDICADOR T')
    CamposChave.Strings = (
      'T.IDTIPO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 448
    Top = 65535
  end
end
