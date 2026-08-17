inherited FrmMtCadAlmoxarifado: TFrmMtCadAlmoxarifado
  Left = 179
  Top = 113
  HelpContext = 50055
  Caption = 'Cadastro de Almoxarifado'
  ClientHeight = 259
  ClientWidth = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 173
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 112
      Height = 13
      Caption = 'Unidade de Custeio'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object edAlmoxa: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object dblkcmbUnCusteio: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 258
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTEIO'#9'30'#9'Descrição'
        'UCCONTABIL'#9'10'#9'Contábil')
      DataField = 'CODCUSTEIO'
      DataSource = ds
      LookupTable = CdsUnCusteio
      LookupField = 'CODCUSTEIO'
      Options = [loTitles]
      Style = csDropDownList
      DropDownCount = 10
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblkcmbCentroCusto: TwwDBLookupCombo
      Left = 24
      Top = 128
      Width = 258
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'
        'CODCENTROCUSTO'#9'10'#9'Código')
      DataField = 'CODCENTROCUSTO'
      DataSource = ds
      LookupTable = CdsCentroCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbedDesc: TDBEdit
      Left = 24
      Top = 32
      Width = 258
      Height = 21
      DataField = 'DESCALMOX'
      DataSource = ds
      TabOrder = 0
    end
    object rgrpTipoAlmox: TDBRadioGroup
      Left = 292
      Top = 25
      Width = 136
      Height = 124
      Caption = 'Tipo de Almoxarifado'
      DataField = 'PRINCIPSECUND'
      DataSource = ds
      Items.Strings = (
        'Principal'
        'Secundário')
      TabOrder = 3
      Values.Strings = (
        'P'
        'S')
    end
  end
  inherited Dock972: TDock97
    Width = 449
  end
  inherited Dock971: TDock97
    Top = 220
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 279
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50055
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 722
    Top = 65527
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 792
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 200
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 270
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ALMOX.CODALMOXARIFADO'
      'ALMOX.DESCALMOX')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ALMOX')
    CamposChave.Strings = (
      'ALMOX.CODALMOXARIFADO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Left = 400
    Top = 7
  end
  object CdsUnCusteio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspUnCusteio'
    Left = 214
    Top = 100
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspCentroCusto'
    Left = 214
    Top = 156
  end
end
