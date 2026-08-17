inherited FrmMTCadArtigo: TFrmMTCadArtigo
  Left = 191
  Top = 65
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Artigos'
  ClientHeight = 449
  ClientWidth = 738
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 363
    inherited pnlMestre: TPanel
      Width = 736
      Height = 173
      Font.Charset = ANSI_CHARSET
      Font.Height = -11
      Font.Name = 'Microsoft Sans Serif'
      ParentFont = False
      object Label8: TLabel
        Left = 16
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Código '
      end
      object Label9: TLabel
        Left = 104
        Top = 8
        Width = 57
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 368
        Top = 8
        Width = 106
        Height = 13
        Caption = 'Grupo de Produtos'
      end
      object Label13: TLabel
        Left = 16
        Top = 56
        Width = 91
        Height = 13
        Caption = 'Código de Barra'
      end
      object edCodProd: TwwDBEdit
        Left = 16
        Top = 24
        Width = 79
        Height = 21
        DataField = 'CODPRODUTO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = edCodProdExit
      end
      object edDescProd: TwwDBEdit
        Left = 104
        Top = 24
        Width = 249
        Height = 21
        DataField = 'DESCPROD'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkcmbGrupo: TwwDBLookupCombo
        Left = 368
        Top = 24
        Width = 209
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição'
          'CODGRUPOPROD'#9'10'#9'Código')
        DataField = 'CODGRUPOPROD'
        DataSource = ds
        LookupTable = cdsGrupoProd
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkcmbGrupoCloseUp
      end
      object grpMedidas: TGroupBox
        Left = 16
        Top = 99
        Width = 337
        Height = 70
        Caption = '  Unidades de Medida  '
        TabOrder = 4
        object Label4: TLabel
          Left = 16
          Top = 24
          Width = 70
          Height = 13
          Caption = 'Custo Médio'
        end
        object Label5: TLabel
          Left = 120
          Top = 24
          Width = 86
          Height = 13
          Caption = 'Menor Unidade'
        end
        object Label24: TLabel
          Left = 224
          Top = 24
          Width = 42
          Height = 13
          Caption = 'Compra'
        end
        object dblkCmbUnCompra: TwwDBLookupCombo
          Left = 224
          Top = 40
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Código'
            'DESCMEDIDA'#9'25'#9'Descrição')
          DataField = 'CODMEDANALISE'
          DataSource = ds
          LookupTable = cdsUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblkCmbMenorUnid: TwwDBLookupCombo
          Left = 120
          Top = 40
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Unidade'
            'DESCMEDIDA'#9'25'#9'Descrição')
          DataField = 'CODMENORMED'
          DataSource = ds
          LookupTable = cdsUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblkCmbMenorUnidExit
        end
        object dblkCmbUnPrMed: TwwDBLookupCombo
          Left = 16
          Top = 40
          Width = 94
          Height = 21
          CharCase = ecUpperCase
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODMEDIDA'#9'4'#9'Unidade'#9'No'
            'DESCMEDIDA'#9'25'#9'Descrição'#9'No')
          DataField = 'CODMEDCUSTO'
          DataSource = ds
          LookupTable = cdsUnidadeMed
          LookupField = 'CodMedida'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblkCmbUnPrMedExit
        end
      end
      object RgBloq: TDBRadioGroup
        Left = 592
        Top = 8
        Width = 121
        Height = 82
        Caption = '  Bloqueio  '
        DataField = 'FLGBLOQUEADO'
        DataSource = ds
        Items.Strings = (
          'Não bloqueado'
          'Compra'
          'Requisição'
          'Ambos')
        TabOrder = 5
        Values.Strings = (
          'L'
          'C'
          'R'
          'A')
      end
      object rgrpFinalidade: TDBRadioGroup
        Left = 592
        Top = 96
        Width = 121
        Height = 73
        Caption = '  Finalidade  '
        DataField = 'CONSUMOREVENDA'
        DataSource = ds
        Items.Strings = (
          'Revenda'
          'Consumo')
        TabOrder = 6
        Values.Strings = (
          'R'
          'C')
      end
      object chkVariavel: TDBCheckBox
        Left = 368
        Top = 136
        Width = 222
        Height = 17
        Caption = 'Produto possui descrição variável'
        DataField = 'FLGVARIAVEL'
        DataSource = ds
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object chkLoteValidade: TDBCheckBox
        Left = 368
        Top = 104
        Width = 133
        Height = 17
        Caption = 'Controla Validade'
        DataField = 'LOTEVALIDADE'
        DataSource = ds
        TabOrder = 7
        ValueChecked = 'T'
        ValueUnchecked = 'F'
      end
      object chkEstocavel: TDBCheckBox
        Left = 368
        Top = 120
        Width = 133
        Height = 17
        Caption = 'Estocável'
        DataField = 'ITEMESTOCAVEL'
        DataSource = ds
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblcAtivo: TDBCheckBox
        Left = 368
        Top = 152
        Width = 133
        Height = 17
        Caption = 'Ativo'
        DataField = 'FLGATIVO'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object edCodBarra: TDBEdit
        Left = 16
        Top = 72
        Width = 561
        Height = 21
        DataField = 'CODBARRA'
        DataSource = ds
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 174
      Width = 736
      Height = 188
      Font.Color = clBlack
      ParentFont = False
      Tabs.Strings = (
        'Unidades de Medida'
        'Contabilização'
        'Descrição Detalhada'
        'Escrita Fiscal'
        'Impostos'
        'Cor e Tamanho')
      detdbGrids.Strings = (
        'dbgrdDet'
        'grdContab'
        ''
        ''
        'grdImposto'
        'grdCorTam')
      inherited pgctrlDetalhe: TPageControl
        Width = 638
        Height = 129
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 630
            Height = 101
            Selected.Strings = (
              'CODMEDIDA'#9'10'#9'Unidade'#9'F'
              'FATOR'#9'15'#9'Fator'#9'F'
              'CODMENORMED'#9'10'#9'Menor~Unidade'#9'F')
            TitleAlignment = taCenter
            TitleFont.Color = clBlack
            TitleLines = 2
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 630
            Height = 101
            object lblUnidade: TLabel
              Left = 16
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object lblFator: TLabel
              Left = 152
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Fator de Conversão'
            end
            object lblMenorUn: TLabel
              Left = 312
              Top = 16
              Width = 87
              Height = 13
              Caption = 'Menor Unidade'
            end
            object dblcUnidade: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 121
              Height = 21
              CharCase = ecUpperCase
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              LookupTable = cdsUnidadeMed
              LookupField = 'CodMedida'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrFator: TDBRealEdit
              Left = 152
              Top = 32
              Width = 136
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'FATOR'
              DataSource = dsDet
            end
            object dbeMenorUn: TwwDBEdit
              Left = 312
              Top = 32
              Width = 97
              Height = 21
              Color = clSilver
              DataField = 'CODMENORMED'
              DataSource = ds
              Enabled = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object TabContab: TTabSheet
          Caption = 'TabContab'
          ImageIndex = 1
          object grdContab: TwwDBGrid
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Selected.Strings = (
              'CONTAENTRADA'#9'18'#9'Conta~Entrada'#9'F'
              'SUBCONTAENTRADA'#9'10'#9'Sub-Conta~Entrada'#9'F'
              'CONTASAIDA'#9'18'#9'Conta~Saída'#9'F'
              'SUBCONTASAIDA'#9'10'#9'Sub-Conta~Saída'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContab
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblCCusto: TLabel
              Left = 280
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro do Custo'
            end
            object lblAtividade: TLabel
              Left = 280
              Top = 56
              Width = 112
              Height = 13
              Caption = 'Atividade (Projetos)'
            end
            object lblSubConta: TLabel
              Left = 200
              Top = 8
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object Label2: TLabel
              Left = 200
              Top = 56
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object Label3: TLabel
              Left = 432
              Top = 8
              Width = 73
              Height = 13
              Caption = 'Almoxarifado'
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 280
              Top = 24
              Width = 143
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsContab
              LookupTable = cdsCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcAtividade: TwwDBLookupCombo
              Left = 280
              Top = 72
              Width = 295
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNIDNEGOC'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsContab
              LookupTable = cdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object cbValeGrupo: TCheckBox
              Left = 280
              Top = 96
              Width = 256
              Height = 17
              Caption = 'Contabilização válida para todo o Grupo'
              TabOrder = 6
            end
            object edContaEntrada: TCMProcuraMaskContabil
              Left = 8
              Top = 0
              Width = 185
              Height = 48
              Caption = ' Conta de Entrada '
              TabOrder = 0
              OnExit = edContaEntradaExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsContab
              DataField = 'CONTAENTRADA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcSubContaEntrada: TwwDBLookupCombo
              Left = 200
              Top = 24
              Width = 73
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
              DataField = 'SUBCONTAENTRADA'
              DataSource = dsContab
              LookupTable = cdsSubContaEnt
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcSubContaSaida: TwwDBLookupCombo
              Left = 200
              Top = 72
              Width = 73
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
              DataField = 'SUBCONTASAIDA'
              DataSource = dsContab
              LookupTable = cdsSubContaEnt
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object edContaSaida: TCMProcuraMaskContabil
              Left = 8
              Top = 48
              Width = 185
              Height = 47
              Caption = ' Conta de Saída '
              TabOrder = 2
              OnExit = edContaSaidaExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsContab
              DataField = 'CONTASAIDA'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dblcAlmoxa: TwwDBLookupCombo
              Left = 432
              Top = 24
              Width = 143
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCALMOX'#9'40'#9'Descrição')
              DataField = 'CODALMOXARIFADO'
              DataSource = dsContab
              LookupTable = cdsAlmox
              LookupField = 'CODALMOXARIFADO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabDescDet: TTabSheet
          Caption = 'TabDescDet'
          ImageIndex = 2
          object DBRichEdit1: TDBRichEdit
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Align = alClient
            DataField = 'DESCRCOMPL'
            DataSource = ds
            MaxLength = 500
            PlainText = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabEscFiscal: TTabSheet
          Caption = 'TabEscFiscal'
          ImageIndex = 3
          object Label10: TLabel
            Left = 8
            Top = 0
            Width = 109
            Height = 13
            Caption = 'Situação Tributária'
          end
          object dblcSittrib: TCMDBLookupCombo
            Left = 8
            Top = 16
            Width = 257
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCSITUACAOTRIB'#9'45'#9'Descrição'#9'F')
            DataField = 'SITUACAOTRIB'
            DataSource = ds
            LookupTable = cdsSitTrib
            LookupField = 'SITUACAOTRIB'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbrgIsentoOutros: TDBRadioGroup
            Left = 8
            Top = 40
            Width = 256
            Height = 41
            Columns = 2
            DataField = 'ISENTOOUTROS'
            DataSource = ds
            Items.Strings = (
              '&Isento'
              '&Outros')
            TabOrder = 1
            Values.Strings = (
              'I'
              'O')
          end
          object gbCodigoFiscal: TGroupBox
            Left = 272
            Top = 8
            Width = 148
            Height = 73
            Caption = '  Código Fiscal Padrão '
            TabOrder = 2
            object Label6: TLabel
              Left = 24
              Top = 32
              Width = 13
              Height = 13
              Caption = 'X.'
            end
            object lblExplica: TLabel
              Left = 15
              Top = 49
              Width = 112
              Height = 13
              Caption = 'X = Origem da Nota'
            end
            object dblcClasFisc: TCMDBLookupCombo
              Left = 40
              Top = 24
              Width = 73
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODFISC'#9'2'#9'Código')
              DataField = 'CODFISCALPADRAO'
              DataSource = ds
              LookupTable = cdsClasFisc
              LookupField = 'CODFISC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabImpostos: TTabSheet
          Caption = 'TabImpostos'
          ImageIndex = 4
          object grdImposto: TwwDBGrid
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Selected.Strings = (
              'CODTIPOCUSTAGREG'#9'10'#9'Código'
              'DESCCUSTAGREG'#9'30'#9'Descrição'#9'F'
              'PERCIMPOSTO'#9'10'#9'Percentual'#9'F'
              'PERCBASEIMP'#9'10'#9'Base de Cálculo'#9'F'
              'CODESTADO'#9'3'#9'Estado'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsImposto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lbTipoAgre: TLabel
              Left = 8
              Top = 0
              Width = 45
              Height = 13
              Caption = 'Imposto'
            end
            object Label7: TLabel
              Left = 8
              Top = 48
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object lblPerc: TLabel
              Left = 136
              Top = 64
              Width = 16
              Height = 20
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 184
              Top = 48
              Width = 90
              Height = 13
              Caption = 'Base de Cáculo'
            end
            object lblEstado: TLabel
              Left = 256
              Top = 0
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object dblcTipoAgre: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCUSTAGREG'#9'25'#9'Descrição'
                'CODTIPOCUSTAGREG'#9'10'#9'Código')
              DataField = 'CODTIPOCUSTAGREG'
              DataSource = dsImposto
              LookupTable = cdsTipoAgre
              LookupField = 'CODTIPOCUSTAGREG'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbPercentual: TDBRealEdit
              Left = 8
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCIMPOSTO'
              DataSource = dsImposto
            end
            object dbedBase: TDBRealEdit
              Left = 184
              Top = 64
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCBASEIMP'
              DataSource = dsImposto
            end
            object dblcEstado: TwwDBLookupCombo
              Left = 256
              Top = 16
              Width = 232
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODESTADO'#9'3'#9'U.F.'
                'NOMEESTADO'#9'30'#9'Nome'
                'IDPAIS'#9'10'#9'Código do País')
              DataField = 'CODESTADO'
              DataSource = dsImposto
              LookupTable = cdsEstado
              LookupField = 'CODESTADO'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabCorTam: TTabSheet
          Caption = 'TabCorTam'
          ImageIndex = 5
          object grdCorTam: TwwDBGrid
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Selected.Strings = (
              'CODCOR'#9'5'#9'Código da Cor'#9'F'
              'DESCCOR'#9'25'#9'Cor'#9'F'
              'CODTAMANHO'#9'3'#9'Cógido do Tamanho'#9'F'
              'DESCTAMANHO'#9'20'#9'Tamanho'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCorTam
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object pnlCortam: TPanel
            Left = 0
            Top = 0
            Width = 630
            Height = 101
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LblTam: TLabel
              Left = 248
              Top = 8
              Width = 53
              Height = 13
              Caption = 'Tamanho'
            end
            object lblCor: TLabel
              Left = 8
              Top = 8
              Width = 20
              Height = 13
              Caption = 'Cor'
            end
            object Label12: TLabel
              Left = 8
              Top = 56
              Width = 92
              Height = 13
              Caption = 'Código de Barra'
            end
            object dblcCor: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 225
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCOR'#9'25'#9'Descrição'#9'F')
              DataField = 'CODCOR'
              DataSource = dsCorTam
              LookupTable = cdsCor
              LookupField = 'CODCOR'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcTam: TwwDBLookupCombo
              Left = 248
              Top = 24
              Width = 241
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTAMANHO'#9'20'#9'Descrição'#9'F')
              DataField = 'CODTAMANHO'
              DataSource = dsCorTam
              LookupTable = cdsTamanho
              LookupField = 'CODTAMANHO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object edCodBarraCT: TDBEdit
              Left = 8
              Top = 72
              Width = 481
              Height = 21
              DataField = 'CODBARRA'
              DataSource = dsCorTam
              MaxLength = 106
              TabOrder = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 728
      end
      inherited Dock974: TDock97
        Left = 642
        Height = 129
      end
    end
  end
  inherited Dock972: TDock97
    Width = 738
    inherited Toolbar971: TToolbar97
      object btnTipoProd: TToolbarButton97
        Left = 243
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = mnuTipoProd
        Caption = '&Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777778000000087777000000000070888888800777019191919077088
          88808707709B9B9B910770888880787000B9B9B9B077770000088780330B9B9B
          9077777088888707B709B9B9077777770888880B7B70009107777777000000B7
          B7B7B300077777770F7B7B7B7B7B7333077777770FB7B7B7B7B7B33307777777
          0F7B7B7B7B7B7333077777770FFFFFFFFFFFF333077777770333333333333033
          07777770F8FF8888078083830777770FFF8F83380780833007777770FFF8B338
          07808333077777770FF0330FF08800330077777770F0330FF0880F00F8077777
          770B330FF0780FFFFF077777770B30777078077777807777770B300FF0780FFF
          FFF077777770070FF0770FFFFFF0777777777778880008888887}
        Layout = blGlyphTop
        Opaque = False
        ParentFont = False
        Spacing = 0
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        Blank = True
        SizeHorz = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 616
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 397
      DockPos = 447
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 7
    TargetsData = (
      1
      3
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 204
    Top = 55
  end
  inherited ImlPadrao: TImageList
    Left = 752
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 152
    Top = 56
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    Top = 47
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PRODUTO.CODPRODUTO'
      'PRODUTO.DESCPROD'
      'PRODUTO.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Produto'
      'Descrição do Produto'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PRODUTO'
      'GRUPPROD'
      'ARTIGO')
    CamposChave.Strings = (
      'PRODUTO.CODPRODUTO')
    Filtro.Strings = (
      'ARTIGO.CODTIPOARTIGO = '#39'2'#39
      'PRODUTO.CODGRUPOPROD = GRUPPROD.CODGRUPOPROD'
      'PRODUTO.CODPRODUTO = ARTIGO.CODARTIGO ')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '10'
      '4'
      '40')
    Left = 423
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 486
    Top = 10
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 204
    Top = 42
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    Left = 356
    Top = 33
  end
  object dsContab: TwwDataSource
    AutoEdit = False
    DataSet = cdsContab
    Left = 204
    Top = 29
  end
  object cdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContab'
    Left = 356
    Top = 21
  end
  object dsImposto: TwwDataSource
    AutoEdit = False
    DataSet = cdsImposto
    Left = 205
    Top = 16
  end
  object cdsImposto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspImposto'
    Left = 356
    Top = 9
  end
  object cdsSitTrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSitTrib'
    Left = 560
    Top = 175
  end
  object cdsClasFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClasFisc'
    Left = 560
    Top = 119
  end
  object cdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAlmox'
    Left = 392
    Top = 177
  end
  object cdsUnidadeMed: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeMed'
    Left = 392
    Top = 163
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupoProd'
    Left = 392
    Top = 149
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidNegoc'
    Left = 392
    Top = 135
  end
  object cdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstado'
    Left = 392
    Top = 121
  end
  object cdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCCusto'
    Left = 392
    Top = 107
  end
  object cdsSubContaEnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubConta'
    Left = 520
    Top = 267
  end
  object cdsTipoAgre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipoAgre'
    Left = 392
    Top = 267
  end
  object mnuTipoProd: TPopupMenu
    AutoHotkeys = maManual
    Left = 528
    Top = 9
    object Insumo1: TMenuItem
      Tag = 2
      Caption = 'Insumo'
      GroupIndex = 1
      RadioItem = True
      OnClick = MudaTipo
    end
    object Outros1: TMenuItem
      Tag = 3
      Caption = 'Outros'
      GroupIndex = 1
      RadioItem = True
      OnClick = MudaTipo
    end
    object ItensdeVenda1: TMenuItem
      Tag = 4
      Caption = 'Itens de Venda'
      GroupIndex = 1
      RadioItem = True
      OnClick = MudaTipo
    end
    object ItensdePDV1: TMenuItem
      Caption = 'Itens'
      GroupIndex = 1
      RadioItem = True
      OnClick = MudaTipo
    end
  end
  object cdsCorTam: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 354
    Top = 65531
  end
  object dsCorTam: TwwDataSource
    AutoEdit = False
    DataSet = cdsCorTam
    Left = 294
    Top = 34
  end
  object cdsCor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 193
  end
  object cdsTamanho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 269
    Top = 143
  end
  object CdsSubContaSai: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSubConta'
    Left = 520
    Top = 235
  end
  object spSitTrib: TCMSqlParams
    SQL.Strings = (
      'SELECT SITUACAOTRIB,DESCSITUACAOTRIB'
      'FROM SITUACAOTRIBTABB'
      'ORDER BY 2 ')
    ClientDataSet = cdsSitTrib
    Left = 629
    Top = 172
  end
  object spClasFisc: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '              SUBSTR(CODFISCAL,2,3) AS CODFISC'
      'FROM'
      '   CLASFISC'
      'ORDER BY 1')
    ClientDataSet = cdsClasFisc
    Left = 629
    Top = 116
  end
  object spTipoAgre: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      CODTIPOCUSTAGREG, '
      '      DESCCUSTAGREG,    '
      '      FLGBASE,          '
      '      PERCVALOR,        '
      '      (0) AS BASE,      '
      '      (0) AS ALIQUOTA,  '
      '      (0) AS VALOR,     '
      '      (0) ACUMBASE      '
      'FROM                    '
      '      TIPOAGRE          '
      'WHERE'
      '      (FLGINCIDERECEB = '#39'S'#39')'
      '  AND (TOTALITEM = '#39'I'#39')'
      ''
      'ORDER BY FLGBASE DESC, DESCCUSTAGREG'
      ' ')
    ClientDataSet = cdsTipoAgre
    Left = 637
    Top = 233
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 85
  end
end
