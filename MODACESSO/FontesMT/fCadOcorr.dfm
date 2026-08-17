inherited frmCadOcorr: TfrmCadOcorr
  Left = 144
  Top = 199
  HelpContext = 750002
  Caption = 'Ocorrências e Exames Médicos (Motivos de Abono)'
  ClientHeight = 193
  ClientWidth = 459
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 459
    Height = 107
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 137
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 30
      Width = 112
      Height = 21
      DataField = 'CODTIPOOCMED'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 137
      Top = 30
      Width = 305
      Height = 21
      DataField = 'DESCRTIPOOCMED'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgFlagForcaFolha: TDBRadioGroup
      Left = 17
      Top = 59
      Width = 426
      Height = 40
      Caption = 
        'Ocorrência Força Migração para a Folha (Não vai para Banco de Ho' +
        'ras)'
      Columns = 2
      DataField = 'FLGFORCAFOLHA'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
    end
  end
  inherited Dock972: TDock97
    Width = 459
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 459
    inherited tb97Fundo: TToolbar97
      Left = 287
      DockPos = 378
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 118
      DockPos = 209
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 382
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 382
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 317
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Ocorrência e Exame Médico'
    Colunas.Strings = (
      'CODTIPOOCMED'
      'DESCRTIPOOCMED')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'TIPOCMED')
    CamposChave.Strings = (
      'CODTIPOOCMED')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 317
    Top = 1
  end
end
