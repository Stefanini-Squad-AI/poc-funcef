inherited frmAcertaCustodia: TfrmAcertaCustodia
  Left = 251
  Top = 104
  HelpContext = 790305
  Caption = 'Operação'
  ClientHeight = 450
  ClientWidth = 660
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 24
    Top = 154
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  object Label8: TLabel [1]
    Left = 308
    Top = 9
    Width = 86
    Height = 13
    Caption = 'Saldo Liberado'
  end
  object Label11: TLabel [2]
    Left = 10
    Top = 227
    Width = 68
    Height = 13
    Caption = 'Custodiante'
  end
  inherited pnlFundo: TPanel
    Width = 660
    Height = 410
    inherited bvlSepTit: TBevel
      Width = 658
    end
    object Label2: TLabel [1]
      Left = 14
      Top = 87
      Width = 145
      Height = 13
      Caption = 'Carteira de Investimentos'
    end
    object Label1: TLabel [2]
      Left = 15
      Top = 127
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label3: TLabel [3]
      Left = 14
      Top = 168
      Width = 26
      Height = 13
      Caption = 'Lote'
    end
    object Label5: TLabel [4]
      Left = 14
      Top = 208
      Width = 68
      Height = 13
      Caption = 'Custodiante'
    end
    object Label6: TLabel [5]
      Left = 14
      Top = 250
      Width = 32
      Height = 13
      Caption = 'Data '
    end
    object Label7: TLabel [6]
      Left = 498
      Top = 370
      Width = 119
      Height = 13
      Caption = 'Quantidade a ajustar'
    end
    object Label12: TLabel [7]
      Left = 128
      Top = 250
      Width = 152
      Height = 13
      Caption = 'Motivo de Bloqueio/Desbl.'
      Visible = False
    end
    object Label9: TLabel [8]
      Left = 498
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object lblPlanoPatro: TLabel [9]
      Left = 15
      Top = 47
      Width = 126
      Height = 13
      Caption = 'Plano / Patrocinadora'
    end
    inherited pnlTitulo: TPanel
      Width = 658
      inherited lbNomDescricao: TfcLabel
        Width = 217
        Caption = 'Ajuste de Quantidade'
      end
    end
    object LkcCarteira: TwwDBLookupCombo
      Left = 15
      Top = 102
      Width = 280
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'40'#9'Descrição'#9'F')
      LookupTable = QryCarteira
      LookupField = 'ID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = LkcCarteiraCloseUp
      OnEnter = LkcCarteiraEnter
      OnExit = LkcCarteiraExit
    end
    object LkcInvestimento: TwwDBLookupCombo
      Left = 15
      Top = 142
      Width = 280
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
      LookupTable = QryInvestimento
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = LkcInvestimentoCloseUp
      OnEnter = LkcInvestimentoEnter
      OnExit = LkcInvestimentoExit
    end
    object DbLkcLote: TwwDBLookupCombo
      Left = 15
      Top = 183
      Width = 280
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'IDLOTE'#9'30'#9'Descrição'#9'F')
      LookupTable = QryLote
      LookupField = 'IDLOTE'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = DbLkcLoteCloseUp
      OnEnter = DbLkcLoteEnter
      OnExit = DbLkcLoteExit
    end
    object edData: TCMDateTimePicker
      Left = 14
      Top = 266
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
      TabOrder = 6
      OnCloseUp = edDataCloseUp
      OnEnter = edDataEnter
      OnExit = edDataExit
    end
    object EdQuantidade: TRealEdit
      Left = 498
      Top = 386
      Width = 152
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 12
      WordWrap = False
      IntDigits = 15
      DecDigits = 0
      NumberFormat = fNumber
      Signal = True
    end
    object rdgCustodia: TRadioGroup
      Left = 306
      Top = 48
      Width = 182
      Height = 200
      Caption = 'Atualização na Custódia'
      ItemIndex = 0
      Items.Strings = (
        '&Bloqueia'
        '&Desbloqueia'
        '&Aumenta Saldo Liberado'
        'D&iminui  Saldo Liberado'
        'A&umenta Saldo Bloqueado'
        'Di&minui Saldo Bloqueado'
        '&Não Faz')
      TabOrder = 8
      OnClick = rdgCustodiaClick
    end
    object LkcCustodiante: TwwDBLookupCombo
      Left = 15
      Top = 224
      Width = 280
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCUSTODIANTE'#9'40'#9'Descrição'#9'F')
      LookupTable = qryCustodiante
      LookupField = 'IDCUSTODIANTE'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = LkcCustodianteCloseUp
      OnEnter = LkcCustodianteEnter
      OnExit = LkcCustodianteExit
    end
    object DbLkcMotBlq: TwwDBLookupCombo
      Left = 128
      Top = 266
      Width = 166
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAMOTBLOQ'#9'10'#9'Sigla'
        'DESCMOTBLOQ'#9'30'#9'Descrição')
      LookupTable = qryMotBlq
      LookupField = 'IDMOTIVOBLOQUEIO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 7
      Visible = False
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object rdgCarteira: TRadioGroup
      Left = 306
      Top = 253
      Width = 182
      Height = 75
      Caption = 'Quantidade na Carteira'
      ItemIndex = 2
      Items.Strings = (
        '&Aumenta'
        '&Diminui'
        '&Não Faz')
      TabOrder = 9
      OnClick = rdgCarteiraClick
      OnExit = rdgCarteiraExit
    end
    object mObservacao: TMemo
      Left = 498
      Top = 64
      Width = 148
      Height = 278
      TabOrder = 11
    end
    object rdgSaldosCarteira: TRadioGroup
      Left = 306
      Top = 336
      Width = 182
      Height = 71
      Caption = 'Saldos na Carteira'
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        '&Proporcional '
        '&Não Faz')
      TabOrder = 10
      OnClick = rdgCarteiraClick
    end
    object grpSaldos: TGroupBox
      Left = 14
      Top = 288
      Width = 281
      Height = 119
      Color = clBtnFace
      ParentColor = False
      TabOrder = 13
      object Label22: TLabel
        Left = 11
        Top = 28
        Width = 50
        Height = 13
        Caption = 'Liberado'
      end
      object Label10: TLabel
        Left = 147
        Top = 28
        Width = 61
        Height = 13
        Caption = 'Bloqueado'
      end
      object Label17: TLabel
        Left = 11
        Top = 82
        Width = 50
        Height = 13
        Caption = 'Liberado'
      end
      object PnlSldLibCusCC: TPanel
        Left = 11
        Top = 42
        Width = 120
        Height = 18
        Alignment = taRightJustify
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object PnlSldBloCusCC: TPanel
        Left = 147
        Top = 42
        Width = 120
        Height = 18
        Alignment = taRightJustify
        BevelOuter = bvLowered
        TabOrder = 1
      end
      object pnlSaldosCustodia: TPanel
        Left = 2
        Top = 7
        Width = 277
        Height = 19
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '  Saldos na Custodia'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnlSaldosCarteira: TPanel
        Left = 2
        Top = 62
        Width = 277
        Height = 19
        Alignment = taLeftJustify
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = '  Saldos na Carteira'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object PnlSldLibCarCC: TPanel
        Left = 11
        Top = 96
        Width = 120
        Height = 18
        Alignment = taRightJustify
        BevelOuter = bvLowered
        TabOrder = 4
      end
    end
    object LkcPlanPatro: TwwDBLookupCombo
      Left = 15
      Top = 62
      Width = 280
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
      LookupTable = QryPlanoPatro
      LookupField = 'IDPLANPREVCTBPATR'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = LkcPlanPatroCloseUp
      OnEnter = LkcPlanPatroEnter
      OnExit = LkcPlanPatroExit
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 660
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 385
      DockPos = 385
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 216
      DockPos = 216
      inherited bbtnConfirmar: TBitBtn
        Height = 34
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 627
    Top = 4
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       (IDCARTEIRAINVEST+1) AS ID,'
      #9'IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC, DESCCARTINVEST'
      'FROM'
      '    CARTEIRAINVEST'
      'WHERE'
      '    IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 249
    Top = 54
    object QryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryCarteiraID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object QryCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  I.IDINVESTIMENTO, I.DESCINVESTIMENTO, E.SIGLAEMISSOR, E.' +
        'IDEMISSOR'
      ''
      'FROM INVESTIMENTO I, EMISSOR E'
      ''
      'WHERE I.IDTIPOINVEST = 2'
      '  AND I.IDEMISSOR = E.IDEMISSOR(+)'
      ''
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 250
    Top = 100
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryInvestimentoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object QryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object DsInvestimento: TwwDataSource
    DataSet = QryInvestimento
    Left = 222
    Top = 100
  end
  object QryLote: TwwQuery
    AfterOpen = QryLoteAfterOpen
    DatabaseName = 'BaseDados'
    DataSource = DsInvestimento
    SQL.Strings = (
      'SELECT DISTINCT IDLOTE'
      ' '
      'FROM CONTRATOINVESTIM'
      ''
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      ''
      'ORDER BY IDLOTE')
    ValidateWithMask = True
    Left = 249
    Top = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryLoteIDLOTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'IDLOTE'
      Origin = 'CONTRATOINVESTIM.IDLOTE'
      Size = 10
    end
  end
  object qryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCUSTODIANTE, SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE'
      ''
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 250
    Top = 185
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO, H1.SALDOQ' +
        'TDECPMF, H1.IDPLANPREVCTBPATR'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      '   (H1.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR) AND'
      '   (H1.IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (H1.IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (H1.IDLOTE =:IDLOTE)) OR ((:IDLOT' +
        'E IS NULL) AND (H1.IDLOTE IS NULL))) AND'
      '   (H1.IDCUSTODIANTE =:IDCUSTODIANTE) AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '          WHERE (H2.IDPLANPREVCTBPATR= H1.IDPLANPREVCTBPATR) AND'
      '                (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '               ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE IS NULL)) ' +
        'AND'
      
        '              (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOT' +
        'E)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND'
      '                (H2.IDCUSTODIANTE    = H1.IDCUSTODIANTE) AND'
      '                (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '               ((H2.DATAMOVCUSTOD   <  :DATAMOV) OR'
      '               ((H2.DATAMOVCUSTOD    = :DATAMOV) AND'
      '                (H2.IDCUSTODIA      <  :IDCUSTODIA))))) AND'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDPLANPREVCTBPATR= H1.IDPLANPREVCTBPATR) AND'
      '                (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      '                (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND'
      
        '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOT' +
        'E)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND'
      '                (H3.IDCUSTODIANTE    = H1.IDCUSTODIANTE) AND'
      '                (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      '                (H3.DATAMOVCUSTOD    = H1.DATAMOVCUSTOD) AND'
      '               ((H3.DATAMOVCUSTOD   < :DATAMOV) OR'
      '                (H3.IDCUSTODIA      < :IDCUSTODIA))))'
      'ORDER BY DATAMOVCUSTOD DESC, IDCUSTODIA DESC ')
    ValidateWithMask = True
    Left = 261
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptInput
      end>
    object qryCustodiaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qryCustodiaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
    object qryCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
    object qryCustodiaSALDOQTDECPMF: TFloatField
      FieldName = 'SALDOQTDECPMF'
    end
    object qryCustodiaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
  end
  object qryMotBlq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM MOTIVOBLOQUEIO'
      ''
      'WHERE IDMOTIVOBLOQUEIO <> -1'
      ''
      'ORDER BY SIGLAMOTBLOQ')
    ValidateWithMask = True
    Left = 249
    Top = 227
    object qryMotBlqSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SIGLAMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.SIGLAMOTBLOQ'
      Size = 3
    end
    object qryMotBlqDESCMOTBLOQ: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCMOTBLOQ'
      Origin = 'MOTIVOBLOQUEIO.DESCMOTBLOQ'
      Size = 30
    end
    object qryMotBlqIDMOTIVOBLOQUEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'MOTIVOBLOQUEIO.IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object QryInsOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO OPERACAOINVEST'
      
        '   (IDOPERACAOINVEST,   IDCORRETVALORES,  MOECODIGO,          ID' +
        'MODULO,'
      
        '    EMPRESAPROP,        IDINVESTIMENTO,   IDCARTEIRAINVEST,   ID' +
        'CARTEIRAGERENC,'
      '    IDTIPOINVEST,       IDTIPOOPERACAO,   DATAOPERACAO,'
      
        '    NUMDOCUMENTO,       QTDEOPERACAO,     PRECOUNITOPERACAO,  VL' +
        'ROPERACAO,'
      
        '    DATAVENCOPER,                         IDFORCLI,           ID' +
        'LOTE,'
      
        '    IDCUSTODIANTE,      VLRIR,            FLGSTATUSFECHBOL,   FL' +
        'GSTATUSORDMOV,'
      '    IDPLANPREVCTBPATR,  OBSERVACAO)'
      'VALUES'
      
        '   (:IDOPERACAOINVEST,  :IDCORRETVALORES,   :MOECODIGO,        :' +
        'IDMODULO,'
      
        '    :EMPRESAPROP,       :IDINVESTIMENTO,    :IDCARTEIRAINVEST, :' +
        'IDCARTEIRAGERENC,'
      
        '    :IDTIPOINVEST,      :IDTIPOOPERACAO,    TO_DATE(:DATAOPERACA' +
        'O,'#39'DD/MM/YYYY'#39') ,'
      
        '    :NUMDOCUMENTO,      :QTDEOPERACAO,      :PRECOUNITOPERACAO, ' +
        ':VLROPERACAO,'
      
        '    TO_DATE(:DATAVENCOPER,'#39'DD/MM/YYYY'#39'),    :IDFORCLI,          ' +
        ':IDLOTE,'
      
        '    :IDCUSTODIANTE,     :VLRIR,             :FLGSTATUSFECHBOL,  ' +
        ':FLGSTATUSORDMOV,'
      '    :IDPLANPREVCTBPATR, :OBSERVACAO)'
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 354
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCORRETVALORES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'QTDEOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'PRECOUNITOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'VLROPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVENCOPER'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'VLRIR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSFECHBOL'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FLGSTATUSORDMOV'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end>
  end
  object qryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 439
    Top = 2
  end
  object QryPlanoPatro: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 246
    Top = 277
    object QryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object QryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
