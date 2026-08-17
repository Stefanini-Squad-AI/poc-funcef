inherited FrmCadGrpRegraMT: TFrmCadGrpRegraMT
  Left = 169
  Top = 165
  HelpContext = 450009
  Caption = 'Grupos de Regras MT'
  ClientHeight = 198
  ClientWidth = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 439
    Height = 112
    object Label1: TLabel
      Left = 14
      Top = 9
      Width = 72
      Height = 13
      Caption = 'Identificador'
    end
    object Label2: TLabel
      Left = 14
      Top = 51
      Width = 114
      Height = 13
      Caption = 'Descrição do Grupo'
    end
    object DBEdit1: TDBEdit
      Left = 14
      Top = 25
      Width = 121
      Height = 21
      Color = clBtnFace
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      Enabled = False
      TabOrder = 0
    end
    object EdDescricao: TwwDBEdit
      Left = 14
      Top = 67
      Width = 412
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 439
  end
  inherited Dock971: TDock97
    Top = 159
    Width = 439
    inherited tb97Fundo: TToolbar97
      Left = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 314
    Top = 15
  end
  inherited ds: TwwDataSource
    Left = 278
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 216
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 248
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 348
    Top = 15
    object CdsIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPOREGRA.IDGRUPOREGRA'
      'GRUPOREGRA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOREGRA')
    CamposChave.Strings = (
      'GRUPOREGRA.IDGRUPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
    Left = 384
    Top = 15
  end
end
