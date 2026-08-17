inherited frmCadTipProc: TfrmCadTipProc
  Left = 166
  Caption = 'Cadastro de Tipos de Processo'
  ClientHeight = 261
  ClientWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 463
  end
  inherited pnlFundo: TPanel [1]
    Width = 463
    Height = 175
    BorderWidth = 2
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 16
      Top = 59
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbedDescr
    end
    object dbedCodigo: TDBEdit
      Left = 16
      Top = 27
      Width = 114
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'IDTIPOPROC'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 16
      Top = 73
      Width = 430
      Height = 21
      DataField = 'NOMETIPOPROC'
      DataSource = ds
      TabOrder = 1
    end
    object dbrgExigeCCusto: TDBRadioGroup
      Left = 16
      Top = 117
      Width = 430
      Height = 45
      Caption = 'Haverá Contabilização por Centro de Custo ?'
      Columns = 2
      DataField = 'FLGEXIGECCUSTO'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
    end
  end
  inherited Dock971: TDock97
    Top = 222
    Width = 463
    inherited tb97Fundo: TToolbar97
      Left = 291
      DockPos = 369
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 122
      DockPos = 200
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 409
    Top = 15
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 409
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 333
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Processo'
    Colunas.Strings = (
      'TIPOPROCESSO.IDTIPOPROC'
      'TIPOPROCESSO.NOMETIPOPROC')
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
      'TIPOPROCESSO')
    CamposChave.Strings = (
      'TIPOPROCESSO.IDTIPOPROC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '17'
      '65')
    ExibePergunta = False
    Left = 333
    Top = 1
  end
end
