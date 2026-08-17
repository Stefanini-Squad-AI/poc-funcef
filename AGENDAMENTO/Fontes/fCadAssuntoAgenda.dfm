inherited frmCadAssuntoAgenda: TfrmCadAssuntoAgenda
  Left = 365
  Top = 293
  Caption = 'Cadastro de Assunto para Agendamento'
  ClientHeight = 268
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 182
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 129
      Height = 13
      Caption = 'Descrição do Assunto:'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 73
      Height = 13
      Caption = 'Observação:'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 473
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 88
      Width = 473
      Height = 74
      DataField = 'OBSERVACAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 229
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 282
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 256
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 408
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 324
    Top = 7
    object CdsIDASSUNTOAGENDA: TFloatField
      FieldName = 'IDASSUNTOAGENDA'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      BlobType = ftBlob
      Size = 500
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ASSUNTOAGENDA.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'ASSUNTOAGENDA')
    CamposChave.Strings = (
      'ASSUNTOAGENDA.IDASSUNTOAGENDA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '100')
    Left = 448
    Top = 7
  end
end
