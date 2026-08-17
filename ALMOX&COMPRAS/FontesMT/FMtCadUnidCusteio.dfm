inherited FrmMTCadUnidCusteio: TFrmMTCadUnidCusteio
  Left = 175
  Top = 151
  HelpContext = 50054
  Caption = 'Cadastro de Unidade de Custeio'
  ClientHeight = 225
  ClientWidth = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 439
    Height = 139
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDesc: TDBEdit
      Left = 32
      Top = 40
      Width = 369
      Height = 21
      DataField = 'DESCCUSTEIO'
      DataSource = ds
      TabOrder = 0
    end
    object chkContabil: TDBCheckBox
      Left = 32
      Top = 88
      Width = 82
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Contábil ?'
      DataField = 'UCCONTABIL'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
  end
  inherited Dock972: TDock97
    Width = 439
  end
  inherited Dock971: TDock97
    Top = 186
    Width = 439
    inherited tb97Fundo: TToolbar97
      Left = 269
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50054
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 102
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 730
    Top = 65527
  end
  inherited ds: TwwDataSource
    Left = 262
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 784
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 300
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNCUSTEI.DESCCUSTEIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'UNCUSTEI')
    CamposChave.Strings = (
      'UNCUSTEI.CODCUSTEIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 416
    Top = 7
  end
end
