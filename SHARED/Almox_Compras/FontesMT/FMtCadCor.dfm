inherited FrmMtCadCor: TFrmMtCadCor
  Left = 197
  Top = 155
  HelpContext = 50050
  Caption = 'Cadastro de Cor'
  ClientHeight = 240
  ClientWidth = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 427
    Height = 154
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodCor
    end
    object Label2: TLabel
      Left = 24
      Top = 80
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescCor
    end
    object dbedCodCor: TDBEdit
      Left = 24
      Top = 40
      Width = 80
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCOR'
      DataSource = ds
      TabOrder = 0
    end
    object dbedDescCor: TDBEdit
      Left = 24
      Top = 96
      Width = 377
      Height = 21
      DataField = 'DESCCOR'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 427
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 427
    inherited tb97Fundo: TToolbar97
      Left = 257
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50050
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 90
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 690
    Top = 65519
  end
  inherited ds: TwwDataSource
    Left = 334
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 752
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 184
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 276
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COR.CODCOR'
      'COR.DESCCOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'COR')
    CamposChave.Strings = (
      'COR.CODCOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '5'
      '25')
    Left = 400
    Top = 7
  end
end
