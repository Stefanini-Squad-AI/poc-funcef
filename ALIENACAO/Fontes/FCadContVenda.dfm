inherited FrmCadContVenda: TFrmCadContVenda
  Left = 26
  Top = 82
  Caption = 'Proposta de Financiamento'
  ClientHeight = 421
  ClientWidth = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 728
    Height = 335
    inherited pnlMestre: TPanel
      Width = 726
      Height = 156
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Nº da Proposta'
        FocusControl = edNumCont
      end
      object Label2: TLabel
        Left = 176
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = edNomeCont
      end
      object Label3: TLabel
        Left = 216
        Top = 56
        Width = 82
        Height = 13
        Caption = 'Data Proposta'
        FocusControl = edNomeCont
      end
      object Label4: TLabel
        Left = 8
        Top = 56
        Width = 95
        Height = 13
        Caption = 'Data Aniversário'
        FocusControl = edNomeCont
      end
      object Label15: TLabel
        Left = 451
        Top = 56
        Width = 113
        Height = 13
        Caption = '% Comiss. Corretora'
        FocusControl = edNomeCont
      end
      object Label17: TLabel
        Left = 136
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Nº de meses'
        FocusControl = edNomeCont
      end
      object Label18: TLabel
        Left = 352
        Top = 56
        Width = 88
        Height = 13
        Caption = '% Ideal Aluguel'
        FocusControl = edNomeCont
      end
      object Label19: TLabel
        Left = 573
        Top = 56
        Width = 90
        Height = 13
        Caption = 'Valor Avaliação'
        FocusControl = edNomeCont
      end
      object Label14: TLabel
        Left = 8
        Top = 104
        Width = 128
        Height = 13
        Caption = 'Tx. Juros Merc. Finac.'
        FocusControl = edNomeCont
      end
      object btnCalcValContab: TSpeedButton
        Left = 488
        Top = 119
        Width = 25
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        OnClick = btnCalcValContabClick
      end
      object Label21: TLabel
        Left = 536
        Top = 104
        Width = 84
        Height = 13
        Caption = 'Valor Presente'
        FocusControl = edNomeCont
      end
      object Label20: TLabel
        Left = 360
        Top = 104
        Width = 80
        Height = 13
        Caption = 'Valor Contabil'
        FocusControl = edNomeCont
      end
      object btnCalcValPresente: TSpeedButton
        Left = 672
        Top = 119
        Width = 25
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        NumGlyphs = 2
        OnClick = btnCalcValPresenteClick
      end
      object edNumCont: TDBEdit
        Left = 8
        Top = 24
        Width = 161
        Height = 21
        DataField = 'CONNUMERO'
        DataSource = ds
        TabOrder = 0
      end
      object edNomeCont: TDBEdit
        Left = 176
        Top = 24
        Width = 517
        Height = 21
        DataField = 'CONNOME'
        DataSource = ds
        TabOrder = 1
      end
      object edDataProp: TCMDateTimePicker
        Left = 216
        Top = 72
        Width = 129
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'CONDATAINICIO'
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
      object edDataAni: TCMDateTimePicker
        Left = 8
        Top = 72
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'CONDATAASSINATURA'
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
      object edPercComiss: TDBRealEdit
        Left = 451
        Top = 72
        Width = 113
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONTAXAADMIN'
        DataSource = ds
      end
      object edNumMes: TDBRealEdit
        Left = 136
        Top = 72
        Width = 73
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
        DataField = 'CONPERREAJUSTE'
        DataSource = ds
      end
      object edPercIdeal: TDBRealEdit
        Left = 352
        Top = 72
        Width = 89
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONPERCENTMULTA'
        DataSource = ds
      end
      object edValAvali: TDBRealEdit
        Left = 573
        Top = 72
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONVLRAJUSTADO'
        DataSource = ds
      end
      object edTxJurMercFinanc: TDBRealEdit
        Left = 8
        Top = 120
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'CONPERCENTMORA'
        DataSource = ds
      end
      object RgPercTxMF: TDBRadioGroup
        Left = 139
        Top = 101
        Width = 193
        Height = 41
        Caption = ' Período '
        Columns = 3
        DataField = 'CONPERMORA'
        DataSource = ds
        Items.Strings = (
          'Dias'
          'Meses'
          'Anos')
        TabOrder = 9
        Values.Strings = (
          'D'
          'M'
          'A')
      end
      object edValContab: TDBRealEdit
        Left = 360
        Top = 120
        Width = 129
        Height = 21
        Alignment = taRightJustify
        Color = 14876158
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRCONTABIL'
        DataSource = ds
      end
      object edValPresente: TDBRealEdit
        Left = 536
        Top = 120
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Color = 14876158
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPRESENTE'
        DataSource = ds
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 157
      Width = 726
      Height = 177
      Tabs.Strings = (
        'Imóveis'
        'Condição de Pagamento'
        'Aluguel'
        'Descrição'
        'Análise Inicial')
      detdbGrids.Strings = (
        'dbgrdDet'
        'grdCondPag'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 628
        Height = 118
        ActivePage = TabAnalIni
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 620
            Height = 90
            Selected.Strings = (
              'IMONOME'#9'40'#9'Imovel'
              'MESTRE'#9'40'#9'Mestre')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel
            Width = 620
            Height = 90
            object Label5: TLabel
              Left = 16
              Top = 8
              Width = 38
              Height = 13
              Caption = 'Imóvel'
            end
            object cmpImovel: TCMProcura
              Left = 16
              Top = 24
              Width = 601
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              DataSource = dsDet
              DataField = 'IDIMOVEL'
              LookupChave = 'IDIMOVEL'
              LookupDescricao = 'IMONOME'
              MontaSelect = msImovel
              LookupTabela = 'CM.IMOVEL'
              DataBaseName = 'BaseDados'
              ReadOnly = False
            end
          end
        end
        object TabCond: TTabSheet
          Caption = 'Condição de Pagamento'
          object grdCondPag: TwwDBGrid
            Left = 0
            Top = 0
            Width = 620
            Height = 90
            Selected.Strings = (
              'DATAINI'#9'10'#9'Início'
              'FLGSINAL'#9'1'#9'Sinal'
              'NUMPARCELAS'#9'10'#9'Nº Parcelas'
              'VLRFINANC'#9'10'#9'Valor '
              'PRAZO'#9'1'#9'Prazo'
              'PERIODO'#9'1'#9'Período'
              'INDCORRECAO'#9'20'#9'Indice Correção'
              'TAXAJUROS'#9'10'#9'Juros'
              'PERIODOTAXA'#9'1'#9'Período Juros')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCondPag
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 620
            Height = 90
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label9: TLabel
              Left = 8
              Top = 56
              Width = 109
              Height = 13
              Caption = 'Indice de Correção'
            end
            object Label10: TLabel
              Left = 344
              Top = 8
              Width = 33
              Height = 13
              Caption = 'Prazo'
            end
            object Label11: TLabel
              Left = 216
              Top = 8
              Width = 96
              Height = 13
              Caption = 'Valor Financiado'
            end
            object Label12: TLabel
              Left = 8
              Top = 8
              Width = 63
              Height = 13
              Caption = 'Data Inicio'
            end
            object Label13: TLabel
              Left = 288
              Top = 56
              Width = 81
              Height = 13
              Caption = 'Taxa de Juros'
            end
            object Label22: TLabel
              Left = 136
              Top = 8
              Width = 62
              Height = 13
              Caption = 'Nº Parcela'
            end
            object edDataIniParc: TCMDateTimePicker
              Left = 8
              Top = 24
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINI'
              DataSource = dsCondPag
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
            object chkSinal: TDBCheckBox
              Left = 136
              Top = 72
              Width = 161
              Height = 17
              Caption = 'Essa Parcela é Sinal'
              DataField = 'FLGSINAL'
              DataSource = dsCondPag
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object edValParc: TDBRealEdit
              Left = 216
              Top = 24
              Width = 121
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
              DataField = 'VLRFINANC'
              DataSource = dsCondPag
            end
            object edPrazo: TDBRealEdit
              Left = 344
              Top = 24
              Width = 73
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
              DataField = 'PERIODO'
              DataSource = dsCondPag
            end
            object RgPeriodo: TDBRadioGroup
              Left = 424
              Top = 8
              Width = 193
              Height = 41
              Caption = ' Período '
              Columns = 3
              DataField = 'PRAZO'
              DataSource = dsCondPag
              Items.Strings = (
                'Dias'
                'Meses'
                'Anos')
              TabOrder = 4
              Values.Strings = (
                'D'
                'M'
                'A')
            end
            object edJuros: TDBRealEdit
              Left = 288
              Top = 72
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'TAXAJUROS'
              DataSource = dsCondPag
            end
            object RgPerJuros: TDBRadioGroup
              Left = 424
              Top = 56
              Width = 193
              Height = 41
              Caption = ' Período '
              Columns = 3
              DataField = 'PERIODOTAXA'
              DataSource = dsCondPag
              Items.Strings = (
                'Dias'
                'Meses'
                'Anos')
              TabOrder = 7
              Values.Strings = (
                'D'
                'M'
                'A')
            end
            object dblcIndCorret: TCMDBLookupCombo
              Left = 8
              Top = 72
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Descrição')
              DataField = 'INDCORRECAO'
              DataSource = dsCondPag
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edNumParc: TDBRealEdit
              Left = 136
              Top = 24
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = iNumber
              Signal = False
              DataField = 'NUMPARCELAS'
              DataSource = dsCondPag
            end
          end
        end
        object tabAlug: TTabSheet
          Caption = 'Aluguel'
          object Label16: TLabel
            Left = 474
            Top = 23
            Width = 76
            Height = 13
            Caption = 'Valor Aluguel'
            FocusControl = edNomeCont
          end
          object btnCalcValAluguel: TSpeedButton
            Left = 594
            Top = 37
            Width = 25
            Height = 23
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            OnClick = btnCalcValAluguelClick
          end
          object Label6: TLabel
            Left = 8
            Top = 23
            Width = 108
            Height = 13
            Caption = 'Indice de Reajuste'
          end
          object Label7: TLabel
            Left = 232
            Top = 23
            Width = 114
            Height = 13
            Caption = 'Data Base Reajuste'
          end
          object Label8: TLabel
            Left = 379
            Top = 12
            Width = 87
            Height = 13
            Caption = 'Prazo Reajuste'
            FocusControl = edNomeCont
          end
          object Label23: TLabel
            Left = 379
            Top = 23
            Width = 57
            Height = 13
            Caption = 'em Meses'
            FocusControl = edNomeCont
          end
          object edValAluguel: TDBRealEdit
            Left = 474
            Top = 39
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'CONVLRTOTAL'
            DataSource = ds
          end
          object dblcIndCorAlug: TCMDBLookupCombo
            Left = 8
            Top = 39
            Width = 209
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'Descrição')
            DataField = 'CONINDICEREAJUSTE'
            DataSource = ds
            LookupTable = qryMoeda
            LookupField = 'MOECODIGO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object edDataReajAlug: TCMDateTimePicker
            Left = 232
            Top = 39
            Width = 137
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'CONDATAREAJUSTE'
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
          object dbrePrReajAlug: TDBRealEdit
            Left = 379
            Top = 39
            Width = 73
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
            DataField = 'CONDIASTOLERANCIA'
            DataSource = ds
          end
        end
        object TabDesc: TTabSheet
          Caption = 'TabDesc'
          object memDesc: TDBMemo
            Left = 0
            Top = 0
            Width = 623
            Height = 82
            Align = alClient
            DataField = 'CONDESCRICAO'
            DataSource = ds
            TabOrder = 0
          end
        end
        object TabAnalIni: TTabSheet
          Caption = 'TabAnalIni'
          object Label24: TLabel
            Left = 8
            Top = 4
            Width = 76
            Height = 13
            Caption = 'Avaliação  + '
          end
          object Label25: TLabel
            Left = 120
            Top = 4
            Width = 22
            Height = 13
            Caption = ' %  '
          end
          object Label26: TLabel
            Left = 139
            Top = 4
            Width = 53
            Height = 13
            Caption = 'Aluguel /'
          end
          object lbPercAlug: TDBText
            Left = 203
            Top = 4
            Width = 41
            Height = 17
            Alignment = taRightJustify
            DataField = 'CONPERCENTMULTA'
            DataSource = ds
          end
          object Label27: TLabel
            Left = 246
            Top = 4
            Width = 26
            Height = 13
            Caption = ' %   '
          end
          object lbTxCorret: TDBText
            Left = 88
            Top = 4
            Width = 33
            Height = 17
            Alignment = taRightJustify
            DataField = 'CONTAXAADMIN'
            DataSource = ds
          end
          object Label28: TLabel
            Left = 270
            Top = 4
            Width = 84
            Height = 13
            Caption = 'Valor Presente'
          end
          object Label29: TLabel
            Left = 403
            Top = 4
            Width = 135
            Height = 13
            Caption = 'Valor Total da Proposta'
          end
          object btnCalcAnal: TSpeedButton
            Left = 545
            Top = 3
            Width = 91
            Height = 38
            Caption = 'Calcular'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
              73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
              0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
              0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
              0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
              0333337F777777737F333308888888880333337F333333337F33330888888888
              03333373FFFFFFFF733333700000000073333337777777773333}
            NumGlyphs = 2
            OnClick = btnCalcAnalClick
          end
          object edValorAvali: TRealEdit
            Left = 8
            Top = 20
            Width = 126
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edValorAlug: TRealEdit
            Left = 139
            Top = 20
            Width = 126
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edValPresAnal: TRealEdit
            Left = 270
            Top = 20
            Width = 126
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
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
          end
          object edValTotProp: TRealEdit
            Left = 403
            Top = 20
            Width = 126
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object gbVende: TGroupBox
            Left = 8
            Top = 50
            Width = 623
            Height = 44
            Caption = ' Comparação do Aluguel x Valor Presente '
            TabOrder = 4
            object lbVende: TLabel
              Left = 2
              Top = 15
              Width = 619
              Height = 27
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 718
      end
      inherited Dock974: TDock97
        Left = 632
        Height = 118
      end
    end
  end
  inherited Dock972: TDock97
    Width = 728
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 728
    inherited tb97Fundo: TToolbar97
      Left = 556
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 387
      DockPos = 390
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CONNUMERO = :CONNUMERO,'
      '  CONNOME = :CONNOME,'
      '  CONDATAASSINATURA = :CONDATAASSINATURA,'
      '  CONDATAINICIO = :CONDATAINICIO,'
      '  FLGTIPOCONTRATO = :FLGTIPOCONTRATO,'
      '  CONPERCENTMORA = :CONPERCENTMORA,'
      '  CONPERMORA = :CONPERMORA,'
      '  CONTAXAADMIN = :CONTAXAADMIN,'
      '  CONVLRAJUSTADO = :CONVLRAJUSTADO,'
      '  CONPERREAJUSTE = :CONPERREAJUSTE,'
      '  CONPERCENTMULTA = :CONPERCENTMULTA,'
      '  CONVLRTOTAL = :CONVLRTOTAL,'
      '  CONDESCRICAO = :CONDESCRICAO,'
      '  VLRPROPOSTA = :VLRPROPOSTA,'
      '  VLRPRESENTE = :VLRPRESENTE,'
      '  VLRCONTABIL = :VLRCONTABIL,'
      '  CONINDICEMORA = :CONINDICEMORA,'
      '  CONINDICEREAJUSTE = :CONINDICEREAJUSTE,'
      '  CONDATAREAJUSTE = :CONDATAREAJUSTE,'
      '  CONDIASTOLERANCIA = :CONDIASTOLERANCIA'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOIMOVEL'
      
        '  (IDCONTRATOIMOVEL, CONNUMERO, CONNOME, CONDATAASSINATURA, COND' +
        'ATAINICIO, '
      
        '   FLGTIPOCONTRATO, CONPERCENTMORA, CONPERMORA, CONTAXAADMIN, CO' +
        'NVLRAJUSTADO, '
      
        '   CONPERREAJUSTE, CONPERCENTMULTA, CONVLRTOTAL, CONDESCRICAO, V' +
        'LRPROPOSTA, '
      
        '   VLRPRESENTE, VLRCONTABIL, CONINDICEMORA, CONINDICEREAJUSTE, C' +
        'ONDATAREAJUSTE, '
      '   CONDIASTOLERANCIA)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :CONNUMERO, :CONNOME, :CONDATAASSINATURA, ' +
        ':CONDATAINICIO, '
      
        '   :FLGTIPOCONTRATO, :CONPERCENTMORA, :CONPERMORA, :CONTAXAADMIN' +
        ', :CONVLRAJUSTADO, '
      
        '   :CONPERREAJUSTE, :CONPERCENTMULTA, :CONVLRTOTAL, :CONDESCRICA' +
        'O, :VLRPROPOSTA, '
      
        '   :VLRPRESENTE, :VLRCONTABIL, :CONINDICEMORA, :CONINDICEREAJUST' +
        'E, :CONDATAREAJUSTE, '
      '   :CONDIASTOLERANCIA)')
    DeleteSQL.Strings = (
      'delete from CONTRATOIMOVEL'
      'where'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'CONTRATOIMOVEL.CONDATAINICIO'
      'CONTRATOIMOVEL.CONDATAASSINATURA')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº  da Proposta'
      'Nome'
      'Data da Proposta'
      'Data de Aniverssário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL')
    Filtro.Strings = (
      'CONTRATOIMOVEL.FLGTIPOCONTRATO = '#39'V'#39)
    Mascaras.Strings = (
      ''
      ''
      'dd/mm/yyyy'
      '')
    Larguras.Strings = (
      '20'
      '40'
      '10'
      '10')
    Left = 677
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     CI.IDCONTRATOIMOVEL,'
      '     CI.CONNUMERO,'
      '     CI.CONNOME,'
      '     CI.CONDATAASSINATURA,'
      '     CI.CONDATAINICIO,'
      '     CI.FLGTIPOCONTRATO,'
      '     CI.CONPERCENTMORA,'
      '     CI.CONPERMORA,'
      '     CI.CONTAXAADMIN,'
      '     CI.CONVLRAJUSTADO,'
      '     CI.CONPERREAJUSTE,'
      '     CI.CONPERCENTMULTA,'
      '     CI.CONVLRTOTAL,'
      '     CI.CONDESCRICAO,'
      '     CI.VLRPROPOSTA,'
      '     CI.VLRPRESENTE,'
      '     CI.VLRCONTABIL,'
      '     CI.CONINDICEMORA,'
      '     CI.CONINDICEREAJUSTE,'
      '     CI.CONDATAREAJUSTE,'
      '     CI.CONDIASTOLERANCIA'
      'FROM'
      '     CONTRATOIMOVEL CI'
      'WHERE'
      '     (CI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      '')
    Left = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = '"CM.CONTRATOIMOVEL".IDCONTRATOIMOVEL'
    end
    object qryCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Origin = '"CM.CONTRATOIMOVEL".CONNUMERO'
    end
    object qryCONNOME: TStringField
      FieldName = 'CONNOME'
      Origin = '"CM.CONTRATOIMOVEL".CONNOME'
      Size = 60
    end
    object qryCONDATAASSINATURA: TDateTimeField
      FieldName = 'CONDATAASSINATURA'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAASSINATURA'
    end
    object qryCONDATAINICIO: TDateTimeField
      FieldName = 'CONDATAINICIO'
      Origin = '"CM.CONTRATOIMOVEL".CONDATAINICIO'
    end
    object qryFLGTIPOCONTRATO: TStringField
      FieldName = 'FLGTIPOCONTRATO'
      Origin = '"CM.CONTRATOIMOVEL".FLGTIPOCONTRATO'
      Size = 1
    end
    object qryCONPERCENTMORA: TFloatField
      FieldName = 'CONPERCENTMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERCENTMORA'
    end
    object qryCONPERMORA: TStringField
      FieldName = 'CONPERMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERMORA'
      Size = 1
    end
    object qryCONTAXAADMIN: TFloatField
      FieldName = 'CONTAXAADMIN'
      Origin = '"CM.CONTRATOIMOVEL".CONTAXAADMIN'
    end
    object qryCONVLRAJUSTADO: TFloatField
      FieldName = 'CONVLRAJUSTADO'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRAJUSTADO'
    end
    object qryCONPERREAJUSTE: TFloatField
      FieldName = 'CONPERREAJUSTE'
      Origin = '"CM.CONTRATOIMOVEL".CONPERREAJUSTE'
    end
    object qryCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Origin = '"CM.CONTRATOIMOVEL".CONPERCENTMULTA'
    end
    object qryCONVLRTOTAL: TFloatField
      FieldName = 'CONVLRTOTAL'
      Origin = '"CM.CONTRATOIMOVEL".CONVLRTOTAL'
    end
    object qryCONDESCRICAO: TMemoField
      FieldName = 'CONDESCRICAO'
      Origin = '"CM.CONTRATOIMOVEL".CONDESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryVLRPROPOSTA: TFloatField
      FieldName = 'VLRPROPOSTA'
      Origin = '"CM.CONTRATOIMOVEL".VLRPROPOSTA'
    end
    object qryVLRPRESENTE: TFloatField
      FieldName = 'VLRPRESENTE'
      Origin = '"CM.CONTRATOIMOVEL".VLRPRESENTE'
    end
    object qryVLRCONTABIL: TFloatField
      FieldName = 'VLRCONTABIL'
      Origin = '"CM.CONTRATOIMOVEL".VLRCONTABIL'
    end
    object qryCONINDICEMORA: TFloatField
      FieldName = 'CONINDICEMORA'
      Origin = '"CM.CONTRATOIMOVEL".CONINDICEMORA'
    end
    object qryCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONINDICEREAJUSTE'
    end
    object qryCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
      Origin = 'CONTRATOIMOVEL.CONDATAREAJUSTE'
    end
    object qryCONDIASTOLERANCIA: TFloatField
      FieldName = 'CONDIASTOLERANCIA'
      Origin = '"CM.CONTRATOIMOVEL".CONDIASTOLERANCIA'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXIMOVEL'
      'set'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    InsertSQL.Strings = (
      'insert into CONTRATOXIMOVEL'
      '  (IDIMOVEL, IDCONTRATOIMOVEL)'
      'values'
      '  (:IDIMOVEL, :IDCONTRATOIMOVEL)')
    DeleteSQL.Strings = (
      'delete from CONTRATOXIMOVEL'
      'where'
      '  IDIMOVEL = :OLD_IDIMOVEL and'
      '  IDCONTRATOIMOVEL = :OLD_IDCONTRATOIMOVEL')
    Left = 401
    Top = 8
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CXI.IDIMOVEL,'
      '    CXI.IDCONTRATOIMOVEL,'
      '    IM.IMONOME,'
      '    IMM.IMONOME AS MESTRE'
      'FROM'
      '    CONTRATOXIMOVEL CXI,'
      '    IMOVEL IM,'
      '    IMOVEL IMM'
      'WHERE'
      '      (CXI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      '  AND (CXI.IDIMOVEL = IM.IDIMOVEL)'
      '  AND (IM.IDIMOVELMESTRE  = IMM.IDIMOVEL)'
      'ORDER BY MESTRE,IM.IMONOME')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 439
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryDetIMONOME: TStringField
      DisplayLabel = 'Imovel'
      DisplayWidth = 40
      FieldName = 'IMONOME'
      Origin = 'IMOVEL.IMONOME'
      Size = 60
    end
    object qryDetMESTRE: TStringField
      DisplayLabel = 'Mestre'
      DisplayWidth = 40
      FieldName = 'MESTRE'
      Origin = '"CM.IMOVEL".IMONOME'
      Size = 60
    end
    object qryDetIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDIMOVEL'
      Visible = False
    end
    object qryDetIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'CONTRATOXIMOVEL.IDCONTRATOIMOVEL'
      Visible = False
    end
  end
  object dsCondPag: TwwDataSource
    AutoEdit = False
    DataSet = qryCondPag
    Left = 495
    Top = 7
  end
  object updCondDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONDPAGIMOVEL'
      'set'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCONDPAGIMOVEL = :IDCONDPAGIMOVEL,'
      '  INDCORRECAO = :INDCORRECAO,'
      '  VLRFINANC = :VLRFINANC,'
      '  FLGSINAL = :FLGSINAL,'
      '  DATAINI = :DATAINI,'
      '  PRAZO = :PRAZO,'
      '  PERIODO = :PERIODO,'
      '  TAXAJUROS = :TAXAJUROS,'
      '  PERIODOTAXA = :PERIODOTAXA,'
      '  SISTCORRECAO = :SISTCORRECAO,'
      '  NUMPARCELAS = :NUMPARCELAS'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    InsertSQL.Strings = (
      'insert into CONDPAGIMOVEL'
      
        '  (IDCONTRATOIMOVEL, IDCONDPAGIMOVEL, INDCORRECAO, VLRFINANC, FL' +
        'GSINAL, '
      
        '   DATAINI, PRAZO, PERIODO, TAXAJUROS, PERIODOTAXA, SISTCORRECAO' +
        ', NUMPARCELAS)'
      'values'
      
        '  (:IDCONTRATOIMOVEL, :IDCONDPAGIMOVEL, :INDCORRECAO, :VLRFINANC' +
        ', :FLGSINAL, '
      
        '   :DATAINI, :PRAZO, :PERIODO, :TAXAJUROS, :PERIODOTAXA, :SISTCO' +
        'RRECAO, '
      '   :NUMPARCELAS)')
    DeleteSQL.Strings = (
      'delete from CONDPAGIMOVEL'
      'where'
      '  IDCONDPAGIMOVEL = :OLD_IDCONDPAGIMOVEL')
    Left = 529
    Top = 8
  end
  object qryCondPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CPI.IDCONTRATOIMOVEL,'
      '     CPI.IDCONDPAGIMOVEL,'
      '     CPI.INDCORRECAO,'
      '     CPI.VLRFINANC,'
      '     CPI.FLGSINAL,'
      '     CPI.DATAINI,'
      '     CPI.PRAZO,'
      '     CPI.PERIODO,'
      '     CPI.TAXAJUROS,'
      '     CPI.PERIODOTAXA,'
      '     CPI.SISTCORRECAO,'
      '     CPI.NUMPARCELAS'
      'FROM'
      '     CONDPAGIMOVEL CPI'
      'WHERE'
      '     (CPI.IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL)'
      ''
      ''
      '')
    UpdateObject = updCondDet
    ControlType.Strings = (
      'FLGSINAL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 567
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCondPagDATAINI: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 10
      FieldName = 'DATAINI'
    end
    object qryCondPagFLGSINAL: TStringField
      DisplayLabel = 'Sinal'
      DisplayWidth = 1
      FieldName = 'FLGSINAL'
      Size = 1
    end
    object qryCondPagNUMPARCELAS: TFloatField
      DisplayLabel = 'Nº Parcelas'
      DisplayWidth = 10
      FieldName = 'NUMPARCELAS'
    end
    object qryCondPagVLRFINANC: TFloatField
      DisplayLabel = 'Valor '
      DisplayWidth = 10
      FieldName = 'VLRFINANC'
      DisplayFormat = '#,##0.00'
    end
    object qryCondPagPRAZO: TStringField
      DisplayLabel = 'Prazo'
      DisplayWidth = 1
      FieldName = 'PRAZO'
      Size = 1
    end
    object qryCondPagPERIODO: TFloatField
      DisplayLabel = 'Período'
      DisplayWidth = 1
      FieldName = 'PERIODO'
    end
    object qryCondPagINDCORRECAO: TFloatField
      DisplayLabel = 'Indice Correção'
      DisplayWidth = 20
      FieldName = 'INDCORRECAO'
    end
    object qryCondPagTAXAJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'TAXAJUROS'
    end
    object qryCondPagPERIODOTAXA: TStringField
      DisplayLabel = 'Período Juros'
      DisplayWidth = 1
      FieldName = 'PERIODOTAXA'
      Size = 1
    end
    object qryCondPagIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryCondPagIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object qryCondPagSISTCORRECAO: TStringField
      FieldName = 'SISTCORRECAO'
      Visible = False
      Size = 1
    end
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOEDESC'
      'FROM'
      '    MOEDA'
      'WHERE'
      '    (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 693
    Top = 220
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object qryMoeInd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MOECODIGO,'
      '    MOEDESC'
      'FROM'
      '    MOEDA'
      'WHERE'
      '    (MOEINATIVO = '#39'A'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 581
    Top = 220
    object StringField1: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
      Visible = False
    end
  end
  object msImovel: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'M.IMONOME'
      'I.IMONOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL M')
    CamposChave.Strings = (
      'I.IDIMOVEL'
      'M.IMONOME'
      'I.IMONOME')
    Filtro.Strings = (
      'I.IDIMOVELMESTRE = M.IDIMOVEL'
      'I.FLGTIPOIMOVEL = 1'
      'M.FLGTIPOIMOVEL = 0')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 389
    Top = 279
  end
end
