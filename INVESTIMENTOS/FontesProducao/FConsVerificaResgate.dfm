inherited frmConsVerificaResgates: TfrmConsVerificaResgates
  Left = 220
  Top = 93
  HelpContext = 790206
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Verifica Resgates'
  ClientHeight = 541
  ClientWidth = 790
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 134
    Top = 301
    Width = 87
    Height = 13
    Caption = 'Prazo Carência'
  end
  inherited pnlFundo: TPanel
    Width = 790
    Height = 455
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 54
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 12
        Top = 9
        Width = 94
        Height = 13
        Caption = 'Data Referência'
      end
      object Label7: TLabel
        Left = 118
        Top = 9
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
        Left = 340
        Top = 9
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DtEdDataReferenciaGeral: TCMDateTimePicker
        Left = 12
        Top = 24
        Width = 100
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
        OnEnter = DtEdDataReferenciaGeralEnter
        OnExit = DtEdDataReferenciaGeralExit
      end
      object DblTipoFundo: TwwDBLookupCombo
        Left = 118
        Top = 24
        Width = 215
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
        OnEnter = DblTipoFundoEnter
        OnExit = DblTipoFundoExit
      end
      object dblGestorCarteira: TwwDBLookupCombo
        Left = 340
        Top = 24
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Descrição'#9'F')
        LookupTable = qryGestorCart
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblGestorCarteiraCloseUp
        OnEnter = dblGestorCarteiraEnter
        OnExit = dblGestorCarteiraExit
      end
      object BtProcura: TBitBtn
        Left = 634
        Top = 23
        Width = 24
        Height = 21
        TabOrder = 3
        OnClick = BtProcuraClick
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          0400000000007800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888888888800000000088088880FFFFFFF088008880F00F
          00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
          C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
          888888888888888888888888888888888888}
      end
      object CbxPlano: TCheckBox
        Left = 666
        Top = 25
        Width = 116
        Height = 17
        Caption = 'Todos os Planos'
        TabOrder = 4
        OnClick = CbxPlanoClick
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 55
      Width = 788
      Height = 399
      Align = alClient
      TabOrder = 1
      object PgcSaldos: TPageControl
        Left = 1
        Top = 1
        Width = 786
        Height = 397
        ActivePage = tbsVerificaResg
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TbsSaldo: TTabSheet
          Caption = '&Saldo'
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 778
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
            Width = 778
            Height = 43
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label14: TLabel
              Left = 220
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
            object Label30: TLabel
              Left = 6
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Opção'
            end
            object Label5: TLabel
              Left = 112
              Top = 3
              Width = 63
              Height = 13
              Caption = 'Aplicações'
            end
            object DbLkcSaldo: TwwDBLookupCombo
              Left = 220
              Top = 17
              Width = 404
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              LookupTable = QryFundoInvestOperacao
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object BtProduraSaldo: TBitBtn
              Left = 628
              Top = 16
              Width = 24
              Height = 21
              TabOrder = 3
              OnClick = BtProduraSaldoClick
              Glyph.Data = {
                EE000000424DEE000000000000007600000028000000100000000F0000000100
                0400000000007800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888800000000088088880FFFFFFF088008880F00F
                00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
                C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
                888888888888888888888888888888888888}
            end
            object CbxAplic: TComboBox
              Left = 6
              Top = 17
              Width = 100
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'CbxAplic'
              OnExit = CbxAplicExit
              Items.Strings = (
                'Todos'
                'Menor'
                'Maior =')
            end
            object DbDtRefAplc: TCMDateTimePicker
              Left = 112
              Top = 17
              Width = 100
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
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 68
            Width = 778
            Height = 301
            Align = alClient
            TabOrder = 2
            object dbGrdSaldos: TwwDBGrid
              Left = 1
              Top = 1
              Width = 776
              Height = 299
              Hint = 'Clique com o botão direito para Fixar Colunas'
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'25'#9'Plano / Patrocinadora'#9'F'
                'DESCFUNDOINVEST'#9'43'#9'Fundos'#9'F'
                'DATAAPLICACAO'#9'10'#9'Aplicação'#9'F'
                'DATAMOVFUNDO'#9'10'#9'Dt da Cota'#9'F'
                'SALDOQTDCOTAS'#9'26'#9'Quantidade'#9'F'
                'SALDOVLRFUNDO'#9'20'#9'Valor Bruto'#9'F'
                'VLRCOTAATUAL'#9'22'#9'Valor da Cota'#9'F'
                'SALDOQTDCOTASBLQ'#9'22'#9'Quantidade Bloqueada'#9'F'
                'VLRIOFPROV'#9'14'#9'IOF'#9'F'
                'VLRIRPROV'#9'16'#9'IRRF'#9'F'
                'SALDOLIQUIDO'#9'20'#9'Valor Líquido'#9'F'
                'VLRCOTAAPLICACAO'#9'22'#9'Cota Aplicacão'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DmRelFundosSaldo.DtsSaldoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgShowFooter]
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
              OnUpdateFooter = dbGrdSaldosUpdateFooter
            end
          end
        end
        object tbsVerificaResg: TTabSheet
          Caption = 'Verifica Resgates'
          ImageIndex = 3
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelOuter = bvNone
            Caption = 'Resgates Realizados'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel6: TPanel
            Left = 0
            Top = 25
            Width = 778
            Height = 43
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label15: TLabel
              Left = 6
              Top = 2
              Width = 87
              Height = 13
              Caption = 'Data Operação'
            end
            object Label16: TLabel
              Left = 113
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
            object DbLkcFundoInvestOperacao: TwwDBLookupCombo
              Left = 113
              Top = 17
              Width = 512
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento')
              LookupTable = QryFundoInvestOperacao
              LookupField = 'IDFUNDOINVEST'
              Options = [loColLines, loRowLines]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DbDtOperacao: TCMDateTimePicker
              Left = 6
              Top = 17
              Width = 100
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
              OnExit = DbDtOperacaoExit
            end
            object BtProduraOperacao: TBitBtn
              Left = 629
              Top = 16
              Width = 24
              Height = 21
              TabOrder = 2
              OnClick = BtProduraOperacaoClick
              Glyph.Data = {
                EE000000424DEE000000000000007600000028000000100000000F0000000100
                0400000000007800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888888888888888800000000088088880FFFFFFF088008880F00F
                00F000000880FFFFFFF000000080F00F00F000000880FFFFFFF088008884C4C4
                C4C48808888CF4CF4CFC88888884C4C4C44C8888888888888888888888888888
                888888888888888888888888888888888888}
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 68
            Width = 778
            Height = 301
            Align = alClient
            TabOrder = 2
            object dbgOperacao: TwwDBGrid
              Left = 1
              Top = 1
              Width = 776
              Height = 299
              Selected.Strings = (
                'DESCFUNDOINVEST'#9'43'#9'Fundo de Investimento'
                'DATAAPLICACAO'#9'12'#9'Aplicação'
                'VLRCOTA'#9'22'#9'Valor da Cota'
                'DATAOPERACAO'#9'12'#9'Data da Cota'
                'QTDOPERACAO'#9'26'#9'Quantidade'
                'VLROPERACAO'#9'20'#9'Valor da Operação'
                'VLRIR'#9'16'#9'IRRF'
                'VLRIOF'#9'14'#9'IOF')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
              Align = alClient
              Color = clWhite
              DataSource = DsOperacoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              KeyOptions = []
              Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgShowFooter]
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
              OnUpdateFooter = dbgOperacaoUpdateFooter
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 790
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
      object sbtnMovimento: TToolbarButton97
        Left = 307
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
        Left = 240
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
    Top = 502
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 226
      DockPos = 226
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 57
      DockPos = 57
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 341
    Top = 3
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 639
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FundoInvest'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    InsertSQL.Strings = (
      'insert into FundoInvest'
      '  (IDFUNDOINVEST, DESCFUNDOINVEST, IDGESTORCARTEIRA)'
      'values'
      '  (:IDFUNDOINVEST, :DESCFUNDOINVEST, :IDGESTORCARTEIRA)')
    DeleteSQL.Strings = (
      'delete from FundoInvest'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 583
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'HISTFUNDO.DATAMOVFUNDO'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      'FUNDOINVEST.DESCFUNDOINVEST'
      'HISTFUNDO.SALDOQTDCOTAS'
      'HISTFUNDO.SALDOVLRFUNDO')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Data do Saldo'
      'Plano / Patrocinadora'
      'Tipo de Fundo'
      'Fundo de Investimentos'
      'Quantidade'
      'Saldo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      
        '(SELECT H.IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.' +
        'DATAMOVFUNDO, SUM(H.SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(H.SALDO' +
        'VLRFUNDO) AS SALDOVLRFUNDO FROM HISTFUNDO H GROUP BY H.IDTIPOINV' +
        'EST, H.IDPLANPREVCTBPATR, H.IDFUNDOINVEST, H.DATAMOVFUNDO) HISTF' +
        'UNDO'
      'FUNDOINVEST'
      'TIPOFUNDOINVEST'
      'VWPLANPREVCTBPATR')
    CamposChave.Strings = (
      'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      'VWPLANPREVCTBPATR.IDPLANPREVCTBPATR'
      'FUNDOINVEST.IDFUNDOINVEST'
      'HISTFUNDO.DATAMOVFUNDO')
    Filtro.Strings = (
      'TIPOFUNDOINVEST.IDTIPOINVEST = HISTFUNDO.IDTIPOINVEST'
      
        'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST = FUNDOINVEST.IDTIPOFUNDOINVES' +
        'T'
      'FUNDOINVEST.IDFUNDOINVEST = HISTFUNDO.IDFUNDOINVEST'
      
        'VWPLANPREVCTBPATR.IDPLANPREVCTBPATR = HISTFUNDO.IDPLANPREVCTBPAT' +
        'R')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,#0.000000000000'
      '###,#0.00')
    Larguras.Strings = (
      '14'
      '30'
      '20'
      '50'
      '26'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 373
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 405
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 437
    Top = 3
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select       FI.IdFundoInvest,'
      '                FI.DescFundoInvest,'
      '                FI.IdGestorCarteira,'
      ' '#39' '#39' AS STATUS,'
      ' '#39' '#39' AS STATUS1,'
      ' '#39' '#39' AS STATUS2,'
      ' '#39' '#39' AS STATUS3,'
      ' '#39' '#39' AS STATUS4,'
      ' '#39' '#39' AS STATUS5'
      ''
      'From         FundoInvest FI'
      ''
      'Order By FI.DescfUNDOInvest'
      '')
    UpdateObject = nil
    ControlType.Strings = (
      'STATUS;CheckBox;Yes;No')
    Left = 611
    Top = 2
  end
  object QryFundoInvestOperacao: TwwQuery
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
      ''
      'FROM'
      '  TIPOFUNDOINVEST TFI,'
      
        ' (SELECT * FROM HISTFUNDOINVEST WHERE (IDFUNDOINVEST || TO_CHAR(' +
        'DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI:SS'#39') IN'
      
        '          (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST'
      
        '           WHERE (((:DATAOPERACAO IS NOT NULL) AND (DTAVIGENCIA ' +
        '< TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')+1)) OR'
      '                   (:DATAOPERACAO IS NULL))'
      '           GROUP BY IDFUNDOINVEST))) FUN'
      'WHERE'
      
        '       (((:IDTIPOINVEST <> 0) AND (TFI.IDTIPOINVEST = :IDTIPOINV' +
        'EST)) OR'
      '         (:IDTIPOINVEST = 0))'
      
        '  AND  (((:IDGESTORCARTEIRA IS NOT NULL) AND (FUN.IDGESTORCARTEI' +
        'RA  = :IDGESTORCARTEIRA)) OR'
      '        (:IDGESTORCARTEIRA IS NULL) )'
      
        '  AND  (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (FUN.IDTIPOFUNDOIN' +
        'VEST = :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL))'
      '  AND (FUN.IDTIPOFUNDOINVEST = TFI.IDTIPOFUNDOINVEST)'
      ''
      'ORDER BY  FUN.DESCFUNDOINVEST'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 374
    Top = 301
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryFundoInvestOperacaoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
    end
    object QryFundoInvestOperacaoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestOperacaoIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
    end
    object QryFundoInvestOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
    end
    object QryFundoInvestOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Size = 30
    end
    object QryFundoInvestOperacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
    end
    object QryFundoInvestOperacaoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
    end
    object QryFundoInvestOperacaoIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object QryFundoInvestOperacaoCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object QryFundoInvestOperacaoSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
    end
    object QryFundoInvestOperacaoPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
    end
    object QryFundoInvestOperacaoPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
    end
    object QryFundoInvestOperacaoPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
    end
    object QryFundoInvestOperacaoQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
    end
    object QryFundoInvestOperacaoQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
    end
    object QryFundoInvestOperacaoSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
    end
    object QryFundoInvestOperacaoPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
    end
    object QryFundoInvestOperacaoPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
    end
    object QryFundoInvestOperacaoCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Size = 30
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestOperacaoCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Size = 30
    end
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TIP.IDTIPOINVEST      , TIP.IDTIPOOPERACAO    , '
      '  TIP.DESCTIPOOPERACAO  , TIP.NATUREZAOPERACAO  '
      'FROM '
      '  TIPOOPERACAO TIP'
      'WHERE'
      '  TIP.IDTIPOINVEST IN (6)'
      'ORDER BY '
      '  TIP.DESCTIPOOPERACAO'
      '')
    ValidateWithMask = True
    Left = 235
    Top = 245
    object QryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 472
    Top = 3
  end
  object QryData: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT MAX(DATA.DATA) AS DATA FROM'
      ' ('
      '   SELECT MAX(DATAOPERACAO) AS DATA '
      '   FROM OPERACAOFUNDO'
      
        '   WHERE (((:IDTIPOINVEST <> 0)  AND (IDTIPOINVEST = :IDTIPOINVE' +
        'ST)) OR (:IDTIPOINVEST = 0))'
      ''
      '   UNION'
      '   SELECT MAX(DATAPEDIDO) AS DATA '
      '   FROM PEDIDOFUNDO'
      
        '   WHERE (((:IDTIPOINVEST <> 0)  AND (IDTIPOINVEST = :IDTIPOINVE' +
        'ST)) OR (:IDTIPOINVEST = 0))'
      ''
      '   UNION'
      '   SELECT MAX(DATAMOVFUNDO) AS DATA '
      '   FROM HISTFUNDO'
      
        '   WHERE (((:IDTIPOINVEST <> 0)  AND (IDTIPOINVEST = :IDTIPOINVE' +
        'ST)) OR (:IDTIPOINVEST = 0))'
      ''
      '  ) DATA'
      ' ')
    ValidateWithMask = True
    Left = 520
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
        Value = 0
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
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
  end
  object QryTipoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOFUNDOINVEST'
      
        'WHERE (((:IDTIPOINVEST <> 0) AND (IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '        (:IDTIPOINVEST = 0))'
      'ORDER BY DESCTIPOFUNDOINV')
    ValidateWithMask = True
    Left = 234
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
  end
  object qryGestorCart: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT G.IdGestorCarteira , P.IdPessoa, P.Nome'
      'FROM Pessoa P, GestorCarteira G, fundoinvest F'
      'WHERE P.IdPessoa = G.IdGestorCarteira AND'
      '      G.IdGestorCarteira(+) = F.IdGestorCarteira'
      'ORDER BY P.Nome')
    ValidateWithMask = True
    Left = 302
    Top = 102
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
      Origin = 'GESTORCARTEIRA.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryGestorCartIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object QryOperacoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  OPE.IDOPERACAOFUNDO   , OPE.IDCARTEIRAINVEST  , OPE.IDPEDIDOFU' +
        'NDO     , OPE.IDTIPOINVEST      ,'
      
        '  OPE.IDTIPOOPERACAO    , OPE.IDFUNDOINVEST     , OPE.DATAOPERAC' +
        'AO      , OPE.DATALIQUIDACAO    ,'
      
        '  OPE.QTDOPERACAO       , (OPE.VLROPERACAO + (NVL(OPE.VLRIOF,0)+' +
        'NVL(OPE.VLRIR,0)) ) AS VLROPERACAO,'
      '  OPE.VLRCOTA           , OPE.VLRIR             ,'
      
        '  OPE.VLRIOF            , OPE.VLRRENDIMENTO     , OPE.STACONFIRM' +
        'A       ,'
      '  OPE.VLROPERACAO AS VLRLIQUIDO, OPE.IDOPERACAOORIGEM,'
      
        '/*  TO_CHAR(OPE.QTDOPERACAO,'#39'FM999G999G999G999D999999999999'#39')AS ' +
        'QTDMOSTRA , */'
      
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
      '  CAR.IDPLANOPREV       , CAR.IDPATROCINADORA   ,'
      
        '  DECODE(OPE.IDPEDIDOFUNDO, NULL,OPE.IDOPERACAOFUNDO,OPE.IDPEDID' +
        'OFUNDO) AS IDBOLETA ,'
      '  HF.DATAAPLICACAO'
      ''
      'FROM'
      '  OPERACAOFUNDO OPE,'
      '  (SELECT DISTINCT IDOPERACAOFUNDO, DATAAPLICACAO'
      '   FROM   HISTFUNDO'
      '   WHERE (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '         (IDTIPOINVEST      = :IDTIPOINVEST)'
      '   ORDER BY IDOPERACAOFUNDO) HF,'
      '  HISTFUNDOINVEST FUN, CARTEIRAINVEST CAR,'
      ' (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '  FROM   TIPOOPERACAO'
      '  WHERE'
      '         (IDTIPOINVEST     = :IDTIPOINVEST)'
      '    AND  (IDTIPOOPERACAO   > 0)'
      '    AND  (CODTIPDOC IS NOT NULL)'
      '    AND  (NATUREZAOPERACAO = '#39'D'#39')) TPO'
      ''
      'WHERE'
      '      (OPE.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '  AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '        ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '  AND  (((:IDFUNDOINVEST IS NULL)     AND (OPE.IDFUNDOINVEST > 0' +
        ')) OR'
      
        '        ((:IDFUNDOINVEST IS NOT NULL) AND (OPE.IDFUNDOINVEST = :' +
        'IDFUNDOINVEST)))'
      ''
      
        '  AND (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY' +
        #39') )'
      ''
      
        '  AND (FUN.IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN'
      
        '          (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '           WHERE'
      '                  (TF.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '           AND (((:IDGESTORCARTEIRA  IS NOT NULL) AND (HF.IDGEST' +
        'ORCARTEIRA  = :IDGESTORCARTEIRA)) OR'
      '                 (:IDGESTORCARTEIRA  IS NULL) )'
      
        '           AND (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '                 (:IDTIPOFUNDOINVEST IS NULL) )'
      '           AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '           AND (HF.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)'
      '           AND (HF.DTAVIGENCIA      < OPE.DATAOPERACAO+1)'
      '           GROUP BY IDFUNDOINVEST))'
      '  AND (OPE.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)'
      '  AND (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      '  AND (HF.IDOPERACAOFUNDO(+) = OPE.IDOPERACAOORIGEM)'
      '  AND (FUN.IDCARTEIRAINVEST  = CAR.IDCARTEIRAINVEST(+))'
      'ORDER BY FUN.DESCFUNDOINVEST, HF.DATAAPLICACAO')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 472
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
        Value = '31/07/2001'
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryOperacoesDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 43
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryOperacoesDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 12
      FieldName = 'DATAAPLICACAO'
    end
    object QryOperacoesVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 22
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,#0.000000000'
    end
    object QryOperacoesDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Cota'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
    end
    object QryOperacoesQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 26
      FieldName = 'QTDOPERACAO'
      DisplayFormat = '###,#0.000000000'
    end
    object QryOperacoesVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
    end
    object QryOperacoesVLRIR: TFloatField
      DisplayLabel = 'IRRF'
      DisplayWidth = 16
      FieldName = 'VLRIR'
    end
    object QryOperacoesVLRIOF: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 14
      FieldName = 'VLRIOF'
    end
    object QryOperacoesIDOPERACAOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOFUNDO'
      Visible = False
    end
    object QryOperacoesIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryOperacoesIDPEDIDOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object QryOperacoesIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryOperacoesIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryOperacoesIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryOperacoesDATALIQUIDACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALIQUIDACAO'
      Visible = False
    end
    object QryOperacoesVLRRENDIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRRENDIMENTO'
      Visible = False
    end
    object QryOperacoesSTACONFIRMA: TStringField
      DisplayWidth = 1
      FieldName = 'STACONFIRMA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryOperacoesVLRLIQUIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLIQUIDO'
      Visible = False
    end
    object QryOperacoesIDOPERACAOORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object QryOperacoesIDFUNDOINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST_1'
      Visible = False
    end
    object QryOperacoesIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryOperacoesTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryOperacoesTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryOperacoesMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryOperacoesIDCARTEIRAINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST_1'
      Visible = False
    end
    object QryOperacoesIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryOperacoesCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryOperacoesSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryOperacoesPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryOperacoesPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryOperacoesPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryOperacoesPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryOperacoesQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryOperacoesQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryOperacoesSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryOperacoesPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryOperacoesPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryOperacoesPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryOperacoesCODFUNCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryOperacoesSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryOperacoesSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryOperacoesCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryOperacoesIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryOperacoesIDPATROCINADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object QryOperacoesIDBOLETA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Visible = False
    end
  end
  object DsOperacoes: TwwDataSource
    DataSet = QryOperacoes
    Left = 560
    Top = 268
  end
  object QryTotalOperacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  SUM(OPE.QTDOPERACAO) AS QTDOPERACAO, SUM(OPE.VLRIR) AS VLRIR,'
      
        '  SUM(OPE.VLRIOF) AS VLRIOF,           SUM(OPE.VLROPERACAO) AS V' +
        'LROPERACAO'
      'FROM'
      '  OPERACAOFUNDO OPE, HISTFUNDOINVEST FUN,'
      '  (SELECT DISTINCT IDOPERACAOFUNDO, DATAAPLICACAO'
      '   FROM   HISTFUNDO'
      '   WHERE (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      '         (IDTIPOINVEST      = :IDTIPOINVEST)'
      '   ORDER BY IDOPERACAOFUNDO) HF,'
      ''
      ' (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '  FROM   TIPOOPERACAO'
      '  WHERE'
      '         (IDTIPOINVEST     = :IDTIPOINVEST)'
      '    AND  (IDTIPOOPERACAO   > 0)'
      '    AND  (CODTIPDOC IS NOT NULL)'
      '    AND  (NATUREZAOPERACAO = '#39'D'#39')) TPO'
      ''
      'WHERE'
      '      (OPE.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '  AND  (((:IDPLANPREVCTBPATR IS NULL)     AND (OPE.IDPLANPREVCTB' +
        'PATR > 0)) OR'
      
        '        ((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPE.IDPLANPREVCTB' +
        'PATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '  AND  (((:IDFUNDOINVEST IS NULL)     AND (OPE.IDFUNDOINVEST > 0' +
        ')) OR'
      
        '        ((:IDFUNDOINVEST IS NOT NULL) AND (OPE.IDFUNDOINVEST = :' +
        'IDFUNDOINVEST)))'
      ''
      
        '  AND (OPE.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY' +
        #39') )'
      ''
      
        '  AND (FUN.IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN'
      
        '          (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA' +
        '),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '           FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '           WHERE'
      '                  (TF.IDTIPOINVEST   = :IDTIPOINVEST)'
      
        '           AND (((:IDGESTORCARTEIRA  IS NOT NULL) AND (HF.IDGEST' +
        'ORCARTEIRA  = :IDGESTORCARTEIRA)) OR'
      '                 (:IDGESTORCARTEIRA  IS NULL) )'
      
        '           AND (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (HF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST)) OR'
      '                 (:IDTIPOFUNDOINVEST IS NULL) )'
      '           AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '           AND (HF.IDFUNDOINVEST     = OPE.IDFUNDOINVEST)'
      '           AND (HF.DTAVIGENCIA      < OPE.DATAOPERACAO+1)'
      '           GROUP BY IDFUNDOINVEST))'
      '  AND (OPE.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)'
      '  AND (TPO.IDTIPOOPERACAO    = OPE.IDTIPOOPERACAO)'
      '  AND (HF.IDOPERACAOFUNDO(+) = OPE.IDOPERACAOORIGEM)')
    ControlType.Strings = (
      'STACONFIRMA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 472
    Top = 221
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
        Value = '3'
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
  end
  object dsTotalOperacao: TwwDataSource
    DataSet = QryTotalOperacao
    Left = 558
    Top = 221
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAULTFECH'
      'FROM TIPOFUNDOINVEST'
      'WHERE (IDTIPOINVEST = :IDTIPOINVEST)'
      
        '  AND (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL) )'
      'ORDER BY DATAULTFECH DESC ')
    ValidateWithMask = True
    Left = 55
    Top = 247
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
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
      '       (IDTIPOINVEST      = :IDTIPOINVEST)        AND'
      '       (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)   AND'
      
        '    (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST =:IDFUNDOI' +
        'NVEST)) OR'
      '      (:IDFUNDOINVEST IS NULL))                   AND'
      
        '       (DATAAPLICACAO    <= TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39')' +
        ') AND'
      
        '       (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39')' +
        ')'
      ' ')
    ValidateWithMask = True
    Left = 143
    Top = 247
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 682
    Top = 215
  end
  object PopMnuSaldo: TPopupMenu
    Left = 704
    object MnuUmPlanoAbert: TMenuItem
      OnClick = MnuUmPlanoAbertClick
    end
    object MnuTodosPlanosAbert: TMenuItem
      Caption = '&Todos os Planos'
      OnClick = MnuTodosPlanosAbertClick
    end
  end
end
