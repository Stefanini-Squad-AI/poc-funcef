inherited frmLancDocCAPCAR: TfrmLancDocCAPCAR
  Left = 29
  Top = 54
  Caption = 'Manutenção de Documentos do Contas a Pagar'
  ClientHeight = 483
  ClientWidth = 733
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 733
    Height = 397
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 725
      Height = 161
      object lblValorMoeda: TLabel
        Left = 171
        Top = 50
        Width = 107
        Height = 13
        Caption = 'Valor Outra Moeda'
      end
      object lblValor: TLabel
        Left = 308
        Top = 50
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object lblHistorico: TLabel
        Left = 5
        Top = 123
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object lblMoeda: TLabel
        Left = 5
        Top = 50
        Width = 39
        Height = 13
        Caption = 'Moeda'
      end
      object lblPortadorForma: TLabel
        Left = 209
        Top = 87
        Width = 175
        Height = 13
        Caption = 'Contas/Caixas x Forma de Pag'
      end
      object lblNumDoc: TLabel
        Left = 268
        Top = 8
        Width = 130
        Height = 13
        Caption = 'Número do Documento'
      end
      object lblBarra: TLabel
        Left = 396
        Top = 26
        Width = 7
        Height = 13
        Caption = '/'
      end
      object lblTipoDocum: TLabel
        Left = 5
        Top = 87
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object lblNumChBordero: TLabel
        Left = 299
        Top = 123
        Width = 94
        Height = 13
        Caption = 'No. Ch./Borderô'
      end
      object Bevel1: TBevel
        Left = 263
        Top = 6
        Width = 171
        Height = 44
        Shape = bsFrame
      end
      object LblMesmaData: TLabel
        Left = 181
        Top = 123
        Width = 71
        Height = 13
        Caption = 'Mesma Data'
        Visible = False
      end
      object Label7: TLabel
        Left = 326
        Top = 50
        Width = 77
        Height = 13
        Caption = 'Valor Líquido'
        Visible = False
      end
      object DbeNoDocumento: TwwDBEdit
        Left = 268
        Top = 22
        Width = 129
        Height = 21
        DataField = 'NUMFATURA_1'
        DataSource = ds
        TabOrder = 13
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
        OnExit = DbeNoDocumentoExit
      end
      object dbenNumDoc: TDBRealEdit
        Left = 268
        Top = 22
        Width = 129
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '              0')
        TabOrder = 1
        Visible = False
        WordWrap = False
        IntDigits = 15
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NODOCUMENTO'
        DataSource = ds
      end
      object dbeValorMoeda: TRealEdit
        Left = 171
        Top = 65
        Width = 126
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        OnExit = dbeValorMoedaExit
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbeValorCorrente: TRealEdit
        Left = 308
        Top = 65
        Width = 126
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 6
        WordWrap = False
        OnChange = dbeValorCorrenteChange
        OnExit = dbeValorCorrenteExit
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbeHistorico: TwwDBEdit
        Left = 5
        Top = 137
        Width = 290
        Height = 21
        DataField = 'HISTORICOCOMPL'
        DataSource = ds
        TabOrder = 11
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcMoeda: TwwDBLookupCombo
        Left = 5
        Top = 65
        Width = 156
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'10'#9'MOESIGLA')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcMoedaExit
      end
      object gbDatas: TGroupBox
        Left = 438
        Top = 1
        Width = 278
        Height = 93
        Caption = ' Datas '
        TabOrder = 3
        object lblData: TLabel
          Left = 151
          Top = 13
          Width = 70
          Height = 13
          Caption = 'Lançamento'
        end
        object lblEmissao: TLabel
          Left = 17
          Top = 13
          Width = 47
          Height = 13
          Caption = 'Emissão'
        end
        object lblVencimento: TLabel
          Left = 17
          Top = 49
          Width = 67
          Height = 13
          Caption = 'Vencimento'
        end
        object lblProgramada: TLabel
          Left = 151
          Top = 49
          Width = 68
          Height = 13
          Caption = 'Programada'
        end
        object dbeDataLanc: TCMDateTimePicker
          Left = 151
          Top = 27
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATALANCTO'
          DataSource = ds
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
        object dbeDataEmi: TCMDateTimePicker
          Left = 17
          Top = 27
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAEMISSAO'
          DataSource = ds
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
          OnExit = dbeDataEmiExit
        end
        object dbeDataVenc: TCMDateTimePicker
          Left = 17
          Top = 63
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVENCTO'
          DataSource = ds
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
          OnExit = dbeDataVencExit
        end
        object dbeDataProgr: TCMDateTimePicker
          Left = 151
          Top = 63
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAPROGRAMADA'
          DataSource = ds
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
      object dblcPortadorForma: TwwDBLookupCombo
        Left = 209
        Top = 101
        Width = 188
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODPORTFORMA'
        DataSource = ds
        LookupTable = qryPortForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        DropDownWidth = 450
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object gbOutros: TGroupBox
        Left = 402
        Top = 94
        Width = 316
        Height = 67
        TabOrder = 10
        object cbEnglobParc: TCheckBox
          Left = 8
          Top = 8
          Width = 297
          Height = 17
          Caption = 'Este documento será parcelado ou englobado'
          TabOrder = 0
          OnClick = cbEnglobParcClick
        end
        object cbLancaBaixa: TCheckBox
          Left = 8
          Top = 27
          Width = 297
          Height = 17
          Caption = 'Lança e Baixa este documento simultaneamente'
          TabOrder = 1
          OnClick = cbLancaBaixaClick
        end
        object cbIntegra: TCheckBox
          Left = 8
          Top = 47
          Width = 306
          Height = 17
          Caption = 'Não integrar este lançamento com a contabilidade'
          TabOrder = 2
        end
      end
      object dbeCompl: TwwDBEdit
        Left = 404
        Top = 22
        Width = 25
        Height = 21
        DataField = 'COMPLDOCUMENTO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcTipoDoc: TwwDBLookupCombo
        Left = 5
        Top = 101
        Width = 196
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'DEBCRE'#9'1'#9'D/C'
          'FLGDOCFISCAL'#9'1'#9'Doc. Fiscal'
          'FLGGERANUMDOC'#9'1'#9'Gera Num Doc')
        DataField = 'CODTIPDOC'
        DataSource = ds
        LookupTable = qryTipoDoc
        LookupField = 'CODTIPDOC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        DropDownWidth = 650
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcTipoDocExit
      end
      object dbenChBordero: TDBRealEdit
        Left = 299
        Top = 136
        Width = 96
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '              0')
        TabOrder = 12
        WordWrap = False
        IntDigits = 15
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NumChqBordero'
        DataSource = ds
      end
      object CmpForCli: TCMProcuraForCli
        Left = 6
        Top = 1
        Width = 253
        Height = 49
        Caption = ' Favorecido '
        TabOrder = 0
        OnEnter = CmpForCliEnter
        OnExit = CmpForCliExit
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'não pode estar em branco'
        Mensagens.NaoExiste = 'não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        OnApertouBotao = CmpForCliApertouBotao
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
      end
      object DbeValorLiquido: TRealEdit
        Left = 328
        Top = 65
        Width = 106
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 7
        Visible = False
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 165
      Width = 725
      Height = 228
      Tabs.Strings = (
        'Rateio'
        'Contabilização'
        'Lançamentos'
        'Alteradores'
        'Geral')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdContabil'
        ''
        'GrdAlteradores'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 627
        Height = 169
        ActivePage = TbsAlteradores
        OnEnter = pgctrlDetalheEnter
        inherited tbsDet: TTabSheet
          Caption = 'Rateio'
          inherited pnlControlesDet: TPanel [0]
            Width = 619
            Height = 141
            object PageRateioPrev: TPageControl
              Left = 0
              Top = 0
              Width = 619
              Height = 141
              ActivePage = TbsRateioGeral
              Align = alClient
              HotTrack = True
              MultiLine = True
              TabHeight = 20
              TabOrder = 1
              Visible = False
              OnChange = PageRateioPrevChange
              object TbsRateioGeral: TTabSheet
                Caption = 'Geral'
              end
              object TbsPrevidencia: TTabSheet
                Caption = 'Previdência'
                object Label11: TLabel
                  Left = 7
                  Top = 3
                  Width = 118
                  Height = 13
                  Caption = 'Plano Previdenciário'
                end
                object Label12: TLabel
                  Left = 310
                  Top = 3
                  Width = 80
                  Height = 13
                  Caption = 'Patrocinadora'
                end
                object Label16: TLabel
                  Left = 7
                  Top = 43
                  Width = 38
                  Height = 13
                  Caption = 'Imóvel'
                end
                object EdtImovel: TwwDBEdit
                  Left = 7
                  Top = 60
                  Width = 121
                  Height = 21
                  DataField = 'NUMIMOVEL'
                  DataSource = dsDet
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object CmbPlano: TCMDBLookupCombo
                  Left = 7
                  Top = 20
                  Width = 298
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Plano Previdenciário')
                  DataField = 'IDPLANOPREV'
                  DataSource = dsDet
                  LookupTable = qryPlanoPrev
                  LookupField = 'IDPLANOPREV'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = CmbPlanoCloseUp
                  OnExit = CmbPlanoExit
                end
                object CmbPatro: TCMDBLookupCombo
                  Left = 310
                  Top = 20
                  Width = 298
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Nome')
                  DataField = 'IDPATRO'
                  DataSource = dsDet
                  LookupTable = qryPatroPrev
                  LookupField = 'IDPESSOA'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = CmbPatroCloseUp
                  OnExit = CmbPatroExit
                end
              end
            end
            object PnlRateioGeral: TPanel
              Left = 0
              Top = 0
              Width = 619
              Height = 141
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object lblUnidNegoc: TLabel
                Left = 3
                Top = 1
                Width = 104
                Height = 13
                Caption = 'Atividade\Projeto:'
              end
              object lblCentroRespon: TLabel
                Left = 156
                Top = 1
                Width = 107
                Height = 13
                Caption = 'Centro de Respon.'
              end
              object lblTipoRD: TLabel
                Left = 310
                Top = 1
                Width = 116
                Height = 13
                Caption = 'Tipo de Desembolso'
              end
              object Label6: TLabel
                Left = 463
                Top = 1
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object lblMoedaDet: TLabel
                Left = 261
                Top = 50
                Width = 39
                Height = 13
                Caption = 'Moeda'
              end
              object lblValorOutDet: TLabel
                Left = 377
                Top = 50
                Width = 107
                Height = 13
                Caption = 'Valor Outra Moeda'
              end
              object lblValorDet: TLabel
                Left = 489
                Top = 50
                Width = 124
                Height = 13
                Caption = 'Valor Moeda Corrente'
              end
              object dblcUnidNegoc: TwwDBLookupCombo
                Left = 3
                Top = 18
                Width = 150
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'UNETIPO'#9'1'#9'T'
                  'UNECODIGO'#9'10'#9'Código')
                DataField = 'UNIDNEGOC'
                DataSource = dsDet
                LookupTable = qryUnidNegoc
                LookupField = 'UNIDNEGOC'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcUnidNegocCloseUp
                OnExit = dblcUnidNegocExit
              end
              object dblcCentroRespon: TwwDBLookupCombo
                Left = 156
                Top = 18
                Width = 150
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'ANALITICOSINTET'#9'1'#9'T'
                  'CODCENTRORESPON'#9'10'#9'Código')
                DataField = 'CODCENTRORESPON'
                DataSource = dsDet
                LookupTable = qryCentroRespon
                LookupField = 'CODCENTRORESPON'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcCentroResponCloseUp
                OnExit = dblcCentroResponExit
              end
              object dblcTipoRD: TwwDBLookupCombo
                Left = 310
                Top = 18
                Width = 149
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'35'#9'Descrição'
                  'CODTIPRECDES'#9'15'#9'Código')
                DataField = 'CODTIPRECDES'
                DataSource = dsDet
                LookupTable = qryTipoRD
                LookupField = 'CODTIPRECDES'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                Enabled = False
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = dblcTipoRDCloseUp
                OnExit = dblcTipoRDExit
              end
              object CmbCentCusto: TwwDBLookupCombo
                Left = 463
                Top = 18
                Width = 149
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'25'#9'Descrição'
                  'CODCENTROCUSTO'#9'10'#9'Código'
                  'STATUSGRUPOCDC'#9'1'#9'A/S')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsDet
                LookupTable = qryCentroCusto
                LookupField = 'CODCENTROCUSTO'
                Options = [loColLines, loTitles]
                Style = csDropDownList
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                UseTFields = False
                AllowClearKey = True
                ShowMatchText = True
                OnCloseUp = CmbCentCustoCloseUp
                OnExit = CmbCentCustoExit
              end
              object GpDotOrc: TPanel
                Left = 156
                Top = 48
                Width = 103
                Height = 44
                BevelOuter = bvNone
                TabOrder = 5
                object SpeedButton1: TSpeedButton
                  Left = 80
                  Top = 18
                  Width = 21
                  Height = 25
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    0400000000008000000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                    77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
                    87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
                    FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
                    0E070F757770000000E070FFF707777777007700007777777777}
                  OnClick = SpeedButton1Click
                end
                object Label17: TLabel
                  Left = 3
                  Top = 1
                  Width = 94
                  Height = 13
                  Caption = 'Comp. Orçamen.'
                end
                object ReResOrc: TDBRealEdit
                  Left = 3
                  Top = 20
                  Width = 72
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0')
                  TabOrder = 0
                  WordWrap = False
                  OnExit = ReResOrcExit
                  IntDigits = 10
                  DecDigits = 0
                  NumberFormat = iNumber
                  Signal = False
                  DataField = 'NUMRESERVA'
                  DataSource = dsDet
                end
              end
              object PnlPrograma: TPanel
                Left = 3
                Top = 51
                Width = 152
                Height = 42
                BevelOuter = bvNone
                TabOrder = 4
                object Label13: TLabel
                  Left = 3
                  Top = -1
                  Width = 54
                  Height = 13
                  Caption = 'Programa'
                end
                object CmbPrograma: TCMDBLookupCombo
                  Left = 3
                  Top = 17
                  Width = 150
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROGRAMA'#9'60'#9'Descrição'
                    'CODPROGRAMA'#9'2'#9'Código')
                  DataField = 'IDPROGRAMA'
                  DataSource = dsDet
                  LookupTable = qryProgramaPrev
                  LookupField = 'IDPROGRAMA'
                  Options = [loTitles]
                  Style = csDropDownList
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  OrderByDisplay = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnCloseUp = CmbProgramaCloseUp
                  OnExit = CmbProgramaExit
                end
              end
              object edMoedaDet: TEdit
                Left = 261
                Top = 68
                Width = 112
                Height = 21
                Enabled = False
                TabOrder = 6
                Text = 'edMoedaDet'
              end
              object dbeValorMoedaDet: TRealEdit
                Left = 377
                Top = 68
                Width = 108
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 7
                WordWrap = False
                OnExit = dbeValorMoedaDetExit
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
              object dbeValorDet: TRealEdit
                Left = 489
                Top = 68
                Width = 124
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                ParentShowHint = False
                ShowHint = False
                TabOrder = 8
                WordWrap = False
                IntDigits = 17
                DecDigits = 2
                NumberFormat = fNumber
                Signal = True
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 619
            Height = 141
            Selected.Strings = (
              'NOME'#9'10'#9'Atividade/Projeto'#9'No'
              'NOME_1'#9'10'#9'Cent. Respon.'#9'No'
              'DESCRICAO'#9'10'#9'Receb/Desemb'#9'No'
              'CODCENTROCUSTO'#9'10'#9'Cod. Centro Custo'#9'No'
              'NOMECENTROCUSTO'#9'10'#9'Nome Cent. Custo'#9'No'
              'VALOR'#9'10'#9'Valor'#9'No'
              'DESCPLANO'#9'50'#9'Plano'#9'No'
              'NOMEPATRO'#9'60'#9'Patrocinadora'#9'No'
              'NUMIMOVEL'#9'60'#9'Imóvel'#9'No'
              'DESCPROGRAMA'#9'60'#9'Programa'#9'No')
          end
        end
        object tbsContabil: TTabSheet
          Caption = 'Contabilização'
          object pnlContabil: TPanel
            Left = 0
            Top = 0
            Width = 619
            Height = 141
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Bevel3: TBevel
              Left = 294
              Top = 3
              Width = 321
              Height = 130
              Shape = bsFrame
            end
            object lblCCusto: TLabel
              Left = 300
              Top = 4
              Width = 92
              Height = 13
              Caption = 'Centro do Custo'
              Transparent = True
            end
            object lblAtividade: TLabel
              Left = 301
              Top = 86
              Width = 100
              Height = 13
              Caption = 'Atividade\Projeto'
            end
            object lblValorMoedaCon: TLabel
              Left = 468
              Top = 46
              Width = 107
              Height = 13
              Caption = 'Valor Outra Moeda'
            end
            object lblValorCorrenteCon: TLabel
              Left = 468
              Top = 86
              Width = 124
              Height = 13
              Caption = 'Valor Moeda Corrente'
            end
            object lblSubConta: TLabel
              Left = 301
              Top = 46
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object CContabil: TCMProcuraMaskContabil
              Left = 6
              Top = -1
              Width = 284
              Height = 70
              Caption = ' Conta Contábil '
              TabOrder = 5
              OnExit = CContabilExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsContabil
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil não existe'
              Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
              OnApertouBotao = CContabilApertouBotao
            end
            object dbgDebitoCredito: TDBRadioGroup
              Left = 469
              Top = 5
              Width = 141
              Height = 36
              Caption = 'D\C'
              Columns = 2
              DataField = 'LACDEBCRE'
              DataSource = dsContabil
              Items.Strings = (
                'Débito'
                'Crédito')
              TabOrder = 3
              Values.Strings = (
                'D'
                'C')
            end
            object gbHistorico: TGroupBox
              Left = 6
              Top = 66
              Width = 285
              Height = 65
              TabOrder = 4
              object ScrollBox1: TScrollBox
                Left = 5
                Top = 11
                Width = 276
                Height = 50
                BorderStyle = bsNone
                TabOrder = 0
                object dbeHist1: TwwDBEdit
                  Left = 2
                  Top = 2
                  Width = 254
                  Height = 21
                  DataField = 'LACHIST1'
                  DataSource = dsContabil
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeHist2: TwwDBEdit
                  Left = 2
                  Top = 26
                  Width = 254
                  Height = 21
                  DataField = 'LACHIST2'
                  DataSource = dsContabil
                  TabOrder = 1
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeHist3: TwwDBEdit
                  Left = 2
                  Top = 50
                  Width = 254
                  Height = 21
                  DataField = 'LACHIST3'
                  DataSource = dsContabil
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeHist4: TwwDBEdit
                  Left = 2
                  Top = 73
                  Width = 254
                  Height = 21
                  DataField = 'LACHIST4'
                  DataSource = dsContabil
                  TabOrder = 3
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbHist5: TwwDBEdit
                  Left = 2
                  Top = 96
                  Width = 254
                  Height = 21
                  DataField = 'LACHIST5'
                  DataSource = dsContabil
                  TabOrder = 4
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 300
              Top = 17
              Width = 164
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME'
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsContabil
              LookupTable = qryCCusto
              LookupField = 'CODCENTROCUSTO'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnEnter = dblcCCustoEnter
            end
            object dblcAtividade: TwwDBLookupCombo
              Left = 301
              Top = 101
              Width = 164
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = dsContabil
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcSubConta: TwwDBLookupCombo
              Left = 300
              Top = 59
              Width = 164
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'40'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = dsContabil
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object reValorCorrenteCon: TDBRealEdit
              Left = 468
              Top = 101
              Width = 140
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '             0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'LACVALOR'
              DataSource = dsContabil
            end
            object reValorMoedaCon: TDBRealEdit
              Left = 468
              Top = 59
              Width = 141
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '             0,00')
              TabOrder = 7
              WordWrap = False
              OnExit = reValorMoedaConExit
              IntDigits = 17
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'LACVALHIST'
              DataSource = dsContabil
            end
          end
          object dbgrdContabil: TwwDBGrid
            Left = 0
            Top = 0
            Width = 619
            Height = 141
            Selected.Strings = (
              'PLACONTA'#9'15'#9'Conta Contábil'
              'PLANOME'#9'20'#9'Nome da Conta Contábil'
              'LACDEBCRE'#9'3'#9'D/C'
              'LACVALOR'#9'15'#9'Valor'
              'CODSUBCONTA'#9'8'#9'Sub-Conta'
              'CODCENTROCUSTO'#9'12'#9'Cod Cent. Custo'
              'NOME_1'#9'10'#9'Cent. Custo'
              'NOME'#9'10'#9'Atividade'
              'DESCPLANO'#9'50'#9'Plano'
              'NOMEPATRO'#9'60'#9'Patrocinadora'
              'LACVALHIST'#9'15'#9'Valor O.M'
              'LACHIST1'#9'40'#9'Histórico'
              'LACHIST2'#9'40'#9'Histórico'
              'LACHIST3'#9'40'#9'Histórico')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContabil
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object tbsLancamento: TTabSheet
          Caption = 'Lançamentos'
          object dbgLancamentos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 619
            Height = 141
            Selected.Strings = (
              'NUMLANCTO'#9'10'#9'Lançamento'
              'OPERACAO'#9'2'#9'Operação'
              'DATALANCTO'#9'10'#9'Data Lançamento'
              'VALOR'#9'10'#9'Valor Moeda Corrente'
              'VALOROUTRAMOEDA'#9'10'#9'Valor Outra Moeda'
              'DEBCRE'#9'1'#9'D/C'
              'HISTORICOCOMPL'#9'60'#9'Histórico'
              'ESTORNO'#9'10'#9'Estorno'
              'CODLANCFINANC'#9'10'#9'Lançamento Financeiro'
              'CODPORTFORMA'#9'10'#9'Forma de Recto/Pagto'
              'NUMLOTE'#9'10'#9'Número do Lote'
              'PLNCODIGO'#9'10'#9'Código Contábil'
              'NUMCHQBORDERO'#9'15'#9'Cheque/Borderô'
              'DATACFLOAT'#9'10'#9'Data com Float'
              'CODALTERADOR'#9'10'#9'Alterador')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsLancamento
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object TbsAlteradores: TTabSheet
          Caption = 'Alteradores'
          object PnlAlteradores: TPanel
            Left = 0
            Top = 0
            Width = 619
            Height = 141
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblAlterador: TLabel
              Left = 9
              Top = 3
              Width = 126
              Height = 13
              Caption = 'Alterador Selecionado'
            end
            object lblValOut: TLabel
              Left = 310
              Top = 3
              Width = 115
              Height = 13
              Caption = 'Valor (Outra Moeda)'
            end
            object Label1: TLabel
              Left = 460
              Top = 3
              Width = 132
              Height = 13
              Caption = 'Valor (Moeda Corrente)'
            end
            object Label2: TLabel
              Left = 310
              Top = 48
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object Label3: TLabel
              Left = 182
              Top = 48
              Width = 101
              Height = 13
              Caption = 'Data Lançamento'
            end
            object Label20: TLabel
              Left = 9
              Top = 48
              Width = 104
              Height = 13
              Caption = 'Atividade\Projeto:'
            end
            object EdtHist: TDBEdit
              Left = 310
              Top = 66
              Width = 307
              Height = 21
              DataField = 'HISTORICOCOMPL'
              DataSource = dsAlteradores
              TabOrder = 0
            end
            object DtLancto: TCMDateTimePicker
              Left = 182
              Top = 66
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATALANCTO'
              DataSource = dsAlteradores
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
            object DbROutraMoeda: TDBRealEdit
              Left = 310
              Top = 21
              Width = 142
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOROUTRAMOEDA'
              DataSource = dsAlteradores
            end
            object DbrValor: TDBRealEdit
              Left = 460
              Top = 21
              Width = 157
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = DbrValorExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALOR'
              DataSource = dsAlteradores
            end
            object dblkAlterador: TwwDBLookupCombo
              Left = 9
              Top = 21
              Width = 292
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO'
                'ACRESDECRES'#9'1'#9'ACRESDECRES')
              DataField = 'CODALTERADOR'
              DataSource = dsAlteradores
              LookupTable = qryAlt
              LookupField = 'CODALTERADOR'
              DropDownWidth = 400
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblkAlteradorExit
            end
            object DbrValLiquido: TDBRealEdit
              Left = 486
              Top = 21
              Width = 130
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRLIQUIDO'
              DataSource = dsAlteradores
            end
            object DclAtivProjeto: TwwDBLookupCombo
              Left = 9
              Top = 66
              Width = 166
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNETIPO'#9'1'#9'T'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsAlteradores
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 6
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnExit = DclAtivProjetoExit
            end
            object CkbContabiliza: TDBCheckBox
              Left = 9
              Top = 96
              Width = 353
              Height = 17
              Caption = 'Não Integrar Este lançamento com a Contabilidade'
              DataField = 'CONTABILIZA'
              DataSource = dsAlteradores
              TabOrder = 7
              ValueChecked = 'N'
              ValueUnchecked = 'S'
            end
          end
          object GrdAlteradores: TwwDBGrid
            Left = 0
            Top = 0
            Width = 619
            Height = 141
            Selected.Strings = (
              'DESCRICAO'#9'17'#9'Alterador'
              'DATALANCTO'#9'10'#9'Data'
              'VALOR'#9'10'#9'Valor'
              'VALOROUTRAMOEDA'#9'10'#9'Valor OM'
              'NOME'#9'13'#9'Atividade/Projeto'
              'CONTABILIZA'#9'6'#9'Contab.'
              'HISTORICOCOMPL'#9'60'#9'Histórico')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAlteradores
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
        object TbsGeral: TTabSheet
          Caption = 'Geral'
          object LblFormaPag: TLabel
            Left = 5
            Top = 42
            Width = 120
            Height = 13
            Caption = 'Forma de Pagamento'
          end
          object LblSubContaCli: TLabel
            Left = 151
            Top = 42
            Width = 128
            Height = 13
            Caption = 'Sub-Conta Fornecedor'
          end
          object Label8: TLabel
            Left = 5
            Top = 2
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Label9: TLabel
            Left = 5
            Top = 81
            Width = 69
            Height = 13
            Caption = 'Observação'
          end
          object GpBarras: TGroupBox
            Left = 300
            Top = 1
            Width = 315
            Height = 95
            Caption = ' Nº da Ficha de Compensação '
            TabOrder = 0
            object Label4: TLabel
              Left = 8
              Top = 15
              Width = 98
              Height = 13
              Caption = 'Código de Barras'
            end
            object Label5: TLabel
              Left = 8
              Top = 52
              Width = 86
              Height = 13
              Caption = 'Linha Digitável'
            end
            object DbeBarras: TwwDBEdit
              Left = 8
              Top = 30
              Width = 299
              Height = 21
              DataField = 'NUMLEITCODBARRAS'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DbeLinhaDigit: TwwDBEdit
              Left = 8
              Top = 67
              Width = 296
              Height = 21
              DataField = 'NUMDIGCODBARRAS'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object DblCodForma: TwwDBLookupCombo
            Left = 5
            Top = 56
            Width = 140
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição')
            DataField = 'CODFORMA'
            DataSource = ds
            LookupTable = qryFormaPag
            LookupField = 'CODFORMA'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object GpConta: TGroupBox
            Left = 300
            Top = 96
            Width = 316
            Height = 59
            Caption = 'Conta Bancária '
            TabOrder = 2
            object Label14: TLabel
              Left = 8
              Top = 15
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 118
              Top = 15
              Width = 52
              Height = 13
              Caption = 'Nº Conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 58
              Top = 15
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 173
              Top = 15
              Width = 115
              Height = 13
              DataField = 'DESCTIPOCONTA'
              DataSource = ds
            end
            object BtnBuscaContaCor: TSpeedButton
              Left = 283
              Top = 26
              Width = 25
              Height = 25
              Hint = 'Altera Conta Bancária'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33033333333333333F7F3333333333333000333333333333F777333333333333
                000333333333333F777333333333333000333333333333F77733333333333300
                033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                333333773FF77333333333370007333333333333777333333333}
              NumGlyphs = 2
              OnClick = BtnBuscaContaCorClick
            end
            object DbEdtConta: TwwDBEdit
              Left = 118
              Top = 30
              Width = 163
              Height = 21
              DataField = 'CONTACORRENTE'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DbEdtBanco: TwwDBEdit
              Left = 8
              Top = 30
              Width = 44
              Height = 21
              DataField = 'NUMBANCO'
              DataSource = ds
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DbEdtAgencia: TwwDBEdit
              Left = 57
              Top = 30
              Width = 57
              Height = 21
              DataField = 'NUMAGENCIA'
              DataSource = ds
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object CmbSubConta: TwwDBLookupCombo
            Left = 151
            Top = 56
            Width = 140
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'40'#9'Nome'
              'CODSUBCONTA'#9'10'#9'Código')
            DataField = 'CODSUBCONTA'
            DataSource = ds
            LookupTable = qrySubContaForCli
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object Dbereferencia: TwwDBEdit
            Left = 5
            Top = 17
            Width = 176
            Height = 21
            DataField = 'REFERENCIA'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object MemObs: TDBMemo
            Left = 5
            Top = 97
            Width = 286
            Height = 58
            DataField = 'OBS'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 5
          end
          object PnlAp: TPanel
            Left = 184
            Top = 0
            Width = 110
            Height = 41
            BevelOuter = bvNone
            TabOrder = 6
            object LblNumAp: TLabel
              Left = 6
              Top = 2
              Width = 53
              Height = 13
              Caption = 'Nº da AP'
            end
            object BtnNumApgr: TSpeedButton
              Left = 83
              Top = 15
              Width = 25
              Height = 25
              Hint = 'Gera Nº Automático'
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888088888888888888800888888888888880B0888888888888880B088
                8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
                88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
                8888888880FBFBF0888888888000000088888888888888888888}
              ParentShowHint = False
              ShowHint = True
              OnClick = BtnNumApgrClick
            end
            object EdtNumAp: TwwDBEdit
              Left = 5
              Top = 17
              Width = 77
              Height = 21
              DataField = 'NUMAPGR'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 717
        object lblModulo: TLabel [0]
          Left = 285
          Top = 0
          Width = 220
          Height = 13
          Caption = 'Sistema que originou este lançamento:'
        end
        object DBText2: TDBText [1]
          Left = 286
          Top = 12
          Width = 48
          Height = 15
          AutoSize = True
          DataField = 'NOMEMODULO'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel [2]
          Left = 83
          Top = 0
          Width = 190
          Height = 13
          Caption = 'Usuário que lançou o Documento'
        end
        object DBText3: TDBText [3]
          Left = 83
          Top = 12
          Width = 48
          Height = 15
          AutoSize = True
          DataField = 'NOMEUSUARIO'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      inherited Dock974: TDock97
        Left = 631
        Height = 169
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Height = 26
          end
          inherited bbtnCancelarDet: TBitBtn
            Tag = 9999
            Top = 26
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 9999
            Top = 53
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 733
    object BtnStatus: TToolbarButton97 [0]
      Left = 520
      Top = 2
      Width = 210
      Height = 41
      AllowAllUp = True
      DropdownArrow = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Opaque = False
      ParentFont = False
      Spacing = 5
      WordWrap = True
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 361
      end
      inherited sbtnApagar: TToolbarButton97
        Width = 64
      end
      object sbtnEstornar: TToolbarButton97
        Left = 184
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Es&tornar'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnEstornarClick
      end
      object sbtnAlternarTipoDoc: TToolbarButton97
        Left = 244
        Top = 0
        Width = 117
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Pagar / Receber'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        ImageIndex = 0
        Layout = blGlyphTop
        NumGlyphs = 3
        Opaque = False
        Spacing = 0
        OnClick = sbtnAlternarTipoDocClick
      end
    end
    object EdtAutorizaAlteracao: TEditReg
      Left = 696
      Top = 12
      Width = 25
      Height = 21
      RegKey = 'HKEY_CURRENT_USER'
      RegPath = 'Software\CM\Contas a Pagar'
      RegValueName = 'Libera Alteração de Documentos'
      TabOrder = 1
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 444
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 572
      inherited sep1: TToolbarSep97
        Left = 162
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Tag = 9999
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 82
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 399
      DockPos = 400
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 9999
        Left = 82
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      
        '  D.CODDOCUMENTO, D.CODPORTFORMA, D.CODSUBCONTA, D.IDPESSOA, D.P' +
        'LANO, D.PLACONTA,'
      
        '  D.MOECODIGO, D.NUMSLIP, D.EMISBLOQ, D.CODCENTROCUSTO, D.IDFORC' +
        'LI, D.IDMODULO,'
      
        '  D.CODTIPDOC, D.RECPAG, D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATA' +
        'EMISSAO, D.DATAVENCTO,'
      
        '  D.DATAPROGRAMADA, D.STATUS, D.NUMFATURA, D.OPERACAO, D.IDUSUAR' +
        'IOINCLUSAO, L.NUMLANCTO,'
      
        '  L.CODALTERADOR, L.PLNCODIGO, L.DATALANCTO, L.VALOR, L.VALOROUT' +
        'RAMOEDA, L.ESTORNO,'
      
        '  L.DEBCRE, L.HISTORICOCOMPL, R.CODLANCFINANC, R.NUMLOTE, R.NUMC' +
        'HQBORDERO, R.DATACFLOAT,'
      
        '  P.NOME, D.CODFORMA, D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS, L.N' +
        'UMFATURA, L.FLGTIPOFATURA,'
      
        '  M.NOMEMODULO, L.VLRLIQUIDO, D.UNIDNEGOC, D.REFERENCIA, D.OBS, ' +
        'D.NUMAPGR,'
      '  D.NUMAPGR AS OLDAPGR, US.NOMEUSUARIO, D.IDCBANCARIA,'
      '  DECODE(C.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '  DECODE(C.TIPOCONTA, '#39'2'#39', '#39'Cartão Salário'#39','
      
        '  DECODE(C.TIPOCONTA, '#39'3'#39', '#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCON' +
        'TA,'
      '  C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  RECBTOPAGTO R,'
      '  PESSOA P,'
      '  MODULO M,'
      '  USUARIOSISTEMA US,'
      '  CONTABANCARIA C,'
      '  AGENCIABANCARIA A,'
      '  BANCO B'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.IDMODULO = M.IDMODULO) AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.OPERACAO = L.OPERACAO) AND'
      '  (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      '  (R.NUMLANCTO(+) = L.NUMLANCTO) AND'
      '  (P.IDPESSOA = D.IDFORCLI) AND'
      '  (D.IDUSUARIOINCLUSAO = US.IDUSUARIO) AND'
      '  (C.IDAGENCIA = A.IDPESSOA(+))  AND'
      '  (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '  (D.IDCBANCARIA = C.IDCBANCARIA(+))')
    Left = 451
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryNUMSLIP: TStringField
      FieldName = 'NUMSLIP'
      Size = 11
    end
    object qryEMISBLOQ: TStringField
      FieldName = 'EMISBLOQ'
      Size = 1
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryNODOCUMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
    end
    object qryCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object qryDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object qryDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object qrySTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object qryOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
    end
    object qryNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object qryCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object qryESTORNO: TFloatField
      FieldName = 'ESTORNO'
    end
    object qryDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryCODLANCFINANC: TFloatField
      FieldName = 'CODLANCFINANC'
    end
    object qryNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
    end
    object qryNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      Size = 15
    end
    object qryDATACFLOAT: TDateTimeField
      FieldName = 'DATACFLOAT'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
    object qryNUMLEITCODBARRAS: TStringField
      FieldName = 'NUMLEITCODBARRAS'
      Size = 60
    end
    object qryNUMDIGCODBARRAS: TStringField
      FieldName = 'NUMDIGCODBARRAS'
      Size = 60
    end
    object qryNUMFATURA_1: TStringField
      FieldName = 'NUMFATURA_1'
      Size = 60
    end
    object qryFLGTIPOFATURA: TStringField
      DisplayWidth = 3
      FieldName = 'FLGTIPOFATURA'
      Size = 3
    end
    object qryVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object qryNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      Size = 50
    end
    object qryUNIDNEGOC2: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object qryOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object qryOLDAPGR: TFloatField
      FieldName = 'OLDAPGR'
    end
    object qryNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
    end
    object qryIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryDESCTIPOCONTA: TStringField
      FieldName = 'DESCTIPOCONTA'
      Size = 14
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Size = 1
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDet
    Left = 65
    Top = 317
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 589
    Top = 26
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
      'update DOCUMENTO'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTO'
      '  (CODDOCUMENTO)'
      'values'
      '  (:CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTO'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 423
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'round(LANCTODOCUM.VALOR,2)'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'RECBTOPAGTO.NUMCHQBORDERO'
      'PESSOA.NOME'
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Compl. Documento'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Tipo de Documento'
      'Forma de Pagamento/Cobrança'
      'Número do Cheque/Borderô'
      'Nome'
      'Usuário Inclusão')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'DOCUMENTO'
      'LANCTODOCUM'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'RECBTOPAGTO'
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Filtro.Strings = (
      
        '(LOWER(RTRIM(LANCTODOCUM.HISTORICOCOMPL)) <> '#39'estorno'#39' OR LANCTO' +
        'DOCUM.HISTORICOCOMPL IS NULL)'
      'PESSOA.IDPESSOA             = DOCUMENTO.IDFORCLI'
      'TIPODOCRECPAG.CODTIPDOC     = DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO    = DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO        = DOCUMENTO.OPERACAO'
      'DOCUMENTO.CODPORTFORMA      = PORTADORFORMA.CODPORTFORMA(+)'
      'DOCUMENTO.MOECODIGO         = MOEDA.MOECODIGO(+)'
      'LANCTODOCUM.CODDOCUMENTO    = RECBTOPAGTO.CODDOCUMENTO(+)'
      'LANCTODOCUM.NUMLANCTO       = RECBTOPAGTO.NUMLANCTO(+)'
      'DOCUMENTO.IDUSUARIOINCLUSAO = USUARIOSISTEMA.IDUSUARIO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      '#,##0.00'
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '15'
      '3'
      '10'
      '10'
      '10'
      '15'
      '40'
      '20'
      '20'
      '10'
      '30'
      '20')
    Left = 532
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 479
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 590
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 664
    Top = 17
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 664
    Top = 4
  end
  object qryTipoRD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODTIPRECDES, RECPAG, PLACONTACREDITO, PLANO, PLACONTA, D' +
        'ESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, HITCODHI' +
        'ST'
      'FROM TIPORECEBDESEMB WHERE 1=2')
    ValidateWithMask = True
    Left = 504
    Top = 348
    object qryTipoRDCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryTipoRDRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
    object qryTipoRDPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 18
    end
    object qryTipoRDPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
    end
    object qryTipoRDPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Size = 18
    end
    object qryTipoRDDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoRDANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryTipoRDFLGOBRIGARESERVA: TStringField
      FieldName = 'FLGOBRIGARESERVA'
      Origin = 'TIPORECEBDESEMB.FLGOBRIGARESERVA'
      Size = 1
    end
    object qryTipoRDFLGCALCULAIMPOSTO: TStringField
      FieldName = 'FLGCALCULAIMPOSTO'
      Origin = 'TIPORECEBDESEMB.FLGCALCULAIMPOSTO'
      Size = 1
    end
    object qryTipoRDHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Origin = 'TIPORECEBDESEMB.HITCODHIST'
      Size = 4
    end
  end
  object updContabil: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  PLNCODIGO = :PLNCODIGO,'
      '  LACNUMLAN = :LACNUMLAN,'
      '  LACDEBCRE = :LACDEBCRE,'
      '  HITCODHIST = :HITCODHIST,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDMODULO = :IDMODULO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLACONTA = :PLACONTA,'
      '  PLANO = :PLANO,'
      '  LACTIPO = :LACTIPO,'
      '  LACNUMDOC = :LACNUMDOC,'
      '  LACHIST1 = :LACHIST1,'
      '  LACHIST2 = :LACHIST2,'
      '  LACHIST3 = :LACHIST3,'
      '  LACHIST4 = :LACHIST4,'
      '  LACHIST5 = :LACHIST5,'
      '  LACVALOR = :LACVALOR,'
      '  LACTIPCONVOFICIAL = :LACTIPCONVOFICIAL,'
      '  LACVALOFICIAL = :LACVALOFICIAL,'
      '  LACTIPCONVGER = :LACTIPCONVGER,'
      '  LACVALGERENCIAL = :LACVALGERENCIAL,'
      '  LACTIPCONVGEREN1 = :LACTIPCONVGEREN1,'
      '  LACVALGEREN1 = :LACVALGEREN1,'
      '  LACTIPCONVGEREN2 = :LACTIPCONVGEREN2,'
      '  LACVALGEREN2 = :LACVALGEREN2,'
      '  LACATOUTMOEDA = :LACATOUTMOEDA,'
      '  LACORIGEMAPLIC = :LACORIGEMAPLIC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  LACVALHIST = :LACVALHIST,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (PLNCODIGO, LACNUMLAN, LACDEBCRE, HITCODHIST, IDPESSOA, IDEMPR' +
        'ESA, CODSUBCONTA, '
      
        '   IDMODULO, UNIDNEGOC, IDUSUARIOINCLUSAO, CODCENTROCUSTO, PLACO' +
        'NTA, PLANO, '
      
        '   LACTIPO, LACNUMDOC, LACHIST1, LACHIST2, LACHIST3, LACHIST4, L' +
        'ACHIST5, '
      
        '   LACVALOR, LACTIPCONVOFICIAL, LACVALOFICIAL, LACTIPCONVGERENCI' +
        'AL, LACVALGERENCIAL, '
      
        '   LACTIPCONVGEREN1, LACVALGEREN1, LACTIPCONVGEREN2, LACVALGEREN' +
        '2, LACATOUTMOEDA, '
      '   LACORIGEMAPLIC, TIPCODIGO, LACVALHIST, IDELEMDEMONSTRAT)'
      'values'
      
        '  (:PLNCODIGO, :LACNUMLAN, :LACDEBCRE, :HITCODHIST, :IDPESSOA, :' +
        'IDEMPRESA, '
      
        '   :CODSUBCONTA, :IDMODULO, :UNIDNEGOC, :IDUSUARIOINCLUSAO, :COD' +
        'CENTROCUSTO, '
      
        '   :PLACONTA, :PLANO, :LACTIPO, :LACNUMDOC, :LACHIST1, :LACHIST2' +
        ', :LACHIST3, '
      
        '   :LACHIST4, :LACHIST5, :LACVALOR, :LACTIPCONVOFICIAL, :LACVALO' +
        'FICIAL, '
      
        '   :LACTIPCONVGER, :LACVALGERENCIAL, :LACTIPCONVGEREN1, :LACVALG' +
        'EREN1, '
      
        '   :LACTIPCONVGEREN2, :LACVALGEREN2, :LACATOUTMOEDA, :LACORIGEMA' +
        'PLICACAO, '
      '   :TIPCODIGO, :LACVALHIST, :IDELEMDEMONSTRAT)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  PLNCODIGO = :OLD_PLNCODIGO')
    Left = 28
    Top = 375
  end
  object dsContabil: TwwDataSource
    AutoEdit = False
    DataSet = qryContabil
    Left = 28
    Top = 361
  end
  object qryContabil: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LC.PLACONTA,'
      '  LC.CODSUBCONTA,'
      '  LC.LACDEBCRE,'
      '  LC.LACVALOR,'
      '  LC.LACVALHIST,'
      '  LC.LACHIST1,'
      '  LC.LACHIST2,'
      '  LC.LACHIST3,'
      '  LC.PLNCODIGO,'
      '  LC.LACNUMLAN,'
      '  LC.HITCODHIST,'
      '  LC.IDPESSOA,'
      '  LC.IDEMPRESA,'
      '  LC.IDMODULO,'
      '  LC.UNIDNEGOC,'
      '  LC.IDUSUARIOINCLUSAO,'
      '  LC.PLANO,'
      '  LC.LACTIPO,'
      '  LC.LACNUMDOC,'
      '  LC.LACHIST4,'
      '  LC.LACHIST5,'
      '  LC.LACTIPCONVOFICIAL,'
      '  LC.LACVALOFICIAL,'
      '  LC.LACTIPCONVGER,'
      '  LC.LACVALGERENCIAL,'
      '  LC.LACTIPCONVGEREN1,'
      '  LC.LACVALGEREN1,'
      '  LC.LACTIPCONVGEREN2,'
      '  LC.LACVALGEREN2,'
      '  LC.LACATOUTMOEDA,'
      '  LC.LACORIGEMAPLIC,'
      '  LC.TIPCODIGO,'
      '  LC.IDELEMDEMONSTRAT,'
      '  LC.CODCENTROCUSTO,'
      '  U.NOME,'
      '  CC.NOME,'
      '  CC.CODCENTROCUSTO,'
      '  PC.PLANOME,'
      '  LC.IDPLANOPREV,'
      '  LC.IDPATRO,'
      '  PATRO.NOME AS NOMEPATRO,'
      '  PLANO.NOME AS DESCPLANO'
      'FROM'
      '  LANCAMENTO LC,'
      '  UNIDNEGOCIO U,'
      '  CENTCUST CC,'
      '  PLANOCONTA PC,'
      '  PESSOA PATRO,'
      '  PLANPREVCONTABIL PLANO'
      'WHERE'
      ' (LC.PLNCODIGO = :PLNCODIGO) AND'
      ' (CC.IDEMPRESA(+) = LC.IDEMPRESA) AND'
      ' (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      ' (LC.IDPESSOA = U.IDPESSOA(+)) AND'
      ' (LC.UNIDNEGOC = U.UNIDNEGOC(+)) AND'
      ' (PC.PLANO = LC.PLANO) AND'
      ' (PC.PLACONTA = LC.PLACONTA) AND'
      ' (PLANO.IDPLANOPREV(+) = LC.IDPLANOPREV) AND'
      ' (PATRO.IDPESSOA(+) = LC.IDPATRO)')
    UpdateObject = updContabil
    ValidateWithMask = True
    Left = 28
    Top = 347
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryContabilPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 15
      FieldName = 'PLACONTA'
      Size = 18
    end
    object qryContabilPLANOME: TStringField
      DisplayLabel = 'Nome da Conta Contábil'
      DisplayWidth = 20
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryContabilLACDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 3
      FieldName = 'LACDEBCRE'
      Size = 1
    end
    object qryContabilLACVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'LACVALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContabilCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 8
      FieldName = 'CODSUBCONTA'
    end
    object qryContabilCODCENTROCUSTO: TStringField
      DisplayLabel = 'Cod Cent. Custo'
      DisplayWidth = 12
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
    object qryContabilNOME_1: TStringField
      DisplayLabel = 'Cent. Custo'
      DisplayWidth = 10
      FieldName = 'NOME_1'
      Size = 30
    end
    object qryContabilNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 10
      FieldName = 'NOME'
      Size = 25
    end
    object qryContabilDESCPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object qryContabilNOMEPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryContabilLACVALHIST: TFloatField
      DisplayLabel = 'Valor O.M'
      DisplayWidth = 15
      FieldName = 'LACVALHIST'
    end
    object qryContabilLACHIST1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST1'
      Size = 40
    end
    object qryContabilLACHIST2: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST2'
      Size = 40
    end
    object qryContabilLACHIST3: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'LACHIST3'
      Size = 40
    end
    object qryContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryContabilLACNUMLAN: TFloatField
      FieldName = 'LACNUMLAN'
      Visible = False
    end
    object qryContabilHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryContabilIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryContabilIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryContabilIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryContabilUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryContabilIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryContabilPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryContabilLACTIPO: TStringField
      FieldName = 'LACTIPO'
      Visible = False
      Size = 1
    end
    object qryContabilLACNUMDOC: TStringField
      FieldName = 'LACNUMDOC'
      Visible = False
      Size = 15
    end
    object qryContabilLACHIST4: TStringField
      FieldName = 'LACHIST4'
      Visible = False
      Size = 40
    end
    object qryContabilLACHIST5: TStringField
      FieldName = 'LACHIST5'
      Visible = False
      Size = 40
    end
    object qryContabilLACTIPCONVOFICIAL: TStringField
      FieldName = 'LACTIPCONVOFICIAL'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALOFICIAL: TFloatField
      FieldName = 'LACVALOFICIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGER: TStringField
      FieldName = 'LACTIPCONVGER'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGERENCIAL: TFloatField
      FieldName = 'LACVALGERENCIAL'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN1: TStringField
      FieldName = 'LACTIPCONVGEREN1'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN1: TFloatField
      FieldName = 'LACVALGEREN1'
      Visible = False
    end
    object qryContabilLACTIPCONVGEREN2: TStringField
      FieldName = 'LACTIPCONVGEREN2'
      Visible = False
      Size = 1
    end
    object qryContabilLACVALGEREN2: TFloatField
      FieldName = 'LACVALGEREN2'
      Visible = False
    end
    object qryContabilLACATOUTMOEDA: TStringField
      FieldName = 'LACATOUTMOEDA'
      Visible = False
      Size = 1
    end
    object qryContabilLACORIGEMAPLIC: TStringField
      FieldName = 'LACORIGEMAPLIC'
      Visible = False
      Size = 1
    end
    object qryContabilTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Visible = False
      Size = 2
    end
    object qryContabilIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Visible = False
    end
    object qryContabilCODCENTROCUSTO_1: TStringField
      FieldName = 'CODCENTROCUSTO_1'
      Visible = False
      Size = 10
    end
    object qryContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryContabilIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object qryCentroRespon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CEN.CODCENTRORESPON,'
      '  CEN.NOME,'
      '  CEN.ANALITICOSINTET,'
      '  CEN.CODCENTROCUSTO '
      'FROM '
      '  CENTRESPON CEN, '
      '  PESSOAXCRESP PES '
      'WHERE '
      '  (CEN.CODCENTRORESPON=PES.CODCENTRORESPON)')
    ValidateWithMask = True
    Left = 844
    Top = 662
    object qryCentroResponCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
    object qryCentroResponNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryCentroResponANALITICOSINTET: TStringField
      FieldName = 'ANALITICOSINTET'
      Origin = 'CENTRESPON.ANALITICOSINTET'
      Size = 1
    end
    object qryCentroResponCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTRESPON.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryCotacaoMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.MOECODIGO,C.COTVALOR,M.MOEDESC,M.MOESIGLA FROM COTACAOM' +
        'OEDA C, MOEDA M ')
    ValidateWithMask = True
    Left = 522
    Top = 608
    object qryCotacaoMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'COTACAOMOEDA.MOECODIGO'
    end
    object qryCotacaoMoedaCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      Origin = 'COTACAOMOEDA.COTVALOR'
    end
    object qryCotacaoMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryCotacaoMoedaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA WHERE MOEINATIVO='#39'A' +
        #39)
    ValidateWithMask = True
    Left = 246
    Top = 340
    object qryMoedaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryMoedaMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryMoedaMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Origin = 'MOEDA.MOESIGLA'
      Size = 10
    end
  end
  object qryParamContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 770
    Top = 608
  end
  object qryTipoDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      
        '  CODTIPDOC,DESCRICAO,DEBCRE, FLGENGLOBAPARCELA, FLGGERANUMDOC, ' +
        'FLGDOCFISCAL'
      'FROM '
      '  TIPODOCRECPAG '
      'WHERE 1=2')
    ControlType.Strings = (
      'FLGDOCFISCAL;CheckBox;S;N'
      'FLGGERANUMDOC;CheckBox;S;N')
    ValidateWithMask = True
    Left = 808
    Top = 553
    object qryTipoDocCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = '"CM.TIPODOCRECPAG".CODTIPDOC'
    end
    object qryTipoDocDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = '"CM.TIPODOCRECPAG".DESCRICAO'
      Size = 35
    end
    object qryTipoDocDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = '"CM.TIPODOCRECPAG".DEBCRE'
      Size = 1
    end
    object qryTipoDocFLGENGLOBAPARCELA: TStringField
      FieldName = 'FLGENGLOBAPARCELA'
      Origin = '"CM.TIPODOCRECPAG".FLGENGLOBAPARCELA'
      Size = 1
    end
    object qryTipoDocFLGGERANUMDOC: TStringField
      FieldName = 'FLGGERANUMDOC'
      Origin = 'TIPODOCRECPAG.FLGGERANUMDOC'
      Size = 1
    end
    object qryTipoDocFLGDOCFISCAL: TStringField
      FieldName = 'FLGDOCFISCAL'
      Origin = 'TIPODOCRECPAG.FLGDOCFISCAL'
      Size = 1
    end
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   UNIDNEGOC,NOME,UNECODIGO,UNETIPO '
      'FROM '
      '  UNIDNEGOCIO '
      'WHERE '
      '  (IDPESSOA = :PIDPESSOA) '
      'ORDER BY '
      '  UNECODIGO,UNETIPO')
    ValidateWithMask = True
    Left = 579
    Top = 662
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUnidNegocNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryUnidNegocUNETIPO: TStringField
      DisplayLabel = 'T'
      DisplayWidth = 1
      FieldName = 'UNETIPO'
      Origin = 'UNIDNEGOCIO.UNETIPO'
      Size = 1
    end
    object qryUnidNegocUNECODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryUnidNegocUNIDNEGOC: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryCCusto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 293
  end
  object qryPortForma: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  CODPORTFORMA, CODCENTROCUSTO, PLANO, PLACONTA, LANCAFINANC, DM' +
        'AIS, DESCRICAO, CODARQUIVOREMESSA, CODFORMAPAGTO'
      'FROM'
      '  PORTADORFORMA'
      'WHERE 1=2')
    ValidateWithMask = True
    Left = 480
    Top = 608
    object qryPortFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
    end
    object qryPortFormaCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'PORTADORFORMA.CODCENTROCUSTO'
      Size = 10
    end
    object qryPortFormaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PORTADORFORMA.PLANO'
    end
    object qryPortFormaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PORTADORFORMA.PLACONTA'
      Size = 18
    end
    object qryPortFormaLANCAFINANC: TStringField
      FieldName = 'LANCAFINANC'
      Origin = 'PORTADORFORMA.LANCAFINANC'
      Size = 1
    end
    object qryPortFormaDMAIS: TFloatField
      FieldName = 'DMAIS'
      Origin = 'PORTADORFORMA.DMAIS'
    end
    object qryPortFormaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryPortFormaCODARQUIVOREMESSA: TFloatField
      FieldName = 'CODARQUIVOREMESSA'
      Origin = 'PORTADORFORMA.CODARQUIVOREMESSA'
    end
    object qryPortFormaCODFORMAPAGTO: TFloatField
      FieldName = 'CODFORMAPAGTO'
      Origin = 'PORTADORFORMA.CODFORMAPAGTO'
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 668
    Top = 388
    object qrySubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
    object qrySubContaNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
  end
  object qryAuxTipoRD: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 490
    Top = 662
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA, R.IDRESE' +
        'RVAORCAMEN,'
      
        '  R.CODCENTRORESPON, R.UNIDNEGOC, R.MOECODIGO, R.VALOR, R.VALORO' +
        'UTRAMOEDA, T.PLACONTACREDITO,'
      
        '  R.IDUSUARIOINCLUSAO, U.NOME, C.NOME, R.CODCENTROCUSTO, R.IDRAT' +
        'EIODOCUM, T.DESCRICAO,'
      
        '  I.MOESIGLA, CC.NOME AS NOMECENTROCUSTO, R.PLANO, R.IDPATRO, R.' +
        'IDPROGRAMA, R.NUMIMOVEL,'
      
        '  PATRO.NOME AS NOMEPATRO, PLANO.NOME AS DESCPLANO, PROGRAMA.DES' +
        'CPROGRAMA, T.HITCODHIST,'
      '  R.IDPLANOPREV, RESERVAORCAMEN.NUMRESERVA, T.FLGOBRIGARESERVA,'
      
        '  RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD, R.VALOR AS VALORRE' +
        'SERVAOLD, R.VLRRESORCAMEN'
      'FROM'
      
        '  PESSOA PATRO, RATEIODOCUM R, UNIDNEGOCIO U, CENTRESPON C, TIPO' +
        'RECEBDESEMB T,'
      
        '  MOEDA I, CENTCUST CC, PLANPREVCONTABIL PLANO, PROGRAMA, RESERV' +
        'AORCAMEN'
      'WHERE'
      '   (R.CODDOCUMENTO     = :CODDOCUMENTO) AND'
      '   (T.CODTIPRECDES     = R.CODTIPRECDES) AND'
      '   (T.RECPAG           = R.RECPAG) AND'
      '   (T.IDPESSOA         = R.IDPESSOA) AND'
      '   (U.UNIDNEGOC        = R.UNIDNEGOC) AND'
      '   (U.IDPESSOA         = R.IDPESSOA) AND'
      '   (R.MOECODIGO        = I.MOECODIGO(+)) AND'
      '   (R.CODCENTRORESPON  = C.CODCENTRORESPON(+)) AND'
      '   (R.IDPESSOA         = CC.IDEMPRESA(+)) AND'
      '   (R.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND'
      '   (R.IDPESSOA         = C.IDPESSOA(+)) AND'
      '   (R.IDPLANOPREV      = PLANO.IDPLANOPREV(+)) AND'
      '   (R.IDPROGRAMA       = PROGRAMA.IDPROGRAMA(+)) AND'
      '   (R.IDPATRO          = PATRO.IDPESSOA(+)) AND'
      '   (R.IDRESERVAORCAMEN = RESERVAORCAMEN.IDRESERVAORCAMEN(+))')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 65
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDetNOME: TStringField
      DisplayLabel = 'Atividade'
      DisplayWidth = 10
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryDetNOME_1: TStringField
      DisplayLabel = 'Cent. Respon.'
      DisplayWidth = 10
      FieldName = 'NOME_1'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Desembolso'
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryDetCODCENTROCUSTO: TStringField
      Tag = 1
      DisplayLabel = 'Cod. Centro Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTRESPON.CODCENTROCUSTO'
      Size = 10
    end
    object qryDetNOMECENTROCUSTO: TStringField
      DisplayLabel = 'Nome Cent. Custo'
      DisplayWidth = 10
      FieldName = 'NOMECENTROCUSTO'
      Size = 30
    end
    object qryDetVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryDetDESCPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 50
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object qryDetNOMEPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 60
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryDetNUMIMOVEL: TStringField
      Tag = 1
      DisplayLabel = 'Imóvel'
      DisplayWidth = 60
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object qryDetDESCPROGRAMA: TStringField
      DisplayLabel = 'Programa'
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object qryDetMOESIGLA: TStringField
      DisplayLabel = 'Sigla '
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Visible = False
      Size = 10
    end
    object qryDetVALOROUTRAMOEDA: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'RATEIODOCUM.VALOROUTRAMOEDA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetIDRESERVAORCAMEN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'RATEIODOCUM.IDRESERVAORCAMEN'
      Visible = False
    end
    object qryDetCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'RATEIODOCUM.CODDOCUMENTO'
      Visible = False
    end
    object qryDetCODTIPRECDES: TStringField
      Tag = 1
      DisplayLabel = 'Tipo de Recebimento\Desembolso'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryDetRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'RATEIODOCUM.RECPAG'
      Visible = False
      Size = 1
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'RATEIODOCUM.IDPESSOA'
      Visible = False
    end
    object qryDetCODCENTRORESPON: TStringField
      Tag = 1
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryDetUNIDNEGOC: TFloatField
      Tag = 1
      DisplayLabel = 'Atividade Projeto'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
      Visible = False
    end
    object qryDetMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'RATEIODOCUM.MOECODIGO'
      Visible = False
    end
    object qryDetIDUSUARIOINCLUSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'RATEIODOCUM.IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryDetIDRATEIODOCUM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRATEIODOCUM'
      Origin = 'RATEIODOCUM.IDRATEIODOCUM'
      Visible = False
    end
    object qryDetPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Visible = False
      Size = 18
    end
    object qryDetPLANO: TFloatField
      FieldName = 'PLANO'
      Visible = False
    end
    object qryDetIDPATRO: TFloatField
      Tag = 1
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryDetIDPROGRAMA: TFloatField
      Tag = 1
      FieldName = 'IDPROGRAMA'
      Visible = False
    end
    object qryDetHITCODHIST: TStringField
      DisplayWidth = 4
      FieldName = 'HITCODHIST'
      Visible = False
      Size = 4
    end
    object qryDetIDPLANOPREV: TFloatField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetNUMRESERVA: TFloatField
      FieldName = 'NUMRESERVA'
      Visible = False
    end
    object qryDetFLGOBRIGARESERVA: TStringField
      FieldName = 'FLGOBRIGARESERVA'
      Visible = False
      Size = 1
    end
    object qryDetNUMRESERVAOLD: TFloatField
      FieldName = 'NUMRESERVAOLD'
      Visible = False
    end
    object qryDetVALORRESERVAOLD: TFloatField
      FieldName = 'VALORRESERVAOLD'
      Visible = False
    end
    object qryDetVLRRESORCAMEN: TFloatField
      FieldName = 'VLRRESORCAMEN'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIODOCUM'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDRESERVAORCAMEN = :IDRESERVAORCAMEN,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  MOECODIGO = :MOECODIGO,'
      '  VALOR = :VALOR,'
      '  VALOROUTRAMOEDA = :VALOROUTRAMOEDA,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDRATEIODOCUM = :IDRATEIODOCUM,'
      '  PLANO = :PLANO,'
      '  IDPATRO = :IDPATRO,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  NUMIMOVEL = :NUMIMOVEL'
      'where'
      '  IDRATEIODOCUM = :OLD_IDRATEIODOCUM')
    InsertSQL.Strings = (
      'insert into RATEIODOCUM'
      
        '  (CODDOCUMENTO, CODTIPRECDES, RECPAG, IDPESSOA, IDRESERVAORCAME' +
        'N, CODCENTRORESPON, '
      
        '   UNIDNEGOC, MOECODIGO, VALOR, VALOROUTRAMOEDA, IDUSUARIOINCLUS' +
        'AO, CODCENTROCUSTO, '
      '   IDRATEIODOCUM, PLANO, IDPATRO, IDPROGRAMA, NUMIMOVEL)'
      'values'
      
        '  (:CODDOCUMENTO, :CODTIPRECDES, :RECPAG, :IDPESSOA, :IDRESERVAO' +
        'RCAMEN, '
      
        '   :CODCENTRORESPON, :UNIDNEGOC, :MOECODIGO, :VALOR, :VALOROUTRA' +
        'MOEDA, '
      
        '   :IDUSUARIOINCLUSAO, :CODCENTROCUSTO, :IDRATEIODOCUM, :PLANO, ' +
        ':IDPATRO, '
      '   :IDPROGRAMA, :NUMIMOVEL)')
    DeleteSQL.Strings = (
      'delete from RATEIODOCUM'
      'where'
      '  IDRATEIODOCUM = :OLD_IDRATEIODOCUM')
    Left = 65
    Top = 291
  end
  object qryAuxFuncao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 623
    Top = 662
  end
  object qryParamGlobal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 855
    Top = 553
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 432
    Top = 348
  end
  object qryLancamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' L.CODDOCUMENTO, L.NUMLANCTO, L.CODALTERADOR, L.PLNCODIGO,'
      ' L.DATALANCTO, L.VALOR, L.VALOROUTRAMOEDA, L.DEBCRE, L.OPERACAO,'
      
        ' L.HISTORICOCOMPL, L.IDUSUARIOINCLUSAO, L.ESTORNO, R.CODDOCUMENT' +
        'O,'
      
        ' R.NUMLANCTO, R.IDUSUARIOINCLUSAO, R.CODLANCFINANC, R.CODPORTFOR' +
        'MA,'
      ' R.NUMLOTE, R.NUMCHQBORDERO, R.DATACFLOAT'
      'FROM'
      ' LANCTODOCUM L, RECBTOPAGTO R'
      'WHERE'
      ' (L.CODDOCUMENTO = :CODDOCUMENTO) AND'
      ' (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND'
      ' (R.NUMLANCTO(+) = L.NUMLANCTO)'
      'ORDER BY'
      ' L.DATALANCTO')
    ValidateWithMask = True
    Left = 752
    Top = 529
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryLancamentoNUMLANCTO: TFloatField
      DisplayLabel = 'Lançamento'
      DisplayWidth = 10
      FieldName = 'NUMLANCTO'
    end
    object qryLancamentoOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Size = 2
    end
    object qryLancamentoDATALANCTO: TDateTimeField
      DisplayLabel = 'Data Lançamento'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryLancamentoVALOR: TFloatField
      DisplayLabel = 'Valor Moeda Corrente'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoVALOROUTRAMOEDA: TFloatField
      DisplayLabel = 'Valor Outra Moeda'
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Size = 1
    end
    object qryLancamentoHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryLancamentoESTORNO: TFloatField
      DisplayLabel = 'Estorno'
      DisplayWidth = 10
      FieldName = 'ESTORNO'
    end
    object qryLancamentoCODLANCFINANC: TFloatField
      DisplayLabel = 'Lançamento Financeiro'
      DisplayWidth = 10
      FieldName = 'CODLANCFINANC'
    end
    object qryLancamentoCODPORTFORMA: TFloatField
      DisplayLabel = 'Forma de Recto/Pagto'
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
    end
    object qryLancamentoNUMLOTE: TFloatField
      DisplayLabel = 'Número do Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
    end
    object qryLancamentoPLNCODIGO: TFloatField
      DisplayLabel = 'Código Contábil'
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
    end
    object qryLancamentoNUMCHQBORDERO: TStringField
      DisplayLabel = 'Cheque/Borderô'
      DisplayWidth = 15
      FieldName = 'NUMCHQBORDERO'
      Size = 15
    end
    object qryLancamentoDATACFLOAT: TDateTimeField
      DisplayLabel = 'Data com Float'
      DisplayWidth = 10
      FieldName = 'DATACFLOAT'
    end
    object qryLancamentoCODALTERADOR: TFloatField
      DisplayLabel = 'Alterador'
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
    end
    object qryLancamentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryLancamentoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Visible = False
    end
    object qryLancamentoCODDOCUMENTO_1: TFloatField
      FieldName = 'CODDOCUMENTO_1'
      Visible = False
    end
    object qryLancamentoNUMLANCTO_1: TFloatField
      FieldName = 'NUMLANCTO_1'
      Visible = False
    end
    object qryLancamentoIDUSUARIOINCLUSAO_1: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO_1'
      Visible = False
    end
  end
  object dsLancamento: TwwDataSource
    DataSet = qryLancamento
    OnDataChange = dsLancamentoDataChange
    Left = 752
    Top = 494
  end
  object QryCotMoeda: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 667
    Top = 662
  end
  object qryAlt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  CODALTERADOR,DESCRICAO,ACRESDECRES,CONVERTE,PLANO,PLACONTA,COD' +
        'CENTROCUSTO'
      'FROM'
      '  TIPOALTERADOR'
      'WHERE'
      '  RECPAG = :RECPAG  AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 563
    Top = 608
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAltCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
    end
    object qryAltDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOALTERADOR.DESCRICAO'
      Size = 35
    end
    object qryAltACRESDECRES: TStringField
      FieldName = 'ACRESDECRES'
      Origin = 'TIPOALTERADOR.ACRESDECRES'
      Size = 1
    end
    object qryAltCONVERTE: TStringField
      FieldName = 'CONVERTE'
      Origin = 'TIPOALTERADOR.CONVERTE'
      Size = 1
    end
    object qryAltPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPOALTERADOR.PLANO'
    end
    object qryAltPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPOALTERADOR.PLACONTA'
      Size = 18
    end
    object qryAltCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'TIPOALTERADOR.CODCENTROCUSTO'
      Size = 10
    end
  end
  object QryAuxAlteradores: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 711
    Top = 662
  end
  object QryTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 800
    Top = 662
  end
  object qryFormaPag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :PRECPAG) AND'
      '               (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 312
    Top = 340
    ParamData = <
      item
        DataType = ftString
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object qryFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qrySubContaForCli: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT * FROM SUBCONTA')
    ValidateWithMask = True
    Left = 439
    Top = 608
    object qrySubContaForCliCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
    object qrySubContaForCliNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CODCENTROCUSTO,NOME, STATUSGRUPOCDC, IDPROGRAMA FROM CENT' +
        'CUST WHERE 1=2')
    ValidateWithMask = True
    Left = 168
    Top = 340
    object qryCentroCustoCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
    object qryCentroCustoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentroCustoSTATUSGRUPOCDC: TStringField
      FieldName = 'STATUSGRUPOCDC'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 1
    end
    object qryCentroCustoIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'CENTCUST.IDPROGRAMA'
    end
  end
  object qryBuscaCalcImposto: TwwQuery
    ValidateWithMask = True
    Left = 168
    Top = 293
  end
  object qryValida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PLACONTA'
      'FROM'
      '  TIPORDXCCXCONTA'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  RTRIM(CODCENTROCUSTO) = :CODCENTROCUSTO AND'
      '  IDEMPRESA = :IDEMPRESA AND'
      '  IDPROGRAMA = :IDPROGRAMA')
    ValidateWithMask = True
    Left = 584
    Top = 313
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCENTROCUSTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPROGRAMA'
        ParamType = ptUnknown
      end>
    object qryValidaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Size = 18
    end
  end
  object ImlDocs: TImageList
    Left = 589
    Top = 1
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F001F001F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F001F00
      1F001F001F001F001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F000000
      00001F00000000001F001F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F00000000000000000000000000000000000000000000001F001F000000
      00001F00000000001F001F000000000000000000000000000000000000000000
      000000001F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F001F00
      1F00000000000000000000000000000000000000000000000000000000000000
      00001F00000000001F001F000000000000000000000000400040004000400040
      1F001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000001F000000000000000000000000000000000000000000000000000000
      1F001F001F001F001F00000000000000000000000040007C007C007C007C007C
      0040000000001F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001F00
      1F001F000000000000000000000000000000000000000000000000001F001F00
      1F001F001F00000000000000000000000000007C007C007C007C007C007C007C
      007C00401F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001F000000000000000000000000000000000000001F001F000000
      00001F000000000000000000000000000000007C007C00000000007C00000000
      007C0040000000001F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F001F001F0000000000000000000000000000000000000000001F001F000000
      00001F00000000001F001F00000000000000007C007C007C000000000000007C
      007C00401F001F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001F001F000000
      00001F00000000001F001F00000000000000007C007C007C000000000000007C
      007C004000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001F001F00
      1F001F001F001F001F000000000000000000007C007C00000000007C00000000
      007C004000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1F001F001F000000000000000000000000000000007C007C007C007C007C007C
      0040000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F00000000000000000000000000000000000000007C007C007C007C007C
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001F0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000010041410000000043C2314600600000
      308C3C1E0040000033BC100401C000000FD8100407E000003F5000001FA00000
      38E80000007000003FAC100400D00000FC777007003800003FD81004166C0000
      1E3C00000C1E00001FFC1004187E00003FFC10041678000033CC3C1E00E00000
      4102314600000000010041410000000000000000000000000000000000000000
      000000000000}
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 584
    Top = 364
    object qryPlanoPrevNOME: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
      Visible = False
    end
  end
  object qryPatroPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PATRO.IDPESSOA, PESSOA.NOME FROM  PESSOA, PATRO'
      'WHERE PESSOA.IDPESSOA = PATRO.IDPESSOA ORDER BY PESSOA.NOME')
    ValidateWithMask = True
    Left = 504
    Top = 390
    object qryPatroPrevNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPatroPrevIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PATRO.IDPESSOA'
      Visible = False
    end
  end
  object qryProgramaPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDPROGRAMA, CODPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER' +
        ' BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 520
    Top = 294
    object qryProgramaPrevDESCPROGRAMA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = '"CM.PROGRAMA".DESCPROGRAMA'
      Size = 60
    end
    object qryProgramaPrevCODPROGRAMA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 2
      FieldName = 'CODPROGRAMA'
      Origin = '"CM.PROGRAMA".CODPROGRAMA'
      Size = 2
    end
    object qryProgramaPrevIDPROGRAMA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROGRAMA'
      Origin = '"CM.PROGRAMA".IDPROGRAMA'
      Visible = False
    end
  end
  object qryRateioOrcamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  ((VALOR * :VALDIFERENCA / :VALADIANTO)) AS VALORRESERVA,'
      '  IDRESERVAORCAMEN '
      'FROM '
      '  RATEIODOCUM '
      'WHERE '
      '  CODDOCUMENTO = :CODDOCUMENTO AND '
      '  IDRESERVAORCAMEN IS NOT NULL')
    ValidateWithMask = True
    Left = 416
    Top = 297
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALDIFERENCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALADIANTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryRateioOrcamentoVALORRESERVA: TFloatField
      FieldName = 'VALORRESERVA'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryRateioOrcamentoIDRESERVAORCAMEN: TFloatField
      FieldName = 'IDRESERVAORCAMEN'
      Origin = 'RATEIODOCUM.IDRESERVAORCAMEN'
    end
  end
  object qryUpdOrcamem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RESERVAORCAMEN'
      'SET VLRDEVOLVIDO = :VALOR,'
      '    VLRCOMPROMISSO = VLRCOMPROMISSO - :VALOR'
      'WHERE IDRESERVAORCAMEN = :ID')
    ValidateWithMask = True
    Left = 392
    Top = 390
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object updAlteradores: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCTODOCUM'
      'set'
      '  DEBCRE = :DEBCRE'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into LANCTODOCUM'
      '  (DEBCRE)'
      'values'
      '  (:DEBCRE)')
    DeleteSQL.Strings = (
      'delete from LANCTODOCUM'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 97
    Top = 386
  end
  object qryAlteradores: TwwQuery
    CachedUpdates = True
    AfterInsert = qryAlteradoresAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.DESCRICAO, LC.DATALANCTO, LC.VALOROUTRAMOEDA,'
      '  LC.VALOR, LC.HISTORICOCOMPL, LC.DEBCRE,'
      '  LC.VLRLIQUIDO, LC.UNIDNEGOC, LC.IDPESSOA,'
      '  U.NOME, A.CODALTERADOR, ('#39'S'#39') AS CONTABILIZA'
      'FROM'
      '  LANCTODOCUM LC, TIPOALTERADOR A, UNIDNEGOCIO U'
      'WHERE'
      '  (1=2)')
    UpdateObject = updAlteradores
    ControlType.Strings = (
      'CONTABILIZA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 98
    Top = 373
    object qryAlteradoresDESCRICAO: TStringField
      DisplayLabel = 'Alterador'
      DisplayWidth = 17
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryAlteradoresDATALANCTO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANCTO'
    end
    object qryAlteradoresVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryAlteradoresVALOROUTRAMOEDA: TFloatField
      DisplayLabel = 'Valor OM'
      DisplayWidth = 10
      FieldName = 'VALOROUTRAMOEDA'
      DisplayFormat = '#,##0.00'
    end
    object qryAlteradoresNOME: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 13
      FieldName = 'NOME'
      Size = 25
    end
    object qryAlteradoresCONTABILIZA: TStringField
      DisplayLabel = 'Contab.'
      DisplayWidth = 6
      FieldName = 'CONTABILIZA'
      Size = 1
    end
    object qryAlteradoresHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryAlteradoresDEBCRE: TStringField
      DisplayLabel = 'D/C'
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Visible = False
      Size = 1
    end
    object qryAlteradoresVLRLIQUIDO: TFloatField
      DisplayWidth = 10
      FieldName = 'VLRLIQUIDO'
      Visible = False
    end
    object qryAlteradoresUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
    object qryAlteradoresIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryAlteradoresCODALTERADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'CODALTERADOR'
      Origin = 'TIPOALTERADOR.CODALTERADOR'
      Visible = False
    end
  end
  object dsAlteradores: TwwDataSource
    AutoEdit = False
    DataSet = qryAlteradores
    Left = 98
    Top = 361
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      
        '(RESERVAORCAMEN.VLRRESERVA - RESERVAORCAMEN.VLRCOMPROMISSO) AS V' +
        'ALOR'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'RESERVAORCAMEN.OBSRESERVA')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período'
      'Nome da Conta'
      'Número da Conta'
      'Observação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA'
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESCOMP = '#39'C'#39
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'CONTASORCAMEN.IDCONTAORCAMEN = RESERVAORCAMEN.IDCONTAORCAMEN')
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
      '10'
      '10'
      '10'
      '10'
      '10'
      '50'
      '20'
      '70')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 758
    Top = 662
  end
end
