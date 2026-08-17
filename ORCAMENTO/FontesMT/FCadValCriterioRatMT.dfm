inherited frmCadValCriterioRatMT: TfrmCadValCriterioRatMT
  Left = 110
  Top = 43
  HelpContext = 520032
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Valores Base Para Rateio'
  ClientHeight = 511
  ClientWidth = 867
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock972: TDock97 [0]
    Width = 867
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97 [1]
    Top = 472
    Width = 867
    object Shape1: TShape [0]
      Left = 14
      Top = 12
      Width = 24
      Height = 12
      Brush.Color = 5852665
    end
    object Label1: TLabel [1]
      Left = 42
      Top = 12
      Width = 194
      Height = 13
      Caption = 'Linhas que não serão modificadas'
    end
    inherited tb97Fundo: TToolbar97
      Left = 485
      DockPos = 485
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 303
      DockPos = 303
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 867
    Height = 425
    object Splitter1: TSplitter [0]
      Left = 592
      Top = 131
      Width = 5
      Height = 293
      Cursor = crHSplit
      Align = alRight
      Beveled = True
    end
    inherited dbGrd: TwwDBGrid [1]
      Top = 131
      Width = 591
      Height = 293
      Selected.Strings = (
        'CODEXTERNO'#9'15'#9'Código~Centro de Custo'
        'NOME'#9'30'#9'Centro de Custo'
        'PLANO'#9'15'#9'Plano'
        'PATRO'#9'15'#9'Patro'
        'ATIVIDADEPROJETO'#9'25'#9'Atividade de Projeto'
        'PROGRAMA'#9'15'#9'Programa'
        'TIPODESPESA'#9'15'#9'Tipo de Despesa'
        'PERIODO'#9'9'#9'Periodo~Inicial'
        'EXERCICIO'#9'10'#9'Exercicio~Inicial'
        'PERIODOFIM'#9'7'#9'Periodo~Final'
        'EXERCICIOFIM'#9'10'#9'Exercio~Final'#9'F'
        'VLRCRIRATORC'#9'14'#9'Valor Base')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap, dgShowFooter]
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = dbGrdTitleButtonClick
      OnUpdateFooter = dbGrdUpdateFooter
      FooterHeight = 20
    end
    inherited pnlControles: TPanel [2]
      Top = 131
      Width = 591
      Height = 293
      object Label8: TLabel
        Left = 0
        Top = 0
        Width = 591
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Valores Base de Rateio'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Grid: TwwDBGrid
        Left = 0
        Top = 39
        Width = 591
        Height = 254
        Selected.Strings = (
          'CODEXTERNO'#9'14'#9'Código~Centro de Custo'
          'CENTCUST'#9'30'#9'Centro de Custo'
          'ATIVIDADEPROJETO'#9'25'#9'Atividade de Projeto'
          'PROGRAMA'#9'15'#9'Programa'
          'TIPODESPESA'#9'15'#9'Tipo Despesa'
          'PLANO'#9'15'#9'Plano'
          'PATRO'#9'15'#9'Patro'
          'VALOR'#9'11'#9'Valor Base'
          'VLREFET'#9'10'#9'Valor já~efetuado')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = GridRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAux
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = True
        OnCalcCellColors = GridCalcCellColors
        OnTitleButtonClick = GridTitleButtonClick
        OnExit = GridExit
        IndicatorColor = icBlack
        OnTopRowChanged = dbGrdTopRowChanged
        OnUpdateFooter = GridUpdateFooter
      end
      object pnlTotalRateioCdsAux: TPanel
        Left = 0
        Top = 13
        Width = 591
        Height = 26
        Align = alTop
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnCriterio: TPanel
      Left = 1
      Top = 1
      Width = 865
      Height = 104
      Align = alTop
      TabOrder = 2
      object lblCriterio: TLabel
        Left = 14
        Top = 8
        Width = 100
        Height = 13
        Caption = 'Critério de Rateio'
      end
      object lblExercicio: TLabel
        Left = 322
        Top = 8
        Width = 93
        Height = 13
        Caption = 'Exercício Inicial'
      end
      object lblPeriodo: TLabel
        Left = 429
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Período Inicial'
      end
      object Label2: TLabel
        Left = 644
        Top = 8
        Width = 77
        Height = 13
        Caption = 'Período Final'
      end
      object Label3: TLabel
        Left = 537
        Top = 8
        Width = 86
        Height = 13
        Caption = 'Exercício Final'
      end
      object Label4: TLabel
        Left = 14
        Top = 51
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label5: TLabel
        Left = 236
        Top = 51
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label6: TLabel
        Left = 525
        Top = 51
        Width = 31
        Height = 13
        Caption = 'Patro'
      end
      object btIncluiCC: TSpeedButton
        Left = 199
        Top = 65
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiCCClick
      end
      object btIncluiPlano: TSpeedButton
        Left = 490
        Top = 65
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiPlanoClick
      end
      object btIncluiPatro: TSpeedButton
        Left = 710
        Top = 65
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiPatroClick
      end
      object btIncluiPrograma: TSpeedButton
        Left = 1174
        Top = 22
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiProgramaClick
      end
      object btIncluiTipoDespesa: TSpeedButton
        Left = 1174
        Top = 65
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiTipoDespesaClick
      end
      object Label7: TLabel
        Left = 985
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Programa'
      end
      object Label9: TLabel
        Left = 985
        Top = 52
        Width = 79
        Height = 13
        Caption = 'Tipo Despesa'
      end
      object btIncluiAtividadeProjeto: TSpeedButton
        Left = 942
        Top = 65
        Width = 24
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btIncluiAtividadeProjetoClick
      end
      object Label10: TLabel
        Left = 749
        Top = 51
        Width = 116
        Height = 13
        Caption = 'Atividade de Projeto'
      end
      object dblcCriterio: TCMDBLookupCombo
        Left = 14
        Top = 23
        Width = 295
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        LookupTable = CdsCriterio
        LookupField = 'IDCRITERIORATORC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
      end
      object dblcExercicio: TCMDBLookupCombo
        Left = 322
        Top = 23
        Width = 99
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'Exercício'#9'F')
        LookupTable = CdsExercicio
        LookupField = 'EXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
        OnExit = dblcExercicioExit
      end
      object dblcPeriodo: TCMDBLookupCombo
        Left = 429
        Top = 23
        Width = 94
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'15'#9'Periodo'#9'F'
          'DATAINIPERIODO'#9'18'#9'Início'#9'F'
          'DATAFIMPERIODO'#9'18'#9'Fim'#9'F')
        LookupTable = CdsPeriodo
        LookupField = 'PERIODO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
      end
      object dblcPeriodoFim: TCMDBLookupCombo
        Left = 644
        Top = 23
        Width = 94
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'15'#9'Periodo'#9'F'
          'DATAINIPERIODO'#9'18'#9'Início'#9'F'
          'DATAFIMPERIODO'#9'18'#9'Fim'#9'F')
        LookupTable = cdsPeriodoFim
        LookupField = 'PERIODO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
      end
      object dblcExercFim: TCMDBLookupCombo
        Left = 537
        Top = 23
        Width = 99
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'Exercício'#9'F')
        LookupTable = cdsExercicioFim
        LookupField = 'EXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcCriterioCloseUp
        OnExit = dblcExercFimExit
      end
      object dblcCC: TCMDBLookupCombo
        Left = 14
        Top = 66
        Width = 183
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'#9'F'
          'CODEXTERNO'#9'18'#9'Código'#9'F')
        LookupTable = CdsCC
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPlano: TCMDBLookupCombo
        Left = 236
        Top = 66
        Width = 252
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano'#9'F')
        LookupTable = CdsPlano
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPatro: TCMDBLookupCombo
        Left = 525
        Top = 66
        Width = 183
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Patro'#9'F')
        LookupTable = CdsPatro
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcPrograma: TCMDBLookupCombo
        Left = 984
        Top = 23
        Width = 183
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PROGRAMA'#9'50'#9'Programa'#9'F')
        LookupTable = cdsPrograma
        LookupField = 'IDPROGRAMAORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcTipoDespesa: TCMDBLookupCombo
        Left = 983
        Top = 68
        Width = 183
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPODESPESA'#9'50'#9'Tipo de Despesa'#9'F')
        LookupTable = cdsTipoDespesa
        LookupField = 'IDTIPO_DEPESAORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAtividadeProjeto: TCMDBLookupCombo
        Left = 749
        Top = 68
        Width = 183
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ATIVIDADEPROJETO'#9'50'#9'Atividade \ Projeto'#9'F')
        LookupTable = cdsAtividadeProjeto
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pnlTotal: TPanel
      Left = 597
      Top = 131
      Width = 269
      Height = 293
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object lblTotalizacao: TLabel
        Left = 0
        Top = 0
        Width = 269
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Totalização'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbgTotalizacao: TwwDBGrid
        Left = 0
        Top = 13
        Width = 269
        Height = 280
        Selected.Strings = (
          'DESCRICAO'#9'20'#9'Descrição'
          'VALOR'#9'14'#9'Valor Total')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsTotaliza
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = True
        OnCalcCellColors = dbgTotalizacaoCalcCellColors
        OnTitleButtonClick = dbgTotalizacaoTitleButtonClick
        IndicatorColor = icBlack
      end
    end
    object pnlTotalRateioCds: TPanel
      Left = 1
      Top = 105
      Width = 865
      Height = 26
      Align = alTop
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 4
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 42
    Top = 199
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 294
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 207
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 264
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    AfterPost = CdsAfterPost
    Left = 324
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IDCRITERIORATORC'
      'DESCRICAO'
      'EXERCICIO'
      'EXERCICIOFIM'
      'PERIODO'
      'PERIODOFIM'
      'VALORBASE')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Cód Critério'
      'Critério'
      'Exercício Inicial   '
      'Exercício Final   '
      'Período Inicial   '
      'Período Final   '
      'Valor Base')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CM.VW_PO_VALORRATBASE')
    CamposChave.Strings = (
      'EXERCICIO'
      'PERIODO'
      'IDCRITERIORATORC'
      'PERIODOFIM'
      'VALORBASE  '
      'EXERCICIOFIM')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '9'
      '40'
      '4'
      '4'
      '2'
      '2'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 384
    Top = 7
  end
  object CdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 449
    Top = 448
  end
  object CdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 549
    Top = 448
  end
  object CdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 141
    Top = 220
  end
  object cdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 763
    Top = 447
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      'VR.VLRCRIRATORC, VR.PERIODO, VR.IDVALORCRIRATORC, VR.IDPESSOA,'
      
        'VR.IDEMPRESA, VR.IDCRITERIORATORC, VR.EXERCICIO,VR.CODCENTROCUST' +
        'O,'
      'CC.CODEXTERNO, VR.PERIODOFIM, CC.NOME'
      'FROM VALORCRIRATORC VR, CENTCUST CC'
      'WHERE VR.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      'AND VR.IDEMPRESA       = CC.IDEMPRESA'
      ' ')
    ClientDataSet = Cds
    Left = 199
    Top = 218
  end
  object cdsExercicioFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 669
    Top = 448
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAuxAfterOpen
    Left = 457
    Top = 328
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  TRIM(CC.CODEXTERNO) || '#39' - '#39' || CC.NOME  AS CENTCUST,'
      '  (0) AS VALOR,'
      '  SUM(NVL(VR.VLRCRIRATORC,0)) AS VLREFET '
      ''
      'FROM '
      '  CENTCUST CC,'
      '  VALORCRIRATORC  VR'
      'WHERE '
      '  (VR.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND '
      '  (VR.IDEMPRESA(+) = CC.IDEMPRESA) AND'
      '  (CC.ATIVO = '#39'S'#39') '
      'GROUP BY'
      '  CC.CODEXTERNO,CC.NOME'
      'ORDER BY'
      '  CENTCUST')
    ClientDataSet = CdsAux
    Left = 409
    Top = 272
  end
  object dsAux: TDataSource
    DataSet = CdsAux
    Left = 489
    Top = 268
  end
  object CdsCC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 484
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 484
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 693
    Top = 484
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 249
    Top = 300
  end
  object cdsTotaliza: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 648
    Top = 528
    object cdsTotalizaEXERCICIOINICIO: TIntegerField
      FieldName = 'EXERCICIOINICIO'
    end
    object cdsTotalizaEXERCICIOFIM: TIntegerField
      FieldName = 'EXERCICIOFIM'
    end
    object cdsTotalizaPERIODOINICIO: TIntegerField
      FieldName = 'PERIODOINICIO'
    end
    object cdsTotalizaVALOR: TCurrencyField
      FieldName = 'VALOR'
    end
    object cdsTotalizaPERIODOFIM: TIntegerField
      FieldName = 'PERIODOFIM'
    end
    object cdsTotalizaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dsTotaliza: TDataSource
    DataSet = cdsTotaliza
    Left = 705
    Top = 260
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 597
    Top = 276
  end
  object cdsTipoDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 589
    Top = 340
  end
  object cdsAtividadeProjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 741
    Top = 356
  end
  object MontaSelect_Bkp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CRITERIORATORC.DESCRICAO'
      'VALORCRIRATORC.EXERCICIO'
      'VALORCRIRATORC.PERIODO'
      'VALORCRIRATORC.PERIODOFIM'
      'VALORCRIRATORC.VLRCRIRATORC'
      'VALORCRIRATORC.EXERCICIOFIM'
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME'
      'PLANPREVCONTABIL.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'N'
      'N'
      'N'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Critério'
      'Exercício Inicial'
      'Período Inicial'
      'Período Final'
      'Valor Base'
      'Exercício Final'
      'Cód.C.Custo'
      'Nome C.Custo'
      'Plano'
      'Patro')
    SensivelACaixa.Strings = (
      'N'
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
      'VALORCRIRATORC'
      'CRITERIORATORC'
      'CENTCUST'
      'PLANPREVCONTABIL'
      'PESSOA')
    CamposChave.Strings = (
      'VALORCRIRATORC.EXERCICIO'
      'VALORCRIRATORC.PERIODO'
      'VALORCRIRATORC.IDCRITERIORATORC'
      'VALORCRIRATORC.PERIODOFIM'
      'VALORCRIRATORC.IDVALORCRIRATORC'
      'VALORCRIRATORC.EXERCICIOFIM')
    Filtro.Strings = (
      
        'VALORCRIRATORC.IDCRITERIORATORC = CRITERIORATORC.IDCRITERIORATOR' +
        'C '
      'VALORCRIRATORC.IDEMPRESA = CENTCUST.IDEMPRESA(+)'
      'VALORCRIRATORC.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO(+)'
      'VALORCRIRATORC.IDPLANOPREV = PLANPREVCONTABIL.IDPLANOPREV(+)'
      'VALORCRIRATORC.IDPATRO = PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '#,##0.00'
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '9'
      '40'
      '4'
      '4'
      '2'
      '2'
      '40'
      '10'
      '18'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 368
    Top = 223
  end
end
