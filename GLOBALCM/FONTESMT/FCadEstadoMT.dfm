inherited frmCadUF: TfrmCadUF
  Left = 439
  Top = 143
  HelpContext = 20011
  Caption = 'Cadasrto de UFs'
  ClientHeight = 264
  ClientWidth = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 340
    Height = 178
    object Label1: TLabel
      Left = 65
      Top = 19
      Width = 17
      Height = 13
      Caption = 'UF'
    end
    object Label2: TLabel
      Left = 65
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Estado'
    end
    object Label3: TLabel
      Left = 65
      Top = 112
      Width = 27
      Height = 13
      Caption = 'País'
    end
    object dbedUF: TwwDBEdit
      Left = 65
      Top = 34
      Width = 61
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODESTADO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      UsePictureMask = False
      WantReturns = False
      WordWrap = False
    end
    object dbedestado: TwwDBEdit
      Left = 65
      Top = 79
      Width = 214
      Height = 21
      DataField = 'NOMEESTADO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object CmbPais: TwwDBLookupCombo
      Left = 65
      Top = 127
      Width = 217
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEPAIS'#9'30'#9'NOME'#9'F')
      DataField = 'IDPAIS'
      DataSource = ds
      LookupTable = CdsPais
      LookupField = 'IDPAIS'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 340
  end
  inherited Dock971: TDock97
    Top = 225
    Width = 340
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ds: TwwDataSource
    Left = 226
    Top = 23
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 276
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 220
    Top = 79
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ESTADO.NOMEESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Estado'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'ESTADO.IDESTADO')
    Filtro.Strings = (
      'PAIS.IDPAIS = ESTADO.IDPAIS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    Left = 284
    Top = 71
  end
  object CdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 135
  end
end
