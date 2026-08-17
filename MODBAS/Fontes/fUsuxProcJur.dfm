inherited FrmUsuxProcJur: TFrmUsuxProcJur
  Left = 13
  Top = 126
  HelpContext = 1100025
  Caption = 'Transferência de Processos Entre Responsáveis'
  ClientHeight = 410
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 371
    object Label1: TLabel
      Left = 13
      Top = 37
      Width = 119
      Height = 13
      Caption = 'Advogado da Casa 1'
    end
    object Label2: TLabel
      Left = 404
      Top = 37
      Width = 119
      Height = 13
      Caption = 'Advogado da Casa 2'
    end
    object sbtnAdicionarTudo: TSpeedButton
      Left = 364
      Top = 145
      Width = 39
      Height = 34
      Hint = 'Tranferir Todos de 1 para 2'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
        66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
        66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
        660878F877887788887887E6F666F666608887F87888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAdicionarTudoClick
    end
    object sbtnAdicionar: TSpeedButton
      Left = 364
      Top = 188
      Width = 39
      Height = 34
      Hint = 'Tranferir de 1 para 2'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
        66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
        66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
        660878F888778888887887E666F66666608887F88878888887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnAdicionarClick
    end
    object sbtnRemover: TSpeedButton
      Left = 364
      Top = 231
      Width = 39
      Height = 34
      Hint = 'Tranferir de 2 para 1'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
        66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
        66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
        660878F888877F88887887E66666F666608887F88888788887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnRemoverClick
    end
    object sbtnRemoverTudo: TSpeedButton
      Left = 364
      Top = 273
      Width = 39
      Height = 34
      Hint = 'Tranferir Todos de 2 para 1'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88887666666666088888788888888878F887E666666666
        608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
        66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
        66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
        660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
        6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnRemoverTudoClick
    end
    object dblcAdvCasa: TwwDBLookupCombo
      Left = 13
      Top = 52
      Width = 350
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'No')
      LookupTable = qryAdvCasa1
      LookupField = 'NOME'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      OnCloseUp = dblcAdvCasaCloseUp
    end
    object dblcAdvCasa2: TwwDBLookupCombo
      Left = 404
      Top = 52
      Width = 350
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'No')
      LookupTable = qryAdvCasa2
      LookupField = 'NOME'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = True
      OnCloseUp = dblcAdvCasa2CloseUp
    end
    object Panel1: TPanel
      Left = 12
      Top = 100
      Width = 350
      Height = 28
      BevelInner = bvLowered
      Caption = 'Processos do Advogado 1'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object grdAdv1: TwwDBGrid
      Left = 12
      Top = 129
      Width = 350
      Height = 210
      Selected.Strings = (
        'PROCJCJNUM'#9'8'#9'Processo'
        'NOME'#9'30'#9'Contra-Parte'
        'DATANOTIF'#9'10'#9'Data Notif.'
        'DATAJUIZO'#9'10'#9'Data Ajuiz.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = grdAdv1DblClick
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 404
      Top = 101
      Width = 350
      Height = 27
      BevelInner = bvLowered
      Caption = 'Processos do Advogado 2'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object grdAdv2: TwwDBGrid
      Left = 404
      Top = 129
      Width = 350
      Height = 210
      Selected.Strings = (
        'PROCJCJNUM'#9'8'#9'Processo'
        'NOME'#9'30'#9'Contra-Pate'
        'DATANOTIF'#9'10'#9'Data Notif.'
        'DATAJUIZO'#9'10'#9'Data Ajuiz.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsProcAdv2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = grdAdv2DblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 764
  end
  object qryAdvCasa1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select p.nome, s.idusuario from pessoa p, usuariosistema s'
      'where p.idpessoa=s.idusuario'
      'order by upper(p.nome)')
    ValidateWithMask = True
    Left = 311
    Top = 54
  end
  object qryAdvCasa2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select p.nome, s.idusuario from pessoa p, usuariosistema s'
      'where p.idpessoa=s.idusuario'
      'order by upper(p.nome)')
    ValidateWithMask = True
    Left = 639
    Top = 54
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDADVOGCASA = :IDADVOGCASA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (IDADVOGCASA)'
      'values'
      '  (:IDADVOGCASA)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 265
    Top = 2
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        PJ.*,'
      '        P.NOME'
      'FROM'
      '        PESSOA P,'
      '        PROCESSOTRAB PJ'
      'WHERE'
      '              (PJ.IDADVOGCASA   =  :pIDUSU)'
      '     AND (PJ.IDRECLAMANTE = P.IDPESSOA)'
      'ORDER BY P.NOME')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 296
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSU'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 325
    Top = 2
  end
  object updProcAdv2: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDADVOGCASA = :IDADVOGCASA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (IDADVOGCASA)'
      'values'
      '  (:IDADVOGCASA)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 440
    Top = 1
  end
  object qryProcAdv2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        PJ.*,'
      '        P.NOME'
      'FROM'
      '        PESSOA P,'
      '        PROCESSOTRAB PJ'
      'WHERE'
      '              (PJ.IDADVOGCASA          =  :pIDUSU2)'
      '     AND (PJ.IDRECLAMANTE        = P.IDPESSOA)'
      'ORDER BY P.NOME'
      '')
    UpdateObject = updProcAdv2
    ValidateWithMask = True
    Left = 504
    Top = 3
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDUSU2'
        ParamType = ptUnknown
      end>
  end
  object dsProcAdv2: TwwDataSource
    AutoEdit = False
    DataSet = qryProcAdv2
    Left = 558
    Top = 3
  end
end
