inherited frmCadExper: TfrmCadExper
  Left = 176
  Top = 253
  HelpContext = 730005
  Caption = 'Cadastro dos Tipos de Experiência'
  ClientHeight = 150
  ClientWidth = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 392
    Height = 64
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
      Left = 85
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 27
      Width = 57
      Height = 21
      DataField = 'IDEXPER'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 85
      Top = 27
      Width = 290
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 392
  end
  inherited Dock971: TDock97
    Top = 111
    Width = 392
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 55
      DockPos = 63
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 222
      DockPos = 230
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 351
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 247
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 351
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 289
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 219
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Experiência'
    Colunas.Strings = (
      'TABEXPER.IDEXPER'
      'TABEXPER.DESCRICAO')
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
      'TABEXPER')
    CamposChave.Strings = (
      'TABEXPER.IDEXPER')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '35')
    ExibePergunta = False
    Left = 289
    Top = 14
  end
end
