inherited frmCadDividendos: TfrmCadDividendos
  Left = 381
  Top = 148
  HelpContext = 790284
  Caption = 'Operação'
  ClientHeight = 532
  ClientWidth = 805
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 789
    Height = 408
    inherited Bevel1: TBevel
      Top = 34
      Width = 787
    end
    inherited pnlMestre: TPanel
      Top = 36
      Width = 787
      Height = 115
      object Label3: TLabel
        Left = 321
        Top = 1
        Width = 49
        Height = 13
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 17
        Top = 73
        Width = 57
        Height = 13
        Caption = 'Data AGE'
      end
      object Label5: TLabel
        Left = 117
        Top = 73
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object Label16: TLabel
        Left = 217
        Top = 73
        Width = 54
        Height = 13
        Caption = 'Data  Ex '
      end
      object Label6: TLabel
        Left = 322
        Top = 73
        Width = 78
        Height = 13
        Caption = 'Data Prevista'
      end
      object Label13: TLabel
        Left = 17
        Top = 36
        Width = 22
        Height = 13
        Caption = 'PU '
      end
      object Label14: TLabel
        Left = 424
        Top = 41
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label28: TLabel
        Left = 17
        Top = 1
        Width = 85
        Height = 13
        Caption = 'Tipo Operação'
      end
      object Label38: TLabel
        Left = 218
        Top = 36
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 321
        Top = 15
        Width = 285
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Descrição')
        DataField = 'IDEMISSOR'
        DataSource = ds
        LookupTable = QryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblEmissorExit
      end
      object dbdAGE: TCMDateTimePicker
        Left = 17
        Top = 87
        Width = 96
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAAGE'
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
      object dbdEX: TCMDateTimePicker
        Left = 117
        Top = 87
        Width = 96
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEX'
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
        TabOrder = 6
      end
      object dbdOper: TCMDateTimePicker
        Left = 217
        Top = 87
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAOPER'
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
        TabOrder = 7
      end
      object dbdCOM: TCMDateTimePicker
        Left = 321
        Top = 87
        Width = 98
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATACOM'
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
        TabOrder = 8
      end
      object dbeDivPorAcao: TDBRealEdit
        Left = 17
        Top = 51
        Width = 195
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,199289429800000')
        TabOrder = 2
        WordWrap = False
        IntDigits = 14
        DecDigits = 15
        NumberFormat = fNumber
        Signal = False
        DataField = 'DIVPORACAO'
        DataSource = ds
      end
      object dbmObservacao: TDBMemo
        Left = 425
        Top = 55
        Width = 182
        Height = 52
        DataField = 'OBSERVACAO'
        DataSource = ds
        TabOrder = 9
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 17
        Top = 15
        Width = 298
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'35'#9'Descrição')
        DataField = 'IDTIPOOPERACAO'
        DataSource = ds
        LookupTable = qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblTipoOperacaoExit
      end
      object dbcIsentoIr: TDBCheckBox
        Left = 615
        Top = 60
        Width = 102
        Height = 17
        Caption = 'Isento de IR'
        DataField = 'ISENCAOIR'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcIsentoIrClick
      end
      object dbcIRLitigio: TDBCheckBox
        Left = 615
        Top = 83
        Width = 110
        Height = 17
        Caption = 'Gera IR Litígio'
        DataField = 'IRLITIGIO'
        DataSource = ds
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcIRLitigioClick
      end
      object dbePercentual: TDBRealEdit
        Left = 218
        Top = 51
        Width = 199
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,000000000')
        TabOrder = 3
        WordWrap = False
        IntDigits = 14
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENTUAL'
        DataSource = ds
      end
      object dbcRecTotal: TDBCheckBox
        Left = 615
        Top = 17
        Width = 134
        Height = 17
        Caption = 'Recebimento total'
        DataField = 'STATUS'
        DataSource = ds
        TabOrder = 4
        ValueChecked = 'T'
        ValueUnchecked = 'P'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 151
      Width = 787
      Height = 256
      Tabs.Strings = (
        'Investimentos'
        'Anúncio'
        'Recebimentos'
        'Cancelamentos'
        'Cancelamentos por Venda')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgProvisao'
        'dbgRecebimento'
        'dbgCancelamento'
        'dbgCancelamentoVenda')
      inherited pgctrlDetalhe: TPageControl
        Width = 689
        Height = 197
        ActivePage = tbsProvisao
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 681
            Height = 169
            object Label18: TLabel
              Left = 17
              Top = 29
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object dblInvestimento: TwwDBLookupCombo
              Left = 17
              Top = 45
              Width = 400
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = dsDet
              LookupTable = qryInvestimentoAcao
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 681
            Height = 169
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'100'#9'Investimento'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TitleFont.Color = clMaroon
            OnDrawDataCell = PintaGrig
          end
        end
        object tbsProvisao: TTabSheet
          Caption = 'Anúncio'
          ImageIndex = 1
          object dbgProvisao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Selected.Strings = (
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'PRECOUNITOPERACAO'#9'20'#9'Preço Unitário'
              'VLROPERACAO'#9'18'#9'Valor'
              'VLRREMUNERACAO'#9'15'#9'Remuneração'
              'VLRIRREMUNER'#9'15'#9'IR s/ Remuneração'
              'VLRIR'#9'15'#9'I.R.'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'10'#9'Operação'
              'DATAVENCOPER'#9'10'#9'Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsProvisao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDrawDataCell = PintaGrig
            IndicatorColor = icBlack
          end
          object pnlDetProvisao: TPanel
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Align = alClient
            TabOrder = 1
            object Label1: TLabel
              Left = 6
              Top = 83
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label2: TLabel
              Left = 6
              Top = 124
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label7: TLabel
              Left = 223
              Top = 124
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label11: TLabel
              Left = 326
              Top = 83
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label9: TLabel
              Left = 442
              Top = 124
              Width = 65
              Height = 13
              Caption = 'Valor do IR'
            end
            object Label8: TLabel
              Left = 326
              Top = 124
              Width = 79
              Height = 13
              Caption = 'Remuneração'
            end
            object Label10: TLabel
              Left = 545
              Top = 124
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label12: TLabel
              Left = 485
              Top = 83
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label39: TLabel
              Left = 6
              Top = 3
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaProv
            end
            object Label17: TLabel
              Left = 326
              Top = 43
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label43: TLabel
              Left = 111
              Top = 124
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label46: TLabel
              Left = 6
              Top = 43
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object Label49: TLabel
              Left = 153
              Top = 7
              Width = 105
              Height = 13
              Caption = 'Data da Operação'
            end
            object dblCarteiraProvisao: TwwDBLookupCombo
              Left = 6
              Top = 98
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsProvisao
              LookupTable = qryCarteiraProv
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraProvisaoExit
            end
            object dbrQtdProv: TDBRealEdit
              Left = 6
              Top = 138
              Width = 99
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 6
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsProvisao
            end
            object dbrVlrProv: TDBRealEdit
              Left = 223
              Top = 138
              Width = 94
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              OnExit = dbrVlrProvExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsProvisao
            end
            object dblCustodianteProv: TwwDBLookupCombo
              Left = 326
              Top = 98
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = dsProvisao
              LookupTable = qryCustodianteProv
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrVlrIRProv: TDBRealEdit
              Left = 442
              Top = 138
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbrVlrIRProvExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = dsProvisao
            end
            object dbrVlrRemProv: TDBRealEdit
              Left = 326
              Top = 138
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              OnExit = dbrVlrProvExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRREMUNERACAO'
              DataSource = dsProvisao
            end
            object dbrVlrLiqProv: TDBRealEdit
              Left = 545
              Top = 138
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = dsProvisao
            end
            object dbeBoletaProv: TDBEdit
              Left = 6
              Top = 18
              Width = 127
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsProvisao
              Enabled = False
              TabOrder = 0
            end
            object dblMotivoBloqueioProv: TwwDBLookupCombo
              Left = 485
              Top = 98
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = dsProvisao
              LookupTable = qryMotBloqProv
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblTipoOperProv: TwwDBLookupCombo
              Left = 326
              Top = 58
              Width = 346
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsProvisao
              LookupTable = qryTipoOperProv
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrPUProv: TDBRealEdit
              Left = 111
              Top = 138
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 7
              WordWrap = False
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRECOUNITOPERACAO'
              DataSource = dsProvisao
            end
            object dblPlanPatroProv: TwwDBLookupCombo
              Left = 6
              Top = 58
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'113'#9'Descrição'#9'F')
              DataField = 'IDPLANPREVCTBPATR'
              DataSource = dsProvisao
              LookupTable = qryPlanPrevProv
              LookupField = 'IDPLANPREVCTBPATR'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 153
              Top = 21
              Width = 152
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsProvisao
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
              ShowButton = True
              TabOrder = 12
              OnExit = dbdDataOperacaoRecExit
            end
          end
        end
        object tbsRecebimento: TTabSheet
          Caption = 'Recebimento'
          ImageIndex = 2
          object dbgRecebimento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Selected.Strings = (
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'PRECOUNITOPERACAO'#9'20'#9'Preço Unitário'
              'VLROPERACAO'#9'18'#9'Valor'
              'VLRREMUNERACAO'#9'15'#9'Remuneração'
              'VLRIRREMUNER'#9'15'#9'IR s/ Remuneração'
              'VLRIR'#9'15'#9'I.R.'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'10'#9'Operação'
              'DATAVENCOPER'#9'10'#9'Liquidação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRecebimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDrawDataCell = PintaGrig
            IndicatorColor = icBlack
          end
          object pnlDetRecebimento: TPanel
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label15: TLabel
              Left = 6
              Top = 3
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaRec
            end
            object Label20: TLabel
              Left = 326
              Top = 43
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label19: TLabel
              Left = 6
              Top = 83
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label21: TLabel
              Left = 326
              Top = 83
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label22: TLabel
              Left = 485
              Top = 83
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label23: TLabel
              Left = 6
              Top = 124
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label24: TLabel
              Left = 223
              Top = 124
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label25: TLabel
              Left = 326
              Top = 124
              Width = 79
              Height = 13
              Caption = 'Remuneração'
            end
            object Label26: TLabel
              Left = 442
              Top = 124
              Width = 65
              Height = 13
              Caption = 'Valor do IR'
            end
            object Label27: TLabel
              Left = 545
              Top = 124
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label29: TLabel
              Left = 165
              Top = 4
              Width = 105
              Height = 13
              Caption = 'Data da Operação'
            end
            object Label44: TLabel
              Left = 111
              Top = 124
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label47: TLabel
              Left = 6
              Top = 43
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object dblCarteiraRec: TwwDBLookupCombo
              Left = 6
              Top = 98
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsRecebimento
              LookupTable = qryCarteiraRec
              LookupField = 'IDCARTEIRA'
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblCarteiraRecEnter
              OnExit = dblCarteiraRecExit
            end
            object dbeBoletaRec: TDBEdit
              Left = 6
              Top = 18
              Width = 147
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsRecebimento
              Enabled = False
              TabOrder = 0
            end
            object dblTipoOperRec: TwwDBLookupCombo
              Left = 326
              Top = 58
              Width = 347
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsRecebimento
              LookupTable = qryTipoOperRec
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblCustodianteRec: TwwDBLookupCombo
              Left = 326
              Top = 98
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = dsRecebimento
              LookupTable = qryCustodianteRec
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblMotivoBloqueioRec: TwwDBLookupCombo
              Left = 485
              Top = 98
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = dsRecebimento
              LookupTable = qryMotBloqRec
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrQtdRec: TDBRealEdit
              Left = 6
              Top = 138
              Width = 99
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 7
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsRecebimento
            end
            object dbrVlrRec: TDBRealEdit
              Left = 223
              Top = 138
              Width = 94
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              OnEnter = dbrVlrRecEnter
              OnExit = dbrVlrRecExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsRecebimento
            end
            object dbrVlrRemRec: TDBRealEdit
              Left = 326
              Top = 138
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbrVlrRecExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRREMUNERACAO'
              DataSource = dsRecebimento
            end
            object dbrVlrIRRec: TDBRealEdit
              Left = 442
              Top = 138
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              OnExit = dbrVlrIRRecExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = dsRecebimento
            end
            object dbrVlrLiqRec: TDBRealEdit
              Left = 545
              Top = 138
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 12
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = dsRecebimento
            end
            object dbdDataOperacaoRec: TCMDateTimePicker
              Left = 165
              Top = 18
              Width = 152
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsRecebimento
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
              OnExit = dbdDataOperacaoRecExit
            end
            object dbrPURec: TDBRealEdit
              Left = 111
              Top = 138
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 8
              WordWrap = False
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRECOUNITOPERACAO'
              DataSource = dsRecebimento
            end
            object dblPlanPatroRec: TwwDBLookupCombo
              Left = 6
              Top = 58
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'113'#9'Descrição'#9'F')
              DataField = 'IDPLANPREVCTBPATR'
              DataSource = dsRecebimento
              LookupTable = qryPlanPrevRec
              LookupField = 'IDPLANPREVCTBPATR'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object tbsCancelamento: TTabSheet
          Caption = 'Cancelamento'
          ImageIndex = 3
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Align = alClient
            TabOrder = 0
            object Label30: TLabel
              Left = 6
              Top = 83
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label31: TLabel
              Left = 6
              Top = 124
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label32: TLabel
              Left = 223
              Top = 124
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label33: TLabel
              Left = 326
              Top = 83
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label34: TLabel
              Left = 442
              Top = 124
              Width = 65
              Height = 13
              Caption = 'Valor do IR'
            end
            object Label35: TLabel
              Left = 326
              Top = 124
              Width = 79
              Height = 13
              Caption = 'Remuneração'
            end
            object Label36: TLabel
              Left = 545
              Top = 124
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label37: TLabel
              Left = 485
              Top = 83
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label40: TLabel
              Left = 6
              Top = 3
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaCan
            end
            object Label41: TLabel
              Left = 326
              Top = 43
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label42: TLabel
              Left = 165
              Top = 4
              Width = 130
              Height = 13
              Caption = 'Data do Cancelamento'
            end
            object Label45: TLabel
              Left = 111
              Top = 124
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label48: TLabel
              Left = 6
              Top = 43
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object dblCarteiraCan: TwwDBLookupCombo
              Left = 6
              Top = 98
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsCancelamento
              LookupTable = qryCarteiraCan
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblCarteiraCanEnter
              OnExit = dblCarteiraCanExit
            end
            object dbrQtdCan: TDBRealEdit
              Left = 6
              Top = 138
              Width = 99
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 7
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsCancelamento
            end
            object dbrVlrCan: TDBRealEdit
              Left = 223
              Top = 138
              Width = 94
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              OnEnter = dbrVlrCanEnter
              OnExit = dbrVlrCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsCancelamento
            end
            object dblCustodianteCan: TwwDBLookupCombo
              Left = 326
              Top = 98
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = dsCancelamento
              LookupTable = qryCustodianteCan
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrVlrIRCan: TDBRealEdit
              Left = 442
              Top = 138
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              OnExit = dbrVlrIRCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = dsCancelamento
            end
            object dbrVlrRemCan: TDBRealEdit
              Left = 326
              Top = 138
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbrVlrCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRREMUNERACAO'
              DataSource = dsCancelamento
            end
            object dbrVlrLiqCan: TDBRealEdit
              Left = 545
              Top = 138
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 12
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = dsCancelamento
            end
            object dbeBoletaCan: TDBEdit
              Left = 6
              Top = 18
              Width = 147
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsCancelamento
              Enabled = False
              TabOrder = 0
            end
            object dblMotivoBloqueioCan: TwwDBLookupCombo
              Left = 485
              Top = 98
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = dsCancelamento
              LookupTable = qryMotBloqCan
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblTipoOperCan: TwwDBLookupCombo
              Left = 326
              Top = 58
              Width = 347
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsCancelamento
              LookupTable = qryTipoOperCan
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbdDataOperacaoCan: TCMDateTimePicker
              Left = 165
              Top = 18
              Width = 152
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsCancelamento
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
              OnExit = dbdDataOperacaoCanExit
            end
            object dbrPUCan: TDBRealEdit
              Left = 111
              Top = 138
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 8
              WordWrap = False
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRECOUNITOPERACAO'
              DataSource = dsCancelamento
            end
            object dblPlanPatroCan: TwwDBLookupCombo
              Left = 6
              Top = 58
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'113'#9'Descrição'#9'F')
              DataField = 'IDPLANPREVCTBPATR'
              DataSource = dsCancelamento
              LookupTable = qryPlanPrevCan
              LookupField = 'IDPLANPREVCTBPATR'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
          object dbgCancelamento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Selected.Strings = (
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'PRECOUNITOPERACAO'#9'10'#9'Preço Unitário'
              'VLROPERACAO'#9'18'#9'Valor'
              'VLRREMUNERACAO'#9'15'#9'Remuneração'
              'VLRIRREMUNER'#9'15'#9'IR s/ Remuneração'
              'VLRIR'#9'15'#9'I.R.'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'10'#9'Operação'
              'DATAVENCOPER'#9'10'#9'Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsCancelamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDrawDataCell = PintaGrig
            IndicatorColor = icBlack
          end
        end
        object tbsCancelamentoVenda: TTabSheet
          Caption = 'Cancelamento por Venda'
          ImageIndex = 4
          object dbgCancelamentoVenda: TwwDBGrid
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Selected.Strings = (
              'DESCCARTINVEST'#9'40'#9'Carteira'
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'20'#9'Quantidade'
              'PRECOUNITOPERACAO'#9'10'#9'Preço Unitário'
              'VLROPERACAO'#9'18'#9'Valor'
              'VLRREMUNERACAO'#9'15'#9'Remuneração'
              'VLRIRREMUNER'#9'15'#9'IR s/ Remuneração'
              'VLRIR'#9'15'#9'I.R.'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'
              'DATABASE'#9'10'#9'Data Base'
              'DATAOPERACAO'#9'10'#9'Operação'
              'DATAVENCOPER'#9'10'#9'Vencimento')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsCancelamentoVenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDrawDataCell = PintaGrig
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 681
            Height = 169
            Align = alClient
            TabOrder = 0
            object Label50: TLabel
              Left = 6
              Top = 83
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label51: TLabel
              Left = 6
              Top = 124
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label52: TLabel
              Left = 223
              Top = 124
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label53: TLabel
              Left = 326
              Top = 83
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label54: TLabel
              Left = 442
              Top = 124
              Width = 65
              Height = 13
              Caption = 'Valor do IR'
            end
            object Label55: TLabel
              Left = 326
              Top = 124
              Width = 79
              Height = 13
              Caption = 'Remuneração'
            end
            object Label56: TLabel
              Left = 545
              Top = 124
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label57: TLabel
              Left = 485
              Top = 83
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label58: TLabel
              Left = 6
              Top = 3
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = DBEdit1
            end
            object Label59: TLabel
              Left = 326
              Top = 43
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label60: TLabel
              Left = 165
              Top = 4
              Width = 130
              Height = 13
              Caption = 'Data do Cancelamento'
            end
            object Label61: TLabel
              Left = 111
              Top = 124
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label62: TLabel
              Left = 6
              Top = 43
              Width = 126
              Height = 13
              Caption = 'Plano / Patrocinadora'
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 6
              Top = 98
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = DsCancelamentoVenda
              LookupTable = qryCarteiraCan
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblCarteiraCanEnter
              OnExit = dblCarteiraCanExit
            end
            object DBRealEdit1: TDBRealEdit
              Left = 6
              Top = 138
              Width = 99
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 7
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = DsCancelamentoVenda
            end
            object DBRealEdit2: TDBRealEdit
              Left = 223
              Top = 138
              Width = 94
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              OnEnter = dbrVlrCanEnter
              OnExit = dbrVlrCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = DsCancelamentoVenda
            end
            object wwDBLookupCombo2: TwwDBLookupCombo
              Left = 326
              Top = 98
              Width = 154
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'SGLCUSTODIANTE'#9'10'#9'Descrição'#9'F')
              DataField = 'IDCUSTODIANTE'
              DataSource = DsCancelamentoVenda
              LookupTable = qryCustodianteCan
              LookupField = 'IDCUSTODIANTE'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBRealEdit3: TDBRealEdit
              Left = 442
              Top = 138
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              OnExit = dbrVlrIRCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRIR'
              DataSource = DsCancelamentoVenda
            end
            object DBRealEdit4: TDBRealEdit
              Left = 326
              Top = 138
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 10
              WordWrap = False
              OnExit = dbrVlrCanExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRREMUNERACAO'
              DataSource = DsCancelamentoVenda
            end
            object DBRealEdit5: TDBRealEdit
              Left = 545
              Top = 138
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              TabOrder = 12
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = DsCancelamentoVenda
            end
            object DBEdit1: TDBEdit
              Left = 6
              Top = 18
              Width = 147
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = DsCancelamentoVenda
              Enabled = False
              TabOrder = 0
            end
            object wwDBLookupCombo3: TwwDBLookupCombo
              Left = 485
              Top = 98
              Width = 188
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCMOTBLOQ'#9'30'#9'Descrição'#9'F')
              DataField = 'IDMOTIVOBLOQUEIO'
              DataSource = DsCancelamentoVenda
              LookupTable = qryMotBloqCan
              LookupField = 'IDMOTIVOBLOQUEIO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 326
              Top = 58
              Width = 347
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
              DataField = 'IDTIPOOPERACAO'
              DataSource = DsCancelamentoVenda
              LookupTable = qryTipoOperCan
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 165
              Top = 18
              Width = 152
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = DsCancelamentoVenda
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
              ShowButton = True
              TabOrder = 1
              OnExit = dbdDataOperacaoCanExit
            end
            object DBRealEdit6: TDBRealEdit
              Left = 111
              Top = 138
              Width = 106
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,000000000')
              TabOrder = 8
              WordWrap = False
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRECOUNITOPERACAO'
              DataSource = DsCancelamentoVenda
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 6
              Top = 58
              Width = 312
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'PLANPRVCONTABPATRO'#9'113'#9'Descrição'#9'F')
              DataField = 'IDPLANPREVCTBPATR'
              DataSource = DsCancelamentoVenda
              LookupTable = qryPlanPrevCan
              LookupField = 'IDPLANPREVCTBPATR'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 779
        object lblVlrGerenc: TfcLabel [0]
          Left = 422
          Top = 6
          Width = 72
          Height = 15
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblCapCarteira: TfcLabel [1]
          Left = 144
          Top = 3
          Width = 64
          Height = 19
          Align = alLeft
          AutoSize = False
          Caption = 'Carteiras:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.VAlignment = vaVCenter
          TextOptions.WordWrap = True
          Visible = False
        end
        object lblVlrCarteira: TfcLabel [2]
          Left = 208
          Top = 5
          Width = 72
          Height = 15
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblVlrDif: TfcLabel [3]
          Left = 637
          Top = 4
          Width = 72
          Height = 15
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblCapGerenc: TfcLabel [4]
          Left = 349
          Top = 4
          Width = 73
          Height = 18
          Align = alLeft
          AutoSize = False
          Caption = 'Gerenciais:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblCapDif: TfcLabel [5]
          Left = 575
          Top = 5
          Width = 60
          Height = 13
          Align = alRight
          Caption = 'Diferença: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Height = 24
          end
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
          object bbtnGeraRecebimento: TToolbarButton97
            Left = 100
            Top = 4
            Width = 25
            Height = 17
            Hint = 'Gera Recebimentos'
            AllowAllUp = True
            GroupIndex = 2
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
              000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
              99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
              0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
              FFFF3333337F337F333333333307B70FFFFF33333373FF733F333333333000FF
              0FFF3333333777337FF3333333333FF000FF33FFFFF3333777FF300000333300
              000F377777F33377777F30EEE0333000000037F337F33777777730EEE0333330
              00FF37F337F3333777F330EEE033333000FF37FFF7F3333777F3300000333330
              00FF3777773333F77733333333333000033F3333333337777333}
            ImageIndex = 1
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = bbtnGeraRecebimentoClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 693
        Height = 197
      end
    end
    inherited pnlTitulo: TPanel
      Width = 787
      Height = 33
      inherited lbNomItem: TfcLabel
        Top = 4
        Width = 145
        Caption = 'Recebimentos'
      end
      object dbtDescOperResgFundos: TDBText
        Left = 490
        Top = 8
        Width = 287
        Height = 17
        Alignment = taRightJustify
        DataField = 'DESCTIPOOPERACAORESG'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 789
    inherited Toolbar971: TToolbar97
      object sbtnRelatorios: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = popMnuRel
        Caption = '&Relatórios'
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
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 455
    Width = 789
    inherited tb97Fundo: TToolbar97
      Left = 617
      DockPos = 645
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 448
      DockPos = 476
    end
    inherited fraMens: TfraMensagem
      Width = 449
      inherited pnlProgresso: TPanel
        Width = 449
        inherited pnlProgressoMensagem: TPanel
          Width = 344
          inherited lblProgressoMensagem: TfcLabel
            Width = 342
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 345
          Width = 103
          inherited pgbProcesso: TProgressBar
            Width = 101
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 312
    TargetsData = (
      1
      4
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 440
    Top = 210
  end
  inherited ds: TwwDataSource
    AutoEdit = False
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAODIREITO'
      'set'
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
      '  QTDEACOESDIRPROV = :QTDEACOESDIRPROV,'
      '  IDPEDIDOFUNDO = :IDPEDIDOFUNDO,'
      '  QTDERECDIRPARC = :QTDERECDIRPARC,'
      '  DATAOPER = :DATAOPER,'
      '  QTDDIREITO = :QTDDIREITO,'
      '  FLGTIPODIREITO = :FLGTIPODIREITO'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    InsertSQL.Strings = (
      'insert into OPERACAODIREITO'
      '  (IDOPERACAODIREITO, INVORIGEM, DATAAGE, DATAEX, DATACOM, '
      'PERCENTUAL, '
      '   PARIDADE, PRZBOLSA, PRZEMPRESA, ATADECISAO, FORMAPAGREC, '
      'DIVPORACAO, '
      '   INIPAGTO, JUROSCAP, IDTIPOINVEST, IDTIPOOPERACAO, IDEMISSOR, '
      'OBSERVACAO, '
      
        '   STATUS, ISENCAOIR, IRLITIGIO, PLNCODIGO, CODDOCUMENTO, PLANO,' +
        ' '
      'QTDEACOESDIRPROV, '
      '   IDPEDIDOFUNDO, QTDERECDIRPARC, DATAOPER, QTDDIREITO, '
      'FLGTIPODIREITO)'
      'values'
      '  (:IDOPERACAODIREITO, :INVORIGEM, :DATAAGE, :DATAEX, :DATACOM, '
      ':PERCENTUAL, '
      
        '   :PARIDADE, :PRZBOLSA, :PRZEMPRESA, :ATADECISAO, :FORMAPAGREC,' +
        ' '
      ':DIVPORACAO, '
      
        '   :INIPAGTO, :JUROSCAP, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDEMIS' +
        'SOR, '
      ':OBSERVACAO, '
      
        '   :STATUS, :ISENCAOIR, :IRLITIGIO, :PLNCODIGO, :CODDOCUMENTO, :' +
        'PLANO, '
      
        '   :QTDEACOESDIRPROV, :IDPEDIDOFUNDO, :QTDERECDIRPARC, :DATAOPER' +
        ', '
      ':QTDDIREITO, '
      '   :FLGTIPODIREITO)')
    DeleteSQL.Strings = (
      'delete from OPERACAODIREITO'
      'where'
      '  IDOPERACAODIREITO = :OLD_IDOPERACAODIREITO')
    Left = 395
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'DECODE(OPERACAODIREITO.IDPEDIDOFUNDO, NULL,'#39' NÃO'#39','#39'SIM'#39')'
      
        'NVL(DECODE(OPERACAODIREITO.QTDEACOESDIRPROV, 0,(ROUND(((OPERACAO' +
        'DIREITO.QTDDIREITO-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))*(NVL(O' +
        'PERACAODIREITO.DIVPORACAO,1)/ACOESXBOLSA.QTDELOTE))-0.0049,2)+NV' +
        'L(OPERACAOINVEST.VLRREMUNERACAO,0)), DECODE((NVL(OPERACAODIREITO' +
        '.QTDEACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0)),0, R' +
        'OUND((NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) * NVL(OPERACAODIRE' +
        'ITO.DIVPORACAO,0))-0.0049,2), ROUND(((NVL(OPERACAODIREITO.QTDEAC' +
        'OESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))* NVL(OPERAC' +
        'AODIREITO.DIVPORACAO,1))-0.0049,2))),0)'
      'NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0)'
      'OPERACAODIREITO.DATACOM'
      'OPERACAODIREITO.DATAOPER'
      'OPERACAODIREITO.DATAAGE'
      'OPERACAODIREITO.DATAEX'
      'OPERACAODIREITO.DIVPORACAO'
      'OPERACAODIREITO.PRZBOLSA'
      'OPERACAODIREITO.PRZEMPRESA'
      'OPERACAODIREITO.ATADECISAO'
      'OPERACAODIREITO.PERCENTUAL'
      'OPERACAODIREITO.PARIDADE'
      'OPERACAODIREITO.FORMAPAGREC'
      'OPERACAODIREITO.INIPAGTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'N'
      'D'
      'D'
      'D'
      'N'
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Operação'
      'Empresa'
      'Resg. Fdo'
      'Valor a Receber'
      'Quantidade Fundos'
      'Data Prevista'
      'Data Ex'
      'Data AGE'
      'Data Base'
      'Dividendos por Ação'
      'Prazo Bolsa'
      'Prazo Empresa'
      'Ata Decisão'
      'Percentual'
      'Paridade'
      'Forma de Pagamento/Recebimento'
      'Inicio Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'EMISSOR'
      'PEDIDOFUNDO'
      'OPERACAODIREITO'
      'TIPOOPERACAO'
      'OPERDIREITOXINV'
      'ACOESXBOLSA'
      'PARAMINVEST')
    CamposChave.Strings = (
      'OPERACAODIREITO.IDOPERACAODIREITO'
      'OPERACAODIREITO.PLNCODIGO'
      'OPERACAODIREITO.CODDOCUMENTO')
    Filtro.Strings = (
      
        'OPERACAODIREITO.IDTIPOOPERACAO IN (PARAMINVEST.IDTIPOOPERDIRDIV,' +
        ' PARAMINVEST.IDTIPOOPERDIRJUR, PARAMINVEST.IDTIPOOPERDIRMUL)'
      'TIPOOPERACAO.IDTIPOINVEST = 2'
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'OPERACAODIREITO.IDEMISSOR = EMISSOR.IDEMISSOR(+)'
      'PEDIDOFUNDO.IDPEDIDOFUNDO(+) = OPERACAODIREITO.IDPEDIDOFUNDO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACAO' +
        'DIREITO'
      
        'OPERDIREITOXINV.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO'
      'ACOESXBOLSA.IDACAO(+) =OPERDIREITOXINV.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###0.00'
      '###,###,###,###0'
      ''
      ''
      ''
      ''
      ',#0.0000000000'
      ''
      ''
      ''
      ',#0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '28'
      '18'
      '5'
      '18'
      '18'
      '10'
      '10'
      '10'
      '10'
      '15'
      '10'
      '10'
      '10'
      '15'
      '15'
      '20'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
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
      ''
      ''
      ''
      ''
      ''
      ''
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
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 344
  end
  inherited ImlPadrao: TImageList
    Left = 305
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 356
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT TPO.DESCTIPOOPERACAO AS DESCTIPOOPERACAO, TPP.DESCTIPOOPE' +
        'RACAO AS DESCTIPOOPERACAORESG,'
      
        '       OPD.IDOPERACAODIREITO, OPD.INVORIGEM, OPD.DATAAGE, OPD.DA' +
        'TAEX, OPD.DATACOM, OPD.PERCENTUAL,'
      
        '       OPD.PARIDADE, OPD.PRZBOLSA, OPD.PRZEMPRESA, OPD.ATADECISA' +
        'O, OPD.FORMAPAGREC, OPD.DIVPORACAO,'
      
        '       OPD.INIPAGTO, OPD.JUROSCAP, OPD.TRGDTINCLUSAO, OPD.TRGUSE' +
        'RINCLUSAO, OPD.IDTIPOINVEST,'
      
        '       OPD.IDTIPOOPERACAO, OPD.IDEMISSOR, OPD.OBSERVACAO, OPD.IS' +
        'ENCAOIR, OPD.IRLITIGIO,'
      
        '       NVL(OPD.STATUS,'#39'P'#39') AS STATUS, OPD.PLANO, OPD.PLNCODIGO, ' +
        'OPD.CODDOCUMENTO, OPD.QTDEACOESDIRPROV, OPD.IDPEDIDOFUNDO,'
      
        '       OPD.QTDERECDIRPARC, OPD.DATAOPER, OPD.FLGTIPODIREITO, OPD' +
        '.QTDDIREITO'
      ''
      
        'FROM OPERACAODIREITO OPD, PEDIDOFUNDO PDF, TIPOOPERACAO TPO, TIP' +
        'OOPERACAO TPP,'
      '     PARAMINVEST PI'
      ''
      'WHERE OPD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND PDF.IDPEDIDOFUNDO(+)  = OPD.IDPEDIDOFUNDO'
      
        '  AND OPD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERD' +
        'IRJUR, PI.IDTIPOOPERDIRMUL)'
      '  AND TPP.IDTIPOOPERACAO(+) = PDF.IDTIPOOPERACAO'
      '  AND TPO.IDTIPOOPERACAO(+) = OPD.IDTIPOOPERACAO'
      ' '
      ''
      ' '
      ' ')
    Left = 407
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDESCTIPOOPERACAORESG: TStringField
      FieldName = 'DESCTIPOOPERACAORESG'
      Size = 60
    end
    object qryIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryINVORIGEM: TFloatField
      FieldName = 'INVORIGEM'
    end
    object qryDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object qryDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object qryDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryPARIDADE: TFloatField
      FieldName = 'PARIDADE'
    end
    object qryPRZBOLSA: TDateTimeField
      FieldName = 'PRZBOLSA'
    end
    object qryPRZEMPRESA: TDateTimeField
      FieldName = 'PRZEMPRESA'
    end
    object qryATADECISAO: TDateTimeField
      FieldName = 'ATADECISAO'
    end
    object qryFORMAPAGREC: TStringField
      FieldName = 'FORMAPAGREC'
      Size = 30
    end
    object qryDIVPORACAO: TFloatField
      FieldName = 'DIVPORACAO'
    end
    object qryINIPAGTO: TDateTimeField
      FieldName = 'INIPAGTO'
    end
    object qryJUROSCAP: TStringField
      FieldName = 'JUROSCAP'
      FixedChar = True
      Size = 1
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 300
    end
    object qryISENCAOIR: TStringField
      FieldName = 'ISENCAOIR'
      FixedChar = True
      Size = 1
    end
    object qryIRLITIGIO: TStringField
      FieldName = 'IRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryQTDEACOESDIRPROV: TFloatField
      FieldName = 'QTDEACOESDIRPROV'
    end
    object qryQTDERECDIRPARC: TFloatField
      FieldName = 'QTDERECDIRPARC'
    end
    object qryDATAOPER: TDateTimeField
      FieldName = 'DATAOPER'
    end
    object qryFLGTIPODIREITO: TStringField
      FieldName = 'FLGTIPODIREITO'
      FixedChar = True
      Size = 1
    end
    object qryIDPEDIDOFUNDO: TFloatField
      FieldName = 'IDPEDIDOFUNDO'
    end
    object qryQTDDIREITO: TFloatField
      FieldName = 'QTDDIREITO'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    ApplyInsert = CmeDetalheApplyInsert
    ApplyEdit = CmeDetalheApplyInsert
    Left = 347
    Top = 210
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERDIREITOXINV'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  ORIGDEST = :ORIGDEST'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    InsertSQL.Strings = (
      'insert into OPERDIREITOXINV'
      
        '  (IDOPERDIREITOXINV, IDINVESTIMENTO, IDOPERACAODIREITO, ORIGDES' +
        'T)'
      'values'
      '  (:IDOPERDIREITOXINV, :IDINVESTIMENTO, :IDOPERACAODIREITO, '
      ':ORIGDEST)')
    DeleteSQL.Strings = (
      'delete from OPERDIREITOXINV'
      'where'
      '  IDOPERDIREITOXINV = :OLD_IDOPERDIREITOXINV')
    Left = 412
    Top = 210
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT O.IDOPERDIREITOXINV, O.IDINVESTIMENTO, I.DESCINVESTIMENTO' +
        ', O.IDOPERACAODIREITO,'
      '       O.ORIGDEST'
      'FROM OPERDIREITOXINV O, INVESTIMENTO I'
      'WHERE O.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      'ORDER BY ORIGDEST DESC, DESCINVESTIMENTO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 384
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 100
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryDetalheORIGDEST: TStringField
      DisplayWidth = 15
      FieldName = 'ORIGDEST'
      Origin = 'BASEDADOS.OPERDIREITOXINV.ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDOPERDIREITOXINV: TFloatField
      FieldName = 'IDOPERDIREITOXINV'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDOPERDIREITOXINV'
      Visible = False
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDINVESTIMENTO'
      Visible = False
    end
    object qryDetalheIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.OPERDIREITOXINV.IDOPERACAODIREITO'
      Visible = False
    end
  end
  object qryProvisao: TwwQuery
    CachedUpdates = True
    AfterScroll = qryProvisaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, NVL(OI.VLROPERACAO,0)' +
        ' AS VLROPERACAO,'
      
        '       NVL(OI.VLRREMUNERACAO,0) AS VLRREMUNERACAO,  NVL(OI.VLRIR' +
        'REMUNER,0) AS VLRIRREMUNER ,'
      '       NVL(OI.VLRIR,0) AS VLRIR,'
      
        '      (NVL(OI.VLROPERACAO,0) + NVL(OI.VLRREMUNERACAO,0) - NVL(OI' +
        '.VLRIR,0) - NVL(OI.VLRIRREMUNER,0)) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        '0 AS QTDEEXERCIDA,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, '
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39')))' +
        ')'
      '      ) CI,'
      '      ('
      '      SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST'
      '       FROM OPERACAOINVEST OI1'
      '      WHERE OI1.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '        AND OI1.IDTIPOOPERACAO in (-70, -10070)'
      
        '      GROUP BY OI1.IDPLANPREVCTBPATR, OI1.IDCARTEIRAINVEST, OI1.' +
        'IDCUSTODIANTE) OIMAX'
      ''
      'WHERE'
      '      OI.IDOPERACAOINVEST  = OIMAX.IDOPERACAOINVEST'
      '  AND OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST      = 2'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND OI.QTDEOPERACAO      > 0'
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ' ')
    UpdateObject = updProvisao
    ValidateWithMask = True
    Left = 480
    Top = 210
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object qryProvisaoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryProvisaoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryProvisaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryProvisaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryProvisaoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryProvisaoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryProvisaoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryProvisaoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryProvisaoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object qryProvisaoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryProvisaoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryProvisaoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryProvisaoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryProvisaoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryProvisaoORIGDEST: TStringField
      DisplayWidth = 1
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryProvisaoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryProvisaoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryProvisaoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryProvisaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryProvisaoNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryProvisaoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryProvisaoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryProvisaoIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryProvisaoFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoFLGSTATUSORDMOV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryProvisaoPERCENTUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCENTUAL'
      Visible = False
      DisplayFormat = '##0.#########'
    end
    object qryProvisaoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryProvisaoIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryProvisaoIDOPERCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryProvisaoIDCUSTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryProvisaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryProvisaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryProvisaoQTDEEXERCIDA: TFloatField
      FieldName = 'QTDEEXERCIDA'
      Visible = False
    end
    object qryProvisaoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryProvisaoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
  object updProvisao: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 508
    Top = 210
  end
  object dsProvisao: TwwDataSource
    AutoEdit = False
    DataSet = qryProvisao
    OnStateChange = dsDetStateChange
    Left = 536
    Top = 210
  end
  object qryRecebimento: TwwQuery
    CachedUpdates = True
    AfterScroll = qryRecebimentoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RREMUNERACAO,'
      '       OI.VLRIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, '
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATACOM,'#39'DD/MM/YYYY'#39'))' +
        '))'
      '      ) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST = 2'
      
        '  AND ((OI.IDTIPOOPERACAO  = OD.IDTIPOOPERACAO) OR (OI.IDTIPOOPE' +
        'RACAO = OD.IDTIPOOPERACAO+10000))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updRecebimento
    ValidateWithMask = True
    Left = 576
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATACOM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryRecebimentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRecebimentoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryRecebimentoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRecebimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryRecebimentoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRecebimentoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryRecebimentoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryRecebimentoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryRecebimentoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 20
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object qryRecebimentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryRecebimentoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryRecebimentoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryRecebimentoMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryRecebimentoIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryRecebimentoORIGDEST: TStringField
      DisplayWidth = 9
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoEMPRESAPROP: TFloatField
      DisplayWidth = 13
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryRecebimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryRecebimentoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 17
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryRecebimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 12
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryRecebimentoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryRecebimentoNUMDOCUMENTO_1: TStringField
      DisplayWidth = 30
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryRecebimentoIDFORCLI: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryRecebimentoIDLOTE: TStringField
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryRecebimentoIDCUSTODIANTE: TFloatField
      DisplayWidth = 14
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryRecebimentoFLGSTATUSFECHBOL: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoFLGSTATUSORDMOV: TStringField
      DisplayWidth = 18
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoIDOPERACAODIREITO: TFloatField
      DisplayWidth = 18
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryRecebimentoPERCENTUAL: TFloatField
      DisplayWidth = 11
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryRecebimentoIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 18
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryRecebimentoIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 19
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryRecebimentoIDOPERCUSTODIA: TFloatField
      DisplayWidth = 15
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryRecebimentoIDCUSTORIG: TFloatField
      DisplayWidth = 11
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryRecebimentoIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 17
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryRecebimentoNATUREZAOPERACAO: TStringField
      DisplayWidth = 19
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryRecebimentoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryRecebimentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryRecebimentoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
  object updRecebimento: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO, '
      'IDOPERACAOORIGEM)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO, :IDOPERACAOORIGEM)'
      '')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 604
    Top = 218
  end
  object dsRecebimento: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebimento
    OnStateChange = dsDetStateChange
    Left = 632
    Top = 218
  end
  object QryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE IV.IDTIPOINVEST = 2'
      '  AND EM.IDEMISSOR = IV.IDEMISSOR'
      'ORDER BY EM.SIGLAEMISSOR')
    ValidateWithMask = True
    Left = 377
    Top = 140
    object QryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Size = 15
    end
    object QryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object qryTipoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'A'#39' AS FLGTIPODIREITO, '#39'Antigo                   '#39' AS DES' +
        'CRICAO FROM DUAL'
      'UNION'
      
        'SELECT '#39'N'#39' AS FLGTIPODIREITO, '#39'Novo                     '#39' AS DES' +
        'CRICAO FROM DUAL'
      'UNION'
      
        'SELECT '#39'P'#39' AS FLGTIPODIREITO, '#39'Proporcional             '#39' AS DES' +
        'CRICAO FROM DUAL'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 441
    Top = 52
    object qryTipoDireitoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 25
    end
    object qryTipoDireitoFLGTIPODIREITO: TStringField
      FieldName = 'FLGTIPODIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       I.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.QTDTITLOTE, '
      '       I.IDTIPOINVEST, I.IDEMISSOR, I.IDMOEDACONTAB'
      'FROM  INVESTIMENTO I, COTACAOINVEST C'
      'WHERE (I.IDTIPOINVEST = 2)'
      '  AND ((:IDEMISSOR IS NULL) OR (I.IDEMISSOR = :IDEMISSOR))'
      '  AND (I.IDINVESTIMENTO = C.IDINVESTIMENTO)'
      '  AND (C.DATACOTACAO IN (SELECT MAX(C1.DATACOTACAO)'
      '                         FROM COTACAOINVEST C1'
      
        '                         WHERE ((:DATACOTACAO IS NULL) OR (C1.DA' +
        'TACOTACAO <= TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')))'
      
        '                           AND (C1.IDINVESTIMENTO = I.IDINVESTIM' +
        'ENTO)))'
      'ORDER BY I.DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 113
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTACAO'
        ParamType = ptResult
      end>
    object qryInvestimentoAcaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoAcaoQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object qryInvestimentoAcaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoAcaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object qryInvestimentoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoAcaoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'BASEDADOS.INVESTIMENTO.IDMOEDACONTAB'
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.FLGAGE, T.FLGDATAEX, T.FLGDATACOM, T.FLGPRZBOLSA, T.FLG' +
        'PRZEMP, T.FLGATADEC,'
      
        '       T.FLGFORMAPAGREC, T.FLGDIVACAO, T.FLGINIPAG, T.FLGJUROS, ' +
        'T.FLGPARIDADE,'
      
        '       T.FLGINVORIGEM, T.FLGPERC, T.DESCTIPOOPERACAO, T.IDTIPOOP' +
        'ERACAO, T.IDTIPOINVEST,'
      
        '       T.FLGGRAVAIRLITIGIO, T.FLGISENTOIR, T.NATUREZAOPERACAO, T' +
        '.IDMERCADO, T.FLGTRATAIR,'
      
        '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO, T.FLGGERACONTAB, T.F' +
        'LGGERACAPCAR'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      'WHERE (T.IDTIPOOPERACAO = P.IDTIPOOPERDIRDIV)'
      '   OR (T.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR)'
      '   OR (T.IDTIPOOPERACAO = P.IDTIPOOPERDIRMUL)'
      '  AND (T.IDTIPOINVEST = 2) '
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 104
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
  end
  object QryBuscaOperDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAODIREITO'
      'WHERE IDTIPOOPERACAO = :P_IDTIPOOPERACAO'
      '  AND IDEMISSOR      = :P_IDEMISSOR'
      '  AND DATAEX         = TO_DATE(:P_DATAEX,'#39'DD/MM/YYYY'#39')'
      '  AND DATAAGE        = TO_DATE(:P_DATAAGE,'#39'DD/MM/YYYY'#39')'
      '  AND DATACOM        = TO_DATE(:P_DATACOM,'#39'DD/MM/YYYY'#39')'
      ' ')
    ValidateWithMask = True
    Left = 483
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'P_IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATAAGE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'P_DATACOM'
        ParamType = ptResult
      end>
  end
  object QryOrigemDivJur: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       PP.PLANPRVCONTABPATRO, INV.DESCINVESTIMENTO, CA.DESCCARTI' +
        'NVEST, C.SGLCUSTODIANTE,'
      
        '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) SI' +
        'GLAMOTBLOQ, HC.IDLOTE,'
      
        '       SYSDATE  AS DATAREFERENCIA, DECODE(HC.IDMOTIVOBLOQUEIO, -' +
        '1, HC.SALDOLIBERADO, SALDOBLOQUEADO)  AS QTDE,'
      
        '       0 AS QTDEDIREITO, 0 AS VALOREXERCIDO, 0 AS VLRREMUNERACAO' +
        ', 0 AS IR, 0 AS VLRLIQ,'
      '       0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0 AS VLRCUSTO,'
      
        '       HC.IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, HC.IDINVES' +
        'TIMENTO, HC.IDCUSTODIANTE, HC.IDPLANPREVCTBPATR,'
      '       LPAD(HC.IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,'
      '       HC.IDMOTIVOBLOQUEIO, HC.IDCUSTODIA, QTL.QTDTITLOTE,'
      
        '       DECODE(:FORCLI, '#39'CT'#39', SGLCUSTODIANTE, TO_CHAR(IDEMISSOR))' +
        ' AS ORDEM'
      ''
      
        'FROM HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTEIRA' +
        'INVEST CA, INVESTIMENTO INV,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '      FROM COTACAOINVEST'
      '      WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '        AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                           FROM COTACAOINVEST'
      
        '                           WHERE DATACOTACAO <= TO_DATE(:DATAEX,' +
        #39'DD/MM/YYYY'#39')'
      
        '                             AND IDINVESTIMENTO = :IDINVESTIMENT' +
        'O)) QTL'
      'WHERE HC.IDINVESTIMENTO     = :IDINVESTIMENTO'
      '  AND QTL.IDINVESTIMENTO    = :IDINVESTIMENTO'
      '  AND HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST'
      '  AND HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO'
      '  AND HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)'
      '  AND HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND HC.IDPLANPREVCTBPATR  = PP.IDPLANPREVCTBPATR(+)'
      '  AND HC.IDCUSTODIA  IN (SELECT MAX(HC1.IDCUSTODIA)'
      '                         FROM HISTCUSTODIA HC1'
      
        '                         WHERE HC1.IDINVESTIMENTO = :IDINVESTIME' +
        'NTO'
      
        '                           AND (HC1.DATAMOVCUSTOD || HC1.IDPLANP' +
        'REVCTBPATR || HC1.IDCARTEIRAINVEST || HC1.IDCUSTODIANTE || HC1.I' +
        'DMOTIVOBLOQUEIO) IN'
      
        '                                   (SELECT MAX(HC2.DATAMOVCUSTOD' +
        ') || HC2.IDPLANPREVCTBPATR || HC2.IDCARTEIRAINVEST || HC2.IDCUST' +
        'ODIANTE || HC2.IDMOTIVOBLOQUEIO'
      '                                    FROM HISTCUSTODIA HC2'
      
        '                                    WHERE HC2.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO'
      
        '                                      AND HC2.DATAMOVCUSTOD <= T' +
        'O_DATE(:DATAEX,'#39'DD/MM/YYYY'#39')'
      
        '                                      AND HC2.IDCARTEIRAINVEST =' +
        ' HC1.IDCARTEIRAINVEST'
      
        '                                      AND HC2.IDCUSTODIANTE = HC' +
        '1.IDCUSTODIANTE'
      
        '                                      AND HC2.IDMOTIVOBLOQUEIO =' +
        ' HC1.IDMOTIVOBLOQUEIO'
      
        '                                    GROUP BY HC2.IDPLANPREVCTBPA' +
        'TR, HC2.IDCARTEIRAINVEST, HC2.IDCUSTODIANTE, HC2.IDMOTIVOBLOQUEI' +
        'O)'
      
        '                         GROUP BY HC1.IDPLANPREVCTBPATR, HC1.IDC' +
        'ARTEIRAINVEST, HC1.IDCUSTODIANTE, HC1.IDMOTIVOBLOQUEIO)'
      
        '  AND DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, SALDOBLO' +
        'QUEADO) <> 0'
      ''
      'UNION ALL'
      ''
      'SELECT DISTINCT'
      
        '   PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, CA.DESCCARTINVEST' +
        ', '#39#39' AS SLGCUSTODIANTE,'
      '   '#39#39' AS SIGLAMOTBLOQ,  HI.IDLOTE,'
      
        '   SYSDATE AS DATAREFERENCIA, NVL(HI.SALDOQTDEINVCART,0) AS QTDE' +
        ','
      
        '   0 AS QTDEDIREITO, 0 AS VALOREXERCICIO, 0 AS VLRREMUNERACAO, 0' +
        ' AS IR,'
      
        '   0 AS VLRLIQ, 0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0 AS ' +
        'VLRCUSTO,'
      
        '   HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVESTIMENTO, ' +
        'NULL AS IDCUSTODIANTE, HI.IDPLANPREVCTBPATR, '
      
        '   LPAD(HI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(HI.IDCARTEIRAGERENC,2' +
        ','#39'0'#39') AS IDCARTEIRA,'
      '   NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.QTDTITLOTE,'
      '   DECODE(:FORCLI, '#39'CT'#39', '#39#39', TO_CHAR(IDEMISSOR)) AS ORDEM'
      'FROM'
      '   HISTCARTINV HI, INVESTIMENTO IV, VWCARTEIRASRV  CA,'
      
        '   (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, PA' +
        '.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '   (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '    FROM COTACAOINVEST'
      '    WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '         AND DATACOTACAO = (SELECT MAX(DATACOTACAO)'
      '                            FROM COTACAOINVEST'
      
        '                            WHERE DATACOTACAO <= TO_DATE(:DATAEX' +
        ','#39'DD/MM/YYYY'#39')'
      
        '                              AND IDINVESTIMENTO = :IDINVESTIMEN' +
        'TO)) QTL'
      'WHERE (HI.IDHISTCARTINV  IN'
      '          (SELECT MAX(HI1.IDHISTCARTINV)'
      '           FROM HISTCARTINV HI1'
      '           WHERE (HI1.IDCARTEIRAGERENC   IS NOT NULL)'
      
        '             AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI1.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (HI1.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '             AND (HI1.IDTIPOINVEST = 2)'
      
        '             AND ((HI1.DATAMOVCARTINV || HI1.IDPLANPREVCTBPATR |' +
        '| HI1.IDINVESTIMENTO || HI1.IDCARTEIRAINVEST || HI1.IDCARTEIRAGE' +
        'RENC) IN'
      
        '                       (SELECT (MAX(HI2.DATAMOVCARTINV) || HI2.I' +
        'DPLANPREVCTBPATR || HI2.IDINVESTIMENTO || HI2.IDCARTEIRAINVEST |' +
        '| HI2.IDCARTEIRAGERENC)'
      '                        FROM HISTCARTINV HI2'
      '                        WHERE (HI2.IDCARTEIRAGERENC IS NOT NULL)'
      
        '                          AND ((:IDPLANPREVCTBPATR IS NULL) OR (' +
        'HI2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                          AND (HI2.IDINVESTIMENTO = :IDINVESTIME' +
        'NTO)'
      '                          AND (HI2.IDTIPOINVEST = 2)'
      
        '                          AND (HI2.DATAMOVCARTINV <= TO_DATE(:DA' +
        'TAEX,'#39'DD/MM/YYYY'#39'))'
      
        '                        GROUP BY HI2.IDPLANPREVCTBPATR, HI2.IDIN' +
        'VESTIMENTO, HI2.IDCARTEIRAINVEST, HI2.IDCARTEIRAGERENC))'
      
        '           GROUP BY HI1.IDPLANPREVCTBPATR, HI1.IDINVESTIMENTO, H' +
        'I1.IDCARTEIRAINVEST, HI1.IDCARTEIRAGERENC))'
      '  AND (HI.IDINVESTIMENTO     = IV.IDINVESTIMENTO(+))'
      '  AND (HI.IDCARTEIRAGERENC   = CA.IDCARTEIRAGERENC)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI.IDPLANPREVCTBPATR = :' +
        'IDPLANPREVCTBPATR))'
      '  AND (HI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+))'
      '  AND (HI.IDINVESTIMENTO = :IDINVESTIMENTO)'
      '  AND (HI.IDTIPOINVEST = 2)'
      '  AND (NVL(HI.SALDOQTDEINVCART,0) > 0)'
      '  AND (HI.IDINVESTIMENTO = QTL.IDINVESTIMENTO)'
      ''
      
        'ORDER BY ORDEM, PLANPRVCONTABPATRO, DESCINVESTIMENTO, IDCARTEIRA' +
        'GERENC DESC, DESCCARTINVEST'
      ' ')
    UpdateObject = UpdOrigemDivJur
    ValidateWithMask = True
    Left = 442
    Top = 1
    ParamData = <
      item
        DataType = ftString
        Name = 'FORCLI'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FORCLI'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object QryOrigemDivJurDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryOrigemDivJurDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryOrigemDivJurSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object QryOrigemDivJurSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object QryOrigemDivJurIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object QryOrigemDivJurDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object QryOrigemDivJurQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object QryOrigemDivJurQTDEDIREITO: TFloatField
      FieldName = 'QTDEDIREITO'
    end
    object QryOrigemDivJurVALOREXERCIDO: TFloatField
      FieldName = 'VALOREXERCIDO'
    end
    object QryOrigemDivJurVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
    end
    object QryOrigemDivJurIR: TFloatField
      FieldName = 'IR'
    end
    object QryOrigemDivJurVLRLIQ: TFloatField
      FieldName = 'VLRLIQ'
    end
    object QryOrigemDivJurVLRIRREMUNERACAO: TFloatField
      FieldName = 'VLRIRREMUNERACAO'
    end
    object QryOrigemDivJurVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
    end
    object QryOrigemDivJurVLRCUSTO: TFloatField
      FieldName = 'VLRCUSTO'
    end
    object QryOrigemDivJurIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object QryOrigemDivJurIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object QryOrigemDivJurIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryOrigemDivJurIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object QryOrigemDivJurIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object QryOrigemDivJurIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object QryOrigemDivJurQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
    end
    object QryOrigemDivJurIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
    object QryOrigemDivJurORDEM: TStringField
      FieldName = 'ORDEM'
      Size = 40
    end
    object QryOrigemDivJurPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryOrigemDivJurIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object UpdOrigemDivJur: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDLOTE = :IDLOTE,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      
        '  (IDCARTEIRAINVEST, IDINVESTIMENTO, IDCUSTODIANTE, IDLOTE, IDMO' +
        'TIVOBLOQUEIO, '
      '   IDPLANPREVCTBPATR)'
      'values'
      
        '  (:IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDCUSTODIANTE, :IDLOTE, ' +
        ':IDMOTIVOBLOQUEIO, '
      '   :IDPLANPREVCTBPATR)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE and'
      '  IDLOTE = :OLD_IDLOTE and'
      '  IDMOTIVOBLOQUEIO = :OLD_IDMOTIVOBLOQUEIO')
    Left = 452
    Top = 1
  end
  object QryBuscaBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES'
      'FROM'
      '   BOLSAVALORES'
      'WHERE'
      '   IDCUSTODIANTE =:IDCUSTODIANTE      ')
    ValidateWithMask = True
    Left = 528
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
  end
  object qryAcoesxBolsa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDBOLSAVALORES,'
      '   QTDELOTE'
      'FROM'
      '   ACOESXBOLSA'
      'WHERE'
      '   IDACAO = :IDINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 688
    Top = 52
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryBoleta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLA' +
        'NO, PLNCODIGO, CODDOCUMENTO,'
      '       '#39'N'#39' AS EXCLUIBOLETA, 0 AS CONTACCI, 0 AS VALOR'
      'FROM BOLETA'
      'WHERE IDBOLETA IN (SELECT NUMDOCUMENTO'
      '                   FROM OPERACAOINVEST'
      '                   WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO)'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updBoleta
    ValidateWithMask = True
    Left = 529
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryBoletaIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.BOLETA.IDBOLETA'
      Size = 30
    end
    object qryBoletaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.BOLETA.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryBoletaDATABOLETA: TDateTimeField
      FieldName = 'DATABOLETA'
      Origin = 'BASEDADOS.BOLETA.DATABOLETA'
    end
    object qryBoletaTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Origin = 'BASEDADOS.BOLETA.TIPMOVBOLETA'
      Size = 3
    end
    object qryBoletaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.BOLETA.IDFORCLI'
    end
    object qryBoletaPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryBoletaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBoletaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBoletaEXCLUIBOLETA: TStringField
      FieldName = 'EXCLUIBOLETA'
      FixedChar = True
      Size = 1
    end
    object qryBoletaCONTACCI: TFloatField
      FieldName = 'CONTACCI'
    end
    object qryBoletaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object updBoleta: TUpdateSQL
    ModifySQL.Strings = (
      'update BOLETA'
      'set'
      '  STATUS = :STATUS,'
      '  DATABOLETA = :DATABOLETA,'
      '  TIPMOVBOLETA = :TIPMOVBOLETA,'
      '  IDFORCLI = :IDFORCLI,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  CODDOCUMENTO = :CODDOCUMENTO'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    InsertSQL.Strings = (
      'insert into BOLETA'
      
        '  (IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLANO, ' +
        'PLNCODIGO, '
      '   CODDOCUMENTO)'
      'values'
      
        '  (:IDBOLETA, :STATUS, :DATABOLETA, :TIPMOVBOLETA, :IDFORCLI, :P' +
        'LANO, :PLNCODIGO, '
      '   :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from BOLETA'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    Left = 547
    Top = 1
  end
  object qryCarteiraProv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '   DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA,'
      '   CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '   CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, CI.IDME' +
        'RCADO'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))')
    ValidateWithMask = True
    Left = 277
    Top = 318
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptResult
      end>
    object qryCarteiraProvDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraProvIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraProvIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraProvIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
  end
  object qryCustodianteProv: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 457
    Top = 318
    object qryCustodianteProvIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteProvSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMotBloqProv: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SIGLAMOT' +
        'BLOQ, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DESCMOTBL' +
        'OQ'
      'FROM MOTIVOBLOQUEIO')
    ValidateWithMask = True
    Left = 549
    Top = 318
    object qryMotBloqProvDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qryMotBloqProvIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryMotBloqProvSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'BASEDADOS.MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Visible = False
      Size = 3
    end
  end
  object qryTipoOperProv: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO IN (-70, -10070)'
      '  AND IDTIPOINVEST = 2'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 318
    object qryTipoOperProvDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperProvIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperProvIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperProvIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
    object qryTipoOperProvCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object qryTipoOperProvNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvTIPOCUSTODIA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCUSTODIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvVENCIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object qryTipoOperProvFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperProvFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperProvRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperProvFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Visible = False
    end
    object qryTipoOperProvFLGTRANSF: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRANSF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryTipoOperProvTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryTipoOperProvFLGCORRET: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCORRET'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryTipoOperProvFLGOPDIREITO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPDIREITO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGAGE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGDATAEX: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGDATACOM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGINVORIGEM: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGPERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGPARIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGPRZBOLSA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGPRZEMP: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGATADEC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGFORMAPAGREC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGDIVACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGINIPAG: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGJUROS: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvMOTBLOQCARTORIG: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTORIG'
      Visible = False
    end
    object qryTipoOperProvMOTBLOQCARTDEST: TFloatField
      DisplayWidth = 10
      FieldName = 'MOTBLOQCARTDEST'
      Visible = False
    end
    object qryTipoOperProvTIPSALDOCARTORIG: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTORIG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvTIPSALDOCARTDEST: TStringField
      DisplayWidth = 1
      FieldName = 'TIPSALDOCARTDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvSIGLATIPOOPER: TStringField
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperProvFLGISENTOIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGGRAVAIRLITIGIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGOPGERENC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGOPGERENC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvTIPOMOVTO: TStringField
      DisplayWidth = 3
      FieldName = 'TIPOMOVTO'
      Visible = False
      Size = 3
    end
    object qryTipoOperProvSTAATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGRENTABILIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGRENTABILIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGCONTAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCONTAINVEST'
      Visible = False
    end
    object qryTipoOperProvFLGMOVCOTA: TStringField
      DisplayWidth = 1
      FieldName = 'FLGMOVCOTA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGCOTARECDES: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCOTARECDES'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperProvFLGDATAVENCIMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAVENCIMENTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qryHistCartInv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHISTCARTINV, IDTIPOOPERACAO, IDOPERACAOINVEST, DATAMOVC' +
        'ARTINV, HISTMOVCARTINV'
      'FROM HISTCARTINV'
      'WHERE IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST'
      '                           FROM OPERACAOINVEST'
      
        '                           WHERE IDOPERACAODIREITO = :IDOPERACAO' +
        'DIREITO)'
      'ORDER BY DATAMOVCARTINV, IDHISTCARTINV')
    UpdateObject = updHistCartInv
    ValidateWithMask = True
    Left = 585
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryHistCartInvIDHISTCARTINV: TFloatField
      FieldName = 'IDHISTCARTINV'
    end
    object qryHistCartInvIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryHistCartInvIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryHistCartInvDATAMOVCARTINV: TDateTimeField
      FieldName = 'DATAMOVCARTINV'
    end
    object qryHistCartInvHISTMOVCARTINV: TStringField
      FieldName = 'HISTMOVCARTINV'
      Size = 60
    end
  end
  object updHistCartInv: TUpdateSQL
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  IDHISTCARTINV = :OLD_IDHISTCARTINV')
    Left = 603
    Top = 4
  end
  object QryBuscaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCFUNDOINVEST, DESCTIPOOPERACAO'
      'FROM'
      '       PEDIDOFUNDO PF, FUNDOINVEST FI, TIPOOPERACAO TP'
      'WHERE'
      '       PF.IDPEDIDOFUNDO  = :IDPEDIDOFUNDO    AND'
      '       FI.IDFUNDOINVEST  = PF.IDFUNDOINVEST  AND'
      '       TP.IDTIPOOPERACAO = PF.IDTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 728
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPEDIDOFUNDO'
        ParamType = ptUnknown
      end>
    object QryBuscaFundoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryBuscaFundoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
  end
  object QryUpdIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '      IRLITIGIO'
      'SET '
      '      PLANO     = :pPLANO,'
      '      PLNCODIGO = :pPLNCODIGO'
      'WHERE'
      '      IDOPERACAOINVEST = :pIDOPERACAOINVEST')
    ValidateWithMask = True
    Left = 676
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pPLNCODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDOPERACAOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryHistProv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHISTPROVISAO, IDOPERACAODIREITO, IDCARTEIRAINVEST, IDCA' +
        'RTEIRAGERENC, IDOPERACAOINVEST, IDCARTEIRAXEVENTO,'
      '       VLRHISTPROVISAO, SLDHISTPROVISAO, DATAORIGEM'
      'FROM HISTPROVISAO'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO'
      ' ')
    UpdateObject = updHistProvProv
    ValidateWithMask = True
    Left = 638
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryHistProvIDHISTPROVISAO: TFloatField
      FieldName = 'IDHISTPROVISAO'
      Origin = 'BASEDADOS.HISTPROVISAO.IDHISTPROVISAO'
    end
    object qryHistProvIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.HISTPROVISAO.IDOPERACAODIREITO'
    end
    object qryHistProvIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTPROVISAO.IDCARTEIRAINVEST'
    end
    object qryHistProvIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.HISTPROVISAO.IDCARTEIRAGERENC'
    end
    object qryHistProvIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.HISTPROVISAO.IDOPERACAOINVEST'
    end
    object qryHistProvIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Origin = 'BASEDADOS.HISTPROVISAO.IDCARTEIRAXEVENTO'
    end
    object qryHistProvVLRHISTPROVISAO: TFloatField
      FieldName = 'VLRHISTPROVISAO'
      Origin = 'BASEDADOS.HISTPROVISAO.VLRHISTPROVISAO'
    end
    object qryHistProvSLDHISTPROVISAO: TFloatField
      FieldName = 'SLDHISTPROVISAO'
      Origin = 'BASEDADOS.HISTPROVISAO.SLDHISTPROVISAO'
    end
    object qryHistProvDATAORIGEM: TDateTimeField
      FieldName = 'DATAORIGEM'
      Origin = 'BASEDADOS.HISTPROVISAO.DATAORIGEM'
    end
  end
  object updHistProvProv: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTPROVISAO'
      'set'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  VLRHISTPROVISAO = :VLRHISTPROVISAO,'
      '  SLDHISTPROVISAO = :SLDHISTPROVISAO,'
      '  DATAORIGEM = :DATAORIGEM'
      'where'
      '  IDHISTPROVISAO = :OLD_IDHISTPROVISAO')
    InsertSQL.Strings = (
      'insert into HISTPROVISAO'
      '  (IDHISTPROVISAO, IDOPERACAODIREITO, IDCARTEIRAINVEST, '
      'IDCARTEIRAGERENC, '
      '   IDOPERACAOINVEST, IDCARTEIRAXEVENTO, VLRHISTPROVISAO, '
      'SLDHISTPROVISAO, '
      '   DATAORIGEM)'
      'values'
      '  (:IDHISTPROVISAO, :IDOPERACAODIREITO, :IDCARTEIRAINVEST, '
      ':IDCARTEIRAGERENC, '
      '   :IDOPERACAOINVEST, :IDCARTEIRAXEVENTO, :VLRHISTPROVISAO, '
      ':SLDHISTPROVISAO, '
      '   :DATAORIGEM)')
    DeleteSQL.Strings = (
      'delete from HISTPROVISAO'
      'where'
      '  IDHISTPROVISAO = :OLD_IDHISTPROVISAO')
    Left = 656
    Top = 4
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 623
    Top = 54
  end
  object qryCarteiraRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '   DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA,'
      '   CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '   CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, CI.IDME' +
        'RCADO'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))')
    ValidateWithMask = True
    Left = 277
    Top = 372
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptResult
      end>
    object qryCarteiraRecDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraRecIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraRecIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraRecIDCARTEIRA: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
  end
  object qryCustodianteRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 457
    Top = 364
    object qryCustodianteRecIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteRecSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMotBloqRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SIGLAMOT' +
        'BLOQ, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DESCMOTBL' +
        'OQ'
      'FROM MOTIVOBLOQUEIO')
    ValidateWithMask = True
    Left = 549
    Top = 364
    object qryMotBloqRecIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryMotBloqRecSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryMotBloqRecDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
  end
  object qryTipoOperRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.FLGAGE, T.FLGDATAEX, T.FLGDATACOM, T.FLGPRZBOLSA, T.FLG' +
        'PRZEMP, T.FLGATADEC,'
      
        '       T.FLGFORMAPAGREC, T.FLGDIVACAO, T.FLGINIPAG, T.FLGJUROS, ' +
        'T.FLGPARIDADE,'
      
        '       T.FLGINVORIGEM, T.FLGPERC, T.DESCTIPOOPERACAO, T.IDTIPOOP' +
        'ERACAO, T.IDTIPOINVEST,'
      
        '       T.FLGGRAVAIRLITIGIO, T.FLGISENTOIR, T.NATUREZAOPERACAO, T' +
        '.IDMERCADO, T.FLGTRATAIR,'
      
        '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO, T.FLGGERACONTAB, T.F' +
        'LGGERACAPCAR, FLGCONTAINVEST'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      
        'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRDIV) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRDIV+10000))'
      
        '   OR ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRJUR+10000))'
      
        '   OR ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRMUL) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRMUL+10000))'
      '  AND (T.IDTIPOINVEST = 2) '
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 365
    object qryTipoOperRecFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperRecIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryTipoOperRecIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object qryTipoOperRecFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object qryTipoOperRecFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperRecRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperRecVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object qryTipoOperRecFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperRecFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryTipoOperRecFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
  end
  object qryHistCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, '
      '       DATAHISTCAIXA, VLRHISTCAIXA, SLDHISTCAIXA, '
      
        '       IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDO' +
        'PERACAODIREITO, '
      '       DESCINVESTIMENTO, TIPMOVCAIXA'
      'FROM HISTCAIXA'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO')
    UpdateObject = updHistCaixa
    ValidateWithMask = True
    Left = 689
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryHistCaixaIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.IDHISTCAIXA'
    end
    object qryHistCaixaIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAXEVENTO'
    end
    object qryHistCaixaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTCAIXA.IDPLANPREVCTBPATR'
    end
    object qryHistCaixaDATAHISTCAIXA: TDateTimeField
      FieldName = 'DATAHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.DATAHISTCAIXA'
    end
    object qryHistCaixaVLRHISTCAIXA: TFloatField
      FieldName = 'VLRHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.VLRHISTCAIXA'
    end
    object qryHistCaixaSLDHISTCAIXA: TFloatField
      FieldName = 'SLDHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.SLDHISTCAIXA'
    end
    object qryHistCaixaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.HISTCAIXA.IDOPERACAOINVEST'
    end
    object qryHistCaixaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAINVEST'
    end
    object qryHistCaixaIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAGERENC'
    end
    object qryHistCaixaIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'BASEDADOS.HISTCAIXA.IDOPERACAODIREITO'
    end
    object qryHistCaixaDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.HISTCAIXA.DESCINVESTIMENTO'
      Size = 40
    end
    object qryHistCaixaTIPMOVCAIXA: TStringField
      FieldName = 'TIPMOVCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.TIPMOVCAIXA'
      Size = 3
    end
  end
  object updHistCaixa: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCAIXA'
      'set'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAHISTCAIXA = :DATAHISTCAIXA,'
      '  VLRHISTCAIXA = :VLRHISTCAIXA,'
      '  SLDHISTCAIXA = :SLDHISTCAIXA,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  DESCINVESTIMENTO = :DESCINVESTIMENTO,'
      '  TIPMOVCAIXA = :TIPMOVCAIXA'
      'where'
      '  IDHISTCAIXA = :OLD_IDHISTCAIXA')
    InsertSQL.Strings = (
      'insert into HISTCAIXA'
      
        '  (IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCA' +
        'IXA, VLRHISTCAIXA, '
      
        '   SLDHISTCAIXA, IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAG' +
        'ERENC, '
      '   IDOPERACAODIREITO, DESCINVESTIMENTO, TIPMOVCAIXA)'
      'values'
      
        '  (:IDHISTCAIXA, :IDCARTEIRAXEVENTO, :IDPLANPREVCTBPATR, :DATAHI' +
        'STCAIXA, '
      
        '   :VLRHISTCAIXA, :SLDHISTCAIXA, :IDOPERACAOINVEST, :IDCARTEIRAI' +
        'NVEST, '
      
        '   :IDCARTEIRAGERENC, :IDOPERACAODIREITO, :DESCINVESTIMENTO, :TI' +
        'PMOVCAIXA)')
    DeleteSQL.Strings = (
      'delete from HISTCAIXA'
      'where'
      '  IDHISTCAIXA = :OLD_IDHISTCAIXA')
    Left = 707
    Top = 4
  end
  object popMnuRel: TPopupMenu
    Left = 280
    object mnuAnuRec: TMenuItem
      Caption = 'Anúncios a &Receber'
      OnClick = mnuAnuRecClick
    end
    object mnuExeDir: TMenuItem
      Caption = '&Exercícios de Direito'
      OnClick = mnuExeDirClick
    end
  end
  object qryCancelamento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RREMUNERACAO,'
      '       OI.VLRIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL,'
      
        '       DECODE(OI.FLGSTATUSORDMOV, '#39'V'#39', '#39'POR VENDA'#39', '#39'NORMAL'#39') AS' +
        ' TIPOCANCELAMENTO'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATACOM,'#39'DD/MM/YYYY'#39'))' +
        '))'
      '      ) CI,'
      '      ('
      '      SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST'
      '       FROM OPERACAOINVEST OI1'
      '      WHERE OI1.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '        AND OI1.IDTIPOOPERACAO in (-170, -10170)'
      
        '      GROUP BY OI1.IDPLANPREVCTBPATR, OI1.IDCARTEIRAINVEST) OIMA' +
        'X'
      ''
      'WHERE'
      '      OI.IDOPERACAOINVEST  = OIMAX.IDOPERACAOINVEST'
      '  AND OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST      = 2'
      '  AND OI.IDTIPOOPERACAO    in (-170, -10170)'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND OI.FLGSTATUSORDMOV   <> '#39'V'#39
      '  AND OI.QTDEOPERACAO      > 0  '
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
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
    UpdateObject = updCancelamento
    ValidateWithMask = True
    Left = 675
    Top = 218
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object qryCancelamentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCancelamentoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryCancelamentoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryCancelamentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryCancelamentoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryCancelamentoSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object qryCancelamentoSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryCancelamentoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryCancelamentoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 10
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object qryCancelamentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCancelamentoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCancelamentoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCancelamentoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCancelamentoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryCancelamentoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCancelamentoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCancelamentoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryCancelamentoTIPOCANCELAMENTO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'TIPOCANCELAMENTO'
      Visible = False
      Size = 9
    end
    object qryCancelamentoIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object qryCancelamentoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryCancelamentoIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryCancelamentoORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object qryCancelamentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryCancelamentoIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCancelamentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryCancelamentoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryCancelamentoNUMDOCUMENTO_1: TStringField
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object qryCancelamentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryCancelamentoIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object qryCancelamentoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object qryCancelamentoFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryCancelamentoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryCancelamentoIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCancelamentoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryCancelamentoIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object qryCancelamentoIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object qryCancelamentoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object qryCancelamentoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryCancelamentoALTERADO: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCancelamentoIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object qryCancelamentoCARTGERENCIAL: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
  object updCancelamento: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO, '
      'IDOPERACAOORIGEM)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO, :IDOPERACAOORIGEM)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 703
    Top = 218
  end
  object dsCancelamento: TwwDataSource
    AutoEdit = False
    DataSet = qryCancelamento
    OnStateChange = dsDetStateChange
    Left = 731
    Top = 218
  end
  object qryCarteiraCan: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '   DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA,'
      '   CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '   CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, CI.IDME' +
        'RCADO'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39')))) ')
    ValidateWithMask = True
    Left = 277
    Top = 420
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptResult
      end>
    object qryCarteiraCanIDCARTEIRA: TStringField
      FieldName = 'IDCARTEIRA'
      Size = 4
    end
    object qryCarteiraCanIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryCarteiraCanIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryCarteiraCanDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryTipoOperCan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOOPERACAO IN (-170, -10170)'
      '  AND IDTIPOINVEST = 2'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 421
    object qryTipoOperCanIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryTipoOperCanIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTipoOperCanIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object qryTipoOperCanCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryTipoOperCanDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperCanNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryTipoOperCanFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object qryTipoOperCanFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
    end
    object qryTipoOperCanRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object qryTipoOperCanFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
    end
    object qryTipoOperCanFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTipoOperCanTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTipoOperCanFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryTipoOperCanFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
    end
    object qryTipoOperCanMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
    end
    object qryTipoOperCanTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object qryTipoOperCanFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryTipoOperCanSTAATIVO: TStringField
      FieldName = 'STAATIVO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGRENTABILIDADE: TStringField
      FieldName = 'FLGRENTABILIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
    object qryTipoOperCanFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGCOTARECDES: TStringField
      FieldName = 'FLGCOTARECDES'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperCanFLGDATAVENCIMENTO: TStringField
      FieldName = 'FLGDATAVENCIMENTO'
      FixedChar = True
      Size = 1
    end
  end
  object qryCustodianteCan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCUSTODIANTE,'
      '  SGLCUSTODIANTE'
      'FROM'
      '  CUSTODIANTE'
      'ORDER BY'
      '  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 457
    Top = 420
    object qryCustodianteCanIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
    end
    object qryCustodianteCanSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
  end
  object qryMotBloqCan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SIGLAMOT' +
        'BLOQ, '
      
        '       DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DESCMOTBL' +
        'OQ'
      'FROM MOTIVOBLOQUEIO')
    ValidateWithMask = True
    Left = 549
    Top = 420
    object qryMotBloqCanIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryMotBloqCanSIGLAMOTBLOQ: TStringField
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object qryMotBloqCanDESCMOTBLOQ: TStringField
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
  end
  object cdsSelBoleta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 689
    Top = 376
  end
  object dspSelBoleta: TDataSetProvider
    Constraints = True
    Left = 690
    Top = 427
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 623
    Top = 102
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanPrevCtbPatrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanPrevCtbPatrIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object qryPlanPrevProv: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ' ')
    ValidateWithMask = True
    Left = 207
    Top = 318
    object qryPlanPrevProvPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevProvIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanPrevProvIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanPrevProvIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object qryPlanPrevRec: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 207
    Top = 372
    object qryPlanPrevRecPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevRecIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanPrevRecIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanPrevRecIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object qryPlanPrevCan: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 207
    Top = 420
    object qryPlanPrevCanPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCanIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanPrevCanIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanPrevCanIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object UpdCancelamentoVenda: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  VLRIR = :VLRIR,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  ORIGDEST = :ORIGDEST,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  IDFORCLI = :IDFORCLI,'
      '  IDLOTE = :IDLOTE,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (NUMDOCUMENTO, QTDEOPERACAO, VLROPERACAO, VLRIRREMUNER, '
      'VLRIR, IDOPERACAOINVEST, '
      '   MOECODIGO, IDMODULO, ORIGDEST, EMPRESAPROP, IDINVESTIMENTO, '
      'IDCARTEIRAINVEST, '
      
        '   IDTIPOINVEST, IDTIPOOPERACAO, DATAOPERACAO, PRECOUNITOPERACAO' +
        ', '
      'DATAVENCOPER, '
      '   IDFORCLI, IDLOTE, IDCUSTODIANTE, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, '
      '   IDOPERACAODIREITO, VLRREMUNERACAO, PERCENTUAL, '
      'IDCARTEIRAGERENC, IDPLANPREVCTBPATR, '
      '   IDOPERCUSTODIA, IDCUSTORIG, IDMOTIVOBLOQUEIO, '
      'IDOPERACAOORIGEM)'
      'values'
      '  (:NUMDOCUMENTO, :QTDEOPERACAO, :VLROPERACAO, :VLRIRREMUNER, '
      ':VLRIR, :IDOPERACAOINVEST, '
      
        '   :MOECODIGO, :IDMODULO, :ORIGDEST, :EMPRESAPROP, :IDINVESTIMEN' +
        'TO, '
      ':IDCARTEIRAINVEST, '
      '   :IDTIPOINVEST, :IDTIPOOPERACAO, :DATAOPERACAO, '
      ':PRECOUNITOPERACAO, :DATAVENCOPER, '
      '   :IDFORCLI, :IDLOTE, :IDCUSTODIANTE, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDOPERACAODIREITO, :VLRREMUNERACAO, :PERCENTUAL, '
      ':IDCARTEIRAGERENC, '
      '   :IDPLANPREVCTBPATR, :IDOPERCUSTODIA, :IDCUSTORIG, '
      ':IDMOTIVOBLOQUEIO, :IDOPERACAOORIGEM)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 703
    Top = 168
  end
  object DsCancelamentoVenda: TwwDataSource
    AutoEdit = False
    DataSet = QryCancelamentoVenda
    Left = 731
    Top = 168
  end
  object QryCancelamentoVenda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, (TP.DESCTIPOOPERACA' +
        'O||'#39' - POR VENDA'#39') AS DESCTIPOOPERACAO,'
      '       PP.PLANPRVCONTABPATRO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RREMUNERACAO,'
      '       OI.VLRIRREMUNER, OI.VLRIR,'
      
        '       (OI.VLROPERACAO + OI.VLRREMUNERACAO - OI.VLRIR - OI.VLRIR' +
        'REMUNER) AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        'OI.IDOPERACAOORIGEM,'
      
        '       '#39'N'#39' AS ALTERADO, DECODE(NVL(OI.IDCARTEIRAGERENC,0), 0, '#39'N' +
        #39', '#39'S'#39') AS CARTGERENCIAL,'
      
        '       DECODE(OI.FLGSTATUSORDMOV, '#39'V'#39', '#39'POR VENDA'#39', '#39'NORMAL'#39') AS' +
        ' TIPOCANCELAMENTO'
      ''
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, ' +
        'PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '     (SELECT IDMOTIVOBLOQUEIO,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', SIGLAMOTBLOQ) AS SI' +
        'GLAMOTBLOQ,'
      
        '             DECODE(IDMOTIVOBLOQUEIO, -1,'#39#39', DESCMOTBLOQ) AS DES' +
        'CMOTBLOQ'
      '      FROM MOTIVOBLOQUEIO) MB,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST, IDTIPOINVEST, IDMERCADO'
      '      FROM CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA,'
      '         CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGERENC,'
      
        '         CG.DESCCARTGERENC AS DESCCARTINVEST, CI.IDTIPOINVEST, C' +
        'I.IDMERCADO'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') or'
      
        '              (((PI.FLGCARTGERENC = '#39'N'#39') or (PI.FLGCARTGERENC IS' +
        ' NULL)) and  (PI.DATAMOVCDBLIB > TO_DATE(:DATACOM,'#39'DD/MM/YYYY'#39'))' +
        '))'
      '      ) CI,'
      '      ('
      '      SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST'
      '       FROM OPERACAOINVEST OI1'
      '      WHERE OI1.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '        AND OI1.IDTIPOOPERACAO in (-170, -10170)'
      
        '      GROUP BY OI1.IDPLANPREVCTBPATR, OI1.IDCARTEIRAINVEST, OI1.' +
        'DATAOPERACAO) OIMAX'
      ''
      'WHERE'
      '      OI.IDOPERACAOINVEST  = OIMAX.IDOPERACAOINVEST'
      '  AND OD.IDOPERACAODIREITO = OI.IDOPERACAODIREITO'
      '  AND TP.IDTIPOINVEST      = 2'
      '  AND OI.IDTIPOOPERACAO    in (-170, -10170)'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      '  AND OI.FLGSTATUSORDMOV   = '#39'V'#39
      'ORDER BY CARTGERENCIAL, OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      ''
      ''
      ' ')
    UpdateObject = UpdCancelamentoVenda
    ValidateWithMask = True
    Left = 667
    Top = 170
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 21
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField5: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object StringField6: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 15
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object StringField7: TStringField
      DisplayLabel = 'Bloqueio'
      DisplayWidth = 7
      FieldName = 'SIGLAMOTBLOQ'
      Size = 3
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 10
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,##0.00000000'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField6: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object FloatField7: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object StringField8: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'TIPOCANCELAMENTO'
      Visible = False
      Size = 9
    end
    object FloatField8: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object FloatField9: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object FloatField10: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object StringField9: TStringField
      FieldName = 'ORIGDEST'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField11: TFloatField
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object FloatField12: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object FloatField13: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField14: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object FloatField15: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object StringField10: TStringField
      FieldName = 'NUMDOCUMENTO_1'
      Visible = False
      Size = 30
    end
    object FloatField16: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object StringField11: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object FloatField17: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object StringField12: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField18: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object FloatField19: TFloatField
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object FloatField20: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object FloatField21: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object FloatField22: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Visible = False
    end
    object FloatField23: TFloatField
      FieldName = 'IDCUSTORIG'
      Visible = False
    end
    object FloatField24: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
    object StringField14: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField15: TStringField
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object StringField16: TStringField
      FieldName = 'ALTERADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField25: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
    object StringField17: TStringField
      FieldName = 'CARTGERENCIAL'
      Visible = False
      Size = 1
    end
  end
end
