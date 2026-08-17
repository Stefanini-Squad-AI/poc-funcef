inherited frmCadTipSent: TfrmCadTipSent
  Left = 229
  Top = 240
  Caption = 'Cadastro de Tipos de Sentença em Processos'
  ClientHeight = 190
  ClientWidth = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 333
    Height = 104
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
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
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      DataField = 'CODTIPOSENT'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 67
      Width = 300
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 333
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 333
    inherited tb97Fundo: TToolbar97
      Left = 167
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 280
    Top = 64
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 172
    Top = 51
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 221
    Top = 64
  end
  inherited Cds: TCMClientDataSet
    Left = 144
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Sentença'
    Colunas.Strings = (
      'TIPOSENTENCA.CODTIPOSENT'
      'TIPOSENTENCA.DESCRICAO')
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
      'TIPOSENTENCA')
    CamposChave.Strings = (
      'TIPOSENTENCA.CODTIPOSENT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 221
    Top = 51
  end
end
