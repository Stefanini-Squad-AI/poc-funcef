inherited FrmCadGrpFormulaMT: TFrmCadGrpFormulaMT
  Left = 284
  Top = 131
  HelpContext = 450011
  Caption = 'Grupos de Fórmulas MT'
  ClientHeight = 212
  ClientWidth = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 383
    Height = 126
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Código '
    end
    object Label2: TLabel
      Left = 12
      Top = 57
      Width = 114
      Height = 13
      Caption = 'Descrição do Grupo'
    end
    object EdCodigo: TwwDBEdit
      Left = 12
      Top = 31
      Width = 121
      Height = 21
      DataField = 'CODGRUPOFORMULA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object EdDescricao: TwwDBEdit
      Left = 12
      Top = 72
      Width = 357
      Height = 21
      DataField = 'DESCGRUPOFORMULA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 383
  end
  inherited Dock971: TDock97
    Top = 173
    Width = 383
    inherited tb97Fundo: TToolbar97
      Left = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 46
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 266
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 310
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 296
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 248
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 340
    Top = 55
    object CdsCODGRUPOFORMULA: TStringField
      FieldName = 'CODGRUPOFORMULA'
      FixedChar = True
      Size = 6
    end
    object CdsDESCGRUPOFORMULA: TStringField
      FieldName = 'DESCGRUPOFORMULA'
      Size = 40
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRPFORMULA.CODGRUPOFORMULA'
      'GRPFORMULA.DESCGRUPOFORMULA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Grupo'
      'Descrição do Grupo ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRPFORMULA')
    CamposChave.Strings = (
      'GRPFORMULA.CODGRUPOFORMULA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '6'
      '60')
    ExibePergunta = False
    Left = 278
    Top = 55
  end
end
