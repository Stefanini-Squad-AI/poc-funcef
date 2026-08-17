inherited frmCadBenef: TfrmCadBenef
  Left = 243
  Top = 260
  HelpContext = 710002
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro dos Tipos de Benefício Social'
  ClientHeight = 156
  ClientWidth = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 350
    Height = 70
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
      Left = 89
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 28
      Width = 60
      Height = 21
      DataField = 'IDBENEFSALAR'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 89
      Top = 28
      Width = 244
      Height = 21
      DataField = 'DESCRBENEFSALAR'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 350
  end
  inherited Dock971: TDock97
    Top = 117
    Width = 350
    inherited tb97Fundo: TToolbar97
      Left = 180
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 13
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 234
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 190
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 234
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
    Left = 162
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Benefício Social'
    Colunas.Strings = (
      'IDBENEFSALAR'
      'DESCRBENEFSALAR')
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
      'TIPOBENSAL')
    CamposChave.Strings = (
      'IDBENEFSALAR')
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
