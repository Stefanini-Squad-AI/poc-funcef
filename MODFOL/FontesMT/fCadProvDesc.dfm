inherited frmCadProvDesc: TfrmCadProvDesc
  Left = 116
  Top = 37
  Width = 1128
  Height = 660
  HelpContext = 210022
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Rubricas Salariais (Proventos e Descontos)'
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1112
    Height = 535
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 1108
      Height = 255
      object Label2: TLabel
        Left = 9
        Top = 39
        Width = 124
        Height = 13
        Caption = 'Descrição da Rubrica'
      end
      object Label4: TLabel
        Left = 9
        Top = 128
        Width = 209
        Height = 13
        Caption = 'Rubrica Padrão CLT Correspondente'
      end
      object lblRegraNormal: TLabel
        Left = 343
        Top = 3
        Width = 99
        Height = 13
        Caption = 'Regra de Cálculo'
      end
      object Label6: TLabel
        Left = 343
        Top = 39
        Width = 138
        Height = 13
        Caption = 'Informe de Rendimentos'
      end
      object Label8: TLabel
        Left = 343
        Top = 75
        Width = 129
        Height = 13
        Caption = 'Natureza da Operação'
      end
      object Label9: TLabel
        Left = 10
        Top = 3
        Width = 84
        Height = 13
        Caption = 'Código Interno'
      end
      object Label11: TLabel
        Left = 146
        Top = 3
        Width = 66
        Height = 13
        Caption = 'Seu Código'
      end
      object Label12: TLabel
        Left = 10
        Top = 165
        Width = 86
        Height = 13
        Caption = 'Código eSocial'
      end
      object Label13: TLabel
        Left = 122
        Top = 165
        Width = 118
        Height = 13
        Caption = 'Natureza da Rubrica'
      end
      object dbedDescr: TwwDBEdit
        Left = 9
        Top = 53
        Width = 319
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object gbxOpcoes: TGroupBox
        Left = 617
        Top = 6
        Width = 136
        Height = 103
        Caption = 'Opções'
        TabOrder = 13
        TabStop = True
        object dbchkObrigaFavorecido: TDBCheckBox
          Left = 6
          Top = 41
          Width = 122
          Height = 14
          Hint = 'Exige a Indicação de um Favorecido ?'
          Caption = 'Exige Favorecido '
          DataField = 'FLGOBRIGAFAVOREC'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkConstaFolha: TDBCheckBox
          Left = 6
          Top = 19
          Width = 118
          Height = 17
          Hint = 'Consta na Folha de Pagamento ?'
          Caption = 'Consta na Folha'
          DataField = 'FLGCONSTAFOLHA'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkEspecialFP: TDBCheckBox
          Left = 6
          Top = 60
          Width = 97
          Height = 17
          Hint = 'Especial Não Recbe Lançamentos Manuais'
          Caption = 'Especial'
          DataField = 'FLGESPECIALFP'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkDebConta: TDBCheckBox
          Left = 6
          Top = 80
          Width = 123
          Height = 17
          Caption = 'Débito em Conta'
          DataField = 'FLGDEBCONTA'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbxTipoRub: TDBRadioGroup
        Left = 9
        Top = 78
        Width = 319
        Height = 49
        Caption = 'Tipo de Rubrica'
        Columns = 2
        DataField = 'FLGDESCONTO'
        DataSource = ds
        Items.Strings = (
          'Provento'
          'Desconto'
          'Outro'
          'Outros - Dedutora')
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object gbxSeqCalc: TGroupBox
        Left = 343
        Top = 111
        Width = 143
        Height = 43
        Caption = 'Sequência de Cálculo'
        TabOrder = 10
        TabStop = True
        object dbedSeqCalc: TwwDBSpinEdit
          Left = 31
          Top = 15
          Width = 81
          Height = 21
          Increment = 1
          DataField = 'NUMPRIORIDADE'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object dblcRegraNormal: TwwDBLookupCombo
        Left = 343
        Top = 17
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = CdsRegra
        LookupField = 'IDREGRA'
        Style = csDropDownList
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblcInforme: TwwDBLookupCombo
        Left = 343
        Top = 53
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'NOMEINFORME')
        DataField = 'IDINFORME'
        DataSource = ds
        LookupTable = CdsInforme
        LookupField = 'IDINFORME'
        Style = csDropDownList
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblkcmbRubCLT: TwwDBLookupCombo
        Left = 9
        Top = 142
        Width = 319
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'CODRUBCLT'
        DataSource = ds
        LookupTable = CdsRubCLT
        LookupField = 'CODRUBCLT'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblcNaturOper: TwwDBLookupCombo
        Left = 343
        Top = 89
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'CODIRRFDARF'
        DataSource = ds
        LookupTable = CdsNaturOper
        LookupField = 'CODNATUREZA'
        Style = csDropDownList
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object edCodInterno: TEdit
        Left = 10
        Top = 17
        Width = 127
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object edSeuCod: TEdit
        Left = 146
        Top = 17
        Width = 182
        Height = 21
        TabStop = False
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object gbxFontePagadora: TGroupBox
        Left = 615
        Top = 111
        Width = 136
        Height = 43
        Caption = 'Fonte Pagadora'
        TabOrder = 14
        TabStop = True
        object dbcmbFontePagadora: TwwDBComboBox
          Left = 9
          Top = 15
          Width = 119
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          DataField = 'CODFONTEPAGADORA'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 13
          Items.Strings = (
            'Fundação'#9'0'
            'INSS'#9'2'
            'Patrocinadora'#9'1')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object gbxPrioridadeDesc: TGroupBox
        Left = 489
        Top = 111
        Width = 115
        Height = 43
        Caption = 'Prioridade Desc.'
        TabOrder = 11
        TabStop = True
        object dbEdPrioridadeDesc: TwwDBSpinEdit
          Left = 15
          Top = 15
          Width = 81
          Height = 21
          Increment = 1
          DataField = 'NumPrioriDesc'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object pnlIdProventoExcessoDeb: TPanel
        Left = 252
        Top = 206
        Width = 657
        Height = 31
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        TabStop = True
        object lblIdProventoExcessoDeb: TLabel
          Left = 146
          Top = 9
          Width = 159
          Height = 13
          Caption = 'Rubrica Excesso de Débito:'
        end
        object btnSelecionaProventoED: TBitBtn
          Left = 596
          Top = 4
          Width = 25
          Height = 22
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSelecionaProventoEDClick
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
        object btnLimpaProventoED: TBitBtn
          Left = 622
          Top = 4
          Width = 25
          Height = 22
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnLimpaProventoEDClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
        end
        object pnlEdRubExcessoDeb: TPanel
          Left = 307
          Top = 3
          Width = 283
          Height = 25
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 3
          object dblkcmbIdProventoExcessoDeb: TwwDBLookupCombo
            Left = 0
            Top = 1
            Width = 282
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'DESCRICAO')
            DataField = 'IDPROVENTOEXCESSODEB'
            DataSource = ds
            LookupTable = CdsRubExcessoDeb
            LookupField = 'IDPROVENTO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = False
            UseTFields = False
            AllowClearKey = True
          end
        end
        object dbchkExcessoDeb: TDBCheckBox
          Left = 12
          Top = 8
          Width = 129
          Height = 17
          Caption = 'Excesso de Débito'
          DataField = 'FLGEXCESSODEB'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkExcessoDebClick
        end
      end
      object dbrgContribuicao: TDBRadioGroup
        Left = 757
        Top = 6
        Width = 153
        Height = 103
        Caption = 'Contribuição FUNCEF '
        DataField = 'FLGCONTRIBUICAO'
        DataSource = ds
        Items.Strings = (
          'Salário Particip.'
          'Valor de Contrib.'
          'Perc de Contrib.'
          'Nenhum')
        TabOrder = 15
        TabStop = True
        Values.Strings = (
          'S'
          'C'
          'P')
      end
      object DBRadioGroup4: TDBRadioGroup
        Left = 757
        Top = 111
        Width = 153
        Height = 90
        Caption = ' Rubrica Assistencial '
        DataField = 'FLGASSISTENCIAL'
        DataSource = ds
        Items.Strings = (
          'Nenhum'
          'Plano de Saúde'
          'Plano Odontológico'
          'Pensão Alimentícia')
        TabOrder = 16
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object dbchkEmprestimoFinan: TDBCheckBox
        Left = 8
        Top = 213
        Width = 243
        Height = 17
        Caption = 'Rubrica de Empréstimo/Financiamento'
        DataField = 'FLGEMPRESTIMOFINAN'
        DataSource = ds
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbchkEmprestimoFinanClick
      end
      object dblkCodesocial: TwwDBEdit
        Left = 10
        Top = 179
        Width = 103
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'CODNATESOCIAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtNaturezaRubrica: TwwDBEdit
        Left = 122
        Top = 179
        Width = 309
        Height = 21
        TabStop = False
        DataField = 'NOME_NAT'
        DataSource = ds
        ReadOnly = True
        TabOrder = 21
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object BitBtn1: TBitBtn
        Left = 434
        Top = 178
        Width = 25
        Height = 22
        Hint = 'Tabela 03 do eSocial'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = BitBtn1Click
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
      object dbrgrpQtdRefApur: TDBRadioGroup
        Left = 488
        Top = 158
        Width = 263
        Height = 43
        Caption = 'Quantidade de referência para apuração'
        Columns = 3
        DataField = 'QTDREFAPUR'
        DataSource = ds
        Items.Strings = (
          'Mensal'
          'Diária'
          'Hora')
        TabOrder = 12
        TabStop = True
        Values.Strings = (
          'M'
          'D'
          'H')
      end
      object dbchkFLGRATEARPORDEPENDENTE: TDBCheckBox
        Left = 8
        Top = 231
        Width = 243
        Height = 17
        Caption = 'Ratear por dependente (DIRF)'
        DataField = 'FLGRATEARPORDEPENDENTE'
        DataSource = ds
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbchkFLGRATEARPORDEPENDENTEClick
      end
      object btnLimpaNaturezaRubrica: TBitBtn
        Left = 460
        Top = 178
        Width = 25
        Height = 22
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = btnLimpaNaturezaRubricaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
      object gbxFlag: TGroupBox
        Left = 916
        Top = 6
        Width = 136
        Height = 103
        TabOrder = 22
        TabStop = True
        object dbckGravar: TDBCheckBox
          Left = 6
          Top = 41
          Width = 122
          Height = 14
          Hint = 'Gravar Rubrica no histórico de rubricas'
          Caption = 'Gravar '
          DataField = 'FLGGRAVARUBRICA'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbckAtivo: TDBCheckBox
          Left = 6
          Top = 20
          Width = 118
          Height = 17
          Hint = 'Rubrica Ativa/Inativa'
          Caption = 'Ativo'
          DataField = 'FLGATIVO'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 257
      Width = 1108
      Height = 276
      Tabs.Strings = (
        'Incidência em Eventos'
        'Incidência em Outras Rubricas'
        'Incidência de Outras Rubricas'
        'Incidência em Afastamentos'
        'eSocial')
      detdbGrids.Strings = (
        'dbgrdEvento'
        'dbgrdDet'
        'dbgrdIncidDeOutRub'
        'dbgrdIncidAfast'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 1010
        Height = 217
        ActivePage = tbseSocial
        TabOrder = 2
        object tbsIncidEv: TTabSheet [0]
          Caption = 'tbsIncidEv'
          object dbgrdEvento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            Selected.Strings = (
              'MOTIVO'#9'50'#9'Folha'#9'F'
              'REGRA'#9'50'#9'Regra')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRubxEvento
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlRubxEvento: TPanel
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblMotivoEvento: TLabel
              Left = 20
              Top = 15
              Width = 79
              Height = 13
              Caption = 'Tipo de Folha'
            end
            object lblRegrasEvento: TLabel
              Left = 18
              Top = 64
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object dblcRegraCalc: TwwDBLookupCombo
              Left = 18
              Top = 78
              Width = 453
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRACALC'
              DataSource = dsRubxEvento
              LookupTable = CdsRegra
              LookupField = 'IDREGRA'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblcRegraCalcCloseUp
            end
            object dblkMotivo: TwwDBLookupCombo
              Left = 18
              Top = 30
              Width = 453
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'70'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsRubxEvento
              LookupTable = cdsMotivo
              LookupField = 'IDMOTIVO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dblkMotivoCloseUp
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 1002
            Height = 189
            ControlType.Strings = (
              'FLGBASECALC;CheckBox;0;1'
              'FLGTIPOFOLHA;CheckBox;0;1'
              'FLGACAOINCIDE;CheckBox;0;1')
            Selected.Strings = (
              'DESCRICAO'#9'38'#9'Nome da Rubrica'#9'F'
              'IDRUBSECUND'#9'6'#9'Código'
              'FLGBASECALC'#9'12'#9'Valor Calculado?'
              'FLGTIPOFOLHA'#9'10'#9'Mesma Folha?'
              'INDPERIODO'#9'10'#9'Período Incid.'
              'FLGACAOINCIDE'#9'5'#9'Soma?'
              'NUMPRIORIDADE'#9'10'#9'Seq.')
            DataSource = dsRubxRubEm
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 1002
            Height = 189
            object Label5: TLabel
              Left = 2
              Top = 9
              Width = 199
              Height = 13
              Caption = 'Rubrica em que incide esta rubrica'
            end
            object Label3: TLabel
              Left = 433
              Top = 9
              Width = 219
              Height = 13
              Caption = 'Período da Incidência (Zero = Mesmo)'
            end
            object dbclkcmbRubIncid1: TwwDBLookupCombo
              Left = 2
              Top = 24
              Width = 423
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'DESCRICAO')
              DataField = 'IDRUBSECUND'
              DataSource = dsRubxRubEm
              LookupTable = CdsRubIncid
              LookupField = 'IDPROVENTO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dbclkcmbRubIncid1CloseUp
            end
            object dbrgFlg: TDBRadioGroup
              Left = 2
              Top = 62
              Width = 271
              Height = 37
              Caption = 'Incidência Composta Pelo Valor'
              Columns = 2
              DataField = 'FLGBASECALC'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Calculado'
                'Base ou Informado')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbrgFlgTipoFolha: TDBRadioGroup
              Left = 276
              Top = 62
              Width = 197
              Height = 37
              Caption = 'Incide no Mesmo Tipo de Folha'
              Columns = 2
              DataField = 'FLGTIPOFOLHA'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbspPeriodo1: TwwDBSpinEdit
              Left = 433
              Top = 24
              Width = 190
              Height = 21
              Increment = 1
              MaxValue = 99
              MinValue = -99
              Value = -99
              DataField = 'INDPERIODO'
              DataSource = dsRubxRubEm
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object dbrgTipoAcao: TDBRadioGroup
              Left = 476
              Top = 62
              Width = 176
              Height = 37
              Caption = 'Tipo de Ação'
              Columns = 2
              DataField = 'FLGACAOINCIDE'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Soma'
                'Subtração')
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
        object tbsIncidDeOutRub: TTabSheet
          Caption = 'tbsIncidDeOutRub'
          object dbgrdIncidDeOutRub: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            ControlType.Strings = (
              'FLGBASECALC;CheckBox;0;1'
              'FLGTIPOFOLHA;CheckBox;0;1'
              'FLGACAOINCIDE;CheckBox;0;1')
            Selected.Strings = (
              'DESCRICAO'#9'38'#9'Nome da Rubrica'#9'F'
              'IDRUBPRINC'#9'6'#9'Código'
              'FLGBASECALC'#9'12'#9'Valor Calculado?'
              'FLGTIPOFOLHA'#9'10'#9'Mesma Folha?'
              'INDPERIODO'#9'10'#9'Período Incid.'
              'FLGACAOINCIDE'#9'5'#9'Soma?'
              'NUMPRIORIDADE'#9'10'#9'Seq.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRubxRubDe
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 2
              Top = 9
              Width = 186
              Height = 13
              Caption = 'Rubrica que incide nesta rubrica'
            end
            object Label7: TLabel
              Left = 433
              Top = 9
              Width = 219
              Height = 13
              Caption = 'Período da Incidência (Zero = Mesmo)'
            end
            object dbclkcmbRubIncid2: TwwDBLookupCombo
              Left = 2
              Top = 24
              Width = 423
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'DESCRICAO')
              DataField = 'IDRUBPRINC'
              DataSource = dsRubxRubDe
              LookupTable = CdsRubIncid
              LookupField = 'IDPROVENTO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dbclkcmbRubIncid2CloseUp
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 2
              Top = 62
              Width = 271
              Height = 37
              Caption = 'Incidência Composta Pelo Valor'
              Columns = 2
              DataField = 'FLGBASECALC'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Calculado'
                'Base ou Informado')
              TabOrder = 2
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object DBRadioGroup2: TDBRadioGroup
              Left = 276
              Top = 62
              Width = 197
              Height = 37
              Caption = 'Incide no Mesmo Tipo de Folha'
              Columns = 2
              DataField = 'FLGTIPOFOLHA'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 3
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
            object dbspPeriodo2: TwwDBSpinEdit
              Left = 433
              Top = 24
              Width = 190
              Height = 21
              Increment = 1
              MaxValue = 99
              MinValue = -99
              Value = -99
              DataField = 'INDPERIODO'
              DataSource = dsRubxRubDe
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object DBRadioGroup3: TDBRadioGroup
              Left = 476
              Top = 62
              Width = 176
              Height = 37
              Caption = 'Tipo de Ação'
              Columns = 2
              DataField = 'FLGACAOINCIDE'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Soma'
                'Subtração')
              TabOrder = 4
              TabStop = True
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
        object tbsIncidAfast: TTabSheet
          Caption = 'tbsIncidAfast'
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label10: TLabel
              Left = 52
              Top = 22
              Width = 313
              Height = 13
              Caption = 'Situação de afastamento em que se aplica esta rubrica'
            end
            object dblcSitFunc: TwwDBLookupCombo
              Left = 52
              Top = 43
              Width = 350
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsDet
              LookupTable = CdsSituacao
              LookupField = 'IDSITFUNC'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcSitFuncCloseUp
            end
          end
          object dbgrdIncidAfast: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1002
            Height = 189
            Selected.Strings = (
              'DESCRICAO'#9'100'#9'Nome da Rubrica'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object tbseSocial: TTabSheet
          Caption = 'tbseSocial'
          ImageIndex = 4
          object grbCodIncTribRub: TGroupBox
            Left = 4
            Top = 0
            Width = 751
            Height = 91
            Caption = 'Incidência Tributária da Rubrica'
            TabOrder = 0
            TabStop = True
            object grbRubPrevSoc: TGroupBox
              Left = 8
              Top = 23
              Width = 243
              Height = 62
              Caption = 'Para Previdência Social'
              TabOrder = 0
              TabStop = True
              object lblDescRubPrevSoc: TLabel
                Left = 10
                Top = 16
                Width = 124
                Height = 13
                Caption = 'Descrição da Rubrica'
                Enabled = False
              end
              object cbbDescRubPrevSoc: TwwDBLookupCombo
                Left = 10
                Top = 32
                Width = 223
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'55'#9'Descricao')
                DataField = 'IDINCTRIBUTPS'
                DataSource = ds
                LookupTable = CdsRubPrevSoc
                LookupField = 'IDINCTRIBUTXRUBRICA'
                Style = csDropDownList
                DropDownWidth = 560
                Enabled = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object grbRubFGTS: TGroupBox
              Left = 500
              Top = 23
              Width = 243
              Height = 62
              Caption = 'Para o FGTS'
              TabOrder = 2
              TabStop = True
              object lblDescRubFGTS: TLabel
                Left = 10
                Top = 16
                Width = 124
                Height = 13
                Caption = 'Descrição da Rubrica'
                Enabled = False
              end
              object cbbDescRubFGTS: TwwDBLookupCombo
                Left = 10
                Top = 32
                Width = 224
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'Descricao')
                DataField = 'IDINCTRIBUTFGTS'
                DataSource = ds
                LookupTable = CdsRubFGTS
                LookupField = 'IDINCTRIBUTXRUBRICA'
                Style = csDropDownList
                DropDownWidth = 330
                Enabled = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
            object grbRubIRFF: TGroupBox
              Left = 254
              Top = 23
              Width = 243
              Height = 62
              Caption = 'Para o IRRF'
              TabOrder = 1
              TabStop = True
              object lblDescRubIRFF: TLabel
                Left = 10
                Top = 16
                Width = 124
                Height = 13
                Caption = 'Descrição da Rubrica'
                Enabled = False
              end
              object cbbDescRubIRFF: TwwDBLookupCombo
                Left = 10
                Top = 32
                Width = 223
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'70'#9'Descricao')
                DataField = 'IDINCTRIBUTIR'
                DataSource = ds
                LookupTable = CdsRubIRFF
                LookupField = 'IDINCTRIBUTXRUBRICA'
                Style = csDropDownList
                DropDownWidth = 650
                Enabled = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
              end
            end
          end
          object grbProcessoRub: TGroupBox
            Left = 4
            Top = 99
            Width = 751
            Height = 81
            Caption = 
              'Informações referente ao Processo Judicial com a decisão/sentenç' +
              'a favorável, determinando a não incidência de:'
            TabOrder = 1
            TabStop = True
            object grbProCP: TGroupBox
              Left = 8
              Top = 16
              Width = 243
              Height = 59
              BiDiMode = bdLeftToRight
              Caption = 'Contribuição Previdenciária'
              ParentBiDiMode = False
              TabOrder = 0
              TabStop = True
              object lblNumProCP: TLabel
                Left = 10
                Top = 14
                Width = 118
                Height = 13
                Caption = 'Número do Processo'
                Enabled = False
              end
              object btnProcCP: TBitBtn
                Left = 208
                Top = 27
                Width = 25
                Height = 22
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ClickProcurarNumProc
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
              object dbedtNumProCP: TwwDBEdit
                Left = 10
                Top = 28
                Width = 195
                Height = 21
                DataField = 'NUMPROCP'
                DataSource = dsProcessosRub
                Enabled = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyDown = NumProCPKeyDown
                OnKeyUp = dbedtNumProCPKeyUp
              end
            end
            object grbProIR: TGroupBox
              Left = 254
              Top = 16
              Width = 243
              Height = 59
              BiDiMode = bdLeftToRight
              Caption = 'Imposto de Renda'
              ParentBiDiMode = False
              TabOrder = 1
              TabStop = True
              object lblNumProIR: TLabel
                Left = 10
                Top = 14
                Width = 118
                Height = 13
                Caption = 'Número do Processo'
                Enabled = False
              end
              object btnProcIR: TBitBtn
                Tag = 1
                Left = 206
                Top = 27
                Width = 25
                Height = 22
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ClickProcurarNumProc
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
              object dbedtNumProIR: TwwDBEdit
                Left = 10
                Top = 28
                Width = 194
                Height = 21
                DataField = 'NUMPROIR'
                DataSource = dsProcessosRub
                Enabled = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyDown = NumProCPKeyDown
              end
            end
            object grbProFGTS: TGroupBox
              Left = 500
              Top = 16
              Width = 243
              Height = 59
              BiDiMode = bdLeftToRight
              Caption = 'FGTS'
              ParentBiDiMode = False
              TabOrder = 2
              TabStop = True
              object lblNumProFGTS: TLabel
                Left = 10
                Top = 14
                Width = 118
                Height = 13
                Caption = 'Número do Processo'
                Enabled = False
              end
              object btnProcFGTS: TBitBtn
                Tag = 2
                Left = 207
                Top = 27
                Width = 25
                Height = 22
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = ClickProcurarNumProc
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
              object dbedtNumProFGTS: TwwDBEdit
                Left = 10
                Top = 28
                Width = 194
                Height = 21
                DataField = 'NUMPROFGTS'
                DataSource = dsProcessosRub
                Enabled = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
                OnKeyDown = NumProCPKeyDown
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1100
      end
      inherited Dock974: TDock97
        Left = 1014
        Height = 217
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1112
  end
  inherited Dock971: TDock97
    Top = 582
    Width = 1112
    inherited tb97Fundo: TToolbar97
      Left = 769
      DockPos = 769
      inherited sep1: TToolbarSep97
        Left = 164
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 440
      DockPos = 440
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
      end
    end
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      object bbtnCopiarRub: TBitBtn
        Left = 0
        Top = 0
        Width = 143
        Height = 33
        Caption = '&Copiar Rubrica'
        TabOrder = 0
        OnClick = bbtnCopiarRubClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000055555550005555555000000055800850B058005550000000553B
          03033000330550000000553B0333F0B3330550000000700BB0338303F8005000
          000003303FFBBFBB3033000000000333FB000008B033000000003F3FB77F7703
          FBFB000000003333F77F8707B800500000005503FF7F770FB30550000000553F
          BB7F8703FB05500000005553377877073755500000005555557FF80555555000
          0000555555577755555550000000555555555555555550000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 668
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 252
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 726
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 381
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    StoreDefs = True
    AfterInsert = CdsAfterInsert
    Left = 284
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubricas Salariais'
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC'
      'PROVDESC.CODRUBCLT'
      'PROVDESC.IDREGRA')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código'
      'Cód. Rubrica CLT'
      'Cod. Regra Principal')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)'
      'IDMODULO = 21')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12'
      '5'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 536
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 435
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsRubSit
    OnStateChange = dsDetStateChange
    Left = 324
    Top = 5
  end
  object dsRubxRubDe: TwwDataSource
    AutoEdit = False
    DataSet = CdsRubxRubDe
    OnStateChange = dsRubxRubDeStateChange
    Left = 919
    Top = 149
  end
  object dsRubxRubEm: TwwDataSource
    AutoEdit = False
    DataSet = CdsRubxRubEm
    OnStateChange = dsRubxRubEmStateChange
    Left = 920
    Top = 105
  end
  object CdsRubSit: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDSITFUNC'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsRubSitIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubSitIndex'
    Params = <>
    StoreDefs = True
    AfterInsert = CdsRubSitAfterInsert
    Left = 994
    Top = 17
  end
  object CdsRegra: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRegraIndex'
        CaseInsFields = 'NOMEREGRA'
        Fields = 'NOMEREGRA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRegraIndex'
    Params = <>
    StoreDefs = True
    Left = 1090
    Top = 102
  end
  object CdsRubCLT: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubCLTIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubCLTIndex'
    Params = <>
    StoreDefs = True
    Left = 1088
    Top = 85
  end
  object CdsInforme: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsInformeIndex'
        CaseInsFields = 'NOMEINFORME'
        Fields = 'NOMEINFORME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsInformeIndex'
    Params = <>
    StoreDefs = True
    Left = 1088
    Top = 71
  end
  object CdsRubIncid: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubIncidIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubIncidIndex'
    Params = <>
    StoreDefs = True
    Left = 1035
    Top = 220
  end
  object CdsNaturOper: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsNaturOperIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsNaturOperIndex'
    Params = <>
    StoreDefs = True
    Left = 1101
    Top = 152
  end
  object CdsSituacao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 1101
    Top = 165
  end
  object CdsRubxRubEm: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsRubxRubEmAfterInsert
    Left = 1002
    Top = 79
  end
  object CdsRubxRubDe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsRubxRubDeAfterInsert
    Left = 1003
    Top = 123
  end
  object MontaSelectED: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubricas Salariais - Excesso de Débito'
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC'
      'PROVDESC.CODRUBCLT'
      'PROVDESC.IDREGRA')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código'
      'Cód. Rubrica CLT'
      'Cod. Regra Principal')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)'
      'IDMODULO = 21')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12'
      '5'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 596
    Top = 255
  end
  object CdsRubExcessoDeb: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 693
    Top = 247
  end
  object cdsRubxEvento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cdsRubxEventoAfterInsert
    Left = 815
  end
  object dsRubxEvento: TwwDataSource
    AutoEdit = False
    DataSet = cdsRubxEvento
    OnStateChange = dsRubxEventoStateChange
    Left = 923
    Top = 57
  end
  object cdsMotivo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 987
    Top = 264
  end
  object cdsCodeSocial: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 1029
    Top = 165
  end
  object CdsInctributXRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 393
  end
  object msProcessos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMERO'
      'DECODE(P.TIPO, '#39'A'#39', '#39'ADMINISTRATIVO'#39', '#39'JUDICIAL'#39')')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Número de Processo'
      'Tipo do Processo')
    SensivelACaixa.Strings = (
      'N'
      'S')
    Tabelas.Strings = (
      'PROCESSOS P')
    CamposChave.Strings = (
      'P.NUMERO'
      'P.TIPO'
      'P.EXTENDECISAO'
      'P.IDPROCESSO')
    Filtro.Strings = (
      'IDFILIALPESSOA IS NOT NULL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '10')
    OperComparador.Strings = (
      '1'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      'N')
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
    Left = 192
    Top = 509
  end
  object CdsProcessosRub: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 952
    Top = 200
  end
  object dsProcessosRub: TwwDataSource
    DataSet = CdsProcessosRub
    Left = 916
    Top = 200
  end
  object CdsRubPrevSoc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 113
    Top = 419
  end
  object CdsRubFGTS: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 661
    Top = 407
  end
  object CdsRubIRFF: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 419
    Top = 411
  end
  object MontaSelectNaturezaRub: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RUBRICAXESOCIAL.CODNATESOCIAL'
      'RUBRICAXESOCIAL.NOME_NAT'
      'SUBSTR(RUBRICAXESOCIAL.DESCRICAO,0,200)')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código eSocial'
      'Natureza da Rubrica'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICAXESOCIAL')
    CamposChave.Strings = (
      'RUBRICAXESOCIAL.CODNATESOCIAL'
      'RUBRICAXESOCIAL.NOME_NAT'
      'RUBRICAXESOCIAL.IDRUBRICAXESOCIAL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '45'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 276
    Top = 212
  end
end
