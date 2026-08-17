inherited frmRelResumoCarteiraAnal: TfrmRelResumoCarteiraAnal
  Left = 138
  Top = 205
  Caption = 'Resumo da Carteira (Analítico)'
  ClientHeight = 442
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 409
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 41
      Height = 13
      Caption = 'Evento'
    end
    object Label2: TLabel
      Left = 16
      Top = 178
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
    end
    object Label3: TLabel
      Left = 16
      Top = 138
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
    end
    object Label4: TLabel
      Left = 16
      Top = 74
      Width = 111
      Height = 13
      Caption = 'Item de Empréstimo'
    end
    object Bevel1: TBevel
      Left = 320
      Top = 16
      Width = 9
      Height = 377
      Shape = bsLeftLine
    end
    object cboEvento: TComboBox
      Left = 16
      Top = 24
      Width = 289
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cboEventoChange
      Items.Strings = (
        'Saldo Devedor'
        'Concessões'
        'Renovações'
        'Parcelas do Mês'
        'Amortizações'
        'Quitações Antecipadas'
        'Quitações por Morte/Invalidez')
    end
    object DBcboTipoContrato: TwwDBLookupCombo
      Left = 16
      Top = 192
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoContrato
      LookupField = 'IDTIPOCONTREMPTMO'
      DropDownWidth = 8
      Enabled = False
      ParentFont = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBcboTipoEmptmo: TwwDBLookupCombo
      Left = 16
      Top = 152
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
      LookupField = 'IDTIPOEMPTMO'
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblcboItemEmprestimo: TwwDBLookupCombo
      Left = 16
      Top = 88
      Width = 289
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
      LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
      LookupField = 'IDTIPOEMPTMO'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object btnSeleciona: TfcShapeBtn
      Left = 192
      Top = 352
      Width = 113
      Height = 33
      Caption = 'Busca Itens'
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      Margin = 13
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      RoundRectBias = 25
      ShadeStyle = fbsNormal
      Spacing = 6
      TabOrder = 5
      TabStop = True
      TextOptions.Alignment = taLeftJustify
      TextOptions.LineSpacing = 0
      TextOptions.VAlignment = vaVCenter
      TextOptions.WordWrap = True
      OnClick = btnSelecionaClick
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 288
      Width = 289
      Height = 41
      Columns = 2
      Items.Strings = (
        'Cobrança'
        'Competência')
      TabOrder = 6
      Visible = False
    end
    object Panel1: TPanel
      Left = 16
      Top = 224
      Width = 289
      Height = 57
      TabOrder = 4
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 135
        Height = 13
        Caption = 'Mês/ano de Referência'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 184
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1980
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object Panel2: TPanel
      Left = 336
      Top = 16
      Width = 377
      Height = 25
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Resumo'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object planilha: TF1Book
      Left = 336
      Top = 41
      Width = 377
      Height = 238
      TabOrder = 8
      ControlData = {
        00000100F72600009918000060000000010001074631426F6F6B310101010101
        0101010101010101010101009C070000000009080800000505006C09C907EE7E
        040000000000EF7E140000000000000000000000FFFFFFFFFFFFFFFFF3FF3D00
        1200B01367021716F20D3800000000000100580222000200000031001400C800
        0000FF7F900100000000000005417269616C31001400C8000000FF7FBC020000
        0000000005417269616C31001400C8000200FF7F900100000000000005417269
        616C31001400C8000200FF7FBC0200000000000005417269616C31001400C800
        0000FF7F900100000000000005417269616C1E041C0005001922522422232C23
        23305F293B5C2822522422232C2323305C291E04210006001E22522422232C23
        23305F293B5B5265645D5C2822522422232C2323305C291E04220007001F2252
        2422232C2323302E30305F293B5C2822522422232C2323302E30305C291E0427
        0008002422522422232C2323302E30305F293B5B5265645D5C2822522422232C
        2323302E30305C291E0432002A002F5F285C242A20232C2323305F293B5F285C
        242A205C28232C2323305C293B5F285C242A20222D225F293B5F28405F291E04
        2C002900295F282A20232C2323305F293B5F282A205C28232C2323305C293B5F
        282A20222D225F293B5F28405F291E043A002C00375F285C242A20232C232330
        2E30305F293B5F285C242A205C28232C2323302E30305C293B5F285C242A2022
        2D223F3F5F293B5F28405F291E0434002B00315F282A20232C2323302E30305F
        293B5F282A205C28232C2323302E30305C293B5F282A20222D223F3F5F293B5F
        28405F291E042500320022232C2323302E3030303030303B5B5265645D5C2823
        2C2323302E3030303030305C291E042300330020232C2323302E303030303030
        253B5B5265645D232C2323302E303030303030251E04210034001E2252242223
        2C2323305F293B5B5265645D5C2822522422232C2323305C291E042700350024
        22522422232C2323302E30305F293B5B5265645D5C2822522422232C2323302E
        30305C29ED7E05000000000000EC7E0300000000E000140000000000F5FF2000
        C02000000000000000000000E000140001000000F5FF20C4C020000000000000
        00000000E000140001000000F5FF20C4C02000000000000000000000E0001400
        02000000F5FF20C4C02000000000000000000000E000140002000000F5FF20C4
        C02000000000000000000000E000140000000000F5FF20C4C020000000000000
        00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
        00000000F5FF20C4C02000000000000000000000E000140000000000F5FF20C4
        C02000000000000000000000E000140000000000F5FF20C4C020000000000000
        00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
        00000000F5FF20C4C02000000000000000000000E000140000000000F5FF20C4
        C02000000000000000000000E000140000000000F5FF20C4C020000000000000
        00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
        0000000001002000C02000000000000000000000E000140005003500F5FF20C8
        C02000000000000000000000E000140005003400F5FF20C8C020000000000000
        00000000E000140005000C00F5FF20C8C02000000000000000000000E0001400
        05000A00F5FF20C8C02000000000000000000000E000140005000D00F5FF20C8
        C02000000000000000000000E000140004000000F0FF1248C020000000000000
        00000000E00014000000000001001214C02000000000000000000000E0001400
        0000040001002314C02000000000000000000000E00014000000000001001314
        C0200000000000000000000093020400108003FF93020400118006FF93020400
        128004FF93020400138007FF93020400008000FF93020400148005FF85000D00
        7F0500000000065368656574310A00000009080800000510006C09C9070D0002
        0001000C00020064000F000200010011000200000010000800FCA9F1D24D6250
        3F5F00020001002A00020000002B0002000100250204000100FF008C00040001
        00370081000200C1041400030002264115000800075061676520265083000200
        000084000200000026000800000000000000E83F27000800000000000000E83F
        28000800000000000000F03F29000800000000000000F03FA100220001006400
        010001000100060000000000000000000000E03F000000000000E03F01005500
        0200080000020A0000000000000000000000F77E18009200FFCCFFFFFF00C0C0
        C000FF00FF3F0000000000000000F27E10000000000000000000000000000000
        FFFFF67E0A00150015001500F0004006F37E080002000556616C6F72F37E0B00
        010008436F6E747261746F7D000C000000000049111600000000007D000C0001
        0001006E191800000000007D000C000200020025141700000000007D000C0003
        000300DB0F0F00000000007D000C000400040000140F00000000007D000C0005
        000500DB0F0F000000000008021000000000000000FF000000000040010F0008
        021000010000000000FF000000000040010F001D000F00030000000000000100
        0000000000003E020A0036020000010000000000A000040064006400AB002200
        2000C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9900020026090A0000000000000452E30B918FCE119DE300AA004BB8516C
        7400008002000001000000640000000000000000000000FFFFFFFFFFFFFFFF00
        00000000000000E8800000C05D000020454D4600000100800200001000000004
        00000000000000000000000000000020030000580200004A010000F000000000
        00000000000000000000001B000000100000000000000000000000520000004C
        01000001000000F5FFFFFF000000000000000000000000900100000000000100
        0000004D0053002000530061006E007300200053006500720069006600000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000002C01000003000000E4FC12002A71E7770000130000000000D0
        8F1300F44752005C848701ECFD120000000000ADF2F87700001300C88F130000
        00000084FC1200F8D4F977A8FD1200D42CF97770D8F977FFFFFFFFD0FC1200DC
        4DF67750061300D08F13000A0000000C000000D08F1300B8FC12000100000003
        000000000012004C5400411C000000888A8701581E004118FD12000D00000088
        8A87016C8A87011C0000007D210041A521004100540041AD210041948A8701F8
        1287010000000000000000000000000000000000000000000000000101010101
        01010101018701250000000C00000001000000180000000C0000000000000026
        0000001C0000000200000000000000010000000000000000000000250000000C
        00000002000000140000000C0000000D00000027000000180000000300000000
        000000FFFFFF0000000000250000000C00000003000000190000000C000000FF
        FFFF00120000000C00000002000000250000000C00000007000080250000000C
        00000005000080250000000C0000000D0000800E000000140000000000000010
        0000001400000001}
    end
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 557
      DockPos = 597
    end
  end
  object qrySaldoDev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      
        '      HME.HMEDATAATUALIZA, HME.HMESALDODEV, HME.HMEPARCELA, HME.' +
        'HMENUMPARCELAS'
      '       FROM'
      '          HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '          ('
      '          SELECT /*+ INDEX(ITC) */'
      
        '             CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHIS' +
        'TMOVEMPTMO'
      '          FROM'
      '             HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      
        '             ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO' +
        ' TCE'
      '          WHERE'
      '                 ( ITC.ITCTRATASALDODEV   <> 0 )'
      '             AND ( HME.HMEDATAATUALIZA    <= :dData )'
      
        '             AND ( (HME.FLGESTORNADO       IS NULL) OR (HME.FLGE' +
        'STORNADO = 0) )'
      '             AND ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      
        '             AND ( (:PIDITEMEMPTMO IS NULL) OR (ITE.IDITEMEMPTMO' +
        ' = :PIDITEMEMPTMO) )'
      
        '             AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (CON.IDTIPOC' +
        'ONTREMPTMO = :PIDTIPOCONTREMPTMO) )'
      
        '             AND ( (:PIDTIPOEMPTMO IS NULL) OR (TCE.IDTIPOEMPTMO' +
        ' = :PIDTIPOEMPTMO) )'
      
        '             AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO' +
        ' )'
      
        '             AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTM' +
        'O )'
      
        '             AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTM' +
        'O )'
      
        '             AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTM' +
        'O )'
      '             AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '             AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '             AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '          GROUP BY'
      '             CON.IDCONTRATOEMPTMO'
      '          ) MAX'
      '       WHERE'
      '              ( CON.FLGSITUACAO        <> '#39'C'#39' )'
      '          AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '          AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '          AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '       ORDER BY CON.IDCONTRATOEMPTMO'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 296
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dData'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       C.IDCONTRQUITACAO      IS NULL'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HMETIPOMOV             = 0'
      '   AND HMEPARCELA             = 0'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryRenovacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C, CONTRATOEMPTMO A,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       A.IDCONTRQUITACAO      IS NOT NULL'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HMETIPOMOV             = 0'
      '   AND HMEPARCELA             = 0'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      '   AND C.IDCONTRATOEMPTMO     = A.IDCONTRQUITACAO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       HMETIPOMOV             IN (1, 8)'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 384
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryAmortizacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       HMETIPOMOV             = 2'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 464
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       HMETIPOMOV             = 3'
      '   AND HMEORIGEM              <> 8'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryQuitacaoMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(C) */'
      '   C.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC'
      'WHERE'
      '       HMETIPOMOV             = 3'
      '   AND HMEORIGEM              = 8'
      '   AND ITC.ITCTRATASALDODEV   <> 0'
      '   AND C.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMEANOCOMPETENCIA  = :sAno'
      '   AND HME.HMEMESCOMPETENCIA  = :sMes'
      
        '   AND ( (:PIDITEMEMPTMO IS NULL) OR (HME.IDITEMEMPTMO = :PIDITE' +
        'MEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ' :PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO = :PIDTIPO' +
        'EMPTMO) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      'ORDER BY C.IDCONTRATOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 624
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'sAno'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'sMes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end>
  end
end
