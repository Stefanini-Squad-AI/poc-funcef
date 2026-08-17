inherited FrmConsHistCust: TFrmConsHistCust
  Left = -4
  Top = -4
  Caption = 'Consulta de Histórico de Custódia'
  ClientHeight = 553
  ClientWidth = 800
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 511
    Width = 800
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited pnlFundo: TPanel
    Width = 800
    Height = 129
    Align = alTop
    BevelOuter = bvLowered
    object Label1: TLabel
      Left = 21
      Top = 40
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label2: TLabel
      Left = 21
      Top = 2
      Width = 45
      Height = 13
      Caption = 'Carteira'
    end
    object Label4: TLabel
      Left = 21
      Top = 80
      Width = 68
      Height = 13
      Caption = 'Custodiante'
    end
    object Label6: TLabel
      Left = 326
      Top = 2
      Width = 66
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label8: TLabel
      Left = 326
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Data Final'
    end
    object Label5: TLabel
      Left = 647
      Top = 80
      Width = 33
      Height = 13
      Caption = 'Saldo'
    end
    object Label7: TLabel
      Left = 440
      Top = 40
      Width = 176
      Height = 13
      Caption = 'Motivo Bloqueio / Desbloqueio'
    end
    object Label3: TLabel
      Left = 440
      Top = 2
      Width = 26
      Height = 13
      Caption = 'Lote'
    end
    object RadioGroup1: TRadioGroup
      Left = 647
      Top = 11
      Width = 128
      Height = 64
      Caption = ' Ordem da Consulta '
      Color = clBtnFace
      ItemIndex = 0
      Items.Strings = (
        'Descendente '
        'Ascendente')
      ParentColor = False
      TabOrder = 7
      OnClick = RadioGroup1Click
    end
    object LkcCarteira: TwwDBLookupCombo
      Left = 21
      Top = 16
      Width = 296
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos ')
      LookupTable = QryCarteira
      LookupField = 'IDCARTEIRAINVEST'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = LkcCarteiraExit
    end
    object LkcInvestimento: TwwDBLookupCombo
      Left = 21
      Top = 55
      Width = 296
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Investimento')
      LookupTable = QryInvestimento
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = LkcInvestimentoExit
    end
    object LkcCustodiante: TwwDBLookupCombo
      Left = 22
      Top = 95
      Width = 295
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCUSTODIANTE'#9'10'#9'Sigla')
      LookupTable = QryCustodiante
      LookupField = 'IDCUSTODIANTE'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnExit = LkcCustodianteExit
    end
    object edDataIni: TCMDateTimePicker
      Left = 326
      Top = 16
      Width = 105
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
      OnExit = edDataIniExit
    end
    object edDataFim: TCMDateTimePicker
      Left = 326
      Top = 55
      Width = 105
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
      OnExit = edDataFimExit
    end
    object CkLstTpSaldo: TCheckListBox
      Left = 647
      Top = 95
      Width = 85
      Height = 30
      Columns = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 13
      Items.Strings = (
        'Liberado'
        'Bloqueado')
      ParentFont = False
      TabOrder = 8
      OnClick = CkLstTpSaldoClick
    end
    object DbLkcMotBlq: TwwDBLookupCombo
      Left = 440
      Top = 55
      Width = 201
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAMOTBLOQ'#9'5'#9'Sigla'
        'DESCMOTBLOQ'#9'30'#9'Descrição')
      LookupTable = qryMotBlq
      LookupField = 'IDMOTIVOBLOQUEIO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = DbLkcMotBlqExit
    end
    object DbLkcLote: TwwDBLookupCombo
      Left = 440
      Top = 16
      Width = 200
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'IDLOTE'#9'40'#9'Lote')
      LookupTable = QryLote
      LookupField = 'IDLOTE'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = DbLkcLoteExit
    end
  end
  inherited Dock971: TDock97
    Top = 514
    Width = 800
    inherited tb97Fundo: TToolbar97
      Left = 632
      DockPos = 900
    end
  end
  object PageControl1: TPageControl [3]
    Left = 0
    Top = 129
    Width = 800
    Height = 382
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Lançamentos na Custódia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object DBGrid: TwwDBGrid
        Left = 0
        Top = 0
        Width = 792
        Height = 354
        Selected.Strings = (
          'DATAMOVCUSTOD'#9'10'#9'Data '
          'DESCTIPOOPERACAO'#9'28'#9'Tipo de Operação'
          'IDLOTE'#9'10'#9'Lote'
          'QTDEMOVCUSTOD'#9'18'#9'Quantidade '
          'SIGLACMOTBLOQ'#9'3'#9'Mot.'
          'SALDOBLOQUEADO'#9'17'#9'Saldo Bloqueado'
          'SALDOLIBERADO'#9'17'#9'Saldo Liberado'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = [dgAllowDelete]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
        object DBGridIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 11
          Height = 17
          AllowAllUp = True
          NumGlyphs = 2
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 31
    Top = 203
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsInvestimento: TwwDataSource
    DataSet = QryInvestimento
    Left = 202
    Top = 47
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDINVESTIMENTO, DESCINVESTIMENTO'
      ''
      'FROM CM.INVESTIMENTO'
      ''
      'WHERE IDTIPOINVEST IN (1,2)'
      ''
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 272
    Top = 47
    object QryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object QryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
  end
  object DsHistorico: TwwDataSource
    DataSet = QryHistorico
    Left = 468
    Top = 243
  end
  object QryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCARTEIRAINVEST, DESCCARTINVEST'
      ''
      'FROM CARTEIRAINVEST  '
      ''
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 272
    Top = 8
    object QryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = '"CM.CARTEIRAINVEST".IDCARTEIRAINVEST'
    end
    object QryCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Origin = '"CM.CARTEIRAINVEST".DESCCARTINVEST'
      Size = 60
    end
  end
  object QryLote: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsInvestimento
    SQL.Strings = (
      'SELECT DISTINCT IDLOTE'
      ' '
      'FROM CM.CONTRATOINVESTIM'
      ''
      'WHERE IDINVESTIMENTO = :IDINVESTIMENTO'
      ''
      'ORDER BY IDLOTE')
    ValidateWithMask = True
    Left = 497
    Top = 81
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object QryLoteIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 40
      FieldName = 'IDLOTE'
      Origin = '"CM.CONTRATOINVESTIM".IDLOTE'
      Size = 10
    end
  end
  object QryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.IDCUSTODIANTE, C.SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE C, HISTCUSTODIA HC'
      ''
      'WHERE (C.IDCUSTODIANTE = HC.IDCUSTODIANTE)'
      'AND   (HC.IDCARTEIRAINVEST IS NOT NULL)'
      ''
      'ORDER BY  SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 272
    Top = 87
    object QryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'SGLCUSTODIANTE'
      Origin = '"CM.CUSTODIANTE".SGLCUSTODIANTE'
      Size = 10
    end
    object QryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = '"CM.CUSTODIANTE".IDCUSTODIANTE'
      Visible = False
    end
  end
  object QryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  HIS.IDCUSTODIA, HIS.IDOPERACAOINVEST, HIS.IDCARTEIRAINVE' +
        'ST, HIS.IDINVESTIMENTO,'
      
        #9'HIS.IDCUSTODIANTE, HIS.DATAMOVCUSTOD, HIS.QTDEMOVCUSTOD, HIS.SA' +
        'LDOLIBERADO, HIS.SALDOBLOQUEADO,'
      
        #9'HIS.FLGCALCSALDO, HIS.IDLOTE, HIS.TIPOCUSTODIA, HIS.IDMOTIVOBLO' +
        'QUEIO,'
      
        #9'DECODE(TOP.DESCTIPOOPERACAO,NULL,'#39'MOVIMENTAÇÃO NA CUSTODIA'#39', TO' +
        'P.DESCTIPOOPERACAO) AS DESCTIPOOPERACAO,'
      
        #9'DECODE(HIS.IDMOTIVOBLOQUEIO, -1,'#39'  '#39', MOT.SIGLAMOTBLOQ) AS SIGL' +
        'ACMOTBLOQ'
      ''
      
        'FROM CM.HISTCUSTODIA HIS, CM.OPERACAOINVEST OPI, CM.TIPOOPERACAO' +
        ' TOP,'
      '     CM.MOTIVOBLOQUEIO MOT'
      'WHERE'
      #9'(HIS.IDINVESTIMENTO       = :IDINVESTIMENTO)      AND'
      #9'(HIS.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST)    AND'
      #9'(HIS.IDCUSTODIANTE        = :IDCUSTODIANTE)       AND'
      #9'(HIS.IDOPERACAOINVEST = OPI.IDOPERACAOINVEST(+))AND'
      ' '#9'(OPI.IDTIPOOPERACAO      = TOP.IDTIPOOPERACAO(+))  AND'
      '                (HIS.IDMOTIVOBLOQUEIO  = MOT.IDMOTIVOBLOQUEIO)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 545
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
    object QryHistoricoDATAMOVCUSTOD: TDateTimeField
      DisplayLabel = 'Data '
      DisplayWidth = 10
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object QryHistoricoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 28
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryHistoricoIDLOTE: TStringField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object QryHistoricoQTDEMOVCUSTOD: TFloatField
      DisplayLabel = 'Quantidade '
      DisplayWidth = 18
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
      DisplayFormat = '###,###,###,###'
      EditFormat = '###,###,###,###'
    end
    object QryHistoricoSIGLACMOTBLOQ: TStringField
      DisplayLabel = 'Mot.'
      DisplayWidth = 3
      FieldName = 'SIGLACMOTBLOQ'
      Size = 3
    end
    object QryHistoricoSALDOBLOQUEADO: TFloatField
      DisplayLabel = 'Saldo Bloqueado'
      DisplayWidth = 17
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
      DisplayFormat = '###,###,###,###'
      EditFormat = '###,###,###,###'
    end
    object QryHistoricoSALDOLIBERADO: TFloatField
      DisplayLabel = 'Saldo Liberado'
      DisplayWidth = 17
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
      DisplayFormat = '###,###,###,###'
      EditFormat = '###,###,###,###'
    end
    object QryHistoricoTIPOCUSTODIA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 4
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Visible = False
      Size = 1
    end
    object QryHistoricoIDCUSTODIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
      Visible = False
    end
    object QryHistoricoIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
      Visible = False
    end
    object QryHistoricoIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryHistoricoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
      Visible = False
    end
    object QryHistoricoIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
      Visible = False
    end
    object QryHistoricoFLGCALCSALDO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Visible = False
      Size = 1
    end
    object QryHistoricoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Visible = False
    end
  end
  object QryPesquisaBasica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  HIS.IDCUSTODIA, HIS.IDOPERACAOINVEST, HIS.IDCARTEIRAINVE' +
        'ST, HIS.IDINVESTIMENTO,'
      
        #9'HIS.IDCUSTODIANTE, HIS.DATAMOVCUSTOD, HIS.QTDEMOVCUSTOD, HIS.SA' +
        'LDOLIBERADO, HIS.SALDOBLOQUEADO, '
      
        #9'HIS.FLGCALCSALDO, HIS.IDLOTE, HIS.TIPOCUSTODIA,  HIS.IDMOTIVOBL' +
        'OQUEIO, '
      
        #9'DECODE(TOP.DESCTIPOOPERACAO,NULL,'#39'MOVIMENTAÇÃO NA CUSTODIA'#39', TO' +
        'P.DESCTIPOOPERACAO) AS DESCTIPOOPERACAO,'
      
        #9'DECODE(HIS.IDMOTIVOBLOQUEIO, -1,'#39'  '#39', MOT.SIGLAMOTBLOQ) AS SIGL' +
        'ACMOTBLOQ'
      ''
      
        'FROM CM.HISTCUSTODIA HIS, CM.OPERACAOINVEST OPI, CM.TIPOOPERACAO' +
        ' TOP,'
      '           CM.MOTIVOBLOQUEIO MOT'
      ''
      'WHERE '#9
      #9'(HIS.IDINVESTIMENTO       = :IDINVESTIMENTO)      AND'
      #9'(HIS.IDCARTEIRAINVEST   = :IDCARTEIRAINVEST)    AND'
      #9'(HIS.IDCUSTODIANTE        = :IDCUSTODIANTE)       AND '
      #9'(HIS.IDOPERACAOINVEST = OPI.IDOPERACAOINVEST(+))AND '
      ' '#9'(OPI.IDTIPOOPERACAO      = TOP.IDTIPOOPERACAO(+))  AND'
      '                (HIS.IDMOTIVOBLOQUEIO  = MOT.IDMOTIVOBLOQUEIO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 694
    Top = 243
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end>
    object QryPesquisaBasicaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
      Origin = 'HISTCUSTODIA.IDCUSTODIA'
    end
    object QryPesquisaBasicaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTCUSTODIA.IDOPERACAOINVEST'
    end
    object QryPesquisaBasicaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTCUSTODIA.IDCARTEIRAINVEST'
    end
    object QryPesquisaBasicaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'HISTCUSTODIA.IDINVESTIMENTO'
    end
    object QryPesquisaBasicaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'HISTCUSTODIA.IDCUSTODIANTE'
    end
    object QryPesquisaBasicaDATAMOVCUSTOD: TDateTimeField
      FieldName = 'DATAMOVCUSTOD'
      Origin = 'HISTCUSTODIA.DATAMOVCUSTOD'
    end
    object QryPesquisaBasicaQTDEMOVCUSTOD: TFloatField
      FieldName = 'QTDEMOVCUSTOD'
      Origin = 'HISTCUSTODIA.QTDEMOVCUSTOD'
    end
    object QryPesquisaBasicaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
      Origin = 'HISTCUSTODIA.SALDOLIBERADO'
    end
    object QryPesquisaBasicaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
      Origin = 'HISTCUSTODIA.SALDOBLOQUEADO'
    end
    object QryPesquisaBasicaFLGCALCSALDO: TStringField
      FieldName = 'FLGCALCSALDO'
      Origin = 'HISTCUSTODIA.FLGCALCSALDO'
      Size = 1
    end
    object QryPesquisaBasicaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Origin = 'HISTCUSTODIA.IDLOTE'
      Size = 10
    end
    object QryPesquisaBasicaTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'HISTCUSTODIA.TIPOCUSTODIA'
      Size = 1
    end
    object QryPesquisaBasicaDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryPesquisaBasicaIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object QryPesquisaBasicaSIGLACMOTBLOQ: TStringField
      FieldName = 'SIGLACMOTBLOQ'
      Size = 3
    end
  end
  object qryMotBlq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ'
      'FROM MOTIVOBLOQUEIO'
      ''
      'WHERE IDMOTIVOBLOQUEIO > 0'
      ''
      'ORDER BY SIGLAMOTBLOQ')
    ValidateWithMask = True
    Left = 732
    Top = 9
    object qryMotBlqSIGLAMOTBLOQ: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 5
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
end
