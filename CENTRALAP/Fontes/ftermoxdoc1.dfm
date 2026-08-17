inherited frmtermoxdco1: Tfrmtermoxdco1
  Left = 62
  Top = 117
  HelpContext = 190028
  Caption = 'Relacao Termo x Dcocumentos'
  ClientHeight = 428
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 342
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 713
      Height = 121
      TabOrder = 0
      object Patricinadora: TLabel
        Left = 8
        Top = 0
        Width = 76
        Height = 13
        Caption = 'Patricinadora'
      end
      object Label2: TLabel
        Left = 8
        Top = 80
        Width = 119
        Height = 13
        Caption = 'Beneficio ou Serviço'
      end
      object Label3: TLabel
        Left = 8
        Top = 40
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label1: TLabel
        Left = 400
        Top = 8
        Width = 126
        Height = 13
        Caption = 'Situação do Beneficio'
      end
      object Label4: TLabel
        Left = 400
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Termo'
      end
      object DBLKpbenefserv: TwwDBLookupCombo
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'
          'IDBENEFICIO'#9'10'#9'IDBENEFICIO'
          'TIPO'#9'1'#9'TIPO')
        LookupTable = qrybeneficio
        LookupField = 'IDSERVICOS'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBLKppatroCloseUp
        OnExit = DBLKpbenefservExit
      end
      object DBLKpplano: TwwDBLookupCombo
        Left = 8
        Top = 56
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'
          'IDPLANOPREV'#9'10'#9'IDPLANOPREV')
        LookupTable = qryplano
        LookupField = 'idplanoprev'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBLKppatroCloseUp
        OnExit = DBLKpplanoExit
      end
      object DBLKptermo: TwwDBLookupCombo
        Left = 400
        Top = 64
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRUB'#9'60'#9'DESCRUB'
          'IDTERMOSXBENEF'#9'10'#9'IDTERMOSXBENEF')
        LookupTable = qrytermo
        LookupField = 'idtermosxbenef'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBLKppatroCloseUp
      end
      object DBLKpsituacao: TwwDBLookupCombo
        Left = 400
        Top = 24
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO'
          'IDSITBENEF'#9'10'#9'IDSITBENEF')
        LookupTable = qrySitbenef
        LookupField = 'idsitbenef'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBLKppatroCloseUp
        OnExit = DBLKpsituacaoExit
      end
      object dblkpPatro: TwwDBLookupCombo
        Left = 8
        Top = 15
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'
          'IDPESSOA'#9'10'#9'IDPESSOA')
        LookupTable = qrypatrocinadora
        LookupField = 'IDPESSOA'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = DBLKppatroCloseUp
        OnExit = dblkpPatroExit
      end
    end
    object Pnlctrls: TPanel
      Left = 328
      Top = 128
      Width = 49
      Height = 209
      TabOrder = 1
      object btnInclui: TSpeedButton
        Left = 12
        Top = 52
        Width = 25
        Height = 25
        Hint = 'Selciona'
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
        OnClick = btnIncluiClick
      end
      object BtnExclui: TSpeedButton
        Left = 12
        Top = 100
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
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
        OnClick = BtnExcluiClick
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 128
      Width = 321
      Height = 33
      Caption = 'Termo x Documentos'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 376
      Top = 128
      Width = 345
      Height = 33
      Caption = 'Documentos'
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object GRDdocssel: TwwDBGrid
      Left = 8
      Top = 160
      Width = 320
      Height = 177
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = ds
      TabOrder = 4
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
    object GRDtipdesemb: TwwDBGrid
      Left = 376
      Top = 160
      Width = 345
      Height = 177
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDocumentos
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnKeyPress = GRDtipdesembKeyPress
      IndicatorColor = icBlack
    end
  end
  inherited Dock972: TDock97
    Width = 729
    object BtnReplicar: TToolbarButton97 [0]
      Left = 117
      Top = 0
      Width = 60
      Height = 41
      Hint = 'Replica cadastro para outras patrocinadoras'
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'R&eplicar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888005555500
        88888887788888778F8888755555555508888878888888F878F887D555555F55
        508887F888F8878F87F887D58F55FFF55088878887F87778F78F7D558F5FFFFF
        55087F8887F77777887F7D558F555F8555087F8887F887F8887F7D558F555F85
        55087F88F7FFF7F8887F7D5FFFFF5F8555087F87777787F8887F7D55FFF55F85
        550878F877788788887887D55F555555508887F88788888887F887D555555555
        5088878F888888888788887DD555555508888878FF88888F788888877DDDDD77
        8888888778FFFF77888888888777778888888888877777888888}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = BtnReplicarClick
    end
    inherited Toolbar971: TToolbar97
      ParentShowHint = False
      inherited sbtnInserir: TToolbarButton97
        Left = 120
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 180
        Width = 61
        Caption = '&Relacionar'
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 0
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 60
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 729
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    Top = 19
  end
  inherited ds: TwwDataSource
    Left = 157
    Top = 232
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TERMOXDOC'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDSITBENEF = :IDSITBENEF,'
      '  IDTIPODOCXBENEF = :IDTIPODOCXBENEF,'
      '  IDTERMOSXBENEF =: IDTERMOSXBENEF '
      'where'
      '  IDTIPODOCXBENEF = :OLD_IDTERMOXDOC')
    InsertSQL.Strings = (
      'insert into TERMOXDOC'
      
        '  (IDPESSOA, IDPLANOPREV, IDBENEFICIO, IDSITBENEF, IDTIPODOCXBEN' +
        'EF,IDTERMOSXBENEF,IDTERMOXDOC)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDBENEFICIO, :IDSITBENEF, :IDTIPODO' +
        'CXBENEF,:IDTERMOSXBENEF,:IDTERMOXDOC)')
    DeleteSQL.Strings = (
      'delete from TERMOXDOC'
      'where'
      '  IDTERMOXDOC = :OLD_IDTERMOXDOC')
    Left = 121
    Top = 288
  end
  inherited MontaSelect: TMontaSelect
    Left = 381
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      'SELECT'
      ' TP.NOMEDOCUMENTO,'
      ' TP.IDDOCUMENTO,'
      ' TD.IDPESSOA,'
      ' TD.IDPLANOPREV,'
      ' TD.IDBENEFICIO,'
      ' TD.IDSITBENEF,'
      ' TD.IDTIPODOCXBENEF,'
      ' TD.IDTERMOXDOC,'
      ' TD.IDTERMOSXBENEF'
      'FROM'
      '  DOCUMENTOS TP,'
      '   TIPODOCXBENEF BENEF,'
      '   TERMOXDOC  TD'
      'WHERE'
      '  (TD.IDPESSOA    = :idpessoa)     AND'
      '  (TD.IDPLANOPREV = :idplanoprev)  AND'
      '  (TD.IDBENEFICIO = :idbeneficio)  AND'
      '  (TD.IDSITBENEF  = :idsitbenef)   AND'
      '  (TD.IDTERMOSXBENEF =:IDTERMOSXBENEF) AND'
      ' (BENEF.IDTIPODOCXBENEF  =  TD.IDTIPODOCXBENEF)   AND'
      '   (TP.IDDOCUMENTO = BENEF.IDDOCUMENTO)'
      'ORDER BY'
      '  TP.NOMEDOCUMENTO'
      ''
      '')
    Left = 175
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idsitbenef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end>
    object qryNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryIDTERMOXDOC: TFloatField
      FieldName = 'IDTERMOXDOC'
    end
    object qryIDTERMOSXBENEF: TFloatField
      FieldName = 'IDTERMOSXBENEF'
    end
    object qryIDTIPODOCXBENEF: TFloatField
      FieldName = 'IDTIPODOCXBENEF'
    end
  end
  object qrypatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 456
    Top = 1
    object qrypatrocinadoraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PATRO.IDPESSOA'
    end
    object qrypatrocinadoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qrybeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    MAX(A.IDBENEFICIO) AS IDSERVICOS, A.DESCRUB AS NOME, '#39'B'#39'  AS' +
        ' TIPO'
      'FROM'
      '   BENEFICIO  A , BENEFPLANPREV B'
      '   WHERE'
      '   B.IDPLANOPREV = :IDPLANOPREV  AND'
      '    A.IDBENEFICIO = B.IDBENEFICIO'
      'GROUP BY'
      '   DESCRUB'
      'UNION'
      'SELECT'
      '  IDSERVICOS , NOME, '#39'S'#39' AS TIPO'
      'FROM'
      '  SERVICO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 544
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qrybeneficioIDSERVICOS: TFloatField
      FieldName = 'IDSERVICOS'
    end
    object qrybeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrybeneficioTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qrySitbenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TB.IDSITBENEF, DESCRICAO'
      'FROM'
      '  SITUACAOXBENEF TB,'
      '  SITBENEF TP'
      'WHERE'
      '  (TB.IDPESSJUR   = :idpessoa)     AND'
      '  (TB.IDPLANOPREV = :idplanoprev)  AND'
      '  (TB.IDBENEFICIO = :idbeneficio)  AND'
      '  (TB.IDSITBENEF  = TP.IDSITBENEF)'
      'ORDER BY DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 600
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
    object qrySitbenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.SITBENEF.IDSITBENEF'
    end
    object qrySitbenefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITBENEF.DESCRICAO'
      Size = 60
    end
  end
  object qrytermo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  TERM1.IDTERMOSXBENEF, TERM. DESCRUB '
      'FROM CONFIGRUBS TERM,'
      '           TERMOSXBENEF TERM1'
      'WHERE'
      '    term1.idSitBenef =:idSitbenef   and'
      '    term1.idPlanoPrev =:idPlanoPrev and'
      '    term1.idPessoa =:idPessoa  and'
      '    term1.idBeneficio =:idBeneficio  and'
      '    term.idconfigrubs  = term1.idconfigrubs'
      'ORDER BY DESCRUB')
    ValidateWithMask = True
    Left = 664
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idSitbenef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idBeneficio'
        ParamType = ptUnknown
      end>
    object qrytermoIDTERMOSXBENEF: TFloatField
      FieldName = 'IDTERMOSXBENEF'
      Origin = 'BASEDADOS.TERMOSXBENEF.IDTERMOSXBENEF'
    end
    object qrytermoDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.CONFIGRUBS.DESCRUB'
      Size = 60
    end
  end
  object qryProcuraTermoxDoc: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      ' IDTERMOXDOC'
      'FROM'
      ' TERMOXDOC'
      'WHERE'
      '  (IDPESSOA    = :IDPESSOA)     AND'
      '  (IDPLANOPREV = :IDPLANOPREV)  AND'
      '  (IDBENEFICIO = :IDBENEFICIO)  AND'
      '  (IDSITBENEF  = :IDSITBENEF)   AND'
      ' (IDTIPODOCXBENEF =:IDTIPODOCXBENEF) AND             '
      ' (IDTERMOSXBENEF =:IDTERMOSXBENEF)  ')
    ValidateWithMask = True
    Left = 248
    Top = 215
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPODOCXBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end>
    object qryProcuraTermoxDocidtermoxdoc: TFloatField
      FieldName = 'idtermoxdoc'
    end
  end
  object qryReplicaTermoxDoc: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'insert into TERMOXDOC'
      
        '  (IDPESSOA, IDPLANOPREV, IDBENEFICIO, IDSITBENEF, IDTIPODOCXBEN' +
        'EF,IDTERMOSXBENEF,IDTERMOXDOC)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDBENEFICIO, :IDSITBENEF, :IDTIPODO' +
        'CXBENEF,:IDTERMOSXBENEF,:IDTERMOXDOC)'
      '')
    ValidateWithMask = True
    Left = 248
    Top = 271
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPODOCXBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOXDOC'
        ParamType = ptUnknown
      end>
  end
  object dsDocumentos: TwwDataSource
    DataSet = QRYDOCUMENTOS
    Left = 471
    Top = 272
  end
  object UpdDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update DOCUMENTOS'
      'set'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NOMEDOCUMENTO = :NOMEDOCUMENTO'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    InsertSQL.Strings = (
      'insert into DOCUMENTOS'
      '  (IDDOCUMENTO, NOMEDOCUMENTO)'
      'values'
      '  (:IDDOCUMENTO, :NOMEDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from DOCUMENTOS'
      'where'
      '  IDDOCUMENTO = :OLD_IDDOCUMENTO')
    Left = 591
    Top = 304
  end
  object QRYDOCUMENTOS: TwwQuery
    AfterOpen = QRYDOCUMENTOSAfterOpen
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      ' BENEF.IDTIPODOCXBENEF,'
      ' DOC.NOMEDOCUMENTO'
      ''
      ' FROM'
      ' DOCUMENTOS DOC,'
      ' TIPODOCXBENEF  BENEF'
      'WHERE'
      ' IDTIPODOCXBENEF  NOT IN'
      '     (SELECT'
      '        TERM.IDTIPODOCXBENEF'
      '      FROM'
      '         TERMOXDOC  TERM'
      '      WHERE'
      '         (TERM.IDPESSOA = :idpessoa)        AND'
      '         (TERM.IDPLANOPREV = :idplanoprev)  AND'
      '         (TERM.IDBENEFICIO = :idbeneficio)  AND'
      '         (TERM.IDSITBENEF  = :idsitbenef))   AND'
      '    (BENEF.IDPESSOA = :idpessoa)        AND'
      '    (BENEF.IDPLANOPREV = :idplanoprev)  AND'
      '    (BENEF.IDBENEFICIO = :idbeneficio)  AND'
      '    (BENEF.IDSITBENEF  = :idsitbenef)  AND '
      '    (DOC.IDDOCUMENTO  =  BENEF.IDDOCUMENTO)       '
      'ORDER BY NOMEDOCUMENTO'
      '')
    ValidateWithMask = True
    Left = 472
    Top = 223
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idsitbenef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'idsitbenef'
        ParamType = ptUnknown
      end>
    object QRYDOCUMENTOSNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
    object QRYDOCUMENTOSIDTIPODOCXBENEF: TFloatField
      FieldName = 'IDTIPODOCXBENEF'
    end
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.IDPLANOPREV,'
      '  A.NOME'
      'FROM'
      '  PLANPREV A,'
      '  PLANPREVPATRO B'
      'WHERE B.IDPESSJUR   = :IDPESSJUR'
      '  AND A.IDPLANOPREV = B.IDPLANOPREV'
      'ORDER BY'
      '  NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 512
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryplanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryplanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object qryinsertdoc: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'insert into TERMOXDOC'
      
        '  (IDPESSOA, IDPLANOPREV, IDBENEFICIO, IDSITBENEF, IDTIPODOCXBEN' +
        'EF,IDTERMOSXBENEF,IDTERMOXDOC)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDBENEFICIO, :IDSITBENEF, :IDTIPODO' +
        'CXBENEF,:IDTERMOSXBENEF,:IDTERMOXDOC)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 72
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPODOCXBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOXDOC'
        ParamType = ptUnknown
      end>
  end
  object qrydeletedoc: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'delete from TERMOXDOC'
      'where'
      '  IDTERMOXDOC = :IDTERMOXDOC')
    ValidateWithMask = True
    Left = 72
    Top = 319
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTERMOXDOC'
        ParamType = ptUnknown
      end>
  end
end
