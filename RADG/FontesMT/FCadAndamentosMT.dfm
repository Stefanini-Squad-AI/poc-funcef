inherited frmCadAndamentosMT: TfrmCadAndamentosMT
  Left = 224
  Top = 159
  HelpContext = 360015
  Caption = 'Cadastro de Andamentos'
  ClientHeight = 170
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    Height = 84
    object lblNome: TLabel
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedNome: TwwDBEdit
      Left = 16
      Top = 32
      Width = 465
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 498
  end
  inherited Dock971: TDock97
    Top = 131
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 328
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 360015
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 161
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 310
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 223
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADANDAMENTO.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Andamento')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADANDAMENTO')
    CamposChave.Strings = (
      'RADANDAMENTO.IDANDAMENTO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    ExibePergunta = False
    Left = 388
    Top = 30
  end
end
