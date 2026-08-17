inherited frmExecLancMultDespAlt: TfrmExecLancMultDespAlt
  Left = 19
  Top = 73
  HelpContext = 640019
  Caption = 'Alteração de Lançamentos de Despesas'
  ClientHeight = 411
  ClientWidth = 747
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 747
    Height = 372
    inherited PagControle: TPageControl
      Width = 745
      Height = 370
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 737
          Caption = 'Alteração de Lançamentos [ seleção ]'
        end
        object panLancamentos: TPanel
          Left = 0
          Top = 24
          Width = 737
          Height = 336
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
            Top = 187
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object lblReferenciaAP: TLabel
            Left = 16
            Top = 246
            Width = 129
            Height = 13
            Caption = 'Referência / Processo'
          end
          object lblCentroCusto: TLabel
            Left = 16
            Top = 286
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
            TabOrder = 6
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
          object DBcboFormaRecPag: TwwDBLookupCombo
            Left = 16
            Top = 103
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'DESCRICAO')
            LookupTable = dtmLookImobiliario.qryLookFormaRecPag
            LookupField = 'CODFORMA'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            OnCloseUp = DBcboFormaRecPagCloseUp
          end
          object dbCboContaBancaria: TwwDBLookupCombo
            Left = 392
            Top = 103
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CONTACORRENTE'#9'15'#9'Cta. Corrente'#9'F'
              'NUMBANCO'#9'10'#9'Banco'#9'F'
              'NUMAGENCIA'#9'10'#9'Agência'#9'F'
              'FLGCONTAPREF'#9'5'#9'     Pref.'#9'F')
            LookupTable = dtmLookImobiliario.qryLookContaBancaria
            LookupField = 'IDCBANCARIA'
            Options = [loTitles]
            Style = csDropDownList
            DropDownWidth = 113
            Enabled = False
            TabOrder = 5
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
            LookupTable = dtmLookImobiliario.qryLookTipoRecDes
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
            Top = 260
            Width = 329
            Height = 21
            MaxLength = 30
            TabOrder = 8
          end
          object DBcboCentroCusto: TwwDBLookupCombo
            Left = 16
            Top = 300
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            LookupTable = dtmLookImobiliario.qryLookCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 113
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object memObs: TMemo
            Left = 360
            Top = 201
            Width = 361
            Height = 80
            MaxLength = 200
            TabOrder = 10
          end
          object chkContrato: TCheckBox
            Left = 360
            Top = 301
            Width = 265
            Height = 17
            Caption = 'Obriga o registro do contrato de locação'
            TabOrder = 11
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
            Height = 56
            Caption = 'Período para Contabilização Diária'
            TabOrder = 7
            object Label11: TLabel
              Left = 19
              Top = 14
              Width = 34
              Height = 13
              Caption = 'Início'
            end
            object Label28: TLabel
              Left = 168
              Top = 14
              Width = 46
              Height = 13
              Caption = 'Término'
            end
            object edtDtinictbdiaria: TCMDateTimePicker
              Left = 18
              Top = 28
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
              Top = 28
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
            TabOrder = 12
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
              Selected.Strings = (
                'IMOCODIGO'#9'10'#9'Código'
                'IMOVEL_EXTENSO'#9'36'#9'Imóvel '
                'CONTRATO_EXTENSO'#9'22'#9'Contrato'#9'F'
                'CODTIPIMOVEL'#9'6'#9'Tipo'
                'GXIPERCENTRATEIO'#9'10'#9'Rateio (I)'
                'PERCENT_RATEIO'#9'10'#9'Rateio (C)'
                'VALOR'#9'11'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsRateio
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
              OnCalcCellColors = DBgrdLancamentosCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = DBgrdLancamentosTopRowChanged
            end
          end
          object tbsErro: TTabSheet
            Caption = 'Ocorrências'
            object memErro: TMemo
              Left = 0
              Top = 0
              Width = 698
              Height = 205
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
            '      0,00')
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
          Top = 58
          Width = 103
          Height = 13
          Caption = 'Tipo de Alterador '
        end
        object Label14: TLabel
          Left = 544
          Top = 58
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object rdgAcreDesc: TRadioGroup
          Left = 56
          Top = 48
          Width = 97
          Height = 53
          ItemIndex = 0
          Items.Strings = (
            'Acréscimo'
            'Desconto')
          TabOrder = 0
          OnClick = rdgAcreDescClick
        end
        object DBcboAlterador: TwwDBLookupCombo
          Left = 168
          Top = 72
          Width = 361
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = dtmLookImobiliario.qryLookAlteradorXTipoImo
          LookupField = 'CODALTERADOR'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
        end
        object DBgrdAlteradoresLanc: TwwDBGrid
          Left = 56
          Top = 144
          Width = 609
          Height = 121
          Selected.Strings = (
            'DESCRICAO'#9'66'#9'Tipo do Alterador'
            'VLRALTERADOR'#9'15'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsAlterador
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
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
        object edtValor: TEditNum
          Left = 544
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 3
          IntDigits = 0
          Signal = False
          DecDigits = 2
          Numeric = False
          Alignment = taRightJustify
        end
        object Panel4: TPanel
          Left = 56
          Top = 118
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
          TabOrder = 4
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
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
      3
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
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 40
    Top = 344
  end
  object dsAlterador: TwwDataSource
    DataSet = qryAlterador
    Left = 312
    Top = 352
  end
  object qryAlterador: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   AL.IDDOCUMENTO,'
      '   AL.CODALTERADOR,'
      '   AL.VLRALTERADOR,'
      '   TA.DESCRICAO'
      ''
      'FROM'
      '   ALTERALANCIMOVEL AL, TIPOALTERADOR TA'
      ''
      'WHERE'
      '   ( AL.IDDOCUMENTO =:PIDDOCUMENTO )'
      '   AND ( AL.CODALTERADOR = TA.CODALTERADOR )'
      ''
      'ORDER BY'
      '   TA.DESCRICAO'
      ''
      ''
      ' ')
    UpdateObject = updAlterador
    ValidateWithMask = True
    Left = 312
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAlteradorDESCRICAO: TStringField
      DisplayLabel = 'Tipo do Alterador'
      DisplayWidth = 66
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAlteradorIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.IDDOCUMENTO'
      Visible = False
    end
    object qryAlteradorCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.CODALTERADOR'
      Visible = False
    end
    object qryAlteradorVLRALTERADOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLRALTERADOR'
      Origin = 'BASEDADOS.ALTERALANCIMOVEL.VLRALTERADOR'
      DisplayFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
      EditFormat = '###,###,###,##0.00;(###,###,###,##0.00)'
    end
  end
  object updAlterador: TUpdateSQL
    ModifySQL.Strings = (
      'update ALTERALANCIMOVEL'
      'set'
      '  VLRALTERADOR = :VLRALTERADOR'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into ALTERALANCIMOVEL'
      '  (IDDOCUMENTO, CODALTERADOR, VLRALTERADOR)'
      'values'
      '  (:IDDOCUMENTO, :CODALTERADOR, :VLRALTERADOR)')
    DeleteSQL.Strings = (
      'delete from ALTERALANCIMOVEL'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    Left = 312
    Top = 328
  end
  object DSIMPOSTO: TwwDataSource
    Left = 209
    Top = 191
  end
  object qryRateio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ( IM.IMONOME||'#39' - '#39'||I.IMONOME ) AS IMOVEL_EXTENSO,'
      '   ( C.CONNUMERO||'#39' - '#39'||C.CONNOME ) AS CONTRATO_EXTENSO,'
      '   I.IMOCODIGO, I.CODTIPIMOVEL,'
      '   0 AS GXIPERCENTRATEIO, L.IDIMOVEL,'
      '   C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME,'
      '   L.VLRLANCPAGAR AS VALOR,'
      '   0 AS PERCENT_RATEIO'
      'FROM'
      '   LANCAMENTOSIMOVEL L, IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C'
      'WHERE'
      '   ( L.IDDOCUMENTO = :PIDDOCUMENTO )'
      '   AND ( L.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '   AND ( L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL (+) )'
      ' ')
    UpdateObject = updRateio
    ValidateWithMask = True
    Left = 376
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryRateioIMOCODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object qryRateioIMOVEL_EXTENSO: TStringField
      DisplayLabel = 'Imóvel '
      DisplayWidth = 36
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryRateioCONTRATO_EXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 22
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryRateioCODTIPIMOVEL: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 6
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryRateioGXIPERCENTRATEIO: TFloatField
      DisplayLabel = 'Rateio (I)'
      DisplayWidth = 10
      FieldName = 'GXIPERCENTRATEIO'
    end
    object qryRateioPERCENT_RATEIO: TFloatField
      DisplayLabel = 'Rateio (C)'
      DisplayWidth = 10
      FieldName = 'PERCENT_RATEIO'
    end
    object qryRateioVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 11
      FieldName = 'VALOR'
    end
    object qryRateioIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object qryRateioIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryRateioCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object qryRateioCONNOME: TStringField
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
  end
  object updRateio: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOXIMOVEL'
      'set'
      '  GXIPERCENTRATEIO = :GXIPERCENTRATEIO,'
      '  IDIMOVEL = :IDIMOVEL'
      'where'
      '  GXIPERCENTRATEIO = :OLD_GXIPERCENTRATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    InsertSQL.Strings = (
      'insert into GRUPOXIMOVEL'
      '  (GXIPERCENTRATEIO, IDIMOVEL)'
      'values'
      '  (:GXIPERCENTRATEIO, :IDIMOVEL)'
      ' ')
    DeleteSQL.Strings = (
      'delete from GRUPOXIMOVEL'
      'where'
      '  GXIPERCENTRATEIO = :OLD_GXIPERCENTRATEIO and'
      '  IDIMOVEL = :OLD_IDIMOVEL')
    Left = 376
    Top = 340
  end
  object dsRateio: TwwDataSource
    DataSet = qryRateio
    Left = 376
    Top = 352
  end
end
