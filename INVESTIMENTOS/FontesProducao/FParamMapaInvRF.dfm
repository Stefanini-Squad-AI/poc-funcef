inherited frmParamMapaInvRF: TfrmParamMapaInvRF
  Left = 363
  Top = 156
  HelpContext = 790530
  Caption = 'Consulta'
  ClientHeight = 374
  ClientWidth = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 431
    Height = 335
    inherited bvlSepTit: TBevel
      Width = 429
    end
    object pnlFundo1: TPanel [1]
      Left = 1
      Top = 45
      Width = 429
      Height = 289
      Align = alClient
      TabOrder = 1
      object lblDtIni: TLabel
        Left = 21
        Top = 16
        Width = 66
        Height = 13
        Caption = 'Data &Inicial'
        FocusControl = dtDataInicio
      end
      object Label2: TLabel
        Left = 146
        Top = 36
        Width = 8
        Height = 13
        Caption = 'a'
      end
      object lblPlanoPatro: TLabel
        Left = 20
        Top = 64
        Width = 126
        Height = 13
        Caption = '&Plano / Patrocinadora'
        FocusControl = dblPlanPrevCtbPatr
      end
      object lblDtFinal: TLabel
        Left = 163
        Top = 16
        Width = 59
        Height = 13
        Caption = 'Data &Final'
        FocusControl = dtDataFim
      end
      object Label4: TLabel
        Left = 20
        Top = 109
        Width = 94
        Height = 13
        Caption = 'Classe do &Título'
        FocusControl = dblClasse
      end
      object Label3: TLabel
        Left = 20
        Top = 155
        Width = 44
        Height = 13
        Caption = '&Emissor'
        FocusControl = dblEmissor
      end
      object lblInvestimento: TLabel
        Left = 20
        Top = 201
        Width = 73
        Height = 13
        Caption = 'In&vestimento'
        FocusControl = dblInvestimento
      end
      object Label1: TLabel
        Left = 19
        Top = 247
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
        FocusControl = dblSegmentacao
      end
      object dtDataInicio: TCMDateTimePicker
        Left = 20
        Top = 32
        Width = 117
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
        Left = 163
        Top = 32
        Width = 115
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
        OnExit = dtDataFimExit
      end
      object dblPlanPrevCtbPatr: TwwDBLookupCombo
        Left = 20
        Top = 80
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Plano / Patrocinadora'#9'F')
        LookupTable = qryPlanPrevCtbPatr
        LookupField = 'IDPLANPREVCTBPATR'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblPlanPrevCtbPatrChange
        OnCloseUp = dblPlanPrevCtbPatrCloseUp
      end
      object dblClasse: TwwDBLookupCombo
        Left = 20
        Top = 123
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCLASSETIT'#9'40'#9'Classe do Título'#9'F')
        DataField = 'IDCLASSETIT'
        LookupTable = qryClasse
        LookupField = 'IDCLASSETIT'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblClasseChange
        OnCloseUp = dblClasseCloseUp
      end
      object dblEmissor: TwwDBLookupCombo
        Left = 20
        Top = 170
        Width = 391
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'30'#9'Emissor'#9'F')
        DataField = 'IDEMISSOR'
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblEmissorChange
        OnCloseUp = dblEmissorCloseUp
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 20
        Top = 215
        Width = 391
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
        DataField = 'IDINVESTIMENTO'
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblSegmentacao: TwwDBLookupCombo
        Left = 19
        Top = 263
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'40'#9'Descrição'#9'F')
        LookupTable = qrySegmentacao
        LookupField = 'IDSEGMENTACAO'
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblPlanPrevCtbPatrChange
        OnCloseUp = dblPlanPrevCtbPatrCloseUp
      end
    end
    inherited pnlTitulo: TPanel
      Width = 429
      inherited lbNomDescricao: TfcLabel
        Width = 395
        Caption = 'Mapa de Movimentação em Renda Fixa'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 335
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 259
      DockPos = 440
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 90
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Ok'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 355
    Top = 9
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
    Left = 369
    Top = 119
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
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.IDCLASSETIT, C.DESCCLASSETIT'
      'FROM CLASSETITRENFIX C, OPERRENFIX O, INVESTIMENTO I'
      'WHERE O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND I.IDCLASSETIT = C.IDCLASSETIT'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      'ORDER BY DESCCLASSETIT')
    ValidateWithMask = True
    Left = 369
    Top = 162
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end>
    object qryClasseDESCCLASSETIT: TStringField
      DisplayLabel = 'Classe do Título'
      DisplayWidth = 40
      FieldName = 'DESCCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.DESCCLASSETIT'
      Size = 30
    end
    object qryClasseIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
      Visible = False
    end
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT E.IDEMISSOR, E.SIGLAEMISSOR'
      'FROM EMISSOR E, OPERRENFIX O, INVESTIMENTO I'
      'WHERE O.IDINVESTIMENTO = I.IDINVESTIMENTO'
      '  AND I.IDEMISSOR = E.IDEMISSOR'
      '  AND I.IDTIPOINVEST = 1'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      '  AND ((:IDCLASSETIT IS NULL) OR (I.IDCLASSETIT = :IDCLASSETIT))'
      'ORDER BY SIGLAEMISSOR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 367
    Top = 207
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end>
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 30
      FieldName = 'SIGLAEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT I.IDINVESTIMENTO, I.DESCINVESTIMENTO'
      'FROM INVESTIMENTO I, OPERRENFIX O'
      'WHERE (I.IDTIPOINVEST = 1)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVCTBPATR = :I' +
        'DPLANPREVCTBPATR))'
      '  AND ((:IDCLASSETIT IS NULL) OR (I.IDCLASSETIT = :IDCLASSETIT))'
      '  AND ((:IDEMISSOR IS NULL) OR (I.IDEMISSOR = :IDEMISSOR))'
      '  AND (I.IDINVESTIMENTO = O.IDINVESTIMENTO)'
      'ORDER BY I.DESCINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 367
    Top = 255
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCLASSETIT'
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
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 337
    Top = 77
  end
  object QryAnalitico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PP.PLANPRVCONTABPATRO||CL.DESCCLASSETIT PLANO_CLASSE,'
      '   PP.PLANPRVCONTABPATRO,'
      '   CL.DESCCLASSETIT AS CLASSE,'
      '   IV.DESCINVESTIMENTO AS INVESTIMENTO,'
      '   OP.DATAOPERACAO,'
      '   OP.VENCOPERACAO AS VENCIMENTO,'
      '   OP.IDOPERRENFIX,'
      '   SUB1.IDINVESTIMENTO,'
      '   SUB1.IDOPERRENFIXAPLIC,'
      '   SUB1.IDPLANPREVCTBPATR,'
      '   SUB1.VALORAPLICADO,'
      '   SUB1.SALDOANTERIOR,'
      '   (SUB1.SALDOANTERIOR +'
      '    SUB1.APLICACOES    +'
      '    SUB1.VLRIOF +'
      '    SUB1.VLRJUR +'
      '    SUB1.VLRCOR  +'
      '    SUB1.RESGATES +'
      
        '    Case when SUB1.RESGATES < 0 then (SUB1.RESGATES+(SUB1.SALDOA' +
        'NTERIOR + SUB1.VLRJUR + SUB1.VLRCOR ))*-1 when SUB1.RESGATES = 0' +
        ' then 0 else (SUB1.RESGATES+(SUB1.SALDOANTERIOR + SUB1.VLRJUR + ' +
        'SUB1.VLRCOR )) end+'
      
        '--    Case when SUB1.RESGATES < 0 then ((SUB1.RESGATES+(SUB1.SAL' +
        'DOANTERIOR + SUB1.VLRJUR + SUB1.VLRCOR ))*-1) else (SUB1.RESGATE' +
        'S+(SUB1.SALDOANTERIOR + SUB1.VLRJUR + SUB1.VLRCOR )) end+'
      '    SUB1.PAGTOJUR +'
      '    SUB1.TRCPLANO)  AS SALDO,'
      '--   SUB1.SALDOATUAL AS SALDO,'
      '   SUB1.VLRCOR AS CORRECAO,'
      '   SUB1.VLRJUR AS JUROS,'
      '   SUB1.VLRPROVPERDA,'
      '   SUB1.AGIODESAGIO,'
      '   SUB1.VLRIOF,'
      '   SUB1.RESGATES,'
      
        '   Case when SUB1.RESGATES < 0 then (SUB1.RESGATES+(SUB1.SALDOAN' +
        'TERIOR + SUB1.VLRJUR + SUB1.VLRCOR ))*-1 when SUB1.RESGATES = 0 ' +
        'then 0 else (SUB1.RESGATES+(SUB1.SALDOANTERIOR + SUB1.VLRJUR + S' +
        'UB1.VLRCOR )) end  AS LUCPREJ,'
      
        '-- Case when SUB1.RESGATES < 0 then (SUB1.RESGATES+(SUB1.SALDOAN' +
        'TERIOR + SUB1.VLRJUR + SUB1.VLRCOR ))*-1 else (SUB1.RESGATES+(SU' +
        'B1.SALDOANTERIOR + SUB1.VLRJUR + SUB1.VLRCOR )) end  AS LUCPREJ,'
      '--   SUB1.LUCPREJ  AS LUCPREJ,'
      '   SUB1.APLICACOES,'
      '   SUB1.PRINCIPAL,'
      '   SUB1.PAGTOJUR,'
      '   SUB1.TRCPLANO,'
      '   ('
      '    SUB1.SALDOANTERIOR +'
      '    SUB1.APLICACOES +'
      '    SUB1.VLRJUR +'
      '    SUB1.VLRCOR +'
      
        '    NVL((DECODE(SUB1.VLRPROVPERDA,0,0,((SUB1.VLRPCOR + SUB1.VLRP' +
        'JUR) * -1))),0) -'
      '    SUB1.RESGATES +'
      '    SUB1.LUCPREJ +'
      '    SUB1.PAGTOJUR -'
      '    SUB1.VLRIOF -'
      '    (SUB1.SALDOATUAL - SUB1.VLRIOF) +'
      '    SUB1.TRCPLANO'
      '   ) AS DIF,'
      '   SM.DESCSEGMENTACAO AS SEGMENTACAO'
      'FROM'
      
        '   INVESTIMENTO IV, CLASSETITRENFIX CL, OPERRENFIX OP, OPERRENFI' +
        'X OP1, EMISSOR EM, SEGMENTACAOMERCADO SM,'
      
        '   (SELECT OO.QTDEOPERACAO AS QTDEORIG, (OO.QTDEOPERACAO-OT.QTDT' +
        'RC) AS QTDETRC,'
      
        '           (OO.QTDEOPERACAO-OT.QTDTRC) / OO.QTDEOPERACAO AS PERC' +
        ','
      
        '           OO.IDINVESTIMENTO, OO.IDOPERRENFIXAPLIC, OO.IDOPERREN' +
        'FIXORIG'
      
        '    FROM (SELECT OOR.QTDEOPERACAO, OOR.IDINVESTIMENTO, OOR.IDOPE' +
        'RRENFIXAPLIC, OOR.IDOPERRENFIXORIG'
      '          FROM OPERRENFIX OOR'
      '          WHERE OOR.IDOPERRENFIX = OOR.IDOPERRENFIXAPLIC'
      '            AND OOR.IDOPERRENFIXORIG IS NULL ) OO,'
      
        '         (SELECT SUM(OTR.QTDEOPERACAO) AS QTDTRC, OTR.IDINVESTIM' +
        'ENTO, OTR.IDOPERRENFIXAPLIC, OTR.IDOPERRENFIXORIG'
      '          FROM OPERRENFIX OTR'
      '          WHERE OTR.IDTIPOOPERACAO = -97'
      
        '          GROUP BY OTR.IDINVESTIMENTO, OTR.IDOPERRENFIXAPLIC, OT' +
        'R.IDOPERRENFIXORIG ) OT'
      '    WHERE OO.IDINVESTIMENTO = OT.IDINVESTIMENTO'
      '      AND OO.IDOPERRENFIXAPLIC = OT.IDOPERRENFIXAPLIC ) TRO,'
      
        '   (SELECT SUM(OP1.QTDEOPERACAO) QTDTRC, SUM(OP2.QTDEOPERACAO) Q' +
        'TDORIG, (SUM(OP1.QTDEOPERACAO) / SUM(OP2.QTDEOPERACAO)) PERC,'
      
        '           OP1.IDINVESTIMENTO, OP1.IDOPERRENFIXAPLIC, OP1.IDOPER' +
        'RENFIXORIG'
      '    FROM OPERRENFIX OP1, OPERRENFIX OP2'
      '    WHERE OP1.IDTIPOOPERACAO = -98'
      '      AND OP1.IDOPERRENFIXORIG = OP2.IDOPERRENFIX'
      
        '    GROUP BY OP1.IDINVESTIMENTO, OP1.IDOPERRENFIXAPLIC, OP1.IDOP' +
        'ERRENFIXORIG) TRD,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || P' +
        'L.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      '--  SUB1 - SOMOTORIO DOS UNIONS'
      '   (SELECT'
      '       SUB.IDINVESTIMENTO,'
      '       SUB.IDOPERRENFIXAPLIC,'
      '       SUB.IDPLANPREVCTBPATR,'
      '       SUM(SUB.VALORAPLICADO) AS VALORAPLICADO,'
      '       SUM(SUB.SALDOANTERIOR) AS SALDOANTERIOR,'
      
        '       (SUM(SUB.SALDOATUAL) + SUM(SUB.VLRIOF) + SUM(SUB.RESGATES' +
        ') ) AS SALDOATUAL,'
      '       SUM(SUB.VLRCOR) AS VLRCOR,'
      '       SUM(SUB.VLRJUR) AS VLRJUR,'
      '       SUM(SUB.VLRPROVPERDA) AS VLRPROVPERDA,'
      '       SUM(SUB.VLRPCOR) AS VLRPCOR,'
      '       SUM(SUB.VLRPJUR) AS VLRPJUR,'
      '       SUM(SUB.AGIODESAGIO) AS AGIODESAGIO,'
      '       SUM(SUB.VLRIOF) AS VLRIOF,'
      '       SUM(SUB.RESGATES) AS RESGATES,'
      '       SUM(SUB.LUCPREJ) AS LUCPREJ,'
      '       SUM(SUB.APLICACOES) AS APLICACOES,'
      '       SUM(SUB.PRINCIPAL) AS PRINCIPAL,'
      '       SUM(SUB.PAGTOJUR) AS PAGTOJUR,'
      '       SUM(SUB.TRCPLANO) AS TRCPLANO'
      '    FROM'
      '--    SUB - UNION DOS SELECTS'
      '      ('
      '--     SALDO ANTERIOR'
      '       SELECT'
      '          HR.IDINVESTIMENTO,'
      '          HR.IDOPERRENFIXAPLIC,'
      '          HR.IDPLANPREVCTBPATR,'
      '          OP.DATAOPERACAO,'
      '          (OP.VENCOPERACAO) AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      
        '          DECODE(:FLGREGIMECXCOMP, '#39'S'#39', NVL(HR.SALDOVLRHISTRENFI' +
        ',0) - NVL(JRO.VLRPAGTOJURO,0), NVL(HR.SALDOVLRHISTRENFI,0) ) AS ' +
        'SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      '          HISTRENFIX HR, OPERRENFIX OP,'
      
        '          (SELECT (O.VLROPERACAO) AS VLRPAGTOJURO, O.IDOPERRENFI' +
        'XAPLIC, O.DATAOPERACAO AS DATAHISTRENFIX, O.IDINVESTIMENTO'
      '           FROM OPERRENFIX O, PARAMINVEST P'
      '           WHERE'
      
        '             (((P.FLGREGIMECXCOMP  = '#39'S'#39') AND (O.DATALIQUIDACAO ' +
        'BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/' +
        'MM/YYYY'#39'))) OR'
      
        '              ((NVL(P.FLGREGIMECXCOMP,'#39'N'#39') = '#39'N'#39') AND (O.DATAOPE' +
        'RACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO_DATE(:DATAFI' +
        'M,'#39'DD/MM/YYYY'#39'))))'
      
        '             AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '             AND (O.DATAOPERACAO <> O.DATALIQUIDACAO)'
      '             AND (O.IDTIPOOPERACAO = -17) ) JRO'
      '       WHERE (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '         AND (HR.SALDOQTDHISTRENFI > 0)'
      
        '         AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ') OR (OP.VENCOPERACAO IS NULL))'
      
        '         AND ((:IDPLANPREVCTBPATR IS NULL) OR (HR.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR))'
      '         AND (HR.IDHISTRENFIX IN (WITH'
      
        '                                    A AS(SELECT MAX(H2.DATAHISTR' +
        'ENFIX) DATAHISTRENFIX, H2.IDPLANPREVCTBPATR , H2.IDINVESTIMENTO ' +
        ', H2.IDOPERRENFIXAPLIC '
      '                                         FROM HISTRENFIX H2'
      
        '                                         WHERE (H2.DATAHISTRENFI' +
        'X < TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      
        '                                         GROUP BY H2.IDPLANPREVC' +
        'TBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)'
      '                                  SELECT MAX(H1.IDHISTRENFIX)'
      '                                  FROM HISTRENFIX H1,A'
      
        '                                  WHERE (H1.DATAHISTRENFIX     =' +
        ' A.DATAHISTRENFIX    AND'
      
        '                                         H1.IDPLANPREVCTBPATR  =' +
        ' A.IDPLANPREVCTBPATR AND'
      
        '                                         H1.IDINVESTIMENTO     =' +
        ' A.IDINVESTIMENTO    AND '
      
        '                                         H1.IDOPERRENFIXAPLIC  =' +
        ' A.IDOPERRENFIXAPLIC) '
      
        '                                  GROUP BY H1.DATAHISTRENFIX, H1' +
        '.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '         AND HR.IDOPERRENFIXAPLIC = JRO.IDOPERRENFIXAPLIC(+)'
      '         AND HR.DATAHISTRENFIX    = JRO.DATAHISTRENFIX(+)'
      '       UNION'
      '--     SALDO ATUAL'
      '       SELECT'
      '          HR.IDINVESTIMENTO,'
      '          HR.IDOPERRENFIXAPLIC,'
      '          HR.IDPLANPREVCTBPATR,'
      '          OP.DATAOPERACAO,'
      '          (OP.VENCOPERACAO) AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      
        '          DECODE(:FLGREGIMECXCOMP, '#39'S'#39', NVL(HR.SALDOVLRHISTRENFI' +
        ',0) + NVL(JRO.VLRPAGTOJURO,0) , NVL(HR.SALDOVLRHISTRENFI,0) ) AS' +
        ' SALDOATUAL,'
      '          0.VLRCOR,'
      '          0.VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0.VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          HI.PUACUITEM AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      '          HISTRENFIX HR, OPERRENFIX OP, HISTRENFIXXITENS HI,'
      
        '          (SELECT (O.VLROPERACAO) AS VLRPAGTOJURO, O.IDOPERRENFI' +
        'XAPLIC, O.DATAOPERACAO AS DATAHISTRENFIX, O.IDINVESTIMENTO'
      '           FROM OPERRENFIX O'
      
        '           WHERE (O.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM' +
        '/YYYY'#39') AND TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '             AND ((:IDPLANPREVCTBPATR IS NULL) OR (O.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      '             AND (O.DATAOPERACAO <> O.DATALIQUIDACAO)'
      '             AND (O.IDTIPOOPERACAO = -17) ) JRO'
      '       WHERE (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '         AND (HR.SALDOQTDHISTRENFI > 0)'
      '         AND (HI.IDITEMRENFIX = -1)'
      
        '         AND ((OP.VENCOPERACAO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')' +
        ') OR (OP.VENCOPERACAO IS NULL))'
      
        '         AND ((:IDPLANPREVCTBPATR IS NULL) OR (HR.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR))'
      
        '         AND (HR.IDHISTRENFIX IN (WITH B AS (SELECT MAX(H2.DATAH' +
        'ISTRENFIX)DATAHISTRENFIX , H2.IDPLANPREVCTBPATR , H2.IDINVESTIME' +
        'NTO , H2.IDOPERRENFIXAPLIC'
      '                                             FROM HISTRENFIX H2'
      
        '                                             WHERE (H2.DATAHISTR' +
        'ENFIX BETWEEN TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        '              TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '                                             GROUP BY H2.IDPLANP' +
        'REVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC)'
      '                                  SELECT MAX(H1.IDHISTRENFIX)'
      '                                  FROM HISTRENFIX H1,B'
      
        '                                  WHERE (H1.DATAHISTRENFIX <= TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '                                  AND (H1.DATAHISTRENFIX   = B.D' +
        'ATAHISTRENFIX  AND'
      
        '                                       H1.IDPLANPREVCTBPATR =B.I' +
        'DPLANPREVCTBPATR  AND'
      
        '                                       H1.IDINVESTIMENTO  = B.ID' +
        'INVESTIMENTO   AND'
      
        '                                       H1.IDOPERRENFIXAPLIC = B.' +
        'IDOPERRENFIXAPLIC)'
      
        'GROUP BY H1.DATAHISTRENFIX, H1.IDPLANPREVCTBPATR, H1.IDINVESTIME' +
        'NTO, H1.IDOPERRENFIXAPLIC))'
      '         AND HR.IDOPERRENFIXAPLIC = JRO.IDOPERRENFIXAPLIC(+)'
      '         AND HR.DATAHISTRENFIX    = JRO.DATAHISTRENFIX(+)'
      '         AND HR.IDHISTRENFIX      = HI.IDHISTRENFIX'
      ''
      '       UNION'
      '--     VALORES DOS ITENS'
      '       SELECT'
      '          VAL.IDINVESTIMENTO,'
      '          VAL.IDOPERRENFIXAPLIC,'
      '          VAL.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          VAL.VLRCOR,'
      '          VAL.VLRJUR,'
      
        '          (DECODE(VAL.VLRPER,0,0,(VAL.VLRPCOR + VAL.VLRPJUR) * -' +
        '1)) AS VLRPROVPERDA,'
      '          VAL.VLRPCOR,'
      '          VAL.VLRPJUR,'
      '          (VAL.VLRAGI - VAL.VLRDES) AS AGIODESAGIO,'
      '          (VAL.VLRIOF * -1) AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      '       (SELECT'
      
        '           (HIS.IDINVESTIMENTO || HIS.IDOPERRENFIXAPLIC || HIS.I' +
        'DPLANPREVCTBPATR) AS ID,'
      
        '           HIS.IDINVESTIMENTO, HIS.IDOPERRENFIXAPLIC, HIS.IDPLAN' +
        'PREVCTBPATR,'
      
        '           SUM(DECODE(HIS.POUP, '#39'S'#39', DECODE(NVL(COR.VLRITEM,0), ' +
        '0, NVL(COR.PUITEM,0), NVL(COR.VLRITEM,0)),'
      
        '               DECODE(COR.TIPOITEM, '#39'V'#39', NVL(COR.PUITEM,0), DECO' +
        'DE(NVL(COR.VLRITEM,0) + NVL(COR.VLRACUITEM,0), 0, (ROUND(QTD.PUA' +
        'CUITEM * NVL(COR.PUITEM,0),2)),NVL(COR.VLRITEM,0))))) AS VLRCOR,'
      
        '           SUM(DECODE(HIS.POUP, '#39'S'#39', DECODE(NVL(JUR.VLRITEM,0), ' +
        '0, NVL(JUR.PUITEM,0), NVL(JUR.VLRITEM,0)),'
      
        '               DECODE(JUR.TIPOITEM, '#39'V'#39', NVL(JUR.PUITEM,0), DECO' +
        'DE(NVL(JUR.VLRITEM,0) + NVL(JUR.VLRACUITEM,0), 0, (ROUND(QTD.PUA' +
        'CUITEM * NVL(JUR.PUITEM,0),2)),NVL(JUR.VLRITEM,0))))) AS VLRJUR,'
      
        '           SUM(DECODE(HIS.POUP, '#39'S'#39', DECODE(NVL(PCOR.VLRITEM,0),' +
        ' 0, NVL(PCOR.PUITEM,0), NVL(PCOR.VLRITEM,0)),'
      
        '               DECODE(PCOR.TIPOITEM, '#39'V'#39', NVL(PCOR.PUITEM,0), DE' +
        'CODE(NVL(PCOR.VLRITEM,0)+NVL(PCOR.VLRACUITEM,0), 0, (ROUND(QTD.P' +
        'UACUITEM * NVL(PCOR.PUITEM,0), 2)), NVL(PCOR.VLRITEM,0))))) AS V' +
        'LRPCOR,'
      
        '           SUM(DECODE(HIS.POUP, '#39'S'#39', DECODE(NVL(PJUR.VLRITEM,0),' +
        ' 0, NVL(PJUR.PUITEM,0), NVL(PJUR.VLRITEM,0)),'
      
        '               DECODE(PJUR.TIPOITEM, '#39'V'#39', NVL(PJUR.PUITEM,0), DE' +
        'CODE(NVL(PJUR.VLRITEM,0)+NVL(PJUR.VLRACUITEM,0), 0,(ROUND(QTD.PU' +
        'ACUITEM * NVL(PJUR.PUITEM,0), 2)), NVL(PJUR.VLRITEM,0))))) AS VL' +
        'RPJUR,'
      
        '           SUM(DECODE(AGI.TIPOITEM,'#39'V'#39', NVL(AGI.PUITEM,0), DECOD' +
        'E(NVL(AGI.VLRITEM,0)+NVL(AGI.VLRACUITEM,0), 0, (ROUND(QTD.PUACUI' +
        'TEM * NVL(AGI.PUITEM,0), 2)), NVL(AGI.VLRITEM,0)))) AS VLRAGI,'
      
        '           SUM(DECODE(DES.TIPOITEM,'#39'V'#39', NVL(DES.PUITEM,0), DECOD' +
        'E(NVL(DES.VLRITEM,0)+NVL(DES.VLRACUITEM,0), 0, (ROUND(QTD.PUACUI' +
        'TEM * NVL(DES.PUITEM,0), 2)), NVL(DES.VLRITEM,0)))) AS VLRDES,'
      
        '           SUM(DECODE(PPER.TIPOITEM,'#39'V'#39', NVL(PPER.PUITEM,0), DEC' +
        'ODE(NVL(PPER.VLRITEM,0)+NVL(PPER.VLRACUITEM,0), 0, (ROUND(QTD.PU' +
        'ACUITEM * NVL(PPER.PUITEM,0), 2)), NVL(PPER.VLRITEM,0)))) AS VLR' +
        'PER,'
      '           SUM(NVL(IOF.VLRIOF,0)) AS VLRIOF'
      '        FROM (SELECT'
      
        '                 HI0.IDHISTRENFIX, HI0.IDINVESTIMENTO, HI0.IDOPE' +
        'RRENFIXAPLIC, HI0.IDPLANPREVCTBPATR,'
      '                 HI0.IDOPERRENFIX,'
      
        '                 DECODE(IV.IDCLASSETIT, PR.IDCLASSPOUPBLOQ, '#39'S'#39',' +
        ' DECODE(IV.IDCLASSETIT, PR.IDCLASSETIT, '#39'S'#39', '#39'N'#39')) AS POUP'
      '              FROM HISTRENFIX HI0, INVESTIMENTO IV,'
      
        '                   (SELECT IDCLASSPOUPBLOQ, IDCLASSETIT FROM PAR' +
        'AMINVEST) PR'
      
        '              WHERE (HI0.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI' +
        ','#39'DD/MM/YYYY'#39') AND'
      
        '                                                TO_DATE(:DATAFIM' +
        ', '#39'DD/MM/YYYY'#39'))'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (HI0.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      '               AND (HI0.TIPMOVHISRENFIX = '#39'ATU'#39')'
      
        '               AND (HI0.IDINVESTIMENTO = IV.IDINVESTIMENTO)) HIS' +
        ','
      ''
      
        '             (SELECT HI2.IDHISTRENFIX, HI2.PUACUITEM, IT2.TIPOIT' +
        'EM, NVL(HI2.VLRITEM,0) AS VLRITEM'
      '              FROM HISTRENFIXXITENS HI2, ITEMRENFIX IT2'
      '              WHERE HI2.IDITEMRENFIX = -2'
      '                AND HI2.IDITEMRENFIX = IT2.IDITEMRENFIX) QTD,'
      ''
      
        '             (SELECT HI26.IDHISTRENFIX, SUM(HI26.PUITEM) AS PUIT' +
        'EM, IT26.TIPOITEM,'
      
        '                     SUM(NVL(HI26.VLRITEM,0)) AS VLRITEM, SUM(NV' +
        'L(HI26.VLRACUITEM,0)) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI26, ITEMRENFIX IT26'
      '              WHERE IT26.TIPOITEM = '#39'M'#39
      '                AND HI26.IDITEMRENFIX = IT26.IDITEMRENFIX'
      '              GROUP BY HI26.IDHISTRENFIX, IT26.TIPOITEM) COR,'
      ''
      
        '             (SELECT HI27.IDHISTRENFIX, HI27.PUITEM, IT27.TIPOIT' +
        'EM,'
      
        '                     NVL(HI27.VLRITEM,0) AS VLRITEM, NVL(HI27.VL' +
        'RACUITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI27, ITEMRENFIX IT27'
      '              WHERE IT27.TIPOITEM = '#39'T'#39
      '                AND HI27.IDITEMRENFIX = IT27.IDITEMRENFIX) JUR,'
      ''
      '             (SELECT HI.IDHISTRENFIX, HI.PUITEM, IT.TIPOITEM,'
      
        '                     NVL(HI.VLRITEM,0) AS VLRITEM, NVL(HI.VLRACU' +
        'ITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI, ITEMRENFIX IT'
      '              WHERE HI.IDITEMRENFIX = 26'
      '                AND HI.IDITEMRENFIX = IT.IDITEMRENFIX) PCOR,'
      ''
      '             (SELECT HI.IDHISTRENFIX, HI.PUITEM, IT.TIPOITEM,'
      
        '                     NVL(HI.VLRITEM,0) AS VLRITEM, NVL(HI.VLRACU' +
        'ITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI, ITEMRENFIX IT'
      '              WHERE HI.IDITEMRENFIX = 27'
      '                AND HI.IDITEMRENFIX = IT.IDITEMRENFIX) PJUR,'
      ''
      '             (SELECT HI.IDHISTRENFIX, HI.PUITEM, IT.TIPOITEM,'
      
        '                     NVL(HI.VLRITEM,0) AS VLRITEM, NVL(HI.VLRACU' +
        'ITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI, ITEMRENFIX IT'
      '              WHERE HI.IDITEMRENFIX = -15'
      '                AND HI.IDITEMRENFIX = IT.IDITEMRENFIX) PPER,'
      ''
      
        '             (SELECT HI19.IDHISTRENFIX, HI19.PUITEM, IT19.TIPOIT' +
        'EM,'
      
        '                     NVL(HI19.VLRITEM,0) AS VLRITEM, NVL(HI19.VL' +
        'RACUITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI19, ITEMRENFIX IT19'
      '              WHERE HI19.IDITEMRENFIX = -19'
      '                AND HI19.IDITEMRENFIX = IT19.IDITEMRENFIX) AGI,'
      ''
      
        '             (SELECT HI20.IDHISTRENFIX, HI20.PUITEM, IT20.TIPOIT' +
        'EM,'
      
        '                     NVL(HI20.VLRITEM,0) AS VLRITEM, NVL(HI20.VL' +
        'RACUITEM,0) AS VLRACUITEM'
      '              FROM HISTRENFIXXITENS HI20, ITEMRENFIX IT20'
      '              WHERE HI20.IDITEMRENFIX = -20'
      '                AND HI20.IDITEMRENFIX = IT20.IDITEMRENFIX) DES,'
      ''
      
        '             (SELECT HI8.IDHISTRENFIX, NVL(HI8.PUACUITEM,0) AS V' +
        'LRIOF, IT8.TIPOITEM'
      
        '              FROM HISTRENFIXXITENS HI8, ITEMRENFIX IT8, HISTREN' +
        'FIX HH8'
      
        '              WHERE (HH8.DATAHISTRENFIX = TO_DATE(:DATAFIM, '#39'DD/' +
        'MM/YYYY'#39'))'
      '                AND HI8.IDITEMRENFIX = -8'
      '--                AND HI8.PUACUITEM > 0'
      '                AND HH8.TIPMOVHISRENFIX = '#39'ATU'#39
      '                AND HI8.IDITEMRENFIX = IT8.IDITEMRENFIX'
      '                AND HI8.IDHISTRENFIX = HH8.IDHISTRENFIX) IOF'
      ''
      '       WHERE HIS.IDHISTRENFIX = QTD.IDHISTRENFIX'
      '         AND HIS.IDHISTRENFIX = COR.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = JUR.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = PCOR.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = PJUR.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = PPER.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = AGI.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = DES.IDHISTRENFIX(+)'
      '         AND HIS.IDHISTRENFIX = IOF.IDHISTRENFIX(+)'
      
        '       GROUP BY HIS.IDINVESTIMENTO, HIS.IDOPERRENFIXAPLIC, HIS.I' +
        'DPLANPREVCTBPATR) VAL'
      ''
      '       UNION'
      '--     RESGATES'
      '       SELECT'
      '          RSG.IDINVESTIMENTO,'
      '          RSG.IDOPERRENFIXAPLIC,'
      '          RSG.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          (RSG.VLROPERACAO * -1) AS RESGATES,'
      '          (RSG.VLRLUCPREJ) AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      
        '         (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || O' +
        'P.IDPLANPREVCTBPATR) AS ID,'
      '             OP.IDINVESTIMENTO,'
      '             OP.IDOPERRENFIXAPLIC,'
      '             OP.IDPLANPREVCTBPATR,'
      
        '             SUM(NVL(OP.VLROPERACAO,0)) - SUM(DECODE(NVL(LUCPREJ' +
        '.VLRITEM,0),0,ROUND(NVL(LUCPREJ.PUITEM,0),2),NVL(LUCPREJ.VLRITEM' +
        ',0) )) AS VLROPERLIQ,'
      '             SUM(NVL(OP.VLROPERACAO,0)) AS VLROPERACAO,'
      
        '             SUM(DECODE(NVL(LUCPREJ.VLRITEM,0),0,ROUND(NVL(LUCPR' +
        'EJ.PUITEM,0),2),NVL(LUCPREJ.VLRITEM,0) )) AS VLRLUCPREJ'
      '          FROM OPERRENFIX OP, TIPOOPERACAO TP,'
      
        '             (SELECT HI.IDHISTRENFIX, HI.PUITEM, HT.IDOPERRENFIX' +
        ', HI.VLRITEM'
      
        '              FROM HISTRENFIXXITENS HI, ITEMRENFIX IT, HISTRENFI' +
        'X HT'
      '              WHERE HI.IDITEMRENFIX IN (-9,-10)'
      
        '                AND ((:IDPLANPREVCTBPATR IS NULL) OR (HT.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                AND HT.DATAHISTRENFIX BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39')'
      '                AND HI.PUITEM <> 0'
      '                AND HT.TIPMOVHISRENFIX = '#39'OPE'#39
      '                AND HT.NATURMOVHISTRENFI = '#39'D'#39
      '                AND HI.IDITEMRENFIX = IT.IDITEMRENFIX'
      '                AND HI.IDHISTRENFIX = HT.IDHISTRENFIX) LUCPREJ'
      '          WHERE TP.IDTIPOINVEST = 1'
      
        '            AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR))'
      
        '            AND ((TP.IDTIPOOPERACAO > 0) AND (TP.NATUREZAOPERACA' +
        'O = '#39'D'#39'))'
      
        '            AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39') AND'
      
        '                                        TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39')'
      '            AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '            AND OP.IDOPERRENFIX = LUCPREJ.IDOPERRENFIX(+)'
      
        '          GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.I' +
        'DPLANPREVCTBPATR) RSG'
      ''
      '       UNION'
      '--     APLICACOES'
      '       SELECT'
      '          APL.IDINVESTIMENTO,'
      '          APL.IDOPERRENFIXAPLIC,'
      '          APL.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          (APL.VLROPERACAO) AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      
        '          (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || ' +
        'OP.IDPLANPREVCTBPATR) AS ID,'
      '              OP.IDINVESTIMENTO,'
      '              OP.IDOPERRENFIXAPLIC,'
      '              OP.IDPLANPREVCTBPATR,'
      '              SUM(NVL(OP.VLROPERACAO,0))  AS VLROPERACAO'
      '           FROM OPERRENFIX OP, TIPOOPERACAO TP'
      '           WHERE TP.IDTIPOINVEST = 1'
      '              AND TP.CODTIPDOC IS NOT NULL'
      
        '              AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      
        '              AND ((TP.IDTIPOOPERACAO > 0) AND (TP.NATUREZAOPERA' +
        'CAO = '#39'A'#39'))'
      
        '              AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/M' +
        'M/YYYY'#39') AND'
      
        '                                          TO_DATE(:DATAFIM,'#39'DD/M' +
        'M/YYYY'#39')'
      '              AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      
        '           GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.' +
        'IDPLANPREVCTBPATR) APL'
      ''
      '       UNION'
      '--     VALOR APLICADO'
      '       SELECT'
      '          VLRAPL1.IDINVESTIMENTO,'
      '          VLRAPL1.IDOPERRENFIXAPLIC,'
      '          VLRAPL1.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          VLRAPL1.VLROPERACAO AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      
        '          (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || ' +
        'OP.IDPLANPREVCTBPATR) AS ID,'
      '                  OP.IDINVESTIMENTO,'
      '                  OP.IDOPERRENFIXAPLIC,'
      '                  OP.IDPLANPREVCTBPATR,'
      '                  SUM(NVL(OP.VLROPERACAO,0))  AS VLROPERACAO'
      '           FROM OPERRENFIX OP, TIPOOPERACAO TP'
      '           WHERE TP.IDTIPOINVEST = 1'
      
        '              AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPRE' +
        'VCTBPATR = :IDPLANPREVCTBPATR))'
      '              AND (OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC)'
      '              AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      
        '           GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.' +
        'IDPLANPREVCTBPATR) VLRAPL1'
      '       UNION'
      '       SELECT'
      '          VLRAPL2.IDINVESTIMENTO,'
      '          VLRAPL2.IDOPERRENFIXAPLIC,'
      '          VLRAPL2.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          VLRAPL2.VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      
        '          (SELECT (HAP1.IDINVESTIMENTO || HAP1.IDOPERRENFIXAPLIC' +
        ' || HAP1.IDPLANPREVCTBPATR) AS ID,'
      '                  HAP1.IDINVESTIMENTO,'
      '                  HAP1.IDOPERRENFIXAPLIC,'
      '                  HAP1.IDPLANPREVCTBPATR,'
      
        '                  SUM(NVL(HAP1.VLRHISTRENFIX,0) + NVL(HAPI1.PUIT' +
        'EM,0))  AS VALORAPLICADO'
      '           FROM HISTRENFIX HAP1, HISTRENFIXXITENS HAPI1'
      
        '           WHERE ((:IDPLANPREVCTBPATR IS NULL) OR (HAP1.IDPLANPR' +
        'EVCTBPATR = :IDPLANPREVCTBPATR))'
      '             AND HAP1.IDTIPOOPERACAO = -98'
      
        '             AND HAP1.DATAHISTRENFIX <= TO_DATE(:DATAINI,'#39'DD/MM/' +
        'YYYY'#39')'
      '             AND HAPI1.IDHISTRENFIX = HAP1.IDHISTRENFIX'
      '             AND HAPI1.IDITEMRENFIX = -15'
      
        '           GROUP BY HAP1.IDINVESTIMENTO, HAP1.IDOPERRENFIXAPLIC,' +
        ' HAP1.IDPLANPREVCTBPATR) VLRAPL2'
      '       UNION'
      '--     PAGAMENTOS DE JUROS'
      '       SELECT'
      '          PAGJUR.IDINVESTIMENTO,'
      '          PAGJUR.IDOPERRENFIXAPLIC,'
      '          PAGJUR.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          (PAGJUR.VLROPERACAO * -1) AS PAGTOJUR,'
      '          0 AS TRCPLANO'
      '       FROM'
      
        '          (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || ' +
        'OP.IDPLANPREVCTBPATR) AS ID,'
      '              OP.IDINVESTIMENTO,'
      '              OP.IDOPERRENFIXAPLIC,'
      '              OP.IDPLANPREVCTBPATR,'
      '              SUM(NVL(OP.VLROPERACAO,0)) AS VLROPERACAO'
      '           FROM OPERRENFIX OP, TIPOOPERACAO TP'
      '           WHERE TP.IDTIPOINVEST = 1'
      '             AND TP.CODTIPDOC IS NOT NULL'
      
        '             AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREV' +
        'CTBPATR = :IDPLANPREVCTBPATR))'
      '             AND (TP.IDTIPOOPERACAO IN (-17,-18,-19))'
      '             AND ('
      '                  ((NVL(:FLGREGIMECXCOMP, '#39'N'#39') = '#39'N'#39') AND'
      
        '                   (OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD' +
        '/MM/YYYY'#39') AND'
      
        '                                            TO_DATE(:DATAFIM,'#39'DD' +
        '/MM/YYYY'#39')))'
      '                  OR'
      '                  ((:FLGREGIMECXCOMP = '#39'S'#39') AND'
      
        '                   (OP.DATALIQUIDACAO BETWEEN TO_DATE(:DATAINI,'#39 +
        'DD/MM/YYYY'#39') AND'
      
        '                                              TO_DATE(:DATAFIM,'#39 +
        'DD/MM/YYYY'#39')))'
      '                 )'
      ''
      '             AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      
        '          GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.I' +
        'DPLANPREVCTBPATR) PAGJUR'
      ''
      '       UNION'
      '--     TRANSFERENCIA ENTRE PLANOS'
      '       SELECT'
      '          TRC.IDINVESTIMENTO,'
      '          TRC.IDOPERRENFIXAPLIC,'
      '          TRC.IDPLANPREVCTBPATR,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS DATAOPERACAO,'
      '          TO_DATE('#39#39','#39'DD/MM/YYYY'#39') AS VENCIMENTO,'
      '          0 AS VALORAPLICADO,'
      '          0 AS SALDOANTERIOR,'
      '          0 AS SALDOATUAL,'
      '          0 AS VLRCOR,'
      '          0 AS VLRJUR,'
      '          0 AS VLRPROVPERDA,'
      '          0 AS VLRPCOR,'
      '          0 AS VLRPJUR,'
      '          0 AS AGIODESAGIO,'
      '          0 AS VLRIOF,'
      '          0 AS RESGATES,'
      '          0 AS LUCPREJ,'
      '          0 AS APLICACOES,'
      '          0 AS PRINCIPAL,'
      '          0 AS PAGTOJUR,'
      '          (TRC.VLROPERACAO) AS TRCPLANO'
      '       FROM'
      
        '       (SELECT (OP.IDINVESTIMENTO || OP.IDOPERRENFIXAPLIC || OP.' +
        'IDPLANPREVCTBPATR) AS ID,'
      '           OP.IDINVESTIMENTO,'
      '           OP.IDOPERRENFIXAPLIC,'
      '           OP.IDPLANPREVCTBPATR,'
      
        '           SUM(DECODE(OP.IDTIPOOPERACAO,-97,(OP.VLROPERACAO * -1' +
        '),(OP.VLROPERACAO))) AS VLROPERACAO'
      '         FROM OPERRENFIX OP'
      '         WHERE (OP.IDTIPOOPERACAO in(-97,-98))'
      
        '           AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR))'
      
        '           AND OP.DATAOPERACAO BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/Y' +
        'YYY'#39') AND'
      
        '                                       TO_DATE(:DATAFIM,'#39'DD/MM/Y' +
        'YYY'#39')'
      ''
      
        '      GROUP BY OP.IDINVESTIMENTO, OP.IDOPERRENFIXAPLIC, OP.IDPLA' +
        'NPREVCTBPATR) TRC) SUB'
      
        '   GROUP BY SUB.IDINVESTIMENTO, SUB.IDOPERRENFIXAPLIC, SUB.IDPLA' +
        'NPREVCTBPATR) SUB1'
      'WHERE'
      '   -- Para nao trazer saldos anterior a data anterior'
      
        '   OP.IDOPERRENFIX IN ( WITH  C AS (SELECT MAX(H1.DATAHISTRENFIX' +
        ')DATAHISTRENFIX , H1.IDINVESTIMENTO , H1.IDOPERRENFIXAPLIC , H1.' +
        'IDPLANPREVCTBPATR'
      '                                      FROM HISTRENFIX H1'
      
        '                                      WHERE (H1.DATAHISTRENFIX B' +
        'ETWEEN TO_DATE(:DATAMIN,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                                ' +
        '       TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        '                                        AND ((:IDPLANPREVCTBPATR' +
        ' IS NULL) OR (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                      GROUP BY H1.IDINVESTIMENTO' +
        ', H1.IDOPERRENFIXAPLIC, H1.IDPLANPREVCTBPATR)'
      ''
      '                        SELECT DISTINCT H.IDOPERRENFIXAPLIC'
      '                            FROM HISTRENFIX H ,C'
      
        '                             WHERE (H.DATAHISTRENFIX = C.DATAHIS' +
        'TRENFIX'
      
        '                                    AND H.IDINVESTIMENTO = C.IDI' +
        'NVESTIMENTO'
      
        '                                    AND H.IDOPERRENFIXAPLIC = C.' +
        'IDOPERRENFIXAPLIC'
      
        '                                    AND H.IDPLANPREVCTBPATR =C.I' +
        'DPLANPREVCTBPATR)'
      '                                      )'
      ''
      ''
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      
        '   AND ((:IDSEGMENTACAO IS NULL) OR (SM.IDSEGMENTACAO = :IDSEGME' +
        'NTACAO))'
      
        '   AND ((:IDINVESTIMENTO IS NULL) OR (:IDINVESTIMENTO = IV.IDINV' +
        'ESTIMENTO))'
      
        '   AND ((:IDCLASSETIT IS NULL) OR (:IDCLASSETIT = CL.IDCLASSETIT' +
        '))'
      '   AND ((:IDEMISSOR IS NULL) OR (:IDEMISSOR = IV.IDEMISSOR))'
      '   AND SUB1.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '   AND SUB1.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '   AND SUB1.IDOPERRENFIXAPLIC = OP.IDOPERRENFIXAPLIC'
      '   AND OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC'
      '   AND IV.IDCLASSETIT= CL.IDCLASSETIT'
      '   AND OP.IDOPERRENFIXORIG = OP1.IDOPERRENFIX(+)'
      '   AND SUB1.IDINVESTIMENTO = TRO.IDINVESTIMENTO(+)'
      '   AND SUB1.IDOPERRENFIXAPLIC = TRO.IDOPERRENFIXAPLIC(+)'
      '   AND SUB1.IDINVESTIMENTO = TRD.IDINVESTIMENTO(+)'
      '   AND SUB1.IDOPERRENFIXAPLIC = TRD.IDOPERRENFIXAPLIC(+)'
      '   AND IV.IDEMISSOR = EM.IDEMISSOR'
      '   AND EM.IDSEGMENTACAO = SM.IDSEGMENTACAO'
      
        'ORDER BY   PP.PLANPRVCONTABPATRO||CL.DESCCLASSETIT,PP.PLANPRVCON' +
        'TABPATRO, CL.DESCCLASSETIT, IV.DESCINVESTIMENTO, OP.DATAOPERACAO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 265
    Top = 69
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FLGREGIMECXCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGREGIMECXCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGREGIMECXCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGREGIMECXCOMP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAMIN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDSEGMENTACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCLASSETIT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
  end
  object qrySegmentacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDSEGMENTACAO, '
      '  DESCSEGMENTACAO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE IDGRUPO = 2')
    ValidateWithMask = True
    Left = 369
    Top = 161
    object qrySegmentacaoDESCSEGMENTACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object qrySegmentacaoIDSEGMENTACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
      Visible = False
    end
  end
end
