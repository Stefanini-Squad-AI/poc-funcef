inherited frmCadVara: TfrmCadVara
  Left = 156
  Top = 255
  Caption = 'Tabela dos Órgãos Jurisdicionais (Varas)'
  ClientHeight = 209
  ClientWidth = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 123
    BorderWidth = 2
    object Label1: TLabel
      Left = 18
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object Label2: TLabel
      Left = 142
      Top = 14
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = dbedDescr
    end
    object Label3: TLabel
      Left = 18
      Top = 68
      Width = 130
      Height = 13
      Caption = 'Unidade da Federação'
    end
    object dbedCodigo: TDBEdit
      Left = 18
      Top = 29
      Width = 114
      Height = 21
      DataField = 'IDVARAJUSTICA'
      DataSource = ds
      MaxLength = 15
      TabOrder = 0
    end
    object dbedDescr: TDBEdit
      Left = 142
      Top = 29
      Width = 302
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
    end
    object dblcEstado: TwwDBLookupCombo
      Left = 18
      Top = 84
      Width = 426
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEESTADO'#9'30'#9'Nome'
        'CODESTADO'#9'3'#9'Sigla')
      DataField = 'IDESTADO'
      DataSource = ds
      LookupTable = CdsEstado
      LookupField = 'IDESTADO'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
  end
  inherited Dock972: TDock97
    Width = 462
  end
  inherited Dock971: TDock97
    Top = 170
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 388
    Top = 14
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 388
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 319
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'VARAJUSTICA.IDVARAJUSTICA'
      'VARAJUSTICA.DESCRICAO'
      'ESTADO.CODESTADO'
      'ESTADO.NOMEESTADO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Sigla UF'
      'Nome UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VARAJUSTICA'
      'ESTADO')
    CamposChave.Strings = (
      'VARAJUSTICA.IDVARAJUSTICA')
    Filtro.Strings = (
      'VARAJUSTICA.IDESTADO = ESTADO.IDESTADO(+) ')
    Larguras.Strings = (
      '17'
      '45'
      '10'
      '20')
    ExibePergunta = False
    Left = 319
    Top = 1
  end
  object CdsEstado: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 346
    Top = 67
  end
end
