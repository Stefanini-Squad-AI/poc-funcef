inherited frmCadEmpAcoesMT: TfrmCadEmpAcoesMT
  Left = 130
  Top = 67
  Caption = 'frmCadEmpAcoesMT'
  ClientHeight = 589
  ClientWidth = 952
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 952
    Height = 503
    inherited pnlMestre: TPanel
      Width = 950
      Height = 197
      inherited pnlDados: TPanel [0]
        Width = 950
        Height = 166
        TabOrder = 0
        object lblDataOper: TLabel
          Left = 13
          Top = 19
          Width = 32
          Height = 13
          Caption = 'Data '
        end
        object lbPlanPrev: TLabel
          Left = 157
          Top = 19
          Width = 127
          Height = 13
          Caption = 'Plano e Patrocinadora'
        end
        object lblInvestimento: TLabel
          Left = 157
          Top = 60
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object lblCustodiante: TLabel
          Left = 156
          Top = 103
          Width = 68
          Height = 13
          Caption = 'Custodiante'
        end
        object lblVencimento: TLabel
          Left = 14
          Top = 60
          Width = 67
          Height = 13
          Caption = 'Vencimento'
        end
        object dtOperacao: TCMDateTimePicker
          Left = 13
          Top = 33
          Width = 137
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAOPERACAO'
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
        object dblkPlanPrev: TwwDBLookupCombo
          Left = 157
          Top = 33
          Width = 291
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
          DataField = 'IDPLANPREVCTBPATR'
          DataSource = ds
          LookupTable = cdsPlanoPatro
          LookupField = 'IDPLANPREVCTBPATR'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblInvestimento: TwwDBLookupCombo
          Left = 156
          Top = 75
          Width = 291
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
          DataField = 'IDINVESTIMENTO'
          DataSource = ds
          LookupTable = cdsInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblCustodiante: TwwDBLookupCombo
          Left = 156
          Top = 118
          Width = 291
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SGLCUSTODIANTE'#9'30'#9'Descrição'#9'F')
          DataField = 'IDCUSTODIANTE'
          DataSource = ds
          LookupTable = cdsCustodiante
          LookupField = 'IDCUSTODIANTE'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblCustodianteExit
        end
        object dtVencimento: TCMDateTimePicker
          Left = 14
          Top = 75
          Width = 137
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVENCOPER'
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
          TabOrder = 1
        end
        object pnlDadosEmp: TPanel
          Left = 464
          Top = 2
          Width = 484
          Height = 162
          Align = alRight
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 5
          object lblPreco: TLabel
            Left = 329
            Top = 32
            Width = 34
            Height = 13
            Caption = 'Preço'
          end
          object LblTipoConta: TLabel
            Left = 17
            Top = 32
            Width = 63
            Height = 13
            Caption = 'Tipo Conta'
          end
          object lblQuantidade: TLabel
            Left = 17
            Top = 73
            Width = 66
            Height = 13
            Caption = 'Quantidade'
          end
          object lblValor: TLabel
            Left = 172
            Top = 73
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object lblTaxa: TLabel
            Left = 329
            Top = 74
            Width = 29
            Height = 13
            Caption = 'Taxa'
          end
          object lblFlgPreco: TLabel
            Left = 172
            Top = 32
            Width = 75
            Height = 13
            Caption = 'Dia do Preço'
          end
          object lblVlrEmprestimo: TLabel
            Left = 17
            Top = 117
            Width = 116
            Height = 13
            Caption = 'Valor do Empréstimo'
          end
          object lblVlrMaxResgate: TLabel
            Left = 172
            Top = 117
            Width = 145
            Height = 13
            Caption = 'Valor Máximo do Resgate'
          end
          object dbrePreco: TDBRealEdit
            Tag = -4
            Left = 329
            Top = 47
            Width = 137
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000000')
            TabOrder = 2
            WordWrap = False
            OnExit = dbrePrecoExit
            IntDigits = 15
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
            DataField = 'PUOPERACAO'
            DataSource = ds
          end
          object dbreQuantidade: TDBRealEdit
            Tag = -4
            Left = 17
            Top = 88
            Width = 136
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            OnExit = dbreQuantidadeExit
            IntDigits = 15
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
            DataField = 'QTDOPERACAO'
            DataSource = ds
          end
          object dbreValor: TDBRealEdit
            Tag = -4
            Left = 172
            Top = 87
            Width = 137
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
            DataSource = ds
          end
          object dbreTaxa: TDBRealEdit
            Tag = -4
            Left = 329
            Top = 88
            Width = 137
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,000000')
            TabOrder = 5
            WordWrap = False
            OnExit = dbreTaxaExit
            IntDigits = 12
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
            DataField = 'TAXAOPERACAO'
            DataSource = ds
          end
          object dbcFlgPreco: TwwDBComboBox
            Left = 172
            Top = 47
            Width = 137
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGPRECO'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'Ontem'#9'O'
              'Hoje'#9'H'
              'Vencimento'#9'V')
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = dbcFlgPrecoExit
            OnKeyDown = FormKeyDown
          end
          object dbreVlrEmprestimo: TDBRealEdit
            Tag = -4
            Left = 17
            Top = 131
            Width = 137
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALOREMPRESTIMO'
            DataSource = ds
          end
          object dbreVlrMaxResgate: TDBRealEdit
            Tag = -4
            Left = 172
            Top = 132
            Width = 137
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRRESGATE'
            DataSource = ds
          end
          object dbcFlgEmpAcoes: TdxDBCheckEdit
            Left = 326
            Top = 121
            Width = 155
            Style.ButtonStyle = bts3D
            TabOrder = 8
            Caption = 'Permite reversão antes do vencimento ?'
            DataField = 'FLGREVERSAO'
            DataSource = ds
            ValueChecked = 'S'
            ValueGrayed = 'S'
            ValueUnchecked = 'N'
            MultiLine = True
          end
          object PnlSaldoEmp: TPanel
            Left = 2
            Top = 2
            Width = 480
            Height = 25
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvLowered
            BevelOuter = bvNone
            Caption = ' Saldo para Empréstimo'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            object lblSaldoCC: TfcLabel
              Left = 284
              Top = 3
              Width = 37
              Height = 19
              Caption = '0 CC'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TextOptions.Alignment = taRightJustify
              TextOptions.ShadeColor = clNavy
              TextOptions.Shadow.Color = clNavy
              TextOptions.VAlignment = vaVCenter
            end
            object lblSaldoCCI: TfcLabel
              Left = 416
              Top = 2
              Width = 41
              Height = 19
              Caption = '0 CCI'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TextOptions.Alignment = taRightJustify
              TextOptions.ShadeColor = clNavy
              TextOptions.Shadow.Color = clNavy
              TextOptions.VAlignment = vaVCenter
            end
          end
          object dbcFlgTipoConta: TwwDBComboBox
            Left = 17
            Top = 47
            Width = 137
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = True
            AutoDropDown = True
            DataField = 'FLGTIPOCONTA'
            DataSource = ds
            DropDownCount = 8
            ItemHeight = 0
            Items.Strings = (
              'CC'#9'0'
              'CCI'#9'1')
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
            OnExit = dbcFlgTipoContaExit
            OnKeyDown = FormKeyDown
          end
        end
      end
      inherited pnlTitulo: TPanel [1]
        Width = 950
        TabOrder = 1
        inherited lbNomItem: TfcLabel
          Width = 223
          Caption = 'Empréstimo de Ações'
          TextOptions.VAlignment = vaVCenter
        end
        object lblUltimoFechamento: TfcLabel
          Left = 703
          Top = 6
          Width = 238
          Height = 19
          Caption = 'Último Fechamento: 10/10/2005'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaVCenter
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 198
      Width = 950
      Height = 304
      Tabs.Strings = (
        'Histórico'
        'Resgates')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgResgates')
      inherited pgctrlDetalhe: TPageControl
        Width = 852
        Height = 245
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 844
            Height = 217
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 844
            Height = 217
            Selected.Strings = (
              'DATAHISTEMPACOES'#9'12'#9'Data'
              'DESCTIPOOPERACAO'#9'44'#9'Operação'
              'QTDHISTEMPACOES'#9'11'#9'Qtd Movim.'
              'SLDQTDHISTEMPACOE'#9'13'#9'Saldo de Qtd.'
              'VLRHISTEMPACOES'#9'15'#9'Valor Movim.'
              'SLDHISTEMPACOES'#9'16'#9'Saldo'
              'VLRJUROSIMPORTA'#9'10'#9'Juros Movim.'
              'SLDJUROSIMPORTA'#9'10'#9'Saldo Juros'
              'VLRJUROSEST'#9'10'#9'Juros Estornado'
              'VLRPRINCIPAL'#9'10'#9'Vlr. Principal Movim.'
              'SLDPRINCIPAL'#9'10'#9'Saldo Principal'
              'VLRFINAL'#9'14'#9'Valor Final Movim.'
              'SLDFINAL'#9'13'#9'Saldo Valor Final')
            ParentFont = False
            TitleFont.Color = clMaroon
            OnDblClick = nil
          end
        end
        object tbsResgates: TTabSheet
          Caption = 'Resgates / Reversão'
          ImageIndex = 1
          object dbgResgates: TwwDBGrid
            Left = 0
            Top = 0
            Width = 844
            Height = 217
            Selected.Strings = (
              'DATAOPERACAO'#9'11'#9'Data'
              'QTDOPERACAO'#9'12'#9'Quantidade'
              'VLROPERACAO'#9'17'#9'Valor da Operação'
              'VLRJUROS'#9'14'#9'Valor de Juros'
              'VLRIR'#9'8'#9'I.R.'
              'VLRPRINCIPAL'#9'17'#9'Principal Revertido'
              'VLRRESGATE'#9'17'#9'Valor Final Revertido'
              'VLRJUROSEST'#9'13'#9'Juros Estornado'
              'CODDOCUMENTO'#9'10'#9'Cod.Documento'
              'PLNCODIGO'#9'10'#9'Cod.Planilha'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsResgates
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = PintaGridZebrado
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
            OnTopRowChanged = GridRefresh
          end
          object pnlResgates: TPanel
            Left = 0
            Top = 0
            Width = 844
            Height = 217
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 31
              Top = 31
              Width = 32
              Height = 13
              Caption = 'Data '
            end
            object Label2: TLabel
              Left = 31
              Top = 74
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label3: TLabel
              Left = 185
              Top = 75
              Width = 106
              Height = 13
              Caption = 'Valor da Reversão'
            end
            object lblVlrJuros: TLabel
              Left = 339
              Top = 74
              Width = 136
              Height = 13
              Caption = 'Valor de Juros revertido'
            end
            object lblIR: TLabel
              Left = 493
              Top = 74
              Width = 22
              Height = 13
              Caption = 'I.R.'
            end
            object Label4: TLabel
              Left = 339
              Top = 118
              Width = 109
              Height = 13
              Caption = 'Principal Revertido'
            end
            object Label5: TLabel
              Left = 493
              Top = 118
              Width = 110
              Height = 13
              Caption = 'Vlr. Final Revertido'
            end
            object Label6: TLabel
              Left = 645
              Top = 118
              Width = 96
              Height = 13
              Caption = 'Juros Revertidos'
            end
            object dtDataResg: TCMDateTimePicker
              Left = 31
              Top = 45
              Width = 137
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsResgates
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
              OnExit = dtDataResgExit
            end
            object pnlSldRev: TPanel
              Left = 186
              Top = 41
              Width = 445
              Height = 25
              Alignment = taLeftJustify
              BevelInner = bvLowered
              BevelOuter = bvNone
              Caption = ' Saldo para Reversão'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object lblQtdResg: TfcLabel
                Left = 416
                Top = 2
                Width = 9
                Height = 19
                Caption = '0'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                TextOptions.Alignment = taRightJustify
                TextOptions.ShadeColor = clNavy
                TextOptions.Shadow.Color = clNavy
                TextOptions.VAlignment = vaVCenter
              end
            end
            object dbrQtdResg: TDBRealEdit
              Tag = -4
              Left = 31
              Top = 89
              Width = 136
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '5')
              TabOrder = 2
              WordWrap = False
              OnExit = dbrQtdResgExit
              IntDigits = 15
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDOPERACAO'
              DataSource = dsResgates
            end
            object dbrVlrResg: TDBRealEdit
              Tag = -4
              Left = 185
              Top = 89
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '277,94')
              TabOrder = 3
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsResgates
            end
            object dbreVlrJurosResg: TDBRealEdit
              Tag = -4
              Left = 339
              Top = 89
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,44')
              TabOrder = 4
              WordWrap = False
              OnExit = dbreVlrJurosResgExit
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRJUROS'
              DataSource = dsResgates
            end
            object dbrVlrIRResg: TDBRealEdit
              Tag = -4
              Left = 493
              Top = 89
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000')
              TabOrder = 5
              WordWrap = False
              IntDigits = 12
              DecDigits = 6
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = dsResgates
            end
            object dbrVlrPrincResg: TDBRealEdit
              Tag = -4
              Left = 339
              Top = 133
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '277,50')
              TabOrder = 6
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPRINCIPAL'
              DataSource = dsResgates
            end
            object dbrVlrFinResg: TDBRealEdit
              Tag = -4
              Left = 493
              Top = 133
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '286,63')
              TabOrder = 7
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRRESGATE'
              DataSource = dsResgates
            end
            object dbrVlrJurosEst: TDBRealEdit
              Tag = -4
              Left = 645
              Top = 133
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 12
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRJUROSEST'
              DataSource = dsResgates
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 942
      end
      inherited Dock974: TDock97
        Left = 856
        Height = 245
      end
    end
  end
  inherited Dock972: TDock97
    Width = 952
    inherited Toolbar971: TToolbar97
      object sbtnTransferir: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Transferir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 9
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnTransferirClick
      end
      object sbtnImprimir: TToolbarButton97
        Left = 300
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'I&mprimir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 11
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        WordWrap = True
        OnClick = sbtnImprimirClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 550
    Width = 952
    inherited tb97Fundo: TToolbar97
      Left = 780
      DockPos = 1069
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 611
      DockPos = 900
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 375
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 520
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 376
    Top = 7
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F00000000007F7F7F000000
      00007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF0000000000FFFFFF00FFFFFF007F7F7F00FFFFFF00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF007F7F7F007F7F7F00000000007F7F7F00FFFFFF007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF0000000000000000007F7F7F00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      FF000000FF000000FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00FFFFFF0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007F7F7F00FFFFFF000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007F7F7F00FFFFFF000000
      0000000000007F7F7F00FFFFFF00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF007F7F7F00FFFFFF00000000000000000000000000FFFFFF007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
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
      0000000000000000000000840000008400000084000000840000008400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008400000084000000840000008400000084000000840000008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      0000008400000084000000000000000000000084000000840000008400000084
      0000008400000084000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00000000000000000000000000000000000000000000000000008484840000FF
      000000840000FFFFFF00FFFFFF00FFFFFF000000000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008400000084
      00000084000000840000008400000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      000084000000000000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      000000840000008400000084000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      000000840000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF000000000000840000FFFFFF00FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      000084000000840000000000000000000000000000008484840000FF00000084
      000000840000FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000008400000084000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000000000000000000008484840000FF
      000000840000008400000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00008400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      00008400000084000000000000000000000000000000000000008484840000FF
      0000008400000084000000840000008400000084000000840000008400000084
      00000084000000840000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000008484
      840000FF000000FF000000840000008400000084000000840000008400000084
      00000084000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000848484008484840000FF000000FF000000FF000000FF000000FF00008484
      8400848484000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000E423000000000000E053000000000000
      E483000000000000E107000000000000E42F000000000000E11F000000000000
      E03F000000000000E07F000000000000FFFF8000FFE08001FFFF8000FFC00000
      FFFFC000FFCC0000FFFFE000FFCC0000FFFFF000FFC00000FFFFF800FFC10000
      E007FC00FFFB0000F00FFE00FFF10000F81FFF00FFE0E007FC3FFF80C180E007
      FE7F83808180E007FFFF83E099E1E007FFFF83E099E1E00FFFFF83E081C3E01F
      FFFF83848387E03FFFFFFFFEFFFFE07FFC1FFFFFFFFFFFFFF007F83FF83FF83F
      E003E00FE00FE00FC301C007C007C007C0818003800380038040800380038003
      8020000100010001811000010001008181080001000100818008000100010101
      C001000100010081C001800380038283E003800380038023F007C007C007C007
      FC1FE00FE00FE00FFFFFF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 456
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 492
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPEREMPACOES.IDBOLETA'
      'OPEREMPACOES.DATAOPERACAO'
      'OPEREMPACOES.DATAVENCOPER'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CUSTODIANTE.SGLCUSTODIANTE'
      'OPEREMPACOES.QTDOPERACAO'
      'OPEREMPACOES.TAXAOPERACAO'
      'OPEREMPACOES.VLROPERACAO'
      'OPEREMPACOES.NUMCONTRATOCUSTODIA')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Boleta'
      'Data da Operação'
      'Data de Vencimento'
      'Plano / Patro'
      'Investimento'
      'Custodiante'
      'Quantidade'
      'Taxa'
      'Valor da Operação'
      'Número do Contrato')
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
      'OPEREMPACOES'
      'VWPLANPREVCTBPATR'
      'INVESTIMENTO'
      'CUSTODIANTE')
    CamposChave.Strings = (
      'OPEREMPACOES.IDOPEREMPACOES'
      'OPEREMPACOES.IDOPEREMPACOESAP'
      'OPEREMPACOES.NUMCONTRATOCUSTODIA')
    Filtro.Strings = (
      
        'OPEREMPACOES.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVCTB' +
        'PATR'
      'OPEREMPACOES.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPEREMPACOES.IDCUSTODIANTE = CUSTODIANTE.IDCUSTODIANTE')
    Mascaras.Strings = (
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '#.###'
      '#,###.000%'
      '#,###.00'
      '')
    Larguras.Strings = (
      '10'
      '18'
      '18'
      '113'
      '60'
      '10'
      '10'
      '10'
      '10'
      '20')
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
    Left = 416
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 172
    Top = 239
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 228
    Top = 215
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDetAfterOpen
    Left = 207
    Top = 158
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT DATAOPERACAO, DATAVENCOPER,'
      
        '       VLROPERACAO, QTDOPERACAO, PUOPERACAO, TAXAOPERACAO, VLRIR' +
        ', FLGREVERSAO, FLGPRECO, VLRRESGATE, VLRJUROS,'
      
        '       0 AS VLRRESGATEATU, VLRRESGATE-VLROPERACAO AS VALOREMPRES' +
        'TIMO,'
      '       CODDOCUMENTO, PLNCODIGO, PLANO, TIPOCONFIRMADO,'
      
        '       IDOPEREMPACOES, IDOPEREMPACOESAP, IDPLANPREVCTBPATR, IDCA' +
        'RTEIRAINVEST, IDINVESTIMENTO, IDTIPOOPERACAO,'
      
        '       IDTIPOINVEST, IDCUSTODIANTE, IDBOLETA, NVL(FLGTIPOCONTA,0' +
        ') AS FLGTIPOCONTA, NUMCONTRATOCUSTODIA'
      'FROM OPEREMPACOES'
      'WHERE IDOPEREMPACOES = IDOPEREMPACOESAP'
      '  AND IDOPEREMPACOESAP = 4'
      'ORDER BY DATAOPERACAO, IDOPEREMPACOES'
      ' ')
    ClientDataSet = Cds
    Left = 548
    Top = 8
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT H.DATAHISTEMPACOES,'
      '       T.DESCTIPOOPERACAO,'
      '       NVL(H.QTDHISTEMPACOES, 0) AS QTDHISTEMPACOES,'
      '       NVL(H.SLDQTDHISTEMPACOE, 0) AS SLDQTDHISTEMPACOE,'
      '       NVL(H.VLRHISTEMPACOES, 0) AS VLRHISTEMPACOES,'
      '       NVL(H.SLDHISTEMPACOES, 0) AS SLDHISTEMPACOES,'
      
        '       NVL(H.VLRJUROS, 0) AS VLRJUROS, NVL(H.VLRJUROSEST, 0) AS ' +
        'VLRJUROSEST, NVL(H.SLDJUROS, 0) AS SLDJUROS,        NVL(H.VLRFIN' +
        'AL, 0) AS VLRFINAL, NVL(H.SLDFINAL, 0) AS SLDFINAL,'
      
        '       NVL(H.VLRPRINCIPAL, 0) AS VLRPRINCIPAL, NVL(H.SLDPRINCIPA' +
        'L, 0) AS SLDPRINCIPAL,'
      '       H.IDOPEREMPACOESAP'
      'FROM HISTEMPACOES H, TIPOOPERACAO T'
      'WHERE H.IDOPEREMPACOESAP = 4'
      '  AND H.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      'ORDER BY H.DATAHISTEMPACOES, H.IDHISTEMPACOES'
      ' ')
    ClientDataSet = cdsDet
    Left = 294
    Top = 241
  end
  object cdsPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 405
    Top = 105
  end
  object CMSqlParams3: TCMSqlParams
    SQL.Strings = (
      'select * from vwplanprevctbpatr')
    ClientDataSet = cdsPlanoPatro
    Left = 361
    Top = 104
  end
  object cdsTipoOperacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 7
  end
  object CMSqlParams4: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERACAO, FLGGERAC' +
        'ONTAB, FLGGERACAPCAR,'
      '    CODTIPDOC, VENCIMENTO, IDMERCADO, FLGTRATAIR'
      'FROM'
      '    TIPOOPERACAO'
      'WHERE'
      '     (IDTIPOINVEST = 2)     '
      'ORDER BY IDTIPOOPERACAO DESC')
    ClientDataSet = cdsTipoOperacao
    Left = 653
    Top = 7
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 145
  end
  object CMSqlParams5: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDINVESTIMENTO,DESCINVESTIMENTO'
      'FROM'
      '   INVESTIMENTO'
      'WHERE '
      '   IDTIPOINVEST=2'
      'ORDER BY DESCINVESTIMENTO')
    ClientDataSet = cdsInvestimento
    Left = 361
    Top = 144
  end
  object cdsCustodiante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 185
  end
  object CMSqlParams6: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDCUSTODIANTE,SGLCUSTODIANTE'
      'FROM'
      '   CUSTODIANTE'
      'ORDER BY SGLCUSTODIANTE')
    ClientDataSet = cdsCustodiante
    Left = 361
    Top = 184
  end
  object cdsResgates: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsResgatesAfterOpen
    Left = 375
    Top = 239
  end
  object CMSqlParams7: TCMSqlParams
    SQL.Strings = (
      'SELECT DATAOPERACAO, DATAVENCOPER, '
      
        '       VLROPERACAO, QTDOPERACAO, PUOPERACAO, TAXAOPERACAO, VLRIR' +
        ', FLGREVERSAO, FLGPRECO, VLRRESGATE, VLRJUROS, '
      
        '       0 AS VLRRESGATEATU, VLRRESGATE-VLROPERACAO AS VALOREMPRES' +
        'TIMO, VLROPERACAO-VLRJUROS AS VLRPRINCIPAL, VLRJUROSEST, '
      '       CODDOCUMENTO, PLNCODIGO, PLANO, TIPOCONFIRMADO, '
      
        '       IDOPEREMPACOES, IDOPEREMPACOESAP, IDPLANPREVCTBPATR, IDCA' +
        'RTEIRAINVEST, IDINVESTIMENTO, IDTIPOOPERACAO, '
      
        '       IDTIPOINVEST, IDCUSTODIANTE, IDBOLETA, NVL(FLGTIPOCONTA,0' +
        ') AS FLGTIPOCONTA '
      'FROM OPEREMPACOES '
      'WHERE IDOPEREMPACOES <> IDOPEREMPACOESAP '
      '  AND IDOPEREMPACOESAP = 45'
      'ORDER BY DATAOPERACAO, IDOPEREMPACOES')
    ClientDataSet = cdsResgates
    Left = 544
    Top = 245
  end
  object dsResgates: TwwDataSource
    AutoEdit = False
    DataSet = cdsResgates
    Left = 470
    Top = 225
  end
  object CdsCarteiraInvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 283
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 668
    Top = 239
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.DATAHISTEMPACOES, '
      '                  T.DESCTIPOOPERACAO, '
      '                  NVL(H.VLRHISTEMPACOES, 0) AS VLRHISTEMPACOES, '
      '                  NVL(H.SLDHISTEMPACOES, 0) AS SLDHISTEMPACOES, '
      '                  NVL(H.QTDHISTEMPACOES, 0) AS QTDHISTEMPACOES, '
      
        '                  NVL(H.SLDQTDHISTEMPACOE, 0) AS SLDQTDHISTEMPAC' +
        'OE, '
      
        '                  NVL(H.VLRPRINCIPAL, 0) AS VLRPRINCIPAL, NVL(H.' +
        'SLDPRINCIPAL, 0) AS SLDPRINCIPAL, '
      
        '                  NVL(H.VLRJUROS, 0) AS VLRJUROS, NVL(H.VLRJUROS' +
        'EST, 0) AS VLRJUROSEST, NVL(H.SLDJUROS, 0) AS SLDJUROS, '
      
        '                  NVL(H.VLRJUROSIMPORTA, 0) AS VLRJUROSIMPORTA, ' +
        'NVL(H.SLDJUROSIMPORTA, 0) AS SLDJUROSIMPORTA, '
      
        '                  NVL(H.VLRFINAL, 0) AS VLRFINAL, NVL(H.SLDFINAL' +
        ', 0) AS SLDFINAL, '
      
        '                  NVL(H.VLRPRINCIPAL, 0) AS VLRPRINCIPAL, NVL(H.' +
        'SLDPRINCIPAL, 0) AS SLDPRINCIPAL, '
      
        '                  H.IDTIPOOPERACAO, H.IDPLANPREVCTBPATR, H.IDINV' +
        'ESTIMENTO, H.NUMCONTRATOCUSTODIA, '
      
        '                  H.IDOPEREMPACOES, H.IDOPEREMPACOESAP, H.IDHIST' +
        'EMPACOES, H.PLANO, H.PLNCODIGO, H.CODDOCUMENTO, H.TIPOLANCAMENTO' +
        ' '
      '           FROM HISTEMPACOES H, TIPOOPERACAO T  '
      '           WHERE H.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 244
    Top = 384
    object qryAuxDATAHISTEMPACOES: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAHISTEMPACOES'
    end
    object qryAuxDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 44
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAuxQTDHISTEMPACOES: TFloatField
      DisplayLabel = 'Qtd Movim.'
      DisplayWidth = 11
      FieldName = 'QTDHISTEMPACOES'
    end
    object qryAuxSLDQTDHISTEMPACOE: TFloatField
      DisplayLabel = 'Saldo de Qtd.'
      DisplayWidth = 13
      FieldName = 'SLDQTDHISTEMPACOE'
    end
    object qryAuxVLRHISTEMPACOES: TFloatField
      DisplayLabel = 'Valor Movim.'
      DisplayWidth = 15
      FieldName = 'VLRHISTEMPACOES'
    end
    object qryAuxSLDHISTEMPACOES: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 16
      FieldName = 'SLDHISTEMPACOES'
    end
    object qryAuxVLRJUROSIMPORTA: TFloatField
      DisplayLabel = 'Juros Movim.'
      DisplayWidth = 10
      FieldName = 'VLRJUROSIMPORTA'
    end
    object qryAuxSLDJUROSIMPORTA: TFloatField
      DisplayLabel = 'Saldo Juros'
      DisplayWidth = 10
      FieldName = 'SLDJUROSIMPORTA'
    end
    object qryAuxVLRJUROSEST: TFloatField
      DisplayLabel = 'Juros Estornado'
      DisplayWidth = 10
      FieldName = 'VLRJUROSEST'
    end
    object qryAuxVLRPRINCIPAL: TFloatField
      DisplayLabel = 'Vlr. Principal Movim.'
      DisplayWidth = 10
      FieldName = 'VLRPRINCIPAL'
    end
    object qryAuxSLDPRINCIPAL: TFloatField
      DisplayLabel = 'Saldo Principal'
      DisplayWidth = 10
      FieldName = 'SLDPRINCIPAL'
    end
    object qryAuxVLRFINAL: TFloatField
      DisplayLabel = 'Valor Final Movim.'
      DisplayWidth = 14
      FieldName = 'VLRFINAL'
    end
    object qryAuxSLDFINAL: TFloatField
      DisplayLabel = 'Saldo Valor Final'
      DisplayWidth = 13
      FieldName = 'SLDFINAL'
    end
    object qryAuxVLRJUROS: TFloatField
      DisplayLabel = 'Juros Movim.'
      DisplayWidth = 15
      FieldName = 'VLRJUROS'
      Visible = False
    end
    object qryAuxSLDJUROS: TFloatField
      DisplayLabel = 'Saldo Juros'
      DisplayWidth = 10
      FieldName = 'SLDJUROS'
      Visible = False
    end
    object qryAuxVLRPRINCIPAL_1: TFloatField
      FieldName = 'VLRPRINCIPAL_1'
      Visible = False
    end
    object qryAuxSLDPRINCIPAL_1: TFloatField
      FieldName = 'SLDPRINCIPAL_1'
      Visible = False
    end
    object qryAuxIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryAuxIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryAuxIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAuxNUMCONTRATOCUSTODIA: TStringField
      FieldName = 'NUMCONTRATOCUSTODIA'
      Visible = False
      FixedChar = True
    end
    object qryAuxIDOPEREMPACOES: TFloatField
      FieldName = 'IDOPEREMPACOES'
      Visible = False
    end
    object qryAuxIDOPEREMPACOESAP: TFloatField
      FieldName = 'IDOPEREMPACOESAP'
      Visible = False
    end
    object qryAuxIDHISTEMPACOES: TFloatField
      FieldName = 'IDHISTEMPACOES'
      Visible = False
    end
    object qryAuxPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryAuxPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryAuxCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryAuxTIPOLANCAMENTO: TStringField
      FieldName = 'TIPOLANCAMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
