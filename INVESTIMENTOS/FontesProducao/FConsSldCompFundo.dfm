inherited FrmConsSldCompFundo: TFrmConsSldCompFundo
  Left = 17
  Top = 103
  HelpContext = 790511
  Caption = ''
  ClientHeight = 414
  ClientWidth = 774
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 375
    inherited bvlSepTit: TBevel
      Width = 772
    end
    inherited pnlTitulo: TPanel
      Width = 772
      inherited lbNomDescricao: TfcLabel
        Top = 9
        Width = 491
        Caption = 'Saldo da Composicão de Fundo de Investimento'
      end
    end
    object PnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 772
      Height = 48
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label7: TLabel
        Left = 135
        Top = 4
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 463
        Top = 4
        Width = 138
        Height = 13
        Caption = 'Composição dos Fundos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DtEdDataReferenciaGeral: TCMDateTimePicker
        Left = 6
        Top = 20
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
        OnExit = DtEdDataReferenciaGeralExit
      end
      object dblInvest: TwwDBLookupCombo
        Left = 135
        Top = 20
        Width = 318
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento'#9'F')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
        OnExit = dblInvestExit
      end
      object DbLkcComposicaoFundo: TwwDBLookupCombo
        Left = 463
        Top = 20
        Width = 296
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Fundo de Investimento'#9'F')
        LookupTable = QryComposicaoFundo
        LookupField = 'IDFUNDOINVESTCOMP'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object PnlConsultaGrid: TPanel
      Left = 1
      Top = 93
      Width = 772
      Height = 281
      Align = alClient
      TabOrder = 2
      object PnlTotalSaldo: TPanel
        Left = 1
        Top = 239
        Width = 770
        Height = 41
        Align = alBottom
        TabOrder = 0
        object Label3: TLabel
          Left = 135
          Top = 2
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Quantidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 283
          Top = 2
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Bruto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 453
          Top = 2
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'IOF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 579
          Top = 2
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'IRRF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 673
          Top = 2
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Líquido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBReQtd: TDBRealEdit
          Left = 33
          Top = 19
          Width = 168
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          Enabled = False
          Lines.Strings = (
            '0,000000000')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
          DataField = 'SALDOQTDCOTAS'
          DataSource = dsSaldoFundoTotal
        end
        object DBReBruto: TDBRealEdit
          Left = 202
          Top = 19
          Width = 145
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'SALDOVLRFUNDO'
          DataSource = dsSaldoFundoTotal
        end
        object DBReIOF: TDBRealEdit
          Left = 348
          Top = 19
          Width = 126
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIOFPROV'
          DataSource = dsSaldoFundoTotal
        end
        object DBReIRRF: TDBRealEdit
          Left = 475
          Top = 19
          Width = 134
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRIRPROV'
          DataSource = dsSaldoFundoTotal
        end
        object DBReLiq: TDBRealEdit
          Left = 610
          Top = 19
          Width = 139
          Height = 21
          Alignment = taRightJustify
          Color = clMenu
          Enabled = False
          Lines.Strings = (
            '0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'SALDOLIQUIDO'
          DataSource = dsSaldoFundoTotal
        end
      end
      object PnlSaldoGrid: TPanel
        Left = 1
        Top = 1
        Width = 770
        Height = 238
        Align = alClient
        TabOrder = 1
        object dbGrdSaldos: TwwDBGrid
          Left = 1
          Top = 1
          Width = 768
          Height = 236
          Hint = 'Clique com o botão direito para Fixar Colunas'
          Selected.Strings = (
            'DESCFUNDOINVEST'#9'28'#9'Fundo de Investimento'#9'F'
            'DATAAPLICACAO'#9'10'#9'Aplicação'#9'F'
            'DATAMOVFUNDO'#9'12'#9'Data da Cota'#9'F'
            'SALDOQTDCOTAS'#9'20'#9'Quantidade'#9'F'
            'VLRCOTAATUAL'#9'15'#9'Valor da Cota'#9'F'
            'SALDOVLRFUNDO'#9'19'#9'Valor Bruto'#9'F'
            'VLRIOFPROV'#9'13'#9'IOF'#9'F'
            'VLRIRPROV'#9'14'#9'IR'#9'F'
            'SALDOLIQUIDO'#9'20'#9'Valor Líquido'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          Color = clWhite
          DataSource = DmRelSldComposicaoFdoRF.dsSldComposicaoFdoRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyOptions = []
          Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icYellow
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 774
    inherited tb97Fundo: TToolbar97
      Left = 602
      DockPos = 956
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 349
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
      object bt_Imprime: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
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
    Left = 739
    Top = 4
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object QryComposicaoFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      'FI.DESCFUNDOINVEST, CF.IDFUNDOINVESTCOMP'
      ''
      'FROM   COMPOSICAOFUNDO CF, FUNDOINVEST FI, TIPOFUNDOINVEST TF'
      'WHERE'
      '       CF.IDFUNDOINVEST = :IDFUNDOINVEST            AND'
      '       FI.IDFUNDOINVEST     = CF.IDFUNDOINVESTCOMP  AND'
      '       TF.IDTIPOFUNDOINVEST = FI.IDTIPOFUNDOINVEST  '
      'ORDER BY FI.DESCFUNDOINVEST, TF.DESCTIPOFUNDOINV'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 416
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object qryInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCFUNDOINVEST, IDFUNDOINVEST'
      'FROM'
      '   FUNDOINVEST'
      'WHERE'
      '   IDFUNDOINVEST IN'
      '   (SELECT DISTINCT  IDFUNDOINVEST'
      '    FROM   COMPOSICAOFUNDO)'
      'ORDER BY DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 503
    Top = 4
    object qryInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimento'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
  end
  object QrySaldoFundoTotal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        ' SUM(H1.VLRAPLICADO)   AS VLRAPLICADO    , SUM(NVL(H1.VLRIRPROV,' +
        '0))  AS VLRIRPROV , SUM(NVL(H1.VLRIOFPROV,0))  AS VLRIOFPROV    ' +
        '  ,'
      
        ' SUM(NVL(H1.VLRVARIACAO,0)) AS VLRVARIACAO      , SUM(H1.COTASMO' +
        'VFUNDO) AS COTASMOVFUNDO    , SUM(H1.VLRMOVFUNDO) AS VLRMOVFUNDO' +
        ' ,'
      
        ' SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS    , SUM(H1.SALDOVLRFUND' +
        'O) AS SALDOVLRFUNDO,'
      
        ' SUM(H1.SALDOVLRFUNDO)-SUM(NVL(H1.VLRIOFPROV,0)) AS  SALDOLIQUID' +
        'O'
      ''
      'FROM HISTFUNDO H1, FUNDOINVEST FI'
      ''
      'WHERE'
      ''
      '(H1.IDHISTFUNDO  IN ('
      ''
      '                SELECT MAX(HF.IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM'
      '                      HISTFUNDO HF, COMPOSICAOFUNDO CF'
      '                WHERE'
      
        '                         (HF.IDTIPOINVEST      = :IDTIPOINVEST) ' +
        '       AND'
      
        '                         (HF.IDPLANPREVCTBPATR = :IDPLANPREVCTBP' +
        'ATR)   AND'
      
        '                         (HF.DATAMOVFUNDO      = TO_DATE(:DATAMO' +
        'VFUNDO,'#39'DD/MM/YYYY'#39')) AND'
      
        '                        ((HF.DATAMOVFUNDO      < TO_DATE(:DATAMO' +
        'VFUNDO,'#39'DD/MM/YYYY'#39')) OR HF.IDHISTFUNDO < 999999999) AND'
      ''
      
        '                       (((:IDFUNDOINVEST IS NOT NULL)     AND (C' +
        'F.IDFUNDOINVEST     = :IDFUNDOINVEST)) OR'
      
        '                        ((:IDFUNDOINVEST IS NULL)         AND (C' +
        'F.IDFUNDOINVEST IS NOT NULL))) AND'
      ''
      
        '                       (((:IDFUNDOINVESTCOMP IS NOT NULL) AND (C' +
        'F.IDFUNDOINVESTCOMP = :IDFUNDOINVESTCOMP)) OR'
      
        '                        ((:IDFUNDOINVESTCOMP IS NULL)     AND (C' +
        'F.IDFUNDOINVESTCOMP IS NOT NULL))) AND'
      ''
      
        '                         (HF.IDFUNDOINVEST     = CF.IDFUNDOINVES' +
        'TCOMP) AND'
      ''
      
        '                         (HF.IDCOMPOSICAOFUNDO = CF.IDCOMPOSICAO' +
        'FUNDO)'
      
        '                GROUP BY HF.IDTIPOINVEST, HF.IDPLANPREVCTBPATR, ' +
        'HF.IDFUNDOINVEST, HF.DATAAPLICACAO, HF.DATAMOVFUNDO'
      '                )) AND'
      ''
      '(H1.SALDOQTDCOTAS > 0)  AND'
      ''
      '(FI.IDFUNDOINVEST     = H1.IDFUNDOINVEST)')
    ValidateWithMask = True
    Left = 210
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = '2000'
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVESTCOMP'
        ParamType = ptUnknown
      end>
    object FloatField9: TFloatField
      FieldName = 'VLRAPLICADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField10: TFloatField
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField11: TFloatField
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField12: TFloatField
      FieldName = 'VLRVARIACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField13: TFloatField
      FieldName = 'COTASMOVFUNDO'
    end
    object FloatField14: TFloatField
      FieldName = 'VLRMOVFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField15: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      DisplayFormat = '###,#0.00000000000'
    end
    object FloatField16: TFloatField
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object FloatField18: TFloatField
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object dsSaldoFundoTotal: TwwDataSource
    DataSet = QrySaldoFundoTotal
    Left = 313
    Top = 4
  end
  object QryUltDataFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT MAX(DATAULTFECH) AS DATAULTFECH FROM TIPOFUNDOINVEST WHER' +
        'E'
      '  (IDTIPOINVEST      = :IDTIPOINVEST)                      AND'
      '(((:IDTIPOFUNDOINVEST IS NOT NULL)                         AND'
      '  (IDTIPOFUNDOINVEST = :IDTIPOFUNDOINVEST))             OR'
      '  (:IDTIPOFUNDOINVEST IS NULL) )'
      ' ')
    ValidateWithMask = True
    Left = 591
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryVerSaldoFech: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      'FROM'
      '    HISTFUNDO'
      'WHERE'
      
        '      (IDTIPOINVEST      = :IDTIPOINVEST)                       ' +
        ' AND'
      
        '      (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)                  ' +
        ' AND'
      
        '    (((:IDFUNDOINVEST IS NOT NULL) AND (IDFUNDOINVEST =:IDFUNDOI' +
        'NVEST)) OR'
      
        '      (:IDFUNDOINVEST IS NULL))                                 ' +
        ' AND'
      '      (DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUNDOINVEST, DATAAPL' +
        'ICACAO'
      ' ')
    ValidateWithMask = True
    Left = 679
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
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
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptUnknown
      end>
  end
end
