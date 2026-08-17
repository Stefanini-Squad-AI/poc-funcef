inherited frmCadAnuncioSubscricao: TfrmCadAnuncioSubscricao
  Left = 339
  Top = 148
  HelpContext = 790290
  Caption = 'Operação'
  ClientHeight = 465
  ClientWidth = 760
  WindowState = wsMaximized
  PixelsPerInch = 96 
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 379
    inherited Bevel1: TBevel
      Width = 758
    end
    inherited pnlMestre: TPanel
      Width = 758
      Height = 130
      object Label3: TLabel
        Left = 16
        Top = 38
        Width = 49
        Height = 13
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 16
        Top = 75
        Width = 57
        Height = 13
        Caption = 'Data AGE'
      end
      object Label5: TLabel
        Left = 117
        Top = 75
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object Label16: TLabel
        Left = 217
        Top = 75
        Width = 54
        Height = 13
        Caption = 'Data  Ex '
      end
      object Label6: TLabel
        Left = 320
        Top = 75
        Width = 78
        Height = 13
        Caption = 'Data Prevista'
      end
      object Label13: TLabel
        Left = 422
        Top = 38
        Width = 22
        Height = 13
        Caption = 'PU '
      end
      object Label14: TLabel
        Left = 421
        Top = 75
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dbtDescOperResgFundos: TDBText
        Left = 426
        Top = 14
        Width = 287
        Height = 17
        DataField = 'DESCTIPOOPERACAORESG'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 16
        Top = 1
        Width = 85
        Height = 13
        Caption = 'Tipo Operação'
      end
      object Label38: TLabel
        Left = 605
        Top = 38
        Width = 62
        Height = 13
        Caption = 'Percentual'
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 16
        Top = 52
        Width = 401
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
        Left = 16
        Top = 89
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
        TabOrder = 4
      end
      object dbdEX: TCMDateTimePicker
        Left = 117
        Top = 89
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
        TabOrder = 5
      end
      object dbdOper: TCMDateTimePicker
        Left = 217
        Top = 89
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
        TabOrder = 6
      end
      object dbdCOM: TCMDateTimePicker
        Left = 319
        Top = 89
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
        TabOrder = 7
      end
      object dbeDivPorAcao: TDBRealEdit
        Left = 422
        Top = 52
        Width = 176
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,000000000000000')
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
        Left = 421
        Top = 89
        Width = 332
        Height = 42
        DataField = 'OBSERVACAO'
        DataSource = ds
        TabOrder = 8
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 16
        Top = 15
        Width = 400
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
        Left = 16
        Top = 115
        Width = 113
        Height = 13
        Caption = 'Isento de IR ?'
        DataField = 'ISENCAOIR'
        DataSource = ds
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcIsentoIrClick
      end
      object dbcIRLitigio: TDBCheckBox
        Left = 217
        Top = 115
        Width = 121
        Height = 13
        Caption = 'Gera IR Litígio ?'
        DataField = 'IRLITIGIO'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
        OnClick = dbcIRLitigioClick
      end
      object dbePercentual: TDBRealEdit
        Left = 605
        Top = 52
        Width = 122
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,0000000000')
        TabOrder = 3
        WordWrap = False
        IntDigits = 14
        DecDigits = 10
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCENTUAL'
        DataSource = ds
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 174
      Width = 758
      Height = 204
      Tabs.Strings = (
        'Investimentos'
        'Anúncio'
        'Subscrição')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgProvisao'
        'dbgRecebimento')
      inherited pgctrlDetalhe: TPageControl
        Width = 660
        Height = 145
        ActivePage = tbsRecebimento
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 652
            Height = 117
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'110'#9'Investimento'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 652
            Height = 117
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
        end
        object tbsProvisao: TTabSheet
          Caption = 'Anúncio'
          ImageIndex = 1
          object dbgProvisao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 117
            Selected.Strings = (
              'NUMDOCUMENTO'#9'12'#9'Boleta'#9'F'
              'DESCCARTINVEST'#9'40'#9'Carteira'#9'F'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'#9'F'
              'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operação'#9'F'
              'DESCINVESTIMENTO'#9'21'#9'Investimento'#9'F'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'#9'F'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'#9'F'
              'QTDEOPERACAO'#9'20'#9'Quantidade'#9'F'
              'PRECOUNITOPERACAO'#9'20'#9'Preço Unitário'#9'F'
              'VLROPERACAO'#9'18'#9'Valor'#9'F'
              'VLRREMUNERACAO'#9'15'#9'Remuneração'#9'F'
              'VLRIRREMUNER'#9'15'#9'IR s/ Remuneração'#9'F'
              'VLRIR'#9'15'#9'I.R.'#9'F'
              'VLRLIQUIDO'#9'18'#9'Valor Líquido'#9'F'
              'DATABASE'#9'10'#9'Data Base'#9'F'
              'DATAOPERACAO'#9'10'#9'Operação'#9'F'
              'DATAVENCOPER'#9'10'#9'Vencimento'#9'F')
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
            IndicatorColor = icBlack
          end
          object pnlDetProvisao: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 117
            Align = alClient
            TabOrder = 1
            object Label1: TLabel
              Left = 6
              Top = 43
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label2: TLabel
              Left = 6
              Top = 82
              Width = 98
              Height = 13
              Caption = 'Quantidade Base'
            end
            object Label7: TLabel
              Left = 138
              Top = 82
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label11: TLabel
              Left = 278
              Top = 43
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label9: TLabel
              Left = 394
              Top = 82
              Width = 65
              Height = 13
              Caption = 'Valor do IR'
            end
            object Label8: TLabel
              Left = 278
              Top = 82
              Width = 79
              Height = 13
              Caption = 'Remuneração'
            end
            object Label10: TLabel
              Left = 497
              Top = 82
              Width = 77
              Height = 13
              Caption = 'Valor Líquido'
            end
            object Label12: TLabel
              Left = 437
              Top = 43
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label39: TLabel
              Left = 6
              Top = 4
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaProv
            end
            object Label17: TLabel
              Left = 138
              Top = 4
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object dblCarteiraProvisao: TwwDBLookupCombo
              Left = 6
              Top = 58
              Width = 268
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
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraProvisaoExit
            end
            object dbrQtdProv: TDBRealEdit
              Left = 6
              Top = 96
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0')
              TabOrder = 5
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
              Left = 138
              Top = 96
              Width = 134
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsProvisao
            end
            object dblCustodianteProv: TwwDBLookupCombo
              Left = 278
              Top = 58
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
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrVlrIRProv: TDBRealEdit
              Left = 394
              Top = 96
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
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
              Left = 278
              Top = 96
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRREMUNERACAO'
              DataSource = dsProvisao
            end
            object dbrVlrLiqProv: TDBRealEdit
              Left = 497
              Top = 96
              Width = 127
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
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
              Top = 19
              Width = 127
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsProvisao
              Enabled = False
              TabOrder = 0
            end
            object dblMotivoBloqueioProv: TwwDBLookupCombo
              Left = 437
              Top = 58
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
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblTipoOperProv: TwwDBLookupCombo
              Left = 138
              Top = 19
              Width = 295
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
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object tbsRecebimento: TTabSheet
          Caption = 'Subscrição'
          ImageIndex = 2
          object dbgRecebimento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 117
            Selected.Strings = (
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DATAOPERACAO'#9'10'#9'Operação'
              'DESCCARTINVEST'#9'35'#9'Carteira'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'DESCTIPOOPERACAO'#9'25'#9'Tipo de Operação'
              'DESCINVESTIMENTO'#9'25'#9'Investimento'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'QTDEOPERACAO'#9'18'#9'Quantidade'
              'PRECOUNITOPERACAO'#9'16'#9'Preço Unitário'
              'VLROPERACAO'#9'18'#9'Valor Exercido')
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
            IndicatorColor = icBlack
          end
          object pnlDetRecebimento: TPanel
            Left = 0
            Top = 0
            Width = 652
            Height = 117
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label20: TLabel
              Left = 6
              Top = 4
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label19: TLabel
              Left = 230
              Top = 43
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label21: TLabel
              Left = 517
              Top = 43
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label22: TLabel
              Left = 6
              Top = 80
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label23: TLabel
              Left = 230
              Top = 81
              Width = 70
              Height = 13
              Caption = 'Quantidade '
            end
            object Label24: TLabel
              Left = 517
              Top = 81
              Width = 83
              Height = 13
              Caption = 'Valor Exercido'
            end
            object Label29: TLabel
              Left = 385
              Top = 4
              Width = 87
              Height = 13
              Caption = 'Data Operação'
            end
            object Label25: TLabel
              Left = 6
              Top = 43
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object Label15: TLabel
              Left = 373
              Top = 81
              Width = 18
              Height = 13
              Caption = 'PU'
            end
            object Label26: TLabel
              Left = 514
              Top = 5
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaRec
            end
            object dblCarteiraRec: TwwDBLookupCombo
              Left = 230
              Top = 57
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRA'
              DataSource = dsRecebimento
              LookupTable = qryCarteiraRec
              LookupField = 'IDCARTEIRA'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraRecExit
            end
            object dblTipoOperRec: TwwDBLookupCombo
              Left = 6
              Top = 19
              Width = 375
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
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblCustodianteRec: TwwDBLookupCombo
              Left = 515
              Top = 57
              Width = 135
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
              Left = 6
              Top = 95
              Width = 221
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
              Left = 230
              Top = 95
              Width = 138
              Height = 21
              Alignment = taRightJustify
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
              Left = 517
              Top = 95
              Width = 133
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 9
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsRecebimento
            end
            object dbdDataOperacaoRec: TCMDateTimePicker
              Left = 385
              Top = 19
              Width = 126
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
            object dblInvestimentoRec: TwwDBLookupCombo
              Left = 6
              Top = 57
              Width = 222
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
              DataField = 'IDINVESTIMENTO'
              DataSource = dsRecebimento
              LookupTable = qryInvestimentoAcaoRec
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              Enabled = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbrPU: TDBRealEdit
              Left = 373
              Top = 95
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000000000')
              TabOrder = 8
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 10
              DecDigits = 15
              NumberFormat = fNumber
              Signal = False
              DataField = 'PRECOUNITOPERACAO'
              DataSource = dsRecebimento
            end
            object dbeBoletaRec: TDBEdit
              Left = 515
              Top = 19
              Width = 114
              Height = 21
              TabStop = False
              DataField = 'NUMDOCUMENTO'
              DataSource = dsRecebimento
              Enabled = False
              TabOrder = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 750
        object lblVlrGerenc: TfcLabel [0]
          Left = 422
          Top = 5
          Width = 84
          Height = 18
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
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
          Height = 23
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
          Left = 212
          Top = 5
          Width = 84
          Height = 18
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblVlrDif: TfcLabel [3]
          Left = 649
          Top = 5
          Width = 84
          Height = 18
          Align = alLeft
          Caption = '1.000.000,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
          Visible = False
        end
        object lblCapGerenc: TfcLabel [4]
          Left = 349
          Top = 3
          Width = 73
          Height = 23
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
          Left = 589
          Top = 7
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
            Top = 0
            Width = 25
            Height = 25
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
        Left = 664
        Height = 145
      end
    end
    inherited pnlTitulo: TPanel
      Width = 758
      inherited lbNomItem: TfcLabel
        Width = 496
        Caption = 'Recebimento de Subscrição por Anúncio de AGE'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 760
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 588
      DockPos = 605
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 419
      DockPos = 436
    end
    inherited fraMens: TfraMensagem
      Width = 412
      inherited pnlProgresso: TPanel
        Width = 412
        inherited pnlProgressoMensagem: TPanel
          Width = 346
          inherited lblProgressoMensagem: TfcLabel
            Width = 344
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 347
          Width = 64
          inherited pgbProcesso: TProgressBar
            Width = 62
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
  inherited dsDet: TwwDataSource
    Left = 464
    Top = 210
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 330
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
    Left = 355
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
    UsaDistinct = True
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 300
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
      
        '       OPD.STATUS, OPD.PLANO, OPD.PLNCODIGO, OPD.CODDOCUMENTO, O' +
        'PD.QTDEACOESDIRPROV, OPD.IDPEDIDOFUNDO,'
      
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
      ' ')
    Left = 383
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
    Left = 436
    Top = 210
  end
  inherited qryDetalhe: TwwQuery
    AfterPost = qryDetalheAfterPost
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
    Left = 408
    Top = 210
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 110
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
        ', TP.FLGCONTAINVEST,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RIRREMUNER,'
      
        '       OI.VLRIR,  (OI.VLROPERACAO - OI.VLRIR + OI.VLRIRREMUNER) ' +
        'AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      
        '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.VLRREMUNERAC' +
        'AO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        '0 AS QTDEEXERCIDA,'
      '       '#39'N'#39' AS ALTERADO, PP.PLANPRVCONTABPATRO '
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
      ''
      '     OPERACAODIREITO OD, TIPOOPERACAO TP,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      '      FROM  CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIR' +
        'AGERENC, CG.DESCCARTGERENC AS DESCCARTINVEST'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '              ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMO' +
        'VCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39'))))) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OI.IDTIPOOPERACAO    in (-70, -10070)'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY OI.DATAOPERACAO, OI.IDOPERACAOINVEST')
    UpdateObject = updProvisao
    ValidateWithMask = True
    Left = 504
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
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptInput
      end>
    object qryProvisaoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryProvisaoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryProvisaoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
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
      DisplayFormat = '#,##0.00#######'
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
    object qryProvisaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Visible = False
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
    Left = 532
    Top = 210
  end
  object dsProvisao: TwwDataSource
    AutoEdit = False
    DataSet = qryProvisao
    OnStateChange = dsProvisaoStateChange
    Left = 560
    Top = 210
  end
  object qryRecebimento: TwwQuery
    CachedUpdates = True
    AfterScroll = qryRecebimentoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, OI.NUMDOCUMENTO, IV.DESCINVESTIMEN' +
        'TO,'
      '       TP.DESCTIPOOPERACAO, TP.RECPAG, TP.NATUREZAOPERACAO,'
      
        '       CI.DESCCARTINVEST, OI.QTDEOPERACAO, OI.VLROPERACAO, OI.VL' +
        'RIRREMUNER,'
      
        '       OI.VLRIR,  (OI.VLROPERACAO - OI.VLRIR + OI.VLRIRREMUNER) ' +
        'AS VLRLIQUIDO,'
      
        '       CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ, OD.DATAEX AS DATABASE' +
        ','
      
        '       OI.IDOPERACAOINVEST, OI.MOECODIGO, OI.IDMODULO, OI.ORIGDE' +
        'ST, OI.EMPRESAPROP,'
      
        '       OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI.IDTIPOINVEST, ' +
        'OI.IDTIPOOPERACAO,'
      '       OI.DATAOPERACAO, OI.NUMDOCUMENTO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      
        '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.VLRREMUNERAC' +
        'AO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      '       OI.IDMOTIVOBLOQUEIO, CI.IDCARTEIRA, OI.IDOPERACAOORIGEM,'
      '       '#39'N'#39' AS ALTERADO'
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
      ''
      '     OPERACAODIREITO OD, TIPOOPERACAO TP, PARAMINVEST PI,'
      ''
      
        '     (SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA,' +
        ' IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      '      FROM  CARTEIRAINVEST'
      '      WHERE IDTIPOINVEST = 2'
      '      UNION'
      
        '      SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEI' +
        'RAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIR' +
        'AGERENC, CG.DESCCARTGERENC AS DESCCARTINVEST'
      '      FROM'
      '        CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '      WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '         AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '              ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMO' +
        'VCDBLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39'))))) CI'
      ''
      'WHERE OI.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND OD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      '  AND ((OI.IDTIPOOPERACAO  = PI.IDTIPOOPERDIRSUB)'
      '   OR  (OI.IDTIPOOPERACAO  = PI.IDTIPOOPERDIRSUB+10000))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)  '
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY OI.DATAOPERACAO, OI.IDOPERACAOINVEST')
    UpdateObject = updRecebimento
    ValidateWithMask = True
    Left = 600
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
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryRecebimentoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryRecebimentoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 35
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRecebimentoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRecebimentoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 25
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRecebimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 25
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
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
      DisplayWidth = 18
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0'
    end
    object qryRecebimentoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 16
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryRecebimentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor Exercido'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoPERCENTUAL: TFloatField
      DisplayWidth = 11
      FieldName = 'PERCENTUAL'
      Visible = False
    end
    object qryRecebimentoVLRREMUNERACAO: TFloatField
      DisplayLabel = 'Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRREMUNERACAO'
      Visible = False
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryRecebimentoVLRIRREMUNER: TFloatField
      DisplayLabel = 'IR s/ Remuneração'
      DisplayWidth = 15
      FieldName = 'VLRIRREMUNER'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRIR: TFloatField
      DisplayLabel = 'I.R.'
      DisplayWidth = 15
      FieldName = 'VLRIR'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoVLRLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 18
      FieldName = 'VLRLIQUIDO'
      Visible = False
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryRecebimentoDATABASE: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 10
      FieldName = 'DATABASE'
      Visible = False
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
      Visible = False
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
    object qryRecebimentoRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
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
    Left = 628
    Top = 210
  end
  object dsRecebimento: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebimento
    OnStateChange = dsDetStateChange
    Left = 656
    Top = 210
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
    Left = 161
    Top = 291
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
      
        'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRDIV) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRDIV+10000))'
      
        '   OR ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRJUR) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRJUR+10000))'
      
        '   OR ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRMUL) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRMUL+10000))'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 96
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
      '  AND HC.IDPLANPREVCTBPATR  = PP.IDPLANPREVCTBPATR(+)  '
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
      
        '       PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, CA.DESCCARTGE' +
        'RENC AS DESCCARTINVEST, '#39#39' AS SLGCUSTODIANTE,'
      '       '#39#39' AS SIGLAMOTBLOQ,  HI.IDLOTE,'
      
        '       SYSDATE AS DATAREFERENCIA, NVL(HI.SALDOQTDEINVCART,0) AS ' +
        'QTDE,'
      
        '       0 AS QTDEDIREITO, 0 AS VALOREXERCICIO, 0 AS VLRREMUNERACA' +
        'O, 0 AS IR,'
      
        '       0 AS VLRLIQ, 0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0' +
        ' AS VLRCUSTO,'
      
        '       HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVESTIMEN' +
        'TO, NULL AS IDCUSTODIANTE, HI.IDPLANPREVCTBPATR,'
      
        '       LPAD(HI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(HI.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA,'
      
        '       NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.QTDTITL' +
        'OTE,'
      '       DECODE(:FORCLI, '#39'CT'#39', '#39#39', TO_CHAR(IDEMISSOR)) AS ORDEM'
      '       '
      'FROM'
      '   HISTCARTINV HI, INVESTIMENTO IV,'
      ''
      
        '  (SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAG' +
        'ERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST,'
      '               CG.IDCARTEIRAGERENC, CG.DESCCARTGERENC'
      '   FROM'
      '     CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '   WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '      AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '           ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCD' +
        'BLIB > TO_DATE(:DATAEX,'#39'DD/MM/YYYY'#39'))))) CA,'
      ''
      
        '   (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO, PA' +
        '.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '   (SELECT IDINVESTIMENTO, QTDTITLOTE'
      '    FROM COTACAOINVEST'
      '    WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      '      AND DATACOTACAO    = (SELECT MAX(DATACOTACAO)'
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
      ''
      ''
      ''
      ' '
      ' ')
    UpdateObject = UpdOrigemDivJur
    ValidateWithMask = True
    Left = 426
    Top = 1
    ParamData = <
      item
        DataType = ftString
        Name = 'FORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FORCLI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDINVESTIMENTO'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAEX'
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
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
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
    Left = 444
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
      
        '                   WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO)' +
        ' AND'
      '      TIPMOVBOLETA = '#39'DTS'#39'             '
      ''
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
      '  (IDBOLETA, STATUS, DATABOLETA, TIPMOVBOLETA, IDFORCLI, PLANO, '
        'PLNCODIGO, '
      '   CODDOCUMENTO)'
      'values'
      
        '  (:IDBOLETA, :STATUS, :DATABOLETA, :TIPMOVBOLETA, :IDFORCLI, :P' +
        'LANO, '
      ':PLNCODIGO, '
      '   :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from BOLETA'
      'where'
      '  IDBOLETA = :OLD_IDBOLETA')
    Left = 547
    Top = 1
  end
  object qryCarteiraProv: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      'FROM  CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGEREN' +
        'C, CG.DESCCARTGERENC AS DESCCARTINVEST'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 165
    Top = 340
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptInput
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
    Left = 265
    Top = 340
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
    Left = 373
    Top = 340
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
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 265
    Top = 292
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
    Left = 632
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
    Left = 701
    Top = 114
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
      
        '       VLRHISTPROVISAO, SLDHISTPROVISAO, DATAORIGEM, DATAHISTPRO' +
        'VISAO'
      'FROM HISTPROVISAO'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO'
      ' '
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
    object qryHistProvDATAHISTPROVISAO: TDateTimeField
      FieldName = 'DATAHISTPROVISAO'
      Origin = 'BASEDADOS.HISTPROVISAO.DATAHISTPROVISAO'
    end
  end
  object updHistProvProv: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTPROVISAO'
      'set'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  VLRHISTPROVISAO = :VLRHISTPROVISAO,'
      '  SLDHISTPROVISAO = :SLDHISTPROVISAO,'
      '  DATAORIGEM = :DATAORIGEM,'
      '  DATAHISTPROVISAO = :DATAHISTPROVISAO'
      'where'
      '  IDHISTPROVISAO = :OLD_IDHISTPROVISAO')
    InsertSQL.Strings = (
      'insert into HISTPROVISAO'
      
        '  (IDOPERACAODIREITO, IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDOPER' +
        'ACAOINVEST, '
      
        '   IDCARTEIRAXEVENTO, VLRHISTPROVISAO, SLDHISTPROVISAO, DATAORIG' +
        'EM, DATAHISTPROVISAO)'
      'values'
      
        '  (:IDOPERACAODIREITO, :IDCARTEIRAINVEST, :IDCARTEIRAGERENC, :ID' +
        'OPERACAOINVEST, '
      
        '   :IDCARTEIRAXEVENTO, :VLRHISTPROVISAO, :SLDHISTPROVISAO, :DATA' +
        'ORIGEM, '
      '   :DATAHISTPROVISAO)')
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
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39') || NULL AS IDCARTEIRA, IDCAR' +
        'TEIRAINVEST, NULL AS IDCARTEIRAGERENC, DESCCARTINVEST'
      'FROM  CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'UNION'
      
        'SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTEIRAGERE' +
        'NC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST, CG.IDCARTEIRAGEREN' +
        'C, CG.DESCCARTGERENC AS DESCCARTINVEST'
      'FROM'
      '  CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '   AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      
        '        ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND (PI.DATAMOVCDBLI' +
        'B > TO_DATE(:DATALIMGER,'#39'DD/MM/YYYY'#39'))))'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 469
    Top = 290
    ParamData = <
      item
        DataType = ftString
        Name = 'DATALIMGER'
        ParamType = ptInput
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
    Left = 473
    Top = 338
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
    Left = 565
    Top = 290
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
      '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO, T.FLGCONTAINVEST'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      
        'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRSUB) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERDIRSUB+10000))'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 369
    Top = 291
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
    object qryTipoOperRecFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
  end
  object qryHistCaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR,'
      '       DATAHISTCAIXA, VLRHISTCAIXA, SLDHISTCAIXA, '
      
        '       IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDO' +
        'PERACAODIREITO,'
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
  object qryInvestimentoAcaoRec: TwwQuery
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
    Left = 49
    Top = 291
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
    object qryInvestimentoAcaoRecDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoAcaoRecIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoAcaoRecQTDTITLOTE: TFloatField
      FieldName = 'QTDTITLOTE'
      Visible = False
    end
    object qryInvestimentoAcaoRecIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryInvestimentoAcaoRecIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoAcaoRecIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Visible = False
    end
  end
end
