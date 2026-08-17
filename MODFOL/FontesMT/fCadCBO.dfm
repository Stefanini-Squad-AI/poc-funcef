inherited frmCadCBO: TfrmCadCBO
  Left = 70
  Top = 241
  HelpContext = 210014
  Caption = 'Cadastro de CBO (Código Brasileiro de Ocupações)'
  ClientHeight = 188
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 102
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 11
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      DataField = 'IDCBO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 67
      Width = 560
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 592
  end
  inherited Dock971: TDock97
    Top = 149
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 422
      DockPos = 513
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 255
      DockPos = 346
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 527
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 366
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 527
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 465
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 338
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CBO'
    Colunas.Strings = (
      'CBO.IDCBO'
      'CBO.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CBO')
    CamposChave.Strings = (
      'CBO.IDCBO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
    Left = 465
    Top = 1
  end
end
