inherited frmManipCenarioMT: TfrmManipCenarioMT
  Left = 184
  Top = 99
  HelpContext = 520004
  Caption = 'Manipula Cenários'
  ClientHeight = 406
  ClientWidth = 466
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 466
    Height = 367
    object lblExercicio: TLabel
      Left = 25
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Exercício'
    end
    object lblLegenda: TLabel
      Left = 8
      Top = 326
      Width = 63
      Height = 13
      Caption = 'lblLegenda'
      Visible = False
    end
    object lblCond: TLabel
      Left = 121
      Top = 10
      Width = 54
      Height = 13
      Caption = 'Condição'
    end
    object lblPercentual: TLabel
      Left = 355
      Top = 10
      Width = 83
      Height = 13
      Caption = 'Percentual (%)'
    end
    object spnedExercicio: TSpinEdit
      Left = 25
      Top = 26
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object pbAguarde: TProgressBar
      Left = 1
      Top = 345
      Width = 464
      Height = 21
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 5
    end
    object gbSalvar: TGroupBox
      Left = 25
      Top = 51
      Width = 415
      Height = 106
      Caption = 'Cenários'
      TabOrder = 3
      object lblDestino: TLabel
        Left = 10
        Top = 59
        Width = 44
        Height = 13
        Caption = 'Destino'
      end
      object lblOrigem: TLabel
        Left = 10
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Origem'
      end
      object dblcCenarioOrigem: TCMDBLookupCombo
        Left = 10
        Top = 32
        Width = 394
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECENARIO'#9'60'#9'Nome do Cenário')
        LookupTable = cdsCenario
        LookupField = 'IDCENARIOORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcCenarioDestino: TCMDBLookupCombo
        Left = 10
        Top = 75
        Width = 394
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECENARIO'#9'60'#9'Nome do Cenário')
        LookupTable = cdsCenario
        LookupField = 'IDCENARIOORCAMEN'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object gbParametros: TGroupBox
      Left = 25
      Top = 161
      Width = 415
      Height = 157
      Caption = ' Parâmetros '
      TabOrder = 4
      object Label2: TLabel
        Left = 39
        Top = 17
        Width = 46
        Height = 13
        Caption = 'Posição'
      end
      object Label5: TLabel
        Left = 12
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label7: TLabel
        Left = 69
        Top = 32
        Width = 42
        Height = 13
        Caption = 'Dígitos'
      end
      object Label9: TLabel
        Left = 126
        Top = 32
        Width = 55
        Height = 13
        Caption = 'Conteúdo'
      end
      object sePosIni1: TwwDBSpinEdit
        Left = 12
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object sePosFim1: TwwDBSpinEdit
        Left = 69
        Top = 46
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object edConteudo1: TEdit
        Left = 126
        Top = 46
        Width = 277
        Height = 21
        TabOrder = 2
      end
      object sePosIni2: TwwDBSpinEdit
        Left = 12
        Top = 74
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object sePosFim2: TwwDBSpinEdit
        Left = 69
        Top = 74
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 4
        UnboundDataType = wwDefault
      end
      object edConteudo2: TEdit
        Left = 126
        Top = 74
        Width = 277
        Height = 21
        TabOrder = 5
      end
      object sePosIni3: TwwDBSpinEdit
        Left = 12
        Top = 102
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 6
        UnboundDataType = wwDefault
      end
      object sePosFim3: TwwDBSpinEdit
        Left = 69
        Top = 102
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 7
        UnboundDataType = wwDefault
      end
      object edConteudo3: TEdit
        Left = 126
        Top = 102
        Width = 277
        Height = 21
        TabOrder = 8
      end
      object sePosIni4: TwwDBSpinEdit
        Left = 12
        Top = 129
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 9
        UnboundDataType = wwDefault
      end
      object sePosFim4: TwwDBSpinEdit
        Left = 69
        Top = 129
        Width = 49
        Height = 21
        Increment = 1
        TabOrder = 10
        UnboundDataType = wwDefault
      end
      object edConteudo4: TEdit
        Left = 126
        Top = 129
        Width = 277
        Height = 21
        TabOrder = 11
      end
    end
    object dbcboCondicao: TwwDBComboBox
      Left = 122
      Top = 26
      Width = 219
      Height = 21
      ShowButton = True
      Style = csDropDownList
      MapList = False
      AllowClearKey = False
      DataField = 'CONDICAO'
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Aumentar em'
        'Diminuir em')
      Sorted = False
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object rePerc: TRealEdit
      Left = 355
      Top = 26
      Width = 85
      Height = 22
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 466
    inherited tb97Fundo: TToolbar97
      Left = 216
      DockPos = 218
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        HelpContext = 520077
      end
      object bbtnEfetiva: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        TabOrder = 2
        OnClick = bbtnEfetivaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555205555
          5555500000005555522205555555500000005555522205555555500000005555
          22222055555550000000555222A220755555500000005522AA5A220555555000
          000052AA5555A20755555000000055555055A220555550000000555500055A20
          7555500000005550505055A207555000000055555050555A2055500000005555
          00055555A207500000005550505555555AAA0000000055505050555555555000
          0000555500055555555550000000555550555555555550000000555555555555
          555550000000}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 240
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object cdsSaldoCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 185
    Top = 59
  end
  object sqlSaldoCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDVALORESCENARIO, VLRORCCENARIO'
      'FROM                                           '
      '  VALORESCENARIO'
      'WHERE                                          '
      '  (IDPESSOA = :IDPESSOA) AND (EXERCICIO = :EXERCICIO) AND'
      '  (IDCENARIOORCAMEN = :IDCENARIOORCAMEN)'
      '  :CONTEUDO1'
      '  :CONTEUDO2'
      '  :CONTEUDO3'
      '  :CONTEUDO4'
      ''
      ' ')
    OnFormartParam = sqlSaldoCenarioFormartParam
    ClientDataSet = cdsSaldoCenario
    Left = 153
    Top = 59
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDCENARIOORCAMEN, NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN'
      'ORDER BY'
      '  NOMECENARIO')
    ClientDataSet = cdsCenario
    Left = 153
    Top = 91
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 185
    Top = 91
  end
  object sqlTestaOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO'
      'FROM'
      '  SALDOORCADO'
      'WHERE'
      
        '  (IDPESSOA = :IDPESSOA) AND (IDPLANOORCAMEN = :IDPLANOORCAMEN) ' +
        'AND'
      
        '  (IDCONTAORCAMEN = :IDCONTAORCAMEN) AND (DATAREFERENCIA = :DATA' +
        'REFERENCIA)'
      '')
    ClientDataSet = cdsTestaOrc
    Left = 153
    Top = 123
  end
  object cdsTestaOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 185
    Top = 123
  end
  object sqlOrcado: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  EXERCICIO, PERIODO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN,'
      
        '  ROUND(SUM(DECODE(VLRORCCENARIO,NULL,0,VLRORCCENARIO)),2) AS VL' +
        'RORCADO'
      'FROM'
      '  VALORESCENARIO'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA) AND (EXERCICIO = :EXERCICIO) AND'
      '  (IDCENARIOORCAMEN = :IDCENARIOORCAMEN)'
      'GROUP BY'
      '  EXERCICIO, PERIODO, IDPESSOA, IDCONTAORCAMEN, IDPLANOORCAMEN'
      'HAVING'
      '  ROUND(SUM(DECODE(VLRORCCENARIO,NULL,0,VLRORCCENARIO)),2) <> 0'
      ''
      ' ')
    ClientDataSet = cdsOrcado
    Left = 289
    Top = 59
  end
  object cdsOrcado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 321
    Top = 59
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PERIODO, DATAINIPERIODO, DATAFIMPERIODO, FLGBLOQUEADO'
      'FROM'
      '  PERIODOORCAMEN'
      'WHERE '
      '  (EXERCICIO =:EXERCICIO) AND (IDPESSOA =:PESSOA)'
      'ORDER BY'
      '  PERIODO')
    ClientDataSet = cdsPeriodo
    Left = 289
    Top = 99
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 321
    Top = 99
  end
end
