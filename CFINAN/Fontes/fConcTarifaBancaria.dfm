inherited frmConcTarifaBancaria: TfrmConcTarifaBancaria
  Left = 443
  Top = 44
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Conciliação de Tarifas Bancárias'
  ClientHeight = 594
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 555
    object pnlControles: TPanel
      Left = 1
      Top = 1
      Width = 632
      Height = 62
      Align = alTop
      TabOrder = 0
      object lblDataMovimentacao: TLabel
        Left = 353
        Top = 4
        Width = 114
        Height = 13
        Caption = 'Data Movimentação'
      end
      object lblConvenioBancario: TLabel
        Left = 6
        Top = 4
        Width = 108
        Height = 13
        Caption = 'Convênio Bancário'
      end
      object dtpDataMovimentacao: TCMDateTimePicker
        Left = 355
        Top = 19
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
      object lkpConvenioBancario: TwwDBLookupCombo
        Left = 6
        Top = 20
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F'
          'TIPOCONV'#9'9'#9'Tipo'#9'F')
        LookupTable = cdsPortadorForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        DropDownWidth = 20
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnExit = lkpConvenioBancarioExit
      end
      object btnLocalizar: TBitBtn
        Left = 503
        Top = 11
        Width = 121
        Height = 30
        Caption = 'Localizar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnLocalizarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000C6C3C6C6C3C6
          C6C3C6C0C0C08000008000008000008000008000008000008000008000008000
          00C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6800000C6C3C6800000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000800000800000C0C0C0C6C3C6C6C3C6
          C6C3C6C6C3C6800000C6C3C6800000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000
          00FFFFFF800000800000C0C0C0C0C0C0C0C0C0C0C0C0800000C0C0C0800000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000FFFFFF800000FFFFFFC0C0C0C0C0C0
          00FFFFC0C0C08000008000008000008000008000008000008000008000008000
          00FFFFFF800000FFFFFFC0C0C0C0C0C000FFFF00FFFF800000FFFFFF80000000
          FFFF00FFFF00FFFF00FFFF00FFFF800000FFFFFF800000FFFFFFC0C0C0C0C0C0
          00FFFF00FFFF8000008000008000008000008000008000008000008000008000
          00800000800000FFFFFFC0C0C0C0C0C000FFFF00FFFF00FFFF00FFFF800000FF
          FFFF80000000FFFF00FFFF00FFFF00FFFF00FFFF800000FFFFFFC0C0C0C0C0C0
          00FFFF00FFFFC0C0C0C0C0C08000008000008000008000008000008000008000
          00800000800000800000C0C0C0C0C0C000FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF800000FFFFFF80000000FFFF00FFFF00FFFF00FFFF00FFFF808000808000
          00FFFF00FFFFC0C0C0C0C0C0C0C0C000FFFF8000008000008000008000008000
          0080000080000080000080800080800080800000FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFFC0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6800000808000
          80800080800000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFC6C3C6C6C3
          C6C6C3C6C6C3C6C6C3C6FF0000800000808000808000808000C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6FF0000FF0000
          800000808000808000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3
          C6C6C3C6C6C3C6C6C3C6FF0000FF0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C6C3C6C6C3C6C6C3C6C6C3C6C6C3C6}
      end
      object chkArqRetorno: TCheckBox
        Left = 254
        Top = 43
        Width = 204
        Height = 17
        Caption = 'Associar Arquivo de Retorno'
        TabOrder = 3
        Visible = False
      end
      object chkAssocMovimFinanc: TCheckBox
        Left = 6
        Top = 43
        Width = 241
        Height = 17
        Caption = 'Associar a um Movimento Financeiro'
        TabOrder = 2
        OnClick = chkAssocMovimFinancClick
      end
    end
    object pnlTarifaBanc: TPanel
      Left = 1
      Top = 63
      Width = 632
      Height = 135
      Align = alTop
      TabOrder = 1
      object grdTarifaBancaria: TwwDBGrid
        Left = 1
        Top = 1
        Width = 630
        Height = 133
        ControlType.Strings = (
          'SEL;CheckBox;1;0')
        Selected.Strings = (
          'SEL'#9'2'#9'  '#9'F'
          'NODOCUMENTO'#9'12'#9'Documento'#9'F'
          'RAZAOSOCIAL'#9'30'#9'Razão Social'#9'F'
          'VALOR'#9'12'#9'Valor (R$)'#9'F'
          'VLRTARIFA'#9'12'#9'Tarifa (R$)'#9'F'
          'FORMARECPAG'#9'30'#9'Forma Liq.'#9'F'
          'NSA'#9'7'#9'NSA'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsTarifaBancaria
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
        OnFieldChanged = grdTarifaBancariaFieldChanged
      end
    end
    object pnlMovimFinanc: TPanel
      Left = 1
      Top = 198
      Width = 632
      Height = 314
      Align = alTop
      TabOrder = 2
      object lblData: TLabel
        Left = 313
        Top = 41
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object lblValor: TLabel
        Left = 6
        Top = 79
        Width = 124
        Height = 13
        Caption = 'Valor Moeda Corrente'
      end
      object lblDocumento: TLabel
        Left = 154
        Top = 79
        Width = 130
        Height = 13
        Caption = 'Número do Documento'
      end
      object lblHistPadrao: TLabel
        Left = 313
        Top = 118
        Width = 95
        Height = 13
        Caption = 'Histórico Padrão'
      end
      object lblHistorico: TLabel
        Left = 6
        Top = 155
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object lblUnidNegoc: TLabel
        Left = 313
        Top = 234
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object lblCentroRespon: TLabel
        Left = 6
        Top = 192
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lbl1: TLabel
        Left = 313
        Top = 78
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object lblTipoRD: TLabel
        Left = 6
        Top = 117
        Width = 116
        Height = 13
        Caption = 'Tipo de Desembolso'
      end
      object lbl2: TLabel
        Left = 313
        Top = 192
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object lblCaixaBanco: TLabel
        Left = 6
        Top = 41
        Width = 133
        Height = 13
        Caption = 'Conta Bancária / Caixa'
      end
      object lbl3: TLabel
        Left = 314
        Top = 271
        Width = 54
        Height = 13
        Caption = 'Programa'
      end
      object lblDataDisponib: TLabel
        Left = 446
        Top = 41
        Width = 118
        Height = 13
        Caption = 'Data Disponibilidade'
      end
      object dtpDataLancamento: TCMDateTimePicker
        Left = 315
        Top = 57
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
        OnExit = dtpDataLancamentoExit
      end
      object dbEdtNumDocumento: TwwDBEdit
        Left = 154
        Top = 93
        Width = 140
        Height = 21
        DataField = 'NUMCHQBORDERO'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object lkpHistPadrao: TwwDBLookupCombo
        Left = 313
        Top = 132
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'HISTPADFINAN'
        DataSource = ds
        LookupTable = cdsHistPadrao
        LookupField = 'HISTPADFINAN'
        Style = csDropDownList
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dbEdtHistorico: TwwDBEdit
        Left = 6
        Top = 169
        Width = 596
        Height = 21
        DataField = 'HISTORICO'
        DataSource = ds
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object pnlTitMovimFinanc: TPanel
        Left = 1
        Top = 1
        Width = 630
        Height = 32
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Movimentação Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
      end
      object lkpAtividade: TwwDBLookupCombo
        Left = 313
        Top = 246
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'NOME')
        DataField = 'UNIDNEGOC'
        DataSource = dsDet
        LookupTable = cdsUnidNeg
        LookupField = 'UNIDNEGOC'
        Style = csDropDownList
        TabOrder = 12
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object lkpCentroRespon: TwwDBLookupCombo
        Left = 6
        Top = 206
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'#9'F'
          'CODEXTERNO'#9'10'#9'Código'#9'F')
        DataField = 'CODCENTRORESPON'
        DataSource = dsDet
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpTipoDocumento: TwwDBLookupCombo
        Left = 315
        Top = 92
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F'
          'CODTIPDOC'#9'10'#9'Código'#9'F')
        DataField = 'CODTIPDOC'
        DataSource = dsDet
        LookupTable = cdsTipoDoc
        LookupField = 'CODTIPDOC'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpTipoRecebDesemb: TwwDBLookupCombo
        Left = 6
        Top = 131
        Width = 292
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Tipo de Rec/Desemb'#9'F'
          'RECPAG'#9'1'#9'Tipo'#9'F'
          'CODTIPRECDES'#9'15'#9'Código'#9'F')
        DataField = 'CODTIPRECDES'
        DataSource = dsDet
        LookupTable = cdsTipoRecDes
        LookupField = 'CODTIPRECDES'
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnChange = lkpTipoRecebDesembChange
      end
      object lkpCentroCusto: TwwDBLookupCombo
        Left = 313
        Top = 206
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'#9'F'
          'CODEXTERNO'#9'10'#9'Código'#9'F')
        DataField = 'CODCENTROCUSTO'
        DataSource = dsDet
        LookupTable = cdsCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpPortadorConta: TwwDBLookupCombo
        Left = 6
        Top = 55
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODPORTADOR'
        DataSource = ds
        LookupTable = cdsPortadorConta
        LookupField = 'CODPORTADOR'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = lkpPortadorContaChange
      end
      object lkpPrograma: TwwDBLookupCombo
        Left = 313
        Top = 285
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
        DataField = 'IDPROGRAMA'
        DataSource = dsDet
        LookupTable = cdsPrograma
        LookupField = 'IDPROGRAMA'
        Style = csDropDownList
        TabOrder = 13
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dtpDataDisponib: TCMDateTimePicker
        Left = 446
        Top = 54
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
      object mContab: TCMProcuraMaskContabil
        Left = 6
        Top = 231
        Width = 296
        Height = 77
        Caption = ' Conta Contábil '
        TabOrder = 11
        MostraMensagens = True
        MostraDescricao = True
        DataSource = dsContab
        DataField = 'PLACONTA'
        Mensagens.EmBranco = 'não pode estar em branco'
        Mensagens.NaoExiste = 'não existe'
        Mensagens.Sintetica = 'não pode ser sintética'
        Mensagens.Analitica = 'não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
      end
      object edtValor: TRealEdit
        Left = 6
        Top = 93
        Width = 139
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 4
      Top = 512
      Width = 628
      Height = 42
      TabOrder = 3
      object Label15: TLabel
        Left = 11
        Top = 18
        Width = 57
        Height = 13
        Caption = 'Salvar em'
      end
      object sbPasta: TSpeedButton
        Left = 333
        Top = 15
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888880000000000888880BFBFBFBFB
          0888880FBFBFBFBF0888880BFBFBFBFB0888880FBFBFBFBF0888880BFBFBFBFB
          0888880FBFBFBFBF088888000000000088888880FBFB08888888888700007888
          8888888888888888888888888888888888888888888888888888}
        OnClick = sbPastaClick
      end
      object edPasta: TEdit
        Left = 77
        Top = 15
        Width = 255
        Height = 21
        TabOrder = 0
      end
      object bbtnImprime: TBitBtn
        Left = 376
        Top = 15
        Width = 91
        Height = 26
        Caption = '&Relatório'
        TabOrder = 1
        TabStop = False
        Visible = False
        OnClick = bbtnImprimeClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        Spacing = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 555
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 579
    Top = 233
    TargetsData = (
      1
      5
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Title'
        0))
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 200
    Top = 342
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 587
    Top = 107
  end
  object ds: TDataSource
    DataSet = cds
    Left = 587
    Top = 154
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 544
    Top = 296
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 332
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 494
    Top = 332
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 244
    Top = 366
  end
  object cdsHistPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 318
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 216
    Top = 236
  end
  object cdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 297
    Top = 65
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      ''
      
        ' SELECT 1 AS SEL,                                               ' +
        '                                '
      
        '                 NVL(AP.IDARQUIVOPAGTO, 0) AS IDARQUIVOPAGTO,   ' +
        '                                         '
      
        '                 CAST(LPAD(NVL(AP.NSA, 0), 6, 0) AS VARCHAR2(6))' +
        ' AS NSA,                                              '
      
        '                 PE.RAZAOSOCIAL,                                ' +
        '                                         '
      
        '                 DO.NODOCUMENTO,                                ' +
        '                                         '
      '                 DO.CODDOCUMENTO,'
      '               LD.VALOR,'
      '                 DO.CODFORMA AS CODFORMA,'
      '                 TB.DESCRICAO AS FORMARECPAG,'
      '            TB.VALOR AS VLRTARIFA,'
      '                 2 AS TIPO_TARIFA'
      '            FROM CM.MOVIMFINANC MF'
      
        '            JOIN CM.RECBTOPAGTO RP ON RP.CODLANCFINANC = MF.CODL' +
        'ANCFINANC'
      
        '            JOIN CM.DOCUMENTO DO ON DO.CODDOCUMENTO = RP.CODDOCU' +
        'MENTO'
      '            JOIN CM.PESSOA PE ON PE.IDPESSOA = DO.IDFORCLI'
      
        '            JOIN CM.LANCTODOCUM LD ON LD.CODDOCUMENTO = DO.CODDO' +
        'CUMENTO AND LD.NUMLANCTO = RP.NUMLANCTO'
      
        '            JOIN CM.TARIFABANCARIA TB ON TB.CODPORTFORMA = DO.CO' +
        'DPORTFORMA'
      
        '             AND ((DO.CODFORMA IS NOT NULL AND TB.CODFORMA = DO.' +
        'CODFORMA) OR (TB.CODFORMA IS NULL))'
      
        '            LEFT JOIN CM.ARQUIVOXDOCUM AD ON AD.ID_DOC_CODBARRAS' +
        '_PESSOAS = DO.CODDOCUMENTO'
      
        '            LEFT JOIN CM.ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = ' +
        'AD.IDARQUIVOPAGTO'
      '           WHERE MF.CODLANCFINANC =  -1'
      '           ORDER BY DO.NODOCUMENTO')
    ClientDataSet = cdsTarifaBancaria
    Left = 53
    Top = 205
  end
  object cdsTarifaBancaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 55
    Top = 107
    object cdsTarifaBancariaSEL: TFloatField
      FieldName = 'SEL'
    end
    object cdsTarifaBancariaIDARQUIVOPAGTO: TFloatField
      FieldName = 'IDARQUIVOPAGTO'
    end
    object cdsTarifaBancariaNSA: TStringField
      FieldName = 'NSA'
      Size = 6
    end
    object cdsTarifaBancariaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object cdsTarifaBancariaNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object cdsTarifaBancariaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object cdsTarifaBancariaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTarifaBancariaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
    object cdsTarifaBancariaFORMARECPAG: TStringField
      FieldName = 'FORMARECPAG'
      Size = 60
    end
    object cdsTarifaBancariaVLRTARIFA: TFloatField
      FieldName = 'VLRTARIFA'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsTarifaBancariaTIPO_TARIFA: TFloatField
      FieldName = 'TIPO_TARIFA'
    end
  end
  object dsTarifaBancaria: TDataSource
    DataSet = cdsTarifaBancaria
    Left = 55
    Top = 159
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 528
    Top = 366
  end
  object dsPortadorForma: TDataSource
    DataSet = cdsPortadorForma
    Left = 239
    Top = 75
  end
  object dsPortadorConta: TDataSource
    DataSet = cdsPortadorConta
    Left = 153
    Top = 239
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 65
  end
  object cdsDetAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 539
    Top = 121
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 487
    Top = 129
  end
  object cdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 449
    Top = 153
  end
  object dsContab: TDataSource
    DataSet = cdsContab
    Left = 365
    Top = 143
  end
  object cdsContabAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 267
    Top = 135
  end
  object cdsMovimFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 473
    Top = 85
  end
  object cdsTarifaxMovimFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 173
    Top = 155
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione um Movimento Financeiro...'
    Colunas.Strings = (
      'PORTADORCONTA.DESCRICAO'
      'MOVIMFINANC.DATALANCFINAN'
      'MOVIMFINANC.DATADISPFINANC'
      'MOVIMFINANC.VALORLANCFINAN'
      'MOVIMFINANC.ENTRADASAIDA'
      'MOVIMFINANC.STATUSCONCILIA'
      'MOVIMFINANC.NUMCHQBORDERO'
      '0 AS CODDOCUMENTO'
      'MOVIMFINANC.HISTORICO'
      'HISTORICOFINAN.DESCRICAO'
      'MOVIMFINANC.VALOROUTRAMOEDA'
      'MOVIMFINANC.CODLANCFINANC'
      'MODULO.NOMEMODULO'
      
        #39'PLANOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO' +
        'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'#39
      
        #39'PATROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO' +
        'OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'#39)
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N'
      'N'
      'C'
      'L'
      'L')
    Descricao.Strings = (
      'Banco/Caixa'
      'Data Lançamento'
      'Data Disponibilidade'
      'Valor Moeda Corrente'
      'E/S'
      'Status Conciliação'
      'Nº Baixa'
      'Cód. Documento'
      'Histórico'
      'Histórico Padrão'
      'Valor Outra Moeda'
      'Código do Lançamento'
      'Sistema de Origem'
      'Plano Prev.'
      'Patro')
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
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'MOVIMFINANC'
      'PORTADORCONTA'
      'HISTORICOFINAN'
      'MODULO')
    CamposChave.Strings = (
      'MOVIMFINANC.CODLANCFINANC')
    Filtro.Strings = (
      'PORTADORCONTA.CODPORTADOR=MOVIMFINANC.CODPORTADOR'
      'HISTORICOFINAN.HISTPADFINAN=MOVIMFINANC.HISTPADFINAN'
      'MODULO.IDMODULO=MOVIMFINANC.IDMODULO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00;(#,##0.00)'
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '18'
      '18'
      '10'
      '1'
      '1'
      '15'
      '20'
      '60'
      '60'
      '10'
      '10'
      '50'
      '100'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
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
      'SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME'
      
        'SELECT P.IDPESSOA, P.NOME FROM PATRO PT, PESSOA P WHERE PT.IDPES' +
        'SOA = P.IDPESSOA ORDER BY P.NOME'
      '')
    LookupCampoChave.Strings = (
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
      'NOME'
      'NOME'
      '')
    LookupCampoExibe.Strings = (
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
      'NOME'
      'NOME'
      '')
    Left = 170
    Top = 88
  end
  object pplRelatTarifa: TppBDEPipeline
    DataSource = dsTarifaBancaria
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lRelatTarifa'
    Left = 362
    Top = 478
    object pplRelatTarifappField1: TppField
      FieldAlias = 'SEL'
      FieldName = 'SEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField2: TppField
      FieldAlias = 'IDARQUIVOPAGTO'
      FieldName = 'IDARQUIVOPAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField3: TppField
      FieldAlias = 'NSA'
      FieldName = 'NSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField4: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField5: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField6: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField7: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField8: TppField
      FieldAlias = 'CODFORMA'
      FieldName = 'CODFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField9: TppField
      FieldAlias = 'FORMARECPAG'
      FieldName = 'FORMARECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField10: TppField
      FieldAlias = 'VLRTARIFA'
      FieldName = 'VLRTARIFA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplRelatTarifappField11: TppField
      FieldAlias = 'TIPO_TARIFA'
      FieldName = 'TIPO_TARIFA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object sdDialog: TSaveDialog
    Left = 287
    Top = 504
  end
  object rptRelatTarifa: TppReport
    AutoStop = False
    DataPipeline = pplRelatTarifa
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 
      'C:\Users\helen.bianchi\Documents\STK\ATENDER  SIG\WO10886\concTa' +
      'rifaBanc.rtm'
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 434
    Top = 482
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRelatTarifa'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'ppLine15'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 794
        mmTop = 30956
        mmWidth = 15579
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35190
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Razao Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 18521
        mmTop = 30956
        mmWidth = 17526
        BandType = 0
      end
      object ppLblTitulo2: TppLabel
        UserName = 'LblTitulo2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 73819
        mmTop = 8467
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 108215
        mmTop = 30692
        mmWidth = 20489
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tarifa Paga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 134144
        mmTop = 30692
        mmWidth = 15028
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 27517
        mmLeft = 5292
        mmTop = 0
        mmWidth = 25929
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'FUNCEF - Fundação dos Economiarios Federais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 50556
        mmTop = 1323
        mmWidth = 113750
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Conciliação de Tarifas Bancária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 73819
        mmTop = 19315
        mmWidth = 49191
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Conciliação de Tarifas Bancária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 74083
        mmTop = 14023
        mmWidth = 49191
        BandType = 0
      end
    end
    object bndDetContaCC: TppDetailBand
      BeforePrint = bndDetContaCCBeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object dbtxtCCustoCC: TppDBText
        UserName = 'dbtxtCCustoCC'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplRelatTarifa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatTarifa'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'VALOR'
        DataPipeline = pplRelatTarifa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatTarifa'
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 0
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'dbtxtCCustoCC1'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplRelatTarifa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRelatTarifa'
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 0
        mmWidth = 71967
        BandType = 4
      end
      object ppLblVlTar: TppLabel
        UserName = 'LblVlTar'
        Caption = 'LblVlTar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 130704
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        AutoSize = False
        Caption = 'Controle Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 94986
        mmTop = 1852
        mmWidth = 37835
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5292
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 36248
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = pplRelatTarifa
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRelatTarifa'
        mmHeight = 3440
        mmLeft = 91546
        mmTop = 1058
        mmWidth = 31750
        BandType = 7
      end
      object ppLblVlTotalTar: TppLabel
        UserName = 'LblVlTotalTar'
        Caption = 'LblVlTotalTar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 130779
        mmTop = 1058
        mmWidth = 17653
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
