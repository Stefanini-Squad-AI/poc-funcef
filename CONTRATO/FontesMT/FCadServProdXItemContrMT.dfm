inherited frmCadServProdXItemContrMT: TfrmCadServProdXItemContrMT
  Left = 435
  Top = 137
  HelpContext = 120009
  Caption = 'Cadastro de Serviços/Produtos X Item Contratual'
  ClientHeight = 462
  ClientWidth = 783
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 783
    Height = 376
    inherited pnlMestre: TPanel
      Width = 781
      Height = 92
      object Label1: TLabel
        Left = 7
        Top = 5
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label3: TLabel
        Left = 348
        Top = 45
        Width = 25
        Height = 13
        Caption = 'Item'
      end
      object Label4: TLabel
        Left = 569
        Top = 5
        Width = 106
        Height = 13
        Caption = 'Data Base do Item'
      end
      object Label5: TLabel
        Left = 7
        Top = 45
        Width = 94
        Height = 13
        Caption = 'Serviço/Produto'
      end
      object dblcContrato: TwwDBLookupCombo
        Left = 7
        Top = 21
        Width = 558
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'60'#9'Contrato'
          'CODCONTRATOEMPR'#9'20'#9'Nr. Processo'#9'F')
        DataField = 'IDCONTRATO'
        DataSource = ds
        LookupTable = cdsContratos
        LookupField = 'IDCONTRATO'
        Options = [loColLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcContratoChange
      end
      object dblcItem: TwwDBLookupCombo
        Left = 348
        Top = 61
        Width = 421
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME_ITEM'#9'60'#9'Item')
        DataField = 'IDITEM'
        DataSource = ds
        LookupTable = cdsItemContratual
        LookupField = 'IDITEM'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcItemChange
        OnCloseUp = dblcItemCloseUp
      end
      object edtpDataBase: TCMDateTimePicker
        Left = 569
        Top = 21
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
        TabOrder = 1
      end
      object dblcServicoProduto: TwwDBLookupCombo
        Left = 7
        Top = 61
        Width = 338
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEOBJETO'#9'60'#9'NOMEOBJETO')
        DataField = 'IDOBJETO'
        DataSource = ds
        LookupTable = cdsServicoProduto
        LookupField = 'IDOBJETO'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcServicoProdutoChange
      end
      object dbchkAtivo: TDBCheckBox
        Left = 708
        Top = 21
        Width = 54
        Height = 17
        Caption = 'Ativo'
        DataField = 'FLGATIVO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 93
      Width = 781
      Height = 282
      Tabs.Strings = (
        'Valores'
        'Parcelas'
        'Rateio'
        'Observação')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdDet'
        'dbgrdDet'
        'dbgrdDet')
      inherited pgctrlDetalhe: TPageControl
        Width = 683
        Height = 223
        ActivePage = tbsServicoProduto
        object tbsServicoProduto: TTabSheet [0]
          Caption = 'Valores'
          ImageIndex = 1
          object Label7: TLabel
            Left = 12
            Top = 135
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label19: TLabel
            Left = 348
            Top = 135
            Width = 211
            Height = 13
            Caption = 'Fórmula para Apuração Orçamentária'
          end
          object GroupBoxPropriedades: TGroupBox
            Left = 280
            Top = 5
            Width = 353
            Height = 62
            Caption = 'Propriedades'
            TabOrder = 0
            object lblDescMoeda: TLabel
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
            object dblcMoeda: TwwDBLookupCombo
              Left = 16
              Top = 31
              Width = 162
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'10'#9'Descrição')
              DataField = 'MOECODIGO'
              DataSource = ds
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblcMedida: TwwDBLookupCombo
              Left = 186
              Top = 31
              Width = 162
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMEDIDA'#9'10'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = ds
              LookupTable = cdsMedida
              LookupField = 'CODMEDIDA'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBoxTolerancia: TGroupBox
            Left = 8
            Top = 5
            Width = 257
            Height = 125
            Caption = 'Tolerância de Quantidades'
            TabOrder = 1
            object Label6: TLabel
              Left = 144
              Top = 68
              Width = 41
              Height = 13
              Caption = 'Inferior'
            end
            object Label8: TLabel
              Left = 16
              Top = 68
              Width = 48
              Height = 13
              Caption = 'Superior'
            end
            object dbspToleranciaMaisObjeto: TwwDBSpinEdit
              Left = 16
              Top = 83
              Width = 97
              Height = 21
              Increment = 1
              MaxValue = 100
              DataField = 'TOLERANCIAMAISOBJETO'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
            end
            object DBRadioGroupTipoTolerancia: TDBRadioGroup
              Left = 16
              Top = 21
              Width = 225
              Height = 41
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
            object dbspToleranciaMenosObjeto: TwwDBSpinEdit
              Left = 144
              Top = 83
              Width = 97
              Height = 21
              Increment = 1
              MaxValue = 100
              DataField = 'TOLERANCIAMENOSOBJETO'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
            end
          end
          object GroupBoxValores: TGroupBox
            Left = 280
            Top = 70
            Width = 353
            Height = 61
            Caption = 'Valores'
            TabOrder = 2
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
            object dbeValorUnitarioObjeto: TDBRealEdit
              Left = 100
              Top = 31
              Width = 118
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = dbeQtdeValorExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORUNITARIOOBJETO'
              DataSource = ds
            end
            object dbeValorTotalObjeto: TDBRealEdit
              Left = 228
              Top = 31
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
            object dbeQtdeItem: TDBRealEdit
              Left = 22
              Top = 31
              Width = 67
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              TabOrder = 0
              WordWrap = False
              OnExit = dbeQtdeValorExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEITEM'
              DataSource = ds
            end
          end
          object dblcResponsavel: TwwDBLookupCombo
            Left = 11
            Top = 150
            Width = 326
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Nome')
            DataField = 'IDRESPONSAVEL'
            DataSource = ds
            LookupTable = cdsResponsavel
            LookupField = 'IDRESPONSAVEL'
            Style = csDropDownList
            DropDownCount = 6
            DropDownWidth = 8
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dbcboFormula: TwwDBLookupCombo
            Left = 347
            Top = 150
            Width = 282
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome'#9'F')
            DataField = 'IDFORMORCADO'
            DataSource = ds
            LookupTable = cdsFormulaOrc
            LookupField = 'IDFORMORCADO'
            Style = csDropDownList
            DropDownCount = 6
            DropDownWidth = 8
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object tbsParcelas: TTabSheet [1]
          Caption = 'Parcelas'
          ImageIndex = 2
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
            Left = 357
            Top = 8
            Width = 128
            Height = 13
            Caption = 'Intervalo das Parcelas'
          end
          object Label15: TLabel
            Left = 361
            Top = 64
            Width = 115
            Height = 13
            Caption = 'Número de Parcelas'
          end
          object Label17: TLabel
            Left = 8
            Top = 117
            Width = 115
            Height = 13
            Caption = 'Data última geração'
          end
          object Label18: TLabel
            Left = 176
            Top = 117
            Width = 134
            Height = 13
            Caption = 'Data último vencimento'
          end
          object LblAltQtdParcela: TLabel
            Left = 361
            Top = 117
            Width = 255
            Height = 13
            Caption = 'Motivo Alteração da Quantidade de Parcelas'
            Enabled = False
          end
          object dbtpDataInicioCobranca: TCMDateTimePicker
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
          object dbeNumeroMedicoes: TDBRealEdit
            Left = 8
            Top = 80
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
            DataField = 'NUMMEDICOES'
            DataSource = ds
          end
          object dbrgFrequencia: TDBRadioGroup
            Left = 176
            Top = 8
            Width = 165
            Height = 97
            Caption = 'Frequência das Parcelas'
            DataField = 'FREQUENCIA'
            DataSource = ds
            Items.Strings = (
              'Única'
              'Mensal'
              'Trimestral'
              'Semestral'
              'Anual')
            TabOrder = 2
            Values.Strings = (
              'U'
              'M'
              'T'
              'S'
              'A')
          end
          object dbeIntervalo: TDBRealEdit
            Left = 357
            Top = 24
            Width = 131
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
            DataField = 'INTERVALO'
            DataSource = ds
          end
          object dbeNumeroParcelas: TDBRealEdit
            Left = 361
            Top = 80
            Width = 131
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 4
            WordWrap = False
            OnExit = dbeNumeroParcelasExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = fFixed
            Signal = False
            DataField = 'NUMPARCELAS'
            DataSource = ds
          end
          object CMDateTimePicker1: TCMDateTimePicker
            Left = 8
            Top = 133
            Width = 145
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAULTGERACAO'
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
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 6
          end
          object CMDateTimePicker2: TCMDateTimePicker
            Left = 176
            Top = 133
            Width = 145
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAULTVENC'
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
            Enabled = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 7
          end
          object edtMotivoAltParcela: TEdit
            Left = 361
            Top = 133
            Width = 307
            Height = 21
            Hint = 'Só preencha caso for alterar a Quantidade de Parcelas!'
            Enabled = False
            MaxLength = 60
            TabOrder = 5
            OnExit = edtMotivoAltParcelaExit
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 675
            Height = 195
            Selected.Strings = (
              'DESCCC'#9'27'#9'Centro de Custo'#9'F'
              'PERCRATEIOCONTR'#9'10'#9'Percentual'#9'F'
              'NOMEPROG'#9'18'#9'Programa'#9'F'
              'NOME_PLANO'#9'22'#9'Plano'#9'F'
              'NOME_PATRO'#9'32'#9'Patrocinadora'#9'F'
              'NOME_UNIDNEGOCIO'#9'25'#9'Unidade de Negócio'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 675
            Height = 195
            object Label21: TLabel
              Left = 8
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object lblPrograma: TLabel
              Left = 296
              Top = 8
              Width = 54
              Height = 13
              Caption = 'Programa'
            end
            object Label20: TLabel
              Left = 296
              Top = 87
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label28: TLabel
              Left = 368
              Top = 103
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
            object lblPlanoPrevC: TLabel
              Left = 8
              Top = 47
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object lblPatroC: TLabel
              Left = 296
              Top = 47
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label16: TLabel
              Left = 9
              Top = 87
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object Label23: TLabel
              Left = 10
              Top = 127
              Width = 113
              Height = 13
              Caption = 'Sub-Despesa (FDO)'
            end
            object dblcCentroCusto: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 270
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome'#9'F'
                'CODEXTERNO'#9'10'#9'Código'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblcCentroCustoCloseUp
              OnExit = dblcCentroCustoExit
            end
            object dblcPrograma: TwwDBLookupCombo
              Left = 296
              Top = 24
              Width = 269
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCPROGRAMA'#9'60'#9'Descrição'
                'CODPROGRAMA'#9'2'#9'Código')
              DataField = 'IDPROGRAMA'
              DataSource = dsDet
              LookupTable = cdsPrograma
              LookupField = 'IDPROGRAMA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbePercentualRateio: TDBRealEdit
              Left = 296
              Top = 101
              Width = 63
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '100,0000')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCRATEIOCONTR'
              DataSource = dsDet
            end
            object dblcPlanoPrevC: TwwDBLookupCombo
              Left = 8
              Top = 61
              Width = 270
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = cdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcPlanoPrevCCloseUp
            end
            object dblcPatroC: TwwDBLookupCombo
              Left = 296
              Top = 61
              Width = 269
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL'#9'F')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = cdsPatrocinador
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              Style = csDropDownList
              DropDownCount = 5
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcPatroCCloseUp
            end
            object DBcboUnidNegocio: TwwDBLookupCombo
              Left = 8
              Top = 101
              Width = 270
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = cdsAtividadeNeg
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownCount = 6
              DropDownWidth = 8
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CMProcuraMaskContasOrcamen: TCMProcuraMask
              Left = 394
              Top = 82
              Width = 256
              Height = 68
              Caption = ' Conta Orçamentária '
              TabOrder = 7
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'IDCONTAORCAMEN'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              LookupSql.Strings = (
                '   SELECT                                         '
                '       P.MASCGRUPOORC, '
                '       C.IDPLANOORCAMEN,                          '
                '       C.IDCONTAORCAMEN,                          '
                '       C.NOMECONTAORCAMEN                         '
                '   FROM                                           '
                '       CONTASORCAMEN C,                           '
                '       PARAMORCAMENTO P                           '
                '   WHERE                                          '
                '          C.IDPESSOA       = P.IDPESSOA              '
                '   AND P.IDPLANOORCAMEN = C.IDPLANOORCAMEN        '
                '   ORDER BY C.NOMECONTAORCAMEN            ')
              AceitaTipoConta = Indiferente
              Mascara = '9.9.9.9.9.99.99.99.99.99'
              MontaSelect = ms_contaorc
              LookupQuery = cdsContasOrcamen
              LookupSQLParams = sqlContaOrc
              LookupParam = 'IDCONTAORCAMEN'
              LookupChave = 'IDCONTAORCAMEN'
              LookupDescricao = 'NOMECONTAORCAMEN'
            end
            object CboSubDespesa: TCMDBLookupCombo
              Left = 10
              Top = 143
              Width = 270
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCSUBDESPESA'#9'15'#9'Sub-Despesa'#9'F')
              DataField = 'IDDESPESAORC'
              DataSource = dsDet
              LookupTable = cdsSubDespesa
              LookupField = 'IDDESPESAORC'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              ParentShowHint = False
              ShowHint = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object tbsObservacao: TTabSheet
          Caption = 'Observação'
          ImageIndex = 3
          object memObs: TDBMemo
            Left = 0
            Top = 0
            Width = 675
            Height = 195
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = ds
            MaxLength = 250
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 773
      end
      inherited Dock974: TDock97
        Left = 687
        Height = 223
      end
    end
  end
  inherited Dock972: TDock97
    Width = 783
    object lblStatus: TLabel [0]
      Left = 654
      Top = 12
      Width = 88
      Height = 24
      Alignment = taRightJustify
      Caption = 'lblStatus'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 423
    Width = 783
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 594
    Top = 65535
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 398
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 656
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 296
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    BeforeEdit = CdsBeforeEdit
    AfterPost = CdsAfterPost
    Left = 356
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'C.CODCONTRATOEMPR'
      'C.NOMECONTRATO'
      'OC.NOMEOBJETO'
      'IC.NOME_ITEM'
      'O.DATABASEITEM'
      'DECODE(C.FLGFIMCONTRATO,'#39'E'#39','#39'Encerrado'#39','#39#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Processo'
      'Contrato'
      'Serviço/Produto'
      'Item'
      'Data Base do Item'
      'Status')
    SensivelACaixa.Strings = (
      'N'
      'N'
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
      'O.IDITEM'
      'DECODE(C.FLGFIMCONTRATO,'#39'E'#39','#39'Encerrado'#39','#39#39')')
    Filtro.Strings = (
      '(OC.IDOBJETO = O.IDOBJETO)'
      '(IC.IDITEM = O.IDITEM)'
      '(C.IDCONTRATO = O.IDCONTRATO)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '60'
      '60'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
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
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
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
      ''
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 720
    Top = 65535
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 700
    Top = 271
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsRateios
    OnDataChange = dsDetDataChange
    Left = 726
    Top = 327
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      '   SELECT                                         '
      '       P.MASCGRUPOORC, '
      '       C.IDPLANOORCAMEN,                          '
      '       C.IDCONTAORCAMEN,                          '
      '       C.NOMECONTAORCAMEN                         '
      '   FROM                                           '
      '       CONTASORCAMEN C,                           '
      '       PARAMORCAMENTO P                           '
      '   WHERE                                          '
      '       P.IDPESSOA       =   1'
      '   AND C.IDPESSOA       = P.IDPESSOA              '
      '   AND P.IDPLANOORCAMEN = C.IDPLANOORCAMEN        '
      '   ORDER BY C.NOMECONTAORCAMEN                   '
      ''
      '')
    ClientDataSet = cdsContasOrcamen
    Left = 712
    Top = 55
  end
  object cdsRateios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 684
    Top = 327
    object cdsRateiosIDRATEIOCCUSTO: TFloatField
      FieldName = 'IDRATEIOCCUSTO'
    end
    object cdsRateiosIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object cdsRateiosIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object cdsRateiosIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object cdsRateiosIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object cdsRateiosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsRateiosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object cdsRateiosIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object cdsRateiosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object cdsRateiosIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
    object cdsRateiosCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsRateiosPERCRATEIOCONTR: TFloatField
      FieldName = 'PERCRATEIOCONTR'
      DisplayFormat = ',0.0000'
      EditFormat = ',0.0000'
    end
    object cdsRateiosIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
    end
    object cdsRateiosIDCONTAORCAMEN: TStringField
      FieldName = 'IDCONTAORCAMEN'
      Size = 30
    end
    object cdsRateiosNOMEPROG: TStringField
      FieldName = 'NOMEPROG'
      Size = 60
    end
    object cdsRateiosDESCCC: TStringField
      FieldName = 'DESCCC'
      Size = 30
    end
    object cdsRateiosNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object cdsRateiosNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object cdsRateiosNOME_UNIDNEGOCIO: TStringField
      FieldName = 'NOME_UNIDNEGOCIO'
      Size = 25
    end
    object cdsRateiosDIVISOR: TStringField
      FieldName = 'DIVISOR'
      FixedChar = True
      Size = 1
    end
    object cdsRateiosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object cdsRateiosCONTA: TStringField
      FieldName = 'CONTA'
      Size = 18
    end
    object cdsRateiosIDDESPESAORC: TFloatField
      FieldName = 'IDDESPESAORC'
    end
  end
  object cdsServicoProduto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 356
    Top = 87
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 388
    Top = 135
  end
  object cdsMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 476
    Top = 97
  end
  object cdsContratos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 55
    Data = {
      930800009619E0BD0100000018000000260004000000030000009F040A494443
      4F4E545241544F08000400000000000C4E4F4D45434F4E545241544F01004900
      00000100055749445448020002003C000C434F44504F5254464F524D41080004
      00000000000D4944454E44434F4252414E434108000400000000000F434F4443
      454E54524F524553504F4E01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00084944504553534F41
      08000400000000000E4944454E44434F52524553504F4E08000400000000000C
      4944454E44454E5452454741080004000000000009554E49444E45474F430800
      040000000000094944434F4E5441544F0800040000000000084944464F52434C
      490800040000000000094D4F45434F4449474F08000400000000000D49445245
      53504F4E534156454C08000400000000000C5449504F434F4E545241544F0100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001001144455343524943414F434F4E545241544F04004B00
      0000020007535542545950450200490005005465787400055749445448020002
      00F4010E44415441415353494E415455524108000800000000000E434F444155
      58434F4E545241544F0100490000000100055749445448020002001400115641
      4C4F5242415345434F4E545241544F0800040000000000104441544142415345
      434F4E545241544F08000800000000000F4441544150524556454E4345525241
      08000800000000000D5052415A4F44454E554E43494108000400000000000F43
      4F44434F4E545241544F454D5052010049000000010005574944544802000200
      14000A464C47454D50454E484F01004900000002000753554254595045020049
      000A00466978656443686172000557494454480200020001000F444154414546
      4554454E434552524108000800000000000D4D4F5449564F454E434552524101
      00490000000100055749445448020002003C000E464C4746494D434F4E545241
      544F01004900000002000753554254595045020049000A004669786564436861
      720005574944544802000200010009434F44544950444F430800040000000000
      0D5452474454494E434C5553414F08000800000000000F54524755534552494E
      434C5553414F0100490000000100055749445448020002001E000952454E4F56
      4143414F04004B00000002000753554254595045020049000500546578740005
      574944544802000200F4010A4F42534552564143414F04004B00000002000753
      554254595045020049000500546578740005574944544802000200F4010C4944
      41444954414D454E544F08000400000000000A494454454C45464F4E45080004
      0000000000104944524553455256414F5243414D454E08000400000000000541
      5649534F08000400000000001149445449504F50524F434553534F5241440800
      0400000000000E464C47474552414E4F54414445420100490000000200075355
      4254595045020049000A00466978656443686172000557494454480200020001
      000A44415441494E4943494F08000800000000000100044C4349440400010009
      08000000504004000140015455050000000000003E403B42414E434F20444F20
      42524153494C202D20504147414D454E544F204445204449564552534F532050
      4F5220434F4E544120544552434549524F530332323200000000000000400000
      000000004340000000000000F03F0000000050F4304100000000000018400000
      00000091C440015029000000504147414D454E544F204445204449564552534F
      5320504F5220434F4E544120544552434549524F530000CAF9F4B1CC42000000
      00000000000000CAF9F4B1CC42000060D2A0B5CC420000000000003E4004532F
      4E3F014E0153000000000000F03F009CA2068CB2CC4205434D35313000504004
      000140015455050000000000004040164144414D4953205345525649434F5320
      4745524149530334323200000000000000400000000000E06640000000000000
      F03F0000000098F730410000000000001840000000000089C34001507A000000
      505245535441433F4F204445205345525649434F53204445204C494D50455A41
      20494E5445524E41204520434F4E5345525641433F4F20444F20454449464943
      494F2052454645522C204558434C55494E444F2041532053414C415320444F20
      323F2C20333F2C20343F2C353F206520363F20414E44415245530000B4BE5AAC
      CC420000000080B4E6400000B4BE5AACCC420000F41DE5AFCC42000000000000
      4E400C3030322F52454645522F3939014E0153000000000000F03F00BCAE118C
      B2CC4205434D353130005050040001410154550500000000008041402C424F55
      43494E48415320262043414D504F5320532F43202041554449542E20494E4445
      50454E44454E544553033131330000000000000040000000000000F03F000000
      00174B3741000000000000184000000000954337410150520000005052455354
      41433F4F20444520534552562E2044452041554449544F524941204441532044
      454D4F4E53545241433F45532046494E414E43454952415320444F2045584552
      434943494F2044452032303030000014194FB2CC42000000000095D040000014
      194FB2CC42000014194FB2CC420C3032312F52454645522F3030014E01530000
      00000000F03F009884198CB2CC4207434D313031363400100004010151015455
      0500000000008044400C3033382F52454645522F3032000000007E7E37410332
      31310000000000000040000000007E7E3741000000007E7E3741000000000000
      F03F00000000E5453741000000000000184001501F0000005465737465206465
      206C616EE7616D656E746F20646520636F6E747261746F0000E2373DB9CC4200
      000000000059400000664461B9CC420000329BC4BACC42033033380153000000
      000000F03F008CAEC64BB9CC4209434D31353330353339}
  end
  object cdsItemContratual: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 412
    Top = 47
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 476
    Top = 111
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 87
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 580
    Top = 103
  end
  object cdsCentroCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 668
    Top = 135
    Data = {
      3F1300009619E0BD01000000180000000300AD00000003000000B2000E434F44
      43454E54524F435553544F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A000A434F444558544552
      4E4F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A00044E4F4D4501004900000001000557494454
      48020002001E000100044C434944040001000908000000000431333030043133
      303017434F414445202D2053454D2055534F202D205445535445000004313430
      3004313430300F434F474543202D2053454D2055534F00000431323030043132
      30300F4A55524944202D2053454D2055534F0000043731303004373130300D43
      4F5345472053454D2055534F0000043732303004373230300D434F494E462053
      454D2055534F0000043831303004383130300F434F415449202D2053454D2055
      534F0000043832303004383230300F434F524941202D2053454D2055534F0000
      043832303304383230330F4745414349202D2053454D2055534F000003343231
      033432310F444541494D202D2053454D2055534F000003343232033432320F44
      45504144202853454D2055534F29000003343233033432330F4445524548202D
      2053454D2055534F000003343234033432340F4445494E46202D2053454D2055
      534F000003333131033331310F4153444553202D2053454D2055534F00000432
      32323104323232310F5345544553203D2053454D2055534F0000043232323204
      323232320F5345434F54202D2053454D2055534F000003333031033330310F43
      454E4150202D2053454D2055534F0000043332313104333231310F5345424543
      202D2053454D2055534F000003323232033232320F4445414649202D2053454D
      2055534F00000136013609436F6E73656C686F73000004333231320433323132
      0F5345424555202D2053454D2055534F0000043332323104333232310F534543
      4144202D2053454D2055534F0000043332323204333232320F534552454C202D
      2053454D2055534F000003363031033630311E436F6E73656C686F2044656C69
      626572617469766F2D2053454D2055534F0000033630320336303219436F6E73
      656C686F2046697363616C202D2053454D2055534F0000033530300335303018
      476162696E657465204449464953202D2053454D2055534F0000043432343104
      3432343110534544455320202D2053454D2055534F0000043432343204343234
      320F5345535550202D2053454D2055534F00000132013205444946494E000001
      3101310544495052450000013301330544495345470000013401340544495241
      440000013501350F4449464953202D2053454D2055534F000001390139055245
      4645520000033130300331303018476162696E657465204449505245202D2053
      454D2055534F0000033230300332303018476162696E65746520444946494E20
      2D2053454D2055534F0000033330300333303018476162696E65746520444953
      4547202D2053454D2055534F0000033430300334303018476162696E6574652D
      4449524144202D2053454D2055534F000003313131033131310F44454A555220
      2D2053454D2055534F000003313132033131320F4445434F53202D2053454D20
      55534F000003313133033131330D415544494E2053454D2055534F0000033231
      3103323131104153534F4320202D2053454D2055534F00000332313203323132
      0F4153414E49202D2053454D2055534F000003323231033232310F4445434F4E
      202D2053454D2055534F000003323233033232330F4445494E56202D2053454D
      2055534F000003333231033332310F4445414245202D2053454D2055534F0000
      03333232033332320F4445524543202D2053454D2055534F0000033431310334
      31310F41534F4D45202853454D2055534F29000003323133033231330F41534F
      4D45202D2053454D2055534F000003323234033232340E444541494D202D5345
      4D2055534F000003323235033232350F4445504144202D2053454D2055534F00
      0003323236033232360F4445524548202D2053454D2055534F00000332323703
      3232370F4445494E46202D2053454D2055534F0000043232373104323237310F
      5345444553202D2053454D2055534F0000043232373204323237320F53455355
      50202D2053454D2055534F000003313134033131340F4445504143202D205345
      4D2055534F0000043131323104313132310F43454E4150202D2053454D205553
      4F000003313530033135300E476162696E6574652D4449505245000003313531
      0331353105534543455800000331353203313532054153504C41000003313533
      03313533054153434F4D000003313534033135340541534A5552000003323330
      033233300E476162696E6574652D444946494E0000033233310332333105434F
      494E56000004323331310432333131054745494E560000043233313204323331
      32054745494D4F000004323331330432333133054745414E4900000332333203
      32333205434F524941000004323332310432333231054745434F460000043233
      32320432333232054745434F4E000003333330033333300E476162696E657465
      2D44495345470000033333310333333105434F42454E00000433333131043333
      313105474542454E000004333331320433333132054745434152000003333332
      0333333205434F50415200000433333231043333323105474543415000000433
      3332320433333232054745415455000003343330033433300E476162696E6574
      652D44495241440000033433310334333105434F52454F000004343331310434
      3331310547455245480000043433313204343331320547454F52470000033433
      320334333205434F52494C000004343332310434333231054745494E46000004
      343332320434333232054745504F4C0000033134390331343905415544494E00
      000439303031043930303109436F6E73656C686F730000043930303204393030
      321444495245544F52494120505245534944454E544500000439303033043930
      30331744495245544F5249412044452053454755524944414445000004393030
      36043930303615436F6E73656C686F2044656C69626572617469766F00000439
      303037043930303716436F6E73656C686F2046697363616C204252414D203200
      000439303038043930303811476162696E657465206461204449505245000004
      3930303904393030391E53656372657461726961204578656375746976612064
      61205072657369640000043930313004393031301E4173736573736F72696120
      646520436F6D756E696361E7E36F20536F63690000043930313104393031311E
      4173736573736F72696120646520506C616E656A616D656E746F2065204F0000
      04393031320439303132134173736573736F726961204A7572ED646963610000
      043930313304393031331141756469746F72696120496E7465726E6100000439
      303134043930313411476162696E657465206461204449534547000004393031
      3504393031351E436F6F72642E2064652041646D696E6973747261E7E36F2062
      656E65662E0000043930313604393031361E436F6F72642E2064652041646D69
      6E6973747261E7E36F2062656E65662E00000439303137043930313716476572
      EA6E6369612064652042656E6566ED63696F730000043930313804393031381D
      436F6F72642E64652041646D696E6973747261E7E36F2070617274632E000004
      3930313904393031391D436F6F72642E64652041646D696E6973747261E7E36F
      2070617274632E00000439303230043930323014476572EA6E63696120646520
      436164617374726F0000043930323104393032311A44495245544F5249412044
      452041444D494E4953545241C7C34F0000043930323204393032321147616269
      6E6574652064612044495241440000043930323304393032331B436F6F72642E
      2064652041646D2E2065204465732E2064652052480000043930323404393032
      341B436F6F72642E2064652041646D2E2065204465732E206465205248000004
      3930323504393032351D4765722E2041646D2E2065204465732E205265632E20
      48756D616E6F730000043930323604393032361E436F6F72642E205265632E20
      496E666F722E2065204C6F67ED737469636F0000043930323704393032371E43
      6F6F72642E205265632E20496E666F722E2065204C6F67ED737469636F000004
      39303238043930323817476572EA6E63696120646520496E666F726DE1746963
      610000043930323904393032391444495245544F5249412046494E414E434549
      524100000439303330043930333011476162696E65746520646120444946494E
      0000043930333104393033311E436F6F7264656E61646F72696120646520496E
      76657374696D656E746F730000043930333204393033321E436F6F7264656E61
      646F72696120646520496E76657374696D656E746F7300000439303334043930
      33341B4765722E646520496E766573742E20496D6F62696C69E172696F730000
      043930333504393033351E436F6F7264656E61646F72696120646520436F6E74
      726F6C61646F7269610000043930333604393033361E436F6F7264656E61646F
      72696120646520436F6E74726F6C61646F726961000004393033370439303337
      1B4765722E20646520436F6E74726F6C652046696E616E636569726F00000331
      3230033132300F4A55524944202D2053454D2055534F00000331393903313939
      0F4449505245202D2053454D2055534F000003313130033131300F415544494E
      202D2053454D2055534F0000043132303104313230310F434F4E5445202D2053
      454D2055534F00000431323032043132303214434F4E5355202D2053454D2055
      534F2D20414C54000003313330033133300F434F4144202D2053454D2055534F
      200000043133303104313330310F4745504C4F202D2053454D2055534F000004
      3133303204313330320F4745434F45202D2053454D2055534F00000331343003
      3134300F434F474543202D2053454D2055534F0000043134303104313430310F
      474550454E202D2053454D2055534F0000043134303204313430320F47454154
      49202D2053454D2055534F0000033631300336313005434F44454C0000033632
      300336323005434F4649530000013701370F444942454F202D2053454D205553
      4F000003373939033739390F444942454F202D2053454D2055534F0000033731
      30033731300F434F534547202D2053454D2055534F0000043731303104373130
      310D47454341502053454D2055534F0000043731303204373130320D47454142
      452053454D2055534F0000043731303304373130330D47454341522053454D20
      55534F000003373230033732300F434F494E46202D2053454D2055534F000004
      3732303104373230310D47454150412053454D2055534F000004373230320437
      3230320D47454C4F472053454D2055534F0000013801380F4449464944202D20
      53454D2055534F000003383939033839390F4449464944202D2053454D205553
      4F000003383130033831300F434F415449202D2053454D2055534F0000043831
      303104383130310F4745544543202D2053454D2055534F000004383130320438
      3130320F4745415455202D2053454D2055534F000003383230033832300F434F
      524941202D2053454D2055534F0000043832303104383230310F4745494E5620
      2D2053454D2055534F0000043832303204383230320F4745434F46202D205345
      4D2055534F0000043930333804393033381B4765722E436F6E74726F6C652064
      65204172726563616461E7E36F00000439303339043930333913476572EA6E63
      696120646520416EE16C6973650000043930343004393034301C4765722E2044
      6573656E762E204F7267616E697A6163696F6E616C2E00000439303431043930
      34311E4765722E2064652041706F696F2041646D2E2065204C6F67ED73746963
      6F0000043930343204393034321A4765722E646520496E766573742E204D6F62
      696C69E172696F730000043930343304393034331D4765722E20416EE16C6973
      6520646520496E76657374696D656E746F730000043930343404393034341947
      65722E20646520436F6E74726F6C6520436F6E74E162696C0000043930343504
      3930343505415354454300000439303436043930343607456C656E6963650000
      0439303437043930343705746573746500000439303438043930343805546573
      7465000004393034390439303439067465737465730000043930353004393035
      301054455354452043415449412053494E540000043930353104393035311C54
      45535445204341544941202D20323030362053494E54C95449434F0000043930
      3533043930353315544553544520434154494120414E414C495449434F000004
      3930353604393035360E746573746520646F2044495052450000043930353504
      393035351354455354452050415241204558434C5553414F0000043930353704
      3930353711544553544520444520494E434C5553414F00000439303538023930
      035041490000043930353901390C50414920444520544F444F53000004393036
      3003393131057465737465000004393036310639303031303105746573746500
      000439303634033130310B54455354452046494C484F00000439303633013109
      54455354452050414900000439303635033631320E746573746520646F20626F
      74E36F}
  end
  object cdsAditamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 65535
  end
  object cdsAtividadeNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 668
    Top = 87
  end
  object cdsLogAditamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 12
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 300
    Top = 63
  end
  object SqlPlanPrevContabPatro: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM PLANPREVCONTABPATRO '
      'WHERE IDPLANOPREV = :IDPLANOPREV AND'
      '      IDPATRO = :IDPATRO')
    ClientDataSet = CdsPlanPrevContabPatro
    Left = 545
    Top = 195
  end
  object CdsPlanPrevContabPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 577
    Top = 195
  end
  object cdsContasOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 438
    Top = 165
  end
  object ms_contaorc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Conta'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
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
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 601
    Top = 275
  end
  object sqlContaOrc: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '      P.MASCGRUPOORC,'
      '       P.IDPLANOORCAMEN'
      '   FROM'
      '       PARAMORCAMENTO P'
      ''
      ''
      '')
    ClientDataSet = cdsContasOrcamen
    Left = 433
    Top = 219
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select CODCENTROCUSTO, CODEXTERNO, NOME'
      'from CENTCUST'
      ' ')
    ClientDataSet = cdsCentroCusto
    Left = 302
    Top = 165
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      
        'SELECT R.IDRATEIOCCUSTO,   R.IDEMPRESA,   R.IDCONTRATO,     R.ID' +
        'OBJETO,'
      
        '       R.IDITEM,           R.IDPESSOA,    R.UNIDNEGOC,      R.ID' +
        'PATRO,'
      
        '       R.IDPLANOPREV,      R.IDPROGRAMA,  R.CODCENTROCUSTO, R.PE' +
        'RCRATEIOCONTR,'
      
        '       R.IDPLANOORCAMEN,   R.IDCONTAORCAMEN, PR.DESCPROGRAMA AS ' +
        'NOMEPROG,'
      
        '       CC.NOME AS DESCCC, PA.RAZAOSOCIAL AS NOME_PATRO, PL.NOME ' +
        'AS NOME_PLANO,'
      
        '       UN.NOME AS NOME_UNIDNEGOCIO, '#39'P'#39' AS DIVISOR, OI.PLACONTA,' +
        ' NVL(TR.PLACONTACREDITO, E.CONTACFORN) AS CONTA'
      
        'FROM RATEIOCENTROCUSTO R, PESSOA PA, PLANPREVCONTABIL PL, CENTCU' +
        'ST CC, PROGRAMA PR, UNIDNEGOCIO UN,'
      
        '     OBJETOXITEM OI, TIPORECEBDESEMB TR, CONTRATOCONTR C, EMPRES' +
        'AFORN E'
      'WHERE R.IDEMPRESA      = CC.IDEMPRESA'
      '  AND R.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND R.IDPROGRAMA     = PR.IDPROGRAMA(+)'
      '  AND R.IDPATRO        = PA.IDPESSOA(+)'
      '  AND R.IDPLANOPREV    = PL.IDPLANOPREV(+)'
      '  AND R.IDPESSOA       = UN.IDPESSOA(+)'
      '  AND R.UNIDNEGOC      = UN.UNIDNEGOC(+)'
      '  AND R.IDITEM         = OI.IDITEM'
      '  AND R.IDOBJETO       = OI.IDOBJETO'
      '  AND OI.IDPESSOA      = TR.IDPESSOA(+)'
      '  AND OI.CODTIPRECDES  = TR.CODTIPRECDES(+)'
      '  AND OI.RECPAG        = TR.RECPAG(+)'
      '  AND R.IDCONTRATO     = C.IDCONTRATO'
      '  AND C.IDFORCLI       = E.IDFORCLI'
      '  AND E.IDPESSOA       = R.IDEMPRESA'
      'ORDER BY DESCCC')
    ClientDataSet = cdsRateios
    Left = 637
    Top = 383
  end
  object sqlFormulaOrc: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       *'
      '   FROM'
      '       FORMORCADO'
      '   ORDER BY NOME'
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsFormulaOrc
    Left = 425
    Top = 379
  end
  object cdsFormulaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 526
    Top = 373
  end
  object cdsSubDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 395
  end
  object sqlSubDespesa: TCMSqlParams
    SQL.Strings = (
      ''
      '')
    ClientDataSet = cdsSubDespesa
    Left = 333
    Top = 391
  end
  object cdsCtrlParcelaMedicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 291
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from CTRLPARCELAMEDICAO ')
    ValidateWithMask = True
    Left = 532
    Top = 252
  end
  object qryObsAltParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from CTRLPARCELAMEDICAO ')
    ValidateWithMask = True
    Left = 532
    Top = 296
  end
end
