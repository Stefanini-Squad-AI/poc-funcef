inherited FrmCadConjuntoRubrica: TFrmCadConjuntoRubrica
  Left = 444
  Top = 385
  HelpContext = 180065
  Caption = 'Cadastro de conjuntos de rubricas'
  ClientHeight = 198
  ClientWidth = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 445
    Height = 112
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 94
      Height = 13
      Caption = 'Código resumido'
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 129
      Height = 13
      Caption = 'Descrição do conjunto'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 25
      Width = 121
      Height = 21
      Color = clWhite
      DataField = 'CODIGO'
      DataSource = ds
      TabOrder = 0
    end
    object EdDescricao: TwwDBEdit
      Left = 16
      Top = 69
      Width = 412
      Height = 21
      Color = clWhite
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 445
  end
  inherited Dock971: TDock97
    Top = 159
    Width = 445
    inherited tb97Fundo: TToolbar97
      Left = 273
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 104
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 250
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 278
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 349
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 377
    Top = 7
    object CdsIDCONJUNTORUBRICA: TFloatField
      FieldName = 'IDCONJUNTORUBRICA'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONJUNTORUBRICA.DESCRICAO'
      'CONJUNTORUBRICA.CODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONJUNTORUBRICA')
    CamposChave.Strings = (
      'CONJUNTORUBRICA.IDCONJUNTORUBRICA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '10')
    ExibePergunta = False
    Left = 306
    Top = 7
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from conjuntorubrica')
    Left = 328
    Top = 79
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 357
    Top = 79
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 387
    Top = 79
  end
end
