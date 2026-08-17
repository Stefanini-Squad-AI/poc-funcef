inherited FrmMtCadTamanho: TFrmMtCadTamanho
  Left = 167
  Top = 155
  HelpContext = 50049
  Caption = 'Cadastro de Tamanho'
  ClientHeight = 220
  ClientWidth = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 416
    Height = 134
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodTamanho
    end
    object Label2: TLabel
      Left = 24
      Top = 72
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescTamanho
    end
    object dbedCodTamanho: TDBEdit
      Left = 24
      Top = 40
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODTAMANHO'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescTamanho: TDBEdit
      Left = 24
      Top = 88
      Width = 369
      Height = 21
      DataField = 'DESCTAMANHO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 416
  end
  inherited Dock971: TDock97
    Top = 181
    Width = 416
    inherited tb97Fundo: TToolbar97
      Left = 246
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50049
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 738
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 776
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 288
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 212
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TAMANHO.CODTAMANHO'
      'TAMANHO.DESCTAMANHO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TAMANHO')
    CamposChave.Strings = (
      'TAMANHO.CODTAMANHO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '3'
      '20')
    Left = 368
    Top = 7
  end
end
