inherited frmConsAnunciosProventos: TfrmConsAnunciosProventos
  Left = 357
  Top = 119
  HelpContext = 790548
  Caption = 'Consulta dos Anúncios de Proventos em Aberto'
  ClientHeight = 486
  ClientWidth = 846
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 846
    Height = 447
    inherited bvlSepTit: TBevel
      Top = 170
      Width = 844
      Height = 2
    end
    object wwDBGrid1: TwwDBGrid [1]
      Left = 1
      Top = 172
      Width = 844
      Height = 274
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'31'#9'Plano / Patrocinadora'
        'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos'
        'DESCTIPOOPERACAO'#9'35'#9'Tipo de Operação'
        'DATAPREV'#9'12'#9'Data Prevista'
        'DESCINVESTIMENTO'#9'29'#9'Investimentos'
        'QTD'#9'15'#9'Quantidade'
        'PU'#9'15'#9'Preço'
        'VALOR'#9'15'#9'Valor à Receber')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dmRelAGE.ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = wwDBGrid1TopRowChanged
    end
    inherited pnlTitulo: TPanel
      Width = 844
      inherited lbNomDescricao: TfcLabel
        Width = 489
        Caption = 'Consulta dos Anúncios de Proventos em Aberto'
      end
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 42
      Width = 844
      Height = 128
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 18
        Top = 5
        Width = 112
        Height = 13
        Caption = 'Data de Referência'
      end
      object Label1: TLabel
        Left = 18
        Top = 44
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 327
        Top = 44
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label2: TLabel
        Left = 173
        Top = 5
        Width = 48
        Height = 13
        Caption = 'Data EX'
      end
      object Label5: TLabel
        Left = 476
        Top = 5
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object Label6: TLabel
        Left = 327
        Top = 83
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
        FocusControl = dblSegmentacao
      end
      object Label7: TLabel
        Left = 327
        Top = 5
        Width = 57
        Height = 13
        Caption = 'Data AGE'
      end
      object Label8: TLabel
        Left = 18
        Top = 83
        Width = 145
        Height = 13
        Caption = 'Carteira de Investimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DtRef: TCMDateTimePicker
        Left = 18
        Top = 19
        Width = 138
        Height = 21
        Hint = 'Data de Referência'
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
      object dblkInvest: TwwDBLookupCombo
        Left = 327
        Top = 59
        Width = 302
        Height = 21
        Hint = 'Investimento'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkTpOper: TwwDBLookupCombo
        Left = 18
        Top = 59
        Width = 295
        Height = 21
        Hint = 'Tipo de Operação'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryTpOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object DtEX: TCMDateTimePicker
        Left = 173
        Top = 19
        Width = 138
        Height = 21
        Hint = 'Data EX'
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
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 476
        Top = 19
        Width = 302
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryPlanoPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object ChBxConsolidadoInvest: TCheckBox
        Left = 641
        Top = 98
        Width = 193
        Height = 17
        Caption = 'Consolidado por Investimento'
        TabOrder = 8
        OnClick = ChBxConsolidadoInvestClick
      end
      object dblSegmentacao: TwwDBLookupCombo
        Left = 327
        Top = 98
        Width = 302
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'50'#9'Segmentação'#9'F')
        LookupTable = QrySegmentacao
        LookupField = 'IDSEGMENTACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DtAGE: TCMDateTimePicker
        Left = 327
        Top = 19
        Width = 138
        Height = 21
        Hint = 'Data EX'
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
      object dblkCarteira: TwwDBLookupCombo
        Left = 18
        Top = 98
        Width = 295
        Height = 21
        Hint = 'Carteira de Investimentos'
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'60'#9'Carteira'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 447
    Width = 846
    inherited tb97Fundo: TToolbar97
      Left = 552
      ActivateParent = False
      DockableTo = []
      DockPos = 552
      inherited sep1: TToolbarSep97
        Left = 245
      end
      inherited sep3: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 383
      DockPos = 383
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryAnuncioProvOld: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCTIPOOPERACAO,'
      '       TRUNC(DATAEX) AS DATAEX,'
      '       TRUNC(DATAPREV) AS DATAPREV,'
      '       TRUNC(DTBASE) AS DTBASE,'
      '       TRUNC(DATAAGE) AS DATAAGE,'
      
        '       DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, IDTI' +
        'POOPERACAO,'
      '       SUM(QTDPREVISTA) AS QTD,'
      '       (SUM(VLROPERACAO) / SUM(QTDPREVISTA)) AS PU,'
      '       SUM(VLROPERACAO) AS VALOR'
      ''
      
        'FROM (SELECT TP.DESCTIPOOPERACAO, OD.DATAOPER AS DATAEX, OD.DATA' +
        'COM AS DATAPREV, OD.DATAEX AS DTBASE, OD.DATAAGE,'
      
        '             IV.DESCINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDOPERAC' +
        'AODIREITO, IV.IDINVESTIMENTO,'
      '             NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA,'
      '             NVL(OI.VLROPERACAO,0) AS VALORPREVISTO,'
      '             NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA,'
      '             NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA,'
      '             OI.PRECOUNITOPERACAO,'
      
        '             NVL(OI.VLROPERACAO,0) - NVL(REC.QTDEOPERACAO,0) - N' +
        'VL(CAN.QTDEOPERACAO,0) AS VLROPERACAO'
      ''
      
        '      FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI' +
        ', TIPOOPERACAO TP,'
      
        '           INVESTIMENTO IV, CARTEIRAINVEST CI, MOTIVOBLOQUEIO MB' +
        ','
      
        '           (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS' +
        ' QTDEOPERACAO'
      '            FROM OPERACAOINVEST OI1, PARAMINVEST PI1'
      '            WHERE OI1.IDOPERACAOORIGEM IS NOT NULL'
      
        '              AND OI1.IDTIPOOPERACAO IN (PI1.IDTIPOOPERDIRDIV, P' +
        'I1.IDTIPOOPERDIRDIV + 10000,'
      
        '                                         PI1.IDTIPOOPERDIRJUR, P' +
        'I1.IDTIPOOPERDIRJUR + 10000,'
      
        '                                         PI1.IDTIPOOPERDIRMUL, P' +
        'I1.IDTIPOOPERDIRMUL + 10000)'
      
        '              AND ((:DT_REF IS NULL) OR (OI1.DATAOPERACAO <= TO_' +
        'DATE(:DT_REF,'#39'DD/MM/YYYY'#39')))'
      '            GROUP BY IDOPERACAOORIGEM) REC,'
      ''
      
        '           (SELECT OI1.IDOPERACAOORIGEM, SUM(OI1.VLROPERACAO) AS' +
        ' QTDEOPERACAO'
      '            FROM OPERACAOINVEST OI1, PARAMINVEST PI1'
      '            WHERE OI1.IDOPERACAOORIGEM IS NOT NULL'
      '              AND OI1.IDTIPOOPERACAO IN (-170, -10170)'
      
        '              AND ((:DT_REF IS NULL) OR (OI1.DATAOPERACAO <= TO_' +
        'DATE(:DT_REF,'#39'DD/MM/YYYY'#39')))'
      '            GROUP BY IDOPERACAOORIGEM) CAN'
      ''
      '      WHERE OI.IDCARTEIRAGERENC IS NULL'
      '        AND OI.IDTIPOOPERACAO IN (-70, -10070)'
      '        AND OI.ORIGDEST IS NOT NULL'
      
        '        AND ((:DATAOPERACAO IS NULL) OR (OI.DATAOPERACAO <= TO_D' +
        'ATE(:DATAOPERACAO, '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:DATAEX IS NULL) OR (OD.DATAOPER = TO_DATE(:DATAEX' +
        ', '#39'DD/MM/YYYY'#39')))'
      
        '        AND ((:IDTIPOOPERACAO IS NULL) OR (TP.IDTIPOOPERACAO = :' +
        'IDTIPOOPERACAO))'
      
        '        AND ((:IDINVESTIMENTO IS NULL) OR (OI.IDINVESTIMENTO = :' +
        'IDINVESTIMENTO))'
      
        '        AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPO' +
        'OPERDIRJUR, PI.IDTIPOOPERDIRMUL)'
      '        AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO'
      '        AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '        AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '        AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '        AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO(+)'
      '        AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+)'
      '        AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+)'
      
        '        AND NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + N' +
        'VL(CAN.QTDEOPERACAO,0)) )'
      'GROUP BY DESCTIPOOPERACAO, DATAEX, DATAPREV, DTBASE, DATAAGE,'
      
        '         DESCINVESTIMENTO, IDINVESTIMENTO, IDOPERACAODIREITO, ID' +
        'TIPOOPERACAO'
      ''
      'HAVING SUM(VLROPERACAO) > 0'
      ''
      'ORDER BY DATAEX, DESCTIPOOPERACAO, DESCINVESTIMENTO'
      ''
      ' ')
    UpdateObject = UpdAnuncioProv
    ValidateWithMask = True
    Left = 193
    Top = 250
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DT_REF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAEX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryAnuncioProvOldDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 37
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryAnuncioProvOldDATAPREV: TDateTimeField
      DisplayLabel = 'Data Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREV'
    end
    object qryAnuncioProvOldDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimentos'
      DisplayWidth = 42
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryAnuncioProvOldQTD: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTD'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryAnuncioProvOldPU: TFloatField
      DisplayLabel = 'Preço'
      DisplayWidth = 15
      FieldName = 'PU'
      DisplayFormat = '###,###,##0.000000000000'
    end
    object qryAnuncioProvOldVALOR: TFloatField
      DisplayLabel = 'Valor à Receber'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryAnuncioProvOldDATAEX: TDateTimeField
      FieldName = 'DATAEX'
      Visible = False
    end
    object qryAnuncioProvOldDTBASE: TDateTimeField
      FieldName = 'DTBASE'
      Visible = False
    end
    object qryAnuncioProvOldDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
      Visible = False
    end
    object qryAnuncioProvOldIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryAnuncioProvOldIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object qryAnuncioProvOldIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
  end
  object dsAnuncioProv: TwwDataSource
    AutoEdit = False
    DataSet = qryAnuncioProvOld
    Left = 57
    Top = 201
  end
  object qryTpOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO,'
      '       DESCTIPOOPERACAO'
      ''
      '  FROM TIPOOPERACAO'
      ''
      
        ' WHERE IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRJUR FROM PARAMINVE' +
        'ST)'
      
        '    OR IDTIPOOPERACAO IN (SELECT IDTIPOOPERDIRDIV FROM PARAMINVE' +
        'ST)'
      ''
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 723
    Top = 69
    object qryTpOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTpOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 589
    Top = 93
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryOrigemDivJur: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        INV.DESCINVESTIMENTO,'
      '        CA.DESCCARTINVEST,'
      '        C.SGLCUSTODIANTE,'
      
        '        DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) S' +
        'IGLAMOTBLOQ,'
      '        HC.IDLOTE,'
      '        SYSDATE  AS DATAREFERENCIA,'
      '        0 AS QTDE,'
      '        0 AS QTDEDIREITO,'
      '        0 AS VALOREXERCIDO,'
      '        0 AS VLRREMUNERACAO,'
      '        0 AS IR,'
      '        0 AS VLRLIQ,'
      '        0 AS VLRIRREMUNERACAO,'
      '        HC.IDCARTEIRAINVEST,'
      '        HC.IDINVESTIMENTO,'
      '        HC.IDCUSTODIANTE,'
      '        HC.IDMOTIVOBLOQUEIO,'
      '        OXI.PERCENTUALINV,'
      '        0 AS VLRCUSTOATUAL,'
      '        0 AS VLRCUSTO,'
      '        PRECOUNITOPERACAO AS PUORIG'
      '     FROM'
      
        '        HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTE' +
        'IRAINVEST CA,'
      '        INVESTIMENTO INV, OPERDIREITOXINV OXI,'
      ''
      
        '        (SELECT IDOPERACAODIREITO, PRECOUNITOPERACAO FROM OPERAC' +
        'AOINVEST WHERE'
      '         DATAOPERACAO     <=:DATAOPERACAO           AND'
      '         IDCARTEIRAGERENC IS NULL                   AND'
      '         IDTIPOOPERACAO   IN (-70,-10070)           ) OI'
      '         '
      '     WHERE'
      '        HC.IDINVESTIMENTO  IN'
      
        '        (SELECT IDINVESTIMENTO FROM  OPERDIREITOXINV WHERE IDOPE' +
        'RACAODIREITO=:IDOPERACAODIREITO AND ORIGDEST = '#39'O'#39') AND'
      '        OXI.IDOPERACAODIREITO = :IDOPERACAODIREITO     AND'
      '        OXI.ORIGDEST          = '#39'O'#39'                    AND'
      '         OI.IDOPERACAODIREITO(+) = OXI.IDOPERACAODIREITO AND'
      '        HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST    AND'
      '        HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO     AND'
      '        HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+)     AND'
      '        HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) AND'
      '        HC.IDCUSTODIA  IN (SELECT IDCUSTODIA FROM HISTCUSTODIA'
      '                           WHERE IDCUSTODIA IN'
      
        '                                (SELECT IDCUSTODIA FROM HISTCUST' +
        'ODIA'
      '                                 WHERE'
      
        '                                        IDINVESTIMENTO IN (SELEC' +
        'T IDINVESTIMENTO'
      
        '                                                           FROM ' +
        'OPERDIREITOXINV'
      
        '                                                           WHERE' +
        ' IDOPERACAODIREITO =:IDOPERACAODIREITO AND'
      
        '                                                         ORIGDES' +
        'T          = '#39'O'#39' )             AND'
      
        '                                        DATAMOVCUSTOD    <=:DATA' +
        'AGE))'
      
        '     ORDER BY INV.DESCINVESTIMENTO, DESCCARTINVEST, C.SGLCUSTODI' +
        'ANTE,'
      
        '                           DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL,' +
        ' MB.SIGLAMOTBLOQ)'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 164
    Top = 155
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAAGE'
        ParamType = ptResult
      end>
  end
  object UpdAnuncioProv: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCUSTODIA'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into HISTCUSTODIA'
      '  (IDINVESTIMENTO)'
      'values'
      '  (:IDINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from HISTCUSTODIA'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 54
    Top = 267
  end
  object QryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT QTDELOTE'
      'FROM'
      '      COTACAOACAO'
      'WHERE'
      '      DATACOTAACAO = (SELECT MAX(DATACOTAACAO)'
      '                      FROM  COTACAOACAO'
      
        '                      WHERE DATACOTAACAO <= TO_DATE(:DATACOTAACA' +
        'O,'#39'DD/MM/YYYY'#39') AND'
      '                            IDACAO        = :IDACAO) AND'
      '      IDACAO       = :IDACAO                             '
      ''
      ' ')
    ValidateWithMask = True
    Left = 441
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'DATACOTAACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptResult
      end>
  end
  object QryLoteOrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       QTDELOTE'
      'FROM'
      '       ACOESXBOLSA'
      'WHERE  IDACAO =:IDACAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 377
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptResult
      end>
  end
  object qryPlanoPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 589
    Top = 54
    object qryPlanoPrevPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Size = 113
    end
    object qryPlanoPrevPLANOCONTABIL: TStringField
      DisplayWidth = 50
      FieldName = 'PLANOCONTABIL'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
      Size = 50
    end
    object qryPlanoPrevPATROCINADORA: TStringField
      DisplayWidth = 60
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
      Size = 60
    end
    object qryPlanoPrevIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
  end
  object QrySegmentacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IDSEGMENTACAO, DESCSEGMENTACAO, IDGRUPO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE '
      '  IDGRUPO =:GRUPO')
    ValidateWithMask = True
    Left = 275
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
    object QrySegmentacaoIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
    end
    object QrySegmentacaoDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object QrySegmentacaoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDGRUPO'
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM CARTEIRAINVEST'
      'WHERE IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 453
    Top = 173
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object qryCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTPROP'
      Visible = False
    end
    object qryCarteiraFLGCALCDIARIO: TStringField
      FieldName = 'FLGCALCDIARIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCALCDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAINICIO'
      Visible = False
    end
    object qryCarteiraFLGTRATALOTE: TStringField
      FieldName = 'FLGTRATALOTE'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGTRATALOTE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object qryCarteiraTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryCarteiraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPLANOPREV'
      Visible = False
    end
    object qryCarteiraIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDPATROCINADORA'
      Visible = False
    end
    object qryCarteiraIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDTIPOINVEST'
      Visible = False
    end
    object qryCarteiraIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDMERCADO'
      Visible = False
    end
    object qryCarteiraFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGORDMOVINV'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.CARTEIRAINVEST.DATAULTFECH'
      Visible = False
    end
    object qryCarteiraIDDAIEACART: TFloatField
      FieldName = 'IDDAIEACART'
      Origin = 'BASEDADOS.CARTEIRAINVEST.IDDAIEACART'
      Visible = False
    end
    object qryCarteiraFLGCARTLASTRO: TStringField
      FieldName = 'FLGCARTLASTRO'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTLASTRO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCarteiraFLGCARTTERC: TStringField
      FieldName = 'FLGCARTTERC'
      Origin = 'BASEDADOS.CARTEIRAINVEST.FLGCARTTERC'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
