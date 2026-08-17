inherited frmApuracaoMensalRET: TfrmApuracaoMensalRET
  Left = 166
  Top = 151
  Caption = 'Demonstrativo de Apuração Trimestral'
  ClientHeight = 403
  ClientWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 364
    BevelInner = bvNone
    BevelOuter = bvLowered
    object PageControl: TPageControl
      Left = 4
      Top = 64
      Width = 647
      Height = 296
      ActivePage = tbsApuracaoSint
      Align = alBottom
      TabOrder = 0
      OnChanging = PageControlChanging
      object tbsApuracaoSint: TTabSheet
        Caption = 'Apuração Sintética'
        object Label3: TLabel
          Left = 278
          Top = 190
          Width = 125
          Height = 13
          Caption = 'Total de Rendimentos'
        end
        object Label4: TLabel
          Left = 466
          Top = 190
          Width = 111
          Height = 13
          Caption = 'Imposto a Recolher'
        end
        object Label6: TLabel
          Left = 23
          Top = 211
          Width = 165
          Height = 13
          Caption = 'Resultado dos Investimentos'
        end
        object Label7: TLabel
          Left = 23
          Top = 234
          Width = 258
          Height = 26
          Caption = 'Resultado das Contribuições Assistenciais e  Previdenciais'
          WordWrap = True
        end
        object wwDBGrid1: TwwDBGrid
          Left = 0
          Top = 0
          Width = 639
          Height = 185
          Selected.Strings = (
            'TIPO'#9'65'#9'Tipo Investimento'#9'F'
            'RENDIMENTO'#9'20'#9'Rendimento')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alTop
          DataSource = dsApuracao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        object chkInvestimento: TCheckBox
          Left = 4
          Top = 208
          Width = 15
          Height = 17
          Enabled = False
          TabOrder = 1
          OnClick = chkInvestimentoClick
        end
        object chkPatro: TCheckBox
          Left = 4
          Top = 232
          Width = 15
          Height = 17
          Enabled = False
          TabOrder = 2
          OnClick = chkPatroClick
        end
        object edtTotalRendimento: TRealEdit
          Left = 278
          Top = 206
          Width = 175
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtTotalIrApurado: TRealEdit
          Left = 464
          Top = 206
          Width = 173
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtRendPatro: TRealEdit
          Left = 278
          Top = 230
          Width = 175
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtIrPatro: TRealEdit
          Left = 464
          Top = 230
          Width = 173
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ReadOnly = True
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
      object tbsApuracaoAnalit: TTabSheet
        Caption = 'Apuração Analítica'
        ImageIndex = 1
        object wwDBGrid2: TwwDBGrid
          Left = 0
          Top = 0
          Width = 639
          Height = 268
          Selected.Strings = (
            'DATAFATOGERADOR'#9'10'#9'Data'
            'DESFATOGERADOR'#9'57'#9'Descrição'
            'RENDIMENTO'#9'17'#9'Rendimento')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsApuracaoAnalit
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 3
      Width = 364
      Height = 57
      Caption = ' Período de Apuração '
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 32
        Width = 17
        Height = 13
        Caption = 'De'
      end
      object Label2: TLabel
        Left = 168
        Top = 32
        Width = 20
        Height = 13
        Caption = 'Até'
      end
      object btnProcessaApuracao: TSpeedButton
        Left = 319
        Top = 25
        Width = 27
        Height = 26
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
        OnClick = btnProcessaApuracaoClick
      end
      object edtDataIni: TDateTimePicker
        Left = 38
        Top = 28
        Width = 123
        Height = 21
        CalAlignment = dtaLeft
        Date = 37530.4566360417
        Time = 37530.4566360417
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object edtDataFim: TDateTimePicker
        Left = 191
        Top = 28
        Width = 123
        Height = 21
        CalAlignment = dtaLeft
        Date = 37621.4566360417
        Time = 37621.4566360417
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 655
    inherited tb97Fundo: TToolbar97
      Left = 485
      DockPos = 487
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 317
      DockPos = 317
      inherited ToolbarSep971: TToolbarSep97
        Left = 160
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 80
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 65483
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object qryApuracaoSint: TwwQuery
    AfterOpen = qryApuracaoSintAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RV.IDORIGEMIRLITIGIO,'
      
        '   DECODE(RV.IDORIGEMIRLITIGIO, NULL, '#39'Resultado Trimestre Anter' +
        'ior'#39','
      '                                1,    '#39'Renda Fixa'#39','
      '                                2,    '#39'Renda Variável'#39','
      
        '                                3,    '#39'Investimentos Imobiliario' +
        's'#39','
      '                                4,    '#39'Emprestimos '#39','
      '                                5,    '#39'Fundo de Renda Fixa'#39','
      '                                6,    '#39'Fundo de Renda Variavel'#39','
      '                                7,    '#39'Fundo Imobiliario'#39','
      '                                8,    '#39'BM&F'#39','
      '                                -1,    '#39'Saldo Renda Fixa'#39','
      '                                -2,    '#39'Saldo Renda Variável'#39
      '                                ) AS TIPO,'
      '   SUM(RV.RENDIMENTO) AS RENDIMENTO,'
      '   SUM(RV.VLRIRLITIGIO) AS VLRIRLITIGIO'
      'FROM'
      '('
      'SELECT'
      '    IRL.IDORIGEMIRLITIGIO,'
      '    IRL.DATAFATOGERADOR,'
      '    IRL.DESFATOGERADOR,'
      '    (IRL.VLRIRLITIGIO / 0.20) AS RENDIMENTO,'
      '    IRL.VLRIRLITIGIO,'
      '    IRL.IDMODULO'
      'FROM'
      '    IRLITIGIO IRL'
      'WHERE'
      '    IRL.DATAFATOGERADOR   = (SELECT MAX(DATAFATOGERADOR)'
      '                             FROM IRLITIGIO'
      '                             WHERE DATAFATOGERADOR < :PDATAINI)'
      'AND IRL.VLRIRLITIGIO      IS NOT NULL'
      'AND IRL.VLRIRLITIGIO      <> 0'
      'AND IRL.IDORIGEMIRLITIGIO IS NULL'
      ''
      'UNION'
      ''
      'SELECT'
      '    IRL.IDORIGEMIRLITIGIO,'
      '    IRL.DATAFATOGERADOR,'
      '    IRL.DESFATOGERADOR,'
      '    (IRL.VLRIRLITIGIO / 0.20) AS RENDIMENTO,'
      '    IRL.VLRIRLITIGIO,'
      '    IRL.IDMODULO'
      'FROM'
      '    IRLITIGIO IRL'
      'WHERE'
      '    IRL.DATAFATOGERADOR   >= :PDATAINI'
      'AND IRL.DATAFATOGERADOR   <= :PDATAFIM'
      'AND IRL.VLRIRLITIGIO      IS NOT NULL'
      'AND IRL.VLRIRLITIGIO      <> 0'
      'AND IRL.IDORIGEMIRLITIGIO = 1'
      ''
      'UNION'
      ''
      'SELECT'
      '    IRL.IDORIGEMIRLITIGIO,'
      '    IRL.DATAFATOGERADOR,'
      '    IRL.DESFATOGERADOR,'
      '    (IRL.VLRIRLITIGIO / 0.20) AS RENDIMENTO,'
      '    IRL.VLRIRLITIGIO,'
      '    IRL.IDMODULO'
      'FROM'
      '    IRLITIGIO IRL'
      'WHERE'
      '    IRL.DATAFATOGERADOR   >= :PDATAINI'
      'AND IRL.DATAFATOGERADOR   <= :PDATAFIM'
      'AND IRL.VLRIRLITIGIO      IS NOT NULL'
      'AND IRL.VLRIRLITIGIO      <> 0'
      'AND IRL.IDORIGEMIRLITIGIO = 2'
      ''
      'UNION'
      ''
      'SELECT'
      '    IRL.IDORIGEMIRLITIGIO,'
      '    IRL.DATAFATOGERADOR,'
      '    IRL.DESFATOGERADOR,'
      '    (IRL.VLRIRLITIGIO / 0.20) AS RENDIMENTO,'
      '    IRL.VLRIRLITIGIO,'
      '    IRL.IDMODULO'
      'FROM'
      '    IRLITIGIO IRL'
      'WHERE'
      '    IRL.DATAFATOGERADOR   >= :PDATAINI'
      'AND IRL.DATAFATOGERADOR   <= :PDATAFIM'
      'AND IRL.VLRIRLITIGIO      IS NOT NULL'
      'AND IRL.VLRIRLITIGIO      <> 0'
      'AND IRL.IDORIGEMIRLITIGIO NOT IN (1,2)'
      ''
      'UNION'
      ''
      'SELECT'
      '    -2 AS IDORIGEMIRLITIGIO,'
      '    SYSDATE AS DATAFATOGERADOR,'
      '    '#39' '#39' AS DESFATOGERADOR,'
      '    H2.RENDIMENTO AS RENDIMENTO,'
      '    H2.RENDIMENTO * 0.20 AS VLRIRLITIGIO,'
      '    0 AS IDMODULO'
      'FROM'
      '    (SELECT'
      '        SUM(SALDOVARIACAO - SALDOAQUI) AS RENDIMENTO'
      '     FROM'
      '        HISTCARTINV'
      '     WHERE'
      '        DATAMOVCARTINV = (SELECT MAX(DATAMOVCARTINV)'
      '                          FROM   HISTCARTINV'
      '                          WHERE  DATAMOVCARTINV <= :PDATAFIM'
      '                          AND    IDTIPOINVEST = 2)'
      '     AND IDTIPOINVEST = 2) H2'
      'UNION'
      ''
      'SELECT'
      '    -1 AS IDORIGEMIRLITIGIO,'
      '    SYSDATE AS DATAFATOGERADOR,'
      '    '#39' '#39' AS DESFATOGERADOR,'
      '    H1.RENDIMENTO AS RENDIMENTO,'
      '    H1.RENDIMENTO * 0.20 AS VLRIRLITIGIO,'
      '    0 AS IDMODULO'
      'FROM'
      '    (SELECT'
      '        SUM(SALDOVARIACAO - SALDOAQUI) AS RENDIMENTO'
      '     FROM'
      '        HISTCARTINV'
      '     WHERE'
      '        DATAMOVCARTINV = (SELECT MAX(DATAMOVCARTINV)'
      '                          FROM   HISTCARTINV'
      '                          WHERE  DATAMOVCARTINV <= :PDATAFIM'
      '                          AND    IDTIPOINVEST = 1)'
      '     AND IDTIPOINVEST = 1) H1'
      ''
      ') RV'
      'GROUP BY'
      '   RV.IDORIGEMIRLITIGIO'
      'ORDER BY'
      '   RV.IDORIGEMIRLITIGIO DESC'
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 312
    Top = 224
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
        Value = '01/10/2002'
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
        Value = '31/12/2002'
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end>
    object qryApuracaoSintTIPO: TStringField
      DisplayLabel = 'Tipo Investimento'
      DisplayWidth = 44
      FieldName = 'TIPO'
      Size = 14
    end
    object qryApuracaoSintRENDIMENTO: TFloatField
      DisplayLabel = 'Rendimento'
      DisplayWidth = 20
      FieldName = 'RENDIMENTO'
      DisplayFormat = ',0.00'
    end
    object qryApuracaoSintVLRIRLITIGIO: TFloatField
      DisplayLabel = 'IR Apurado'
      DisplayWidth = 20
      FieldName = 'VLRIRLITIGIO'
      DisplayFormat = ',0.00'
    end
    object qryApuracaoSintIDORIGEMIRLITIGIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORIGEMIRLITIGIO'
      Visible = False
    end
  end
  object qryApuracaoAnalit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IRL.IDORIGEMIRLITIGIO,'
      '    IRL.DATAFATOGERADOR,'
      '    IRL.DESFATOGERADOR,'
      '    (IRL.VLRIRLITIGIO / 0.20) AS RENDIMENTO,'
      '    IRL.VLRIRLITIGIO,'
      '    IRL.IDMODULO,'
      '    IRL.IDPLANOPREV,'
      '    PLP.NOME AS NOMEPLANO,'
      '    IRL.IDPATROCINADORA,'
      '    PAT.NOME AS PATRO'
      'FROM'
      '    IRLITIGIO IRL,'
      '    PESSOA PAT,'
      '    PLANPREV PLP'
      'WHERE'
      '    IRL.DATAFATOGERADOR   >= :PDATAINI'
      'AND IRL.DATAFATOGERADOR   <= :PDATAFIM'
      'AND IRL.IDORIGEMIRLITIGIO = :PIDORIGEMIRLITIGIO'
      'AND IRL.VLRIRLITIGIO      IS NOT NULL'
      'AND IRL.VLRIRLITIGIO      <> 0'
      'AND IRL.IDPATROCINADORA   = PAT.IDPESSOA(+)'
      'AND IRL.IDPLANOPREV       = PLP.IDPLANOPREV(+)'
      'ORDER BY'
      '    IRL.DATAFATOGERADOR')
    ValidateWithMask = True
    Left = 408
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDORIGEMIRLITIGIO'
        ParamType = ptInput
      end>
    object qryApuracaoAnalitDATAFATOGERADOR: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAFATOGERADOR'
    end
    object qryApuracaoAnalitDESFATOGERADOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 57
      FieldName = 'DESFATOGERADOR'
      Size = 200
    end
    object qryApuracaoAnalitRENDIMENTO: TFloatField
      DisplayLabel = 'Rendimento'
      DisplayWidth = 17
      FieldName = 'RENDIMENTO'
    end
    object qryApuracaoAnalitVLRIRLITIGIO: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 17
      FieldName = 'VLRIRLITIGIO'
      Visible = False
    end
    object qryApuracaoAnalitIDORIGEMIRLITIGIO: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Visible = False
    end
    object qryApuracaoAnalitIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object qryApuracaoAnalitIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryApuracaoAnalitNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object qryApuracaoAnalitIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object qryApuracaoAnalitPATRO: TStringField
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
  end
  object dsApuracao: TDataSource
    DataSet = qryApuracao
    Left = 240
    Top = 200
  end
  object dsApuracaoAnalit: TDataSource
    DataSet = qryApuracaoAnalit
    Left = 424
    Top = 64
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '         2400000    AS CONTRIBUICAO'
      'FROM DUAL')
    ValidateWithMask = True
    Left = 584
    Top = 48
    object qryPatrocinadoraCONTRIBUICAO: TFloatField
      FieldName = 'CONTRIBUICAO'
    end
  end
  object qryApuracao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    '#39'                                        '#39' AS TIPO,'
      '    0                                          AS RENDIMENTO,'
      
        '    0                                          AS IDORIGEMIRLITI' +
        'GIO'
      'FROM'
      '    DUAL'
      'WHERE'
      '    1 = 2')
    UpdateObject = updApuracao
    ValidateWithMask = True
    Left = 184
    Top = 216
    object qryApuracaoTIPO: TStringField
      DisplayLabel = 'Tipo Investimento'
      DisplayWidth = 65
      FieldName = 'TIPO'
      FixedChar = True
      Size = 40
    end
    object qryApuracaoRENDIMENTO: TFloatField
      DisplayLabel = 'Rendimento'
      DisplayWidth = 20
      FieldName = 'RENDIMENTO'
      DisplayFormat = ',0.00'
    end
    object qryApuracaoIDORIGEMIRLITIGIO: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Visible = False
    end
  end
  object updApuracao: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  TIPO = :TIPO,'
      '  RENDIMENTO = :RENDIMENTO,'
      '  VLRIRLITIGIO = :VLRIRLITIGIO,'
      '  IDORIGEMIRLITIGIO = :IDORIGEMIRLITIGIO'
      'where'
      '  TIPO = :OLD_TIPO and'
      '  RENDIMENTO = :OLD_RENDIMENTO and'
      '  VLRIRLITIGIO = :OLD_VLRIRLITIGIO and'
      '  IDORIGEMIRLITIGIO = :OLD_IDORIGEMIRLITIGIO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (TIPO, RENDIMENTO, VLRIRLITIGIO, IDORIGEMIRLITIGIO)'
      'values'
      '  (:TIPO, :RENDIMENTO, :VLRIRLITIGIO, :IDORIGEMIRLITIGIO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  TIPO = :OLD_TIPO and'
      '  RENDIMENTO = :OLD_RENDIMENTO and'
      '  VLRIRLITIGIO = :OLD_VLRIRLITIGIO and'
      '  IDORIGEMIRLITIGIO = :OLD_IDORIGEMIRLITIGIO')
    Left = 104
    Top = 224
  end
  object qryHistCartInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    :PIDORIGEMIRLITIGIO AS IDORIGEMIRLITIGIO,'
      '    HST.DATAMOVCARTINV  AS DATAFATOGERADOR,'
      '    HST.HISTMOVCARTINV  AS DESFATOGERADOR,'
      
        '    DECODE(:PIDORIGEMIRLITIGIO,2,(HST.SALDOVARIACAO - HST.SALDOA' +
        'QUI),'
      
        '                               1,(HST.SALDOVARIACAO + HST.SALDOJ' +
        'UROS - HST.SALDOAQUI)) AS RENDIMENTO,'
      
        '    DECODE(:PIDORIGEMIRLITIGIO,2,((HST.SALDOVARIACAO - HST.SALDO' +
        'AQUI) * 0.20),'
      
        '                               1,((HST.SALDOVARIACAO + HST.SALDO' +
        'JUROS - HST.SALDOAQUI)*0.20)) AS VLRIRLITIGIO,'
      '    HST.IDMODULO,'
      '    0   AS IDPLANOPREV,'
      '    '#39' '#39' AS NOMEPLANO,'
      '    0   AS IDPATROCINADORA,'
      '    '#39' '#39' AS PATRO'
      ''
      'FROM'
      '    HISTCARTINV HST'
      'WHERE'
      '    HST.DATAMOVCARTINV    >= :PDATAINI'
      'AND HST.DATAMOVCARTINV    <= :PDATAFIM'
      'AND HST.IDTIPOINVEST      = :PIDORIGEMIRLITIGIO'
      'ORDER BY'
      '    HST.DATAMOVCARTINV'
      ''
      ' ')
    ValidateWithMask = True
    Left = 496
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDORIGEMIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDORIGEMIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDORIGEMIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDORIGEMIRLITIGIO'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAFATOGERADOR'
    end
    object StringField1: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESFATOGERADOR'
      Size = 200
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Rendimento'
      DisplayWidth = 17
      FieldName = 'RENDIMENTO'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'IR'
      DisplayWidth = 17
      FieldName = 'VLRIRLITIGIO'
    end
    object FloatField3: TFloatField
      FieldName = 'IDORIGEMIRLITIGIO'
      Visible = False
    end
    object FloatField4: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object StringField2: TStringField
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object FloatField6: TFloatField
      FieldName = 'IDPATROCINADORA'
      Visible = False
    end
    object StringField3: TStringField
      FieldName = 'PATRO'
      Visible = False
      Size = 60
    end
  end
  object qryInsertIrLitigio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO IRLITIGIO'
      
        '       (IDIRLITIGIO, DATAFATOGERADOR, DESFATOGERADOR, VLRIRLITIG' +
        'IO, IDPATROCINADORA,IDPLANOPREV)'
      
        'VALUES (:PIDIRLITIGIO, :PDATAFATOGERADOR, :PDESFATOGERADOR, :PVL' +
        'RIRLITIGIO, :PIDPATROCINADORA, :PIDPLANOPREV)')
    ValidateWithMask = True
    Left = 560
    Top = 96
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'PIDIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFATOGERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PDESFATOGERADOR'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRIRLITIGIO'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PIDPATROCINADORA'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
  end
  object qryUltTrimestre: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    DATAFATOGERADOR'
      'FROM'
      '    IRLITIGIO'
      'WHERE'
      '    IDORIGEMIRLITIGIO IS NULL'
      'AND DATAFATOGERADOR = (SELECT MAX(DATAFATOGERADOR)'
      '                       FROM   IRLITIGIO'
      '                       WHERE  IDORIGEMIRLITIGIO IS NULL'
      '                       AND    DATAFATOGERADOR < SYSDATE)'
      '                       ')
    ValidateWithMask = True
    Left = 48
    Top = 136
    object qryUltTrimestreDATAFATOGERADOR: TDateTimeField
      FieldName = 'DATAFATOGERADOR'
    end
  end
  object qryInsertLancIRRF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCIRRF'
      '       (IDLANCIRRF,'
      '        DATALANCAMENTO,'
      '        IDPESSOA,'
      '        IDBENEFIRRF,'
      '        VLRBASE,'
      '        CODNATUREZA,'
      '        VLRIRRF,'
      '        FLGDARF,'
      '        NUMDOCUMENTO,'
      '        PERCIRRF,'
      '        FLGFOLHA,'
      '        IDPATRO,'
      '        IDPLANOPREV,'
      '        IDMODULO'
      '       )'
      'VALUES (:PIDLANCIRRF,'
      '        :PDATALANCAMENTO,'
      '        :PIDPESSOA,'
      '        :PIDBENEFIRRF,'
      '        :PVLRBASE,'
      '        :PCODNATUREZA,'
      '        :PVLRIRRF,'
      '        :PFLGDARF,'
      '        :PNUMDOCUMENTO,'
      '        :PPERCIRRF,'
      '        :PFLGFOLHA,'
      '        :PIDPATRO,'
      '        :PIDPLANOPREV,'
      '        :PIDMODULO'
      '       )'
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLANCIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDATALANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDBENEFIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRBASE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODNATUREZA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGDARF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMDOCUMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PPERCIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGFOLHA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptInput
      end>
  end
  object qryInsertLancxInforme: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO LANCXINFORME'
      '       (IDINFORME,'
      '        IDLANCIRRF,'
      '        VLRLANC'
      '       )'
      'VALUES (:PIDINFORME,'
      '        :PIDLANCIRRF,'
      '        :PVLRLANC'
      '       )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINFORME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDLANCIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRLANC'
        ParamType = ptInput
      end>
  end
  object qryInsertInforme: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO INFORME'
      '       (IDINFORME,'
      '        NOMEINFORME,'
      '        CODINFORME,'
      '        CODDIRF,'
      '        FLGIRRF,'
      '        FLGBASE,'
      '        FLGNATUREZA'
      '       )'
      'VALUES (:PIDINFORME,'
      '        :PNOMEINFORME,'
      '        :PCODINFORME,'
      '        :PCODDIRF,'
      '        :PFLGIRRF,'
      '        :PFLGBASE,'
      '        :PFLGNATUREZA'
      '       )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINFORME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOMEINFORME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODINFORME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCODDIRF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGIRRF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGBASE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGNATUREZA'
        ParamType = ptInput
      end>
  end
end
