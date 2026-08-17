inherited frmParamGerUtil: TfrmParamGerUtil
  Left = 41
  Top = 166
  Caption = 'Parâmetros do Relatório de Utilização'
  ClientHeight = 303
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 264
    inherited PageControl1: TPageControl
      Width = 684
      Height = 254
      ActivePage = TabSheet1
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Left = 107
          Top = 96
        end
        inherited BitBtn2: TBitBtn
          Left = 107
          Top = 36
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros'
        object pnlPesquisa: TPanel
          Left = 0
          Top = 0
          Width = 676
          Height = 226
          Align = alClient
          Caption = 'pnlPesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 218
            Height = 224
            Align = alLeft
            TabOrder = 0
            object LABEL1: TLabel
              Left = 6
              Top = 12
              Width = 66
              Height = 13
              Caption = 'Patrocinadora'
            end
            object label4: TLabel
              Left = 6
              Top = 96
              Width = 97
              Height = 13
              Caption = 'Plano Previdenciário'
            end
            object Label3: TLabel
              Left = 6
              Top = 139
              Width = 85
              Height = 13
              Caption = 'Plano Assistencial'
            end
            object Label11: TLabel
              Left = 6
              Top = 179
              Width = 36
              Height = 13
              Caption = 'Serviço'
            end
            object Label29: TLabel
              Left = 7
              Top = 55
              Width = 20
              Height = 13
              Caption = 'Filial'
            end
            object DBCMBPATRO: TwwDBLookupCombo
              Left = 6
              Top = 27
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = qrypatro
              LookupField = 'IDPESSOA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DBCMBPLANO: TwwDBLookupCombo
              Left = 6
              Top = 110
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'NOME')
              LookupTable = qryplano
              LookupField = 'IDPLANOPREV'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DBLkpCmbplanass: TwwDBLookupCombo
              Left = 6
              Top = 153
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'NOME')
              LookupTable = qryplanass
              LookupField = 'IDPLANASS'
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 6
              Top = 193
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = qrytpservass
              LookupField = 'IDSERVASS'
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object cmbfilial: TwwDBLookupCombo
              Left = 6
              Top = 70
              Width = 202
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              LookupTable = qryfilial
              LookupField = 'IDPESSOA'
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnEnter = cmbfilialEnter
            end
          end
          object GroupBox4: TGroupBox
            Left = 219
            Top = 1
            Width = 280
            Height = 224
            Align = alLeft
            Caption = 'Participante'
            TabOrder = 1
            object Label15: TLabel
              Left = 8
              Top = 13
              Width = 45
              Height = 13
              Caption = 'Matrícula'
            end
            object Label13: TLabel
              Left = 8
              Top = 54
              Width = 28
              Height = 13
              Caption = 'Nome'
            end
            object Label7: TLabel
              Left = 147
              Top = 13
              Width = 20
              Height = 13
              Caption = 'CPF'
            end
            object edmatricula: TEdit
              Left = 8
              Top = 28
              Width = 121
              Height = 21
              TabOrder = 0
            end
            object edcpf: TEdit
              Left = 147
              Top = 28
              Width = 121
              Height = 21
              TabOrder = 1
            end
            object ednome: TEdit
              Left = 8
              Top = 70
              Width = 262
              Height = 21
              TabOrder = 2
            end
            object GroupBox5: TGroupBox
              Left = 8
              Top = 98
              Width = 264
              Height = 92
              TabOrder = 3
              object Label8: TLabel
                Left = 8
                Top = 10
                Width = 101
                Height = 13
                Caption = 'Inscrição Assistencial'
              end
              object Label9: TLabel
                Left = 151
                Top = 10
                Width = 23
                Height = 13
                Caption = 'Data'
              end
              object Label2: TLabel
                Left = 6
                Top = 50
                Width = 113
                Height = 13
                Caption = 'Inscrição Previdenciária'
              end
              object Label16: TLabel
                Left = 151
                Top = 50
                Width = 23
                Height = 13
                Caption = 'Data'
              end
              object ednumero: TEdit
                Left = 6
                Top = 23
                Width = 121
                Height = 21
                TabOrder = 0
              end
              object date3: TCMDateTimePicker
                Left = 148
                Top = 23
                Width = 111
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
              object numinscprev: TEdit
                Left = 6
                Top = 64
                Width = 122
                Height = 21
                TabOrder = 2
              end
              object datainscprev: TCMDateTimePicker
                Left = 149
                Top = 64
                Width = 111
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
            end
          end
          object grpData: TGroupBox
            Left = 506
            Top = 3
            Width = 165
            Height = 94
            Caption = 'Data'
            TabOrder = 2
            object Label5: TLabel
              Left = 9
              Top = 17
              Width = 27
              Height = 13
              Caption = 'Início'
            end
            object Label6: TLabel
              Left = 9
              Top = 50
              Width = 16
              Height = 13
              Caption = 'Fim'
            end
            object date1: TCMDateTimePicker
              Left = 8
              Top = 29
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
              TabOrder = 0
            end
            object date2: TCMDateTimePicker
              Left = 8
              Top = 62
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
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 358
      DockPos = 360
      inherited rbtnImprimir: TcmReportBtn
        OnClick = rbtnImprimirClick
      end
      inherited rbtnVisualizar: TcmReportBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 393
    Top = 100
  end
  inherited cdCabecalho: TColorDialog
    Left = 494
    Top = 141
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 624
    Top = 203
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   NOME,IDPESSOA'
      'FROM     PESSOA'
      'WHERE    (FLGPATROCINADORA = 1)   '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 570
    Top = 202
  end
  object qrytpservass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDSERVASS,NOME'
      'FROM     TPSERVASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 336
    Top = 213
  end
  object dstpservass: TwwDataSource
    DataSet = qrytpservass
    Left = 294
    Top = 211
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   NOME, IDPLANOPREV'
      'FROM     PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 444
    Top = 92
  end
  object dsplano: TwwDataSource
    DataSet = qryplano
    Left = 468
    Top = 71
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDPLANASS,NOME'
      'FROM     PLANASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 582
    Top = 64
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 584
    Top = 112
  end
  object qryfilial: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA,NOME'
      'FROM   PESSOA'
      'WHERE  IDPESSOA IN (SELECT IDFILIALPESSOA'
      '                    FROM   FILIALPESSOA)')
    ValidateWithMask = True
    Left = 266
    Top = 88
  end
end
