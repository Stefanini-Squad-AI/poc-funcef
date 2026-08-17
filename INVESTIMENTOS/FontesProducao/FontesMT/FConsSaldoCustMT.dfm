inherited FrmConsSaldoCustMT: TFrmConsSaldoCustMT
  Left = 39
  Top = 124
  HelpContext = 790559
  Caption = 'FrmConsSaldoCustMT'
  ClientHeight = 474
  ClientWidth = 835
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 835
    Height = 435
    inherited bvlSepTit: TBevel
      Width = 833
    end
    inherited pnlTitulo: TPanel
      Width = 833
      inherited lbNomDescricao: TfcLabel
        Width = 196
        Caption = 'Saldos de Custódia'
      end
    end
    object pnlFiltros: TPanel
      Left = 1
      Top = 45
      Width = 833
      Height = 97
      Align = alTop
      TabOrder = 1
      object Label6: TLabel
        Left = 14
        Top = 10
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object Label2: TLabel
        Left = 218
        Top = 10
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object Label1: TLabel
        Left = 522
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label4: TLabel
        Left = 218
        Top = 48
        Width = 68
        Height = 13
        Caption = 'Custodiante'
      end
      object Label7: TLabel
        Left = 525
        Top = 48
        Width = 176
        Height = 13
        Caption = 'Motivo Bloqueio / Desbloqueio'
      end
      object Label3: TLabel
        Left = 13
        Top = 49
        Width = 118
        Height = 13
        Caption = 'Plano/Patrocinadora'
      end
      object edDataDase: TCMDateTimePicker
        Left = 14
        Top = 24
        Width = 139
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
      object dblCarteira: TwwDBLookupCombo
        Left = 218
        Top = 24
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos ')
        LookupTable = cdsCarteira
        LookupField = 'IDCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 522
        Top = 23
        Width = 296
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'40'#9'Investimento')
        LookupTable = cdsInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblCustodiante: TwwDBLookupCombo
        Left = 219
        Top = 63
        Width = 295
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLCUSTODIANTE'#9'10'#9'Sigla')
        LookupTable = cdsCustodiante
        LookupField = 'IDCUSTODIANTE'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblMotBlq: TwwDBLookupCombo
        Left = 525
        Top = 63
        Width = 292
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAMOTBLOQ'#9'5'#9'Sigla'
          'DESCMOTBLOQ'#9'30'#9'Descrição')
        LookupTable = cdsMotivoBloq
        LookupField = 'IDMOTIVOBLOQUEIO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 13
        Top = 63
        Width = 196
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = cdsPlanoPatro
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object pnlGrid: TPanel
      Left = 1
      Top = 142
      Width = 833
      Height = 292
      Align = alClient
      TabOrder = 2
      object grdConsulta: TwwDBGrid
        Left = 1
        Top = 1
        Width = 831
        Height = 290
        PictureMasks.Strings = (
          'SALDOCC'#9'#.###.###.###.###'#9'T'#9'T'
          'SALDOCCI'#9'#.###.###.###.###'#9'T'#9'T')
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'29'#9'Plano / Patrocinadora'
          'DESCCARTINVEST'#9'47'#9'Carteira'
          'CUSTODIANTE'#9'14'#9'Custodiante'
          'DESCINVESTIMENTO'#9'28'#9'Investimento'
          'DESCMOTBLOQ'#9'32'#9'Motivo de Bloqueio'
          'SALDOTOTAL'#9'16'#9'Saldo Total')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsSaldosCustodia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clMaroon
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = grdConsultaCalcCellColors
        IndicatorColor = icBlack
        OnTopRowChanged = grdConsultaTopRowChanged
        OnUpdateFooter = grdConsultaUpdateFooter
      end
    end
  end
  inherited Dock971: TDock97
    Top = 435
    Width = 835
    inherited tb97Fundo: TToolbar97
      Left = 611
      DockPos = 611
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 358
      DockPos = 358
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
      inherited bt_Imprime: TBitBtn
        OnClick = bt_ImprimeClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 227
    Top = 65531
  end
  object cdsCarteira: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 61
  end
  object cdsCustodiante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 469
    Top = 100
  end
  object cdsInvestimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 773
    Top = 60
  end
  object cdsMotivoBloq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 772
    Top = 100
  end
  object cdsSaldosCustodia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsSaldosCustodiaAfterOpen
    AfterScroll = cdsSaldosCustodiaAfterScroll
    Left = 336
    Top = 264
    object cdsSaldosCustodiaPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 29
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object cdsSaldosCustodiaDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 47
      FieldName = 'DESCCARTINVEST'
      Size = 69
    end
    object cdsSaldosCustodiaCUSTODIANTE: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 14
      FieldName = 'CUSTODIANTE'
      Size = 10
    end
    object cdsSaldosCustodiaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 28
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object cdsSaldosCustodiaDESCMOTBLOQ: TStringField
      DisplayLabel = 'Motivo de Bloqueio'
      DisplayWidth = 32
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object cdsSaldosCustodiaSALDOTOTAL: TFloatField
      DisplayLabel = 'Saldo Total'
      DisplayWidth = 16
      FieldName = 'SALDOTOTAL'
    end
    object cdsSaldosCustodiaSALDOCC: TFloatField
      DisplayLabel = 'Saldo CC'
      DisplayWidth = 18
      FieldName = 'SALDOCC'
      Visible = False
    end
    object cdsSaldosCustodiaSALDOCCI: TFloatField
      DisplayLabel = 'Saldo CCI'
      DisplayWidth = 15
      FieldName = 'SALDOCCI'
      Visible = False
    end
    object cdsSaldosCustodiaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object cdsSaldosCustodiaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object cdsSaldosCustodiaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object cdsSaldosCustodiaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object cdsSaldosCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
      Visible = False
    end
    object cdsSaldosCustodiaGRUPO: TStringField
      FieldName = 'GRUPO'
      Visible = False
      Size = 12
    end
  end
  object dsSaldosCustodia: TDataSource
    DataSet = cdsSaldosCustodia
    Left = 448
    Top = 264
  end
  object sprSaldosCustodia: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, CT.SGLCUSTODIANTE AS CUSTODIANTE, ' +
        'IV.DESCINVESTIMENTO,'
      '       CA.DESCCARTINVEST, MB.DESCMOTBLOQ,'
      '       NVL(HC.SALDOQTDECPMF,0) AS SALDOCC,'
      
        '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0) -' +
        ' NVL(HC.SALDOQTDECPMF,0), NVL(HC.SALDOBLOQUEADO,0)-NVL(HC.SALDOQ' +
        'TDECPMF,0)) AS SALDOCCI,'
      
        '       DECODE(HC.IDMOTIVOBLOQUEIO, -1, NVL(HC.SALDOLIBERADO,0), ' +
        'NVL(HC.SALDOBLOQUEADO,0)) AS SALDOTOTAL,'
      
        '       HC.IDCARTEIRAINVEST, HC.IDCUSTODIANTE, HC.IDINVESTIMENTO,' +
        ' HC.IDLOTE, HC.IDCUSTODIA,'
      
        '       LPAD(HC.IDCARTEIRAINVEST, 2, '#39'0'#39') || LPAD(HC.IDCUSTODIANT' +
        'E, 5, '#39'0'#39') || LPAD(HC.IDINVESTIMENTO, 5, '#39'0'#39') AS GRUPO'
      ' '
      
        'FROM HISTCUSTODIA HC, INVESTIMENTO IV, CARTEIRAINVEST CA, CUSTOD' +
        'IANTE CT, MOTIVOBLOQUEIO MB, '
      '     VWPLANPREVCTBPATR PP '
      ' '
      'WHERE HC.IDCUSTODIA IN '
      '         (SELECT MAX(H2.IDCUSTODIA) '
      '          FROM HISTCUSTODIA H2 '
      
        '          WHERE (H2.DATAMOVCUSTOD <= TO_DATE('#39'31/08/2006'#39', '#39'dd/m' +
        'm/yyyy'#39'))'
      '            AND (H2.IDCARTEIRAINVEST = 1)'
      '--            AND (H2.IDINVESTIMENTO = 97) '
      '--            AND (H2.IDCUSTODIANTE = 23) '
      '--            AND (H2.IDMOTIVOBLOQUEIO > 0)'
      
        '            AND (H2.DATAMOVCUSTOD || H2.IDPLANPREVCTBPATR || H2.' +
        'IDCARTEIRAINVEST || H2.IDCUSTODIANTE || H2.IDINVESTIMENTO || H2.' +
        'IDMOTIVOBLOQUEIO) IN'
      
        '                     (SELECT MAX(H3.DATAMOVCUSTOD) || H3.IDPLANP' +
        'REVCTBPATR || H3.IDCARTEIRAINVEST || H3.IDCUSTODIANTE || H3.IDIN' +
        'VESTIMENTO || H3.IDMOTIVOBLOQUEIO'
      '                      FROM HISTCUSTODIA H3 '
      
        '                      WHERE H3.DATAMOVCUSTOD <= TO_DATE('#39'31/08/2' +
        '006'#39', '#39'dd/mm/yyyy'#39')'
      '                        AND (H3.IDCARTEIRAINVEST = 1) '
      '--                        AND (H3.IDINVESTIMENTO = 97) '
      '--                        AND (H3.IDCUSTODIANTE = 23) '
      '--                        AND (H3.IDMOTIVOBLOQUEIO > 0)'
      
        '                      GROUP BY H3.IDPLANPREVCTBPATR, H3.IDCARTEI' +
        'RAINVEST, H3.IDCUSTODIANTE, H3.IDINVESTIMENTO, H3.IDMOTIVOBLOQUE' +
        'IO) '
      
        '          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2' +
        '.IDCUSTODIANTE, H2.IDINVESTIMENTO, H2.IDMOTIVOBLOQUEIO ) '
      '  AND (HC.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (HC.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) '
      '  AND (HC.IDCUSTODIANTE = CT.IDCUSTODIANTE)'
      '  AND (HC.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO) '
      '  AND (HC.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      
        '  AND ((NVL(HC.SALDOLIBERADO,0) + NVL(HC.SALDOBLOQUEADO,0)) <> 0' +
        ') '
      ''
      ''
      
        'ORDER BY PP.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, CT.SGLCUSTODI' +
        'ANTE, IV.DESCINVESTIMENTO, MB.DESCMOTBLOQ'
      ''
      ' ')
    Left = 229
    Top = 264
  end
  object cdsTotais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 352
    object StringField1: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 47
      FieldName = 'DESCCARTINVEST'
      Size = 69
    end
    object StringField2: TStringField
      DisplayLabel = 'Custodiante'
      DisplayWidth = 14
      FieldName = 'CUSTODIANTE'
      Size = 10
    end
    object StringField3: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 24
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = 'Motivo de Bloqueio'
      DisplayWidth = 27
      FieldName = 'DESCMOTBLOQ'
      Size = 30
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Saldo CC'
      DisplayWidth = 18
      FieldName = 'SALDOCC'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Saldo CCI'
      DisplayWidth = 15
      FieldName = 'SALDOCCI'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Saldo Total'
      DisplayWidth = 16
      FieldName = 'SALDOTOTAL'
    end
    object FloatField4: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object FloatField5: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object StringField5: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object FloatField7: TFloatField
      FieldName = 'IDCUSTODIA'
      Visible = False
    end
    object StringField6: TStringField
      FieldName = 'GRUPO'
      Size = 12
    end
  end
  object cdsPlanoPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 164
    Top = 100
    Data = {
      E40300009619E0BD0100000018000000040012000000030000008C0011494450
      4C414E505245564354425041545208000400000000000B4944504C414E4F5052
      45560800040000000000074944504154524F080004000000000012504C414E50
      5256434F4E544142504154524F01004900000001000557494454480200020071
      000100044C43494404000100090800000000000000000000F03F000000000000
      0040000000000038F640125245472F5245504C414E202D204341495841000000
      000000000008400000000000003340000000000000F03F115245422031393938
      202D2046554E4345460000000000000000104000000000000033400000000000
      38F640105245422031393938202D204341495841000000000000000018400000
      000000000840000000000038F64019434C55424520494D4F42494C49C152494F
      202D20434149584100000000000000001C400000000000001440000000000038
      F64017415558494C494F20504543DA4C494F202D204341495841000000000000
      000000400000000000003640000000000038F640195245504C414E2045582F50
      524556484142202D204341495841000000000000000020400000000000805040
      000000000000F03F115245422032303032202D2046554E434546000000000000
      000022400000000000805040000000000038F640105245422032303032202D20
      4341495841000000000000000026400000000000003940000000000038F64013
      5245422031204341495841202D20434149584100000000000000002840000000
      000000F03F000000000038F6401852454220312045582F50524556484142202D
      20434149584100000000000000002C400000000000003C4000000000F20A2E41
      1A5245472F5245504C414E2053414C4441444F202D20434F4D554D0000000000
      0000002E400000000000003B4000000000F20A2E41184F70657261E7F5657320
      436F6D756E73202D20434F4D554D000000000000000030400000000000000040
      000000000000F03F135245472F5245504C414E202D2046554E43454600000000
      0000000036400000000000003640000000000000F03F1A5245504C414E204558
      2F50524556484142202D2046554E434546000000000000000037400000000000
      00364000000000F20A2E41195245504C414E2045582F50524556484142202D20
      434F4D554D00000000000000003840000000000000334000000000F20A2E4110
      5245422031393938202D20434F4D554D00000000000000003940000000000080
      504000000000F20A2E41105245422032303032202D20434F4D554D0000000000
      0000003A40000000000000004000000000F20A2E41125245472F5245504C414E
      202D20434F4D554D}
  end
end
