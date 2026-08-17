inherited frmAdvogxProcJur: TfrmAdvogxProcJur
  Left = 9
  Top = 139
  HelpContext = 1100026
  Caption = 
    'Transferência de Processos Entre Escritórios/Advogados Conratado' +
    's'
  ClientHeight = 410
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 371
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
    object Label1: TLabel
      Left = 12
      Top = 55
      Width = 167
      Height = 13
      Caption = 'Nosso Escritório/Advogado 1'
    end
    object Label2: TLabel
      Left = 404
      Top = 56
      Width = 167
      Height = 13
      Caption = 'Nosso Escritório/Advogado 2'
    end
    object sbtnProcurar1: TToolbarButton97
      Left = 138
      Top = 10
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = sbtnProcurar1Click
    end
    object sbtnProcurar2: TToolbarButton97
      Left = 538
      Top = 12
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = sbtnProcurar2Click
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
      TabOrder = 0
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
      TabOrder = 1
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
      TabOrder = 2
    end
    object grdAdv2: TwwDBGrid
      Left = 404
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
      DataSource = dsProcAdv2
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
      OnDblClick = grdAdv2DblClick
      IndicatorColor = icBlack
    end
    object EdAdv1: TEdit
      Left = 12
      Top = 71
      Width = 350
      Height = 21
      TabOrder = 4
    end
    object EdAdv2: TEdit
      Left = 404
      Top = 72
      Width = 350
      Height = 21
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 764
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDADVOGRECDA = :IDADVOGRECDA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (IDADVOGRECDA)'
      'values'
      '  (:IDADVOGRECDA)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 185
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
      '              (PJ.IDADVOGRECDA   =  :pIDUSU)'
      '     AND (PJ.IDRECLAMANTE = P.IDPESSOA)'
      'ORDER BY P.NOME')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 224
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
    Left = 269
    Top = 10
  end
  object updProcAdv2: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDADVOGRECDA = :IDADVOGRECDA'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (IDADVOGRECDA)'
      'values'
      '  (:IDADVOGRECDA)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 400
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
      '              (PJ.IDADVOGRECDA       =  :pIDUSU2)'
      '     AND (PJ.IDRECLAMANTE        = P.IDPESSOA)'
      'ORDER BY P.NOME'
      '')
    UpdateObject = updProcAdv2
    ValidateWithMask = True
    Left = 440
    Top = 11
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
    Left = 478
    Top = 11
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FORNSERV.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 283
    Top = 67
  end
  object MontaSelect2: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FORNSERV.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    Tabelas.Strings = (
      'PESSOA'
      'FORNSERV')
    CamposChave.Strings = (
      'FORNSERV.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = FORNSERV.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 379
    Top = 75
  end
end
