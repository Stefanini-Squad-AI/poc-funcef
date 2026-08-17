inherited frmPlanoTrabalhoMT: TfrmPlanoTrabalhoMT
  Left = 238
  Top = 114
  HelpContext = 520033
  Caption = 'Plano de Trabalho'
  ClientHeight = 494
  ClientWidth = 653
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 653
    Height = 408
    object lblUnidNegoc: TLabel
      Left = 440
      Top = 18
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Label2: TLabel
      Left = 24
      Top = 58
      Width = 84
      Height = 13
      Caption = 'Período Inicial'
    end
    object Label3: TLabel
      Left = 232
      Top = 58
      Width = 77
      Height = 13
      Caption = 'Período Final'
    end
    object lblObjetivo: TLabel
      Left = 24
      Top = 98
      Width = 48
      Height = 13
      Caption = 'Objetivo'
    end
    object lblNecessidade: TLabel
      Left = 24
      Top = 184
      Width = 269
      Height = 13
      Caption = 'Descrever a situação que gerou a necessidade'
    end
    object Label4: TLabel
      Left = 24
      Top = 242
      Width = 247
      Height = 13
      Caption = 'Indicar os resultados/benefícios esperados'
    end
    object Label5: TLabel
      Left = 24
      Top = 298
      Width = 346
      Height = 13
      Caption = 'Indicar as conseqüências do não atendimento da proposição'
    end
    object lblCentRespon: TLabel
      Left = 440
      Top = 58
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label7: TLabel
      Left = 104
      Top = 18
      Width = 184
      Height = 13
      Caption = 'Descrição do Plano de Trabalho'
    end
    object Label8: TLabel
      Left = 24
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object lblTipoAtividade: TLabel
      Left = 536
      Top = 18
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Caption = 'lblTipoAtividade'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dblcUnidNegocio: TwwDBLookupCombo
      Left = 440
      Top = 32
      Width = 193
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'#9'F'
        'UNECODIGO'#9'10'#9'Código'#9'F')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = cdsUnidNegocio
      LookupField = 'UNIDNEGOC'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcUnidNegocioCloseUp
      OnExit = dblcUnidNegocioExit
    end
    object dblcPeriodoIni: TwwDBLookupCombo
      Left = 24
      Top = 72
      Width = 193
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEEXERC'#9'60'#9'Período'#9'F')
      DataField = 'PERIODOINI'
      DataSource = ds
      LookupTable = cdsPeriodoIni
      LookupField = 'PERIODO'
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcPeriodoFim: TwwDBLookupCombo
      Left = 232
      Top = 72
      Width = 193
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEEXERC'#9'60'#9'Período'#9'F')
      DataField = 'PERIODOFIM'
      DataSource = ds
      LookupTable = cdsPeriodoFim
      LookupField = 'PERIODO'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbmObjetivo: TDBMemo
      Left = 24
      Top = 112
      Width = 506
      Height = 65
      DataField = 'OBJETIVO'
      DataSource = ds
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object dbmNecessidade: TDBMemo
      Left = 24
      Top = 200
      Width = 613
      Height = 33
      DataField = 'NECESSIDADE'
      DataSource = ds
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object dbrgPrioridade: TDBRadioGroup
      Left = 544
      Top = 104
      Width = 91
      Height = 73
      Caption = ' Prioridade '
      DataField = 'PRIORIDADE'
      DataSource = ds
      Items.Strings = (
        '&Baixa'
        '&Média'
        '&Alta')
      TabOrder = 7
      Values.Strings = (
        'B'
        'M'
        'A')
    end
    object dbmResultEsperados: TDBMemo
      Left = 24
      Top = 256
      Width = 613
      Height = 33
      DataField = 'BENEFESPERADO'
      DataSource = ds
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object dbmNaoAtendimento: TDBMemo
      Left = 24
      Top = 312
      Width = 613
      Height = 33
      DataField = 'CONSEQNAOATEND'
      DataSource = ds
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 10
    end
    object dbedCodigo: TwwDBEdit
      Left = 24
      Top = 32
      Width = 73
      Height = 21
      DataField = 'IDPLANOTRABALHO'
      DataSource = ds
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedDescricao: TwwDBEdit
      Left = 104
      Top = 32
      Width = 325
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcCentRespon: TwwDBLookupCombo
      Left = 440
      Top = 72
      Width = 193
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Descrição'#9'F'
        'CODEXTERNO'#9'10'#9'Código'#9'F')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = cdsCentRespon
      LookupField = 'CODCENTRORESPON'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 653
  end
  inherited Dock971: TDock97
    Top = 455
    Width = 653
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520033
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 264
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 394
    Top = 6
  end
  inherited Cds: TCMClientDataSet
    Left = 322
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO'
      'PLANOTRABALHOORC.EXERCICIOINI'
      'PERIODOORCAMENI.NOMEPERIODO'
      'PLANOTRABALHOORC.EXERCICIOFIM'
      'PERIODOORCAMENF.NOMEPERIODO'
      'PLANOTRABALHOORC.OBJETIVO'
      'PLANOTRABALHOORC.IDPLANOTRABALHO'
      'PLANOTRABALHOORC.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome da Atividade/Projeto'
      'Código da Atividade/Projeto'
      'Exercício Inicial'
      'Período Inicial'
      'Exercício Final'
      'Período Final'
      'Objetivo'
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOTRABALHOORC'
      'UNIDNEGOCIO'
      'PERIODOORCAMEN PERIODOORCAMENI'
      'PERIODOORCAMEN PERIODOORCAMENF')
    CamposChave.Strings = (
      'PLANOTRABALHOORC.IDPLANOTRABALHO')
    Filtro.Strings = (
      'PLANOTRABALHOORC.UNIDNEGOC = UNIDNEGOCIO.UNIDNEGOC'
      'PLANOTRABALHOORC.IDPESSOA = UNIDNEGOCIO.IDPESSOA'
      'PLANOTRABALHOORC.IDPESSOA = PERIODOORCAMENI.IDPESSOA'
      'PLANOTRABALHOORC.EXERCICIOINI = PERIODOORCAMENI.EXERCICIO'
      'PLANOTRABALHOORC.PERIODOINI= PERIODOORCAMENI.PERIODO'
      'PLANOTRABALHOORC.IDPESSOA = PERIODOORCAMENF.IDPESSOA'
      'PLANOTRABALHOORC.EXERCICIOFIM = PERIODOORCAMENF.EXERCICIO'
      'PLANOTRABALHOORC.PERIODOFIM= PERIODOORCAMENF.PERIODO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 553
    Top = 12
  end
  object cdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 364
    Top = 93
  end
  object cdsPeriodoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 103
    Top = 93
  end
  object cdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 181
    Top = 93
  end
  object cdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 268
    Top = 96
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM CENTRESPON')
    ClientDataSet = cdsCentRespon
    Left = 472
    Top = 25
  end
end
