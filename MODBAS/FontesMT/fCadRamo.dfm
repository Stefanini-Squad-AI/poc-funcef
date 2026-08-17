inherited frmCadRamo: TfrmCadRamo
  Left = 204
  Top = 224
  HelpContext = 690014
  Caption = 'Cadastro dos Segmentos (Ramos de Atividade)'
  ClientHeight = 192
  ClientWidth = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 106
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 15
      Top = 54
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 15
      Top = 29
      Width = 114
      Height = 21
      DataField = 'IDRAMOFORNECEDOR'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 15
      Top = 69
      Width = 322
      Height = 21
      DataField = 'DESCRAMOFORNECEDOR'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 353
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 183
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 16
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 292
    Top = 68
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 297
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 292
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 222
    Top = 68
  end
  inherited Cds: TCMClientDataSet
    Left = 269
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Segmento'
    Colunas.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR'
      'RAMOFORNECEDOR.DESCRAMOFORNECEDOR')
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
      'RAMOFORNECEDOR')
    CamposChave.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '35')
    ExibePergunta = False
    Left = 222
    Top = 55
  end
end
