inherited frmExecGeraRecLoteMT: TfrmExecGeraRecLoteMT
  Left = 205
  Top = 119
  HelpContext = 640098
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Geração de Receitas em Lote'
  ClientHeight = 413
  ClientWidth = 652
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 652
    Height = 374
    inherited PagControle: TPageControl
      Width = 650
      Height = 372
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 642
          Caption = 'Geração de Receitas [ seleção ]'
        end
        object Label1: TLabel
          Left = 384
          Top = 235
          Width = 168
          Height = 13
          Caption = 'Tipo de Receita de Cobrança'
        end
        object Label2: TLabel
          Left = 384
          Top = 278
          Width = 187
          Height = 13
          Caption = 'Forma de Cobrança Diferenciada'
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 25
          Width = 624
          Height = 143
          Caption = ' Filtros '
          TabOrder = 0
          inline molImovelouMestre1: TmolImovelouMestre
            Left = 13
            Top = 12
            Width = 600
            inherited edtImovel: TEdit
              Width = 535
            end
            inherited btnBuscaImovel: TBitBtn
              Left = 542
            end
            inherited btnLimpaImovel: TBitBtn
              Left = 566
            end
          end
          inline molContrato1: TmolContrato
            Left = 13
            Top = 51
            Width = 600
            TabOrder = 1
            inherited edtContrato: TEdit
              Width = 535
            end
            inherited btnBuscaContrato: TBitBtn
              Left = 542
              OnClick = molContrato1btnBuscaContratoClick
            end
            inherited btnLimpaContrato: TBitBtn
              Left = 566
            end
          end
          inline molResponsavel1: TmolResponsavel
            Left = 13
            Top = 91
            Width = 600
            TabOrder = 2
            inherited edtResponsavel: TEdit
              Width = 535
            end
            inherited btnBuscaResponsavel: TBitBtn
              Left = 542
            end
            inherited btnLimpaResponsavel: TBitBtn
              Left = 566
            end
            inherited btnAbrePessoa: TBitBtn
              Left = 414
              Visible = False
            end
          end
        end
        object dbcboTipoRecCobranca: TwwDBLookupCombo
          Left = 384
          Top = 249
          Width = 248
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'35'#9'Tipo de Receita'#9'F')
          LookupTable = cdsTipoRec
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dbcboFormaCobranca: TwwDBLookupCombo
          Left = 384
          Top = 292
          Width = 248
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Forma de Cobrança'#9'F')
          LookupTable = cdsForma
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
          OnChange = dbcboFormaCobrancaChange
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 230
          Width = 369
          Height = 126
          Caption = ' Datas '
          TabOrder = 1
          object Label15: TLabel
            Left = 21
            Top = 19
            Width = 207
            Height = 13
            Caption = 'Competência: Mês                    Ano'
          end
          object Label3: TLabel
            Left = 21
            Top = 62
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object Label6: TLabel
            Left = 131
            Top = 63
            Width = 78
            Height = 13
            Caption = 'Data Emissão'
          end
          object Label4: TLabel
            Left = 241
            Top = 63
            Width = 98
            Height = 13
            Caption = 'Data Vencimento'
          end
          object cboMes: TComboBox
            Left = 21
            Top = 32
            Width = 179
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 204
            Top = 32
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object edtDataLancamento: TCMDateTimePicker
            Left = 21
            Top = 75
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
          object edtDataEmissao: TCMDateTimePicker
            Left = 131
            Top = 75
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
            TabOrder = 3
          end
          object edtDataVencimento: TCMDateTimePicker
            Left = 241
            Top = 75
            Width = 105
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
            TabOrder = 4
          end
          object chkVencContrato: TCheckBox
            Left = 21
            Top = 102
            Width = 251
            Height = 16
            Caption = 'Utiliza o mesmo vencimento do contrato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = chkVencContratoClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 170
          Width = 624
          Height = 58
          Caption = 'Indicador Base'
          TabOrder = 2
          object Label5: TLabel
            Left = 21
            Top = 13
            Width = 54
            Height = 13
            Caption = 'Indicador'
          end
          object Label7: TLabel
            Left = 348
            Top = 13
            Width = 163
            Height = 13
            Caption = 'Competência: Mês         Ano'
          end
          object Label9: TLabel
            Left = 558
            Top = 13
            Width = 34
            Height = 13
            Caption = 'Desc.'
          end
          object Label14: TLabel
            Left = 594
            Top = 29
            Width = 14
            Height = 16
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbcboIndicadores: TwwDBLookupCombo
            Left = 21
            Top = 27
            Width = 323
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'INMDESCRICAO'#9'35'#9'Indicadores'#9'F')
            LookupTable = cdsIndicadores
            LookupField = 'IDINDICADORIMOVEL'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = True
          end
          object cboMesI: TComboBox
            Left = 348
            Top = 27
            Width = 135
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object DBspnAnoI: TwwDBSpinEdit
            Left = 487
            Top = 27
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object edtDesconto: TRealEdit
            Left = 557
            Top = 27
            Width = 34
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
          end
        end
        object chkBoleto: TCheckBox
          Left = 384
          Top = 327
          Width = 169
          Height = 16
          Caption = 'Gerar boleto de cobrança'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      inherited TabSheet1: TTabSheet
        Caption = 'tabGerar'
        inherited fcLabel1: TfcLabel
          Width = 379
          Caption = 'Geração de Receitas [ Lançamentos ]'
        end
        object DBgrdLancGerar: TwwDBGrid
          Left = 12
          Top = 68
          Width = 617
          Height = 228
          Selected.Strings = (
            'CONNUMERO'#9'20'#9'Contrato'#9'F'
            'CONNOME'#9'60'#9'Nome'#9'F'
            'IMOVEL'#9'60'#9'Imóvel'#9'F'
            'VLR_INDICADOR'#9'14'#9'Vlr. Indicador'#9'F'
            'PERC_RATEIO'#9'8'#9'Rateio'#9'F'
            'VLR_LANC_ORIG'#9'19'#9'Vlr. Lançamento'#9'F'
            'VLR_LANC'#9'19'#9'Lanc. com Desconto'#9'F'
            'CIMDTINI'#9'22'#9'Data Inicial de Vigência'#9'F'
            'CIMDTFIM'#9'21'#9'Data Final de Vigência'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdLancGerarCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdLancGerarTopRowChanged
        end
        object Panel9: TPanel
          Left = 12
          Top = 38
          Width = 617
          Height = 30
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Lançamentos a Gerar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tabMensagem: TTabSheet
        Caption = 'tabMensagem'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 642
          Height = 24
          Align = alTop
          Caption = 'Geração de Receitas [ Mensagem ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object GroupBox4: TGroupBox
          Left = 10
          Top = 33
          Width = 621
          Height = 272
          Caption = ' Mensagem do Boleto '
          TabOrder = 0
          object Label10: TLabel
            Left = 21
            Top = 20
            Width = 47
            Height = 13
            Caption = 'Linha 1:'
          end
          object Label12: TLabel
            Left = 21
            Top = 41
            Width = 47
            Height = 13
            Caption = 'Linha 2:'
          end
          object Label13: TLabel
            Left = 21
            Top = 62
            Width = 47
            Height = 13
            Caption = 'Linha 3:'
          end
          object Label16: TLabel
            Left = 21
            Top = 83
            Width = 47
            Height = 13
            Caption = 'Linha 4:'
          end
          object Label17: TLabel
            Left = 21
            Top = 104
            Width = 47
            Height = 13
            Caption = 'Linha 5:'
          end
          object Label18: TLabel
            Left = 21
            Top = 125
            Width = 47
            Height = 13
            Caption = 'Linha 6:'
          end
          object Label19: TLabel
            Left = 21
            Top = 146
            Width = 47
            Height = 13
            Caption = 'Linha 7:'
          end
          object Label20: TLabel
            Left = 21
            Top = 167
            Width = 47
            Height = 13
            Caption = 'Linha 8:'
          end
          object Label21: TLabel
            Left = 21
            Top = 188
            Width = 47
            Height = 13
            Caption = 'Linha 9:'
          end
          object Label23: TLabel
            Left = 84
            Top = 225
            Width = 53
            Height = 13
            Caption = '<recdes>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 141
            Top = 225
            Width = 105
            Height = 13
            Caption = '= Nome da receita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 268
            Top = 225
            Width = 45
            Height = 13
            Caption = '<comp>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 325
            Top = 225
            Width = 85
            Height = 13
            Caption = '= Competência'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label52: TLabel
            Left = 21
            Top = 225
            Width = 62
            Height = 13
            Caption = 'Curingas:  '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel1: TBevel
            Left = 15
            Top = 215
            Width = 591
            Height = 2
          end
          object edtln1: TEdit
            Left = 77
            Top = 16
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 0
          end
          object edtln2: TEdit
            Left = 77
            Top = 37
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 1
            Text = 'Receita <recdes>'
          end
          object edtln3: TEdit
            Left = 77
            Top = 58
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 2
          end
          object edtln4: TEdit
            Left = 77
            Top = 79
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 3
            Text = 'Competência <comp>'
          end
          object edtln5: TEdit
            Left = 77
            Top = 100
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 4
          end
          object edtln6: TEdit
            Left = 77
            Top = 121
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 5
          end
          object edtln7: TEdit
            Left = 77
            Top = 142
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 6
          end
          object edtln8: TEdit
            Left = 77
            Top = 163
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 7
          end
          object edtln9: TEdit
            Left = 77
            Top = 184
            Width = 522
            Height = 21
            MaxLength = 69
            TabOrder = 8
          end
          object btnLimpaMsg: TfcShapeBtn
            Left = 518
            Top = 223
            Width = 81
            Height = 25
            Caption = 'Limpar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            Spacing = 8
            TabOrder = 9
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
          end
        end
      end
      object tabGerados: TTabSheet
        Caption = 'tabGerados'
        ImageIndex = 3
        TabVisible = False
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 471
          Height = 24
          Align = alTop
          Caption = 'Geração de Receitas [ Lançamentos Gerados ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object DBgrdLancGerados: TwwDBGrid
          Left = 12
          Top = 68
          Width = 617
          Height = 228
          Selected.Strings = (
            'CODDOCUMENTO'#9'10'#9'Documento'#9'F'
            'CONNUMERO'#9'20'#9'Contrato'#9'F'
            'CONNOME'#9'60'#9'Nome'#9'F'
            'IMOVEL'#9'60'#9'Imóvel'#9'F'
            'VLR_INDICADOR'#9'14'#9'Vlr. Indicador'#9'F'
            'PERC_RATEIO'#9'8'#9'Rateio'#9'F'
            'VLR_LANC_ORIG'#9'19'#9'Vlr. Lançamento'#9'F'
            'VLR_LANC'#9'19'#9'Lanc. com Desconto'#9'F'
            'CIMDTINI'#9'20'#9'Data Inicial de Vigência'#9'F'
            'CIMDTFIM'#9'20'#9'Data Final de Vigência'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsLancGera
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdLancGerarCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdLancGerarTopRowChanged
        end
        object Panel1: TPanel
          Left = 12
          Top = 38
          Width = 617
          Height = 30
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Lançamentos Gerados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 374
    Width = 652
    inherited tb97Fundo: TToolbar97
      Left = 212
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  object cdsIndicadores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 340
    object cdsIndicadoresINMDESCRICAO: TStringField
      DisplayLabel = 'Indicadores'
      DisplayWidth = 35
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object cdsIndicadoresIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
  object dsIndicadores: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicadores
    Left = 36
    Top = 348
  end
  object sqlIndicadores: TCMSqlParams
    SQL.Strings = (
      'SELECT IDINDICADORIMOVEL, INMDESCRICAO'
      'FROM INDICADORIMOVEL'
      'WHERE FLGTIPOVALOR = '#39'M'#39
      '  AND RECPAG       = '#39'R'#39)
    ClientDataSet = cdsIndicadores
    Left = 47
    Top = 358
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 4
    object cdsCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsIMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 123
    end
    object cdsVLR_INDICADOR: TFloatField
      FieldName = 'VLR_INDICADOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsPERC_RATEIO: TFloatField
      FieldName = 'PERC_RATEIO'
      DisplayFormat = '#,##0.00%'
    end
    object cdsVLR_LANC: TFloatField
      FieldName = 'VLR_LANC'
      DisplayFormat = '#,##0.00'
    end
    object cdsCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
    end
    object cdsCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
    end
    object cdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object cdsCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object cdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
    end
    object cdsFLGPREVREAL: TStringField
      FieldName = 'FLGPREVREAL'
      FixedChar = True
      Size = 1
    end
    object cdsFLGTIPOAPURACAO: TStringField
      FieldName = 'FLGTIPOAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
    end
    object cdsVLR_LANC_ORIG: TFloatField
      FieldName = 'VLR_LANC_ORIG'
      DisplayFormat = '#,##0.00'
    end
    object cdsVLR_DESC: TFloatField
      FieldName = 'VLR_DESC'
      DisplayFormat = '#,##0.00'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 612
    Top = 12
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      
        'SELECT 0 AS CODDOCUMENTO, C.CONNUMERO, C.CONNOME, IM.IMONOME||'#39' ' +
        '- '#39'||I.IMONOME AS IMOVEL, A.VLRAPURADO AS VLR_INDICADOR,'
      
        '       DECODE(NVL(CXI.FLGRATEIO,0),0,100,CXI.CIMPERCENTRATEIO) A' +
        'S PERC_RATEIO,'
      
        '       DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A.VLRAPU' +
        'RADO*(CXI.CIMPERCENTRATEIO/100),2)) AS VLR_LANC_ORIG,'
      
        '       ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A.' +
        'VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2))*1,2) AS VLR_DESC,'
      
        '       ROUND( DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A' +
        '.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) -'
      
        '              ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,R' +
        'OUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2))*1,2),2) AS VLR_' +
        'LANC,'
      
        '       CXI.CIMDTINI, CXI.CIMDTFIM, A.IDIMOVEL, CXI.IDCONTRATOIMO' +
        'VEL, C.IDLOCATARIO, C.CODPORTFORMA, I.CODTIPIMOVEL,'
      
        '       A.IDINDICADORIMOVEL, A.FLGPREVREAL, A.FLGTIPOAPURACAO, A.' +
        'MESCOMPETENCIA, A.ANOCOMPETENCIA, A.DATAAPURADO'
      
        'FROM INDICADORXAPUR A, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL C, IM' +
        'OVEL I, IMOVEL IM'
      'WHERE A.FLGPREVREAL = '#39'P'#39
      '  AND A.IDINDICADORIMOVEL = 13'
      '  AND A.MESCOMPETENCIA = 1'
      
        '  AND A.ANOCOMPETENCIA = 2007  /* ADICIONAR OS FILTROS DA TELA *' +
        '/'
      '  AND A.IDIMOVEL = CXI.IDIMOVEL'
      '  AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      '  AND CXI.IDIMOVEL = I.IDIMOVEL'
      '  AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      
        '  AND ((CXI.CIMDTFIM IS NOT NULL AND ('#39'200701'#39' BETWEEN TO_CHAR(C' +
        'XI.CIMDTINI,'#39'YYYYMM'#39') AND TO_CHAR(CXI.CIMDTFIM,'#39'YYYYMM'#39'))) OR'
      
        '       (CXI.CIMDTFIM IS NULL AND '#39'200701'#39' >= TO_CHAR(CXI.CIMDTIN' +
        'I,'#39'YYYYMM'#39')) )'
      'ORDER BY CONNUMERO, IMOVEL   '
      '   '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cds
    Left = 623
    Top = 22
  end
  object cdsTipoRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 100
    Top = 340
    object cdsTipoRecDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 35
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsTipoRecIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object cdsTipoRecRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsTipoRecCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object cdsTipoRecFLGOBRIGAORC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGOBRIGAORC'
      Visible = False
    end
    object cdsTipoRecIDTIPODESPESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPESA'
      Visible = False
    end
    object cdsTipoRecFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoRec: TwwDataSource
    AutoEdit = False
    DataSet = cdsTipoRec
    Left = 111
    Top = 348
  end
  object sqlTipoRec: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOCUSTORECIMO, DESCCUSTORECIMO, RECCUSTO, CODTIPDOC,'
      '       FLGOBRIGAORC,      IDTIPODESPESA,   FLGDIARIO'
      'FROM TIPOCUSTORECIMOV'
      'WHERE RECCUSTO = '#39'R'#39
      '  AND IDMODULO = 64'
      'ORDER BY DESCCUSTORECIMO')
    ClientDataSet = cdsTipoRec
    Left = 122
    Top = 358
  end
  object cdsForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 166
    Top = 340
    object cdsFormaDESCRICAO: TStringField
      DisplayLabel = 'Forma de Cobrança'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object cdsFormaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsFormaIDCONFIGBARRAS: TFloatField
      FieldName = 'IDCONFIGBARRAS'
    end
  end
  object dsForma: TwwDataSource
    AutoEdit = False
    DataSet = cdsForma
    Left = 177
    Top = 348
  end
  object sqlForma: TCMSqlParams
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO, IDCONFIGBARRAS, IDPESSOA'
      'FROM PORTADORFORMA'
      'WHERE NVL(FLGATIVO,'#39'S'#39') = '#39'S'#39
      '  AND RECPAG            = '#39'R'#39
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ''
      ' '
      ' ')
    ClientDataSet = cdsForma
    Left = 188
    Top = 358
  end
  object cdsLancGera: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 59
    object cdsLancGeraCODDOCUMENTO: TFloatField
      Alignment = taLeftJustify
      FieldName = 'CODDOCUMENTO'
    end
    object cdsLancGeraCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsLancGeraCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsLancGeraIMOVEL: TStringField
      FieldName = 'IMOVEL'
      Size = 123
    end
    object cdsLancGeraVLR_INDICADOR: TFloatField
      FieldName = 'VLR_INDICADOR'
      DisplayFormat = '#,##0.00'
    end
    object cdsLancGeraPERC_RATEIO: TFloatField
      FieldName = 'PERC_RATEIO'
      DisplayFormat = '#,##0.00'
    end
    object cdsLancGeraVLR_LANC: TFloatField
      FieldName = 'VLR_LANC'
      DisplayFormat = '#,##0.00'
    end
    object cdsLancGeraCIMDTINI: TDateTimeField
      FieldName = 'CIMDTINI'
    end
    object cdsLancGeraCIMDTFIM: TDateTimeField
      FieldName = 'CIMDTFIM'
    end
    object cdsLancGeraIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsLancGeraIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object cdsLancGeraCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object cdsLancGeraCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsLancGeraIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsLancGeraIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
    end
    object cdsLancGeraFLGPREVREAL: TStringField
      FieldName = 'FLGPREVREAL'
      FixedChar = True
      Size = 1
    end
    object cdsLancGeraFLGTIPOAPURACAO: TStringField
      FieldName = 'FLGTIPOAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsLancGeraMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsLancGeraANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsLancGeraDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
    end
    object cdsLancGeraVLR_LANC_ORIG: TFloatField
      FieldName = 'VLR_LANC_ORIG'
      DisplayFormat = '#,##0.00'
    end
    object cdsLancGeraVLR_DESC: TFloatField
      FieldName = 'VLR_DESC'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsLancGera: TwwDataSource
    AutoEdit = False
    DataSet = cdsLancGera
    Left = 612
    Top = 67
  end
  object sqlLancGera: TCMSqlParams
    SQL.Strings = (
      
        'SELECT 0 AS CODDOCUMENTO, C.CONNUMERO, C.CONNOME, IM.IMONOME||'#39' ' +
        '- '#39'||I.IMONOME AS IMOVEL, A.VLRAPURADO AS VLR_INDICADOR,'
      
        '       DECODE(NVL(CXI.FLGRATEIO,0),0,100,CXI.CIMPERCENTRATEIO) A' +
        'S PERC_RATEIO,'
      
        '       DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A.VLRAPU' +
        'RADO*(CXI.CIMPERCENTRATEIO/100),2)) AS VLR_LANC_ORIG,'
      
        '       ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A.' +
        'VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2))*1,2) AS VLR_DESC,'
      
        '       ROUND( DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,ROUND(A' +
        '.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2)) -'
      
        '              ROUND(DECODE(NVL(CXI.FLGRATEIO,0),0,A.VLRAPURADO,R' +
        'OUND(A.VLRAPURADO*(CXI.CIMPERCENTRATEIO/100),2))*1,2),2) AS VLR_' +
        'LANC,'
      
        '       CXI.CIMDTINI, CXI.CIMDTFIM, A.IDIMOVEL, CXI.IDCONTRATOIMO' +
        'VEL, C.IDLOCATARIO, C.CODPORTFORMA, I.CODTIPIMOVEL,'
      
        '       A.IDINDICADORIMOVEL, A.FLGPREVREAL, A.FLGTIPOAPURACAO, A.' +
        'MESCOMPETENCIA, A.ANOCOMPETENCIA, A.DATAAPURADO'
      
        'FROM INDICADORXAPUR A, CONTRATOXIMOVEL CXI, CONTRATOIMOVEL C, IM' +
        'OVEL I, IMOVEL IM'
      'WHERE A.FLGPREVREAL = '#39'P'#39
      '  AND A.IDINDICADORIMOVEL = 13'
      '  AND A.MESCOMPETENCIA = 1'
      
        '  AND A.ANOCOMPETENCIA = 2007  /* ADICIONAR OS FILTROS DA TELA *' +
        '/'
      '  AND A.IDIMOVEL = CXI.IDIMOVEL'
      '  AND CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL'
      '  AND CXI.IDIMOVEL = I.IDIMOVEL'
      '  AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      
        '  AND ((CXI.CIMDTFIM IS NOT NULL AND ('#39'200701'#39' BETWEEN TO_CHAR(C' +
        'XI.CIMDTINI,'#39'YYYYMM'#39') AND TO_CHAR(CXI.CIMDTFIM,'#39'YYYYMM'#39'))) OR'
      
        '       (CXI.CIMDTFIM IS NULL AND '#39'200701'#39' >= TO_CHAR(CXI.CIMDTIN' +
        'I,'#39'YYYYMM'#39')) )'
      'ORDER BY CONNUMERO, IMOVEL   '
      '   '
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsLancGera
    Left = 623
    Top = 77
  end
  object cdsIndicadorXApur: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 124
    object cdsIndicadorXApurIDINDICADORXAPUR: TFloatField
      FieldName = 'IDINDICADORXAPUR'
    end
    object cdsIndicadorXApurIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsIndicadorXApurIDUNIDAUT: TFloatField
      FieldName = 'IDUNIDAUT'
    end
    object cdsIndicadorXApurMESCOMPETENCIA: TFloatField
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsIndicadorXApurANOCOMPETENCIA: TFloatField
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsIndicadorXApurVLRAPURADO: TFloatField
      FieldName = 'VLRAPURADO'
    end
    object cdsIndicadorXApurDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
    end
    object cdsIndicadorXApurFLGPREVREAL: TStringField
      FieldName = 'FLGPREVREAL'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorXApurIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
    end
    object cdsIndicadorXApurFLGTIPOAPURACAO: TStringField
      FieldName = 'FLGTIPOAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorXApurINMDESCRICAO: TStringField
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object cdsIndicadorXApurFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorXApurRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadorXApurDSC_TIPOVALOR: TStringField
      FieldName = 'DSC_TIPOVALOR'
      Size = 7
    end
    object cdsIndicadorXApurDSC_RECPAG: TStringField
      FieldName = 'DSC_RECPAG'
      Size = 10
    end
    object cdsIndicadorXApurDSC_PREVREAL: TStringField
      FieldName = 'DSC_PREVREAL'
      Size = 9
    end
    object cdsIndicadorXApurDSC_TIPOAPURACAO: TStringField
      FieldName = 'DSC_TIPOAPURACAO'
      Size = 10
    end
    object cdsIndicadorXApurIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object cdsIndicadorXApurOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
  end
  object dsIndicadorXApur: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicadorXApur
    Left = 612
    Top = 132
  end
  object sqlIndicadorXApur: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IA.IDDOCUMENTO, IA.OBSERVACAO, IA.IDINDICADORXAPUR, IA.ID' +
        'IMOVEL, IA.IDUNIDAUT, IA.MESCOMPETENCIA,'
      
        '       IA.ANOCOMPETENCIA, IA.VLRAPURADO, IA.DATAAPURADO, IA.FLGP' +
        'REVREAL, IA.IDINDICADORIMOVEL,'
      
        '       IA.FLGTIPOAPURACAO, I.INMDESCRICAO, I.FLGTIPOVALOR, I.REC' +
        'PAG,'
      
        '       DECODE(I.FLGTIPOVALOR,'#39'M'#39','#39'Monet'#39','#39'P'#39','#39'Percent'#39','#39'Quant'#39') ' +
        ' AS DSC_TIPOVALOR,'
      
        '       DECODE(I.RECPAG,'#39'R'#39','#39'Receita'#39','#39'D'#39','#39'Despesa'#39','#39'Desempenho'#39')' +
        ' AS DSC_RECPAG,'
      
        '       DECODE(IA.FLGPREVREAL,'#39'P'#39','#39'Previsto'#39','#39'Realizado'#39')        ' +
        ' AS DSC_PREVREAL,'
      
        '       DECODE(IA.FLGTIPOAPURACAO,'#39'A'#39','#39'Automático'#39','#39'Manual'#39')     ' +
        ' AS DSC_TIPOAPURACAO'
      'FROM INDICADORXAPUR IA, INDICADORIMOVEL I'
      'WHERE IA.IDINDICADORIMOVEL = I.IDINDICADORIMOVEL'
      'ORDER BY I.INMDESCRICAO, IA.ANOCOMPETENCIA, IA.MESCOMPETENCIA'
      ' ')
    ClientDataSet = cdsIndicadorXApur
    Left = 623
    Top = 142
  end
  object cdsMsgBoleto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 196
    object cdsMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object cdsMsgBoletoMSGDESCRICAO: TStringField
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object cdsMsgBoletoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object cdsMsgBoletoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object cdsMsgBoletoLINHA_1: TFloatField
      FieldName = 'LINHA_1'
    end
    object cdsMsgBoletoTEXTOLINHA_1: TStringField
      FieldName = 'TEXTOLINHA_1'
      Size = 69
    end
    object cdsMsgBoletoLINHA_2: TFloatField
      FieldName = 'LINHA_2'
    end
    object cdsMsgBoletoTEXTOLINHA_2: TStringField
      FieldName = 'TEXTOLINHA_2'
      Size = 69
    end
    object cdsMsgBoletoLINHA_3: TFloatField
      FieldName = 'LINHA_3'
    end
    object cdsMsgBoletoTEXTOLINHA_3: TStringField
      FieldName = 'TEXTOLINHA_3'
      Size = 69
    end
    object cdsMsgBoletoLINHA_4: TFloatField
      FieldName = 'LINHA_4'
    end
    object cdsMsgBoletoTEXTOLINHA_4: TStringField
      FieldName = 'TEXTOLINHA_4'
      Size = 69
    end
    object cdsMsgBoletoLINHA_5: TFloatField
      FieldName = 'LINHA_5'
    end
    object cdsMsgBoletoTEXTOLINHA_5: TStringField
      FieldName = 'TEXTOLINHA_5'
      Size = 69
    end
    object cdsMsgBoletoLINHA_6: TFloatField
      FieldName = 'LINHA_6'
    end
    object cdsMsgBoletoTEXTOLINHA_6: TStringField
      FieldName = 'TEXTOLINHA_6'
      Size = 69
    end
    object cdsMsgBoletoLINHA_7: TFloatField
      FieldName = 'LINHA_7'
    end
    object cdsMsgBoletoTEXTOLINHA_7: TStringField
      FieldName = 'TEXTOLINHA_7'
      Size = 69
    end
    object cdsMsgBoletoLINHA_8: TFloatField
      FieldName = 'LINHA_8'
    end
    object cdsMsgBoletoTEXTOLINHA_8: TStringField
      FieldName = 'TEXTOLINHA_8'
      Size = 69
    end
    object cdsMsgBoletoLINHA_9: TFloatField
      FieldName = 'LINHA_9'
    end
    object cdsMsgBoletoTEXTOLINHA_9: TStringField
      FieldName = 'TEXTOLINHA_9'
      Size = 69
    end
    object cdsMsgBoletoLMBNUMLINHA: TFloatField
      FieldName = 'LMBNUMLINHA'
    end
    object cdsMsgBoletoLMBTEXTOLINHA: TStringField
      FieldName = 'LMBTEXTOLINHA'
      Size = 69
    end
  end
  object dsMsgBoleto: TwwDataSource
    AutoEdit = False
    DataSet = cdsMsgBoleto
    Left = 612
    Top = 204
  end
  object sqlMsgBoleto: TCMSqlParams
    SQL.Strings = (
      
        'SELECT M.IDMSGBOLETO,  M.MSGDESCRICAO,  M.IDDOCUMENTO,  M.IDMODU' +
        'LO,'
      '       L.LMBNUMLINHA,  L.LMBTEXTOLINHA,'
      
        '       L1.LMBNUMLINHA AS LINHA_1, L1.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_1,'
      
        '       L2.LMBNUMLINHA AS LINHA_2, L2.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_2,'
      
        '       L3.LMBNUMLINHA AS LINHA_3, L3.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_3,'
      
        '       L4.LMBNUMLINHA AS LINHA_4, L4.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_4,'
      
        '       L5.LMBNUMLINHA AS LINHA_5, L5.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_5,'
      
        '       L6.LMBNUMLINHA AS LINHA_6, L6.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_6,'
      
        '       L7.LMBNUMLINHA AS LINHA_7, L7.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_7,'
      
        '       L8.LMBNUMLINHA AS LINHA_8, L8.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_8,'
      
        '       L9.LMBNUMLINHA AS LINHA_9, L9.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_9'
      'FROM MSGBOLETO M, LINHAMSGBOLETO L,'
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 1 ) L1,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 2 ) L2,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 3 ) L3,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 4 ) L4,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 5 ) L5,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 6 ) L6,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 7 ) L7,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 8 ) L8,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM  LINHAMSGBOLETO '
      '     WHERE LMBNUMLINHA = 9 ) L9'
      ''
      'WHERE ( M.IDMSGBOLETO = L.IDMSGBOLETO(+)  )'
      ' AND  ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) )'
      'ORDER BY M.MSGDESCRICAO')
    ClientDataSet = cdsMsgBoleto
    Left = 623
    Top = 214
  end
  object cdsLinhaMsgBoleto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 266
    object cdsLinhaMsgBoletoIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
    end
    object cdsLinhaMsgBoletoMSGDESCRICAO: TStringField
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object cdsLinhaMsgBoletoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object cdsLinhaMsgBoletoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object cdsLinhaMsgBoletoLMBNUMLINHA: TFloatField
      FieldName = 'LMBNUMLINHA'
    end
    object cdsLinhaMsgBoletoLMBTEXTOLINHA: TStringField
      FieldName = 'LMBTEXTOLINHA'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_1: TFloatField
      FieldName = 'LINHA_1'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_1: TStringField
      FieldName = 'TEXTOLINHA_1'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_2: TFloatField
      FieldName = 'LINHA_2'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_2: TStringField
      FieldName = 'TEXTOLINHA_2'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_3: TFloatField
      FieldName = 'LINHA_3'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_3: TStringField
      FieldName = 'TEXTOLINHA_3'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_4: TFloatField
      FieldName = 'LINHA_4'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_4: TStringField
      FieldName = 'TEXTOLINHA_4'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_5: TFloatField
      FieldName = 'LINHA_5'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_5: TStringField
      FieldName = 'TEXTOLINHA_5'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_6: TFloatField
      FieldName = 'LINHA_6'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_6: TStringField
      FieldName = 'TEXTOLINHA_6'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_7: TFloatField
      FieldName = 'LINHA_7'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_7: TStringField
      FieldName = 'TEXTOLINHA_7'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_8: TFloatField
      FieldName = 'LINHA_8'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_8: TStringField
      FieldName = 'TEXTOLINHA_8'
      Size = 69
    end
    object cdsLinhaMsgBoletoLINHA_9: TFloatField
      FieldName = 'LINHA_9'
    end
    object cdsLinhaMsgBoletoTEXTOLINHA_9: TStringField
      FieldName = 'TEXTOLINHA_9'
      Size = 69
    end
  end
  object dsLinhaMsgBoleto: TwwDataSource
    AutoEdit = False
    DataSet = cdsLinhaMsgBoleto
    Left = 612
    Top = 274
  end
  object sqlLinhaMsgBoleto: TCMSqlParams
    SQL.Strings = (
      
        'SELECT M.IDMSGBOLETO,  M.MSGDESCRICAO,  M.IDDOCUMENTO,  M.IDMODU' +
        'LO,'
      '       L.LMBNUMLINHA,  L.LMBTEXTOLINHA,'
      
        '       L1.LMBNUMLINHA AS LINHA_1, L1.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_1,'
      
        '       L2.LMBNUMLINHA AS LINHA_2, L2.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_2,'
      
        '       L3.LMBNUMLINHA AS LINHA_3, L3.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_3,'
      
        '       L4.LMBNUMLINHA AS LINHA_4, L4.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_4,'
      
        '       L5.LMBNUMLINHA AS LINHA_5, L5.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_5,'
      
        '       L6.LMBNUMLINHA AS LINHA_6, L6.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_6,'
      
        '       L7.LMBNUMLINHA AS LINHA_7, L7.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_7,'
      
        '       L8.LMBNUMLINHA AS LINHA_8, L8.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_8,'
      
        '       L9.LMBNUMLINHA AS LINHA_9, L9.LMBTEXTOLINHA AS TEXTOLINHA' +
        '_9'
      'FROM MSGBOLETO M, LINHAMSGBOLETO L,'
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 1 ) L1,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 2 ) L2,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 3 ) L3,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 4 ) L4,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 5 ) L5,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 6 ) L6,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 7 ) L7,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM LINHAMSGBOLETO'
      '     WHERE LMBNUMLINHA = 8 ) L8,'
      ''
      '   ( SELECT IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '     FROM  LINHAMSGBOLETO '
      '     WHERE LMBNUMLINHA = 9 ) L9'
      ''
      'WHERE ( M.IDMSGBOLETO = L.IDMSGBOLETO(+)  )'
      ' AND  ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) )'
      '  AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) )'
      'ORDER BY M.MSGDESCRICAO')
    ClientDataSet = cdsLinhaMsgBoleto
    Left = 623
    Top = 284
  end
end
