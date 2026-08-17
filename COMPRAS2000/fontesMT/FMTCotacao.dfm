inherited FrmMTCotacao: TFrmMTCotacao
  Left = 22
  Top = 62
  HelpContext = 1130011
  Caption = 'Cotação de Preços'
  ClientWidth = 768
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Left = 273
    Width = 495
    inherited pnlMestre: TPanel
      Width = 493
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Fornecedor'
      end
      object dblcForn: TCMDBLookupCombo
        Tag = 99
        Left = 8
        Top = 24
        Width = 449
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
        LookupTable = cdsFornecedor
        LookupField = 'CHAVE'
        Options = [loTitles]
        Style = csDropDownList
        Color = 14286847
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcFornCloseUp
        OnEnter = dblcFornEnter
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Tag = 99
      Top = 61
      Width = 493
      Height = 298
      Tabs.Strings = (
        'Preços'
        'Pz. de Entrega'
        'Pz. de Pagamento'
        'Agregados'
        'Obs.'
        'Dados Forn.')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'grdPrazoPgto'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Tag = 99
        Width = 395
        Height = 239
        ActivePage = TabPrecos
        object TabPrecos: TTabSheet [0]
          Caption = 'Preços'
          ImageIndex = 1
          object Label7: TLabel
            Left = 8
            Top = 72
            Width = 34
            Height = 13
            Caption = 'Preço'
          end
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
          object Label29: TLabel
            Left = 8
            Top = 192
            Width = 45
            Height = 13
            Caption = 'Contato'
          end
          object Label13: TLabel
            Left = 144
            Top = 112
            Width = 69
            Height = 13
            Caption = 'Observação'
          end
          object Label12: TLabel
            Left = 144
            Top = 72
            Width = 39
            Height = 13
            Caption = 'Moeda'
          end
          object Label11: TLabel
            Left = 337
            Top = 72
            Width = 109
            Height = 13
            Caption = 'Taxa de Juros a.m.'
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
            Left = 233
            Top = 3
            Width = 213
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
              Left = 124
              Top = 16
              Width = 48
              Height = 13
              Caption = 'Unidade'
            end
            object edQtdeForn: TDBRealEdit
              Left = 8
              Top = 32
              Width = 106
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
              Left = 124
              Top = 32
              Width = 70
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              DataField = 'CODMEDIDA'
              DataSource = ds
              LookupTable = cdsUnMedida
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
              '      0,00')
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
          object edRef: TDBRealEdit
            Left = 8
            Top = 128
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
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
            TabOrder = 4
          end
          object edContato: TDBEdit
            Left = 8
            Top = 208
            Width = 425
            Height = 21
            DataField = 'CONTATO'
            DataSource = ds
            TabOrder = 5
          end
          object memOBS: TDBMemo
            Left = 144
            Top = 128
            Width = 265
            Height = 65
            DataField = 'OBS'
            DataSource = ds
            MaxLength = 200
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object dblcMoeda: TCMDBLookupCombo
            Left = 144
            Top = 88
            Width = 185
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição'
              'MOESIGLA'#9'10'#9'Sigla')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = cdsMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edTxJuros: TDBEdit
            Left = 338
            Top = 88
            Width = 84
            Height = 21
            DataField = 'TXJUROS'
            DataSource = ds
            TabOrder = 8
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Prazo de Entrega'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 387
            Height = 211
            Selected.Strings = (
              'DATAENT'#9'10'#9'Data de Entrega'#9'F'
              'QTDEENT'#9'10'#9'Quantidade'#9'F'
              'CODMEDIDA'#9'4'#9'Unidade'#9'F'
              'PRAZOENT'#9'10'#9'Prazo em dias'#9'F')
            DataSource = dsPrazoEntrega
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 387
            Height = 211
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
              DataSource = dsPrazoEntrega
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
            object edPrazoEnt: TDBRealEdit
              Left = 256
              Top = 32
              Width = 81
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              OnExit = edPrazoEntExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRAZOENT'
              DataSource = dsPrazoEntrega
            end
            object edUnEnt: TDBEdit
              Left = 160
              Top = 32
              Width = 81
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'CODMEDIDA'
              DataSource = dsPrazoEntrega
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edQtdeEnt: TDBEdit
              Left = 8
              Top = 32
              Width = 129
              Height = 21
              DataField = 'QTDEENT'
              DataSource = dsPrazoEntrega
              TabOrder = 0
            end
          end
        end
        object TabPrazoPgto: TTabSheet
          Caption = 'Prazo Pagto'
          ImageIndex = 2
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 387
            Height = 211
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label22: TLabel
              Left = 8
              Top = 16
              Width = 96
              Height = 13
              Caption = 'Percentagem (%)'
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
            object Label19: TLabel
              Left = 248
              Top = 16
              Width = 113
              Height = 13
              Caption = 'Data de Pagamento'
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
              DataSource = dsPrazoPgto
            end
            object edPrazoPag: TDBRealEdit
              Left = 136
              Top = 32
              Width = 65
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              OnExit = edPrazoPagExit
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRAZOPGTO'
              DataSource = dsPrazoPgto
            end
            object edDataPag: TCMDateTimePicker
              Left = 248
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
              DataSource = dsPrazoPgto
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
          object grdPrazoPgto: TwwDBGrid
            Left = 0
            Top = 0
            Width = 387
            Height = 211
            Selected.Strings = (
              'DATAPGTO'#9'10'#9'Data de Pagamento'#9'F'
              'PRAZOPGTO'#9'10'#9'Prazo em dias'#9'F'
              'PERCENT'#9'10'#9'Precentual'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsPrazoPgto
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
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
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
        end
        object TabAgregados: TTabSheet
          Tag = 99
          Caption = 'TabAgregados'
          ImageIndex = 4
          inline FrameAgregadosCot: TFrameAgregados
            Width = 387
            Height = 211
            Align = alClient
            inherited pnlTitulo: TPanel
              Width = 387
              OnExit = bbtnCancelarClick
            end
            inherited grdAgreg: TwwDBGrid
              Width = 387
              Height = 130
            end
            inherited plnEdAgreg: TPanel
              Top = 153
              Width = 387
              inherited edAliquota: TDBRealEdit
                Lines.Strings = ()
              end
              inherited edBaseCalc: TDBRealEdit
                Lines.Strings = ()
              end
              inherited edValorAgreg: TDBRealEdit
                Lines.Strings = ()
              end
            end
          end
        end
        object TabObs: TTabSheet
          Caption = 'Observações'
          ImageIndex = 3
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 363
            Height = 201
            Align = alClient
            ColCount = 1
            DataSource = dsObs
            Enabled = False
            PanelHeight = 67
            PanelWidth = 346
            TabOrder = 0
            RowCount = 3
            object dbObsSCI: TDBMemo
              Left = 0
              Top = 0
              Width = 346
              Height = 67
              Align = alClient
              DataField = 'OBSITEMSOLIC'
              DataSource = dsObs
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object TabForn: TTabSheet
          Caption = 'TabForn'
          ImageIndex = 5
          object pcDadosForn: TPageControl
            Left = 0
            Top = 0
            Width = 387
            Height = 211
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
                Top = 92
                Width = 354
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
                Width = 354
                Height = 175
                Selected.Strings = (
                  'DESCPROD'#9'30'#9'Item'#9'F'
                  'VLRUNITARIO'#9'10'#9'Valor Unitário'#9'F'
                  'VALUNEST'#9'10'#9'Valor Estoque'#9'F'
                  'CODMEDIDA'#9'4'#9'Unidade'#9'F'
                  'QTDERECEBDEVOL'#9'10'#9'Quantidade'#9'F'
                  'DATAENTDEVOL'#9'10'#9'Data'#9'F')
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
                UseTFields = False
                IndicatorColor = icBlack
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 485
      end
      inherited Dock974: TDock97
        Left = 399
        Height = 239
      end
    end
  end
  inherited Dock972: TDock97
    Width = 768
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
      object btnCopiaPrazo: TToolbarButton97
        Left = 246
        Top = 0
        Width = 91
        Height = 41
        AllowAllUp = True
        GroupIndex = -1
        Caption = 'C&opiar Prazos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          77777777777FFFFFFFFF7777770000000007777777888888888F777777877777
          77077777778F7777778F7777778FFFFFF7077777778F7777778F7777778FCCCC
          F70777FFFF8F7777778F7000008FFFFFF7077888888F7777778F7877778FCCCC
          F70778F7778F7777778F78FFFF8FFFFFF70778F7778F7777FF8F78FCCC8FCCF0
          000778F7778F7778888778FFFF8FFFF7F87778F7778F7778F87778FCCC8FFFF7
          877778F7778FFFF8877778FFFF888888777778F777888888777778FCCCCF7077
          777778F7777778F7777778FFFFFF7077777778F7777778F7777778FFFFFF7077
          777778FFFFFFF8F7777778888888887777777888888888777777}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = btnCopiaPrazoClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
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
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 596
      DockPos = 677
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Tag = 99
        HelpContext = 1130011
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 427
      DockPos = 508
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
    Width = 273
    Height = 360
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'plnArt'
    TabOrder = 3
    object Splitter1: TSplitter
      Left = 0
      Top = 201
      Width = 273
      Height = 7
      Cursor = crVSplit
      Align = alTop
    end
    object GrdUltComp: TwwDBGrid
      Tag = 99
      Left = 0
      Top = 233
      Width = 273
      Height = 127
      Selected.Strings = (
        'VLRUNITARIO'#9'10'#9'Valor Unitário'#9'F'
        'VALUNEST'#9'10'#9'Valor Estoque'#9'F'
        'CODMEDIDA'#9'4'#9'Unidade'#9'F'
        'QTDERECEBDEVOL'#9'10'#9'Quantidade'#9'F'
        'DATAENTDEVOL'#9'10'#9'Data'#9'F'
        'RAZAOSOCIAL'#9'60'#9'Fornecedor'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsUltCompra
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
      UseTFields = False
      IndicatorColor = icBlack
    end
    object GrdArt: TwwDBGrid
      Tag = 99
      Left = 0
      Top = 25
      Width = 273
      Height = 176
      Hint = 'Duplo click para visualizar Cotação'
      Selected.Strings = (
        'DESCRICAO'#9'45'#9'Itens'#9'F'
        'QTDEPEDIDA'#9'10'#9'Qtde Pedida'#9'F'
        'SALDOQTDE'#9'10'#9'Saldo'#9'F'
        'CODMEDCUSTO'#9'4'#9'Unid.'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      OnRowChanged = GrdArtRowChanged
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      Color = clWhite
      DataSource = dsList
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
      UseTFields = False
      IndicatorColor = icBlack
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 273
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
      Width = 273
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
    Left = 786
    Top = 65519
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 358
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 776
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 16
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 396
    Top = 7
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
      'COTACOES.IDPROCXART'
      'COTACOES.PROPOSTA'
      'COTACOES.IDFORCLI')
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
    Left = 696
    Top = 71
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 340
    Top = 98
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsPrazoEntrega
    Left = 446
    Top = 2
  end
  object cdsPrazoEntrega: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 510
    Top = 4
  end
  object cdsPrazoPgto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 614
    Top = 68
  end
  object cdsAgregados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 494
    Top = 100
  end
  object cdsUltCompra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 287
  end
  object cdsUnMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 399
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 129
    Top = 399
  end
  object cdsFornecedor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 201
    Top = 399
  end
  object cdsObs: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 286
    Top = 448
  end
  object dsPrazoPgto: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoPgto
    Left = 512
    Top = 47
  end
  object dsPrazoEntrega: TwwDataSource
    AutoEdit = False
    DataSet = cdsPrazoEntrega
    Left = 407
    Top = 46
  end
  object dsUltCompra: TwwDataSource
    AutoEdit = False
    DataSet = cdsUltCompra
    Left = 198
    Top = 287
  end
  object dsObs: TwwDataSource
    AutoEdit = False
    DataSet = cdsObs
    Left = 287
    Top = 430
  end
  object cdsList: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 111
  end
  object dsList: TwwDataSource
    AutoEdit = False
    DataSet = cdsList
    Left = 87
    Top = 118
  end
  object dsDadosForn: TwwDataSource
    AutoEdit = False
    DataSet = cdsDadosForn
    Left = 701
    Top = 313
  end
  object dsUltCompForn: TwwDataSource
    AutoEdit = False
    DataSet = cdsUltCompForn
    Left = 704
    Top = 255
  end
  object cdsUltCompForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 528
    Top = 271
  end
  object cdsDadosForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 624
    Top = 311
  end
end
