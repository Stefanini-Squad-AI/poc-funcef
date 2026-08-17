inherited frmExecAlteraConcessao_81962_379367: TfrmExecAlteraConcessao_81962_379367
  Left = 16
  Top = 108
  HelpContext = 150024
  Caption = 'Alteração de Valor de Concessão_81962_379367'
  ClientHeight = 428
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 395
    inherited pgcControle: TPageControl
      Width = 765
      Height = 362
      ActivePage = TabSheet2
      MultiLine = True
      inherited TabSheet1: TTabSheet
        Caption = 'Alteração de Valor de Concessão [ Seleção ]'
        object Label21: TLabel
          Left = 376
          Top = 250
          Width = 63
          Height = 13
          Caption = 'Taxa Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 136
          Top = 250
          Width = 90
          Height = 13
          Caption = 'Data do Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 16
          Top = 250
          Width = 109
          Height = 13
          Caption = 'Data de Assinatura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 456
          Top = 250
          Width = 90
          Height = 13
          Caption = 'Valor Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 568
          Top = 250
          Width = 68
          Height = 13
          Caption = 'Nº Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 648
          Top = 250
          Width = 95
          Height = 13
          Caption = 'Valor da Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 256
          Top = 250
          Width = 109
          Height = 13
          Caption = 'Data da 1º Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 384
          Top = 154
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 154
          Width = 122
          Height = 13
          Caption = 'Plano Previdenciário '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 16
          Top = 106
          Width = 141
          Height = 13
          Caption = 'Situação do Participante'
        end
        object Label7: TLabel
          Left = 16
          Top = 58
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label8: TLabel
          Left = 144
          Top = 58
          Width = 36
          Height = 13
          Caption = 'C.P.F.'
        end
        object Label11: TLabel
          Left = 344
          Top = 202
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 202
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 16
          Top = 10
          Width = 114
          Height = 13
          Caption = 'Número do Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 168
          Top = 10
          Width = 50
          Height = 13
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 664
          Top = 202
          Width = 57
          Height = 13
          Caption = 'Indexador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBedtJuros: TDBEdit
          Left = 376
          Top = 264
          Width = 65
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TXJUROS'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBedtDataInsc: TCMDateTimePicker
          Left = 16
          Top = 264
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAASSINATURA'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 1
        end
        object DBedtDataCredito: TCMDateTimePicker
          Left = 136
          Top = 264
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATACREDITO'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 2
        end
        object DBedtValSolic: TDBEdit
          Left = 456
          Top = 264
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VLRCONTRATO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBedtValorParcela: TDBEdit
          Left = 648
          Top = 264
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VLRPARCELA'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBedtParcelas: TDBEdit
          Left = 568
          Top = 264
          Width = 68
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clBtnFace
          DataField = 'PRAZO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBedtDataPrimParcela: TCMDateTimePicker
          Left = 256
          Top = 264
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAPRIMPARC'
          DataSource = dts
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 6
        end
        object DBedtPatro: TDBEdit
          Left = 16
          Top = 168
          Width = 353
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PATRO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBedtPlanoPrev: TDBEdit
          Left = 384
          Top = 168
          Width = 361
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'PLANOPREV'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBedtSitPart: TDBEdit
          Left = 16
          Top = 120
          Width = 241
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'SITDESCRICAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object grpTitular: TGroupBox
          Left = 272
          Top = 52
          Width = 473
          Height = 89
          Caption = ' Dados do Participante Titular '
          Enabled = False
          TabOrder = 10
          object Label9: TLabel
            Left = 24
            Top = 42
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label16: TLabel
            Left = 152
            Top = 42
            Width = 36
            Height = 13
            Caption = 'C.P.F.'
          end
          object Label18: TLabel
            Left = 336
            Top = 42
            Width = 114
            Height = 13
            Caption = 'Insc. Previdenciária'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBedtMtrEmpresa: TDBEdit
            Left = 24
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'MATRICULA'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBedtCPF: TDBEdit
            Left = 152
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'CPF_TITULAR'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBedtInscricao: TDBEdit
            Left = 336
            Top = 56
            Width = 113
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'INSCRICAONUMERO'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBedtParticipante: TDBEdit
            Left = 24
            Top = 16
            Width = 425
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'NOME_TITULAR'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 72
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MATRICULA_MUTUARIO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit2: TDBEdit
          Left = 144
          Top = 72
          Width = 113
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'CPF_MUTUARIO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object DBedtTipoEmptmo: TDBEdit
          Left = 344
          Top = 216
          Width = 321
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TCEDESCRICAO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBEdit3: TDBEdit
          Left = 16
          Top = 216
          Width = 313
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DESCTIPOEMPTMO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object btnBuscaContrato: TBitBtn
          Left = 128
          Top = 24
          Width = 24
          Height = 22
          Hint = 'Busca o Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          OnClick = btnBuscaContratoClick
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
        end
        object DBedtNumContrato: TDBEdit
          Left = 16
          Top = 24
          Width = 112
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'IDCONTRATOEMPTMO'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object DBedtBeneficiario: TDBEdit
          Left = 168
          Top = 24
          Width = 577
          Height = 21
          DataField = 'NOME_MUTUARIO'
          DataSource = dts
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBEdit8: TDBEdit
          Left = 664
          Top = 216
          Width = 81
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'MOESIGLA'
          DataSource = dts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object chkExcepcional: TCheckBox
          Left = 24
          Top = 297
          Width = 217
          Height = 17
          Caption = 'Excepcional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 19
        end
      end
      inherited TabSheet2: TTabSheet
        Caption = 'Alteração de Valor de Concessão [ Alteração ]'
        object Label25: TLabel
          Left = 440
          Top = 292
          Width = 48
          Height = 13
          Caption = 'Reserva'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 608
          Top = 292
          Width = 40
          Height = 13
          Caption = 'Salário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 440
          Top = 316
          Width = 45
          Height = 13
          Caption = 'Margem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 608
          Top = 316
          Width = 43
          Height = 13
          Caption = 'Máximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel3: TPanel
          Left = 440
          Top = 24
          Width = 281
          Height = 249
          TabOrder = 0
          object Label19: TLabel
            Left = 88
            Top = 106
            Width = 104
            Height = 13
            Caption = 'Data de Alteração'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 88
            Top = 146
            Width = 90
            Height = 13
            Caption = 'Data do Crédito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 88
            Top = 18
            Width = 64
            Height = 13
            Caption = 'Novo Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 88
            Top = 194
            Width = 100
            Height = 13
            Caption = 'Prestação Básica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 88
            Top = 58
            Width = 67
            Height = 13
            Caption = 'Novo Prazo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtDataAlteracao: TCMDateTimePicker
            Left = 88
            Top = 120
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 2
            OnExit = edtDataAlteracaoExit
          end
          object edtDataCredito: TCMDateTimePicker
            Left = 88
            Top = 160
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 3
          end
          object edtNovoValor: TRealEdit
            Left = 88
            Top = 32
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            OnExit = edtDataAlteracaoExit
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtPrestacao: TRealEdit
            Left = 88
            Top = 208
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Color = clBtnFace
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object edtNovoPrazo: TRealEdit
            Left = 88
            Top = 72
            Width = 105
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0')
            ParentFont = False
            TabOrder = 1
            WordWrap = False
            OnExit = edtDataAlteracaoExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
          end
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 16
          Width = 361
          Height = 321
          Caption = ' Dados da Concessão '
          TabOrder = 1
          object Label2: TLabel
            Left = 16
            Top = 18
            Width = 109
            Height = 13
            Caption = 'Data de Assinatura'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 136
            Top = 18
            Width = 90
            Height = 13
            Caption = 'Data do Crédito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 256
            Top = 18
            Width = 68
            Height = 13
            Caption = 'Nº Parcelas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 16
            Top = 64
            Width = 113
            Height = 13
            Caption = 'Itens de Concessão'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CMDateTimePicker1: TCMDateTimePicker
            Left = 16
            Top = 32
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
            ButtonStyle = cbsCustom
            DataField = 'DATAASSINATURA'
            DataSource = dts
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 0
          end
          object CMDateTimePicker2: TCMDateTimePicker
            Left = 136
            Top = 32
            Width = 105
            Height = 21
            TabStop = False
            AutoSize = False
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Color = clBtnFace
            ButtonStyle = cbsCustom
            DataField = 'DATACREDITO'
            DataSource = dts
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ShowButton = True
            TabOrder = 1
          end
          object edtPrazo: TDBEdit
            Left = 256
            Top = 32
            Width = 68
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            DataField = 'PRAZO'
            DataSource = dts
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBgrdHistMov: TwwDBGrid
            Left = 16
            Top = 80
            Width = 329
            Height = 225
            Selected.Strings = (
              'ITEDESCRICAO'#9'34'#9'Item'#9'F'
              'HMEVLRPREVISTO'#9'14'#9'Vlr.Previsto'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dtsHistMov
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            OnCalcCellColors = DBgrdHistMovCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = DBgrdHistMovTopRowChanged
          end
        end
        object edtSalario: TRealEdit
          Left = 656
          Top = 288
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
        object edtMaximo: TRealEdit
          Left = 656
          Top = 312
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          OnExit = edtMaximoExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtValReserva: TRealEdit
          Left = 496
          Top = 288
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtVlrMargem: TRealEdit
          Left = 496
          Top = 312
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '      0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          OnExit = edtVlrMargemExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object btnAlteraMargem: TBitBtn
          Left = 562
          Top = 312
          Width = 24
          Height = 22
          Hint = 'Altera a Margem Consignável'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnAlteraMargemClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
        end
        object btnAlteraMaximo: TBitBtn
          Left = 722
          Top = 312
          Width = 24
          Height = 22
          Hint = 'Altera a Margem Consignável'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnAlteraMaximoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
            77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
            7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
            077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
            F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
            FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
            077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
            FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
            777777777787FF88777777777778887777777777777888777777}
          NumGlyphs = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Alteração de Valor de Concessão [ Resultado ]'
        ImageIndex = 2
        TabVisible = False
        object Label24: TLabel
          Left = 460
          Top = 307
          Width = 116
          Height = 13
          Caption = 'Prestação Básica:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Panel9: TPanel
          Left = 15
          Top = 16
          Width = 730
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBgrdHistMovVirtual: TwwDBGrid
          Left = 15
          Top = 43
          Width = 730
          Height = 230
          Selected.Strings = (
            'EVENTO'#9'16'#9'Evento'#9'F'
            'IteDescricao'#9'36'#9'Item'#9'F'
            'HMEDATAPREVISTA'#9'10'#9'Previsão'#9'F'
            'HMEVLRPREVISTO'#9'13'#9'Valor Prev.'#9'F'
            'HMESALDODEV'#9'13'#9'Sld Devedor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsHistMovVirtual
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = DBgrdHistMovVirtualCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdHistMovVirtualTopRowChanged
        end
        object edtPrestacaoBasica: TRealEdit
          Left = 568
          Top = 304
          Width = 105
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = clBtnFace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
      end
    end
    inherited Panel1: TPanel
      Width = 765
      inherited fcLabel1: TfcLabel
        Width = 447
        Caption = 'Alteração de Valor de Concessão [ Seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 593
      DockPos = 638
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 299
      DockPos = 344
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 9
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dts: TwwDataSource
    AutoEdit = False
    DataSet = dtmEmptmo.qryDadosContrato
    Left = 736
  end
  object qryHistMov: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IRC.ITEDESCRICAO,'
      ''
      
        '   TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39') || '#39'/'#39' || HME.HMEANOCOMP' +
        'ETENCIA AS ANOMESCOMP,'
      
        '   TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')    || '#39'/'#39' || HME.HMEANOCOBR' +
        'ANCA    AS ANOMESCOBR,'
      ''
      
        '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) || (LT' +
        'RIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39')))) AS ANOMESCOMPE' +
        'T,'
      
        '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, '#39'0000'#39')))) || (LTRIM' +
        '(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')))) AS ANOMESCOB,'
      ''
      '   NVL(HME.FLGENVIO, 1)        AS FLGENVIO,'
      '   NVL(HME.FLGBAIXADO, 1)      AS FLGBAIXADO,'
      '   NVL(HME.FLGESTORNADO, 0)    AS FLGESTORNADO,'
      '   NVL(HME.FLGABONADO, 0)      AS FLGABONADO,'
      '   NVL(HME.FLGQUITADO, 0)      AS FLGQUITADO,'
      '   NVL(HME.FLGBAIXAMANUAL, 0)  AS FLGBAIXAMANUAL,'
      '   NVL(HME.FLGDIVERGPEND, 0)   AS FLGDIVERGPEND,'
      ''
      
        '   HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA, HME.HMESEQCOBRA' +
        'NCA ,'
      
        '   HME.HMETIPOMOV       , HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTM' +
        'O   ,'
      
        '   HME.HMEDATAPREVISTA  , HME.HMECENTRALIZA    , HME.HMEDESTACAD' +
        'O   ,     '
      ''
      '   NVL(HME.HMEVLRPREVISTO, 0) AS HMEVLRPREVISTO,'
      '   NVL(HME.HMESALDODEV, 0) AS HMESALDODEV,'
      ''
      
        '   HME.HMETXJUROS       , HME.HMEPARCELA       , HME.HMEDATAEFET' +
        'IVA ,'
      
        '   HME.HMEDATAATUALIZA  , HME.HMEVLREFETIVO    , HME.PLNCODIGO  ' +
        '    ,'
      '   HME.PLNCODIGOESTORNO , HME.CODDOCUMENTO     ,'
      '   HME.IDRUBRICA        , HME.HMEDATAVENCTO,'
      ''
      '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessão'#39','
      '                          1, '#39'Parcela '#39','
      '                          2, '#39'Amortização'#39','
      '                          3, '#39'Quitação'#39','
      '                          4, '#39'Atualização Débito'#39','
      '                          5, '#39'Atualização Saldo'#39
      '                          ) AS EVENTO,'
      ''
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS FORM' +
        'ACOBRANCA,'
      
        '   DECODE(HME.HMETIPOFOLHA,'#39'B'#39','#39'Benefício'#39','#39'P'#39','#39'Patrocinadora'#39', ' +
        'NULL, '#39#39') AS TIPOFOLHA,'
      ''
      '   HME.HMEDATAQUITABONO,'
      ''
      
        '   HME.IDHISTMOVEMPTMO, HME.HMENUMPARCELAS, HME.HMEMESCOBRANCA, ' +
        'HME.HMEANOCOBRANCA'
      'FROM'
      '   HISTMOVEMPTMO  HME,'
      '   CONTRATOEMPTMO CON,'
      '   ITEMXTIPOCONTR ITC,'
      '   ITEMEMPTMO IRC,'
      '   ('
      '   SELECT'
      
        '      SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO, MIN(SEQ.ITCSEQCAL' +
        'CULO) AS MINSEQCALCONC'
      '   FROM'
      '      ITEMXTIPOCONTR SEQ'
      '   WHERE'
      '          ( SEQ.ITCEVENTO         = 0 )'
      '   GROUP BY'
      '      SEQ.IDITEMEMPTMO, SEQ.IDTIPOCONTREMPTMO'
      '   ) MIN'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO )'
      '   AND ( CON.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMETIPOMOV        = 0 )'
      '   AND ( HME.HMEPARCELA        = 0 )'
      '   AND ( HME.HMESEQCOBRANCA    = 1 )'
      '   AND ( CON.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO )'
      '   AND ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO      = IRC.IDITEMEMPTMO )'
      '   AND ( HME.IDCONTRATOEMPTMO  = CON.IDCONTRATOEMPTMO )'
      '   AND ( ITC.IDTIPOCONTREMPTMO = MIN.IDTIPOCONTREMPTMO )'
      '   AND ( ITC.IDITEMEMPTMO      = MIN.IDITEMEMPTMO )'
      ''
      'ORDER BY'
      '   ITC.ITCSEQCALCULO'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 480
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryHistMovITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryHistMovANOMESCOMP: TStringField
      FieldName = 'ANOMESCOMP'
      Size = 44
    end
    object qryHistMovANOMESCOMPET: TStringField
      FieldName = 'ANOMESCOMPET'
      Size = 8
    end
    object qryHistMovANOMESCOBR: TStringField
      FieldName = 'ANOMESCOBR'
      Size = 44
    end
    object qryHistMovANOMESCOB: TStringField
      FieldName = 'ANOMESCOB'
      Size = 8
    end
    object qryHistMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryHistMovFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryHistMovFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryHistMovFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryHistMovFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object qryHistMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistMovHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryHistMovHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryHistMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryHistMovHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryHistMovPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryHistMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryHistMovIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryHistMovEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 18
    end
    object qryHistMovFORMACOBRANCA: TStringField
      FieldName = 'FORMACOBRANCA'
      Size = 10
    end
    object qryHistMovTIPOFOLHA: TStringField
      FieldName = 'TIPOFOLHA'
      Size = 13
    end
    object qryHistMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryHistMovHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistMovHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovHMEDATAQUITABONO: TDateTimeField
      FieldName = 'HMEDATAQUITABONO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryHistMovFLGBAIXAMANUAL: TFloatField
      FieldName = 'FLGBAIXAMANUAL'
    end
    object qryHistMovFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryHistMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryHistMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
  end
  object dtsHistMov: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMov
    Left = 480
  end
  object dtsHistMovVirtual: TwwDataSource
    AutoEdit = False
    DataSet = qryHistMovVirtual
    Left = 560
    Top = 16
  end
  object qryHistMovVirtual: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' '#39'12345678901234567890123456789012345678901234567890'#39' AS ITEDESC' +
        'RICAO,'
      ' '#39'Concessão'#39' AS EVENTO,'
      ''
      ' HME.IDCONTRATOEMPTMO , HME.IDITEMEMPTMO   ,'
      ' HME.HMEDATAPREVISTA  , HME.HMEVLRPREVISTO , HME.HMESALDODEV'
      ''
      'FROM'
      ' HISTMOVEMPTMO HME'
      'WHERE'
      ' HME.IDCONTRATOEMPTMO = -1'
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updHistMovVirtual
    ValidateWithMask = True
    Left = 560
    object qryHistMovVirtualITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryHistMovVirtualEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 9
    end
    object qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovVirtualIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryHistMovVirtualHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
    object qryHistMovVirtualHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
      DisplayFormat = '#,#0.00;(#,#0.00)'
    end
  end
  object updHistMovVirtual: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  ITEDESCRICAO = :ITEDESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  HMEDATAPREVISTA = :HMEDATAPREVISTA,'
      '  HMEVLRPREVISTO = :HMEVLRPREVISTO,'
      '  HMESALDODEV = :HMESALDODEV'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into HISTMOVEMPTMO'
      
        '  (ITEDESCRICAO, EVENTO, IDCONTRATOEMPTMO, IDITEMEMPTMO, HMEDATA' +
        'PREVISTA, '
      '   HMEVLRPREVISTO, HMESALDODEV)'
      'values'
      
        '  (:ITEDESCRICAO, :EVENTO, :IDCONTRATOEMPTMO, :IDITEMEMPTMO, :HM' +
        'EDATAPREVISTA, '
      '   :HMEVLRPREVISTO, :HMESALDODEV)')
    DeleteSQL.Strings = (
      'delete from HISTMOVEMPTMO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 512
    Top = 56
  end
  object qryContratoAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCONTRATOEMPTMO'
      'FROM'
      '   CONTRATOEMPTMO'
      'WHERE'
      '   IDCONTRQUITACAO = :PIDCONTRATOEMPTMO'
      'ORDER BY'
      '   IDCONTRATOEMPTMO DESC')
    ValidateWithMask = True
    Left = 664
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoAnteriorIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
  end
  object qryHistoricoMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HST.IDHISTMOVEMPTMO,'
      '   HST.IDCONTRATOEMPTMO,'
      '   HST.CODDOCUMENTO,'
      '   HST.HMEFORMACOBRANCA, HST.HMEANOCOMPETENCIA,'
      '   HST.HMEMESCOBRANCA,   HST.HMEMESCOMPETENCIA,'
      '   HST.HMEANOCOBRANCA,'
      '   HST.HMECENTRALIZA,'
      '   HST.HMEDESTACADO,'
      '   HST.HMEVLRPREVISTO,'
      '   HST.FLGENVIO,'
      '   HSTP.PLNCODIGO,'
      '   HST.HMEDATAPREVISTA,'
      '   DOC.STATUS'
      ''
      'FROM'
      '   HISTMOVEMPTMO HST,'
      '   DOCUMENTO DOC,'
      '   (SELECT DISTINCT PLNCODIGO'
      '    FROM   HISTMOVEMPTMO'
      '    WHERE  ( IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO )'
      '    AND    ( HMETIPOMOV = :PHMEORIGEM )'
      '    AND    ( HMECENTRALIZA = 0 )'
      '    AND    ( (FLGESTORNADO = 0) OR (FLGESTORNADO IS NULL) )'
      '    AND    ( HMEDATAEFETIVA IS NULL) ) HSTP'
      ''
      'WHERE'
      '   ( HST.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HST.HMETIPOMOV =:PHMEORIGEM )'
      '   AND ( HST.HMECENTRALIZA = 1 )'
      '   AND ( (HST.FLGESTORNADO = 0) OR (HST.FLGESTORNADO IS NULL) )'
      '   AND ( HST.CODDOCUMENTO = DOC.CODDOCUMENTO(+) )'
      '   AND ( HST.PLNCODIGO = HSTP.PLNCODIGO(+) )'
      ''
      '')
    ValidateWithMask = True
    Left = 296
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PHMEORIGEM'
        ParamType = ptUnknown
      end>
    object qryHistoricoMovIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDHISTMOVEMPTMO'
    end
    object qryHistoricoMovIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryHistoricoMovCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.CODDOCUMENTO'
    end
    object qryHistoricoMovHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoMovHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMECENTRALIZA'
    end
    object qryHistoricoMovHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEDESTACADO'
    end
    object qryHistoricoMovHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.HMEVLRPREVISTO'
    end
    object qryHistoricoMovFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.FLGENVIO'
    end
    object qryHistoricoMovPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.HISTMOVEMPTMO.PLNCODIGO'
    end
    object qryHistoricoMovSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'BASEDADOS.DOCUMENTO.STATUS'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoMovHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryHistoricoMovHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryHistoricoMovHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryHistoricoMovHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryHistoricoMovHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   TIP.IDTIPOCONTREMPTMO, TIP.TCEDESCRICAO  , TIP.IDTIPOEMPTMO  ' +
        ','
      
        '   TIP.IDREGRAJURCONC   , TIP.IDREGRAELEG   , TIP.IDREGRALIMITES' +
        ','
      
        '   TIP.IDREGRAPRAZOSCONC, TIP.IDREGRAMARGEM , TIP.IDREGRARESERVA' +
        ','
      
        '   TIP.FLGOBRIGBENEF,     TIP.IDREGRASALBAS , TIP.MOECODIGO, TIP' +
        '.FLGCONCESSAOZERO,'
      
        '   TEM.DESCTIPOEMPTMO   , TEM.TEPMAXCONTRATO, TIP.TCEMINRENOVA, ' +
        'TIP.IDREGRADATACRED,'
      '   NVL(TIP.FLGEXCLUIALT, 0) AS FLGEXCLUIALT,'
      '   NVL(TIP.FLGNAOVERIFICAMRGPCL, 0) AS FLGNAOVERIFICAMRGPCL'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO TEM'
      ''
      'WHERE'
      '       ( TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO )'
      '   AND ( TIP.IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO )'
      '   AND ( TIP.FLGSITUACAO = '#39'A'#39' )'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 608
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoContratoIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAJURCONC'
    end
    object qryTipoContratoIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAELEG'
    end
    object qryTipoContratoIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRALIMITES'
    end
    object qryTipoContratoIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAPRAZOSCONC'
    end
    object qryTipoContratoIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRAMARGEM'
    end
    object qryTipoContratoIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDREGRARESERVA'
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoTEPMAXCONTRATO: TFloatField
      FieldName = 'TEPMAXCONTRATO'
    end
    object qryTipoContratoFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.FLGOBRIGBENEF'
    end
    object qryTipoContratoIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
    end
    object qryTipoContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryTipoContratoFLGCONCESSAOZERO: TFloatField
      FieldName = 'FLGCONCESSAOZERO'
    end
    object qryTipoContratoTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryTipoContratoIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
    end
    object qryTipoContratoFLGEXCLUIALT: TFloatField
      FieldName = 'FLGEXCLUIALT'
    end
    object qryTipoContratoFLGNAOVERIFICAMRGPCL: TFloatField
      FieldName = 'FLGNAOVERIFICAMRGPCL'
    end
  end
  object qryAlteracaoAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HME.IDCONTRATOEMPTMO) AS QUANT'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO     =:PIDCONTRATOEMPTMO'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND HME.HMETIPOMOV           = 0'
      '   AND (HME.HMEORIGEM           = 13 OR HME.HMESEQCOBRANCA > 1)')
    ValidateWithMask = True
    Left = 664
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryAlteracaoAnteriorQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qryItemXTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NVL(FLGVLRALTERACONC, 0) AS FLGVLRALTERACONC'
      'FROM'
      '   ITEMXTIPOCONTR'
      'WHERE'
      '       IDITEMEMPTMO      =:PIDITEMEMPTMO'
      '   AND IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 36
    Top = 375
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryItemXTipoContrFLGVLRALTERACONC: TFloatField
      FieldName = 'FLGVLRALTERACONC'
    end
  end
end
