inherited frmCadGrauInstr: TfrmCadGrauInstr
  Left = 217
  Top = 226
  Caption = 'Cadastro dos Graus de Instrução'
  ClientHeight = 190
  ClientWidth = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 340
    Height = 104
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 28
      Height = 13
      Caption = 'Grau'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 54
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 251
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Código RAIS'
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 25
      Width = 114
      Height = 21
      DataField = 'IDGRINSTR'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 68
      Width = 307
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dbedRAIS: TDBEdit
      Left = 251
      Top = 25
      Width = 72
      Height = 21
      DataField = 'CODRAIS'
      DataSource = ds
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 340
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 340
    inherited tb97Fundo: TToolbar97
      Left = 170
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 143
    Top = 63
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 276
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 143
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 203
  end
  inherited Cds: TCMClientDataSet
    Left = 248
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grau de Instrução'
    Colunas.Strings = (
      'GRINSTR.IDGRINSTR'
      'GRINSTR.DESCRICAO')
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
      'GRINSTR')
    CamposChave.Strings = (
      'GRINSTR.IDGRINSTR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '35')
    ExibePergunta = False
    Left = 203
    Top = 51
  end
end
