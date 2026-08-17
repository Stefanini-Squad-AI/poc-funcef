inherited frmCadFonte: TfrmCadFonte
  Left = 183
  Top = 257
  HelpContext = 730004
  Caption = 'Cadastro de Fontes de Recrutamento'
  ClientHeight = 152
  ClientWidth = 389
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 389
    Height = 66
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
      Left = 83
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 17
      Top = 30
      Width = 54
      Height = 21
      DataField = 'IDFONTRECR'
      DataSource = ds
      MaxLength = 7
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 83
      Top = 30
      Width = 290
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 389
  end
  inherited Dock971: TDock97
    Top = 113
    Width = 389
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 52
      DockPos = 60
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 219
      DockPos = 227
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 349
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 246
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 349
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 288
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 218
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fonte de Recrutamento'
    Colunas.Strings = (
      'FONTRECR.IDFONTRECR'
      'FONTRECR.DESCRICAO')
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
      'FONTRECR')
    CamposChave.Strings = (
      'FONTRECR.IDFONTRECR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '35')
    ExibePergunta = False
    Left = 288
    Top = 1
  end
end
