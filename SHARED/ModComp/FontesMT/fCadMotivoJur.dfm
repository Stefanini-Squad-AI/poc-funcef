inherited frmCadMotivoJur: TfrmCadMotivoJur
  Left = 148
  Top = 213
  Caption = 'Cadastro de Motivos de Exclusão de Litisconsortes dos Processos'
  ClientHeight = 267
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 181
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 85
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label5: TLabel
      Left = 17
      Top = 57
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 27
      Width = 57
      Height = 21
      DataField = 'IDMOTIVO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 85
      Top = 27
      Width = 361
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedObs: TwwDBEdit
      Left = 17
      Top = 72
      Width = 428
      Height = 94
      AutoSize = False
      DataField = 'OBSERVACAO'
      DataSource = ds
      ShowVertScrollBar = True
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock972: TDock97
    Width = 462
  end
  inherited Dock971: TDock97
    Top = 228
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 300
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
      DockPos = 133
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 384
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 317
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tabela de Motivos de Exclusão de Pessoas dos Processos'
    Colunas.Strings = (
      'MOTIVO.IDMOTIVO'
      'MOTIVO.DESCRICAO')
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
      'MOTIVO')
    CamposChave.Strings = (
      'MOTIVO.IDMOTIVO')
    Filtro.Strings = (
      'GrupoMotivo = '#39'O'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    ExibePergunta = False
    Left = 317
    Top = 13
  end
end
