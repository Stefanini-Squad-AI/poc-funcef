inherited frmRegAvalAlunos: TfrmRegAvalAlunos
  Left = 45
  Top = 101
  Caption = 'Registro das Avaliações dos Participantes em um Treinamento'
  ClientHeight = 453
  ClientWidth = 722
  Constraints.MinHeight = 480
  Constraints.MinWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 722
    Height = 414
    BorderWidth = 2
    object pnlParticipantes: TPanel
      Left = 4
      Top = 186
      Width = 714
      Height = 224
      Align = alClient
      TabOrder = 1
      object pnlPessoasInscritas: TPanel
        Left = 1
        Top = 1
        Width = 712
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Pessoas Inscritas'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbrgAvaliacoes: TwwDBGrid
        Left = 1
        Top = 29
        Width = 712
        Height = 194
        Selected.Strings = (
          'NOME'#9'66'#9'Nome do Participante'
          'AVALTEOR'#9'14'#9'Avaliação Teórica'
          'AVALPRAT'#9'14'#9'Avaliação Prática')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsFunc
        TabOrder = 1
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
    end
    object pnlGridEscolha: TPanel
      Left = 4
      Top = 186
      Width = 714
      Height = 224
      Align = alClient
      TabOrder = 2
      object pnlBotoes: TPanel
        Left = 648
        Top = 1
        Width = 65
        Height = 222
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bbtnApanha: TBitBtn
          Left = 8
          Top = 88
          Width = 50
          Height = 45
          Hint = 'Apanhar o Evento Selecionado deste Curso'
          Caption = '&Apanha'
          Default = True
          Enabled = False
          ModalResult = 1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnApanhaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333FF3333333333333003333
            3333333333773FF3333333333309003333333333337F773FF333333333099900
            33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
            99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
            33333333337F3F77333333333309003333333333337F77333333333333003333
            3333333333773333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          Layout = blGlyphTop
          NumGlyphs = 2
          Spacing = 2
        end
      end
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 647
        Height = 222
        Selected.Strings = (
          'DATPLINI'#9'10'#9'Data Plan. Início'
          'DATPLFIM'#9'10'#9'Data Plan. Final'
          'DATREINI'#9'10'#9'Data Real Início'
          'DATREFIM'#9'10'#9'Data Real Final'
          'NOME'#9'60'#9'Entidade ou Instrutor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsHsttrn
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
    end
    object pnlIdent: TPanel
      Left = 4
      Top = 4
      Width = 714
      Height = 182
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 161
        Width = 117
        Height = 13
        Caption = 'Local e/ou Diretivas'
      end
      object gbxCurso: TGroupBox
        Left = 6
        Top = 3
        Width = 325
        Height = 152
        Caption = 'Curso'
        TabOrder = 0
        object Label3: TLabel
          Left = 9
          Top = 38
          Width = 158
          Height = 13
          Caption = 'Empresa/Entidade/Instrutor'
        end
        object Label1: TLabel
          Left = 12
          Top = 74
          Width = 174
          Height = 13
          Caption = 'Instrutor da Empresa/Entidade'
        end
        object dblcCurso: TwwDBLookupCombo
          Left = 12
          Top = 14
          Width = 300
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO')
          LookupTable = tblCurso
          LookupField = 'IDCURSO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = True
          OnCloseUp = dblcCursoCloseUp
        end
        object dblcEntid: TwwDBLookupCombo
          Left = 12
          Top = 51
          Width = 300
          Height = 21
          TabStop = False
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME')
          LookupTable = qryEntid
          LookupField = 'IDPESSOA'
          ReadOnly = True
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = True
        end
        object rgControle: TRadioGroup
          Left = 10
          Top = 109
          Width = 150
          Height = 35
          Caption = 'É Parte dos Controles ?'
          Columns = 2
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object dblcInstrutor: TwwDBLookupCombo
          Left = 12
          Top = 87
          Width = 300
          Height = 21
          TabStop = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          LookupTable = qryInstrutor
          LookupField = 'IDPESSOA'
          ReadOnly = True
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
          AllowClearKey = True
        end
        object rgAvalCurs: TRadioGroup
          Left = 165
          Top = 109
          Width = 150
          Height = 35
          Caption = 'Avaliação do Curso ?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 4
        end
      end
      object gbxDatas: TGroupBox
        Left = 340
        Top = 3
        Width = 115
        Height = 152
        Caption = 'Datas'
        TabOrder = 1
        object Label6: TLabel
          Left = 8
          Top = 11
          Width = 94
          Height = 13
          Caption = 'Início Planejado'
        end
        object Label7: TLabel
          Left = 8
          Top = 44
          Width = 88
          Height = 13
          Caption = 'Final Planejado'
        end
        object Label8: TLabel
          Left = 8
          Top = 77
          Width = 78
          Height = 13
          Caption = 'Início Efetivo'
        end
        object Label9: TLabel
          Left = 8
          Top = 110
          Width = 72
          Height = 13
          Caption = 'Final Efetivo'
        end
        object dtedIniPlan: TCMDateTimePicker
          Left = 8
          Top = 23
          Width = 100
          Height = 21
          TabStop = False
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 0
        end
        object dtedFimPlan: TCMDateTimePicker
          Left = 8
          Top = 56
          Width = 100
          Height = 21
          TabStop = False
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 1
        end
        object dtedIniReal: TCMDateTimePicker
          Left = 8
          Top = 89
          Width = 100
          Height = 21
          TabStop = False
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 2
        end
        object dtedFimReal: TCMDateTimePicker
          Left = 8
          Top = 125
          Width = 100
          Height = 21
          TabStop = False
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 3
        end
      end
      object gbxCarga: TGroupBox
        Left = 465
        Top = 3
        Width = 102
        Height = 152
        Caption = 'Carga Horária'
        TabOrder = 2
        object Label11: TLabel
          Left = 9
          Top = 17
          Width = 37
          Height = 13
          Caption = 'Teoria'
        end
        object Label12: TLabel
          Left = 9
          Top = 62
          Width = 41
          Height = 13
          Caption = 'Prática'
        end
        object Label13: TLabel
          Left = 9
          Top = 110
          Width = 30
          Height = 13
          Caption = 'Total'
        end
        object redTeoria: TRealEdit
          Left = 9
          Top = 30
          Width = 80
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redPratica: TRealEdit
          Left = 9
          Top = 75
          Width = 80
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redTotal: TRealEdit
          Left = 10
          Top = 123
          Width = 80
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object gbxDespesas: TGroupBox
        Left = 576
        Top = 3
        Width = 117
        Height = 152
        Caption = 'Despesas'
        TabOrder = 3
        object Label14: TLabel
          Left = 9
          Top = 12
          Width = 33
          Height = 13
          Caption = 'Curso'
        end
        object Label15: TLabel
          Left = 9
          Top = 46
          Width = 42
          Height = 13
          Caption = 'Viagem'
        end
        object Label16: TLabel
          Left = 9
          Top = 78
          Width = 74
          Height = 13
          Caption = 'Hospedagem'
        end
        object Label17: TLabel
          Left = 9
          Top = 112
          Width = 38
          Height = 13
          Caption = 'Outras'
        end
        object redValCurso: TRealEdit
          Left = 9
          Top = 25
          Width = 100
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redValViagem: TRealEdit
          Left = 9
          Top = 58
          Width = 100
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redValHosp: TRealEdit
          Left = 9
          Top = 91
          Width = 100
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redValOutras: TRealEdit
          Left = 9
          Top = 125
          Width = 100
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object edLocalCurso: TEdit
        Left = 125
        Top = 157
        Width = 567
        Height = 21
        TabOrder = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 722
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 560
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 385
      DockPos = 393
      inherited bbtnConfirmar: TBitBtn
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object tblCurso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from CURSO '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 238
    Top = 19
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, FUNCIONARIO F'
      'where P.IDPESSOA = F.IDPESSOA '
      'Union'
      'Select P.IDPESSOA, upper(P.NOME) as NOME '
      'from PESSOA P, TERCEIRO T'
      'where P.IDPESSOA = T.IDPESSOA'
      'Order By 2')
    ValidateWithMask = True
    Left = 228
    Top = 68
  end
  object qryFunc: TwwQuery
    CachedUpdates = True
    BeforePost = qryFuncBeforePost
    AfterScroll = qryFuncAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  UPPER(P.NOME) AS UPNOME, P.IDPESSOA, P.NOME, H.NUMSEQ,'
      '  H.AVALTEOR, H.AVALPRAT, H.IDCURSO,'
      '  H.FLGAVALTEOR, H.FLGAVALPRAT '
      'FROM   PESSOA P, HSTTRN H'
      'WHERE'
      '  H.IDPESSOA = -1 AND'
      '  H.IDPESSOA = P.IDPESSOA')
    UpdateObject = updFunc
    ValidateWithMask = True
    Left = 296
    Top = 203
  end
  object qryHsttrn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT H.DATREINI, H.DATREFIM, H.DATPLINI,'
      '   H.DATPLFIM, H.FLGCONTROLE, H.IDENTIDINSTR, P.NOME, '
      '   I.NOME AS INSTRUTOR, H.IDINSTRUTOR, H.LOCALCURSO,'
      '   H.FLGAVALCURS'
      'FROM PESSOA P, PESSOA I, HSTTRN H'
      'WHERE H.DATREINI IS NOT NULL'
      'AND       H.DATREFIM IS NOT NULL'
      '-- AND      (H.FLGAVALTEOR = 1 OR H.FLGAVALPRAT = 1)'
      'AND       H.IDCURSO = :IDCURSO'
      'AND       H.IDENTIDINSTR = P.IDPESSOA(+)'
      'AND       H.IDINSTRUTOR  = I.IDPESSOA(+)'
      'ORDER BY  H.DATREINI DESC, H.DATPLINI DESC')
    ValidateWithMask = True
    Left = 392
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURSO'
        ParamType = ptUnknown
      end>
  end
  object dsHsttrn: TwwDataSource
    DataSet = qryHsttrn
    Left = 293
    Top = 126
  end
  object qryInstrutor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, UPPER(P.NOME) AS NOME'
      'FROM'
      '  PESSOA P, TERCEIRO T'
      'WHERE'
      '  (T.IDPESSOA = P.IDPESSOA)  AND'
      '  (P.TIPO          = '#39'F'#39') '
      'ORDER BY'
      '  2')
    ValidateWithMask = True
    Left = 130
    Top = 122
  end
  object dsFunc: TwwDataSource
    AutoEdit = False
    DataSet = qryFunc
    Left = 126
    Top = 197
  end
  object updFunc: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTTRN'
      'set'
      '  AVALTEOR = :AVALTEOR,'
      '  AVALPRAT = :AVALPRAT,'
      '  FLGAVALTEOR = :FLGAVALTEOR,'
      '  FLGAVALPRAT = :FLGAVALPRAT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  IDCURSO = :OLD_IDCURSO')
    InsertSQL.Strings = (
      '')
    Left = 194
    Top = 197
  end
end
