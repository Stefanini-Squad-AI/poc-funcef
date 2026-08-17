inherited frmCadCliente: TfrmCadCliente
  Left = 209
  Top = 191
  Caption = 'Cliente'
  ClientHeight = 487
  ClientWidth = 772
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 401
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 762
      Height = 286
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Geral'
        'Dados Bancários'
        'Tipos de Recebimentos'
        'Impostos Agregados'
        'Tipos de Cliente')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        ''
        'GrdContaBancaria_Padrao'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 664
        Height = 227
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 656
            Height = 199
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 656
            Height = 199
            inherited pnlItemsDoc: TPanel
              Height = 197
            end
            inherited pnlFoto: TPanel
              Width = 166
              Height = 197
              inherited Bevel1: TBevel
                Height = 166
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 166
                Width = 166
                inherited btnAssociarimgPessoa: TButton
                  Left = 22
                  Top = 180
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 164
                Height = 166
                inherited imgPessoa: TDBImage
                  Left = 22
                  Top = 16
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 197
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 656
            Height = 199
            inherited grpTipoEnd: TGroupBox
              Left = 459
              Height = 199
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 656
            Height = 199
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 656
            Height = 199
          end
          inherited Panel1: TPanel
            Width = 656
            Height = 199
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 656
            Height = 199
          end
          inherited dbgContato: TwwDBGrid
            Width = 656
            Height = 199
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Geral'
          object TbsGeral: TPageControl
            Left = 0
            Top = 0
            Width = 656
            Height = 199
            ActivePage = TbsDados
            Align = alClient
            TabOrder = 0
            object TbsDados: TTabSheet
              Caption = 'Dados Gerais'
              object Bevel3: TBevel
                Left = 243
                Top = 4
                Width = 468
                Height = 145
                Shape = bsFrame
              end
              object Bevel2: TBevel
                Left = 5
                Top = 4
                Width = 235
                Height = 162
                Shape = bsFrame
              end
              object Label2: TLabel
                Left = 15
                Top = 84
                Width = 124
                Height = 13
                Caption = 'Cód. Correspondente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label3: TLabel
                Left = 15
                Top = 46
                Width = 117
                Height = 13
                Caption = 'Classificação Fiscal '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 250
                Top = 9
                Width = 96
                Height = 13
                Caption = 'Valor do Crédito:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 440
                Top = 9
                Width = 67
                Height = 13
                Caption = 'Obs Crédito'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label10: TLabel
                Left = 15
                Top = 7
                Width = 87
                Height = 13
                Caption = 'Tipo de Cliente'
              end
              object GroupBox8: TGroupBox
                Left = 5
                Top = 167
                Width = 236
                Height = 61
                Caption = 'Comissão Cartão'
                TabOrder = 0
                object Label15: TLabel
                  Left = 9
                  Top = 18
                  Width = 89
                  Height = 13
                  Caption = '% de Comissão:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label18: TLabel
                  Left = 9
                  Top = 37
                  Width = 92
                  Height = 13
                  Caption = 'Prazo de Pagto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBRealEdit1: TDBRealEdit
                  Left = 110
                  Top = 12
                  Width = 111
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,0000000')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 7
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCCOMISCARTAO'
                  DataSource = dsGeral
                end
                object DbePrazoCartao: TDBRealEdit
                  Left = 110
                  Top = 35
                  Width = 111
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '         0')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = iNumber
                  Signal = False
                  DataField = 'PRAZOCARTAO'
                  DataSource = dsGeral
                end
              end
              object dblkTipClie: TwwDBLookupCombo
                Left = 15
                Top = 23
                Width = 214
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDTIPOCLIENTE'
                DataSource = dsSubTipo
                LookupTable = qryTipClie
                LookupField = 'IDTIPOCLIENTE'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbedCodigoCli: TwwDBEdit
                Left = 15
                Top = 98
                Width = 130
                Height = 21
                DataField = 'CODCLIENTE'
                DataSource = dsSubTipo
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 15
                Top = 61
                Width = 214
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCLASFISCLIFOR'#9'20'#9'Descrição'
                  'CODREDUZIDO'#9'3'#9'Código')
                DataField = 'IDCLASFISCLIFOR'
                DataSource = dsSubTipo
                LookupTable = QryClassiFiscal
                LookupField = 'IDCLASFISCLIFOR'
                Options = [loTitles]
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object rgSitCredito: TDBRadioGroup
                Left = 250
                Top = 51
                Width = 182
                Height = 90
                Caption = ' Status do Crédito do Cliente '
                DataField = 'FLGSITCREDITO'
                DataSource = dsGeral
                Items.Strings = (
                  '&Liberado'
                  '&Bloqueado Pelo Hotel'
                  '&Bloqueado Pela Matriz')
                TabOrder = 4
                Values.Strings = (
                  'L'
                  'B'
                  'M')
              end
              object DBRealEdit3: TDBRealEdit
                Left = 249
                Top = 24
                Width = 183
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,0000000')
                TabOrder = 5
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRLIMCREDITO'
                DataSource = dsGeral
              end
              object DBMemo2: TDBMemo
                Left = 441
                Top = 25
                Width = 259
                Height = 116
                DataField = 'MOTIVOBLOQ'
                DataSource = dsGeral
                ScrollBars = ssBoth
                TabOrder = 6
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 150
                Top = 85
                Width = 77
                Height = 75
                Caption = ' Status '
                DataField = 'FLGSTATUS'
                DataSource = dsGeral
                Items.Strings = (
                  'Ativo'
                  'Inativo')
                TabOrder = 7
                Values.Strings = (
                  'A'
                  'I')
              end
              object GroupBox1: TGroupBox
                Left = 244
                Top = 152
                Width = 469
                Height = 77
                Caption = ' Promotor '
                TabOrder = 8
                object Label6: TLabel
                  Left = 357
                  Top = 21
                  Width = 89
                  Height = 13
                  Caption = '% de Comissão:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBRealEdit2: TDBRealEdit
                  Left = 357
                  Top = 38
                  Width = 106
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,0000000')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 7
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCCOMISPROMOTOR'
                  DataSource = dsGeral
                end
                object CmPromotor: TCMProcuraSubTipo
                  Left = 11
                  Top = 14
                  Width = 341
                  Height = 55
                  TabOrder = 1
                  CampoEdit = ceRazaoSocial
                  MostraMensagens = True
                  DataSource = dsGeral
                  DataField = 'IDPROMOTOR'
                  Mensagens.EmBranco = 'Promotor não pode estar em branco'
                  Mensagens.NaoExiste = 'Promotor não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  SubTipo = stPromotor
                  FiltraSubTipo = True
                end
              end
            end
            object TbsContabil: TTabSheet
              Caption = 'Integração Contábil'
              object CContabil: TCMProcuraMaskContabil
                Left = 5
                Top = 1
                Width = 227
                Height = 239
                Caption = ' Conta do Cliente'
                TabOrder = 0
                OnExit = CContabilExit
                MostraMensagens = True
                MostraDescricao = True
                DataSource = dsGeral
                DataField = 'CONTACCLIENTE'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabil2: TCMProcuraMaskContabil
                Left = 236
                Top = 125
                Width = 233
                Height = 116
                Caption = ' Conta a Crédito  '
                TabOrder = 1
                MostraMensagens = True
                MostraDescricao = True
                DataSource = dsGeral
                DataField = 'CONTACRECEITA'
                Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
                Mensagens.NaoExiste = 'Conta Contábil não existe'
                Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
                Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object CContabil1: TCMProcuraMaskContabil
                Left = 236
                Top = 2
                Width = 233
                Height = 116
                Caption = 'Conta de Adiantamento'
                TabOrder = 2
                MostraMensagens = True
                MostraDescricao = True
                DataSource = dsGeral
                DataField = 'CONTACADIANTAMENTO'
                Mensagens.EmBranco = 'Conta de Adiantamento não pode estar em branco'
                Mensagens.NaoExiste = 'Conta de Adiantamento não existe'
                Mensagens.Sintetica = 'Conta de Adiantamento não pode ser sintética'
                Mensagens.Analitica = 'Conta de Adiantamento não pode ser analítica'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = True
                AceitaTipoConta = SoAnalitica
                Plano = 0
                Status = scSoAtiva
              end
              object Panel5: TPanel
                Left = 9
                Top = 111
                Width = 217
                Height = 120
                BevelOuter = bvNone
                Caption = 'Panel5'
                TabOrder = 3
                object Label23: TLabel
                  Left = 5
                  Top = 0
                  Width = 55
                  Height = 13
                  Caption = 'Subconta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label26: TLabel
                  Left = 5
                  Top = 38
                  Width = 92
                  Height = 13
                  Caption = 'Centro de Custo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 5
                  Top = 80
                  Width = 108
                  Height = 13
                  Caption = 'Atividade / Projeto'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dblkSubconta: TwwDBLookupCombo
                  Left = 5
                  Top = 13
                  Width = 210
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'Subconta'
                    'CODSUBCONTA'#9'10'#9'Código')
                  DataField = 'CODSUBCONTA'
                  DataSource = dsGeral
                  LookupTable = qrySubConta
                  LookupField = 'CODSUBCONTA'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object dblcCCusto: TwwDBLookupCombo
                  Left = 5
                  Top = 52
                  Width = 210
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODCENTROCUSTO'#9'10'#9'Código'
                    'NOME'#9'30'#9'Descrição')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsGeral
                  LookupTable = qryccusto
                  LookupField = 'CODCENTROCUSTO'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
                object DbLcUnidNegoc: TwwDBLookupCombo
                  Left = 4
                  Top = 95
                  Width = 210
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Descrição')
                  DataField = 'UNIDNEGOC'
                  DataSource = dsGeral
                  LookupTable = QryUnidNegoc
                  LookupField = 'UNIDNEGOC'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                end
              end
            end
          end
        end
        object TbsContaBancaria: TTabSheet
          Caption = 'Dados Bancários'
          object TPanel
            Left = 0
            Top = 0
            Width = 656
            Height = 199
            Align = alClient
            TabOrder = 0
            object Label14: TLabel
              Left = 10
              Top = 6
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 11
              Top = 93
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object BtnBuscaAgencia: TSpeedButton
              Left = 108
              Top = 106
              Width = 25
              Height = 23
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              OnClick = BtnBuscaAgenciaClick
            end
            object Label9: TLabel
              Left = 138
              Top = 93
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkBanco: TwwDBLookupCombo
              Left = 10
              Top = 21
              Width = 252
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
              DataField = 'IDBANCO'
              DataSource = DsContaBancaria
              LookupTable = qryBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblkBancoCloseUp
            end
            object DbeAgencia: TwwDBEdit
              Left = 11
              Top = 108
              Width = 95
              Height = 21
              DataField = 'NUMAGENCIA'
              DataSource = DsContaBancaria
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedConta: TwwDBEdit
              Left = 138
              Top = 108
              Width = 124
              Height = 21
              DataField = 'CONTACORRENTE'
              DataSource = DsContaBancaria
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnEnter = dbedContaEnter
            end
            object RgTipoConta: TDBRadioGroup
              Left = 10
              Top = 47
              Width = 253
              Height = 43
              Caption = ' Tipo Conta '
              Columns = 3
              DataField = 'TIPOCONTA'
              DataSource = DsContaBancaria
              Items.Strings = (
                '&Corrente'
                '&Salário'
                '&Poupança')
              TabOrder = 1
              Values.Strings = (
                '1'
                '2'
                '3')
              OnClick = RgTipoContaClick
            end
            object ChbContaPref_Padrao: TDBCheckBox
              Left = 11
              Top = 147
              Width = 252
              Height = 17
              Caption = 'Conta preferencial para movimentação'
              DataField = 'FLGCONTAPREF'
              DataSource = DsContaBancaria
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GrdContaBancaria_Padrao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 656
            Height = 199
            Selected.Strings = (
              'NOMEBANCO'#9'30'#9'Banco'
              'NUMBANCO'#9'8'#9'Num.'
              'NUMAGENCIA'#9'15'#9'Agência'
              'CONTACORRENTE'#9'15'#9'Conta'
              'TIPOCONTA'#9'1'#9'Tipo'
              'FLGCONTAPREF'#9'4'#9'Pref.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsContaBancaria
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
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
        object TabSheet2: TTabSheet
          Caption = 'Tipos de Recebimentos'
          object spdDesembxForn: TSpeedButton
            Left = 356
            Top = 59
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdDesembxFornClick
          end
          object spdDesembForn: TSpeedButton
            Left = 356
            Top = 93
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdDesembFornClick
          end
          object Panel8: TPanel
            Left = 7
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Recebimento do Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgrDesembForn: TwwDBGrid
            Left = 7
            Top = 35
            Width = 343
            Height = 130
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsClixReceb
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbDesembolsoCalcCellColors
            IndicatorColor = icBlack
          end
          object Panel7: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Recebimentos'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object dbDesembolso: TwwDBGrid
            Left = 386
            Top = 35
            Width = 343
            Height = 130
            Selected.Strings = (
              'CODTIPRECDES'#9'10'#9'Código'
              'ANASINT'#9'1'#9'T'
              'DESCRICAO'#9'35'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsDesembolso
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = dbDesembolsoCalcCellColors
            IndicatorColor = icBlack
          end
        end
        object TbsImpostos: TTabSheet
          Caption = 'Impostos Agregados'
          object SbtImpDelAgreg: TSpeedButton
            Left = 356
            Top = 93
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = SbtImpDelAgregClick
          end
          object SbtImpAddAgreg: TSpeedButton
            Left = 356
            Top = 59
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = SbtImpAddAgregClick
          end
          object Panel9: TPanel
            Left = 7
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados Ao Cliente Fornecedor'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid1: TwwDBGrid
            Left = 7
            Top = 35
            Width = 343
            Height = 130
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImpAgregxForn
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
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
          object Panel10: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Impostos Agregados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object wwDBGrid2: TwwDBGrid
            Left = 386
            Top = 35
            Width = 343
            Height = 130
            Selected.Strings = (
              'DESCCUSTAGREG'#9'25'#9'Nome')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsImpAgreg
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 3
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
        object TbsTiposCliente: TTabSheet
          Caption = 'Tipos de Cliente'
          object spdFornxRamo: TSpeedButton
            Left = 356
            Top = 59
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdFornxRamoClick
          end
          object spdRamosForn: TSpeedButton
            Left = 356
            Top = 93
            Width = 25
            Height = 25
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            OnClick = spdRamosFornClick
          end
          object dbRamos: TwwDBGrid
            Left = 386
            Top = 36
            Width = 343
            Height = 130
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsTiposCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object dbFornxRamo: TwwDBGrid
            Left = 7
            Top = 36
            Width = 343
            Height = 130
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Tipo Cliente')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = DsClixTipoCli
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object PnlTitDesembAssoc: TPanel
            Left = 386
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos de Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object Panel6: TPanel
            Left = 7
            Top = 9
            Width = 343
            Height = 26
            BevelInner = bvLowered
            Caption = 'Tipos do Cliente'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited Dock973: TDock97
        Width = 754
      end
      inherited Dock974: TDock97
        Left = 668
        Height = 227
      end
    end
    inherited pnlMestre: TPanel
      Width = 762
    end
  end
  inherited Dock972: TDock97
    Width = 772
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = True
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = True
      end
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 448
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 602
      DockPos = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 435
      DockPos = 442
    end
  end
  inherited qry: TwwQuery
    Left = 471
    Top = 628
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C3630302C2031302C20313630302C20313136
      342C2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C
      2C2C2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C
      2D312C202D312C203830382C203630302C203830302C203237352C2C2C2C0D0A
      504553534F412C504553534F412C32302C2031302C203430342C203235352C2C
      2C2C2C0D0A20202032312C202D204E756D626572206F6620436F6C756D6E732C
      2C2C2C2C2C0D0A4944504553534F412C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020312C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A3D3A496450
      6573736F612C20202020362C2C2C2C2C2C0D0A464C47434C49454E54452C5045
      53534F412C20202020202020202020202020202020202020312C20202020202C
      202C2C2C0D0A20202020202C202D204E756D626572206F662043726974657269
      612C2C2C2C2C2C0D0A464C47504154524F43494E41444F52412C504553534F41
      2C20202020202020202020202020202020202020312C20202020202C202C2C2C
      0D0A20202020202C202D204E756D626572206F662043726974657269612C2C2C
      2C2C2C0D0A464C4742414E434F2C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C4753494E44
      494341544F2C504553534F412C20202020202020202020202020202020202020
      312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F66
      2043726974657269612C2C2C2C2C2C0D0A464C47524553504F4E534156454C2C
      504553534F412C20202020202020202020202020202020202020312C20202020
      202C202C2C2C0D0A20202020202C202D204E756D626572206F66204372697465
      7269612C2C2C2C2C2C0D0A464C47544552434549524F2C504553534F412C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A464C47464F524E534552562C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C4746554E43
      494F4E4152494F2C504553534F412C2020202020202020202020202020202020
      2020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A464C4745535452414E47454952
      4F2C504553534F412C20202020202020202020202020202020202020312C2020
      2020202C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269
      74657269612C2C2C2C2C2C0D0A464C474147454E4349412C504553534F412C20
      202020202020202020202020202020202020312C20202020202C202C2C2C0D0A
      20202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C
      2C0D0A464C4746554E444143414F2C504553534F412C20202020202020202020
      202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D20
      4E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C47444550
      454E44454E54452C504553534F412C2020202020202020202020202020202020
      2020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A464C47454C45474956454C2C50
      4553534F412C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A4E4F4D452C504553534F412C20202020202020202020
      202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D20
      4E756D626572206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C50
      4553534F412C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A52415A414F534F4349414C2C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A4E554D444F43554D454E544F2C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A4944444F43554D
      454E544F2C504553534F412C2020202020202020202020202020202020202031
      2C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F6620
      43726974657269612C2C2C2C2C2C0D0A454D41494C2C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A4944475255504F2C504553534F412C20202020202020202020202020202020
      202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572
      206F662043726974657269612C2C2C2C2C2C0D0A20202020202C202D204E756D
      626572206F66204A6F696E732C2C2C2C2C2C0D0A0D0A2253454C454354205374
      6174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C45435409504553534F41
      2E224944504553534F4122202C200D0A09504553534F412E22464C47434C4945
      4E544522202C200D0A09504553534F412E22464C47504154524F43494E41444F
      524122202C200D0A09504553534F412E22464C4742414E434F22202C200D0A09
      504553534F412E22464C4753494E44494341544F22202C200D0A09504553534F
      412E22464C47524553504F4E534156454C22202C200D0A09504553534F412E22
      464C47544552434549524F22202C200D0A09504553534F412E22464C47464F52
      4E5345525622202C200D0A09504553534F412E22464C4746554E43494F4E4152
      494F22202C200D0A09504553534F412E22464C4745535452414E474549524F22
      202C200D0A09504553534F412E22464C474147454E43494122202C200D0A0950
      4553534F412E22464C4746554E444143414F22202C200D0A09504553534F412E
      22464C47444550454E44454E544522202C200D0A09504553534F412E22464C47
      454C45474956454C22202C20504553534F412E224E4F4D4522202C200D0A0950
      4553534F412E225449504F22202C20504553534F412E2252415A414F534F4349
      414C22202C200D0A09504553534F412E224E554D444F43554D454E544F22202C
      200D0A09504553534F412E224944444F43554D454E544F22202C20504553534F
      412E22454D41494C22202C200D0A095045532C2C2C2C2C2C2C0D0A534F412E22
      4944475255504F220D0A46524F4D0922504553534F412220504553534F410D0A
      5748455245092820504553534F412E224944504553534F4122203D3A49645065
      73736F6120292C2C2C2C2C2C2C0D0A}
  end
  inherited dsDet: TwwDataSource
    Left = 264
    Top = 612
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 721
    Top = 612
  end
  inherited upd: TUpdateSQL
    Left = 522
    Top = 612
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO'
      'CLIENTEPESS.CODCLIENTE'
      'CLIENTEPESS.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Cliente'
      'Razão Social'
      'Número do Documento'
      'Código Correspondente'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'CLIENTEPESS')
    CamposChave.Strings = (
      'CLIENTEPESS.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '10'
      '10')
    Left = 363
    Top = 612
  end
  inherited ds: TwwDataSource
    Left = 622
    Top = 612
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 428
    Top = 66
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update CLIENTEPESS'
      'set'
      '  CODCLIENTE = :CODCLIENTE,'
      '  NUMEROCARTAO = :NUMEROCARTAO,'
      '  BLOQUEIO = :BLOQUEIO,'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE,'
      '  IDCLASFISCLIFOR = :IDCLASFISCLIFOR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into CLIENTEPESS'
      
        '  (IDPESSOA, CODCLIENTE, NUMEROCARTAO, BLOQUEIO, IDTIPOCLIENTE, ' +
        'IDCLASFISCLIFOR)'
      'values'
      
        '  (:IDPESSOA, :CODCLIENTE, :NUMEROCARTAO, :BLOQUEIO, :IDTIPOCLIE' +
        'NTE, :IDCLASFISCLIFOR)')
    DeleteSQL.Strings = (
      'delete from CLIENTEPESS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 502
    Top = 612
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA,CODCLIENTE,NUMEROCARTAO,BLOQUEIO,'
      '               IDTIPOCLIENTE, IDCLASFISCLIFOR '
      'FROM CLIENTEPESS'
      'WHERE ( IDPESSOA =:IdPessoa )')
    Left = 761
    Top = 612
    object qrySubTipoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CLIENTEPESS.IDPESSOA'
    end
    object qrySubTipoCODCLIENTE: TStringField
      FieldName = 'CODCLIENTE'
      Origin = 'CLIENTEPESS.CODCLIENTE'
      EditMask = 'aaaaa-aa;1; '
      Size = 10
    end
    object qrySubTipoNUMEROCARTAO: TStringField
      FieldName = 'NUMEROCARTAO'
      Origin = 'CLIENTEPESS.NUMEROCARTAO'
      Size = 16
    end
    object qrySubTipoBLOQUEIO: TStringField
      FieldName = 'BLOQUEIO'
      Origin = 'CLIENTEPESS.BLOQUEIO'
      Size = 1
    end
    object qrySubTipoIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'CLIENTEPESS.IDTIPOCLIENTE'
    end
    object qrySubTipoIDCLASFISCLIFOR: TFloatField
      FieldName = 'IDCLASFISCLIFOR'
      Origin = 'CLIENTEPESS.IDCLASFISCLIFOR'
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 642
    Top = 612
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 572
    Top = 661
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 609
    Top = 661
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 144
    Top = 612
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2032302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203236312C2C2C2C0D0A5045
      53534F414649534943412C504553534F414649534943412C32302C2032302C20
      3133302C203236352C2C2C2C2C0D0A20202031332C202D204E756D626572206F
      6620436F6C756D6E732C2C2C2C2C2C0D0A4944504553534F412C504553534F41
      4649534943412C20202020202020202020202020202020202020312C20202020
      202C202C2C2C0D0A20202020312C202D204E756D626572206F66204372697465
      7269612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C
      2C0D0A434F4445535441444F2C504553534F414649534943412C202020202020
      20202020202020202020202020312C20202020202C202C2C2C0D0A2020202020
      2C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4944
      504149532C504553534F414649534943412C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A4944464F4E5452454352
      2C504553534F414649534943412C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A49444752494E5354522C50455353
      4F414649534943412C20202020202020202020202020202020202020312C2020
      2020202C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269
      74657269612C2C2C2C2C2C0D0A494450524F464953532C504553534F41464953
      4943412C20202020202020202020202020202020202020312C20202020202C20
      2C2C2C0D0A20202020202C202D204E756D626572206F66204372697465726961
      2C2C2C2C2C2C0D0A4E4F4D455041492C504553534F414649534943412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A4E4F4D454D41452C504553534F414649534943412C20202020202020202020
      202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D20
      4E756D626572206F662043726974657269612C2C2C2C2C2C0D0A444154414D4F
      5254452C504553534F414649534943412C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A444154414E4153432C5045
      53534F414649534943412C20202020202020202020202020202020202020312C
      20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F662043
      726974657269612C2C2C2C2C2C0D0A5345584F2C504553534F41464953494341
      2C20202020202020202020202020202020202020312C20202020202C202C2C2C
      0D0A20202020202C202D204E756D626572206F662043726974657269612C2C2C
      2C2C2C0D0A5449504F53414E472C504553534F414649534943412C2020202020
      2020202020202020202020202020312C20202020202C202C2C2C0D0A20202020
      202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A45
      5354434956494C2C504553534F414649534943412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A20202020202C20
      2D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D0A0D0A2253454C45
      43542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C4543540950
      4553534F414649534943412E224944504553534F4122202C200D0A0950455353
      4F414649534943412E22434F4445535441444F22202C200D0A09504553534F41
      4649534943412E2249445041495322202C200D0A09504553534F414649534943
      412E224944464F4E545245435222202C200D0A09504553534F41464953494341
      2E2249444752494E53545222202C200D0A09504553534F414649534943412E22
      494450524F4649535322202C200D0A09504553534F414649534943412E224E4F
      4D4550414922202C200D0A09504553534F414649534943412E224E4F4D454D41
      4522202C200D0A09504553534F414649534943412E22444154414D4F52544522
      202C200D0A09504553534F414649534943412E22444154414E41534322202C20
      0D0A09504553534F414649534943412E225345584F22202C200D0A0950455353
      4F414649534943412E225449504F53414E4722202C200D0A09504553534F4146
      49534943412E22455354434956494C220D0A46524F4D0922504553534F414649
      534943412220504553534F414649534943410D0A574845524509282050455353
      4F414649534943412E224944504553534F4122203D3A4964506573736F612029
      2C2C2C2C2C2C2C0D0A}
  end
  inherited ImageList1: TImageList
    Left = 701
    Top = 612
  end
  inherited qryTelefone: TwwQuery
    Left = 443
    Top = 612
  end
  inherited updTelefone: TUpdateSQL
    Left = 602
    Top = 612
  end
  inherited dsTelefone: TwwDataSource
    Left = 423
    Top = 612
  end
  inherited dsEndereco: TwwDataSource
    Left = 681
    Top = 612
  end
  inherited updEndereco: TUpdateSQL
    Left = 542
    Top = 612
  end
  inherited qryEndereco: TwwQuery
    Left = 224
    Top = 612
  end
  inherited qryContato: TwwQuery
    Left = 244
    Top = 612
  end
  inherited updContato: TUpdateSQL
    Left = 284
    Top = 612
  end
  inherited dsContato: TwwDataSource
    Left = 383
    Top = 612
  end
  inherited qryRamal: TwwQuery
    Left = 740
    Top = 661
  end
  inherited updRamal: TUpdateSQL
    Left = 658
    Top = 661
  end
  inherited dsRamal: TwwDataSource
    Left = 768
    Top = 661
  end
  inherited qryDocumento: TwwQuery
    Left = 773
    Top = 612
  end
  inherited dsDocumento: TwwDataSource
    Left = 106
    Top = 661
  end
  inherited updDocumento: TUpdateSQL
    Left = 437
    Top = 661
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 65
    Top = 612
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 85
    Top = 612
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpOpcional
    SubTipo = stCliente
    UsaPessoaFisica = True
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 184
    Top = 612
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 741
    Top = 612
  end
  inherited qryImagem: TwwQuery
    Left = 483
    Top = 612
  end
  inherited updImagem: TUpdateSQL
    Left = 562
    Top = 612
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 354
    Top = 661
  end
  inherited qryImagensDoc: TwwQuery
    Left = 685
    Top = 661
  end
  inherited dsImagem: TwwDataSource
    Left = 582
    Top = 612
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 713
    Top = 661
  end
  inherited qryTipoDoc: TwwQuery
    Left = 51
    Top = 661
  end
  inherited MSGrupo: TMontaSelect
    Left = 662
    Top = 612
  end
  inherited qryEstado: TwwQuery
    Left = 124
    Top = 612
  end
  inherited qryCidade: TwwQuery
    Left = 25
    Top = 612
  end
  inherited dsCidade: TwwDataSource
    Left = 45
    Top = 612
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 793
    Top = 613
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 791
    Top = 660
  end
  object qryGeral: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFORCLI,IDPESSOA,CODSUBCONTA,CODCENTROCUSTO,'
      '       PLANO,CONTACADIANTAMENTO,CONTACRECEITA, UNIDNEGOC,'
      '       CONTACCLIENTE, PERCCOMISCARTAO, PRAZOCARTAO, IDPROMOTOR,'
      
        '       PERCCOMISPROMOTOR, FLGSITCREDITO, VLRLIMCREDITO, MOTIVOBL' +
        'OQ, FLGSTATUS'
      'FROM   EMPRESACLIENTE'
      'WHERE ( IDPESSOA =:IdPessoa ) AND (IDFORCLI =:IdFornCli)')
    UpdateObject = updGeral
    ValidateWithMask = True
    Left = 548
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IdFornCli'
        ParamType = ptUnknown
      end>
    object qryGeralIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'EMPRESAFORN.IDFORCLI'
    end
    object qryGeralIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'EMPRESAFORN.IDPESSOA'
    end
    object qryGeralCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESAFORN.CODSUBCONTA'
    end
    object qryGeralPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'EMPRESAFORN.PLANO'
    end
    object qryGeralCONTACRECEITA: TStringField
      FieldName = 'CONTACRECEITA'
      Origin = 'EMPRESACLIENTE.IDFORCLI'
      Size = 18
    end
    object qryGeralCONTACCLIENTE: TStringField
      FieldName = 'CONTACCLIENTE'
      Origin = 'EMPRESACLIENTE.IDPESSOA'
      Size = 18
    end
    object qryGeralPERCCOMISCARTAO: TFloatField
      DisplayWidth = 17
      FieldName = 'PERCCOMISCARTAO'
      Origin = 'EMPRESACLIENTE.IDFORCLI'
    end
    object qryGeralCONTACADIANTAMENTO: TStringField
      FieldName = 'CONTACADIANTAMENTO'
      Origin = 'EMPRESAFORN.CONTACADIANTAMENTO'
      Size = 18
    end
    object qryGeralPRAZOCARTAO: TFloatField
      FieldName = 'PRAZOCARTAO'
      Origin = 'EMPRESACLIENTE.IDPESSOA'
    end
    object qryGeralCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'EMPRESACLIENTE.CODCENTROCUSTO'
      Size = 10
    end
    object qryGeralIDPROMOTOR: TFloatField
      FieldName = 'IDPROMOTOR'
      Origin = 'EMPRESACLIENTE.IDPROMOTOR'
    end
    object qryGeralPERCCOMISPROMOTOR: TFloatField
      FieldName = 'PERCCOMISPROMOTOR'
      Origin = 'EMPRESACLIENTE.PERCCOMISPROMOTOR'
    end
    object qryGeralUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'EMPRESACLIENTE.UNIDNEGOC'
    end
    object qryGeralFLGSITCREDITO: TStringField
      FieldName = 'FLGSITCREDITO'
      Origin = 'EMPRESACLIENTE.FLGSITCREDITO'
      Size = 1
    end
    object qryGeralVLRLIMCREDITO: TFloatField
      FieldName = 'VLRLIMCREDITO'
      Origin = 'EMPRESACLIENTE.VLRLIMCREDITO'
    end
    object qryGeralMOTIVOBLOQ: TMemoField
      FieldName = 'MOTIVOBLOQ'
      Origin = 'EMPRESACLIENTE.MOTIVOBLOQ'
      BlobType = ftMemo
      Size = 1000
    end
    object qryGeralFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'EMPRESACLIENTE.FLGSTATUS'
      Size = 1
    end
  end
  object updGeral: TUpdateSQL
    ModifySQL.Strings = (
      'update EMPRESACLIENTE'
      'set'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLANO = :PLANO,'
      '  CONTACADIANTAMENTO = :CONTACADIANTAMENTO,'
      '  CONTACRECEITA = :CONTACRECEITA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CONTACCLIENTE = :CONTACCLIENTE,'
      '  PERCCOMISCARTAO = :PERCCOMISCARTAO,'
      '  PRAZOCARTAO = :PRAZOCARTAO,'
      '  IDPROMOTOR = :IDPROMOTOR,'
      '  PERCCOMISPROMOTOR = :PERCCOMISPROMOTOR,'
      '  FLGSITCREDITO = :FLGSITCREDITO,'
      '  VLRLIMCREDITO = :VLRLIMCREDITO,'
      '  MOTIVOBLOQ = :MOTIVOBLOQ,'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into EMPRESACLIENTE'
      
        '  (IDFORCLI, IDPESSOA, CODSUBCONTA, CODCENTROCUSTO, PLANO, CONTA' +
        'CADIANTAMENTO, '
      
        '   CONTACRECEITA, UNIDNEGOC, CONTACCLIENTE, PERCCOMISCARTAO, PRA' +
        'ZOCARTAO, '
      
        '   IDPROMOTOR, PERCCOMISPROMOTOR, FLGSITCREDITO, VLRLIMCREDITO, ' +
        'MOTIVOBLOQ, '
      '   FLGSTATUS)'
      'values'
      
        '  (:IDFORCLI, :IDPESSOA, :CODSUBCONTA, :CODCENTROCUSTO, :PLANO, ' +
        ':CONTACADIANTAMENTO, '
      
        '   :CONTACRECEITA, :UNIDNEGOC, :CONTACCLIENTE, :PERCCOMISCARTAO,' +
        ' :PRAZOCARTAO, '
      
        '   :IDPROMOTOR, :PERCCOMISPROMOTOR, :FLGSITCREDITO, :VLRLIMCREDI' +
        'TO, :MOTIVOBLOQ, '
      '   :FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from EMPRESACLIENTE'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 467
    Top = 614
  end
  object dsGeral: TwwDataSource
    AutoEdit = False
    DataSet = qryGeral
    Left = 630
    Top = 661
  end
  object qryTipClie: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCLIENTE, DESCRICAO FROM TIPOCLIENTE'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 443
    Top = 612
    object qryTipClieDESCRICAO: TStringField
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object qryTipClieIDTIPOCLIENTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'TIPOCLIENTE.IDTIPOCLIENTE'
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA, NOMESUBCONTA FROM SUBCONTA'
      'WHERE IDPESSOA = :PIDPESSOA'
      'ORDER BY  NOMESUBCONTA')
    ValidateWithMask = True
    Left = 327
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'Subconta'
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
  end
  object qryccusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select CODCENTROCUSTO, NOME from centcust')
    ValidateWithMask = True
    Left = 23
    Top = 661
    object qryccustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryccustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object QryEmpresaVh: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseVh'
    SQL.Strings = (
      'SELECT '
      'COD_EMPRESA, NOME_FANTASIA, RAZAO_SOCIAL, CGC, CPF, EMAIL, '
      'ENDERECO,  BAIRRO, CIDADE, CEP, PAIS, ESTADO, DDI, DDD, '
      'TELEFONE1, CONTATO1, RAMAL1, CLIENTE'
      'FROM EMPRESA WHERE UPPER(RTRIM(COD_EMPRESA)) = :PCODEMPRESA')
    UpdateObject = UpEmpresaVh
    ValidateWithMask = True
    Left = 409
    Top = 661
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object UpEmpresaVh: TUpdateSQL
    ModifySQL.Strings = (
      'update EMPRESA'
      'set'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  RAZAO_SOCIAL = :RAZAO_SOCIAL,'
      '  CGC = :CGC,'
      '  CPF = :CPF,'
      '  EMAIL = :EMAIL,'
      '  ENDERECO = :ENDERECO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CEP = :CEP,'
      '  PAIS = :PAIS,'
      '  ESTADO = :ESTADO,'
      '  DDI = :DDI,'
      '  DDD = :DDD,'
      '  TELEFONE1 = :TELEFONE1,'
      '  CONTATO1 = :CONTATO1,'
      '  RAMAL1 = :RAMAL1,'
      '  CLIENTE = :CLIENTE'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    InsertSQL.Strings = (
      'insert into EMPRESA'
      '  (COD_EMPRESA, NOME_FANTASIA, RAZAO_SOCIAL, CGC, CPF, EMAIL, '
      'ENDERECO, '
      
        '   BAIRRO, CIDADE, CEP, PAIS, ESTADO, DDI, DDD, TELEFONE1, CONTA' +
        'TO1, '
      'RAMAL1, '
      '   CLIENTE)'
      'values'
      
        '  (:COD_EMPRESA, :NOME_FANTASIA, :RAZAO_SOCIAL, :CGC, :CPF, :EMA' +
        'IL, '
      ':ENDERECO, '
      
        '   :BAIRRO, :CIDADE, :CEP, :PAIS, :ESTADO, :DDI, :DDD, :TELEFONE' +
        '1, '
      ':CONTATO1, '
      '   :RAMAL1, :CLIENTE)')
    DeleteSQL.Strings = (
      'delete from EMPRESA'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    Left = 382
    Top = 661
  end
  object dbVH: TCMDatabase
    DatabaseName = 'BaseVh'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=CMFRONT'
      'USER NAME=CMF'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=TRUE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=MARCAO')
    SessionName = 'Default'
    Left = 164
    Top = 612
  end
  object QryEmpresaVhModelo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'COD_EMPRESA, NOME_FANTASIA, RAZAO_SOCIAL, CGC, CPF, EMAIL,'
      'ENDERECO,  BAIRRO, CIDADE, CEP, COD_PAIS, COD_ESTADO, DDI, DDD,'
      'TELEFONE1, CONTATO1, RAMAL1, CLIENTE'
      'FROM EMPRESA'
      'WHERE UPPER(RTRIM(COD_EMPRESA)) = :PCODEMPRESA'
      '')
    UpdateObject = UpdQryEmpresaVhModelo
    ValidateWithMask = True
    Left = 464
    Top = 661
    ParamData = <
      item
        DataType = ftString
        Name = 'PCODEMPRESA'
        ParamType = ptUnknown
      end>
    object QryEmpresaVhModeloCOD_EMPRESA: TStringField
      FieldName = 'COD_EMPRESA'
      Origin = 'EMPRESA.COD_EMPRESA'
      Size = 8
    end
    object QryEmpresaVhModeloNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'EMPRESA.NOME_FANTASIA'
    end
    object QryEmpresaVhModeloRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'EMPRESA.RAZAO_SOCIAL'
      Size = 45
    end
    object QryEmpresaVhModeloCGC: TStringField
      FieldName = 'CGC'
      Origin = 'EMPRESA.CGC'
      Size = 19
    end
    object QryEmpresaVhModeloCPF: TStringField
      FieldName = 'CPF'
      Origin = 'EMPRESA.CPF'
      Size = 14
    end
    object QryEmpresaVhModeloEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMPRESA.EMAIL'
      Size = 30
    end
    object QryEmpresaVhModeloENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'EMPRESA.ENDERECO'
      Size = 50
    end
    object QryEmpresaVhModeloBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'EMPRESA.BAIRRO'
    end
    object QryEmpresaVhModeloCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'EMPRESA.CIDADE'
    end
    object QryEmpresaVhModeloCEP: TStringField
      FieldName = 'CEP'
      Origin = 'EMPRESA.CEP'
      Size = 9
    end
    object QryEmpresaVhModeloCOD_PAIS: TStringField
      FieldName = 'COD_PAIS'
      Origin = 'EMPRESA.COD_PAIS'
      Size = 3
    end
    object QryEmpresaVhModeloCOD_ESTADO: TStringField
      FieldName = 'COD_ESTADO'
      Origin = 'EMPRESA.COD_ESTADO'
      Size = 2
    end
    object QryEmpresaVhModeloDDI: TStringField
      FieldName = 'DDI'
      Origin = 'EMPRESA.DDI'
      Size = 3
    end
    object QryEmpresaVhModeloDDD: TStringField
      FieldName = 'DDD'
      Origin = 'EMPRESA.DDD'
      Size = 4
    end
    object QryEmpresaVhModeloTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
      Origin = 'EMPRESA.TELEFONE1'
      Size = 9
    end
    object QryEmpresaVhModeloCONTATO1: TStringField
      FieldName = 'CONTATO1'
      Origin = 'EMPRESA.CONTATO1'
      Size = 25
    end
    object QryEmpresaVhModeloRAMAL1: TStringField
      FieldName = 'RAMAL1'
      Origin = 'EMPRESA.RAMAL1'
      Size = 4
    end
    object QryEmpresaVhModeloCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'EMPRESA.CLIENTE'
      Size = 5
    end
  end
  object UpdQryEmpresaVhModelo: TUpdateSQL
    ModifySQL.Strings = (
      'update EMPRESA'
      'set'
      '  COD_EMPRESA = :COD_EMPRESA,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  RAZAO_SOCIAL = :RAZAO_SOCIAL,'
      '  CGC = :CGC,'
      '  CPF = :CPF,'
      '  EMAIL = :EMAIL,'
      '  ENDERECO = :ENDERECO,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CEP = :CEP,'
      '  COD_PAIS = :COD_PAIS,'
      '  COD_ESTADO = :COD_ESTADO,'
      '  DDI = :DDI,'
      '  DDD = :DDD,'
      '  TELEFONE1 = :TELEFONE1,'
      '  CONTATO1 = :CONTATO1,'
      '  RAMAL1 = :RAMAL1,'
      '  CLIENTE = :CLIENTE'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    InsertSQL.Strings = (
      'insert into EMPRESA'
      
        '  (COD_EMPRESA, NOME_FANTASIA, RAZAO_SOCIAL, CGC, CPF, EMAIL, EN' +
        'DERECO, '
      
        '   BAIRRO, CIDADE, CEP, COD_PAIS, COD_ESTADO, DDI, DDD, TELEFONE' +
        '1, CONTATO1, '
      '   RAMAL1, CLIENTE)'
      'values'
      
        '  (:COD_EMPRESA, :NOME_FANTASIA, :RAZAO_SOCIAL, :CGC, :CPF, :EMA' +
        'IL, :ENDERECO, '
      
        '   :BAIRRO, :CIDADE, :CEP, :COD_PAIS, :COD_ESTADO, :DDI, :DDD, :' +
        'TELEFONE1, '
      '   :CONTATO1, :RAMAL1, :CLIENTE)')
    DeleteSQL.Strings = (
      'delete from EMPRESA'
      'where'
      '  COD_EMPRESA = :OLD_COD_EMPRESA')
    Left = 492
    Top = 661
  end
  object DsFront: TwwDataSource
    Left = 204
    Top = 612
  end
  object qryDesembolso: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT '
      '   CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   (RECPAG = '#39'R'#39') AND'
      '   (IDPESSOA = :PIDEMPRESA) AND'
      '   (CODTIPRECDES NOT IN'
      '    (SELECT'
      '       CODTIPRECDES'
      '     FROM'
      '       CLIXRECEB'
      '     WHERE'
      '       (RECPAG = '#39'R'#39') AND'
      '       (IDEMPRESA = :PIDEMPRESA) AND'
      '       (IDPESSOA  = :PIDPESSOA)))'
      'ORDER BY '
      '   CODTIPRECDES, ANASINT')
    UpdateObject = updDesembolso
    ValidateWithMask = True
    Left = 343
    Top = 612
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDesembolsoCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryDesembolsoANASINT: TStringField
      DisplayLabel = 'T'
      DisplayWidth = 1
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryDesembolsoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryDesembolsoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
    object qryDesembolsoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
      Visible = False
    end
  end
  object dsDesembolso: TwwDataSource
    AutoEdit = False
    DataSet = qryDesembolso
    Left = 323
    Top = 612
  end
  object updDesembolso: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORECEBDESEMB'
      'set'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ANASINT = :ANASINT,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  PLACONTACREDITO = :PLACONTACREDITO,'
      '  FRACAOIDEALTOTAL = :FRACAOIDEALTOTAL'
      'where'
      '  RTRIM(CODTIPRECDES) = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TIPORECEBDESEMB'
      
        '  (CODTIPRECDES, RECPAG, IDPESSOA, PLANO, PLACONTA, IDUSUARIOINC' +
        'LUSAO, '
      
        '   DESCRICAO, ANASINT, TRGDTINCLUSAO, TRGUSERINCLUSAO, PLACONTAC' +
        'REDITO, '
      '   FRACAOIDEALTOTAL)'
      'values'
      
        '  (:CODTIPRECDES, :RECPAG, :IDPESSOA, :PLANO, :PLACONTA, :IDUSUA' +
        'RIOINCLUSAO, '
      
        '   :DESCRICAO, :ANASINT, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :PLAC' +
        'ONTACREDITO, '
      '   :FRACAOIDEALTOTAL)')
    DeleteSQL.Strings = (
      'delete from TIPORECEBDESEMB'
      'where'
      '  RTRIM(CODTIPRECDES) = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 303
    Top = 612
  end
  object qryClixReceb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT '
      
        '   DS.IDCLIXRECEB,DS.CODTIPRECDES,DS.RECPAG,DS.IDPESSOA,DS.IDEMP' +
        'RESA,TP.DESCRICAO,TP.ANASINT'
      'FROM '
      '   CLIXRECEB DS,TIPORECEBDESEMB TP'
      'WHERE  '
      '    (DS.RECPAG = '#39'R'#39') AND '
      '    (DS.IDEMPRESA = :PIDEMPRESA) AND'
      '    (DS.IDPESSOA = :PIDPESSOA)  AND '
      '    (TP.RECPAG = DS.RECPAG) AND '
      '    (TP.IDPESSOA = DS.IDEMPRESA) AND '
      '    (DS.CODTIPRECDES = TP.CODTIPRECDES)'
      'ORDER BY DS.CODTIPRECDES, TP.ANASINT')
    UpdateObject = UpdClixReceb
    ValidateWithMask = True
    Left = 299
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryClixRecebCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPRECDES'
      Origin = 'CLIXRECEB.CODTIPRECDES'
      Size = 15
    end
    object qryClixRecebANASINT: TStringField
      DisplayLabel = 'T'
      DisplayWidth = 1
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryClixRecebDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryClixRecebIDCLIXRECEB: TFloatField
      FieldName = 'IDCLIXRECEB'
      Origin = 'CLIXRECEB.IDCLIXRECEB'
      Visible = False
    end
    object qryClixRecebRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'CLIXRECEB.RECPAG'
      Visible = False
      Size = 1
    end
    object qryClixRecebIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CLIXRECEB.IDPESSOA'
      Visible = False
    end
    object qryClixRecebIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'CLIXRECEB.IDEMPRESA'
      Visible = False
    end
  end
  object DsClixReceb: TwwDataSource
    AutoEdit = False
    DataSet = qryClixReceb
    Left = 244
    Top = 661
  end
  object UpdClixReceb: TUpdateSQL
    ModifySQL.Strings = (
      'update CLIXRECEB'
      'set'
      '  IDCLIXRECEB = :IDCLIXRECEB,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES'
      'where'
      '  IDCLIXRECEB = :OLD_IDCLIXRECEB')
    InsertSQL.Strings = (
      'insert into CLIXRECEB'
      '  (IDCLIXRECEB, IDPESSOA, IDEMPRESA, RECPAG, CODTIPRECDES)'
      'values'
      '  (:IDCLIXRECEB, :IDPESSOA, :IDEMPRESA, :RECPAG, :CODTIPRECDES)')
    DeleteSQL.Strings = (
      'delete from CLIXRECEB'
      'where'
      '  IDCLIXRECEB = :OLD_IDCLIXRECEB')
    Left = 271
    Top = 661
  end
  object DbAccess: TCMDatabase
    DatabaseName = 'BaseAcces'
    DriverName = 'MSACCESS'
    LoginPrompt = False
    SessionName = 'Default'
    TransIsolation = tiDirtyRead
    Left = 105
    Top = 612
  end
  object QryAccess: TwwQuery
    AutoCalcFields = False
    DatabaseName = 'BaseAcces'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      
        '  IDHOTEL,COD_EMPRESA, NOME_FANTASIA, RAZAO_SOCIAL, CGC, CPF, EM' +
        'AIL, '
      '  ENDERECO,  BAIRRO, CIDADE, CEP, PAIS, ESTADO, DDI, DDD, '
      '  TELEFONE1, CONTATO1, RAMAL1, CLIENTE'
      'FROM '
      '  EMPRESA '
      'WHERE '
      '  COD_EMPRESA = :COD_EMPRESA AND'
      '  IDHOTEL = :IDHOTEL')
    ValidateWithMask = True
    Left = 78
    Top = 661
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_EMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
  end
  object qryClixTipoCli: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '  X.IDPESSOA, X.IDTIPOCLIENTE, T.DESCRICAO'
      'FROM'
      '  CLIXTIPOCLI X, TIPOCLIENTE T'
      'WHERE'
      '  (T.IDTIPOCLIENTE = X.IDTIPOCLIENTE) AND'
      '  (X.IDPESSOA = :IDPESSOA)'
      '')
    UpdateObject = UpdClixTipoCli
    ValidateWithMask = True
    Left = 133
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryClixTipoCliDESCRICAO: TStringField
      DisplayLabel = 'Tipo Cliente'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPOCLIENTE.DESCRICAO'
      Size = 40
    end
    object qryClixTipoCliIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CLIXTIPOCLI.IDPESSOA'
      Visible = False
    end
    object qryClixTipoCliIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Origin = 'CLIXTIPOCLI.IDTIPOCLIENTE'
      Visible = False
    end
  end
  object DsClixTipoCli: TwwDataSource
    AutoEdit = False
    DataSet = qryClixTipoCli
    Left = 161
    Top = 661
  end
  object UpdClixTipoCli: TUpdateSQL
    ModifySQL.Strings = (
      'update CLIXTIPOCLI'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    InsertSQL.Strings = (
      'insert into CLIXTIPOCLI'
      '  (IDPESSOA, IDTIPOCLIENTE)'
      'values'
      '  (:IDPESSOA, :IDTIPOCLIENTE)')
    DeleteSQL.Strings = (
      'delete from CLIXTIPOCLI'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    Left = 189
    Top = 661
  end
  object QryTiposCli: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '  IDTIPOCLIENTE, DESCRICAO'
      'FROM'
      '  TIPOCLIENTE'
      'WHERE'
      '  (IDTIPOCLIENTE NOT IN'
      
        '   (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = :IDPE' +
        'SSOA))'
      '')
    UpdateObject = UpdTiposCli
    ValidateWithMask = True
    Left = 520
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryTiposCliDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object QryTiposCliIDTIPOCLIENTE: TFloatField
      FieldName = 'IDTIPOCLIENTE'
      Visible = False
    end
  end
  object DsTiposCli: TwwDataSource
    AutoEdit = False
    DataSet = QryTiposCli
    Left = 571
    Top = 661
  end
  object UpdTiposCli: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCLIENTE'
      'set'
      '  IDTIPOCLIENTE = :IDTIPOCLIENTE,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    InsertSQL.Strings = (
      'insert into TIPOCLIENTE'
      '  (IDTIPOCLIENTE, DESCRICAO)'
      'values'
      '  (:IDTIPOCLIENTE, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOCLIENTE'
      'where'
      '  IDTIPOCLIENTE = :OLD_IDTIPOCLIENTE')
    Left = 599
    Top = 661
  end
  object QryClassiFiscal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCLASFISCLIFOR, DESCCLASFISCLIFOR, CODREDUZIDO'
      'FROM'
      '  CLASFISCLIFOR'
      'ORDER BY'
      '  DESCCLASFISCLIFOR, CODREDUZIDO')
    ValidateWithMask = True
    Left = 409
    Top = 615
    object QryClassiFiscalCODREDUZIDO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 3
      FieldName = 'CODREDUZIDO'
      Origin = 'CLASFISCLIFOR.CODREDUZIDO'
      Size = 3
    end
    object QryClassiFiscalIDCLASFISCLIFOR: TFloatField
      FieldName = 'IDCLASFISCLIFOR'
      Origin = 'CLASFISCLIFOR.IDCLASFISCLIFOR'
      Visible = False
    end
    object QryClassiFiscalDESCCLASFISCLIFOR: TStringField
      FieldName = 'DESCCLASFISCLIFOR'
      Origin = '"CM.CLASFISCLIFOR".DESCCLASFISCLIFOR'
      Size = 60
    end
  end
  object DsImpAgregxForn: TwwDataSource
    AutoEdit = False
    DataSet = QryImpAgregxForn
    Left = 221
    Top = 613
  end
  object UpdImpAgregxForn: TUpdateSQL
    ModifySQL.Strings = (
      'update FORCLIXAGREG'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  RECPAG = :RECPAG'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG and'
      '  RECPAG = :OLD_RECPAG')
    InsertSQL.Strings = (
      'insert into FORCLIXAGREG'
      '  (IDPESSOA, IDFORCLI, CODTIPOCUSTAGREG, RECPAG)'
      'values'
      '  (:IDPESSOA, :IDFORCLI, :CODTIPOCUSTAGREG, :RECPAG)')
    DeleteSQL.Strings = (
      'delete from FORCLIXAGREG'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG and'
      '  RECPAG = :OLD_RECPAG')
    Left = 269
    Top = 612
  end
  object QryImpAgregxForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT '
      '  T.DESCCUSTAGREG, F.IDPESSOA, F.IDFORCLI, F.CODTIPOCUSTAGREG,'
      '  F.RECPAG'
      'FROM'
      ' TIPOAGRE T, FORCLIXAGREG F'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND'
      '  (F.IDFORCLI = :PIDFORCLI) AND'
      '  (F.IDPESSOA = :PIDPESSOA) AND'
      '  (F.RECPAG = :RECPAG)'
      '')
    UpdateObject = UpdImpAgregxForn
    ValidateWithMask = True
    Left = 389
    Top = 612
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
        Value = 255
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
        Value = 'R'
      end>
    object QryImpAgregxFornDESCCUSTAGREG: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'DESCCUSTAGREG'
      Origin = '"CM.TIPOAGRE".DESCCUSTAGREG'
      Size = 60
    end
    object QryImpAgregxFornCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'FORCLIXAGREG.CODTIPOCUSTAGREG'
      Visible = False
    end
    object QryImpAgregxFornIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORCLIXAGREG.IDPESSOA'
      Visible = False
    end
    object QryImpAgregxFornIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'FORCLIXAGREG.IDFORCLI'
      Visible = False
    end
    object QryImpAgregxFornRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORCLIXAGREG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object DsImpAgreg: TwwDataSource
    AutoEdit = False
    DataSet = QryImpAgreg
    Left = 270
    Top = 659
  end
  object UpdImpAgreg: TUpdateSQL
    ModifySQL.Strings = (
      'update RAMOFORNECEDOR'
      'set'
      '  IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR,'
      '  DESCRAMOFORNECEDOR = :DESCRAMOFORNECEDOR'
      'where'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    InsertSQL.Strings = (
      'insert into RAMOFORNECEDOR'
      '  (IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR)'
      'values'
      '  (:IDRAMOFORNECEDOR, :DESCRAMOFORNECEDOR)')
    DeleteSQL.Strings = (
      'delete from RAMOFORNECEDOR'
      'where'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    Left = 310
    Top = 661
  end
  object QryImpAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '  TIPOAGRE.DESCCUSTAGREG,'
      '  TIPOAGRE.CODTIPOCUSTAGREG'
      'FROM'
      ' TIPOAGRE, TIPOALTERADOR'
      'WHERE'
      '  (TIPOAGRE.CODTRATFISCD IN ('#39'B'#39','#39'8'#39','#39'9'#39','#39'A'#39')) AND'
      
        '  (((TIPOAGRE.CODTRATFISCD = '#39'8'#39') AND (TIPOALTERADOR.ACRESDECRES' +
        ' = '#39'C'#39')) OR ((TIPOAGRE.CODTRATFISCD = '#39'A'#39') AND (TIPOALTERADOR.AC' +
        'RESDECRES = '#39'D'#39')) OR (TIPOALTERADOR.ACRESDECRES IS NULL)) AND'
      '  (TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)) AND'
      '  (TIPOAGRE.CODTIPOCUSTAGREG NOT IN'
      '  (SELECT'
      '    F.CODTIPOCUSTAGREG'
      '   FROM'
      '    FORCLIXAGREG F'
      '   WHERE'
      '    (F.IDFORCLI = :PIDFORCLI) AND'
      '    (F.IDPESSOA = :PIDPESSOA) AND'
      '    (F.RECPAG = :RECPAG)))'
      'ORDER BY  TIPOAGRE.DESCCUSTAGREG'
      ' '
      ' '
      ' ')
    UpdateObject = UpdImpAgreg
    ValidateWithMask = True
    Left = 382
    Top = 663
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object QryImpAgregDESCCUSTAGREG: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'DESCCUSTAGREG'
      Origin = '"CM.TIPOAGRE".DESCCUSTAGREG'
      Size = 60
    end
    object QryImpAgregCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Visible = False
    end
  end
  object QryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  UNIDNEGOC, NOME '
      'from '
      '  UNIDNEGOCIO '
      'where'
      ' IDPESSOA = :IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 215
    Top = 661
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryUnidNegocNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object QryUnidNegocUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryContaBancaria: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  C.IDCBANCARIA, C.IDPESSOA, C.IDAGENCIA, C.CONTACORRENTE,'
      '  C.FLGCONTAPREF, C.TIPOCONTA, A.NUMAGENCIA, A.IDBANCO,'
      '  PB.NOME AS NOMEBANCO, B.NUMBANCO'
      'FROM'
      '  PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C'
      'WHERE'
      '  ( C.IDPESSOA =:IDPESSOA ) AND'
      '  ( C.IDAGENCIA = A.IDPESSOA )  AND'
      '  ( A.IDBANCO = B.IDPESSOA) AND'
      '  (B.IDPESSOA = PB.IDPESSOA)')
    UpdateObject = updContaBancaria
    ValidateWithMask = True
    Left = 967
    Top = 314
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryContaBancariaNOMEBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 30
      FieldName = 'NOMEBANCO'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryContaBancariaNUMBANCO: TStringField
      DisplayLabel = 'Num.'
      DisplayWidth = 8
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Size = 10
    end
    object qryContaBancariaNUMAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryContaBancariaCONTACORRENTE: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContaBancariaTIPOCONTA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 1
      FieldName = 'TIPOCONTA'
      Size = 1
    end
    object qryContaBancariaFLGCONTAPREF: TFloatField
      DisplayLabel = 'Pref.'
      DisplayWidth = 4
      FieldName = 'FLGCONTAPREF'
    end
    object qryContaBancariaIDCBANCARIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCBANCARIA'
      Visible = False
    end
    object qryContaBancariaIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContaBancariaIDAGENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAGENCIA'
      Visible = False
    end
    object qryContaBancariaIDBANCO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBANCO'
      Visible = False
    end
  end
  object DsContaBancaria: TwwDataSource
    DataSet = qryContaBancaria
    Left = 966
    Top = 363
  end
  object updContaBancaria: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABANCARIA'
      'set'
      '  IDCBANCARIA = :IDCBANCARIA,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDAGENCIA = :IDAGENCIA,'
      '  CONTACORRENTE = :CONTACORRENTE,'
      '  FLGCONTAPREF = :FLGCONTAPREF,'
      '  TIPOCONTA = :TIPOCONTA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    InsertSQL.Strings = (
      'insert into CONTABANCARIA'
      
        '  (IDCBANCARIA, IDPESSOA, IDAGENCIA, CONTACORRENTE, FLGCONTAPREF' +
        ', '
      'TIPOCONTA)'
      'values'
      '  (:IDCBANCARIA, :IDPESSOA, :IDAGENCIA, :CONTACORRENTE, '
      ':FLGCONTAPREF, '
      '   :TIPOCONTA)')
    DeleteSQL.Strings = (
      'delete from CONTABANCARIA'
      'where'
      '  IDCBANCARIA = :OLD_IDCBANCARIA')
    Left = 967
    Top = 405
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '  BANCO.IDPESSOA,BANCO.NUMBANCO , PESSOA.RAZAOSOCIAL,'
      '  BANCO.MASCARACC, BANCO.MASCARAAGENCIA, BANCO.FLGVALIDACC'
      'FROM'
      '  PESSOA,'
      '  BANCO'
      'WHERE '
      '   PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'ORDER BY'
      '   PESSOA.RAZAOSOCIAL  ')
    ValidateWithMask = True
    Left = 966
    Top = 445
    object qryBancoRAZAOSOCIAL: TStringField
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
    object qryBancoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BANCO.IDPESSOA'
      Visible = False
    end
    object qryBancoNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Visible = False
      Size = 10
    end
    object qryBancoMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = '"CM.BANCO".MASCARACC'
      Size = 30
    end
    object qryBancoMASCARAAGENCIA: TStringField
      FieldName = 'MASCARAAGENCIA'
      Origin = '"CM.BANCO".MASCARAAGENCIA'
      Size = 30
    end
    object qryBancoFLGVALIDACC: TStringField
      FieldName = 'FLGVALIDACC'
      Origin = '"CM.BANCO".FLGVALIDACC'
      Size = 1
    end
  end
  object QryBuscaAgencia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.IDPESSOA'
      'FROM'
      '  AGENCIABANCARIA A'
      'WHERE'
      '  ( A.IDBANCO =:IDBANCO ) AND'
      '  ( RTRIM(A.NUMAGENCIA) = :NUMAGENCIA)'
      '')
    ValidateWithMask = True
    Left = 928
    Top = 317
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMAGENCIA'
        ParamType = ptUnknown
      end>
    object QryBuscaAgenciaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PORTADORFORMA".IDPESSOA'
    end
  end
  object QryInserePessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO PESSOA '
      ' (IDPESSOA, NOME, RAZAOSOCIAL, TIPO)'
      'VALUES'
      ' (:IDPESSOA, :NOME, :RAZAOSOCIAL, :TIPO)'
      '')
    ValidateWithMask = True
    Left = 928
    Top = 358
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RAZAOSOCIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPO'
        ParamType = ptUnknown
      end>
  end
  object QryInsereAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO AGENCIABANCARIA'
      '  (IDPESSOA, IDBANCO, NUMAGENCIA)'
      'VALUES'
      '  (:IDPESSOA, :IDBANCO, :NUMAGENCIA)')
    ValidateWithMask = True
    Left = 928
    Top = 404
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NUMAGENCIA'
        ParamType = ptUnknown
      end>
  end
  object MsBanco: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Banco'
      'Nº da Agência'
      'Nome da Agência')
    Tabelas.Strings = (
      'PESSOA'
      'AGENCIABANCARIA'
      'BANCO')
    CamposChave.Strings = (
      'AGENCIABANCARIA.NUMAGENCIA')
    Filtro.Strings = (
      '')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 965
    Top = 481
  end
  object ppmCaixa: TPopupMenu
    Left = 925
    Top = 452
    object N001ContaCorrente1: TMenuItem
      Tag = 1001
      Caption = '001 - Conta Corrente'
      OnClick = N001ContaCorrente1Click
    end
    object N002ContaCadernete1: TMenuItem
      Tag = 1002
      Caption = '002 - Conta Cadernete'
      OnClick = N001ContaCorrente1Click
    end
    object N003ContadePessoaJurdica1: TMenuItem
      Tag = 1003
      Caption = '003 - Conta de Pessoa Jurídica'
      OnClick = N001ContaCorrente1Click
    end
    object N004DepsitoJudicial1: TMenuItem
      Tag = 1004
      Caption = '004 - Depósito Judicial'
      OnClick = N001ContaCorrente1Click
    end
    object N635DepsitoJudicialIR1: TMenuItem
      Tag = 1635
      Caption = '635 - Depósito Judicial ( IR )'
      OnClick = N001ContaCorrente1Click
    end
    object N013ContadePoupana1: TMenuItem
      Tag = 1013
      Caption = '013 - Conta de Poupança'
      OnClick = N001ContaCorrente1Click
    end
    object N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem
      Tag = 1022
      Caption = '022 - Conta Cadernete de Poupança Pessoa Jurídica'
      OnClick = N001ContaCorrente1Click
    end
  end
end
