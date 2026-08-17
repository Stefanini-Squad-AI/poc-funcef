inherited FrmProcxEtapaxObj: TFrmProcxEtapaxObj
  Left = 77
  Top = 86
  Caption = 'Processos/Etapas x Objetos R.A.D.'
  ClientHeight = 443
  ClientWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 357
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object Label4: TLabel
      Left = 16
      Top = 48
      Width = 81
      Height = 13
      Caption = 'Tipo de Etapa'
    end
    object Label5: TLabel
      Left = 336
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Sistema'
    end
    object plnGrp: TPanel
      Left = 5
      Top = 93
      Width = 645
      Height = 259
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 43
        Width = 265
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = 'Disponíveis'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label3: TLabel
        Left = 328
        Top = 43
        Width = 265
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = 'Selecionados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object btnRemover: TSpeedButton
        Left = 284
        Top = 159
        Width = 35
        Height = 32
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
          66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
          66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
          660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btnRemoverClick
      end
      object btnAdicionar: TSpeedButton
        Left = 284
        Top = 119
        Width = 35
        Height = 32
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
          66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
          66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
          660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        OnClick = btnAdicionarClick
      end
      object BtnSobe: TSpeedButton
        Left = 602
        Top = 111
        Width = 35
        Height = 32
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
      end
      object BtnDesce: TSpeedButton
        Left = 602
        Top = 151
        Width = 35
        Height = 32
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
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 645
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Objetos R.A.D. '
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object grdGrupoSelec: TwwDBGrid
        Left = 328
        Top = 64
        Width = 265
        Height = 185
        Selected.Strings = (
          'DESCOBJETO'#9'60'#9'DESCOBJETO'#9'No')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = btnRemoverClick
        IndicatorColor = icBlack
      end
      object grdGrupoDispo: TwwDBGrid
        Left = 8
        Top = 64
        Width = 265
        Height = 185
        Selected.Strings = (
          'DESCOBJETO'#9'60'#9'DESCOBJETO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsObj
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = btnAdicionarClick
        IndicatorColor = icBlack
      end
    end
    object edProc: TEdit
      Left = 16
      Top = 24
      Width = 297
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edEtipo: TEdit
      Left = 16
      Top = 64
      Width = 297
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edSitema: TEdit
      Left = 336
      Top = 24
      Width = 297
      Height = 21
      TabStop = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  inherited Dock972: TDock97
    Width = 655
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 655
    inherited tb97Fundo: TToolbar97
      Left = 485
      DockPos = 485
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 317
      DockPos = 317
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '      OXE.IDTIPOETAPA,'
      '      OXE.IDTIPOPROCESSO,'
      '      OXE.IDOBJETO,'
      '      OXE.ORDEM,'
      '      OBJ.DESCOBJETO'
      'FROM'
      '    RADOBJETOXETAPA OXE,'
      '    RADOBJETO OBJ'
      'WHERE'
      '       (OXE.IDTIPOPROCESSO = :pIDTPPROC)'
      '   AND (OXE.IDTIPOETAPA    = :pIDTPETAPA)'
      '   AND (OXE.IDOBJETO       = OBJ.IDOBJETO)'
      'ORDER BY OXE.ORDEM'
      ''
      ''
      ''
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDTPPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTPETAPA'
        ParamType = ptUnknown
      end>
    object qryDESCOBJETO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCOBJETO'
      Origin = 'RADOBJETO.DESCOBJETO'
      Size = 60
    end
    object qryIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADOBJETOXETAPA.IDTIPOETAPA'
      Visible = False
    end
    object qryIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADOBJETOXETAPA.IDTIPOPROCESSO'
      Visible = False
    end
    object qryIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Origin = 'RADOBJETOXETAPA.IDOBJETO'
      Visible = False
    end
    object qryORDEM: TFloatField
      FieldName = 'ORDEM'
      Origin = 'RADOBJETOXETAPA.ORDEM'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADOBJETOXETAPA'
      'set'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDTIPOETAPA = :IDTIPOETAPA,'
      '  IDOBJETO = :IDOBJETO,'
      '  ORDEM = :ORDEM'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA and'
      '  IDOBJETO = :OLD_IDOBJETO')
    InsertSQL.Strings = (
      'insert into RADOBJETOXETAPA'
      '  (IDTIPOPROCESSO, IDTIPOETAPA, IDOBJETO, ORDEM)'
      'values'
      '  (:IDTIPOPROCESSO, :IDTIPOETAPA, :IDOBJETO, :ORDEM)')
    DeleteSQL.Strings = (
      'delete from RADOBJETOXETAPA'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA and'
      '  IDOBJETO = :OLD_IDOBJETO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Processo'
      'Tipo de Etapa'
      'Sistema')
    Tabelas.Strings = (
      'RADTIPOETAPAXPROC'
      'RADTIPOETAPA'
      'RADTIPOPROCESSO'
      'MODULO')
    CamposChave.Strings = (
      'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      'RADTIPOETAPAXPROC.IDTIPOETAPA'
      'RADTIPOETAPAXPROC.IDMODULO'
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME'
      'MODULO.NOMEMODULO')
    Filtro.Strings = (
      
        'RADTIPOETAPAXPROC.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESS' +
        'O'
      'RADTIPOETAPAXPROC.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA'
      'RADTIPOETAPAXPROC.IDMODULO = MODULO.IDMODULO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '50')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 358
    Top = 58
  end
  object qryObj: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '    IDOBJETO,'
      '    IDMODULO,'
      '    DESCOBJETO,'
      '    NOMEOBJETO'
      'FROM'
      '    RADOBJETO'
      'WHERE'
      '         ( IDMODULO = :pIdModulo )'
      '     AND ( IDOBJETO NOT IN ( SELECT IDOBJETO'
      #9'                     FROM   RADOBJETOXETAPA'
      '                             WHERE  (IDTIPOPROCESSO = :pIDPROC)'
      
        '                                AND (IDTIPOETAPA    = :pIDETAPA)' +
        ' ))'
      'ORDER BY DESCOBJETO'
      ''
      ''
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updObj
    ValidateWithMask = True
    Left = 46
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdModulo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDETAPA'
        ParamType = ptUnknown
      end>
    object qryObjDESCOBJETO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCOBJETO'
      Size = 60
    end
    object qryObjNOMEOBJETO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEOBJETO'
      Visible = False
      Size = 60
    end
    object qryObjIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Visible = False
    end
    object qryObjIDMODULO: TFloatField
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object dsObj: TwwDataSource
    AutoEdit = False
    DataSet = qryObj
    Left = 86
    Top = 258
  end
  object updObj: TUpdateSQL
    ModifySQL.Strings = (
      'update RADOBJETO'
      'set'
      '  IDOBJETO = :IDOBJETO,'
      '  IDMODULO = :IDMODULO,'
      '  DESCOBJETO = :DESCOBJETO,'
      '  NOMEOBJETO = :NOMEOBJETO'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO')
    InsertSQL.Strings = (
      'insert into RADOBJETO'
      '  (IDOBJETO, IDMODULO, DESCOBJETO, NOMEOBJETO)'
      'values'
      '  (:IDOBJETO, :IDMODULO, :DESCOBJETO, :NOMEOBJETO)')
    DeleteSQL.Strings = (
      'delete from RADOBJETO'
      'where'
      '  IDOBJETO = :OLD_IDOBJETO')
    Left = 126
    Top = 258
  end
end
