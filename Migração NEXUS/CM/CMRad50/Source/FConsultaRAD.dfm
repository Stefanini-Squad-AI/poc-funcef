inherited frmConsultaRAD: TfrmConsultaRAD
  Left = 269
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Consulta Processos RAD'
  ClientHeight = 402
  ClientWidth = 678
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 678
    Height = 363
    object pgctrlBusca: TPageControl
      Left = 1
      Top = 1
      Width = 676
      Height = 361
      ActivePage = tbsBusca
      Align = alClient
      DockSite = True
      TabOrder = 1
      object tbsBusca: TTabSheet
        Caption = 'Dados do Processo'
        object pnlInscricao: TPanel
          Left = 0
          Top = 33
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 4
            Top = 10
            Width = 100
            Height = 13
            Caption = 'Tipo de Prpcesso'
          end
          object cmbInscricao: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edInscricao: TEdit
            Left = 301
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlNome: TPanel
          Left = 0
          Top = 66
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 2
          object Label2: TLabel
            Left = 6
            Top = 10
            Width = 108
            Height = 13
            Caption = 'Início do Processo'
          end
          object cmbNome: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edNome: TEdit
            Left = 301
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlCPF: TPanel
          Left = 0
          Top = 99
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 3
          object Label3: TLabel
            Left = 4
            Top = 10
            Width = 94
            Height = 13
            Caption = 'Fim do Processo'
          end
          object cmbCPF: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edCPF: TEdit
            Left = 303
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlSitFund: TPanel
          Left = 0
          Top = 198
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 6
          object Label4: TLabel
            Left = 3
            Top = 10
            Width = 120
            Height = 13
            Caption = 'Processos Em aberto'
          end
          object CmbSitPlano: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdSitPlano: TEdit
            Left = 305
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPlano: TPanel
          Left = 0
          Top = 132
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 4
          object Label6: TLabel
            Left = 4
            Top = 10
            Width = 108
            Height = 13
            Caption = 'Usuário Solicitante'
          end
          object CmbPlano: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edPlano: TEdit
            Left = 304
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object PnlPatro: TPanel
          Left = 0
          Top = 165
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 5
          object Label7: TLabel
            Left = 4
            Top = 10
            Width = 106
            Height = 13
            Caption = 'Usuário Aprovador'
          end
          object CmbPatro: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object EdPatro: TEdit
            Left = 305
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlMatricula: TPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 0
          object Label9: TLabel
            Left = 4
            Top = 10
            Width = 53
            Height = 13
            Caption = 'Processo'
          end
          object cmbMatricula: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edMatricula: TEdit
            Left = 301
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object pnlSitPatro: TPanel
          Left = 0
          Top = 231
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 7
          object Label1: TLabel
            Left = 3
            Top = 10
            Width = 123
            Height = 13
            Caption = 'Processos Aprovados'
          end
          object cmbSitPatro: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object edSitPatro: TEdit
            Left = 306
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 264
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 8
          object Label10: TLabel
            Left = 4
            Top = 10
            Width = 126
            Height = 13
            Caption = 'Processos Recusados'
          end
          object ComboBox1: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit1: TEdit
            Left = 307
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 297
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 9
          object Label11: TLabel
            Left = 4
            Top = 10
            Width = 119
            Height = 13
            Caption = 'Processos Excluídos'
          end
          object ComboBox2: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit2: TEdit
            Left = 315
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 330
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 10
          object Label8: TLabel
            Left = 3
            Top = 10
            Width = 120
            Height = 13
            Caption = 'Processos Em aberto'
          end
          object ComboBox3: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit3: TEdit
            Left = 313
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 363
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 11
          object Label12: TLabel
            Left = 3
            Top = 10
            Width = 123
            Height = 13
            Caption = 'Processos Aprovados'
          end
          object ComboBox4: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit4: TEdit
            Left = 314
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel5: TPanel
          Left = 0
          Top = 396
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 12
          object Label13: TLabel
            Left = 4
            Top = 10
            Width = 126
            Height = 13
            Caption = 'Processos Recusados'
          end
          object ComboBox5: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit5: TEdit
            Left = 315
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 429
          Width = 668
          Height = 33
          Align = alTop
          TabOrder = 13
          object Label14: TLabel
            Left = 4
            Top = 10
            Width = 119
            Height = 13
            Caption = 'Processos Excluídos'
          end
          object ComboBox6: TComboBox
            Left = 141
            Top = 6
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto')
          end
          object Edit6: TEdit
            Left = 315
            Top = 6
            Width = 340
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
          end
        end
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 676
      Height = 361
      ActivePage = TabSheet1
      Align = alClient
      DockSite = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados do Processo'
        object ScrollBox: TScrollBox
          Left = 0
          Top = 0
          Width = 668
          Height = 333
          HorzScrollBar.Visible = False
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 0
          object pnlProcesso: TPanel
            Left = 0
            Top = 0
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 0
            object Label21: TLabel
              Left = 4
              Top = 10
              Width = 53
              Height = 13
              Caption = 'Processo'
            end
            object cbProcesso: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'é igual a '
                'é maior que'
                'é maior ou igual a'
                'é menor que'
                'é menor ou igual a'
                'é diferente de ')
            end
            object edProcesso: TEdit
              Left = 301
              Top = 7
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnKeyPress = edProcessoKeyPress
            end
          end
          object Panel12: TPanel
            Left = 0
            Top = 231
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 7
            object Label20: TLabel
              Left = 4
              Top = 10
              Width = 106
              Height = 13
              Caption = 'Usuário Aprovador'
            end
            object cbUsuAprovador: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto'
                'é igual a ')
            end
            object edUsuAprov: TEdit
              Left = 301
              Top = 6
              Width = 178
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object cbUsuarioEtapa: TComboBox
              Left = 486
              Top = 6
              Width = 156
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'na última etapa gerada'
                'em qualquer etapa')
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 132
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 4
            object Label18: TLabel
              Left = 3
              Top = 10
              Width = 125
              Height = 13
              Caption = 'Situação do Processo'
            end
            object cbSituProc: TComboBox
              Left = 141
              Top = 6
              Width = 502
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                ''
                'Aprovado'
                'Excluído'
                'Pendente'
                'Recusado')
            end
          end
          object Panel9: TPanel
            Left = 0
            Top = 165
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 5
            object Label17: TLabel
              Left = 4
              Top = 10
              Width = 108
              Height = 13
              Caption = 'Início do Processo'
            end
            object cbIniProcesso: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'é maior que'
                'é maior ou igual a'
                'é menor que'
                'é menor ou igual a'
                'é diferente de ')
            end
            object dtIniProc: TCMDateTimePicker
              Left = 301
              Top = 4
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
          object Panel17: TPanel
            Left = 0
            Top = 330
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 10
            object Label25: TLabel
              Left = 3
              Top = 10
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object cbCCusto: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edCCusto: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 363
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 11
            object Label26: TLabel
              Left = 3
              Top = 10
              Width = 107
              Height = 13
              Caption = 'Centro de Respon.'
            end
            object cbCRespon: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edCRespon: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel19: TPanel
            Left = 0
            Top = 396
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 12
            object Label27: TLabel
              Left = 4
              Top = 10
              Width = 107
              Height = 13
              Caption = 'Grupo de Produtos'
            end
            object cbGrupoProd: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edGrupoProd: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel20: TPanel
            Left = 0
            Top = 33
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 1
            object Label28: TLabel
              Left = 4
              Top = 10
              Width = 100
              Height = 13
              Caption = 'Tipo de Processo'
            end
            object cbTipoProcesso: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edTipoProcesso: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel7: TPanel
            Left = 0
            Top = 66
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 2
            object Label15: TLabel
              Left = 4
              Top = 10
              Width = 108
              Height = 13
              Caption = 'Usuário Solicitante'
            end
            object cbUsuSolic: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edUsuSolic: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 429
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 13
            object Label19: TLabel
              Left = 4
              Top = 10
              Width = 108
              Height = 13
              Caption = 'Atividade x Projeto'
            end
            object cbAtivProjeto: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edAtivProjeto: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 198
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 6
            object Label23: TLabel
              Left = 2
              Top = 10
              Width = 120
              Height = 13
              Caption = 'Término de Processo'
            end
            object cbTerminoProcesso: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'é maior que'
                'é maior ou igual a'
                'é menor que'
                'é menor ou igual a'
                'é diferente de ')
            end
            object dtFimProc: TCMDateTimePicker
              Left = 301
              Top = 4
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
          object Panel21: TPanel
            Left = 0
            Top = 99
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 3
            object Label29: TLabel
              Left = 4
              Top = 10
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object cbValor: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'é igual a '
                'é maior que'
                'é maior ou igual a'
                'é menor que'
                'é menor ou igual a'
                'é diferente de ')
            end
            object edValor: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
              OnKeyPress = edValorKeyPress
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 462
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 14
            object Label16: TLabel
              Left = 3
              Top = 10
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object cbTipoDoc: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto')
            end
            object edTipoDoc: TEdit
              Left = 301
              Top = 6
              Width = 340
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
          end
          object Panel14: TPanel
            Left = 0
            Top = 297
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 9
            object chkRessalva: TCheckBox
              Left = 141
              Top = 6
              Width = 337
              Height = 21
              Caption = 'Exibir apenas processos com ressalvas em aprovações'
              TabOrder = 0
            end
            object cbRessalvaEtapa: TComboBox
              Left = 486
              Top = 6
              Width = 156
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'na última etapa gerada'
                'em qualquer etapa')
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 264
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 8
            object Label22: TLabel
              Left = 4
              Top = 10
              Width = 97
              Height = 13
              Caption = 'Grupo Aprovador'
            end
            object cbGrupoAprov: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'começa com'
                'é igual a'
                'possui o texto'
                'é igual a ')
            end
            object edGrupoAprov: TEdit
              Left = 301
              Top = 6
              Width = 178
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 1
            end
            object cbGrupoEtapa: TComboBox
              Left = 486
              Top = 6
              Width = 156
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 2
              Items.Strings = (
                'na última etapa gerada'
                'em qualquer etapa')
            end
          end
          object pnlOrdenacao: TPanel
            Left = 0
            Top = 528
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 16
            object Label24: TLabel
              Left = 3
              Top = 10
              Width = 111
              Height = 13
              Caption = 'Ordena pelo campo'
            end
            object cbOrdenacao: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Número do processo'
                'Situação'
                'Data de início')
            end
            object cbExpande: TCheckBox
              Left = 304
              Top = 8
              Width = 249
              Height = 17
              Caption = 'Expandir todas as aprovações.'
              TabOrder = 1
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 495
            Width = 651
            Height = 33
            Align = alTop
            TabOrder = 15
            object Label30: TLabel
              Left = 3
              Top = 10
              Width = 76
              Height = 13
              Caption = 'Classificação'
            end
            object cbClassificacao: TComboBox
              Left = 141
              Top = 6
              Width = 145
              Height = 21
              TabStop = False
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                ''
                'Em dia'
                'Em atraso')
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 363
    Width = 678
    inherited tb97Fundo: TToolbar97
      Left = 408
      DockPos = 408
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnSair: TBitBtn
        Left = 81
        ModalResult = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object bbtnParticipante: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&OK'
        Default = True
        TabOrder = 2
        OnClick = bbtnParticipanteClick
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
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 699
    Top = 3
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'TipoRelat'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 568
    Top = 200
  end
end
