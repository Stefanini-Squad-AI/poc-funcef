inherited FrmCadCidade: TFrmCadCidade
  Left = 543
  Top = 218
  HelpContext = 20012
  Caption = 'Cadastro de Cidade'
  ClientHeight = 301
  ClientWidth = 340
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 340
    Height = 215
    object Label1: TLabel
      Left = 30
      Top = 17
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 30
      Top = 62
      Width = 40
      Height = 13
      Caption = 'Estado'
    end
    object Label3: TLabel
      Left = 29
      Top = 105
      Width = 28
      Height = 13
      Caption = 'DDD'
    end
    object Label4: TLabel
      Left = 179
      Top = 105
      Width = 114
      Height = 13
      Caption = 'Cód. Municipio - MF'
    end
    object Label5: TLabel
      Left = 181
      Top = 59
      Width = 25
      Height = 13
      Caption = 'Pais'
    end
    object Label6: TLabel
      Left = 29
      Top = 149
      Width = 81
      Height = 13
      Caption = 'Número SEED'
    end
    object Label7: TLabel
      Left = 89
      Top = 105
      Width = 73
      Height = 13
      Caption = 'Código IBGE'
    end
    object dbedNome: TDBEdit
      Left = 30
      Top = 32
      Width = 283
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object dblcEstado: TCMDBLookupCombo
      Left = 30
      Top = 76
      Width = 135
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEESTADO'#9'15'#9'Estado'
        'NOMEPAIS'#9'15'#9'Pais')
      DataField = 'IDESTADO'
      DataSource = ds
      LookupTable = CdsEstado
      LookupField = 'IDESTADO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcEstadoCloseUp
    end
    object DbEdDdd: TwwDBEdit
      Left = 29
      Top = 121
      Width = 44
      Height = 21
      DataField = 'DDD'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdCodMunMF: TwwDBEdit
      Left = 179
      Top = 121
      Width = 134
      Height = 21
      DataField = 'CODMUNICIPIO'
      DataSource = ds
      Enabled = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DbEdNumSeed: TwwDBEdit
      Left = 29
      Top = 165
      Width = 284
      Height = 21
      DataField = 'NUMSEED'
      DataSource = ds
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object EdPais: TEdit
      Left = 180
      Top = 75
      Width = 133
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdCodigoIbge: TwwDBEdit
      Left = 89
      Top = 121
      Width = 76
      Height = 21
      DataField = 'CodMunicipioIbge'
      DataSource = ds
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 340
  end
  inherited Dock971: TDock97
    Top = 262
    Width = 340
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 202
    Top = 19
  end
  inherited ImlPadrao: TImageList
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    OnConfirma = CmeCadastroCancel
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 268
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 200
    Top = 71
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.NOMEESTADO'
      'PAIS.NOMEPAIS'
      'CIDADES.DDD'
      'CIDADES.CODMUNICIPIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome Cidade'
      'Nome Estado'
      'Nome País'
      'DDD'
      'Código MF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'ESTADO.IDESTADO = CIDADES.IDESTADO'
      'PAIS.IDPAIS = ESTADO.IDPAIS')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '30'
      '30'
      '5'
      '10')
    Left = 268
    Top = 71
  end
  object CdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 67
  end
end
