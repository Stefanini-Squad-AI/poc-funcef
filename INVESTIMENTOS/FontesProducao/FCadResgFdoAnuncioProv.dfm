inherited frmCadResgFdoAnuncioProv: TfrmCadResgFdoAnuncioProv
  Left = 239
  Top = 312
  HelpContext = 790223
  Caption = ''
  ClientHeight = 543
  ClientWidth = 792
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 792
    Height = 457
    inherited Bevel1: TBevel
      Width = 790
    end
    inherited pnlMestre: TPanel
      Width = 790
      Height = 97
      object Label23: TLabel
        Left = 9
        Top = 48
        Width = 105
        Height = 13
        Caption = 'Data da Operação'
      end
      object Label12: TLabel
        Left = 9
        Top = 4
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object Label1: TLabel
        Left = 424
        Top = 48
        Width = 107
        Height = 13
        Caption = 'Valor da Operação'
      end
      object Label2: TLabel
        Left = 614
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 614
        Top = 48
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
      object Label11: TLabel
        Left = 148
        Top = 48
        Width = 112
        Height = 13
        Caption = 'Data da Liquidação'
      end
      object Label16: TLabel
        Left = 285
        Top = 48
        Width = 106
        Height = 13
        Caption = 'Data da Cotização'
      end
      object dbDDataOperacao: TCMDateTimePicker
        Left = 9
        Top = 63
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAPEDIDO'
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
        OnExit = dbDDataOperacaoExit
      end
      object DbLkcFundoInvest: TwwDBLookupCombo
        Left = 9
        Top = 20
        Width = 396
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        DataField = 'IDFUNDOINVEST'
        DataSource = ds
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DbLkcFundoInvestCloseUp
      end
      object DbRValorLiquido: TDBRealEdit
        Left = 424
        Top = 63
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        OnExit = DbRValorLiquidoExit
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPEDIDO'
        DataSource = ds
      end
      object DBReQtd: TDBRealEdit
        Left = 614
        Top = 20
        Width = 168
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '0,000000000')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 9
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDOPERACAO'
        DataSource = ds
      end
      object DbEdCotaResg: TDBRealEdit
        Left = 614
        Top = 63
        Width = 169
        Height = 21
        Alignment = taRightJustify
        Color = clMenu
        Enabled = False
        Lines.Strings = (
          '0,00000000')
        TabOrder = 6
        WordWrap = False
        IntDigits = 17
        DecDigits = 8
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRCOTA'
        DataSource = ds
      end
      object dbDDataLiquidacao: TCMDateTimePicker
        Left = 148
        Top = 63
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATALIQUIDACAO'
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
      object dbDDataCotizacao: TCMDateTimePicker
        Left = 285
        Top = 63
        Width = 119
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATACOTIZACAO'
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
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 141
      Width = 790
      Height = 315
      Tabs.Strings = (
        'Anúncios de Proventos')
      inherited pgctrlDetalhe: TPageControl
        Width = 692
        Height = 256
        ActivePage = nil
        inherited tbsDet: TTabSheet
          Caption = ''
          TabVisible = False
          inherited dbgrdDet: TwwDBGrid
            Width = 684
            Height = 246
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'15'#9'Ação'
              'DESCTIPOOPERACAO'#9'14'#9'Operação'
              'QTDEACOESDIRPROV'#9'14'#9'Quantidade'
              'DIVPORACAO'#9'19'#9'PU'
              'VLRACOESDIRPROV'#9'16'#9'Valor'
              'DATACOM'#9'10'#9'Data Prevista'
              'NOMEUSUARIO'#9'12'#9'Operador')
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 684
            Height = 246
            object Label3: TLabel
              Left = 10
              Top = 84
              Width = 30
              Height = 13
              Caption = 'Ação'
            end
            object Label5: TLabel
              Left = 231
              Top = 85
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label6: TLabel
              Left = 386
              Top = 84
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label7: TLabel
              Left = 10
              Top = 3
              Width = 78
              Height = 13
              Caption = 'Data Prevista'
            end
            object Label8: TLabel
              Left = 547
              Top = 85
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label10: TLabel
              Left = 10
              Top = 43
              Width = 85
              Height = 13
              Caption = 'Tipo Operação'
            end
            object dblAcao: TwwDBLookupCombo
              Left = 10
              Top = 100
              Width = 218
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'30'#9'Descrição'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = dsDet
              LookupTable = QryAcao
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dbRQuantidade: TDBRealEdit
              Left = 231
              Top = 100
              Width = 151
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 3
              WordWrap = False
              OnExit = dbRPUExit
              IntDigits = 18
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEACOESDIRPROV'
              DataSource = dsDet
            end
            object dbRPU: TDBRealEdit
              Left = 386
              Top = 100
              Width = 157
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000000000')
              TabOrder = 4
              WordWrap = False
              OnExit = dbRPUExit
              IntDigits = 17
              DecDigits = 15
              NumberFormat = fNumber
              Signal = False
              DataField = 'DIVPORACAO'
              DataSource = dsDet
            end
            object dbRValor: TDBRealEdit
              Left = 547
              Top = 100
              Width = 133
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 5
              WordWrap = False
              OnExit = dbRValorExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRACOESDIRPROV'
              DataSource = dsDet
            end
            object dDataPrevista: TCMDateTimePicker
              Left = 10
              Top = 18
              Width = 119
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOM'
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
              TabOrder = 0
            end
            object dblTipoOperacao: TwwDBLookupCombo
              Left = 10
              Top = 58
              Width = 219
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'35'#9'Descrição')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsDet
              LookupTable = qryTipoOperacao
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 782
        object Label9: TLabel [0]
          Left = 486
          Top = 8
          Width = 109
          Height = 13
          Caption = 'Total de Proventos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dRVlrTotalProv: TDBRealEdit
          Left = 607
          Top = 4
          Width = 168
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
        end
      end
      inherited Dock974: TDock97
        Left = 696
        Height = 256
      end
    end
    inherited pnlTitulo: TPanel
      Width = 790
      inherited lbNomItem: TfcLabel
        Width = 479
        Caption = 'Resgate de Fundos com Anúncio de Proventos'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 792
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 504
    Width = 792
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  inherited dsDet: TwwDataSource
    Left = 341
    Top = 285
  end
  inherited ds: TwwDataSource
    Left = 257
    Top = 293
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PEDIDOFUNDO'
      'set'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAPEDIDO = :DATAPEDIDO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRPEDIDO = :VLRPEDIDO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATACOTIZACAO = :DATACOTIZACAO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    InsertSQL.Strings = (
      'insert into PEDIDOFUNDO'
      '  (IDPEDIDOFUNDO, IDTIPOINVEST, IDTIPOOPERACAO, IDFUNDOINVEST, '
      'DATAPEDIDO, '
      '   DATALIQUIDACAO, VLRPEDIDO, IDPLANPREVCTBPATR, DATACOTIZACAO)'
      'values'
      
        '  (:IDPEDIDOFUNDO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDFUNDOINVES' +
        'T, '
      ':DATAPEDIDO, '
      
        '   :DATALIQUIDACAO, :VLRPEDIDO, :IDPLANPREVCTBPATR, :DATACOTIZAC' +
        'AO)')
    DeleteSQL.Strings = (
      'delete from PEDIDOFUNDO'
      'where'
      '  IDPEDIDOFUNDO = :OLD_IDPEDIDOFUNDO')
    Left = 257
    Top = 272
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'PEDIDOFUNDO.DATAPEDIDO'
      'PEDIDOFUNDO.VLRPEDIDO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Fundo de Investimentos'
      'Data da Operação'
      'Valor da Operação'
      'Operador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PEDIDOFUNDO'
      'FUNDOINVEST'
      'OPERACAODIREITO'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'PEDIDOFUNDO.IDPEDIDOFUNDO')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST     =  PEDIDOFUNDO.IDFUNDOINVEST'
      'OPERACAODIREITO.IDPEDIDOFUNDO =  PEDIDOFUNDO.IDPEDIDOFUNDO'
      
        'USUARIOSISTEMA.IDUSUARIO      = TO_NUMBER(SUBSTR(OPERACAODIREITO' +
        '.TRGUSERINCLUSAO,3,20))')
    Mascaras.Strings = (
      ''
      ''
      ',#0.00'
      '')
    Larguras.Strings = (
      '34'
      '20'
      '22'
      '20')
    UsaDistinct = True
  end
  inherited ImlPadrao: TImageList
    Left = 281
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 262
    Top = 211
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT DISTINCT'
      ''
      
        '  PED.IDPEDIDOFUNDO     , PED.IDTIPOINVEST      , PED.IDTIPOOPER' +
        'ACAO    ,'
      
        '  PED.IDFUNDOINVEST     , PED.DATAPEDIDO        , PED.DATALIQUID' +
        'ACAO    ,'
      
        '  PED.VLRPEDIDO         , PED.DATACOTIZACAO     , PED.IDPLANPREV' +
        'CTBPATR ,'
      '  PED.TRGUSERINCLUSAO   ,'
      ''
      '  FUN.DESCFUNDOINVEST   , FUN.IDGESTORCARTEIRA  ,'
      
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
      
        '  FUN.TRGDTINCLUSAO     , FUN.MOECODIGO         , FUN.DTAINIPROC' +
        '        ,'
      ''
      
        '  OPF.QTDOPERACAO       , OPF.VLRCOTA           , OPF.IDOPERACAO' +
        'DIREITO ,'
      ''
      '  TPO.DESCTIPOOPERACAO  ,  TPO.NATUREZAOPERACAO ,'
      ''
      '  CAR.IDPLANOPREV       ,  CAR.IDPATROCINADORA  ,'
      ''
      '  '#39' '#39' AS STACONFIRMA    , '#39' '#39' As STATUS         ,'
      '  '#39'                             '#39' AS USUARIO'
      ''
      'FROM'
      
        '  PEDIDOFUNDO PED, OPERACAOFUNDO OPF, FUNDOINVEST FUN, TIPOOPERA' +
        'CAO TPO, CARTEIRAINVEST CAR'
      'WHERE'
      
        '  (PED.IDPEDIDOFUNDO     = :IDPEDIDOFUNDO)                      ' +
        'AND'
      ''
      
        '  (PED.IDTIPOOPERACAO    > 0)                                   ' +
        'AND'
      ''
      
        '  (PED.IDCOMPOSICAOFUNDO IS NULL)                               ' +
        'AND'
      ''
      
        '  (OPF.IDPEDIDOFUNDO     = PED.IDPEDIDOFUNDO)                   ' +
        'AND'
      ''
      
        '  (FUN.IDFUNDOINVEST     = PED.IDFUNDOINVEST)                   ' +
        'AND'
      ''
      
        '  (PED.IDTIPOINVEST      = TPO.IDTIPOINVEST(+))                 ' +
        'AND'
      ''
      
        '  (PED.IDTIPOOPERACAO    = TPO.IDTIPOOPERACAO(+))               ' +
        'AND'
      ''
      
        '  (CAR.IDCARTEIRAINVEST  = FUN.IDCARTEIRAINVEST)                ' +
        'AND  '
      ''
      '  (TPO.NATUREZAOPERACAO = '#39'D'#39')'
      ''
      'ORDER BY'
      ''
      '  FUN.DESCFUNDOINVEST, PED.DATAPEDIDO'
      '  '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    Left = 257
    Top = 252
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 340
    Top = 216
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '        OD.IDOPERACAODIREITO    ,OD.INVORIGEM           ,OD.DATA' +
        'AGE     ,'
      
        '        OD.DATAEX               ,OD.DATACOM             ,OD.PERC' +
        'ENTUAL  ,'
      
        '        OD.PARIDADE             ,OD.PRZBOLSA            ,OD.PRZE' +
        'MPRESA  ,'
      
        '        OD.ATADECISAO           ,OD.FORMAPAGREC         ,OD.DIVP' +
        'ORACAO  ,'
      
        '        OD.INIPAGTO             ,OD.JUROSCAP            ,OD.IDTI' +
        'POINVEST,'
      
        '        OD.IDTIPOOPERACAO       ,OD.IDEMISSOR           ,OD.OBSE' +
        'RVACAO  ,'
      
        '        OD.STATUS               ,OD.ISENCAOIR           ,OD.IRLI' +
        'TIGIO   ,'
      
        '        OD.PLNCODIGO            ,OD.CODDOCUMENTO        ,OD.PLAN' +
        'O       ,'
      '        OD.IDPEDIDOFUNDO        ,OD.QTDEACOESDIRPROV    ,'
      
        '        ROUND(OD.QTDEACOESDIRPROV*OD.DIVPORACAO,2)  AS VLRACOESD' +
        'IRPROV  ,'
      ''
      
        '        OP.IDOPERDIREITOXINV    ,OP.IDINVESTIMENTO      ,OP.IDOP' +
        'ERACAODIREITO,'
      '        OP.ORIGDEST             ,OP.PERCENTUALINV       ,'
      ''
      '        IV.DESCINVESTIMENTO     ,IV.IDINVESTIMENTO      ,'
      
        '        US.NOMEUSUARIO          ,US.IDUSUARIO           , TOTAL.' +
        'VLRTOTALPROV,'
      '        TP.DESCTIPOOPERACAO'
      ''
      'FROM'
      
        '   OPERACAODIREITO OD, OPERDIREITOXINV OP, INVESTIMENTO IV, USUA' +
        'RIOSISTEMA US, TIPOOPERACAO TP,'
      ''
      
        '   (SELECT SUM(ROUND(OD.QTDEACOESDIRPROV*OD.DIVPORACAO,2)) AS VL' +
        'RTOTALPROV'
      '    FROM'
      '           OPERACAODIREITO OD'
      '    WHERE'
      '           OD.IDPEDIDOFUNDO     =:IDPEDIDOFUNDO        ) TOTAL'
      'WHERE'
      '  OD.IDPEDIDOFUNDO     =:IDPEDIDOFUNDO        AND'
      '  OD.IDOPERACAODIREITO = OP.IDOPERACAODIREITO AND'
      '  IV.IDINVESTIMENTO    = OP.IDINVESTIMENTO    AND'
      
        '  US.IDUSUARIO         = TO_NUMBER(SUBSTR(OD.TRGUSERINCLUSAO,3,2' +
        '0)) AND'
      '  TP.IDTIPOOPERACAO    = OD.IDTIPOOPERACAO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 341
    Top = 244
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
    object qryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Ação'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryDetalheDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 14
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDetalheQTDEACOESDIRPROV: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 14
      FieldName = 'QTDEACOESDIRPROV'
      DisplayFormat = '###,###,###,###'
    end
    object qryDetalheDIVPORACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 19
      FieldName = 'DIVPORACAO'
    end
    object qryDetalheVLRACOESDIRPROV: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLRACOESDIRPROV'
    end
    object qryDetalheDATACOM: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 10
      FieldName = 'DATACOM'
    end
    object qryDetalheNOMEUSUARIO: TStringField
      DisplayLabel = 'Operador'
      DisplayWidth = 12
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryDetalheIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryDetalheINVORIGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'INVORIGEM'
      Visible = False
    end
    object qryDetalheDATAAGE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAAGE'
      Visible = False
    end
    object qryDetalheDATAEX: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAEX'
      Visible = False
    end
    object qryDetalhePERCENTUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryDetalhePARIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'PARIDADE'
      Visible = False
    end
    object qryDetalhePRZBOLSA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PRZBOLSA'
      Visible = False
    end
    object qryDetalhePRZEMPRESA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PRZEMPRESA'
      Visible = False
    end
    object qryDetalheATADECISAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'ATADECISAO'
      Visible = False
    end
    object qryDetalheFORMAPAGREC: TStringField
      DisplayWidth = 30
      FieldName = 'FORMAPAGREC'
      Visible = False
      Size = 30
    end
    object qryDetalheINIPAGTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'INIPAGTO'
      Visible = False
    end
    object qryDetalheJUROSCAP: TStringField
      DisplayWidth = 1
      FieldName = 'JUROSCAP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryDetalheIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryDetalheOBSERVACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 300
    end
    object qryDetalheSTATUS: TStringField
      DisplayWidth = 1
      FieldName = 'STATUS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheISENCAOIR: TStringField
      DisplayWidth = 1
      FieldName = 'ISENCAOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'IRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalhePLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryDetalheCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryDetalhePLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object qryDetalheIDPEDIDOFUNDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPEDIDOFUNDO'
      Visible = False
    end
    object qryDetalheIDOPERDIREITOXINV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERDIREITOXINV'
      Visible = False
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryDetalheIDOPERACAODIREITO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO_1'
      Visible = False
    end
    object qryDetalheORIGDEST: TStringField
      DisplayWidth = 1
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalhePERCENTUALINV: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUALINV'
      Visible = False
    end
    object qryDetalheIDINVESTIMENTO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO_1'
      Visible = False
    end
    object qryDetalheIDUSUARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object qryDetalheVLRTOTALPROV: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRTOTALPROV'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAODIREITO'
      'set'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  INVORIGEM = :INVORIGEM,'
      '  DATAAGE = :DATAAGE,'
      '  DATAEX = :DATAEX,'
      '  DATACOM = :DATACOM,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  PARIDADE = :PARIDADE,'
      '  PRZBOLSA = :PRZBOLSA,'
      '  PRZEMPRESA = :PRZEMPRESA,'
      '  ATADECISAO = :ATADECISAO,'
      '  FORMAPAGREC = :FORMAPAGREC,'
      '  DIVPORACAO = :DIVPORACAO,'
      '  INIPAGTO = :INIPAGTO,'
      '  JUROSCAP = :JUROSCAP,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  STATUS = :STATUS,'
      '  ISENCAOIR = :ISENCAOIR,'
      '  IRLITIGIO = :IRLITIGIO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  QTDEACOESDIRPROV = :QTDEACOESDIRPROV'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    InsertSQL.Strings = (
      'insert into OPERACAODIREITO'
      
        '  (IDOPERACAODIREITO, INVORIGEM, DATAAGE, DATAEX, DATACOM, PERCE' +
        'NTUAL, '
      
        '   PARIDADE, PRZBOLSA, PRZEMPRESA, ATADECISAO, FORMAPAGREC, DIVP' +
        'ORACAO, '
      
        '   INIPAGTO, JUROSCAP, IDTIPOINVEST, IDTIPOOPERACAO, IDEMISSOR, ' +
        'OBSERVACAO, '
      
        '   STATUS, ISENCAOIR, IRLITIGIO, PLNCODIGO, CODDOCUMENTO, PLANO,' +
        ' IDPEDIDOFUNDO, '
      '   QTDEACOESDIRPROV)'
      'values'
      
        '  (:IDOPERACAODIREITO, :INVORIGEM, :DATAAGE, :DATAEX, :DATACOM, ' +
        ':PERCENTUAL, '
      
        '   :PARIDADE, :PRZBOLSA, :PRZEMPRESA, :ATADECISAO, :FORMAPAGREC,' +
        ' :DIVPORACAO, '
      
        '   :INIPAGTO, :JUROSCAP, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDEMIS' +
        'SOR, :OBSERVACAO, '
      
        '   :STATUS, :ISENCAOIR, :IRLITIGIO, :PLNCODIGO, :CODDOCUMENTO, :' +
        'PLANO, '
      '   :IDPEDIDOFUNDO, :QTDEACOESDIRPROV)')
    DeleteSQL.Strings = (
      'delete from OPERACAODIREITO'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    Left = 341
    Top = 262
  end
  object QryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '   FUNDOINVEST FI, TIPOFUNDOINVEST TF'
      'WHERE'
      '  (TF.IDTIPOINVEST = :IDTIPOINVEST)              AND'
      '  (FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      'ORDER BY'
      '  DESCFUNDOINVEST'
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
    Left = 64
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO    , SUM(NVL(H1.VLRIRPROV,' +
        '0))  AS VLRIRPROV , SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV    ' +
        '  ,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO      , SUM(H1.COTASMO' +
        'VFUNDO) AS COTASMOVFUNDO    , SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO' +
        ' ,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)              AND'
      ''
      '(H1.IDHISTFUNDO  IN ('
      ''
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM   HISTFUNDO HF'
      '                WHERE'
      
        '                      (HF.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR' +
        ') AND'
      
        '                      (HF.IDFUNDOINVEST     = :IDFUNDOINVEST)   ' +
        '  AND'
      
        '                      (HF.DATAMOVFUNDO      = TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) AND'
      
        '                     ((HF.DATAMOVFUNDO      < TO_DATE(:DATAMOVFU' +
        'NDO, '#39'DD/MM/YYYY'#39')) OR HF.IDHISTFUNDO < 999999999) AND'
      
        '                      (HF.TIPMOVFUNDO       <> '#39'PIR'#39')           ' +
        '  AND'
      '                      (HF.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '                GROUP BY IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFU' +
        'NDO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)                                   AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)                AND'
      ''
      '(H1.IDCOMPOSICAOFUNDO IS NULL)'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 568
    Top = 220
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
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object dsSaldoFundoTotal: TwwDataSource
    DataSet = QrySaldoFundoTotal
    Left = 568
    Top = 238
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 74
    Top = 132
  end
  object QryAcao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '    INVESTIMENTO'
      'WHERE'
      '    IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO    '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 66
    Top = 180
  end
  object QryOperDireitoXinv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IV.DESCINVESTIMENTO,'
      '   OP.IDOPERDIREITOXINV,'
      '   OP.IDINVESTIMENTO,'
      '   OP.IDOPERACAODIREITO,'
      '   OP.ORIGDEST,'
      '   OP.PERCENTUALINV'
      'FROM'
      '   OPERDIREITOXINV OP, INVESTIMENTO IV'
      'WHERE'
      '   OP.IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      '   IV.IDINVESTIMENTO    = OP.IDINVESTIMENTO'
      ' ')
    UpdateObject = UpdOperDireitoXinv
    ControlType.Strings = (
      'DESCINVESTIMENTO;CustomEdit;wwDBLookupCombo2'
      'ORIGDEST;CustomEdit;wwDBLookupCombo1'
      'STATUS;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 434
    Top = 220
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
        Value = 308
      end>
  end
  object UpdOperDireitoXinv: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERDIREITOXINV'
      'set'
      '  IDOPERDIREITOXINV = :IDOPERDIREITOXINV,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  ORIGDEST = :ORIGDEST,'
      '  PERCENTUALINV = :PERCENTUALINV'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    InsertSQL.Strings = (
      'insert into OPERDIREITOXINV'
      
        '  (IDOPERDIREITOXINV, IDINVESTIMENTO, IDOPERACAODIREITO, ORIGDES' +
        'T, PERCENTUALINV)'
      'values'
      
        '  (:IDOPERDIREITOXINV, :IDINVESTIMENTO, :IDOPERACAODIREITO, :ORI' +
        'GDEST, '
      '   :PERCENTUALINV)')
    DeleteSQL.Strings = (
      'delete from OPERDIREITOXINV'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    Left = 434
    Top = 241
  end
  object DsOperDireitoXinv: TwwDataSource
    AutoEdit = False
    DataSet = QryOperDireitoXinv
    Left = 434
    Top = 260
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
    Left = 427
    Top = 324
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
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 66
    Top = 327
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
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
    Left = 65
    Top = 376
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
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGAGE,'
      '   FLGDATAEX,'
      '   FLGDATACOM,'
      '   FLGPRZBOLSA,'
      '   FLGPRZEMP,'
      '   FLGATADEC,'
      '   FLGFORMAPAGREC,'
      '   FLGDIVACAO,'
      '   FLGINIPAG,'
      '   FLGFORMAPAGREC,'
      '   FLGJUROS,'
      '   FLGPARIDADE,'
      '   FLGINVORIGEM,'
      '   FLGPERC,'
      '   DESCTIPOOPERACAO,'
      '   IDTIPOOPERACAO,'
      '   IDTIPOINVEST,'
      '   FLGGRAVAIRLITIGIO,'
      '   FLGISENTOIR'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE '
      '   FLGOPDIREITO = '#39'S'#39' '
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 67
    Top = 434
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'TIPOOPERACAO.FLGAGE'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'TIPOOPERACAO.FLGDATAEX'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'TIPOOPERACAO.FLGDATACOM'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'TIPOOPERACAO.FLGPRZBOLSA'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'TIPOOPERACAO.FLGPRZEMP'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'TIPOOPERACAO.FLGATADEC'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'TIPOOPERACAO.FLGDIVACAO'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'TIPOOPERACAO.FLGINIPAG'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC_1: TStringField
      FieldName = 'FLGFORMAPAGREC_1'
      Origin = 'TIPOOPERACAO.FLGFORMAPAGREC'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'TIPOOPERACAO.FLGJUROS'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'TIPOOPERACAO.FLGPARIDADE'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'TIPOOPERACAO.FLGINVORIGEM'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'TIPOOPERACAO.FLGPERC'
      Visible = False
      Size = 1
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      Size = 1
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'TIPOOPERACAO.FLGISENTOIR'
      Size = 1
    end
  end
  object qryUpdOperDirCtbFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE OPERACAODIREITO'
      'SET PLANO = :PLANO,'
      '    PLNCODIGO = :PLNCODIGO,'
      '    CODDOCUMENTO = :CODDOCUMENTO'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 429
    Top = 372
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
  end
  object QryBuscaInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  INV.IDINVESTIMENTO,   INV.IDMOEDACONTAB, INV.IDEMISSOR, ' +
        'INV.IDTIPOINVEST,'
      
        '        INV.DESCINVESTIMENTO, ACA.CODTIPOACAO, AXB.MOECODIGO, AX' +
        'B.QTDELOTE,'
      '        AXB.IDBOLSAVALORES'
      'FROM   INVESTIMENTO INV, ACAO ACA, ACOESXBOLSA AXB'
      'WHERE (INV.IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '      (INV.IDINVESTIMENTO = ACA.IDACAO)     AND'
      '      (INV.IDINVESTIMENTO = AXB.IDACAO)'
      ' ')
    ValidateWithMask = True
    Left = 69
    Top = 228
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryBuscaInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
    end
    object QryBuscaInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
    end
    object QryBuscaInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
    end
    object QryBuscaInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
    end
    object QryBuscaInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryBuscaInvestimentoCODTIPOACAO: TStringField
      FieldName = 'CODTIPOACAO'
      Origin = 'ACAO.CODTIPOACAO'
      Size = 5
    end
    object QryBuscaInvestimentoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'ACOESXBOLSA.MOECODIGO'
    end
    object QryBuscaInvestimentoQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Origin = 'ACOESXBOLSA.QTDELOTE'
    end
    object QryBuscaInvestimentoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
      Origin = 'ACOESXBOLSA.IDBOLSAVALORES'
    end
  end
end
