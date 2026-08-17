inherited FrmTermosxBenef: TFrmTermosxBenef
  Left = 45
  Top = 112
  HelpContext = 190027
  Caption = 'Relacionamento Termos X Benefício'
  ClientHeight = 418
  ClientWidth = 724
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 724
    Height = 332
    object Panel2: TPanel
      Left = 1
      Top = 101
      Width = 722
      Height = 230
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 343
        Top = 0
        Width = 3
        Height = 230
        Cursor = crHSplit
      end
      object Splitter2: TSplitter
        Left = 378
        Top = 0
        Width = 3
        Height = 230
        Cursor = crHSplit
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 343
        Height = 230
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 343
          Height = 26
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Termos do Benefício ou Serviço'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object GrdTermosSel: TwwDBGrid
          Left = 0
          Top = 26
          Width = 343
          Height = 204
          Selected.Strings = (
            'DESCRUB'#9'60'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
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
      object PnlCtrls: TPanel
        Left = 346
        Top = 0
        Width = 32
        Height = 230
        Align = alLeft
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object BtnInclui: TSpeedButton
          Left = 4
          Top = 84
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
          OnClick = BtnIncluiClick
        end
        object BtnIncluiTodos: TSpeedButton
          Tag = 1
          Left = 4
          Top = 116
          Width = 25
          Height = 25
          Hint = 'Selciona Todos'
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
          OnClick = BtnIncluiClick
        end
        object BtnExclui: TSpeedButton
          Left = 4
          Top = 180
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
        object BtnExcluiTodos: TSpeedButton
          Tag = 1
          Left = 4
          Top = 148
          Width = 25
          Height = 25
          Hint = 'Exclui'
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
          OnClick = BtnExcluiClick
        end
      end
      object Panel4: TPanel
        Left = 381
        Top = 0
        Width = 341
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object PnlTitDesemb: TPanel
          Left = 0
          Top = 0
          Width = 341
          Height = 26
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Termos Cadastrados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object GrdTipDesemb: TwwDBGrid
          Left = 0
          Top = 26
          Width = 341
          Height = 204
          Selected.Strings = (
            'DESCRUB'#9'60'#9'Descrição')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsTermos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnKeyPress = GrdTipDesembKeyPress
          IndicatorColor = icBlack
        end
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 722
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 11
        Top = 7
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label2: TLabel
        Left = 377
        Top = 7
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object Label3: TLabel
        Left = 11
        Top = 51
        Width = 121
        Height = 13
        Caption = 'Benefício ou Serviço'
      end
      object Label4: TLabel
        Left = 377
        Top = 51
        Width = 128
        Height = 13
        Caption = 'Situação do Benefício'
      end
      object dblkpPatro: TwwDBLookupCombo
        Left = 11
        Top = 23
        Width = 335
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Nome da Patrocinadora')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblkpPatroCloseUp
        OnExit = dblkpPatroExit
      end
      object dblkpPlano: TwwDBLookupCombo
        Left = 377
        Top = 23
        Width = 325
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome do Plano')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        AutoSelect = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = False
        OnCloseUp = dblkpPatroCloseUp
        OnExit = dblkpPlanoExit
      end
      object dblkpBenefServ: TwwDBLookupCombo
        Left = 7
        Top = 67
        Width = 335
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Nome do Benefício ou Serviço'
          'TIPO'#9'1'#9'Tipo')
        LookupTable = qryBeneficio
        LookupField = 'IDSERVICOS'
        Options = [loColLines, loTitles]
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = False
        OnCloseUp = dblkpPatroCloseUp
        OnExit = dblkpBenefServExit
      end
      object dblkpSituacao: TwwDBLookupCombo
        Left = 377
        Top = 67
        Width = 325
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Situação')
        LookupTable = qrySitBenef
        LookupField = 'IDSITBENEF'
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = False
        OnCloseUp = dblkpPatroCloseUp
      end
    end
  end
  inherited Dock972: TDock97
    Width = 724
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Width = 77
        Caption = '&Relacionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 257
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 137
        Visible = False
      end
      object BtnReplicar: TToolbarButton97
        Left = 197
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
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 724
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Caption = 'OK'
        Default = False
      end
      inherited bbtnCancelar: TBitBtn
        Cancel = False
        Caption = 'Cancelar'
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 191
    Top = 320
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TERMOSXBENEF'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDSITBENEF = :IDSITBENEF,'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  IDTERMOSXBENEF = :IDTERMOSXBENEF'
      'where'
      '  IDTERMOSXBENEF = :OLD_IDTERMOSXBENEF')
    InsertSQL.Strings = (
      'insert into TERMOSXBENEF'
      
        '  (IDPESSOA, IDPLANOPREV, IDBENEFICIO, IDSITBENEF, IDCONFIGRUBS,' +
        ' IDTERMOSXBENEF)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDBENEFICIO, :IDSITBENEF, :IDCONFIG' +
        'RUBS, :IDTERMOSXBENEF)')
    DeleteSQL.Strings = (
      'delete from TERMOSXBENEF'
      'where'
      '  IDTERMOSXBENEF = :OLD_IDTERMOSXBENEF')
    Left = 191
    Top = 272
  end
  inherited MontaSelect: TMontaSelect
    Left = 339
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    Tag = 5
    AfterOpen = qryAfterOpen
    AfterScroll = qryAfterOpen
    SQL.Strings = (
      'SELECT'
      ' CR.DESCRUB,'
      ' TB.IDPESSOA,'
      ' TB.IDPLANOPREV,'
      ' TB.IDBENEFICIO,'
      ' TB.IDSITBENEF,'
      ' TB.IDCONFIGRUBS,'
      ' TB.IDTERMOSXBENEF'
      'FROM'
      '  CONFIGRUBS CR,'
      '  TERMOSXBENEF TB'
      'WHERE'
      '  (TB.IDPESSOA    = :idpessoa)     AND'
      '  (TB.IDPLANOPREV = :idplanoprev)  AND'
      '  (TB.IDBENEFICIO = :idbeneficio)  AND'
      '  (TB.IDSITBENEF  = :idsitbenef)   AND'
      '  (TB.IDCONFIGRUBS =  CR.IDCONFIGRUBS)'
      'ORDER BY'
      '  CR.DESCRUB'
      '')
    Left = 195
    Top = 232
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
      end>
    object qryDESCRUB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = '"CM.CONFIGRUBS".DESCRUB'
      Size = 60
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TERMOSXBENEF.IDPESSOA'
      Visible = False
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'TERMOSXBENEF.IDPLANOPREV'
      Visible = False
    end
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'TERMOSXBENEF.IDBENEFICIO'
      Visible = False
    end
    object qryIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'TERMOSXBENEF.IDSITBENEF'
      Visible = False
    end
    object qryIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'TERMOSXBENEF.IDCONFIGRUBS'
      Visible = False
    end
    object qryIDTERMOSXBENEF: TFloatField
      FieldName = 'IDTERMOSXBENEF'
      Origin = 'TERMOSXBENEF.IDTERMOSXBENEF'
      Visible = False
    end
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 386
    object qryPatrocinadoraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PATRO.IDPESSOA'
    end
    object qryPatrocinadoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryPlano: TwwQuery
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
      ' ')
    ValidateWithMask = True
    Left = 432
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    MAX(A.IDBENEFICIO) AS IDSERVICOS, A.DESCRUB AS NOME, '#39'B'#39'  AS' +
        ' TIPO'
      'FROM'
      '   BENEFICIO  A , BENEFPLANPREV B'
      '   WHERE'
      '   B.IDPLANOPREV = :IDPLANOPREV  AND'
      '   A.IDBENEFICIO = B.IDBENEFICIO AND'
      '   A.DESCRUB IS NOT NULL'
      'GROUP BY'
      '   DESCRUB'
      'UNION'
      'SELECT'
      '  IDSERVICOS , NOME, '#39'S'#39' AS TIPO'
      'FROM'
      '  SERVICO'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 478
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryBeneficioIDSERVICOS: TFloatField
      FieldName = 'IDSERVICOS'
    end
    object qryBeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBeneficioTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object QryTermos: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterOpen = QryTermosAfterOpen
    AfterScroll = QryTermosAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDCONFIGRUBS,'
      ' DESCRUB'
      'FROM'
      ' CONFIGRUBS'
      'WHERE'
      ' IDCONFIGRUBS NOT IN'
      '     (SELECT'
      '        IDCONFIGRUBS'
      '      FROM'
      '         TERMOSXBENEF'
      '      WHERE'
      '         (IDPESSOA = :idpessoa)        AND'
      '         (IDPLANOPREV = :idplanoprev)  AND'
      '         (IDBENEFICIO = :idbeneficio)  AND'
      '         (IDSITBENEF  = :idsitbenef))  AND'
      ' FLGTIPOARQUIVO = '#39'T'#39
      'ORDER BY DESCRUB')
    UpdateObject = UpdTermos
    ValidateWithMask = True
    Left = 471
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idsitbenef'
        ParamType = ptUnknown
      end>
    object QryTermosDESCRUB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Size = 60
    end
    object QryTermosIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Visible = False
    end
  end
  object DsTermos: TwwDataSource
    DataSet = QryTermos
    Left = 471
    Top = 272
  end
  object UpdTermos: TUpdateSQL
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
    Left = 471
    Top = 320
  end
  object qrySitBenef: TwwQuery
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
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 548
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
    object qrySitBenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.SITBENEF.IDSITBENEF'
    end
    object qrySitBenefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITBENEF.DESCRICAO'
      Size = 60
    end
  end
  object QryProcuraDocxBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDTERMOSXBENEF'
      'FROM'
      ' TERMOSXBENEF'
      'WHERE'
      '  (IDPESSOA    = :IDPESSOA)     AND'
      '  (IDPLANOPREV = :IDPLANOPREV)  AND'
      '  (IDBENEFICIO = :IDBENEFICIO)  AND'
      '  (IDSITBENEF  = :IDSITBENEF)   AND'
      '  (IDCONFIGRUBS = :IDCONFIGRUBS) '
      ''
      '')
    ValidateWithMask = True
    Left = 245
    Top = 192
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
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end>
    object QryProcuraDocxBenefIDTERMOSXBENEF: TFloatField
      FieldName = 'IDTERMOSXBENEF'
      Origin = 'TERMOSXBENEF.IDTERMOSXBENEF'
    end
  end
  object QryReplicaDocxBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into TERMOSXBENEF'
      
        '  (IDPESSOA, IDPLANOPREV, IDBENEFICIO, IDSITBENEF, IDCONFIGRUBS,' +
        ' IDTERMOSXBENEF)'
      'values'
      
        '  (:IDPESSOA, :IDPLANOPREV, :IDBENEFICIO, :IDSITBENEF, :IDCONFIG' +
        'RUBS, :IDTERMOSXBENEF)')
    ValidateWithMask = True
    Left = 269
    Top = 280
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
        Name = 'IDCONFIGRUBS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTERMOSXBENEF'
        ParamType = ptUnknown
      end>
  end
end
