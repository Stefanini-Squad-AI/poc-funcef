inherited frmCadForne: TfrmCadForne
  Left = 177
  Top = 100
  Caption = 'Fornecedor / Favorecido'
  ClientHeight = 486
  ClientWidth = 782
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 782
    Height = 400
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 772
      Height = 285
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Geral'
        'Dados Bancários'
        'Ramo Fornecedor'
        'Tipos de Desembolsos'
        'Impostos Agregados')
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
        Width = 674
        Height = 226
        ActivePage = RamoFor
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 666
            Height = 198
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 666
            Height = 198
            inherited pnlItemsDoc: TPanel
              Height = 196
            end
            inherited pnlFoto: TPanel
              Width = 176
              Height = 196
              inherited Bevel1: TBevel
                Height = 165
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 165
                Width = 176
                inherited btnAssociarimgPessoa: TButton
                  Left = 19
                  Top = 162
                end
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 174
                Height = 165
                inherited imgPessoa: TDBImage
                  Left = 19
                  Top = 13
                end
              end
            end
            inherited lstDocumentos: TListView
              Height = 196
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 666
            Height = 198
            inherited grpTipoEnd: TGroupBox
              Left = 469
              Height = 198
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 666
            Height = 198
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 666
            Height = 198
          end
          inherited Panel1: TPanel
            Width = 666
            Height = 198
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 666
            Height = 198
          end
          inherited dbgContato: TwwDBGrid
            Width = 666
            Height = 198
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Geral'
          object PnlGeral: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Align = alClient
            TabOrder = 0
            object LblNatuRend_Padrao: TLabel
              Left = 488
              Top = 148
              Width = 141
              Height = 13
              Caption = 'Natureza de Rendimento'
            end
            object Label2: TLabel
              Left = 488
              Top = 200
              Width = 94
              Height = 13
              Caption = 'Nº Dependentes'
            end
            object LblClasFis_Padrao: TLabel
              Left = 488
              Top = 104
              Width = 113
              Height = 13
              Caption = 'Classificação Fiscal'
            end
            object LblCodCorresp_Padrao: TLabel
              Left = 488
              Top = 62
              Width = 133
              Height = 13
              Caption = 'Código Correspondente'
            end
            object GpbContabil: TPanel
              Left = 6
              Top = 1
              Width = 472
              Height = 238
              BevelOuter = bvNone
              TabOrder = 0
              object CContabil: TCMProcuraMaskContabil
                Left = 6
                Top = 4
                Width = 227
                Height = 233
                Caption = ' Conta do Fornecedor '
                TabOrder = 1
                OnExit = CContabilExit
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForn
                DataField = 'CONTACFORN'
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
              object Panel5: TPanel
                Left = 12
                Top = 115
                Width = 217
                Height = 115
                BevelOuter = bvNone
                TabOrder = 0
                object Label20: TLabel
                  Left = 4
                  Top = -2
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
                  Left = 4
                  Top = 36
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
                  Top = 74
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
                  Left = 4
                  Top = 14
                  Width = 210
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'Subconta'
                    'CODSUBCONTA'#9'10'#9'Código')
                  DataField = 'CODSUBCONTA'
                  DataSource = DsEmpresaForn
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
                  Left = 4
                  Top = 50
                  Width = 209
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODCENTROCUSTO'#9'10'#9'Código'
                    'NOME'#9'30'#9'Descrição')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = DsEmpresaForn
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
                  Top = 89
                  Width = 210
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'25'#9'Descrição')
                  DataField = 'UNIDNEGOC'
                  DataSource = DsEmpresaForn
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
              object CContabil1: TCMProcuraMaskContabil
                Left = 237
                Top = 2
                Width = 234
                Height = 114
                Caption = 'Conta de Adiantamento'
                TabOrder = 2
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForn
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
              object CContabil2: TCMProcuraMaskContabil
                Left = 237
                Top = 123
                Width = 234
                Height = 114
                Caption = ' Conta a Débito '
                TabOrder = 3
                MostraMensagens = True
                MostraDescricao = True
                DataSource = DsEmpresaForn
                DataField = 'CONTACDESPESA'
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
            end
            object dblkNaturezaRend: TwwDBLookupCombo
              Left = 488
              Top = 165
              Width = 143
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Natureza')
              DataField = 'CODNATUREZA'
              DataSource = dsSubTipo
              LookupTable = qryNaturezaRend
              LookupField = 'CODNATUREZA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBSpinEdit1: TwwDBSpinEdit
              Left = 588
              Top = 196
              Width = 41
              Height = 21
              Increment = 1
              MaxValue = 99
              DataField = 'NUMDEPENDENTES'
              DataSource = dsSubTipo
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 488
              Top = 121
              Width = 143
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
            object wwDBEdit2: TwwDBEdit
              Left = 488
              Top = 77
              Width = 143
              Height = 21
              DataField = 'CODCORRESP'
              DataSource = dsSubTipo
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBRadioGroup2: TDBRadioGroup
              Left = 488
              Top = 8
              Width = 145
              Height = 45
              Caption = ' Status '
              Columns = 2
              DataField = 'FLGSTATUS'
              DataSource = DsEmpresaForn
              Items.Strings = (
                'Ativo'
                'Inativo')
              TabOrder = 5
              Values.Strings = (
                'A'
                'I')
            end
          end
        end
        object TbsContaBancaria_Padrao: TTabSheet
          Caption = 'Dados Bancários'
          object PnlDadosBancarios_Padrao: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Align = alClient
            TabOrder = 1
            object Label14: TLabel
              Left = 10
              Top = 12
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
            object Label18: TLabel
              Left = 11
              Top = 101
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
            object SpeedButton2: TSpeedButton
              Left = 108
              Top = 114
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
              OnClick = SpeedButton2Click
            end
            object Label15: TLabel
              Left = 138
              Top = 101
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
            object DbeAgencia: TwwDBEdit
              Left = 11
              Top = 114
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
              Top = 116
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
              Top = 56
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
            object dblkBanco: TwwDBLookupCombo
              Left = 10
              Top = 27
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
          end
          object GrdContaBancaria_Padrao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Selected.Strings = (
              'NOMEBANCO'#9'30'#9'Banco'
              'NUMBANCO'#9'8'#9'Num.'
              'AGENCIAFORMAT'#9'20'#9'Agência'
              'CONTAFORMAT'#9'20'#9'Conta Bancária'
              'TIPOCONTA'#9'3'#9'Tipo'
              'FLGCONTAPREF'#9'4'#9'Pref.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsContaBancaria
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
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
        object RamoFor: TTabSheet
          Caption = 'Ramo Fornecedor'
          object pnlRamoFor: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Align = alClient
            TabOrder = 0
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
                'DESCRAMOFORNECEDOR'#9'30'#9'Ramo de Fornecedores'#9'No')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsRamoFornecedor
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
                'DESCRAMOFORNECEDOR'#9'30'#9'Ramos do Fornecedor'#9'No')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsFornxRamo
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
              Caption = 'Ramos de Fornecedores'
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
              Caption = 'Ramos do Fornecedor'
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
        object TabSheet2: TTabSheet
          Caption = 'Tipos de Desembolsos'
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Align = alClient
            TabOrder = 0
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
              TabOrder = 0
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
              DataSource = dsDesembxForn
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
              Caption = 'Tipos de Desembolsos'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object Panel8: TPanel
              Left = 7
              Top = 9
              Width = 343
              Height = 26
              BevelInner = bvLowered
              Caption = 'Tipos de Desembolsos do Fornecedor'
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
        object TabSheet3: TTabSheet
          Caption = 'Impostos Agregados'
          object pnlImpostos: TPanel
            Left = 0
            Top = 0
            Width = 666
            Height = 198
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
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
              TabOrder = 1
            end
            object wwDBGrid1: TwwDBGrid
              Left = 7
              Top = 27
              Width = 343
              Height = 130
              Selected.Strings = (
                'DESCCUSTAGREG'#9'25'#9'Nome')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = DsImpAgregxForn
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 2
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
            object Panel9: TPanel
              Left = 7
              Top = 9
              Width = 343
              Height = 26
              BevelInner = bvLowered
              Caption = 'Impostos Agregados do Fornecedor'
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
      end
      inherited Dock973: TDock97
        Width = 764
      end
      inherited Dock974: TDock97
        Left = 678
        Height = 226
      end
    end
    inherited pnlMestre: TPanel
      Width = 772
      inherited lblPdGrupo: TLabel
        Left = 452
      end
    end
  end
  inherited Dock972: TDock97
    Width = 782
    inherited Toolbar971: TToolbar97
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 447
    Width = 782
    inherited tb97Fundo: TToolbar97
      Left = 612
      DockPos = 612
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 444
      DockPos = 444
    end
  end
  inherited qry: TwwQuery
    Left = 474
    Top = 5
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
    Left = 7
    Top = 543
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited upd: TUpdateSQL
    Left = 547
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NUMDOCUMENTO'
      'FORNSERV.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Fantasia'
      'Razão Social'
      'Número do Documento'
      'Identificador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '60'
      '18'
      '10')
    Left = 364
    Top = 5
  end
  inherited ds: TwwDataSource
    Top = 5
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 428
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update FORNSERV'
      'set'
      '  FLGASS = :FLGASS,'
      '  CODNATUREZA = :CODNATUREZA,'
      '  NUMDEPENDENTES = :NUMDEPENDENTES,'
      '  IDCLASFISCLIFOR = :IDCLASFISCLIFOR,'
      '  CODCORRESP = :CODCORRESP'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FORNSERV'
      
        '  (IDPESSOA, FLGASS, CODNATUREZA, NUMDEPENDENTES, IDCLASFISCLIFO' +
        'R, CODCORRESP)'
      'values'
      
        '  (:IDPESSOA, :FLGASS, :CODNATUREZA, :NUMDEPENDENTES, :IDCLASFIS' +
        'CLIFOR, '
      '   :CODCORRESP)')
    DeleteSQL.Strings = (
      'delete from FORNSERV'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 647
    Top = 493
  end
  inherited qrySubTipo: TwwQuery
    AfterScroll = qrySubTipoAfterScroll
    SQL.Strings = (
      'SELECT '
      
        '  IDPESSOA,FLGASS,CODNATUREZA, NUMDEPENDENTES, IDCLASFISCLIFOR, ' +
        'CODCORRESP'
      'FROM '
      '  FORNSERV'
      'WHERE '
      '  ( IDPESSOA =:IdPessoa )')
    Left = 620
    Top = 493
    object qrySubTipoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORNSERV.IDPESSOA'
    end
    object qrySubTipoFLGASS: TFloatField
      FieldName = 'FLGASS'
      Origin = 'FORNSERV.FLGASS'
    end
    object qrySubTipoCODNATUREZA: TStringField
      FieldName = 'CODNATUREZA'
      Origin = 'FORNSERV.CODNATUREZA'
      Size = 4
    end
    object qrySubTipoNUMDEPENDENTES: TFloatField
      FieldName = 'NUMDEPENDENTES'
      Origin = 'FORNSERV.NUMDEPENDENTES'
    end
    object qrySubTipoIDCLASFISCLIFOR: TFloatField
      FieldName = 'IDCLASFISCLIFOR'
      Origin = 'FORNSERV.IDCLASFISCLIFOR'
    end
    object qrySubTipoCODCORRESP: TStringField
      FieldName = 'CODCORRESP'
      Origin = 'FORNSERV.CODCORRESP'
      Size = 30
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 673
    Top = 493
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 60
    Top = 496
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 671
    Top = 543
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 536
    Top = 494
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
    Left = 694
    Top = 5
  end
  inherited qryTelefone: TwwQuery
    Left = 389
    Top = 543
  end
  inherited updTelefone: TUpdateSQL
    Left = 461
    Top = 543
  end
  inherited dsTelefone: TwwDataSource
    Left = 533
    Top = 543
  end
  inherited dsEndereco: TwwDataSource
    Left = 438
    Top = 544
  end
  inherited updEndereco: TUpdateSQL
    Left = 570
    Top = 543
  end
  inherited qryEndereco: TwwQuery
    Left = 317
    Top = 543
  end
  inherited qryContato: TwwQuery
    Left = 566
    Top = 493
  end
  inherited updContato: TUpdateSQL
    Left = 593
    Top = 493
  end
  inherited dsContato: TwwDataSource
    Left = 172
    Top = 543
  end
  inherited qryRamal: TwwQuery
    Left = 714
    Top = 543
  end
  inherited updRamal: TUpdateSQL
    Left = 459
    Top = 493
  end
  inherited dsRamal: TwwDataSource
    Left = 209
    Top = 543
  end
  inherited qryDocumento: TwwQuery
    Left = 64
    Top = 543
  end
  inherited dsDocumento: TwwDataSource
    Left = 497
    Top = 543
  end
  inherited updDocumento: TUpdateSQL
    Left = 486
    Top = 493
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 238
    Top = 543
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 718
    Top = 493
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    TipoPessoa = tpOpcional
    SubTipo = stFornecedor
    FormCaption = 'Fornecedor / Favorecido'
    UsaPessoaFisica = True
    OnChangeSubtipo = PessoaChangeSubtipo
    OnSaveSubtipo = PessoaSaveSubtipo
    Left = 657
    Top = 5
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 401
    Top = 5
  end
  inherited qryImagem: TwwQuery
    Left = 437
    Top = 5
  end
  inherited updImagem: TUpdateSQL
    Left = 511
    Top = 5
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 606
    Top = 543
  end
  object qryBanco: TwwQuery [41]
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
    Left = 949
    Top = 246
    object qryBancoNUMBANCO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 10
      FieldName = 'NUMBANCO'
      Origin = 'BANCO.NUMBANCO'
      Size = 10
    end
    object qryBancoRAZAOSOCIAL: TStringField
      DisplayLabel = 'Nome'
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
    object qryBancoMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = '"CM.BANCO".MASCARACC'
      Visible = False
      Size = 30
    end
    object qryBancoMASCARAAGENCIA: TStringField
      FieldName = 'MASCARAAGENCIA'
      Origin = '"CM.BANCO".MASCARAAGENCIA'
      Visible = False
      Size = 30
    end
    object qryBancoFLGVALIDACC: TStringField
      FieldName = 'FLGVALIDACC'
      Origin = '"CM.BANCO".FLGVALIDACC'
      Visible = False
      Size = 1
    end
  end
  object qrySubConta: TwwQuery [42]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA FROM SUBCONTA WHERE IDP' +
        'ESSOA = 1 ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 288
    Top = 543
  end
  object qryFornxRamo: TwwQuery [43]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '   FR.IDPESSOA,FR.IDRAMOFORNECEDOR, RM.DESCRAMOFORNECEDOR '
      'FROM '
      '   FORNXRAMO FR, RAMOFORNECEDOR RM '
      'WHERE '
      '   (FR.IDPESSOA = :PIDPESSOA)  AND '
      '   (FR.IDRAMOFORNECEDOR = RM.IDRAMOFORNECEDOR)'
      'ORDER BY'
      '   RM.DESCRAMOFORNECEDOR ')
    UpdateObject = updFornxRamo
    ValidateWithMask = True
    Left = 129
    Top = 496
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFornxRamoDESCRAMOFORNECEDOR: TStringField
      DisplayLabel = 'Ramos do Fornecedor'
      DisplayWidth = 30
      FieldName = 'DESCRAMOFORNECEDOR'
      Origin = 'RAMOFORNECEDOR.DESCRAMOFORNECEDOR'
      Size = 30
    end
    object qryFornxRamoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORNXRAMO.IDPESSOA'
      Visible = False
    end
    object qryFornxRamoIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = 'FORNXRAMO.IDRAMOFORNECEDOR'
      Visible = False
    end
  end
  object qryEmpresaForn: TwwQuery [44]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFORCLI,IDPESSOA,CODSUBCONTA,'
      
        '              PLANO,CONTACADIANTAMENTO,CONTACDESPESA,CONTACFORN,' +
        ' CODCENTROCUSTO, UNIDNEGOC, CODCORRESP, FLGSTATUS'
      'FROM   EMPRESAFORN'
      'WHERE ( IDPESSOA =:IdPessoa ) AND (IDFORCLI =:IdFornCli)')
    UpdateObject = updEmpresaForn
    ValidateWithMask = True
    Left = 513
    Top = 493
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = Null
      end
      item
        DataType = ftInteger
        Name = 'IdFornCli'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'EMPRESAFORN.IDPESSOA'
    end
    object FloatField3: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESAFORN.CODSUBCONTA'
    end
    object FloatField4: TFloatField
      FieldName = 'PLANO'
      Origin = 'EMPRESAFORN.PLANO'
    end
    object qryEmpresaFornCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'EMPRESAFORN.CODCENTROCUSTO'
      Size = 10
    end
    object qryEmpresaFornIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'EMPRESAFORN.IDFORCLI'
    end
    object qryEmpresaFornCONTACADIANTAMENTO: TStringField
      FieldName = 'CONTACADIANTAMENTO'
      Origin = 'EMPRESAFORN.CONTACADIANTAMENTO'
      Size = 18
    end
    object qryEmpresaFornCONTACDESPESA: TStringField
      FieldName = 'CONTACDESPESA'
      Origin = 'EMPRESAFORN.CONTACDESPESA'
      Size = 18
    end
    object qryEmpresaFornCONTACFORN: TStringField
      FieldName = 'CONTACFORN'
      Origin = 'EMPRESAFORN.CONTACFORN'
      Size = 18
    end
    object qryEmpresaFornUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'EMPRESAFORN.UNIDNEGOC'
    end
    object qryEmpresaFornCODCORRESP: TStringField
      FieldName = 'CODCORRESP'
      Origin = 'EMPRESAFORN.CODCORRESP'
      Size = 30
    end
    object qryEmpresaFornFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'EMPRESAFORN.FLGSTATUS'
      Size = 1
    end
  end
  object updEmpresaForn: TUpdateSQL [45]
    ModifySQL.Strings = (
      'update EMPRESAFORN'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  PLANO = :PLANO,'
      '  CONTACADIANTAMENTO = :CONTACADIANTAMENTO,'
      '  CONTACDESPESA = :CONTACDESPESA,'
      '  CONTACFORN = :CONTACFORN,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCORRESP = :CODCORRESP,'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into EMPRESAFORN'
      
        '  (IDFORCLI, IDPESSOA, CODSUBCONTA, PLANO, CONTACADIANTAMENTO, C' +
        'ONTACDESPESA, '
      '   CONTACFORN, CODCENTROCUSTO, UNIDNEGOC, CODCORRESP, FLGSTATUS)'
      'values'
      
        '  (:IDFORCLI, :IDPESSOA, :CODSUBCONTA, :PLANO, :CONTACADIANTAMEN' +
        'TO, :CONTACDESPESA, '
      
        '   :CONTACFORN, :CODCENTROCUSTO, :UNIDNEGOC, :CODCORRESP, :FLGST' +
        'ATUS)')
    DeleteSQL.Strings = (
      'delete from EMPRESAFORN'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 561
    Top = 496
  end
  object qryContaBancaria: TwwQuery [46]
    Tag = 5
    CachedUpdates = True
    OnCalcFields = qryContaBancariaCalcFields
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
    Left = 949
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
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
    object qryContaBancariaAGENCIAFORMAT: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'AGENCIAFORMAT'
      Calculated = True
    end
    object qryContaBancariaCONTAFORMAT: TStringField
      DisplayLabel = 'Conta Bancária'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CONTAFORMAT'
      Calculated = True
    end
    object qryContaBancariaTIPOCONTA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 3
      FieldName = 'TIPOCONTA'
      Size = 1
    end
    object qryContaBancariaFLGCONTAPREF: TFloatField
      DisplayLabel = 'Pref.'
      DisplayWidth = 4
      FieldName = 'FLGCONTAPREF'
    end
    object qryContaBancariaNUMAGENCIA: TStringField
      DisplayLabel = 'Agência'
      DisplayWidth = 15
      FieldName = 'NUMAGENCIA'
      Visible = False
      Size = 15
    end
    object qryContaBancariaCONTACORRENTE: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 15
      FieldName = 'CONTACORRENTE'
      Visible = False
      Size = 15
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
  object updContaBancaria: TUpdateSQL [47]
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
    Left = 949
    Top = 210
  end
  object updRamoFor: TUpdateSQL [48]
    ModifySQL.Strings = (
      'update RAMOFORNECEDOR'
      'set'
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
    Left = 383
    Top = 496
  end
  object qryRamoFornecedor: TwwQuery [49]
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '  IDRAMOFORNECEDOR,DESCRAMOFORNECEDOR'
      'FROM'
      '  RAMOFORNECEDOR'
      'WHERE'
      '  IDRAMOFORNECEDOR NOT IN'
      ' (SELECT'
      '   IDRAMOFORNECEDOR'
      '  FROM'
      '   FORNXRAMO'
      '  WHERE'
      '   (IDPESSOA = :PIDPESSOA))'
      'ORDER BY '
      '  DESCRAMOFORNECEDOR')
    UpdateObject = updRamoFor
    ValidateWithMask = True
    Left = 408
    Top = 496
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryRamoFornecedorDESCRAMOFORNECEDOR: TStringField
      DisplayLabel = 'Ramo de Fornecedores'
      DisplayWidth = 30
      FieldName = 'DESCRAMOFORNECEDOR'
      Origin = 'RAMOFORNECEDOR.DESCRAMOFORNECEDOR'
      Size = 30
    end
    object qryRamoFornecedorIDRAMOFORNECEDOR: TFloatField
      FieldName = 'IDRAMOFORNECEDOR'
      Origin = 'RAMOFORNECEDOR.IDRAMOFORNECEDOR'
      Visible = False
    end
  end
  object dsFornxRamo: TwwDataSource [50]
    AutoEdit = False
    DataSet = qryFornxRamo
    Left = 155
    Top = 496
  end
  object dsRamoFornecedor: TwwDataSource [51]
    AutoEdit = False
    DataSet = qryRamoFornecedor
    Left = 434
    Top = 496
  end
  object updFornxRamo: TUpdateSQL [52]
    ModifySQL.Strings = (
      'update FORNXRAMO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRAMOFORNECEDOR = :IDRAMOFORNECEDOR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    InsertSQL.Strings = (
      'insert into FORNXRAMO'
      '  (IDPESSOA, IDRAMOFORNECEDOR)'
      'values'
      '  (:IDPESSOA, :IDRAMOFORNECEDOR)')
    DeleteSQL.Strings = (
      'delete from FORNXRAMO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRAMOFORNECEDOR = :OLD_IDRAMOFORNECEDOR')
    Left = 180
    Top = 496
  end
  inherited qryImagensDoc: TwwQuery
    Left = 642
    Top = 543
  end
  inherited dsImagem: TwwDataSource
    Left = 621
    Top = 5
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 28
    Top = 543
  end
  inherited qryTipoDoc: TwwQuery
    Left = 353
    Top = 543
  end
  inherited MSGrupo: TMontaSelect
    Left = 586
    Top = 496
  end
  inherited qryEstado: TwwQuery
    ParamCheck = False
    Left = 325
    Top = 493
  end
  inherited qryCidade: TwwQuery
    Left = 206
    Top = 496
  end
  inherited dsCidade: TwwDataSource
    Left = 104
    Top = 496
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 153
    Top = 141
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 151
    Top = 172
  end
  object qryDesembxForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT '
      
        '   DS.IDFORNXDESEMB,DS.CODTIPRECDES,DS.RECPAG,DS.IDPESSOA,DS.IDE' +
        'MPRESAPROP,TP.DESCRICAO,TP.ANASINT '
      'FROM '
      '   FORNXDESEMB DS,TIPORECEBDESEMB TP '
      'WHERE  '
      '    (DS.RECPAG = '#39'P'#39') AND '
      '    (DS.IDEMPRESAPROP = :PIDEMPRESA) AND '
      '    (DS.IDPESSOA = :PIDPESSOA)  AND '
      '    (TP.RECPAG = DS.RECPAG) AND '
      '    (TP.IDPESSOA = DS.IDEMPRESAPROP) AND '
      '    (DS.CODTIPRECDES = TP.CODTIPRECDES)'
      'ORDER BY DS.CODTIPRECDES, TP.ANASINT')
    UpdateObject = updDesembxForn
    ValidateWithMask = True
    Left = 256
    Top = 496
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
    object qryDesembxFornCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPRECDES'
      Origin = 'FORNXDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryDesembxFornANASINT: TStringField
      DisplayLabel = 'T'
      DisplayWidth = 1
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryDesembxFornDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryDesembxFornIDFORNXDESEMB: TFloatField
      FieldName = 'IDFORNXDESEMB'
      Origin = 'FORNXDESEMB.IDFORNXDESEMB'
      Visible = False
    end
    object qryDesembxFornRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORNXDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
    object qryDesembxFornIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'FORNXDESEMB.IDPESSOA'
      Visible = False
    end
    object qryDesembxFornIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Origin = 'FORNXDESEMB.IDEMPRESAPROP'
      Visible = False
    end
  end
  object dsDesembxForn: TwwDataSource
    AutoEdit = False
    DataSet = qryDesembxForn
    Left = 231
    Top = 496
  end
  object updDesembxForn: TUpdateSQL
    ModifySQL.Strings = (
      'update FORNXDESEMB'
      'set'
      '  IDFORNXDESEMB = :IDFORNXDESEMB,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP'
      'where'
      '  IDFORNXDESEMB = :OLD_IDFORNXDESEMB')
    InsertSQL.Strings = (
      'insert into FORNXDESEMB'
      '  (IDFORNXDESEMB, CODTIPRECDES, RECPAG, IDPESSOA, IDEMPRESAPROP)'
      'values'
      '  (:IDFORNXDESEMB, :CODTIPRECDES, :RECPAG, :IDPESSOA, '
      ':IDEMPRESAPROP)')
    DeleteSQL.Strings = (
      'delete from FORNXDESEMB'
      'where'
      '  IDFORNXDESEMB = :OLD_IDFORNXDESEMB')
    Left = 282
    Top = 496
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
      '   (RECPAG = '#39'P'#39') AND'
      '   (IDPESSOA = :PIDEMPRESA) AND'
      '   (CODTIPRECDES NOT IN'
      '    (SELECT'
      '       CODTIPRECDES'
      '     FROM'
      '       FORNXDESEMB'
      '     WHERE'
      '       (RECPAG = '#39'P'#39') AND'
      '       (IDEMPRESAPROP = :PIDEMPRESA) AND'
      '       (IDPESSOA = :PIDPESSOA)))'
      'ORDER BY '
      '   CODTIPRECDES, ANASINT')
    UpdateObject = updDesembolso
    ValidateWithMask = True
    Left = 307
    Top = 496
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
        Value = Null
      end
      item
        DataType = ftFloat
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
        Value = Null
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
        Value = Null
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
    Left = 459
    Top = 496
  end
  object dsDesembolso: TwwDataSource
    AutoEdit = False
    DataSet = qryDesembolso
    Left = 332
    Top = 496
  end
  object qryNaturezaRend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from cm.naturendimento')
    ValidateWithMask = True
    Left = 100
    Top = 543
  end
  object qryccusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select CODCENTROCUSTO, NOME from centcust')
    ValidateWithMask = True
    Left = 253
    Top = 543
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
  object CMwwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select CODCENTROCUSTO, NOME from centcust')
    ValidateWithMask = True
    Left = 178
    Top = 495
    object StringField5: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
  end
  object DsEmpresaForn: TwwDataSource
    DataSet = qryEmpresaForn
    Left = 136
    Top = 543
  end
  object DsContaBancaria: TwwDataSource
    DataSet = qryContaBancaria
    Left = 949
    Top = 175
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
      ''
      '  (TIPOAGRE.CODTRATFISCD IN ('#39'B'#39','#39'8'#39','#39'9'#39','#39'A'#39')) AND'
      
        '  (((TIPOAGRE.CODTRATFISCD = '#39'8'#39') AND (TIPOALTERADOR.ACRESDECRES' +
        ' = '#39'D'#39')) OR'
      
        '   ((TIPOAGRE.CODTRATFISCD = '#39'A'#39') AND (TIPOALTERADOR.ACRESDECRES' +
        ' = '#39'C'#39')) OR'
      '    (TIPOALTERADOR.ACRESDECRES IS NULL)) AND'
      '  (TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)) AND'
      '  (TIPOAGRE.CODTIPOCUSTAGREG NOT IN'
      ''
      '  (SELECT'
      '    F.CODTIPOCUSTAGREG'
      '   FROM'
      '    FORCLIXAGREG F'
      '   WHERE'
      '    (F.IDFORCLI = :PIDFORCLI) AND'
      '    (F.IDPESSOA = :PIDPESSOA) AND'
      '    (F.RECPAG = :RECPAG)))'
      'ORDER BY'
      '  TIPOAGRE.DESCCUSTAGREG'
      ''
      ' '
      ' ')
    UpdateObject = UpdImpAgreg
    ValidateWithMask = True
    Left = 806
    Top = 353
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
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
    Left = 798
    Top = 305
  end
  object DsImpAgreg: TwwDataSource
    AutoEdit = False
    DataSet = QryImpAgreg
    Left = 803
    Top = 257
  end
  object QryImpAgregxForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT '
      
        '  T.DESCCUSTAGREG, F.IDPESSOA, F.IDFORCLI, F.CODTIPOCUSTAGREG, F' +
        '.RECPAG'
      'FROM'
      ' TIPOAGRE T, FORCLIXAGREG F'
      'WHERE'
      '  (T.CODTIPOCUSTAGREG = F.CODTIPOCUSTAGREG) AND'
      '  (F.IDFORCLI = :PIDFORCLI) AND'
      '  (F.RECPAG = :RECPAG) AND'
      '  (F.IDPESSOA = :PIDPESSOA)')
    UpdateObject = UpdImpAgregxForn
    ValidateWithMask = True
    Left = 763
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
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
    Left = 763
    Top = 302
  end
  object DsImpAgregxForn: TwwDataSource
    AutoEdit = False
    DataSet = QryImpAgregxForn
    Left = 763
    Top = 256
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
    Left = 401
    Top = 495
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
      
        '  ( REPLACE(RTRIM(A.NUMAGENCIA),'#39'-'#39','#39#39') = REPLACE(:NUMAGENCIA,'#39'-' +
        #39','#39#39'))')
    ValidateWithMask = True
    Left = 686
    Top = 306
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
    Left = 929
    Top = 402
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
    Left = 982
    Top = 401
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
    Left = 949
    Top = 281
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
      'ORDER BY '
      '  NOME')
    ValidateWithMask = True
    Left = 81
    Top = 494
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
  object QryBuscaMask: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MASCARACC, MASCARAAGENCIA FROM BANCO WHERE IDPESSOA = :ID' +
        'PESSOA')
    ValidateWithMask = True
    Left = 949
    Top = 68
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryBuscaMaskMASCARACC: TStringField
      FieldName = 'MASCARACC'
      Origin = 'BASEDADOS.BANCO.MASCARACC'
      Size = 30
    end
    object QryBuscaMaskMASCARAAGENCIA: TStringField
      FieldName = 'MASCARAAGENCIA'
      Origin = 'BASEDADOS.BANCO.MASCARAAGENCIA'
      Size = 30
    end
  end
  object ppmCaixa: TPopupMenu
    Left = 949
    Top = 104
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
