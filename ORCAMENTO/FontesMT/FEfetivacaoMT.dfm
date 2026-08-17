inherited frmEfetivacaoMT: TfrmEfetivacaoMT
  Left = 192
  Top = 161
  HelpContext = 520015
  Caption = 'Efetivação de Reservas e Compromissos'
  ClientHeight = 430
  ClientWidth = 729
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 391
    object dbgrdReservas: TwwDBGrid
      Left = 1
      Top = 121
      Width = 727
      Height = 269
      Selected.Strings = (
        'IDOPERACAO'#9'10'#9'Operação'
        'NUMCOMPROMISSO'#9'10'#9'Nº Comp.'
        'DATAREFERENCIA'#9'18'#9'Data Ref.'
        'VALOR'#9'10'#9'Valor'
        'VLRCOMPROMISSO'#9'12'#9'Valor Efetivado'
        'NOMECONTAORCAMEN'#9'100'#9'Nome'
        'VLRDEVOLVIDO'#9'12'#9'Valor Devolvido'
        'STATUS'#9'40'#9'Status'
        'EXERCICIO'#9'10'#9'Exercício'
        'PERIODO'#9'10'#9'Período'
        'CODCENTRORESPON'#9'12'#9'Centro Resp.'
        'FLGRESCOMP'#9'13'#9'Reserva/Compr.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrdReservasCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgrdReservasTopRowChanged
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 92
      Align = alTop
      TabOrder = 1
      object Panel1: TPanel
        Left = 8
        Top = 7
        Width = 554
        Height = 79
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 8
        object Label2: TLabel
          Left = 9
          Top = 20
          Width = 185
          Height = 13
          Caption = 'Período de Datas de Referência'
        end
        object Label1: TLabel
          Left = 120
          Top = 40
          Width = 8
          Height = 13
          Caption = 'a'
        end
      end
      object GroupBox1: TGroupBox
        Left = 567
        Top = 2
        Width = 153
        Height = 84
        Caption = 'Não Filtrar...'
        TabOrder = 0
        object chkCanceladas: TCheckBox
          Left = 12
          Top = 19
          Width = 105
          Height = 17
          Caption = 'Cancelamentos'
          TabOrder = 0
          OnClick = dteDataIniChange
        end
        object chkReservas: TCheckBox
          Left = 12
          Top = 63
          Width = 81
          Height = 17
          Caption = 'Reservas'
          TabOrder = 1
          OnClick = dteDataIniChange
        end
        object chkCompromissos: TCheckBox
          Left = 12
          Top = 42
          Width = 105
          Height = 17
          Caption = 'Compromissos'
          TabOrder = 2
          OnClick = dteDataIniChange
        end
      end
      object dteDataIni: TCMDateTimePicker
        Left = 16
        Top = 43
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
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
        OnChange = dteDataIniChange
      end
      object dteDataFim: TCMDateTimePicker
        Left = 144
        Top = 43
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
        TabOrder = 2
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
        OnChange = dteDataIniChange
      end
      object bbtnFiltra: TBitBtn
        Left = 264
        Top = 17
        Width = 81
        Height = 29
        Caption = 'Filtra'
        TabOrder = 3
        OnClick = bbtnFiltraClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
          33333333330F803333333333330F803333333333330F803333333333308F8703
          3333333308F88870333333308F88888703333308F88888887033308F88888888
          870330000000000000033337FFCCCFFF033333337FFFFFCFF03333337FFCCCFF
          FF03333337FFFFFF77333333337FFF7733333333333777333333}
        Spacing = 8
      end
      object bbtnDevolve: TBitBtn
        Left = 264
        Top = 49
        Width = 132
        Height = 29
        Cancel = True
        Caption = '&Devolve Saldo'
        ModalResult = 2
        TabOrder = 4
        OnClick = bbtnDevolveClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333377733333
          3333300000003330007333333333300000003370F07773333333300000003000
          F000733333333000000030FFFFF073333333300000003000F000333333333000
          00003330F0333333333330000000363000333333343330000000363333333333
          4443300000003663336333343434300000003666336633333434300000003366
          6666633344433000000033366666663434333000000033336666633434343000
          0000333333663333444330000000333333633333343330000000333333333333
          333330000000}
      end
      object bbtnEfetiva: TBitBtn
        Left = 360
        Top = 17
        Width = 81
        Height = 29
        Caption = '&Efetiva'
        ModalResult = 1
        TabOrder = 5
        OnClick = bbtnEfetivaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888005555500
          88888887788888778F88887555555555088888788888888878F887D558855555
          508887F88FFF888887F887D5FFF8555550888788777FF888878F7D55FFFF8555
          55087F887777FF88887F7D55FFFFF85555087F8877777FF8887F7D55FF8FFF85
          55087F8877F777FF887F7D55FF85FFF855087F8877F8777F887F7D55FF555FF8
          550878F87788877FF87887D5555555FF508887F88888887787F887D555555555
          5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object bbtnDevComp: TBitBtn
        Left = 406
        Top = 49
        Width = 132
        Height = 29
        Cancel = True
        Caption = '&Dev. Comp. Efet.'
        ModalResult = 2
        TabOrder = 6
        OnClick = bbtnDevCompClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333377733333
          3333300000003330007333333333300000003370F07773333333300000003000
          F000733333333000000030FFFFF073333333300000003000F000333333333000
          00003330F0333333333330000000363000333333343330000000363333333333
          4443300000003663336333343434300000003666336633333434300000003366
          6666633344433000000033366666663434333000000033336666633434343000
          0000333333663333444330000000333333633333343330000000333333333333
          333330000000}
      end
      object bbtnCancela: TBitBtn
        Left = 457
        Top = 17
        Width = 81
        Height = 29
        Cancel = True
        Caption = '&Cancela'
        ModalResult = 2
        TabOrder = 7
        OnClick = bbtnCancelaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 93
      Width = 727
      Height = 28
      Align = alTop
      Caption = 'Reserva(s) / Compromisso(s) selecionados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 388
      DockPos = 388
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520015
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 931
    Top = 27
  end
  object ds: TwwDataSource
    DataSet = cdsReservasTotal
    Left = 72
    Top = 160
  end
  object dsDocRec: TwwDataSource
    DataSet = cdsDocRec
    Left = 514
    Top = 160
  end
  object cdsReservas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 124
    Top = 160
    object cdsReservasNUMRESERVA: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Nº'
      DisplayWidth = 10
      FieldName = 'NUMRESERVA'
    end
    object cdsReservasNUMCOMPROMISSO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Nº Comp.'
      DisplayWidth = 10
      FieldName = 'NUMCOMPROMISSO'
    end
    object cdsReservasDATAREFERENCIA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Ref.'
      DisplayWidth = 18
      FieldName = 'DATAREFERENCIA'
    end
    object cdsReservasVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
    end
    object cdsReservasVLRCOMPROMISSO: TFloatField
      DisplayLabel = 'Valor Efetivado'
      DisplayWidth = 12
      FieldName = 'VLRCOMPROMISSO'
      DisplayFormat = ',0.00'
    end
    object cdsReservasIDCONTAORCAMEN: TStringField
      Alignment = taCenter
      DisplayLabel = 'Conta'
      DisplayWidth = 30
      FieldName = 'IDCONTAORCAMEN'
      Size = 30
    end
    object cdsReservasNOMECONTAORCAMEN: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 100
      FieldName = 'NOMECONTAORCAMEN'
      Size = 100
    end
    object cdsReservasVLRDEVOLVIDO: TFloatField
      DisplayLabel = 'Valor Devolvido'
      DisplayWidth = 12
      FieldName = 'VLRDEVOLVIDO'
      DisplayFormat = ',0.00'
    end
    object cdsReservasSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 40
      FieldName = 'STATUS'
      FixedChar = True
      Size = 40
    end
    object cdsReservasVALIDAR: TStringField
      DisplayLabel = 'Validar'
      DisplayWidth = 40
      FieldName = 'VALIDAR'
      FixedChar = True
      Size = 40
    end
    object cdsReservasEXERCICIO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Exercício'
      DisplayWidth = 10
      FieldName = 'EXERCICIO'
    end
    object cdsReservasPERIODO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Período'
      DisplayWidth = 10
      FieldName = 'PERIODO'
    end
    object cdsReservasCODCENTRORESPON: TStringField
      Alignment = taCenter
      DisplayLabel = 'Centro Resp.'
      DisplayWidth = 12
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object cdsReservasFLGRESCOMP: TStringField
      Alignment = taCenter
      DisplayLabel = 'Reserva/Compr.'
      DisplayWidth = 13
      FieldName = 'FLGRESCOMP'
      FixedChar = True
      Size = 1
    end
    object cdsReservasIDOPERACAO: TFloatField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'IDOPERACAO'
    end
    object cdsReservasFLGRESERVA: TStringField
      Alignment = taCenter
      FieldName = 'FLGRESERVA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsReservasIDRESERVAORCAMEN: TFloatField
      Alignment = taCenter
      FieldName = 'IDRESERVAORCAMEN'
      Visible = False
    end
    object cdsReservasIDPLANOORCAMEN: TFloatField
      Alignment = taCenter
      FieldName = 'IDPLANOORCAMEN'
      Visible = False
    end
  end
  object cdsAltReservas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 224
    Top = 160
  end
  object cdsDocRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 457
    Top = 216
  end
  object cdsTestaDocxComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 416
    Top = 160
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT R.NUMRESERVA,'
      '       CPR.NUMCOMPROMISSO,'
      '       RXC.IDCOMPROMISSO, '
      '       R.DATAREFERENCIA,  '
      '       R.VLRRESERVA AS VALOR,      '
      '       R.VLRCOMPROMISSO,  '
      '       R.FLGRESERVA,      '
      '       R.IDRESERVAORCAMEN,'
      '       R.IDCONTAORCAMEN,  '
      '       C.NOMECONTAORCAMEN,'
      '       R.FLGRESCOMP,      '
      '       R.VLRDEVOLVIDO,    '
      '       R.IDPLANOORCAMEN,  '
      '       R.EXERCICIO,       '
      '       R.PERIODO,         '
      '       C.CODCENTRORESPON, '
      
        '       '#39'                                        '#39' AS STATUS     ' +
        '  '
      '  FROM RESERVAORCAMEN R,  '
      '       RESXCOMP       RXC,'
      '       CONTASORCAMEN  C,  '
      '       PESSOAXCRESP   CR, '
      '       (SELECT R1.NUMRESERVA,                  '
      '               R2.NUMRESERVA AS NUMCOMPROMISSO '
      '          FROM RESERVAORCAMEN R1,              '
      '               RESERVAORCAMEN R2,              '
      '               RESXCOMP RXC1                   '
      
        '         WHERE R1.DATAREFERENCIA BETWEEN TO_DATE('#39'01/12/2004'#39', '#39 +
        'DD/MM/YYYY'#39') AND'
      
        '                                         TO_DATE('#39'31/12/2004'#39', '#39 +
        'DD/MM/YYYY'#39')     '
      
        '           AND R1.IDRESERVAORCAMEN = RXC1.IDRESERVA             ' +
        '    '
      
        '           AND R2.IDRESERVAORCAMEN = RXC1.IDCOMPROMISSO) CPR    ' +
        '    '
      ' WHERE CR.CODCENTRORESPON = C.CODCENTRORESPON '
      '   AND CR.IDPESSOA        = C.IDPESSOA        '
      '   AND CR.IDPESSOAACESSO  = 510'
      '   AND R.IDPESSOA         = 2'
      
        '   AND R.DATAREFERENCIA   BETWEEN TO_DATE('#39'01/12/2004'#39', '#39'DD/MM/Y' +
        'YYY'#39') AND'
      
        '                                  TO_DATE('#39'31/12/2004'#39', '#39'DD/MM/Y' +
        'YYY'#39')     '
      '   AND R.IDCONTAORCAMEN   = C.IDCONTAORCAMEN  '
      '   AND R.NUMRESERVA       = CPR.NUMRESERVA(+) '
      '   AND R.IDRESERVAORCAMEN = RXC.IDRESERVA(+)'
      '   AND 1=2  '
      'ORDER BY '
      '   R.DATAREFERENCIA, R.NUMRESERVA '
      ' ')
    ClientDataSet = cdsReservas
    Left = 128
    Top = 216
  end
  object cdsReservasTotal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 256
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data Ref.'
      DisplayWidth = 18
      FieldName = 'DATAREFERENCIA'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = ',0.00'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Valor Efetivado'
      DisplayWidth = 12
      FieldName = 'VLRCOMPROMISSO'
      DisplayFormat = ',0.00'
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 100
      FieldName = 'NOMECONTAORCAMEN'
      Size = 100
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Valor Devolvido'
      DisplayWidth = 12
      FieldName = 'VLRDEVOLVIDO'
      DisplayFormat = ',0.00'
    end
    object StringField3: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 40
      FieldName = 'STATUS'
      FixedChar = True
      Size = 40
    end
    object FloatField6: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Exercício'
      DisplayWidth = 10
      FieldName = 'EXERCICIO'
    end
    object FloatField7: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Período'
      DisplayWidth = 10
      FieldName = 'PERIODO'
    end
    object StringField4: TStringField
      Alignment = taCenter
      DisplayLabel = 'Centro Resp.'
      DisplayWidth = 12
      FieldName = 'CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object StringField5: TStringField
      Alignment = taCenter
      DisplayLabel = 'Reserva/Compr.'
      DisplayWidth = 13
      FieldName = 'FLGRESCOMP'
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      Alignment = taCenter
      DisplayLabel = 'Reserva.'
      DisplayWidth = 13
      FieldName = 'FLGRESERVA'
      FixedChar = True
      Size = 1
    end
    object FloatField8: TFloatField
      DisplayLabel = 'Operação'
      DisplayWidth = 10
      FieldName = 'IDOPERACAO'
    end
  end
end
