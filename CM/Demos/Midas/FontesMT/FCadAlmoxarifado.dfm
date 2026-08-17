inherited FrmCadAlmoxarifado: TFrmCadAlmoxarifado
  Left = 292
  Top = 260
  Caption = 'Cadastro de Almoxarifado'
  ClientHeight = 259
  ClientWidth = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 465
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
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
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
    Width = 465
  end
  inherited Dock971: TDock97
    Top = 220
    Width = 465
    inherited tb97Fundo: TToolbar97
      Left = 295
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 128
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited Cds: TCMClientDataSet
    Params = <
      item
        DataType = ftFloat
        Name = 'pCODALMOX'
        ParamType = ptUnknown
      end>
    RemoteServer = Skt
    Left = 126
    Top = 92
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
  end
  object CdsUnCusteio: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    ProviderName = 'DspUnCusteio'
    RemoteServer = Skt
    Left = 390
    Top = 60
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
        Value = 1
      end>
    ProviderName = 'DspCentroCusto'
    RemoteServer = Skt
    Left = 326
    Top = 60
  end
  object Skt: TSocketConnection
    ServerGUID = '{99C58BF5-F272-4E62-8101-F2AB2DD454BA}'
    ServerName = 'SvrAlmoxarifado.RdmAlmoxarifado'
    Host = 'LocalHost'
    Left = 328
    Top = 119
  end
end
