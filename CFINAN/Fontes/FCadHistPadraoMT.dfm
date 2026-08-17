inherited FrmCadHistPadraoMT: TFrmCadHistPadraoMT
  HelpContext = 90034
  Caption = 'Cadastro de Históricos Padrões'
  ClientHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 106
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 51
      Height = 13
      Caption = 'Histórico'
    end
    object dbeHistorico: TwwDBEdit
      Left = 16
      Top = 48
      Width = 473
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 153
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90034
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 247
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 80
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 352
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'dsp'
    Left = 252
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'HISTORICOFINAN.HISTPADFINAN'
      'HISTORICOFINAN.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Histórico')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'HISTORICOFINAN')
    CamposChave.Strings = (
      'HISTORICOFINAN.HISTPADFINAN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 424
    Top = 7
  end
end
