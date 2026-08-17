inherited frmCadRubCLT: TfrmCadRubCLT
  Left = 182
  Top = 225
  HelpContext = 210024
  Caption = 'Cadastro de Rubricas Padrão CLT'
  ClientHeight = 152
  ClientWidth = 437
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 66
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 96
      Top = 14
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 29
      Width = 68
      Height = 21
      DataField = 'CODRUBCLT'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 96
      Top = 29
      Width = 324
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 437
  end
  inherited Dock971: TDock97
    Top = 113
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 267
      DockPos = 275
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 100
      DockPos = 108
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 386
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 386
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubrica Padrão CLT'
    Colunas.Strings = (
      'RUBRICACLT.CODRUBCLT'
      'RUBRICACLT.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICACLT')
    CamposChave.Strings = (
      'RUBRICACLT.CODRUBCLT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '45')
    ExibePergunta = False
    Left = 320
    Top = 1
  end
end
