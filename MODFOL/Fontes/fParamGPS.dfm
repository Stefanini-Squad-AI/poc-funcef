inherited frmGPS: TfrmGPS
  Left = 58
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'GPS - Guia da Previdência Social'
  ClientHeight = 400
  ClientWidth = 668
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 668
    Height = 361
    BorderWidth = 2
    object dbgrdHstGPS: TwwDBGrid
      Left = 4
      Top = 4
      Width = 660
      Height = 353
      Selected.Strings = (
        'DATAFIMGRPS'#9'12'#9'Pagamento'
        'DATAVENCGRPS'#9'12'#9'Vencimento'
        'SALARMATERNIDADE'#9'14'#9'Sal. Maternidade'
        'SALARIOFAMILIA'#9'10'#9'Sal. Família'
        'AUXILIONATALIDADE'#9'14'#9'Aux. Natalidade'
        'AUXILIODOENCA'#9'12'#9'Aux. Doença'
        'SEGACIDTRABALHO'#9'7'#9'SAT'
        'TOTAL'#9'13'#9'Total')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsHstGPS
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      Visible = False
      IndicatorColor = icBlack
    end
    object gbxTipoInformacao: TGroupBox
      Left = 12
      Top = 11
      Width = 138
      Height = 42
      Caption = 'Tipo de Informação'
      TabOrder = 1
      object cmbxTipoInformacao: TComboBox
        Left = 9
        Top = 15
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Items.Strings = (
          'CGC / CNPJ'
          'RPA'
          'CEI')
      end
    end
    object gbxCodPagamento: TGroupBox
      Left = 156
      Top = 11
      Width = 138
      Height = 42
      Caption = 'Código de Pagamento'
      TabOrder = 2
      object edCodPagamento: TEdit
        Left = 9
        Top = 14
        Width = 119
        Height = 21
        TabOrder = 0
        OnChange = edCodPagamentoChange
      end
    end
    object rgTipImpressao: TRadioGroup
      Left = 300
      Top = 11
      Width = 139
      Height = 42
      Caption = 'Tipo de Impressão'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&Espelho'
        '&Imagem')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    object gbxAnoMesRef: TGroupBox
      Left = 445
      Top = 11
      Width = 212
      Height = 42
      Caption = 'Mês e Ano de Referência'
      TabOrder = 4
      object cmbMes: TComboBox
        Left = 12
        Top = 14
        Width = 114
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
        Left = 138
        Top = 14
        Width = 61
        Height = 22
        MaxValue = 0
        MinValue = 0
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 0
        OnChange = edCodPagamentoChange
      end
    end
    object gbxDatasProcess: TGroupBox
      Left = 12
      Top = 54
      Width = 306
      Height = 42
      Caption = 'Datas de Processamento'
      TabOrder = 5
      object Label1: TLabel
        Left = 9
        Top = 18
        Width = 56
        Height = 13
        Caption = 'Vencimento'
      end
      object Label2: TLabel
        Left = 159
        Top = 18
        Width = 54
        Height = 13
        Caption = 'Pagamento'
      end
      object dtPagamento: TCMDateTimePicker
        Left = 217
        Top = 14
        Width = 80
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
        TabOrder = 1
        OnChange = edCodPagamentoChange
      end
      object dtVencimento: TCMDateTimePicker
        Left = 69
        Top = 14
        Width = 80
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
        TabOrder = 0
        OnChange = edCodPagamentoChange
      end
    end
    object rgGera13: TRadioGroup
      Left = 324
      Top = 54
      Width = 115
      Height = 42
      Caption = 'GPS de 13º Salário?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
    end
    object gbxEstab: TGroupBox
      Left = 12
      Top = 97
      Width = 427
      Height = 45
      Caption = 'Estabelecimento'
      TabOrder = 7
      object dblkcbEstab: TwwDBLookupCombo
        Left = 9
        Top = 15
        Width = 409
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento'#9'No')
        LookupTable = qryEstab
        LookupField = 'CODIGO'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkcbEstabChange
      end
    end
    object gbxTipoPag: TGroupBox
      Left = 446
      Top = 54
      Width = 211
      Height = 88
      Caption = 'Tipo de Pagamento (nenhum para todos)'
      TabOrder = 8
      object chklstTipoFolha: TCheckListBox
        Left = 7
        Top = 14
        Width = 197
        Height = 68
        OnClickCheck = chklstTipoFolhaClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstTipoFolhaDrawItem
        OnKeyDown = chklstTipoFolhaKeyDown
      end
    end
    object gbxConfigProcess: TGroupBox
      Left = 12
      Top = 143
      Width = 456
      Height = 208
      Caption = 'Configurações para Processamento'
      TabOrder = 9
      object chkbxCorrecao: TCheckBox
        Left = 9
        Top = 23
        Width = 152
        Height = 17
        Hint = 'Opção para Cálculo Automático de Correção Monetária'
        Caption = 'Calcula Correção Monetária'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = chkbxCorrecaoClick
      end
      object cbJuros: TCheckBox
        Left = 9
        Top = 50
        Width = 88
        Height = 17
        Hint = 'Opção para Cálculo Automático de Juros'
        Caption = 'Calcula Juros'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = cbJurosClick
      end
      object cbMulta: TCheckBox
        Left = 9
        Top = 75
        Width = 88
        Height = 17
        Hint = 'Opção para Cálculo Automático de Multa'
        Caption = 'Calcula Multa'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = cbMultaClick
      end
      object pnlJuros: TPanel
        Left = 192
        Top = 48
        Width = 256
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
          Width = 35
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
          Width = 56
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
        Left = 192
        Top = 75
        Width = 256
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
          Width = 56
          Height = 16
          Caption = 'Valor'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
        object rbPercentMulta: TRadioButton
          Left = 112
          Top = 5
          Width = 37
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
        Left = 192
        Top = 15
        Width = 256
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
          Width = 243
          Height = 21
          Ctl3D = True
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOESIGLA'#9'10'#9'Sigla'
            'MOEDESC'#9'20'#9'Indexador')
          LookupTable = qryIndexador
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          Style = csDropDownList
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
    object gbxAdicGPS: TGroupBox
      Left = 14
      Top = 246
      Width = 452
      Height = 102
      Caption = 'Adicionais GPS (Linhas 6, 7 e 8)'
      TabOrder = 10
      object Label3: TLabel
        Left = 348
        Top = 76
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label4: TLabel
        Left = 348
        Top = 49
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label7: TLabel
        Left = 184
        Top = 49
        Width = 31
        Height = 13
        Caption = 'Descr.'
      end
      object Label8: TLabel
        Left = 184
        Top = 76
        Width = 31
        Height = 13
        Caption = 'Descr.'
      end
      object Label5: TLabel
        Left = 348
        Top = 23
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object pnlLinha7: TPanel
        Left = 5
        Top = 42
        Width = 171
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
        object rbTributosLinha7: TRadioButton
          Left = 2
          Top = 5
          Width = 58
          Height = 17
          Caption = 'Tributos'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbAbatimentoLinha7: TRadioButton
          Left = 75
          Top = 5
          Width = 78
          Height = 17
          Caption = 'Abatimentos'
          TabOrder = 1
        end
      end
      object pnlLinha8: TPanel
        Left = 5
        Top = 69
        Width = 171
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 5
        object rbTributosLinha8: TRadioButton
          Left = 2
          Top = 5
          Width = 58
          Height = 17
          Caption = 'Tributos'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbAbatimentoLinha8: TRadioButton
          Left = 75
          Top = 5
          Width = 78
          Height = 17
          Caption = 'Abatimentos'
          TabOrder = 1
        end
      end
      object dtDescricao7: TEdit
        Left = 221
        Top = 46
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 3
      end
      object dtDescricao8: TEdit
        Left = 221
        Top = 72
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 6
      end
      object edValAdicLinha8: TRealEdit
        Left = 380
        Top = 72
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edValAdicLinha7: TRealEdit
        Left = 380
        Top = 46
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object pnlLinha6: TPanel
        Left = 5
        Top = 15
        Width = 171
        Height = 27
        BevelInner = bvLowered
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object rbTributosLinha6: TRadioButton
          Left = 2
          Top = 7
          Width = 58
          Height = 13
          Caption = 'Tributos'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbAbatimentoLinha6: TRadioButton
          Left = 75
          Top = 7
          Width = 78
          Height = 13
          Caption = 'Abatimentos'
          TabOrder = 1
        end
      end
      object edValAdicLinha6: TRealEdit
        Left = 380
        Top = 20
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object gbxDadosRel: TGroupBox
      Left = 474
      Top = 143
      Width = 183
      Height = 71
      Caption = 'Dados do Relatório'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 11
      object chkbxAtualizacao: TCheckBox
        Left = 9
        Top = 16
        Width = 104
        Height = 17
        Caption = 'ATM/Juros/Multa'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkbxTotal: TCheckBox
        Left = 9
        Top = 41
        Width = 48
        Height = 17
        Caption = 'Total'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 1
      end
    end
    object rgNumVias: TRadioGroup
      Left = 474
      Top = 215
      Width = 183
      Height = 42
      Caption = 'Número de Vias a Imprimir'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Uma'
        'Duas')
      ParentFont = False
      TabOrder = 12
    end
    object rgProcesso: TRadioGroup
      Left = 474
      Top = 258
      Width = 183
      Height = 42
      Caption = 'Processo'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      ParentFont = False
      TabOrder = 13
    end
    object gbxTipoPapel: TGroupBox
      Left = 474
      Top = 301
      Width = 183
      Height = 49
      Caption = 'Tipo de Papel'
      TabOrder = 14
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 17
        Width = 167
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 361
    Width = 668
    inherited tb97Fundo: TToolbar97
      Left = 419
      DockPos = 419
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
        Enabled = False
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
    object bbtnHistorico: TBitBtn
      Left = 4
      Top = 2
      Width = 85
      Height = 33
      Caption = '&Histórico'
      TabOrder = 1
      OnClick = bbtnHistoricoClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000CE0E0000C40E00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777700000777770000070F000777770F00070F000777770F
        0007000000070000000700F000000F00000700F000700F00000700F000700F00
        00077000000000000077770F00070F0007777700000700000777777000777000
        77777770F07770F0777777700077700077777777777777777777}
    end
    object bbtnVoltar: TBitBtn
      Left = 91
      Top = 2
      Width = 85
      Height = 33
      Caption = '&Voltar'
      Enabled = False
      TabOrder = 2
      OnClick = bbtnVoltarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888444488
        8888888887777888888888884444444488888887777777788888888444888844
        4888887778888777888888844888888448888877888888778888884488888888
        4488877888888887788888448888888844888778888888877888884488888888
        4488877888888887788888448888888844888778888888877888888448888484
        4888887788887877888888844888844448888877888877778888888888888444
        8888888888887778888888888888844448888888888877778888888888888888
        8888888888888888888888888888888888888888888888888888}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 448
    Top = 353
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 320
    Top = 355
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryIndexador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  MOECODIGO,'
      '  MOESIGLA,'
      '  UPPER(MOEDESC) AS MOEDESC,'
      '  MOEPERIODICIDADE,'
      '  FATORCONVERSAO,'
      '  MOEDAREFERENCIA,'
      '  DATAINICIO,'
      '  DATAFIM,'
      '  FLGPERCVALOR'
      'FROM'
      '  MOEDA'
      'ORDER BY'
      '  MOESIGLA')
    ValidateWithMask = True
    Left = 377
    Top = 354
  end
  object qryTestaIndexador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(COTVALOR,NULL,0,COTVALOR) AS VALOR'
      '     FROM COTACAOMOEDA '
      '     WHERE (MOECODIGO = :MoeCodigo) AND '
      '                    (COTDATA      = :Data)')
    ValidateWithMask = True
    Left = 249
    Top = 355
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MoeCodigo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'Data'
        ParamType = ptUnknown
      end>
  end
  object dsHstGPS: TwwDataSource
    DataSet = qryHstGPS
    Left = 176
    Top = 355
  end
  object qryHstGPS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  GUIAGRPS'
      'ORDER BY'
      '  DATAFIMGRPS DESC')
    ValidateWithMask = True
    Left = 176
    Top = 341
    object qryHstGPSDATAFIMGRPS: TDateTimeField
      DisplayLabel = 'Pagamento'
      DisplayWidth = 12
      FieldName = 'DATAFIMGRPS'
      Origin = 'BASEDADOS.GUIAGRPS.DATAFIMGRPS'
    end
    object qryHstGPSDATAVENCGRPS: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCGRPS'
      Origin = 'BASEDADOS.GUIAGRPS.DATAVENCGRPS'
    end
    object qryHstGPSSALARMATERNIDADE: TFloatField
      DisplayLabel = 'Sal. Maternidade'
      DisplayWidth = 14
      FieldName = 'SALARMATERNIDADE'
      Origin = 'BASEDADOS.GUIAGRPS.SALARMATERNIDADE'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryHstGPSSALARIOFAMILIA: TFloatField
      DisplayLabel = 'Sal. Família'
      DisplayWidth = 10
      FieldName = 'SALARIOFAMILIA'
      Origin = 'BASEDADOS.GUIAGRPS.SALARIOFAMILIA'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryHstGPSAUXILIONATALIDADE: TFloatField
      DisplayLabel = 'Aux. Natalidade'
      DisplayWidth = 14
      FieldName = 'AUXILIONATALIDADE'
      Origin = 'BASEDADOS.GUIAGRPS.AUXILIONATALIDADE'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryHstGPSAUXILIODOENCA: TFloatField
      DisplayLabel = 'Aux. Doença'
      DisplayWidth = 12
      FieldName = 'AUXILIODOENCA'
      Origin = 'BASEDADOS.GUIAGRPS.AUXILIODOENCA'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryHstGPSSEGACIDTRABALHO: TFloatField
      DisplayLabel = 'SAT'
      DisplayWidth = 7
      FieldName = 'SEGACIDTRABALHO'
      Origin = 'BASEDADOS.GUIAGRPS.SEGACIDTRABALHO'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryHstGPSTOTAL: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 13
      FieldName = 'TOTAL'
      Origin = 'BASEDADOS.GUIAGRPS.TOTAL'
      DisplayFormat = '#,###,###,##0.00'
    end
  end
end
