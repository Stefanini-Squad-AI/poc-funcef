inherited frmConsSaldoRenFix: TfrmConsSaldoRenFix
  Left = 69
  Top = 99
  HelpContext = 790528
  Caption = 'Consulta'
  ClientHeight = 599
  ClientWidth = 853
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 853
    Height = 560
    inherited bvlSepTit: TBevel
      Width = 851
    end
    object Splitter1: TSplitter [1]
      Left = 1
      Top = 332
      Width = 851
      Height = 2
      Cursor = crVSplit
      Align = alTop
      AutoSnap = False
      Beveled = True
    end
    inherited pnlTitulo: TPanel
      Width = 851
      inherited lbNomDescricao: TfcLabel
        Left = 19
        Width = 219
        Caption = 'Saldos de Renda Fixa'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 851
      Height = 127
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 5
        Top = 2
        Width = 94
        Height = 13
        Caption = 'Data Referência'
        FocusControl = dtDataRef
      end
      object Label3: TLabel
        Left = 122
        Top = 42
        Width = 73
        Height = 13
        Caption = 'Investimento'
        FocusControl = dblInvestimento
      end
      object Label4: TLabel
        Left = 465
        Top = 42
        Width = 44
        Height = 13
        Caption = 'Emissor'
        FocusControl = dblEmissor
      end
      object Label2: TLabel
        Left = 122
        Top = 2
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
        FocusControl = dblPlanPrevCtbPatr
      end
      object lblClasse: TLabel
        Left = 465
        Top = 2
        Width = 38
        Height = 13
        Caption = 'Classe'
        FocusControl = dblkClasseTit
      end
      object lblOpcao: TLabel
        Left = 123
        Top = 84
        Width = 38
        Height = 13
        Caption = 'Opção'
        FocusControl = dblEmissor
      end
      object Label5: TLabel
        Left = 239
        Top = 84
        Width = 63
        Height = 13
        Caption = 'Aplicações'
      end
      object dtDataRef: TCMDateTimePicker
        Left = 4
        Top = 18
        Width = 110
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
        OnChange = dtDataRefChange
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 122
        Top = 58
        Width = 327
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Investimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblInvestimentoCloseUp
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 465
        Top = 58
        Width = 327
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblEmissorCloseUp
        OnExit = dblEmissorExit
      end
      object rdgPosicao: TRadioGroup
        Left = 4
        Top = 48
        Width = 109
        Height = 71
        Caption = ' Posição de '
        Items.Strings = (
          'Abertura'
          'Fechamento')
        TabOrder = 5
        OnClick = rdgPosicaoClick
      end
      object chkExpandido: TCheckBox
        Left = 367
        Top = 100
        Width = 83
        Height = 17
        Caption = 'Expandido'
        TabOrder = 8
      end
      object dblPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 122
        Top = 18
        Width = 327
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblPlanPrevCtbPatrChange
      end
      object dblkClasseTit: TwwDBLookupCombo
        Left = 465
        Top = 18
        Width = 327
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'30'#9'Classe'#9'F')
        LookupTable = qryClasseTit
        LookupField = 'IDCLASSETIT'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblEmissorCloseUp
        OnExit = dblEmissorExit
      end
      object CbxAplic: TComboBox
        Left = 123
        Top = 98
        Width = 102
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = 'CbxAplic'
        OnExit = CbxAplicExit
        Items.Strings = (
          'Todas'
          'Menor'
          'Maior =')
      end
      object DbDtRefAplc: TCMDateTimePicker
        Left = 237
        Top = 98
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
        ShowButton = True
        TabOrder = 7
      end
      object cbxPenhora: TCheckBox
        Left = 465
        Top = 100
        Width = 112
        Height = 17
        Caption = 'Penhorados'
        TabOrder = 9
      end
      object ChkConsolidado: TCheckBox
        Left = 580
        Top = 100
        Width = 209
        Height = 17
        Caption = 'Consolidado por Investimento'
        TabOrder = 10
        OnClick = ChkConsolidadoClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 172
      Width = 851
      Height = 160
      Align = alTop
      TabOrder = 2
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 849
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Saldos'
        Color = clNavy
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgOperacoes: TwwDBGrid
        Left = 1
        Top = 26
        Width = 849
        Height = 133
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'43'#9'Plano / Patrocinadora'
          'DATAHISTRENFIX'#9'11'#9'Data'
          'DESCINVESTIMENTO'#9'45'#9'Investimento'
          'DATAOPERACAO'#9'12'#9'Dt Aplicação'
          'SALDOQTDHISTRENFI'#9'14'#9'Quantidade'
          'SALDOVLRHISTRENFI'#9'17'#9'Valor Bruto'
          'VLRIOF'#9'16'#9'Valor IOF'
          'SALDOVLRHISTLIQ'#9'17'#9'Valor Líquido'
          'FLGNEGOCIACAO'#9'24'#9'Investimento para Negociação'
          'QTDCARTHIPO'#9'20'#9'Qtd. Carteira Hipotecária'
          'VLRCARTHIPO'#9'19'#9'Vlr. Carteira Hipotecária'
          'NOMECLASSRISCO'#9'34'#9'Classe de Risco - Operação'
          'DESCARTEIRASPC'#9'43'#9'Carteira SPC'
          'PERCPENHORA'#9'10'#9'% Penhorado'
          'QTDPENHORA'#9'20'#9'Qtd. Penhorada')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelRenFixSaldo.dsHistorico
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
    object Panel3: TPanel
      Left = 1
      Top = 334
      Width = 851
      Height = 225
      Align = alClient
      TabOrder = 3
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 849
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Itens dos Saldos'
        Color = clNavy
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object dbgItens: TwwDBGrid
        Left = 1
        Top = 26
        Width = 849
        Height = 198
        Selected.Strings = (
          'DESCCURVARENFIX'#9'31'#9'Perfil de Atualização'
          'DESCITEMRENFIX'#9'23'#9'Item'
          'PUITEM'#9'14'#9'P.U. do Item'
          'VLRITEM'#9'16'#9'Valor do Item'
          'NOMEREGRA'#9'32'#9'Regra Utilizada'
          'SEQCALCULO'#9'12'#9'Seq. de Cálculo')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelRenFixSaldo.dsItens
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
  end
  inherited Dock971: TDock97
    Top = 560
    Width = 853
    inherited tb97Fundo: TToolbar97
      Left = 681
      DockPos = 953
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 428
      DockPos = 700
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      object bbtnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        Enabled = False
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
    Left = 51
    Top = 211
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO'
      'FROM INVESTIMENTO IV, CLASSETITRENFIX CL'
      'WHERE IV.IDTIPOINVEST = 1 AND'
      
        '      (((:IDEMISSOR IS NOT NULL) AND (IV.IDEMISSOR = :IDEMISSOR)' +
        ') OR (:IDEMISSOR IS NULL))'
      '      AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      'ORDER BY IV.DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 401
    Top = 91
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptResult
      end>
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM, INVESTIMENTO IV'
      'WHERE EM.IDEMISSOR = IV.IDEMISSOR AND'
      '      IV.IDTIPOINVEST = 1'
      'ORDER BY SIGLAEMISSOR'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 746
    Top = 99
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 402
    Top = 59
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object qryClasseTit: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CL.IDCLASSETIT, CL.DESCCLASSETIT'
      'FROM CLASSETITRENFIX CL'
      'ORDER BY DESCCLASSETIT'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 746
    Top = 59
    object qryClasseTitDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 30
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object qryClasseTitIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
end
