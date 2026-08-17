inherited frmCadContratoConfissao: TfrmCadContratoConfissao
  Left = 165
  Top = 84
  HelpContext = 640092
  Caption = 'Contrato de Confissão de Dívidas'
  ClientHeight = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 418
    inherited tbcDetalhe: TTabControlDetalhe
      Height = 364
      Tabs.Strings = (
        'Geral'
        'Imóveis'
        'Condições'
        'Cobrança'
        'Inadimplência'
        'Obs'
        'Eventos'
        'Complemento'
        'Histórico'
        'Contratos Confessados')
      detdbGrids.Strings = (
        ''
        ''
        ''
        ''
        'dbgrdMulta'
        ''
        'dbgrdEvento'
        ''
        ''
        ''
        ''
        ''
        ' ')
      inherited pgctrlDetalhe: TPageControl
        Height = 305
        inherited tbsGeral: TTabSheet
          inherited Label19: TLabel
            Left = 470
          end
          inherited Label55: TLabel
            Left = 470
          end
          inherited lblMarca: TLabel
            Left = 14
            Top = 453
            Visible = False
          end
          inherited Label65: TLabel
            Left = 358
            Top = 453
            Visible = False
          end
          inherited Label66: TLabel
            Left = 671
            Top = 451
            Visible = False
          end
          inherited Bevel2: TBevel
            Left = 15
            Top = 221
            Width = 706
            Height = 5
          end
          inherited lblPerc: TLabel
            Left = 561
          end
          inherited lblTipoContrato: TLabel
            Left = 470
          end
          object Label58: TLabel [10]
            Left = 16
            Top = 424
            Width = 434
            Height = 13
            Caption = 
              'Os componentes abaixo estão desabilitados no Filho, mas funciona' +
              'm no Pai.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          inherited DBedtValorContrato: TDBRealEdit
            Left = 470
            Lines.Strings = (
              '        0,00')
          end
          inherited DBcboMoedaContrato: TwwDBLookupCombo
            Width = 123
          end
          inherited DBcboMarca: TwwDBLookupCombo
            Left = 14
            Top = 467
            Visible = False
          end
          inherited DBcboAtividade: TwwDBLookupCombo
            Left = 358
            Top = 467
            Visible = False
          end
          inherited DBchkCobrancaAuto: TDBCheckBox
            Top = 233
            ReadOnly = True
          end
          inherited DBSpnVagas: TwwDBSpinEdit
            Left = 671
            Top = 466
            Visible = False
          end
          inherited dblcSitContratual: TwwDBLookupCombo
            Left = 593
            Top = 65
            Width = 123
          end
          inherited dbEdtTaxaAdmin: TDBRealEdit
            Left = 470
            Width = 88
          end
          inherited dblkTipoContrato: TwwDBLookupCombo
            Left = 469
            Width = 247
          end
          object GroupBox20: TGroupBox
            Left = 15
            Top = 142
            Width = 657
            Height = 67
            Caption = ' Datas '
            TabOrder = 12
            object Label85: TLabel
              Left = 9
              Top = 20
              Width = 109
              Height = 13
              Caption = 'Data de Assinatura'
            end
            object Label86: TLabel
              Left = 145
              Top = 20
              Width = 105
              Height = 13
              Caption = 'Início da Vigência'
            end
            object Label87: TLabel
              Left = 281
              Top = 20
              Width = 99
              Height = 13
              Caption = 'Término Vigência'
            end
            object Label88: TLabel
              Left = 409
              Top = 20
              Width = 95
              Height = 13
              Caption = 'Próxima Revisão'
            end
            object Label89: TLabel
              Left = 537
              Top = 20
              Width = 82
              Height = 13
              Caption = 'Aviso Revisão'
            end
            object edtDataAssinatura: TCMDateTimePicker
              Left = 10
              Top = 36
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAASSINATURA'
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
              TabOrder = 0
            end
            object edtDataFim: TCMDateTimePicker
              Left = 282
              Top = 36
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAFIM'
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
              Enabled = False
              ShowButton = True
              TabOrder = 2
            end
            object edtProxRevisao: TCMDateTimePicker
              Left = 410
              Top = 36
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATARENEGOC'
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
            object edtAvisoRevisao: TCMDateTimePicker
              Left = 538
              Top = 36
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAAVRENEGOC'
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
            object edtDataInicio: TCMDateTimePicker
              Left = 146
              Top = 36
              Width = 108
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'CONDATAINICIO'
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
              Enabled = False
              ShowButton = True
              TabOrder = 1
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 277
            inherited dbedtVlrAluguelAnt: TDBRealEdit
              Lines.Strings = (
                '0,00')
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 277
            Selected.Strings = (
              'DSC_MESTRE'#9'20'#9'Imóvel Mestre'#9'F'
              'DSC_IMOVEL'#9'20'#9'Imóvel'#9'F'
              'CODTIPIMOVEL'#9'14'#9'Tipo Imóvel'#9'F'
              'CIMVLRAJUSTADO'#9'15'#9'Valor'#9'F'
              'CIMDESCRICAO'#9'20'#9'Descrição'#9'F'
              'IMOCODIGO'#9'12'#9'Código Imóvel'#9'F'
              'CIMDTINI'#9'18'#9'Início Vigência'#9'F'
              'CIMDTFIM'#9'18'#9'Término Vigência'#9'F')
            OnCalcCellColors = grdHistoricoCalcCellColors
            OnTopRowChanged = grdHistoricoTopRowChanged
          end
        end
        object tbsCondicaoPag: TTabSheet [2]
          Caption = 'Condições'
          ImageIndex = 12
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 729
            Height = 277
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            ColCount = 1
            DataSource = dsCondPagImovel
            PanelHeight = 138
            PanelWidth = 713
            TabOrder = 0
            RowCount = 2
            object Label101: TLabel
              Left = 10
              Top = 5
              Width = 26
              Height = 13
              Caption = 'Tipo'
            end
            object Label102: TLabel
              Left = 162
              Top = 5
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label103: TLabel
              Left = 434
              Top = 5
              Width = 50
              Height = 13
              Caption = 'Parcelas'
            end
            object Label104: TLabel
              Left = 298
              Top = 5
              Width = 83
              Height = 13
              Caption = '1º Vencimento'
            end
            object lblIndCorrec: TLabel
              Left = 8
              Top = 49
              Width = 91
              Height = 13
              Caption = 'Indice Correção'
            end
            object lblPerProj2: TLabel
              Left = 272
              Top = 64
              Width = 10
              Height = 13
              Caption = '%'
            end
            object lblPeriod: TLabel
              Left = 529
              Top = 48
              Width = 78
              Height = 13
              Caption = 'Periodicidade'
            end
            object Label105: TLabel
              Left = 11
              Top = 111
              Width = 112
              Height = 13
              Caption = 'mes(es) anterior(es)'
            end
            object Label106: TLabel
              Left = 11
              Top = 92
              Width = 96
              Height = 13
              Caption = 'Utilizar indice de'
            end
            object Label107: TLabel
              Left = 165
              Top = 49
              Width = 77
              Height = 13
              Caption = 'CM Projetada'
            end
            object Label108: TLabel
              Left = 298
              Top = 50
              Width = 86
              Height = 13
              Caption = '1ª Amortização'
            end
            object Label109: TLabel
              Left = 434
              Top = 50
              Width = 31
              Height = 13
              Caption = 'Juros'
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 20
              Width = 134
              Height = 21
              DataField = 'cal_tipo'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit5: TDBEdit
              Left = 162
              Top = 20
              Width = 121
              Height = 21
              DataField = 'VLRFINANC'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit6: TDBEdit
              Left = 298
              Top = 19
              Width = 121
              Height = 21
              DataField = 'DATAVENCIMENTO'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 2
            end
            object DBEdit7: TDBEdit
              Left = 434
              Top = 19
              Width = 50
              Height = 21
              DataField = 'NUMPARCELAS'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 3
            end
            object gbIntervalo: TGroupBox
              Left = 494
              Top = 3
              Width = 129
              Height = 44
              Caption = 'Periodicidade Parc.'
              TabOrder = 4
              object dbspnPeriodo: TwwDBSpinEdit
                Left = 14
                Top = 18
                Width = 37
                Height = 21
                Increment = 1
                DataField = 'PERIODO'
                DataSource = dsCondPagImovel
                ReadOnly = True
                TabOrder = 0
                UnboundDataType = wwDefault
              end
              object dbcbPerParc: TwwDBComboBox
                Left = 57
                Top = 18
                Width = 63
                Height = 21
                ShowButton = True
                Style = csDropDownList
                MapList = True
                AllowClearKey = False
                DataField = 'PRAZO'
                DataSource = dsCondPagImovel
                DropDownCount = 5
                ItemHeight = 13
                Items.Strings = (
                  'Mês'#9'M'
                  'Ano'#9'A')
                ReadOnly = True
                Sorted = False
                TabOrder = 1
                UnboundDataType = wwDefault
              end
            end
            object dblcIndCorrec: TCMDBLookupCombo
              Left = 8
              Top = 65
              Width = 137
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOESIGLA'#9'10'#9'Sigla'#9'F'
                'FLGPERCVALOR'#9'1'#9'Tipo'#9'F')
              DataField = 'INDCORRECAO'
              DataSource = dsCondPagImovel
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              ReadOnly = True
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object DBEdit8: TDBEdit
              Left = 163
              Top = 63
              Width = 105
              Height = 21
              DataField = 'PERINDPROJ'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 6
            end
            object DBEdit9: TDBEdit
              Left = 433
              Top = 63
              Width = 88
              Height = 21
              DataField = 'TAXAJUROS'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 7
            end
            object dbcbPerJur: TwwDBComboBox
              Left = 528
              Top = 63
              Width = 97
              Height = 21
              ShowButton = True
              Style = csDropDownList
              MapList = True
              AllowClearKey = False
              DataField = 'PERIODOTAXA'
              DataSource = dsCondPagImovel
              DropDownCount = 5
              ItemHeight = 13
              Items.Strings = (
                'Mensal'#9'M'
                'Anual Simples'#9'A'
                'Anual Composto'#9'C')
              ReadOnly = True
              Sorted = False
              TabOrder = 8
              UnboundDataType = wwDefault
            end
            object dbedtMesRefReajuste: TwwDBSpinEdit
              Left = 111
              Top = 89
              Width = 34
              Height = 21
              Increment = 1
              MaxValue = 9
              DataField = 'MESREFREAJUSTE'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 9
              UnboundDataType = wwDefault
            end
            object DBEdit10: TDBEdit
              Left = 298
              Top = 64
              Width = 121
              Height = 21
              DataField = 'DATAINIAMORTIZ'
              DataSource = dsCondPagImovel
              ReadOnly = True
              TabOrder = 10
            end
            object GroupBox21: TGroupBox
              Left = 161
              Top = 91
              Width = 528
              Height = 43
              Caption = ' Forma de Cálculo '
              TabOrder = 11
              object cboFormaCalculo: TwwDBLookupCombo
                Left = 16
                Top = 16
                Width = 497
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'Nome'#9'F')
                DataField = 'IDFORMACALCIMOB'
                DataSource = dsCondPagImovel
                LookupTable = cdsFormaCalcImob
                LookupField = 'IDFORMACALCIMOB'
                ReadOnly = True
                TabOrder = 0
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
        end
        inherited tbsCobranca: TTabSheet [3]
          Caption = 'Cobrança'
          inherited Label21: TLabel
            Left = 16
            Top = 390
            Visible = False
          end
          inherited Label22: TLabel
            Left = 24
            Top = 24
          end
          inherited Label53: TLabel
            Left = 24
            Top = 71
          end
          inherited Bevel4: TBevel
            Left = 732
            Top = 394
            Width = 3
            Height = 127
            Visible = False
          end
          inherited DBcboTipoRecCusto: TwwDBLookupCombo
            Left = 16
            Top = 404
            Width = 345
            Visible = False
          end
          inherited DBcboPortadorForma: TwwDBLookupCombo
            Left = 24
            Top = 38
            Width = 345
          end
          inherited DBrdgCompetencia: TDBRadioGroup
            Left = 101
            Top = 447
            Visible = False
          end
          inherited grpReajuste: TGroupBox
            Left = 400
            Top = 458
            Visible = False
            inherited DBrdgMesReferencia: TDBRadioGroup
              Left = 400
              Top = 570
              Visible = False
            end
          end
          inherited DBcboMsgBoleto: TwwDBLookupCombo
            Left = 24
            Top = 85
            Width = 345
          end
          inherited grpVencPrincipal: TGroupBox
            Left = 432
            Top = 270
            Visible = False
          end
          inherited GroupBox3: TGroupBox
            Left = -8
            Top = 447
            Visible = False
          end
          inherited GroupBox5: TGroupBox
            Left = 400
            Top = 374
            Visible = False
          end
        end
        inherited tbsMulta: TTabSheet [4]
          Caption = 'Inadimplência'
          inherited pnlMulta: TPanel
            inherited pnlDetMulta: TPanel [0]
            end
            inherited dbgrdMulta: TwwDBGrid [1]
            end
          end
          inherited pnlMultaRescisoria: TPanel
            Height = 95
            inherited gbRegra: TGroupBox
              Visible = False
            end
            inherited GroupBox10: TGroupBox
              Visible = False
            end
            inherited GroupBox9: TGroupBox
              Visible = False
            end
          end
        end
        inherited tbsObs: TTabSheet [5]
          inherited Panel1: TPanel
            Height = 145
            inherited DBmemContrato: TwwDBRichEdit
              Height = 118
              RichEditVersion = 2
              Data = {
                830000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                5C706172645C625C66305C667331342044426D656D436F6E747261746F5C7061
                720D0A7D0D0A00}
            end
          end
          inherited pnlCidade: TPanel
            Top = 145
          end
        end
        inherited tbsEventos: TTabSheet [6]
          inherited Panel5: TPanel
            Height = 153
            inherited gbEvento: TGroupBox
              Height = 133
              inherited Panel7: TPanel
                Height = 116
                inherited DBmemDescricao: TwwDBRichEdit
                  Height = 102
                  RichEditVersion = 2
                  Data = {
                    840000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331342044426D656D44657363726963616F5C70
                    61720D0A7D0D0A00}
                end
              end
            end
          end
          inherited Panel4: TPanel
            inherited Panel10: TPanel
              inherited Label57: TLabel
                Left = 593
                Top = 51
              end
            end
          end
        end
        inherited tbsComplemento: TTabSheet [7]
          inherited molArvoreCompl1: TmolArvoreCompl
            Height = 277
            inherited dxTreeListDados: TdxTreeList
              Height = 277
            end
          end
        end
        object tbsHistorico: TTabSheet [8]
          Caption = 'Histórico'
          ImageIndex = 13
          object grdHistorico: TwwDBGrid
            Left = 0
            Top = 28
            Width = 729
            Height = 249
            ControlType.Strings = (
              'FlgCentralizador;CheckBox;1;0')
            Selected.Strings = (
              'Evento'#9'15'#9'Evento'#9'F'
              'DESCCUSTORECIMO'#9'45'#9'Item'#9'F'
              'HMIPARCELA'#9'7'#9'Parcela'#9'F'
              'DATAVENCIMENTO'#9'10'#9'Vencimento'#9'F'
              'FlgCentralizador'#9'2'#9'Centraliz.'#9'F'
              'HMIVALOR'#9'10'#9'Valor'#9'F'
              'HMIDOCUMENTO'#9'10'#9'Documento'#9'F'
              'PLNCODIGO'#9'10'#9'Planilha'#9'F'
              'HMIDATAMOV'#9'10'#9'Data Mov.'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsHistMovImob
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnCalcCellColors = grdHistoricoCalcCellColors
            IndicatorColor = icBlack
            OnTopRowChanged = grdHistoricoTopRowChanged
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 729
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object chkCentraliza: TCheckBox
              Left = 8
              Top = 5
              Width = 217
              Height = 17
              Caption = 'Exibe somente item centralizador'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = chkCentralizaClick
            end
          end
        end
        object TabSheet1: TTabSheet [9]
          Caption = 'Contratos Confessados'
          ImageIndex = 14
          object Panel9: TPanel
            Left = 0
            Top = 145
            Width = 729
            Height = 132
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 729
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Operações de Acréscimos e Descontos'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object wwDBGrid2: TwwDBGrid
              Left = 0
              Top = 27
              Width = 729
              Height = 105
              Selected.Strings = (
                'DESCCUSTORECIMO'#9'39'#9'Operação'
                'DESCTIPO'#9'13'#9'Tipo'
                'VLROPERACAO'#9'15'#9'Valor da Operação'
                'DESCCOND'#9'11'#9'Desc. Condic.'
                'CONDICAO'#9'12'#9'Condição'
                'VLRFINANC'#9'13'#9'Valor Financiado')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsConfissaoOper
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = grdHistoricoCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = grdHistoricoTopRowChanged
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 729
            Height = 145
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 729
              Height = 27
              Align = alTop
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = 'Contratos'
              Color = clNavy
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Courier New'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 27
              Width = 729
              Height = 118
              Selected.Strings = (
                'CONTRATO'#9'57'#9'Contrato'
                'NODOCUMENTO'#9'16'#9'Documento'
                'DATAVENCTO'#9'13'#9'Vencimento'
                'VALOR'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContratoConfessado
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
              OnCalcCellColors = grdHistoricoCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = grdHistoricoTopRowChanged
            end
          end
        end
        inherited tbsFianca: TTabSheet [10]
          TabVisible = False
          inherited dbmemObsFianca: TwwDBRichEdit
            RichEditVersion = 2
            Data = {
              840000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331342064626D656D4F62734669616E63615C70
              61720D0A7D0D0A00}
          end
        end
        inherited tbsFiadores: TTabSheet [11]
          TabVisible = False
          inherited Panel6: TPanel
            Height = 277
          end
          inherited dbgrdFiador: TwwDBGrid2
            Height = 277
          end
        end
        inherited tbsValorFuturo: TTabSheet [12]
          TabVisible = False
          inherited dbgrdVlrAno: TwwDBGrid
            Height = 277
          end
          inherited pnlVlrAno: TPanel
            Height = 277
          end
        end
        inherited tbsDatas: TTabSheet [13]
          TabVisible = False
          inherited Label8: TLabel
            Left = 288
          end
          inherited Bevel3: TBevel
            Width = 649
          end
          inherited Bevel1: TBevel
            Top = 264
            Visible = False
          end
          inherited Label45: TLabel
            Left = 552
            Top = 10
          end
          inherited Label44: TLabel
            Left = 416
            Top = 10
          end
          inherited Label43: TLabel
            Top = 274
            Visible = False
          end
          inherited Label9: TLabel
            Top = 274
            Visible = False
          end
          inherited Label42: TLabel
            Top = 218
            Visible = False
          end
          inherited Label3: TLabel
            Top = 218
            Visible = False
          end
          inherited Label63: TLabel
            Top = 218
            Visible = False
          end
          inherited DBchkIndeterminado: TDBCheckBox
            Top = 176
            Visible = False
          end
          inherited DBedtDataFim: TCMDateTimePicker
            Left = 288
          end
          inherited DBedtDataAvRenegoc: TCMDateTimePicker
            Left = 552
            Top = 24
          end
          inherited DBedtDataRenegoc: TCMDateTimePicker
            Left = 416
            Top = 24
          end
          inherited DBedtDataAvisoDenuncia: TCMDateTimePicker
            Top = 288
            Visible = False
          end
          inherited DBedtDataDenuncia: TCMDateTimePicker
            Top = 288
            Visible = False
          end
          inherited DBedtDataIniCarencia: TCMDateTimePicker
            Top = 232
            Visible = False
          end
          inherited DBedtDataFimCarencia: TCMDateTimePicker
            Top = 232
            Visible = False
          end
          inherited CMDateTimePicker2: TCMDateTimePicker
            Top = 232
            Visible = False
          end
        end
        inherited tbsDescontos: TTabSheet [14]
          TabVisible = False
          inherited dbgrdContratoXDesc: TwwDBGrid
            Height = 277
          end
          inherited pnlContratoXDesc: TPanel
            Height = 277
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Height = 305
      end
    end
  end
  inherited Dock972: TDock97
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
    Top = 465
  end
  inherited cdsImovel: TCMClientDataSet
    inherited cdsImovelCIMVLRAJUSTADO: TFloatField
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  inherited Query1: TQuery
    Top = 28
  end
  inherited dsAlteradorXTipoImovel: TwwDataSource
    Top = 307
  end
  inherited dtsMoeda: TwwDataSource
    Left = 736
    Top = 375
  end
  inherited DataSetProvider1: TDataSetProvider
    Left = 493
    Top = 28
  end
  inherited CMSqlParams1: TCMSqlParams
    ClientDataSet = cdsImovel
  end
  object cdsHistMovImob: TCMClientDataSet [42]
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsHistMovImobCalcFields
    Left = 369
    Top = 411
    object cdsHistMovImobEvento: TStringField
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Evento'
      Calculated = True
    end
    object cdsHistMovImobDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 45
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsHistMovImobHMIPARCELA: TFloatField
      DisplayLabel = 'Parcela'
      DisplayWidth = 7
      FieldName = 'HMIPARCELA'
    end
    object cdsHistMovImobDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCIMENTO'
    end
    object cdsHistMovImobFlgCentralizador: TIntegerField
      DisplayLabel = 'Centraliz.'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'FlgCentralizador'
      Calculated = True
    end
    object cdsHistMovImobHMIVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'HMIVALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovImobHMIDOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 10
      FieldName = 'HMIDOCUMENTO'
    end
    object cdsHistMovImobPLNCODIGO: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
    object cdsHistMovImobHMIDATAMOV: TDateTimeField
      DisplayLabel = 'Data Mov.'
      DisplayWidth = 10
      FieldName = 'HMIDATAMOV'
    end
    object cdsHistMovImobNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object cdsHistMovImobIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsHistMovImobCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object cdsHistMovImobCONNOME: TStringField
      FieldName = 'CONNOME'
      Visible = False
      Size = 60
    end
    object cdsHistMovImobIDHISTMOVIMOB: TFloatField
      FieldName = 'IDHISTMOVIMOB'
      Visible = False
    end
    object cdsHistMovImobIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
      Visible = False
    end
    object cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object cdsHistMovImobIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
      Visible = False
    end
    object cdsHistMovImobHMITIPOEVENTO: TFloatField
      FieldName = 'HMITIPOEVENTO'
      Visible = False
    end
    object cdsHistMovImobTIPOCONDPAG: TStringField
      FieldName = 'TIPOCONDPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsHistMovImobIDCONDPAGIMOVEL_1: TFloatField
      FieldName = 'IDCONDPAGIMOVEL_1'
      Visible = False
    end
  end
  object dsHistMovImob: TDataSource [43]
    DataSet = cdsHistMovImob
    Left = 289
    Top = 391
  end
  inherited CdsCondPagImovel: TCMClientDataSet
    Left = 657
    Top = 179
    inherited CdsCondPagImovelTAXAJUROS: TFloatField
      DisplayFormat = ',0.00000000'
    end
  end
  inherited dsCondPagImovel: TDataSource
    Left = 657
    Top = 255
  end
  inherited CMSqlParams4: TCMSqlParams
    Left = 488
    Top = 216
  end
  object dsContratoConfessado: TDataSource
    DataSet = cdsContratoConfessado
    Left = 393
    Top = 447
  end
  object cdsContratoConfessado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsHistMovImobCalcFields
    Left = 593
    Top = 419
    object cdsContratoConfessadoCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 81
    end
    object cdsContratoConfessadoNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object cdsContratoConfessadoDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object cdsContratoConfessadoVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object cdsFormaCalcImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 633
    Top = 360
  end
  object cdsConfDividaImobXOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 381
    object cdsConfDividaImobXOperDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 39
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsConfDividaImobXOperDESCTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 13
      FieldName = 'DESCTIPO'
      Size = 7
    end
    object cdsConfDividaImobXOperVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsConfDividaImobXOperDESCCOND: TStringField
      DisplayLabel = 'Desc. Condic.'
      DisplayWidth = 11
      FieldName = 'DESCCOND'
      Size = 3
    end
    object cdsConfDividaImobXOperCONDICAO: TStringField
      DisplayLabel = 'Condição'
      DisplayWidth = 12
      FieldName = 'CONDICAO'
      Size = 12
    end
    object cdsConfDividaImobXOperVLRFINANC: TFloatField
      DisplayLabel = 'Valor Financiado'
      DisplayWidth = 13
      FieldName = 'VLRFINANC'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsConfDividaImobXOperFLGTIPO: TStringField
      FieldName = 'FLGTIPO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsConfDividaImobXOperOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object cdsConfDividaImobXOperFLGDESCCONDIC: TFloatField
      FieldName = 'FLGDESCCONDIC'
      Visible = False
    end
    object cdsConfDividaImobXOperIDCONFDIVIDAIMOB: TFloatField
      FieldName = 'IDCONFDIVIDAIMOB'
      Visible = False
    end
    object cdsConfDividaImobXOperIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
  end
  object dsConfissaoOper: TDataSource
    DataSet = cdsConfDividaImobXOper
    Left = 189
    Top = 383
  end
  object CMSqlParams6: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       TCR.DESCCUSTORECIMO,'
      '       CDO.FLGTIPO,'
      
        '       DECODE(CDO.FLGTIPO, '#39'D'#39', '#39'Desconto'#39','#39'Acréscimo'#39') AS DESCT' +
        'IPO,'
      '       CDO.VLROPERACAO,'
      '       CDO.OBSERVACAO,'
      '       CDO.FLGDESCCONDIC,'
      
        '       DECODE(NVL(CDO.FLGDESCCONDIC,0), 0, '#39'Não'#39','#39'Sim'#39') AS DESCC' +
        'OND,'
      '       CDO.IDCONFDIVIDAIMOB,'
      '       CDO.IDTIPOCUSTORECIMO,'
      
        '       DECODE(CPI.TIPOCONDPAG,'#39'P'#39','#39'PARCELAMENTO'#39', '#39'S'#39','#39'SINAL'#39') A' +
        'S CONDICAO,'
      '       CPI.VLRFINANC'
      '   FROM'
      '       CONFDIVIDAIMOB CD,'
      '       CONFDIVIDAIMOBXOPER CDO,'
      '       TIPOCUSTORECIMOV TCR,'
      '       CONDPAGIMOVEL CPI'
      '   WHERE'
      '       CDO.IDCONFDIVIDAIMOB  = CD.IDCONFDIVIDAIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = CDO.IDTIPOCUSTORECIMO'
      '   AND CDO.IDCONDPAGIMOVEL   = CPI.IDCONDPAGIMOVEL(+)'
      '   AND CD.IDCONTRATORESULT  = 1806'
      ' '
      ' ')
    ClientDataSet = cdsConfDividaImobXOper
    Left = 80
    Top = 431
  end
  object CMSqlParams5: TCMSqlParams
    SQL.Strings = (
      '   SELECT DISTINCT  '
      '       FCI.NOME, '
      '       CI.IDCONTRATOIMOVEL,                                    '
      '       CI.CONNUMERO,  '
      '       CI.CONNOME,  '
      '       CPI.IDCONDPAGIMOVEL,  '
      '       CPI.TIPOCONDPAG,  '
      '       TCR.DESCCUSTORECIMO,  '
      '       HMI.IDHISTMOVIMOB,                                      '
      '       HMI.IDCONDPAGIMOVEL,                                    '
      '       HMI.IDTIPOCUSTORECIMO,                                  '
      '       HMI.IDITEMCENTRALIZA,                                   '
      '       HMI.HMIDATAMOV,                                         '
      '       HMI.HMIVALOR,                                           '
      '       HMI.HMIDOCUMENTO,                                       '
      '       HMI.HMITIPOEVENTO,                                      '
      '       HMI.PLNCODIGO,                                          '
      '       HMI.HMIPARCELA,                                         '
      '       LCI.DATAVENCIMENTO                                      '
      '   FROM                                                        '
      '       HISTMOVIMOB HMI,                                        '
      '       CONDPAGIMOVEL CPI,                                      '
      '       CONTRATOIMOVEl CI,                                      '
      '       FORMACALCIMOB FCI,                                      '
      '       TIPOCUSTORECIMOV TCR,                                   '
      '       LANCAMENTOSIMOVEL LCI                                   '
      '   WHERE                                                       '
      '       CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL             '
      '   AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL            '
      '   AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB             '
      '   AND HMI.HMIDOCUMENTO      = LCI.IDDOCUMENTO(+)              '
      '   AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO'
      '   AND CI.IDCONTRATOIMOVEL  = 1827')
    ClientDataSet = cdsHistMovImob
    Left = 409
    Top = 372
  end
end
