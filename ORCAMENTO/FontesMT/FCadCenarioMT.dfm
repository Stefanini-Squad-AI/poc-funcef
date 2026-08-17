inherited frmCadCenarioMT: TfrmCadCenarioMT
  Left = 307
  Top = 250
  HelpContext = 520029
  Caption = 'Cadastro dos Cenários'
  ClientHeight = 179
  ClientWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 422
    Height = 93
    object dbedNomeCenario: TwwDBEdit
      Left = 12
      Top = 36
      Width = 400
      Height = 21
      DataField = 'NOMECENARIO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 422
  end
  inherited Dock971: TDock97
    Top = 140
    Width = 422
    inherited tb97Fundo: TToolbar97
      Left = 250
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520073
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 81
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 103
  end
  inherited ds: TwwDataSource
    Left = 133
    Top = 47
  end
  inherited ImlPadrao: TImageList
    Left = 18
    Top = 47
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 248
    Top = 47
  end
  inherited Cds: TCMClientDataSet
    Left = 133
    Top = 103
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CENARIOORCAMEN.NOMECENARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do cenário')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CENARIOORCAMEN')
    CamposChave.Strings = (
      'CENARIOORCAMEN.IDCENARIOORCAMEN')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 248
    Top = 103
  end
end
