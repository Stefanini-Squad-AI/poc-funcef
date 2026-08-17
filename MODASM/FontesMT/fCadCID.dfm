inherited frmCadCID: TfrmCadCID
  Left = 150
  Top = 177
  HelpContext = 750003
  Caption = 'Cadastro CID (Código Internacional de Doença)'
  ClientHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 196
    BorderWidth = 2
    object Label1: TLabel
      Left = 15
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 15
      Top = 55
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TwwDBEdit
      Left = 15
      Top = 27
      Width = 64
      Height = 21
      DataField = 'CODCID'
      DataSource = ds
      MaxLength = 5
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescr: TwwDBEdit
      Left = 12
      Top = 69
      Width = 483
      Height = 115
      AutoSize = False
      DataField = 'DESCRCID'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock971: TDock97
    Top = 243
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 426
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 426
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 336
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CID'
    Colunas.Strings = (
      'CODCID'
      'SUBSTR(DESCRCID,1,100) AS DESCRICAO'
      'DESCRCID')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição Abreviada'
      'Descrição Completa')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'CID')
    CamposChave.Strings = (
      'CODCID')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '100'
      '1000')
    Left = 336
    Top = 1
  end
end
