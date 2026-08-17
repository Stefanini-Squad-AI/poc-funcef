inherited FrmCotacao: TFrmCotacao
  Left = 18
  Top = 56
  Caption = 'Cotação de Preços'
  ClientHeight = 449
  ClientWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 265
    Width = 498
    Height = 363
    inherited pnlMestre: TPanel
      Tag = 99
      Width = 496
      Height = 60
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Fornecedor'
      end
      object Label2: TLabel
        Left = 392
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Nº da Proposta'
        FocusControl = edNumProp
      end
      object edNumProp: TDBEdit
        Left = 392
        Top = 24
        Width = 89
        Height = 21
        Color = clGray
        DataField = 'PROPOSTA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dblcForn: TCMDBLookupCombo
        Tag = 99
        Left = 8
        Top = 24
        Width = 369
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'40'#9'Razão Social'
          'PROPOSTA'#9'10'#9'Nº da Proposta')
        LookupTable = qryForn
        LookupField = 'CHAVE'
        Options = [loTitles]
        Style = csDropDownList
        Color = 14286847
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcFornCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Tag = 99
      Top = 61
      Width = 496
      Height = 301
      Tabs.Strings = (
        'Preços'
        'Pz. Entrega'
        'Pz. Pgto.'
        'Agregados'
        'Dados Fornecedor'
        'Obs.')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'GrdPrazoPag'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 398
        Height = 242
        ActivePage = tbsOBSSoli
        object TabPreco: TTabSheet [0]
          Tag = 99
          Caption = 'TabPreco'
          object Label9: TLabel
            Left = 8
            Top = 112
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Label10: TLabel
            Left = 8
            Top = 152
            Width = 97
            Height = 13
            Caption = 'Data da Cotação'
          end
          object Label11: TLabel
            Left = 352
            Top = 72
            Width = 109
            Height = 13
            Caption = 'Taxa de Juros a.m.'
          end
          object Label7: TLabel
            Left = 8
            Top = 72
            Width = 34
            Height = 13
            Caption = 'Preço'
          end
          object Label12: TLabel
            Left = 144
            Top = 72
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label13: TLabel
            Left = 144
            Top = 112
            Width = 69
            Height = 13
            Caption = 'Observação'
          end
          object Label29: TLabel
            Left = 8
            Top = 192
            Width = 45
            Height = 13
            Caption = 'Contato'
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 3
            Width = 217
            Height = 65
            Caption = ' Solicitada '
            TabOrder = 0
            object Label3: TLabel
              Left = 8
              Top = 16
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label4: TLabel
              Left = 136
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object edQtdePedida: TDBRealEdit
              Left = 8
              Top = 32
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Color = clGray
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEPEDIDA'
              DataSource = ds
            end
            object edUnid: TDBEdit
              Left = 136
              Top = 32
              Width = 73
              Height = 21
              Color = clGray
              DataField = 'UNIDPED'
              DataSource = ds
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object GrpForn: TGroupBox
            Left = 231
            Top = 3
            Width = 234
            Height = 65
            Caption = ' Fornecida '
            TabOrder = 1
            TabStop = True
            object Label6: TLabel
              Left = 8
              Top = 16
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label8: TLabel
              Left = 136
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object edQtdeForn: TDBRealEdit
              Left = 8
              Top = 32
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEFORNECIDA'
              DataSource = ds
            end
            object dblcUN: TwwDBLookupCombo
              Left = 136
              Top = 32
              Width = 89
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = ds
              LookupTable = qryUnidMed
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object edRef: TDBRealEdit
            Left = 8
            Top = 128
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'NUMCOT'
            DataSource = ds
          end
          object edDataCot: TCMDateTimePicker
            Left = 8
            Top = 168
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATACOT'
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
            TabOrder = 5
          end
          object edPreco: TDBRealEdit
            Left = 8
            Top = 88
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '    0,0000')
            ParentFont = False
            TabOrder = 2
            WordWrap = False
            OnExit = edPrecoExit
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'PRECO'
            DataSource = ds
          end
          object dblcMoeda: TCMDBLookupCombo
            Left = 144
            Top = 88
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição'
              'MOESIGLA'#9'10'#9'Sigla')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object memOBS: TDBMemo
            Left = 144
            Top = 128
            Width = 321
            Height = 65
            DataField = 'OBS'
            DataSource = ds
            MaxLength = 200
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object edTxJuros: TDBEdit
            Left = 352
            Top = 88
            Width = 84
            Height = 21
            DataField = 'TXJUROS'
            DataSource = ds
            TabOrder = 7
          end
          object edContato: TDBEdit
            Left = 8
            Top = 208
            Width = 449
            Height = 21
            DataField = 'CONTATO'
            DataSource = ds
            TabOrder = 8
          end
        end
        inherited tbsDet: TTabSheet
          Tag = 99
          inherited dbgrdDet: TwwDBGrid
            Width = 390
            Height = 214
            Selected.Strings = (
              'DATAENT'#9'10'#9'Data de Entrega'
              'QTDEENT'#9'10'#9'Quantidade'
              'CODMEDIDA'#9'4'#9'Unidade'
              'PRAZOENT'#9'10'#9'Prazo em dias')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel
            Width = 390
            Height = 214
            object Label14: TLabel
              Left = 8
              Top = 72
              Width = 94
              Height = 13
              Caption = 'Data de Entrega'
            end
            object Label15: TLabel
              Left = 256
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Prazo'
            end
            object Label16: TLabel
              Left = 344
              Top = 40
              Width = 26
              Height = 13
              Caption = 'Dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel
              Left = 8
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Qtde. Fornecida'
            end
            object Label18: TLabel
              Left = 160
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object edDataEnt: TCMDateTimePicker
              Left = 8
              Top = 88
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAENT'
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
              TabOrder = 2
            end
            object edPrazoEnt: TDBRealEdit
              Left = 256
              Top = 32
              Width = 81
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              TabOrder = 1
              WordWrap = False
              OnExit = edPrazoEntExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRAZOENT'
              DataSource = dsDet
            end
            object edUnEnt: TDBEdit
              Left = 160
              Top = 32
              Width = 81
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'CODMEDIDA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edQtdeEnt: TDBEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              DataField = 'QTDEENT'
              DataSource = dsDet
              TabOrder = 0
            end
          end
        end
        object TabPrazoPag: TTabSheet
          Tag = 99
          Caption = 'TabPrazoPag'
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 390
            Height = 214
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label19: TLabel
              Left = 256
              Top = 16
              Width = 113
              Height = 13
              Caption = 'Data de Pagamento'
            end
            object Label20: TLabel
              Left = 136
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Prazo'
            end
            object Label21: TLabel
              Left = 208
              Top = 40
              Width = 26
              Height = 13
              Caption = 'Dias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 8
              Top = 16
              Width = 96
              Height = 13
              Caption = 'Percentagem (%)'
            end
            object edDataPag: TCMDateTimePicker
              Left = 256
              Top = 32
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPGTO'
              DataSource = dsPrazoPag
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
            object edPrazoPag: TDBRealEdit
              Left = 136
              Top = 32
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              TabOrder = 1
              WordWrap = False
              OnExit = edPrazoPagExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRAZOPGTO'
              DataSource = dsPrazoPag
            end
            object edPercentPag: TDBRealEdit
              Left = 8
              Top = 32
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Lines.Strings = (
                '      0,00')
              ParentFont = False
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCENT'
              DataSource = dsPrazoPag
            end
          end
          object GrdPrazoPag: TwwDBGrid
            Left = 0
            Top = 0
            Width = 390
            Height = 214
            Selected.Strings = (
              'DATAPGTO'#9'10'#9'Data de Pagamento'
              'PRAZOPGTO'#9'10'#9'Prazo em dias'
              'PERCENT'#9'10'#9'Precentual')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoPag
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object TabAgreg: TTabSheet
          Tag = 99
          Caption = 'TabAgreg'
          object PnlGrd: TPanel
            Left = 0
            Top = 0
            Width = 390
            Height = 214
            Align = alClient
            BevelInner = bvLowered
            Caption = 'PnlGrd'
            TabOrder = 0
            TabStop = True
            object grdAgreg: TwwDBGrid
              Left = 2
              Top = 25
              Width = 386
              Height = 144
              Selected.Strings = (
                'DESCCUSTAGREG'#9'21'#9'Descrição'
                'BASE'#9'10'#9'Base'
                'PERCENT'#9'10'#9'Aliquota'
                'VALOR'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              DataSource = dsAgreg
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlack
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 2
              TitleButtons = False
              OnExit = grdAgregExit
              IndicatorColor = icBlack
            end
            object Panel2: TPanel
              Left = 2
              Top = 2
              Width = 386
              Height = 23
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Custos Agregados'
              Color = clGray
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -16
              Font.Name = 'Arial'
              Font.Style = [fsBold, fsItalic]
              ParentFont = False
              TabOrder = 1
            end
            object plnEdAgreg: TPanel
              Left = 2
              Top = 169
              Width = 386
              Height = 43
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object Label25: TLabel
                Left = 24
                Top = 8
                Width = 47
                Height = 13
                Caption = 'Aliquota'
              end
              object Label24: TLabel
                Left = 184
                Top = 8
                Width = 90
                Height = 13
                Caption = 'Base de Cáculo'
              end
              object Label23: TLabel
                Left = 336
                Top = 8
                Width = 30
                Height = 13
                Caption = 'Valor'
              end
              object edAliquota: TDBRealEdit
                Left = 24
                Top = 24
                Width = 105
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                OnExit = edAliquotaExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'PERCENT'
                DataSource = dsAgreg
              end
              object edBaseCalc: TDBRealEdit
                Left = 184
                Top = 24
                Width = 108
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 1
                WordWrap = False
                OnExit = edBaseCalcExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'BASE'
                DataSource = dsAgreg
              end
              object edValorAgreg: TDBRealEdit
                Left = 336
                Top = 24
                Width = 108
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 2
                WordWrap = False
                OnExit = edValorAgregExit
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VALOR'
                DataSource = dsAgreg
              end
            end
          end
        end
        object TabDadosForn: TTabSheet
          Caption = 'TabDadosForn'
          object pcDadosForn: TPageControl
            Left = 0
            Top = 0
            Width = 390
            Height = 214
            ActivePage = tbsEndForn
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object tbsEndForn: TTabSheet
              Caption = 'Endereçamento'
              object Label26: TLabel
                Left = 0
                Top = 0
                Width = 55
                Height = 13
                Caption = 'Endereço'
                FocusControl = edEndereco
              end
              object Label30: TLabel
                Left = 0
                Top = 40
                Width = 37
                Height = 13
                Caption = 'C.E.P.'
                FocusControl = edCEP
              end
              object Label32: TLabel
                Left = 0
                Top = 80
                Width = 106
                Height = 13
                Caption = 'E-Mail da Empresa'
              end
              object lblEMailEmp: TLabel
                Left = 0
                Top = 96
                Width = 118
                Height = 13
                Cursor = crHandPoint
                Caption = 'www.cmsolucoes.com.br'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentColor = False
                ParentFont = False
                OnClick = lblEMailEmpClick
              end
              object Label33: TLabel
                Left = 71
                Top = 40
                Width = 40
                Height = 13
                Caption = 'Cidade'
                FocusControl = edCidade
              end
              object Label31: TLabel
                Left = 273
                Top = 40
                Width = 25
                Height = 13
                Caption = 'U.F.'
                FocusControl = edEstado
              end
              object Label27: TLabel
                Left = 303
                Top = 40
                Width = 27
                Height = 13
                Caption = 'País'
                FocusControl = edEstado
              end
              object Label28: TLabel
                Left = 0
                Top = 116
                Width = 122
                Height = 13
                Caption = 'Telefones e Contatos'
              end
              object edEndereco: TDBEdit
                Left = 0
                Top = 16
                Width = 450
                Height = 21
                Color = clGray
                DataField = 'ENDERECO'
                DataSource = dsDadosForn
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object edCEP: TDBEdit
                Left = 0
                Top = 56
                Width = 68
                Height = 21
                Color = clGray
                DataField = 'CEP'
                DataSource = dsDadosForn
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object wwDBGrid1: TwwDBGrid
                Left = 0
                Top = 95
                Width = 374
                Height = 83
                Selected.Strings = (
                  'DDI'#9'4'#9'DDI'
                  'DDD'#9'5'#9'DDD'
                  'TELEFONE'#9'10'#9'Telefone'
                  'CONTATO'#9'30'#9'Contato'
                  'RAMAL'#9'5'#9'Ramal'
                  'CARGO'#9'15'#9'Cargo'
                  'SETOR'#9'15'#9'Setor'
                  'EMAILCON'#9'40'#9'E-Mail do Contato')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alBottom
                DataSource = dsDadosForn
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ReadOnly = True
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
              object edCidade: TDBEdit
                Left = 71
                Top = 56
                Width = 199
                Height = 21
                Color = clGray
                DataField = 'CIDADE'
                DataSource = dsDadosForn
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
              object edEstado: TDBEdit
                Left = 273
                Top = 56
                Width = 28
                Height = 21
                Color = clGray
                DataField = 'CODESTADO'
                DataSource = dsDadosForn
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
              end
              object edPais: TDBEdit
                Left = 303
                Top = 56
                Width = 147
                Height = 21
                Color = clGray
                DataField = 'NOMEPAIS'
                DataSource = dsDadosForn
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
              end
            end
            object tbsProdForn: TTabSheet
              Caption = 'Últimas Compras'
              object dbgrUltCompForn: TwwDBGrid
                Tag = 99
                Left = 0
                Top = 0
                Width = 374
                Height = 178
                Selected.Strings = (
                  'DESCPROD'#9'30'#9'Item'
                  'VLRUNITARIO'#9'10'#9'Valor Unitário'
                  'VALUNEST'#9'10'#9'Valor Estoque'
                  'CODMEDIDA'#9'4'#9'Unidade'
                  'QTDERECEBDEVOL'#9'10'#9'Quantidade'
                  'DATAENTDEVOL'#9'10'#9'Data')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsUltCompForn
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object tbsOBSSoli: TTabSheet
          Caption = 'tbsOBSSoli'
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 390
            Height = 214
            Align = alClient
            ColCount = 1
            DataSource = dsSCI
            Enabled = False
            PanelHeight = 71
            PanelWidth = 373
            TabOrder = 0
            RowCount = 3
            object dbObsSCI: TDBMemo
              Left = 0
              Top = 0
              Width = 373
              Height = 71
              Align = alClient
              DataField = 'OBSITEMSOLIC'
              DataSource = dsSCI
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 488
      end
      inherited Dock974: TDock97
        Left = 402
        Height = 242
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
    object Label5: TLabel [0]
      Left = 512
      Top = 16
      Width = 96
      Height = 16
      Caption = 'Processo Nº :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        Images = nil
        NumGlyphs = 3
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
    object edProc: TDBEdit
      Left = 608
      Top = 16
      Width = 145
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'CODPROCESSO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 591
      DockPos = 594
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 422
      DockPos = 425
      inherited bbtnConfirmar: TBitBtn
        Tag = 99
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  object plnArt: TPanel [3]
    Left = 0
    Top = 47
    Width = 265
    Height = 363
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'plnArt'
    TabOrder = 3
    object Splitter1: TSplitter
      Left = 0
      Top = 201
      Width = 265
      Height = 7
      Cursor = crVSplit
      Align = alTop
    end
    object GrdUltComp: TwwDBGrid
      Tag = 99
      Left = 0
      Top = 233
      Width = 265
      Height = 130
      Selected.Strings = (
        'VLRUNITARIO'#9'10'#9'Valor Unitário'
        'VALUNEST'#9'10'#9'Valor Estoque'
        'CODMEDIDA'#9'4'#9'Unidade'
        'QTDERECEBDEVOL'#9'10'#9'Quantidade'
        'DATAENTDEVOL'#9'10'#9'Data'
        'RAZAOSOCIAL'#9'60'#9'Fornecedor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsUltComp
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    object GrdArt: TwwDBGrid
      Tag = 99
      Left = 0
      Top = 25
      Width = 265
      Height = 176
      Hint = 'Duplo click para visualizar Cotação'
      Selected.Strings = (
        'DESCRICAO'#9'45'#9'Itens'
        'QTDEPEDIDA'#9'10'#9'Qtde Pedida'
        'SALDOQTDE'#9'10'#9'Saldo'
        'CODMEDCUSTO'#9'4'#9'Unid.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = clWhite
      DataSource = dsProcxArt
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = GrdArtDblClick
      IndicatorColor = icBlack
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 265
      Height = 25
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens em Cotação'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 0
      Top = 208
      Width = 265
      Height = 25
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Últimas Compras'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65531
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 358
    Top = 27
  end
  inherited ds: TwwDataSource
    Left = 221
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACOES'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  IDPROCXART = :IDPROCXART,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  QTDEFORNECIDA = :QTDEFORNECIDA,'
      '  PRECO = :PRECO,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  NUMCOT = :NUMCOT,'
      '  DATACOT = :DATACOT,'
      '  STATUS = :STATUS,'
      '  OBS = :OBS,'
      '  MOECODIGO = :MOECODIGO,'
      '  TXJUROS = :TXJUROS,'
      '  PRECOAVALORPRES = :PRECOAVALORPRES,'
      '  CONTATO = :CONTATO'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    InsertSQL.Strings = (
      'insert into COTACOES'
      
        '  (IDFORCLI, IDPROCXART, CODPROCESSO, PROPOSTA, QTDEFORNECIDA, P' +
        'RECO, CODMEDIDA, '
      
        '   NUMCOT, DATACOT, STATUS, OBS, MOECODIGO, TXJUROS, PRECOAVALOR' +
        'PRES, CONTATO)'
      'values'
      
        '  (:IDFORCLI, :IDPROCXART, :CODPROCESSO, :PROPOSTA, :QTDEFORNECI' +
        'DA, :PRECO, '
      
        '   :CODMEDIDA, :NUMCOT, :DATACOT, :STATUS, :OBS, :MOECODIGO, :TX' +
        'JUROS, '
      '   :PRECOAVALORPRES, :CONTATO)')
    DeleteSQL.Strings = (
      'delete from COTACOES'
      'where'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA')
    Left = 249
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COTACOES.CODPROCESSO'
      'PESSOA.RAZAOSOCIAL'
      'COTACOES.PROPOSTA'
      'PROCXART.CODARTIGO'
      
        'SUBSTR(DECODE(PROCXART.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI' +
        '.DESCPRODVARI),1,60)')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Fornecedor'
      'Nº da Proposta'
      'Código do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSO'
      'COTACOES'
      'PROCXART'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'COTACOES.CODPROCESSO'
      'COTACOES.IDFORCLI'
      'COTACOES.PROPOSTA')
    Filtro.Strings = (
      'PROCESSO.STATUS <> '#39'F'#39
      'COTACOES.CODPROCESSO  = PROCESSO.CODPROCESSO'
      'COTACOES.IDPROCXART   = PROCXART.IDPROCXART'
      'COTACOES.CODPROCESSO  = PROCXART.CODPROCESSO'
      'COTACOES.IDFORCLI     = PESSOA.IDPESSOA'
      'PROCXART.CODARTIGO    = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO     = PRODUTO.CODPRODUTO'
      'PROCXART.IDPRODVARI   = PRODVARI.IDPRODVARI(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '14'
      '60')
    Left = 711
    Top = 5
  end
  inherited ImlPadrao: TImageList
    Top = 138
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.CODMEDIDA,'
      '     C.NUMCOT,'
      '     C.DATACOT,'
      '     C.STATUS,'
      '     C.OBS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES,'
      '     C.CONTATO,'
      '     PXA.CODARTIGO,'
      '     PXA.QTDEPEDIDA,'
      '     PXA.CODMEDIDA AS UNIDPED,'
      
        '     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO,'
      '     P.RAZAOSOCIAL,'
      '     PR.CODPRODUTO,'
      '     G.CODTIPRECDES'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '    PRODUTO PR,'
      '    ARTIGO A,'
      '    PRODVARI PV,'
      '    GRUPPROD G'
      'WHERE'
      '      (C.CODPROCESSO  = :pCODPROCESSO)'
      '  AND (C.IDFORCLI     = :pIDFORCLI)'
      '  AND (C.PROPOSTA     = :pPROPOSTA)'
      '  AND (C.IDPROCXART   = :pIDPROCXART)'
      '  AND (C.IDPROCXART   = PXA.IDPROCXART)'
      '  AND (C.CODPROCESSO  = PXA.CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (PXA.CODARTIGO  = A.CODARTIGO)'
      '  AND (A.CODPRODUTO   = PR.CODPRODUTO)'
      '  AND (PR.CODGRUPOPROD= G.CODGRUPOPROD)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI)'
      ''
      ' '
      ' ')
    Left = 280
    Top = 0
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end>
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Itens'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryQTDEPEDIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryUNIDPED: TStringField
      DisplayWidth = 4
      FieldName = 'UNIDPED'
      Size = 4
    end
    object qryCODARTIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryPROPOSTA: TFloatField
      DisplayLabel = 'Nº da Proposta'
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Visible = False
    end
    object qryQTDEFORNECIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEFORNECIDA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryPRECO: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECO'
      Visible = False
    end
    object qryCODMEDIDA: TStringField
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Visible = False
      Size = 4
    end
    object qryNUMCOT: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMCOT'
      Visible = False
    end
    object qryDATACOT: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATACOT'
      Visible = False
    end
    object qrySTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object qryOBS: TStringField
      DisplayWidth = 200
      FieldName = 'OBS'
      Visible = False
      Size = 200
    end
    object qryMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryTXJUROS: TFloatField
      DisplayWidth = 10
      FieldName = 'TXJUROS'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryPRECOAVALORPRES: TFloatField
      DisplayWidth = 10
      FieldName = 'PRECOAVALORPRES'
      Visible = False
    end
    object qryRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
    object qryCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Visible = False
      Size = 6
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object dsPrazoPag: TwwDataSource
    DataSet = qryPrazoPag
    Left = 422
    Top = 27
  end
  object dsAgreg: TwwDataSource
    DataSet = qryAgreg
    Left = 484
    Top = 28
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       IDPROCXART,'
      '       IDFORCLI,'
      '       CODPROCESSO,'
      '       PROPOSTA,'
      '       IDPRAZOENT,'
      '       QTDEENT,'
      '       CODMEDIDA,'
      '       PRAZOENT,'
      '       PERIODOPRAZO,'
      '       DATAENT'
      'FROM'
      '       PRAZOENTREGA'
      'WHERE'
      '     (CODPROCESSO = :pCODPROCESSO)'
      ' AND (IDFORCLI    = :pIDFORCLI)'
      ' AND (IDPROCXART  = :pIDPROCXART)'
      ' AND (PROPOSTA    = :pPROPOSTA)       ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 358
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryDetDATAENT: TDateTimeField
      DisplayLabel = 'Data de Entrega'
      DisplayWidth = 10
      FieldName = 'DATAENT'
      Origin = 'PRAZOENTREGA.DATAENT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetQTDEENT: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDEENT'
      Origin = 'PRAZOENTREGA.QTDEENT'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDetCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'PRAZOENTREGA.CODMEDIDA'
      Size = 4
    end
    object qryDetPRAZOENT: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOENT'
      Origin = 'PRAZOENTREGA.PRAZOENT'
    end
    object qryDetIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOENTREGA.IDPROCXART'
      Visible = False
    end
    object qryDetIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOENTREGA.IDFORCLI'
      Visible = False
    end
    object qryDetCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOENTREGA.CODPROCESSO'
      Visible = False
    end
    object qryDetPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOENTREGA.PROPOSTA'
      Visible = False
    end
    object qryDetIDPRAZOENT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
      Visible = False
    end
    object qryDetPERIODOPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGA.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
  end
  object qryPrazoPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDPROCXART,'
      '     IDFORCLI,'
      '     CODPROCESSO,'
      '     PROPOSTA,'
      '     IDPRAZOPGTO,'
      '     PRAZOPGTO,'
      '     PERIODOPRAZO,'
      '     DATAPGTO,'
      '     PERCENT'
      'FROM'
      '     PRAZOPGTO'
      'WHERE'
      '     (CODPROCESSO = :pCODPROCESSO)'
      ' AND (IDFORCLI    = :pIDFORCLI)'
      ' AND (IDPROCXART  = :pIDPROCXART)'
      ' AND (PROPOSTA    = :pPROPOSTA)')
    UpdateObject = updPrazoPag
    ValidateWithMask = True
    Left = 422
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryPrazoPagDATAPGTO: TDateTimeField
      DisplayLabel = 'Data de Pagamento'
      DisplayWidth = 10
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryPrazoPagPRAZOPGTO: TFloatField
      DisplayLabel = 'Prazo em dias'
      DisplayWidth = 10
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryPrazoPagPERCENT: TFloatField
      DisplayLabel = 'Precentual'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
      DisplayFormat = '#,##0.00'
    end
    object qryPrazoPagPERIODOPRAZO: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Visible = False
      Size = 1
    end
    object qryPrazoPagIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
      Visible = False
    end
    object qryPrazoPagIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
      Visible = False
    end
    object qryPrazoPagCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
      Visible = False
    end
    object qryPrazoPagPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
      Visible = False
    end
    object qryPrazoPagIDPRAZOPGTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
      Visible = False
    end
  end
  object qryAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      VC.IDPROCXART,'
      '      VC.IDFORCLI,'
      '      VC.CODPROCESSO,'
      '      VC.PROPOSTA,'
      '      TA.CODTIPOCUSTAGREG,'
      '      VC.PERCENT,'
      '      VC.VALOR,'
      '      TA.DESCCUSTAGREG,'
      '      TA.FLGBASE,'
      '      TA.PERCVALOR,'
      '      TA.CODTRATFISCE,                  '
      '      VC.BASECALCULO AS BASE,'
      '     (0) AS ACUMBASE'
      'FROM'
      '     VALORAGREGCOT VC,'
      '     TIPOAGRE TA'
      'WHERE'
      '     (VC.CODPROCESSO(+) = :pCODPROCESSO)'
      ' AND (VC.IDFORCLI(+)    = :pIDFORCLI)'
      ' AND (VC.IDPROCXART(+)  = :pIDPROCXART)'
      ' AND (VC.PROPOSTA(+)    = :pPROPOSTA)'
      ' AND (TA.FLGINCIDECOMPRA = '#39'S'#39')'
      ' AND (VC.CODTIPOCUSTAGREG(+) = TA.CODTIPOCUSTAGREG)'
      'ORDER BY TA.FLGBASE DESC, TA.DESCCUSTAGREG')
    UpdateObject = updAgreg
    ValidateWithMask = True
    Left = 484
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryAgregDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 21
      FieldName = 'DESCCUSTAGREG'
      Origin = 'TIPOAGRE.DESCCUSTAGREG'
      Size = 60
    end
    object qryAgregBASE: TFloatField
      DisplayLabel = 'Base'
      DisplayWidth = 10
      FieldName = 'BASE'
    end
    object qryAgregPERCENT: TFloatField
      DisplayLabel = 'Aliquota'
      DisplayWidth = 10
      FieldName = 'PERCENT'
      Origin = 'VALORAGREGCOT.PERCENT'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      Origin = 'VALORAGREGCOT.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryAgregIDPROCXART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCXART'
      Origin = 'VALORAGREGCOT.IDPROCXART'
      Visible = False
    end
    object qryAgregIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'VALORAGREGCOT.IDFORCLI'
      Visible = False
    end
    object qryAgregCODPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROCESSO'
      Origin = 'VALORAGREGCOT.CODPROCESSO'
      Visible = False
    end
    object qryAgregPROPOSTA: TFloatField
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'VALORAGREGCOT.PROPOSTA'
      Visible = False
    end
    object qryAgregCODTIPOCUSTAGREG: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'VALORAGREGCOT.CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryAgregFLGBASE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGBASE'
      Origin = 'TIPOAGRE.FLGBASE'
      Visible = False
      Size = 1
    end
    object qryAgregPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Visible = False
      Size = 1
    end
    object qryAgregACUMBASE: TFloatField
      FieldName = 'ACUMBASE'
      Visible = False
    end
    object qryAgregCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Visible = False
      Size = 1
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOENTREGA'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  IDPRAZOENT = :IDPRAZOENT,'
      '  QTDEENT = :QTDEENT,'
      '  CODMEDIDA = :CODMEDIDA,'
      '  PRAZOENT = :PRAZOENT,'
      '  PERIODOPRAZO = :PERIODOPRAZO,'
      '  DATAENT = :DATAENT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOENT = :OLD_IDPRAZOENT')
    InsertSQL.Strings = (
      'insert into PRAZOENTREGA'
      '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, IDPRAZOENT, '
      'QTDEENT, CODMEDIDA, '
      '   PRAZOENT, PERIODOPRAZO, DATAENT)'
      'values'
      
        '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :IDPRAZOENT,' +
        ' '
      ':QTDEENT, '
      '   :CODMEDIDA, :PRAZOENT, :PERIODOPRAZO, :DATAENT)')
    DeleteSQL.Strings = (
      'delete from PRAZOENTREGA'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOENT = :OLD_IDPRAZOENT')
    Left = 358
    Top = 65535
  end
  object updPrazoPag: TUpdateSQL
    ModifySQL.Strings = (
      'update PRAZOPGTO'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  IDPRAZOPGTO = :IDPRAZOPGTO,'
      '  PRAZOPGTO = :PRAZOPGTO,'
      '  PERIODOPRAZO = :PERIODOPRAZO,'
      '  DATAPGTO = :DATAPGTO,'
      '  PERCENT = :PERCENT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOPGTO = :OLD_IDPRAZOPGTO')
    InsertSQL.Strings = (
      'insert into PRAZOPGTO'
      '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, IDPRAZOPGTO, '
      'PRAZOPGTO, '
      '   PERIODOPRAZO, DATAPGTO, PERCENT)'
      'values'
      
        '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :IDPRAZOPGTO' +
        ', '
      ':PRAZOPGTO, '
      '   :PERIODOPRAZO, :DATAPGTO, :PERCENT)')
    DeleteSQL.Strings = (
      'delete from PRAZOPGTO'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  IDPRAZOPGTO = :OLD_IDPRAZOPGTO')
    Left = 422
    Top = 65534
  end
  object updAgreg: TUpdateSQL
    ModifySQL.Strings = (
      'update VALORAGREGCOT'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  PERCENT = :PERCENT,'
      '  VALOR = :VALOR'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    InsertSQL.Strings = (
      'insert into VALORAGREGCOT'
      
        '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, CODTIPOCUSTAGREG' +
        ', '
      'PERCENT, '
      '   VALOR)'
      'values'
      '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, '
      ':CODTIPOCUSTAGREG, '
      '   :PERCENT, :VALOR)')
    DeleteSQL.Strings = (
      'delete from VALORAGREGCOT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    Left = 485
    Top = 65535
  end
  object qryForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     (TO_CHAR(C.IDFORCLI) || TO_CHAR(C.PROPOSTA)) AS CHAVE,'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     P.RAZAOSOCIAL,'
      '     ES.CODESTADO,'
      '     ES.IDPAIS'
      'FROM'
      '    PESSOA P,'
      '    ENDPESS E,'
      '    CIDADES CI,'
      '    ESTADO  ES,'
      '    COTACOES C'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (E.IDPESSOA(+)  = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+)= P.IDENDCOMERCIAL)'
      '  AND (E.IDCIDADES    = CI.IDCIDADES(+))'
      '  AND (ES.IDESTADO(+) = CI.IDESTADO)'
      ''
      'GROUP BY  C.IDFORCLI,'
      '          C.PROPOSTA,'
      '          P.RAZAOSOCIAL,'
      '          ES.CODESTADO,'
      '          ES.IDPAIS')
    ValidateWithMask = True
    Left = 8
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryFornRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 40
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFornPROPOSTA: TFloatField
      DisplayLabel = 'Nº da Proposta'
      DisplayWidth = 10
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryFornIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
      Visible = False
    end
    object qryFornCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 80
    end
    object qryFornCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFornIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      U.CODMEDIDA,'
      '      U.DESCMEDIDA'
      'FROM'
      '      UNMEDIDA U,'
      '      CONVER   C'
      'WHERE'
      '      (C.CODPRODUTO = :CODPRODUTO  )'
      '  AND (U.CODMEDIDA  = C.CODMEDIDA)'
      'ORDER BY U.CODMEDIDA')
    ValidateWithMask = True
    Left = 308
    Top = 407
    ParamData = <
      item
        DataType = ftString
        Name = 'CODPRODUTO'
        ParamType = ptUnknown
      end>
    object qryUnidMedCODMEDIDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CODMEDIDA'
      Origin = 'UNMEDIDA.CODMEDIDA'
      Size = 4
    end
    object qryUnidMedDESCMEDIDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'DESCMEDIDA'
      Origin = 'UNMEDIDA.DESCMEDIDA'
      Size = 25
    end
  end
  object qryUltComp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.RAZAOSOCIAL, '
      '   NF.DATAENTDEVOL,'
      '   I.QTDERECEBDEVOL,'
      '   (I.VLRESTOQUE/I.QTDERECEBDEVOL) AS VALUNEST,'
      '   I.VLRUNITARIO,'
      '   I.CODMEDIDA'
      'FROM '
      '   PESSOA P,'
      '   ITENSRECEBDEVOL I,'
      '   NFRECEBDEVOL NF'
      'WHERE '
      '      (I.CODARTIGO = :CODARTIGO)'
      '  AND (NF.FLGTIPONOTA = '#39'R'#39')'
      '  AND (NF.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL)'
      '  AND (NF.IDFORCLI = P.IDPESSOA) '
      'ORDER BY NF.DATAENTDEVOL DESC'
      '')
    ValidateWithMask = True
    Left = 64
    Top = 407
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end>
    object qryUltCompVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
      Origin = 'ITENSRECEBDEVOL.VLRUNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompVALUNEST: TFloatField
      DisplayLabel = 'Valor Estoque'
      DisplayWidth = 10
      FieldName = 'VALUNEST'
      Origin = 'ITENSRECEBDEVOL.VLRESTOQUE'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Origin = 'ITENSRECEBDEVOL.CODMEDIDA'
      Size = 4
    end
    object qryUltCompQTDERECEBDEVOL: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDERECEBDEVOL'
      Origin = 'ITENSRECEBDEVOL.QTDERECEBDEVOL'
      DisplayFormat = '#,####0.0000'
    end
    object qryUltCompDATAENTDEVOL: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAENTDEVOL'
      Origin = 'NFRECEBDEVOL.DATAENTDEVOL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryUltCompRAZAOSOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object dsUltComp: TwwDataSource
    DataSet = qryUltComp
    Left = 128
    Top = 407
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      MOECODIGO,'
      '      MOEDESC,'
      '      MOESIGLA'
      'FROM'
      '    MOEDA'
      'WHERE'
      '     (MOEINATIVO = '#39'A'#39')'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 184
    Top = 407
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
    end
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
  end
  object qryTipoAgre: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODTIPOCUSTAGREG, '
      '      DESCCUSTAGREG,'
      '      FLGBASE'
      'FROM'
      '      TIPOAGRE'
      'WHERE'
      '     (FLGINCIDECOMPRA = '#39'S'#39')      '
      'ORDER BY FLGBASE DESC,'
      '         DESCCUSTAGREG')
    ValidateWithMask = True
    Left = 246
    Top = 407
    object qryTipoAgreDESCCUSTAGREG: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCCUSTAGREG'
      Origin = 'TIPOAGRE.DESCCUSTAGREG'
      Size = 60
    end
    object qryTipoAgreCODTIPOCUSTAGREG: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'TIPOAGRE.CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryTipoAgreFLGBASE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGBASE'
      Origin = 'TIPOAGRE.FLGBASE'
      Visible = False
      Size = 1
    end
  end
  object qryProc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODPROCESSO,'
      '      STATUS'
      'FROM'
      '      PROCESSO'
      'WHERE'
      '      (CODPROCESSO = :pCODPROCESSO)'
      '')
    UpdateObject = updProc
    ValidateWithMask = True
    Left = 633
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryProcCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
    object qryProcSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'PROCESSO.STATUS'
      Size = 1
    end
  end
  object updProc: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSO'
      'set'
      '  STATUS = :STATUS'
      'where'
      '  CODPROCESSO = :OLD_CODPROCESSO')
    Left = 633
  end
  object UpdAtuAgreg: TUpdateSQL
    ModifySQL.Strings = (
      'update VALORAGREGCOT'
      'set'
      '  IDPROCXART = :IDPROCXART,'
      '  IDFORCLI = :IDFORCLI,'
      '  CODPROCESSO = :CODPROCESSO,'
      '  PROPOSTA = :PROPOSTA,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  PERCENT = :PERCENT,'
      '  VALOR = :VALOR,'
      '  BASECALCULO = :BASECALCULO'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    InsertSQL.Strings = (
      'insert into VALORAGREGCOT'
      
        '  (IDPROCXART, IDFORCLI, CODPROCESSO, PROPOSTA, CODTIPOCUSTAGREG' +
        ', PERCENT, '
      '   VALOR, BASECALCULO)'
      'values'
      
        '  (:IDPROCXART, :IDFORCLI, :CODPROCESSO, :PROPOSTA, :CODTIPOCUST' +
        'AGREG, '
      '   :PERCENT, :VALOR, :BASECALCULO)')
    DeleteSQL.Strings = (
      'delete from VALORAGREGCOT'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART and'
      '  IDFORCLI = :OLD_IDFORCLI and'
      '  CODPROCESSO = :OLD_CODPROCESSO and'
      '  PROPOSTA = :OLD_PROPOSTA and'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    Left = 557
    Top = 65535
  end
  object qryAtuAgreg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      VC.IDPROCXART,'
      '      VC.IDFORCLI,'
      '      VC.CODPROCESSO,'
      '      VC.PROPOSTA,'
      '      VC.CODTIPOCUSTAGREG,'
      '      VC.PERCENT,'
      '      VC.VALOR,'
      '      VC.BASECALCULO'
      'FROM'
      '     VALORAGREGCOT VC'
      'WHERE'
      '     (VC.CODPROCESSO = :pCODPROCESSO)'
      ' AND (VC.IDFORCLI    = :pIDFORCLI)'
      ' AND (VC.IDPROCXART  = :pIDPROCXART)'
      ' AND (VC.PROPOSTA    = :pPROPOSTA)'
      '')
    UpdateObject = UpdAtuAgreg
    ValidateWithMask = True
    Left = 556
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryAtuAgregIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = '"CM.VALORAGREGCOT".IDPROCXART'
    end
    object qryAtuAgregIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = '"CM.VALORAGREGCOT".IDFORCLI'
    end
    object qryAtuAgregCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = '"CM.VALORAGREGCOT".CODPROCESSO'
    end
    object qryAtuAgregPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = '"CM.VALORAGREGCOT".PROPOSTA'
    end
    object qryAtuAgregCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = '"CM.VALORAGREGCOT".CODTIPOCUSTAGREG'
    end
    object qryAtuAgregPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = '"CM.VALORAGREGCOT".PERCENT'
    end
    object qryAtuAgregVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = '"CM.VALORAGREGCOT".VALOR'
    end
    object qryAtuAgregBASECALCULO: TFloatField
      FieldName = 'BASECALCULO'
      Origin = 'VALORAGREGCOT.BASECALCULO'
    end
  end
  object qryRepeteEnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       PE.IDPROCXART,'
      '       PE.IDFORCLI,'
      '       PE.CODPROCESSO,'
      '       PE.PROPOSTA,'
      '       PE.IDPRAZOENT,'
      '       (PE.QTDEENT/C.QTDEFORNECIDA) AS PERCPRAZO,'
      '       PE.PRAZOENT,'
      '       PE.PERIODOPRAZO,'
      '       PE.DATAENT'
      'FROM'
      '       PRAZOENTREGA PE, COTACOES C'
      'WHERE'
      '     (PE.CODPROCESSO = :pCODPROCESSO)'
      ' AND (PE.IDFORCLI    = :pIDFORCLI)'
      ' AND (PE.PROPOSTA    = :pPROPOSTA)'
      ' AND (C.QTDEFORNECIDA IS NOT NULL)'
      ' AND (C.QTDEFORNECIDA <> 0)'
      ' AND (PE.QTDEENT IS NOT NULL)'
      ' AND (PE.QTDEENT <> 0)'
      ' AND (PE.CODPROCESSO = C.CODPROCESSO)'
      ' AND (PE.IDFORCLI    = C.IDFORCLI)'
      ' AND (PE.PROPOSTA    = C.PROPOSTA)'
      ' AND (PE.IDPROCXART  = C.IDPROCXART)'
      'ORDER BY PE.IDPROCXART')
    ValidateWithMask = True
    Left = 122
    Top = 145
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryRepeteEntIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOENTREGA.IDPROCXART'
    end
    object qryRepeteEntIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOENTREGA.IDFORCLI'
    end
    object qryRepeteEntCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOENTREGA.CODPROCESSO'
    end
    object qryRepeteEntPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOENTREGA.PROPOSTA'
    end
    object qryRepeteEntIDPRAZOENT: TFloatField
      FieldName = 'IDPRAZOENT'
      Origin = 'PRAZOENTREGA.IDPRAZOENT'
    end
    object qryRepeteEntPERCPRAZO: TFloatField
      FieldName = 'PERCPRAZO'
      Origin = 'PRAZOENTREGA.QTDEENT'
    end
    object qryRepeteEntPRAZOENT: TFloatField
      FieldName = 'PRAZOENT'
      Origin = 'PRAZOENTREGA.PRAZOENT'
    end
    object qryRepeteEntPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOENTREGA.PERIODOPRAZO'
      Size = 1
    end
    object qryRepeteEntDATAENT: TDateTimeField
      FieldName = 'DATAENT'
      Origin = 'PRAZOENTREGA.DATAENT'
    end
  end
  object qryRepetePg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDPROCXART,'
      '     IDFORCLI,'
      '     CODPROCESSO,'
      '     PROPOSTA,'
      '     IDPRAZOPGTO,'
      '     PRAZOPGTO,'
      '     PERIODOPRAZO,'
      '     DATAPGTO,'
      '     PERCENT'
      'FROM'
      '     PRAZOPGTO'
      'WHERE'
      '     (CODPROCESSO = :pCODPROCESSO)'
      ' AND (IDFORCLI    = :pIDFORCLI)'
      ' AND (PROPOSTA    = :pPROPOSTA)'
      'ORDER BY IDPROCXART')
    ValidateWithMask = True
    Left = 196
    Top = 146
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end>
    object qryRepetePgIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Origin = 'PRAZOPGTO.IDPROCXART'
    end
    object qryRepetePgIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'PRAZOPGTO.IDFORCLI'
    end
    object qryRepetePgCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PRAZOPGTO.CODPROCESSO'
    end
    object qryRepetePgPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'PRAZOPGTO.PROPOSTA'
    end
    object qryRepetePgIDPRAZOPGTO: TFloatField
      FieldName = 'IDPRAZOPGTO'
      Origin = 'PRAZOPGTO.IDPRAZOPGTO'
    end
    object qryRepetePgPRAZOPGTO: TFloatField
      FieldName = 'PRAZOPGTO'
      Origin = 'PRAZOPGTO.PRAZOPGTO'
    end
    object qryRepetePgPERIODOPRAZO: TStringField
      FieldName = 'PERIODOPRAZO'
      Origin = 'PRAZOPGTO.PERIODOPRAZO'
      Size = 1
    end
    object qryRepetePgDATAPGTO: TDateTimeField
      FieldName = 'DATAPGTO'
      Origin = 'PRAZOPGTO.DATAPGTO'
    end
    object qryRepetePgPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'PRAZOPGTO.PERCENT'
    end
  end
  object qryProcxArt: TwwQuery
    AfterScroll = qryProcxArtAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.CODMEDIDA,'
      '     C.NUMCOT,'
      '     C.DATACOT,'
      '     C.STATUS,'
      '     C.OBS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES,'
      '     PXA.CODARTIGO,'
      '     PXA.QTDEPEDIDA,'
      '     PXA.CODMEDIDA AS UNIDPED,'
      
        '     SUBSTR(DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVA' +
        'RI),1,60) AS DESCRICAO,'
      '     P.RAZAOSOCIAL,'
      '     PR.CODPRODUTO,'
      '     PR.CODMEDCUSTO,'
      '     SA.SALDOQTDE'
      'FROM'
      '    PESSOA P,'
      '    SALDO SA,'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '    PRODUTO PR,'
      '    ARTIGO A,'
      '    PRODVARI PV'
      'WHERE'
      '      (C.CODPROCESSO  = :pCODPROCESSO)'
      '  AND (C.IDFORCLI     = :pIDFORCLI)'
      '  AND (C.PROPOSTA     = :pPROPOSTA)'
      '  AND (SA.CODALMOXARIFADO(+) = :CODALMOXARIFADO)'
      '  AND (C.IDPROCXART   = PXA.IDPROCXART)'
      '  AND (C.CODPROCESSO  = PXA.CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (PXA.CODARTIGO  = A.CODARTIGO)'
      '  AND (PXA.CODARTIGO  = SA.CODARTIGO(+))'
      '  AND (A.CODPRODUTO   = PR.CODPRODUTO)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      'ORDER BY DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 248
    Top = 64
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryProcxArtDESCRICAO: TStringField
      DisplayLabel = 'Itens'
      DisplayWidth = 45
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryProcxArtQTDEPEDIDA: TFloatField
      DisplayLabel = 'Qtde Pedida'
      DisplayWidth = 10
      FieldName = 'QTDEPEDIDA'
    end
    object qryProcxArtSALDOQTDE: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 10
      FieldName = 'SALDOQTDE'
      DisplayFormat = '#,##0.00'
    end
    object qryProcxArtCODMEDCUSTO: TStringField
      DisplayLabel = 'Unid.'
      DisplayWidth = 4
      FieldName = 'CODMEDCUSTO'
      FixedChar = True
      Size = 4
    end
    object qryProcxArtUNIDPED: TStringField
      DisplayWidth = 4
      FieldName = 'UNIDPED'
      Visible = False
      Size = 4
    end
    object qryProcxArtIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryProcxArtIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
      Visible = False
    end
    object qryProcxArtCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Visible = False
    end
    object qryProcxArtPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Visible = False
    end
    object qryProcxArtQTDEFORNECIDA: TFloatField
      FieldName = 'QTDEFORNECIDA'
      Visible = False
    end
    object qryProcxArtPRECO: TFloatField
      FieldName = 'PRECO'
      Visible = False
    end
    object qryProcxArtCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Visible = False
      Size = 4
    end
    object qryProcxArtNUMCOT: TFloatField
      FieldName = 'NUMCOT'
      Visible = False
    end
    object qryProcxArtDATACOT: TDateTimeField
      FieldName = 'DATACOT'
      Visible = False
    end
    object qryProcxArtSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
    object qryProcxArtOBS: TStringField
      FieldName = 'OBS'
      Visible = False
      Size = 200
    end
    object qryProcxArtMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryProcxArtTXJUROS: TFloatField
      FieldName = 'TXJUROS'
      Visible = False
    end
    object qryProcxArtPRECOAVALORPRES: TFloatField
      FieldName = 'PRECOAVALORPRES'
      Visible = False
    end
    object qryProcxArtCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Visible = False
      Size = 14
    end
    object qryProcxArtRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Visible = False
      Size = 60
    end
    object qryProcxArtCODPRODUTO: TStringField
      FieldName = 'CODPRODUTO'
      Visible = False
      Size = 6
    end
  end
  object dsProcxArt: TwwDataSource
    DataSet = qryProcxArt
    Left = 261
    Top = 121
  end
  object qrySCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '(SELECT P.DESCRCOMPL AS OBSITEMSOLIC'
      ' FROM PRODUTO P,'
      '      ARTIGO A'
      ' WHERE (A.CODARTIGO = :pCODARTIGO)'
      '   AND (P.CODPRODUTO = A.CODPRODUTO)'
      '   AND (P.DESCRCOMPL IS NOT NULL))'
      'UNION ALL'
      '(SELECT'
      '    OBSITEMSOLIC'
      ' FROM'
      '    ITEMSOLI'
      ' WHERE'
      '       (CODPROCESSO = :pCODPROCESSO)'
      '   AND (IDPROCXART  = :pIDPROCXART)'
      '   AND (OBSITEMSOLIC IS NOT NULL))'
      '')
    ValidateWithMask = True
    Left = 400
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPROCXART'
        ParamType = ptUnknown
      end>
    object qrySCIOBSITEMSOLIC: TMemoField
      FieldName = 'OBSITEMSOLIC'
      BlobType = ftMemo
      Size = 500
    end
  end
  object dsSCI: TwwDataSource
    DataSet = qrySCI
    Left = 397
    Top = 129
  end
  object qryDadosForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT (E.LOGRADOURO ||'#39' '#39'|| E.NUMERO ||'#39' '#39'|| E.COMPLEMENTO ||'#39' ' +
        #39'|| E.BAIRRO) AS ENDERECO,'
      '       E.CEP, ES.CODESTADO,P.EMAIL AS EMAILEMP,'
      '       DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,'
      '       PA.NOMEPAIS, TC.TELEFONE,TC.DDI,TC.DDD,TC.RAMAL,'
      '       TC.CONTATO, TC.CARGO, TC.SETOR, TC.EMAILCON'
      'FROM PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES,'
      '     PAIS    PA,'
      '     (SELECT E.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD,'
      '             C.RAMAL, C.CONTATO, C.CARGO, C.SETOR, C.EMAILCON'
      '      FROM PESSOA P,'
      '           ENDPESS E,'
      '           TELENDPESS  TP,'
      
        '           (SELECT TC.IDTELEFONE,TC.RAMAL, CP.NOME AS CONTATO, C' +
        'P.CARGO, '
      '                   CP.SETOR, CP.EMAIL AS EMAILCON'
      '            FROM PESSOA P,'
      '                 ENDPESS E,'
      '                 CONTATOPESS CP,'
      '                 TELCONTATO  TC'
      '            WHERE (P.IDPESSOA    = :IDFORCLI) AND'
      '                  (E.IDENDERECO  = P.IDENDCOMERCIAL) AND'
      '                  (E.IDPESSOA    = P.IDPESSOA) AND'
      '                  (E.IDENDERECO  = CP.IDENDERECO) AND'
      '                  (TC.IDCONTATO  = CP.IDCONTATO)) C'
      '      WHERE (P.IDPESSOA    = :IDFORCLI) AND'
      '            (E.IDENDERECO  = P.IDENDCOMERCIAL) AND'
      '            (E.IDPESSOA    = P.IDPESSOA) AND'
      '            ((TP.TIPO LIKE '#39'%C%'#39') OR (TP.TIPO LIKE '#39'%F%'#39')) AND'
      '            (E.IDENDERECO     = TP.IDENDERECO) AND'
      '            (C.IDTELEFONE(+)  = TP.IDTELEFONE)) TC'
      'WHERE (P.IDPESSOA    = :IDFORCLI) AND'
      '      (E.IDPESSOA    = P.IDPESSOA) AND'
      '      (E.IDENDERECO  = P.IDENDCOMERCIAL) AND'
      '      (E.IDCIDADES   = C.IDCIDADES) AND'
      '      (ES.IDESTADO   = C.IDESTADO) AND'
      '      (ES.IDPAIS      = PA.IDPAIS) AND'
      '      (TC.IDENDERECO(+) = E.IDENDERECO)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 504
    Top = 80
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryDadosFornDDI: TStringField
      DisplayWidth = 4
      FieldName = 'DDI'
      Size = 4
    end
    object qryDadosFornDDD: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      Size = 5
    end
    object qryDadosFornTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      DisplayWidth = 10
      FieldName = 'TELEFONE'
    end
    object qryDadosFornCONTATO: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 30
      FieldName = 'CONTATO'
      Size = 50
    end
    object qryDadosFornRAMAL: TStringField
      DisplayLabel = 'Ramal'
      DisplayWidth = 5
      FieldName = 'RAMAL'
    end
    object qryDadosFornCARGO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 15
      FieldName = 'CARGO'
      Size = 30
    end
    object qryDadosFornSETOR: TStringField
      DisplayLabel = 'Setor'
      DisplayWidth = 15
      FieldName = 'SETOR'
      Size = 30
    end
    object qryDadosFornEMAILCON: TStringField
      DisplayLabel = 'E-Mail do Contato'
      DisplayWidth = 40
      FieldName = 'EMAILCON'
      Size = 40
    end
    object qryDadosFornENDERECO: TStringField
      FieldName = 'ENDERECO'
      Visible = False
      Size = 111
    end
    object qryDadosFornCEP: TStringField
      FieldName = 'CEP'
      Visible = False
      Size = 8
    end
    object qryDadosFornCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Visible = False
      Size = 3
    end
    object qryDadosFornEMAILEMP: TStringField
      FieldName = 'EMAILEMP'
      Visible = False
      Size = 100
    end
    object qryDadosFornCIDADE: TStringField
      FieldName = 'CIDADE'
      Visible = False
      Size = 50
    end
    object qryDadosFornNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Visible = False
      Size = 30
    end
  end
  object dsDadosForn: TwwDataSource
    DataSet = qryDadosForn
    Left = 621
    Top = 105
  end
  object qryUltCompForn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.DESCPROD,'
      '   NF.DATAENTDEVOL,'
      '   I.QTDERECEBDEVOL,'
      '   (I.VLRESTOQUE/I.QTDERECEBDEVOL) AS VALUNEST,'
      '   I.VLRUNITARIO,'
      '   I.CODMEDIDA,'
      '   DECODE(I.CODARTIGO,:CODARTIGO,0,1) AS ORDEM'
      'FROM'
      '   PRODUTO P,'
      '   ARTIGO A,'
      '   ITENSRECEBDEVOL I,'
      '   NFRECEBDEVOL NF'
      'WHERE'
      '      (NF.IDFORCLI = :IDFORCLI)'
      '  AND (NF.FLGTIPONOTA = '#39'R'#39')'
      '  AND (NF.IDNFRECEBDEVOL = I.IDNFRECEBDEVOL)'
      '  AND (A.CODARTIGO = I.CODARTIGO)'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY ORDEM, NF.DATAENTDEVOL DESC, P.DESCPROD'
      ''
      ' ')
    ValidateWithMask = True
    Left = 72
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'CODARTIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
    object qryUltCompFornDESCPROD: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 30
      FieldName = 'DESCPROD'
      Size = 40
    end
    object qryUltCompFornVLRUNITARIO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VLRUNITARIO'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompFornVALUNEST: TFloatField
      DisplayLabel = 'Valor Estoque'
      DisplayWidth = 10
      FieldName = 'VALUNEST'
      DisplayFormat = '#,##0.00'
    end
    object qryUltCompFornCODMEDIDA: TStringField
      DisplayLabel = 'Unidade'
      DisplayWidth = 4
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryUltCompFornQTDERECEBDEVOL: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDERECEBDEVOL'
      DisplayFormat = '#,####0.0000'
    end
    object qryUltCompFornDATAENTDEVOL: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAENTDEVOL'
    end
    object qryUltCompFornORDEM: TFloatField
      FieldName = 'ORDEM'
      Visible = False
    end
  end
  object dsUltCompForn: TwwDataSource
    DataSet = qryUltCompForn
    Left = 160
    Top = 319
  end
end
