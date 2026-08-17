inherited frmExecLancMultDespAltMT: TfrmExecLancMultDespAltMT
  Left = 304
  Top = 147
  HelpContext = 640019
  Caption = 'Alteração de Lançamentos de Despesas'
  ClientHeight = 430
  ClientWidth = 747
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 747
    Height = 391
    inherited PagControle: TPageControl
      Width = 745
      Height = 389
      ActivePage = TabSheet2
      MultiLine = True
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 737
          Caption = 'Alteração de Lançamentos [ seleção ]'
        end
        object panLancamentos: TPanel
          Left = 0
          Top = 24
          Width = 737
          Height = 355
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object Label22: TLabel
            Left = 16
            Top = 9
            Width = 97
            Height = 13
            Caption = 'Tipo de Despesa'
          end
          object Label10: TLabel
            Left = 16
            Top = 89
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object lblContaBancaria: TLabel
            Left = 392
            Top = 89
            Width = 88
            Height = 13
            Caption = 'Conta Bancária'
            Enabled = False
          end
          object Label5: TLabel
            Left = 628
            Top = 49
            Width = 83
            Height = 13
            Caption = 'Nº Documento'
          end
          object Label7: TLabel
            Left = 360
            Top = 228
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object lblReferenciaAP: TLabel
            Left = 16
            Top = 269
            Width = 129
            Height = 13
            Caption = 'Referência / Processo'
          end
          object lblCentroCusto: TLabel
            Left = 16
            Top = 310
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object lblIntegrado: TLabel
            Left = 511
            Top = 15
            Width = 96
            Height = 24
            Alignment = taRightJustify
            Caption = 'Integrado'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -21
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label1: TLabel
            Left = 524
            Top = 49
            Width = 53
            Height = 13
            Caption = 'Nº da AP'
          end
          object Label30: TLabel
            Left = 360
            Top = 189
            Width = 142
            Height = 13
            Caption = 'Histórico de Lançamento'
          end
          inline molFornecedor1: TmolFornecedor
            Left = 8
            Top = 47
            Width = 513
            TabOrder = 1
            inherited btnBuscaForn: TBitBtn
              Left = 456
              OnClick = molFornecedor1btnBuscaFornClick
            end
            inherited btnLimpaForn: TBitBtn
              Left = 480
            end
            inherited edtRazaoSocial: TEdit
              Width = 289
            end
          end
          object GroupBox1: TGroupBox
            Left = 16
            Top = 127
            Width = 705
            Height = 54
            TabOrder = 5
            object Label3: TLabel
              Left = 360
              Top = 11
              Width = 101
              Height = 13
              Caption = 'Data Lançamento'
            end
            object lblDataVencimento: TLabel
              Left = 240
              Top = 11
              Width = 98
              Height = 13
              Caption = 'Data Vencimento'
            end
            object Label15: TLabel
              Left = 16
              Top = 11
              Width = 135
              Height = 13
              Caption = 'Competência (mês/ano)'
            end
            object Label2: TLabel
              Left = 536
              Top = 11
              Width = 63
              Height = 13
              Caption = 'Valor Total'
            end
            object edtDataLanc: TCMDateTimePicker
              Left = 360
              Top = 25
              Width = 105
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
              TabOrder = 3
              OnChange = edtDataLancChange
            end
            object edtDataVenc: TCMDateTimePicker
              Left = 240
              Top = 25
              Width = 105
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
              TabOrder = 2
            end
            object DBspnAno: TwwDBSpinEdit
              Left = 160
              Top = 25
              Width = 65
              Height = 21
              Increment = 1
              TabOrder = 1
              UnboundDataType = wwDefault
              OnChange = cboMesChange
              OnExit = cboMesChange
            end
            object edtVlrTotal: TRealEdit
              Left = 536
              Top = 25
              Width = 153
              Height = 21
              Alignment = taRightJustify
              Color = 12648447
              Lines.Strings = (
                '      0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object cboMes: TComboBox
              Left = 16
              Top = 25
              Width = 145
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cboMesChange
              OnExit = cboMesChange
              Items.Strings = (
                'Janeiro'
                'Fevereiro'
                'Março'
                'Abril'
                'Maio'
                'Junho'
                'Julho'
                'Agosto'
                'Setembro'
                'Outubro'
                'Novembro'
                'Dezembro')
            end
          end
          object dbCboContaBancaria: TwwDBLookupCombo
            Left = 392
            Top = 103
            Width = 329
            Height = 21
            ControlType.Strings = (
              'FLGCONTAPREF;CheckBox;Yes;No')
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CONTACORRENTE'#9'15'#9'Cta. Corrente'#9'F'
              'NUMBANCO'#9'10'#9'Banco'#9'F'
              'NUMAGENCIA'#9'10'#9'Agência'#9'F'
              'FLGCONTAPREF'#9'5'#9'     Pref.'#9'F')
            LookupTable = cdsContaBancaria
            LookupField = 'IDCBANCARIA'
            Options = [loTitles]
            Style = csDropDownList
            DropDownWidth = 113
            Enabled = False
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object edtNumDocumento: TEdit
            Left = 628
            Top = 63
            Width = 93
            Height = 21
            TabStop = False
            TabOrder = 2
          end
          object DBcboTipoRecDes: TwwDBLookupCombo
            Left = 16
            Top = 23
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
            LookupTable = cdsDespesa
            LookupField = 'IDTIPOCUSTORECIMO'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnCloseUp = DBcboTipoRecDesCloseUp
          end
          object edtReferenciaAP: TEdit
            Left = 16
            Top = 283
            Width = 329
            Height = 21
            MaxLength = 30
            TabOrder = 7
          end
          object DBcboCentroCusto: TwwDBLookupCombo
            Left = 16
            Top = 324
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
            LookupTable = cdsCCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object memObs: TMemo
            Left = 360
            Top = 243
            Width = 361
            Height = 61
            MaxLength = 200
            TabOrder = 9
          end
          object chkContrato: TCheckBox
            Left = 360
            Top = 312
            Width = 265
            Height = 17
            Caption = 'Obriga o registro do contrato de locação'
            TabOrder = 10
          end
          object edtNumAP: TEdit
            Left = 524
            Top = 63
            Width = 93
            Height = 21
            TabStop = False
            Enabled = False
            TabOrder = 3
          end
          object gbPeriodoCtbDiaria: TGroupBox
            Left = 16
            Top = 186
            Width = 329
            Height = 79
            Caption = 'Período para Contabilização Diária'
            TabOrder = 6
            object Label11: TLabel
              Left = 19
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Início'
            end
            object Label28: TLabel
              Left = 168
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Término'
            end
            object edtDtinictbdiaria: TCMDateTimePicker
              Left = 18
              Top = 38
              Width = 105
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
            end
            object edtDtfimctbdiaria: TCMDateTimePicker
              Left = 168
              Top = 38
              Width = 105
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
          inline molOrcamento1: TmolOrcamento
            Left = 625
            Top = 2
            TabOrder = 11
            inherited edtCompOrc: TDBRealEdit
              Lines.Strings = ()
            end
          end
          object chkIntegra: TCheckBox
            Left = 360
            Top = 334
            Width = 265
            Height = 17
            Caption = 'Integrar com Financeiro e Contabilidade'
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 12
          end
          object DBcboFormaRecPag: TwwDBLookupCombo
            Left = 16
            Top = 103
            Width = 337
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            LookupTable = cdsFormaRecPag
            LookupField = 'CODFORMA'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 13
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = DBcboFormaRecPagCloseUp
          end
          object edtHistLanc: TEdit
            Left = 360
            Top = 203
            Width = 361
            Height = 21
            TabOrder = 14
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 737
          Caption = 'Alteração de Lançamentos [ Lançamentos ]'
        end
        object Label4: TLabel
          Left = 552
          Top = 325
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total:'
        end
        object pgcLancamentos: TPageControl
          Left = 14
          Top = 71
          Width = 706
          Height = 250
          ActivePage = tbsLancamentos
          HotTrack = True
          MultiLine = True
          ParentShowHint = False
          ShowHint = False
          TabHeight = 21
          TabOrder = 0
          TabPosition = tpBottom
          TabWidth = 121
          object tbsLancamentos: TTabSheet
            Caption = 'Lançamentos'
            object DBgrdLancamentos: TwwDBGrid
              Left = 0
              Top = 0
              Width = 698
              Height = 219
              PictureMasks.Strings = (
                'VLRLANCOMPAGAR'#9'##,##0.00'#9'T'#9'T')
              Selected.Strings = (
                'IMOCODIGO'#9'8'#9'Código'#9'F'
                'DSC_IMOVEL'#9'34'#9'Imóvel'#9'F'
                'CONTRATO_EXTENSO'#9'43'#9'Contrato'#9'F'
                'CODTIPIMOVEL'#9'10'#9'Tipo'#9'F'
                'VLRIMOVEL'#9'11'#9'Valor'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsImoveis
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              KeyOptions = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
              ParentFont = False
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'Small Fonts'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              UseTFields = False
              OnCalcCellColors = DBgrdLancamentosCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = DBgrdLancamentosTopRowChanged
              object DBgrdLancamentosIButton: TwwIButton
                Left = 0
                Top = 0
                Width = 13
                Height = 22
                AllowAllUp = True
              end
            end
          end
          object tbsErro: TTabSheet
            Caption = 'Ocorrências'
            object memErro: TMemo
              Left = 0
              Top = 0
              Width = 698
              Height = 219
              Align = alClient
              ScrollBars = ssBoth
              TabOrder = 0
              WantTabs = True
              WordWrap = False
            end
          end
        end
        object Panel3: TPanel
          Left = 14
          Top = 49
          Width = 707
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos a Gerar'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnExcluiImovel: TfcShapeBtn
            Left = 78
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Excluir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnExcluiImovelClick
          end
          object btnInsereImovel: TfcShapeBtn
            Left = 1
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Inserir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnInsereImovelClick
          end
          object btnTotaliza: TfcShapeBtn
            Left = 617
            Top = 1
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Totalizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            OnClick = btnTotalizaClick
          end
        end
        object edtTotalLanc: TRealEdit
          Left = 592
          Top = 321
          Width = 105
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 737
          Height = 24
          Align = alTop
          Caption = 'Alteração de Lançamentos [ Alteradores ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object Label9: TLabel
          Left = 168
          Top = 54
          Width = 103
          Height = 13
          Caption = 'Tipo de Alterador '
        end
        object Label14: TLabel
          Left = 544
          Top = 54
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label6: TLabel
          Left = 168
          Top = 95
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object lblTipoServico: TLabel
          Left = 168
          Top = 136
          Width = 91
          Height = 13
          Caption = 'Tipo de Serviço'
        end
        object lblProcesso: TLabel
          Left = 168
          Top = 175
          Width = 271
          Height = 13
          Caption = 'Núm. do Processo de Suspensão de Tributação'
        end
        object lblValorBase: TLabel
          Left = 536
          Top = 136
          Width = 121
          Height = 13
          Caption = 'Valor Base Retenção'
        end
        object rdgAcreDesc: TRadioGroup
          Left = 56
          Top = 52
          Width = 97
          Height = 77
          ItemIndex = 0
          Items.Strings = (
            'Acréscimo'
            'Desconto')
          TabOrder = 0
          OnClick = rdgAcreDescClick
        end
        object DBcboAlterador: TwwDBLookupCombo
          Left = 168
          Top = 68
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'#9'F'
            'CODTIPIMOVEL'#9'5'#9'Tipo'#9'F')
          LookupTable = cdsAlteradorXTipoImovel
          LookupField = 'CHAVE'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnChange = DBcboAlteradorChange
        end
        object edtValor: TEditNum
          Left = 544
          Top = 68
          Width = 121
          Height = 21
          TabOrder = 2
          IntDigits = 0
          Signal = False
          DecDigits = 2
          Numeric = False
          Alignment = taRightJustify
        end
        object edtObsAlt: TEdit
          Left = 168
          Top = 112
          Width = 497
          Height = 21
          MaxLength = 60
          TabOrder = 3
        end
        object dbLkpTipoServico: TwwDBLookupCombo
          Left = 168
          Top = 150
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Tipo de Serviço')
          LookupTable = cdsTipoServico
          LookupField = 'IDTIPOSERVICO'
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dbLkpProcessos: TwwDBLookupCombo
          Left = 168
          Top = 189
          Width = 496
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NUMERO'#9'50'#9'Nº do Processo')
          LookupField = 'IDPROCESSO'
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object edtValorBase: TRealEdit
          Left = 543
          Top = 150
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '        0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 12
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object pnlAlteradoresGerados: TPanel
          Left = 51
          Top = 215
          Width = 611
          Height = 148
          Caption = 'pnlAlteradoresGerados'
          TabOrder = 7
          object Panel4: TPanel
            Left = 1
            Top = 1
            Width = 609
            Height = 27
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Alteradores'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            TabStop = True
            object bbtnInsereAlterador: TBitBtn
              Left = 0
              Top = 1
              Width = 81
              Height = 25
              Caption = 'Aplicar'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ModalResult = 1
              ParentFont = False
              TabOrder = 0
              OnClick = bbtnInsereAlteradorClick
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
              Margin = 10
              NumGlyphs = 2
            end
            object btnExcluiAlterador: TBitBtn
              Left = 81
              Top = 1
              Width = 81
              Height = 25
              Caption = 'Excluir'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ModalResult = 1
              ParentFont = False
              TabOrder = 1
              OnClick = btnExcluiAlteradorClick
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
              Margin = 10
              NumGlyphs = 2
            end
          end
          object DBgrdAlteradoresLanc: TwwDBGrid
            Left = 2
            Top = 27
            Width = 609
            Height = 121
            PictureMasks.Strings = (
              'VLRALTERADOR'#9'##,##0.00'#9'T'#9'T')
            Selected.Strings = (
              'DESCRICAO'#9'24'#9'Alterador'
              'CODTIPIMOVEL'#9'16'#9'Tipo'
              'VLRALTERADOR'#9'11'#9'Valor'
              'OBSERVACAO'#9'60'#9'Observação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsAlterador
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
        end
      end
      object tsNFS: TTabSheet
        Caption = 'tsNFS'
        ImageIndex = 3
        TabVisible = False
        object lblNFSNumero: TLabel
          Left = 8
          Top = 31
          Width = 195
          Height = 13
          Caption = 'Número da Nota Fiscal de Serviço'
        end
        object fcLabel4: TfcLabel
          Left = 0
          Top = 0
          Width = 737
          Height = 24
          Align = alTop
          Caption = 'Lançamento Múltiplo de Despesas [ Nota Fiscal de Serviço ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object lblNFSSerie: TLabel
          Left = 8
          Top = 70
          Width = 81
          Height = 13
          Caption = 'Núm. de Série'
        end
        object lblNFSDataEmissao: TLabel
          Left = 8
          Top = 110
          Width = 96
          Height = 13
          Caption = 'Data de Emissão'
        end
        object lblNFSValor: TLabel
          Left = 8
          Top = 150
          Width = 64
          Height = 13
          Caption = 'Valor Bruto'
        end
        object lblNFSObs: TLabel
          Left = 8
          Top = 190
          Width = 99
          Height = 13
          Caption = 'Dados Adicionais'
        end
        object edtNFSNumero: TEdit
          Left = 8
          Top = 44
          Width = 330
          Height = 21
          MaxLength = 15
          TabOrder = 0
        end
        object edtNFSSerie: TEdit
          Left = 10
          Top = 84
          Width = 141
          Height = 21
          MaxLength = 5
          TabOrder = 1
        end
        object dtpNFSDataEmissao: TCMDateTimePicker
          Left = 10
          Top = 124
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
          TabOrder = 2
        end
        object edtValorBrutoNFS: TRealEdit
          Left = 7
          Top = 164
          Width = 153
          Height = 21
          Alignment = taRightJustify
          Color = 12648447
          Enabled = False
          Lines.Strings = (
            '        0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 12
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object mmNFSObs: TMemo
          Left = 8
          Top = 204
          Width = 685
          Height = 70
          ScrollBars = ssVertical
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 747
    inherited tb97Fundo: TToolbar97
      Left = 226
      DockPos = 248
      inherited sep1: TToolbarSep97
        Left = 434
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 164
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 247
      end
      inherited bbtnSair: TBitBtn
        Left = 353
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 436
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 166
      end
      inherited btnVoltar: TfcShapeBtn
        Left = 83
      end
      inherited btnConfirmar: TfcShapeBtn
        Left = 272
        OnClick = btnConfirmarClick
      end
      object btnProcurar: TfcShapeBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Procurar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 5
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnProcurarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      5
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
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
  object MS_Lancamento: TMontaSelect
    Template.IdConsulta = 83
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VW.NOME_MESTRE'
      'VW.NOME_IMOVEL'
      'VW.DESCCUSTORECIMO'
      'VW.VALOR_LANC'
      'VW.ANOCOMPETENCIA'
      'VW.MESCOMPETENCIA'
      'VW.DATAVENCIMENTO'
      'VW.DATALANCAMENTO'
      'VW.NF_FORCLI'
      'VW.LOGIN_USUARIO'
      'VW.PORTADOR_FORMA'
      'VW.NODOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'N'
      'D'
      'D'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Tipo Receita / Despesa'
      'Valor do Lançamento'
      'Competência (Ano)'
      'Competência (Mês)'
      'Data Vencimento'
      'Data Lançamento'
      'Favorecido / Debitado'
      'Usuário'
      'Conta-Caixa'
      'Número Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWLANCAMENTO VW')
    CamposChave.Strings = (
      'VW.IDLANCIMOVEL'
      'VW.CODDOCUMENTO'
      'VW.PLNCODIGO'
      'VW.NODOCUMENTO'
      'VW.IDPESSOA'
      'VW.CODTIPIMOVEL'
      'VW.IDDOCUMENTO'
      'VW.RECPAG')
    Filtro.Strings = (
      'VW.RECPAG = '#39'P'#39
      'VW.IDMODULO = 64'
      'NVL(VW.TOT_PAGO, 0) = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###,##0.00;(###,###,###,###,##0.00)'
      '0000'
      '00'
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '15'
      '10'
      '5'
      '4'
      '10'
      '10'
      '20'
      '10'
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
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
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
      '')
    Left = 40
    Top = 344
  end
  object dsAlterador: TwwDataSource
    DataSet = cdsAlterador
    Left = 520
    Top = 240
  end
  object cdsDespesa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 273
    Top = 50
  end
  object cdsAlteradorXTipoImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 449
    Top = 75
  end
  object dsImoveis: TwwDataSource
    DataSet = cdsImoveis
    Left = 616
    Top = 245
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '/*'
      'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE,'
      '       CB.FLGCONTAPREF, AB.NUMAGENCIA, BC.NUMBANCO'
      '  FROM CONTABANCARIA CB, AGENCIABANCARIA AB, BANCO BC'
      ' WHERE CB.IDAGENCIA = AB.IDPESSOA'
      '   AND   AB.IDBANCO = BC.IDPESSOA'
      '   AND   CB.IDPESSOA = 2'
      '*/'
      '/*'
      'SELECT L.*,'
      
        '       DECODE(L.RECPAG, '#39'P'#39', L.VLRLANCPAGAR, L.VLRLANCRECEB) AS ' +
        'VLRIMOVEL,'
      '       T.DESCCUSTORECIMO,'
      '       T.CODTIPDOC,'
      '       I.IMOCODIGO,'
      '       ( IM.IMONOME  || '#39' - '#39' || I.IMONOME ) AS DSC_IMOVEL,'
      
        '       ( C.CONNUMERO || '#39' - '#39' || C.CONNOME ) AS CONTRATO_EXTENSO' +
        ','
      '       I.IDIMOVELMESTRE,'
      '       I.CODSUBCONTA,'
      '       I.FLGATIVO,'
      '       C.CONNOME,'
      '       C.CONNUMERO'
      '  FROM LANCAMENTOSIMOVEL L,'
      '       TIPOCUSTORECIMOV T,'
      '       IMOVEL I,'
      '       IMOVEL IM,'
      '       CONTRATOIMOVEL C'
      ' WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO'
      '   AND I.IDIMOVELMESTRE    = IM.IDIMOVEL'
      '   AND L.IDIMOVEL          = I.IDIMOVEL(+)'
      '   AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+)'
      '   AND 1=2'
      '*/'
      ''
      ''
      '/*'
      'SELECT'
      '   AL.IDDOCUMENTO,'
      '   AL.CODALTERADOR,'
      '   AL.VLRALTERADOR,'
      '   AL.CODTIPIMOVEL,'
      '   TO_CHAR(AL.CODALTERADOR) || AL.CODTIPIMOVEL AS CHAVE,'
      '   TA.DESCRICAO'
      'FROM'
      '   ALTERALANCIMOVEL AL, TIPOALTERADOR TA'
      ''
      'WHERE'
      '   ( AL.IDDOCUMENTO = -1 )'
      '   AND ( AL.CODALTERADOR = TA.CODALTERADOR )'
      '*/'
      ''
      ''
      
        'SELECT A.IDDOCUMENTO,    A.CODALTERADOR,     A.VLRALTERADOR, A.O' +
        'BSERVACAO,'
      '       A.TRGDTINCLUSAO,  A.TRGUSERINCLUSAO,  T.DESCRICAO,'
      '       T.RECPAG,         T.ACRESDECRES,      A.CODTIPIMOVEL'
      '  FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      ' WHERE A.CODALTERADOR = T.CODALTERADOR'
      ''
      ''
      ''
      '/*'
      'SELECT C.CODCENTROCUSTO, C.IDEMPRESA, C.NOME'
      '  FROM CENTCUST C, USCCUSTO U'
      ' WHERE ( C.IDEMPRESA = 2)'
      '   AND ( C.STATUSGRUPOCDC = '#39'A'#39' )'
      '   AND ( C.IDEMPRESA = U.IDEMPRESA )'
      '   AND ( C.CODCENTROCUSTO = U.CODCENTROCUSTO )'
      '   AND ( C.ATIVO = '#39'S'#39' )'
      '*/'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsAlterador
    Left = 707
    Top = 11
  end
  object cdsAlterador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 519
    Top = 257
    object cdsAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 24
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object cdsAlteradorCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 16
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsAlteradorVLRALTERADOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VLRALTERADOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsAlteradorOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 60
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object cdsAlteradorIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object cdsAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Visible = False
    end
    object cdsAlteradorACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Size = 10
    end
    object cdsAlteradorFLGLANCANFS: TStringField
      FieldName = 'FLGLANCANFS'
    end
    object cdsAlteradorIDTIPOSERVICO: TFloatField
      FieldName = 'IDTIPOSERVICO'
    end
    object cdsAlteradorIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
    end
    object cdsAlteradorVALORBASERETENCAO: TFloatField
      FieldName = 'VALORBASERETENCAO'
    end
  end
  object cdsImoveis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 617
    Top = 257
    object cdsImoveisIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 8
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsImoveisDSC_IMOVEL: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 41
      FieldName = 'DSC_IMOVEL'
      Size = 100
    end
    object cdsImoveisCONTRATO_EXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 27
      FieldName = 'CONTRATO_EXTENSO'
      Size = 100
    end
    object cdsImoveisCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 9
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsImoveisVLRIMOVEL: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRIMOVEL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImoveisVLRLANCPAGAR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANCPAGAR'
      Visible = False
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImoveisIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsImoveisIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsImoveisCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsImoveisCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
  end
  object cdsCCusto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 257
    Top = 322
    Data = {
      500D00009619E0BD0100000018000000030071000000030000008D000E434F44
      43454E54524F435553544F01004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000A00094944454D50524553
      410800040000000000044E4F4D45010049000000010005574944544802000200
      1E000100044C4349440400010009080000000004343332310000000000000040
      054745494E46000004343332310000000000000040054745494E460000033631
      30000000000000004005434F44454C000003363230000000000000004005434F
      46495300000332323700000000000000400F4445494E46202D2053454D205553
      4F00000334323200000000000000400F4445504144202853454D2055534F2900
      000337393900000000000000400F444942454F202D2053454D2055534F000004
      3133303200000000000000400F4745434F45202D2053454D2055534F00000437
      32303200000000000000400D47454C4F472053454D2055534F00000434333232
      0000000000000040054745504F4C000004343332310000000000000040054745
      494E46000004343332310000000000000040054745494E460000033432320000
      0000000000400F4445504144202853454D2055534F2900000334323200000000
      000000400F4445504144202853454D2055534F29000004313330320000000000
      0000400F4745434F45202D2053454D2055534F00000337393900000000000000
      400F444942454F202D2053454D2055534F00000337393900000000000000400F
      444942454F202D2053454D2055534F00000337393900000000000000400F4449
      42454F202D2053454D2055534F0000043133303200000000000000400F474543
      4F45202D2053454D2055534F000004343332320000000000000040054745504F
      4C000004343332320000000000000040054745504F4C00000434333232000000
      0000000040054745504F4C000004343332320000000000000040054745504F4C
      00000334323200000000000000400F4445504144202853454D2055534F290000
      0334323200000000000000400F4445504144202853454D2055534F2900000437
      32303200000000000000400D47454C4F472053454D2055534F00000437323032
      00000000000000400D47454C4F472053454D2055534F00000437323032000000
      00000000400D47454C4F472053454D2055534F00000437323032000000000000
      00400D47454C4F472053454D2055534F0000043732303200000000000000400D
      47454C4F472053454D2055534F0000043732303200000000000000400D47454C
      4F472053454D2055534F0000043732303200000000000000400D47454C4F4720
      53454D2055534F0000043732303200000000000000400D47454C4F472053454D
      2055534F00000434333131000000000000004005474552454800000431333032
      00000000000000400F4745434F45202D2053454D2055534F0000043133303200
      000000000000400F4745434F45202D2053454D2055534F000004343331310000
      0000000000400547455245480000043433313100000000000000400547455245
      4800000434333131000000000000004005474552454800000337393900000000
      000000400F444942454F202D2053454D2055534F000003373939000000000000
      00400F444942454F202D2053454D2055534F0000033739390000000000000040
      0F444942454F202D2053454D2055534F00000337393900000000000000400F44
      4942454F202D2053454D2055534F0000043732303200000000000000400D4745
      4C4F472053454D2055534F000001310000000000000040054449505245000004
      3133303200000000000000400F4745434F45202D2053454D2055534F00000331
      3439000000000000004005415544494E00000331353000000000000000400E47
      6162696E6574652D444950524500000331353100000000000000400553454345
      580000033135320000000000000040054153504C410000033135330000000000
      000040054153434F4D00000331353400000000000000400541534A5552000001
      32000000000000004005444946494E00000332323700000000000000400F4445
      494E46202D2053454D2055534F00000332333000000000000000400E47616269
      6E6574652D444946494E000003323331000000000000004005434F494E560000
      04323331310000000000000040054745494E5600000432333132000000000000
      0040054745494D4F000004323331330000000000000040054745414E49000003
      323332000000000000004005434F524941000004323332310000000000000040
      054745434F46000004323332320000000000000040054745434F4E0000013300
      0000000000004005444953454700000333333000000000000000400E47616269
      6E6574652D4449534547000003333331000000000000004005434F42454E0000
      0433333131000000000000004005474542454E00000433333132000000000000
      0040054745434152000003333332000000000000004005434F50415200000433
      3332310000000000000040054745434150000004333332320000000000000040
      0547454154550000013400000000000000400544495241440000033432320000
      0000000000400F4445504144202853454D2055534F2900000334333000000000
      000000400E476162696E6574652D444952414400000334333100000000000000
      4005434F52454F00000434333131000000000000004005474552454800000434
      33313200000000000000400547454F5247000003343332000000000000004005
      434F52494C000004343332310000000000000040054745494E46000004343332
      320000000000000040054745504F4C000003363130000000000000004005434F
      44454C000003363230000000000000004005434F464953000004373230320000
      0000000000400D47454C4F472053454D2055534F000003373939000000000000
      00400F444942454F202D2053454D2055534F0000043930303600000000000000
      4015436F6E73656C686F2044656C69626572617469766F000004393030370000
      0000000000400F436F6E73656C686F2046697363616C00000439303038000000
      000000004011476162696E657465206461204449505245000004393030390000
      0000000000401E53656372657461726961204578656375746976612064612050
      72657369640000043930313000000000000000401E4173736573736F72696120
      646520436F6D756E696361E7E36F20536F636900000439303131000000000000
      00401E4173736573736F72696120646520506C616E656A616D656E746F206520
      4F000004393031320000000000000040134173736573736F726961204A7572ED
      646963610000043930313300000000000000401141756469746F72696120496E
      7465726E6100000439303134000000000000004011476162696E657465206461
      2044495345470000043930313600000000000000401E436F6F72642E20646520
      41646D696E6973747261E7E36F2062656E65662E000004393031370000000000
      00004016476572EA6E6369612064652042656E6566ED63696F73000004393031
      3900000000000000401D436F6F72642E64652041646D696E6973747261E7E36F
      2070617274632E00000439303230000000000000004014476572EA6E63696120
      646520436164617374726F00000439303232000000000000004011476162696E
      6574652064612044495241440000043930323400000000000000401B436F6F72
      642E2064652041646D2E2065204465732E206465205248000004393032350000
      0000000000401D4765722E2041646D2E2065204465732E205265632E2048756D
      616E6F730000043930323700000000000000401E436F6F72642E205265632E20
      496E666F722E2065204C6F67ED737469636F0000043930323800000000000000
      4017476572EA6E63696120646520496E666F726DE17469636100000439303330
      000000000000004011476162696E65746520646120444946494E000004393033
      3200000000000000401E436F6F7264656E61646F72696120646520496E766573
      74696D656E746F730000043930333400000000000000401B4765722E64652049
      6E766573742E20496D6F62696C69E172696F7300000439303336000000000000
      00401E436F6F7264656E61646F72696120646520436F6E74726F6C61646F7269
      610000043930333700000000000000401B4765722E20646520436F6E74726F6C
      652046696E616E636569726F0000043930333800000000000000401B4765722E
      436F6E74726F6C65206465204172726563616461E7E36F000004393033390000
      00000000004013476572EA6E63696120646520416EE16C697365000004393034
      3000000000000000401C4765722E20446573656E762E204F7267616E697A6163
      696F6E616C2E0000043930343100000000000000401E4765722E206465204170
      6F696F2041646D2E2065204C6F67ED737469636F000004393034320000000000
      0000401A4765722E646520496E766573742E204D6F62696C69E172696F730000
      043930343300000000000000401D4765722E20416EE16C69736520646520496E
      76657374696D656E746F73000004393034340000000000000040194765722E20
      646520436F6E74726F6C6520436F6E74E162696C}
    object cdsCCustoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object cdsCCustoCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object cdsCCustoIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
  end
  object cdsContaBancaria: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 497
    Top = 6
    Data = {
      EA0000009619E0BD010000001800000005000100000003000000C6000B494443
      42414E434152494108000400000000000D434F4E5441434F5252454E54450100
      490000000100055749445448020002000F000C464C47434F4E54415052454608
      000400000000000A4E554D4147454E4349410100490000000200075355425459
      5045020049000A0046697865644368617200055749445448020002000F00084E
      554D42414E434F0100490000000100055749445448020002000A000100044C43
      4944040001000908000000000000000000920A35410735353137312D30000000
      000000F03F043035343003333431}
  end
  object cdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 217
    Top = 80
  end
  object cdsProcessos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 685
    Top = 145
  end
  object cdsTipoServico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 693
    Top = 303
  end
end
