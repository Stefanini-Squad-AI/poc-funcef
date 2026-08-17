inherited frmCadRegPenhora: TfrmCadRegPenhora
  Left = 182
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Informações Sobre Penhora'
  ClientHeight = 358
  ClientWidth = 579
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 579
    Height = 319
    BorderWidth = 2
    object Label13: TLabel
      Left = 15
      Top = 272
      Width = 118
      Height = 13
      Caption = 'Valor Desta Penhora'
    end
    object Label17: TLabel
      Left = 447
      Top = 272
      Width = 92
      Height = 13
      Caption = 'Aval. da Justiça'
    end
    object gbxInvestimento: TGroupBox
      Left = 15
      Top = 59
      Width = 550
      Height = 207
      Caption = 'Investimento Penhorado'
      TabOrder = 3
      Visible = False
      object Label10: TLabel
        Left = 161
        Top = 165
        Width = 112
        Height = 13
        Caption = 'Valor Já Penhorado'
      end
      object Label22: TLabel
        Left = 6
        Top = 16
        Width = 118
        Height = 13
        Caption = 'Plano/Patrocinadora'
      end
      object lblInvestimento: TLabel
        Left = 6
        Top = 91
        Width = 112
        Height = 13
        Caption = 'Fundo Investimento'
      end
      object Label24: TLabel
        Left = 6
        Top = 41
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object lblClasse: TLabel
        Left = 6
        Top = 66
        Width = 124
        Height = 13
        Caption = 'Classe de Renda Fixa'
        Visible = False
      end
      object lblAplicacao: TLabel
        Left = 6
        Top = 141
        Width = 113
        Height = 13
        Caption = 'Aplicação do Título'
        Visible = False
      end
      object lblCustodianteTipocota: TLabel
        Left = 6
        Top = 117
        Width = 122
        Height = 13
        Caption = 'Custodiante (opcion.)'
        Visible = False
      end
      object Label23: TLabel
        Left = 6
        Top = 165
        Width = 86
        Height = 13
        Caption = 'Valor do Título'
      end
      object Label25: TLabel
        Left = 330
        Top = 166
        Width = 113
        Height = 13
        Caption = 'Valor Livre Penhora'
      end
      object Label26: TLabel
        Left = 484
        Top = 166
        Width = 42
        Height = 13
        Caption = '% Livre'
      end
      object dblcInvestimento: TwwDBLookupCombo
        Left = 130
        Top = 87
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição do Investimento')
        DataField = 'IDINVESTIMENTO'
        DataSource = dsEtapa
        LookupTable = CdsInvestimento
        LookupField = 'IDINVESTIMENTO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcInvestimentoChange
      end
      object dblcTipocota: TwwDBLookupCombo
        Left = 130
        Top = 113
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'40'#9'Tipo de Cota')
        DataField = 'IDTIPOCOTA'
        DataSource = dsEtapa
        LookupTable = CdsTipocota
        LookupField = 'IDTIPOCOTA'
        Style = csDropDownList
        TabOrder = 11
        Visible = False
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcCustodianteChange
      end
      object dblcFundoInvestimento: TwwDBLookupCombo
        Left = 130
        Top = 87
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição do Investimento')
        DataField = 'IDFUNDOINVEST'
        DataSource = dsEtapa
        LookupTable = CdsFundoInvestimento
        LookupField = 'IDFUNDOINVEST'
        Style = csDropDownList
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcFundoInvestimentoChange
      end
      object redValorPenhorado3: TDBRealEdit
        Left = 161
        Top = 180
        Width = 122
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 6
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dblcPlanoPatro: TwwDBLookupCombo
        Left = 130
        Top = 12
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Plano/Patrocinadora')
        DataField = 'IDPLANPREVCTBPATR'
        DataSource = dsEtapa
        LookupTable = CdsPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcInvestimentoChange
      end
      object dblcTipoInvestimento: TwwDBLookupCombo
        Left = 130
        Top = 37
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'60'#9'Tipo de Investimento')
        DataField = 'IDTIPOINVEST'
        DataSource = dsEtapa
        LookupTable = CdsTipoInvestimento
        LookupField = 'IDTIPOINVEST'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcTipoInvestimentoChange
      end
      object dblcClasseRenda: TwwDBLookupCombo
        Left = 130
        Top = 62
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'60'#9'Classe de Renda Fixa')
        LookupTable = CdsClasseRenda
        LookupField = 'IDCLASSETIT'
        Style = csDropDownList
        TabOrder = 3
        Visible = False
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcClasseRendaChange
      end
      object dblcAplicacao: TwwDBLookupCombo
        Left = 130
        Top = 137
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'INVESTIMENTO'#9'30'#9'Descrição da Aplicação'
          'DATAAPLICACAO'#9'10'#9'Data Aplicação'
          'DATAVENCIMENTO'#9'10'#9'Vencimento')
        DataField = 'IDOPERRENFIXAPLIC'
        DataSource = dsEtapa
        LookupTable = CdsAplicacao
        LookupField = 'IDOPERRENFIXAPLIC'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 5
        Visible = False
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcAplicacaoChange
        OnCloseUp = dblcAplicacaoCloseUp
      end
      object dblcCustodiante: TwwDBLookupCombo
        Left = 130
        Top = 113
        Width = 416
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'20'#9'Custodiante')
        DataField = 'IDCUSTODIANTE'
        DataSource = dsEtapa
        LookupTable = CdsCustodiante
        LookupField = 'IDCUSTODIANTE'
        Style = csDropDownList
        TabOrder = 4
        Visible = False
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblcCustodianteChange
      end
      object dbredValorTitulo: TDBRealEdit
        Left = 6
        Top = 180
        Width = 122
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 7
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redValorLivre3: TDBRealEdit
        Left = 330
        Top = 179
        Width = 122
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 8
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redPercLivre3: TDBRealEdit
        Left = 484
        Top = 179
        Width = 58
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 9
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object gbxImovel: TGroupBox
      Left = 15
      Top = 59
      Width = 550
      Height = 207
      Caption = 'Imóvel Penhorado'
      TabOrder = 1
      Visible = False
      object Label5: TLabel
        Left = 14
        Top = 33
        Width = 58
        Height = 13
        Caption = 'Descrição'
        Visible = False
      end
      object Label6: TLabel
        Left = 15
        Top = 146
        Width = 101
        Height = 13
        Caption = 'Valor de Mercado'
      end
      object Label7: TLabel
        Left = 141
        Top = 146
        Width = 106
        Height = 13
        Caption = 'Data da Avaliação'
      end
      object Label8: TLabel
        Left = 249
        Top = 146
        Width = 112
        Height = 13
        Caption = 'Valor Já Penhorado'
      end
      object Label4: TLabel
        Left = 15
        Top = 69
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label14: TLabel
        Left = 158
        Top = 69
        Width = 80
        Height = 13
        Caption = 'Imóvel Mestre'
      end
      object Label15: TLabel
        Left = 15
        Top = 107
        Width = 40
        Height = 13
        Caption = 'Cidade'
      end
      object Label16: TLabel
        Left = 496
        Top = 107
        Width = 17
        Height = 13
        Caption = 'UF'
      end
      object Label18: TLabel
        Left = 364
        Top = 146
        Width = 113
        Height = 13
        Caption = 'Valor Livre Penhora'
      end
      object Label19: TLabel
        Left = 480
        Top = 146
        Width = 42
        Height = 13
        Caption = '% Livre'
      end
      object dblbImovel: TwwDBLookupCombo
        Left = 14
        Top = 47
        Width = 524
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IMONOME'#9'60'#9'Nome do Imóvel'
          'IMOCODIGO'#9'15'#9'Código do Imóvel'
          'IMOVELMESTRE'#9'60'#9'Imóvel Mestre'
          'CIDADE'#9'20'#9'Cidade'
          'UF'#9'5'#9'UF')
        DataField = 'IDIMOVEL'
        DataSource = dsEtapa
        LookupTable = CdsImovel
        LookupField = 'IDIMOVEL'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        Visible = False
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblbImovelChange
      end
      object dbredValorMercado: TDBRealEdit
        Left = 15
        Top = 160
        Width = 122
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMERCADO'
        DataSource = dsValorImovel
      end
      object dbedDataMercado: TCMDateTimePicker
        Left = 141
        Top = 160
        Width = 106
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAMERCADO'
        DataSource = dsValorImovel
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
      object redValorPenhorado: TDBRealEdit
        Left = 249
        Top = 160
        Width = 112
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbedCodImo: TwwDBEdit
        Left = 14
        Top = 83
        Width = 121
        Height = 21
        DataField = 'IMOCODIGO'
        DataSource = dsImovel
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedImoMestre: TwwDBEdit
        Left = 158
        Top = 83
        Width = 380
        Height = 21
        DataField = 'IMOVELMESTRE'
        DataSource = dsImovel
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedImoCidade: TwwDBEdit
        Left = 14
        Top = 121
        Width = 405
        Height = 21
        DataField = 'CIDADE'
        DataSource = dsImovel
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedImoUF: TwwDBEdit
        Left = 496
        Top = 121
        Width = 42
        Height = 21
        DataField = 'UF'
        DataSource = dsImovel
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object redValorLivre: TDBRealEdit
        Left = 364
        Top = 160
        Width = 112
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 8
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redPercLivre: TDBRealEdit
        Left = 480
        Top = 160
        Width = 58
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 9
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      inline molImovelDBJur: TmolImovelDB
        Left = 8
        Top = 24
        Width = 530
        TabOrder = 10
        inherited btnBuscaImovel: TBitBtn
          Left = 478
          Hint = 'Busca um Imóvel'
          ParentShowHint = False
          ShowHint = True
        end
        inherited btnLimpaImovel: TBitBtn
          Left = 502
          ParentShowHint = False
          ShowHint = True
        end
        inherited DBedtImovel: TDBEdit
          Width = 463
          DataField = 'BEMPENHORADO'
          DataSource = dsEtapa
          Enabled = True
          ReadOnly = True
        end
        inherited DBedtIDImovel: TDBEdit
          DataField = 'IDIMOVEL'
          DataSource = dsEtapa
        end
      end
    end
    object gbxBem: TGroupBox
      Left = 15
      Top = 59
      Width = 550
      Height = 207
      Caption = 'Ativo Fixo Penhorado'
      TabOrder = 2
      Visible = False
      object Label2: TLabel
        Left = 16
        Top = 137
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label9: TLabel
        Left = 245
        Top = 96
        Width = 112
        Height = 13
        Caption = 'Valor Já Penhorado'
      end
      object Label3: TLabel
        Left = 16
        Top = 94
        Width = 80
        Height = 13
        Caption = 'Valor Contábil'
      end
      object Label11: TLabel
        Left = 139
        Top = 94
        Width = 103
        Height = 13
        Caption = 'Data Reavaliação'
      end
      object Label12: TLabel
        Left = 16
        Top = 71
        Width = 171
        Height = 13
        Caption = 'Número do Patrimônio do Bem'
      end
      object Label20: TLabel
        Left = 361
        Top = 96
        Width = 113
        Height = 13
        Caption = 'Valor Livre Penhora'
      end
      object Label21: TLabel
        Left = 477
        Top = 96
        Width = 42
        Height = 13
        Caption = '% Livre'
      end
      object dblcConjunto: TwwDBLookupCombo
        Left = 16
        Top = 152
        Width = 521
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCONJUNTO'#9'60'#9'Descrição do Conjunto')
        DataField = 'IDCONJUNTO'
        DataSource = dsEtapa
        LookupTable = CdsConjunto
        LookupField = 'IDCONJUNTO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnCloseUp = dblcConjuntoCloseUp
      end
      object redValorPenhorado2: TDBRealEdit
        Left = 245
        Top = 109
        Width = 112
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbredValorContabil: TDBRealEdit
        Left = 16
        Top = 108
        Width = 122
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 2
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbedDataContabil: TCMDateTimePicker
        Left = 139
        Top = 108
        Width = 103
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
      object dbedPlaca: TwwDBEdit
        Left = 214
        Top = 67
        Width = 121
        Height = 21
        DataField = 'PLACA'
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object redValorLivre2: TDBRealEdit
        Left = 361
        Top = 109
        Width = 112
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object redPercLivre2: TDBRealEdit
        Left = 477
        Top = 109
        Width = 58
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        ReadOnly = True
        TabOrder = 6
        WordWrap = False
        IntDigits = 0
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object gbxNomeBem: TGroupBox
        Left = 16
        Top = 16
        Width = 521
        Height = 46
        Caption = 'Bem'
        TabOrder = 7
        object DBedBem: TDBEdit
          Left = 4
          Top = 16
          Width = 463
          Height = 21
          DataField = 'BEMPENHORADO'
          DataSource = dsEtapa
          ReadOnly = True
          TabOrder = 0
          OnChange = DBedBemChange
        end
        object btnBuscaBem: TBitBtn
          Left = 469
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Busca um Bem'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnBuscaBemClick
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
        object btnLimpaBem: TBitBtn
          Left = 494
          Top = 16
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Bem'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnLimpaBemClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
      end
    end
    object dbrgTipo: TDBRadioGroup
      Left = 15
      Top = 10
      Width = 550
      Height = 47
      Caption = 'Tipo de Bem Penhorado'
      Columns = 4
      DataField = 'INDPENHORA'
      DataSource = dsEtapa
      Items.Strings = (
        'Imóvel'
        'Ativo Permanente'
        'Investimento'
        'Numerário')
      TabOrder = 0
      Values.Strings = (
        '1'
        '2'
        '3'
        '4')
      OnChange = dbrgTipoChange
    end
    object dbrgIndValor: TDBRadioGroup
      Left = 173
      Top = 272
      Width = 268
      Height = 40
      Caption = 'Classificação do Valor ao Lado'
      Columns = 3
      DataField = 'INDVALOR'
      DataSource = dsEtapa
      Items.Strings = (
        'Valor'
        'Quantidade'
        'Percentual')
      TabOrder = 5
      Values.Strings = (
        '1'
        '2'
        '3')
      OnChange = dbrgIndValorChange
      OnClick = dbrgIndValorChange
    end
    object dbedValor: TDBRealEdit
      Left = 15
      Top = 286
      Width = 153
      Height = 21
      Hint = 'Informe Negativo para Desconstituição'
      Alignment = taRightJustify
      Lines.Strings = (
        '0,000000000000')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      WordWrap = False
      IntDigits = 15
      DecDigits = 12
      NumberFormat = fNumber
      Signal = True
      DataField = 'VALOR'
      DataSource = dsEtapa
    end
    object dbredValorJuiz: TDBRealEdit
      Left = 447
      Top = 286
      Width = 116
      Height = 21
      Hint = 'Avaliação da Penhora Realizada pelo Oficial de Justiça'
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
      DataField = 'VALORJUIZ'
      DataSource = dsEtapa
    end
  end
  inherited Dock971: TDock97
    Top = 319
    Width = 579
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
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
    Left = 443
    Top = 9
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object CdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 370
    Top = 17
  end
  object dsEtapa: TwwDataSource
    DataSet = CdsEtapa
    Left = 329
    Top = 17
  end
  object CdsImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 129
  end
  object CdsConjunto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 426
    Top = 129
  end
  object CdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 154
    Top = 129
  end
  object CdsValorImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 57
  end
  object dsValorImovel: TwwDataSource
    AutoEdit = False
    DataSet = CdsValorImovel
    Left = 201
    Top = 49
  end
  object dsImovel: TwwDataSource
    DataSet = CdsImovel
    Left = 344
    Top = 131
  end
  object CdsPlanoPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 73
  end
  object CdsTipoInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 97
  end
  object CdsClasseRenda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 226
    Top = 121
  end
  object CdsAplicacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 210
    Top = 193
  end
  object CdsCustodiante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 177
  end
  object CdsTipocota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 258
    Top = 177
  end
  object CdsFundoInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 490
    Top = 129
  end
  object MS_Bem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Bem'
    Colunas.Strings = (
      'B.PLACA'
      'B.DESBEM'
      'C.DESCRICAO'
      'CJ.DESCCONJUNTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Patrimônio'
      'Descrição'
      'Classe de Bem'
      'Conjunto')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BEM B'
      'CLASSEDEBEM C'
      'CONJUNTO CJ')
    CamposChave.Strings = (
      'B.IDBEM'
      'B.IDPESSOA'
      'B.DESBEM')
    Filtro.Strings = (
      'B.IDCLASSEBEM = C.IDCLASSEBEM(+)'
      'B.IDCONJUNTO = CJ.IDCONJUNTO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '200'
      '60'
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 536
    Top = 1
  end
  object CdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 370
    Top = 81
  end
  object dsBem: TwwDataSource
    DataSet = CdsBem
    Left = 417
    Top = 81
  end
end
