inherited frmCadAfastRAIS: TfrmCadAfastRAIS
  Left = 162
  Top = 244
  HelpContext = 210051
  Caption = 'Cadastro de Situações de Afastamento (Padrão RAIS)'
  ClientHeight = 171
  ClientWidth = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 473
    Height = 85
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 139
      Top = 9
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 24
      Width = 114
      Height = 21
      DataField = 'IDAFASTRAIS'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TwwDBEdit
      Left = 139
      Top = 24
      Width = 318
      Height = 47
      AutoSize = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock972: TDock97
    Width = 473
  end
  inherited Dock971: TDock97
    Top = 132
    Width = 473
    inherited tb97Fundo: TToolbar97
      Left = 303
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 136
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 330
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 407
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situação de Afastamento'
    Colunas.Strings = (
      'AFASTRAIS.IDAFASTRAIS'
      'AFASTRAIS.DESCRICAO')
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
      'AFASTRAIS')
    CamposChave.Strings = (
      'AFASTRAIS.IDAFASTRAIS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '205')
    ExibePergunta = False
    Left = 407
    Top = 1
  end
end
