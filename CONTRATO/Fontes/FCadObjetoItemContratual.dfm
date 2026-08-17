inherited frmCadObjetoItemContratual: TfrmCadObjetoItemContratual
  Left = 35
  Top = 146
  HelpContext = 120009
  Caption = 'Cadastro de Serviço/Produto x Item Contratual'
  ClientHeight = 431
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 345
    inherited pnlMestre: TPanel
      Width = 763
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label3: TLabel
        Left = 232
        Top = 8
        Width = 25
        Height = 13
        Caption = 'Item'
      end
      object Label4: TLabel
        Left = 544
        Top = 8
        Width = 106
        Height = 13
        Caption = 'Data Base do Item'
      end
      object dbLookupComboContrato: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 209
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'60'#9'Contrato')
        DataField = 'IDCONTRATO'
        DataSource = ds
        LookupTable = qryContrato
        LookupField = 'IDCONTRATO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbLookupComboContratoChange
        OnExit = dbLookupComboContratoExit
      end
      object dbLookupComboItem: TwwDBLookupCombo
        Left = 232
        Top = 24
        Width = 305
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME_ITEM'#9'60'#9'Item')
        DataField = 'IDITEM'
        DataSource = ds
        LookupTable = qryItem
        LookupField = 'IDITEM'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dbLookupComboItemExit
      end
      object dbDataBase: TCMDateTimePicker
        Left = 544
        Top = 24
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATABASEITEM'
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
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 763
      Height = 283
      Tabs.Strings = (
        'Serviço/Produto'
        'Parcelas'
        'Rateio'
        'Observação')
      detdbGrids.Strings = (
        ''
        ''
        'dbgrdRateio'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 665
        Height = 224
        inherited tbsDet: TTabSheet
          Caption = 'Serviço/Produto'
          inherited dbgrdDet: TwwDBGrid
            Width = 657
            Height = 196
            DataSource = ds
            Visible = False
          end
          inherited pnlControlesDet: TPanel
            Width = 657
            Height = 196
            object Label5: TLabel
              Left = 8
              Top = 4
              Width = 94
              Height = 13
              Caption = 'Serviço/Produto'
            end
            object GroupBoxPropriedades: TGroupBox
              Left = 280
              Top = 8
              Width = 353
              Height = 65
              Caption = 'Propriedades'
              TabOrder = 2
              object Label7: TLabel
                Left = 16
                Top = 16
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object Label9: TLabel
                Left = 186
                Top = 16
                Width = 42
                Height = 13
                Caption = 'Medida'
              end
              object dbLookupComboMoeda: TwwDBLookupCombo
                Left = 16
                Top = 32
                Width = 162
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOEDESC'#9'10'#9'Descrição')
                DataField = 'MOECODIGO'
                DataSource = ds
                LookupTable = qryMoeda
                LookupField = 'MOECODIGO'
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object dbLookupComboMedida: TwwDBLookupCombo
                Left = 186
                Top = 32
                Width = 162
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCMEDIDA'#9'10'#9'Descrição')
                DataField = 'CODMEDIDA'
                DataSource = ds
                LookupTable = qryMedida
                LookupField = 'CODMEDIDA'
                TabOrder = 1
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
            object dbLookupComboObjeto: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOBJETO'#9'60'#9'NOMEOBJETO')
              DataField = 'IDOBJETO'
              DataSource = ds
              LookupTable = qryObjeto
              LookupField = 'IDOBJETO'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnEnter = dbLookupComboObjetoEnter
            end
            object GroupBoxTolerancia: TGroupBox
              Left = 8
              Top = 48
              Width = 257
              Height = 97
              Caption = 'Tolerância de Quantidades'
              TabOrder = 1
              object Label6: TLabel
                Left = 144
                Top = 49
                Width = 41
                Height = 13
                Caption = 'Inferior'
              end
              object Label8: TLabel
                Left = 16
                Top = 49
                Width = 48
                Height = 13
                Caption = 'Superior'
              end
              object DBSpinToleranciaMaisObjeto: TwwDBSpinEdit
                Left = 16
                Top = 64
                Width = 97
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'TOLERANCIAMAISOBJETO'
                DataSource = ds
                TabOrder = 2
                UnboundDataType = wwDefault
              end
              object DBRadioGroupTipoTolerancia: TDBRadioGroup
                Left = 16
                Top = 13
                Width = 225
                Height = 33
                Caption = 'Tipo'
                Columns = 2
                DataField = 'TIPOTOLERANCIAOBJETO'
                DataSource = ds
                Items.Strings = (
                  'Percentual'
                  'Valor absoluto')
                TabOrder = 0
                Values.Strings = (
                  'P'
                  'V')
              end
              object DBSpinToleranciaMenosObjeto: TwwDBSpinEdit
                Left = 144
                Top = 64
                Width = 97
                Height = 21
                Increment = 1
                MaxValue = 100
                DataField = 'TOLERANCIAMENOSOBJETO'
                DataSource = ds
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object GroupBoxValores: TGroupBox
              Left = 280
              Top = 80
              Width = 353
              Height = 65
              Caption = 'Valores'
              TabOrder = 3
              object Label2: TLabel
                Left = 22
                Top = 16
                Width = 66
                Height = 13
                Caption = 'Quantidade'
              end
              object Label10: TLabel
                Left = 100
                Top = 16
                Width = 78
                Height = 13
                Caption = 'Valor Unitário'
              end
              object Label11: TLabel
                Left = 228
                Top = 16
                Width = 63
                Height = 13
                Caption = 'Valor Total'
              end
              object DBValorUnitarioObjeto: TDBRealEdit
                Left = 100
                Top = 32
                Width = 118
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 1
                WordWrap = False
                OnExit = DBValorUnitarioObjetoExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALORUNITARIOOBJETO'
                DataSource = ds
              end
              object DBValorTotalObjeto: TDBRealEdit
                Left = 228
                Top = 32
                Width = 118
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clInactiveBorder
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Lines.Strings = (
                  '      0,00')
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALORTOTALOBJETO'
                DataSource = ds
              end
              object DBQtdeItem: TDBRealEdit
                Left = 22
                Top = 32
                Width = 67
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '         0')
                TabOrder = 0
                WordWrap = False
                OnExit = DBQtdeItemExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = False
                DataField = 'QTDEITEM'
                DataSource = ds
              end
            end
            object pnlPlanoPatroC: TPanel
              Left = 3
              Top = 150
              Width = 430
              Height = 39
              BevelOuter = bvNone
              TabOrder = 4
              object lblPlanoPrevC: TLabel
                Left = 8
                Top = -2
                Width = 33
                Height = 13
                Caption = 'Plano'
              end
              object lblPatroC: TLabel
                Left = 216
                Top = -2
                Width = 80
                Height = 13
                Caption = 'Patrocinadora'
              end
              object dblcPlanoPrevC: TwwDBLookupCombo
                Left = 8
                Top = 12
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPLANOPREV'
                DataSource = ds
                LookupTable = qryPlanoPrev
                LookupField = 'IDPLANOPREV'
                Options = [loColLines]
                Style = csDropDownList
                DropDownCount = 5
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcPatroC: TwwDBLookupCombo
                Left = 216
                Top = 12
                Width = 201
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'Nome')
                DataField = 'IDPATRO'
                DataSource = ds
                LookupTable = qryPatro
                LookupField = 'IDPESSOA'
                Options = [loColLines]
                Style = csDropDownList
                DropDownCount = 5
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
        object tbsParcelas: TTabSheet
          Caption = 'Parcelas'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 657
            Height = 196
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label12: TLabel
              Left = 8
              Top = 8
              Width = 141
              Height = 13
              Caption = 'Data Início da Cobrança'
            end
            object Label13: TLabel
              Left = 8
              Top = 64
              Width = 120
              Height = 13
              Caption = 'Número de Medições'
            end
            object Label14: TLabel
              Left = 368
              Top = 8
              Width = 128
              Height = 13
              Caption = 'Intervalo das Parcelas'
            end
            object Label15: TLabel
              Left = 368
              Top = 64
              Width = 115
              Height = 13
              Caption = 'Número de Parcelas'
            end
            object lblNomeIntervalo: TLabel
              Left = 488
              Top = 27
              Width = 73
              Height = 13
              AutoSize = False
            end
            object DBDataInicioCobranca: TCMDateTimePicker
              Left = 8
              Top = 24
              Width = 145
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIOCOBR'
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
              TabOrder = 0
            end
            object DBRadioGroupFrequencia: TDBRadioGroup
              Left = 176
              Top = 8
              Width = 165
              Height = 97
              Caption = 'Frequência das Parcelas'
              DataField = 'FREQUENCIA'
              DataSource = ds
              Items.Strings = (
                'Única'
                'Diária'
                'Mensal'
                'Anual')
              TabOrder = 1
              Values.Strings = (
                'U'
                'D'
                'M'
                'A')
            end
            object DBIntervalo: TDBRealEdit
              Left = 368
              Top = 24
              Width = 131
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 2
              WordWrap = False
              OnExit = DBValorUnitarioObjetoExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fFixed
              Signal = False
              DataField = 'INTERVALO'
              DataSource = ds
            end
            object DBNumeroParcelas: TDBRealEdit
              Left = 368
              Top = 80
              Width = 131
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 3
              WordWrap = False
              OnExit = DBValorUnitarioObjetoExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fFixed
              Signal = False
              DataField = 'NUMPARCELAS'
              DataSource = ds
            end
            object DBNumeroMedicoes: TDBRealEdit
              Left = 8
              Top = 80
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 4
              WordWrap = False
              OnExit = DBValorUnitarioObjetoExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fFixed
              Signal = False
              DataField = 'NUMMEDICOES'
              DataSource = ds
            end
          end
        end
        object tbsRateio: TTabSheet
          Caption = 'Rateio'
          object dbgrdRateio: TwwDBGrid
            Left = 0
            Top = 0
            Width = 657
            Height = 196
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'PERCRATEIOCONTR'#9'10'#9'Percentual'#9'F'
              'NOMEPROG'#9'45'#9'Programa'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
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
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 657
            Height = 196
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label20: TLabel
              Left = 296
              Top = 8
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label21: TLabel
              Left = 8
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object Label28: TLabel
              Left = 368
              Top = 24
              Width = 19
              Height = 19
              Caption = '%'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPrograma: TLabel
              Left = 8
              Top = 56
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object DBLookupComboCentroCusto: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 269
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = qryCentroCusto
              LookupField = 'CODCENTROCUSTO'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object DBPercentualRateio: TDBRealEdit
              Left = 296
              Top = 24
              Width = 63
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
              DataField = 'PERCRATEIOCONTR'
              DataSource = dsDet
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 8
              Top = 72
              Width = 269
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Descrição'
                'CODPROGRAMA'#9'2'#9'Código')
              DataField = 'IDPROGRAMA'
              DataSource = dsDet
              LookupTable = qryPrograma
              LookupField = 'IDPROGRAMA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object TabObs: TTabSheet
          Caption = 'Observação'
          object memObs: TDBMemo
            Left = 0
            Top = 0
            Width = 649
            Height = 188
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = ds
            MaxLength = 250
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 755
      end
      inherited Dock974: TDock97
        Left = 669
        Height = 224
      end
    end
  end
  inherited Dock972: TDock97
    Width = 765
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 485
      DockPos = 485
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120009
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 316
      DockPos = 316
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 786
    Top = 65527
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 400
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 248
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OBJETOSXITEMCONTR'
      'set'
      '  IDCONTRATO = :IDCONTRATO,'
      '  IDOBJETO = :IDOBJETO,'
      '  IDITEM = :IDITEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  MOECODIGO = :MOECODIGO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  DATABASEITEM = :DATABASEITEM,'
      '  QTDEITEM = :QTDEITEM,'
      '  VALORUNITARIOOBJETO = :VALORUNITARIOOBJETO,'
      '  VALORTOTALOBJETO = :VALORTOTALOBJETO,'
      '  TIPOTOLERANCIAOBJETO = :TIPOTOLERANCIAOBJETO,'
      '  TOLERANCIAMAISOBJETO = :TOLERANCIAMAISOBJETO,'
      '  TOLERANCIAMENOSOBJETO = :TOLERANCIAMENOSOBJETO,'
      '  NUMMEDICOES = :NUMMEDICOES,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  FREQUENCIA = :FREQUENCIA,'
      '  INTERVALO = :INTERVALO,'
      '  DATAINICIOCOBR = :DATAINICIOCOBR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM')
    InsertSQL.Strings = (
      'insert into OBJETOSXITEMCONTR'
      
        '  (IDCONTRATO, IDOBJETO, IDITEM, IDPESSOA, MOECODIGO, CODMEDIDA,' +
        ' DATABASEITEM, '
      
        '   QTDEITEM, VALORUNITARIOOBJETO, VALORTOTALOBJETO, TIPOTOLERANC' +
        'IAOBJETO, '
      
        '   TOLERANCIAMAISOBJETO, TOLERANCIAMENOSOBJETO, NUMMEDICOES, NUM' +
        'PARCELAS, '
      
        '   FREQUENCIA, INTERVALO, DATAINICIOCOBR, OBSERVACAO, IDPATRO, I' +
        'DPLANOPREV, '
      '   IDPROGRAMA)'
      'values'
      
        '  (:IDCONTRATO, :IDOBJETO, :IDITEM, :IDPESSOA, :MOECODIGO, :CODM' +
        'EDIDA, '
      
        '   :DATABASEITEM, :QTDEITEM, :VALORUNITARIOOBJETO, :VALORTOTALOB' +
        'JETO, :TIPOTOLERANCIAOBJETO, '
      
        '   :TOLERANCIAMAISOBJETO, :TOLERANCIAMENOSOBJETO, :NUMMEDICOES, ' +
        ':NUMPARCELAS, '
      
        '   :FREQUENCIA, :INTERVALO, :DATAINICIOCOBR, :OBSERVACAO, :IDPAT' +
        'RO, :IDPLANOPREV, '
      '   :IDPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from OBJETOSXITEMCONTR'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM')
    Left = 280
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'C.NOMECONTRATO'
      'OC.NOMEOBJETO'
      'IC.NOME_ITEM'
      'O.DATABASEITEM')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Contrato'
      'Objeto'
      'Item'
      'Data Base do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OBJETOSXITEMCONTR O'
      'CONTRATOCONTR C'
      'OBJETOCONTRATUAL OC'
      'ITEMCONTRATUAL IC')
    CamposChave.Strings = (
      'O.IDCONTRATO'
      'O.IDOBJETO'
      'O.IDITEM')
    Filtro.Strings = (
      '(OC.IDOBJETO = O.IDOBJETO)'
      '(IC.IDITEM = O.IDITEM)'
      '(C.IDCONTRATO = O.IDCONTRATO)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '60'
      '60'
      '10')
    Left = 352
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 398
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      IDCONTRATO,'
      '      IDOBJETO,'
      '      IDITEM,'
      '      IDPESSOA,'
      '      MOECODIGO,'
      '      CODMEDIDA,'
      '      DATABASEITEM,'
      '      QTDEITEM,'
      '      VALORUNITARIOOBJETO,'
      '      VALORTOTALOBJETO,'
      '      TIPOTOLERANCIAOBJETO,'
      '      TOLERANCIAMAISOBJETO,'
      '      TOLERANCIAMENOSOBJETO,'
      '      NUMMEDICOES,'
      '      NUMPARCELAS,'
      '      FREQUENCIA,'
      '      INTERVALO,'
      '      DATAINICIOCOBR,'
      '      OBSERVACAO,'
      '      IDPATRO,'
      '      IDPLANOPREV,'
      '      IDPROGRAMA'
      'FROM'
      '    OBJETOSXITEMCONTR'
      'WHERE'
      '     (IDCONTRATO = :IDCONTRATO)'
      ' AND (IDOBJETO = :IDOBJETO)'
      ' AND (IDITEM = :IDITEM)')
    Left = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object qryIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryDATABASEITEM: TDateTimeField
      FieldName = 'DATABASEITEM'
    end
    object qryQTDEITEM: TFloatField
      FieldName = 'QTDEITEM'
    end
    object qryVALORUNITARIOOBJETO: TFloatField
      FieldName = 'VALORUNITARIOOBJETO'
    end
    object qryVALORTOTALOBJETO: TFloatField
      FieldName = 'VALORTOTALOBJETO'
    end
    object qryTIPOTOLERANCIAOBJETO: TStringField
      FieldName = 'TIPOTOLERANCIAOBJETO'
      Size = 1
    end
    object qryTOLERANCIAMAISOBJETO: TFloatField
      FieldName = 'TOLERANCIAMAISOBJETO'
    end
    object qryTOLERANCIAMENOSOBJETO: TFloatField
      FieldName = 'TOLERANCIAMENOSOBJETO'
    end
    object qryNUMMEDICOES: TFloatField
      FieldName = 'NUMMEDICOES'
    end
    object qryNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryFREQUENCIA: TStringField
      FieldName = 'FREQUENCIA'
      Size = 1
    end
    object qryINTERVALO: TFloatField
      FieldName = 'INTERVALO'
    end
    object qryDATAINICIOCOBR: TDateTimeField
      FieldName = 'DATAINICIOCOBR'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object qryIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'OBJETOSXITEMCONTR.IDPATRO'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'OBJETOSXITEMCONTR.IDPLANOPREV'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'OBJETOSXITEMCONTR.IDPROGRAMA'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 464
    Top = 60
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NOMECONTRATO,'
      '   IDCONTRATO,'
      '   IDPESSOA,'
      '   DATABASECONTRATO,'
      '   FLGFIMCONTRATO'
      'FROM'
      '   CONTRATOCONTR'
      'WHERE (IDPESSOA = :IDPessoa) AND'
      '      (IDCONTRATO IN (SELECT'
      '                         IDCONTRATO'
      '                      FROM'
      '                         CONTRATOUSUARIO'
      '                      WHERE IDUSUARIO = :IDUsuario))'
      'ORDER BY NOMECONTRATO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 693
    Top = 259
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'IDUsuario'
        ParamType = ptUnknown
      end>
    object qryContratoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = '"CM.CONTRATOCONTR".NOMECONTRATO'
      Size = 60
    end
    object qryContratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = '"CM.CONTRATOCONTR".IDCONTRATO'
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.CONTRATOCONTR".IDPESSOA'
    end
    object qryContratoDATABASECONTRATO: TDateTimeField
      FieldName = 'DATABASECONTRATO'
      Origin = '"CM.CONTRATOCONTR".DATABASECONTRATO'
    end
    object qryContratoFLGFIMCONTRATO: TStringField
      FieldName = 'FLGFIMCONTRATO'
      Origin = '"CM.CONTRATOCONTR".FLGFIMCONTRATO'
      Size = 1
    end
  end
  object qryObjeto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.IDOBJETO,'
      'O.IDPESSOA,O.CODARTIGO,O.NOMEOBJETO,O.TIPOOBJETO'
      'FROM OBJETOCONTRATUAL O, OBJETOXITEM I'
      'WHERE'
      '(O.IDPESSOA = :IDPESSOA) AND'
      '(I.IDITEM = :IDITEM) AND '
      '(O.IDOBJETO = I.IDOBJETO)'
      'ORDER BY NOMEOBJETO')
    ValidateWithMask = True
    Left = 565
    Top = 55
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
  end
  object qryItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDITEM,IDPESSOA,NOME_ITEM,TIPOCOBRANCA'
      'FROM ITEMCONTRATUAL'
      'WHERE'
      '(IDPESSOA = :IDPESSOA) '
      'ORDER BY NOME_ITEM')
    ValidateWithMask = True
    Left = 693
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'MOECODIGO,MOEDESC'
      'FROM'
      'MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 565
    Top = 29
  end
  object qryMedida: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'CODMEDIDA,DESCMEDIDA'
      'FROM'
      'UNMEDIDA'
      'ORDER BY DESCMEDIDA')
    ValidateWithMask = True
    Left = 565
    Top = 16
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 645
    Top = 3
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDEMPRESA) AND'
      '      (STATUSGRUPOCDC = '#39'A'#39') '
      '      AND (ATIVO='#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 566
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(PERCRATEIOCONTR) AS SUMPERCRATEIOCONTR'
      'FROM RATEIOCENTROCUSTO'
      'WHERE'
      '   ( RATEIOCENTROCUSTO.IDCONTRATO = :IDCONTRATO)'
      '   AND ( RATEIOCENTROCUSTO.IDOBJETO = :IDOBJETO)'
      '   AND ( RATEIOCENTROCUSTO.IDITEM = :IDITEM)'
      '      '
      ' ')
    ValidateWithMask = True
    Left = 506
    Top = 99
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryRateioSUMPERCRATEIOCONTR: TFloatField
      FieldName = 'SUMPERCRATEIOCONTR'
      Origin = '"CM.RATEIOCENTROCUSTO".PERCRATEIOCONTR'
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '     R.IDCONTRATO,'
      '     R.IDOBJETO,'
      '     R.IDITEM,'
      '     R.IDEMPRESA,'
      '     R.CODCENTROCUSTO,'
      '     R.PERCRATEIOCONTR,'
      '     R.IDPROGRAMA,'
      '     P.DESCPROGRAMA AS NOMEPROG,'
      '     C.NOME'
      'FROM'
      '    RATEIOCENTROCUSTO R,'
      '    CENTCUST C,'
      '    PROGRAMA P'
      'WHERE'
      '    (R.IDEMPRESA = C.IDEMPRESA) AND'
      '    (R.IDPROGRAMA = P.IDPROGRAMA(+))'
      '    AND (R.CODCENTROCUSTO = C.CODCENTROCUSTO)'
      '    AND (R.IDCONTRATO = :IDCONTRATO)'
      '    AND (R.IDOBJETO = :IDOBJETO)'
      '    AND (R.IDITEM = :IDITEM)'
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 356
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIOCENTROCUSTO'
      'set'
      '  IDCONTRATO = :IDCONTRATO,'
      '  IDOBJETO = :IDOBJETO,'
      '  IDITEM = :IDITEM,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PERCRATEIOCONTR = :PERCRATEIOCONTR,'
      '  IDPROGRAMA = :IDPROGRAMA'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    InsertSQL.Strings = (
      'insert into RATEIOCENTROCUSTO'
      
        '  (IDCONTRATO, IDOBJETO, IDITEM, IDEMPRESA, CODCENTROCUSTO, PERC' +
        'RATEIOCONTR, '
      '   IDPROGRAMA)'
      'values'
      
        '  (:IDCONTRATO, :IDOBJETO, :IDITEM, :IDEMPRESA, :CODCENTROCUSTO,' +
        ' :PERCRATEIOCONTR, '
      '   :IDPROGRAMA)')
    DeleteSQL.Strings = (
      'delete from RATEIOCENTROCUSTO'
      'where'
      '  IDCONTRATO = :OLD_IDCONTRATO and'
      '  IDOBJETO = :OLD_IDOBJETO and'
      '  IDITEM = :OLD_IDITEM and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    Left = 448
    Top = 2
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 696
    Top = 111
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    ValidateWithMask = True
    Left = 696
    Top = 99
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA'
      'FROM PROGRAMA'
      'ORDER BY CODPROGRAMA')
    ValidateWithMask = True
    Left = 696
    Top = 85
  end
end
