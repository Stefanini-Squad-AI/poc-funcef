inherited frmCadNatEmpr: TfrmCadNatEmpr
  Left = 155
  Top = 237
  HelpContext = 210049
  Caption = 'Cadastro de Naturezas Empresariais (Padrão RAIS)'
  ClientHeight = 190
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 104
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 54
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 114
      Height = 21
      DataField = 'IDNATEMPRE'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 68
      Width = 456
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 488
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 318
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 151
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 400
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 336
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Natureza Empresarial'
    Colunas.Strings = (
      'NATEMPRESA.IDNATEMPRE'
      'NATEMPRESA.DESCRICAO')
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
      'NATEMPRESA')
    CamposChave.Strings = (
      'NATEMPRESA.IDNATEMPRE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '125')
    ExibePergunta = False
    Left = 336
    Top = 1
  end
end
