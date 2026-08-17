inherited frmRParamRelatGrupoMT: TfrmRParamRelatGrupoMT
  Left = 284
  Top = 58
  BorderStyle = bsDialog
  Caption = 'Planejamento e Orçamento - Relatórios'
  ClientHeight = 551
  ClientWidth = 880
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 257
    Width = 880
    Height = 2
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  inherited pnlFundo: TPanel
    Width = 880
    Height = 257
    Align = alTop
    object Panel19: TPanel
      Left = 1
      Top = 1
      Width = 878
      Height = 264
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object Label3: TLabel
        Left = 376
        Top = 4
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
      object Label1: TLabel
        Left = 486
        Top = 3
        Width = 84
        Height = 13
        Caption = 'Período Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 601
        Top = 3
        Width = 77
        Height = 13
        Caption = 'Período Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 707
        Top = 3
        Width = 166
        Height = 13
        Caption = 'Período Final Projeto Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 258
        Top = 101
        Width = 44
        Height = 13
        Caption = 'Cenário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 7
        Top = 104
        Width = 39
        Height = 13
        Caption = 'Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 207
        Top = 102
        Width = 28
        Height = 13
        Caption = 'Grau'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkExercicio: TwwDBLookupCombo
        Left = 376
        Top = 20
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'EXERCICIO')
        LookupTable = cdsExercicio
        LookupField = 'EXERCICIO'
        Style = csDropDownList
        Color = clInfoBk
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkExercicioClick
        OnClick = dblkExercicioClick
        OnExit = dblkExercicioExit
      end
      object dblkPeriodoIni: TwwDBLookupCombo
        Left = 486
        Top = 19
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
        LookupTable = cdsPeriodoIni
        LookupField = 'PERIODO'
        Style = csDropDownList
        Color = clInfoBk
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object rgSinal: TRadioGroup
        Left = 8
        Top = 149
        Width = 185
        Height = 48
        Caption = 'Considerar os Valores '
        ItemIndex = 1
        Items.Strings = (
          'Considerando o Sinal'
          'Movimentação Original')
        TabOrder = 12
      end
      object rgUsuXCCCR: TRadioGroup
        Left = 197
        Top = 149
        Width = 212
        Height = 48
        Caption = 'Usuário por centro de'
        ItemIndex = 0
        Items.Strings = (
          '&Responsabilidade'
          '&Custo')
        TabOrder = 13
      end
      object rdgpNegativos: TRadioGroup
        Left = 413
        Top = 149
        Width = 196
        Height = 48
        Caption = 'Indicar negativos por'
        ItemIndex = 0
        Items.Strings = (
          'Parênteses'
          'Hífen')
        TabOrder = 14
      end
      inline molPlanoOrcamentario: TmolPlanoOrcamentario
        Top = 4
        Width = 376
        inherited Label2: TLabel
          Top = 2
        end
        inherited cboPlanoOrcamen: TwwDBLookupCombo
          Width = 361
          Color = clInfoBk
          OnClick = molPlanoOrcamentariocboPlanoOrcamenClick
        end
        inherited sqlPlanoOrcamen: TCMSqlParams
          Left = 192
        end
        inherited CdsPlanoOrcamen: TCMClientDataSet
          Left = 136
        end
        inherited cdsParametro: TCMClientDataSet
          Left = 336
        end
        inherited sqlParametro: TCMSqlParams
          Left = 288
        end
      end
      object dblkPeriodoFim: TwwDBLookupCombo
        Left = 601
        Top = 19
        Width = 102
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
        LookupTable = cdsPeriodoFim
        LookupField = 'PERIODO'
        Style = csDropDownList
        Color = clInfoBk
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkPeriodoProjOrcado: TwwDBLookupCombo
        Left = 707
        Top = 19
        Width = 168
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
        LookupTable = cdsPeriodoFim
        LookupField = 'PERIODO'
        Style = csDropDownList
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblcCenario: TwwDBLookupCombo
        Left = 258
        Top = 120
        Width = 151
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
        LookupTable = cdsPeriodoIni
        LookupField = 'PERIODO'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        ParentFont = False
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblcMoeda: TwwDBLookupCombo
        Left = 7
        Top = 121
        Width = 195
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPERIODO'#9'60'#9'NOMEPERIODO')
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        ParentFont = False
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object spnGrau: TSpinEdit
        Left = 206
        Top = 121
        Width = 43
        Height = 22
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 9
        Value = 0
      end
      object pnlExcel: TPanel
        Left = 415
        Top = 102
        Width = 330
        Height = 41
        BevelInner = bvLowered
        TabOrder = 11
        object lblExcel: TLabel
          Left = 174
          Top = 15
          Width = 61
          Height = 13
          Caption = 'Salvar em:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object chkExcel: TCheckBox
          Left = 10
          Top = 14
          Width = 135
          Height = 17
          Caption = 'Exporta para Excel'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 0
          OnClick = chkExcelClick
        end
        object edtExcel: TEdit
          Left = 239
          Top = 9
          Width = 242
          Height = 21
          ReadOnly = True
          TabOrder = 2
          Visible = False
        end
        object btnSelecionaExcel: TBitBtn
          Left = 496
          Top = 8
          Width = 25
          Height = 25
          Cancel = True
          TabOrder = 3
          Visible = False
          OnClick = btnSelecionaExcelClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
            333333333333337FF3333333333333903333333333333377FF33333333333399
            03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
            99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
            99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
            03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
            33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
            33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
            3333777777333333333333333333333333333333333333333333}
          NumGlyphs = 2
        end
        object chkValoresZerados: TCheckBox
          Left = 153
          Top = 14
          Width = 161
          Height = 17
          Caption = 'Imprime Valores Zerados'
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 615
        Top = 149
        Width = 194
        Height = 48
        Caption = 'Imprimir Valores'
        TabOrder = 15
        object CheckBox3: TCheckBox
          Left = 13
          Top = 25
          Width = 80
          Height = 17
          Caption = 'Cenário'
          TabOrder = 0
        end
      end
      object GroupBox5: TGroupBox
        Left = 551
        Top = 49
        Width = 257
        Height = 48
        Caption = 'Posição do Código do Grupo'
        TabOrder = 7
        object Label5: TLabel
          Left = 8
          Top = 20
          Width = 39
          Height = 13
          Caption = 'Inicial:'
        end
        object Label7: TLabel
          Left = 128
          Top = 20
          Width = 46
          Height = 13
          Caption = 'Dígitos:'
        end
        object sePosIni1: TwwDBSpinEdit
          Left = 53
          Top = 19
          Width = 70
          Height = 21
          Increment = 1
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object sePosFim1: TwwDBSpinEdit
          Left = 180
          Top = 19
          Width = 70
          Height = 21
          Increment = 1
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
      object rgImpValores: TRadioGroup
        Left = 311
        Top = 201
        Width = 298
        Height = 50
        Caption = ' Imprimir Valores '
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          '&Orçados'
          '&Realizados'
          '&Cenários')
        TabOrder = 16
        Visible = False
        OnClick = rgImpValoresClick
      end
      object cboCODCENTRORESPON: TwwDBLookupCombo
        Left = 7
        Top = 69
        Width = 226
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODGRUPOORC'#9'10'#9'Código'
          'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
        DataField = 'CODCENTRORESPON'
        LookupTable = cdsGrupoIni
        LookupField = 'CODGRUPOORC'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 17
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboCODCENTRORESPON1: TwwDBLookupCombo
        Left = 288
        Top = 69
        Width = 226
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODGRUPOORC'#9'10'#9'Código'
          'NOMEGRUPOORCAMEN'#9'60'#9'Nome')
        DataField = 'CODCENTRORESPON'
        LookupTable = cdsGrupoFim
        LookupField = 'CODGRUPOORC'
        Options = [loColLines]
        DropDownCount = 5
        TabOrder = 18
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cboGrupoInicial: TCMProcuraMask
        Left = 5
        Top = 51
        Width = 257
        Height = 47
        Caption = ' Grupo Inicial'
        TabOrder = 5
        MostraMensagens = True
        MostraDescricao = True
        DataField = 'CODGRUPOORC'
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        Mensagens.Sintetica = 'Grupo não pode ser sintético'
        Mensagens.Analitica = 'Grupo não pode ser analítico'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        MontaSelect = MontaSelectGrupoIni
        LookupParam = 'CODGRUPOORC'
        LookupChave = 'CODGRUPOORC'
        LookupTipo = 'FLGANALSINT'
        LookupDescricao = 'NOMEGRUPOORCAMEN'
      end
      object cboGrupoFinal: TCMProcuraMask
        Left = 277
        Top = 51
        Width = 257
        Height = 47
        Caption = ' Grupo Final'
        TabOrder = 6
        MostraMensagens = True
        MostraDescricao = True
        DataField = 'CODGRUPOORC'
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        Mensagens.Sintetica = 'Grupo não pode ser sintético'
        Mensagens.Analitica = 'Grupo não pode ser analítico'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        MontaSelect = MontaSelectGrupoFim
        LookupSQLParams = sqlGrupoFim
        LookupParam = 'CODGRUPOORC'
        LookupChave = 'CODGRUPOORC'
        LookupTipo = 'FLGANALSINT'
        LookupDescricao = 'NOMEGRUPOORCAMEN'
      end
      object grbVlrSem: TGroupBox
        Left = 9
        Top = 201
        Width = 296
        Height = 50
        Caption = 'Imprimir Valores Sem'
        TabOrder = 19
        object chkSuplementacao: TCheckBox
          Left = 8
          Top = 24
          Width = 121
          Height = 17
          Caption = 'Suplementações'
          TabOrder = 0
          OnKeyUp = chkSuplementacaoKeyUp
          OnMouseUp = chkSuplementacaoMouseUp
        end
        object chkDeducao: TCheckBox
          Left = 130
          Top = 23
          Width = 81
          Height = 17
          Caption = 'Deduções'
          TabOrder = 1
          OnKeyUp = chkDeducaoKeyUp
          OnMouseUp = chkDeducaoMouseUp
        end
        object chkTodos: TCheckBox
          Left = 217
          Top = 23
          Width = 65
          Height = 17
          Caption = 'Todos'
          TabOrder = 2
          OnKeyUp = chkTodosKeyUp
          OnMouseUp = chkTodosMouseUp
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 512
    Width = 880
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object pgcCompo: TPageControl [3]
    Left = 0
    Top = 259
    Width = 880
    Height = 253
    ActivePage = tbsPrograma
    Align = alClient
    TabOrder = 2
    object tsCentroResponsabilidade: TTabSheet
      Caption = 'Centro de Responsabilidade'
      ImageIndex = 6
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblCResponsabilidadeDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridCRespDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Hint = 'Centro de Responsabilidade com asterisco(*) são sintéticos.'
          Selected.Strings = (
            'NOME'#9'25'#9'Centro de Custo'
            'CODCENTRORESPON'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCRespDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object pnl2: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblCResponsabilidadeSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridCRespSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Hint = 'Centro de Responsabilidade com asterisco(*) são sintéticos.'
          Selected.Strings = (
            'NOME'#9'25'#9'Centro de Custo'
            'CODCENTRORESPON'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCRespSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object tlb1: TToolBar
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        ButtonHeight = 24
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = imgBotoes
        Indent = 2
        TabOrder = 2
        object btn1: TToolButton
          Left = 2
          Top = 2
          Caption = 'btnCCDisponiveis'
          ImageIndex = 0
          Wrap = True
          OnClick = btnCCDisponiveisClick
        end
        object btn2: TToolButton
          Left = 2
          Top = 26
          Caption = 'btnCCSelecionados'
          ImageIndex = 1
          Wrap = True
          OnClick = btnCCSelecionadosClick
        end
        object btn3: TToolButton
          Left = 2
          Top = 50
          Caption = 'btnCCDisponiveisTodos'
          ImageIndex = 2
          Wrap = True
          OnClick = btnCCDisponiveisTodosClick
        end
        object btn4: TToolButton
          Left = 2
          Top = 74
          Caption = 'btnCCSelecionadosTodos'
          ImageIndex = 3
          Wrap = True
          OnClick = btnCCSelecionadosTodosClick
        end
        object btn5: TToolButton
          Left = 2
          Top = 98
          Caption = 'BtnCCRefresh'
          ImageIndex = 4
          OnClick = BtnCCRefreshClick
        end
      end
    end
    object tbsCentroCusto: TTabSheet
      Tag = 1
      Caption = 'Centro de Custo'
      ImageIndex = 1
      object lblRotuloCentroCusto: TLabel
        Left = 16
        Top = 212
        Width = 163
        Height = 13
        Caption = '(*) Centro de Custo Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 0
        object lblCCustoSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridCCustoSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Hint = 'Centro de Custas com asterisco(*) são sintéticos.'
          Selected.Strings = (
            'NOME'#9'25'#9'Centro de Custo'
            'CODCENTROCUSTO'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCCustoSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 1
        object lblCCustoDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridCCustoDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Hint = 'Centro de Custas com asterisco(*) são sintéticos.'
          Selected.Strings = (
            'NOME'#9'25'#9'Centro de Custo'
            'CODCENTROCUSTO'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCCustoDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel3: TPanel
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 31
          Height = 208
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object btnCCDisponiveis: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object btnCCSelecionados: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object btnCCDisponiveisTodos: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object btnCCSelecionadosTodos: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object BtnCCRefresh: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
    object tbsAtividade: TTabSheet
      Tag = 2
      Caption = 'Atividade/Projeto'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblAtivProjDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridAtivProjDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'ATIVIDADEPROJETO'#9'25'#9'Atividade de Projeto'
            'UNIDNEGOC'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAtivProjDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel9: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblAtivProjSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridAtivProjSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'ATIVIDADEPROJETO'#9'25'#9'Atividade de Projeto'
            'UNIDNEGOC'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAtivProjSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel14: TPanel
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 31
          Height = 208
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object ToolButton1: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object ToolButton2: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object ToolButton3: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object ToolButton4: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object ToolButton5: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
    object tbsPlanoPrev: TTabSheet
      Tag = 3
      Caption = 'Plano Previdenciário'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblPlanoDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridPlanoDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'NOME'#9'25'#9'Plano'
            'IDPLANOPREV'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPlanoDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel10: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblPlanoSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridPlanoSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'NOME'#9'25'#9'Plano'
            'IDPLANOPREV'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPlanoSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel15: TPanel
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 31
          Height = 208
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object ToolButton6: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object ToolButton7: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object ToolButton8: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object ToolButton9: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object ToolButton10: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
    object tbsPatro: TTabSheet
      Tag = 4
      Caption = 'Patrocinadora'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblPatroDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridPatroDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'NOME'#9'25'#9'Plano'
            'IDPESSOA'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPatroDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel11: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblPatroSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridPatroSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'NOME'#9'25'#9'Plano'
            'IDPESSOA'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsPatroSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel16: TPanel
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 31
          Height = 208
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object ToolButton11: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object ToolButton12: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object ToolButton13: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object ToolButton14: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object ToolButton15: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
    object tbsPrograma: TTabSheet
      Caption = 'Programa'
      ImageIndex = 4
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 225
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblProgramaDisp: TLabel
          Left = 2
          Top = 2
          Width = 416
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridProgramaDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 205
          Selected.Strings = (
            'PROGRAMA'#9'25'#9'Programa'
            'IDPROGRAMAORCAMEN'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsProgramaDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel12: TPanel
        Left = 452
        Top = 0
        Width = 420
        Height = 225
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblProgramaSel: TLabel
          Left = 2
          Top = 2
          Width = 416
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridProgramaSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 205
          Selected.Strings = (
            'PROGRAMA'#9'25'#9'Plano'
            'IDPROGRAMAORCAMEN'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsProgramaSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel17: TPanel
        Left = 420
        Top = 0
        Width = 32
        Height = 225
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar5: TToolBar
          Left = 0
          Top = 0
          Width = 32
          Height = 225
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object ToolButton16: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object ToolButton17: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object ToolButton18: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object ToolButton19: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object ToolButton20: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
    object tbsTipoDespesa: TTabSheet
      Caption = 'Tipo de Despesa'
      ImageIndex = 5
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 208
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object lblTipoDespesaDisp: TLabel
          Left = 2
          Top = 2
          Width = 85
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Disponível (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridTipoDespesaDisp: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'TIPODESPESA'#9'25'#9'Tipo de Despesa'
            'IDTIPO_DEPESAORCAMEN'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsTipoDespesaDisp
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel13: TPanel
        Left = 451
        Top = 0
        Width = 420
        Height = 208
        Align = alRight
        BevelInner = bvLowered
        TabOrder = 1
        object lblTipoDespesaSel: TLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecionado (2)'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object GridTipoDespesaSel: TwwDBGrid
          Left = 2
          Top = 18
          Width = 416
          Height = 188
          Selected.Strings = (
            'TIPODESPESA'#9'25'#9'Tipo de Despesa'
            'IDTIPO_DEPESAORCAMEN'#9'10'#9'Código')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsTipoDespesaSel
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          OnTitleButtonClick = GridCCustoDispTitleButtonClick
          IndicatorColor = icBlack
        end
      end
      object Panel18: TPanel
        Left = 420
        Top = 0
        Width = 31
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object ToolBar6: TToolBar
          Left = 0
          Top = 0
          Width = 31
          Height = 208
          Align = alClient
          ButtonHeight = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = imgBotoes
          Indent = 2
          TabOrder = 0
          object ToolButton21: TToolButton
            Left = 2
            Top = 2
            Caption = 'btnCCDisponiveis'
            ImageIndex = 0
            Wrap = True
            OnClick = btnCCDisponiveisClick
          end
          object ToolButton22: TToolButton
            Left = 2
            Top = 26
            Caption = 'btnCCSelecionados'
            ImageIndex = 1
            Wrap = True
            OnClick = btnCCSelecionadosClick
          end
          object ToolButton23: TToolButton
            Left = 2
            Top = 50
            Caption = 'btnCCDisponiveisTodos'
            ImageIndex = 2
            Wrap = True
            OnClick = btnCCDisponiveisTodosClick
          end
          object ToolButton24: TToolButton
            Left = 2
            Top = 74
            Caption = 'btnCCSelecionadosTodos'
            ImageIndex = 3
            Wrap = True
            OnClick = btnCCSelecionadosTodosClick
          end
          object ToolButton25: TToolButton
            Left = 2
            Top = 98
            Caption = 'BtnCCRefresh'
            ImageIndex = 4
            OnClick = BtnCCRefreshClick
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 832
    Top = 40
  end
  inherited Cmp_Padrao: TCmParamReport
    Caption = 'Orçado x Realizado por Grupo'
    Params = <
      item
        Caption = 'Plano Orcamentario'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PlanoOrcamentario'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Exercicio'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Exercicio'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Periodo Inicial'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PeriodoInicial'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Periodo Final'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PeriodoFinal'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Periodo Orcado'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PeriodoOrcado'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Grupo Inicial'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'GrupoInicial'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Grupo Final'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'GrupoFinal'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Posicao Inicial Grupo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PosInicialGrupo'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Posicao Final Grupo'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PosFimGrupo'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Centro de Responsabilidade'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CentroResponbilidade'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Moeda'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Moeda'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Grau'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Grau'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Cenario'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Cenario'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Considerar Valores'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ConsiderarValores'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Indicar valores negativos por'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Indicarvaloresnegativos'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Usuario por centro de'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'UsuarioCentroDe'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Imprimir valores Zerados'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ImprimirValoresZerados'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Centro de Custa'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CentroCusta'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Atividade / projeto'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Atividadeprojeto'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Plano Previdenciario'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Plano'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Patrocinadora'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Patro'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Programa'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Programa'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo Despesa'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoDespesa'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Caminho Excel'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CaminhoExcel'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo de Valores'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoValores'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Imprimir Valores Sem'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'VlrSem'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Nome do Filtro Valores Sem'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 704
    Top = 64
  end
  object cdsCCustoDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 313
  end
  object cdsAtivProjDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 321
  end
  object cdsPlanoDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 337
  end
  object cdsPatroDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 353
  end
  object cdsProgramaDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 369
  end
  object cdsTipoDespesaDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 385
  end
  object cdsTipoDespesaSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 209
    Top = 417
  end
  object cdsProgramaSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 209
    Top = 401
  end
  object cdsPatroSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 201
    Top = 377
  end
  object cdsPlanoSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 201
    Top = 353
  end
  object cdsAtivProjSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 201
    Top = 329
  end
  object cdsCCustoSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 201
    Top = 305
  end
  object dsTipoDespesaSel: TDataSource
    DataSet = cdsTipoDespesaSel
    Left = 304
    Top = 392
  end
  object dsProgramaSel: TDataSource
    DataSet = cdsProgramaSel
    Left = 301
    Top = 382
  end
  object dsPatroSel: TDataSource
    DataSet = cdsPatroSel
    Left = 304
    Top = 360
  end
  object dsPlanoSel: TDataSource
    DataSet = cdsPlanoSel
    Left = 304
    Top = 344
  end
  object dsAtivProjSel: TDataSource
    DataSet = cdsAtivProjSel
    Left = 304
    Top = 328
  end
  object dsCCustoSel: TDataSource
    DataSet = cdsCCustoSel
    Left = 301
    Top = 310
  end
  object dsCCustoDisp: TDataSource
    DataSet = cdsCCustoDisp
    Left = 381
    Top = 415
  end
  object dsAtivProjDisp: TDataSource
    DataSet = cdsAtivProjDisp
    Left = 381
    Top = 431
  end
  object dsPlanoDisp: TDataSource
    DataSet = cdsPlanoDisp
    Left = 384
    Top = 441
  end
  object dsPatroDisp: TDataSource
    DataSet = cdsPatroDisp
    Left = 381
    Top = 455
  end
  object dsProgramaDisp: TDataSource
    DataSet = cdsProgramaDisp
    Left = 381
    Top = 471
  end
  object dsTipoDespesaDisp: TDataSource
    DataSet = cdsTipoDespesaDisp
    Left = 384
    Top = 489
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      
        '  select TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN' +
        ' AS TIPODESPESA'
      
        '  from TIPO_DESPESAORCAMEN TD order by TD.DESCRICAO_TIPO_DEPESAO' +
        'CAMEN')
    ClientDataSet = cdsAux
    Left = 474
    Top = 435
  end
  object sqlPeriodoOrcado: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    ClientDataSet = cdsPeriodoOrcado
    Left = 472
    Top = 420
  end
  object sqlPeriodoFim: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    ClientDataSet = cdsPeriodoFim
    Left = 472
    Top = 405
  end
  object sqlGrupoFim: TCMSqlParams
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      'ORDER BY CODGRUPOORC'
      ' ')
    ClientDataSet = cdsGrupoFim
    Left = 473
    Top = 395
  end
  object sqlGrupoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT CODGRUPOORC, NOMEGRUPOORCAMEN'
      'FROM GRUPOORCAMEN'
      'WHERE (IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      'ORDER BY CODGRUPOORC')
    ClientDataSet = cdsGrupoIni
    Left = 472
    Top = 382
  end
  object sqlPeriodoIni: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '   PERIODO, NOMEPERIODO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   (IDPESSOA =:IDPESSOA) AND '
      '   (EXERCICIO=:EXERCICIO)'
      'ORDER BY '
      '   PERIODO')
    ClientDataSet = cdsPeriodoIni
    Left = 472
    Top = 352
  end
  object sqlExercicio: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT '
      '   EXERCICIO '
      'FROM '
      '   PERIODOORCAMEN '
      'WHERE'
      '   IDPESSOA =:IDPESSOA'
      'ORDER BY '
      '   EXERCICIO')
    ClientDataSet = cdsExercicio
    Left = 464
    Top = 304
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 608
    Top = 316
  end
  object cdsPeriodoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 608
    Top = 328
  end
  object cdsGrupoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 608
    Top = 348
  end
  object cdsGrupoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 608
    Top = 360
  end
  object cdsPeriodoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 609
    Top = 371
  end
  object cdsPeriodoOrcado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 609
    Top = 387
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 609
    Top = 402
  end
  object imgBotoes: TImageList
    AllocBy = 8
    Left = 738
    Top = 357
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000031636300000000000000000000000000000000003163
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300844200008442000084420000844200006B3100006B31
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FF840000FF840000FF840000FF84000000000000844200008442
      00006B3100003163630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF840000FF8400000000000084420000844200008442
      0000844200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000031630000316300003163000031630000000000844200006B3100008442
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084420000844200006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300000000000000000000000000844200006B3100006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FF840000844200000000000000000000844200006B3100006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF8400008442000000000000844200006B3100006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000316300FF84
      0000FF840000FF840000FF840000FF84000084420000000000006B3100006B31
      0000844200006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000316300FFFF0000FFFF
      0000FF840000FF840000FF840000FF840000FFFF0000FFFF0000000000006B31
      00006B3100008442000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000316300003163000031
      6300FF840000FF840000FF840000FF8400000000000000000000000000006B31
      00006B3100006B31000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000031
      6300FF840000FF840000FF840000FF84000000000000630000006B3100006300
      00006B3100000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000316300FFFF0000FF840000FF840000FF84000000000000630000006B31
      00006B3100003163630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000316300FFFF0000FFFF0000FFFF0000FFFF0000000000006B31
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000316300003163000031630000316300003163003163
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      000084840000848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000FFFFFF008484
      00008484000000000000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF008484000084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000848400008484000084840000FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008484000084840000000000000000000084848400FFFF000084840000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      00008484000084840000FFFFFF00FFFFFF008484000084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000848400008484000084840000FFFFFF00FFFFFF0084840000848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF00848400008484
      00008484000084840000000000000000000084848400FFFF0000848400008484
      000084840000FFFFFF00FFFFFF008484000084840000FFFFFF00FFFFFF008484
      0000848400008484000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      000084840000848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00848400008484000084840000FFFFFF0084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      00008484000084840000FFFFFF00848400008484000084840000FFFFFF008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      000084840000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      000000000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC0F000000000000F807000000000000
      F003000000000000E003000000000000F081000000000000FF81000000000000
      F981000000000000F081000000000000E001000000000000C001000000000000
      80010000000000008001000000000000E003000000000000F003000000000000
      F807000000000000FC0F000000000000FFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00780038003800380038003800380038003
      0001000100010001000100010001000100010001000100010001000100010001
      000100010001000180038003800380038003800380038003C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object dlgOpenXls: TOpenDialog
    Filter = 'Arquivo Excel (*.xls)|*.xls'
    Left = 737
    Top = 344
  end
  object cdsCRespDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 401
  end
  object dsCRespDisp: TDataSource
    DataSet = cdsCRespDisp
    Left = 392
    Top = 473
  end
  object cdsCRespSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 209
    Top = 449
  end
  object dsCRespSel: TDataSource
    DataSet = cdsCRespSel
    Left = 301
    Top = 454
  end
  object MontaSelectGrupoIni: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO')
    Filtro.Strings = (
      'GRUPOORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 688
    Top = 268
  end
  object MontaSelectGrupoFim: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN'
      'PLANOORCAMENTARIO')
    CamposChave.Strings = (
      'GRUPOORCAMEN.CODGRUPOORC'
      'GRUPOORCAMEN.FLGSINALGRUPO')
    Filtro.Strings = (
      'GRUPOORCAMEN.IDPLANOORCAMEN = PLANOORCAMENTARIO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    OperComparador.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 680
    Top = 332
  end
end
