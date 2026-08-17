inherited frmConsOperRenFix: TfrmConsOperRenFix
  Left = 128
  Top = 165
  HelpContext = 790527
  Caption = 'Consulta'
  ClientHeight = 467
  ClientWidth = 778
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 778
    Height = 428
    inherited bvlSepTit: TBevel
      Width = 776
    end
    object splSeparaGrids: TSplitter [1]
      Left = 1
      Top = 293
      Width = 776
      Height = 2
      Cursor = crVSplit
      Align = alTop
      AutoSnap = False
      Beveled = True
    end
    inherited pnlTitulo: TPanel
      Width = 776
      inherited lbNomDescricao: TfcLabel
        Left = 19
        Width = 260
        Caption = 'Operações de Renda Fixa'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 776
      Height = 88
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 19
        Top = 2
        Width = 46
        Height = 13
        Caption = 'Período'
      end
      object Label2: TLabel
        Left = 128
        Top = 26
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object Label3: TLabel
        Left = 257
        Top = 42
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label4: TLabel
        Left = 257
        Top = 2
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object Label5: TLabel
        Left = 19
        Top = 43
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object dtDataInicio: TCMDateTimePicker
        Left = 18
        Top = 18
        Width = 106
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
        OnChange = dtDataInicioChange
        OnExit = dtDataInicioExit
      end
      object dtDataFim: TCMDateTimePicker
        Left = 142
        Top = 18
        Width = 106
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
        OnChange = dtDataFimChange
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 256
        Top = 58
        Width = 320
        Height = 21
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Investimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblInvestimentoChange
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 256
        Top = 18
        Width = 320
        Height = 21
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblEmissorChange
        OnCloseUp = dblEmissorCloseUp
        OnExit = dblEmissorExit
      end
      object dblPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 18
        Top = 58
        Width = 231
        Height = 21
        CharCase = ecUpperCase
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblPlanPrevCtbPatrChange
      end
      object GroupBox1: TGroupBox
        Left = 593
        Top = 8
        Width = 128
        Height = 73
        Caption = 'Expandido'
        TabOrder = 5
        object chkExpItens: TCheckBox
          Left = 17
          Top = 20
          Width = 87
          Height = 17
          Caption = 'Itens'
          TabOrder = 0
        end
        object chkExpVenc: TCheckBox
          Left = 17
          Top = 44
          Width = 87
          Height = 17
          Caption = 'Vencimentos'
          TabOrder = 1
        end
      end
    end
    object pnlOperacoes: TPanel
      Left = 1
      Top = 133
      Width = 776
      Height = 160
      Align = alTop
      TabOrder = 2
      object splSepVencimentos: TSplitter
        Left = 557
        Top = 26
        Width = 3
        Height = 133
        Cursor = crHSplit
        Align = alRight
      end
      object pnlTitOperacoes: TPanel
        Left = 1
        Top = 1
        Width = 774
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
        TabOrder = 0
      end
      object dbgOperacoes: TwwDBGrid
        Left = 1
        Top = 26
        Width = 556
        Height = 133
        Hint = 'Botão Direito: Mostra Vencimentos'
        Selected.Strings = (
          'PLANPATRO'#9'40'#9'Plano Contábil X Patro'#9'F'
          'DESCINVESTIMENTO'#9'54'#9'Investimento'#9'F'
          'DATAOPERACAO'#9'10'#9'Data'#9'F'
          'DESCTIPOOPERACAO'#9'40'#9'Operação'#9'F'
          'VENCOPERACAO'#9'18'#9'Vencimento'#9'F'
          'PUEMISSAO'#9'15'#9'PU de Emissão'#9'F'
          'QTDEOPERACAO'#9'12'#9'Quantidade'#9'F'
          'PUOPERACAO'#9'16'#9'PU de Operação'#9'F'
          'VLROPERACAO'#9'20'#9'Valor'#9'F'
          'NOMECLASSRISCO'#9'60'#9'Classe de Risco'#9'F'
          'QTDCARTHIPO'#9'17'#9'Qtd. Cart. Hipotecária'#9'F'
          'VALCARTHIPO'#9'17'#9'Vlr. Cart. Hipotecária'#9'F'
          'DATAVIGENCIA'#9'18'#9'Data de Vigência'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelRenFixOper.dsOperacoes
        ParentShowHint = False
        PopupMenu = pmnuVencimentos
        ShowHint = True
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
      object dbgVencimentos: TwwDBGrid
        Left = 560
        Top = 26
        Width = 215
        Height = 133
        Selected.Strings = (
          'DATAVIGENCIA'#9'18'#9'Data Vigência'
          'DATAVENCTOANT'#9'18'#9'Vencimento Anterior'
          'DATAVENCTOATU'#9'18'#9'Vencimento Atual')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alRight
        DataSource = DmRelRenFixOper.dsVencimentos
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icBlack
      end
    end
    object pnlItems: TPanel
      Left = 1
      Top = 295
      Width = 776
      Height = 132
      Align = alClient
      TabOrder = 3
      object pnlTitItems: TPanel
        Left = 1
        Top = 1
        Width = 774
        Height = 25
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '   Itens da Operação'
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
        Width = 774
        Height = 105
        Selected.Strings = (
          'DESCCURVARENFIX'#9'40'#9'Perfil de Atualização'
          'DESCITEMRENFIX'#9'41'#9'Item'
          'VLRCURVA'#9'22'#9'Valor'
          'MOEDESC'#9'20'#9'Moeda'
          'PERCCURVA'#9'10'#9'Percentual'
          'SEQCALCULO'#9'12'#9'Seq. de Cálculo'
          'PUITEM'#9'10'#9'PUITEM'
          'VLRITEM'#9'10'#9'VLRITEM'
          'TXITEM'#9'10'#9'TXITEM'
          'TIPOITEM'#9'1'#9'TIPOITEM')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DmRelRenFixOper.dsItens
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
    Top = 428
    Width = 778
    inherited tb97Fundo: TToolbar97
      Left = 606
      DockPos = 933
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 353
      DockPos = 680
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
    Left = 371
    Top = 3
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
      ' '
      ' ')
    ValidateWithMask = True
    Left = 721
    Top = 99
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
  end
  object qryEmissor: TwwQuery
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
    Left = 721
    Top = 59
  end
  object qryPlanPrevCtbPatr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO,'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 209
    Top = 99
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPlanPrevCtbPatrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPlanPrevCtbPatrIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
  end
  object pmnuVencimentos: TPopupMenu
    Left = 561
    Top = 17
    object mnuMostraVencimentos: TMenuItem
      Caption = '&Mostra Vencimentos'
      OnClick = mnuMostraVencimentosClick
    end
    object mnuEscondeVencimentos: TMenuItem
      Caption = '&Esconde Vencimentos'
      Enabled = False
      OnClick = mnuEscondeVencimentosClick
    end
  end
end
