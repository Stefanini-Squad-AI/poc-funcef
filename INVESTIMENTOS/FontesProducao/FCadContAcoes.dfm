inherited frmCadContAcoes: TfrmCadContAcoes
  Left = 150
  Top = 91
  HelpContext = 790297
  Caption = 'frmCadContAcoes'
  ClientHeight = 573
  ClientWidth = 796
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 796
    Height = 487
    inherited Bevel1: TBevel
      Width = 794
    end
    inherited pnlMestre: TPanel
      Width = 794
      Height = 173
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 794
        Height = 173
        ActivePage = tbsDadosPrinc
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object tbsDadosPrinc: TTabSheet
          Caption = 'Dados'
          object Label28: TLabel
            Left = 13
            Top = 4
            Width = 85
            Height = 13
            Caption = 'Tipo Operação'
          end
          object Label1: TLabel
            Left = 13
            Top = 41
            Width = 62
            Height = 13
            Caption = 'Ação Base'
          end
          object Label4: TLabel
            Left = 13
            Top = 82
            Width = 98
            Height = 13
            Caption = 'Data do Contrato'
          end
          object Label5: TLabel
            Left = 12
            Top = 121
            Width = 122
            Height = 13
            Caption = 'Período de Exercício'
          end
          object Label3: TLabel
            Left = 130
            Top = 141
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object Label7: TLabel
            Left = 637
            Top = 83
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label43: TLabel
            Left = 514
            Top = 83
            Width = 18
            Height = 13
            Caption = 'PU'
          end
          object Label2: TLabel
            Left = 389
            Top = 83
            Width = 66
            Height = 13
            Caption = 'Quantidade'
          end
          object Label18: TLabel
            Left = 389
            Top = 3
            Width = 72
            Height = 13
            Caption = 'Contra Parte'
          end
          object Label20: TLabel
            Left = 139
            Top = 82
            Width = 119
            Height = 13
            Caption = 'Registro da Provisão'
          end
          object Label22: TLabel
            Left = 270
            Top = 82
            Width = 105
            Height = 13
            Caption = 'Provisão de Perda'
          end
          object Label23: TLabel
            Left = 366
            Top = 103
            Width = 10
            Height = 13
            Caption = '%'
          end
          object lblPlanPatro: TLabel
            Left = 389
            Top = 42
            Width = 126
            Height = 13
            Caption = 'Plano / Patrocinadora'
          end
          object dblTipoOperacao: TwwDBLookupCombo
            Left = 13
            Top = 18
            Width = 365
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
          end
          object dblInvestimentoBase: TwwDBLookupCombo
            Left = 13
            Top = 57
            Width = 365
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
            DataField = 'IDINVESTIMENTO'
            DataSource = ds
            LookupTable = qryInvestimentoAcao
            LookupField = 'IDINVESTIMENTO'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object dbdDtContrato: TCMDateTimePicker
            Left = 13
            Top = 96
            Width = 116
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
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
          object dbdIniPeriodoExe: TCMDateTimePicker
            Left = 13
            Top = 135
            Width = 116
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAINIEXE'
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
            TabOrder = 10
          end
          object dbdFimPeriodoExe: TCMDateTimePicker
            Left = 139
            Top = 135
            Width = 116
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAFIMEXE'
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
            TabOrder = 11
          end
          object dbrQtd: TDBRealEdit
            Left = 389
            Top = 97
            Width = 116
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '1.000')
            TabOrder = 7
            WordWrap = False
            IntDigits = 14
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
            DataField = 'QUANTIDADE'
            DataSource = ds
          end
          object dbrPU: TDBRealEdit
            Left = 514
            Top = 97
            Width = 116
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '10,000000000')
            TabOrder = 8
            WordWrap = False
            OnEnter = dbrPUEnter
            OnExit = dbrPUExit
            IntDigits = 14
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
            DataField = 'PUOPERACAO'
            DataSource = ds
          end
          object dbrVlr: TDBRealEdit
            Left = 637
            Top = 97
            Width = 116
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '10.000,00')
            TabOrder = 9
            WordWrap = False
            OnEnter = dbrVlrEnter
            OnExit = dbrVlrExit
            IntDigits = 14
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
            DataSource = ds
          end
          object dblContraParte: TwwDBLookupCombo
            Left = 389
            Top = 18
            Width = 365
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SIGLAEMISSOR'#9'15'#9'Descrição'#9'F')
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
          end
          object dbdDtRegistro: TCMDateTimePicker
            Left = 139
            Top = 96
            Width = 116
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAREGISTRO'
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
          object dbrPercProvPerda: TDBRealEdit
            Left = 270
            Top = 96
            Width = 94
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '30,000000000')
            TabOrder = 6
            WordWrap = False
            IntDigits = 14
            DecDigits = 9
            NumberFormat = fNumber
            Signal = False
            DataField = 'PERCPROVPERDA'
            DataSource = ds
          end
          object dblkPlanoPatro: TwwDBLookupCombo
            Left = 389
            Top = 57
            Width = 365
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'#9'F')
            DataField = 'IDPLANPREVCTBPATR'
            DataSource = ds
            LookupTable = qryPlanoPatro
            LookupField = 'IDPLANPREVCTBPATR'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object tbsObservacao: TTabSheet
          Caption = 'Observação'
          ImageIndex = 1
          object dbmObservacao: TDBMemo
            Left = 0
            Top = 18
            Width = 719
            Height = 113
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = ds
            TabOrder = 0
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 719
            Height = 18
            Align = alTop
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '   Observação'
            TabOrder = 1
          end
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 217
      Width = 794
      Height = 269
      Tabs.Strings = (
        'Saldo a Receber'
        'Saldo a Pagar'
        'Saldo Líquido'
        'Liquidações sem Ações'
        'Liquidações com Ações'
        'Não Exercício')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgSldPagar'
        'dbgSldLiq'
        'grdLiqSemAcoes'
        'grdLiqComAcoes'
        'grdNaoExe'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 696
        Height = 210
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 432
            Height = 182
            TabStop = False
            Selected.Strings = (
              'DATASLDCONTACOES'#9'14'#9'Data Atualização'
              'QTDSLDCONTACOES'#9'15'#9'Quantidade'
              'PUSLDCONTACOES'#9'20'#9'PU do Saldo a Receber'#9'F'
              'VLRSLDCONTACOES'#9'12'#9'Valor')
            ParentFont = False
            TitleFont.Color = clMaroon
            OnCalcCellColors = GridZebrado
            OnTopRowChanged = dbgrdDetTopRowChanged
          end
          inherited pnlControlesDet: TPanel
            Width = 432
            Height = 182
            object Label6: TLabel
              Left = 9
              Top = 10
              Width = 98
              Height = 13
              Caption = 'Data Atualização'
            end
            object Label9: TLabel
              Left = 9
              Top = 54
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label10: TLabel
              Left = 9
              Top = 99
              Width = 135
              Height = 13
              Caption = 'PU do Saldo a Receber'
            end
            object Label11: TLabel
              Left = 116
              Top = 54
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbdDataSldRec: TCMDateTimePicker
              Left = 9
              Top = 24
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASLDCONTACOES'
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
            object dbQtdSldRec: TDBRealEdit
              Left = 9
              Top = 68
              Width = 101
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '2.800')
              TabOrder = 1
              WordWrap = False
              OnExit = dbVlrSldRecExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDSLDCONTACOES'
              DataSource = dsDet
            end
            object dbPUSldRec: TDBRealEdit
              Left = 9
              Top = 113
              Width = 139
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '4,125000000')
              TabOrder = 3
              WordWrap = False
              OnExit = dbVlrSldRecExit
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PUSLDCONTACOES'
              DataSource = dsDet
            end
            object dbVlrSldRec: TDBRealEdit
              Left = 116
              Top = 68
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '11.550,00')
              TabOrder = 2
              WordWrap = False
              OnExit = dbVlrSldRecExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRSLDCONTACOES'
              DataSource = dsDet
            end
          end
          object pnlObsSldRec: TPanel
            Left = 432
            Top = 0
            Width = 256
            Height = 182
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 256
              Height = 18
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Observação'
              TabOrder = 0
            end
            object dbmObsSldRec: TDBMemo
              Left = 0
              Top = 18
              Width = 256
              Height = 164
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              TabOrder = 1
            end
          end
        end
        object tbsSldPag: TTabSheet
          Caption = 'tbsSldPag'
          ImageIndex = 1
          object pnlDetSldPagar: TPanel
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label16: TLabel
              Left = 9
              Top = 99
              Width = 120
              Height = 13
              Caption = 'PU do Saldo a Pagar'
            end
            object Label8: TLabel
              Left = 9
              Top = 10
              Width = 98
              Height = 13
              Caption = 'Data Atualização'
            end
            object Label13: TLabel
              Left = 9
              Top = 54
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label15: TLabel
              Left = 116
              Top = 54
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbdDataSldPag: TCMDateTimePicker
              Left = 9
              Top = 24
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATASLDCONTACOES'
              DataSource = dsSldPagar
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
            object dbQtdSldPag: TDBRealEdit
              Left = 9
              Top = 68
              Width = 101
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1.100')
              TabOrder = 1
              WordWrap = False
              OnExit = dbVlrSldPagExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDSLDCONTACOES'
              DataSource = dsSldPagar
            end
            object dbVlrSldPag: TDBRealEdit
              Left = 116
              Top = 68
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '12.000,00')
              TabOrder = 2
              WordWrap = False
              OnExit = dbVlrSldPagExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRSLDCONTACOES'
              DataSource = dsSldPagar
            end
            object dbPUSldPag: TDBRealEdit
              Left = 9
              Top = 113
              Width = 139
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '10,909090909')
              TabOrder = 3
              WordWrap = False
              OnExit = dbVlrSldPagExit
              IntDigits = 14
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PUSLDCONTACOES'
              DataSource = dsSldPagar
            end
          end
          object dbgSldPagar: TwwDBGrid
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            TabStop = False
            Selected.Strings = (
              'DATASLDCONTACOES'#9'14'#9'Data Atualização'
              'QTDSLDCONTACOES'#9'13'#9'Quantidade'
              'PUSLDCONTACOES'#9'19'#9'PU do Saldo a Pagar'#9'F'
              'VLRSLDCONTACOES'#9'12'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSldPagar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GridZebrado
            IndicatorColor = icBlack
            OnTopRowChanged = dbgSldPagarTopRowChanged
          end
          object pnlObsSldPag: TPanel
            Left = 432
            Top = 0
            Width = 256
            Height = 182
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 256
              Height = 18
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Observação'
              TabOrder = 0
            end
            object dbmObsSldPag: TDBMemo
              Left = 0
              Top = 18
              Width = 256
              Height = 135
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = dsSldPagar
              TabOrder = 1
            end
          end
        end
        object tbsSldLiq: TTabSheet
          Caption = 'tbsSldLiq'
          ImageIndex = 2
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 688
            Height = 182
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label14: TLabel
              Left = 9
              Top = 10
              Width = 82
              Height = 13
              Caption = 'Data do Saldo'
            end
            object Label19: TLabel
              Left = 314
              Top = 70
              Width = 103
              Height = 13
              Caption = 'Saldo do Contrato'
            end
            object Label12: TLabel
              Left = 162
              Top = 14
              Width = 100
              Height = 13
              Caption = 'Qtd Movimentada'
            end
            object Label17: TLabel
              Left = 314
              Top = 14
              Width = 95
              Height = 13
              Caption = 'Vlr Movimentado'
            end
            object Label21: TLabel
              Left = 162
              Top = 70
              Width = 120
              Height = 13
              Caption = 'Saldo de Quantidade'
            end
            object dbdDataSldLiquido: TCMDateTimePicker
              Left = 9
              Top = 24
              Width = 96
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAHISTCONTACOES'
              DataSource = dsSldLiq
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
            object dbrSldVlrSldLiq: TDBRealEdit
              Left = 314
              Top = 84
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '-450,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'SLDVLRCONTACOES'
              DataSource = dsSldLiq
            end
            object dbrQtdMovSldLiq: TDBRealEdit
              Left = 162
              Top = 28
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '300')
              TabOrder = 2
              WordWrap = False
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDMOVCONTACOES'
              DataSource = dsSldLiq
            end
            object dbrVlrMovSldLiq: TDBRealEdit
              Left = 314
              Top = 28
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '-950,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRMOVCONTACOES'
              DataSource = dsSldLiq
            end
            object dbrSldQtdSldLiq: TDBRealEdit
              Left = 162
              Top = 84
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1.700')
              TabOrder = 4
              WordWrap = False
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'SLDQTDCONTACOES'
              DataSource = dsSldLiq
            end
          end
          object dbgSldLiq: TwwDBGrid
            Left = 0
            Top = 0
            Width = 688
            Height = 182
            Selected.Strings = (
              'DATAHISTCONTACOES'#9'14'#9'Data do Saldo'#9'F'
              'VLRMOVCONTACOES'#9'13'#9'Variação'#9'F'
              'SLDVLRCONTACOES'#9'17'#9'Saldo do Contrato'#9'F'
              'VLRPROVPERDA'#9'22'#9'Variação da Provisão de Perda'#9'F'
              'SLDPROVPERDA'#9'22'#9'Saldo de Provisão de Perda'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSldLiq
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GridZebrado
            IndicatorColor = icBlack
            OnTopRowChanged = dbgSldLiqTopRowChanged
          end
        end
        object tbsLiqSemAcoes: TTabSheet
          Caption = 'tbsLiqSemAcoes'
          ImageIndex = 3
          object pnlDetLiquidacao: TPanel
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label25: TLabel
              Left = 9
              Top = 50
              Width = 87
              Height = 13
              Caption = 'Data Operação'
            end
            object Label26: TLabel
              Left = 9
              Top = 94
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label27: TLabel
              Left = 136
              Top = 95
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label29: TLabel
              Left = 9
              Top = 6
              Width = 85
              Height = 13
              Caption = 'Tipo Operação'
            end
            object Label24: TLabel
              Left = 136
              Top = 50
              Width = 94
              Height = 13
              Caption = 'Data Liquidação'
            end
            object dbdtDataOperLSA: TCMDateTimePicker
              Left = 9
              Top = 64
              Width = 101
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsLiqSemAcoes
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
              OnExit = dbdtDataOperLSAExit
            end
            object dbrQuantidadeLSA: TDBRealEdit
              Left = 9
              Top = 108
              Width = 101
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 3
              WordWrap = False
              OnEnter = dbrQuantidadeLSAEnter
              OnExit = dbrQuantidadeLSAExit
              IntDigits = 14
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'QUANTIDADE'
              DataSource = dsLiqSemAcoes
            end
            object dbrValorLSA: TDBRealEdit
              Left = 136
              Top = 109
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              OnExit = dbrValorLSAExit
              IntDigits = 14
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLROPERACAO'
              DataSource = dsLiqSemAcoes
            end
            object dblTipoOperLSA: TwwDBLookupCombo
              Left = 9
              Top = 20
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'35'#9'Descrição')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsLiqSemAcoes
              LookupTable = qryTpOperLiqSemAcoes
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnExit = dblTipoOperLSAExit
            end
            object dbdtDataLiqLSA: TCMDateTimePicker
              Left = 136
              Top = 64
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALIQUIDACAO'
              DataSource = dsLiqSemAcoes
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
              OnEnter = dbdtDataLiqLSAEnter
              OnExit = dbdtDataLiqLSAExit
            end
          end
          object grdLiqSemAcoes: TwwDBGrid
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            TabStop = False
            Selected.Strings = (
              'DATAOPERACAO'#9'10'#9'Data da Operação'
              'DATALIQUIDACAO'#9'10'#9'Data de Liquidação'
              'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'
              'QUANTIDADE'#9'20'#9'Quantidade'
              'VLROPERACAO'#9'20'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLiqSemAcoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GridZebrado
            IndicatorColor = icBlack
            OnTopRowChanged = grdLiqSemAcoesTopRowChanged
          end
          object pnlObsLiqSemAcoes: TPanel
            Left = 432
            Top = 0
            Width = 256
            Height = 182
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 256
              Height = 18
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Observação'
              TabOrder = 1
            end
            object dbmObsLSA: TDBMemo
              Left = 0
              Top = 18
              Width = 256
              Height = 164
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = dsLiqSemAcoes
              TabOrder = 0
            end
          end
        end
        object tbsLiqComAcoes: TTabSheet
          Caption = 'tbsLiqComAcoes'
          ImageIndex = 5
          object pgcLiqComAcoes: TPageControl
            Left = 0
            Top = 0
            Width = 688
            Height = 182
            ActivePage = tbsAcoes
            Align = alClient
            TabOrder = 0
            OnChange = pgcLiqComAcoesChange
            object tbsOperacoes: TTabSheet
              Caption = 'Operações'
              object grdLiqComAcoes: TwwDBGrid
                Left = 0
                Top = 0
                Width = 680
                Height = 154
                TabStop = False
                Selected.Strings = (
                  'DATAOPERACAO'#9'10'#9'Data da Operação'#9'F'
                  'DATALIQUIDACAO'#9'10'#9'Data de Liquidação'#9'F'
                  'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'#9'F'
                  'QUANTIDADE'#9'20'#9'Quantidade'#9'F'
                  'VLROPERACAO'#9'20'#9'Valor'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsLiqComAcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnCalcCellColors = GridZebrado
                IndicatorColor = icBlack
                OnTopRowChanged = grdLiqSemAcoesTopRowChanged
              end
              object pnlDetLiquidacaoComAcoes: TPanel
                Left = 0
                Top = 0
                Width = 680
                Height = 154
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Label31: TLabel
                  Left = 9
                  Top = 50
                  Width = 87
                  Height = 13
                  Caption = 'Data Operação'
                end
                object Label32: TLabel
                  Left = 9
                  Top = 94
                  Width = 66
                  Height = 13
                  Caption = 'Quantidade'
                end
                object Label33: TLabel
                  Left = 136
                  Top = 95
                  Width = 30
                  Height = 13
                  Caption = 'Valor'
                end
                object Label34: TLabel
                  Left = 9
                  Top = 6
                  Width = 85
                  Height = 13
                  Caption = 'Tipo Operação'
                end
                object Label35: TLabel
                  Left = 136
                  Top = 50
                  Width = 94
                  Height = 13
                  Caption = 'Data Liquidação'
                end
                object dbdtDataOperLCA: TCMDateTimePicker
                  Left = 9
                  Top = 64
                  Width = 101
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAOPERACAO'
                  DataSource = dsLiqComAcoes
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
                  OnExit = dbdtDataOperLCAExit
                end
                object dbrQuantidadeLCA: TDBRealEdit
                  Left = 9
                  Top = 108
                  Width = 101
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 3
                  WordWrap = False
                  OnEnter = dbrQuantidadeLCAEnter
                  OnExit = dbrQuantidadeLCAExit
                  IntDigits = 14
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'QUANTIDADE'
                  DataSource = dsLiqComAcoes
                end
                object dbrValorLCA: TDBRealEdit
                  Left = 136
                  Top = 109
                  Width = 100
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00')
                  TabOrder = 4
                  WordWrap = False
                  OnExit = dbrValorLCAExit
                  IntDigits = 14
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'VLROPERACAO'
                  DataSource = dsLiqComAcoes
                end
                object dblTipoOperLCA: TwwDBLookupCombo
                  Left = 9
                  Top = 20
                  Width = 359
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCTIPOOPERACAO'#9'35'#9'Descrição')
                  DataField = 'IDTIPOOPERACAO'
                  DataSource = dsLiqComAcoes
                  LookupTable = qryTpOperLiqComAcoes
                  LookupField = 'IDTIPOOPERACAO'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnExit = dblTipoOperLCAExit
                end
                object dbdtDataLiqLCA: TCMDateTimePicker
                  Left = 136
                  Top = 64
                  Width = 100
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATALIQUIDACAO'
                  DataSource = dsLiqComAcoes
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
                  OnEnter = dbdtDataLiqLCAEnter
                  OnExit = dbdtDataLiqLCAExit
                end
                object Panel3: TPanel
                  Left = 424
                  Top = 0
                  Width = 256
                  Height = 154
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 5
                  object Panel8: TPanel
                    Left = 0
                    Top = 0
                    Width = 256
                    Height = 18
                    Align = alTop
                    Alignment = taLeftJustify
                    BevelOuter = bvNone
                    Caption = 'Observação'
                    TabOrder = 1
                  end
                  object dbmObsLCA: TDBMemo
                    Left = 0
                    Top = 18
                    Width = 256
                    Height = 136
                    Align = alClient
                    DataField = 'OBSERVACAO'
                    DataSource = dsLiqComAcoes
                    TabOrder = 0
                  end
                end
              end
            end
            object tbsAcoes: TTabSheet
              Caption = 'Ações'
              ImageIndex = 1
              object dbgOperRV: TwwDBGrid
                Left = 0
                Top = 31
                Width = 680
                Height = 123
                TabStop = False
                Selected.Strings = (
                  'QTDEOPERACAO'#9'15'#9'Quantidade'
                  'DESCINVESTIMENTO'#9'35'#9'Investimento'
                  'DESCTIPOOPERACAO'#9'35'#9'Operação'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsOperRV
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                ParentFont = False
                TabOrder = 0
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clMaroon
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnCalcCellColors = GridZebrado
                IndicatorColor = icBlack
                OnTopRowChanged = grdLiqSemAcoesTopRowChanged
              end
              object pnlOperRV: TPanel
                Left = 0
                Top = 31
                Width = 680
                Height = 123
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Label37: TLabel
                  Left = 385
                  Top = 46
                  Width = 66
                  Height = 13
                  Caption = 'Quantidade'
                end
                object Label39: TLabel
                  Left = 9
                  Top = 6
                  Width = 85
                  Height = 13
                  Caption = 'Tipo Operação'
                end
                object Label36: TLabel
                  Left = 385
                  Top = 6
                  Width = 41
                  Height = 13
                  Caption = 'Saldo :'
                end
                object Label38: TLabel
                  Left = 9
                  Top = 45
                  Width = 45
                  Height = 13
                  Caption = 'Carteira'
                end
                object Label40: TLabel
                  Left = 9
                  Top = 85
                  Width = 68
                  Height = 13
                  Caption = 'Custodiante'
                end
                object dbreQtdOperRV: TDBRealEdit
                  Left = 385
                  Top = 60
                  Width = 144
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 4
                  WordWrap = False
                  OnEnter = dbrQuantidadeLCAEnter
                  OnExit = dbrQuantidadeLCAExit
                  IntDigits = 14
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                end
                object dblkTipoOperRV: TwwDBLookupCombo
                  Left = 9
                  Top = 20
                  Width = 359
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCTIPOOPERACAO'#9'70'#9'DESCTIPOOPERACAO'#9'F')
                  LookupTable = qryTipoOperRV
                  LookupField = 'IDTIPOOPERACAO'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnExit = dblkTipoOperRVExit
                end
                object Dock975: TDock97
                  Left = 590
                  Top = 0
                  Width = 90
                  Height = 123
                  AllowDrag = False
                  BoundLines = [blLeft]
                  Position = dpRight
                  object Toolbar972: TToolbar97
                    Left = 0
                    Top = 0
                    Caption = 'tb97Detalhe'
                    DockPos = 0
                    TabOrder = 0
                    object bbtnOkOperRV: TBitBtn
                      Left = 0
                      Top = 0
                      Width = 85
                      Height = 27
                      Caption = 'OK'
                      TabOrder = 0
                      OnClick = bbtnOkOperRVClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
                        88888887788888778F88887222222222088888788888888878F887A228822222
                        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
                        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
                        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
                        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
                        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                    end
                    object bbtnCancelarOperRV: TBitBtn
                      Left = 0
                      Top = 27
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = 'Cancelar'
                      TabOrder = 1
                      OnClick = bbtnCancelarOperRVClick
                      Glyph.Data = {
                        76010000424D7601000000000000760000002800000020000000100000000100
                        0400000000000001000000000000000000001000000000000000000000000000
                        8000008000000080800080000000800080008080000080808000C0C0C0000000
                        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
                        88888887788888778F88887991919191088888788888888878F8879919191919
                        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
                        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
                        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
                        190878F877787778887887917F919F71908887F88788878887F8879919191919
                        1088878F88888888878888799191919108888878FF88888F7888888779999977
                        8888888778FFFF77888888888777778888888888877777888888}
                      NumGlyphs = 2
                      Spacing = -1
                    end
                    object bbtnVoltarOperRV: TBitBtn
                      Left = 0
                      Top = 54
                      Width = 85
                      Height = 27
                      Cancel = True
                      Caption = '&Voltar'
                      TabOrder = 2
                      OnClick = bbtnVoltarOperRVClick
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
                object dblkCarteira: TwwDBLookupCombo
                  Left = 9
                  Top = 61
                  Width = 359
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCCARTINVEST'#9'30'#9'Carteira'#9'F')
                  LookupTable = qryCarteiraOperRV
                  LookupField = 'IDCARTEIRAINVEST'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnExit = dblkCarteiraExit
                end
                object dblkCustodiante: TwwDBLookupCombo
                  Left = 9
                  Top = 100
                  Width = 359
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'SGLCUSTODIANTE'#9'30'#9'Custodiante'#9'F')
                  LookupTable = qryCustodiante
                  LookupField = 'IDCUSTODIANTE'
                  Options = [loColLines, loRowLines, loTitles]
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                  OnExit = dblkCustodianteExit
                end
                object dbreSldQtdOperRV: TDBRealEdit
                  Left = 385
                  Top = 20
                  Width = 144
                  Height = 21
                  Alignment = taRightJustify
                  Enabled = False
                  Lines.Strings = (
                    '0')
                  TabOrder = 3
                  WordWrap = False
                  OnEnter = dbrQuantidadeLCAEnter
                  OnExit = dbrQuantidadeLCAExit
                  IntDigits = 14
                  DecDigits = 0
                  NumberFormat = fNumber
                  Signal = False
                end
              end
              object Dock976: TDock97
                Left = 0
                Top = 0
                Width = 680
                Height = 31
                AllowDrag = False
                BoundLines = [blTop, blBottom, blLeft, blRight]
                object Toolbar973: TToolbar97
                  Left = 0
                  Top = 0
                  Caption = 'tb97BotoesDetalhe'
                  DockPos = 0
                  TabOrder = 0
                  object sbtnInsOperRV: TToolbarButton97
                    Left = 0
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Inserir'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 0
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnInsOperRVClick
                  end
                  object sbtnAltOperRV: TToolbarButton97
                    Left = 25
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Alterar'
                    AllowAllUp = True
                    GroupIndex = 2
                    ImageIndex = 1
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnAltOperRVClick
                  end
                  object sbtnExcluiOperRV: TToolbarButton97
                    Left = 50
                    Top = 0
                    Width = 25
                    Height = 25
                    Hint = 'Excluir'
                    AllowAllUp = True
                    ImageIndex = 2
                    Images = ImlPadrao
                    ParentShowHint = False
                    ShowHint = True
                    OnClick = sbtnExcluiOperRVClick
                  end
                end
              end
            end
          end
        end
        object tbsNaoExe: TTabSheet
          Caption = 'tbsNaoExe'
          ImageIndex = 4
          object grdNaoExe: TwwDBGrid
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            TabStop = False
            Selected.Strings = (
              'DATAOPERACAO'#9'15'#9'Data da Operação'
              'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'
              'QUANTIDADE'#9'10'#9'Quantidade'
              'VLROPERACAO'#9'10'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsNaoExe
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clMaroon
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = GridZebrado
            IndicatorColor = icBlack
            OnTopRowChanged = grdNaoExeTopRowChanged
          end
          object pnlDetNaoExe: TPanel
            Left = 0
            Top = 0
            Width = 432
            Height = 182
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label30: TLabel
              Left = 121
              Top = 50
              Width = 87
              Height = 13
              Caption = 'Data Operação'
            end
            object dbdtDataOperNaoExe: TCMDateTimePicker
              Left = 121
              Top = 64
              Width = 151
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAOPERACAO'
              DataSource = dsNaoExe
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
              OnExit = dbdtDataOperNaoExeExit
            end
          end
          object pnlObsNaoExe: TPanel
            Left = 432
            Top = 0
            Width = 256
            Height = 182
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 256
              Height = 18
              Align = alTop
              Alignment = taLeftJustify
              BevelOuter = bvNone
              Caption = 'Observação'
              TabOrder = 1
            end
            object dbmObsNaoExe: TDBMemo
              Left = 0
              Top = 18
              Width = 256
              Height = 135
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = dsNaoExe
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 786
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
        end
      end
      inherited Dock974: TDock97
        Left = 700
        Height = 210
      end
    end
    inherited pnlTitulo: TPanel
      Width = 794
      inherited lbNomItem: TfcLabel
        Width = 189
        Caption = 'Contrato de Ações'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 796
    inherited Toolbar971: TToolbar97
      object sbtnRelatorio: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownMenu = ppmRelatorios
        Caption = '&Relatório'
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 534
    Width = 796
    inherited tb97Fundo: TToolbar97
      Left = 624
      DockPos = 659
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 455
      DockPos = 490
    end
    inherited fraMens: TfraMensagem
      Width = 401
      inherited pnlProgresso: TPanel
        Width = 401
        inherited pnlProgressoMensagem: TPanel
          Width = 192
          inherited lblProgressoMensagem: TfcLabel
            Width = 190
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 193
          Width = 207
          inherited pgbProcesso: TProgressBar
            Width = 205
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
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
  inherited dsDet: TwwDataSource
    Top = 255
  end
  inherited ds: TwwDataSource
    Left = 506
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERCONTACOES'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDBOLETA = :IDBOLETA,'
      '  PUOPERACAO = :PUOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATAINIEXE = :DATAINIEXE,'
      '  DATAFIMEXE = :DATAFIMEXE,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  DATAREGISTRO = :DATAREGISTRO,'
      '  PERCPROVPERDA = :PERCPROVPERDA,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    InsertSQL.Strings = (
      'insert into OPERCONTACOES'
      
        '  (IDOPERCONTACOES, IDTIPOINVEST, IDTIPOOPERACAO, IDEMISSOR, IDI' +
        'NVESTIMENTO, '
      
        '   IDBOLETA, PUOPERACAO, VLROPERACAO, DATAOPERACAO, DATAINIEXE, ' +
        'DATAFIMEXE, '
      
        '   OBSERVACAO, CODDOCUMENTO, PLANO, PLNCODIGO, IDPLANPREVCTBPATR' +
        ', QUANTIDADE, '
      '   DATAREGISTRO, PERCPROVPERDA, IDOPERCONTACOESAP)'
      'values'
      
        '  (:IDOPERCONTACOES, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDEMISSOR,' +
        ' :IDINVESTIMENTO, '
      
        '   :IDBOLETA, :PUOPERACAO, :VLROPERACAO, :DATAOPERACAO, :DATAINI' +
        'EXE, :DATAFIMEXE, '
      
        '   :OBSERVACAO, :CODDOCUMENTO, :PLANO, :PLNCODIGO, :IDPLANPREVCT' +
        'BPATR, '
      
        '   :QUANTIDADE, :DATAREGISTRO, :PERCPROVPERDA, :IDOPERCONTACOESA' +
        'P)')
    DeleteSQL.Strings = (
      'delete from OPERCONTACOES'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    Left = 522
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERCONTACOES.QUANTIDADE'
      'OPERCONTACOES.VLROPERACAO'
      'OPERCONTACOES.PUOPERACAO'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Tipo de Operação'
      'Ação - Contrato'
      'Investimento Base'
      'Quantidade'
      'Valor da Operação'
      'PU da operação'
      'Plano / Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERCONTACOES'
      'EMISSOR'
      'INVESTIMENTO'
      'TIPOOPERACAO'
      'VWPLANPREVCTBPATR')
    CamposChave.Strings = (
      'OPERCONTACOES.IDOPERCONTACOES')
    Filtro.Strings = (
      'OPERCONTACOES.IDEMISSOR = EMISSOR.IDEMISSOR(+)'
      'OPERCONTACOES.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO(+)'
      'OPERCONTACOES.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'OPERCONTACOES.IDTIPOINVEST = TIPOOPERACAO.IDTIPOINVEST(+)'
      'OPERCONTACOES.IDOPERCONTACOES = OPERCONTACOES.IDOPERCONTACOESAP'
      
        'OPERCONTACOES.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVCT' +
        'BPATR')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###,##0'
      '###,###,###,##0.00'
      '###,###,###,##0.000000000'
      '')
    Larguras.Strings = (
      '60'
      '60'
      '60'
      '10'
      '10'
      '10'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 379
  end
  inherited ImlPadrao: TImageList
    Left = 369
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 436
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT O.IDOPERCONTACOES, O.IDTIPOINVEST, O.IDTIPOOPERACAO, O.ID' +
        'EMISSOR, O.IDINVESTIMENTO,'
      '       O.IDBOLETA, O.QUANTIDADE, O.PUOPERACAO, O.VLROPERACAO,'
      
        '       O.DATAINIEXE, O.DATAFIMEXE, O.DATAOPERACAO, O.DATAREGISTR' +
        'O,'
      
        '       O.OBSERVACAO, O.CODDOCUMENTO, O.PLANO, O.PLNCODIGO, O.IDP' +
        'LANPREVCTBPATR,'
      '       O.PERCPROVPERDA, O.IDOPERCONTACOESAP'
      'FROM OPERCONTACOES O'
      'WHERE O.IDOPERCONTACOES = :IDOPERCONTACOES'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 545
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '9'
      end>
    object qryIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOES'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOOPERACAO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.OPERCONTACOES.IDEMISSOR'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERCONTACOES.IDINVESTIMENTO'
    end
    object qryIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERCONTACOES.IDBOLETA'
      Size = 30
    end
    object qryQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS.OPERCONTACOES.QUANTIDADE'
    end
    object qryPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.PUOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.VLROPERACAO'
    end
    object qryDATAINIEXE: TDateTimeField
      FieldName = 'DATAINIEXE'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAINIEXE'
    end
    object qryDATAFIMEXE: TDateTimeField
      FieldName = 'DATAFIMEXE'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAFIMEXE'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAOPERACAO'
    end
    object qryDATAREGISTRO: TDateTimeField
      FieldName = 'DATAREGISTRO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAREGISTRO'
    end
    object qryOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERCONTACOES.CODDOCUMENTO'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLANO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLNCODIGO'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERCONTACOES.IDPLANPREVCTBPATR'
    end
    object qryPERCPROVPERDA: TFloatField
      FieldName = 'PERCPROVPERDA'
      Origin = 'BASEDADOS.OPERCONTACOES.PERCPROVPERDA'
    end
    object qryIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOESAP'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 118
    Top = 255
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDOSCONTACOES'
      'set'
      '  DATASLDCONTACOES = :DATASLDCONTACOES,'
      '  QTDSLDCONTACOES = :QTDSLDCONTACOES,'
      '  VLRSLDCONTACOES = :VLRSLDCONTACOES,'
      '  PUSLDCONTACOES = :PUSLDCONTACOES,'
      '  TIPOSALDO = :TIPOSALDO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDOPERCONTACOES = :IDOPERCONTACOES,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  FLGREPROC = :FLGREPROC'
      'where'
      '  IDSALDOSCONTACOES = :OLD_IDSALDOSCONTACOES')
    InsertSQL.Strings = (
      'insert into SALDOSCONTACOES'
      '  (DATASLDCONTACOES, QTDSLDCONTACOES, VLRSLDCONTACOES, '
      'PUSLDCONTACOES, '
      '   TIPOSALDO, OBSERVACAO, IDSALDOSCONTACOES, IDOPERCONTACOES, '
      'IDOPERCONTACOESAP, IDPLANPREVCTBPATR, '
      '   FLGREPROC)'
      'values'
      '  (:DATASLDCONTACOES, :QTDSLDCONTACOES, :VLRSLDCONTACOES, '
      ':PUSLDCONTACOES, '
      
        '   :TIPOSALDO, :OBSERVACAO, :IDSALDOSCONTACOES, :IDOPERCONTACOES' +
        ', '
      ':IDOPERCONTACOESAP, :IDPLANPREVCTBPATR, '
      '   :FLGREPROC)')
    DeleteSQL.Strings = (
      'delete from SALDOSCONTACOES'
      'where'
      '  IDSALDOSCONTACOES = :OLD_IDSALDOSCONTACOES')
    Left = 183
    Top = 255
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT SR.DATASLDCONTACOES, SR.QTDSLDCONTACOES, SR.VLRSLDCONTACO' +
        'ES, SR.PUSLDCONTACOES, SR.TIPOSALDO,'
      
        '       SR.OBSERVACAO, SR.IDSALDOSCONTACOES, SR.IDOPERCONTACOES, ' +
        'SR.IDOPERCONTACOESAP, SR.IDPLANPREVCTBPATR,'
      '       NVL(SP.IDSALDOSCONTACOES,0) AS IDINC, SR.FLGREPROC'
      'FROM SALDOSCONTACOES SR,'
      '     (SELECT IDSALDOSCONTACOES, DATASLDCONTACOES'
      '      FROM SALDOSCONTACOES'
      '      WHERE TIPOSALDO = '#39'P'#39
      '        AND IDOPERCONTACOESAP = :IDOPERCONTACOES) SP'
      'WHERE SR.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND SR.TIPOSALDO = '#39'R'#39
      '  AND SR.DATASLDCONTACOES = SP.DATASLDCONTACOES(+)'
      'ORDER BY DATASLDCONTACOES DESC'
      ' '
      ' '
      ' ')
    Left = 211
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '9'
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end>
    object qryDetalheDATASLDCONTACOES: TDateTimeField
      DisplayLabel = 'Data Atualização'
      DisplayWidth = 14
      FieldName = 'DATASLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.DATASLDCONTACOES'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetalheQTDSLDCONTACOES: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTDSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.QTDSLDCONTACOES'
      DisplayFormat = '###,###,###,##0'
    end
    object qryDetalhePUSLDCONTACOES: TFloatField
      DisplayLabel = 'PU do Saldo a Receber'
      DisplayWidth = 20
      FieldName = 'PUSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.PUSLDCONTACOES'
      DisplayFormat = '###,###,###,##0.0000000000'
    end
    object qryDetalheVLRSLDCONTACOES: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VLRSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.VLRSLDCONTACOES'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetalheOBSERVACAO: TMemoField
      DisplayLabel = 'Observação'
      DisplayWidth = 200
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.SALDOSCONTACOES.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryDetalheTIPOSALDO: TStringField
      FieldName = 'TIPOSALDO'
      Origin = 'BASEDADOS.SALDOSCONTACOES.TIPOSALDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDSALDOSCONTACOES: TFloatField
      FieldName = 'IDSALDOSCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDSALDOSCONTACOES'
      Visible = False
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetalheIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDOPERCONTACOES'
      Visible = False
    end
    object qryDetalheIDINC: TFloatField
      FieldName = 'IDINC'
      Visible = False
    end
    object qryDetalheFLGREPROC: TStringField
      FieldName = 'FLGREPROC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
      Visible = False
    end
  end
  object dsSldPagar: TwwDataSource
    AutoEdit = False
    DataSet = qrySldPagar
    OnStateChange = dsDetStateChange
    Left = 251
    Top = 255
  end
  object updSldPagar: TUpdateSQL
    ModifySQL.Strings = (
      'update SALDOSCONTACOES'
      'set'
      '  DATASLDCONTACOES = :DATASLDCONTACOES,'
      '  QTDSLDCONTACOES = :QTDSLDCONTACOES,'
      '  VLRSLDCONTACOES = :VLRSLDCONTACOES,'
      '  PUSLDCONTACOES = :PUSLDCONTACOES,'
      '  TIPOSALDO = :TIPOSALDO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDOPERCONTACOES = :IDOPERCONTACOES,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  FLGREPROC = :FLGREPROC'
      'where'
      '  IDSALDOSCONTACOES = :OLD_IDSALDOSCONTACOES')
    InsertSQL.Strings = (
      'insert into SALDOSCONTACOES'
      '  (DATASLDCONTACOES, QTDSLDCONTACOES, VLRSLDCONTACOES, '
      'PUSLDCONTACOES, '
      '   TIPOSALDO, OBSERVACAO, IDSALDOSCONTACOES, IDOPERCONTACOES, '
      'IDOPERCONTACOESAP, IDPLANPREVCTBPATR, '
      '   FLGREPROC)'
      'values'
      '  (:DATASLDCONTACOES, :QTDSLDCONTACOES, :VLRSLDCONTACOES, '
      ':PUSLDCONTACOES, '
      
        '   :TIPOSALDO, :OBSERVACAO, :IDSALDOSCONTACOES, :IDOPERCONTACOES' +
        ', '
      ':IDOPERCONTACOESAP, :IDPLANPREVCTBPATR, '
      '   :FLGREPROC)')
    DeleteSQL.Strings = (
      'delete from SALDOSCONTACOES'
      'where'
      '  IDSALDOSCONTACOES = :OLD_IDSALDOSCONTACOES')
    Left = 279
    Top = 255
  end
  object qrySldPagar: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SP.DATASLDCONTACOES, SP.QTDSLDCONTACOES, SP.VLRSLDCONTACO' +
        'ES, SP.PUSLDCONTACOES, SP.TIPOSALDO,'
      
        '       SP.OBSERVACAO, SP.IDSALDOSCONTACOES, SP.IDOPERCONTACOES, ' +
        'SP.IDOPERCONTACOESAP, SP.IDPLANPREVCTBPATR,'
      '       NVL(SR.IDSALDOSCONTACOES,0) AS IDINC, SP.FLGREPROC'
      'FROM SALDOSCONTACOES SP,'
      '     (SELECT IDSALDOSCONTACOES, DATASLDCONTACOES'
      '      FROM SALDOSCONTACOES'
      '      WHERE TIPOSALDO = '#39'R'#39
      '        AND IDOPERCONTACOESAP = :IDOPERCONTACOES) SR'
      'WHERE SP.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND SP.TIPOSALDO = '#39'P'#39
      '  AND SP.DATASLDCONTACOES = SR.DATASLDCONTACOES(+)'
      'ORDER BY SP.DATASLDCONTACOES DESC'
      ' ')
    UpdateObject = updSldPagar
    ValidateWithMask = True
    Left = 307
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '9'
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end>
    object qrySldPagarDATASLDCONTACOES: TDateTimeField
      DisplayLabel = 'Data Atualização'
      DisplayWidth = 14
      FieldName = 'DATASLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.DATASLDCONTACOES'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrySldPagarQTDSLDCONTACOES: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 13
      FieldName = 'QTDSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.QTDSLDCONTACOES'
      DisplayFormat = '###,###,###,##0'
    end
    object qrySldPagarPUSLDCONTACOES: TFloatField
      DisplayLabel = 'PU do Saldo a Pagar'
      DisplayWidth = 19
      FieldName = 'PUSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.PUSLDCONTACOES'
      DisplayFormat = '###,###,###,##0.0000000000'
    end
    object qrySldPagarVLRSLDCONTACOES: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VLRSLDCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.VLRSLDCONTACOES'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldPagarOBSERVACAO: TMemoField
      DisplayLabel = 'Observação'
      DisplayWidth = 19
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.SALDOSCONTACOES.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qrySldPagarTIPOSALDO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOSALDO'
      Origin = 'BASEDADOS.SALDOSCONTACOES.TIPOSALDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySldPagarIDSALDOSCONTACOES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSALDOSCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDSALDOSCONTACOES'
      Visible = False
    end
    object qrySldPagarIDOPERCONTACOES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDOPERCONTACOES'
      Visible = False
    end
    object qrySldPagarIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.SALDOSCONTACOES.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qrySldPagarIDINC: TFloatField
      FieldName = 'IDINC'
      Visible = False
    end
    object qrySldPagarFLGREPROC: TStringField
      FieldName = 'FLGREPROC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySldPagarIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
      Visible = False
    end
  end
  object dsSldLiq: TwwDataSource
    AutoEdit = False
    DataSet = qrySldLiq
    OnStateChange = dsDetStateChange
    Left = 347
    Top = 255
  end
  object updSldLiq: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCONTACOES'
      'set'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDOPERCONTACOES = :IDOPERCONTACOES,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  DATAHISTCONTACOES = :DATAHISTCONTACOES,'
      '  VLRMOVCONTACOES = :VLRMOVCONTACOES,'
      '  SLDVLRCONTACOES = :SLDVLRCONTACOES,'
      '  QTDMOVCONTACOES = :QTDMOVCONTACOES,'
      '  SLDQTDCONTACOES = :SLDQTDCONTACOES,'
      '  HISTMOVCONTACOES = :HISTMOVCONTACOES,'
      '  VLRPROVPERDA = :VLRPROVPERDA,'
      '  SLDPROVPERDA = :SLDPROVPERDA,'
      '  FLGREPROC = :FLGREPROC'
      'where'
      '  IDHISTCONTACOES = :OLD_IDHISTCONTACOES')
    InsertSQL.Strings = (
      'insert into HISTCONTACOES'
      '  (IDHISTCONTACOES, IDPLANPREVCTBPATR, PLANO, PLNCODIGO, '
      'IDTIPOINVEST, '
      '   IDTIPOOPERACAO, IDOPERCONTACOES, '
      'IDOPERCONTACOESAP, DATAHISTCONTACOES, VLRMOVCONTACOES, '
      '   SLDVLRCONTACOES, QTDMOVCONTACOES, SLDQTDCONTACOES, '
      'HISTMOVCONTACOES, '
      '   VLRPROVPERDA, SLDPROVPERDA, FLGREPROC)'
      'values'
      '  (:IDHISTCONTACOES, :IDPLANPREVCTBPATR, :PLANO, :PLNCODIGO, '
      ':IDTIPOINVEST, '
      '   :IDTIPOOPERACAO, :IDOPERCONTACOES, '
      ':IDOPERCONTACOESAP, :DATAHISTCONTACOES, :VLRMOVCONTACOES, '
      '   :SLDVLRCONTACOES, :QTDMOVCONTACOES, :SLDQTDCONTACOES, '
      ':HISTMOVCONTACOES, '
      '   :VLRPROVPERDA, :SLDPROVPERDA, :FLGREPROC)')
    DeleteSQL.Strings = (
      'delete from HISTCONTACOES'
      'where'
      '  IDHISTCONTACOES = :OLD_IDHISTCONTACOES')
    Left = 375
    Top = 255
  end
  object qrySldLiq: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.IDHISTCONTACOES, H.IDPLANPREVCTBPATR, H.PLANO, H.PLNCOD' +
        'IGO, H.IDTIPOINVEST,'
      
        '       H.IDTIPOOPERACAO, H.IDOPERCONTACOES, H.IDOPERCONTACOESAP,' +
        ' H.DATAHISTCONTACOES, H.VLRMOVCONTACOES,'
      
        '       H.SLDVLRCONTACOES, H.QTDMOVCONTACOES, H.SLDQTDCONTACOES, ' +
        'H.HISTMOVCONTACOES,'
      '       H.VLRPROVPERDA, H.SLDPROVPERDA, H.FLGREPROC,'
      '       DECODE(NVL(SR.IDSALDOSCONTACOES,0),0, 0,'
      
        '              DECODE(NVL(SP.IDSALDOSCONTACOES,0),0, 0, 1)) AS ID' +
        'INC'
      ''
      'FROM HISTCONTACOES H,'
      '     (SELECT IDSALDOSCONTACOES, DATASLDCONTACOES'
      '      FROM SALDOSCONTACOES'
      '      WHERE TIPOSALDO = '#39'R'#39
      '        AND IDOPERCONTACOESAP = :IDOPERCONTACOES) SR,'
      '     (SELECT IDSALDOSCONTACOES, DATASLDCONTACOES'
      '      FROM SALDOSCONTACOES'
      '      WHERE TIPOSALDO = '#39'P'#39
      '        AND IDOPERCONTACOESAP = :IDOPERCONTACOES) SP'
      'WHERE H.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND H.DATAHISTCONTACOES = SR.DATASLDCONTACOES(+)'
      '  AND H.DATAHISTCONTACOES = SP.DATASLDCONTACOES(+)'
      'ORDER BY DATAHISTCONTACOES DESC'
      ''
      ''
      ''
      ' ')
    UpdateObject = updSldLiq
    ValidateWithMask = True
    Left = 403
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '9'
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end>
    object qrySldLiqDATAHISTCONTACOES: TDateTimeField
      DisplayLabel = 'Data do Saldo'
      DisplayWidth = 14
      FieldName = 'DATAHISTCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.DATAHISTCONTACOES'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrySldLiqVLRMOVCONTACOES: TFloatField
      DisplayLabel = 'Variação'
      DisplayWidth = 13
      FieldName = 'VLRMOVCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.VLRMOVCONTACOES'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldLiqSLDVLRCONTACOES: TFloatField
      DisplayLabel = 'Saldo do Contrato'
      DisplayWidth = 17
      FieldName = 'SLDVLRCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.SLDVLRCONTACOES'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldLiqVLRPROVPERDA: TFloatField
      DisplayLabel = 'Variação da Provisão de Perda'
      DisplayWidth = 22
      FieldName = 'VLRPROVPERDA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldLiqSLDPROVPERDA: TFloatField
      DisplayLabel = 'Saldo de Provisão de Perda'
      DisplayWidth = 22
      FieldName = 'SLDPROVPERDA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qrySldLiqQTDMOVCONTACOES: TFloatField
      DisplayLabel = 'Quantidade Movimentada'
      DisplayWidth = 20
      FieldName = 'QTDMOVCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.QTDMOVCONTACOES'
      Visible = False
      DisplayFormat = '###,###,###,##0'
    end
    object qrySldLiqSLDQTDCONTACOES: TFloatField
      DisplayLabel = 'Saldo de Quantidade'
      DisplayWidth = 17
      FieldName = 'SLDQTDCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.SLDQTDCONTACOES'
      Visible = False
      DisplayFormat = '###,###,###,##0'
    end
    object qrySldLiqIDHISTCONTACOES: TFloatField
      FieldName = 'IDHISTCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.IDHISTCONTACOES'
      Visible = False
    end
    object qrySldLiqIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTCONTACOES.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qrySldLiqPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.HISTCONTACOES.PLANO'
      Visible = False
    end
    object qrySldLiqPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTCONTACOES.PLNCODIGO'
      Visible = False
    end
    object qrySldLiqIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.HISTCONTACOES.IDTIPOINVEST'
      Visible = False
    end
    object qrySldLiqIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.HISTCONTACOES.IDTIPOOPERACAO'
      Visible = False
    end
    object qrySldLiqIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.IDOPERCONTACOES'
      Visible = False
    end
    object qrySldLiqHISTMOVCONTACOES: TStringField
      FieldName = 'HISTMOVCONTACOES'
      Origin = 'BASEDADOS.HISTCONTACOES.HISTMOVCONTACOES'
      Visible = False
      Size = 100
    end
    object qrySldLiqFLGREPROC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGREPROC'
      Origin = 'BASEDADOS.HISTCONTACOES.FLGREPROC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qrySldLiqIDINC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINC'
      Visible = False
    end
    object qrySldLiqIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
      Visible = False
    end
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
    Left = 728
    Top = 107
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
      'FROM TIPOOPERACAO T'
      'WHERE (T.IDTIPOOPERACAO IN (-128,-129,-130,-131))'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 361
    Top = 107
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
  end
  object qryInvestimentoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '    I.IDINVESTIMENTO, I.DESCINVESTIMENTO,'
      '    I.IDTIPOINVEST, I.IDEMISSOR, I.IDMOEDACONTAB,'
      '    A.DATACOTAACAO,'
      
        '    DECODE(A.DATACOTAACAO,NULL,B.QTDELOTE,A.QTDELOTE) AS QTDTITL' +
        'OTE'
      ''
      'FROM  INVESTIMENTO I,'
      '      (SELECT C.IDACAO, C.QTDELOTE,C.DATACOTAACAO'
      '       FROM COTACAOACAO C'
      '       WHERE ((C.IDACAO||C.DATACOTAACAO) IN'
      '                       (SELECT C1.IDACAO||MAX(C1.DATACOTAACAO)'
      '                        FROM COTACAOACAO C1'
      
        '                        WHERE ((:IDEMISSOR IS NULL) OR (C1.IDEMI' +
        'SSOR = :IDEMISSOR))'
      
        '                          AND ((:DATACOTACAO  IS NULL) OR (C1.DA' +
        'TACOTAACAO<= TO_DATE(:DATACOTACAO,'#39'DD/MM/YYYY'#39')))'
      '                        GROUP BY C1.IDACAO))) A,'
      '      (SELECT AC.IDACAO, AC.QTDELOTE, AC.TRGDTINCLUSAO'
      '       FROM ACOESXBOLSA AC'
      
        '       WHERE ((:IDEMISSOR IS NULL) OR (AC.IDEMISSOR = :IDEMISSOR' +
        '))'
      
        '          AND AC.IDBOLSAVALORES IN (SELECT IDBVSP FROM PARAMINVE' +
        'ST)) B'
      ''
      'WHERE (I.IDTIPOINVEST = 2)'
      '  AND ((:IDEMISSOR IS NULL) OR (I.IDEMISSOR = :IDEMISSOR))'
      '  AND (I.IDINVESTIMENTO = A.IDACAO(+))'
      '  AND (I.IDINVESTIMENTO = B.IDACAO(+))'
      '  AND (NOT EXISTS (SELECT OPCI.IDINVESTIMENTO'
      '                   FROM OPCOES OPCI'
      
        '                   WHERE OPCI.IDINVESTIMENTO = I.IDINVESTIMENTO)' +
        ')'
      'ORDER BY I.DESCINVESTIMENTO'
      ''
      '')
    ValidateWithMask = True
    Left = 361
    Top = 154
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
      end
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
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
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
  object dsLiqSemAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryLiqSemAcoes
    OnStateChange = dsDetStateChange
    Left = 443
    Top = 255
  end
  object updLiqSemAcoes: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERCONTACOES'
      'set'
      '  IDBOLETA = :IDBOLETA,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRLUCPREJ = :VLRLUCPREJ,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PUOPERACAO = :PUOPERACAO'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    InsertSQL.Strings = (
      'insert into OPERCONTACOES'
      
        '  (IDBOLETA, DATAOPERACAO, DATALIQUIDACAO, QUANTIDADE, VLROPERAC' +
        'AO, VLRLUCPREJ, '
      
        '   CODDOCUMENTO, PLANO, PLNCODIGO, IDTIPOOPERACAO, IDTIPOINVEST,' +
        ' IDEMISSOR, '
      
        '   IDINVESTIMENTO, IDOPERCONTACOES, IDOPERCONTACOESAP, IDPLANPRE' +
        'VCTBPATR, '
      '   OBSERVACAO, PUOPERACAO)'
      'values'
      
        '  (:IDBOLETA, :DATAOPERACAO, :DATALIQUIDACAO, :QUANTIDADE, :VLRO' +
        'PERACAO, '
      
        '   :VLRLUCPREJ, :CODDOCUMENTO, :PLANO, :PLNCODIGO, :IDTIPOOPERAC' +
        'AO, :IDTIPOINVEST, '
      
        '   :IDEMISSOR, :IDINVESTIMENTO, :IDOPERCONTACOES, :IDOPERCONTACO' +
        'ESAP, :IDPLANPREVCTBPATR, '
      '   :OBSERVACAO, :PUOPERACAO)')
    DeleteSQL.Strings = (
      'delete from OPERCONTACOES'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    Left = 471
    Top = 255
  end
  object qryLiqSemAcoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDBOLETA, O.DATAOPERACAO, O.DATALIQUIDACAO, T.DESCTIPOO' +
        'PERACAO, O.QUANTIDADE, O.VLROPERACAO, O.VLRLUCPREJ,'
      
        '       O.CODDOCUMENTO, O.PLANO, O.PLNCODIGO, O.IDTIPOOPERACAO, O' +
        '.IDTIPOINVEST, O.IDEMISSOR, O.IDINVESTIMENTO,'
      
        '       O.IDOPERCONTACOES, O.IDOPERCONTACOESAP, O.IDPLANPREVCTBPA' +
        'TR, O.OBSERVACAO, O.PUOPERACAO'
      'FROM OPERCONTACOES O, TIPOOPERACAO T'
      'WHERE O.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND O.IDOPERCONTACOESAP <> O.IDOPERCONTACOES'
      '  AND O.IDTIPOOPERACAO NOT IN (-153,-154,-157)'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      'ORDER BY DATAOPERACAO'
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
      ' ')
    UpdateObject = updLiqSemAcoes
    ValidateWithMask = True
    Left = 499
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '10'
      end>
    object qryLiqSemAcoesDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAOPERACAO'
    end
    object qryLiqSemAcoesDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Data de Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATALIQUIDACAO'
    end
    object qryLiqSemAcoesDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLiqSemAcoesQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS.OPERCONTACOES.QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryLiqSemAcoesVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.VLROPERACAO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryLiqSemAcoesVLRLUCPREJ: TFloatField
      DisplayLabel = 'Lucro / Prejuízo'
      DisplayWidth = 10
      FieldName = 'VLRLUCPREJ'
      Origin = 'BASEDADOS.OPERCONTACOES.VLRLUCPREJ'
      Visible = False
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryLiqSemAcoesIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 10
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERCONTACOES.IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryLiqSemAcoesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERCONTACOES.CODDOCUMENTO'
      Visible = False
    end
    object qryLiqSemAcoesPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLANO'
      Visible = False
    end
    object qryLiqSemAcoesPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLNCODIGO'
      Visible = False
    end
    object qryLiqSemAcoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLiqSemAcoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOINVEST'
      Visible = False
    end
    object qryLiqSemAcoesIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOES'
      Visible = False
    end
    object qryLiqSemAcoesIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOESAP'
      Visible = False
    end
    object qryLiqSemAcoesIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERCONTACOES.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryLiqSemAcoesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryLiqSemAcoesIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDEMISSOR'
      Visible = False
    end
    object qryLiqSemAcoesIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDINVESTIMENTO'
      Visible = False
    end
    object qryLiqSemAcoesPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".PUOPERACAO'
      Visible = False
    end
  end
  object qryTpOperLiqSemAcoes: TwwQuery
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
      'FROM TIPOOPERACAO T'
      'WHERE (T.IDTIPOOPERACAO IN (-151,-152))'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 301
    Top = 455
    object qryTpOperLiqSemAcoesFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTpOperLiqSemAcoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTpOperLiqSemAcoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryTpOperLiqSemAcoesFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object qryTpOperLiqSemAcoesFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object qryTpOperLiqSemAcoesRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqSemAcoesVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryTpOperLiqSemAcoesFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object qryTpOperLiqSemAcoesFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
    end
  end
  object cdsSaldoAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 638
    Top = 3
  end
  object dspSaldoAnt: TDataSetProvider
    Constraints = True
    Left = 666
    Top = 3
  end
  object ppmRelatorios: TPopupMenu
    Left = 328
    Top = 9
    object mnuSaldos: TMenuItem
      Caption = '&Saldos'
      OnClick = mnuSaldosClick
    end
    object mnuOperacoes: TMenuItem
      Caption = '&Operações'
      OnClick = mnuOperacoesClick
    end
  end
  object dsNaoExe: TwwDataSource
    AutoEdit = False
    DataSet = qryNaoExe
    OnStateChange = dsDetStateChange
    Left = 547
    Top = 255
  end
  object qryTpOperNaoExe: TwwQuery
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
      'FROM TIPOOPERACAO T'
      'WHERE T.IDTIPOOPERACAO = -157'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 405
    Top = 455
    object StringField3: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object StringField7: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object StringField12: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object StringField14: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object StringField15: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object StringField16: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object FloatField15: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object FloatField16: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object StringField17: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object StringField18: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object StringField19: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object FloatField17: TFloatField
      FieldName = 'IDMERCADO'
    end
    object StringField20: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object StringField21: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object StringField22: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object FloatField18: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object FloatField19: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object FloatField20: TFloatField
      FieldName = 'FLGGERACAPCAR'
    end
  end
  object updNaoExe: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERCONTACOES'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDBOLETA = :IDBOLETA,'
      '  PUOPERACAO = :PUOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  VLRLUCPREJ = :VLRLUCPREJ'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    InsertSQL.Strings = (
      'insert into OPERCONTACOES'
      '  (IDOPERCONTACOES, IDTIPOINVEST, IDTIPOOPERACAO, IDEMISSOR, '
      'IDINVESTIMENTO, '
      '   IDBOLETA, PUOPERACAO, VLROPERACAO, DATAOPERACAO, OBSERVACAO, '
      'CODDOCUMENTO, '
      '   PLANO, PLNCODIGO, IDPLANPREVCTBPATR, QUANTIDADE, '
      'IDOPERCONTACOESAP, '
      '   DATALIQUIDACAO, VLRLUCPREJ)'
      'values'
      
        '  (:IDOPERCONTACOES, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDEMISSOR,' +
        ' '
      ':IDINVESTIMENTO, '
      '   :IDBOLETA, :PUOPERACAO, :VLROPERACAO, :DATAOPERACAO, '
      ':OBSERVACAO, :CODDOCUMENTO, '
      '   :PLANO, :PLNCODIGO, :IDPLANPREVCTBPATR, :QUANTIDADE, '
      ':IDOPERCONTACOESAP, '
      '   :DATALIQUIDACAO, :VLRLUCPREJ)')
    DeleteSQL.Strings = (
      'delete from OPERCONTACOES'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    Left = 575
    Top = 255
  end
  object qryNaoExe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDBOLETA, O.DATAOPERACAO, O.DATALIQUIDACAO, T.DESCTIPOO' +
        'PERACAO, O.QUANTIDADE, O.VLROPERACAO, O.VLRLUCPREJ,'
      
        '       O.CODDOCUMENTO, O.PLANO, O.PLNCODIGO, O.IDTIPOOPERACAO, O' +
        '.IDTIPOINVEST, O.IDEMISSOR, O.IDINVESTIMENTO,'
      
        '       O.IDOPERCONTACOES, O.IDOPERCONTACOESAP, O.IDPLANPREVCTBPA' +
        'TR, O.OBSERVACAO, O.PUOPERACAO'
      'FROM OPERCONTACOES O, TIPOOPERACAO T'
      'WHERE O.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND O.IDTIPOOPERACAO = -157'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      'ORDER BY DATAOPERACAO')
    UpdateObject = updNaoExe
    ValidateWithMask = True
    Left = 603
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptInputOutput
      end>
    object qryNaoExeDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 15
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".DATAOPERACAO'
    end
    object qryNaoExeDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS."CM.TIPOOPERACAO".DESCTIPOOPERACAO'
      Size = 60
    end
    object qryNaoExeQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryNaoExeVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".VLROPERACAO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryNaoExeIDBOLETA: TStringField
      DisplayWidth = 30
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryNaoExeDATALIQUIDACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".DATALIQUIDACAO'
      Visible = False
    end
    object qryNaoExeVLRLUCPREJ: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLUCPREJ'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".VLRLUCPREJ'
      Visible = False
    end
    object qryNaoExeCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".CODDOCUMENTO'
      Visible = False
    end
    object qryNaoExePLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".PLANO'
      Visible = False
    end
    object qryNaoExePLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".PLNCODIGO'
      Visible = False
    end
    object qryNaoExeIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDTIPOOPERACAO'
      Visible = False
    end
    object qryNaoExeIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDTIPOINVEST'
      Visible = False
    end
    object qryNaoExeIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDEMISSOR'
      Visible = False
    end
    object qryNaoExeIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDINVESTIMENTO'
      Visible = False
    end
    object qryNaoExeIDOPERCONTACOES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDOPERCONTACOES'
      Visible = False
    end
    object qryNaoExeIDOPERCONTACOESAP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOESAP'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDOPERCONTACOESAP'
      Visible = False
    end
    object qryNaoExeIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryNaoExeOBSERVACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryNaoExePUOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS."CM.OPERCONTACOES".PUOPERACAO'
      Visible = False
    end
  end
  object qryTpOperLiqComAcoes: TwwQuery
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
      'FROM TIPOOPERACAO T'
      'WHERE (T.IDTIPOOPERACAO IN (-153,-154))'
      'ORDER BY DESCTIPOOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 533
    Top = 367
    object qryTpOperLiqComAcoesFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTpOperLiqComAcoesIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryTpOperLiqComAcoesIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryTpOperLiqComAcoesFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object qryTpOperLiqComAcoesFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object qryTpOperLiqComAcoesRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTpOperLiqComAcoesVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryTpOperLiqComAcoesFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object qryTpOperLiqComAcoesFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
    end
  end
  object dsLiqComAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryLiqComAcoes
    OnStateChange = dsDetStateChange
    Left = 427
    Top = 415
  end
  object updLiqComAcoes: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERCONTACOES'
      'set'
      '  IDBOLETA = :IDBOLETA,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  VLRLUCPREJ = :VLRLUCPREJ,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDOPERCONTACOESAP = :IDOPERCONTACOESAP,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  PUOPERACAO = :PUOPERACAO'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    InsertSQL.Strings = (
      'insert into OPERCONTACOES'
      
        '  (IDBOLETA, DATAOPERACAO, DATALIQUIDACAO, QUANTIDADE, VLROPERAC' +
        'AO, VLRLUCPREJ, '
      
        '   CODDOCUMENTO, PLANO, PLNCODIGO, IDTIPOOPERACAO, IDTIPOINVEST,' +
        ' IDEMISSOR, '
      
        '   IDINVESTIMENTO, IDOPERCONTACOES, IDOPERCONTACOESAP, IDPLANPRE' +
        'VCTBPATR, '
      '   OBSERVACAO, PUOPERACAO)'
      'values'
      
        '  (:IDBOLETA, :DATAOPERACAO, :DATALIQUIDACAO, :QUANTIDADE, :VLRO' +
        'PERACAO, '
      
        '   :VLRLUCPREJ, :CODDOCUMENTO, :PLANO, :PLNCODIGO, :IDTIPOOPERAC' +
        'AO, :IDTIPOINVEST, '
      
        '   :IDEMISSOR, :IDINVESTIMENTO, :IDOPERCONTACOES, :IDOPERCONTACO' +
        'ESAP, :IDPLANPREVCTBPATR, '
      '   :OBSERVACAO, :PUOPERACAO)')
    DeleteSQL.Strings = (
      'delete from OPERCONTACOES'
      'where'
      '  IDOPERCONTACOES = :OLD_IDOPERCONTACOES')
    Left = 455
    Top = 415
  end
  object qryLiqComAcoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.IDBOLETA, O.DATAOPERACAO, O.DATALIQUIDACAO, T.DESCTIPOO' +
        'PERACAO, O.QUANTIDADE, O.VLROPERACAO, O.VLRLUCPREJ,'
      
        '       O.CODDOCUMENTO, O.PLANO, O.PLNCODIGO, O.IDTIPOOPERACAO, O' +
        '.IDTIPOINVEST, O.IDEMISSOR, O.IDINVESTIMENTO,'
      
        '       O.IDOPERCONTACOES, O.IDOPERCONTACOESAP, O.IDPLANPREVCTBPA' +
        'TR, O.OBSERVACAO, O.PUOPERACAO'
      'FROM OPERCONTACOES O, TIPOOPERACAO T'
      'WHERE O.IDOPERCONTACOESAP = :IDOPERCONTACOES'
      '  AND O.IDOPERCONTACOESAP <> O.IDOPERCONTACOES'
      '  AND O.IDTIPOOPERACAO NOT IN (-151,-152,-157)'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      'ORDER BY DATAOPERACAO'
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
      ' ')
    UpdateObject = updLiqComAcoes
    ValidateWithMask = True
    Left = 483
    Top = 415
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
        Value = '10'
      end>
    object qryLiqComAcoesDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATAOPERACAO'
    end
    object qryLiqComAcoesDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Data de Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.DATALIQUIDACAO'
    end
    object qryLiqComAcoesDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryLiqComAcoesQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 20
      FieldName = 'QUANTIDADE'
      Origin = 'BASEDADOS.OPERCONTACOES.QUANTIDADE'
      DisplayFormat = '#,##0'
    end
    object qryLiqComAcoesVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.VLROPERACAO'
      DisplayFormat = '#,##0.00'
    end
    object qryLiqComAcoesIDBOLETA: TStringField
      DisplayWidth = 30
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERCONTACOES.IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryLiqComAcoesVLRLUCPREJ: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLUCPREJ'
      Origin = 'BASEDADOS.OPERCONTACOES.VLRLUCPREJ'
      Visible = False
    end
    object qryLiqComAcoesCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERCONTACOES.CODDOCUMENTO'
      Visible = False
    end
    object qryLiqComAcoesPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLANO'
      Visible = False
    end
    object qryLiqComAcoesPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERCONTACOES.PLNCODIGO'
      Visible = False
    end
    object qryLiqComAcoesIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOOPERACAO'
      Visible = False
    end
    object qryLiqComAcoesIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERCONTACOES.IDTIPOINVEST'
      Visible = False
    end
    object qryLiqComAcoesIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.OPERCONTACOES.IDEMISSOR'
      Visible = False
    end
    object qryLiqComAcoesIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERCONTACOES.IDINVESTIMENTO'
      Visible = False
    end
    object qryLiqComAcoesIDOPERCONTACOES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOES'
      Visible = False
    end
    object qryLiqComAcoesIDOPERCONTACOESAP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERCONTACOESAP'
      Origin = 'BASEDADOS.OPERCONTACOES.IDOPERCONTACOESAP'
      Visible = False
    end
    object qryLiqComAcoesIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERCONTACOES.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryLiqComAcoesOBSERVACAO: TMemoField
      DisplayWidth = 10
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 500
    end
    object qryLiqComAcoesPUOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS.OPERCONTACOES.PUOPERACAO'
      Visible = False
    end
  end
  object cdsCustodia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 526
    Top = 63
    object cdsCustodiaSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Size = 10
    end
    object cdsCustodiaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object cdsCustodiaFLGCODATIVOCUST: TStringField
      FieldName = 'FLGCODATIVOCUST'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsOperRV: TwwDataSource
    AutoEdit = False
    DataSet = qryOperRV
    OnStateChange = dsDetStateChange
    Left = 291
    Top = 399
  end
  object updOperRV: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDOPERCONTACOES = :IDOPERCONTACOES'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (IDOPERACAOINVEST, IDCUSTODIANTE, IDCORRETVALORES, MOECODIGO, '
      'IDMODULO, '
      '   EMPRESAPROP, IDCARTEIRAINVEST, IDINVESTIMENTO, IDTIPOINVEST, '
      'IDTIPOOPERACAO, '
      '   DATAOPERACAO, NUMDOCUMENTO, QTDEOPERACAO, '
      'PRECOUNITOPERACAO, VLROPERACAO, '
      '   DATAVENCOPER, OBSERVACAO, FLGSTATUSFECHBOL, '
      'FLGSTATUSORDMOV, IDPLANPREVCTBPATR, '
      '   IDCARTEIRAGERENC, IDOPERCONTACOES)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCORRETVALORES, '
      ':MOECODIGO, :IDMODULO, '
      
        '   :EMPRESAPROP, :IDCARTEIRAINVEST, :IDINVESTIMENTO, :IDTIPOINVE' +
        'ST, '
      ':IDTIPOOPERACAO, '
      '   :DATAOPERACAO, :NUMDOCUMENTO, :QTDEOPERACAO, '
      ':PRECOUNITOPERACAO, :VLROPERACAO, '
      '   :DATAVENCOPER, :OBSERVACAO, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, :IDPLANPREVCTBPATR, '
      '   :IDCARTEIRAGERENC, :IDOPERCONTACOES)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 319
    Top = 399
  end
  object qryOperRV: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERACAOINVEST, OP.IDCUSTODIANTE, OP.IDCORRETVALORES, OP' +
        '.MOECODIGO, OP.IDMODULO,'
      
        '   OP.EMPRESAPROP, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.ID' +
        'TIPOINVEST, OP.IDTIPOOPERACAO,'
      
        '   OP.DATAOPERACAO, OP.NUMDOCUMENTO, OP.QTDEOPERACAO, OP.PRECOUN' +
        'ITOPERACAO, OP.VLROPERACAO,'
      
        '   OP.DATAVENCOPER, OP.OBSERVACAO, OP.FLGSTATUSFECHBOL, OP.FLGST' +
        'ATUSORDMOV,'
      
        '   OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAGERENC, OP.IDOPERCONTACOES' +
        ','
      '   TP.DESCTIPOOPERACAO, IV.DESCINVESTIMENTO,'
      '   0 AS SALDOQTDE'
      'FROM'
      '   OPERACAOINVEST OP, TIPOOPERACAO TP, INVESTIMENTO IV'
      'WHERE '
      '   (OP.IDTIPOOPERACAO IN (-164,-10164))'
      
        '   AND (:IDOPERCONTACOES IS NULL) OR (OP.IDOPERCONTACOES = :IDOP' +
        'ERCONTACOES)'
      '   AND (OP.IDCARTEIRAGERENC IS NULL)'
      '   AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      '   AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      'ORDER BY OP.IDOPERACAOINVEST'
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
    UpdateObject = updOperRV
    ValidateWithMask = True
    Left = 347
    Top = 399
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptUnknown
      end>
    object qryOperRVQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.QTDEOPERACAO'
      DisplayFormat = '#,##0'
    end
    object qryOperRVDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 35
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryOperRVDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 35
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperRVDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
      Visible = False
    end
    object qryOperRVIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERACAOINVEST'
      Visible = False
    end
    object qryOperRVIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
      Visible = False
    end
    object qryOperRVIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCORRETVALORES'
      Visible = False
    end
    object qryOperRVVLROPERACAO: TFloatField
      DisplayWidth = 20
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.VLROPERACAO'
      Visible = False
    end
    object qryOperRVMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.OPERACAOINVEST.MOECODIGO'
      Visible = False
    end
    object qryOperRVIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDMODULO'
      Visible = False
    end
    object qryOperRVEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Origin = 'BASEDADOS.OPERACAOINVEST.EMPRESAPROP'
      Visible = False
    end
    object qryOperRVIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryOperRVIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
      Visible = False
    end
    object qryOperRVIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryOperRVIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOOPERACAO'
      Visible = False
    end
    object qryOperRVNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object qryOperRVPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.PRECOUNITOPERACAO'
      Visible = False
    end
    object qryOperRVDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAVENCOPER'
      Visible = False
    end
    object qryOperRVOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.OBSERVACAO'
      Visible = False
      Size = 200
    end
    object qryOperRVFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      Origin = 'BASEDADOS.OPERACAOINVEST.FLGSTATUSFECHBOL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperRVFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      Origin = 'BASEDADOS.OPERACAOINVEST.FLGSTATUSORDMOV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryOperRVIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryOperRVIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAGERENC'
      Visible = False
    end
    object qryOperRVIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDOPERCONTACOES'
      Visible = False
    end
    object qryOperRVSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
  end
  object qryTipoOperRV: TwwQuery
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
        'LGGERACAPCAR,'
      '       T.FLGCONTAINVEST'
      'FROM TIPOOPERACAO T'
      'WHERE T.IDTIPOOPERACAO IN (-164, -10164)'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 367
    object StringField34: TStringField
      DisplayWidth = 70
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object StringField1: TStringField
      DisplayWidth = 1
      FieldName = 'FLGAGE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField2: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATAEX'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField23: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDATACOM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField24: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZBOLSA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField25: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPRZEMP'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField26: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATADEC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField27: TStringField
      DisplayWidth = 1
      FieldName = 'FLGFORMAPAGREC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField28: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIVACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField29: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINIPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField30: TStringField
      DisplayWidth = 1
      FieldName = 'FLGJUROS'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField31: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPARIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField32: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINVORIGEM'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField33: TStringField
      DisplayWidth = 1
      FieldName = 'FLGPERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object StringField35: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRAVAIRLITIGIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField36: TStringField
      DisplayWidth = 1
      FieldName = 'FLGISENTOIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField37: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
    object StringField38: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField39: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Visible = False
      Size = 2
    end
    object StringField40: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'VENCIMENTO'
      Visible = False
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperRVFLGCONTAINVEST: TFloatField
      DisplayLabel = 'Operação'
      DisplayWidth = 50
      FieldName = 'FLGCONTAINVEST'
      Visible = False
    end
  end
  object qryPlanoPatro: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPLANPREVCTBPATR, IDPLANOPREV, IDPATRO, PLANPRVCONTABPAT' +
        'RO'
      'FROM VWPLANPREVCTBPATR'
      'ORDER BY PLANPRVCONTABPATRO')
    ValidateWithMask = True
    Left = 729
    Top = 147
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.VWPLANPREVCTBPATR.IDPATRO'
      Visible = False
    end
  end
  object qryCarteiraOperRV: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   VWCARTEIRASRV'
      'WHERE'
      '   ((IDMERCADO NOT IN (3,5)) OR (IDMERCADO IS NULL))'
      '   AND (IDCARTEIRAGERENC IS NULL)'
      'ORDER BY DESCCARTINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 205
    Top = 367
    object qryCarteiraOperRVDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraOperRVIDCARTEIRA: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object qryCarteiraOperRVIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraOperRVIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object qryCarteiraOperRVIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryCarteiraOperRVIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
  end
  object qryCustodiante: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCUSTODIANTE, SGLCUSTODIANTE'
      'FROM CUSTODIANTE'
      'ORDER BY SGLCUSTODIANTE'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 205
    Top = 423
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 30
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryCarteiras: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   *'
      'FROM'
      '   VWCARTEIRASRV'
      'WHERE'
      '   ((IDMERCADO NOT IN (3,5)) OR (IDMERCADO IS NULL))'
      'ORDER BY IDCARTEIRA'
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 367
    object StringField41: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 30
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object StringField42: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Visible = False
      Size = 4
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
    object FloatField9: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object FloatField10: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Visible = False
    end
  end
  object qryMarcadoReproc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IDHISTCARTINV'
      'FROM HISTCARTINV'
      'WHERE'
      '    IDINVESTIMENTO = :IDINVESTIMENTO'
      '    AND IDCARTEIRAINVEST = :IDCARTEIRAINVEST'
      '    AND DATAMOVCARTINV <= TO_DATE(:DDATAREF,'#39'DD/MM/YYYY'#39')'
      '    AND FLGCALCSALDO IS NOT NULL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 133
    Top = 423
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
      end
      item
        DataType = ftString
        Name = 'DDATAREF'
        ParamType = ptUnknown
      end>
  end
end
