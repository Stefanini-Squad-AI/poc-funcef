inherited frmMTCadMotivoBaixa: TfrmMTCadMotivoBaixa
  Left = 217
  Top = 182
  Caption = 'Cadastro de Motivos de Baixa de Bens'
  ClientHeight = 257
  ClientWidth = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 402
    Height = 171
    object Label1: TLabel
      Left = 40
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 40
      Top = 72
      Width = 329
      Height = 21
      DataField = 'DESCMOTIVOBAIXA'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 402
  end
  inherited Dock971: TDock97
    Top = 218
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 232
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 463
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
      'MOTIVOBAIXA.DESCMOTIVOBAIXA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'MOTIVOBAIXA')
    CamposChave.Strings = (
      'MOTIVOBAIXA.IDMOTIVOBAIXA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 256
    Top = 56
  end
end
