inherited frmParamPagFornserv: TfrmParamPagFornserv
  Left = 89
  Top = 181
  Caption = 'Parâmetros do Relatório de Pagamentos ao Fornecedor'
  ClientHeight = 217
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    Height = 178
    inherited PageControl1: TPageControl
      Width = 656
      Height = 168
      ActivePage = TabSheet1
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros'
        object pnlPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 648
          Height = 145
          Align = alTop
          Caption = 'pnlPesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 3
            Top = 3
            Width = 223
            Height = 126
            TabOrder = 0
            object Label3: TLabel
              Left = 6
              Top = 19
              Width = 85
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object Label2: TLabel
              Left = 8
              Top = 64
              Width = 32
              Height = 13
              Caption = 'Motivo'
            end
            object DBLkpCmbplanass: TwwDBLookupCombo
              Left = 6
              Top = 34
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              LookupTable = qryplanass
              LookupField = 'IDPLANASS'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 6
              Top = 79
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              LookupTable = qrymotivo
              LookupField = 'IDMOTIVO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object grpData: TGroupBox
            Left = 229
            Top = 3
            Width = 243
            Height = 126
            Caption = 'Mês de Referência'
            TabOrder = 1
            object GroupBox3: TGroupBox
              Left = 14
              Top = 13
              Width = 214
              Height = 104
              TabOrder = 0
              object Label5: TLabel
                Left = 9
                Top = 7
                Width = 27
                Height = 13
                Caption = 'Início'
              end
              object Label6: TLabel
                Left = 9
                Top = 45
                Width = 16
                Height = 13
                Caption = 'Fim'
              end
              object spin1: TSpinEdit
                Left = 6
                Top = 20
                Width = 73
                Height = 22
                EditorEnabled = False
                MaxValue = 2100
                MinValue = 1997
                TabOrder = 0
                Value = 1997
              end
              object cmb1: TComboBox
                Left = 78
                Top = 20
                Width = 109
                Height = 21
                ItemHeight = 13
                TabOrder = 1
                Items.Strings = (
                  'JANEIRO'
                  'FEVEREIRO'
                  'MARÇO'
                  'ABRIL'
                  'MAIO'
                  'JUNHO'
                  'JULHO'
                  'AGOSTO'
                  'SETEMBRO'
                  'OUTUBRO'
                  'NOVEMBRO'
                  'DEZEMBRO')
              end
              object spin2: TSpinEdit
                Left = 6
                Top = 60
                Width = 73
                Height = 22
                EditorEnabled = False
                MaxValue = 2100
                MinValue = 1997
                TabOrder = 2
                Value = 1997
              end
              object cmb2: TComboBox
                Left = 78
                Top = 60
                Width = 109
                Height = 21
                ItemHeight = 13
                TabOrder = 3
                Items.Strings = (
                  'JANEIRO'
                  'FEVEREIRO'
                  'MARÇO'
                  'ABRIL'
                  'MAIO'
                  'JUNHO'
                  'JULHO'
                  'AGOSTO'
                  'SETEMBRO'
                  'OUTUBRO'
                  'NOVEMBRO'
                  'DEZEMBRO')
              end
            end
          end
          object grpdatacob: TGroupBox
            Left = 473
            Top = 3
            Width = 169
            Height = 76
            Caption = 'Data de Pagamento'
            TabOrder = 2
            object Label1: TLabel
              Left = 10
              Top = 19
              Width = 27
              Height = 13
              Caption = 'Início'
            end
            object Label4: TLabel
              Left = 11
              Top = 45
              Width = 16
              Height = 13
              Caption = 'Fim'
            end
            object Datapagini: TCMDateTimePicker
              Left = 53
              Top = 16
              Width = 108
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
            object datapagfim: TCMDateTimePicker
              Left = 54
              Top = 44
              Width = 108
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 178
    Width = 666
    inherited tb97Fundo: TToolbar97
      Left = 330
      DockPos = 330
      inherited rbtnImprimir: TcmReportBtn
        OnClick = rbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
      end
      inherited rbtnVisualizar: TcmReportBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 305
    Top = 172
  end
  inherited cdCabecalho: TColorDialog
    Left = 222
    Top = 165
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME'
      'FROM PLANASS '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 418
    Top = 30
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 432
    Top = 72
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from motivo'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 376
    Top = 140
  end
  object dsmotivo: TwwDataSource
    DataSet = qrymotivo
    Left = 376
    Top = 184
  end
end
