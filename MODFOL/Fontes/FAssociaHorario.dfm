inherited frmAssociaHorario: TfrmAssociaHorario
  Left = 91
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Associa Horários com Turnos'
  ClientHeight = 347
  ClientWidth = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 308
    BorderWidth = 2
    object gbxHorarioTrab: TGroupBox
      Left = 12
      Top = 7
      Width = 281
      Height = 289
      Caption = 'Horários de Trabalho'
      TabOrder = 0
      object dbgrdHorarioTrab: TDBGrid
        Left = 8
        Top = 14
        Width = 264
        Height = 267
        DataSource = dsHorarioTrab
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgrdHorarioTrabCellClick
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
        Top = 130
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
        Top = 130
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
        Top = 130
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
        Top = 130
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
        TabOrder = 1
      end
      object dbgrdTurnoDia: TDBGrid
        Tag = 1
        Left = 8
        Top = 15
        Width = 231
        Height = 114
        DataSource = dsTurnoDiaDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
    object gbxTurnoDiaSel: TGroupBox
      Left = 300
      Top = 167
      Width = 363
      Height = 129
      Caption = 'Turnos Diários Selecionados'
      TabOrder = 2
      object dbgrdTurnoSem: TDBGrid
        Left = 9
        Top = 15
        Width = 346
        Height = 105
        DataSource = dsTurnoDiaSel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
    end
  end
  inherited Dock971: TDock97
    Top = 308
    Width = 676
    inherited tb97Fundo: TToolbar97
      Left = 506
      DockPos = 506
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 338
      DockPos = 338
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 302
  end
  object qryModifica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 378
    Top = 228
  end
  object qryHorarioTrab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDHORARIO, NOMEHORARIO'
      'FROM'
      '    HORATRAB'
      'WHERE'
      '    (FLGTIPOHORARIO = 0)'
      'ORDER BY'
      '    NOMEHORARIO')
    ValidateWithMask = True
    Left = 91
    Top = 99
    object qryHorarioTrabIDHORARIO: TFloatField
      FieldName = 'IDHORARIO'
      Origin = 'HORATRAB.IDHORARIO'
      Visible = False
    end
    object qryHorarioTrabNOMEHORARIO: TStringField
      DisplayWidth = 40
      FieldName = 'NOMEHORARIO'
      Origin = 'HORATRAB.NOMEHORARIO'
      Size = 40
    end
  end
  object dsHorarioTrab: TwwDataSource
    AutoEdit = False
    DataSet = qryHorarioTrab
    Left = 162
    Top = 99
  end
  object dsTurnoDiaSel: TwwDataSource
    AutoEdit = False
    DataSet = qryTurnoDiaSel
    Left = 518
    Top = 228
  end
  object qryTurnoDiaSel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsHorarioTrab
    SQL.Strings = (
      'SELECT'
      '    TS.IDHORARIO, TS.IDTURNODIARIO, TS.IDDIASEMANA,'
      
        '    DECODE(TS.IDDIASEMANA,1,'#39'  Domingo'#39',2,'#39'  Segunda'#39',3,'#39'  Terça' +
        #39',4,'#39'  Quarta'#39',5,'#39'  Quinta'#39',6,'#39'  Sexta'#39',7,'#39'  Sábado'#39') AS DIASEMA' +
        'NA,'
      
        '    TD.INICIOEXPEDIENTE, TD.INICIOALMOCO, TD.FINALALMOCO, TD.FIN' +
        'ALEXPEDIENTE'
      'FROM'
      '   TURNODIA TD, TURNOSEM TS'
      'WHERE'
      '    (TS.IDHORARIO = :IDHORARIO) AND'
      '    (TS.IDTURNODIARIO = TD.IDTURNODIARIO)'
      'ORDER BY'
      '    TS.IDDIASEMANA')
    UpdateMode = upWhereChanged
    ValidateWithMask = True
    Left = 445
    Top = 228
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHORARIO'
        ParamType = ptUnknown
      end>
    object qryTurnoDiaSelDIASEMANA: TStringField
      DisplayLabel = 'Dia da Semana'
      DisplayWidth = 15
      FieldName = 'DIASEMANA'
      Size = 9
    end
    object qryTurnoDiaSelINICIOEXPEDIENTE: TStringField
      DisplayLabel = 'Início'
      FieldName = 'INICIOEXPEDIENTE'
      Size = 8
    end
    object qryTurnoDiaSelINICIOALMOCO: TStringField
      DisplayLabel = 'I. Almoço'
      FieldName = 'INICIOALMOCO'
      Size = 8
    end
    object qryTurnoDiaSelFINALALMOCO: TStringField
      DisplayLabel = 'F. Almoço'
      FieldName = 'FINALALMOCO'
      Size = 8
    end
    object qryTurnoDiaSelFINALEXPEDIENTE: TStringField
      DisplayLabel = 'Final'
      FieldName = 'FINALEXPEDIENTE'
      Size = 8
    end
    object qryTurnoDiaSelIDHORARIO: TFloatField
      FieldName = 'IDHORARIO'
      Visible = False
    end
    object qryTurnoDiaSelIDDIASEMANA: TFloatField
      FieldName = 'IDDIASEMANA'
      Visible = False
    end
    object qryTurnoDiaSelIDTURNODIARIO: TFloatField
      FieldName = 'IDTURNODIARIO'
      Visible = False
    end
  end
  object dsTurnoDiaDisp: TwwDataSource
    DataSet = qryTurnoDiaDisp
    Left = 467
    Top = 67
  end
  object qryTurnoDiaDisp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    IDTURNODIARIO, INICIOEXPEDIENTE, INICIOALMOCO, FINALALMOCO, ' +
        'FINALEXPEDIENTE'
      'FROM'
      '    TURNODIA'
      'ORDER BY'
      '    IDTURNODIARIO')
    ValidateWithMask = True
    Left = 388
    Top = 67
    object qryTurnoDiaDispIDTURNODIARIO: TFloatField
      DisplayLabel = 'Codigo'
      FieldName = 'IDTURNODIARIO'
      Origin = 'TURNODIA.IDTURNODIARIO'
      Visible = False
    end
    object qryTurnoDiaDispINICIOEXPEDIENTE: TStringField
      DisplayLabel = 'Início'
      FieldName = 'INICIOEXPEDIENTE'
      Origin = 'TURNODIA.INICIOEXPEDIENTE'
      Size = 8
    end
    object qryTurnoDiaDispINICIOALMOCO: TStringField
      DisplayLabel = 'I.Alm.'
      FieldName = 'INICIOALMOCO'
      Origin = 'TURNODIA.INICIOALMOCO'
      Size = 8
    end
    object qryTurnoDiaDispFINALALMOCO: TStringField
      DisplayLabel = 'F.Alm.'
      FieldName = 'FINALALMOCO'
      Origin = 'TURNODIA.FINALALMOCO'
      Size = 8
    end
    object qryTurnoDiaDispFINALEXPEDIENTE: TStringField
      DisplayLabel = 'Final'
      FieldName = 'FINALEXPEDIENTE'
      Origin = 'TURNODIA.FINALEXPEDIENTE'
      Size = 8
    end
  end
end
