inherited frmCadEncar: TfrmCadEncar
  Left = 216
  Top = 233
  HelpContext = 740013
  Caption = 'Cadastro de Encargos Sociais'
  ClientHeight = 193
  ClientWidth = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 107
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
      Left = 17
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 258
      Top = 13
      Width = 62
      Height = 13
      Caption = 'Percentual'
      FocusControl = dbredPercent
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 28
      Width = 114
      Height = 21
      DataField = 'IDENCARGO'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 17
      Top = 71
      Width = 303
      Height = 21
      DataField = 'DESCRENCARGO'
      DataSource = ds
      TabOrder = 1
    end
    object dbredPercent: TDBRealEdit
      Left = 256
      Top = 28
      Width = 64
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'PERCENCARGO'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 337
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 247
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 79
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 295
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 166
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 295
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 221
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 138
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Encargo Social'
    Colunas.Strings = (
      'IDENCARGO'
      'DESCRENCARGO')
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
      'ENCARGO')
    CamposChave.Strings = (
      'IDENCARGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '45')
    ExibePergunta = False
    Left = 221
    Top = 1
  end
end
