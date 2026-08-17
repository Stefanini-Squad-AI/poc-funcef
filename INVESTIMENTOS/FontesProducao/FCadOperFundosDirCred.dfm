inherited FrmCadOperFundosDirCred: TFrmCadOperFundosDirCred
  Left = 16
  Top = 129
  HelpContext = 790233
  Caption = 'Lançamentos'
  ClientHeight = 473
  ClientWidth = 793
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    Height = 387
    inherited Bevel2: TBevel
      Width = 791
    end
    inherited pnlTitulo: TPanel
      Width = 791
      inherited lbNomItem: TfcLabel
        Width = 449
        Caption = 'Operação em Fundos de Direitos Creditórios'
      end
    end
    object PnlSelecao: TPanel
      Left = 1
      Top = 45
      Width = 791
      Height = 52
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 13
        Top = 7
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label7: TLabel
        Left = 157
        Top = 7
        Width = 83
        Height = 13
        Caption = 'Tipo de Fundo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 427
        Top = 7
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DtEdDataReferenciaGeral: TCMDateTimePicker
        Left = 14
        Top = 22
        Width = 121
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
        TabOrder = 0
        OnExit = DtEdDataReferenciaGeralExit
      end
      object DblTipoFundo: TwwDBLookupCombo
        Left = 157
        Top = 22
        Width = 250
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOFUNDOINV'#9'30'#9'Descrição'#9'F')
        LookupTable = QryTipoFundo
        LookupField = 'IDTIPOFUNDOINVEST'
        Options = [loColLines, loRowLines]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DblTipoFundoCloseUp
        OnExit = DblTipoFundoExit
      end
      object dblGestorCarteira: TwwDBLookupCombo
        Left = 429
        Top = 22
        Width = 345
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = qryGestorCart
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loColLines, loRowLines]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblGestorCarteiraCloseUp
      end
    end
    object PnlDetalhe: TPanel
      Left = 1
      Top = 97
      Width = 791
      Height = 289
      Align = alClient
      TabOrder = 2
      object PgcSaldos: TPageControl
        Left = 1
        Top = 1
        Width = 789
        Height = 287
        ActivePage = TbsResgate
        Align = alClient
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TbsAplicacao: TTabSheet
          Caption = '&Aplicação/Subscrição'
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 781
            Height = 259
            ActivePage = TbSheet
            Align = alClient
            TabOrder = 0
            object TbSheet: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object DbGrdAplicacao: TwwDBGrid
                Left = 0
                Top = 56
                Width = 688
                Height = 193
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'30'#9'Fundo'
                  'DESCTIPOCOTA'#9'15'#9'Tipo de Cota'
                  'IDBOLETA'#9'10'#9'Boleta'
                  'DATAOPERACAO'#9'10'#9'Operação'
                  'DATACOTIZACAO'#9'10'#9'Cotização'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'
                  'VLROPERACAO'#9'16'#9'Valor Aplicado'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsAplicacao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 1
                TitleAlignment = taCenter
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icYellow
              end
              object pnlAplicacao: TPanel
                Left = 0
                Top = 56
                Width = 688
                Height = 193
                Align = alClient
                BevelInner = bvLowered
                BevelOuter = bvNone
                TabOrder = 4
                object pgcAplicacao: TPageControl
                  Left = 1
                  Top = 1
                  Width = 686
                  Height = 191
                  ActivePage = tbsDadosApl
                  Align = alClient
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  MultiLine = True
                  ParentFont = False
                  TabOrder = 0
                  TabPosition = tpRight
                  object tbsDadosApl: TTabSheet
                    Caption = 'Dados'
                    object Panel3: TPanel
                      Left = 0
                      Top = 0
                      Width = 661
                      Height = 181
                      Align = alClient
                      BevelOuter = bvLowered
                      TabOrder = 0
                      object Label29: TLabel
                        Left = 406
                        Top = 132
                        Width = 65
                        Height = 13
                        Caption = 'Corretagem'
                      end
                      object Label17: TLabel
                        Left = 117
                        Top = 4
                        Width = 130
                        Height = 13
                        Caption = 'Fundo de Investimento'
                      end
                      object Label18: TLabel
                        Left = 5
                        Top = 132
                        Width = 83
                        Height = 13
                        Caption = 'Valor Aplicado'
                      end
                      object Label19: TLabel
                        Left = 509
                        Top = 4
                        Width = 84
                        Height = 13
                        Caption = 'Cota do Fundo'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clNavy
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label20: TLabel
                        Left = 509
                        Top = 90
                        Width = 118
                        Height = 13
                        Caption = 'Quantidade Operada'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clNavy
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label25: TLabel
                        Left = 5
                        Top = 4
                        Width = 96
                        Height = 13
                        Caption = 'Dt. da Aplicação'
                      end
                      object Label26: TLabel
                        Left = 5
                        Top = 90
                        Width = 102
                        Height = 13
                        Caption = 'Dt. da Liquidação'
                      end
                      object Label15: TLabel
                        Left = 123
                        Top = 90
                        Width = 96
                        Height = 13
                        Caption = 'Dt. da Cotização'
                      end
                      object Label22: TLabel
                        Left = 277
                        Top = 132
                        Width = 108
                        Height = 13
                        Caption = 'Tx. e Emolumentos'
                      end
                      object Label30: TLabel
                        Left = 135
                        Top = 132
                        Width = 113
                        Height = 13
                        Caption = 'Cotação Negociada'
                      end
                      object Label31: TLabel
                        Left = 524
                        Top = 132
                        Width = 63
                        Height = 13
                        Caption = 'Valor Total'
                      end
                      object Label21: TLabel
                        Left = 5
                        Top = 46
                        Width = 74
                        Height = 13
                        Caption = 'Tipo de Cota'
                      end
                      object Label27: TLabel
                        Left = 183
                        Top = 46
                        Width = 103
                        Height = 13
                        Caption = 'Tipo de Operação'
                      end
                      object lblVariacao: TLabel
                        Left = 509
                        Top = 46
                        Width = 51
                        Height = 13
                        Caption = 'Variação'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clNavy
                        Font.Height = -9
                        Font.Name = 'MS Sans Serif'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object Label38: TLabel
                        Left = 240
                        Top = 90
                        Width = 106
                        Height = 13
                        Caption = 'Dt. de Vencimento'
                      end
                      object Label39: TLabel
                        Left = 358
                        Top = 90
                        Width = 37
                        Height = 13
                        Caption = 'Boleta'
                      end
                      object DbEdCorretagemApl: TDBRealEdit
                        Left = 406
                        Top = 147
                        Width = 110
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 14
                        WordWrap = False
                        OnExit = DbEdCorretagemAplExit
                        IntDigits = 17
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'VLRCORRETAGEM'
                        DataSource = DsAplicacao
                      end
                      object DbEdCotaNegApl: TDBRealEdit
                        Left = 135
                        Top = 147
                        Width = 135
                        Height = 21
                        Alignment = taRightJustify
                        Color = clWhite
                        Lines.Strings = (
                          '0,00000000')
                        TabOrder = 12
                        WordWrap = False
                        OnExit = DbEdCotaNegAplExit
                        IntDigits = 17
                        DecDigits = 8
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'VLRCOTA'
                        DataSource = DsAplicacao
                      end
                      object DbLkcFundoInvest: TwwDBLookupCombo
                        Left = 117
                        Top = 20
                        Width = 383
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
                        DataField = 'IDFUNDOINVEST'
                        DataSource = DsAplicacao
                        LookupTable = QryFundoInvestAplic
                        LookupField = 'IDFUNDOINVEST'
                        Options = [loRowLines, loTitles]
                        TabOrder = 1
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = True
                        ShowMatchText = True
                        OnCloseUp = DbLkcFundoInvestCloseUp
                        OnExit = DbLkcFundoInvestExit
                      end
                      object DbEdValorApl: TDBRealEdit
                        Left = 5
                        Top = 147
                        Width = 122
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 11
                        WordWrap = False
                        OnExit = DbEdValorAplExit
                        IntDigits = 17
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'VLROPERACAO'
                        DataSource = DsAplicacao
                      end
                      object DbEdCota: TDBRealEdit
                        Left = 509
                        Top = 20
                        Width = 140
                        Height = 21
                        Alignment = taRightJustify
                        Color = clMenu
                        Enabled = False
                        Lines.Strings = (
                          '       0,00000000')
                        TabOrder = 2
                        WordWrap = False
                        IntDigits = 17
                        DecDigits = 8
                        NumberFormat = fNumber
                        Signal = False
                      end
                      object DbEdQtdOper: TDBRealEdit
                        Left = 509
                        Top = 105
                        Width = 140
                        Height = 21
                        Alignment = taRightJustify
                        Color = clMenu
                        Enabled = False
                        Lines.Strings = (
                          '0,000000000')
                        TabOrder = 10
                        WordWrap = False
                        IntDigits = 17
                        DecDigits = 9
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'QTDOPERACAO'
                        DataSource = DsAplicacao
                      end
                      object DbDtDataAplicacao: TCMDateTimePicker
                        Left = 5
                        Top = 20
                        Width = 105
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DATAOPERACAO'
                        DataSource = DsAplicacao
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
                      object DbDtDataLiquidacao: TCMDateTimePicker
                        Left = 5
                        Top = 105
                        Width = 105
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DATALIQUIDACAO'
                        DataSource = DsAplicacao
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
                        TabOrder = 6
                      end
                      object DbDtDataCotizacaoAplic: TCMDateTimePicker
                        Left = 123
                        Top = 105
                        Width = 105
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DATACOTIZACAO'
                        DataSource = DsAplicacao
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
                        TabOrder = 7
                      end
                      object DbEdTaxasEmolApl: TDBRealEdit
                        Left = 277
                        Top = 147
                        Width = 122
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 13
                        WordWrap = False
                        OnExit = DbEdTaxasEmolAplExit
                        IntDigits = 17
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'VLRTAXAS'
                        DataSource = DsAplicacao
                      end
                      object DbEdValorTotalApl: TDBRealEdit
                        Left = 523
                        Top = 147
                        Width = 126
                        Height = 21
                        Alignment = taRightJustify
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 15
                        WordWrap = False
                        IntDigits = 17
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                        DataField = 'VALORTOTAL'
                        DataSource = DsAplicacao
                      end
                      object DbLkcTipoCotaApl: TwwDBLookupCombo
                        Left = 5
                        Top = 62
                        Width = 170
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
                        DataField = 'IDTIPOCOTA'
                        DataSource = DsAplicacao
                        LookupTable = QryTipoCotaApl
                        LookupField = 'IDTIPOCOTA'
                        Options = [loRowLines, loTitles]
                        TabOrder = 3
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                        ShowMatchText = True
                        OnCloseUp = DbLkcTipoCotaAplCloseUp
                        OnExit = DbLkcTipoCotaAplExit
                      end
                      object DbLkcTipoOperacao: TwwDBLookupCombo
                        Left = 183
                        Top = 62
                        Width = 317
                        Height = 21
                        DropDownAlignment = taLeftJustify
                        Selected.Strings = (
                          'DESCTIPOOPERACAO'#9'30'#9'Descrição'#9'F')
                        DataField = 'IDTIPOOPERACAO'
                        DataSource = DsAplicacao
                        LookupTable = QryTipoOperacao
                        LookupField = 'IDTIPOOPERACAO'
                        Options = [loRowLines, loTitles]
                        TabOrder = 4
                        AutoDropDown = True
                        ShowButton = True
                        AllowClearKey = False
                        ShowMatchText = True
                      end
                      object dbreVariacao: TDBRealEdit
                        Left = 509
                        Top = 62
                        Width = 140
                        Height = 21
                        Alignment = taRightJustify
                        Color = clMenu
                        Enabled = False
                        Lines.Strings = (
                          '0,00')
                        TabOrder = 5
                        WordWrap = False
                        IntDigits = 17
                        DecDigits = 2
                        NumberFormat = fNumber
                        Signal = False
                      end
                      object DbDtDataVencAplic: TCMDateTimePicker
                        Left = 240
                        Top = 105
                        Width = 105
                        Height = 21
                        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                        CalendarAttributes.Font.Color = clWindowText
                        CalendarAttributes.Font.Height = -11
                        CalendarAttributes.Font.Name = 'MS Sans Serif'
                        CalendarAttributes.Font.Style = []
                        ButtonStyle = cbsCustom
                        DataField = 'DATAVENCIMENTO'
                        DataSource = DsAplicacao
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
                        TabOrder = 8
                      end
                      object dbeBoleta: TwwDBEdit
                        Left = 358
                        Top = 105
                        Width = 130
                        Height = 21
                        DataField = 'IDBOLETA'
                        DataSource = DsAplicacao
                        MaxLength = 18
                        TabOrder = 9
                        UnboundDataType = wwDefault
                        WantReturns = False
                        WordWrap = False
                      end
                    end
                  end
                  object tbsObsApl: TTabSheet
                    Caption = 'Observação'
                    ImageIndex = 1
                    object pnlObsAplic: TPanel
                      Left = 0
                      Top = 0
                      Width = 661
                      Height = 181
                      Align = alClient
                      BevelOuter = bvNone
                      TabOrder = 0
                      object dbeObsApl: TDBMemo
                        Left = 0
                        Top = 0
                        Width = 661
                        Height = 181
                        Align = alClient
                        DataField = 'OBSERVACAO'
                        DataSource = DsAplicacao
                        MaxLength = 300
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
              object Dock977: TDock97
                Left = 0
                Top = 25
                Width = 773
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar974: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncAplic: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir novo registro|'
                    AllowAllUp = True
                    GroupIndex = 1
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
                    OnClick = BtIncAplicClick
                  end
                  object BtAltAplic: TSpeedButton
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
                  end
                  object BtExcAplic: TSpeedButton
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
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
                    OnClick = BtExcAplicClick
                  end
                end
              end
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 773
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                BevelOuter = bvNone
                Caption = 'Aplicação'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object Dock978: TDock97
                Left = 688
                Top = 56
                Width = 85
                Height = 193
                AllowDrag = False
                BoundLines = [blLeft]
                Position = dpRight
                Visible = False
                object Toolbar975: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97Detalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtOkAplic: TBitBtn
                    Left = 0
                    Top = 0
                    Width = 80
                    Height = 27
                    Caption = '&OK'
                    Default = True
                    Enabled = False
                    TabOrder = 0
                    OnClick = BtOkAplicClick
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
                  object BtCancAplic: TBitBtn
                    Left = 0
                    Top = 27
                    Width = 80
                    Height = 28
                    Cancel = True
                    Caption = '&Cancelar'
                    Enabled = False
                    TabOrder = 1
                    OnClick = BtCancAplicClick
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
                  object BtVoltaAplic: TBitBtn
                    Left = 0
                    Top = 55
                    Width = 80
                    Height = 27
                    Cancel = True
                    Caption = '&Voltar'
                    Enabled = False
                    TabOrder = 2
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
          end
        end
        object TbsResgate: TTabSheet
          Caption = '&Resgate'
          object PageControl1: TPageControl
            Left = 0
            Top = 0
            Width = 781
            Height = 259
            ActivePage = TabSheet1
            Align = alClient
            TabOrder = 0
            object TabSheet1: TTabSheet
              Caption = 'Informações Contábeis '
              TabVisible = False
              object DbGrdrResgate: TwwDBGrid
                Left = 0
                Top = 56
                Width = 773
                Height = 193
                Selected.Strings = (
                  'DESCFUNDOINVEST'#9'30'#9'Fundo'
                  'DESCTIPOCOTA'#9'16'#9'Tipo de Cota'
                  'IDPEDIDOFUNDO'#9'6'#9'Boleta'
                  'DATAPEDIDO'#9'10'#9'Operação'
                  'DATACOTIZACAO'#9'10'#9'Cotização'
                  'DATALIQUIDACAO'#9'10'#9'Liquidação'
                  'VLRPEDIDO'#9'18'#9'Valor da Operação')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
                Align = alClient
                Color = clWhite
                DataSource = DsResgate
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                KeyOptions = []
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 3
                TitleAlignment = taCenter
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                IndicatorColor = icYellow
              end
              object pnlResgate: TPanel
                Left = 0
                Top = 56
                Width = 773
                Height = 193
                Align = alClient
                BevelOuter = bvLowered
                TabOrder = 1
                object Label13: TLabel
                  Left = 7
                  Top = 89
                  Width = 107
                  Height = 13
                  Caption = 'Valor da Operação'
                end
                object Label23: TLabel
                  Left = 7
                  Top = 5
                  Width = 105
                  Height = 13
                  Caption = 'Data da Operação'
                end
                object Label24: TLabel
                  Left = 255
                  Top = 48
                  Width = 112
                  Height = 13
                  Caption = 'Data da Liquidação'
                end
                object Label12: TLabel
                  Left = 118
                  Top = 5
                  Width = 130
                  Height = 13
                  Caption = 'Fundo de Investimento'
                end
                object Label28: TLabel
                  Left = 534
                  Top = 89
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Saldo Sintético'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label4: TLabel
                  Left = 178
                  Top = 89
                  Width = 84
                  Height = 13
                  Caption = 'Cota do Fundo'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clNavy
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 384
                  Top = 48
                  Width = 106
                  Height = 13
                  Caption = 'Data da Cotização'
                end
                object Label32: TLabel
                  Left = 355
                  Top = 89
                  Width = 113
                  Height = 13
                  Caption = 'Cotação Negociada'
                end
                object Label35: TLabel
                  Left = 355
                  Top = 129
                  Width = 65
                  Height = 13
                  Caption = 'Corretagem'
                end
                object Label36: TLabel
                  Left = 534
                  Top = 129
                  Width = 63
                  Height = 13
                  Caption = 'Valor Total'
                end
                object Label6: TLabel
                  Left = 7
                  Top = 47
                  Width = 74
                  Height = 13
                  Caption = 'Tipo de Cota'
                end
                object Label34: TLabel
                  Left = 178
                  Top = 129
                  Width = 124
                  Height = 13
                  Caption = 'Taxas e Emolumentos'
                end
                object Label37: TLabel
                  Left = 7
                  Top = 129
                  Width = 122
                  Height = 13
                  Caption = 'Taxa de Performance'
                end
                object DbRValorLiquido: TDBRealEdit
                  Left = 7
                  Top = 104
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 5
                  WordWrap = False
                  OnExit = DbRValorLiquidoExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRPEDIDO'
                  DataSource = DsResgate
                end
                object dbDDataOperacao: TCMDateTimePicker
                  Left = 7
                  Top = 20
                  Width = 100
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAPEDIDO'
                  DataSource = DsResgate
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
                object dbDDataLiquidacaoResg: TCMDateTimePicker
                  Left = 255
                  Top = 63
                  Width = 112
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
                  DataSource = DsResgate
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
                object DbLkcFundoInvestResg: TwwDBLookupCombo
                  Left = 118
                  Top = 20
                  Width = 377
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
                  DataField = 'IDFUNDOINVEST'
                  DataSource = DsResgate
                  LookupTable = QryFundoInvestResg
                  LookupField = 'IDFUNDOINVEST'
                  Options = [loRowLines, loTitles]
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = DbLkcFundoInvestResgCloseUp
                  OnExit = DbLkcFundoInvestResgExit
                end
                object Dock974: TDock97
                  Left = 687
                  Top = 1
                  Width = 85
                  Height = 191
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  Visible = False
                  object Toolbar973: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object BtOkResg: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 80
                      Height = 27
                      Caption = '&OK'
                      Default = True
                      Enabled = False
                      TabOrder = 0
                      OnClick = BtOkResgClick
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
                    object BtCancResg: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 80
                      Height = 28
                      Cancel = True
                      Caption = '&Cancelar'
                      Enabled = False
                      TabOrder = 1
                      OnClick = BtCancResgClick
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
                    object BtVoltaResg: TBitBtn
                      Left = 0
                      Top = 55
                      Width = 80
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      Enabled = False
                      TabOrder = 2
                      OnClick = BtCancResgClick
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
                object rVlrBruto: TDBRealEdit
                  Left = 534
                  Top = 104
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '      0,00')
                  TabOrder = 8
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'SALDOVLRFUNDO'
                  DataSource = dsSaldoFundoTotal
                end
                object DbEdCotaResg: TDBRealEdit
                  Left = 178
                  Top = 104
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Color = clMenu
                  Enabled = False
                  Lines.Strings = (
                    '       0,00000000')
                  TabOrder = 6
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                end
                object DbDtDataCotizacaoResg: TCMDateTimePicker
                  Left = 384
                  Top = 63
                  Width = 112
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATACOTIZACAO'
                  DataSource = DsResgate
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
                object DbEdCotaNegResg: TDBRealEdit
                  Left = 355
                  Top = 104
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Color = clWhite
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 7
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCOTA'
                  DataSource = DsResgate
                end
                object DbEdTaxasEmolResg: TDBRealEdit
                  Left = 178
                  Top = 144
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 10
                  WordWrap = False
                  OnExit = DbRValorLiquidoExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTAXAS'
                  DataSource = DsResgate
                end
                object DbEdCorretagemResg: TDBRealEdit
                  Left = 355
                  Top = 144
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 11
                  WordWrap = False
                  OnExit = DbRValorLiquidoExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRCORRETAGEM'
                  DataSource = DsResgate
                end
                object DbEdValorTotalReg: TDBRealEdit
                  Left = 534
                  Top = 144
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 12
                  WordWrap = False
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VALORTOTAL'
                  DataSource = DsResgate
                end
                object DbLkcTipoCotaResg: TwwDBLookupCombo
                  Left = 7
                  Top = 62
                  Width = 235
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
                  DataField = 'IDTIPOCOTA'
                  DataSource = DsResgate
                  LookupTable = QryTipoCotaResg
                  LookupField = 'IDTIPOCOTA'
                  Options = [loRowLines, loTitles]
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnCloseUp = DbLkcTipoCotaResgCloseUp
                  OnExit = DbLkcTipoCotaResgExit
                end
                object DbEdTaxaPerfor: TDBRealEdit
                  Left = 7
                  Top = 144
                  Width = 140
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 9
                  WordWrap = False
                  OnExit = DbRValorLiquidoExit
                  IntDigits = 17
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLRTAXAPERF'
                  DataSource = DsResgate
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 773
                Height = 25
                Align = alTop
                BevelInner = bvLowered
                BevelOuter = bvNone
                Caption = 'Resgate'
                Color = clNavy
                Font.Charset = ANSI_CHARSET
                Font.Color = clWhite
                Font.Height = -19
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object Dock973: TDock97
                Left = 0
                Top = 25
                Width = 773
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar972: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object BtIncResg: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir novo registro|'
                    AllowAllUp = True
                    GroupIndex = 1
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
                    OnClick = BtIncResgClick
                  end
                  object BtAltResg: TSpeedButton
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
                  end
                  object BtExcResg: TSpeedButton
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir o registro selecionado|'
                    AllowAllUp = True
                    GroupIndex = 1
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
                    OnClick = BtExcResgClick
                  end
                end
              end
            end
          end
        end
        object tbsVenda: TTabSheet
          Caption = 'Venda'
          ImageIndex = 3
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 56
            Width = 781
            Height = 203
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'30'#9'Fundo'
              'DESCTIPOCOTA'#9'16'#9'Tipo de Cota'
              'IDPEDIDOFUNDO'#9'6'#9'Boleta'
              'DATAPEDIDO'#9'10'#9'Operação'
              'DATACOTIZACAO'#9'10'#9'Cotização'
              'DATALIQUIDACAO'#9'10'#9'Liquidação'
              'VLRPEDIDO'#9'18'#9'Valor da Operação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            Color = clWhite
            DataSource = DsResgate
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 4
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
          object dbgGridVenda: TwwDBGrid
            Left = 0
            Top = 56
            Width = 781
            Height = 203
            Selected.Strings = (
              'DESCFUNDOINVEST'#9'30'#9'Fundo'#9'F'
              'DESCTIPOCOTA'#9'14'#9'Tipo de Cota'#9'F'
              'IDPEDIDOFUNDO'#9'10'#9'Boleta'#9'F'
              'DATAPEDIDO'#9'10'#9'Operação'#9'F'
              'DATACOTIZACAO'#9'10'#9'Cotização'#9'F'
              'DATALIQUIDACAO'#9'10'#9'Liquidação'#9'F'
              'VLRPEDIDO'#9'18'#9'Valor da Operação'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
            Align = alClient
            Color = clWhite
            DataSource = dsVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            KeyOptions = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icYellow
          end
          object pnlVenda: TPanel
            Left = 0
            Top = 56
            Width = 781
            Height = 203
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 1
            object lblVlrOperVenda: TLabel
              Left = 7
              Top = 90
              Width = 107
              Height = 13
              Caption = 'Valor da Operação'
            end
            object lblDtOperVenda: TLabel
              Left = 7
              Top = 4
              Width = 105
              Height = 13
              Caption = 'Data da Operação'
            end
            object lblDtLiqVenda: TLabel
              Left = 463
              Top = 46
              Width = 112
              Height = 13
              Caption = 'Data da Liquidação'
            end
            object lblFundoInvestVenda: TLabel
              Left = 137
              Top = 4
              Width = 130
              Height = 13
              Caption = 'Fundo de Investimento'
            end
            object lblCotaFdoVenda: TLabel
              Left = 188
              Top = 90
              Width = 84
              Height = 13
              Caption = 'Cota do Fundo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblCotaNegVenda: TLabel
              Left = 335
              Top = 90
              Width = 113
              Height = 13
              Caption = 'Cotação Negociada'
            end
            object Label46: TLabel
              Left = 335
              Top = 132
              Width = 65
              Height = 13
              Caption = 'Corretagem'
            end
            object lblVlrLiqVenda: TLabel
              Left = 463
              Top = 132
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object lblTipoCotaVenda: TLabel
              Left = 7
              Top = 46
              Width = 74
              Height = 13
              Caption = 'Tipo de Cota'
            end
            object Label49: TLabel
              Left = 188
              Top = 132
              Width = 124
              Height = 13
              Caption = 'Taxas e Emolumentos'
            end
            object Label50: TLabel
              Left = 7
              Top = 132
              Width = 122
              Height = 13
              Caption = 'Taxa de Performance'
            end
            object lblDtCotVenda: TLabel
              Left = 583
              Top = 46
              Width = 106
              Height = 13
              Caption = 'Data da Cotização'
            end
            object lblContraParteVenda: TLabel
              Left = 191
              Top = 46
              Width = 67
              Height = 13
              Caption = 'Contraparte'
            end
            object dbeVlrOperVenda: TDBRealEdit
              Left = 7
              Top = 105
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              OnExit = dbeVlrOperVendaExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPEDIDO'
              DataSource = dsVenda
            end
            object dtOperVenda: TCMDateTimePicker
              Left = 7
              Top = 20
              Width = 119
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPEDIDO'
              DataSource = dsVenda
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
            object dtLiqVenda: TCMDateTimePicker
              Left = 463
              Top = 62
              Width = 111
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALIQUIDACAO'
              DataSource = dsVenda
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
            object dblkFundoInvestVenda: TwwDBLookupCombo
              Left = 137
              Top = 20
              Width = 437
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDFUNDOINVEST'
              DataSource = dsVenda
              LookupTable = qryFundoInvestVenda
              LookupField = 'IDFUNDOINVEST'
              Options = [loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblkFundoInvestVendaCloseUp
              OnExit = dblkFundoInvestVendaExit
            end
            object Dock976: TDock97
              Left = 695
              Top = 1
              Width = 85
              Height = 201
              AllowDrag = False
              BoundLines = [blLeft]
              Position = dpRight
              Visible = False
              object Toolbar977: TToolbar97
                Left = 0
                Top = 0
                Caption = 'tb97Detalhe'
                DockPos = 0
                TabOrder = 0
                object btOkVenda: TBitBtn
                  Left = 0
                  Top = 0
                  Width = 80
                  Height = 27
                  Caption = '&OK'
                  Default = True
                  Enabled = False
                  TabOrder = 0
                  OnClick = btOkVendaClick
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
                object btCancVenda: TBitBtn
                  Left = 0
                  Top = 27
                  Width = 80
                  Height = 28
                  Cancel = True
                  Caption = '&Cancelar'
                  Enabled = False
                  TabOrder = 1
                  OnClick = btCancVendaClick
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
                object btVoltaVenda: TBitBtn
                  Left = 0
                  Top = 55
                  Width = 80
                  Height = 27
                  Cancel = True
                  Caption = '&Voltar'
                  Enabled = False
                  TabOrder = 2
                  OnClick = btCancVendaClick
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
            object edCotaFdoVenda: TDBRealEdit
              Left = 188
              Top = 105
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '       0,00000000')
              TabOrder = 7
              WordWrap = False
              IntDigits = 17
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
            end
            object edCotaFdoNegVenda: TDBRealEdit
              Left = 335
              Top = 105
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Color = clWhite
              Lines.Strings = (
                '0,00000000')
              TabOrder = 8
              WordWrap = False
              IntDigits = 17
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = dsVenda
            end
            object dbreTxEmolVenda: TDBRealEdit
              Left = 188
              Top = 147
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbeVlrOperVendaExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRTAXAS'
              DataSource = dsVenda
            end
            object dbreTxCorretVenda: TDBRealEdit
              Left = 335
              Top = 147
              Width = 120
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              OnExit = dbeVlrOperVendaExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCORRETAGEM'
              DataSource = dsVenda
            end
            object dbreVlrLiqVenda: TDBRealEdit
              Left = 463
              Top = 147
              Width = 160
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 12
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORTOTAL'
              DataSource = dsVenda
            end
            object dblkTipoCotaVenda: TwwDBLookupCombo
              Left = 7
              Top = 62
              Width = 176
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOCOTA'#9'30'#9'Descrição'#9'F')
              DataField = 'IDTIPOCOTA'
              DataSource = dsVenda
              LookupTable = qryTipoCotaVenda
              LookupField = 'IDTIPOCOTA'
              Options = [loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblkTipoCotaVendaCloseUp
              OnExit = dblkTipoCotaVendaExit
            end
            object dbreTxPerformVenda: TDBRealEdit
              Left = 7
              Top = 147
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              OnExit = dbeVlrOperVendaExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRTAXAPERF'
              DataSource = dsVenda
            end
            object dtCotVenda: TCMDateTimePicker
              Left = 581
              Top = 62
              Width = 107
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOTIZACAO'
              DataSource = dsVenda
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
            object dblkContraParteVenda: TwwDBLookupCombo
              Left = 190
              Top = 62
              Width = 267
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Descrição'#9'F')
              LookupTable = qryContraParteVenda
              LookupField = 'IDPESSOA'
              Options = [loRowLines, loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblkContraParteVendaCloseUp
              OnExit = dblkContraParteVendaExit
            end
          end
          object Dock975: TDock97
            Left = 0
            Top = 25
            Width = 781
            Height = 31
            AllowDrag = False
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar976: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object btIncVenda: TSpeedButton
                Left = 0
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Inserir novo registro|'
                AllowAllUp = True
                GroupIndex = 1
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
                OnClick = btIncVendaClick
              end
              object btAltVenda: TSpeedButton
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
              end
              object btExcVenda: TSpeedButton
                Left = 50
                Top = 0
                Width = 25
                Height = 25
                Hint = 'Excluir o registro selecionado|'
                AllowAllUp = True
                GroupIndex = 1
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
                OnClick = btExcVendaClick
              end
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvNone
            Caption = 'Venda'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object TbsSaldo: TTabSheet
          Caption = '&Saldo'
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 781
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvNone
            Caption = 'Saldo dos Fundos'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 0
            Top = 25
            Width = 781
            Height = 43
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label3: TLabel
              Left = 6
              Top = 2
              Width = 64
              Height = 13
              Caption = 'Data Saldo'
            end
            object Label14: TLabel
              Left = 130
              Top = 2
              Width = 134
              Height = 13
              Caption = 'Fundo de Investimento '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 464
              Top = 1
              Width = 74
              Height = 13
              Caption = 'Tipo de Cota'
            end
            object DbLkcFundoSaldo: TwwDBLookupCombo
              Left = 130
              Top = 17
              Width = 321
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              LookupTable = QryFundoInvestSld
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = DbLkcFundoSaldoExit
            end
            object DbDtRefSaldo: TCMDateTimePicker
              Left = 6
              Top = 17
              Width = 113
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
              TabOrder = 1
              OnExit = DbDtRefSaldoExit
            end
            object DBLTipoCota: TwwDBLookupCombo
              Left = 464
              Top = 17
              Width = 304
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOCOTA'#9'40'#9'Tipo de Cota'#9'F')
              LookupTable = QryTipoCotaSld
              LookupField = 'IDTIPOCOTA'
              Options = [loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = DBLTipoCotaCloseUp
            end
          end
          object pnlTotais: TPanel
            Left = 0
            Top = 214
            Width = 781
            Height = 45
            Align = alBottom
            Caption = ' '
            TabOrder = 2
            object Label1: TLabel
              Left = 135
              Top = 2
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quantidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 283
              Top = 2
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Bruto'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 579
              Top = 2
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'IRRF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 453
              Top = 2
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'IOF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 673
              Top = 2
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor Líquido'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBReQtd: TDBRealEdit
              Left = 33
              Top = 19
              Width = 168
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,000000000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOQTDCOTAS'
              DataSource = dsSaldoFundoTotal
            end
            object DBReBruto: TDBRealEdit
              Left = 202
              Top = 19
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOVLRFUNDO'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIRRF: TDBRealEdit
              Left = 475
              Top = 19
              Width = 134
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIRPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReIOF: TDBRealEdit
              Left = 348
              Top = 19
              Width = 126
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIOFPROV'
              DataSource = dsSaldoFundoTotal
            end
            object DBReLiq: TDBRealEdit
              Left = 610
              Top = 19
              Width = 139
              Height = 21
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SALDOLIQUIDO'
              DataSource = dsSaldoFundoTotal
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 68
            Width = 781
            Height = 146
            Align = alClient
            TabOrder = 3
            object dbGrdSaldos: TwwDBGrid
              Left = 1
              Top = 1
              Width = 778
              Height = 144
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'45'#9'Fundos'
                'DESCTIPOCOTA'#9'18'#9'Tipo Cota'#9'F'
                'DATAAPLICACAO'#9'10'#9'Aplicação'
                'DATAMOVFUNDO'#9'10'#9'Data Cota'
                'SALDOQTDCOTAS'#9'20'#9'Quantidade'
                'VLRCOTAATUAL'#9'15'#9'Valor da Cota'
                'SALDOVLRFUNDO'#9'19'#9'Valor Bruto'
                'VLRIOFPROV'#9'13'#9'IOF'
                'VLRIRPROV'#9'14'#9'IR'
                'SALDOLIQUIDO'#9'20'#9'Valor Líquido')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DsSaldoFundo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clMaroon
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icYellow
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 793
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      object sbtnMovimento: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Movimento'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnMovimentoClick
      end
      object sbtnSaldos: TToolbarButton97
        Left = 307
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = PopMnuSaldo
        Caption = '&Saldos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 793
    inherited tb97Fundo: TToolbar97
      Left = 346
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 169
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 488
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 443
    Top = 140
  end
  inherited upd: TUpdateSQL
    Left = 507
    Top = 140
  end
  inherited MontaSelect: TMontaSelect
    Left = 469
  end
  inherited ImlPadrao: TImageList
    Left = 449
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 428
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from dual')
    Left = 387
    Top = 140
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MAX(DATAULTFECH) AS DATAULTFECH FROM TIPOFUNDOINVEST WHER' +
        'E'
      '  (IDTIPOINVEST      = :IDTIPOINVEST)                      AND'
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )'
      ' ')
    ValidateWithMask = True
    Left = 175
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerSaldoFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        ' AND'
      
        '    (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST =:IDFUNDOI' +
        'NVEST)) OR'
      
        '      (:IDFUNDOINVEST IS NULL))                                 ' +
        '        AND'
      
        '      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39'))' +
        ' AND'
      '      (IDTIPOINVEST      = :IDTIPOINVEST)'
      'GROUP BY IDFUNDOINVEST, DATAAPLICACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 603
    Top = 39
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 67
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT'
      'G.IDGESTORCARTEIRA, P.IDPESSOA, P.NOME'
      'FROM CM.PESSOA P, CM.GESTORCARTEIRA G, CM.FUNDOINVEST F'
      'WHERE'
      '    (((:IDTIPOFUNDOINVEST IS NOT NULL)            AND'
      '     (F.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))  OR'
      '      (:IDTIPOFUNDOINVEST IS NULL) )              AND'
      '      P.IDPESSOA            = G.IDGESTORCARTEIRA  AND'
      '      G.IDGESTORCARTEIRA(+) = F.IDGESTORCARTEIRA'
      'ORDER BY P.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 75
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object qryGestorCartNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryGestorCartIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = '"CM.GESTORCARTEIRA".IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object QryFundoInvestAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTAPLIC       , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC      '
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      '    (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '    (((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      '      (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))  OR'
      '      (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '    (((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '      (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '      (:IDTIPOFUNDOINVEST IS NULL) )                AND'
      ''
      '    (((:IDTIPOINVEST <> 0)                          AND'
      '      (TFI.IDTIPOINVEST = :IDTIPOINVEST))           OR'
      '      (:IDTIPOINVEST = 0) )'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestAplicDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestAplicIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestAplicIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestAplicTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestAplicTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestAplicMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoInvestAplicIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestAplicCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestAplicSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestAplicPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestAplicPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestAplicPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestAplicQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestAplicQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestAplicSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestAplicPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestAplicPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoInvestAplicCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestAplicSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestAplicCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestAplicDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
      Visible = False
    end
    object QryFundoInvestAplicPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTAPLIC'
      Visible = False
    end
    object QryFundoInvestAplicIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestAplicIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryFundoInvestAplicDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QryFundoInvestResg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTRESG        , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '(FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST) AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)               AND'
      '  (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))  OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                 AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)              AND'
      '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '  (:IDTIPOFUNDOINVEST IS NULL))                 AND'
      ''
      '(((:IDTIPOINVEST <> 0)                          AND'
      '  (TFI.IDTIPOINVEST = :IDTIPOINVEST))           OR'
      '  (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 282
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestResgDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestResgIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestResgIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestResgTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestResgTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestResgMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoInvestResgIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestResgIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestResgCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestResgSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestResgPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestResgPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestResgPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestResgQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestResgQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestResgSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestResgPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestResgPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoInvestResgCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestResgSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestResgCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestResgDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
      Visible = False
    end
    object QryFundoInvestResgPZOCOTRESG: TFloatField
      FieldName = 'PZOCOTRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTRESG'
      Visible = False
    end
    object QryFundoInvestResgIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object QryFundoInvestResgDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO      , SUM(NVL(H1.VLRIRPRO' +
        'V,0))  AS VLRIRPROV , SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV  ' +
        '    ,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO , SUM(H1.COTASMOVFUND' +
        'O) AS COTASMOVFUNDO    , SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO ,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      '(H1.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR) AND'
      ''
      '(H1.IDHISTFUNDO  IN ('
      
        '                 SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM HIS' +
        'TFUNDO'
      '                 WHERE'
      
        '                       (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)' +
        ' AND'
      
        '                     (((:IDFUNDOINVEST IS NOT NULL)             ' +
        ' AND'
      
        '                        (IDFUNDOINVEST     = :IDFUNDOINVEST))   ' +
        ' OR (:IDFUNDOINVEST IS NULL)) AND'
      ''
      
        '                     (((:IDTIPOCOTA IS NOT NULL)                ' +
        ' AND'
      
        '                        (IDTIPOCOTA        = :IDTIPOCOTA))      ' +
        ' OR (:IDTIPOCOTA IS NULL))    AND'
      ''
      
        '                        (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUN' +
        'DO, '#39'DD/MM/YYYY'#39')) AND'
      
        '                       ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFUN' +
        'DO, '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      
        '                        (IDTIPOINVEST      = :IDTIPOINVEST)     ' +
        ' AND'
      '                        (TIPMOVFUNDO       <> '#39'PIR'#39')'
      
        '                 GROUP BY IDFUNDOINVEST, IDTIPOCOTA, DATAAPLICAC' +
        'AO, DATAMOVFUNDO'
      '                 )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                     AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)                             AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                          AND'
      '  (FI.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))               OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                            AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (FI.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )                           AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)                  '
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 603
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = '2000'
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object FloatField9: TFloatField
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField11: TFloatField
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField12: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField13: TFloatField
      FieldName = 'COTASMOVFUNDO'
    end
    object FloatField14: TFloatField
      FieldName = 'VLRMOVFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField15: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.00000000000'
    end
    object FloatField16: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField18: TFloatField
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object QrySaldoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT FI.DESCFUNDOINVEST,    H1.IDHISTFUNDO,     H1.CODDOCUMENT' +
        'O,       H1.PLNCODIGO,'
      
        '       H1.PLANO,              H1.IDTIPOINVEST,    H1.IDTIPOOPERA' +
        'CAO,     H1.IDCARTEIRAINVEST,'
      
        '       H1.IDFUNDOINVEST,      H1.DATAAPLICACAO,   H1.DATAMOVFUND' +
        'O,       H1.HISTMOVFUNDO,'
      
        '       H1.NATURMOVFUNDO,      H1.TIPMOVFUNDO,     H1.VLRAPLICADO' +
        ',        TC.DESCTIPOCOTA,'
      
        '       NVL(H1.VLRIRPROV,0) AS VLRIRPROV,          NVL(H1.VLRIOFP' +
        'ROV,0) AS VLRIOFPROV,'
      
        '       H1.VLRVARIACAO,        H1.COTASMOVFUNDO,   H1.VLRMOVFUNDO' +
        ',        H1.FLGCALCSALDO,'
      
        '       H1.SALDOQTDCOTAS,      H1.SALDOVLRFUNDO,   H1.COTAAPLICAC' +
        'AO AS VLRCOTAAPLICACAO,'
      '       CF.VLRCOTA AS VLRCOTAATUAL,'
      
        '       (H1.SALDOVLRFUNDO-(nvl(H1.VLRIOFPROV,0)+nvl(H1.VLRIRPROV,' +
        '0))) AS  SALDOLIQUIDO'
      ''
      'FROM HISTFUNDO H1, COTAFUNDO CF, FUNDOINVEST FI, TIPOCOTA TC'
      ''
      'WHERE (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)'
      '  AND (H1.IDHISTFUNDO  IN ('
      '          SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO FROM HISTFUNDO'
      '          WHERE (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR)'
      
        '            AND ((:IDFUNDOINVEST IS NULL) OR (IDFUNDOINVEST = :I' +
        'DFUNDOINVEST))'
      
        '            AND ((:IDTIPOCOTA IS NULL) OR (IDTIPOCOTA = :IDTIPOC' +
        'OTA))'
      
        '            AND (DATAMOVFUNDO = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YY' +
        'YY'#39'))'
      
        '            AND ((:IDTIPOINVEST = 0) OR (IDTIPOINVEST = :IDTIPOI' +
        'NVEST))'
      '            AND (TIPMOVFUNDO <> '#39'PIR'#39')'
      
        '          GROUP BY IDFUNDOINVEST, IDTIPOCOTA, DATAAPLICACAO, DAT' +
        'AMOVFUNDO ))'
      '  AND (H1.SALDOQTDCOTAS > 0)'
      '  AND (H1.IDCOMPOSICAOFUNDO IS NULL)'
      
        '  AND ((:IDGESTORCARTEIRA IS NULL) OR (FI.IDGESTORCARTEIRA  = :I' +
        'DGESTORCARTEIRA))'
      
        '  AND ((:IDTIPOFUNDOINVEST IS NULL) OR (FI.IDTIPOFUNDOINVEST = :' +
        'IDTIPOFUNDOINVEST))'
      '  AND (FI.IDFUNDOINVEST       = H1.IDFUNDOINVEST)'
      '  AND (CF.IDFUNDOINVEST       = H1.IDFUNDOINVEST)'
      '  AND (CF.DATACOTA            = H1.DATAMOVFUNDO)'
      '  AND (CF.IDTIPOCOTA          = H1.IDTIPOCOTA)'
      '  AND (TC.IDTIPOCOTA          = H1.IDTIPOCOTA)'
      ''
      'ORDER BY DESCFUNDOINVEST, DATAAPLICACAO'
      ' ')
    ValidateWithMask = True
    Left = 603
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QrySaldoFundoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundos'
      DisplayWidth = 45
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySaldoFundoDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo Cota'
      DisplayWidth = 18
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QrySaldoFundoDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoFundoDATAMOVFUNDO: TDateTimeField
      DisplayLabel = 'Data Cota'
      DisplayWidth = 10
      FieldName = 'DATAMOVFUNDO'
    end
    object QrySaldoFundoSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRCOTAATUAL: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 15
      FieldName = 'VLRCOTAATUAL'
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 19
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 13
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRIRPROV: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 14
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 20
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoVLRCOTAAPLICACAO: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTAAPLICACAO'
      Visible = False
      DisplayFormat = '###,#0.000000000'
    end
    object QrySaldoFundoVLRAPLICADO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 17
      FieldName = 'VLRAPLICADO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoIDHISTFUNDO: TFloatField
      FieldName = 'IDHISTFUNDO'
      Visible = False
    end
    object QrySaldoFundoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QrySaldoFundoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QrySaldoFundoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QrySaldoFundoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QrySaldoFundoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QrySaldoFundoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QrySaldoFundoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QrySaldoFundoHISTMOVFUNDO: TStringField
      FieldName = 'HISTMOVFUNDO'
      Visible = False
      Size = 60
    end
    object QrySaldoFundoNATURMOVFUNDO: TStringField
      FieldName = 'NATURMOVFUNDO'
      Visible = False
      Size = 1
    end
    object QrySaldoFundoTIPMOVFUNDO: TStringField
      FieldName = 'TIPMOVFUNDO'
      Visible = False
      Size = 3
    end
    object QrySaldoFundoVLRVARIACAO: TFloatField
      FieldName = 'VLRVARIACAO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoCOTASMOVFUNDO: TFloatField
      FieldName = 'COTASMOVFUNDO'
      Visible = False
    end
    object QrySaldoFundoVLRMOVFUNDO: TFloatField
      FieldName = 'VLRMOVFUNDO'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoFundoFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Visible = False
      Size = 1
    end
  end
  object dsSaldoFundoTotal: TwwDataSource
    DataSet = QrySaldoFundoTotal
    Left = 714
    Top = 235
  end
  object DsSaldoFundo: TwwDataSource
    DataSet = QrySaldoFundo
    Left = 714
    Top = 279
  end
  object QryResgate: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      
        '  PED.VLRPEDIDO         , PED.DATACOTIZACAO     , PED.VLRCOTA   ' +
        '        ,'
      
        '  PED.VLRCOLOCACAO      , PED.VLRTAXAS          , PED.VLRCORRETA' +
        'GEM     ,'
      
        '  (PED.VLRPEDIDO - (PED.VLRCOLOCACAO+PED.VLRTAXAS+PED.VLRCORRETA' +
        'GEM)) As VALORTOTAL,'
      '  PED.IDTIPOCOTA        , PED.VLRTAXAPERF       ,'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  TCO.DESCTIPOCOTA      , FUN.DTAINIPROC        ,'
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      
        '  TPO.NATUREZAOPERACAO  , CAR.IDPLANOPREV       , CAR.IDPATROCIN' +
        'ADORA   ,'
      '  '#39' '#39' AS STACONFIRMA       ,'
      '  '#39' '#39' As STATUS,'
      '  PED.IDPLANPREVCTBPATR'
      'FROM'
      
        '  PEDIDOFUNDO PED, FUNDOINVEST FUN, TIPOOPERACAO TPO, CARTEIRAIN' +
        'VEST CAR,'
      '  TIPOCOTA    TCO'
      'WHERE'
      
        '  (((:IDTIPOINVEST <> 0)                                        ' +
        'AND'
      
        '    (PED.IDTIPOINVEST = :IDTIPOINVEST))                         ' +
        'OR'
      
        '    (:IDTIPOINVEST = 0) )                                       ' +
        'AND'
      ''
      
        '  (PED.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        'AND'
      ''
      
        '  (PED.DATAPEDIDO        = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        '  AND'
      ''
      
        '  (((:IDFUNDOINVEST IS NOT NULL)                                ' +
        'AND'
      
        '    (PED.IDFUNDOINVEST = :IDFUNDOINVEST))                       ' +
        'OR'
      
        '    (:IDFUNDOINVEST IS NULL) )                                  ' +
        'AND'
      ''
      
        '  (((:IDTIPOCOTA IS NOT NULL)                                   ' +
        'AND'
      
        '    (PED.IDTIPOCOTA = :IDTIPOCOTA))                             ' +
        'OR'
      
        '    (:IDTIPOCOTA IS NULL) )                                     ' +
        'AND'
      ''
      
        '  (PED.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '  (PED.IDTIPOOPERACAO <> -101)                                  ' +
        'AND'
      ''
      
        '  (((:IDGESTORCARTEIRA IS NOT NULL)                             ' +
        'AND'
      
        '    (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                 ' +
        'OR'
      
        '    (:IDGESTORCARTEIRA IS NULL) )                               ' +
        'AND'
      ''
      
        '  (((:IDTIPOFUNDOINVEST IS NOT NULL)                            ' +
        'AND'
      
        '    (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))               ' +
        'OR'
      
        '    (:IDTIPOFUNDOINVEST IS NULL) )                              ' +
        'AND'
      ''
      
        '  (FUN.IDCARTEIRAINVEST  = CAR.IDCARTEIRAINVEST(+))             ' +
        'AND'
      
        '  (FUN.IDFUNDOINVEST     = PED.IDFUNDOINVEST)                   ' +
        'AND'
      
        '  (PED.IDTIPOINVEST      = TPO.IDTIPOINVEST)                    ' +
        'AND'
      
        '  (PED.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO)                  ' +
        'AND'
      
        '  (PED.IDTIPOCOTA        = TCO.IDTIPOCOTA(+))                   ' +
        'AND'
      '  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      'ORDER BY FUN.DESCFUNDOINVEST, PED.DATAPEDIDO')
    UpdateObject = UpdResgate
    ControlType.Strings = (
      'STATUS;CheckBox;S;N'
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 387
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object QryResgateDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryResgateDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 16
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QryResgateIDPEDIDOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 6
      FieldName = 'IDPEDIDOFUNDO'
    end
    object QryResgateDATAPEDIDO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAPEDIDO'
    end
    object QryResgateDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryResgateDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryResgateVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 18
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryResgateCODFUNCETIP: TStringField
      DisplayLabel = 'CETIP'
      DisplayWidth = 14
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryResgateVALORTOTAL: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object QryResgateIDTIPOCOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object QryResgateSTACONFIRMA: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTATUS: TStringField
      DisplayLabel = 'Confirmada'
      DisplayWidth = 9
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryResgateIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryResgateIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryResgateIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryResgateIDFUNDOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryResgateIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryResgateTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryResgateTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryResgateMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryResgateIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryResgateIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryResgateCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryResgateSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryResgatePZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryResgatePZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryResgatePZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryResgateQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryResgateQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryResgateSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgatePZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryResgatePERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryResgatePERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryResgateSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryResgateIDTIPOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object QryResgateIDTIPOOPERACAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryResgateDESCTIPOOPERACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryResgateNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryResgateIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryResgateIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryResgateIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryResgateVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object QryResgateVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Visible = False
    end
    object QryResgateVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
    object QryResgateVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Visible = False
    end
    object QryResgateVLRTAXAPERF: TFloatField
      FieldName = 'VLRTAXAPERF'
      Visible = False
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryResgateDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
  end
  object DsResgate: TwwDataSource
    DataSet = QryResgate
    Left = 443
    Top = 235
  end
  object QryAplicacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     ,'
      
        '  OPE.IDTIPOINVEST      , OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINV' +
        'EST     ,'
      
        '  OPE.DATAOPERACAO      , OPE.DATALIQUIDACAO    , OPE.QTDOPERACA' +
        'O       ,'
      
        '  OPE.VLROPERACAO       , OPE.VLRCOTA           , OPE.VLRIR     ' +
        '        ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      
        '  OPE.IDPLANPREVCTBPATR , OPE.DATACOTIZACAO     , OPE.VLRCOLOCAC' +
        'AO      ,'
      
        '  OPE.VLRTAXAS          , OPE.VLRCORRETAGEM     , OPE.IDTIPOCOTA' +
        '        ,'
      
        ' (OPE.VLROPERACAO - (OPE.VLRCOLOCACAO+OPE.VLRTAXAS+OPE.VLRCORRET' +
        'AGEM)) As VALORTOTAL,'
      
        '  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D009999999999'#39') AS Q' +
        'TDMOSTRA,'
      
        '  OPE.PLANO             , OPE.PLNCODIGO         , OPE.CODDOCUMEN' +
        'TO      ,'
      
        '  OPE.IDBOLETA          , OPE.DATAVENCIMENTO    , OPE.OBSERVACAO' +
        '        ,'
      ''
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  FUN.PZOCOTAPLIC       , FUN.DTAINIPROC        ,'
      ''
      '  TCO.DESCTIPOCOTA      ,'
      ''
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      
        '  TPO.NATUREZAOPERACAO  , CAR.IDPLANOPREV       , CAR.IDPATROCIN' +
        'ADORA   ,'
      
        '  DECODE(OPE.STACONFIRMA, '#39'S'#39', '#39'Confirmada'#39','#39'Pendente'#39') As STATU' +
        'S'
      'FROM'
      
        '  OPERACAOFUNDO OPE, FUNDOINVEST FUN, TIPOOPERACAO TPO, CARTEIRA' +
        'INVEST CAR,'
      '  TIPOCOTA TCO'
      'WHERE'
      ''
      
        '(((:IDTIPOINVEST <> 0)                                          ' +
        'AND'
      
        '  (OPE.IDTIPOINVEST = :IDTIPOINVEST))                           ' +
        'OR'
      
        '  (:IDTIPOINVEST = 0) )                                         ' +
        'AND'
      ''
      
        '  (OPE.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        'AND'
      ''
      
        '  (OPE.DATAOPERACAO     = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39') ) ' +
        'AND'
      ''
      
        '(((:IDTIPOCOTA IS NOT NULL)                                     ' +
        'AND'
      
        '  (OPE.IDTIPOCOTA = :IDTIPOCOTA))                               ' +
        'OR'
      
        '  (:IDTIPOCOTA IS NULL) )                                       ' +
        'AND'
      ''
      
        '  (OPE.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOOPERACAO > 0)                                      ' +
        'AND'
      ''
      
        '(((:IDGESTORCARTEIRA IS NOT NULL)                               ' +
        'AND'
      
        '  (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                   ' +
        'OR'
      
        '  (:IDGESTORCARTEIRA IS NULL) )                                 ' +
        'AND'
      ''
      
        '(((:IDTIPOFUNDOINVEST IS NOT NULL)                              ' +
        'AND'
      
        '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))                 ' +
        'OR'
      
        '  (:IDTIPOFUNDOINVEST IS NULL) )                                ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOINVEST     = TPO.IDTIPOINVEST)                     ' +
        'AND'
      
        '  (OPE.IDTIPOOPERACAO   = TPO.IDTIPOOPERACAO)                   ' +
        'AND'
      
        '  (OPE.IDFUNDOINVEST    = FUN.IDFUNDOINVEST)                    ' +
        'AND'
      ''
      
        '  (FUN.IDCARTEIRAINVEST = CAR.IDCARTEIRAINVEST(+))              ' +
        'AND'
      ''
      
        '  (OPE.IDTIPOCOTA       = TCO.IDTIPOCOTA(+))                    ' +
        'AND'
      ''
      '  (TPO.NATUREZAOPERACAO = '#39'A'#39')'
      ''
      'ORDER BY FUN.DESCFUNDOINVEST, OPE.DATAOPERACAO'
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpdAplicacao
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 384
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
        Value = '09/04/2001'
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QryAplicacaoDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryAplicacaoDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 15
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object QryAplicacaoIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object QryAplicacaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
    end
    object QryAplicacaoDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object QryAplicacaoDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryAplicacaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Aplicado'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryAplicacaoIDOPERACAOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 6
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryAplicacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryAplicacaoIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryAplicacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryAplicacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryAplicacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Visible = False
    end
    object QryAplicacaoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object QryAplicacaoVLRIR: TFloatField
      FieldName = 'VLRIR'
      Visible = False
    end
    object QryAplicacaoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
      Visible = False
    end
    object QryAplicacaoVLRRENDIMENTO: TFloatField
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object QryAplicacaoSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryAplicacaoVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Visible = False
    end
    object QryAplicacaoVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
    object QryAplicacaoVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Visible = False
    end
    object QryAplicacaoIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object QryAplicacaoVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object QryAplicacaoQTDMOSTRA: TStringField
      FieldName = 'QTDMOSTRA'
      Visible = False
      Size = 29
    end
    object QryAplicacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryAplicacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryAplicacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryAplicacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryAplicacaoIDCARTEIRAINVEST_1: TFloatField
      FieldName = 'IDCARTEIRAINVEST_1'
      Visible = False
    end
    object QryAplicacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryAplicacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryAplicacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryAplicacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryAplicacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryAplicacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryAplicacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryAplicacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryAplicacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryAplicacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryAplicacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryAplicacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryAplicacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryAplicacaoPZOCOTAPLIC: TFloatField
      FieldName = 'PZOCOTAPLIC'
      Visible = False
    end
    object QryAplicacaoIDTIPOINVEST_1: TFloatField
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object QryAplicacaoIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryAplicacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object QryAplicacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryAplicacaoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryAplicacaoIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryAplicacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      Size = 10
    end
    object QryAplicacaoDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Visible = False
    end
    object QryAplicacaoPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object QryAplicacaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QryAplicacaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object QryAplicacaoDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
      Visible = False
    end
    object QryAplicacaoIDFUNDOINVEST_1: TFloatField
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryAplicacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
  end
  object DsAplicacao: TwwDataSource
    DataSet = QryAplicacao
    Left = 443
    Top = 186
  end
  object QryFundoInvestSld: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '(FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)          AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                        AND'
      '  (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))           OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                          AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                       AND'
      '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))          OR'
      '  (:IDTIPOFUNDOINVEST IS NULL))                          AND'
      ''
      '(((:IDTIPOINVEST <> 0)                                   AND'
      '  (TFI.IDTIPOINVEST = :IDTIPOINVEST))                    OR'
      '  (:IDTIPOINVEST = 0))'
      ''
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestSldIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestSldDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestSldIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestSldTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestSldTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestSldMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestSldIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestSldIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestSldCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestSldSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSldPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestSldPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestSldPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestSldPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestSldQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestSldQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestSldSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSldPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestSldPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestSldPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestSldCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestSldSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSldSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSldCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 175
    Top = 291
  end
  object UpdResgate: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  VLRTAXAPERF = :VLRTAXAPERF'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, '
      'DATAPEDIDO, '
      '   DATALIQUIDACAO, VLRPEDIDO, DATACOTIZACAO, VLRCOTA, '
      'VLRCOLOCACAO, VLRTAXAS, '
      '   VLRCORRETAGEM, IDTIPOCOTA, IDPLANPREVCTBPATR,VLRTAXAPERF)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T, '
      ':DATAPEDIDO, '
      '   :DATALIQUIDACAO, :VLRPEDIDO, :DATACOTIZACAO, :VLRCOTA, '
      ':VLRCOLOCACAO, '
      '   :VLRTAXAS, :VLRCORRETAGEM, :IDTIPOCOTA, :IDPLANPREVCTBPATR,'
      ':VLRTAXAPERF)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 507
    Top = 235
  end
  object UpdAplicacao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOFUNDO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QTDOPERACAO = :QTDOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRIR = :VLRIR,'
      '  VLRIOF = :VLRIOF,'
      '  VLRRENDIMENTO = :VLRRENDIMENTO,'
      '  STACONFIRMA = :STACONFIRMA,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDBOLETA = :IDBOLETA,'
      '  DATAVENCIMENTO = :DATAVENCIMENTO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    InsertSQL.Strings = (
      'insert into OPERACAOFUNDO'
      
        '  (IDOPERACAOFUNDO,IDCARTEIRAINVEST, IDPEDIDOFUNDO, IDTIPOINVEST' +
        ', '
      'IDTIPOOPERACAO, '
      'IDFUNDOINVEST, '
      '   DATAOPERACAO, DATALIQUIDACAO, QTDOPERACAO, VLROPERACAO, '
      'VLRCOTA, VLRIR, '
      '   VLRIOF, VLRRENDIMENTO, STACONFIRMA, IDPLANPREVCTBPATR, '
      'DATACOTIZACAO,'
      '   VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, IDTIPOCOTA,'
      '   DATAVENCIMENTO, OBSERVACAO, IDBOLETA)'
      'values'
      '  (:IDOPERACAOFUNDO ,:IDCARTEIRAINVEST, :IDPEDIDOFUNDO,'
      ':IDTIPOINVEST, :IDTIPOOPERACAO,'
      ':IDFUNDOINVEST,'
      '   :DATAOPERACAO, :DATALIQUIDACAO, :QTDOPERACAO, :VLROPERACAO,'
      ':VLRCOTA,'
      
        '   :VLRIR, :VLRIOF, :VLRRENDIMENTO, :STACONFIRMA, :IDPLANPREVCTB' +
        'PATR,'
      ':DATACOTIZACAO,'
      '   :VLRCOLOCACAO, :VLRTAXAS, :VLRCORRETAGEM, :IDTIPOCOTA,'
      '   :DATAVENCIMENTO, :OBSERVACAO, :IDBOLETA)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERACAOFUNDO'
      'where'
      '  IDOPERACAOFUNDO = :OLD_IDOPERACAOFUNDO')
    Left = 507
    Top = 186
  end
  object QryVerificaOperacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   OPE.IDFUNDOINVEST,'
      '   OPE.DATAOPERACAO,'
      '   DESCTIPOOPERACAO'
      'FROM'
      '   OPERACAOFUNDO OPE, TIPOOPERACAO TPO'
      'WHERE'
      '   OPE.IDFUNDOINVEST    =:IDFUNDOINVEST       AND'
      '   OPE.IDTIPOCOTA       =:IDTIPOCOTA          AND   '
      '   OPE.DATAOPERACAO     =:DATAOPERACAO        AND'
      '   TPO.NATUREZAOPERACAO =:NATUREZAOPERACAO    AND'
      '   TPO.IDTIPOOPERACAO   > 0                   AND'
      '   TPO. CODTIPDOC IS NOT NULL                 AND'
      '   OPE.IDTIPOOPERACAO   = TPO.IDTIPOOPERACAO  AND'
      '   OPE.IDPLANPREVCTBPATR=:IDPLANPREVCTBPATR'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 603
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NATUREZAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
  end
  object QryVerAtualizacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      ''
      '  MIN(DATAMOVFUNDO) AS DATAMOVFUNDO'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)         AND'
      ''
      '(H1.IDHISTFUNDO  IN ('
      '                 SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                 FROM HISTFUNDO'
      '                 WHERE'
      
        '                         (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR' +
        ') AND'
      
        '                      (((:IDFUNDOINVEST IS NOT NULL)       AND (' +
        'IDFUNDOINVEST=:IDFUNDOINVEST)) OR'
      
        '                       ((:IDFUNDOINVEST IS NULL)           AND (' +
        'IDFUNDOINVEST IS NOT NULL)))   AND'
      '                         (IDTIPOCOTA        = :IDTIPOCOTA) AND'
      
        '                         (DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) AND'
      
        '                        ((DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) OR IDHISTFUNDO < 999999999) AND'
      '                         (IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                 GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVF' +
        'UNDO'
      '                 )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)     AND'
      ''
      '(FI.IDFUNDOINVEST = H1.IDFUNDOINVEST)'
      '')
    ValidateWithMask = True
    Left = 603
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryUpdParaminvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST  '
      'SET DATAULTFECHFDO=:DATAULTFECHFDO')
    ValidateWithMask = True
    Left = 714
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECHFDO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object FloatField19: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object FloatField21: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object StringField4: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object FloatField24: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object FloatField25: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object FloatField26: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object FloatField27: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object FloatField28: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object FloatField29: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      Size = 1
    end
    object FloatField30: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object FloatField31: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object FloatField32: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object QryUpdTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE TIPOFUNDOINVEST SET DATAULTFECH=:DATAULTFECH WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  '
      ' ')
    ValidateWithMask = True
    Left = 714
    Top = 140
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAULTFECH'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 67
    Top = 331
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
  end
  object QryDelEspecificoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '*'
      'FROM'
      '    OPERACAOFUNDO OP, COMPOSICAOFUNDO CF'
      'WHERE'
      
        '   CF.IDFUNDOINVEST     = :IDFUNDOINVEST                      AN' +
        'D'
      
        '   OP.IDCOMPOSICAOFUNDO = CF.IDCOMPOSICAOFUNDO                AN' +
        'D'
      
        '   OP.DATAOPERACAO      = :DATAOPERACAO                       AN' +
        'D'
      
        '   OP.IDTIPOOPERACAO    = :IDTIPOOPERACAO                     AN' +
        'D'
      
        '   OP.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR                  AN' +
        'D'
      '   OP.IDTIPOINVEST      = :IDTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 714
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryUpdPedido: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE PEDIDOFUNDO SET'
      ''
      'CODDOCUMENTO =:CODDOCUMENTO,'
      ''
      'PLNCODIGO =:PLNCODIGO,'
      ''
      'PLANO =:PLANO'
      ''
      'WHERE IDPEDIDOFUNDO =:IDPEDIDOFUNDO')
    ValidateWithMask = True
    Left = 714
    Top = 87
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryVerDelResgate: TwwQuery
    DatabaseName = 'basedados'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT DISTINCT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAMOVFUNDO'
      ''
      'FROM'
      '('
      'SELECT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAMOVFUNDO'
      ''
      'FROM HISTFUNDO'
      'WHERE'
      '       (IDTIPOOPERACAO NOT IN (-12,-13))  AND'
      '       (IDOPERACAOFUNDO IN ('
      '        SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO'
      '        WHERE IDPEDIDOFUNDO =:IDPEDIDOFUNDO))'
      ''
      'UNION'
      ''
      'SELECT'
      'CODDOCUMENTO,'
      'PLNCODIGO,'
      'PLANO,'
      'IDTIPOINVEST,'
      'DATAPEDIDO AS DATAMOVFUNDO'
      'FROM'
      '   PEDIDOFUNDO'
      'WHERE'
      '   (CODDOCUMENTO IS NOT NULL) AND'
      '   (PLNCODIGO IS NOT NULL)    AND'
      '   (IDPEDIDOFUNDO =:IDPEDIDOFUNDO))'
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 603
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryTipoCotaSld: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 175
    Top = 186
  end
  object QryTipoCotaApl: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 175
    Top = 140
  end
  object QryTipoCotaResg: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 67
    Top = 87
  end
  object DsTipoCotaResg: TwwDataSource
    AutoEdit = False
    DataSet = QryTipoCotaResg
    Left = 175
    Top = 95
  end
  object QryTipoOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.*'
      'FROM  TIPOOPERACAO T'
      'WHERE T.NATUREZAOPERACAO =  '#39'A'#39
      '  AND T.IDTIPOOPERACAO > 0'
      '  AND T.IDTIPOINVEST = :IDTIPOINVEST'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 67
    Top = 235
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object qryFundoInvestVenda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      
        '  FUN.DATAINICIOFUNDO   , FUN.PZOCOTRESG        , TFI.IDTIPOINVE' +
        'ST      , FUN.DTAINIPROC'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TFI'
      'WHERE'
      ''
      '(FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)          AND'
      ''
      '(((:IDGESTORCARTEIRA IS NOT NULL)                        AND'
      '  (FUN.IDGESTORCARTEIRA  = :IDGESTORCARTEIRA))           OR'
      '  (:IDGESTORCARTEIRA IS NULL) )                          AND'
      ''
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                       AND'
      '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))          OR'
      '  (:IDTIPOFUNDOINVEST IS NULL))                          AND'
      ''
      '(((:IDTIPOINVEST <> 0)                                   AND'
      '  (TFI.IDTIPOINVEST = :IDTIPOINVEST))                    OR'
      '  (:IDTIPOINVEST = 0))'
      ''
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object qryFundoInvestVendaDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestVendaIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object qryFundoInvestVendaIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryFundoInvestVendaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object qryFundoInvestVendaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryFundoInvestVendaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object qryFundoInvestVendaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryFundoInvestVendaIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryFundoInvestVendaCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qryFundoInvestVendaSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFundoInvestVendaPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object qryFundoInvestVendaPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object qryFundoInvestVendaPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object qryFundoInvestVendaPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object qryFundoInvestVendaQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object qryFundoInvestVendaQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'BASEDADOS.FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object qryFundoInvestVendaSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFundoInvestVendaPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object qryFundoInvestVendaPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object qryFundoInvestVendaPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'BASEDADOS.FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object qryFundoInvestVendaCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qryFundoInvestVendaSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFundoInvestVendaSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'BASEDADOS.FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryFundoInvestVendaCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'BASEDADOS.FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryFundoInvestVendaDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.DATAINICIOFUNDO'
      Visible = False
    end
    object qryFundoInvestVendaPZOCOTRESG: TFloatField
      FieldName = 'PZOCOTRESG'
      Origin = 'BASEDADOS.FUNDOINVEST.PZOCOTRESG'
      Visible = False
    end
    object qryFundoInvestVendaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOFUNDOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryFundoInvestVendaDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object qryTipoCotaVenda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 67
    Top = 279
    object qryTipoCotaVendaDESCTIPOCOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object qryTipoCotaVendaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object qryContraParteVenda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PE.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, '
      '     (SELECT EM.IDEMISSOR AS IDFORCLI'
      '      FROM EMISSOR EM'
      '      UNION'
      '      SELECT CU.IDCUSTODIANTE AS IDFORCLI'
      '      FROM CUSTODIANTE CU'
      '      UNION'
      '      SELECT BV.IDBOLSAVALORES AS IDFORCLI'
      '      FROM BOLSAVALORES BV'
      '      UNION'
      '      SELECT CT.IDCORRETVALORES AS IDFORCLI'
      '      FROM CORRETVALORES CT ) FORCLI'
      ''
      'WHERE PE.IDPESSOA = FORCLI.IDFORCLI'
      ''
      'ORDER BY PE.NOME')
    ValidateWithMask = True
    Left = 282
    Top = 279
    object qryContraParteVendaNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object qryContraParteVendaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object qryVenda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      
        '  PED.VLRPEDIDO         , PED.DATACOTIZACAO     , PED.VLRCOTA   ' +
        '        ,'
      
        '  PED.VLRCOLOCACAO      , PED.VLRTAXAS          , PED.VLRCORRETA' +
        'GEM     ,'
      
        ' (PED.VLRPEDIDO - (PED.VLRCOLOCACAO+PED.VLRTAXAS+PED.VLRCORRETAG' +
        'EM)) As VALORTOTAL,'
      '  PED.IDTIPOCOTA        , PED.VLRTAXAPERF       ,'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  ,'
      
        '  FUN.TRGDTINCLUSAO     , FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO ' +
        '        ,'
      
        '  FUN.IDCARTEIRAINVEST  , FUN.IDTIPOFUNDOINVEST , FUN.CNPJFUNDO ' +
        '        ,'
      
        '  FUN.STAEXCLUSIVO      , FUN.PZOCARENCIA       , FUN.PZOANIVERS' +
        'ARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        ,'
      
        '  FUN.QTDDECVALOR       , FUN.STAFUNDO          , FUN.PZOAMORTIZ' +
        'ACAO    ,'
      
        '  FUN.PERCTXPERFORM     , FUN.PERCTXADM         , FUN.CODFUNCETI' +
        'P       ,'
      
        '  FUN.STAPROVISIONAIR   , FUN.STAPROVISIONAIOF  , FUN.CONTRCETIP' +
        '        ,'
      '  TCO.DESCTIPOCOTA      , FUN.DTAINIPROC        ,'
      
        '  TPO.IDTIPOINVEST      , TPO.IDTIPOOPERACAO    , TPO.DESCTIPOOP' +
        'ERACAO  ,'
      
        '  TPO.NATUREZAOPERACAO  , CAR.IDPLANOPREV       , CAR.IDPATROCIN' +
        'ADORA   ,'
      '  '#39' '#39' AS STACONFIRMA       ,'
      '  '#39' '#39' As STATUS,'
      '  PED.IDPLANPREVCTBPATR'
      'FROM'
      
        '  PEDIDOFUNDO PED, FUNDOINVEST FUN, TIPOOPERACAO TPO, CARTEIRAIN' +
        'VEST CAR,'
      '  TIPOCOTA    TCO'
      'WHERE'
      
        '  (PED.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        'AND'
      '  (PED.IDTIPOOPERACAO = -101) AND'
      
        '  (PED.DATAPEDIDO        = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND'
      ''
      
        '(((:IDFUNDOINVEST IS NOT NULL)                                  ' +
        'AND'
      
        '  (PED.IDFUNDOINVEST = :IDFUNDOINVEST))                         ' +
        'OR'
      
        '  (:IDFUNDOINVEST IS NULL) )                                    ' +
        'AND'
      ''
      
        '(((:IDTIPOCOTA IS NOT NULL)                                     ' +
        'AND'
      
        '  (PED.IDTIPOCOTA = :IDTIPOCOTA))                               ' +
        'OR'
      
        '  (:IDTIPOCOTA IS NULL) )                                       ' +
        'AND'
      ''
      
        '(((:IDTIPOINVEST <> 0)                                          ' +
        'AND'
      
        '  (PED.IDTIPOINVEST = :IDTIPOINVEST))                           ' +
        'OR'
      
        '  (:IDTIPOINVEST = 0) )                                         ' +
        'AND'
      ''
      
        '  (PED.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '(((:IDGESTORCARTEIRA IS NOT NULL)                               ' +
        'AND'
      
        '  (FUN.IDGESTORCARTEIRA = :IDGESTORCARTEIRA))                   ' +
        'OR'
      
        '  (:IDGESTORCARTEIRA IS NULL) )                                 ' +
        'AND'
      ''
      
        '(((:IDTIPOFUNDOINVEST IS NOT NULL)                              ' +
        'AND'
      
        '  (FUN.IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))                 ' +
        'OR'
      
        '  (:IDTIPOFUNDOINVEST IS NULL) )                                ' +
        'AND'
      ''
      
        '  (CAR.IDCARTEIRAINVEST  = FUN.IDCARTEIRAINVEST)                ' +
        'AND  '
      
        '  (FUN.IDFUNDOINVEST     = PED.IDFUNDOINVEST)                   ' +
        'AND'
      ''
      
        '  (PED.IDTIPOINVEST      = TPO.IDTIPOINVEST(+))                 ' +
        'AND'
      
        '  (PED.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO(+))               ' +
        'AND'
      
        '  (PED.IDTIPOCOTA        = TCO.IDTIPOCOTA)                      ' +
        'AND'
      ''
      '  (TPO.NATUREZAOPERACAO  = '#39'D'#39')'
      ''
      'ORDER BY'
      ''
      '  FUN.DESCFUNDOINVEST, PED.DATAPEDIDO'
      ''
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
      ' ')
    UpdateObject = updVenda
    ControlType.Strings = (
      'STATUS;CheckBox;S;N'
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 387
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object qryVendaDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 30
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryVendaDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 14
      FieldName = 'DESCTIPOCOTA'
      Size = 40
    end
    object qryVendaIDPEDIDOFUNDO: TFloatField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
    end
    object qryVendaDATAPEDIDO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAPEDIDO'
    end
    object qryVendaDATACOTIZACAO: TDateTimeField
      DisplayLabel = 'Cotização'
      DisplayWidth = 10
      FieldName = 'DATACOTIZACAO'
    end
    object qryVendaDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object qryVendaVLRPEDIDO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 18
      FieldName = 'VLRPEDIDO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object qryVendaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryVendaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryVendaIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryVendaVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
      Visible = False
    end
    object qryVendaVLRCOLOCACAO: TFloatField
      FieldName = 'VLRCOLOCACAO'
      Visible = False
    end
    object qryVendaVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
      Visible = False
    end
    object qryVendaVLRCORRETAGEM: TFloatField
      FieldName = 'VLRCORRETAGEM'
      Visible = False
    end
    object qryVendaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Visible = False
    end
    object qryVendaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object qryVendaVLRTAXAPERF: TFloatField
      FieldName = 'VLRTAXAPERF'
      Visible = False
    end
    object qryVendaIDFUNDOINVEST_1: TFloatField
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object qryVendaIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryVendaTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryVendaTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryVendaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryVendaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryVendaIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryVendaCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qryVendaSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object qryVendaPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object qryVendaPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object qryVendaPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object qryVendaQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object qryVendaQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object qryVendaSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object qryVendaPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object qryVendaPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object qryVendaCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qryVendaSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryVendaIDTIPOINVEST_1: TFloatField
      FieldName = 'IDTIPOINVEST_1'
      Visible = False
    end
    object qryVendaIDTIPOOPERACAO_1: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object qryVendaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Visible = False
      Size = 60
    end
    object qryVendaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryVendaIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object qryVendaSTACONFIRMA: TStringField
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryVendaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryVendaDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object dsVenda: TwwDataSource
    DataSet = qryVenda
    Left = 443
    Top = 279
  end
  object updVenda: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  DATACOTIZACAO = :DATACOTIZACAO,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRCOLOCACAO = :VLRCOLOCACAO,'
      '  VLRTAXAS = :VLRTAXAS,'
      '  VLRCORRETAGEM = :VLRCORRETAGEM,'
      '  IDTIPOCOTA = :IDTIPOCOTA,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  VLRTAXAPERF = :VLRTAXAPERF'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, '
      'DATAPEDIDO, '
      '   DATALIQUIDACAO, VLRPEDIDO, DATACOTIZACAO, VLRCOTA, '
      'VLRCOLOCACAO, VLRTAXAS, '
      '   VLRCORRETAGEM, IDTIPOCOTA, IDPLANPREVCTBPATR,VLRTAXAPERF)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T, '
      ':DATAPEDIDO, '
      '   :DATALIQUIDACAO, :VLRPEDIDO, :DATACOTIZACAO, :VLRCOTA, '
      ':VLRCOLOCACAO, '
      '   :VLRTAXAS, :VLRCORRETAGEM, :IDTIPOCOTA, :IDPLANPREVCTBPATR,'
      ':VLRTAXAPERF)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 507
    Top = 279
  end
  object QryUpdOperacaoApl: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'UPDATE OPERACAOFUNDO SET'
      '       PLANO =:PLANO,'
      '       PLNCODIGO =:PLNCODIGO,'
      '       CODDOCUMENTO =:CODDOCUMENTO'
      'WHERE'
      '       IDOPERACAOFUNDO =:IDOPERACAOFUNDO')
    ValidateWithMask = True
    Left = 67
    Top = 380
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAOFUNDO'
        ParamType = ptUnknown
      end>
  end
  object QryDelHistFundo: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'DELETE'
      'FROM HISTFUNDO'
      'WHERE (IDPLANPREVCTBPATR= :IDPLANPREVCTBPATR) AND'
      '      (IDFUNDOINVEST    = :IDFUNDOINVEST)  AND'
      '      (IDTIPOCOTA       = :IDTIPOCOTA)     AND'
      '      (DATAAPLICACAO    = TO_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39'))'
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 281
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptResult
      end>
  end
  object PopMnuSaldo: TPopupMenu
    Left = 544
    Top = 6
    object MnuUmPlanoFechto: TMenuItem
      OnClick = MnuUmPlanoFechtoClick
    end
    object MnuTodosPlanosFechto: TMenuItem
      Caption = '&Todos os Planos'
      OnClick = MnuTodosPlanosFechtoClick
    end
  end
end
