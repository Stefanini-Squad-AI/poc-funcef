inherited frmParamGRCS: TfrmParamGRCS
  Left = 195
  Top = 62
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'GRCS - Guia de Recolhimento da Contribuição Sindical'
  ClientHeight = 499
  ClientWidth = 496
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 460
    BorderWidth = 2
    object gbxTipoPapel: TGroupBox
      Left = 9
      Top = 406
      Width = 211
      Height = 45
      Caption = 'Tipo de Papel'
      TabOrder = 4
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 15
        Width = 195
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gbxDataProcess: TGroupBox
      Left = 9
      Top = 49
      Width = 478
      Height = 70
      Caption = 'Datas de Processamento'
      TabOrder = 1
      object Label1: TLabel
        Left = 19
        Top = 44
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pagto. Limite'
      end
      object Label2: TLabel
        Left = 273
        Top = 44
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pagamento'
      end
      object Label3: TLabel
        Left = 271
        Top = 20
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vencimento'
      end
      object Label4: TLabel
        Left = 28
        Top = 20
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Referência'
      end
      object dtPagtoLimite: TCMDateTimePicker
        Left = 86
        Top = 40
        Width = 113
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
        ParentShowHint = False
        ShowHint = False
        ShowButton = True
        TabOrder = 3
        OnChange = speAnoChange
      end
      object dtPagamento: TCMDateTimePicker
        Left = 333
        Top = 40
        Width = 113
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
        ParentShowHint = False
        ShowHint = False
        ShowButton = True
        TabOrder = 4
        OnChange = speAnoChange
      end
      object dtVencimento: TCMDateTimePicker
        Left = 333
        Top = 16
        Width = 113
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
        ParentShowHint = False
        ShowHint = False
        ShowButton = True
        TabOrder = 2
        OnChange = speAnoChange
      end
      object cmbMes: TComboBox
        Left = 86
        Top = 16
        Width = 88
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
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
      object speAno: TSpinEdit
        Left = 180
        Top = 16
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 0
        OnChange = speAnoChange
      end
    end
    object gbxOpCalculo: TGroupBox
      Left = 9
      Top = 120
      Width = 478
      Height = 111
      Caption = 'Opções de Cálculo'
      TabOrder = 2
      object chkbxCorrecao: TCheckBox
        Left = 9
        Top = 23
        Width = 152
        Height = 17
        Caption = 'Calcula Correção Monetária'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = chkbxCorrecaoClick
      end
      object cbJuros: TCheckBox
        Left = 9
        Top = 50
        Width = 88
        Height = 17
        Caption = 'Calcula Juros'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = cbJurosClick
      end
      object cbMulta: TCheckBox
        Left = 9
        Top = 75
        Width = 88
        Height = 17
        Caption = 'Calcula Multa'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = cbMultaClick
      end
      object pnlJuros: TPanel
        Left = 189
        Top = 48
        Width = 257
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        Visible = False
        object rbPercentJuros: TRadioButton
          Left = 112
          Top = 5
          Width = 30
          Height = 17
          Caption = '%'
          Checked = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          TabStop = True
        end
        object rbValorJuros: TRadioButton
          Left = 176
          Top = 5
          Width = 47
          Height = 16
          Caption = 'Valor'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object redJuros: TRealEdit
          Left = 6
          Top = 3
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Ctl3D = True
          Lines.Strings = (
            '      0,00')
          ParentCtl3D = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object pnlMulta: TPanel
        Left = 189
        Top = 75
        Width = 257
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        Visible = False
        object rbValorMulta: TRadioButton
          Left = 176
          Top = 5
          Width = 47
          Height = 16
          Caption = 'Valor'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object rbPercentMulta: TRadioButton
          Left = 112
          Top = 5
          Width = 30
          Height = 17
          Caption = '%'
          Checked = True
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          TabStop = True
        end
        object redMulta: TRealEdit
          Left = 6
          Top = 3
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Ctl3D = True
          Lines.Strings = (
            '      0,00')
          ParentCtl3D = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object pnlCorrecao: TPanel
        Left = 189
        Top = 15
        Width = 257
        Height = 33
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
        object dblkpCorrecao: TwwDBLookupCombo
          Left = 6
          Top = 6
          Width = 245
          Height = 21
          Ctl3D = True
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOESIGLA'#9'10'#9'Sigla'
            'MOEDESC'#9'20'#9'Indexador')
          LookupTable = qryIndexador
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
    object gbxSindicato: TGroupBox
      Left = 9
      Top = 4
      Width = 478
      Height = 44
      Caption = 'Sindicato'
      TabOrder = 0
      object dblkcbSindicato: TwwDBLookupCombo
        Left = 8
        Top = 14
        Width = 461
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qrySindicatos
        LookupField = 'IDPESSOA'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkcbSindicatoChange
      end
    end
    object gbxRubricas: TGroupBox
      Left = 9
      Top = 232
      Width = 478
      Height = 173
      Caption = 'Rubrica(s) que Compõe(m)'
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 129
        Width = 100
        Height = 13
        Caption = 'Procura por Rubricas'
      end
      object Paginas: TPageControl
        Left = 6
        Top = 15
        Width = 466
        Height = 109
        ActivePage = tbshRubRem
        HotTrack = True
        TabOrder = 0
        OnChange = PaginasChange
        object tbshRubRem: TTabSheet
          Caption = 'Remuneração'
          object chklstRubrica1: TCheckListBox
            Left = 1
            Top = 2
            Width = 318
            Height = 76
            OnClickCheck = chklstRubrica1ClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubrica1DrawItem
            OnKeyDown = chklstRubrica1KeyDown
          end
        end
        object tbshRubContrib: TTabSheet
          Caption = 'Contribuição'
          object chklstRubrica2: TCheckListBox
            Left = 1
            Top = 2
            Width = 318
            Height = 76
            OnClickCheck = chklstRubrica1ClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubrica1DrawItem
            OnKeyDown = chklstRubrica1KeyDown
          end
        end
      end
      object edCodRubricas: TEdit
        Left = 8
        Top = 143
        Width = 352
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a Procurar separdos por vírgul' +
          'a'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object sbtnMarcarRub: TBitBtn
        Left = 366
        Top = 139
        Width = 103
        Height = 28
        Caption = '   &Marcar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = sbtnMarcarRubClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
          F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
          FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
          788877F77FF878F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnSelTodos: TBitBtn
        Left = 334
        Top = 41
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInverteSel: TBitBtn
        Left = 334
        Top = 68
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 460
    Width = 496
    inherited tb97Fundo: TToolbar97
      Left = 248
      DockPos = 326
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 395
    Top = 410
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrySindicatos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      
        '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SINDICATO S, FILI' +
        'ALPESSOA FP'
      'WHERE'
      '  (FP.IDFILIALPESSOA = F.IDESTAB)         AND'
      '  (F.IDPESSOA        = PEFIS.IDPESSOA)    AND'
      '  (S.IDPESSOA        = PEFIS.IDSINDICATO) AND'
      '  (S.IDPESSOA        = P.IDPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 103
    Top = 282
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RP.CODPROVDESC, RP.DESCRPROVDESC'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA    = :IDEMPRESA) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO  = RP.IDRUBRICA)'
      'ORDER BY'
      '  UPPER(DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 164
    Top = 282
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryTestaIndexador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DECODE(COTVALOR,NULL,0,COTVALOR) AS VALOR'
      'FROM'
      '  COTACAOMOEDA '
      'WHERE'
      '  (COTDATA   = :DATA) AND'
      '  (MOECODIGO = :MOECODIGO)')
    ValidateWithMask = True
    Left = 317
    Top = 410
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end>
  end
  object qryIndexador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO, MOESIGLA, UPPER(MOEDESC) AS MOEDESC,'
      '  MOEPERIODICIDADE, FATORCONVERSAO, MOEDAREFERENCIA,'
      '  DATAINICIO, DATAFIM, FLGPERCVALOR'
      'FROM'
      '  MOEDA'
      'ORDER BY'
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 225
    Top = 282
  end
end
