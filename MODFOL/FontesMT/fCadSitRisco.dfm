inherited frmCadSitRisco: TfrmCadSitRisco
  Left = 128
  Top = 258
  HelpContext = 210047
  Caption = 'Cadastro de Situações de Risco para FGTS'
  ClientHeight = 176
  ClientWidth = 546
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 90
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 86
      Top = 14
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 29
      Width = 59
      Height = 21
      DataField = 'IDSITRISCO'
      DataSource = ds
      MaxLength = 10
      TabOrder = 0
    end
    object dbedDescr: TwwDBEdit
      Left = 86
      Top = 28
      Width = 443
      Height = 47
      AutoSize = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock972: TDock97
    Width = 546
  end
  inherited Dock971: TDock97
    Top = 137
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 376
      DockPos = 384
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 209
      DockPos = 217
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 402
    Top = 14
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
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
    Left = 324
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Situação de Risco para FGTS'
    Colunas.Strings = (
      'SITRISCOFGTS.IDSITRISCO'
      'SITRISCOFGTS.DESCRICAO')
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
      'SITRISCOFGTS')
    CamposChave.Strings = (
      'SITRISCOFGTS.IDSITRISCO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '85')
    ExibePergunta = False
    Left = 324
    Top = 1
  end
end
