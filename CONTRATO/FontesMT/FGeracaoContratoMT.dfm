inherited frmGeracaoContratoMT: TfrmGeracaoContratoMT
  Left = 185
  Top = 51
  HelpContext = 120003
  Caption = 'Geração de Contratos'
  ClientHeight = 438
  ClientWidth = 546
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 546
    Height = 399
    object PgCtrl: TPageControl
      Left = 1
      Top = 1
      Width = 544
      Height = 397
      ActivePage = tsFiltrosParam
      Align = alClient
      TabOrder = 0
      object tsFiltrosParam: TTabSheet
        Caption = 'Filtros e Parâmetros'
        object Label5: TLabel
          Left = 365
          Top = 118
          Width = 78
          Height = 13
          Caption = 'Contabilidade'
        end
        object pbGeracao: TProgressBar
          Left = 0
          Top = 344
          Width = 536
          Height = 25
          Align = alBottom
          Min = 0
          Max = 100
          Smooth = True
          Step = 1
          TabOrder = 0
        end
        object GroupBox2: TGroupBox
          Left = 12
          Top = 8
          Width = 116
          Height = 44
          Caption = 'Data de Geração '
          TabOrder = 1
          object edtpDataGera: TCMDateTimePicker
            Left = 8
            Top = 16
            Width = 97
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
        end
        object GrpBoxDtLanc: TGroupBox
          Left = 135
          Top = 8
          Width = 135
          Height = 44
          Caption = 'Data de Lançamento'
          TabOrder = 2
          object edtpDataLanc: TCMDateTimePicker
            Left = 8
            Top = 16
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
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 276
          Top = 8
          Width = 236
          Height = 44
          Caption = 'Período de Vencimento'
          TabOrder = 3
          object Label1: TLabel
            Left = 115
            Top = 21
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtIni: TCMDateTimePicker
            Left = 12
            Top = 16
            Width = 97
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
          object edtFim: TCMDateTimePicker
            Left = 130
            Top = 16
            Width = 97
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
        inline molContrato1: TmolContrato
          Left = 4
          Top = 53
          Width = 510
          Height = 42
          TabOrder = 4
          inherited lblProcesso: TLabel
            Left = 320
          end
          inherited edtContrato: TEdit
            Width = 313
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 458
            OnClick = molContrato1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 482
            OnClick = molContrato1btnLimpaContratoClick
          end
          inherited edtProcesso: TEdit
            Left = 320
            Width = 137
          end
        end
        object RdGeraParc: TRadioGroup
          Left = 12
          Top = 91
          Width = 319
          Height = 54
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Gerar apenas a primeira parcela de cada contrato'
            'Gerar todas as parcelas existentes no intervalo')
          TabOrder = 5
        end
        object chkNaoContabiliza: TCheckBox
          Left = 343
          Top = 100
          Width = 120
          Height = 17
          Caption = 'Não integrar com '
          TabOrder = 6
        end
        object pnlGeracao: TPanel
          Left = 12
          Top = 151
          Width = 518
          Height = 187
          BevelOuter = bvNone
          TabOrder = 7
          object PageControl1: TPageControl
            Left = 2
            Top = 3
            Width = 513
            Height = 182
            ActivePage = tsGeral
            TabOrder = 0
            object tsGeral: TTabSheet
              Caption = 'Geral'
              object lblFormaPG: TLabel
                Left = 12
                Top = 5
                Width = 120
                Height = 13
                Caption = 'Forma de Pagamento'
              end
              object Label3: TLabel
                Left = 12
                Top = 46
                Width = 134
                Height = 13
                Caption = 'Histórico Complementar'
              end
              object Label9: TLabel
                Left = 293
                Top = 5
                Width = 98
                Height = 13
                Caption = 'Num. Documento'
              end
              object Label10: TLabel
                Left = 396
                Top = 23
                Width = 7
                Height = 13
                Caption = '/'
              end
              object dblcFormaPG: TwwDBLookupCombo
                Left = 12
                Top = 21
                Width = 269
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'30'#9'Descrição')
                LookupTable = cdsFormasPagamento
                LookupField = 'CODFORMA'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object edtHist: TEdit
                Left = 12
                Top = 60
                Width = 436
                Height = 21
                TabOrder = 3
              end
              object dbeNumDocumento: TDBRealEdit
                Left = 293
                Top = 21
                Width = 97
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
              end
              object dbeComplDoc: TwwDBEdit
                Left = 407
                Top = 21
                Width = 41
                Height = 21
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object GpConta: TGroupBox
                Left = 11
                Top = 86
                Width = 331
                Height = 58
                Caption = 'Conta Bancária '
                TabOrder = 4
                object lblBanco: TLabel
                  Left = 10
                  Top = 15
                  Width = 37
                  Height = 13
                  Caption = 'Banco'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblNo: TLabel
                  Left = 139
                  Top = 14
                  Width = 19
                  Height = 13
                  Caption = 'Nº '
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object lblAgencia: TLabel
                  Left = 60
                  Top = 15
                  Width = 47
                  Height = 13
                  Caption = 'Agência'
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object BtnBuscaContaCor: TSpeedButton
                  Left = 297
                  Top = 29
                  Width = 25
                  Height = 22
                  Hint = 'Altera Conta Bancária'
                  Enabled = False
                  Glyph.Data = {
                    76010000424D7601000000000000760000002800000020000000100000000100
                    0400000000000001000000000000000000001000000010000000000000000000
                    800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                    33033333333333333F7F3333333333333000333333333333F777333333333333
                    000333333333333F777333333333333000333333333333F77733333333333300
                    033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                    33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                    3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                    33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                    333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                    333333773FF77333333333370007333333333333777333333333}
                  NumGlyphs = 2
                  OnClick = BtnBuscaContaCorClick
                end
                object dbeBanco: TwwDBEdit
                  Left = 10
                  Top = 30
                  Width = 42
                  Height = 21
                  DataField = 'NUMBANCO'
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeAgencia: TwwDBEdit
                  Left = 60
                  Top = 30
                  Width = 71
                  Height = 21
                  DataField = 'NUMAGENCIA'
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeConta: TwwDBEdit
                  Left = 139
                  Top = 30
                  Width = 157
                  Height = 21
                  DataField = 'CONTACORRENTE'
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              inline molOrcamento1: TmolOrcamento
                Left = 353
                Top = 100
                TabOrder = 5
              end
            end
            object tsObs: TTabSheet
              Caption = 'Observações'
              ImageIndex = 2
              object GroupBox1: TGroupBox
                Left = 0
                Top = 0
                Width = 505
                Height = 154
                Align = alClient
                TabOrder = 0
                object Panel1: TPanel
                  Left = 2
                  Top = 15
                  Width = 501
                  Height = 137
                  Align = alClient
                  BevelOuter = bvNone
                  BevelWidth = 2
                  BorderWidth = 5
                  TabOrder = 0
                  object memObs: TMemo
                    Left = 5
                    Top = 5
                    Width = 491
                    Height = 127
                    Align = alClient
                    ScrollBars = ssVertical
                    TabOrder = 0
                  end
                end
              end
            end
            object tsFicha: TTabSheet
              Caption = 'Ficha de Compensação'
              ImageIndex = 1
              object Label2: TLabel
                Left = 12
                Top = 9
                Width = 98
                Height = 13
                Caption = 'Código de Barras'
              end
              object Label4: TLabel
                Left = 12
                Top = 50
                Width = 86
                Height = 13
                Caption = 'Linha Digitável'
              end
              object edtCodBarra: TEdit
                Left = 12
                Top = 25
                Width = 273
                Height = 21
                TabOrder = 0
              end
              object edtLinhaDig: TEdit
                Left = 12
                Top = 64
                Width = 274
                Height = 21
                TabOrder = 1
              end
            end
          end
        end
      end
      object tsLog: TTabSheet
        Caption = 'Log'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 536
          Height = 25
          Align = alTop
          Caption = 'Log de ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object EdtLog: TMemo
          Left = 0
          Top = 25
          Width = 536
          Height = 344
          Align = alClient
          Enabled = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 546
    inherited tb97Fundo: TToolbar97
      Left = 177
      DockPos = 177
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 8
      DockPos = 8
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 41
    Top = 341
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object cdsFormasPagamento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 466
    Top = 388
  end
  object MsContaCor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.CONTACORRENTE'
      'CONTABANCARIA.TIPOCONTA'
      'CONTABANCARIA.FLGCONTAPREF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Banco'
      'Num. Banco'
      'Num Agência'
      'Conta Corrente'
      'Tipo'
      'Preferencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO'
      'AGENCIABANCARIA'
      'CONTABANCARIA')
    CamposChave.Strings = (
      'CONTABANCARIA.IDCBANCARIA'
      'CONTABANCARIA.CONTACORRENTE'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA'
      'CONTABANCARIA.IDPESSOA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15'
      '15'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 101
    Top = 341
  end
  object cdsDadosConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 185
    Top = 333
  end
end
