inherited frmMTCadSituacoes: TfrmMTCadSituacoes
  Left = 151
  Caption = 'Cadastro de Situações Físicas'
  ClientHeight = 228
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 142
    object Label1: TLabel
      Left = 48
      Top = 48
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TwwDBEdit
      Left = 48
      Top = 64
      Width = 321
      Height = 21
      DataField = 'DESCSITUACAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 415
  end
  inherited Dock971: TDock97
    Top = 189
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 722
    Top = 479
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 640
    Top = 479
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SITUACAO.DESCSITUACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SITUACAO')
    CamposChave.Strings = (
      'SITUACAO.IDSITUACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '45')
    Left = 160
    Top = 56
  end
end
