inherited frmCadMovCAGED: TfrmCadMovCAGED
  Left = 168
  Top = 250
  HelpContext = 210040
  Caption = 'Cadastro de Movimentos Contratuais (Padrão CAGED)'
  ClientHeight = 200
  ClientWidth = 393
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 393
    Height = 114
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
      Top = 60
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 114
      Height = 21
      DataField = 'IDMOVCONTRCAGED'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 74
      Width = 361
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 393
  end
  inherited Dock971: TDock97
    Top = 161
    Width = 393
    inherited tb97Fundo: TToolbar97
      Left = 223
      DockPos = 398
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 56
      DockPos = 231
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 329
    Top = 65
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 326
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 329
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 266
    Top = 65
  end
  inherited Cds: TCMClientDataSet
    Left = 298
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Movimento Contratual (Padrão CAGED)'
    Colunas.Strings = (
      'MOVCONTRCAGED.IDMOVCONTRCAGED'
      'MOVCONTRCAGED.DESCRICAO')
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
      'MOVCONTRCAGED')
    CamposChave.Strings = (
      'MOVCONTRCAGED.IDMOVCONTRCAGED')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '55')
    ExibePergunta = False
    Left = 266
    Top = 51
  end
end
