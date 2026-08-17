inherited FrmMovimFinancMT: TFrmMovimFinancMT
  Left = 684
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Movimento Financeiro'
  ClientHeight = 591
  ClientWidth = 1085
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 311
    Top = 8
    Width = 80
    Height = 13
    Caption = 'Patrocinadora'
  end
  inherited pnlFundo: TPanel
    Width = 1085
    Height = 505
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 165
      Width = 1083
      Height = 339
      Tabs.Strings = (
        'Rateio'
        'Contabilização'
        'Consulta Documentos')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        '')
      inherited Dock974: TDock97 [0]
        Left = 989
        Height = 280
      end
      object pnlConsultaDoc: TPanel [1]
        Left = 880
        Top = 55
        Width = 109
        Height = 280
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        object lblTotDOc: TLabel
          Left = 0
          Top = 267
          Width = 109
          Height = 13
          Align = alBottom
          Alignment = taCenter
        end
        object btnListaDoc: TBitBtn
          Left = 2
          Top = 4
          Width = 105
          Height = 25
          Hint = 'Mostrar todos os documentos da baixa.'
          Caption = 'Listar Todos'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnListaDocClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
        end
      end
      inherited Dock973: TDock97
        Width = 1075
        object lblModulo: TLabel [0]
          Left = 90
          Top = 8
          Width = 220
          Height = 13
          Caption = 'Sistema que originou este lançamento:'
        end
        object lblNomeOrigem: TLabel [1]
          Left = 314
          Top = 4
          Width = 399
          Height = 20
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRateio: TLabel [2]
          Left = 523
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Rateio Pré-Definido'
        end
        object btnRatear: TButton
          Left = 980
          Top = 2
          Width = 55
          Height = 25
          Caption = 'Ratear'
          TabOrder = 1
          OnClick = btnRatearClick
        end
        object DBcboGrupoRateio: TwwDBLookupCombo
          Left = 640
          Top = 3
          Width = 337
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'GRRFDESCRICAO'#9'60'#9'Grupo de Rateio'#9'F')
          LookupTable = cdsGrupoRateio
          LookupField = 'IDGRUPORATEIOFLUXO'
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = DBcboGrupoRateioExit
        end
      end
      inherited pgctrlDetalhe: TPageControl [3]
        Width = 876
        Height = 280
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 868
            Height = 252
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo de Rec/Des'#9'F'
              'MOESIGLA'#9'10'#9'Sigla'#9'F'
              'VALOROUTRAMOEDA'#9'15'#9'Valor Outra Moeda'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'CODCENTROCUSTO'#9'13'#9'Centro de Custo'#9'F'
              'CODTIPDOC'#9'19'#9'Código de Tipo de Doc.'#9'F'
              'NOME_PATRO'#9'35'#9'Patrocinadora'#9'F'
              'NOME_PLANO'#9'35'#9'Plano'#9'F'
              'DESCPROGRAMA'#9'35'#9'Programa'#9'F')
            KeyOptions = [dgAllowDelete]
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 868
            Height = 252
            object Label20: TLabel
              Left = 152
              Top = 107
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label18: TLabel
              Left = 5
              Top = 107
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label19: TLabel
              Left = 305
              Top = 107
              Width = 118
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object lblUnidNegoc: TLabel
              Left = 5
              Top = -1
              Width = 54
              Height = 13
              Caption = 'Atividade'
            end
            object lblCentroRespon: TLabel
              Left = 306
              Top = -2
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lblTipoRD: TLabel
              Left = 5
              Top = 32
              Width = 196
              Height = 13
              Caption = 'Tipo de Recebimento/Desembolso'
            end
            object Label13: TLabel
              Left = 306
              Top = 32
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object lblMoedaDet: TLabel
              Left = 5
              Top = 70
              Width = 39
              Height = 13
              Caption = 'Moeda'
            end
            object lblValorOutDet: TLabel
              Left = 152
              Top = 70
              Width = 127
              Height = 13
              Caption = 'Valor em Outra Moeda'
            end
            object lblValorDet: TLabel
              Left = 306
              Top = 70
              Width = 124
              Height = 13
              Caption = 'Valor Moeda Corrente'
            end
            object Label17: TLabel
              Left = 464
              Top = 70
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 153
              Top = 121
              Width = 144
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
              DataField = 'IDPROGRAMA'
              DataSource = dsDet
              LookupTable = cdsPrograma
              LookupField = 'IDPROGRAMA'
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcPatrocinadorRateio: TwwDBLookupCombo
              Left = 6
              Top = 121
              Width = 141
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = cdsPatrocinador
              LookupField = 'IDPESSOA'
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcPlanoPrevRateio: TwwDBLookupCombo
              Left = 305
              Top = 121
              Width = 309
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = cdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 5
              Top = 11
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = cdsUnidNeg
              LookupField = 'UNIDNEGOC'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = dblcUnidNegocChange
            end
            object dblcCentroRespon: TwwDBLookupCombo
              Left = 306
              Top = 12
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDet
              LookupTable = cdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcCentroResponCloseUp
            end
            object dblcTipoRD: TwwDBLookupCombo
              Left = 5
              Top = 46
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Tipo de Rec/Desemb'#9'F'
                'RECPAG'#9'1'#9'Tipo'#9'F'
                'CODTIPRECDES'#9'15'#9'Código'#9'F')
              DataField = 'CODTIPRECDES'
              DataSource = dsDet
              LookupTable = cdsTipoRecDes
              LookupField = 'CODTIPRECDES'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
              OnChange = dblcTipoRDChange
              OnCloseUp = dblcTipoRDCloseUp
            end
            object dblcTipoDocumento: TwwDBLookupCombo
              Left = 306
              Top = 46
              Width = 310
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'#9'F'
                'CODTIPDOC'#9'10'#9'Código'#9'F')
              DataField = 'CODTIPDOC'
              DataSource = dsDet
              LookupTable = cdsTipoDoc
              LookupField = 'CODTIPDOC'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnEnter = dblcTipoDocumentoEnter
            end
            object edMoedaDet: TEdit
              Left = 5
              Top = 84
              Width = 140
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object dbeValorMoedaDet: TDBRealEdit
              Left = 152
              Top = 84
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              OnExit = dbeValorMoedaDetExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VALOROUTRAMOEDA'
              DataSource = dsDet
            end
            object dbeValorDet: TDBRealEdit
              Left = 306
              Top = 84
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '25,00')
              TabOrder = 6
              WordWrap = False
              OnKeyDown = dbeValorDetKeyDown
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
              DataField = 'VALOR'
              DataSource = dsDet
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 464
              Top = 84
              Width = 152
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbsContabil: TTabSheet
          Caption = 'Contabilização'
          ImageIndex = 1
          object pnlContabil: TPanel
            Left = 0
            Top = 0
            Width = 868
            Height = 252
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            object pgcContabil: TPageControl
              Left = 10
              Top = 10
              Width = 848
              Height = 232
              ActivePage = tbsPrevidenciarioContab
              Align = alClient
              TabOrder = 0
              object tbsBasicoContab: TTabSheet
                Caption = 'Básico'
                object lblValorMoedaCon: TLabel
                  Left = 8
                  Top = 86
                  Width = 107
                  Height = 13
                  Caption = 'Valor Outra Moeda'
                end
                object lblValorCorrenteCon: TLabel
                  Left = 156
                  Top = 86
                  Width = 124
                  Height = 13
                  Caption = 'Valor Moeda Corrente'
                end
                object lblSubConta: TLabel
                  Left = 218
                  Top = 2
                  Width = 60
                  Height = 13
                  Caption = 'Sub-Conta'
                end
                object lblCCusto: TLabel
                  Left = 311
                  Top = 2
                  Width = 92
                  Height = 13
                  Caption = 'Centro do Custo'
                end
                object lblAtividade: TLabel
                  Left = 461
                  Top = 2
                  Width = 112
                  Height = 13
                  Caption = 'Atividade (Projetos)'
                end
                object dbccConta: TCMProcuraMaskContabil
                  Left = 6
                  Top = 3
                  Width = 209
                  Height = 77
                  Caption = ' Conta Contábil '
                  TabOrder = 0
                  OnExit = dbccContaExit
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsContabil
                  DataField = 'PLACONTA'
                  Mensagens.EmBranco = 'não pode estar em branco'
                  Mensagens.NaoExiste = 'não existe'
                  Mensagens.Sintetica = 'não pode ser sintética'
                  Mensagens.Analitica = 'não pode ser analítica'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  Plano = 0
                  Status = scSoAtiva
                end
                object gbHistorico: TGroupBox
                  Left = 307
                  Top = 38
                  Width = 310
                  Height = 84
                  Caption = 'Histórico'
                  TabOrder = 5
                  object dbeHist1: TwwDBEdit
                    Left = 9
                    Top = 14
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST1'
                    DataSource = dsContabil
                    TabOrder = 0
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeHist2: TwwDBEdit
                    Left = 9
                    Top = 36
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST2'
                    DataSource = dsContabil
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object dbeHist3: TwwDBEdit
                    Left = 9
                    Top = 58
                    Width = 296
                    Height = 21
                    DataField = 'LACHIST3'
                    DataSource = dsContabil
                    TabOrder = 2
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                end
                object dbgDebitoCredito: TDBRadioGroup
                  Left = 220
                  Top = 38
                  Width = 76
                  Height = 42
                  DataField = 'LACDEBCRE'
                  DataSource = dsContabil
                  Items.Strings = (
                    'Débito'
                    'Crédito')
                  TabOrder = 2
                  Values.Strings = (
                    'D'
                    'C')
                end
                object dblcSubConta: TwwDBLookupCombo
                  Left = 218
                  Top = 16
                  Width = 86
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODSUBCONTA'#9'10'#9'CODSUBCONTA'
                    'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
                  DataField = 'CODSUBCONTA'
                  DataSource = dsContabil
                  LookupTable = cdsSubConta
                  LookupField = 'CODSUBCONTA'
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnEnter = dblcSubContaEnter
                end
                object dblcCCusto: TwwDBLookupCombo
                  Left = 311
                  Top = 16
                  Width = 146
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Centro de Custo'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsContabil
                  LookupTable = cdsCentroCusto
                  LookupField = 'CODCENTROCUSTO'
                  Style = csDropDownList
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnChange = dblcCCustoChange
                  OnEnter = dblcCCustoEnter
                end
                object dblcAtividade: TwwDBLookupCombo
                  Left = 461
                  Top = 16
                  Width = 155
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'NOME')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsContabil
                  LookupTable = cdsUnidNeg
                  LookupField = 'UNIDNEGOC'
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  OnChange = dblcAtividadeChange
                end
                object dbeValorOMContab: TDBRealEdit
                  Left = 8
                  Top = 101
                  Width = 139
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 6
                  WordWrap = False
                  OnExit = dbeValorMoedaDetExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = True
                  DataField = 'LACVALHIST'
                  DataSource = dsContabil
                end
                object dbeValorCorrenteContab: TDBRealEdit
                  Left = 156
                  Top = 101
                  Width = 139
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 7
                  WordWrap = False
                  OnExit = dbeValorMoedaDetExit
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = True
                  DataField = 'LACVALOR'
                  DataSource = dsContabil
                end
              end
              object tbsPrevidenciarioContab: TTabSheet
                Caption = 'Previdenciário'
                ImageIndex = 1
                object Label2: TLabel
                  Left = 8
                  Top = 16
                  Width = 73
                  Height = 13
                  Caption = 'Patrocinador'
                end
                object Label3: TLabel
                  Left = 8
                  Top = 64
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object dblcPatrocinadorContabil: TwwDBLookupCombo
                  Left = 8
                  Top = 32
                  Width = 321
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
                  DataField = 'IDPATRO'
                  DataSource = dsContabil
                  LookupTable = cdsPatrocinador
                  LookupField = 'IDPESSOA'
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
                object dblcPlanoPrevContabil: TwwDBLookupCombo
                  Left = 8
                  Top = 80
                  Width = 323
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'NOME')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsContabil
                  LookupTable = cdsPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  TabOrder = 1
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
          object dbgrdContabil: TwwDBGrid
            Left = 0
            Top = 0
            Width = 868
            Height = 252
            Selected.Strings = (
              'PLACONTA'#9'14'#9'Conta Contábil'#9'F'
              'DESCPLANO'#9'14'#9'Nome da Conta'#9'F'
              'CODSUBCONTA'#9'10'#9'Sub-Conta'#9'F'
              'DESCCCUSTO'#9'14'#9'Centro de Custo'#9'F'
              'DESCUNIDNEG'#9'11'#9'Atividade'#9'F'
              'LACDEBCRE'#9'3'#9'D/C'#9'F'
              'LACVALOR'#9'13'#9'Valor'#9'F'
              'DESCPLANOPREV'#9'20'#9'Plano'#9'F'
              'NOMEPATRO'#9'20'#9'Patro'#9'F'
              'DESCSEGREGACRITER'#9'21'#9'Critério para Segregação'#9'F'
              'LACHIST1'#9'15'#9'Histórico'#9'F'
              'LACHIST2'#9'15'#9'Histórico'#9'F'
              'LACHIST3'#9'15'#9'Histórico'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContabil
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ReadOnly = True
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
        object tbsConsultaDoc: TTabSheet
          Caption = 'Consulta Documentos'
          ImageIndex = 2
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 0
            Width = 868
            Height = 252
            Selected.Strings = (
              'RAZAOSOCIAL'#9'43'#9'Razão Social'#9'F'
              'VALOR'#9'10'#9'Valor'#9'F'
              'RECPAG'#9'1'#9'R/P'#9'F'
              'NODOCUMENTO'#9'10'#9'No. Documento'#9'F'
              'COMPLDOCUMENTO'#9'3'#9'Complemento'#9'F'
              'NUMAPGR'#9'10'#9'No. AP/GR'#9'F'
              'DATAPROGRAMADA'#9'18'#9'Data Programada'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsConsultaDoc
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1083
      Height = 164
      object lblCaixaBanco: TLabel
        Left = 5
        Top = 5
        Width = 133
        Height = 13
        Caption = 'Conta Bancária / Caixa'
      end
      object lblMoeda: TLabel
        Left = 5
        Top = 42
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object Label7: TLabel
        Left = 5
        Top = 82
        Width = 95
        Height = 13
        Caption = 'Histórico Padrão'
      end
      object lblHistorico: TLabel
        Left = 135
        Top = 82
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object lblValorMoeda: TLabel
        Left = 135
        Top = 42
        Width = 127
        Height = 13
        Caption = 'Valor em Outra Moeda'
      end
      object lblValor: TLabel
        Left = 285
        Top = 42
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object lblDocumento: TLabel
        Left = 439
        Top = 42
        Width = 130
        Height = 13
        Caption = 'Número do Documento'
      end
      object lblData: TLabel
        Left = 450
        Top = 5
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object Label8: TLabel
        Left = 240
        Top = 118
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object lblHistPad: TLabel
        Left = 5
        Top = 118
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object Label4: TLabel
        Left = 400
        Top = 118
        Width = 116
        Height = 13
        Caption = 'Data de Conciliação'
      end
      object Label5: TLabel
        Left = 536
        Top = 118
        Width = 136
        Height = 13
        Caption = 'Data de Disponibilidade'
      end
      object dblcPortador: TwwDBLookupCombo
        Left = 5
        Top = 19
        Width = 196
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODPORTADOR'
        DataSource = ds
        LookupTable = cdsPortadorConta
        LookupField = 'CODPORTADOR'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcPortadorChange
        OnExit = dblcPortadorExit
      end
      object edMoeda: TEdit
        Left = 5
        Top = 57
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object dblcHistPad: TwwDBLookupCombo
        Left = 5
        Top = 96
        Width = 111
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'HISTPADFINAN'
        DataSource = ds
        LookupTable = cdsHistPadrao
        LookupField = 'HISTPADFINAN'
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcHistPadExit
      end
      object dbeHistorico: TwwDBEdit
        Left = 133
        Top = 96
        Width = 436
        Height = 21
        DataField = 'HISTORICO'
        DataSource = ds
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrEntradaSaida: TDBRadioGroup
        Left = 225
        Top = 5
        Width = 201
        Height = 36
        Columns = 2
        DataField = 'ENTRADASAIDA'
        DataSource = ds
        Items.Strings = (
          '&Entrada'
          '&Saida')
        TabOrder = 1
        Values.Strings = (
          'E'
          'S')
        OnChange = dbrEntradaSaidaChange
      end
      object dbeDocumento: TwwDBEdit
        Left = 438
        Top = 57
        Width = 131
        Height = 21
        DataField = 'NUMCHQBORDERO'
        DataSource = ds
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDataLanc: TCMDateTimePicker
        Left = 448
        Top = 19
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALANCFINAN'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 2
        OnExit = dbeDataLancExit
      end
      object dbrConcilia: TDBRadioGroup
        Left = 580
        Top = 5
        Width = 146
        Height = 80
        Caption = 'Status Conciliação'
        DataField = 'STATUSCONCILIA'
        DataSource = ds
        Items.Strings = (
          '&Não Conciliado'
          '&Conciliado'
          'Não &Identificado'
          'Na Ca&sa')
        TabOrder = 3
        Values.Strings = (
          'N'
          'X'
          'I'
          'C')
        OnChange = dbrConciliaChange
      end
      object cbNaoContabiliza: TCheckBox
        Left = 580
        Top = 97
        Width = 130
        Height = 17
        Caption = 'Não &Contabilizar'
        TabOrder = 10
      end
      object dbeData: TDBEdit
        Left = 240
        Top = 134
        Width = 153
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'TRGDTINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 12
      end
      object dbeValorMoeda: TDBRealEdit
        Left = 133
        Top = 57
        Width = 139
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        OnEnter = dbeValorMoedaEnter
        OnExit = dbeValorMoedaExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
        DataField = 'VALOROUTRAMOEDA'
        DataSource = ds
      end
      object dbeValorCorrente: TDBRealEdit
        Left = 285
        Top = 57
        Width = 139
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = True
        DataField = 'VALORLANCFINAN'
        DataSource = ds
      end
      object dbeUsuario: TDBEdit
        Left = 5
        Top = 134
        Width = 225
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NOMEUSUARIO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 11
      end
      object dbeDataConciliacao: TDBEdit
        Left = 400
        Top = 134
        Width = 129
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DATACONCILIACAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 13
      end
      object dbeDataDisponib: TCMDateTimePicker
        Left = 536
        Top = 134
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATADISPFINANC'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 14
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1085
    object spbConciliado: TSpeedButton [0]
      Left = 580
      Top = 1
      Width = 42
      Height = 42
      Cursor = crHandPoint
      Hint = 'Executa a Regularização da Conciliação Bancária do Lançamento'
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3
        C600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C60000
        009C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C
        9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A630000
        00FFFFFFC6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C69C9A9CFF
        FFFFDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEFFFFFF9C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A630000
        00FFFFFF9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9CFF
        FFFFDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDE9C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A63CECF9C0000
        00FFFFFFC6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C69C9A9CFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A63CECF9CCECF9C0000
        00FFFFFF9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9CFF
        FFFFC6C3C6C6C3C65255529C9A9CC6C3C6C6C3C69C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A63CECF9CCECF9CCECF9C0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9A9CFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9A9C000000C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6CE9A63CECF9CCECF9CCECF9CCE9A63CECF
        9C00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6C6C3C6CE9A63CECF9CCECF9CCECF9CCE9A63CECF9CCECF
        9CFFFFFF00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000C6C3C6C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6C6C3C6CE9A63CECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCE9A
        63000000FFFFFF9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C
        9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C000000C6C3C6C6C3C6C6C3C6
        C6C3C6C6C3C6CE9A63CECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCE9A63CECF
        9C000000FFFFFF9C9A9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C9A9C000000C6C3C6C6C3C6C6C3C6
        C6C3C6CE9A63CECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCE9A63CECF9CCECF
        9C000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6C6C3C6C6C3C6
        CE9A63CECF9CCECF9CCECF9CCECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCECF
        9C000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6C6C3C6CE9A63
        CECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCE9A63CECF9CCECF9CCECF9CCECF
        9C000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6C6C3C6000000
        000000000000000000000000000000CE9A630000000000000000000000000000
        00000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C60000009C9A9C
        9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9CCE9A
        63000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6000000000000
        000000000000000000CE9A63000000000000000000000000000000CE9A630000
        00000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6000000DEDFDE
        0000FFDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDECE9A63DEDFDEDEDF
        DE000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6000000DEDFDE
        00DF00DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEFFFFFFFFFFFFFFFFFFFFFFFFCE9A
        63000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6000000DEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDECE9A63000000000000000000CE9A
        63000000FFFFFF9C9A9CFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFFFFF9C9A9C000000C6C3C6000000DEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDECE9A63DEDF
        DE000000FFFFFF9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C
        9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C000000C6C3C6000000DEDFDE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDE00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDE000000CE9A63CE9A63CECF9CCECF9CCECF9CCECF9CCECF9CCE9A63CE
        9A63CECF9CCECF9CCECF9CCE9A63CE9A63C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDECE9A63CECF9CCECF9CCECF9CCECF9CCECF9CCE9A63CE9A63CECF9CCE
        CF9CCECF9CCE9A63CE9A63C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFF
        FFC0C0C0000000CECF9CCECF9CCECF9CCECF9CCE9A63CECF9CCECF9CCECF9CCE
        9A63CE9A63C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDE000000CECF9CCECF9CCE9A63CE9A63CECF9CCECF9CCE9A63CE9A63C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDE000000CECF9CCE9A63CECF9CCECF9CCECF9CCE9A63C6C3C6C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9CFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDEDFDECE9A63CECF9CCECF9CCECF9CCE9A63CE9A63C6C3C6C6C3C6C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9C9C9A9CFFFF
        FFDEDFDE000000CECF9CCE9A63CE9A63C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000DEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDF
        DEDEDFDE000000CE9A63C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6
        C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
      ParentShowHint = False
      ShowHint = True
      OnClick = spbConciliadoClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      object sbtnEstornar: TToolbarButton97
        Left = 180
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Es&tornar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnEstornarClick
      end
      object sbtnMudaStatus: TToolbarButton97
        Left = 300
        Top = 0
        Width = 141
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Stat&us / Disponibilidade'
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000010000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
          A400000000000000000000000000000000000000000000000000000000000000
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
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FF030303030303030303
          03030303030303040403030303030303030303030303030303F8F8FF03030303
          03030303030303030303040202040303030303030303030303030303F80303F8
          FF030303030303030303030303040202020204030303030303030303030303F8
          03030303F8FF0303030303030303030304020202020202040303030303030303
          0303F8030303030303F8FF030303030303030304020202FA0202020204030303
          0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
          040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
          03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
          FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
          0303030303030303030303FA0202020403030303030303030303030303F8FF03
          03F8FF03030303030303030303030303FA020202040303030303030303030303
          0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
          03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
          030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
          0202040303030303030303030303030303F8FF03F8FF03030303030303030303
          03030303FA0202030303030303030303030303030303F8FFF803030303030303
          030303030303030303FA0303030303030303030303030303030303F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnMudaStatusClick
      end
      object sbtnCopiar: TToolbarButton97
        Left = 441
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Cop&iar'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
          7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
          37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
          FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
          7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
          3330333337FFFF7733333337333330000003333333333333377777733333FFFF
          FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
          33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
          03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
          3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
          F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
          7733333000003330000003333337777733377777733333333333333333333333
          33333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnCopiarClick
      end
    end
    object txtSituacao: TStaticText
      Left = 628
      Top = 25
      Width = 168
      Height = 17
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'Lançamento já Regularizado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 552
    Width = 1085
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 688
    Top = 128
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 422
    Top = 38
  end
  inherited ImlPadrao: TImageList
    Left = 688
    Top = 112
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyDelete = CmeCadastroApplyDelete
    Left = 498
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 376
    Top = 16
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecionar'
    Colunas.Strings = (
      'PORTADORCONTA.DESCRICAO'
      'MOVIMFINANC.DATALANCFINAN'
      'MOVIMFINANC.DATADISPFINANC'
      'MOVIMFINANC.VALORLANCFINAN'
      'MOVIMFINANC.ENTRADASAIDA'
      'MOVIMFINANC.STATUSCONCILIA'
      'MOVIMFINANC.NUMCHQBORDERO'
      '0 AS CODDOCUMENTO'
      'MOVIMFINANC.HISTORICO'
      'HISTORICOFINAN.DESCRICAO'
      'MOVIMFINANC.VALOROUTRAMOEDA'
      'MOVIMFINANC.CODLANCFINANC'
      'MODULO.NOMEMODULO'
      
        #39'PLANOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO' +
        'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'#39
      
        #39'PATROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO' +
        'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'#39)
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'N'
      'C'
      'L'
      'L')
    Descricao.Strings = (
      'Banco/Caixa'
      'Data Lançamento'
      'Data Disponibilidade'
      'Valor Moeda Corrente'
      'E/S'
      'Status Conciliação'
      'Nº Baixa'
      'Cód. Documento'
      'Histórico'
      'Histórico Padrão'
      'Valor Outra Moeda'
      'Código do Lançamento'
      'Sistema de Origem'
      'Plano Prev.'
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOVIMFINANC'
      'PORTADORCONTA'
      'HISTORICOFINAN'
      'MODULO')
    CamposChave.Strings = (
      'MOVIMFINANC.CODLANCFINANC')
    Filtro.Strings = (
      'PORTADORCONTA.CODPORTADOR=MOVIMFINANC.CODPORTADOR'
      'HISTORICOFINAN.HISTPADFINAN=MOVIMFINANC.HISTPADFINAN'
      'MODULO.IDMODULO=MOVIMFINANC.IDMODULO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '18'
      '18'
      '10'
      '1'
      '1'
      '15'
      '20'
      '60'
      '60'
      '10'
      '10'
      '50'
      '100'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0'
      '0')
    AfterOpenCds = MontaSelectAfterOpenCds
    BeforeOpenCds = MontaSelectBeforeOpenCds
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
      ''
      ''
      ''
      'SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME'
      
        'SELECT P.IDPESSOA, P.NOME FROM PATRO PT, PESSOA P WHERE PT.IDPES' +
        'SOA = P.IDPESSOA ORDER BY P.NOME'
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
      ''
      ''
      ''
      'NOME'
      'NOME'
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
      ''
      ''
      ''
      'NOME'
      'NOME'
      '')
    Left = 688
    Top = 96
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 264
    Top = 192
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 732
    Top = 46
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 128
    Top = 48
  end
  object cdsHistPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 128
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 608
    Top = 280
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 544
    Top = 296
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 208
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'IDSEGREGACRITER'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CODPROGRAMA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DESCPROGRAMA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_PATRO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NOME_PLANO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsDetAfterScroll
    Left = 552
    Top = 8
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 592
    Top = 176
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 688
    Top = 272
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 704
    Top = 184
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 712
    Top = 152
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 600
    Top = 392
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 640
    Top = 176
  end
  object cdsContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTeste'
    AfterScroll = cdsContabilAfterScroll
    Left = 672
    Top = 368
  end
  object dsContabil: TwwDataSource
    AutoEdit = False
    DataSet = cdsContabil
    Left = 672
    Top = 416
  end
  object cdsDetBackup: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 822
    Top = 10
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'select * from movimfinanc')
    Left = 680
    Top = 56
  end
  object cdsDetBack: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 600
    Top = 464
  end
  object cdsBack: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 464
  end
  object cdsContabBack: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 680
    Top = 464
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT PLATIPO,PLANOME,PLACCUST,PLASUBCONTA'
      'FROM PLANOCONTA'
      'WHERE (PLANO = :PLANO)'
      '  AND (PLAINATIVA = '#39'A'#39')'
      '  AND (PLACONTA = :PLACONTA)'
      ' '
      ' ')
    Left = 24
    Top = 464
  end
  object dsConsultaDoc: TwwDataSource
    AutoEdit = False
    DataSet = cdsConsultaDoc
    Left = 232
    Top = 72
  end
  object cdsConsultaDoc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsDetAfterScroll
    Left = 320
    Top = 64
  end
  object sqlConsultaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT U.RAZAOSOCIAL,'
      '       sum(U.VALOR) as valor,'
      '       U.RECPAG,'
      '       U.NODOCUMENTO,'
      '       U.COMPLDOCUMENTO,'
      '       U.NUMAPGR,'
      '       U.DATAPROGRAMADA'
      '  FROM (SELECT DISTINCT P.RAZAOSOCIAL,'
      '                        L.VALOR,'
      '                        D.RECPAG,'
      '                        D.NODOCUMENTO,'
      '                        D.COMPLDOCUMENTO,'
      '                        D.NUMAPGR,'
      '                        D.DATAPROGRAMADA'
      '          FROM RECBTOPAGTO RR,'
      '               DOCUMENTO   D,'
      '               PESSOA      P,'
      '               LANCTODOCUM L'
      '         WHERE (RR.CODLANCFINANC = :CODLANCFINANC)'
      '           AND (RR.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (RR.NUMLANCTO = L.NUMLANCTO)'
      '           AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '           AND (D.IDFORCLI = P.IDPESSOA)'
      '           :Filtro'
      '        UNION ALL'
      '        SELECT DISTINCT P.RAZAOSOCIAL,'
      '                        LD.VALOR,'
      '                        D.RECPAG,'
      '                        D.NODOCUMENTO,'
      '                        D.COMPLDOCUMENTO,'
      '                        D.NUMAPGR,'
      '                        D.DATAPROGRAMADA'
      '          FROM LOTEPAGTO R, LOTEXDOCUM LD, DOCUMENTO D, PESSOA P'
      '         WHERE (R.CODLANCFINANC = :CODLANCFINANC)'
      '           AND (R.NUMLOTE = LD.NUMLOTE)'
      '           AND (LD.CODDOCUMENTO = D.CODDOCUMENTO)'
      '           AND (D.IDFORCLI = P.IDPESSOA)'
      '           :Filtro'
      '        UNION ALL'
      '        SELECT DISTINCT P.RAZAOSOCIAL,'
      '                        L.VALOR,'
      '                        D.RECPAG,'
      '                        D.NODOCUMENTO,'
      '                        D.COMPLDOCUMENTO,'
      '                        D.NUMAPGR,'
      '                        D.DATAPROGRAMADA'
      '          FROM LOTEPAGTO   R,'
      '               LOTEXDOCUM  LD,'
      '               RECBTOPAGTO RP,'
      '               RECBTOPAGTO RR,'
      '               DOCUMENTO   D,'
      '               PESSOA      P,'
      '               LANCTODOCUM L'
      '         WHERE (R.CODLANCFINANC = :CODLANCFINANC)'
      '           AND (R.NUMLOTE = LD.NUMLOTE)'
      '           AND (RP.CODDOCUMENTO = LD.CODDOCUMENTO)'
      '           AND (RR.CODLANCFINANC = RP.CODLANCFINANC)'
      '           AND (RR.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (RR.NUMLANCTO = L.NUMLANCTO)'
      '           AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
      '           AND (D.IDFORCLI = P.IDPESSOA)'
      '           :Filtro'
      '           ) U'
      'WHERE'
      '           ROWNUM :Qtde_Registro'
      ' GROUP BY U.RAZAOSOCIAL,'
      '          U.RECPAG,'
      '          U.NODOCUMENTO,'
      '          U.COMPLDOCUMENTO,'
      '          U.NUMAPGR,'
      '          U.DATAPROGRAMADA'
      ' ORDER BY RAZAOSOCIAL, RECPAG, NODOCUMENTO')
    ClientDataSet = cdsConsultaDoc
    Left = 424
    Top = 112
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   LC.*,'
      '   U.NOME AS DESCUNIDNEG,'
      '   CC.NOME AS DESCCCUSTO,'
      '   P.PLANOME AS DESCPLANO,'
      '   PP.NOME AS NOMEPATRO,'
      '   PB.NOME AS DESCPLANOPREV,'
      '   S.DESCRICAO DESCSEGREGACRITER'
      'FROM'
      '   LANCAMENTO LC,'
      '   UNIDNEGOCIO U,'
      '   CENTCUST CC,'
      '   PLANOCONTA P,'
      '   SEGREGACRITER S,'
      '   PLANPREVCONTABIL PB,'
      '   PATRO PT,'
      '   PESSOA PP'
      'WHERE'
      '   (LC.PLANO = P.PLANO) AND'
      '   (LC.PLACONTA = P.PLACONTA) AND'
      '   (LC.PLNCODIGO = -1)  AND'
      '   (LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'
      '   (LC.IDEMPRESA = CC.IDEMPRESA(+)) AND'
      '   (LC.IDPESSOA = U.IDPESSOA(+)) AND'
      '   (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      '   (LC.IDSEGREGACRITER = S.IDSEGREGACRITER(+)) AND'
      '   (LC.IDPLANOPREV = PB.IDPLANOPREV(+) ) AND'
      '   (LC.IDPATRO = PT.IDPESSOA(+) ) AND'
      '   (PT.IDPESSOA = PP.IDPESSOA(+) )'
      ''
      ''
      ' ')
    Left = 341
    Top = 216
  end
  object sqlAux1: TCMSqlParams
    SQL.Strings = (
      'SELECT CODLANCFINANCE,CODLANCFINANCS'
      'FROM TRANSFFUNDOS'
      'WHERE (CODLANCFINANCE = :CODENTRADA)'
      ' OR        (CODLANCFINANCS  = :CODSAIDA)'
      ' '
      ' '
      ' ')
    Left = 104
    Top = 440
  end
  object sqlPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT P.NOME FROM RATEIOFINANC R, PLANPREVCONTABIL P'
      'WHERE R.CODLANCFINANC = :CODLANCFINANC  AND'
      '      R.IDPLANOPREV   = P.IDPLANOPREV ')
    ClientDataSet = cdsPlanPrev
    Left = 809
    Top = 88
  end
  object sqlPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT P.NOME FROM RATEIOFINANC R, PESSOA P'
      'WHERE R.CODLANCFINANC = :CODLANCFINANC AND'
      '      R.IDPATRO       = P.IDPESSOA')
    ClientDataSet = cdsPatro
    Left = 809
    Top = 168
  end
  object cdsPlanPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 809
    Top = 56
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 809
    Top = 136
  end
  object qryAux: TQuery
    DatabaseName = 'BaseDados'
    Left = 752
    Top = 176
  end
  object cdsGrupoRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 762
    Top = 236
    object cdsGrupoRateioGRRFDESCRICAO: TStringField
      DisplayLabel = 'Grupo de Rateio'
      DisplayWidth = 60
      FieldName = 'GRRFDESCRICAO'
      Size = 60
    end
    object cdsGrupoRateioIDGRUPORATEIOFLUXO: TFloatField
      FieldName = 'IDGRUPORATEIOFLUXO'
      Visible = False
    end
    object cdsGrupoRateioTIPORATEIO: TStringField
      FieldName = 'TIPORATEIO'
      Size = 1
    end
  end
  object sqlGrupoRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPORATEIOFLUXO, GRRFDESCRICAO, TIPORATEIO'
      'FROM'
      '   GRUPORATEIOFLUXO'
      'ORDER BY'
      '   GRRFDESCRICAO')
    ClientDataSet = cdsGrupoRateio
    Left = 728
    Top = 240
  end
  object cdsPadraoRateioFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 848
    Top = 232
  end
end
