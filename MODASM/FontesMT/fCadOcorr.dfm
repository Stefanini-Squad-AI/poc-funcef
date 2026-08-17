inherited frmCadOcorr: TfrmCadOcorr
  Left = 144
  Top = 199
  HelpContext = 750002
  Caption = 'Cadastro das Ocorrências e Exames Médicos'
  ClientHeight = 240
  ClientWidth = 454
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 454
    Height = 154
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 137
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 17
      Top = 59
      Width = 75
      Height = 13
      Caption = 'Aval. Mínima'
      FocusControl = dbedAvaMin
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 28
      Width = 112
      Height = 21
      DataField = 'CODTIPOOCMED'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 137
      Top = 28
      Width = 299
      Height = 21
      DataField = 'DESCRTIPOOCMED'
      DataSource = ds
      TabOrder = 1
    end
    object dbedAvaMin: TDBEdit
      Left = 17
      Top = 74
      Width = 64
      Height = 21
      Hint = 'Mínimo para que a Pessoa esteja apta'
      DataField = 'AVALMIN'
      DataSource = ds
      MaxLength = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dbrgTipoOcor: TDBRadioGroup
      Left = 106
      Top = 55
      Width = 331
      Height = 40
      Caption = 'Tipo de Ocorrência'
      Columns = 2
      DataField = 'FLGTIPOCOR'
      DataSource = ds
      Items.Strings = (
        'Programável'
        'Aleatória')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrgTipoOcorChange
    end
    object dbrgFlagAcidTrab: TDBRadioGroup
      Left = 106
      Top = 102
      Width = 331
      Height = 40
      Caption = 'Ocorrência Refere-se a Acidente de Trabalho ?'
      Columns = 2
      DataField = 'FLGACIDTRAB'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 4
      Values.Strings = (
        '1'
        '0')
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 454
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 454
    inherited tb97Fundo: TToolbar97
      Left = 284
      DockPos = 376
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 117
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
