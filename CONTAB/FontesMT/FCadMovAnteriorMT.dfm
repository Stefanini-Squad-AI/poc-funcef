inherited frmCadMovAnteriorMT: TfrmCadMovAnteriorMT
  Left = 197
  Top = 122
  Caption = 
    'Cadastro do Movimento de Exercícios Anteriores e Contas Estatíst' +
    'icas'
  ClientHeight = 434
  ClientWidth = 635
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 635
    Height = 395
    object Label5: TLabel
      Left = 309
      Top = 15
      Width = 92
      Height = 13
      Caption = 'Centro de Custo'
    end
    object Label6: TLabel
      Left = 310
      Top = 58
      Width = 60
      Height = 13
      Caption = 'Sub-Conta'
    end
    object Label7: TLabel
      Left = 24
      Top = 104
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label4: TLabel
      Left = 24
      Top = 154
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 189
      Top = 153
      Width = 82
      Height = 13
      Caption = 'Valor a Débito'
    end
    object Label3: TLabel
      Left = 311
      Top = 153
      Width = 85
      Height = 13
      Caption = 'Valor a Crédito'
    end
    object Bevel1: TBevel
      Left = 24
      Top = 143
      Width = 599
      Height = 7
      Shape = bsBottomLine
      Style = bsRaised
    end
    object Label2: TLabel
      Left = 24
      Top = 14
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object mskUnidNegoc: TMaskEdit
      Left = 64
      Top = 117
      Width = 17
      Height = 21
      Color = clAqua
      TabOrder = 5
      Visible = False
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 28
      Width = 69
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCI'
      LookupTable = CdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnClick = dblkExercicioClick
      OnCloseUp = dblkExercicioCloseUp
    end
    object dblkCCusto: TwwDBLookupCombo
      Left = 309
      Top = 29
      Width = 166
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome'#9'F'
        'CODEXTERNO'#9'10'#9'Centro Custo'#9'F')
      DataField = 'CODCENTROCUSTO'
      LookupTable = CdsCentroCusto
      LookupField = 'CODCENTROCUSTO'
      Options = [loColLines]
      Style = csDropDownList
      Color = clBtnFace
      DropDownWidth = 360
      Enabled = False
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnClick = dblkExercicioClick
    end
    object mskSubConta: TMaskEdit
      Left = 309
      Top = 72
      Width = 138
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
      OnClick = dblkExercicioClick
      OnExit = mskSubContaExit
    end
    object btnSubConta: TBitBtn
      Left = 449
      Top = 71
      Width = 23
      Height = 22
      Enabled = False
      TabOrder = 3
      OnClick = btnSubContaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object mskAtivProj: TMaskEdit
      Left = 23
      Top = 117
      Width = 129
      Height = 21
      TabOrder = 4
      OnChange = dblkExercicioClick
      OnExit = mskAtivProjExit
    end
    object btnAtivProj: TBitBtn
      Left = 154
      Top = 117
      Width = 25
      Height = 21
      TabOrder = 6
      OnClick = btnAtivProjClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
    object btnSeleciona: TBitBtn
      Left = 494
      Top = 16
      Width = 128
      Height = 37
      Caption = 'S&eleciona'
      TabOrder = 7
      OnClick = btnSelecionaClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
        33333333330F803333333333330F803333333333330F803333333333308F8703
        3333333308F88870333333308F88888703333308F88888887033308F88888888
        870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
        FF03333337FFFFFF77333333337FFF7733333333333777333333}
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 24
      Top = 168
      Width = 142
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome'#9'F'
        'PERNUMERO'#9'10'#9'No.Período'#9'F')
      LookupTable = CdsPeriodo
      LookupField = 'PERNUMERO'
      Options = [loColLines]
      Style = csDropDownList
      Color = clBtnFace
      DropDownWidth = 360
      Enabled = False
      ParentFont = False
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object redValorDebito: TRealEdit
      Left = 189
      Top = 166
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 9
      WordWrap = False
      IntDigits = 100
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object redValorCredito: TRealEdit
      Left = 311
      Top = 166
      Width = 113
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Enabled = False
      Lines.Strings = (
        '      0,00')
      TabOrder = 10
      WordWrap = False
      IntDigits = 100
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object btnInclui: TBitBtn
      Left = 450
      Top = 162
      Width = 169
      Height = 25
      Caption = '&Inclui ou Altera o Valor'
      Enabled = False
      TabOrder = 11
      OnClick = btnIncluiClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
        77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
        7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
        077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
        F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
        FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
        077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
        FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
        777777777787FF88777777777778887777777777777888777777}
      NumGlyphs = 2
    end
    object dbgrdSaldo: TwwDBGrid
      Left = 24
      Top = 208
      Width = 587
      Height = 173
      TabStop = False
      Selected.Strings = (
        'PERNOME'#9'26'#9'Período'#9'F'
        'PLSDEBITOCORRENTE'#9'24'#9'Débito'#9'F'
        'PLSCREDITOCOR'#9'23'#9'Crédito'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSaldo
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 12
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdSaldoCalcCellColors
      IndicatorColor = icBlack
    end
    object pnlPlanoPatroC: TPanel
      Left = 185
      Top = 102
      Width = 433
      Height = 40
      BevelOuter = bvNone
      TabOrder = 13
      object lblPlanoPrevC: TLabel
        Left = 8
        Top = 2
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object lblPatroC: TLabel
        Left = 223
        Top = 2
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dblcPlanoPrevC: TwwDBLookupCombo
        Left = 8
        Top = 15
        Width = 201
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPLANOPREV'
        LookupTable = CdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPatroC: TwwDBLookupCombo
        Left = 223
        Top = 15
        Width = 207
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome')
        DataField = 'IDPATRO'
        LookupTable = CdsPatro
        LookupField = 'IDPESSOA'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object cmpConta: TCMProcuraMaskContabil
      Left = 102
      Top = 14
      Width = 200
      Height = 81
      Caption = 'Conta'
      TabOrder = 14
      OnExit = cmpContaExit
      MostraMensagens = True
      MostraDescricao = True
      DataField = 'PLACONTA'
      Mensagens.EmBranco = 'Conta não pode estar em branco'
      Mensagens.NaoExiste = 'Conta não existe'
      Mensagens.Sintetica = 'Conta não pode ser sintética'
      Mensagens.Analitica = 'Conta não pode ser analítica'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      AceitaTipoConta = SoAnalitica
      Plano = 0
      Status = scAmbas
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 635
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 451
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsSaldo: TwwDataSource
    DataSet = CdsSaldo
    Left = 144
    Top = 264
  end
  object CdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 264
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 320
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 83
    Top = 264
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 320
  end
  object CdsCentroCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 327
    Top = 320
    Data = {
      740100009619E0BD01000000180000000800000000000300000074010E434F44
      43454E54524F435553544F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00044E4F4D4501004900
      00000100055749445448020002001E000E535441545553475255504F43444301
      004900000002000753554254595045020049000A004669786564436861720005
      574944544802000200010005504C414E4F0800040000000000094944454D5052
      455341080004000000000008504C41434F4E5441010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002001200
      1149445553554152494F494E434C5553414F08000400000000000A434F444558
      5445524E4F01004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002000A0002000D44454641554C545F4F524445
      5202008200010000000100044C4349440400010009080000}
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 205
    Top = 319
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Sub-Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 504
    Top = 248
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.IDPESSOA'
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.UNIDNEGOC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 504
    Top = 296
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 261
    Top = 264
  end
  object CdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 326
    Top = 264
  end
end
