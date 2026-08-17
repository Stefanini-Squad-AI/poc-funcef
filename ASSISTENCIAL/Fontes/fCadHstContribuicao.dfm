inherited frmCadHstContribuicao: TfrmCadHstContribuicao
  Left = 18
  Top = 59
  Caption = 'Preparo Manual de Mensalidade'
  ClientHeight = 455
  ClientWidth = 761
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 761
    Height = 369
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 122
      Width = 751
      Height = 242
      Align = alBottom
      Tabs.Strings = (
        'Histórico')
      inherited pgctrlDetalhe: TPageControl
        Width = 653
        Height = 183
        inherited tbsDet: TTabSheet
          Caption = 'Histórico'
          inherited dbgrdDet: TwwDBGrid
            Width = 645
            Height = 155
            Selected.Strings = (
              'MES'#9'18'#9'Mês de Referência'
              'MESCOBRANCA'#9'17'#9'Mês de Cobrança'
              'VALORESPERADO'#9'15'#9'Valor Esperado'
              'DATAPREVISAO'#9'17'#9'Data de Previsão'
              'NOME'#9'60'#9'Pagador'
              'Tipo de Descrição'#9'24'#9'Motivo'
              'Tipo de Cobrança'#9'17'#9'Tipo de Cobrança'
              'TIPO'#9'9'#9'Tipo'
              'DATA'#9'10'#9'Data de Previsão'
              'IDLOTE'#9'10'#9'Lote')
            Font.Style = []
            ParentFont = False
            TitleLines = 2
            OnCalcCellColors = dbgrdDetCalcCellColors
          end
          inherited pnlControlesDet: TPanel
            Width = 645
            Height = 155
            object pnlbaixa: TPanel
              Left = 0
              Top = 0
              Width = 645
              Height = 155
              Align = alClient
              Caption = 'pnlbaixa'
              TabOrder = 1
              object grplancamento: TGroupBox
                Left = 5
                Top = 4
                Width = 497
                Height = 149
                Caption = 'Lançamento'
                TabOrder = 0
                object lblmesref: TLabel
                  Left = 11
                  Top = 19
                  Width = 145
                  Height = 13
                  Caption = 'Ano e Mês de Referência'
                end
                object dblblmesref: TDBText
                  Left = 11
                  Top = 39
                  Width = 65
                  Height = 17
                  DataField = 'MES'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblmescob: TLabel
                  Left = 190
                  Top = 19
                  Width = 137
                  Height = 13
                  Caption = 'Ano e Mês de Cobrança'
                end
                object dblblmescob: TDBText
                  Left = 190
                  Top = 39
                  Width = 59
                  Height = 13
                  AutoSize = True
                  DataField = 'MESCOBRANCA'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lbltipo: TLabel
                  Left = 409
                  Top = 19
                  Width = 26
                  Height = 13
                  Caption = 'Tipo'
                end
                object dblbltipo: TDBText
                  Left = 409
                  Top = 39
                  Width = 39
                  Height = 13
                  AutoSize = True
                  DataField = 'TIPO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblmotivo: TLabel
                  Left = 11
                  Top = 69
                  Width = 39
                  Height = 13
                  Caption = 'Motivo'
                end
                object dblblmotivo: TDBText
                  Left = 11
                  Top = 86
                  Width = 153
                  Height = 17
                  DataField = 'MotivoBaixa'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object detlbldtprevista: TLabel
                  Left = 11
                  Top = 112
                  Width = 78
                  Height = 13
                  Caption = 'Data Prevista'
                end
                object dblbldataprevista: TDBText
                  Left = 11
                  Top = 129
                  Width = 80
                  Height = 13
                  AutoSize = True
                  DataField = 'DATAPREVISAO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblvaloresperado: TLabel
                  Left = 190
                  Top = 69
                  Width = 87
                  Height = 13
                  Caption = 'Valor Esperado'
                end
                object dblblvaloresperado: TDBText
                  Left = 190
                  Top = 86
                  Width = 89
                  Height = 13
                  AutoSize = True
                  DataField = 'VALORESPERADO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object detlblpagador: TLabel
                  Left = 190
                  Top = 112
                  Width = 48
                  Height = 13
                  Caption = 'Pagador'
                end
                object dblblpagador: TDBText
                  Left = 190
                  Top = 129
                  Width = 61
                  Height = 13
                  AutoSize = True
                  DataField = 'NOME'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object lblcobranca1: TLabel
                  Left = 409
                  Top = 66
                  Width = 55
                  Height = 13
                  Caption = 'Cobrança'
                end
                object dblblcobranca: TDBText
                  Left = 409
                  Top = 81
                  Width = 39
                  Height = 17
                  DataField = 'Tipo de Cobrança'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
                object Label9: TLabel
                  Left = 409
                  Top = 112
                  Width = 26
                  Height = 13
                  Caption = 'Lote'
                end
                object DBText10: TDBText
                  Left = 409
                  Top = 128
                  Width = 65
                  Height = 17
                  DataField = 'IDLOTE'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                end
              end
              object grpbaixa: TGroupBox
                Left = 507
                Top = 4
                Width = 126
                Height = 149
                Caption = 'Baixa'
                TabOrder = 1
                object lblvalorrecebido: TLabel
                  Left = 11
                  Top = 27
                  Width = 88
                  Height = 13
                  Caption = 'Valor Recebido'
                end
                object lbldtpagamento: TLabel
                  Left = 9
                  Top = 90
                  Width = 113
                  Height = 13
                  Caption = 'Data de Pagamento'
                end
                object dbvalorrecebido: TDBEdit
                  Left = 12
                  Top = 45
                  Width = 85
                  Height = 21
                  DataField = 'VALORRECEBIDO'
                  DataSource = dsDet
                  TabOrder = 0
                end
                object dbdtpagamento: TCMDateTimePicker
                  Left = 10
                  Top = 105
                  Width = 108
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATA'
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
                  TabOrder = 1
                end
              end
            end
            object pnlaltinsert: TPanel
              Left = 0
              Top = 0
              Width = 645
              Height = 155
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object SpeedButton1: TSpeedButton
                Left = 608
                Top = 125
                Width = 36
                Height = 29
                Hint = 'Procurar'
                Glyph.Data = {
                  06020000424D0602000000000000760000002800000028000000140000000100
                  0400000000009001000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
                  FFF00000333333333333333777773333333BFBFBFBF0FFF03333333333333337
                  FFF73333333FFFFFFF000000333333333333337777773333333BFBFBF0FBFBFB
                  333333333FFFF733FFFF3333333F00000FF000003333333377777FF777773333
                  333B0FFF0000FFF0333333337FFF7777FFF73333333F00000FF000003333333F
                  777773F777773333330BFBFBF0FBFBFB3333337FF333373FFFFF33333010FFFF
                  FF00000033333777FF3333777777333330170BFBFBF0FFF0333337777FF33337
                  FFF73333301170FFFFF0000033333777778F3337777333330711190BFBFBFBFB
                  333377777378F3333333333308819990FFFFFFFF3333733733378F3333333330
                  88FF9999033333333337333333FF7333333333088FFFF0003333333333733333
                  F777333333333088FFF003333333333337333337733333333333088FFF033333
                  333333337F33337333333333333308FFF09333333333333378F3373333333333
                  333330FF0933333333333333378F733333333333333333003333333333333333
                  33773333333333333333}
                NumGlyphs = 2
                OnClick = SpeedButton1Click
              end
              object Label14: TLabel
                Left = 7
                Top = 119
                Width = 48
                Height = 13
                Caption = 'Pagador'
              end
              object GroupBox5: TGroupBox
                Left = 542
                Top = 64
                Width = 104
                Height = 53
                Caption = 'Data Prevista'
                TabOrder = 7
                object dbdtPrevisao: TCMDateTimePicker
                  Left = 6
                  Top = 20
                  Width = 90
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAPREVISAO'
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
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
              end
              object GroupBox4: TGroupBox
                Left = 289
                Top = 64
                Width = 246
                Height = 52
                Caption = 'Tipo'
                TabOrder = 0
                object cmbtipo: TComboBox
                  Left = 8
                  Top = 24
                  Width = 227
                  Height = 19
                  Style = csOwnerDrawFixed
                  ItemHeight = 13
                  TabOrder = 0
                  Items.Strings = (
                    'Normal'
                    'Atraso'
                    'Devolução')
                end
              end
              object GroupBox3: TGroupBox
                Left = 7
                Top = 64
                Width = 273
                Height = 52
                Caption = 'Motivo'
                TabOrder = 1
                object cmbmotivo: TwwDBLookupCombo
                  Left = 7
                  Top = 24
                  Width = 253
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'50'#9'DESCRICAO')
                  DataField = 'IDMOTIVO'
                  DataSource = dsDet
                  LookupTable = qrymotivo
                  LookupField = 'IDMOTIVO'
                  Options = [loColLines, loRowLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = False
                  ShowButton = True
                  AllowClearKey = False
                  ShowMatchText = True
                end
              end
              object GroupBox2: TGroupBox
                Left = 402
                Top = 6
                Width = 132
                Height = 52
                Caption = 'Valor Esperado'
                TabOrder = 2
                object dbedEsperado: TwwDBEdit
                  Left = 10
                  Top = 25
                  Width = 103
                  Height = 21
                  DataField = 'VALORESPERADO'
                  DataSource = dsDet
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object GroupBox1: TGroupBox
                Left = 196
                Top = 6
                Width = 196
                Height = 52
                Caption = 'Ano e Mês de Cobr/Pgmto'
                TabOrder = 3
                object Label11: TLabel
                  Left = 114
                  Top = 24
                  Width = 6
                  Height = 16
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object spinanocob: TSpinEdit
                  Left = 126
                  Top = 24
                  Width = 59
                  Height = 22
                  MaxValue = 0
                  MinValue = 0
                  TabOrder = 0
                  Value = 0
                end
                object cmbmescob: TComboBox
                  Left = 9
                  Top = 24
                  Width = 100
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'cmbmescob'
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
              object grpMesAnoRef: TGroupBox
                Left = 6
                Top = 6
                Width = 185
                Height = 52
                Caption = 'Ano e Mês de Referência'
                TabOrder = 4
                object Label10: TLabel
                  Left = 108
                  Top = 24
                  Width = 6
                  Height = 16
                  Caption = '/'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object spinanoref: TSpinEdit
                  Left = 118
                  Top = 24
                  Width = 61
                  Height = 22
                  MaxValue = 0
                  MinValue = 0
                  TabOrder = 0
                  Value = 0
                end
                object cmbmesref: TComboBox
                  Left = 10
                  Top = 24
                  Width = 94
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'cmbmesref'
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
              object dbedpagador: TDBEdit
                Left = 8
                Top = 133
                Width = 593
                Height = 21
                DataField = 'NOME'
                DataSource = dsDet
                ReadOnly = True
                TabOrder = 5
              end
              object grpcobranca: TRadioGroup
                Left = 542
                Top = 6
                Width = 104
                Height = 52
                Caption = 'Cobrança'
                ItemIndex = 0
                Items.Strings = (
                  'Folha'
                  'Banco')
                TabOrder = 6
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 743
        object Label16: TLabel [0]
          Left = 378
          Top = 8
          Width = 54
          Height = 13
          Align = alRight
          Caption = 'Legenda:'
        end
        object shapenaoenv: TShape [1]
          Left = 440
          Top = 9
          Width = 16
          Height = 12
        end
        object lblnaoenv: TLabel [2]
          Left = 460
          Top = 8
          Width = 74
          Height = 13
          Caption = 'Não Enviada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shapnaorec: TShape [3]
          Left = 544
          Top = 9
          Width = 16
          Height = 12
          Brush.Color = clYellow
        end
        object lblnaorec: TLabel [4]
          Left = 564
          Top = 8
          Width = 82
          Height = 13
          Caption = 'Não Recebida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited tb97BotoesDetalhe: TToolbar97
          object sbtnBaixaDet: TSpeedButton
            Left = 75
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Baixa'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              555555555555555555555555555555555555555555FF55555555555559055555
              55555555577FF5555555555599905555555555557777F5555555555599905555
              555555557777FF5555555559999905555555555777777F555555559999990555
              5555557777777FF5555557990599905555555777757777F55555790555599055
              55557775555777FF5555555555599905555555555557777F5555555555559905
              555555555555777FF5555555555559905555555555555777FF55555555555579
              05555555555555777FF5555555555557905555555555555777FF555555555555
              5990555555555555577755555555555555555555555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            Visible = False
            OnClick = speeddescricaoClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 657
        Height = 183
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 751
      Height = 116
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object Label2: TLabel
        Left = 272
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label3: TLabel
        Left = 8
        Top = 78
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 494
        Top = 80
        Width = 102
        Height = 13
        Caption = 'Tipo de Cobrança'
      end
      object Label5: TLabel
        Left = 494
        Top = 46
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
      end
      object Label6: TLabel
        Left = 8
        Top = 43
        Width = 70
        Height = 13
        Caption = 'Dependente'
      end
      object Label7: TLabel
        Left = 272
        Top = 46
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object Label8: TLabel
        Left = 272
        Top = 80
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object DBText1: TDBText
        Left = 8
        Top = 27
        Width = 254
        Height = 13
        DataField = 'PARTICIPANTE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 8
        Top = 94
        Width = 257
        Height = 13
        DataField = 'PATROCINADORA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText3: TDBText
        Left = 275
        Top = 96
        Width = 257
        Height = 13
        DataField = 'PLANOPREVIDENCIARIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 494
        Top = 96
        Width = 243
        Height = 13
        DataField = 'CONTRIBUICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 272
        Top = 28
        Width = 97
        Height = 13
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 272
        Top = 62
        Width = 105
        Height = 13
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText7: TDBText
        Left = 494
        Top = 62
        Width = 251
        Height = 17
        DataField = 'PLANOASSISTENCIAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText8: TDBText
        Left = 8
        Top = 59
        Width = 257
        Height = 13
        DataField = 'DEPENDENTE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 494
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Cobrança Padrão'
      end
      object lblcobranca: TLabel
        Left = 494
        Top = 27
        Width = 243
        Height = 13
        AutoSize = False
        Caption = 'lblcobranca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label15: TLabel
        Left = 674
        Top = 80
        Width = 30
        Height = 13
        Caption = 'Ativo'
        Visible = False
      end
      object DBText9: TDBText
        Left = 674
        Top = 94
        Width = 65
        Height = 17
        DataField = 'ATIVO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 761
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
    Top = 416
    Width = 761
  end
  inherited qry: TwwQuery
    Tag = 5
    BeforeOpen = qryBeforeOpen
    SQL.Strings = (
      'SELECT DISTINCT ELEG.MATRICULA,'
      '       PL.INSCRICAONUMERO,'
      '       C.NOME CONTRIBUICAO,'
      '       TIT.NOME PARTICIPANTE,'
      '       PLAN.NOME PLANOPREVIDENCIARIO,'
      '       PAT.NOME PATROCINADORA,'
      '       PA.NOME PLANOASSISTENCIAL,'
      '       DEP.NOME DEPENDENTE,'
      '       CONT.IDPLANASS,'
      '       CONT.IDPLANOPREV,'
      '       CONT.IDPESSJUR,'
      '       CONT.IDTITULAR,'
      '       CONT.IDDEPENDENTE,'
      '       CONT.IDCONTASS,'
      '       CONT.FLGATIVO,'
      '       DECODE(CONT.FLGATIVO,0,'#39'NÃO'#39','
      '                           1,'#39'SIM'#39') AS ATIVO,'
      '       CONT.FLGCOBCARNE'
      'FROM   ELEGPATRO    ELEG,'
      '       PARTPREVPLAN PL,'
      '       CONTRIBUICAO   C,'
      '       PESSOA       TIT,'
      '       PESSOA       PAT,'
      '       PESSOA       DEP,'
      '       PLANASS       PA,'
      '       CONTASS     CONT,'
      '       PLANPREV    PLAN,'
      '       CONTRIBASS    CA'
      'WHERE  (CA.PAGADOR = '#39'C'#39')'
      'AND    (CONT.IDPLANASS    =:IDPLANASS)'
      'AND    (CONT.IDPLANOPREV  =:IDPLANOPREV)'
      'AND    (CONT.IDPESSJUR    =:IDPESSJUR)'
      'AND    (CONT.IDTITULAR    =:IDTITULAR)'
      'AND    (CONT.IDDEPENDENTE =:IDDEPENDENTE)'
      'AND    (CONT.IDCONTASS    =  CA.IDCONTASS)'
      'AND    (CONT.IDPESSJUR    =  ELEG.IDPESSJUR)'
      'AND    (CONT.IDTITULAR    =  ELEG.IDPESSOA)'
      'AND    (CONT.IDPESSJUR    =  PL.IDPESSJUR)'
      'AND    (CONT.IDTITULAR    =  PL.IDPESSOA)'
      'AND    (CONT.IDPLANOPREV  =  PL.IDPLANOPREV)'
      'AND    (CONT.SEQPROPOSTA  =  PL.SEQPROPOSTA)'
      'AND    (CONT.IDCONTASS    =  C.IDCONTRIBUICAO)'
      'AND    (CONT.IDTITULAR    =  TIT.IDPESSOA)'
      'AND    (CONT.IDPLANOPREV  =  PLAN.IDPLANOPREV)'
      'AND    (CONT.IDPESSJUR    =  PAT.IDPESSOA)'
      'AND    (CONT.IDDEPENDENTE =  DEP.IDPESSOA)'
      '--AND    (CONT.FLGATIVO     =  1)'
      'ORDER  BY  ELEG.MATRICULA,'
      '           PL.INSCRICAONUMERO,'
      '           C.NOME,'
      '           TIT.NOME,'
      '           PLAN.NOME,'
      '           PAT.NOME,'
      '           PA.NOME,'
      '           DEP.NOME'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 446
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
        Value = 1000
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 1000
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 1000
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 1000
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
        Value = 10100
      end>
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 3
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object qryPARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 60
    end
    object qryPLANOPREVIDENCIARIO: TStringField
      FieldName = 'PLANOPREVIDENCIARIO'
      Size = 50
    end
    object qryPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryPLANOASSISTENCIAL: TStringField
      FieldName = 'PLANOASSISTENCIAL'
      Size = 40
    end
    object qryDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 60
    end
    object qryIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
    end
    object qryIDCONTASS: TFloatField
      FieldName = 'IDCONTASS'
    end
    object qryFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object qryFLGCOBCARNE: TFloatField
      FieldName = 'FLGCOBCARNE'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 478
    Top = 6
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 56
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTASS'
      'set'
      '  IDPLANASS = :IDPLANASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE')
    InsertSQL.Strings = (
      'insert into CONTASS'
      '  (IDPLANASS)'
      'values'
      '  (:IDPLANASS)')
    DeleteSQL.Strings = (
      'delete from CONTASS'
      'where'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE')
    Left = 413
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ELEG.MATRICULA'
      'PL.INSCRICAONUMERO'
      'PA.NOME'
      'C.NOME'
      'TIT.NOME'
      'PLAN.NOME'
      'PAT.NOME'
      'DEP.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição Prev.'
      'Plano Assistencial'
      'Contribuição'
      'Participante'
      'Plano Previdenciário'
      'Patrocinadora'
      'Dependente')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'ELEGPATRO ELEG'
      'PARTPREVPLAN PL'
      'CONTRIBUICAO C'
      'PESSOA TIT'
      'PESSOA PAT'
      'PESSOA DEP'
      'PLANASS PA'
      'CONTASS CONT'
      'PLANPREV PLAN'
      'CONTRIBASS CA')
    CamposChave.Strings = (
      'CONT.SEQPROPOSTA'
      'CONT.IDCONTASS'
      'CONT.IDPLANASS'
      'CONT.IDPLANOPREV'
      'CONT.IDPESSJUR'
      'CONT.IDTITULAR'
      'CONT.IDDEPENDENTE')
    Filtro.Strings = (
      'CONT.IDCONTASS = CA.IDCONTASS'
      'CONT.IDPESSJUR = ELEG.IDPESSJUR'
      'CONT.IDTITULAR = ELEG.IDPESSOA'
      'CONT.IDPESSJUR = PL.IDPESSJUR'
      'CONT.IDTITULAR = PL.IDPESSOA'
      'CONT.IDPLANOPREV = PL.IDPLANOPREV'
      'CONT.SEQPROPOSTA = PL.SEQPROPOSTA'
      'CONT.IDCONTASS = C.IDCONTRIBUICAO'
      'CONT.IDTITULAR = TIT.IDPESSOA'
      'CONT.IDPLANOPREV = PLAN.IDPLANOPREV'
      'CONT.IDPESSJUR = PAT.IDPESSOA'
      'CONT.IDDEPENDENTE = DEP.IDPESSOA'
      'CONT.IDPLANASS = PA.IDPLANASS'
      'CA.PAGADOR = '#39'C'#39
      'CONT.IDPLANASS = CA.IDPLANASS'
      'PL.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '20'
      '20'
      '40'
      '20'
      '20'
      '40')
    Left = 719
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 381
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 105
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 646
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 610
    Top = 8
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT   HST.MES,'
      '         HST.MESCOBRANCA,'
      '         HST.VALORESPERADO,'
      '         HST.VALORRECEBIDO,'
      '         HST.DATAPREVISAO,'
      '         HST.DATA,'
      '         HST.IDPAGADOR,'
      '         HST.SITRECEBIMENTO,'
      '         PAG.NOME,'
      '         PAG1.NOME AS TITULAR,'
      '         HST.IDPLANASS,'
      '         HST.IDPLANOPREV,'
      '         HST.IDPESSJUR,'
      '         HST.IDLOTE,'
      '         HST.IDTITULAR,'
      '         HST.IDDEPENDENTE,'
      '         HST.SEQPROPOSTA,'
      '         HST.IDCONTASS,'
      '         HST.IDMOTIVO,'
      '         HST.IDTIPO,'
      '         DECODE(HST.IDTIPO,'#39#39','#39'Cobrança'#39','
      '                           '#39'C'#39', '#39'Cobrança'#39','
      '                           '#39'P'#39', '#39'Pagamento'#39','
      '                           '#39'A'#39', '#39'Atraso'#39','
      '                           '#39'D'#39', '#39'Devolução'#39
      '                           ) as Tipo,'
      '         HST.FLGCOBCARNE,'
      '         MOT.DESCRICAO,'
      '         HST.NUMRECEBIMENTO'
      'FROM     HSTCONTRIBASS HST, PESSOA PAG, PESSOA PAG1 , MOTIVO MOT'
      'WHERE   (IDPLANASS    =:IDPLANASS)'
      'AND     (IDPLANOPREV  =:IDPLANOPREV)'
      'AND     (IDPESSJUR    =:IDPESSJUR)'
      'AND     (IDTITULAR    =:IDTITULAR)'
      'AND     (IDDEPENDENTE =:IDDEPENDENTE)'
      'AND     (SEQPROPOSTA  =:SEQPROPOSTA)'
      'AND     (IDCONTASS    =:IDCONTASS)'
      'AND     (HST.IDPAGADOR = PAG.IDPESSOA)'
      'AND     (HST.IDTITULAR = PAG1.IDPESSOA)'
      'AND     (MOT.IDMOTIVO  = HST.IDMOTIVO)'
      'AND     (HST.SITRECEBIMENTO IN (0,1))'
      'ORDER   BY HST.MES,HST.MESCOBRANCA, HST.DATAPREVISAO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 543
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANASS'
        ParamType = ptUnknown
        Value = 11
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 12
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 99
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = 64033
      end
      item
        DataType = ftInteger
        Name = 'IDDEPENDENTE'
        ParamType = ptUnknown
        Value = 64033
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'IDCONTASS'
        ParamType = ptUnknown
        Value = 54
      end>
    object qryDetMES: TStringField
      DisplayLabel = 'Mês de Referência'
      DisplayWidth = 18
      FieldName = 'MES'
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de Cobrança'
      DisplayWidth = 17
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object qryDetVALORESPERADO: TFloatField
      DisplayLabel = 'Valor Esperado'
      DisplayWidth = 15
      FieldName = 'VALORESPERADO'
      currency = True
    end
    object qryDetDATAPREVISAO: TDateTimeField
      DisplayLabel = 'Data de Previsão'
      DisplayWidth = 17
      FieldName = 'DATAPREVISAO'
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Pagador'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetTipodeDescrio: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'Tipo de Descrição'
      LookupDataSet = qrydescricao
      LookupKeyFields = 'IDMOTIVO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDMOTIVO'
      Size = 60
      Lookup = True
    end
    object qryDetTipodeCobrana: TStringField
      DisplayWidth = 17
      FieldKind = fkLookup
      FieldName = 'Tipo de Cobrança'
      LookupDataSet = qrycobracarne
      LookupKeyFields = 'FLGCOBCARNE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'FLGCOBCARNE'
      Size = 10
      Lookup = True
    end
    object qryDetTIPO: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 9
      FieldName = 'TIPO'
      Size = 9
    end
    object qryDetDATA: TDateTimeField
      DisplayLabel = 'Data de Previsão'
      DisplayWidth = 10
      FieldName = 'DATA'
    end
    object qryDetIDLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
    end
    object qryDetSITRECEBIMENTO: TStringField
      DisplayWidth = 1
      FieldName = 'SITRECEBIMENTO'
      Visible = False
      Size = 1
    end
    object qryDetVALORRECEBIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      Visible = False
      currency = True
    end
    object qryDetIDTIPO: TStringField
      DisplayWidth = 7
      FieldName = 'IDTIPO'
      Visible = False
      Size = 1
    end
    object qryDetIDPAGADOR: TFloatField
      FieldName = 'IDPAGADOR'
      Visible = False
    end
    object qryDetTITULAR: TStringField
      FieldName = 'TITULAR'
      Visible = False
      Size = 60
    end
    object qryDetIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetIDCONTASS: TFloatField
      FieldName = 'IDCONTASS'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryDetFLGCOBCARNE: TFloatField
      FieldName = 'FLGCOBCARNE'
      Visible = False
    end
    object qryDetDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Visible = False
      Size = 50
    end
    object qryDetMotivoBaixa: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'MotivoBaixa'
      LookupDataSet = qrymotivo
      LookupKeyFields = 'IDMOTIVO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'IDMOTIVO'
      Visible = False
      Size = 60
      Lookup = True
    end
    object qryDetNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTCONTRIBASS'
      'set'
      '  MES = :MES,'
      '  MESCOBRANCA = :MESCOBRANCA,'
      '  VALORESPERADO = :VALORESPERADO,'
      '  VALORRECEBIDO = :VALORRECEBIDO,'
      '  DATAPREVISAO = :DATAPREVISAO,'
      '  DATA = :DATA,'
      '  IDPAGADOR = :IDPAGADOR,'
      '  SITRECEBIMENTO = :SITRECEBIMENTO,'
      '  IDPLANASS = :IDPLANASS,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDLOTE = :IDLOTE,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDDEPENDENTE = :IDDEPENDENTE,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  IDCONTASS = :IDCONTASS,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDTIPO = :IDTIPO,'
      '  FLGCOBCARNE = :FLGCOBCARNE'
      'where'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    InsertSQL.Strings = (
      'insert into HSTCONTRIBASS'
      
        '  (MES, MESCOBRANCA, VALORESPERADO, VALORRECEBIDO, DATAPREVISAO,' +
        ' '
      'DATA, '
      
        '   IDPAGADOR, SITRECEBIMENTO, IDPLANASS, IDPLANOPREV, IDPESSJUR,' +
        ' '
      'IDLOTE, '
      '   IDTITULAR, IDDEPENDENTE, SEQPROPOSTA, IDCONTASS, IDMOTIVO, '
      'IDTIPO, FLGCOBCARNE,NUMRECEBIMENTO)'
      'values'
      '  (:MES, :MESCOBRANCA, :VALORESPERADO, :VALORRECEBIDO, '
      ':DATAPREVISAO, :DATA, '
      
        '   :IDPAGADOR, :SITRECEBIMENTO, :IDPLANASS, :IDPLANOPREV, :IDPES' +
        'SJUR, '
      ':IDLOTE, '
      
        '   :IDTITULAR, :IDDEPENDENTE, :SEQPROPOSTA, :IDCONTASS, :IDMOTIV' +
        'O, '
      ':IDTIPO, '
      '   :FLGCOBCARNE,:NUMRECEBIMENTO)')
    DeleteSQL.Strings = (
      'delete from HSTCONTRIBASS'
      'where'
      '  MES = :OLD_MES and'
      '  MESCOBRANCA = :OLD_MESCOBRANCA and'
      '  IDPLANASS = :OLD_IDPLANASS and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDDEPENDENTE = :OLD_IDDEPENDENTE and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA and'
      '  IDCONTASS = :OLD_IDCONTASS and'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    Left = 510
    Top = 8
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DISTINCT PAGADOR.NOME'
      'PART.INSCRICAONUMERO'
      'PATRO.NOME'
      'ELEG.MATRICULA'
      'PL.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Pagador'
      'Número de Inscrição'
      'Patrocinadora'
      'Matrícula'
      'Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PAGADOR'
      'PARTPREVPLAN PART'
      'PESSOA PATRO'
      'ELEGPATRO ELEG'
      'PLANPREV PL')
    CamposChave.Strings = (
      'PAGADOR.NOME'
      'PART.IDPESSOA')
    Filtro.Strings = (
      'PAGADOR.IDPESSOA = PART.IDPESSOA'
      'PATRO.IDPESSOA = PART.IDPESSJUR'
      'PART.IDPESSOA = ELEG.IDPESSOA'
      'PART.IDPESSJUR = ELEG.IDPESSJUR'
      'PART.IDPLANOPREV = PL.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '60'
      '13'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 685
    Top = 7
  end
  object qrydescricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IDMOTIVO,DESCRICAO'
      'FROM   MOTIVO')
    ValidateWithMask = True
    Left = 301
    Top = 4
  end
  object qrycobracarne: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   DISTINCT HST.FLGCOBCARNE,'
      '                 DECODE(HST.FLGCOBCARNE,0,'#39'Folha'#39','
      '                                        1,'#39'Banco'#39') AS DESCRICAO'
      'FROM       HSTCONTRIBASS HST')
    ValidateWithMask = True
    Left = 685
    Top = 324
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO,DESCRICAO'
      'FROM   MOTIVO'
      'WHERE  FLGTIPO = '#39'A'#39)
    ValidateWithMask = True
    Left = 261
    Top = 4
  end
end
