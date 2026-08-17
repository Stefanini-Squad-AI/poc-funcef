inherited frmMTCadMoedas: TfrmMTCadMoedas
  Left = 235
  Top = 149
  HelpContext = 70006
  Caption = 'Moedas usadas no Sistema'
  ClientHeight = 240
  ClientWidth = 415
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 154
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    object Label2: TLabel
      Left = 32
      Top = 80
      Width = 68
      Height = 13
      Caption = 'Tipo Moeda'
    end
    object dbcMoeda: TwwDBLookupCombo
      Left = 32
      Top = 40
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = cdsMoeda
      LookupField = 'MOECODIGO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object cmbTipoMoeda: TComboBox
      Left = 32
      Top = 96
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Oficial'
        'Fiscal'
        'Gerencial')
    end
  end
  inherited Dock972: TDock97
    Width = 415
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 690
    Top = 407
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
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 280
    Top = 120
  end
  inherited Cds: TCMClientDataSet
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Moeda'
    Colunas.Strings = (
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'NOME')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CAFMOEDAS'
      'MOEDA')
    CamposChave.Strings = (
      'CAFMOEDAS.IDTIPOMOEDA'
      'CAFMOEDAS.MOECODIGO'
      'CAFMOEDAS.IDPESSOA')
    Filtro.Strings = (
      'CAFMOEDAS.MOECODIGO = MOEDA.MOECODIGO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    Left = 264
    Top = 0
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 216
    Top = 120
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 135
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY IDBEM')
    ClientDataSet = cdsBem
    Left = 344
    Top = 120
  end
end
