inherited frmCadGrpProcessoMT: TfrmCadGrpProcessoMT
  Left = 224
  Top = 159
  HelpContext = 360015
  Caption = 'Cadastro de Grupo de Processo'
  ClientHeight = 178
  ClientWidth = 512
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 512
    Height = 92
    object Label1: TLabel
      Left = 14
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = edDesc
    end
    object edDesc: TDBEdit
      Left = 14
      Top = 40
      Width = 484
      Height = 21
      DataField = 'DESCGRUPOPROCESSO'
      DataSource = ds
      TabOrder = 0
    end
  end
  inherited Dock972: TDock97
    Width = 512
  end
  inherited Dock971: TDock97
    Top = 139
    Width = 512
    inherited tb97Fundo: TToolbar97
      Left = 342
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 360015
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 175
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
      'RADGRUPOPROCESSO.DESCGRUPOPROCESSO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADGRUPOPROCESSO')
    CamposChave.Strings = (
      'RADGRUPOPROCESSO.IDGRUPOPROCESSO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Left = 388
    Top = 30
  end
end
