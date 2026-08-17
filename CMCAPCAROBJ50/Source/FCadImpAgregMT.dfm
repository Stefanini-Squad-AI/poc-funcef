inherited FrmCadImpAgregMT: TFrmCadImpAgregMT
  Left = 218
  Top = 113
  Width = 779
  Height = 565
  BorderStyle = bsSizeable
  Caption = 'Impostos com Tabela de Retenção'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 771
    Height = 458
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 215
      Width = 769
      Height = 242
      Tabs.Strings = (
        'Tabela de Retenção'
        'Dados Para Lançamento de Documento'
        'Contabilização do Imposto')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        'GrdContab')
      inherited pgctrlDetalhe: TPageControl
        Width = 671
        Height = 183
        ActivePage = TbsNovoDoc
        inherited tbsDet: TTabSheet
          Caption = 'Tabela de Retenção'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 663
            Height = 155
            Selected.Strings = (
              'DATAINI'#9'10'#9'Data Início'#9'F'
              'DATAFIM'#9'10'#9'Data Fim'#9'F'
              'PERCCUSTAGREG'#9'6'#9'%'#9'F'
              'PERCBASE'#9'6'#9'Base'#9'F'
              'VLRINICIALFAIXA'#9'10'#9'Vlr. Inicial'#9'F'
              'VLRFINALFAIXA'#9'10'#9'Vlr. Final'#9'F'
              'VLRABATVALOR'#9'10'#9'Vlr. a Abater / Valor'#9'F'
              'VLRABATCALC'#9'10'#9'Vlr. a Abater / Cálculo'#9'F'
              'VLRFIXO'#9'10'#9'Vlr. Fixo'#9'F'
              'NUMDIASAPURA'#9'10'#9'Nº Dias Apuração'#9'F'
              'NUMDIASVENC'#9'10'#9'Nº Dias Vencimento'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 663
            Height = 155
            object Label4: TLabel
              Left = 8
              Top = 2
              Width = 67
              Height = 13
              Caption = 'Valor inicial'
            end
            object Label5: TLabel
              Left = 144
              Top = 2
              Width = 58
              Height = 13
              Caption = 'Valor final'
            end
            object Label6: TLabel
              Left = 8
              Top = 42
              Width = 124
              Height = 13
              Caption = 'Valor a abater / Valor'
            end
            object Label7: TLabel
              Left = 224
              Top = 42
              Width = 137
              Height = 13
              Caption = 'Valor a abater / Cálculo'
            end
            object Label8: TLabel
              Left = 144
              Top = 42
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object DbReValFixAbat: TLabel
              Left = 392
              Top = 42
              Width = 150
              Height = 13
              Caption = 'Valor a acrescer / Cálculo'
            end
            object Label9: TLabel
              Left = 424
              Top = 2
              Width = 29
              Height = 13
              Caption = 'Base'
            end
            object DbreValIni: TDBRealEdit
              Left = 8
              Top = 16
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRINICIALFAIXA'
              DataSource = dsDet
            end
            object DbreValFin: TDBRealEdit
              Left = 144
              Top = 16
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFINALFAIXA'
              DataSource = dsDet
            end
            object DbreValAbatVal: TDBRealEdit
              Left = 8
              Top = 56
              Width = 121
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
              DataField = 'VLRABATVALOR'
              DataSource = dsDet
            end
            object DbreValAbatCalc: TDBRealEdit
              Left = 224
              Top = 56
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRABATCALC'
              DataSource = dsDet
            end
            object DbRePercCust: TDBRealEdit
              Left = 144
              Top = 56
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000'
                '0')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 7
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCCUSTAGREG'
              DataSource = dsDet
            end
            object DBRealEdit8: TDBRealEdit
              Left = 392
              Top = 56
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFIXO'
              DataSource = dsDet
            end
            object DBRealEdit3: TDBRealEdit
              Left = 424
              Top = 16
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 7
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCBASE'
              DataSource = dsDet
            end
            object grpDataVigencia: TGroupBox
              Left = 8
              Top = 88
              Width = 249
              Height = 73
              Caption = ' Vigência '
              TabOrder = 7
              object Label13: TLabel
                Left = 16
                Top = 26
                Width = 31
                Height = 13
                Caption = 'de:   '
              end
              object Label14: TLabel
                Left = 136
                Top = 26
                Width = 35
                Height = 13
                Caption = 'até:   '
              end
              object DBedtDataIni: TCMDateTimePicker
                Left = 16
                Top = 40
                Width = 97
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAINI'
                DataSource = dsDet
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
                TabOrder = 0
              end
              object DBedtDataFim: TCMDateTimePicker
                Left = 136
                Top = 40
                Width = 97
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIM'
                DataSource = dsDet
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
                TabOrder = 1
              end
            end
            object grbxApuracao: TGroupBox
              Left = 272
              Top = 88
              Width = 273
              Height = 73
              Caption = ' Programação do Lançamento '
              TabOrder = 8
              object lblApura: TLabel
                Left = 16
                Top = 26
                Width = 102
                Height = 13
                Caption = 'Nº Dias Apuração'
              end
              object lblLancto: TLabel
                Left = 160
                Top = 26
                Width = 91
                Height = 13
                Caption = 'Nº Dias Lancto.'
              end
              object dbspedApura: TwwDBSpinEdit
                Left = 16
                Top = 40
                Width = 60
                Height = 21
                Increment = 1
                DataField = 'NUMDIASAPURA'
                DataSource = dsDet
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbSpedLancto: TwwDBSpinEdit
                Left = 160
                Top = 40
                Width = 60
                Height = 21
                Increment = 1
                DataField = 'NUMDIASVENC'
                DataSource = dsDet
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
          end
        end
        object TbsNovoDoc: TTabSheet
          Caption = 'Dados Para Lançamento/Contabilização do Documento'
          object PnlDoc: TPanel
            Left = 0
            Top = 0
            Width = 663
            Height = 155
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object lblTipoDocum: TLabel
              Left = 8
              Top = 66
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object lblTipoRD: TLabel
              Left = 240
              Top = 66
              Width = 116
              Height = 13
              Caption = 'Tipo de Desembolso'
            end
            object lblCentroRespon: TLabel
              Left = 8
              Top = 106
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lblUnidNegoc: TLabel
              Left = 240
              Top = 106
              Width = 104
              Height = 13
              Caption = 'Atividade/Projeto:'
            end
            object Label17: TLabel
              Left = 489
              Top = 105
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object dblcTipoDoc: TwwDBLookupCombo
              Left = 8
              Top = 80
              Width = 217
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'DEBCRE'#9'1'#9'D/C'
                'FLGDOCFISCAL'#9'1'#9'Doc. Fiscal'
                'FLGGERANUMDOC'#9'1'#9'Gera Num Doc')
              DataField = 'CODTIPDOC'
              DataSource = ds
              LookupTable = CdsTipoDoc
              LookupField = 'CODTIPDOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              DropDownWidth = 650
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcTipoRD: TwwDBLookupCombo
              Left = 240
              Top = 80
              Width = 233
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição'
                'CODTIPRECDES'#9'15'#9'Código')
              DataField = 'CODTIPRECDES'
              DataSource = ds
              LookupTable = CdsTipoRD
              LookupField = 'CODTIPRECDES'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcTipoRDEnter
            end
            object dblcCentroRespon: TwwDBLookupCombo
              Left = 8
              Top = 120
              Width = 217
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'ANALITICOSINTET'#9'1'#9'T'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTRORESPON'
              DataSource = ds
              LookupTable = CdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcCentroResponExit
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 240
              Top = 120
              Width = 233
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNETIPO'#9'1'#9'T'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = ds
              LookupTable = CdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcUnidNegocExit
            end
            object CmpForCli: TCMProcuraForCli
              Left = 8
              Top = 8
              Width = 377
              Height = 49
              Caption = ' Favorecido '
              TabOrder = 0
              OnExit = CmpForCliExit
              CampoEdit = ceRazaoSocial
              MostraMensagens = True
              DataSource = ds
              DataField = 'IDFORCLI'
              Mensagens.EmBranco = 'não pode estar em branco'
              Mensagens.NaoExiste = 'não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              ForCli = fcFornecedor
              MostraEndereco = False
              StatusForCli = fcAll
              MostraStatusCredito = False
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 488
              Top = 120
              Width = 233
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA'#9'F')
              DataField = 'IDPROGRAMA'
              DataSource = ds
              LookupTable = cdsProgramaTF
              LookupField = 'IDPROGRAMA'
              TabOrder = 6
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object grCentroCusto: TGroupBox
              Left = 400
              Top = 8
              Width = 255
              Height = 65
              Caption = 'Centro de Custo'
              TabOrder = 1
              object dblkccustDocImp: TwwDBLookupCombo
                Left = 16
                Top = 38
                Width = 217
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Descrição'
                  'CODEXTERNO'#9'10'#9'Cód de Centro de Custo'#9'F')
                DataField = 'CODCENTROCUSTO'
                DataSource = ds
                LookupTable = CdsCCusto
                LookupField = 'CODCENTROCUSTO'
                Options = [loTitles]
                Style = csDropDownList
                Enabled = False
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbchkCentCust: TDBCheckBox
                Left = 10
                Top = 20
                Width = 239
                Height = 17
                Caption = 'Utiliza C. de Custo do Doc. de Origem'
                DataField = 'FLGCCUSTRATEIO'
                DataSource = ds
                TabOrder = 0
                ValueChecked = 'S'
                ValueUnchecked = 'N'
                OnClick = dbchkCentCustClick
              end
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Contabilização do Imposto (Alterador)'
          ImageIndex = 2
          object GrdContab: TwwDBGrid
            Left = 0
            Top = 0
            Width = 663
            Height = 155
            Selected.Strings = (
              'PLACONTA'#9'18'#9'Conta Contábil'#9'F'
              'DEBCRE'#9'1'#9'D/C'#9'F'
              'CODSUBCONTA'#9'10'#9'Sub Conta'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
              'UNIDNEGOC'#9'10'#9'Unidade de Negócio'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsContab
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
            UseTFields = False
            IndicatorColor = icBlack
          end
          object PnlContabImposto: TPanel
            Left = 0
            Top = 0
            Width = 663
            Height = 155
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label20: TLabel
              Left = 256
              Top = 50
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
            object Label12: TLabel
              Left = 256
              Top = 90
              Width = 104
              Height = 13
              Caption = 'Atividade\Projeto:'
            end
            object lblCentroCusto: TLabel
              Left = 256
              Top = 10
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object CContabil: TCMProcuraMaskContabil
              Left = 8
              Top = 8
              Width = 234
              Height = 117
              Caption = ' Conta Contábil '
              TabOrder = 0
              OnExit = CContabilExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = DsContab
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil não existe'
              Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
              OnApertouBotao = CContabilApertouBotao
            end
            object cmbCCusto: TwwDBLookupCombo
              Left = 256
              Top = 24
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODEXTERNO'#9'10'#9'Cód de Centro de Custo'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = DsContab
              LookupTable = cdsCCustoContab
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkSubconta: TwwDBLookupCombo
              Left = 256
              Top = 64
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'30'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = DsContab
              LookupTable = CdsSubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 256
              Top = 104
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'#9'No'
                'UNETIPO'#9'1'#9'T'#9'No'
                'UNECODIGO'#9'10'#9'Código'#9'No')
              DataField = 'UNIDNEGOC'
              DataSource = DsContab
              LookupTable = CdsUnidNegocS
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object RgDC: TDBRadioGroup
              Left = 544
              Top = 16
              Width = 78
              Height = 67
              DataField = 'DEBCRE'
              DataSource = DsContab
              Items.Strings = (
                '&Débito'
                '&Crédito')
              TabOrder = 4
              Values.Strings = (
                'D'
                'C')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 761
      end
      inherited Dock974: TDock97
        Left = 675
        Height = 183
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 769
      Height = 214
      object Label1: TLabel
        Left = 312
        Top = 10
        Width = 98
        Height = 13
        Caption = 'Nome do imposto'
      end
      object Label2: TLabel
        Left = 16
        Top = 90
        Width = 105
        Height = 13
        Caption = 'Valor fixo a abater'
      end
      object Label3: TLabel
        Left = 288
        Top = 90
        Width = 75
        Height = 13
        Caption = 'Valor Mínimo'
      end
      object lblAlterador: TLabel
        Left = 16
        Top = 50
        Width = 114
        Height = 13
        Caption = 'Alterador Associado'
      end
      object Label10: TLabel
        Left = 152
        Top = 90
        Width = 125
        Height = 13
        Caption = 'Valor por Dependente'
      end
      object Label11: TLabel
        Left = 424
        Top = 50
        Width = 102
        Height = 13
        Caption = 'Tratamento Fiscal'
      end
      object Label15: TLabel
        Left = 312
        Top = 50
        Width = 69
        Height = 13
        Caption = 'Código GPS'
        Enabled = False
      end
      object Label16: TLabel
        Left = 16
        Top = 10
        Width = 106
        Height = 13
        Caption = 'Código do Imposto'
      end
      object lblNatureza: TLabel
        Left = 424
        Top = 90
        Width = 111
        Height = 13
        Caption = 'Natureza Operação'
      end
      object CkbValBruto: TDBCheckBox
        Left = 329
        Top = 163
        Width = 161
        Height = 18
        Caption = 'Considera o valor bruto'
        DataField = 'FLGCALCVALBRUTO'
        DataSource = ds
        TabOrder = 13
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DbeNome: TwwDBEdit
        Left = 312
        Top = 24
        Width = 393
        Height = 21
        DataField = 'DESCCUSTAGREG'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbrValFix: TDBRealEdit
        Left = 16
        Top = 104
        Width = 121
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRABATFIXO'
        DataSource = ds
      end
      object DbeValMin: TDBRealEdit
        Left = 288
        Top = 104
        Width = 121
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMINIMO'
        DataSource = ds
      end
      object RgAcumulaValor: TDBRadioGroup
        Left = 16
        Top = 136
        Width = 137
        Height = 65
        Caption = ' Acumula Valor '
        DataField = 'FLGACUMULA'
        DataSource = ds
        Items.Strings = (
          'NÃO Acumula'
          'Acumula / Mês')
        TabOrder = 9
        Values.Strings = (
          'N'
          'M')
      end
      object RgDataLancto: TDBRadioGroup
        Left = 168
        Top = 136
        Width = 129
        Height = 65
        Caption = ' Data Lanc. Imp.'
        DataField = 'LANCAMENTOIMPOSTO'
        DataSource = ds
        Items.Strings = (
          'Lançamento'
          'Programada'
          'Emissão')
        TabOrder = 10
        Values.Strings = (
          'L'
          'P'
          'E')
      end
      object DbeValDepend: TDBRealEdit
        Left = 152
        Top = 104
        Width = 121
        Height = 22
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALPORDEPENDENTE'
        DataSource = ds
      end
      object CmbTratFisc: TwwDBLookupCombo
        Left = 424
        Top = 64
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTRATFISC'#9'50'#9'Descrição')
        DataField = 'CODTRATFISCD'
        DataSource = ds
        LookupTable = CdsTratFisc
        LookupField = 'CODTRATFISC'
        DropDownWidth = 400
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = CmbTratFiscCloseUp
      end
      object CkbBaixaDoc: TDBCheckBox
        Left = 329
        Top = 133
        Width = 161
        Height = 18
        Caption = 'Lança Imposto na Baixa'
        DataField = 'FLGLANCAIMPOSTO'
        DataSource = ds
        TabOrder = 11
        ValueChecked = 'B'
        ValueUnchecked = 'L'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 329
        Top = 178
        Width = 243
        Height = 18
        Caption = 'Associa Imposto a Classificação Fiscal'
        DataField = 'FLGASSOCIACLASFIS'
        DataSource = ds
        TabOrder = 14
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object CkbAlteraBaixa: TDBCheckBox
        Left = 329
        Top = 148
        Width = 295
        Height = 18
        Caption = 'Permite Alterar Lançamentos efetuados na Baixa '
        DataField = 'FLGALTERARETENCAO'
        DataSource = ds
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblkAlterador: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 284
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupTable = CdsAlt
        LookupField = 'CODALTERADOR'
        DropDownWidth = 400
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = CmbTratFiscCloseUp
      end
      object DBChkFLGUSAVALFORCLI: TDBCheckBox
        Left = 329
        Top = 193
        Width = 424
        Height = 18
        Caption = 'Utiliza dados do Cadastro do Cliente para Cálculo do Imposto'
        DataField = 'FLGUSAVALFORCLI'
        DataSource = ds
        TabOrder = 15
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbedCodExt: TwwDBEdit
        Left = 312
        Top = 64
        Width = 100
        Height = 21
        DataField = 'CODIGOGPS'
        DataSource = ds
        Enabled = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBcboNatureza: TwwDBLookupCombo
        Left = 424
        Top = 104
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        DataField = 'CODNATUREZA'
        DataSource = ds
        LookupTable = cdsNatuRendimento
        LookupField = 'CODNATUREZA'
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CmbTipoImp: TwwDBComboBox
        Left = 16
        Top = 24
        Width = 281
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'CODIMPOSTO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'IRRF'#9'1'
          'INSS'#9'2'
          'ISS'#9'15'
          'PIS'#9'16'
          'COFINS'#9'17'
          'CSLL'#9'18'
          'PIS/COFINS/CSLL'#9'19'
          'CPMF'#9'20')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
        OnChange = CmbTipoImpChange
      end
    end
  end
  inherited Dock972: TDock97
    Width = 771
  end
  inherited Dock971: TDock97
    Top = 505
    Width = 771
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 99
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 27
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Height = 27
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 99
        Height = 27
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 922
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 312
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 976
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 440
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAGRE.DESCCUSTAGREG')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOAGRE'
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'TIPOAGRE.CODTIPOCUSTAGREG')
    Filtro.Strings = (
      'TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+)'
      'TIPOAGRE.CODTRATFISCD IN ('#39'8'#39','#39'9'#39','#39'A'#39','#39'B'#39')')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    Left = 368
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnAbortConfirma = CmeDetalheAbortConfirma
    Left = 440
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 240
    Top = 264
  end
  object DsContab: TwwDataSource
    AutoEdit = False
    DataSet = CdsContab
    Left = 728
    Top = 448
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 200
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT CENT.CODCENTRORESPON, CENT.NOME, CENT.ANALITICOSINTET,'
      '       CENT.CODCENTROCUSTO, CENT.CODEXTERNO'
      
        'FROM CENTRESPON CENT, (SELECT IDPLANCRESPON FROM PARAMGLOBAL) PL' +
        'ANO'
      'WHERE CENT.IDPESSOA = :IDPESSOA'
      '      AND CENT.IDPLANCRESPON = PLANO.IDPLANCRESPON'
      '      AND CENT.ATIVO = '#39'S'#39
      'ORDER BY CENT.NOME')
    ClientDataSet = CdsCentroRespon
    Left = 632
    Top = 184
  end
  object CdsUnidNegocS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 432
  end
  object SqlUnidNegocS: TCMSqlParams
    SQL.Strings = (
      
        'SELECT UNIDNEGOC,NOME,UNECODIGO,UNETIPO FROM UNIDNEGOCIO WHERE (' +
        'IDPESSOA = :IDPESSOA) ORDER BY UNECODIGO,UNETIPO')
    ClientDataSet = CdsUnidNegocS
    Left = 584
    Top = 416
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 432
  end
  object SqlUnidNegoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :IDPESSOA) '
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ClientDataSet = CdsUnidNegoc
    Left = 664
    Top = 416
  end
  object CdsTratFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 304
  end
  object SqlTratFisc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CODTRATFISC,DESCTRATFISC'
      'FROM'
      '  TRATFISC'
      'WHERE'
      '  CODTRATFISC IN ('#39'8'#39','#39'9'#39','#39'A'#39','#39'B'#39')'
      'ORDER BY'
      '  DESCTRATFISC')
    ClientDataSet = CdsTratFisc
    Left = 632
    Top = 288
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 80
  end
  object SqlSubConta: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA FROM SUBCONTA WHERE IDP' +
        'ESSOA = :IDPESSOA')
    ClientDataSet = CdsSubConta
    Left = 632
    Top = 64
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 304
  end
  object SqlTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      
        '  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, ' +
        'FLGDOCFISCAL'
      'FROM '
      '  TIPODOCRECPAG '
      'WHERE 1=2')
    ClientDataSet = CdsTipoDoc
    Left = 568
    Top = 288
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsContabAfterInsert
    Left = 728
    Top = 432
  end
  object SqlContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   T.IDTIPCUSTAGREGCON,'
      '   T.IDPESSOA,'
      '   T.CODTIPOCUSTAGREG,'
      '   T.CODSUBCONTA,'
      '   T.UNIDNEGOC,'
      '   T.IDEMPRESA,'
      '   C.CODEXTERNO AS CODCENTROCUSTO,'
      '   T.PLANO,'
      '   T.PLACONTA,'
      '   T.DEBCRE'
      'FROM'
      '   TIPCUSTAGREGCONTA T, CENTCUST C'
      'WHERE'
      '   T.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG  AND'
      '   C.CODCENTROCUSTO(+) = T.CODCENTROCUSTO'
      ''
      '')
    ClientDataSet = CdsContab
    Left = 728
    Top = 416
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 16
  end
  object SqlCCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CENT.CODCENTROCUSTO,'
      '  CENT.NOME,'
      '  CENT.CODEXTERNO,'
      '  CENT.IDPLANCENTCUST'
      'FROM'
      '  CENTCUST CENT'
      'WHERE'
      '  (CENT.IDEMPRESA = :IDEMPRESA) AND'
      '  (CENT.ATIVO = '#39'S'#39')  AND'
      
        '  (CENT.IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOBAL' +
        '))'
      'ORDER BY CENT.NOME'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsCCusto
    Left = 528
  end
  object CdsAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 16
  end
  object SqlAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODALTERADOR,DESCRICAO,ACRESDECRES'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '   (RECPAG = :PRECPAG) AND'
      '   (IDPESSOA = :PIDPESSOA) AND'
      '   (ACRESDECRES = :PACRESDECRES) AND'
      ' ((FLGCALCULAIMPOSTO = '#39'N'#39') OR (FLGCALCULAIMPOSTO IS NULL))'
      '')
    ClientDataSet = CdsAlt
    Left = 576
  end
  object CdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 632
    Top = 16
  end
  object SqlTipoRD: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, D' +
        'ESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO'
      'FROM TIPORECEBDESEMB WHERE 1=2')
    ClientDataSet = CdsTipoRD
    Left = 632
  end
  object CdsDet: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterInsert = CdsDetAfterInsert
    Left = 200
    Top = 264
    Data = {
      440100009619E0BD01000000180000000D000000000003000000440110434F44
      5449504F4355535441475245470800040000000000084E554D46414958410800
      0400000000000F564C52494E494349414C464149584108000400000000000D56
      4C5246494E414C464149584108000400000000000C564C524142415456414C4F
      5208000400000000000B564C524142415443414C4308000400000000000D5045
      5243435553544147524547080004000000000007564C524649584F0800040000
      00000008504552434241534508000400000000000744415441494E4908000800
      00000000074441544146494D08000800000000000C4E554D4449415341505552
      4108000400000000000B4E554D4449415356454E43080004000000000002000D
      44454641554C545F4F5244455202008200030000000A000B000200044C434944
      0400010009080000}
  end
  object SqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   CODTIPOCUSTAGREG, NUMFAIXA, VLRINICIALFAIXA, VLRFINALFAIXA, V' +
        'LRABATVALOR,'
      
        '   VLRABATCALC, PERCCUSTAGREG, VLRFIXO, PERCBASE, DATAINI, DATAF' +
        'IM,'
      '   NUMDIASAPURA, NUMDIASVENC'
      'FROM'
      '   FAIXATIPOAGREG'
      'WHERE'
      '   CODTIPOCUSTAGREG =:PCODTIPOCUSTAGREG'
      'ORDER BY'
      '   DATAINI, DATAFIM, NUMFAIXA')
    ClientDataSet = CdsDet
    Left = 160
    Top = 264
  end
  object Sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  CODTIPOCUSTAGREG, DESCCUSTAGREG, CODTRATFISCE, FLGACUMULA, VLR' +
        'ABATFIXO,'
      
        '  FLGTIPOCALC, CODALTERADOR, VLRMINIMO,CODTRATFISCD, LANCAMENTOI' +
        'MPOSTO,'
      
        '  VALPORDEPENDENTE, FLGCALCVALBRUTO, FLGLANCAIMPOSTO, FLGASSOCIA' +
        'CLASFIS,'
      
        '  CODTIPDOC, CODTIPRECDES, RECPAG, IDPESSOA, CODCENTRORESPON, UN' +
        'IDNEGOC,'
      
        '  IDFORCLI, FLGALTERARETENCAO, FLGUSAVALFORCLI, CODIGOGPS, CODIM' +
        'POSTO, IDPROGRAMA,'
      '  CODCENTROCUSTO, NVL(FLGCCUSTRATEIO, '#39'N'#39') AS FLGCCUSTRATEIO,'
      '  CODNATUREZA'
      'FROM '
      '  TIPOAGRE'
      'WHERE'
      '  CODTIPOCUSTAGREG = :PCODTIPOCUSTAGREG')
    ClientDataSet = Cds
    Left = 248
  end
  object sqlPlaconta: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACONTA, PLACCUST FROM PLANOCONTA '
      'WHERE PLANO = :PLANO AND '
      '               TRIM(PLACONTA) = TRIM(:PLACONTA)')
    ClientDataSet = cdsPlaconta
    Left = 657
    Top = 367
  end
  object cdsPlaconta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 657
    Top = 351
  end
  object cdsProgramaTF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 583
    Top = 368
  end
  object sqlProgramaTF: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PROGRAMA '
      'ORDER BY DESCPROGRAMA'
      '')
    ClientDataSet = cdsProgramaTF
    Left = 583
    Top = 352
  end
  object cdsNatuRendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 560
    Top = 144
  end
  object cdsCCustoContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 696
    Top = 144
  end
  object sqlCCustoContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CENT.CODCENTROCUSTO,'
      '  CENT.NOME,'
      '  CENT.CODEXTERNO,'
      '  CENT.IDPLANCENTCUST'
      'FROM'
      '  CONTASxCC CONT,CENTCUST CENT,'
      ' (SELECT IDPLANCENTCUST FROM PARAMGLOBAL) PLANO'
      'WHERE'
      '  (CONT.IDEMPRESA = :IDEMPRESA)              AND'
      '  (CONT.PLANO = :PLANO)                      AND'
      '  (RTRIM(CONT.PLACONTA) = RTRIM(:PLACONTA))  AND'
      '  (CONT.IDEMPRESA = CENT.IDEMPRESA)          AND'
      '  (CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO) AND'
      
        '  (CENT.ATIVO = '#39'S'#39') AND (CENT.IDPLANCENTCUST = PLANO.IDPLANCENT' +
        'CUST)'
      'ORDER BY CENT.NOME'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsCCustoContab
    Left = 696
    Top = 128
  end
end
