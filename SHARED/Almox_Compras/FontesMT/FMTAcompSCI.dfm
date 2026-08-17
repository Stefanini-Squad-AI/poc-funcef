inherited FrmMTAcompSCI: TFrmMTAcompSCI
  Left = 121
  Top = 74
  Caption = 'Acompanhamento de Solicitação de Compra'
  ClientHeight = 399
  ClientWidth = 602
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 602
    Height = 360
    object PgcSCI: TPageControl
      Left = 1
      Top = 1
      Width = 600
      Height = 358
      ActivePage = TbFiltro
      Align = alClient
      TabOrder = 0
      object TbFiltro: TTabSheet
        Caption = 'Parâmetros da Consulta'
        object Label1: TLabel
          Left = 16
          Top = 40
          Width = 55
          Height = 13
          Caption = 'Nº  S.C.I.'
        end
        object Label4: TLabel
          Left = 248
          Top = 256
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object Label7: TLabel
          Left = 16
          Top = 216
          Width = 134
          Height = 13
          Caption = 'Almoxarifado de Origem'
        end
        object Label8: TLabel
          Left = 16
          Top = 256
          Width = 107
          Height = 13
          Caption = 'Grupo de Produtos'
        end
        object Label9: TLabel
          Left = 16
          Top = 168
          Width = 104
          Height = 13
          Caption = 'Descrição do Item'
        end
        object Label13: TLabel
          Left = 248
          Top = 168
          Width = 44
          Height = 13
          Caption = 'Usuário'
        end
        object Label14: TLabel
          Left = 249
          Top = 218
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object EdNumSCI: TEditNum
          Left = 16
          Top = 56
          Width = 209
          Height = 21
          TabOrder = 0
          OnKeyPress = EdNumSCIKeyPress
          IntDigits = 0
          Signal = False
          DecDigits = 0
          Numeric = False
          Alignment = taRightJustify
        end
        object dblcCCust: TwwDBLookupCombo
          Left = 248
          Top = 272
          Width = 313
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Código')
          LookupTable = cdsCCusto
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object GrpData: TGroupBox
          Left = 248
          Top = 48
          Width = 317
          Height = 113
          Caption = ' Data '
          TabOrder = 2
          object Label2: TLabel
            Left = 24
            Top = 24
            Width = 85
            Height = 13
            Caption = 'Emissão Inicial'
          end
          object Label3: TLabel
            Left = 24
            Top = 64
            Width = 112
            Height = 13
            Caption = 'Necessidade Inicial'
          end
          object Label10: TLabel
            Left = 168
            Top = 24
            Width = 78
            Height = 13
            Caption = 'Emissão Final'
          end
          object Label11: TLabel
            Left = 168
            Top = 64
            Width = 105
            Height = 13
            Caption = 'Necessidade Final'
          end
          object edDataEmisIni: TCMDateTimePicker
            Left = 24
            Top = 40
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
          object EdDataNecIni: TCMDateTimePicker
            Left = 24
            Top = 80
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
            TabOrder = 2
          end
          object edDataEmisFim: TCMDateTimePicker
            Left = 168
            Top = 40
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
          object EdDataNecFim: TCMDateTimePicker
            Left = 168
            Top = 80
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
            TabOrder = 3
          end
        end
        object RgStatus: TRadioGroup
          Left = 16
          Top = 80
          Width = 209
          Height = 81
          Caption = ' Status '
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Pendentes'
            'Atendidas Total'
            'Atendidas Parcial')
          TabOrder = 1
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 592
          Height = 25
          Align = alTop
          BevelInner = bvLowered
          BevelOuter = bvNone
          Caption = 'Opções de Seleção'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object dblcAlmox: TwwDBLookupCombo
          Left = 16
          Top = 232
          Width = 209
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCALMOX'#9'40'#9'Nome'
            'CODALMOXARIFADO'#9'10'#9'Código')
          LookupTable = cdsAlmox
          LookupField = 'CODALMOXARIFADO'
          Options = [loTitles]
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcGrpProd: TwwDBLookupCombo
          Left = 16
          Top = 272
          Width = 209
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCGRUPOPROD'#9'30'#9'Nome'
            'CODGRUPOPROD'#9'10'#9'Código')
          LookupTable = cdsGrupoProd
          LookupField = 'CODGRUPOPROD'
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcDesc: TwwDBLookupCombo
          Left = 16
          Top = 184
          Width = 209
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Descrição'
            'CODARTIGO'#9'14'#9'Código')
          DataField = 'CODARTIGO'
          LookupTable = cdsArtigo
          LookupField = 'CODARTIGO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcUsu: TwwDBLookupCombo
          Left = 248
          Top = 184
          Width = 313
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
          LookupTable = cdsUsu
          LookupField = 'IDUSUARIO'
          Options = [loTitles]
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object cboPlano: TwwDBLookupCombo
          Left = 248
          Top = 232
          Width = 313
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCPLANCENTCUST'#9'60'#9'Nome'#9'F')
          LookupTable = cdsPlanCentCusto
          LookupField = 'IDPLANCENTCUST'
          Options = [loTitles]
          TabOrder = 7
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = cboPlanoChange
        end
      end
      object TbResult: TTabSheet
        Caption = 'Resultado'
        object Splitter1: TSplitter
          Left = 0
          Top = 169
          Width = 592
          Height = 8
          Cursor = crVSplit
          Align = alTop
        end
        object plnReq: TPanel
          Left = 0
          Top = 0
          Width = 592
          Height = 169
          Align = alTop
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 0
          object plnlbReq: TPanel
            Left = 0
            Top = 0
            Width = 33
            Height = 165
            Align = alLeft
            BevelInner = bvLowered
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -21
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object fcLabel1: TfcLabel
              Left = 2
              Top = 2
              Width = 29
              Height = 161
              Align = alClient
              Caption = 'Solicitações'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object GrdSCI: TwwDBGrid
            Left = 33
            Top = 0
            Width = 555
            Height = 165
            Selected.Strings = (
              'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I.'#9'F'
              'DESTINO'#9'30'#9'Destino'#9'F'
              'DATAEMISSAO'#9'10'#9'Data~Emissão'#9'F'
              'DATAENTREGA'#9'18'#9'Data~Necessidade'#9'F'
              'NOMEUSUARIO'#9'20'#9'Usuário'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSCI
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object plnItem: TPanel
          Left = 0
          Top = 177
          Width = 592
          Height = 153
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          object plnLbItem: TPanel
            Left = 0
            Top = 0
            Width = 33
            Height = 149
            Align = alLeft
            BevelInner = bvLowered
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -21
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object fcLabel2: TfcLabel
              Left = 2
              Top = 2
              Width = 29
              Height = 145
              Align = alClient
              Caption = 'Itens'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TextOptions.Alignment = taLeftJustify
              TextOptions.Rotation = 90
              TextOptions.VAlignment = vaTop
            end
          end
          object GrdItem: TwwDBGrid
            Left = 33
            Top = 0
            Width = 555
            Height = 149
            Hint = 'Botão da direita para  Visualização dos andamentos'
            ControlType.Strings = (
              'OBSITEMSOLIC;RichEdit;')
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Código'#9'F'
              'DESCRICAO'#9'35'#9'Descrição'#9'F'
              'CODMEDIDA'#9'4'#9'Unidade~Media'#9'F'
              'QTDEPEDIDA'#9'10'#9'Quantidade~Pedida'#9'F'
              'QTDEPENDENTE'#9'10'#9'Quantidade~Pendente'#9'F'
              'VALORUN'#9'10'#9'Valor~Unitário'#9'F'
              'STATUS'#9'15'#9'Status'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsItens
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentShowHint = False
            PopupMenu = PopupMenu1
            ShowHint = True
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            UseTFields = False
            OnDblClick = GrdItemDblClick
            IndicatorColor = icBlack
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 602
    inherited tb97Fundo: TToolbar97
      Left = 255
      DockPos = 517
      inherited sep1: TToolbarSep97
        Left = 177
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 95
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 260
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 179
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 262
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = 'S&elecionar'
        TabOrder = 2
        OnClick = BtnSelClick
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
      object btnLimpar: TBitBtn
        Left = 97
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Limpar'
        TabOrder = 3
        OnClick = btnLimparClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777087777
          777777000000777770D0877777777700000077770DD508777777770000007770
          DD805087777777000000770DD8DD050877777700000070DD8DDDD05087777700
          000070D8DDDDDD05087777000000708DDDDDDDD0608777000000770DDDDDDDDD
          0608770000007770DDDDDDD8E0608700000077770DDDDD8E6E06070000007777
          70DDD8E6E6E0070000007777770D8E6E6E6E0700000077777770E6E6E6E07700
          0000777777770E6E6E07770000007777777770E6E0777700000077777777770E
          077777000000777777777770777777000000}
      end
    end
  end
  object twView: TToolWindow97 [2]
    Left = 17
    Top = 336
    Caption = 'Visualização da Ordem de Compra'
    ClientAreaHeight = 169
    ClientAreaWidth = 504
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object GrdReceb: TwwDBGrid
      Left = 0
      Top = 25
      Width = 504
      Height = 103
      Selected.Strings = (
        'NUMNF'#9'10'#9'Nº da Nota'#9'F'
        'RAZAOSOCIAL'#9'45'#9'Fornecedor'#9'F'
        'DATAENTDEVOL'#9'10'#9'Data~Emissão'#9'F'
        'QTDE'#9'10'#9'Qtde'#9'F'
        'VLRUNITARIO'#9'10'#9'Valor~Unitário'#9'F'
        'DESTINO'#9'10'#9'Destino'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsReceb
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 3
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object GrdItemOC: TwwDBGrid
      Left = 0
      Top = 25
      Width = 504
      Height = 103
      Selected.Strings = (
        'NUMOC'#9'10'#9'Nº O.C.'#9'F'
        'QTDEPEDIDA'#9'10'#9'Qtde.~Pedida'#9'F'
        'CODMEDIDA'#9'4'#9'Unid.'#9'F'
        'QTDERECEBIDA'#9'10'#9'Qtde.~Recebida'#9'F'
        'VALORUN'#9'10'#9'Valor~Unitário'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsItemOC
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 0
      Top = 128
      Width = 504
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 220
        Top = 6
        Width = 81
        Height = 29
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkOK
      end
    end
    object plnTitulo: TPanel
      Left = 0
      Top = 0
      Width = 504
      Height = 25
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = ' Requisição : 421  Artigo : Extratato de Sapona '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object TbOservacao: TToolWindow97 [3]
    Left = 192
    Top = 344
    Caption = 'Observação'
    ClientAreaHeight = 161
    ClientAreaWidth = 441
    TabOrder = 3
    Visible = False
    object Panel3: TPanel
      Left = 0
      Top = 120
      Width = 441
      Height = 41
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object btnFecha: TBitBtn
        Left = 184
        Top = 6
        Width = 81
        Height = 29
        TabOrder = 0
        OnClick = btnFechaClick
        Kind = bkOK
      end
    end
    object wwDBRichEdit1: TwwDBRichEdit
      Left = 0
      Top = 0
      Width = 441
      Height = 120
      Align = alClient
      AutoURLDetect = False
      DataField = 'OBSITEMSOLIC'
      DataSource = dsItens
      PrintJobName = 'Delphi 5'
      TabOrder = 1
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 313
    Top = 45
  end
  object cdsUsu: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 369
    Top = 45
  end
  object cdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 45
  end
  object cdsAlmox: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 481
    Top = 45
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 545
    Top = 45
  end
  object cdsSCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 161
    Top = 37
  end
  object dsSCI: TwwDataSource
    AutoEdit = False
    DataSet = cdsSCI
    OnDataChange = dsSCIDataChange
    Left = 224
    Top = 40
  end
  object cdsItem: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 269
    Data = {
      250300009619E0BD01000000180000001A00000000000300000025030C4E554D
      534F4C434F4D50524108000400000000000A49444954454D534F4C4908000400
      0000000009434F4441525449474F010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000E000A494450524F
      4358415254080004000000000009434F444D4544494441010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0004000B434F4450524F434553534F08000400000000000E4944434F4E545241
      544F50524F4408000400000000000A494450524F445641524908000400000000
      000A5154444550454449444108000400000000000D53414C444F41434F4D5052
      415208000400000000000C5154444550454E44454E544508000400000000000C
      534F4C4943494143454954410100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000B4944434F4D5052
      41444F5208000400000000000C4F42534954454D534F4C494301004900000001
      0005574944544802000200C8000944455343524943414F010049000000010005
      5749445448020002003C000B434F444D4544435553544F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0004000C434F44475255504F50524F4401004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002000A000A434F44
      50524F4455544F01004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000600054641544F5208000400000000
      00074641544F525F3108000400000000000756414C4F52554E08000400000000
      000A56414C4F52544F54414C0800040000000000065354415455530100490000
      000100055749445448020002000E00074944464F524E45080004000000000009
      56414C4F52554E5F310800040000000000085052415A4F504147080004000000
      000002000D44454641554C545F4F5244455202008200010000000F00044C4349
      440400010009080000}
  end
  object dsItens: TwwDataSource
    AutoEdit = False
    DataSet = cdsItem
    Left = 344
    Top = 264
  end
  object cdsItemOC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 269
  end
  object dsItemOC: TwwDataSource
    AutoEdit = False
    DataSet = cdsItemOC
    Left = 432
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    Left = 155
    Top = 288
    object VisualizarOC1: TMenuItem
      Caption = 'Visualizar O.C.'
      OnClick = VisualizarOC1Click
    end
    object VisualizarRecebimento1: TMenuItem
      Caption = 'Visualizar Recebimento'
      OnClick = VisualizarRecebimento1Click
    end
  end
  object dsReceb: TwwDataSource
    AutoEdit = False
    DataSet = cdsReceb
    Left = 504
    Top = 216
  end
  object cdsReceb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 269
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '     I.NUMSOLCOMPRA,'
      '     I.IDITEMSOLI,'
      '     I.CODARTIGO,'
      '     I.IDPROCXART,'
      '     I.CODMEDIDA,'
      '     I.CODPROCESSO,'
      '     I.IDCONTRATOPROD,'
      '     I.IDPRODVARI,'
      '     I.QTDEPEDIDA,'
      '     I.SALDOACOMPRAR,'
      '     I.QTDEPENDENTE,'
      '     I.SOLICIACEITA,'
      '     I.IDCOMPRADOR,'
      '     I.OBSITEMSOLIC,'
      
        '     SUBSTR(DECODE(PV.IDPRODVARI,NULL,( P.DESCPROD  || '#39' '#39' || A.' +
        'CODCOR || '#39' '#39' ||  A.CODTAMANHO ),PV.DESCPRODVARI),1,60) AS DESCR' +
        'ICAO,'
      '     P.CODMEDCUSTO,'
      '     P.CODGRUPOPROD,'
      '     P.CODPRODUTO,'
      '     CO.FATOR,'
      '     CF.FATOR,'
      '     (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN,'
      
        '     (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * I.QTDEPEDIDA AS VALORTOT' +
        'AL,'
      
        '      DECODE(I.QTDEPENDENTE,0,'#39'ATEND. TOTAL'#39', DECODE(I.QTDEPEDID' +
        'A - I.QTDEPENDENTE,0,'#39'NÃO ATENDIDA'#39','#39'ATEND. PARCIAL'#39') )  AS  STA' +
        'TUS,'
      '     (-1) AS IDFORNE,'
      '     (0)  AS VALORUN,'
      '     (0)  AS PRAZOPAG'
      ' FROM'
      '     ITEMSOLI I,'
      '     ARTIGO A,'
      '     PRODUTO P,'
      '     CUSTOMED C,'
      '     CONVER CO,'
      '     CONVER CF,'
      '     PRODVARI PV'
      ' WHERE  (I.NUMSOLCOMPRA   = -1)'
      '    AND (I.CODARTIGO      = A.CODARTIGO)'
      '    AND (A.CODPRODUTO     = P.CODPRODUTO)'
      '    AND (C.CODARTIGO(+)   = A.CODARTIGO)'
      '    AND (C.CODCUSTEIO(+)  = -1)'
      '    AND (CO.CODPRODUTO    = P.CODPRODUTO)'
      '    AND (CO.CODMEDIDA     = P.CODMEDCUSTO)'
      '    AND (CF.CODPRODUTO    = P.CODPRODUTO)'
      '    AND (CF.CODMEDIDA     = I.CODMEDIDA)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      ' ORDER BY DESCRICAO')
    ClientDataSet = cdsItem
    Left = 107
    Top = 264
  end
  object cdsPlanCentCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 5
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '      IDPLANCENTCUST,'
      '      DESCPLANCENTCUST,'
      '      IDPLANOANTERIOR,'
      '      DATAINI,'
      '      DATAFIM,'
      '      MASCARA'
      '   FROM'
      '      PLANCENTCUST'
      '   ORDER BY'
      '      DESCPLANCENTCUST')
    ClientDataSet = cdsPlanCentCusto
    Left = 93
    Top = 9
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 45
    Top = 69
  end
end
