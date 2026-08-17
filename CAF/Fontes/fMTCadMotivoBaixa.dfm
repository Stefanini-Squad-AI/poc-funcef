inherited frmMTCadMotivoBaixa: TfrmMTCadMotivoBaixa
  Left = 217
  Top = 182
  Caption = 'Cadastro de Motivos de Baixa de Bens'
  ClientHeight = 253
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 402
    Height = 167
    object Label1: TLabel
      Left = 40
      Top = 32
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label2: TLabel
      Left = 40
      Top = 88
      Width = 128
      Height = 13
      Caption = 'Código SISPRO x OFA'
    end
    object dbedDescricao: TwwDBEdit
      Left = 40
      Top = 48
      Width = 329
      Height = 21
      DataField = 'DESCMOTIVOBAIXA'
      DataSource = ds
      MaxLength = 30
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 40
      Top = 104
      Width = 161
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODSISPROXOFA'
      DataSource = ds
      MaxLength = 15
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 402
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 232
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 626
    Top = 327
  end
  inherited ds: TwwDataSource
    Left = 296
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 624
    Top = 463
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 344
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 256
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MOTIVOBAIXA.DESCMOTIVOBAIXA'
      'MOTIVOBAIXA.CODSISPROXOFA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'SISPRO x OFA')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOTIVOBAIXA')
    CamposChave.Strings = (
      'MOTIVOBAIXA.IDMOTIVOBAIXA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '15')
    Left = 280
    Top = 136
  end
end
