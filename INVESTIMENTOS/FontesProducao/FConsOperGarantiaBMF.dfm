inherited FrmConsGarantiaBMF: TFrmConsGarantiaBMF
  Left = -10
  Top = 67
  HelpContext = 790500
  Caption = 'Consulta'
  ClientHeight = 463
  ClientWidth = 804
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 804
    Height = 424
    inherited bvlSepTit: TBevel
      Width = 802
    end
    inherited pnlTitulo: TPanel
      Width = 802
      inherited lbNomDescricao: TfcLabel
        Width = 329
        Caption = 'Operações de Garantia de BM&&F'
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 45
      Width = 802
      Height = 48
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 18
        Top = 2
        Width = 46
        Height = 13
        Caption = 'Período'
      end
      object Label2: TLabel
        Left = 143
        Top = 26
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object lblInvestimento: TLabel
        Left = 551
        Top = 2
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblTipoInvest: TLabel
        Left = 289
        Top = 2
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 551
        Top = 18
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
        DataField = 'IDINVESTIMENTO'
        DataSource = ds
        LookupTable = QryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkFundoInvest: TwwDBLookupCombo
        Left = 551
        Top = 18
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Fundo de Investimento'#9'F')
        DataField = 'IDFUNDOINVEST'
        DataSource = ds
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkCartaFianca: TwwDBLookupCombo
        Left = 551
        Top = 18
        Width = 225
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTAFIANCA'#9'60'#9'Carta de Fiança'#9'F')
        DataField = 'IDCARTAFIANCA'
        DataSource = ds
        LookupTable = QryCartaFianca
        LookupField = 'IDCARTAFIANCA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dtDataInicio: TCMDateTimePicker
        Left = 18
        Top = 18
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
      object dtDataFim: TCMDateTimePicker
        Left = 157
        Top = 18
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
      object dblkTipoInvest: TwwDBLookupCombo
        Left = 281
        Top = 18
        Width = 264
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'60'#9'Tipo de Investimento'#9'F')
        DataField = 'IDTIPOINVEST'
        DataSource = ds
        LookupTable = QryTipoInvest
        LookupField = 'IDTIPOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblkTipoInvestChange
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 93
      Width = 802
      Height = 330
      Align = alClient
      Caption = 'Panel2'
      TabOrder = 2
      object dbgOperacoes: TwwDBGrid
        Left = 1
        Top = 26
        Width = 800
        Height = 303
        Selected.Strings = (
          'DATAOPERACAO'#9'12'#9'Data'#9'F'
          'DESCINVESTIMENTO'#9'32'#9'Investimento'#9'F'
          'DESCTIPOOPERACAO'#9'34'#9'Tipo de Operacao'#9'F'
          'VLROPERACAO'#9'15'#9'Valor'#9'F'
          'SLDVLROPERACAO'#9'14'#9'Saldo de Valor'#9'F'
          'QTDOPERACAO'#9'14'#9'Quantidade'#9'F'
          'SLDQTDOPERACAO'#9'17'#9'Saldo de Quantidade'#9'F'
          'DESCTIPOINVEST'#9'33'#9'Tipo de Investimento'#9'F'
          'DATAVENCTO'#9'18'#9'Vencimento'#9'F'
          'VLRCARTAFIANCA'#9'10'#9'Valor Carta Fianca'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
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
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 800
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Operações'
        Color = clNavy
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 804
    inherited tb97Fundo: TToolbar97
      Left = 632
      DockPos = 651
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 379
      DockPos = 398
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 387
    Top = 3
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object QryFundoInvest: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDFUNDOINVEST,DESCFUNDOINVEST'
      'FROM'
      '   FUNDOINVEST'
      'ORDER BY IDFUNDOINVEST')
    ValidateWithMask = True
    Left = 98
    Top = 230
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDINVESTIMENTO,DESCINVESTIMENTO'
      'FROM'
      '   INVESTIMENTO'
      'WHERE'
      '   (IDTIPOINVEST = :IDTIPOINVEST)'
      'ORDER BY IDINVESTIMENTO '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 658
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryCartaFianca: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCARTAFIANCA,DESCCARTAFIANCA'
      'FROM'
      '   CARTAFIANCA'
      'ORDER BY DESCCARTAFIANCA')
    ValidateWithMask = True
    Left = 186
    Top = 230
    object QryCartaFiancaIDCARTAFIANCA: TFloatField
      FieldName = 'IDCARTAFIANCA'
      Origin = 'CARTAFIANCA.IDCARTAFIANCA'
    end
    object QryCartaFiancaDESCCARTAFIANCA: TStringField
      FieldName = 'DESCCARTAFIANCA'
      Origin = 'CARTAFIANCA.DESCCARTAFIANCA'
      Size = 60
    end
  end
  object QryTipoInvest: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST,DESCTIPOINVEST'
      'FROM'
      '   TIPOINVEST'
      'WHERE IDTIPOINVEST NOT IN(1,2,3,4,5,6,7,8)'
      'ORDER BY DESCTIPOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 505
    Top = 59
    object QryTipoInvestDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Origin = 'TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object QryTipoInvestIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qry: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OP.IDOPERGARANTIABMF,'
      '   OP.IDCARTAFIANCA,'
      '   OP.IDFUNDOINVEST,'
      '   OP.IDINVESTIMENTO,'
      '   OP.IDTIPOINVEST,'
      '   OP.IDTIPOOPERACAO,'
      '   OP.DATAOPERACAO,'
      '   OP.VLROPERACAO,'
      '   OP.QTDOPERACAO,'
      '   OP.SLDVLROPERACAO,'
      '   OP.SLDQTDOPERACAO,'
      '   OP.DESCINVESTIMENTO,'
      '   TP.DESCTIPOOPERACAO,'
      '   TI.DESCTIPOINVEST,'
      '   CA.DATAVENCTO,'
      '   CA.VLRCARTAFIANCA'
      'FROM'
      '   OPERGARANTIABMF OP,'
      '   TIPOOPERACAO TP,'
      '   TIPOINVEST TI,'
      '   CARTAFIANCA CA'
      'WHERE'
      
        '   (OP.DATAOPERACAO BETWEEN TO_DATE(:dDataIni,'#39'DD/MM/YYYY'#39') AND ' +
        'TO_DATE(:dDataFim,'#39'DD/MM/YYYY'#39')) AND'
      
        '   (((:IDTIPOINVEST IS NOT NULL)   AND (OP.IDTIPOINVEST = :IDTIP' +
        'OINVEST))     OR (:IDTIPOINVEST IS NULL)) AND'
      
        '   (((:IDINVESTIMENTO IS NOT NULL) AND (OP.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO)) OR (:IDINVESTIMENTO IS NULL)) AND'
      
        '   (((:IDFUNDOINVEST IS NOT NULL)  AND (OP.IDFUNDOINVEST = :IDFU' +
        'NDOINVEST))   OR (:IDFUNDOINVEST IS NULL)) AND'
      
        '   (((:IDCARTAFIANCA IS NOT NULL)  AND (OP.IDCARTAFIANCA = :IDCA' +
        'RTAFIANCA))   OR (:IDCARTAFIANCA IS NULL)) AND'
      '   (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) AND'
      '   (OP.IDTIPOINVEST = TI.IDTIPOINVEST) AND'
      '   (OP.IDCARTAFIANCA = CA.IDCARTAFIANCA)'
      'ORDER BY OP.IDGARANTIA,OP.IDOPERGARANTIABMF, OP.DATAOPERACAO'
      ' ')
    ValidateWithMask = True
    Left = 122
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataFim'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTAFIANCA'
        ParamType = ptUnknown
      end>
    object qryDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERGARANTIABMF.DATAOPERACAO'
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 32
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'OPERGARANTIABMF.DESCINVESTIMENTO'
      Size = 60
    end
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operacao'
      DisplayWidth = 34
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryVLROPERACAO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VLROPERACAO'
      Origin = 'OPERGARANTIABMF.VLROPERACAO'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object qrySLDVLROPERACAO: TFloatField
      DisplayLabel = 'Saldo de Valor'
      DisplayWidth = 14
      FieldName = 'SLDVLROPERACAO'
      Origin = 'OPERGARANTIABMF.SLDVLROPERACAO'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object qryQTDOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 14
      FieldName = 'QTDOPERACAO'
      Origin = 'OPERGARANTIABMF.QTDOPERACAO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qrySLDQTDOPERACAO: TFloatField
      DisplayLabel = 'Saldo de Quantidade'
      DisplayWidth = 17
      FieldName = 'SLDQTDOPERACAO'
      Origin = 'OPERGARANTIABMF.SLDQTDOPERACAO'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 33
      FieldName = 'DESCTIPOINVEST'
      Origin = 'TIPOINVEST.DESCTIPOINVEST'
      Size = 60
    end
    object qryDATAVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCTO'
    end
    object qryVLRCARTAFIANCA: TFloatField
      DisplayLabel = 'Valor Carta Fianca'
      DisplayWidth = 10
      FieldName = 'VLRCARTAFIANCA'
      DisplayFormat = '###,###,###,###,###.00'
    end
    object qryIDCARTAFIANCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTAFIANCA'
      Visible = False
    end
    object qryIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryIDOPERGARANTIABMF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERGARANTIABMF'
      Origin = 'OPERGARANTIABMF.IDOPERGARANTIABMF'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'OPERGARANTIABMF.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'OPERGARANTIABMF.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 158
    Top = 168
  end
end
