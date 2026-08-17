inherited FrmEncerraConciliacao: TFrmEncerraConciliacao
  Left = 225
  Top = 151
  HelpContext = 160097
  Caption = 'Encerramento de Conciliação'
  ClientHeight = 426
  ClientWidth = 715
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 715
    Height = 387
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 293
      Height = 72
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 9
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 165
        Top = 9
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object CbMes: TComboBox
        Left = 9
        Top = 23
        Width = 144
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = CbMesChange
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
      object SpEdAno: TSpinEdit
        Left = 165
        Top = 23
        Width = 65
        Height = 22
        MaxValue = 3000
        MinValue = 1900
        TabOrder = 1
        Value = 2005
      end
    end
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 73
      Width = 713
      Height = 313
      ActivePage = tbsContasaReceber
      Align = alBottom
      HotTrack = True
      TabOrder = 1
      OnChange = pgcPrincipalChange
      object tbsContasaReceber: TTabSheet
        Caption = 'Valores recebidos do INSS'
        ImageIndex = 1
        object Label6: TLabel
          Left = 0
          Top = 166
          Width = 69
          Height = 13
          Caption = 'Observação'
        end
        object MemoObsCR: TMemo
          Left = 0
          Top = 180
          Width = 705
          Height = 105
          Align = alBottom
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 705
          Height = 163
          Align = alTop
          TabOrder = 1
          object Label9: TLabel
            Left = 142
            Top = 9
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label27: TLabel
            Left = 10
            Top = 9
            Width = 47
            Height = 13
            Caption = 'Emissão'
          end
          object Label28: TLabel
            Left = 10
            Top = 84
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Bevel3: TBevel
            Left = 289
            Top = 6
            Width = 6
            Height = 151
          end
          object Label29: TLabel
            Left = 320
            Top = 9
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label30: TLabel
            Left = 320
            Top = 46
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label13: TLabel
            Left = 10
            Top = 46
            Width = 87
            Height = 13
            Caption = 'Disponibilidade'
          end
          object Label11: TLabel
            Left = 10
            Top = 121
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label14: TLabel
            Left = 122
            Top = 46
            Width = 134
            Height = 13
            Caption = 'Número do Documento '
          end
          object Label16: TLabel
            Left = 228
            Top = 64
            Width = 7
            Height = 13
            Caption = '/'
          end
          object SpeedButton1: TSpeedButton
            Left = 673
            Top = 99
            Width = 22
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
              33333333373F33333333333330B03333333333337F7F33333333333330F03333
              333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
              333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
              333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
              3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
              33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
              33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
              03333337777777F7F33333330000000003333337777777773333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = SpeedButton1Click
          end
          object Label33: TLabel
            Left = 320
            Top = 84
            Width = 126
            Height = 13
            Caption = 'Tipo de Recebimento '
          end
          object Label34: TLabel
            Left = 320
            Top = 121
            Width = 111
            Height = 13
            Caption = 'Forma de Cobrança'
          end
          object EdDtVencimentoCR: TCMDateTimePicker
            Left = 142
            Top = 22
            Width = 124
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
            OnExit = EdDtVencimentoCRExit
          end
          object EdDtEmissaoCR: TCMDateTimePicker
            Left = 10
            Top = 22
            Width = 124
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
          object EdReferenciaCR: TEdit
            Left = 10
            Top = 98
            Width = 255
            Height = 21
            TabOrder = 5
          end
          object DbLkcCentroResponCR: TwwDBLookupCombo
            Left = 320
            Top = 22
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Responsabilidade')
            LookupTable = qryCResponUsuario
            LookupField = 'CODCENTRORESPON'
            Options = [loTitles]
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DbLkcCentroCustoCR: TwwDBLookupCombo
            Left = 320
            Top = 61
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
            LookupTable = qryCCUsuario
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            TabOrder = 8
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object EdDtDisponibilidade: TCMDateTimePicker
            Left = 10
            Top = 61
            Width = 106
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
          object DbLkcTipoDocCR: TwwDBLookupCombo
            Left = 10
            Top = 135
            Width = 255
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            LookupTable = qryTpDocCR
            LookupField = 'CODTIPDOC'
            Options = [loTitles]
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object EdNoDocumentoCR: TEdit
            Left = 122
            Top = 61
            Width = 106
            Height = 21
            MaxLength = 22
            TabOrder = 3
          end
          object EdComplementoCR: TEdit
            Left = 236
            Top = 61
            Width = 29
            Height = 21
            MaxLength = 3
            TabOrder = 4
          end
          object EdTipoDesembCR: TEdit
            Tag = 1
            Left = 320
            Top = 98
            Width = 352
            Height = 21
            TabOrder = 9
          end
          object DbLkcFormaPgtoCR: TwwDBLookupCombo
            Left = 320
            Top = 135
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição'#9'F')
            LookupTable = qryFormaPgtoCR
            LookupField = 'CODFORMA'
            Options = [loTitles]
            TabOrder = 10
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      object tbsContasaPagar: TTabSheet
        Caption = 'Valores do repasse para Caixa'
        object Label17: TLabel
          Left = 0
          Top = 215
          Width = 69
          Height = 13
          Caption = 'Observação'
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 705
          Height = 163
          Align = alTop
          TabOrder = 0
          object Label3: TLabel
            Left = 142
            Top = 9
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label4: TLabel
            Left = 10
            Top = 9
            Width = 47
            Height = 13
            Caption = 'Emissão'
          end
          object Label5: TLabel
            Left = 10
            Top = 84
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Bevel1: TBevel
            Left = 289
            Top = 6
            Width = 6
            Height = 151
          end
          object Label7: TLabel
            Left = 320
            Top = 9
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label8: TLabel
            Left = 320
            Top = 46
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label10: TLabel
            Left = 10
            Top = 121
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object Label15: TLabel
            Left = 117
            Top = 65
            Width = 7
            Height = 13
            Caption = '/'
          end
          object Label12: TLabel
            Left = 10
            Top = 46
            Width = 130
            Height = 13
            Caption = 'Número do Documento'
          end
          object Label31: TLabel
            Left = 320
            Top = 121
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object sbtnCODTIPDESEMBPROV: TSpeedButton
            Left = 673
            Top = 99
            Width = 22
            Height = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -24
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
              33333333373F33333333333330B03333333333337F7F33333333333330F03333
              333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
              333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
              333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
              3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
              33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
              33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
              03333337777777F7F33333330000000003333337777777773333}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbtnCODTIPDESEMBPROVClick
          end
          object Label32: TLabel
            Left = 320
            Top = 84
            Width = 120
            Height = 13
            Caption = 'Tipo de Desembolso '
          end
          object EdDtVencimentoCP: TCMDateTimePicker
            Left = 142
            Top = 22
            Width = 124
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
          object EdDtEmissaoCP: TCMDateTimePicker
            Left = 10
            Top = 22
            Width = 124
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
          object EdReferenciaCP: TEdit
            Left = 10
            Top = 98
            Width = 255
            Height = 21
            TabOrder = 4
          end
          object DbLkcCentroResponCP: TwwDBLookupCombo
            Left = 320
            Top = 22
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Responsabilidade')
            LookupTable = qryCResponUsuario
            LookupField = 'CODCENTRORESPON'
            Options = [loTitles]
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DbLkcCentroCustoCP: TwwDBLookupCombo
            Left = 320
            Top = 61
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'CODCENTROCUSTO'#9'10'#9'Código'#9'F')
            LookupTable = qryCCUsuario
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            TabOrder = 7
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DbLkcTipoDocCP: TwwDBLookupCombo
            Left = 10
            Top = 135
            Width = 255
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            LookupTable = qryTpDocCP
            LookupField = 'CODTIPDOC'
            Options = [loTitles]
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object EdNoDocumentoCP: TEdit
            Left = 11
            Top = 61
            Width = 106
            Height = 21
            MaxLength = 22
            TabOrder = 2
          end
          object EdComplementoCP: TEdit
            Left = 125
            Top = 61
            Width = 29
            Height = 21
            MaxLength = 3
            TabOrder = 3
          end
          object DbLkcFormaPgtoCP: TwwDBLookupCombo
            Left = 320
            Top = 135
            Width = 376
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'30'#9'Descrição'#9'F')
            LookupTable = qryFormaPgtoCP
            LookupField = 'CODFORMA'
            Options = [loTitles]
            TabOrder = 9
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object EdTipoDesembCP: TEdit
            Tag = 1
            Left = 320
            Top = 98
            Width = 352
            Height = 21
            TabOrder = 8
          end
        end
        object MemoObsCP: TMemo
          Left = 0
          Top = 231
          Width = 705
          Height = 54
          Align = alBottom
          TabOrder = 1
        end
        object GbAlterador: TGroupBox
          Left = 0
          Top = 166
          Width = 705
          Height = 44
          Caption = ' Alterador '
          TabOrder = 2
          object Label35: TLabel
            Left = 18
            Top = 20
            Width = 99
            Height = 13
            Caption = 'Tipo de Alterador'
          end
          object Label36: TLabel
            Left = 454
            Top = 20
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object DbLkcAlterador: TwwDBLookupCombo
            Left = 135
            Top = 16
            Width = 255
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            LookupTable = qryAlterador
            LookupField = 'CODALTERADOR'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object EdValorAlterador: TDBRealEdit
            Left = 495
            Top = 16
            Width = 148
            Height = 21
            Alignment = taRightJustify
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
      end
      object tbsVerificar: TTabSheet
        Caption = 'Verificar valores apurados'
        ImageIndex = 4
        OnShow = tbsVerificarShow
        object LblTipoProcesso: TLabel
          Left = 7
          Top = 6
          Width = 239
          Height = 23
          Caption = 'Valores apurados no processo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Impact'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 7
          Top = 233
          Width = 192
          Height = 19
          Caption = 'Quantidade de Lançamentos:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Impact'
          Font.Style = []
          ParentFont = False
        end
        object lblQtdLanc: TLabel
          Left = 215
          Top = 232
          Width = 9
          Height = 20
          Caption = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Impact'
          Font.Style = []
          ParentFont = False
        end
        object DbGrdValoresApurados: TwwDBGrid
          Left = 7
          Top = 31
          Width = 690
          Height = 194
          Selected.Strings = (
            'MANTENEDORA'#9'27'#9'Mantenedora'
            'ENTIDADE_CONTABIL'#9'22'#9'Entidade Contábil'
            'PLANO_PREVIDENCIARIO'#9'27'#9'Plano Previdenviário'
            'LIQUIDO'#9'15'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsValores
          TabOrder = 0
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
        object BtConfirmaLancamentos: TBitBtn
          Left = 518
          Top = 231
          Width = 177
          Height = 25
          Caption = 'Executa Lançamentos '
          TabOrder = 1
          OnClick = BtConfirmaLancamentosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000C40E0000C40E00001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777887777777777777F8877777777777700F077
            777777777F8878777777777700FFF077777777778888787777777700F4FFFF07
            7777778877877F877777778F444FCF077777778F8888878777777784444FFFF0
            77777788888887F8777777444444FCF077777888F87F8878777774444F444FFF
            077778888F88887F877774448FF44FCFF07777878F77F887787777478FFC44FF
            FF07777787F888877F87777778FFF44F88777777787F778888777777778FFF44
            F77777777787FF88877777777778887447777777777888778777}
          NumGlyphs = 2
        end
        object BtCancelaLancamentos: TBitBtn
          Left = 518
          Top = 257
          Width = 177
          Height = 25
          Caption = 'Cancela  Lançamentos '
          TabOrder = 2
          OnClick = BtCancelaLancamentosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
        end
      end
      object tbsCARSGerados: TTabSheet
        Caption = 'Contas a Receber Gerados'
        ImageIndex = 3
        object Label21: TLabel
          Left = 2
          Top = 0
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label23: TLabel
          Left = 161
          Top = -1
          Width = 63
          Height = 13
          Caption = 'Referência'
        end
        object Label24: TLabel
          Left = 550
          Top = 0
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label25: TLabel
          Left = 2
          Top = 121
          Width = 38
          Height = 13
          Caption = 'Rateio'
        end
        object DBEdit2: TDBEdit
          Left = 161
          Top = 15
          Width = 376
          Height = 21
          DataField = 'REFERENCIA'
          DataSource = dtsDocumentoCR
          TabOrder = 0
        end
        object DbEdValorDocumentoCR: TDBRealEdit
          Left = 551
          Top = 15
          Width = 148
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALOR'
          DataSource = dtsDocumentoCR
        end
        object DBMemo1: TDBMemo
          Left = 2
          Top = 41
          Width = 698
          Height = 76
          DataField = 'OBS'
          DataSource = dtsDocumentoCR
          TabOrder = 2
        end
        object DbLkcDocumentoCAR: TwwDBLookupCombo
          Left = 2
          Top = 15
          Width = 141
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NODOCUMENTO'#9'10'#9'Documentos'#9'F')
          LookupTable = qryDocumentoCAR
          LookupField = 'NODOCUMENTO'
          Options = [loTitles]
          AutoSelect = False
          Enabled = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnChange = DbLkcDocumentoCARChange
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 135
          Width = 705
          Height = 150
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Tipo de Recebimento'#9'T'
            'VALOR'#9'25'#9'Rateio'#9'T'
            'NOMEPLANOCONTABIL'#9'29'#9'Entidade Contábil'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dtsRateioCAR
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object tbsCAPSGErados: TTabSheet
        Caption = 'Contas a Pagar Gerados'
        ImageIndex = 2
        object Label18: TLabel
          Left = 161
          Top = -1
          Width = 63
          Height = 13
          Caption = 'Referência'
        end
        object Label19: TLabel
          Left = 2
          Top = 0
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object Label20: TLabel
          Left = 2
          Top = 153
          Width = 38
          Height = 13
          Caption = 'Rateio'
        end
        object Label22: TLabel
          Left = 550
          Top = 0
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label37: TLabel
          Left = 0
          Top = 126
          Width = 142
          Height = 13
          Caption = 'Alterador do Documento '
        end
        object DbLkcDocumentoCAP: TwwDBLookupCombo
          Left = 2
          Top = 15
          Width = 141
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NODOCUMENTO'#9'10'#9'Documento'#9'F')
          LookupTable = qryDocumentoCAP
          LookupField = 'NODOCUMENTO'
          Options = [loTitles]
          AutoSelect = False
          Enabled = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          OnChange = DbLkcDocumentoCAPChange
        end
        object DBEdit1: TDBEdit
          Left = 161
          Top = 15
          Width = 376
          Height = 21
          DataField = 'REFERENCIA'
          DataSource = dtsDocumentoCP
          TabOrder = 1
        end
        object DbEdValorDocumentoCP: TDBRealEdit
          Left = 551
          Top = 15
          Width = 148
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALOR'
          DataSource = dtsDocumentoCP
        end
        object DBMemo2: TDBMemo
          Left = 2
          Top = 41
          Width = 698
          Height = 72
          DataField = 'OBS'
          DataSource = dtsDocumentoCP
          TabOrder = 3
        end
        object wwDBGrid2: TwwDBGrid
          Left = 0
          Top = 168
          Width = 705
          Height = 117
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Tipo de Desembolso'#9'F'
            'VALOR'#9'25'#9'Rateio'#9'F'
            'NOMEPLANOCONTABIL'#9'29'#9'Entidade Contábil'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alBottom
          DataSource = dtsRateioCAP
          ReadOnly = True
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object PnlAlterador: TPanel
          Left = 145
          Top = 122
          Width = 391
          Height = 21
          Alignment = taLeftJustify
          BevelOuter = bvLowered
          Caption = ' Alterador'
          TabOrder = 5
        end
        object EdDemonstraAlterador: TDBRealEdit
          Left = 552
          Top = 122
          Width = 148
          Height = 21
          Alignment = taRightJustify
          Color = clBtnFace
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object Panel4: TPanel
      Left = 294
      Top = 1
      Width = 420
      Height = 72
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Label26: TLabel
        Left = 24
        Top = 8
        Width = 105
        Height = 16
        Caption = 'Encerramentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Visible = False
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 28
        Width = 217
        Height = 17
        Caption = 'Gerar Contas a Receber do INSS'
        TabOrder = 0
        Visible = False
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 46
        Width = 273
        Height = 17
        Caption = 'Gerar Contas a Pagar/Receber da CEF'
        TabOrder = 1
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 543
      DockPos = 548
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      inherited ToolbarSep971: TToolbarSep97
        Left = 351
      end
      object Separador: TToolbarSep97 [1]
        Left = 89
        Top = 0
        Blank = True
        SizeHorz = 3
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 92
        Width = 89
        Caption = '&Confirmar'
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 266
        Width = 85
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object BtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 89
        Height = 33
        Caption = '&Processar'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = BtnProcessarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
          FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
          00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
          F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
          00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
          F033777777777337F73309999990FFF0033377777777FFF77333099999000000
          3333777777777777333333399033333333333337773333333333333903333333
          3333333773333333333333303333333333333337333333333333}
        NumGlyphs = 2
      end
      object BtnDesfazer: TBitBtn
        Left = 181
        Top = 0
        Width = 85
        Height = 33
        Cancel = True
        Caption = '&Desfazer'
        TabOrder = 3
        OnClick = BtnDesfazerClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  object treeTpReceb: TCMTreeView [2]
    Left = 608
    Top = 120
    Width = 382
    Height = 102
    PodeNavegar = True
    Mascara = '99.99.99'
    DataSource = dtsTpReceb
    CampoChave = qryTpRecebCODTIPRECDES
    CampoDescricao = qryTpRecebDESCRICAO
    CampoTipo = qryTpRecebANASINT
    OnDblClick = treeTpRecebDblClick
    OnExit = treeTpRecebExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  object treeTpPaga: TCMTreeView [3]
    Left = 608
    Top = 96
    Width = 382
    Height = 102
    PodeNavegar = True
    Mascara = '99.99.99'
    DataSource = dtsTpPaga
    CampoChave = qryTpPagaCODTIPRECDES
    CampoDescricao = qryTpPagaDESCRICAO
    CampoTipo = qryTpPagaANASINT
    OnDblClick = treeTpPagaDblClick
    OnExit = treeTpPagaExit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 0
    TargetsData = (
      1
      5
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryAux
    Left = 648
    Top = 264
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT D.REFERENCIA, D.OBS, D.NODOCUMENTO, L.VALOR, '#39'0090001'#39' AS' +
        ' CODTIPRECDES,'
      '       2 AS IDPLANOPREV, R.VALOR, '#39'REEMBOLSO INNS'#39' AS DESCRICAO,'
      
        '       decode(r.idplanoprev,1,'#39'REG-REPLAN'#39', 2, '#39'REB 1 CAIXA'#39', 3,' +
        #39'REB/CAIXA'#39','
      
        '              4, '#39'CAIXA/EX-PREVHAB'#39', 5, '#39'REB 2002'#39', 6,'#39'REPLAN/EX' +
        '-PREVHAB'#39', 7,'#39'EMPREGADOS FUNCEF'#39')'
      ' AS NOME'
      
        'FROM DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB ' +
        'TP, PLANPREVCONTABIL PL'
      'WHERE D.CODDOCUMENTO = 130092 AND'
      '      D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '      D.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '      R.CODTIPRECDES = TP.CODTIPRECDES AND'
      '      D.RECPAG       = TP.RECPAG(+) AND'
      '      R.IDPLANOPREV  = PL.IDPLANOPREV(+)')
    ValidateWithMask = True
    Left = 640
    Top = 328
  end
  object dtsTpReceb: TwwDataSource
    DataSet = qryTpReceb
    Left = 328
    Top = 344
  end
  object qryTpReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODTIPRECDES, DESCRICAO, ANASINT'
      'FROM   '
      '  TIPORECEBDESEMB'
      'WHERE  '
      '  IDPESSOA = :IDEMPRESA AND    '
      '  RECPAG = '#39'R'#39'                      AND   '
      '  ATIVO = '#39'S'#39
      'ORDER BY '
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 328
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTpRecebCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryTpRecebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpRecebANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
  object dtsTpPaga: TwwDataSource
    DataSet = qryTpPaga
    Left = 256
    Top = 344
  end
  object qryTpPaga: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODTIPRECDES, DESCRICAO,  ANASINT'
      'FROM   '
      '  TIPORECEBDESEMB'
      'WHERE  '
      '  IDPESSOA = :IDEMPRESA AND    '
      '  RECPAG = '#39'P'#39
      'ORDER BY '
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 256
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryTpPagaCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryTpPagaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTpPagaANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.TIPORECEBDESEMB.ANASINT'
      FixedChar = True
      Size = 1
    end
  end
  object dtsRateioCAP: TwwDataSource
    DataSet = qryRateioCAP
    Left = 408
    Top = 344
  end
  object qryRateioCAP: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  D.REFERENCIA, D.OBS, D.NODOCUMENTO,'
      '  R.VALOR,'
      '  L.VALOR,'
      '  R.CODTIPRECDES,'
      '  '#39'0090001'#39' AS CODTIPRECDES2, R.IDPLANOPREV,'
      '  TP.DESCRICAO,'
      '  PL.NOME AS NOMEPLANOCONTABIL,'
      '  DECODE(R.IDPLANOPREV,1,'#39'REG-REPLAN'#39','
      '                       2,'#39'REB 1 CAIXA'#39','
      '                       3,'#39'REB/CAIXA'#39','
      '                       4,'#39'CAIXA/EX-PREVHAB'#39','
      '                       5,'#39'REB 2002'#39','
      '                       6,'#39'REPLAN/EX-PREVHAB'#39','
      '                       7,'#39'EMPREGADOS FUNCEF'#39') AS NOME'
      'FROM'
      
        '  DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R, TIPORECEBDESEMB TP,' +
        ' PLANPREVCONTABIL PL'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO      AND'
      '  L.OPERACAO     = '#39'2'#39'                AND '
      '  D.CODDOCUMENTO = L.CODDOCUMENTO     AND'
      '  D.CODDOCUMENTO = R.CODDOCUMENTO     AND'
      '  R.CODTIPRECDES = TP.CODTIPRECDES    AND'
      '  D.RECPAG       = TP.RECPAG(+)       AND'
      '  R.IDPLANOPREV  = PL.IDPLANOPREV(+)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    PictureMasks.Strings = (
      
        'DESCRICAO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]' +
        ']),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]]' +
        '}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 408
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryRateioCAPREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object qryRateioCAPOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryRateioCAPNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryRateioCAPVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryRateioCAPVALOR_1: TFloatField
      FieldName = 'VALOR_1'
    end
    object qryRateioCAPCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 7
    end
    object qryRateioCAPIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryRateioCAPDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 14
    end
    object qryRateioCAPNOMEPLANOCONTABIL: TStringField
      FieldName = 'NOMEPLANOCONTABIL'
      Size = 50
    end
    object qryRateioCAPNOME: TStringField
      FieldName = 'NOME'
      Size = 17
    end
    object qryRateioCAPCODTIPRECDES2: TStringField
      FieldName = 'CODTIPRECDES2'
      FixedChar = True
      Size = 7
    end
  end
  object dtsRateioCAR: TwwDataSource
    DataSet = qryRateioCAR
    Left = 488
    Top = 344
  end
  object qryRateioCAR: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  D.REFERENCIA, D.OBS, D.NODOCUMENTO,'
      '  R.VALOR,'
      '  L.VALOR AS VALOR1,'
      '  R.CODTIPRECDES, R.IDPLANOPREV,'
      '  '#39'0090001'#39' AS CODTIPRECDES2,'
      '  TP.DESCRICAO AS DESCRICAO,'
      '  PL.NOME AS NOMEPLANOCONTABIL,'
      '  DECODE(R.IDPLANOPREV,1,'#39'REG-REPLAN'#39','
      '                       2,'#39'REB 1 CAIXA'#39','
      '                       3,'#39'REB/CAIXA'#39','
      '                       4,'#39'CAIXA/EX-PREVHAB'#39','
      '                       5,'#39'REB 2002'#39','
      '                       6,'#39'REPLAN/EX-PREVHAB'#39','
      '                       7,'#39'EMPREGADOS FUNCEF'#39') AS NOME'
      'FROM'
      
        '  DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,  TIPORECEBDESEMB TP' +
        ','
      '  PLANPREVCONTABIL PL'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO      AND'
      '  L.OPERACAO     = '#39'2'#39'                AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO     AND'
      '  D.CODDOCUMENTO = R.CODDOCUMENTO     AND'
      '  R.CODTIPRECDES = TP.CODTIPRECDES    AND'
      '  D.RECPAG       = TP.RECPAG(+)       AND'
      '  R.IDPLANOPREV  = PL.IDPLANOPREV(+)'
      '')
    ControlType.Strings = (
      'DESCRICAO;CustomEdit;DbLkcTipoRecebimento'
      'CODTIPRECDES;CustomEdit;DbLkcTipoRecebimento')
    ValidateWithMask = True
    Left = 488
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
    object qryRateioCARREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object qryRateioCAROBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryRateioCARNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryRateioCARVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryRateioCARVALOR1: TFloatField
      FieldName = 'VALOR1'
    end
    object qryRateioCARCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryRateioCARIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryRateioCARCODTIPRECDES2: TStringField
      FieldName = 'CODTIPRECDES2'
      FixedChar = True
      Size = 7
    end
    object qryRateioCARDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 14
    end
    object qryRateioCARNOMEPLANOCONTABIL: TStringField
      FieldName = 'NOMEPLANOCONTABIL'
      Size = 50
    end
    object qryRateioCARNOME: TStringField
      FieldName = 'NOME'
      Size = 17
    end
  end
  object qryDocumentoCAP: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  D.REFERENCIA, D.OBS, D.NODOCUMENTO, D.CODDOCUMENTO,'
      '  L.VALOR'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO      AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO     ')
    ValidateWithMask = True
    Left = 192
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object dtsDocumentoCP: TwwDataSource
    DataSet = qryDocumentoCAP
    Left = 192
    Top = 264
  end
  object qryDocumentoCAR: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '  D.REFERENCIA, D.OBS, D.NODOCUMENTO, D.CODDOCUMENTO,'
      '  L.VALOR'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L'
      'WHERE'
      '  D.CODDOCUMENTO = :CODDOCUMENTO      AND'
      '  D.CODDOCUMENTO = L.CODDOCUMENTO     ')
    ValidateWithMask = True
    Left = 296
    Top = 280
    ParamData = <
      item
        DataType = ftString
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
  end
  object dtsDocumentoCR: TwwDataSource
    DataSet = qryDocumentoCAR
    Left = 296
    Top = 264
  end
  object dtsValores: TwwDataSource
    DataSet = qryValoresCR
    Left = 56
    Top = 376
  end
  object qryValoresCR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VAL.IDPLANOPREV,'
      '   VAL.IDPLANOPREVPREV,'
      '   VAL.PLANOPRECONTABIL AS ENTIDADE_CONTABIL,'
      '   CASE'
      
        '     WHEN VAL.IDPLANOPREV = 66 AND VAL.IDPLANOPREVPREV = 66 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 22 AND VAL.IDPLANOPREVPREV = 66 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 22 AND VAL.IDPLANOPREVPREV = 02 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 19 AND VAL.IDPLANOPREVPREV = 19 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 66 THEN' +
        ' '#39'FUNCEF'#39
      ''
      
        '     WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 74 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 02 THEN' +
        ' '#39'FUNCEF'#39
      ''
      
        '     WHEN VAL.IDPLANOPREV = 75 AND VAL.IDPLANOPREVPREV = 74 THEN' +
        ' '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 74 AND VAL.IDPLANOPREVPREV = 74 THEN' +
        ' '#39'FUNCEF'#39
      ''
      
        '     WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 02 AND ' +
        'M.CODMANTENEDORA IS NULL                  THEN '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 02 AND ' +
        '(M.CODMANTENEDORA NOT IN (99,3,5,2,6))    THEN '#39'FUNCEF'#39
      
        '     WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV IS NULL A' +
        'ND (NVL(M.CODMANTENEDORA, 0) NOT IN (99,3,5,2,6)) THEN '#39'FUNCEF'#39
      '   ELSE'
      '     VAL.PLANO'
      '   END AS MANTENEDORA,'
      '   TRIM(VAL.PLANOPREV) AS PLANO_PREVIDENCIARIO,'
      '  (SUM(CREDITO) - SUM(DESCONTO) - SUM(GLOSA)) LIQUIDO'
      'FROM'
      ''
      ' ('
      '  --CREDITO BRUTO'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA1) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =:MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (    (SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA2) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA3) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA4) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- CREDITO NA REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA1) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA2) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA3) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA4) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- CREDITO ANTERIOR A REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A1) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A2) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '     SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A3) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A4) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA1) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA2) DESCONTO,0 CRED_REF, 0 DESC_REF,' +
        ' 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '   SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA3) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA4) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO NA REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA1) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA2) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA3) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA4) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      ''
      '  GROUP BY SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO ANTERIOR A REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA1) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA1,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA2) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA2,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA3) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA3,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA4) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA4,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA1,2,1),'#39'1'#39',VLRRUB' +
        'RICA1,'#39'2'#39',-VLRRUBRICA1))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA1,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA2,2,1),'#39'1'#39',VLRRUB' +
        'RICA2,'#39'2'#39',-VLRRUBRICA2)) GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA2,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA3,2,1),'#39'1'#39',VLRRUB' +
        'RICA3,'#39'2'#39',-VLRRUBRICA3))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA3,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, NULL AS IDPLANOPREVPREV,'
      '    '#39'REG/REPLAN'#39' AS PLANOPRECONTABIL,'
      '    '#39'                '#39' AS PLANOPREV,'
      '    '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA4,2,1),'#39'1'#39',VLRRUB' +
        'RICA4,'#39'2'#39',-VLRRUBRICA4))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA4,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  /* VALOR POR MANT. MONTANDO PATROCINADORA I */'
      '  -- CRÉDITO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME PLANO,'
      
        '    SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(D.RUBRICAINSS,2,1),  '#39'1'#39',D.' +
        'VALORINSS,'#39'2'#39',-D.VALORINSS)) GLOSA,'
      '    COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) =  '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- CREDITO - NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '   AND D.MESCOBRANCA =  :MESCOBRANCA'
      '   AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '   AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <> ' +
        '14))'
      
        '   AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOLO' +
        'CAL(+)'
      '   AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '   AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SUB' +
        'STR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '        SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '   AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '        SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '   AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '   AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- CREDITO - ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALORIN' +
        'SS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      ''
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO - NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO - ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLANPR' +
        'EVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    M.NOME'
      ''
      '  UNION'
      ''
      '  /* VALOR POR MANT. MONTANDO PATROCINADORA II */'
      '  -- CRÉDITO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)' +
        '),2,1),  '#39'1'#39',D.VALORINSS,'#39'2'#39',-VALORINSS)) GLOSA,'
      '    COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) = '#39'9'#39' AND  SUB' +
        'STR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      '  UNION'
      ''
      '  -- CRÉDITO NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ''
      '  UNION'
      ''
      '  -- CRÉDITO ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALORIN' +
        'SS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39'  AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME AS PLANOPRECONTABIL,'
      '    PP.NOME AS PLANOPREV,'
      '    PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      
        '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '    AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, D.IDPLANOPREVPREV,'
      '    PPC.NOME,'
      '    PP.NOME,'
      '    PL.NOME'
      ' ) VAL, MANTENEDORA M'
      ''
      'WHERE'
      '  VAL.PLANO = M.NOME(+)'
      'GROUP BY'
      '  VAL.IDPLANOPREV, VAL.IDPLANOPREVPREV,'
      '  VAL.PLANOPRECONTABIL,'
      '   CASE'
      
        '    WHEN VAL.IDPLANOPREV = 66 AND VAL.IDPLANOPREVPREV = 66 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 22 AND VAL.IDPLANOPREVPREV = 66 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 22 AND VAL.IDPLANOPREVPREV = 02 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 19 AND VAL.IDPLANOPREVPREV = 19 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 66 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 74 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 02 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 75 AND VAL.IDPLANOPREVPREV = 74 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 74 AND VAL.IDPLANOPREVPREV = 74 THEN ' +
        #39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 02 AND M' +
        '.CODMANTENEDORA IS NULL                  THEN '#39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV = 02 AND (' +
        'M.CODMANTENEDORA NOT IN (99,3,5,2,6))    THEN '#39'FUNCEF'#39
      
        '    WHEN VAL.IDPLANOPREV = 02 AND VAL.IDPLANOPREVPREV IS NULL AN' +
        'D (NVL(M.CODMANTENEDORA, 0) NOT IN (99,3,5,2,6)) THEN '#39'FUNCEF'#39
      '   ELSE'
      '     VAL.PLANO'
      '  END,'
      '  TRIM(VAL.PLANOPREV)')
    PictureMasks.Strings = (
      'LIQUIDO'#9'###.###.###.##0,00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 56
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptInput
        Value = '2003/12'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end>
    object qryValoresCRMANTENEDORA: TStringField
      DisplayLabel = 'Mantenedora'
      DisplayWidth = 27
      FieldName = 'MANTENEDORA'
      Size = 60
    end
    object qryValoresCRENTIDADE_CONTABIL: TStringField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 22
      FieldName = 'ENTIDADE_CONTABIL'
      Size = 50
    end
    object qryValoresCRPLANO_PREVIDENCIARIO: TStringField
      DisplayLabel = 'Plano Previdenviário'
      DisplayWidth = 27
      FieldName = 'PLANO_PREVIDENCIARIO'
      Size = 50
    end
    object qryValoresCRLIQUIDO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'LIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryValoresCRIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryValoresCRIDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
      Visible = False
    end
  end
  object qryValoresCP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' '#39'REG/REPLAN'#39' AS ENTIDADE_CONTABIL,'
      '  '#39' '#39'  AS PLANO_PREVIDENCIARIO,'
      '  M.NOME AS MANTENEDORA,'
      '  (SUM(CREDITO) - SUM(DESCONTO) - SUM(GLOSA)) AS LIQUIDO'
      'FROM'
      '   ('
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      M.NOME PLANO,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      SUM(D.VALORINSS) CREDITO,'
      
        '      0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_REF, 0 DESC' +
        '_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      ''
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      ''
      '    GROUP BY'
      
        '      UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANOPREVPR' +
        'EV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- GLOSA'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      M.NOME PLANO,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, 0 DESC_ANT_REF,'
      
        '      SUM(DECODE(SUBSTR(D.RUBRICAINSS,2,1),  '#39'1'#39',D.VALORINSS,'#39'2'#39 +
        ',-D.VALORINSS)) GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) =  '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- CREDITO - NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      M.NOME PLANO,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      
        '      0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF,0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- CREDITO - ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      M.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALOR' +
        'INSS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      M.NOME PLANO,'
      
        '      0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO - NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      M.NOME PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, MANTENEDORA M, UFINSS UF, PLANPREV PP, PLAN' +
        'PREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO - ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLANO' +
        'PREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      M.NOME PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D,   MANTENEDORA M,   UFINSS UF, PLANPREV PP, ' +
        'PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      M.NOME'
      ''
      '    UNION'
      '    /* VALOR POR MANT. MONTANDO PATROCINADORA II */'
      '    -- CRÉDITO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- GLOSA'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, 0 DESC_ANT_REF,'
      
        '      SUM(DECODE(SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1),  '#39'1'#39',' +
        'D.VALORINSS,'#39'2'#39',-VALORINSS)) GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) = '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- CRÉDITO NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- CRÉDITO ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALOR' +
        'INSS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39'  AND ' +
        ' SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLAN' +
        'OPREVPREV,'
      '      PPC.NOME AS PLANOPRECONTABIL,'
      '      PP.NOME AS PLANOPREV,'
      '      PL.NOME,'
      
        '      0 CREDITO, 0 DESCONTO,  0 CRED_REF, 0 DESC_REF, 0 CRED_ANT' +
        '_REF, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      
        '      DETCONCINSS D, UFINSS UF, PLANPREVCONTABIL PL, PLANPREV PP' +
        ', PLANPREVCONTABIL PPC'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '      AND (D.IDPLANOPREV = PL.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREV = PPC.IDPLANOPREV(+))'
      '      AND (D.IDPLANOPREVPREV = PP.IDPLANOPREV(+))'
      
        '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, D.IDPLA' +
        'NOPREVPREV,'
      '      PPC.NOME,'
      '      PP.NOME,'
      '      PL.NOME,'
      '      PL.NOME'
      ''
      ') VAL, MANTENEDORA M'
      'WHERE'
      '  VAL.IDPLANOPREV = 2 AND VAL.CODMANTENEDORA IN (5,3,2)'
      '  AND VAL.CODMANTENEDORA = M.CODMANTENEDORA(+)'
      'GROUP BY'
      ' '#39'REG/REPLAN'#39','
      '  '#39' '#39','
      '  M.NOME')
    ValidateWithMask = True
    Left = 56
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end>
  end
  object dtsValoresCP: TwwDataSource
    DataSet = qryValoresCP
    Left = 160
    Top = 344
  end
  object qryTpDocCP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, DESCRICAO'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE '
      '  RECPAG = '#39'P'#39
      'ORDER BY '
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 280
  end
  object qryTpDocCR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, DESCRICAO'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE '
      '  RECPAG = '#39'R'#39
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 264
  end
  object qryFormaPgtoCP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODFORMA, DESCRICAO'
      'FROM'
      '  FORMARECPAG'
      'WHERE '
      '  RECPAG = '#39'P'#39
      'ORDER BY '
      '  DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 552
    Top = 280
  end
  object qryFormaPgtoCR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODFORMA, DESCRICAO'
      'FROM'
      '  FORMARECPAG'
      'WHERE '
      '  RECPAG = '#39'P'#39
      'ORDER BY '
      '  DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 552
    Top = 264
  end
  object qryCResponUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  CR.CODCENTRORESPON, CR.IDPESSOA, CR.NOME, CR.ANALITICOSINTET, ' +
        'CR.IDUSUARIOINCLUSAO,'
      '  CR.RESPONSAVEL, CR.ATIVO, CR.CODEXTERNO, CR.IDPLANCRESPON'
      'FROM   '
      '  CENTRESPON CR, PESSOAXCRESP PXR'
      'WHERE  '
      '  CR.ATIVO = '#39'S'#39' AND'
      '  CR.IDPESSOA = :IDEMPRESA AND'
      '  CR.CODCENTRORESPON = PXR.CODCENTRORESPON AND'
      '  PXR.IDPESSOAACESSO = :IDUSUARIO AND '
      
        '  ( (:IDPLANCRESPON IS NULL) OR (:IDPLANCRESPON IS NOT NULL) AND' +
        ' (CR.IDPLANCRESPON = :IDPLANCRESPON) )'
      'ORDER BY'
      '  CR.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCRESPON'
        ParamType = ptInput
      end>
  end
  object qryCCUsuario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CC.CODCENTROCUSTO, CC.NOME, CC.CODEXTERNO'
      'FROM'
      '  CENTCUST CC, USCCUSTO USC'
      'WHERE'
      '  CC.STATUSGRUPOCDC = '#39'A'#39' AND'
      '  CC.ATIVO = '#39'S'#39' AND'
      '  CC.CODCENTROCUSTO = USC.CODCENTROCUSTO AND'
      '  USC.IDUSUARIO = :IDUSUARIO AND'
      
        '  ( (:IDPLANCENTCUST IS NULL) OR (:IDPLANCENTCUST IS NOT NULL) A' +
        'ND (IDPLANCENTCUST = :IDPLANCENTCUST) )'
      'ORDER BY'
      '  CC.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANCENTCUST'
        ParamType = ptInput
      end>
  end
  object qryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  T.CODALTERADOR, T.DESCRICAO,  T.PLACONTA'
      'FROM'
      '  TIPOALTERADOR T'
      'WHERE'
      '  T.RECPAG =  '#39'P'#39
      'ORDER BY'
      '  T.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 568
    Top = 328
  end
  object qryValoresCROriginal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VAL.IDPLANOPREV,'
      '   VAL.PLANO,'
      '   M.CODTIPREC, M.CODTIPDES,'
      '   (SUM(CREDITO) - SUM(DESCONTO) - SUM(GLOSA)) LIQUIDO'
      'FROM'
      '('
      '  --CREDITO BRUTO'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA1) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =:MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (    (SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '           OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA2) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA3) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    SUM(VLRRUBRICA4) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- CREDITO NA REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA1) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA2) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA3) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(VLRRUBRICA4) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- CREDITO ANTERIOR A REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A1) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A2) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '     SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A3) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(VLRRUBRIC' +
        'A4) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'21'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'11'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'10'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'41'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA1) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA2) DESCONTO,0 CRED_REF, 0 DESC_REF,' +
        ' 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '   SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA3) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, SUM(VLRRUBRICA4) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO NA REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA1) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA2) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA3) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(VLRRUBRICA4) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO = MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      ''
      '  GROUP BY SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- DESCONTO ANTERIOR A REF.'
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA1) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA1,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA1,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA2) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA2,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA2,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA2,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA3) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA3,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA3,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA3,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(VLRRUBRICA4) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      '    AND MESPROCESSAMENTO > MESREFERENCIA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND ((SUBSTR(CODRUBRICA4,1,2) = '#39'22'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'12'#39')'
      '      OR (SUBSTR(CODRUBRICA1,1,2) = '#39'30'#39')'
      '      OR (SUBSTR(CODRUBRICA4,1,2) = '#39'42'#39'))'
      '    AND (SUBSTR(CODRUBRICA4,2,1) <> '#39'9'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA1,2,1),'#39'1'#39',VLRRUB' +
        'RICA1,'#39'2'#39',-VLRRUBRICA1))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA1)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA1,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA2,2,1),'#39'1'#39',VLRRUB' +
        'RICA2,'#39'2'#39',-VLRRUBRICA2)) GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO =  :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA2)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA2,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA3,2,1),'#39'1'#39',VLRRUB' +
        'RICA3,'#39'2'#39',-VLRRUBRICA3))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA3)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA3,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  SELECT'
      '    SIGLA SIGLA, 2 AS IDPLANOPREV, '#39'NÃO IDENTIFICADOS'#39' PLANO,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(CODRUBRICA4,2,1),'#39'1'#39',VLRRUB' +
        'RICA4,'#39'2'#39',-VLRRUBRICA4))  GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    TEMPCONCINSS, UFINSS'
      '  WHERE'
      '    MESPROCESSAMENTO = :MESCOBRANCA'
      
        '    AND NVL(CODMANTENEDORINSS,CODCONCESSORINSS) = CODORGAOLOCAL(' +
        '+)'
      '    AND (SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(CODRUBRICA4)),2,1) = '#39'3'#39')'
      '    AND (SUBSTR(CODRUBRICA4,1,1) = '#39'9'#39')'
      '  GROUP BY'
      '    SIGLA, 2, '#39'NÃO IDENTIFICADOS'#39
      ''
      '  UNION'
      ''
      '  /* VALOR POR MANT. MONTANDO PATROCINADORA I */'
      '  -- CRÉDITO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME PLANO,'
      
        '    SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(D.RUBRICAINSS,2,1),  '#39'1'#39',D.' +
        'VALORINSS,'#39'2'#39',-D.VALORINSS)) GLOSA,'
      '    COUNT(*)'
      '  FROM DETCONCINSS D,'
      '    MANTENEDORA M,'
      '    UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) =  '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  -- CREDITO - NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '   AND D.MESCOBRANCA =  :MESCOBRANCA'
      '   AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '   AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <> ' +
        '14))'
      
        '   AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOLO' +
        'CAL(+)'
      '   AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '   AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SUB' +
        'STR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '        SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '   AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '        SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  -- CREDITO - ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALORIN' +
        'SS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      ''
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      '  -- DESCONTO - NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  -- DESCONTO - ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, M.IDPLANOPREV, M.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '    AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA <>' +
        ' 14))'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      '    AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, M.IDPLANOPREV, M.NOME'
      ''
      '  UNION'
      ''
      '  /* VALOR POR MANT. MONTANDO PATROCINADORA II */'
      '  -- CRÉDITO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ''
      '  UNION'
      ''
      '  -- GLOSA'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, 0 DESC_ANT_REF, SUM(DECODE(SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)' +
        '),2,1),  '#39'1'#39',D.VALORINSS,'#39'2'#39',-VALORINSS)) GLOSA,'
      '    COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) = '#39'9'#39' AND  SUB' +
        'STR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      '  UNION'
      ''
      '  -- CRÉDITO NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ''
      '  UNION'
      '  -- CRÉDITO ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALORIN' +
        'SS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ''
      '  UNION'
      '  -- DESCONTO BRUTO'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ''
      '  UNION'
      '  -- DESCONTO NA REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_REF' +
        ', 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA = D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39'  AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ''
      '  UNION'
      '  -- DESCONTO ANTERIOR A REF.'
      '  SELECT'
      '    UF.SIGLA SIGLA, PL.IDPLANOPREV, PL.NOME,'
      
        '    0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_RE' +
        'F, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA, COUNT(*)'
      '  FROM'
      '    DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '  WHERE'
      '    1 = 1'
      '    AND D.MESCOBRANCA =  :MESCOBRANCA'
      '    AND D.MESCOBRANCA > D.MESREFERENCIA'
      '    AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '    AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '    AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGAOL' +
        'OCAL(+)'
      
        '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  SU' +
        'BSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '         SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '  GROUP BY'
      '    UF.SIGLA, PL.IDPLANOPREV, PL.NOME'
      ') VAL, MANTENEDORA M'
      'WHERE'
      '  VAL.PLANO = M.NOME(+)'
      'GROUP BY'
      '  VAL.IDPLANOPREV, VAL.PLANO, M.CODTIPREC, M.CODTIPDES'
      ''
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'mescobranca'
        ParamType = ptInput
        Value = '2003/12'
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end>
  end
  object qryValoresCPOriginal: TwwQuery
    AfterOpen = qryValoresCPOriginalAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    NVL(VAL.IDPLANOPREV,-1) AS IDPLANOPREV,'
      
        '    DECODE(VAL.CODMANTENEDORA,5,'#39'CAIXA SEGUROS/PREVHAB'#39','#39'CAIXA/S' +
        'RH+PMPP'#39') AS PLANO,'
      '    M.CODTIPREC, M.CODTIPDES,'
      '   (SUM(CREDITO) - SUM(DESCONTO) - SUM(GLOSA)) LIQUIDO'
      'FROM'
      '   ('
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA,  M.IDPLANOPREV, M.NOME P' +
        'LANO,'
      '      SUM(D.VALORINSS) CREDITO,'
      
        '      0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_REF, 0 DESC' +
        '_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- GLOSA'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME PL' +
        'ANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, 0 DESC_ANT_REF,'
      
        '      SUM(DECODE(SUBSTR(D.RUBRICAINSS,2,1),  '#39'1'#39',D.VALORINSS,'#39'2'#39 +
        ',-D.VALORINSS)) GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) =  '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- CREDITO - NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME PL' +
        'ANO,'
      
        '      0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF,0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- CREDITO - ANTERIOR A REF.'
      '    SELECT'
      '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALOR' +
        'INSS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME PL' +
        'ANO,'
      
        '      0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO - NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME PL' +
        'ANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, MANTENEDORA M, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    -- DESCONTO - ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME PL' +
        'ANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D,   MANTENEDORA M,   UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      
        '      AND ((D.CODMANTENEDORA IS NOT NULL) AND (D.CODMANTENEDORA ' +
        '<> 14))'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      '      AND M.CODMANTENEDORA = D.CODMANTENEDORA'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, M.IDPLANOPREV, M.NOME'
      ''
      '    UNION'
      '    /* VALOR POR MANT. MONTANDO PATROCINADORA II */'
      '    -- CRÉDITO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      SUM(D.VALORINSS) CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D,PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- GLOSA'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, 0 CRED_ANT_' +
        'REF, 0 DESC_ANT_REF,'
      
        '      SUM(DECODE(SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1),  '#39'1'#39',' +
        'D.VALORINSS,'#39'2'#39',-VALORINSS)) GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) = '#39'9'#39' AND  S' +
        'UBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- CRÉDITO NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, SUM(D.VALORINSS) CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- CRÉDITO ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, 0 DESC_REF, SUM(D.VALOR' +
        'INSS) CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'1'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'10'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO BRUTO'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, SUM(D.VALORINSS) DESCONTO, 0 CRED_REF, 0 DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO NA REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, 0 DESCONTO, 0 CRED_REF, SUM(D.VALORINSS) DESC_R' +
        'EF, 0 CRED_ANT_REF, 0 DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA = D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39'  AND ' +
        ' SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ''
      '    UNION'
      '    -- DESCONTO ANTERIOR A REF.'
      '    SELECT'
      
        '      UF.SIGLA SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME ' +
        'PLANO,'
      
        '      0 CREDITO, 0 DESCONTO,  0 CRED_REF, 0 DESC_REF, 0 CRED_ANT' +
        '_REF, SUM(D.VALORINSS) DESC_ANT_REF, 0 GLOSA'
      '    FROM'
      '      DETCONCINSS D, PLANPREVCONTABIL PL, UFINSS UF'
      '    WHERE'
      '          D.MESCOBRANCA =  :MESCOBRANCA'
      '      AND D.MESCOBRANCA > D.MESREFERENCIA'
      '      AND ((D.CODMANTENEDORA IS NULL)  OR (D.CODMANTENEDORA=14))'
      '      AND PL.IDPLANOPREV(+) = D.IDPLANOPREV'
      
        '      AND NVL(D.CODMANTENEDORINSS,CODCONCESSORINSS) = UF.CODORGA' +
        'OLOCAL(+)'
      
        '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,1) <> '#39'9'#39' AND  ' +
        'SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'9'#39' AND'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) <> '#39'3'#39')'
      '      AND (SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),2,1) = '#39'2'#39' OR'
      '           SUBSTR(TRIM(TO_CHAR(D.RUBRICAINSS)),1,2) = '#39'30'#39')'
      '    GROUP BY UF.SIGLA, D.CODMANTENEDORA, PL.IDPLANOPREV, PL.NOME'
      ') VAL, MANTENEDORA M'
      'WHERE'
      '  VAL.IDPLANOPREV = 2 AND VAL.CODMANTENEDORA IN (5,3,2)'
      '  AND VAL.CODMANTENEDORA = M.CODMANTENEDORA(+)'
      'GROUP BY'
      '  VAL.IDPLANOPREV, M.CODTIPREC, M.CODTIPDES,'
      
        '  DECODE(VAL.CODMANTENEDORA,5,'#39'CAIXA SEGUROS/PREVHAB'#39','#39'CAIXA/SRH' +
        '+PMPP'#39')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptInput
      end>
  end
end
