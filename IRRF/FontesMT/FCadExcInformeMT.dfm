inherited frmCadExcInformeMT: TfrmCadExcInformeMT
  Left = 189
  Top = 105
  HelpContext = 240028
  Caption = 'Cadastro de Exceções para o Informe'
  ClientHeight = 314
  ClientWidth = 486
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    Height = 228
    object lblRubPrin: TLabel
      Left = 32
      Top = 24
      Width = 98
      Height = 13
      Caption = 'Rubrica Principal'
    end
    object Label1: TLabel
      Left = 32
      Top = 72
      Width = 49
      Height = 13
      Caption = 'Rubrica '
    end
    object Label2: TLabel
      Left = 32
      Top = 120
      Width = 118
      Height = 13
      Caption = 'Linha para o Informe'
    end
    object lblPrioridade: TLabel
      Left = 32
      Top = 168
      Width = 58
      Height = 13
      Caption = 'Prioridade'
    end
    object dblcRubPrinc: TCMDBLookupCombo
      Left = 32
      Top = 40
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'Descrição'
        'IDPROVENTO'#9'10'#9'Código')
      DataField = 'IDRUBRICAPRIN'
      DataSource = ds
      LookupTable = cdsRubrica
      LookupField = 'IDPROVENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcRubrica: TCMDBLookupCombo
      Left = 32
      Top = 88
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'Descrição'
        'IDPROVENTO'#9'10'#9'Código')
      DataField = 'IDRUBRICA'
      DataSource = ds
      LookupTable = cdsRubrica
      LookupField = 'IDPROVENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcLinhaInforme: TwwDBLookupCombo
      Left = 32
      Top = 136
      Width = 364
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEINFORME'#9'60'#9'Linha'
        'CODINFORME'#9'10'#9'Código'
        'IDINFORME'#9'10'#9'Identificador')
      DataField = 'IDINFORME'
      DataSource = ds
      LookupTable = cdsLinhaInforme
      LookupField = 'IDINFORME'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbedPrioridade: TwwDBEdit
      Left = 32
      Top = 184
      Width = 121
      Height = 21
      DataField = 'PRIORIDADE'
      DataSource = ds
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 486
  end
  inherited Dock971: TDock97
    Top = 275
    Width = 486
    inherited tb97Fundo: TToolbar97
      Left = 314
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 145
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 74
    Top = 255
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 0
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 416
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    Left = 292
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROVDESC1.DESCRICAO'
      'PROVDESC2.DESCRICAO'
      'INFORME.NOMEINFORME'
      'RUBRICAXINFORME.PRIORIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Rubrica Principal'
      'Rubrica'
      'Informe'
      'Prioridade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INFORME'
      'RUBRICAXINFORME'
      'PROVDESC PROVDESC1'
      'PROVDESC PROVDESC2')
    CamposChave.Strings = (
      'RUBRICAXINFORME.IDRUBRICAPRIN'
      'RUBRICAXINFORME.IDRUBRICA')
    Filtro.Strings = (
      'RUBRICAXINFORME.IDINFORME = INFORME.IDINFORME'
      'RUBRICAXINFORME.IDRUBRICAPRIN = PROVDESC1.IDPROVENTO'
      'RUBRICAXINFORME.IDRUBRICA = PROVDESC2.IDPROVENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '60'
      '10')
    Left = 333
  end
  object cdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 228
    Top = 63
  end
  object cdsLinhaInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 228
    Top = 167
  end
end
