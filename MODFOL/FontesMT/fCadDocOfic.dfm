inherited frmCadDocOfic: TfrmCadDocOfic
  Left = 237
  Top = 233
  HelpContext = 210041
  Caption = 'Cadastro de Documentos Oficiais'
  ClientHeight = 199
  ClientWidth = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 330
    Height = 113
    BorderWidth = 2
    object Label1: TLabel
      Left = 17
      Top = 12
      Width = 80
      Height = 13
      Caption = 'Código Oficial'
    end
    object Label2: TLabel
      Left = 107
      Top = 12
      Width = 115
      Height = 13
      Caption = 'Sigla do Documento'
    end
    object Label3: TLabel
      Left = 17
      Top = 61
      Width = 112
      Height = 13
      Caption = 'Tipo de Documento'
    end
    object dbedCodigo: TwwDBEdit
      Left = 17
      Top = 27
      Width = 80
      Height = 21
      DataField = 'CODDOCUMENTO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedSigla: TwwDBEdit
      Left = 107
      Top = 27
      Width = 205
      Height = 21
      DataField = 'SIGLADOCUMENTO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcTipoDoc: TwwDBLookupCombo
      Left = 17
      Top = 77
      Width = 296
      Height = 21
      AutoSize = False
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
      DataField = 'IDDOCUMENTO'
      DataSource = ds
      LookupTable = CdsTipoDoc
      LookupField = 'IDDOCUMENTO'
      Style = csDropDownList
      Frame.FocusStyle = efsFrameEtched
      Frame.NonFocusStyle = efsFrameSunken
      ImageList = ImlPadrao
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = dblcTipoDocChange
    end
  end
  inherited Dock972: TDock97
    Width = 330
  end
  inherited Dock971: TDock97
    Top = 160
    Width = 330
    inherited tb97Fundo: TToolbar97
      Left = 166
      DockPos = 264
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 96
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 285
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 102
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 285
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 222
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 74
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Documento Oficial'
    Colunas.Strings = (
      'TIPODOCOFICIAL.CODDOCUMENTO'
      'TIPODOCOFICIAL.SIGLADOCUMENTO'
      'TIPODOCPESSOA.NOMEDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Sigla'
      'Tipo de Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPODOCOFICIAL'
      'TIPODOCPESSOA')
    CamposChave.Strings = (
      'TIPODOCOFICIAL.CODDOCUMENTO')
    Filtro.Strings = (
      'TIPODOCOFICIAL.IDDOCUMENTO = TIPODOCPESSOA.IDDOCUMENTO(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '3'
      '15'
      '30')
    ExibePergunta = False
    Left = 222
    Top = 1
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 154
    Top = 1
  end
end
