inherited frmCadCargo: TfrmCadCargo
  Left = 95
  Top = 124
  Caption = 'Cadastro dos Cargos'
  ClientHeight = 382
  ClientWidth = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 296
    BorderWidth = 2
    object Label1: TLabel
      Left = 14
      Top = 16
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Código'
      FocusControl = dbedCodigo
    end
    object lblPontosHay: TLabel
      Left = 238
      Top = 17
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Pontos Hay'
    end
    object lblFaixaSal: TLabel
      Left = 400
      Top = 17
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Faixa Salarial'
    end
    object lblValorHay: TLabel
      Left = 406
      Top = 17
      Width = 86
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor Hay'
    end
    object Label2: TLabel
      Left = 14
      Top = 43
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Título'
      FocusControl = dbedTitulo
    end
    object Label4: TLabel
      Left = 14
      Top = 70
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CBO 1994'
    end
    object Label3: TLabel
      Left = 14
      Top = 100
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'CBO 2002'
    end
    object lblGrupo: TLabel
      Left = 14
      Top = 129
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Grupo Funcional'
      FocusControl = dbmemDescr
    end
    object lblDescricao: TLabel
      Left = 14
      Top = 156
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = dbmemDescr
    end
    object dbedCodigo: TDBEdit
      Left = 122
      Top = 13
      Width = 84
      Height = 21
      DataField = 'IDCARGO'
      DataSource = ds
      TabOrder = 0
    end
    object dbrePontosHay: TDBRealEdit
      Left = 328
      Top = 13
      Width = 73
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
      DataField = 'PONTOSHAY'
      DataSource = ds
    end
    object dblcFaixaSal: TwwDBLookupCombo
      Left = 504
      Top = 13
      Width = 85
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'IDFAIXASALARIAL'#9'10'#9'Código'
        'STEP1'#9'10'#9'STEP 1'
        'STEP2'#9'10'#9'STEP 2'
        'STEP3'#9'10'#9'STEP 3'
        'STEP4'#9'10'#9'STEP 4'
        'STEP5'#9'10'#9'STEP 5'
        'STEP6'#9'10'#9'STEP 6'
        'STEP7'#9'10'#9'STEP 7'
        'STEP8'#9'10'#9'STEP 8'
        'STEP9'#9'10'#9'STEP 9'
        'DATAEFETIV'#9'10'#9'Data Efetiv.')
      DataField = 'IDFAIXASALARIAL'
      DataSource = ds
      LookupTable = CdsFaixa
      LookupField = 'IDFAIXASALARIAL'
      Options = [loColLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redValorHay: TRealEdit
      Left = 504
      Top = 13
      Width = 85
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object dbedTitulo: TDBEdit
      Left = 122
      Top = 40
      Width = 467
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      TabOrder = 4
    end
    object dbedCBO1994: TDBEdit
      Left = 122
      Top = 67
      Width = 87
      Height = 21
      DataField = 'CBO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 5
      OnEnter = dbedCBO1994Enter
      OnExit = dbedCBO1994Exit
    end
    object dbedCBO2002: TDBEdit
      Left = 122
      Top = 97
      Width = 87
      Height = 21
      DataField = 'CBO2002'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      TabOrder = 6
      OnEnter = dbedCBO2002Enter
      OnExit = dbedCBO2002Exit
    end
    object dblcGrupo: TwwDBLookupCombo
      Left = 122
      Top = 126
      Width = 467
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRPFUNC'#9'40'#9'DESCGRPFUNC')
      DataField = 'CODGRPFUNC'
      DataSource = ds
      LookupTable = CdsGrupo
      LookupField = 'CODGRPFUNC'
      Style = csDropDownList
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      UseTFields = False
      AllowClearKey = True
    end
    object dbmemDescr: TDBMemo
      Left = 14
      Top = 170
      Width = 575
      Height = 112
      DataField = 'DESCRICAO'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object edCBO1994: TEdit
      Left = 216
      Top = 67
      Width = 345
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object edCBO2002: TEdit
      Left = 216
      Top = 97
      Width = 345
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object bbtnProcCBO1994: TBitBtn
      Left = 564
      Top = 65
      Width = 25
      Height = 24
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      OnClick = bbtnProcCBO1994Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object bbtnProcCBO2002: TBitBtn
      Left = 564
      Top = 95
      Width = 25
      Height = 24
      ParentShowHint = False
      ShowHint = False
      TabOrder = 12
      OnClick = bbtnProcCBO2002Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
  end
  inherited Dock972: TDock97
    Width = 603
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 433
      DockPos = 439
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 266
      DockPos = 272
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 555
    Top = 14
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 555
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 469
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    AfterScroll = CdsAfterScroll
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargo'
    Colunas.Strings = (
      'CARGO.IDCARGO'
      'CARGO.TITULO'
      'CBO.IDCBO'
      'CARGO.CBO2002')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Código'
      'Título'
      'Cód. CBO'
      'Cód. CBO 2002')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CBO'
      'CARGO')
    CamposChave.Strings = (
      'CARGO.IDCARGO')
    Filtro.Strings = (
      'CARGO.CBO = CBO.IDCBO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '45'
      '10'
      '10')
    ExibePergunta = False
    Left = 469
    Top = 1
  end
  object CdsGrupo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 320
    Top = 1
  end
  object CdsFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 384
    Top = 1
  end
  object MontaSelectCBO1994: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona CBO 1994'
    Colunas.Strings = (
      'CBO.IDCBO'
      'CBO.DESCRICAO')
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
      'CBO')
    CamposChave.Strings = (
      'CBO.IDCBO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 497
    Top = 225
  end
  object MontaSelectCBO2002: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona CBO 2002'
    Colunas.Strings = (
      'CBO.IDCBO'
      'CBO.DESCRICAO')
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
      'CBO')
    CamposChave.Strings = (
      'CBO.IDCBO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '80')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 497
    Top = 273
  end
end
