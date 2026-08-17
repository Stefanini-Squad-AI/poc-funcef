inherited frmSelBem: TfrmSelBem
  Left = 20
  Top = 125
  Caption = 'Seleção de bens para Processamento'
  ClientHeight = 417
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 378
    object pgctrl: TPageControl
      Left = 5
      Top = 5
      Width = 745
      Height = 368
      ActivePage = TabFiltro
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlChange
      object TabFiltro: TTabSheet
        Caption = 'Condições'
        object pnlPlaca: TPanel
          Left = 0
          Top = 0
          Width = 736
          Height = 63
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 23
            Width = 114
            Height = 13
            Caption = 'Placa de Patrimônio'
          end
          object Bevel1: TBevel
            Left = 144
            Top = 30
            Width = 530
            Height = 2
            Shape = bsTopLine
          end
          object Bevel2: TBevel
            Left = 142
            Top = 1
            Width = 2
            Height = 62
            Shape = bsLeftLine
          end
          object Bevel3: TBevel
            Left = 673
            Top = 1
            Width = 2
            Height = 63
            Shape = bsLeftLine
          end
          object cmbPlaca1: TComboBox
            Left = 160
            Top = 5
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'é igual a'
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edPlaca1: TEdit
            Left = 362
            Top = 5
            Width = 303
            Height = 21
            TabOrder = 1
          end
          object cmbPlaca2: TComboBox
            Left = 160
            Top = 37
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'é igual a'
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edPlaca2: TEdit
            Left = 362
            Top = 37
            Width = 303
            Height = 21
            TabOrder = 3
          end
          object anmLupa: TAnimate
            Left = 682
            Top = 7
            Width = 48
            Height = 50
            Active = False
            CommonAVI = aviFindFile
            StopFrame = 23
          end
        end
        object pnlFiltros: TPanel
          Left = 0
          Top = 183
          Width = 736
          Height = 144
          TabOrder = 1
          object Label7: TLabel
            Left = 360
            Top = 51
            Width = 38
            Height = 13
            Caption = 'Classe'
          end
          object Label8: TLabel
            Left = 8
            Top = 52
            Width = 69
            Height = 13
            Caption = 'Localização'
          end
          object Label3: TLabel
            Left = 8
            Top = 4
            Width = 51
            Height = 13
            Caption = 'Conjunto'
          end
          object Label9: TLabel
            Left = 360
            Top = 100
            Width = 110
            Height = 13
            Caption = 'Periodo de Entrada'
          end
          object Label5: TLabel
            Left = 8
            Top = 100
            Width = 74
            Height = 13
            Caption = 'Responsável'
          end
          object Label6: TLabel
            Left = 360
            Top = 3
            Width = 35
            Height = 13
            Caption = 'Grupo'
          end
          object Label4: TLabel
            Left = 501
            Top = 120
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object Bevel5: TBevel
            Left = 0
            Top = 47
            Width = 735
            Height = 2
          end
          object Bevel6: TBevel
            Left = 0
            Top = 95
            Width = 735
            Height = 2
          end
          object cmbClasse: TwwDBLookupCombo
            Left = 360
            Top = 67
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'
              'CODHIERARQ'#9'15'#9'Código')
            LookupTable = qryClasse
            LookupField = 'IDCLASSEBEM'
            Options = [loTitles]
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object cmbLocalizacao: TwwDBLookupCombo
            Left = 8
            Top = 68
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'45'#9'Descrição')
            LookupTable = qryLocalizacao
            LookupField = 'IDLOCALIZACAO'
            Options = [loTitles]
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object cmbConjunto: TwwDBLookupCombo
            Left = 8
            Top = 20
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCCONJUNTO'#9'200'#9'Descrição'
              'IDCONJUNTO'#9'10'#9'IDCONJUNTO')
            LookupTable = qryConjunto
            LookupField = 'IDCONJUNTO'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dteDataIni: TCMDateTimePicker
            Left = 360
            Top = 116
            Width = 121
            Height = 21
            Hint = 'Data Programada para Pagamento'
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 5
          end
          object cmbResponsavel: TwwDBLookupCombo
            Left = 8
            Top = 116
            Width = 329
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome')
            LookupTable = qryResponsavel
            LookupField = 'IDRESPONSAVEL'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object cmbGrupo: TwwDBLookupCombo
            Left = 360
            Top = 19
            Width = 369
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'
              'CLASSE'#9'15'#9'Cód.Hierarquia')
            LookupTable = qryGrupo
            LookupField = 'IDGRUPO'
            Options = [loTitles]
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object dteDataFim: TCMDateTimePicker
            Left = 528
            Top = 116
            Width = 121
            Height = 21
            Hint = 'Data Programada para Pagamento'
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
            ParentShowHint = False
            ShowHint = True
            ShowButton = True
            TabOrder = 6
          end
        end
        object pnlDescricao: TPanel
          Left = 0
          Top = 63
          Width = 736
          Height = 30
          TabOrder = 2
          object Bevel4: TBevel
            Left = 142
            Top = -33
            Width = 2
            Height = 65
            Shape = bsLeftLine
          end
          object Label2: TLabel
            Left = 8
            Top = 8
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object cmbDescricao: TComboBox
            Left = 160
            Top = 5
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto '
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edDescricao: TEdit
            Left = 362
            Top = 5
            Width = 365
            Height = 21
            TabOrder = 1
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 123
          Width = 736
          Height = 30
          TabOrder = 3
          object Bevel10: TBevel
            Left = 142
            Top = -33
            Width = 2
            Height = 65
            Shape = bsLeftLine
          end
          object Label13: TLabel
            Left = 8
            Top = 8
            Width = 42
            Height = 13
            Caption = 'Modelo'
          end
          object cmbModelo: TComboBox
            Left = 160
            Top = 5
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto '
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edModelo: TEdit
            Left = 362
            Top = 5
            Width = 365
            Height = 21
            TabOrder = 1
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 153
          Width = 736
          Height = 30
          TabOrder = 4
          object Bevel7: TBevel
            Left = 142
            Top = -33
            Width = 2
            Height = 65
            Shape = bsLeftLine
          end
          object Label10: TLabel
            Left = 8
            Top = 8
            Width = 65
            Height = 13
            Caption = 'Fornecedor'
          end
          object cmbFornec: TComboBox
            Left = 160
            Top = 5
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto '
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edFornec: TEdit
            Left = 362
            Top = 5
            Width = 365
            Height = 21
            TabOrder = 1
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 93
          Width = 736
          Height = 30
          TabOrder = 5
          object Bevel9: TBevel
            Left = 142
            Top = -33
            Width = 2
            Height = 65
            Shape = bsLeftLine
          end
          object Label12: TLabel
            Left = 8
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Marca'
          end
          object cmbMarca: TComboBox
            Left = 160
            Top = 5
            Width = 177
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'começa com'
              'é igual a'
              'possui o texto '
              'é maior que'
              'é maior ou igual que'
              'é menor que'
              'é menor ou igual que'
              'é diferente de')
          end
          object edMarca: TEdit
            Left = 362
            Top = 5
            Width = 365
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabResult: TTabSheet
        Caption = 'Resultado'
        object dbgResult: TwwDBGrid
          Left = 0
          Top = 31
          Width = 737
          Height = 309
          Selected.Strings = (
            'PLACA'#9'10'#9'Patrimônio'
            'DESBEM'#9'70'#9'Descrição'
            'DESCCONJUNTO'#9'100'#9'Conjunto'
            'DESCCLASSE'#9'60'#9'Classe'
            'DESCLOCAL'#9'60'#9'Localização'
            'NOMERESP'#9'60'#9'Responsável'
            'DESCGRUPO'#9'60'#9'Grupo Contábil'
            'DTAINCLUSAO'#9'10'#9'Entrada em'
            'VALORG'#9'10'#9'Valor Aquisição'
            'STATUS'#9'7'#9'Status'
            'TIPCONTROLE'#9'6'#9'Controle'
            'NOMEFORN'#9'60'#9'Fornecedor'
            'SELECTED'#9'2'#9'...')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object Dock973: TDock97
          Left = 0
          Top = 0
          Width = 737
          Height = 31
          AllowDrag = False
          Background.Data = {
            760F0000424D760F0000000000007600000028000000800000003C0000000100
            040000000000000F000000000000000000001000000000000000000000008080
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777777171717777777777777177771777777777777777077F7FF7FFFF7
            77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
            777777777771717717777777777777777717777777777777777777777FFFFF7F
            7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
            77777777777777171777777777777777717777777777777777777777777FF7FF
            7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
            7777777777771771777777777777777771777777777777777777777777777FFF
            FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
            777777777777771777777777777777777777777777777777777777777777777F
            F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
            7777777777777777777777777777777777777777777777777777777777777771
            77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
            7777777777777177777777777777777777777777777777777777777777777777
            777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
            7777777777777777771777777777777777777777777777777777777777777777
            7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
            7777777777777717771777777777777777777777777777777777777777777777
            77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
            7777777777777771777777777777777777777777777777777777777777777777
            777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
            7777777777777777777777777777777777777777777777777777777777777777
            777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
            7777777777777777177777777777777777777777777777777777777777777777
            7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
            7777777777777777717777777777777777777777777777777777777777777777
            7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
            7777777777777777777771777777777777777777777777777777777777777777
            7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
            F7F7777777777777771777777777177777777777777777777777777777777777
            77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
            777F7F7777777777777177177771717777777777777777777777777777777777
            77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
            77777F7F77777777777717771777777777777777777777777777777777777777
            777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
            1777777777777777777771717717777177777777777777777777777777777777
            777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
            7777777777771777777777177771777777777777777777777777777777777777
            77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
            7777777777777777777771777777777777777777777777777777777777777777
            777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
            7777777777171777777717777777777777777777777777777777777777777777
            77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
            7777777777777177777771777777777777777777777777777777777777777777
            777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
            7777777777777777777771177777777777777777777777777777777777777777
            7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
            7777777777777777777771717777777777777777777777777777777777777777
            777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
            7777777777777777777777171777777777777777777777777777777777777777
            71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
            7777777777777777777777177777777777777777777777777777777777777717
            77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
            77777777777777777777777777777777777F7777777777777777777777777171
            7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
            771777777777777777777777777777777177F777777777777777777777777717
            171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
            7777777777777777777777777777777777777F77777777777777777777777777
            77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
            7177777177777777777777777777777777777FF7F77771777777777777777777
            1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
            7777777717777777777777777777777777777777777777777777777777777777
            717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
            7177777777777777777777777777777777771777777777777777777777777777
            77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
            777777F777777777777777777777777777777777717177717777777777777777
            77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
            171777F7F7777777777777177777777777777777777777777777777777777777
            777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
            7777777F77777777777777777777777777777777777777777777777777777777
            77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
            7717777F77777777777777717177777777777777777777777777777777777777
            7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
            777777777F777777777777777717777777777777777777777777777777777777
            777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
            7777777777777777777777771777777777777777777777777777777777777777
            77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
            7777777777777777777777777717177777777771777777777777777777777777
            7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
            7777777777777177777777777777777777777717177777777777777777777777
            77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
            7777777777717777777777777717177777777777777777777777777777777777
            777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
            777777777717171717777777777777777777777771777777777F777777777777
            777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
            77777777171777777777777777777777777777777777777777F7F77777777777
            77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
            7777777777171777777777777777777777777777777777777777777777777777
            777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
            7777777717177777777777777777777777777777777777777777777777777777
            77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
            7777777777171777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
            77777777777777777F7F77777717777777777777777777777777777771777777
            7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
            77777777777777777F7F7F777777777777777777777777777777771777777777
            77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
            777777777777777777FFF77F7777717777777777777777777777777777177777
            77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
            77F7777777777777777777F77777777777777777777777777777777777777777
            77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
            F77777777777777777777777F7F7777777777777777777777777777777777777
            777777777717777777777777777777777777717777777777777F7F7F7F77F77F
            77F77777777F77777717777777F7777777777777777777777777777777777777
            77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
            7F77F77777777F77777717777777777777777777777777777777777777777777
            7777777777771777777777777777777777777777777777777F77F7F7F777F777
            F77F777777777777771771777777771777777777777777777777777777777777
            777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
            F7F7777777777777777717171777777777777777777777777777777777777777
            77777777777771777777777777777177777777777771777777777777F777F777
            7777777777777777777171717177771777777777777777777777777777777777
            77777777777777777777777777777777777777777777777777777F7F7F7F7777
            F77F77F777777777777771771717177777777777777777777777777777777777
            7777777777777777777777777777777777777777777177777777}
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object tb97BotoesDetalhe: TToolbar97
            Left = 0
            Top = 0
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object bbtnMarcar: TBitBtn
              Left = 0
              Top = 0
              Width = 100
              Height = 25
              Caption = 'Marcar'
              TabOrder = 0
              OnClick = bbtnMarcarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E668866666
                608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
                66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
                66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
                660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
            end
            object bbtnDesmarcar: TBitBtn
              Left = 100
              Top = 0
              Width = 100
              Height = 25
              Caption = 'Desmarcar'
              TabOrder = 1
              OnClick = bbtnDesmarcarClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              NumGlyphs = 2
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 438
      DockPos = 438
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 80
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 163
        OnClick = bbtnCancelarClick
      end
      object bbtnBusca: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Busca'
        Default = True
        TabOrder = 2
        OnClick = bbtnBuscaClick
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
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 691
    Top = 299
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  PROCESSAR = :PROCESSAR'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBEM = :OLD_IDBEM')
    InsertSQL.Strings = (
      'insert into BEM'
      '  (PROCESSAR)'
      'values'
      '  (:PROCESSAR)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBEM = :OLD_IDBEM')
    Left = 576
    Top = 248
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 540
    Top = 248
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BEM.PLACA,'
      '       BEM.DESBEM,'
      '       GRUPO.NOME AS DESCGRUPO,'
      
        '       CONJUNTO.DESCCONJUNTO, CONJUNTO.IDLOCALIZACAO, CONJUNTO.I' +
        'DRESPONSAVEL,'
      '       LOCALIZACAO.NOME AS DESCLOCAL,'
      '       PRESP.NOME AS NOMERESP, PFORN.NOME AS NOMEFORN,'
      '       CLASSEDEBEM.DESCRICAO AS DESCCLASSE,'
      '       BEM.DTAINCLUSAO,'
      '       DECODE(BEM.BAIXATOTAL,'#39'S'#39','#39'Baixado'#39','#39'Ativo'#39') as STATUS,'
      '       DECODE(BEM.CONTROLE,'#39'T'#39','#39'Total'#39','#39'Físico'#39') as TIPCONTROLE,'
      '       BEM.VALORG,'
      '       BEM.IDPESSOA, BEM.IDCLASSEBEM,'
      '       BEM.IDBEM, BEM.IDGRUPO,'
      '       BEM.IDCONJUNTO, (0) AS PROCESSAR'
      'FROM BEM,'
      '     CONJUNTO,'
      '     GRUPO,'
      '     LOCALIZACAO,'
      '     CLASSEDEBEM,'
      '     PESSOA PRESP, PESSOA PFORN'
      'WHERE'
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
      ''
      ''
      '      (( BEM.BAIXATOTAL='#39'N'#39' ) OR ( BEM.BAIXATOTAL IS NULL ))'
      '  AND ( BEM.IDCONJUNTO=CONJUNTO.IDCONJUNTO )'
      '  AND ( CONJUNTO.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+) )'
      '  AND ( CONJUNTO.IDRESPONSAVEL=PRESP.IDPESSOA(+) )'
      '  AND ( BEM.IDFORNSERV=PFORN.IDPESSOA(+) )'
      '  AND ( BEM.IDGRUPO=GRUPO.IDGRUPO(+) )'
      '  AND ( BEM.IDCLASSEBEM=CLASSEDEBEM.IDCLASSEBEM(+) )'
      'ORDER BY BEM.PLACA'
      '')
    UpdateObject = upd
    ControlType.Strings = (
      'SELECTED;CheckBox;True;False')
    ValidateWithMask = True
    Left = 504
    Top = 248
    object qryPLACA: TFloatField
      DisplayLabel = 'Patrimônio'
      DisplayWidth = 10
      FieldName = 'PLACA'
    end
    object qryDESBEM: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 70
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryDESCCONJUNTO: TStringField
      DisplayLabel = 'Conjunto'
      DisplayWidth = 100
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryDESCCLASSE: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 60
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qryDESCLOCAL: TStringField
      DisplayLabel = 'Localização'
      DisplayWidth = 60
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryNOMERESP: TStringField
      DisplayLabel = 'Responsável'
      DisplayWidth = 60
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryDESCGRUPO: TStringField
      DisplayLabel = 'Grupo Contábil'
      DisplayWidth = 60
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryDTAINCLUSAO: TDateTimeField
      DisplayLabel = 'Entrada em'
      DisplayWidth = 10
      FieldName = 'DTAINCLUSAO'
    end
    object qryVALORG: TFloatField
      DisplayLabel = 'Valor Aquisição'
      DisplayWidth = 10
      FieldName = 'VALORG'
    end
    object qrySTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 7
      FieldName = 'STATUS'
      Size = 7
    end
    object qryTIPCONTROLE: TStringField
      DisplayLabel = 'Controle'
      DisplayWidth = 6
      FieldName = 'TIPCONTROLE'
      Size = 6
    end
    object qryNOMEFORN: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qrySELECTED: TBooleanField
      DisplayLabel = '...'
      DisplayWidth = 2
      FieldKind = fkCalculated
      FieldName = 'SELECTED'
      Calculated = True
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryIDBEM: TFloatField
      FieldName = 'IDBEM'
      Visible = False
    end
    object qryIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Visible = False
    end
    object qryPROCESSAR: TFloatField
      FieldName = 'PROCESSAR'
      Visible = False
    end
    object qryIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Visible = False
    end
    object qryIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
    end
    object qryIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
  end
  object qryResponsavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, R.IDRESPONSAVEL'
      'FROM PESSOA P,'
      '     RESPONSAVEL R'
      'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 296
    Top = 328
    object qryResponsavelNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryResponsavelIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'RESPONSAVEL.IDRESPONSAVEL'
    end
  end
  object qryGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, CLASSE, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'A'#39')'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 224
    Top = 328
    object qryGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryConjunto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCCONJUNTO, IDCONJUNTO'
      'FROM CONJUNTO'
      'ORDER BY DESCCONJUNTO'
      '')
    ValidateWithMask = True
    Left = 160
    Top = 328
    object qryConjuntoDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Origin = 'CONJUNTO.DESCCONJUNTO'
      Size = 200
    end
    object qryConjuntoIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
      Origin = 'CONJUNTO.IDCONJUNTO'
    end
  end
  object qryLocalizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 88
    Top = 328
    object qryLocalizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryLocalizacaoIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = '"CM.LOCALIZACAO".IDLOCALIZACAO'
    end
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
      'FROM CLASSEDEBEM'
      'WHERE (ANASINT = '#39'A'#39')'
      'ORDER BY CODHIERARQ')
    ValidateWithMask = True
    Left = 24
    Top = 328
    object qryClasseDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'CLASSEDEBEM.DESCRICAO'
      Size = 60
    end
    object qryClasseCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = 'CLASSEDEBEM.CODHIERARQ'
      Size = 15
    end
    object qryClasseIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'CLASSEDEBEM.IDCLASSEBEM'
    end
  end
end
