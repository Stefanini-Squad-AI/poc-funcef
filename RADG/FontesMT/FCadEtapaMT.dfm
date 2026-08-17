inherited frmCadEtapaMT: TfrmCadEtapaMT
  Left = 137
  Top = 151
  HelpContext = 360015
  Caption = 'Cadastro de Tipos de Etapa'
  ClientHeight = 319
  ClientWidth = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 544
    Height = 233
    object lblNome: TLabel
      Left = 16
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Nome da Etapa'
      FocusControl = dbedNome
    end
    object lblDescEtapa: TLabel
      Left = 16
      Top = 64
      Width = 113
      Height = 13
      Caption = 'Descrição da Etapa'
    end
    object dbedNome: TDBEdit
      Left = 16
      Top = 32
      Width = 505
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object dbchkautoriz: TDBCheckBox
      Left = 16
      Top = 197
      Width = 153
      Height = 17
      Caption = 'Possui Autorização'
      DataField = 'FLGAUTORIZACAO'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbchkRetorna: TDBCheckBox
      Left = 232
      Top = 197
      Width = 169
      Height = 17
      Caption = 'Retorna a Etapa Anterior'
      DataField = 'FLGRETORETAPA'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dbreDescricao: TDBRichEdit
      Left = 16
      Top = 80
      Width = 505
      Height = 97
      DataField = 'DESCRICAO'
      DataSource = ds
      MaxLength = 200
      PlainText = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 544
  end
  inherited Dock971: TDock97
    Top = 280
    Width = 544
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 360015
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRichEdit'
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
      'RADTIPOETAPA.NOME'
      'RADTIPOETAPA.FLGAUTORIZACAO'
      'RADTIPOETAPA.FLGRETORETAPA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Etapa'
      'Autorização'
      'Retorno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RADTIPOETAPA')
    CamposChave.Strings = (
      'RADTIPOETAPA.IDTIPOETAPA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '1'
      '1')
    ExibePergunta = False
    Left = 388
    Top = 30
  end
end
