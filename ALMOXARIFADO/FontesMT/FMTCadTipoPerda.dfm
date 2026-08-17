inherited FrmMTCadTipoPerda: TFrmMTCadTipoPerda
  Left = 127
  Top = 169
  HelpContext = 50058
  Caption = 'Cadastro de Tipo de Perda'
  ClientHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 120
    object LbDesc: TLabel
      Left = 24
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object edDesc: TDBEdit
      Left = 24
      Top = 32
      Width = 457
      Height = 21
      DataField = 'DESCTIPOPERDA'
      DataSource = ds
      TabOrder = 0
    end
    object chkConsumo: TDBCheckBox
      Left = 24
      Top = 72
      Width = 259
      Height = 17
      Caption = 'Essa perda incide  para consumo'
      DataField = 'CONSUMO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock971: TDock97
    Top = 167
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50058
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 754
    Top = 31
  end
  inherited ds: TwwDataSource
    Left = 230
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 752
    Top = 65519
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
    Left = 188
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOPERDA.DESCTIPOPERDA'
      'TIPOPERDA.CONSUMO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Inside no Cosumo')
    Tabelas.Strings = (
      'TIPOPERDA')
    CamposChave.Strings = (
      'TIPOPERDA.IDTIPOPERDA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '1')
    Left = 352
    Top = 7
  end
end
