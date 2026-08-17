inherited frmConcMovimentoBancario: TfrmConcMovimentoBancario
  Left = 439
  Top = 190
  BorderIcons = []
  Caption = 'Registro de Movimento Bancário'
  ClientHeight = 569
  ClientWidth = 634
  FormStyle = fsNormal
  Position = poMainFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 530
    object pnlControles: TPanel
      Left = 1
      Top = 1
      Width = 632
      Height = 32
      Align = alTop
      TabOrder = 0
      object pnlMovBanc: TPanel
        Left = 1
        Top = 1
        Width = 630
        Height = 32
        Align = alTop
        BevelOuter = bvLowered
        Caption = 'Movimentações Bancárias não Conciliadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlGrdMovBanc: TPanel
      Left = 1
      Top = 33
      Width = 632
      Height = 135
      Align = alTop
      TabOrder = 1
      object grdMovimentoBancario: TwwDBGrid
        Left = 1
        Top = 1
        Width = 630
        Height = 133
        ControlType.Strings = (
          'SEL;CheckBox;1;0')
        Selected.Strings = (
          'SEL'#9'2'#9'  '#9'F'
          'HISTORICO'#9'30'#9'Movimento'#9'F'
          'NUMDOCUMENTO'#9'12'#9'Documento'#9'F'
          'VALOR_T'#9'17'#9'Valor (R$)'#9'F'
          'TIPOLANCTO_T'#9'12'#9'Tipo Movimento'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsMovimBancario
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
      end
    end
    object pnlMovimFinanc: TPanel
      Left = 1
      Top = 168
      Width = 632
      Height = 361
      Align = alTop
      TabOrder = 2
      object lblData: TLabel
        Left = 161
        Top = 112
        Width = 119
        Height = 13
        Caption = 'Data do Lançamento'
      end
      object lblDocumento: TLabel
        Left = 10
        Top = 110
        Width = 130
        Height = 13
        Caption = 'Número do Documento'
      end
      object lblHistPadrao: TLabel
        Left = 447
        Top = 112
        Width = 95
        Height = 13
        Caption = 'Histórico Padrão'
      end
      object lblHistorico: TLabel
        Left = 10
        Top = 152
        Width = 142
        Height = 13
        Caption = 'Histórico do Lançamento'
      end
      object lblUnidNegoc: TLabel
        Left = 10
        Top = 277
        Width = 54
        Height = 13
        Caption = 'Atividade'
      end
      object lblCentroRespon: TLabel
        Left = 10
        Top = 236
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object lblTpDocumento: TLabel
        Left = 313
        Top = 192
        Width = 112
        Height = 13
        Caption = 'Tipo de Documento'
      end
      object lblTipoRD: TLabel
        Left = 10
        Top = 192
        Width = 196
        Height = 13
        Caption = 'Tipo de Recebimento/Desembolso'
      end
      object lblCentCusto: TLabel
        Left = 313
        Top = 236
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object lblPrograma: TLabel
        Left = 313
        Top = 277
        Width = 54
        Height = 13
        Caption = 'Programa'
      end
      object lblDataDisponib: TLabel
        Left = 313
        Top = 112
        Width = 118
        Height = 13
        Caption = 'Data Disponibilidade'
      end
      object lblCaixaBanco: TLabel
        Left = 10
        Top = 43
        Width = 133
        Height = 13
        Caption = 'Conta Bancária / Caixa'
      end
      object lblPatro: TLabel
        Left = 10
        Top = 317
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblPlanoPrev: TLabel
        Left = 313
        Top = 317
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dtpDataLancamento: TCMDateTimePicker
        Left = 161
        Top = 126
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
        TabOrder = 4
      end
      object dbEdtNumDocumento: TwwDBEdit
        Left = 10
        Top = 126
        Width = 140
        Height = 21
        DataField = 'NUMCHQBORDERO'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object lkpHistPadrao: TwwDBLookupCombo
        Left = 447
        Top = 126
        Width = 155
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'HISTPADFINAN'
        DataSource = ds
        LookupTable = cdsHistPadrao
        LookupField = 'HISTPADFINAN'
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dbEdtHistorico: TwwDBEdit
        Left = 10
        Top = 166
        Width = 590
        Height = 21
        DataField = 'HISTORICO'
        DataSource = ds
        TabOrder = 7
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
        Caption = 'Dados para Movimentação Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object lkpAtividade: TwwDBLookupCombo
        Left = 10
        Top = 290
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
        Left = 10
        Top = 250
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
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpTipoDocumento: TwwDBLookupCombo
        Left = 313
        Top = 206
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
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpTipoRecebDesemb: TwwDBLookupCombo
        Left = 10
        Top = 206
        Width = 290
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
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnChange = lkpTipoRecebDesembChange
      end
      object lkpCentroCusto: TwwDBLookupCombo
        Left = 313
        Top = 250
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
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpPrograma: TwwDBLookupCombo
        Left = 313
        Top = 290
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
        TabOrder = 14
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dtpDataDisponib: TCMDateTimePicker
        Left = 313
        Top = 126
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
        TabOrder = 5
      end
      object lkpPortadorConta: TwwDBLookupCombo
        Left = 10
        Top = 58
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
      object dbrEntradaSaida: TDBRadioGroup
        Left = 313
        Top = 45
        Width = 128
        Height = 50
        Caption = 'Tipo de Movimento'
        DataField = 'ENTRADASAIDA'
        DataSource = ds
        Items.Strings = (
          '&Entrada'
          '&Saída')
        TabOrder = 1
        Values.Strings = (
          'E'
          'S')
        OnChange = dbrEntradaSaidaChange
      end
      object dbrConcilia: TDBRadioGroup
        Left = 463
        Top = 45
        Width = 138
        Height = 50
        Caption = 'Status Conciliação'
        DataField = 'STATUSCONCILIA'
        DataSource = ds
        Items.Strings = (
          '&Conciliado'
          'Não &Identificado')
        TabOrder = 2
        Values.Strings = (
          'X'
          'I')
      end
      object lkpPatrocinadorRateio: TwwDBLookupCombo
        Left = 10
        Top = 332
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
        DataField = 'IDPATRO'
        DataSource = dsDet
        LookupTable = cdsPatrocinadora
        LookupField = 'IDPESSOA'
        TabOrder = 15
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object lkpPlanoPrevRateio: TwwDBLookupCombo
        Left = 313
        Top = 332
        Width = 290
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        DataField = 'IDPLANOPREV'
        DataSource = dsDet
        LookupTable = cdsPlanoPrev
        LookupField = 'IDPLANOPREV'
        TabOrder = 16
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 530
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
    Left = 603
    Top = 185
    TargetsData = (
      1
      3
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
        0))
  end
  object cdsUnidNeg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 406
    Top = 77
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 171
    Top = 67
  end
  object ds: TDataSource
    DataSet = cds
    Left = 171
    Top = 106
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 496
    Top = 74
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 447
    Top = 74
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 502
    Top = 116
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 449
    Top = 117
  end
  object cdsHistPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 358
    Top = 74
  end
  object cdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 17
    Top = 70
  end
  object cdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 18
    Top = 131
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      'SELECT AP.NSA, '
      '             TP.CODDOCARQ AS NUMLINHA, '
      '             (TB.VALOR * (TP.PERCENTUAL / 100)) AS VLRPREVISTO,'
      '             TP.VALOR  AS VLRREALIZADO,'
      '             TP.IDPLANOPREV,'
      '             PP.NOME AS PLANO'
      ' FROM TARIFAARQPAGTO TP'
      
        '    JOIN TARIFABANCARIA TB ON TB.IDTARIFABANCARIA = TP.IDTARIFAB' +
        'ANCARIA AND TB.CODPORTFORMA = -1 '
      
        '    JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = TP.IDARQUIVOPAGT' +
        'O'
      '    JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = TP.IDPLANOPREV'
      'WHERE TP.DATAMOVIMENTACAO  = SYSDATE'
      ' ORDER BY AP.NSA,  TP.CODDOCARQ')
    Left = 227
    Top = 61
  end
  object cdsPrograma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 552
    Top = 78
  end
  object dsPortadorForma: TDataSource
    DataSet = cdsPortadorForma
    Left = 19
    Top = 145
  end
  object dsPortadorConta: TDataSource
    DataSet = cdsPortadorConta
    Left = 17
    Top = 87
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 273
    Top = 73
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 271
    Top = 89
  end
  object cdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 313
    Top = 73
  end
  object dsContab: TDataSource
    DataSet = cdsContab
    Left = 312
    Top = 92
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
    Left = 18
    Top = 8
  end
  object cdsMovimFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 99
    Top = 81
  end
  object cdsMovimBancario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 235
    Top = 107
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 526
    Top = 124
  end
  object cdsPatrocinadora: TCMClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'Dsp'
    Left = 598
    Top = 124
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 473
    Top = 49
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 41
  end
  object dsMovimBancario: TDataSource
    DataSet = cdsMovimBancario
    Left = 171
    Top = 106
  end
  object cdsRateioFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 363
    Top = 123
  end
end
