inherited frmCadTipoTrab: TfrmCadTipoTrab
  Left = 229
  Top = 219
  HelpContext = 210016
  Caption = 'Cadastro de Tipos de Trabalhador (Padrão Ministério do Trabalho)'
  ClientHeight = 192
  ClientWidth = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 454
    Height = 106
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 57
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 27
      Width = 114
      Height = 21
      DataField = 'IDTIPOTRAB'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 71
      Width = 423
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 454
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 454
    inherited tb97Fundo: TToolbar97
      Left = 284
      DockPos = 332
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 117
      DockPos = 165
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 402
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 286
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 402
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 334
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 258
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Trabalhador'
    Colunas.Strings = (
      'TIPOTRABALHADOR.IDTIPOTRAB'
      'TIPOTRABALHADOR.DESCRICAO')
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
      'TIPOTRABALHADOR')
    CamposChave.Strings = (
      'TIPOTRABALHADOR.IDTIPOTRAB')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 334
    Top = 1
  end
end
