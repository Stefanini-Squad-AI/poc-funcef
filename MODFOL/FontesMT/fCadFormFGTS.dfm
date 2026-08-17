inherited frmCadFormFGTS: TfrmCadFormFGTS
  Left = 147
  HelpContext = 210046
  Caption = 'Cadastro de Formas de Rescisão (Padrão FGTS)'
  ClientHeight = 196
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 110
    BorderWidth = 2
    object Label1: TLabel
      Left = 18
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 100
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 376
      Top = 56
      Width = 80
      Height = 13
      Caption = 'Código Oficial'
    end
    object dbedCodigo: TDBEdit
      Left = 18
      Top = 30
      Width = 70
      Height = 21
      DataField = 'IDFORMARESC'
      DataSource = ds
      MaxLength = 10
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 100
      Top = 30
      Width = 370
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 18
      Top = 57
      Width = 348
      Height = 37
      Caption = 'Aplica-se a'
      Columns = 3
      DataField = 'FLGOPTANTE'
      DataSource = ds
      Items.Strings = (
        'Optantes'
        'Não Optantes'
        'Retratação')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object DBEdit1: TDBEdit
      Left = 376
      Top = 69
      Width = 94
      Height = 21
      DataField = 'CODOFICIAL'
      DataSource = ds
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 488
  end
  inherited Dock971: TDock97
    Top = 157
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 316
      DockPos = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 147
      DockPos = 159
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 395
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 395
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 328
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Forma de Rescisão'
    Colunas.Strings = (
      'FORMARESCFGTS.IDFORMARESC'
      'FORMARESCFGTS.DESCRICAO')
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
      'FORMARESCFGTS')
    CamposChave.Strings = (
      'FORMARESCFGTS.IDFORMARESC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '65')
    ExibePergunta = False
    Left = 328
    Top = 1
  end
end
