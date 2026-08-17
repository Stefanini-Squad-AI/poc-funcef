inherited frmCadTipAval: TfrmCadTipAval
  Left = 194
  Top = 218
  Caption = 'Cadastro dos Tipos de Avaliação'
  ClientHeight = 226
  ClientWidth = 398
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 398
    Height = 140
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
      Left = 139
      Top = 11
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 26
      Width = 114
      Height = 21
      DataField = 'CODTIPOAVAL'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 139
      Top = 26
      Width = 243
      Height = 21
      DataField = 'DESCRTIPOAVAL'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgCategoria: TDBRadioGroup
      Left = 16
      Top = 51
      Width = 366
      Height = 75
      Caption = 'Categoria'
      DataField = 'FLGTIPOAVAL'
      DataSource = ds
      Items.Strings = (
        'Avaliação de Desempenho'
        'Acompanhamento de Desempenho'
        'Outros Tipos de Avaliação')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        '0'
        '1'
        '2')
    end
  end
  inherited Dock972: TDock97
    Width = 398
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 398
    inherited tb97Fundo: TToolbar97
      Left = 228
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 356
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 251
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 356
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 296
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 223
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Avaliação'
    Colunas.Strings = (
      'CODTIPOAVAL'
      'DESCRTIPOAVAL')
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
      'TIPOAVAL')
    CamposChave.Strings = (
      'CODTIPOAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '35')
    ExibePergunta = False
    Left = 296
    Top = 1
  end
end
