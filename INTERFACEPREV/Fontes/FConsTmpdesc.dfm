inherited frmConsTmpdesc: TfrmConsTmpdesc
  Left = 292
  Top = 179
  HelpContext = 320027
  Caption = 'Consulta de Cobranças'
  ClientHeight = 449
  ClientWidth = 754
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 204
    Width = 754
    Height = 7
    Cursor = crVSplit
    Align = alTop
  end
  inherited pnlFundo: TPanel
    Top = 211
    Width = 754
    Height = 180
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 754
    inherited TB97oKCancelar: TToolbar97 [0]
      Left = 116
      DockPos = 116
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    inherited tb97Fundo: TToolbar97 [1]
      Left = 582
      DockPos = 584
    end
  end
  inherited pnlPesquisa: TPanel
    Width = 754
    Height = 204
    inherited Panel4: TPanel
      Left = 602
      Top = 144
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 592
      Height = 202
      ActivePage = tbgeral
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbgeral: TTabSheet
        Caption = 'Geral  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object Label7: TLabel
          Left = 11
          Top = 4
          Width = 66
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label8: TLabel
          Left = 11
          Top = 48
          Width = 48
          Height = 13
          Caption = 'Fundação'
        end
        object Label9: TLabel
          Left = 11
          Top = 90
          Width = 97
          Height = 13
          Caption = 'Empresa Proprietária'
        end
        object Label10: TLabel
          Left = 214
          Top = 90
          Width = 97
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label11: TLabel
          Left = 214
          Top = 4
          Width = 85
          Height = 13
          Caption = 'Plano Assistencial'
        end
        object Label12: TLabel
          Left = 214
          Top = 48
          Width = 59
          Height = 13
          Caption = 'Contribuição'
        end
        object Label13: TLabel
          Left = 10
          Top = 131
          Width = 46
          Height = 13
          Caption = 'Benefício'
        end
        object Label14: TLabel
          Left = 213
          Top = 131
          Width = 151
          Height = 13
          Caption = 'Tipo de Contrato de Empréstimo'
        end
        object Label34: TLabel
          Left = 397
          Top = 4
          Width = 32
          Height = 13
          Caption = 'Motivo'
        end
        object Label35: TLabel
          Left = 449
          Top = 103
          Width = 70
          Height = 13
          Caption = 'Ordem do Lote'
        end
        object Label36: TLabel
          Left = 449
          Top = 54
          Width = 76
          Height = 13
          Caption = 'Número do Lote'
        end
        object cmbpatro: TwwDBLookupCombo
          Left = 9
          Top = 18
          Width = 175
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
          OnEnter = cmbpatroEnter
        end
        object cmbfundacao: TwwDBLookupCombo
          Left = 9
          Top = 62
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryfundacao
          LookupField = 'IDPESSOA'
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbfundacaoEnter
        end
        object cmbemp: TwwDBLookupCombo
          Left = 9
          Top = 104
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryempresaprop
          LookupField = 'IDPESSOA'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbempEnter
        end
        object cmbplanprev: TwwDBLookupCombo
          Left = 212
          Top = 104
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME')
          LookupTable = qryplanprev
          LookupField = 'IDPLANOPREV'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbplanprevEnter
        end
        object cmbplanass: TwwDBLookupCombo
          Left = 212
          Top = 18
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'40'#9'NOME')
          LookupTable = qryplanass
          LookupField = 'IDPLANASS'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbplanassEnter
        end
        object cmbcont: TwwDBLookupCombo
          Left = 212
          Top = 62
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qrycont
          LookupField = 'IDCONTRIBUICAO'
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcontEnter
        end
        object cmbbenef: TwwDBLookupCombo
          Left = 9
          Top = 146
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qrybenef
          LookupField = 'IDBENEFICIO'
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbbenefEnter
        end
        object cmbtipocontr: TwwDBLookupCombo
          Left = 212
          Top = 146
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'40'#9'Descrição'#9'F')
          LookupTable = qrytipcontr
          LookupField = 'IDTIPOCONTREMPTMO'
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbtipocontrEnter
        end
        object cmbmotivo: TwwDBLookupCombo
          Left = 396
          Top = 18
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          LookupTable = qrymotivo
          LookupField = 'IDMOTIVO'
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbmotivoEnter
        end
        object ednumlote: TEditNum
          Left = 448
          Top = 70
          Width = 121
          Height = 21
          TabOrder = 9
          IntDigits = 10
          Signal = False
          DecDigits = 0
          Numeric = True
          Alignment = taRightJustify
        end
        object ednumordem: TEditNum
          Left = 448
          Top = 118
          Width = 121
          Height = 21
          TabOrder = 10
          IntDigits = 10
          Signal = False
          DecDigits = 0
          Numeric = True
          Alignment = taRightJustify
        end
      end
      object tbpessoa: TTabSheet
        Caption = 'Participante  '
        object Label27: TLabel
          Left = 20
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label28: TLabel
          Left = 20
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Matrícula'
        end
        object Label29: TLabel
          Left = 164
          Top = 64
          Width = 160
          Height = 13
          Caption = 'Inscrição em Plano Previdenciário'
        end
        object ednome: TEdit
          Left = 20
          Top = 32
          Width = 353
          Height = 21
          TabOrder = 0
        end
        object edmat: TEdit
          Left = 20
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edinsc: TEdit
          Left = 164
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object tbdatas: TTabSheet
        Caption = 'Datas  '
        object GroupBox1: TGroupBox
          Left = 238
          Top = 0
          Width = 119
          Height = 174
          Align = alLeft
          Caption = 'Data de Cobrança'
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 38
            Width = 27
            Height = 13
            Caption = 'Inicial'
          end
          object Label2: TLabel
            Left = 4
            Top = 86
            Width = 22
            Height = 13
            Caption = 'Final'
          end
          object dtcobini: TCMDateTimePicker
            Left = 4
            Top = 54
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
            TabOrder = 0
          end
          object dtcobfin: TCMDateTimePicker
            Left = 4
            Top = 102
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
        end
        object GroupBox2: TGroupBox
          Left = 119
          Top = 0
          Width = 119
          Height = 174
          Align = alLeft
          Caption = 'Data de Referência'
          TabOrder = 1
          object Label3: TLabel
            Left = 4
            Top = 38
            Width = 27
            Height = 13
            Caption = 'Inicial'
          end
          object Label4: TLabel
            Left = 4
            Top = 86
            Width = 22
            Height = 13
            Caption = 'Final'
          end
          object dtrefini: TCMDateTimePicker
            Left = 4
            Top = 54
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
            TabOrder = 0
          end
          object dtreffin: TCMDateTimePicker
            Left = 4
            Top = 102
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
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 119
          Height = 174
          Align = alLeft
          Caption = 'Data de Recebimento'
          TabOrder = 2
          object Label5: TLabel
            Left = 4
            Top = 38
            Width = 27
            Height = 13
            Caption = 'Inicial'
          end
          object Label6: TLabel
            Left = 4
            Top = 86
            Width = 22
            Height = 13
            Caption = 'Final'
          end
          object dtrecini: TCMDateTimePicker
            Left = 4
            Top = 54
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
            TabOrder = 0
          end
          object dtrecfin: TCMDateTimePicker
            Left = 4
            Top = 102
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
        end
        object GroupBox4: TGroupBox
          Left = 357
          Top = 0
          Width = 227
          Height = 88
          Caption = 'Mês de Referência  '
          TabOrder = 3
          object Label30: TLabel
            Left = 6
            Top = 14
            Width = 27
            Height = 13
            Caption = 'Início'
          end
          object Label31: TLabel
            Left = 6
            Top = 49
            Width = 16
            Height = 13
            Caption = 'Fim'
          end
          object cmbrefini: TComboBox
            Left = 79
            Top = 27
            Width = 109
            Height = 21
            ItemHeight = 13
            TabOrder = 0
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
          object cmbreffin: TComboBox
            Left = 78
            Top = 61
            Width = 110
            Height = 21
            ItemHeight = 13
            TabOrder = 1
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
          object spnrefini: TSpinEdit
            Left = 5
            Top = 27
            Width = 73
            Height = 22
            EditorEnabled = False
            MaxValue = 2100
            MinValue = 1997
            TabOrder = 2
            Value = 1997
          end
          object spnreffin: TSpinEdit
            Left = 4
            Top = 61
            Width = 73
            Height = 22
            EditorEnabled = False
            MaxValue = 2100
            MinValue = 1997
            TabOrder = 3
            Value = 1997
          end
        end
        object GroupBox5: TGroupBox
          Left = 357
          Top = 87
          Width = 227
          Height = 87
          Caption = 'Mês de Cobrança  '
          TabOrder = 4
          object Label32: TLabel
            Left = 6
            Top = 14
            Width = 27
            Height = 13
            Caption = 'Início'
          end
          object Label33: TLabel
            Left = 6
            Top = 49
            Width = 16
            Height = 13
            Caption = 'Fim'
          end
          object cmbcobini: TComboBox
            Left = 79
            Top = 27
            Width = 109
            Height = 21
            ItemHeight = 13
            TabOrder = 0
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
          object cmbcobfin: TComboBox
            Left = 78
            Top = 61
            Width = 110
            Height = 21
            ItemHeight = 13
            TabOrder = 1
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
          object spncobini: TSpinEdit
            Left = 5
            Top = 27
            Width = 73
            Height = 22
            EditorEnabled = False
            MaxValue = 2100
            MinValue = 1997
            TabOrder = 2
            Value = 1997
          end
          object spncobfin: TSpinEdit
            Left = 4
            Top = 61
            Width = 73
            Height = 22
            EditorEnabled = False
            MaxValue = 2100
            MinValue = 1997
            TabOrder = 3
            Value = 1997
          end
        end
      end
      object tbint: TTabSheet
        Caption = 'Integração CAP/CAR/Contabilidade  '
        object Label15: TLabel
          Left = 8
          Top = 6
          Width = 134
          Height = 13
          Caption = 'Centro de Custo para Débito'
        end
        object Label16: TLabel
          Left = 8
          Top = 48
          Width = 136
          Height = 13
          Caption = 'Centro de Custo para Crédito'
        end
        object Label17: TLabel
          Left = 8
          Top = 90
          Width = 98
          Height = 13
          Caption = 'Unidade de Negócio'
        end
        object Label18: TLabel
          Left = 195
          Top = 6
          Width = 156
          Height = 13
          Caption = 'Tipo de Desembolso/Pagamento'
        end
        object Label19: TLabel
          Left = 195
          Top = 48
          Width = 141
          Height = 13
          Caption = 'Grupo de Lanámento Contábil'
        end
        object Label20: TLabel
          Left = 195
          Top = 90
          Width = 78
          Height = 13
          Caption = 'Plano de Contas'
        end
        object Label21: TLabel
          Left = 8
          Top = 132
          Width = 42
          Height = 13
          Caption = 'Alterador'
        end
        object Label22: TLabel
          Left = 195
          Top = 131
          Width = 94
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label23: TLabel
          Left = 382
          Top = 6
          Width = 133
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object Label24: TLabel
          Left = 382
          Top = 48
          Width = 86
          Height = 13
          Caption = 'Conta para Débito'
        end
        object Label25: TLabel
          Left = 383
          Top = 91
          Width = 88
          Height = 13
          Caption = 'Conta para Crédito'
        end
        object Label26: TLabel
          Left = 383
          Top = 131
          Width = 101
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object cmbcentcustd: TwwDBLookupCombo
          Left = 8
          Top = 20
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = qrycentcustd
          LookupField = 'CODCENTROCUSTO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcentcustdEnter
        end
        object cmbcentcustc: TwwDBLookupCombo
          Left = 8
          Top = 62
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = qrycentcustc
          LookupField = 'CODCENTROCUSTO'
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcentcustcEnter
        end
        object cmbunidnegoc: TwwDBLookupCombo
          Left = 8
          Top = 104
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'NOME')
          LookupTable = qryunidnegoc
          LookupField = 'UNIDNEGOC'
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbunidnegocEnter
        end
        object cmbcontac: TwwDBLookupCombo
          Left = 382
          Top = 105
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANOME'#9'40'#9'PLANOME'
            'PLACONTA'#9'18'#9'PLACONTA')
          LookupTable = qryplacontac
          LookupField = 'PLACONTA'
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcontacEnter
        end
        object cmbalterador: TwwDBLookupCombo
          Left = 8
          Top = 146
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryalterador
          LookupField = 'CODALTERADOR'
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbalteradorEnter
        end
        object cmbplano: TwwDBLookupCombo
          Left = 195
          Top = 104
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANO'#9'20'#9'DESCPLANO')
          LookupTable = qryplano
          LookupField = 'DESCPLANO'
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbplanoEnter
        end
        object cmbtipoper: TwwDBLookupCombo
          Left = 195
          Top = 62
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
          LookupTable = qrytipoper
          LookupField = 'TIPCODIGO'
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbtipoperEnter
        end
        object cmbtiporecdes: TwwDBLookupCombo
          Left = 195
          Top = 20
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qrytiprecdes
          LookupField = 'CODTIPRECDES'
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbtiporecdesEnter
        end
        object cmbtipodoc: TwwDBLookupCombo
          Left = 195
          Top = 146
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qrytipdoc
          LookupField = 'CODTIPDOC'
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbtipodocEnter
        end
        object cmbcontad: TwwDBLookupCombo
          Left = 382
          Top = 62
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANOME'#9'40'#9'PLANOME'
            'PLACONTA'#9'18'#9'PLACONTA')
          LookupTable = qryplacontad
          LookupField = 'PLACONTA'
          TabOrder = 9
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcontadEnter
        end
        object cmbcentrespon: TwwDBLookupCombo
          Left = 382
          Top = 20
          Width = 177
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'NOME')
          LookupTable = qrycentrespon
          LookupField = 'CODCENTRORESPON'
          TabOrder = 10
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbcentresponEnter
        end
        object cmbforma: TwwDBLookupCombo
          Left = 382
          Top = 146
          Width = 179
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'DESCRICAO')
          LookupTable = qryform
          LookupField = 'CODPORTFORMA'
          TabOrder = 11
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnEnter = cmbformaEnter
        end
      end
      object tbsist: TTabSheet
        Caption = 'Opções  '
        object rdgrpsist: TRadioGroup
          Left = 0
          Top = 0
          Width = 194
          Height = 174
          Align = alLeft
          Caption = 'Sistema '
          ItemIndex = 4
          Items.Strings = (
            'Previdenciário'
            'Assistencial'
            'Empréstimo'
            'Folha de Benefício'
            'Todos')
          TabOrder = 0
        end
        object rdgrpdestino: TRadioGroup
          Left = 194
          Top = 0
          Width = 194
          Height = 174
          Align = alLeft
          Caption = 'Destino do Envio '
          ItemIndex = 4
          Items.Strings = (
            'Folha da Patrocinadora'
            'Folha de Benefícios'
            'Banco'
            'Não é Desconto'
            'Todos')
          TabOrder = 1
        end
        object rdgrpcpagar: TRadioGroup
          Left = 388
          Top = 0
          Width = 194
          Height = 174
          Align = alLeft
          Caption = 'Pagar / Receber '
          ItemIndex = 2
          Items.Strings = (
            'Pagamentos'
            'Recebimentos'
            'Todos')
          TabOrder = 2
        end
      end
      object tbtipodesc: TTabSheet
        Caption = 'Tipo de Desconto  '
        object rdgrptipodesc: TRadioGroup
          Left = 0
          Top = 0
          Width = 584
          Height = 174
          Align = alClient
          Columns = 2
          ItemIndex = 18
          Items.Strings = (
            'Contribuição Assistencial'
            'Contribuição Previdenciária'
            'Benefício'
            'Crédito de Empréstimo'
            'Quitação Antecipada'
            'Item de Empréstimo'
            'Rubrica Individual'
            'Pagamento ao Fornecedor Assistencial'
            'Comissão do Fornecedor Assistencial'
            'IRRF'
            'Contribuição Previdenciária já Recebida'
            'Reserva de Poupança'
            'Valor Líquido do Benefício'
            'SubItem de Empréstimo'
            'Item Isolado de Empréstimo'
            'Transferência de Reservas'
            'Comissionamento'
            'Abono'
            'Todos')
          TabOrder = 0
        end
      end
      object tbsit: TTabSheet
        Caption = 'Situação'
        object rdgrpsit: TRadioGroup
          Left = 0
          Top = 0
          Width = 584
          Height = 174
          Align = alClient
          Columns = 2
          ItemIndex = 7
          Items.Strings = (
            'Não Enviado para CAP/CAR/Contabilidade'
            'Enviado para CAP/CAR/Contabilidade'
            'Lançamento de Estorno'
            'Lançamento Estornado'
            'Recebido pelo CCP'
            'Recebido Parcialmente Pelo CCP'
            'Recebido pelo Módulo de Origem'
            'Todos')
          TabOrder = 0
        end
      end
    end
    object btnvoltar: TBitBtn
      Left = 612
      Top = 46
      Width = 115
      Height = 38
      Hint = 'Limpa campos do filtro de consulta'
      Caption = '&Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnvoltarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  inherited tsetResult: TTabSet
    Top = 430
    Width = 754
  end
  inherited grpResultado: TGroupBox
    Top = 211
    Width = 754
    Height = 180
    inherited Panel1: TPanel
      Width = 750
      Height = 153
      inherited dbgrdResultado: TwwDBGrid
        Width = 750
        Height = 153
        Selected.Strings = (
          'DEPEN'#9'25'#9'Beneficiário / Fornecedor'#9'No'
          'NOME'#9'25'#9'Titular'#9'No'
          'VALOR'#9'10'#9'Valor'#9'No'
          'RECPAG'#9'15'#9'Pagar / ~Receber'#9'No'
          'DESCRICAO'#9'25'#9'Descrição'#9'No'
          'MESREFERENCIA'#9'15'#9'Mês de ~Referência'#9'No'
          'MESCOBRANCA'#9'14'#9'Mês de ~Cobrança'#9'No'
          'DATACOBRANCA'#9'15'#9'Data de ~Cobrança'#9'No'
          'DATARECEBIMENTO'#9'19'#9'Data do Recebimento / ~Pagamento'#9'No'
          'VALORRECEBIDO'#9'15'#9'Valor Recebido / ~Pago'#9'No'
          'NUMPRIORIDADE'#9'16'#9'Prioridade'#9'No'
          'IDLOTE'#9'10'#9'Número do ~Lote'#9'No'
          'ORDEM'#9'13'#9'Ordem do Lote'#9'No'
          'VALORBASE1'#9'12'#9'Valor Base 1'#9'No'
          'VALORBASE2'#9'12'#9'Valor Base 2'#9'No'
          'VALORBASE3'#9'12'#9'Valor Base 3'#9'No'
          'FLGATRASODEVOL'#9'17'#9'Atraso/Devolução'#9'No'
          'FLGTIPODESC'#9'14'#9'Tipo de ~Desconto'#9'No'
          'FLGDESCFOLHA'#9'17'#9'Destino da ~Cobrança'#9'No'
          'SISTORIGEM'#9'15'#9'Sistema de ~Origem'#9'No'
          'PERIODO'#9'13'#9'Período Contábil'#9'No'
          'EXERCICIO'#9'15'#9'Exercício Contábil'#9'No'
          'SITENVIO'#9'17'#9'Situação do ~Envio'#9'No'
          'CONT'#9'25'#9'Contribuição'#9'No'
          'BEN'#9'25'#9'Benefício'#9'No'
          'DESCTIPOCONTRATO'#9'30'#9'Tipo de ~Desconto'#9'No'
          'MOTIVO'#9'25'#9'Motivo'#9'No'
          'PROVENTO'#9'30'#9'Rubrica'#9'No'
          'NOMECENTC'#9'30'#9'Centro de Custo ~para Crédito'#9'No'
          'NOMECENTD'#9'30'#9'Centro de Custo ~para Débito '#9'No'
          'CENTRESPON'#9'30'#9'Centro de ~Responsabilidade'#9'No'
          'ALTERADOR'#9'35'#9'Alterador'#9'No'
          'DESCPLANO'#9'20'#9'Plano de Contas'#9'No'
          'PLCONTAD'#9'25'#9'Plano de Conta ~a Débito '#9'No'
          'PLCONTAC'#9'25'#9'Plano de Conta ~a Crédito'#9'No'
          'TIPODOC'#9'25'#9'Tipo de ~Documento'#9'No'
          'TIPRECDES'#9'35'#9'Tipo de Recebimento / ~Desembolso'#9'No'
          'PORT'#9'35'#9'Forma de ~Pagamento'#9'No'
          'NOMEUNIDNEGOC'#9'25'#9'Unidade de ~Negócio'#9'No'
          'PLNPLANIL'#9'10'#9'Planilha'#9'No'
          'NODOCUMENTO'#9'19'#9'Número do ~Documento'#9'No'
          'COMPLDOCUMENTO'#9'18'#9'Complemento do ~Documento'#9'No'
          'NOMESUBCONTA'#9'25'#9'Subconta'#9'No'
          'EMP'#9'30'#9'Empresa ~Proprietária'#9'No'
          'FUND'#9'30'#9'Fundação'#9'No'
          'PESSJUR'#9'25'#9'Patrocinadora'#9'No'
          'PLANPREV'#9'25'#9'Plano Previdenciário'#9'No'
          'PLANASS'#9'25'#9'Plano Assistencial'#9'No'
          'MATRICULA'#9'13'#9'Matrícula'#9'No'
          'INSCRICAONUMERO'#9'18'#9'Número da ~Inscrição'#9'No'
          'NUMDEPENDSEGURO'#9'20'#9'Participante/Cônjugue'#9'No')
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TitleLines = 2
        TitleButtons = True
        OnTitleButtonClick = dbgrdResultadoTitleButtonClick
        object dbgrdResultadoIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 15
          Height = 29
          AllowAllUp = True
          Flat = True
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
  end
  inherited ds: TwwDataSource
    DataSet = qrytmpdesc
    Left = 20
    Top = 320
  end
  object qrytmpdesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT '
      
        '        DECODE(T.RECPAG,'#39'P'#39','#39'Contas a Pagar'#39','#39'R'#39','#39'Contas a Receb' +
        'er'#39') RECPAG , '
      '        T.MESREFERENCIA ,'
      
        '        DECODE(T.FLGTIPODESC,'#39'A'#39','#39'Contribuição Assistencial'#39','#39'P'#39 +
        ','#39'Contribuição Previdenciária'#39','#39'B'#39','#39'Benefício'#39','
      
        '        '#39'C'#39','#39'Crédito de Empréstimo'#39','#39'H'#39','#39'Quitação Antecipada'#39','#39'E' +
        #39','#39'Parcela de Empréstimo'#39','
      
        '        '#39'D'#39','#39'Rubrica Individual'#39','#39'F'#39','#39'Pagamento ao Fornecedor As' +
        'sistencial'#39','#39'G'#39','#39'Recebimento de Comissão do Fornecedor'#39','
      
        '        '#39'I'#39','#39'IRRF'#39','#39'J'#39','#39'Contribuição Previdenciária já Recebida'#39 +
        ','#39'R'#39','#39'Reserva de Poupança'#39
      '        ,'#39'L'#39','#39'Valor Líquido do Benefício'#39') FLGTIPODESC,  '
      
        '        T.VALOR , T.DATARECEBIMENTO , T.MESCOBRANCA  ,T.VALORREC' +
        'EBIDO,'
      
        '        T.NUMPRIORIDADE ,  T.ORDEM ,  T.MATRICULA , T.INSCRICAON' +
        'UMERO , T.VALORBASE1  , T.VALORBASE2,'
      
        '        T.VALORBASE3  ,DECODE(T.NUMDEPENDSEGURO,'#39'0'#39','#39'Participant' +
        'e'#39','#39'1'#39','#39'Cônjugue'#39') NUMDEPENDSEGURO ,'
      
        '        DECODE(T.FLGDESCFOLHA,'#39'P'#39','#39'Folha da Patrocinadora'#39','#39'B'#39','#39 +
        'Folha de Benefícios'#39','
      '        '#39'O'#39','#39'Banco'#39','#39'N'#39','#39'Não é um Desconto'#39') FLGDESCFOLHA,'
      '        T.DESCRICAO , T.REFERENCIA,'
      
        '        DECODE(T.SISTORIGEM,'#39'17'#39','#39'Assistencial'#39','#39'18'#39','#39'Folha de B' +
        'enefícios'#39','
      
        '        '#39'15'#39','#39'Empréstimo'#39','#39'16'#39','#39'Previdenciário'#39') SISTORIGEM ,  T' +
        '.PERIODO , T.EXERCICIO,'
      
        '        DECODE(T.FLGATRASODEVOL,'#39'A'#39','#39'Atraso'#39','#39'D'#39','#39'Devolução'#39','#39'N'#39 +
        ','#39'Normal'#39') FLGATRASODEVOL ,'
      '        T.CODALTERADOR,'
      
        '        T.DATACOBRANCA  ,T.NODOCUMENTO,T.COMPLDOCUMENTO, T.IDLOT' +
        'E,  '
      
        '        DECODE(T.SITENVIO,'#39'0'#39','#39'Não Enviado'#39','#39'1'#39','#39'Enviado'#39','#39'2'#39','#39'R' +
        'ecebido'#39') SITENVIO,'
      
        '        M.DESCRICAO MOTIVO , PES.NOME , PESSJUR.NOME PESSJUR ,PL' +
        'N.PLNPLANIL,'
      
        '        DECODE(T.FLGALTERADOR,'#39'J'#39','#39'Juros'#39','#39'C'#39','#39'Correção'#39') FLGALT' +
        'ERADOR,'
      
        '        DECODE(T.FLGDESCONTO,'#39'1'#39','#39'Desconto'#39','#39'0'#39','#39'Não é Desconto'#39 +
        ','#39'2'#39','#39'Desconto Especial'#39','
      
        '        '#39'3'#39','#39'Desconto apenas Contabilizado'#39') FLGDESCONTO, CENTC.' +
        'NOME NOMECENTC , '
      
        '        CENTD.NOME NOMECENTD , EMP.NOME EMP , FUND.NOME FUND , P' +
        'LANO.DESCPLANO,'
      
        '        PLANASS.NOME PLANASS, PLANPREV.NOME PLANPREV , CO.NOME C' +
        'ONT,'
      
        '        BE.NOME BEN, TIPOCONTR.DESCTIPOCONTRATO , PORTADORFORMA.' +
        'DESCRICAO PORT , '
      
        '        TIPOPER.TIPDESCRICAO TIPCODIGO, PROVDESC.DESCRICAO PROVE' +
        'NTO , PLAC.PLANOME PLCONTAC , '
      
        '        PLAD.PLANOME PLCONTAD , CENTRESPON.NOME CENTRESPON , SUB' +
        'CONTA.NOMESUBCONTA,'
      
        '        UNIDNEGOCIO.NOME NOMEUNIDNEGOC , TIPOALTERADOR.DESCRICAO' +
        ' ALTERADOR ,'
      
        '        TIPORECEBDESEMB.DESCRICAO TIPRECDES , TIPODOCRECPAG.DESC' +
        'RICAO TIPODOC,'
      '        DEPEN.NOME DEPEN'
      ''
      
        'FROM TMPDESC T , MOTIVO M, PLANILHA PLN , DOCUMENTO DOC , PESSOA' +
        ' PES , PESSOA PESSJUR,'
      
        '     PESSOA DEPEN , PESSOA EMP, CENTCUST CENTD , CENTCUST CENTC ' +
        ', PESSOA FUND, PLANO,'
      
        '     PLANPREV , PLANASS , CONTRIBUICAO CO , BENEFICIO BE, CONTRA' +
        'TO , TIPOCONTR, '
      
        '     PORTADORFORMA,TIPOPER, PROVDESC, PLANOCONTA PLAD , PLANOCON' +
        'TA PLAC , CENTRESPON,'
      
        '     SUBCONTA , UNIDNEGOCIO , TIPOALTERADOR , TIPORECEBDESEMB , ' +
        'TIPODOCRECPAG'
      ''
      'WHERE'
      'T.IDMOTIVO  = M.IDMOTIVO(+) AND'
      'T.CODDOCUMENTOPREV = DOC.CODDOCUMENTO(+) AND'
      'T.PLNCODIGOPREV = PLN.PLNCODIGO(+) AND'
      'T.IDTITULAR = PES.IDPESSOA(+) AND'
      'T.IDPESSJUR = PESSJUR.IDPESSOA(+) AND'
      'T.IDPESSOA = DEPEN.IDPESSOA(+) AND'
      'T.IDEMPRESAPROP = EMP.IDPESSOA(+) AND'
      'T.CODCENTROCUSTOD = CENTD.CODCENTROCUSTO(+) AND'
      'T.CODCENTROCUSTOC = CENTC.CODCENTROCUSTO(+) AND'
      'T.IDFUNDACAO = FUND.IDPESSOA(+) AND'
      'T.PLANO = PLANO.PLANO(+) AND'
      'T.IDDESCONTO = CO.IDCONTRIBUICAO(+) AND'
      'T.IDDESCONTO = BE.IDBENEFICIO(+) AND'
      'T.IDPLANASS = PLANASS.IDPLANASS(+) AND'
      'T.IDPLANOPREV = PLANPREV.IDPLANOPREV(+) AND'
      'T.IDDESCONTO = CONTRATO.IDCONTRCREDMUT(+) AND'
      'CONTRATO.IDTIPOCONTRATO = TIPOCONTR.IDTIPOCONTRATO(+) AND'
      'T.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA(+) AND'
      'T.TIPCODIGO = TIPOPER.TIPCODIGO(+) AND'
      'T.IDPROVENTO = PROVDESC.IDPROVENTO(+) AND'
      'T.PLACONTAC = PLAC.PLACONTA(+) AND'
      'T.PLACONTAD = PLAD.PLACONTA(+) AND'
      'T.CODCENTRORESPON = CENTRESPON.CODCENTRORESPON(+) AND'
      'T.CODSUBCONTA = SUBCONTA.CODSUBCONTA(+) AND'
      'T.UNIDNEGOC = UNIDNEGOCIO.UNIDNEGOC(+) AND'
      'T.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) AND'
      'T.CODTIPRECDES = TIPORECEBDESEMB.CODTIPRECDES(+) AND'
      'T.CODTIPDOC = TIPODOCRECPAG.CODTIPDOC(+) '
      ''
      '')
    ValidateWithMask = True
    Left = 26
    Top = 302
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME FROM '
      'PESSOA '
      'WHERE FLGPATROCINADORA = 1 ')
    ValidateWithMask = True
    Left = 275
    Top = 296
  end
  object qryplanprev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME '
      'FROM PLANPREV')
    ValidateWithMask = True
    Left = 171
    Top = 248
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, NOME FROM PLANASS')
    ValidateWithMask = True
    Left = 171
    Top = 344
  end
  object qrycont: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO, NOME'
      'FROM CONTRIBUICAO')
    ValidateWithMask = True
    Left = 227
    Top = 248
  end
  object qrytipcontr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCONTREMPTMO ,  TCEDESCRICAO'
      'FROM TIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 227
    Top = 296
  end
  object qryfundacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA , PESSOA.NOME'
      'FROM PESSOA , FUNDACAO'
      'WHERE '
      'PESSOA.IDPESSOA =FUNDACAO.IDPESSOA')
    ValidateWithMask = True
    Left = 171
    Top = 296
  end
  object qrybenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBENEFICIO , NOME'
      'FROM BENEFICIO')
    ValidateWithMask = True
    Left = 275
    Top = 248
  end
  object qrytipdoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPDOC , DESCRICAO'
      'FROM TIPODOCRECPAG')
    ValidateWithMask = True
    Left = 587
    Top = 256
  end
  object qryplacontad: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PLACONTA , PLANOME'
      'FROM PLANOCONTA')
    ValidateWithMask = True
    Left = 491
    Top = 352
  end
  object qryplacontac: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PLACONTA , PLANOME'
      'FROM PLANOCONTA')
    ValidateWithMask = True
    Left = 547
    Top = 352
  end
  object qrycentrespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON , NOME , IDPESSOA'
      'FROM CENTRESPON')
    ValidateWithMask = True
    Left = 587
    Top = 304
  end
  object qrytipoper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  TIPCODIGO, TIPDESCRICAO'
      'FROM TIPOPER')
    ValidateWithMask = True
    Left = 491
    Top = 304
  end
  object qryalterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR , DESCRICAO '
      'FROM TIPOALTERADOR')
    ValidateWithMask = True
    Left = 539
    Top = 304
  end
  object qryunidnegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC , NOME'
      'FROM UNIDNEGOCIO')
    ValidateWithMask = True
    Left = 435
    Top = 352
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO , DESCPLANO '
      'FROM PLANO')
    ValidateWithMask = True
    Left = 539
    Top = 256
  end
  object qrytiprecdes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES , DESCRICAO'
      'FROM TIPORECEBDESEMB')
    ValidateWithMask = True
    Left = 491
    Top = 256
  end
  object qryempresaprop: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA , PESSOA.NOME '
      'FROM PESSOA , EMPRESAPROP'
      'WHERE PESSOA.IDPESSOA = EMPRESAPROP.IDPESSOA')
    ValidateWithMask = True
    Left = 226
    Top = 348
  end
  object qrycentcustc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO , NOME '
      'FROM CENTCUST')
    ValidateWithMask = True
    Left = 437
    Top = 257
  end
  object qrycentcustd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO , NOME '
      'FROM CENTCUST')
    ValidateWithMask = True
    Left = 437
    Top = 305
  end
  object qryform: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CODPORTFORMA , DESCRICAO'
      'FROM PORTADORFORMA')
    ValidateWithMask = True
    Left = 586
    Top = 356
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO '
      'FROM MOTIVO')
    ValidateWithMask = True
    Left = 282
    Top = 348
  end
end
