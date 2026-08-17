inherited frmCadContratoRendaFixa: TfrmCadContratoRendaFixa
  Left = 6
  Top = 73
  Caption = 'Contratos de Renda Fixa'
  ClientHeight = 446
  ClientWidth = 784
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 360
    object pnlPrincipal: TPanel
      Left = 5
      Top = 5
      Width = 774
      Height = 90
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 11
        Width = 49
        Height = 13
        Caption = 'Carteira '
      end
      object dblCarteira: TwwDBLookupCombo
        Left = 59
        Top = 8
        Width = 336
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Descrição')
        LookupTable = QryBuscaCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblCarteiraChange
        OnExit = dblCarteiraChange
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 43
      Width = 774
      Height = 311
      ActivePage = tbsDadosTitulo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = PageControl1Change
      object tbsDadosTitulo: TTabSheet
        Caption = 'Título             '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        object pnlDadosTitulo: TPanel
          Left = 0
          Top = 31
          Width = 681
          Height = 252
          Align = alClient
          TabOrder = 1
          object Label1: TLabel
            Left = 284
            Top = 48
            Width = 99
            Height = 13
            Caption = 'Lote (Certificado)'
          end
          object Label10: TLabel
            Left = 9
            Top = 4
            Width = 35
            Height = 13
            Caption = 'Título'
          end
          object Label9: TLabel
            Left = 284
            Top = 4
            Width = 91
            Height = 13
            Caption = 'Código do Ativo'
          end
          object dbLote: TDBEdit
            Left = 284
            Top = 66
            Width = 167
            Height = 21
            DataField = 'IDLOTE'
            DataSource = ds
            TabOrder = 3
          end
          object Inativo: TDBCheckBox
            Left = 489
            Top = 66
            Width = 61
            Height = 17
            Caption = 'Inativo'
            DataField = 'FLGATIVO'
            DataSource = DsInvestimento
            Enabled = False
            TabOrder = 4
            ValueChecked = 'N'
            ValueUnchecked = 'S'
          end
          object dblTipoTituloRFixa: TwwDBLookupCombo
            Left = 9
            Top = 21
            Width = 263
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MNEMONICO'#9'30'#9'Descrição')
            DataField = 'CODTIPRENFIXA'
            DataSource = dsTitRenFixa
            LookupTable = QryBuscaTitulo
            LookupField = 'CODTIPRENFIXA'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
            OnExit = dblTipoTituloRFixaExit
          end
          object dbeCodigoAtivo: TwwDBEdit
            Left = 284
            Top = 21
            Width = 167
            Height = 21
            DataField = 'CODATIVOCUST'
            DataSource = dsTitRenFixa
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 9
            Top = 48
            Width = 262
            Height = 45
            Caption = 'Tipo de Indexador'
            Columns = 2
            DataField = 'FLGPREPOS'
            DataSource = dsTitRenFixa
            Enabled = False
            Items.Strings = (
              'Pré-fixado'
              'Pós-fixado')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
            OnChange = DBRadioGroup1Change
          end
          object Panel2: TPanel
            Left = 4
            Top = 98
            Width = 674
            Height = 151
            BevelInner = bvLowered
            TabOrder = 5
            object Label4: TLabel
              Left = 8
              Top = 97
              Width = 67
              Height = 13
              Caption = 'Vencimento'
            end
            object Label7: TLabel
              Left = 129
              Top = 41
              Width = 57
              Height = 13
              Caption = 'Indexador'
            end
            object Label3: TLabel
              Left = 8
              Top = 41
              Width = 96
              Height = 13
              Caption = 'Data de Emissão'
            end
            object Label5: TLabel
              Left = 129
              Top = 97
              Width = 81
              Height = 13
              Caption = 'Taxa de Juros'
            end
            object Label8: TLabel
              Left = 301
              Top = 41
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label6: TLabel
              Left = 221
              Top = 97
              Width = 78
              Height = 13
              Caption = 'Tipo de Juros'
            end
            object Label19: TLabel
              Left = 442
              Top = 38
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbdDtaVencimeto: TCMDateTimePicker
              Left = 8
              Top = 113
              Width = 114
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVENCTITRENFIX'
              DataSource = dsTitRenFixa
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
            object dblIndexador: TwwDBLookupCombo
              Left = 129
              Top = 58
              Width = 156
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Descrição')
              DataField = 'INDEXRENFIX'
              DataSource = dsTitRenFixa
              LookupTable = QryMoeda
              LookupField = 'MOECODIGO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnChange = dblIndexadorChange
              OnExit = dblIndexadorExit
            end
            object dbdDtaEmissao: TCMDateTimePicker
              Left = 8
              Top = 58
              Width = 114
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEMTITRENFIX'
              DataSource = dsTitRenFixa
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
              OnExit = dbdDtaEmissaoExit
            end
            object dbrValJuros: TDBRealEdit
              Left = 130
              Top = 113
              Width = 79
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '  0,00')
              TabOrder = 4
              WordWrap = False
              OnChange = dbrValJurosChange
              IntDigits = 6
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'JUROSRENFIX'
              DataSource = dsTitRenFixa
            end
            object dbrValPercentual: TDBRealEdit
              Left = 301
              Top = 58
              Width = 124
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCINDEX'
              DataSource = dsTitRenFixa
            end
            object dblTaxaJuros: TwwDBLookupCombo
              Left = 221
              Top = 113
              Width = 204
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPJUROS'#9'20'#9'Descrição')
              DataField = 'CODTIPTXJUROS'
              DataSource = dsTitRenFixa
              LookupTable = QryTipoJuros
              LookupField = 'CODTIPTXJUROS'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnExit = dblTaxaJurosExit
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 673
              Height = 34
              BevelInner = bvLowered
              Caption = 'Características do Título'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object dbmObservacao: TDBMemo
              Left = 441
              Top = 55
              Width = 228
              Height = 91
              DataField = 'OBSINVESTIMENTO'
              DataSource = DsInvestimento
              TabOrder = 6
            end
            object Panel4: TPanel
              Left = 436
              Top = 33
              Width = 2
              Height = 117
              TabOrder = 8
            end
          end
        end
        object Dock974: TDock97
          Left = 0
          Top = 0
          Width = 766
          Height = 31
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Toolbar973: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object BtIncDet1: TSpeedButton
              Left = 0
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtIncDet1Click
            end
            object BtDelDet1: TSpeedButton
              Left = 49
              Top = 0
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtDelDet1Click
            end
            object BtAltDet1: TSpeedButton
              Left = 25
              Top = 0
              Width = 24
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Enabled = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                00333377737FFFFF773333303300000003333337337777777333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = BtAltDet1Click
            end
          end
        end
        object Dock973: TDock97
          Left = 681
          Top = 31
          Width = 85
          Height = 252
          AllowDrag = False
          BoundLines = [blLeft]
          Position = dpRight
          object Toolbar972: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97Detalhe'
            DockPos = 0
            TabOrder = 0
            object BtOkDet1: TBitBtn
              Left = 0
              Top = 0
              Width = 80
              Height = 27
              Caption = '&OK'
              Default = True
              Enabled = False
              TabOrder = 0
              OnClick = BtOkDet1Click
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000010000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A600000000000000000000000000000000000000000000000000000000000000
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
              NumGlyphs = 2
            end
            object BtCancDet1: TBitBtn
              Left = 0
              Top = 27
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Cancelar'
              Enabled = False
              TabOrder = 1
              OnClick = BtCancDet1Click
              Glyph.Data = {
                BE060000424DBE06000000000000360400002800000024000000120000000100
                0800000000008802000000000000000000000001000000010000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A600000000000000000000000000000000000000000000000000000000000000
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
                0303F8F80303030303030303030303030303030303FF03030303030303030303
                0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                030101010101F80303030303030303030303F8FF0303030303F8030303030303
                0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                0303030303030303F90101010101F8030303030303030303030303F803030303
                F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                03030303030303030303030303030303030303030303030303F8F8F803030303
                0303030303030303030303030303030303030303030303030303030303030303
                0303}
              NumGlyphs = 2
            end
            object BtVoltaDet1: TBitBtn
              Left = 0
              Top = 54
              Width = 80
              Height = 27
              Cancel = True
              Caption = '&Voltar'
              Enabled = False
              TabOrder = 2
              OnClick = BtCancDet1Click
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                C8807FF7777777777FF700000000000000007777777777777777333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
          end
        end
      end
      object tbsOperacao: TTabSheet
        Caption = 'Operação          '
        object PageControl2: TPageControl
          Left = 0
          Top = 0
          Width = 766
          Height = 283
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Informações Contábeis '
            TabVisible = False
            object Dock977: TDock97
              Left = 0
              Top = 0
              Width = 758
              Height = 31
              AllowDrag = False
              BoundLines = [blTop, blBottom, blLeft, blRight]
              object Toolbar974: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97BotoesDetalhe'
                DockPos = 0
                TabOrder = 0
                object BtDelDet: TSpeedButton
                  Left = 50
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Remover o registro selecionado|'
                  AllowAllUp = True
                  GroupIndex = 1
                  Enabled = False
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                    555557777F777555F55500000000555055557777777755F75555005500055055
                    555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                    5555577FF77577FF555555005050110555555577F757777FF555555505099910
                    555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                    3055577F75F77777575F55005055090B030555775755777575755555555550B0
                    B03055555F555757575755550555550B0B335555755555757555555555555550
                    BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                    50BB555555555555575F555555555555550B5555555555555575}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = BtDelDetClick
                end
                object BtAltDet: TSpeedButton
                  Left = 25
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Alterar o registro selecionado|'
                  AllowAllUp = True
                  GroupIndex = 1
                  Enabled = False
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
                    000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
                    00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
                    F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
                    0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
                    FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
                    FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
                    0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
                    00333377737FFFFF773333303300000003333337337777777333}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = BtAltDetClick
                end
                object BtIncDet: TSpeedButton
                  Left = 0
                  Top = 0
                  Width = 25
                  Height = 25
                  Hint = 'Inserir novo registro|'
                  AllowAllUp = True
                  GroupIndex = 1
                  Enabled = False
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                    333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                    0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                    07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                    0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                    33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                    B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                    3BB33773333773333773B333333B3333333B7333333733333337}
                  Layout = blGlyphTop
                  NumGlyphs = 2
                  ParentShowHint = False
                  ShowHint = True
                  Spacing = 0
                  OnClick = BtIncDetClick
                end
              end
            end
            object Dock978: TDock97
              Left = 673
              Top = 31
              Width = 85
              Height = 242
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              object Toolbar975: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object BtOkDet: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Caption = '&OK'
                  Default = True
                  Enabled = False
                  TabOrder = 0
                  OnClick = BtOkDetClick
                  Glyph.Data = {
                    BE060000424DBE06000000000000360400002800000024000000120000000100
                    0800000000008802000000000000000000000001000000010000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A600000000000000000000000000000000000000000000000000000000000000
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
                  NumGlyphs = 2
                end
                object BtCancDet: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Cancelar'
                  Enabled = False
                  TabOrder = 1
                  OnClick = BtCancDetClick
                  Glyph.Data = {
                    BE060000424DBE06000000000000360400002800000024000000120000000100
                    0800000000008802000000000000000000000001000000010000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A600000000000000000000000000000000000000000000000000000000000000
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
                    0303F8F80303030303030303030303030303030303FF03030303030303030303
                    0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                    03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                    030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                    FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                    030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                    F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                    010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                    030101010101F80303030303030303030303F8FF0303030303F8030303030303
                    0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                    0303030303030303F90101010101F8030303030303030303030303F803030303
                    F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                    03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                    03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                    03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                    0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                    030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                    03030303030303030303030303030303030303030303030303F8F8F803030303
                    0303030303030303030303030303030303030303030303030303030303030303
                    0303}
                  NumGlyphs = 2
                end
                object BtVoltaDet: TBitBtn
                  Left = 0
                  Top = 54
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  Enabled = False
                  TabOrder = 2
                  OnClick = BtCancDetClick
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
                    FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
                    C8807FF7777777777FF700000000000000007777777777777777333333333333
                    3333333333333333333333333333333333333333333333333333}
                  NumGlyphs = 2
                end
              end
            end
            object Panel1: TPanel
              Left = 0
              Top = 29
              Width = 673
              Height = 36
              BevelInner = bvLowered
              Caption = 'Movimentação'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -21
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dblOperacao: TwwDBLookupCombo
              Left = 15
              Top = 107
              Width = 102
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SIGLATIPOOPER'#9'4'#9'Descrição')
              DataField = 'IDTIPOOPERACAO'
              DataSource = DsOperacaoInvest
              LookupField = 'IDTIPOOPERACAO'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbgOperacao: TwwDBGrid
              Left = -1
              Top = 64
              Width = 673
              Height = 208
              Selected.Strings = (
                'SIGLATIPOOPER'#9'7'#9'Operação'
                'DATAOPERACAO'#9'11'#9'Data'
                'QTDEOPERACAO'#9'16'#9'Quantidade'
                'PRECOUNITOPERACAO'#9'13'#9'PU'
                'VLROPERACAO'#9'19'#9'Valor'
                'VLRIR'#9'12'#9'IR')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Color = clSilver
              DataSource = DsOperacaoInvest
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 4
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clMaroon
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnEnter = dbgOperacaoEnter
              OnExit = dbgOperacaoExit
              OnKeyDown = dbgOperacaoKeyDown
              OnKeyUp = dbgOperacaoKeyUp
              IndicatorColor = icYellow
            end
            object dblTipoOperacao: TwwDBLookupCombo
              Left = 24
              Top = 120
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SIGLATIPOOPER'#9'7'#9'Descrição')
              DataField = 'IDTIPOOPERACAO'
              DataSource = DsOperacaoInvest
              LookupTable = QryTipoOperacao
              LookupField = 'IDTIPOOPERACAO'
              Style = csDropDownList
              TabOrder = 5
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = dblTipoOperacaoCloseUp
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 407
    Width = 784
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT '#9'CIN.IDCONTRATOINVEST, CIN.IDTIPOCONTRINVEST, CIN.IDINVES' +
        'TIMENTO,'
      
        '        CIN.IDEMISSOR,    CIN.IDCORRETVALORES, CIN.IDBOLSAVALORE' +
        'S, CIN.SERIE,'
      
        '        CIN.IDLOTE,       CIN.DATACOMPRALOTE,  CIN.DATAVENCIM,  ' +
        '   CIN.VLRCOMPRATITLOTE,'
      
        '        CIN.PRECOVENCIM,  CIN.QTDETITLOTE,     CIN.SALDOTITLOTE,' +
        '   CIN.VLRRESGATE,'
      
        '        CIN.PRZVENC,      CIN.DATACARENCIA,    CIN.ANIVERSARIO, ' +
        '   CIN.QTDECOMPRATITLOTE,'
      
        '        CIN.IDCARTAVISTA, CIN.IDCARTLASTRO,    CIN.IDCONTRATOMES' +
        'TRE, INV.IDTIPOINVEST'
      ''
      'FROM CONTRATOINVESTIM CIN, INVESTIMENTO INV'
      ''
      'WHERE '#9'INV.IDTIPOINVEST   = 1 AND'
      #9'CIN.IDINVESTIMENTO = INV.IDINVESTIMENTO AND'
      '        CIN.IDCONTRATOINVEST = :IDCONTRATOINVEST')
    Left = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATOINVEST'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATOINVEST: TFloatField
      FieldName = 'IDCONTRATOINVEST'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOINVEST'
    end
    object qryIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'CONTRATOINVESTIM.IDTIPOCONTRINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'CONTRATOINVESTIM.IDINVESTIMENTO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'CONTRATOINVESTIM.IDEMISSOR'
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'CONTRATOINVESTIM.IDCORRETVALORES'
    end
    object qryIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'CONTRATOINVESTIM.IDBOLSAVALORES'
    end
    object qrySERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'CONTRATOINVESTIM.SERIE'
      Size = 60
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'CONTRATOINVESTIM.IDLOTE'
      Size = 10
    end
    object qryDATACOMPRALOTE: TDateTimeField
      FieldName = 'DATACOMPRALOTE'
      Origin = 'CONTRATOINVESTIM.DATACOMPRALOTE'
    end
    object qryDATAVENCIM: TDateTimeField
      FieldName = 'DATAVENCIM'
      Origin = 'CONTRATOINVESTIM.DATAVENCIM'
    end
    object qryVLRCOMPRATITLOTE: TFloatField
      FieldName = 'VLRCOMPRATITLOTE'
      Origin = 'CONTRATOINVESTIM.VLRCOMPRATITLOTE'
    end
    object qryPRECOVENCIM: TFloatField
      FieldName = 'PRECOVENCIM'
      Origin = 'CONTRATOINVESTIM.PRECOVENCIM'
    end
    object qryQTDETITLOTE: TFloatField
      FieldName = 'QTDETITLOTE'
      Origin = 'CONTRATOINVESTIM.QTDETITLOTE'
    end
    object qrySALDOTITLOTE: TFloatField
      FieldName = 'SALDOTITLOTE'
      Origin = 'CONTRATOINVESTIM.SALDOTITLOTE'
    end
    object qryVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      Origin = 'CONTRATOINVESTIM.VLRRESGATE'
    end
    object qryPRZVENC: TFloatField
      FieldName = 'PRZVENC'
      Origin = 'CONTRATOINVESTIM.PRZVENC'
    end
    object qryDATACARENCIA: TDateTimeField
      FieldName = 'DATACARENCIA'
      Origin = 'CONTRATOINVESTIM.DATACARENCIA'
    end
    object qryANIVERSARIO: TFloatField
      FieldName = 'ANIVERSARIO'
      Origin = 'CONTRATOINVESTIM.ANIVERSARIO'
    end
    object qryQTDECOMPRATITLOTE: TFloatField
      FieldName = 'QTDECOMPRATITLOTE'
      Origin = 'CONTRATOINVESTIM.QTDECOMPRATITLOTE'
    end
    object qryIDCARTAVISTA: TFloatField
      FieldName = 'IDCARTAVISTA'
      Origin = 'CONTRATOINVESTIM.IDCARTAVISTA'
    end
    object qryIDCARTLASTRO: TFloatField
      FieldName = 'IDCARTLASTRO'
      Origin = 'CONTRATOINVESTIM.IDCARTLASTRO'
    end
    object qryIDCONTRATOMESTRE: TFloatField
      FieldName = 'IDCONTRATOMESTRE'
      Origin = 'CONTRATOINVESTIM.IDCONTRATOMESTRE'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 8
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOINVESTIM'
      'set'
      '  IDCONTRATOINVEST = :IDCONTRATOINVEST,'
      '  IDTIPOCONTRINVEST = :IDTIPOCONTRINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  SERIE = :SERIE,'
      '  IDLOTE = :IDLOTE,'
      '  DATACOMPRALOTE = :DATACOMPRALOTE,'
      '  DATAVENCIM = :DATAVENCIM,'
      '  VLRCOMPRATITLOTE = :VLRCOMPRATITLOTE,'
      '  QTDETITLOTE = :QTDETITLOTE,'
      '  SALDOTITLOTE = :SALDOTITLOTE,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  PRECOVENCIM = :PRECOVENCIM,'
      '  IDCARTLASTRO = :IDCARTLASTRO,'
      '  IDCARTAVISTA = :IDCARTAVISTA,'
      '  PRZVENC = :PRZVENC,'
      '  QTDECOMPRATITLOTE = :QTDECOMPRATITLOTE,'
      '  DATACARENCIA = :DATACARENCIA,'
      '  ANIVERSARIO = :ANIVERSARIO,'
      '  IDCONTRATOMESTRE = :IDCONTRATOMESTRE'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    InsertSQL.Strings = (
      'insert into CONTRATOINVESTIM'
      
        '  (IDCONTRATOINVEST, IDTIPOCONTRINVEST, IDEMISSOR, IDINVESTIMENT' +
        'O, IDCORRETVALORES, '
      
        '   IDBOLSAVALORES, SERIE, IDLOTE, DATACOMPRALOTE, DATAVENCIM, VL' +
        'RCOMPRATITLOTE, '
      
        '   QTDETITLOTE, SALDOTITLOTE, VLRRESGATE, PRECOVENCIM, IDCARTLAS' +
        'TRO, IDCARTAVISTA, '
      
        '   PRZVENC, QTDECOMPRATITLOTE, DATACARENCIA, ANIVERSARIO, IDCONT' +
        'RATOMESTRE)'
      'values'
      
        '  (:IDCONTRATOINVEST, :IDTIPOCONTRINVEST, :IDEMISSOR, :IDINVESTI' +
        'MENTO, '
      
        '   :IDCORRETVALORES, :IDBOLSAVALORES, :SERIE, :IDLOTE, :DATACOMP' +
        'RALOTE, '
      
        '   :DATAVENCIM, :VLRCOMPRATITLOTE, :QTDETITLOTE, :SALDOTITLOTE, ' +
        ':VLRRESGATE, '
      
        '   :PRECOVENCIM, :IDCARTLASTRO, :IDCARTAVISTA, :PRZVENC, :QTDECO' +
        'MPRATITLOTE, '
      '   :DATACARENCIA, :ANIVERSARIO, :IDCONTRATOMESTRE)')
    DeleteSQL.Strings = (
      'delete from CONTRATOINVESTIM'
      'where'
      '  IDCONTRATOINVEST = :OLD_IDCONTRATOINVEST')
    Left = 249
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARTEIRAINVEST.DESCCARTINVEST'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CONTRATOINVESTIM.IDLOTE'
      'EMISSOR.SIGLAEMISSOR ')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Carteira'
      'Descrição do Título'
      'Lote'
      'Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVESTIMENTO'
      'CONTRATOINVESTIM'
      'CARTEIRAINVEST'
      'EMISSOR'
      'OPERACAOINVEST'
      'TIPOOPERACAO ')
    CamposChave.Strings = (
      'CONTRATOINVESTIM.IDCONTRATOINVEST'
      'INVESTIMENTO.IDINVESTIMENTO'
      'CARTEIRAINVEST.IDCARTEIRAINVEST'
      'CONTRATOINVESTIM.IDTIPOCONTRINVEST'
      'EMISSOR.IDEMISSOR')
    Filtro.Strings = (
      'INVESTIMENTO.IDTIPOINVEST = 1'
      'CONTRATOINVESTIM.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO(+)'
      'CONTRATOINVESTIM.IDEMISSOR      = EMISSOR.IDEMISSOR(+)'
      
        'CONTRATOINVESTIM.IDCARTLASTRO   = CARTEIRAINVEST.IDCARTEIRAINVES' +
        'T(+)'
      
        'CONTRATOINVESTIM.IDINVESTIMENTO = OPERACAOINVEST.IDINVESTIMENTO ' +
        ' (+)'
      
        'CONTRATOINVESTIM.IDCARTLASTRO   = CARTEIRAINVEST.IDCARTEIRAINVES' +
        'T (+)'
      
        'OPERACAOINVEST.IDTIPOOPERACAO   = TIPOOPERACAO.IDTIPOOPERACAO (+' +
        ')')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '10'
      '20')
    UsaDistinct = True
    Left = 357
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 309
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object QryBuscaCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IDCARTEIRAINVEST, DESCCARTINVEST, IDGESTORCARTEIRA,  FLG' +
        'TRATALOTE,'
      #9'DATAINICIO'
      ''
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 1 '
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 716
    Top = 208
    object QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
    end
    object QryBuscaCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryBuscaCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'CARTEIRAINVEST.IDGESTORCARTEIRA'
    end
    object QryBuscaCarteiraFLGTRATALOTE: TStringField
      FieldName = 'FLGTRATALOTE'
      Origin = 'CARTEIRAINVEST.FLGTRATALOTE'
      Size = 1
    end
    object QryBuscaCarteiraDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'CARTEIRAINVEST.DATAINICIO'
    end
  end
  object QryBuscaTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      'SELECT'
      '   IDEMISSORXTITULO,'
      '   IDEMISSOR,'
      '   EMI.CODTIPRENFIXA,'
      '   TIP.CODTIPRENFIXA,'
      '   MNEMONICO,'
      '   FLGPREPOS'
      'FROM'
      '   EMISSORXTITULO EMI,'
      '   TIPOTITRENFIXA   TIP     '
      'WHERE '
      '    EMI.CODTIPRENFIXA='
      '    TIP.CODTIPRENFIXA(+)'
      ''
      'ORDER BY  MNEMONICO')
    ValidateWithMask = True
    Left = 716
    Top = 264
    object QryBuscaTituloMNEMONICO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'MNEMONICO'
      Origin = 'EMISSORXTITULO.MNEMONICO'
      Size = 30
    end
    object QryBuscaTituloIDEMISSORXTITULO: TFloatField
      FieldName = 'IDEMISSORXTITULO'
      Origin = 'EMISSORXTITULO.IDEMISSORXTITULO'
      Visible = False
    end
    object QryBuscaTituloIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSORXTITULO.IDEMISSOR'
      Visible = False
    end
    object QryBuscaTituloCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'EMISSORXTITULO.CODTIPRENFIXA'
      Visible = False
      Size = 5
    end
    object QryBuscaTituloFLGPREPOS: TFloatField
      FieldName = 'FLGPREPOS'
    end
  end
  object QryTitRenFixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  TIT.IDTITRENFIXA,  TIT.CODTIPTXPREMIO,  TIT.INDEXRENFIX,' +
        '    TIT.CODTIPRENFIXA,'
      
        '        TIT.CODTIPTXJUROS, TIT.SERIETITRENFIX,  TIT.IDALTTITRENF' +
        'IX, TIT.DATAEMTITRENFIX,'
      
        '        TIT.DATAVENCTITRENFIX, TIT.DATAINIJURRENFIX,    TIT.DATA' +
        'BASEINDRENFIX, TIT.JUROSRENFIX,'
      
        '        TIT.PREMIORENFIX,  TIT.JUROSDIA, TIT.PREMIODIA, TIT.IDIN' +
        'DSWAPFIX,  TIT.VLRRESGATE,'
      
        '        TIT.TRGDTINCLUSAO, TIT.TRGUSERINCLUSAO, TIT.IDCUSTODIANT' +
        'E, TIT.DIASCOTACOMPRA,'
      
        '        TIT.DIASCOTAVENDA, TIT.PERCINDEX, TIT.CARENCIA, TIT.PERI' +
        'ODICIDADE, TIT.FLGSAQUEPARCIAL,'
      
        '        TIT.SALDOVLRRESGATE,   TIT.NUMCASASDEC, TIT.DATAINITR,  ' +
        '   TIT.INDEXRENFIX2,'
      
        '        TIT.DATABASEINDRENFX2, TIT.PERCINDEX2,  TIT.JUROSRENFIX2' +
        ',  TIT.CODTIPTXJUROS2,'
      
        '        TIT.DATAINIJURRENFIX2, TIT.FLGINDICE2, TIT.DIASPRAZOANBI' +
        'D, TIT.DIASPRAZOANBID2,'
      
        '        TTR.IDMOEDAREG, TIT.CODATIVOCUST, TTR.FLGPU, TTR.FLGINTE' +
        'RPOLA, TTR.FLLGPRORATA,'
      '        TIT.FLGPREPOS'
      ''
      'FROM TITRENFIXA TIT, TIPOTITRENFIXA TTR'
      ''
      'WHERE '
      '        TTR.CODTIPRENFIXA = TIT.CODTIPRENFIXA AND'
      '        IDTITRENFIXA =:IDTITRENFIXA')
    UpdateObject = updTitRenFixa
    ValidateWithMask = True
    Left = 436
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITRENFIXA'
        ParamType = ptUnknown
      end>
    object QryTitRenFixaIDTITRENFIXA: TFloatField
      FieldName = 'IDTITRENFIXA'
      Origin = 'TITRENFIXA.IDTITRENFIXA'
    end
    object QryTitRenFixaCODTIPTXPREMIO: TFloatField
      FieldName = 'CODTIPTXPREMIO'
      Origin = 'TITRENFIXA.CODTIPTXPREMIO'
    end
    object QryTitRenFixaINDEXRENFIX: TFloatField
      FieldName = 'INDEXRENFIX'
      Origin = 'TITRENFIXA.INDEXRENFIX'
    end
    object QryTitRenFixaCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object QryTitRenFixaCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TITRENFIXA.CODTIPTXJUROS'
    end
    object QryTitRenFixaSERIETITRENFIX: TStringField
      FieldName = 'SERIETITRENFIX'
      Origin = 'TITRENFIXA.SERIETITRENFIX'
      Size = 15
    end
    object QryTitRenFixaIDALTTITRENFIX: TStringField
      FieldName = 'IDALTTITRENFIX'
      Origin = 'TITRENFIXA.IDALTTITRENFIX'
      Size = 30
    end
    object QryTitRenFixaDATAEMTITRENFIX: TDateTimeField
      FieldName = 'DATAEMTITRENFIX'
      Origin = 'TITRENFIXA.DATAEMTITRENFIX'
    end
    object QryTitRenFixaDATAVENCTITRENFIX: TDateTimeField
      FieldName = 'DATAVENCTITRENFIX'
      Origin = 'TITRENFIXA.DATAVENCTITRENFIX'
    end
    object QryTitRenFixaDATAINIJURRENFIX: TDateTimeField
      FieldName = 'DATAINIJURRENFIX'
      Origin = 'TITRENFIXA.DATAINIJURRENFIX'
    end
    object QryTitRenFixaDATABASEINDRENFIX: TDateTimeField
      FieldName = 'DATABASEINDRENFIX'
      Origin = 'TITRENFIXA.DATABASEINDRENFIX'
    end
    object QryTitRenFixaJUROSRENFIX: TFloatField
      FieldName = 'JUROSRENFIX'
      Origin = 'TITRENFIXA.JUROSRENFIX'
    end
    object QryTitRenFixaPREMIORENFIX: TFloatField
      FieldName = 'PREMIORENFIX'
      Origin = 'TITRENFIXA.PREMIORENFIX'
    end
    object QryTitRenFixaJUROSDIA: TFloatField
      FieldName = 'JUROSDIA'
      Origin = 'TITRENFIXA.JUROSDIA'
    end
    object QryTitRenFixaPREMIODIA: TFloatField
      FieldName = 'PREMIODIA'
      Origin = 'TITRENFIXA.PREMIODIA'
    end
    object QryTitRenFixaIDINDSWAPFIX: TFloatField
      FieldName = 'IDINDSWAPFIX'
      Origin = 'TITRENFIXA.IDINDSWAPFIX'
    end
    object QryTitRenFixaVLRRESGATE: TFloatField
      FieldName = 'VLRRESGATE'
      Origin = 'TITRENFIXA.VLRRESGATE'
    end
    object QryTitRenFixaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'TITRENFIXA.TRGDTINCLUSAO'
    end
    object QryTitRenFixaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'TITRENFIXA.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryTitRenFixaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'TITRENFIXA.IDCUSTODIANTE'
    end
    object QryTitRenFixaDIASCOTACOMPRA: TFloatField
      FieldName = 'DIASCOTACOMPRA'
      Origin = 'TITRENFIXA.DIASCOTACOMPRA'
    end
    object QryTitRenFixaDIASCOTAVENDA: TFloatField
      FieldName = 'DIASCOTAVENDA'
      Origin = 'TITRENFIXA.DIASCOTAVENDA'
    end
    object QryTitRenFixaPERCINDEX: TFloatField
      FieldName = 'PERCINDEX'
      Origin = 'TITRENFIXA.PERCINDEX'
    end
    object QryTitRenFixaCARENCIA: TFloatField
      FieldName = 'CARENCIA'
      Origin = 'TITRENFIXA.CARENCIA'
    end
    object QryTitRenFixaPERIODICIDADE: TFloatField
      FieldName = 'PERIODICIDADE'
      Origin = 'TITRENFIXA.PERIODICIDADE'
    end
    object QryTitRenFixaFLGSAQUEPARCIAL: TStringField
      FieldName = 'FLGSAQUEPARCIAL'
      Origin = 'TITRENFIXA.FLGSAQUEPARCIAL'
      Size = 1
    end
    object QryTitRenFixaSALDOVLRRESGATE: TFloatField
      FieldName = 'SALDOVLRRESGATE'
      Origin = 'TITRENFIXA.SALDOVLRRESGATE'
    end
    object QryTitRenFixaNUMCASASDEC: TFloatField
      FieldName = 'NUMCASASDEC'
      Origin = 'TITRENFIXA.NUMCASASDEC'
    end
    object QryTitRenFixaDATAINITR: TDateTimeField
      FieldName = 'DATAINITR'
      Origin = 'TITRENFIXA.DATAINITR'
    end
    object QryTitRenFixaINDEXRENFIX2: TFloatField
      FieldName = 'INDEXRENFIX2'
      Origin = 'TITRENFIXA.INDEXRENFIX2'
    end
    object QryTitRenFixaDATABASEINDRENFX2: TDateTimeField
      FieldName = 'DATABASEINDRENFX2'
      Origin = 'TITRENFIXA.DATABASEINDRENFX2'
    end
    object QryTitRenFixaPERCINDEX2: TFloatField
      FieldName = 'PERCINDEX2'
      Origin = 'TITRENFIXA.PERCINDEX2'
    end
    object QryTitRenFixaJUROSRENFIX2: TFloatField
      FieldName = 'JUROSRENFIX2'
      Origin = 'TITRENFIXA.JUROSRENFIX2'
    end
    object QryTitRenFixaCODTIPTXJUROS2: TFloatField
      FieldName = 'CODTIPTXJUROS2'
      Origin = 'TITRENFIXA.CODTIPTXJUROS2'
    end
    object QryTitRenFixaDATAINIJURRENFIX2: TDateTimeField
      FieldName = 'DATAINIJURRENFIX2'
      Origin = 'TITRENFIXA.DATAINIJURRENFIX2'
    end
    object QryTitRenFixaFLGINDICE2: TStringField
      FieldName = 'FLGINDICE2'
      Origin = 'TITRENFIXA.FLGINDICE2'
      Size = 1
    end
    object QryTitRenFixaDIASPRAZOANBID: TFloatField
      FieldName = 'DIASPRAZOANBID'
      Origin = 'TITRENFIXA.DIASPRAZOANBID'
    end
    object QryTitRenFixaDIASPRAZOANBID2: TFloatField
      FieldName = 'DIASPRAZOANBID2'
      Origin = 'TITRENFIXA.DIASPRAZOANBID2'
    end
    object QryTitRenFixaIDMOEDAREG: TFloatField
      FieldName = 'IDMOEDAREG'
      Origin = 'TIPOTITRENFIXA.IDMOEDAREG'
    end
    object QryTitRenFixaCODATIVOCUST: TStringField
      FieldName = 'CODATIVOCUST'
      Origin = 'TITRENFIXA.CODATIVOCUST'
    end
    object QryTitRenFixaFLGPU: TFloatField
      FieldName = 'FLGPU'
      Origin = 'TIPOTITRENFIXA.FLGPU'
    end
    object QryTitRenFixaFLGINTERPOLA: TStringField
      FieldName = 'FLGINTERPOLA'
      Origin = 'TIPOTITRENFIXA.FLGINTERPOLA'
      Size = 1
    end
    object QryTitRenFixaFLLGPRORATA: TStringField
      FieldName = 'FLLGPRORATA'
      Origin = 'TIPOTITRENFIXA.FLLGPRORATA'
      Size = 1
    end
    object QryTitRenFixaFLGPREPOS: TFloatField
      FieldName = 'FLGPREPOS'
      Origin = 'TITRENFIXA.FLGPREPOS'
    end
  end
  object dsTitRenFixa: TwwDataSource
    AutoEdit = False
    DataSet = QryTitRenFixa
    OnStateChange = dsTitRenFixaStateChange
    Left = 612
    Top = 101
  end
  object updTitRenFixa: TUpdateSQL
    ModifySQL.Strings = (
      'update TITRENFIXA'
      'set'
      '  IDTITRENFIXA = :IDTITRENFIXA,'
      '  CODTIPTXPREMIO = :CODTIPTXPREMIO,'
      '  INDEXRENFIX = :INDEXRENFIX,'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  CODTIPTXJUROS = :CODTIPTXJUROS,'
      '  SERIETITRENFIX = :SERIETITRENFIX,'
      '  IDALTTITRENFIX = :IDALTTITRENFIX,'
      '  DATAEMTITRENFIX = :DATAEMTITRENFIX,'
      '  DATAVENCTITRENFIX = :DATAVENCTITRENFIX,'
      '  DATAINIJURRENFIX = :DATAINIJURRENFIX,'
      '  DATABASEINDRENFIX = :DATABASEINDRENFIX,'
      '  JUROSRENFIX = :JUROSRENFIX,'
      '  PREMIORENFIX = :PREMIORENFIX,'
      '  JUROSDIA = :JUROSDIA,'
      '  PREMIODIA = :PREMIODIA,'
      '  IDINDSWAPFIX = :IDINDSWAPFIX,'
      '  VLRRESGATE = :VLRRESGATE,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  DIASCOTACOMPRA = :DIASCOTACOMPRA,'
      '  DIASCOTAVENDA = :DIASCOTAVENDA,'
      '  PERCINDEX = :PERCINDEX,'
      '  CARENCIA = :CARENCIA,'
      '  PERIODICIDADE = :PERIODICIDADE,'
      '  FLGSAQUEPARCIAL = :FLGSAQUEPARCIAL,'
      '  SALDOVLRRESGATE = :SALDOVLRRESGATE,'
      '  NUMCASASDEC = :NUMCASASDEC,'
      '  DATAINITR = :DATAINITR,'
      '  DIASPRAZOANBID = :DIASPRAZOANBID,'
      '  CODATIVOCUST = :CODATIVOCUST,'
      '  FLGPREPOS = :FLGPREPOS'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    InsertSQL.Strings = (
      'insert into TITRENFIXA'
      
        '  (IDTITRENFIXA, CODTIPTXPREMIO, INDEXRENFIX, CODTIPRENFIXA, COD' +
        'TIPTXJUROS, '
      
        '   SERIETITRENFIX, IDALTTITRENFIX, DATAEMTITRENFIX, DATAVENCTITR' +
        'ENFIX, '
      
        '   DATAINIJURRENFIX, DATABASEINDRENFIX, JUROSRENFIX, PREMIORENFI' +
        'X, JUROSDIA, '
      
        '   PREMIODIA, IDINDSWAPFIX, VLRRESGATE, TRGDTINCLUSAO, TRGUSERIN' +
        'CLUSAO, '
      
        '   IDCUSTODIANTE, DIASCOTACOMPRA, DIASCOTAVENDA, PERCINDEX, CARE' +
        'NCIA, PERIODICIDADE, '
      
        '   FLGSAQUEPARCIAL, SALDOVLRRESGATE, NUMCASASDEC, DATAINITR, DIA' +
        'SPRAZOANBID, '
      '   CODATIVOCUST, FLGPREPOS)'
      'values'
      
        '  (:IDTITRENFIXA, :CODTIPTXPREMIO, :INDEXRENFIX, :CODTIPRENFIXA,' +
        ' :CODTIPTXJUROS, '
      
        '   :SERIETITRENFIX, :IDALTTITRENFIX, :DATAEMTITRENFIX, :DATAVENC' +
        'TITRENFIX, '
      
        '   :DATAINIJURRENFIX, :DATABASEINDRENFIX, :JUROSRENFIX, :PREMIOR' +
        'ENFIX, '
      
        '   :JUROSDIA, :PREMIODIA, :IDINDSWAPFIX, :VLRRESGATE, :TRGDTINCL' +
        'USAO, :TRGUSERINCLUSAO, '
      
        '   :IDCUSTODIANTE, :DIASCOTACOMPRA, :DIASCOTAVENDA, :PERCINDEX, ' +
        ':CARENCIA, '
      
        '   :PERIODICIDADE, :FLGSAQUEPARCIAL, :SALDOVLRRESGATE, :NUMCASAS' +
        'DEC, :DATAINITR, '
      '   :DIASPRAZOANBID, :CODATIVOCUST, :FLGPREPOS)')
    DeleteSQL.Strings = (
      'delete from TITRENFIXA'
      'where'
      '  IDTITRENFIXA = :OLD_IDTITRENFIXA')
    Left = 525
    Top = 102
  end
  object QryTipoJuros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPTXJUROS, DESCTIPJUROS, TAMPERJUROS,  EFETNOMI'
      ''
      'FROM TIPOJUROS '
      ''
      'ORDER BY DESCTIPJUROS')
    ValidateWithMask = True
    Left = 714
    Top = 55
  end
  object QryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC  '
      ''
      'FROM MOEDA '
      ''
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 714
    Top = 7
    object QryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object QryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object UpdInvestimento: TUpdateSQL
    ModifySQL.Strings = (
      'update INVESTIMENTO'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDMOEDACONTAB = :IDMOEDACONTAB,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  FLGATIVO = :FLGATIVO,'
      '  OBSINVESTIMENTO = :OBSINVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into INVESTIMENTO'
      '  (IDINVESTIMENTO, IDTIPOINVEST, IDEMISSOR, IDMOEDACONTAB, '
      'DESCINVESTIMENTO, '
      '   FLGATIVO, OBSINVESTIMENTO)'
      'values'
      '  (:IDINVESTIMENTO, :IDTIPOINVEST, :IDEMISSOR, :IDMOEDACONTAB, '
      ':DESCINVESTIMENTO, '
      '   :FLGATIVO, :OBSINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from INVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 526
    Top = 52
  end
  object QryInvestimento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDINVESTIMENTO, IDTIPOINVEST, IDEMISSOR, IDMOEDACONTAB,'
      #9'DESCINVESTIMENTO, FLGATIVO, OBSINVESTIMENTO'
      ''
      'FROM INVESTIMENTO '
      ''
      'WHERE IDTIPOINVEST = 1 AND'
      '               IDINVESTIMENTO =:IDINVESTIMENTO')
    UpdateObject = UpdInvestimento
    ValidateWithMask = True
    Left = 436
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object QryInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object QryInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'INVESTIMENTO.FLGATIVO'
      Size = 1
    end
    object QryInvestimentoOBSINVESTIMENTO: TStringField
      FieldName = 'OBSINVESTIMENTO'
      Origin = 'INVESTIMENTO.OBSINVESTIMENTO'
      Size = 200
    end
  end
  object DsInvestimento: TwwDataSource
    AutoEdit = False
    DataSet = QryInvestimento
    Left = 611
    Top = 52
  end
  object QryOperacaoInvest: TwwQuery
    CachedUpdates = True
    BeforePost = QryOperacaoInvestBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST,IDTIPO' +
        'INVEST,'
      #9'IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO, '
      #9'QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER,'
      #9'IDINVESTIMENTO, EMPRESAPROP, IDFORCLI, IDCORRETVALORES,'
      #9'MOECODIGO, IDLOTE, OBSERVACAO, FLGCUSTODIA,VLRIR'
      ''
      ''
      'FROM OPERACAOINVEST'
      ''
      'WHERE IDTIPOINVEST =1 AND'
      '      IDINVESTIMENTO   =:IDINVESTIMENTO   AND'
      '      IDCARTEIRAINVEST =:IDCARTEIRAINVEST'
      '')
    UpdateObject = UpdOperacaoInvest
    ControlType.Strings = (
      'IDTIPOOPERACAO;CustomEdit;dblOperacao'
      'SIGLATIPOOPER;CustomEdit;dblTipoOperacao')
    ValidateWithMask = True
    Left = 439
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
    object QryOperacaoInvestSIGLATIPOOPER: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'SIGLATIPOOPER'
      LookupDataSet = QryTipoOperacao
      LookupKeyFields = 'IDTIPOOPERACAO'
      LookupResultField = 'SIGLATIPOOPER'
      KeyFields = 'IDTIPOOPERACAO'
      Size = 10
      Lookup = True
    end
    object QryOperacaoInvestDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
    end
    object QryOperacaoInvestQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 16
      FieldName = 'QTDEOPERACAO'
      OnSetText = QryOperacaoInvestQTDEOPERACAOSetText
      DisplayFormat = ',###'
    end
    object QryOperacaoInvestPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 13
      FieldName = 'PRECOUNITOPERACAO'
      OnSetText = QryOperacaoInvestQTDEOPERACAOSetText
      DisplayFormat = ',########0.00000000'
    end
    object QryOperacaoInvestVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 19
      FieldName = 'VLROPERACAO'
      OnSetText = QryOperacaoInvestQTDEOPERACAOSetText
      DisplayFormat = ',##0.00'
    end
    object QryOperacaoInvestVLRIR: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 12
      FieldName = 'VLRIR'
      DisplayFormat = ',##0.00'
      EditFormat = '0.00'
    end
    object QryOperacaoInvestDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data da~Liquidação'
      DisplayWidth = 9
      FieldName = 'DATAVENCOPER'
      Visible = False
    end
    object QryOperacaoInvestSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'SGLCORRETVALORES'
      LookupDataSet = QryBuscaCorretora
      LookupKeyFields = 'IDCORRETVALORES'
      LookupResultField = 'SGLCORRETVALORES'
      KeyFields = 'IDCORRETVALORES'
      Visible = False
      Size = 12
      Lookup = True
    end
    object QryOperacaoInvestIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
    object QryOperacaoInvestIDTIPOOPERACAO: TFloatField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryOperacaoInvestIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object QryOperacaoInvestIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object QryOperacaoInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOperacaoInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryOperacaoInvestIDINSTFIN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINSTFIN'
      Visible = False
    end
    object QryOperacaoInvestNUMDOCUMENTO: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object QryOperacaoInvestIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryOperacaoInvestEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object QryOperacaoInvestIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object QryOperacaoInvestMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryOperacaoInvestIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryOperacaoInvestOBSERVACAO: TStringField
      DisplayWidth = 200
      FieldName = 'OBSERVACAO'
      Visible = False
      Size = 200
    end
    object QryOperacaoInvestFLGCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCUSTODIA'
      Visible = False
      Size = 1
    end
  end
  object UpdOperacaoInvest: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDINSTFIN = :IDINSTFIN,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDLOTE = :IDLOTE,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  FLGCUSTODIA = :FLGCUSTODIA,'
      '  VLRIR = :VLRIR'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      
        '  (IDOPERACAOINVEST, IDCUSTODIANTE, IDCARTEIRAINVEST, IDTIPOINVE' +
        'ST, '
      'IDTIPOOPERACAO, '
      '   IDINSTFIN, DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, '
      'PRECOUNITOPERACAO, '
      '   VLROPERACAO, DATAVENCOPER, IDINVESTIMENTO, EMPRESAPROP, '
      'IDFORCLI, IDCORRETVALORES, '
      '   MOECODIGO, IDLOTE, OBSERVACAO, FLGCUSTODIA, VLRIR)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCARTEIRAINVEST, '
      ':IDTIPOINVEST, '
      '   :IDTIPOOPERACAO, :IDINSTFIN, :DATAOPERACAO, :NUMDOCUMENTO, '
      ':QTDEOPERACAO, '
      '   :PRECOUNITOPERACAO, :VLROPERACAO, :DATAVENCOPER, '
      ':IDINVESTIMENTO, :EMPRESAPROP, '
      
        '   :IDFORCLI, :IDCORRETVALORES, :MOECODIGO, :IDLOTE, :OBSERVACAO' +
        ', '
      ':FLGCUSTODIA, '
      '   :VLRIR)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 529
    Top = 2
  end
  object DsOperacaoInvest: TwwDataSource
    AutoEdit = False
    DataSet = QryOperacaoInvest
    OnStateChange = DsOperacaoInvestStateChange
    OnDataChange = DsOperacaoInvestDataChange
    Left = 606
    Top = 2
  end
  object QryBuscaCorretora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDCORRETVALORES, SGLCORRETVALORES'
      ''
      'FROM CORRETVALORES'
      ''
      'ORDER BY SGLCORRETVALORES')
    ValidateWithMask = True
    Left = 716
    Top = 321
    object QryBuscaCorretoraSGLCORRETVALORES: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 12
      FieldName = 'SGLCORRETVALORES'
      Origin = 'CORRETVALORES.SGLCORRETVALORES'
      Size = 10
    end
    object QryBuscaCorretoraIDCORRETVALORES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCORRETVALORES'
      Origin = 'CORRETVALORES.IDCORRETVALORES'
      Visible = False
    end
  end
  object QryTipoContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      'IDTIPOCONTRINVEST,'
      'DESCTIPOCTINVEST'
      'FROM'
      'TIPOCONTRINVEST'
      'WHERE '
      'IDTIPOINVEST = 1')
    ValidateWithMask = True
    Left = 632
    Top = 227
    object QryTipoContratoDESCTIPOCTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOCTINVEST'
      Origin = 'TIPOCONTRINVEST.IDDESPCARTINVEST'
      Size = 60
    end
    object QryTipoContratoIDTIPOCONTRINVEST: TFloatField
      FieldName = 'IDTIPOCONTRINVEST'
      Origin = 'TIPOCONTRINVEST.IDHISTCARTINV'
      Visible = False
    end
  end
  object qryEtapas: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#9'IDTIPOCONTRINVEST,SEQCONTRATOINVEST,IDREGRADATAOPER,    ' +
        '           '
      #9'IDTIPOINVEST,IDTIPOOPERACAO,DESCETAPACONTRATO,     '
      #9'IDREGRAVALOROPER          '
      ''
      'FROM ETAPACONTRATOINV'
      ''
      'WHERE  IDTIPOCONTRINVEST  =:IDTIPOCONTRINVEST '
      ''
      'ORDER BY SEQCONTRATOINVEST')
    ValidateWithMask = True
    Left = 544
    Top = 227
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 632
    Top = 333
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#9'T.IDTIPOOPERACAO, T.IDTIPOINVEST, T.IDMERCADO,T.SIGLATIP' +
        'OOPER,'
      '       '#9'T.DESCTIPOOPERACAO, T.NATUREZAOPERACAO'
      ''
      'FROM   '#9'TIPOOPERACAO T'
      ''
      'WHERE  T.IDTIPOINVEST = 1 AND'
      '       T.IDTIPOOPERACAO IN'
      '             (SELECT IDTIPOOPERACAO'
      '              FROM ETAPACONTRATOINV'
      '              WHERE  IDTIPOCONTRINVEST  =:IDTIPOCONTRINVEST)'
      ''
      'ORDER BY T.DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 633
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOCONTRINVEST'
        ParamType = ptUnknown
        Value = 15
      end>
    object QryTipoOperacaoSIGLATIPOOPER: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 7
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperacaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryTipoOperacaoIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Size = 1
    end
  end
  object qryParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM PARAMINVEST')
    ValidateWithMask = True
    Left = 714
    Top = 104
  end
  object qryOprRenFix: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDOPERACAOINVEST,'
      '  SALDOTIT,'
      '  IDCORRETVALORES,'
      '  IDREGRACALCUSADA,'
      '  VLRAGIOOPER'
      'FROM'
      '  OPRRENFIX'
      'WHERE'
      '  IDOPERACAOINVEST = :P_IDOPERACAOINVEST')
    UpdateObject = UpdateSQL1
    ValidateWithMask = True
    Left = 493
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
    object qryOprRenFixIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'OPRRENFIX.IDOPERACAOINVEST'
    end
    object qryOprRenFixSALDOTIT: TFloatField
      FieldName = 'SALDOTIT'
      Origin = 'OPRRENFIX.SALDOTIT'
    end
    object qryOprRenFixIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'OPRRENFIX.IDCORRETVALORES'
    end
    object qryOprRenFixIDREGRACALCUSADA: TFloatField
      FieldName = 'IDREGRACALCUSADA'
      Origin = 'OPRRENFIX.IDREGRACALCUSADA'
    end
    object qryOprRenFixVLRAGIOOPER: TFloatField
      FieldName = 'VLRAGIOOPER'
      Origin = 'OPRRENFIX.VLRAGIOOPER'
    end
  end
  object qryTmp: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 637
    Top = 180
  end
  object QryBuscaTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NATUREZAOPERACAO,'
      '  TIPCREDOR,'
      '  RECPAG,'
      '  DESCTIPOOPERACAO,'
      '  IDTIPOOPERACAO,'
      '  IDMERCADO,'
      '  FLGTRATAIR'
      'FROM'
      '  TIPOOPERACAO'
      'WHERE'
      '  IDTIPOINVEST = 1 AND'
      '  IDTIPOOPERACAO = :P_IDTIPOOPERACAO')
    ValidateWithMask = True
    Left = 545
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 1
    end
    object QryBuscaTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object QryBuscaTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOOPERACAO.RECPAG'
      Size = 1
    end
    object QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryBuscaTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
    end
    object QryBuscaTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'TIPOOPERACAO.FLGTRATAIR'
      Size = 1
    end
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update OPRRENFIX'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  SALDOTIT = :SALDOTIT,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  IDREGRACALCUSADA = :IDREGRACALCUSADA,'
      '  VLRAGIOOPER = :VLRAGIOOPER'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPRRENFIX'
      
        '  (IDOPERACAOINVEST, SALDOTIT, IDCORRETVALORES, IDREGRACALCUSADA' +
        ', VLRAGIOOPER)'
      'values'
      
        '  (:IDOPERACAOINVEST, :SALDOTIT, :IDCORRETVALORES, :IDREGRACALCU' +
        'SADA, :VLRAGIOOPER)')
    DeleteSQL.Strings = (
      'delete from OPRRENFIX'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 560
    Top = 156
  end
end
