inherited frmGeraLotePgto: TfrmGeraLotePgto
  Left = 101
  Top = 89
  HelpContext = 30035
  Caption = 'Gera Lote de Pagamento'
  ClientHeight = 488
  ClientWidth = 787
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo [0]
    Left = 519
    Top = 123
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  inherited pnlFundo: TPanel
    Width = 787
    Height = 449
    object Splitter1: TSplitter
      Left = 5
      Top = 222
      Width = 777
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 5
      Top = 225
      Width = 777
      Height = 219
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 30
        Width = 773
        Height = 187
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        Caption = 'Panel3'
        TabOrder = 0
        object dbgrdLotePagto: TwwDBGrid
          Left = 116
          Top = 5
          Width = 652
          Height = 158
          Selected.Strings = (
            'NOME'#9'40'#9'Nome\Razão Social'
            'NODOCUMENTO'#9'15'#9'Documento'
            'COMPLDOCUMENTO'#9'5'#9'Comp'
            'DATAPROGRAMADA'#9'10'#9'Data Prog'
            'DATAVENCTO'#9'10'#9'Data Venc'
            'VALOR'#9'19'#9'Valor Pago')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLoteXDocum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnCalcCellColors = dbgrdDocPendentesCalcCellColors
          IndicatorColor = icBlack
        end
        object Panel10: TPanel
          Left = 5
          Top = 5
          Width = 111
          Height = 158
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object bbtnDesfazPgto: TBitBtn
            Left = 4
            Top = 5
            Width = 105
            Height = 28
            Caption = 'Exclui'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnDesfazPgtoClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777770
              9977700000007777997777099777700000007777799770997777700000007777
              7799099777777000000077777777997777777000000070000009999777777000
              000070FFFF99F99977777000000070F88997F09997777000000070FF99FFF079
              99777000000070F88888F07799777000000070FFFFFFF07779777000000070F8
              8777F07777777000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
          end
          object bbtnCriaLote: TBitBtn
            Left = 5
            Top = 101
            Width = 105
            Height = 28
            Caption = 'Cria Lote'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = bbtnCriaLoteClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777772077777700000007777
              7777222077777000000077777772222077777000000070000022202207777000
              000070FFF222F07220777000000070F8882FF07720777000000070FFFFFFF077
              72077000000070F88888F07777207000000070FFFFFFF07777720000000070F8
              8777F07777772000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
            Spacing = 2
          end
          object bbtnFavorecido: TBitBtn
            Left = 4
            Top = 36
            Width = 105
            Height = 28
            Caption = '&Favorecido'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = bbtnFavorecidoClick
          end
          object bbtnObs: TBitBtn
            Left = 5
            Top = 68
            Width = 105
            Height = 28
            Caption = '&Observação'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = bbtnObsClick
          end
        end
        object SbLote: TStatusBar
          Left = 5
          Top = 163
          Width = 763
          Height = 19
          Panels = <
            item
              Text = 'Nº Do Lote Gerado'
              Width = 200
            end
            item
              Text = 'Valor Total do Lote'
              Width = 300
            end
            item
              Text = 'Data de Emissão'
              Width = 50
            end>
          SimplePanel = False
        end
      end
      object Pnldocpago: TPanel
        Left = 2
        Top = 2
        Width = 773
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos a Serem Pagos No Lote'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object PgLote: TPageControl
      Left = 5
      Top = 5
      Width = 777
      Height = 217
      ActivePage = TbsParametros
      Align = alTop
      TabOrder = 1
      OnChange = PgLoteChange
      object TbsParametros: TTabSheet
        Caption = 'Parâmetros Para Seleção'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 189
          Align = alClient
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelWidth = 2
          TabOrder = 0
          object LblFormaTipo: TLabel
            Left = 272
            Top = 67
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object Label2: TLabel
            Left = 272
            Top = 108
            Width = 106
            Height = 13
            Caption = 'Sistema de Origem'
          end
          object Label3: TLabel
            Left = 474
            Top = 67
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object bbtnSelecionaDoc: TBitBtn
            Left = 688
            Top = 68
            Width = 77
            Height = 81
            Caption = 'Seleciona'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnClick = bbtnSelecionaDocClick
            Glyph.Data = {
              0A030000424D0A03000000000000760000002800000021000000210000000100
              0400000000009402000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888888888
              888888888877777777777C000000770000000000000000000087777777777700
              000077033333333333333333330877777777760000007703B7B7B7B7B7B7B7B7
              7330877777777200000077037B7B7B7B7B7B7B7B7333087777777E0000007703
              B7B7B7B7B7B7B7B77333308777777000000077037B7BFBFBFBF77B7B73333308
              7777720000007703B7B703333330B7B77333333087777F00000077037B7B0333
              33307B7B733333308777720000007703B7B700000000B7B77333333087777500
              000077037B7B7B7B7B7B7B7B733333308777700000007703B7B7B7B7B7B7B7B7
              733333308777710000007703BBBBBBBBBBBBBBBB733333308777760000007770
              0000000000000000033333308777700000007770777777777777777000333330
              87777000000077700FFFFFFFFFFFFF080803333087777D000000777700FFFFFF
              FFFFFF088080333087777100000077777700FFFFFFFFF0887708033087777D00
              00007777777000FFFFFFF0877FF08030877774000000777777770F00FFFF0887
              FFFF08008777750000007777777770FF00FF087FFFF000007777730000007777
              7777700FFF0087FFFF00877777777E000000777777777700FFFFFFFFF0808777
              7777730000007777777777700FFFFFFF087F0877777777000000777777777770
              F0FFFFF08777087777777E0000007777777777770F0FFF0877FFF07777777D00
              00007777777777770FF0F087FFFFF07777777400000077777777777770FF087F
              FFF0077777777000000077777777777770FFFFFFF00777777777710000007777
              77777777770FFFF007777777777772000000777777777777770FF00777777777
              7777700000007777777777777770077777777777777770000000777777777777
              7777777777777777777777000000}
            Layout = blGlyphTop
          end
          object GpFormaPag: TGroupBox
            Left = 9
            Top = 15
            Width = 273
            Height = 47
            Caption = ' Contas/Caixas x Forma Pagamento '
            TabOrder = 0
            object dblkcmbDescricao: TwwDBLookupCombo
              Left = 12
              Top = 17
              Width = 253
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryDescPortadorForma
              LookupField = 'CODPORTFORMA'
              DropDownWidth = 450
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblkcmbDescricaoCloseUp
            end
          end
          object GpDataProg: TGroupBox
            Left = 475
            Top = 107
            Width = 206
            Height = 42
            Caption = ' Data Programada '
            TabOrder = 6
            object DtIni: TCMDateTimePicker
              Left = 7
              Top = 14
              Width = 97
              Height = 21
              Hint = 'Data Programada para Pagamento'
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
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 0
            end
            object DtFim: TCMDateTimePicker
              Left = 104
              Top = 14
              Width = 97
              Height = 21
              Hint = 'Data Programada para Pagamento'
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
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 1
            end
          end
          object GpDocumento: TGroupBox
            Left = 593
            Top = 14
            Width = 172
            Height = 47
            Caption = ' Documento/Complemento '
            TabOrder = 1
            object Label1: TLabel
              Left = 110
              Top = 21
              Width = 7
              Height = 13
              Caption = '/'
            end
            object EdtNumDoc: TRealEdit
              Left = 4
              Top = 18
              Width = 104
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 15
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
            end
            object EdtCompl: TEdit
              Left = 119
              Top = 17
              Width = 40
              Height = 21
              TabOrder = 1
            end
          end
          object GpFiltro: TGroupBox
            Left = 9
            Top = 65
            Width = 260
            Height = 83
            Caption = ' Filtro Para Seleção de Documentos '
            TabOrder = 2
            object CkbSelDoc: TCheckBox
              Left = 7
              Top = 31
              Width = 150
              Height = 17
              Caption = 'Formas de Pagamento'
              TabOrder = 0
            end
            object CkbPortForma: TCheckBox
              Left = 7
              Top = 14
              Width = 242
              Height = 17
              Caption = 'Contas Caixas X Formas de Pagamento'
              TabOrder = 1
            end
            object CkbAutorPag: TCheckBox
              Left = 7
              Top = 47
              Width = 241
              Height = 17
              Caption = 'Lista apenas documentos marcados'
              TabOrder = 2
            end
            object CkbCPMF: TCheckBox
              Left = 7
              Top = 64
              Width = 247
              Height = 17
              Caption = 'Lista também Documentos do tipo CPMF'
              TabOrder = 3
            end
          end
          object DblCodForma: TwwDBLookupCombo
            Left = 272
            Top = 83
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            LookupTable = QryFormadePagto
            LookupField = 'CODFORMA'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object CmbSisOrigem: TCMDBLookupCombo
            Left = 272
            Top = 125
            Width = 193
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEMODULO'#9'50'#9'NOMEMODULO')
            LookupTable = QryModulos
            LookupField = 'IDMODULO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object CmbTipoDocRecPag: TCMDBLookupCombo
            Left = 474
            Top = 83
            Width = 208
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            LookupTable = QryTipoDocRecPag
            LookupField = 'CODTIPDOC'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object TbsDocumentos: TTabSheet
        Caption = 'Documentos'
        object Panel5: TPanel
          Left = 0
          Top = 27
          Width = 769
          Height = 143
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 3
          Caption = 'Panel5'
          TabOrder = 0
          object dbgrdDocPendentes: TwwDBGrid
            Left = 116
            Top = 5
            Width = 648
            Height = 133
            Selected.Strings = (
              'NOME'#9'39'#9'Nome\Razão Social'
              'NODOCUMENTO'#9'15'#9'Documento'
              'COMPLDOCUMENTO'#9'5'#9'Comp'
              'DATAPROGRAMADA'#9'10'#9'Data Prog'
              'DATAVENCTO'#9'10'#9'Data Venc'
              'SALDO'#9'19'#9'Saldo')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            OnMultiSelectRecord = dbgrdDocPendentesMultiSelectRecord
            FixedCols = 0
            ShowHorzScrollBar = False
            Align = alClient
            DataSource = dsDocPendentes
            EditCalculated = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Small Fonts'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            UseTFields = False
            OnCalcCellColors = dbgrdDocPendentesCalcCellColors
            IndicatorColor = icBlack
          end
          object Panel9: TPanel
            Left = 5
            Top = 5
            Width = 111
            Height = 133
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object bbtnPgto: TBitBtn
              Left = 4
              Top = 6
              Width = 105
              Height = 28
              Caption = 'Total'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = bbtnPgtoClick
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777700000007777777777777777700000007777777777777777700000007777
                7777777777777000000077777777777777777000000070000000007777777000
                000070FFFFF0207777777000000070F77702200000077000000070FFF0222222
                22077000000070F88702200000077000000070FFFFF0207777777000000070F8
                8777007777777000000070FFFF00007777777000000070F88707077777777000
                000070FFFF007777777770000000700000077777777770000000777777777777
                777770000000}
              Layout = blGlyphRight
            end
            object bbtnPgtoParcial: TBitBtn
              Left = 4
              Top = 37
              Width = 105
              Height = 28
              Caption = 'Parcial'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnPgtoParcialClick
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777700000007777777777777777700000007777777777777777700000007777
                70000000007770000000777770FFFFF0207770000000777770F7770220000000
                0000777770FFF022222200000000777700F887022000000000007777090FFFF0
                207770000000000009908777007770000000099999990F000077700000000000
                099087070777700000007777090FFF0077777000000077770000000777777000
                0000777777777777777770000000777777777777777770000000777777777777
                777770000000}
              Layout = blGlyphRight
            end
          end
        end
        object PnlDocPendentes: TPanel
          Left = 0
          Top = 0
          Width = 769
          Height = 27
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Documentos Pendentes para pagamento'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 1
        end
        object SbStatusSelecao: TStatusBar
          Left = 0
          Top = 170
          Width = 769
          Height = 19
          Panels = <
            item
              Text = 'Documentos pendentes:'
              Width = 200
            end
            item
              Text = 'Valor total da seleção:'
              Width = 50
            end>
          SimplePanel = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 449
    Width = 787
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30035
      end
    end
  end
  inherited CPForCli: TCMProcuraForCli
    Left = 295
    Top = 44
    Width = 304
    Height = 48
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 365
    Top = 372
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsDocPendentes: TwwDataSource
    DataSet = qryDocPendentes
    Left = 232
    Top = 326
  end
  object qryDocPendentes: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryDocPendentesCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LANCTODOCUM.VLRLIQUIDO, (0)as SALDO,DOCUMENTO.IDFORCLI,DO' +
        'CUMENTO.OPERACAO,DOCUMENTO.CODDOCUMENTO,'
      
        'DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENT' +
        'O,DOCUMENTO.DATAPROGRAMADA,'
      
        'DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.RAZAOSOCIAL AS NOME' +
        ',DOCUMENTO.STATUS,'
      'DOCUMENTO.NUMLEITCODBARRAS, DOCUMENTO.NUMDIGCODBARRAS'
      'FROM DOCUMENTO,LANCTODOCUM,PESSOA WHERE (1=2)')
    UpdateObject = updsqlDocPendentes
    ValidateWithMask = True
    Left = 232
    Top = 282
    object qryDocPendentesNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryDocPendentesDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'DOCUMENTO.DATAPROGRAMADA'
    end
    object qryDocPendentesDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Size = 50
      Calculated = True
    end
    object qryDocPendentesDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object qryDocPendentesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 17
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryDocPendentesIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'DOCUMENTO.IDPESSOA'
      Visible = False
    end
    object qryDocPendentesNODOCUMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
    object qryDocPendentesCOMPLDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Visible = False
      Size = 3
    end
    object qryDocPendentesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
    object qryDocPendentesRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object qryDocPendentesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object qryDocPendentesIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryDocPendentesOPERACAO: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object qryDocPendentesNUMLEITCODBARRAS: TStringField
      FieldName = 'NUMLEITCODBARRAS'
      Size = 60
    end
    object qryDocPendentesNUMDIGCODBARRAS: TStringField
      FieldName = 'NUMDIGCODBARRAS'
      Size = 60
    end
    object qryDocPendentesVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsLoteXDocum: TwwDataSource
    DataSet = qryLoteXDocumento
    Left = 189
    Top = 326
  end
  object qryLoteXDocumento: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryLoteXDocumentoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select LOTEXDOCUM.NUMLOTE, LOTEXDOCUM.CODDOCUMENTO, LOTEXDOCUM.V' +
        'ALOR, '
      
        '       LOTEXDOCUM.CODBARRA, LOTEXDOCUM.CODBARRAVALOR, Pessoa.RAZ' +
        'AOSOCIAL AS nome,DOCUMENTO.DATAPROGRAMADA,'
      
        '       Documento.idpessoa,DOCUMENTO.DATAVENCTO,DOCUMENTO.NoDOCUM' +
        'ENTO,'
      
        '       DOCUMENTO.COMPLDOCUMENTO, DOCUMENTO.OPERACAO, DOCUMENTO.I' +
        'DFORCLI,'
      '       0 AS VLRLIQUIDO'
      'FROM LOTEXDOCUM,PESSOA,DOCUMENTO'
      'where  LOTEXDOCUM.numlote=0')
    UpdateObject = updsqlLoteXDocumento
    ValidateWithMask = True
    Left = 189
    Top = 282
    object qryLoteXDocumentoNOME: TStringField
      DisplayLabel = 'Nome\Razão Social'
      DisplayWidth = 39
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryLoteXDocumentoDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object qryLoteXDocumentoDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'LOTEPAGTO.IDPESSJUR'
    end
    object qryLoteXDocumentoNODOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object qryLoteXDocumentoCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Comp'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
      Size = 3
    end
    object qryLoteXDocumentoVALOR: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 20
      FieldName = 'VALOR'
      Origin = 'LOTEXDOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryLoteXDocumentoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Visible = False
      Size = 50
      Calculated = True
    end
    object qryLoteXDocumentoCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'LOTEXDOCUM.CODDOCUMENTO'
      Visible = False
    end
    object qryLoteXDocumentoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEXDOCUM.NUMLOTE'
      Visible = False
    end
    object qryLoteXDocumentoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'LOTEXDOCUM.CODBARRA'
      Size = 60
    end
    object qryLoteXDocumentoCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      Origin = 'LOTEXDOCUM.CODBARRAVALOR'
      Size = 60
    end
    object qryLoteXDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'DOCUMENTO.OPERACAO'
      Size = 2
    end
    object qryLoteXDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'DOCUMENTO.IDFORCLI'
    end
    object qryLoteXDocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryLoteXDocumentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object updsqlLoteXDocumento: TUpdateSQL
    ModifySQL.Strings = (
      'update LOTEXDOCUM'
      'set'
      '  NUMLOTE = :NUMLOTE,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  VALOR = :VALOR,'
      '  CODBARRA = :CODBARRA,'
      '  CODBARRAVALOR = :CODBARRAVALOR'
      'where'
      '  NUMLOTE = :OLD_NUMLOTE and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  VALOR = :OLD_VALOR')
    InsertSQL.Strings = (
      'insert into LOTEXDOCUM'
      '  (NUMLOTE, CODDOCUMENTO, VALOR, CODBARRA, CODBARRAVALOR)'
      'values'
      '  (:NUMLOTE, :CODDOCUMENTO, :VALOR, :CODBARRA, :CODBARRAVALOR)')
    DeleteSQL.Strings = (
      'delete from LOTEXDOCUM'
      'where'
      '  NUMLOTE = :OLD_NUMLOTE and'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO and'
      '  VALOR = :OLD_VALOR')
    Left = 189
    Top = 371
  end
  object qryDescPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  B.RAZAOSOCIAL, '
      '  PF.DESCRICAO, '
      '  PF.CODPORTFORMA, PF.IDTEMPLCHEQUE, PF.CODFORMA,'
      '  PF.FLGCHEQUEDIFERIDO, PF.FLGOBRIGAFAV  '
      'FROM '
      '  PORTADORFORMA PF, PORTADORCONTA PC, PESSOA B '
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 275
    Top = 326
    object qryDescPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryDescPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
    end
    object qryDescPortadorFormaIDTEMPLCHEQUE: TFloatField
      FieldName = 'IDTEMPLCHEQUE'
      Origin = 'PORTADORFORMA.IDTEMPLCHEQUE'
    end
    object qryDescPortadorFormaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryDescPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'PORTADORFORMA.CODFORMA'
    end
    object qryDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField
      FieldName = 'FLGCHEQUEDIFERIDO'
      Size = 1
    end
    object qryDescPortadorFormaFLGOBRIGAFAV: TStringField
      FieldName = 'FLGOBRIGAFAV'
      Origin = 'PORTADORFORMA.FLGOBRIGAFAV'
      Size = 1
    end
  end
  object dsLotePagto: TwwDataSource
    DataSet = qryLotePagto
    Left = 147
    Top = 326
  end
  object qryLotePagto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO,'
      '  NUMCHQBORDERO, FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, '
      '  OBSERVACAO, IDUSUARIOINCLUSAO, DATADIFERIDO'
      'FROM '
      '  LOTEPAGTO WHERE (1=2)')
    UpdateObject = updsqlLotePagto
    ValidateWithMask = True
    Left = 147
    Top = 282
    object qryLotePagtoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object qryLotePagtoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
    end
    object qryLotePagtoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'LOTEPAGTO.DATAEMISSAO'
    end
    object qryLotePagtoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      Origin = 'LOTEPAGTO.NUMCHQBORDERO'
      Size = 15
    end
    object qryLotePagtoFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Origin = 'LOTEPAGTO.FAVORECIDO'
      Size = 60
    end
    object qryLotePagtoFLAGEMISSAO: TStringField
      FieldName = 'FLAGEMISSAO'
      Origin = 'LOTEPAGTO.FLAGEMISSAO'
      Size = 1
    end
    object qryLotePagtoFLAGCANCEL: TStringField
      FieldName = 'FLAGCANCEL'
      Origin = 'LOTEPAGTO.FLAGCANCEL'
      Size = 1
    end
    object qryLotePagtoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'LOTEPAGTO.OBSERVACAO'
      Size = 80
    end
    object qryLotePagtoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object qryLotePagtoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object qryLotePagtoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = '"CM.LOTEPAGTO".IDPROCESSO'
    end
    object qryLotePagtoDATADIFERIDO: TDateTimeField
      FieldName = 'DATADIFERIDO'
    end
  end
  object updsqlLotePagto: TUpdateSQL
    ModifySQL.Strings = (
      'update LotePagto'
      'set'
      '  NUMLOTE = :NUMLOTE,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  NUMCHQBORDERO = :NUMCHQBORDERO,'
      '  FAVORECIDO = :FAVORECIDO,'
      '  FLAGEMISSAO = :FLAGEMISSAO,'
      '  FLAGCANCEL = :FLAGCANCEL,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  DATADIFERIDO = :DATADIFERIDO'
      'where'
      '  NUMLOTE = :OLD_NUMLOTE')
    InsertSQL.Strings = (
      'insert into LotePagto'
      
        '  (NUMLOTE, IDPESSOA, CODPORTFORMA, DATAEMISSAO, IDPROCESSO, NUM' +
        'CHQBORDERO, '
      
        '   FAVORECIDO, FLAGEMISSAO, FLAGCANCEL, OBSERVACAO, IDUSUARIOINC' +
        'LUSAO, '
      '   DATADIFERIDO)'
      'values'
      
        '  (:NUMLOTE, :IDPESSOA, :CODPORTFORMA, :DATAEMISSAO, :IDPROCESSO' +
        ', :NUMCHQBORDERO, '
      
        '   :FAVORECIDO, :FLAGEMISSAO, :FLAGCANCEL, :OBSERVACAO, :IDUSUAR' +
        'IOINCLUSAO, '
      '   :DATADIFERIDO)')
    DeleteSQL.Strings = (
      'delete from LotePagto'
      'where'
      '  NUMLOTE = :OLD_NUMLOTE')
    Left = 147
    Top = 371
  end
  object updsqlDocPendentes: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTO'
      'set'
      '  IDFORCLI = :IDFORCLI,'
      '  OPERACAO = :OPERACAO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDPESSOA = :IDPESSOA,'
      '  NODOCUMENTO = :NODOCUMENTO,'
      '  COMPLDOCUMENTO = :COMPLDOCUMENTO,'
      '  DATAPROGRAMADA = :DATAPROGRAMADA,'
      '  DATAVENCTO = :DATAVENCTO,'
      '  RECPAG = :RECPAG,'
      '  STATUS = :STATUS,'
      '  NUMLEITCODBARRAS = :NUMLEITCODBARRAS,'
      '  NUMDIGCODBARRAS = :NUMDIGCODBARRAS'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      
        '  (IDFORCLI, OPERACAO, CODDOCUMENTO, IDPESSOA, NODOCUMENTO, COMP' +
        'LDOCUMENTO, '
      
        '   DATAPROGRAMADA, DATAVENCTO, RECPAG, STATUS, NUMLEITCODBARRAS,' +
        ' NUMDIGCODBARRAS)'
      'values'
      
        '  (:IDFORCLI, :OPERACAO, :CODDOCUMENTO, :IDPESSOA, :NODOCUMENTO,' +
        ' :COMPLDOCUMENTO, '
      
        '   :DATAPROGRAMADA, :DATAVENCTO, :RECPAG, :STATUS, :NUMLEITCODBA' +
        'RRAS, :NUMDIGCODBARRAS)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 232
    Top = 371
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 318
    Top = 282
  end
  object QryNumlancto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  L.NUMLANCTO,L.DEBCRE'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO)')
    ValidateWithMask = True
    Left = 318
    Top = 372
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryNumlanctoNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = '"CM.LANCTODOCUM".NUMLANCTO'
    end
    object QryNumlanctoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = '"CM.LANCTODOCUM".DEBCRE'
      Size = 1
    end
  end
  object QryFormadePagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :RECPAG) AND'
      '               (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 275
    Top = 370
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object QryFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object QryFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryseladiantpendent: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  1'
      'FROM'
      '  DOCUMENTO D , LANCTODOCUM L'
      'WHERE'
      '      (D.IDFORCLI=:IDFORCLI)'
      '  AND (RTRIM(D.STATUS) <> '#39'2'#39')'
      '  AND (RTRIM(D.OPERACAO)= '#39'15'#39')'
      '  AND (L.ESTORNO IS NULL)  '
      '  AND (D.OPERACAO=L.OPERACAO)'
      '  AND (D.CODDOCUMENTO=L.CODDOCUMENTO)'
      '')
    ValidateWithMask = True
    Left = 275
    Top = 282
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
  end
  object QryModulos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMODULO, NOMEMODULO'
      'FROM'
      '  MODULO'
      'ORDER BY'
      '  NOMEMODULO')
    ValidateWithMask = True
    Left = 364
    Top = 326
    object QryModulosNOMEMODULO: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEMODULO'
      Origin = 'MODULO.NOMEMODULO'
      Size = 50
    end
    object QryModulosIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Origin = 'MODULO.IDMODULO'
      Visible = False
    end
  end
  object QryTipoDocRecPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT CODTIPDOC,DESCRICAO  FROM TIPODOCRECPAG a'
      '  WHERE a.RECPAG =  :recpag'
      '  and not exists (select 1 from UsuarioxTpdocto b where'
      '  b.idusuario=:idusuario and b.RECPAG = :recpag)'
      '  union SELECT CODTIPDOC,DESCRICAO FROM TIPODOCRECPAG a'
      '  WHERE a.RECPAG = :recpag and  exists'
      '  (select 1 from UsuarioxTpdocto b where a.codtipdoc=b.codtipdoc'
      
        '  and b.idusuario=:idusuario and b.RECPAG = :recpag) ORDER BY DE' +
        'SCRICAO'
      '')
    ValidateWithMask = True
    Left = 363
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'recpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'recpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'recpag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idusuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'recpag'
        ParamType = ptUnknown
      end>
    object QryTipoDocRecPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object QryTipoDocRecPagCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object QrySaldoLoteNaoEmitido: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  SUM(VALOR) AS VALORLOTE'
      'FROM'
      '  LOTEXDOCUM'
      'WHERE'
      '  (CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  ((FLGBAIXA IS NULL) OR (FLGBAIXA = '#39'N'#39'))')
    ValidateWithMask = True
    Left = 407
    Top = 282
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QrySaldoLoteNaoEmitidoVALORLOTE: TFloatField
      FieldName = 'VALORLOTE'
      Origin = 'LOTEXDOCUM.VALOR'
    end
  end
  object qryRateio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IDPROCESSO'
      'FROM'
      '((SELECT DISTINCT R.IDPROCESSO'
      ' FROM DOCUMENTO D, RATEIODOCUM R'
      ' WHERE (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (R.IDPROCESSO IS NOT NULL)'
      '   AND (D.OPERACAO = '#39'2 '#39')'
      '   AND (D.CODDOCUMENTO = :CODDOCUMENTO))'
      ' UNION ALL'
      '(SELECT DISTINCT R.IDPROCESSO'
      ' FROM RATEIODOCUM R,'
      '      (SELECT NUMFATURA FROM DOCUMENTO'
      '        WHERE (CODDOCUMENTO = :CODDOCUMENTO)'
      '          AND (OPERACAO = '#39'3 '#39')) D3,'
      '      DOCUMENTO D1'
      ' WHERE (D1.CODDOCUMENTO = R.CODDOCUMENTO)'
      '   AND (R.IDPROCESSO IS NOT NULL)'
      '   AND (D1.OPERACAO = '#39'1 '#39')'
      '   AND (D1.NUMFATURA = D3.NUMFATURA)))'
      ''
      '')
    ValidateWithMask = True
    Left = 430
    Top = 328
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
end
