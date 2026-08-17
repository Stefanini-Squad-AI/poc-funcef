inherited frmCadDeposGRE: TfrmCadDeposGRE
  Left = 108
  Top = 232
  HelpContext = 210044
  Caption = 
    'Cadastro de Depósitos para a GRE (Guia de Recolhimento de Empreg' +
    'ados)'
  ClientHeight = 212
  ClientWidth = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 126
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
      Left = 110
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 28
      Width = 84
      Height = 21
      DataField = 'IDDEPOSGRE'
      DataSource = ds
      MaxLength = 10
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 110
      Top = 28
      Width = 433
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgTipContra: TDBRadioGroup
      Left = 16
      Top = 56
      Width = 527
      Height = 56
      Caption = 'Tipo de Contrato Padrão para este Tipo de Depósito'
      Columns = 3
      DataField = 'TIPOCONTRATO'
      DataSource = ds
      Items.Strings = (
        'Efetivo'
        'Temporário'
        'Estagiário'
        'Terceiro'
        'Prop/Dir s/ Vinc'
        'Autônomo')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        'E'
        'T'
        'G'
        '3'
        'P'
        'A')
    end
  end
  inherited Dock972: TDock97
    Width = 558
  end
  inherited Dock971: TDock97
    Top = 173
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 388
      DockPos = 396
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 221
      DockPos = 229
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 482
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 482
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 408
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Depósito para a GRE'
    Colunas.Strings = (
      'DEPOSGRE.IDDEPOSGRE'
      'DEPOSGRE.DESCRICAO')
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
      'DEPOSGRE')
    CamposChave.Strings = (
      'DEPOSGRE.IDDEPOSGRE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '85')
    ExibePergunta = False
    Left = 408
    Top = 1
  end
end
