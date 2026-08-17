inherited frmCadVincEmpr: TfrmCadVincEmpr
  Left = 150
  Top = 250
  HelpContext = 210050
  Caption = 'Cadastro de Vínculos Empregatícios (Padrão RAIS)'
  ClientHeight = 179
  ClientWidth = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 478
    Height = 93
    BorderWidth = 2
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 102
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedCodigo: TDBEdit
      Left = 18
      Top = 29
      Width = 75
      Height = 21
      DataField = 'IDVINCEMPREG'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TwwDBEdit
      Left = 102
      Top = 29
      Width = 359
      Height = 47
      AutoSize = False
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = True
    end
  end
  inherited Dock972: TDock97
    Width = 478
  end
  inherited Dock971: TDock97
    Top = 140
    Width = 478
    inherited tb97Fundo: TToolbar97
      Left = 308
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 141
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 314
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 314
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 376
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Vínculo Empregatício'
    Colunas.Strings = (
      'VINCEMPREGRAIS.IDVINCEMPREG'
      'VINCEMPREGRAIS.DESCRICAO')
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
      'VINCEMPREGRAIS')
    CamposChave.Strings = (
      'VINCEMPREGRAIS.IDVINCEMPREG')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '205')
    ExibePergunta = False
    Left = 376
    Top = 1
  end
end
