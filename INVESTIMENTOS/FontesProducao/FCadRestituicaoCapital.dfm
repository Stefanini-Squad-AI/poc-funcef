inherited FrmCadRestituicaoCapital: TFrmCadRestituicaoCapital
  Left = 41
  Top = 132
  HelpContext = 790291
  Caption = 'Operação'
  ClientHeight = 440
  ClientWidth = 760
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 354
    inherited Bevel1: TBevel
      Width = 758
    end
    inherited pnlMestre: TPanel
      Width = 758
      Height = 115
      object Label3: TLabel
        Left = 16
        Top = 39
        Width = 49
        Height = 13
        Caption = 'Empresa'
      end
      object Label4: TLabel
        Left = 15
        Top = 77
        Width = 57
        Height = 13
        Caption = 'Data AGE'
      end
      object Label5: TLabel
        Left = 116
        Top = 77
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object Label16: TLabel
        Left = 216
        Top = 77
        Width = 54
        Height = 13
        Caption = 'Data  Ex '
      end
      object Label6: TLabel
        Left = 319
        Top = 77
        Width = 78
        Height = 13
        Caption = 'Data Prevista'
      end
      object Label13: TLabel
        Left = 253
        Top = 39
        Width = 22
        Height = 13
        Caption = 'PU '
      end
      object Label14: TLabel
        Left = 421
        Top = 0
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label28: TLabel
        Left = 16
        Top = 2
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 16
        Top = 53
        Width = 232
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
        Left = 15
        Top = 91
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
        TabOrder = 3
      end
      object dbdEX: TCMDateTimePicker
        Left = 116
        Top = 91
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
        TabOrder = 4
      end
      object dbdOper: TCMDateTimePicker
        Left = 216
        Top = 91
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
        TabOrder = 5
      end
      object dbdCOM: TCMDateTimePicker
        Left = 318
        Top = 91
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
        TabOrder = 6
      end
      object dbeDivPorAcao: TDBRealEdit
        Left = 253
        Top = 53
        Width = 161
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
        Top = 16
        Width = 332
        Height = 95
        DataField = 'OBSERVACAO'
        DataSource = ds
        TabOrder = 7
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 16
        Top = 16
        Width = 398
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 159
      Width = 758
      Height = 194
      Tabs.Strings = (
        'Investimento'
        'Recebimento')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgRecebimento')
      inherited pgctrlDetalhe: TPageControl
        Width = 660
        Height = 135
        ActivePage = tbsRecebimento
        inherited tbsDet: TTabSheet
          Caption = 'Investimento'
          inherited dbgrdDet: TwwDBGrid
            Width = 652
            Height = 107
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'109'#9'Investimento'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTabExitsOnLastCol]
            ParentFont = False
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 652
            Height = 107
            object Label18: TLabel
              Left = 10
              Top = 4
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object dblInvestimento: TwwDBLookupCombo
              Left = 10
              Top = 20
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
        object tbsRecebimento: TTabSheet
          Caption = 'Recebimento'
          ImageIndex = 2
          object dbgRecebimento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 652
            Height = 107
            Selected.Strings = (
              'NUMDOCUMENTO'#9'12'#9'Boleta'
              'DESCCARTINVEST'#9'32'#9'Carteira'
              'DESCINVESTIMENTO'#9'24'#9'Investimento'
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patro'
              'DATAOPERACAO'#9'10'#9'Operação'
              'QTDEOPERACAO'#9'27'#9'Quantidade'
              'VLROPERACAO'#9'16'#9'Valor'
              'SGLCUSTODIANTE'#9'15'#9'Custodiante'
              'SIGLAMOTBLOQ'#9'7'#9'Bloqueio'
              'DESCTIPOOPERACAO'#9'35'#9'Tipo de Operação')
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
            Height = 107
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label20: TLabel
              Left = 6
              Top = -1
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
            end
            object Label19: TLabel
              Left = 6
              Top = 36
              Width = 139
              Height = 13
              Caption = 'Carteira de Investimento'
            end
            object Label21: TLabel
              Left = 195
              Top = 73
              Width = 68
              Height = 13
              Caption = 'Custodiante'
            end
            object Label22: TLabel
              Left = 7
              Top = 73
              Width = 50
              Height = 13
              Caption = 'Bloqueio'
            end
            object Label23: TLabel
              Left = 341
              Top = 73
              Width = 70
              Height = 13
              Caption = 'Quantidade '
            end
            object Label24: TLabel
              Left = 506
              Top = 73
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label29: TLabel
              Left = 341
              Top = -1
              Width = 105
              Height = 13
              Caption = 'Data da Operação'
            end
            object Label26: TLabel
              Left = 506
              Top = -1
              Width = 37
              Height = 13
              Caption = 'Boleta'
              FocusControl = dbeBoletaRec
            end
            object dblCarteiraRec: TwwDBLookupCombo
              Left = 6
              Top = 49
              Width = 323
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
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblCarteiraRecExit
            end
            object dblTipoOperRec: TwwDBLookupCombo
              Left = 6
              Top = 13
              Width = 323
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
              Left = 195
              Top = 86
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
              Left = 7
              Top = 87
              Width = 182
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
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbrQtdRec: TDBRealEdit
              Left = 341
              Top = 87
              Width = 158
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 6
              WordWrap = False
              OnExit = dbrQtdProvExit
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEOPERACAO'
              DataSource = dsRecebimento
            end
            object dbrVlrRec: TDBRealEdit
              Left = 506
              Top = 87
              Width = 141
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
              DataField = 'VLROPERACAO'
              DataSource = dsRecebimento
            end
            object dbdDataOperacaoRec: TCMDateTimePicker
              Left = 341
              Top = 13
              Width = 104
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
            object dbeBoletaRec: TDBEdit
              Left = 506
              Top = 13
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
        object lblTotalRec: TfcLabel [0]
          Left = 652
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
          TextOptions.Alignment = taRightJustify
          TextOptions.Style = fclsLowered
          TextOptions.VAlignment = vaVCenter
        end
        object lblCapRec: TfcLabel [1]
          Left = 473
          Top = 6
          Width = 130
          Height = 13
          Align = alRight
          Caption = 'Total do Recebimento :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taRightJustify
          TextOptions.VAlignment = vaVCenter
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
        Height = 135
      end
    end
    inherited pnlTitulo: TPanel
      Width = 758
      inherited lbNomItem: TfcLabel
        Width = 490
        Caption = 'Restituição de Capital / Recebimento Fracionado'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 760
  end
  inherited Dock971: TDock97
    Top = 401
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
    Left = 528
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
    Left = 656
    Top = 308
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 656
    Top = 265
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
    Left = 628
    Top = 265
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
      
        '((OPERACAODIREITO.IDTIPOOPERACAO = PARAMINVEST.IDTIPOOPERDIRRES)' +
        ' OR (OPERACAODIREITO.IDTIPOOPERACAO = PARAMINVEST.IDTIPOOPERRFRA' +
        'C))'
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'EMISSOR.IDEMISSOR(+)           = OPERACAODIREITO.IDEMISSOR'
      'ACOESXBOLSA.IDACAO(+)          = OPERDIREITOXINV.IDINVESTIMENTO'
      'PEDIDOFUNDO.IDPEDIDOFUNDO(+)   = OPERACAODIREITO.IDPEDIDOFUNDO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+)  = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO'
      
        'OPERDIREITOXINV.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO ')
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
    Left = 364
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 308
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT TPO.DESCTIPOOPERACAO AS DESCTIPOOPERACAO,'
      
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
      'FROM OPERACAODIREITO OPD, TIPOOPERACAO TPO, PARAMINVEST PI'
      ''
      'WHERE OPD.IDOPERACAODIREITO = :IDOPERACAODIREITO'
      
        '  AND ((OPD.IDTIPOOPERACAO    = PI.IDTIPOOPERDIRRES) OR (OPD.IDT' +
        'IPOOPERACAO    = PI.IDTIPOOPERRFRAC))'
      '  AND TPO.IDTIPOOPERACAO(+) = OPD.IDTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 600
    Top = 265
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
    Left = 427
    Top = 2
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
    Left = 628
    Top = 308
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
    Left = 600
    Top = 308
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object qryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 109
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
  object qryRecebimento: TwwQuery
    CachedUpdates = True
    AfterScroll = qryRecebimentoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OI.NUMDOCUMENTO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO' +
        ', PP.PLANPRVCONTABPATRO,'
      
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
      '       OI.DATAOPERACAO, OI.PRECOUNITOPERACAO,'
      
        '       OI.DATAVENCOPER, OI.IDFORCLI, OI.IDLOTE, OI.IDCUSTODIANTE' +
        ', OI.FLGSTATUSFECHBOL,'
      
        '       OI.FLGSTATUSORDMOV, OI.IDOPERACAODIREITO, OI.VLRREMUNERAC' +
        'AO, OI.PERCENTUAL,'
      
        '       OI.IDCARTEIRAGERENC, OI.IDPLANPREVCTBPATR, OI.IDOPERCUSTO' +
        'DIA, OI.IDCUSTORIG,'
      
        '       OI.IDMOTIVOBLOQUEIO, TP.NATUREZAOPERACAO, CI.IDCARTEIRA, ' +
        '0 AS QTDEEXERCIDA,'
      '       OI.IDOPERACAOORIGEM,'
      '       '#39'N'#39' AS ALTERADO, VLRCUSTOATUAL, VLRVARIACAOATUAL,'
      '       TP.FLGCONTAINVEST'
      'FROM OPERACAOINVEST OI, INVESTIMENTO IV, CUSTODIANTE CT,'
      '     OPERACAODIREITO OD, TIPOOPERACAO TP, PARAMINVEST PI,'
      
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
      ''
      '  AND (((OI.IDTIPOOPERACAO  = PI.IDTIPOOPERDIRRES)'
      '        OR'
      '       (OI.IDTIPOOPERACAO  = PI.IDTIPOOPERDIRRES+10000))'
      '       OR'
      '       ((OI.IDTIPOOPERACAO  = PI.IDTIPOOPERRFRAC)'
      '        OR'
      '       (OI.IDTIPOOPERACAO  = PI.IDTIPOOPERRFRAC+10000)))'
      '  AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO'
      '  AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO'
      
        '  AND ((LPAD(OI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(OI.IDCARTEIRAGER' +
        'ENC,2,'#39'0'#39')) = CI.IDCARTEIRA)'
      '  AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR(+)'
      '  AND OI.IDCUSTODIANTE     = CT.IDCUSTODIANTE(+)'
      '  AND OI.IDMOTIVOBLOQUEIO  = MB.IDMOTIVOBLOQUEIO(+)'
      'ORDER BY OI.DATAOPERACAO, OI.IDOPERACAOINVEST'
      '')
    UpdateObject = updRecebimento
    ValidateWithMask = True
    Left = 600
    Top = 352
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
    object qryRecebimentoNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryRecebimentoDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 32
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryRecebimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 24
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryRecebimentoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryRecebimentoDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryRecebimentoQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 27
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,##0.0000000000'
    end
    object qryRecebimentoVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###,##0.00'
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
    object qryRecebimentoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryRecebimentoPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'Preço Unitário'
      DisplayWidth = 16
      FieldName = 'PRECOUNITOPERACAO'
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
    object qryRecebimentoQTDEEXERCIDA: TFloatField
      FieldName = 'QTDEEXERCIDA'
      Visible = False
    end
    object qryRecebimentoVLRCUSTOATUAL: TFloatField
      FieldName = 'VLRCUSTOATUAL'
      Visible = False
    end
    object n: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
      Visible = False
    end
    object qryRecebimentoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Visible = False
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
    Top = 352
  end
  object dsRecebimento: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebimento
    OnStateChange = dsDetStateChange
    Left = 656
    Top = 352
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
    Left = 411
    Top = 92
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
    Left = 411
    Top = 180
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
      '       I.IDINVESTIMENTO, I.DESCINVESTIMENTO, C.QTDTITLOTE,'
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
      'ORDER BY I.DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 411
    Top = 354
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
      '       T.TIPCREDOR, T.RECPAG, T.VENCIMENTO'
      'FROM TIPOOPERACAO T, PARAMINVEST P'
      'WHERE ((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRRES) OR'
      '       (T.IDTIPOOPERACAO = P.IDTIPOOPERRFRAC))'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 411
    Top = 311
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
    Left = 411
    Top = 224
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
        ' AS ORDEM,'
      '       0 AS VLRVARIACAOATUAL'
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
      
        '   PP.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, CA.DESCCARTGERENC' +
        ' AS DESCCARTINVEST, '#39#39' AS SLGCUSTODIANTE,'
      '   '#39#39' AS SIGLAMOTBLOQ,  HI.IDLOTE,'
      
        '   SYSDATE AS DATAREFERENCIA, NVL(HI.SALDOQTDEINVCART,0) AS QTDE' +
        ','
      
        '   0 AS QTDEDIREITO, 0 AS VALOREXERCICIO, 0 AS VLRREMUNERACAO, 0' +
        ' AS IR,'
      
        '   0 AS VLRLIQ, 0 AS VLRIRREMUNERACAO, 0 AS VLRCUSTOATUAL, 0 AS ' +
        'VLRCUSTO,'
      
        '   HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVESTIMENTO, ' +
        'NULL AS IDCUSTODIANTE, HI.IDPLANPREVCTBPATR,'
      
        '   LPAD(HI.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(HI.IDCARTEIRAGERENC,2' +
        ','#39'0'#39') AS IDCARTEIRA,'
      '   NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.QTDTITLOTE,'
      '   DECODE(:FORCLI, '#39'CT'#39', '#39#39', TO_CHAR(IDEMISSOR)) AS ORDEM,'
      '   0 AS VLRVARIACAOATUAL'
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
      ' '
      ' ')
    UpdateObject = UpdOrigemDivJur
    ValidateWithMask = True
    Left = 600
    Top = 223
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
    object QryOrigemDivJurVLRVARIACAOATUAL: TFloatField
      FieldName = 'VLRVARIACAOATUAL'
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
    Left = 628
    Top = 223
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
    Left = 411
    Top = 267
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
    Left = 411
    Top = 137
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
      '      TIPMOVBOLETA = '#39'DRS'#39)
    UpdateObject = updBoleta
    ValidateWithMask = True
    Left = 600
    Top = 92
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
    Left = 628
    Top = 92
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
    Left = 600
    Top = 179
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
    Left = 628
    Top = 179
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 411
    Top = 48
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
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 138
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
    Left = 509
    Top = 266
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
    Left = 509
    Top = 182
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
      
        'WHERE (((T.IDTIPOOPERACAO = P.IDTIPOOPERDIRRES) OR (T.IDTIPOOPER' +
        'ACAO = P.IDTIPOOPERDIRRES+10000))'
      '       OR'
      
        '       ((T.IDTIPOOPERACAO = P.IDTIPOOPERRFRAC) OR (T.IDTIPOOPERA' +
        'CAO = P.IDTIPOOPERRFRAC+10000))'
      '      )'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 224
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
      'SELECT IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, '
      '       DATAHISTCAIXA, VLRHISTCAIXA, SLDHISTCAIXA, '
      
        '       IDOPERACAOINVEST, IDCARTEIRAINVEST, IDCARTEIRAGERENC, IDO' +
        'PERACAODIREITO, '
      '       DESCINVESTIMENTO, TIPMOVCAIXA'
      'FROM HISTCAIXA'
      'WHERE IDOPERACAODIREITO = :IDOPERACAODIREITO')
    UpdateObject = updHistCaixa
    ValidateWithMask = True
    Left = 600
    Top = 136
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
    Left = 628
    Top = 136
  end
  object QryHistCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIA, IDOPERACAOINVEST, DATAMOVCUSTOD'
      'FROM HISTCUSTODIA'
      'WHERE IDOPERACAOINVEST IN (SELECT IDOPERACAOINVEST'
      '                           FROM OPERACAOINVEST'
      
        '                           WHERE IDOPERACAODIREITO = :IDOPERACAO' +
        'DIREITO)'
      'ORDER BY DATAMOVCUSTOD, IDCUSTODIA')
    UpdateObject = UpdHistCustodia
    ValidateWithMask = True
    Left = 600
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
    object QryHistCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object QryHistCustodiaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object QryHistCustodiaDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
    end
  end
  object UpdHistCustodia: TUpdateSQL
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 628
    Top = 49
  end
  object cdsSelBoleta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 713
    Top = 48
  end
  object dspSelBoleta: TDataSetProvider
    Constraints = True
    Left = 714
    Top = 99
  end
end
