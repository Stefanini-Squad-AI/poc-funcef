inherited frmCadTipoRegra: TfrmCadTipoRegra
  Left = 151
  Top = 112
  HelpContext = 210057
  Caption = 'Cadastro de Tipos de Regra / Forma de Cálculo'
  ClientHeight = 430
  ClientWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 344
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 72
      Height = 13
      Caption = 'Identificador'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 99
      Top = 13
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 16
      Top = 98
      Width = 25
      Height = 13
      Caption = 'SQL'
    end
    object Label4: TLabel
      Left = 16
      Top = 54
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object dbmemSQLRegra: TDBMemo
      Left = 16
      Top = 113
      Width = 464
      Height = 216
      DataField = 'SQLREGRA'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object dbedDescr: TwwDBEdit
      Left = 99
      Top = 28
      Width = 381
      Height = 21
      DataField = 'DESCREGRA'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 28
      Width = 72
      Height = 21
      Color = clGray
      DataField = 'IDTIPOREGRA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dedGrupo: TwwDBLookupCombo
      Left = 16
      Top = 69
      Width = 464
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição')
      DataField = 'IDGRUPOREGRA'
      DataSource = ds
      LookupTable = CdsGrupoRegra
      LookupField = 'IDGRUPOREGRA'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnChange = dedGrupoChange
    end
  end
  inherited Dock972: TDock97
    Width = 496
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 496
    inherited tb97Fundo: TToolbar97
      Left = 326
      DockPos = 334
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
      DockPos = 167
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 453
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 453
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 391
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Regra / Forma de Cálculo'
    Colunas.Strings = (
      'TIPOREGRA.IDTIPOREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Identificador'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOREGRA')
    CamposChave.Strings = (
      'TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
    Left = 391
    Top = 1
  end
  object CdsGrupoRegra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 318
    Top = 1
  end
end
