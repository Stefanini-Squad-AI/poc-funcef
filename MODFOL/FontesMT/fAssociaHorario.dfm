inherited frmAssociaHorario: TfrmAssociaHorario
  Left = 56
  Top = 171
  HelpContext = 210029
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Associa Horários com Turnos'
  ClientHeight = 351
  ClientWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 312
    BorderWidth = 2
    object gbxHorarioTrab: TGroupBox
      Left = 12
      Top = 7
      Width = 281
      Height = 294
      Caption = 'Horários de Trabalho'
      TabOrder = 0
      object dbgrdHorarioTrab: TwwDBGrid
        Left = 8
        Top = 14
        Width = 264
        Height = 271
        Selected.Strings = (
          'NOMEHORARIO'#9'40'#9'NOMEHORARIO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnCellChanged = dbgrdHorarioTrabCellChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsHorarioTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
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
    object gbxTurnoDiaDisp: TGroupBox
      Left = 300
      Top = 7
      Width = 363
      Height = 158
      Caption = 'Turnos Diários Disponíveis'
      TabOrder = 1
      object sbIncluirHorario: TSpeedButton
        Left = 8
        Top = 128
        Width = 25
        Height = 25
        Hint = 'Associar um Turno ao horário'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888777778888888888F777778FF888888776666677
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778F87F7E6FFFFFFFFF
          66087F8777777777887F7E6666FFF66666087F8888777F88887F7E6666FFF666
          660878F888777F88887887E666FFF666608887F888777F8887F887E666FFF666
          6088878F887778888788887EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbIncluirHorarioClick
      end
      object sbIncluirHorarioSemanal: TSpeedButton
        Left = 47
        Top = 128
        Width = 25
        Height = 25
        Hint = 'Associar um Turno ao horário para todos os dias da semana'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888F88878F887E6666F6666
          608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
          66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E66666F6666
          66087F8888878F88887F7E6666FFF66666087F88887778F8887F7E666FFFFF66
          660878F88777778F887887E6FFFFFFF6608887F87777777887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbIncluirHorarioSemanalClick
      end
      object sbExcluirHorario: TSpeedButton
        Left = 85
        Top = 128
        Width = 25
        Height = 25
        Hint = 'Desassociar o Turno selecionado do horário'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F8888766666666608888878888FFF8878F887E666FFF666
          608887F888777F8887F887E666FFF6666088878888777F88878F7E6666FFF666
          66087F8888777F88887F7E6666FFF66666087F8888777FFFF87F7E6FFFFFFFFF
          66087F8777777777887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
          660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
          6088878F888788888788887EE666666608888878FF888888788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbExcluirHorarioClick
      end
      object sbExcluirTodosHorarios: TSpeedButton
        Left = 123
        Top = 128
        Width = 25
        Height = 25
        Hint = 'Desassociar todos os Turnos do horário'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F88FFFFFFF87F887E6FFFFFFF66088878877777778878F7E666FFFFF66
          66087F8887777788887F7E6666FFF66666087F8888777888887F7E66666F6666
          66087F888FF7FFFF887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
          660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
          6088878F888788888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbExcluirTodosHorariosClick
      end
      object rdgDiasSem: TRadioGroup
        Left = 245
        Top = 10
        Width = 110
        Height = 139
        Caption = 'Dias da Semana'
        ItemIndex = 1
        Items.Strings = (
          '&Domingo'
          '&Segunda'
          '&Terça'
          'Qu&arta'
          'Qu&inta'
          'Se&xta'
          'Sá&bado')
        TabOrder = 0
      end
      object dbgdTurnoDiaDisp: TwwDBGrid
        Left = 8
        Top = 15
        Width = 232
        Height = 110
        Selected.Strings = (
          'INICIOEXPEDIENTE'#9'6'#9'Início'
          'INICIOALMOCO'#9'10'#9'I. Almoço'#9'F'
          'FINALALMOCO'#9'10'#9'F. Almoço'
          'FINALEXPEDIENTE'#9'6'#9'Final')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsTurnoDiaDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    object gbxTurnoDiaSel: TGroupBox
      Left = 300
      Top = 167
      Width = 363
      Height = 134
      Caption = 'Turnos Diários Selecionados'
      TabOrder = 2
      object dbgdTurnoDiaSel: TwwDBGrid
        Left = 8
        Top = 15
        Width = 346
        Height = 110
        Selected.Strings = (
          'DIASEMANA'#9'15'#9'Dia da Semana'
          'INICIOEXPEDIENTE'#9'8'#9'Início'
          'INICIOALMOCO'#9'9'#9'I. Almoço'
          'FINALALMOCO'#9'10'#9'F. Almoço'#9'F'
          'FINALEXPEDIENTE'#9'8'#9'Final')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsTurnoDiaSel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColLines, dgRowSelect, dgAlwaysShowSelection]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 312
    Width = 676
    inherited tb97Fundo: TToolbar97
      Left = 510
      DockPos = 518
    end
  end
  object dsHorarioTrab: TwwDataSource
    AutoEdit = False
    DataSet = CdsHorarioTrab
    Left = 162
    Top = 99
  end
  object dsTurnoDiaSel: TwwDataSource
    AutoEdit = False
    DataSet = CdsTurnoDiaSel
    Left = 437
    Top = 212
  end
  object dsTurnoDiaDisp: TwwDataSource
    DataSet = CdsTurnoDiaDisp
    Left = 447
    Top = 67
  end
  object CdsHorarioTrab: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDTURNODIARIO'
        DataType = ftFloat
      end
      item
        Name = 'INICIOEXPEDIENTE'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'INICIOALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALEXPEDIENTE'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'CdsHorarioTrabIndex'
        CaseInsFields = 'NOMEHORARIO'
        Fields = 'NOMEHORARIO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsHorarioTrabIndex'
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 88
    Top = 99
  end
  object CdsTurnoDiaDisp: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDTURNODIARIO'
        DataType = ftFloat
      end
      item
        Name = 'INICIOEXPEDIENTE'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'INICIOALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALEXPEDIENTE'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'CdsTurnoDiaDispIndex'
        Fields = 'IDTURNODIARIO'
      end>
    IndexName = 'CdsTurnoDiaDispIndex'
    Params = <>
    StoreDefs = True
    Left = 365
    Top = 67
  end
  object CdsTurnoDiaSel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDTURNODIARIO'
        DataType = ftFloat
      end
      item
        Name = 'IDDIASEMANA'
        DataType = ftFloat
      end
      item
        Name = 'DIASEMANA'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'INICIOEXPEDIENTE'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'INICIOALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALALMOCO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FINALEXPEDIENTE'
        DataType = ftString
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'CdsTurnoDiaSelIndex'
        Fields = 'IDDIASEMANA'
      end>
    IndexName = 'CdsTurnoDiaSelIndex'
    Params = <>
    StoreDefs = True
    Left = 361
    Top = 212
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      TS.IDHORARIO, TS.IDTURNODIARIO, TS.IDDIASEMANA,'
      
        '      DECODE(TS.IDDIASEMANA, 1,'#39'  Domingo'#39', 2,'#39'  Segunda'#39', 3,'#39'  ' +
        'Terça'#39','
      
        '        4,'#39'  Quarta'#39', 5,'#39'  Quinta'#39', 6,'#39'  Sexta'#39', 7,'#39'  Sábado'#39') A' +
        'S DIASEMANA,'
      
        '      TD.INICIOEXPEDIENTE, TD.INICIOALMOCO, TD.FINALALMOCO, TD.F' +
        'INALEXPEDIENTE'
      '    FROM'
      '      TURNODIA TD, TURNOSEM TS'
      '    WHERE'
      '      (TS.IDHORARIO     = 1) AND'
      '      (TS.IDTURNODIARIO = TD.IDTURNODIARIO)')
    Left = 464
    Top = 360
  end
end
