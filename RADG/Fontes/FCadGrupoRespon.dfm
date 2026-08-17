inherited FrmCadGrupoRespon: TFrmCadGrupoRespon
  Left = 242
  Top = 91
  Caption = 'Grupo de Responsabilidade'
  ClientHeight = 430
  ClientWidth = 502
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 502
    Height = 344
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object EdDesGrp: TDBEdit
      Left = 24
      Top = 32
      Width = 369
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object plnGrp: TPanel
      Left = 5
      Top = 64
      Width = 492
      Height = 275
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 43
        Width = 206
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
        Left = 272
        Top = 43
        Width = 205
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
        Left = 225
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
        Left = 225
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 492
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Usuários do Grupo'
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
        Left = 272
        Top = 64
        Width = 205
        Height = 200
        Selected.Strings = (
          'NOMEUSUARIO'#9'30'#9'NOMEUSUARIO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsDet
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
        Width = 205
        Height = 200
        Selected.Strings = (
          'NOMEUSUARIO'#9'30'#9'NOMEUSUARIO')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsUsu
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
  end
  inherited Dock972: TDock97
    Width = 502
  end
  inherited Dock971: TDock97
    Top = 391
    Width = 502
    inherited tb97Fundo: TToolbar97
      Left = 328
      DockPos = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 160
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '           IDGRPRESPON,'
      '           NOME'
      'FROM'
      '           RADGRPRESPON'
      'WHERE'
      '          (IDGRPRESPON =  :pIDGRP)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDGRP'
        ParamType = ptUnknown
      end>
    object qryIDGRPRESPON: TFloatField
      FieldName = 'IDGRPRESPON'
      Origin = 'RADGRPRESPON.IDGRPRESPON'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADGRPRESPON.NOME'
      Size = 30
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADGRPRESPON'
      'set'
      '  IDGRPRESPON = :IDGRPRESPON,'
      '  NOME = :NOME'
      'where'
      '  IDGRPRESPON = :OLD_IDGRPRESPON')
    InsertSQL.Strings = (
      'insert into RADGRPRESPON'
      '  (IDGRPRESPON, NOME)'
      'values'
      '  (:IDGRPRESPON, :NOME)')
    DeleteSQL.Strings = (
      'delete from RADGRPRESPON'
      'where'
      '  IDGRPRESPON = :OLD_IDGRPRESPON')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADGRPRESPON.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Grupo')
    Tabelas.Strings = (
      'RADGRPRESPON')
    CamposChave.Strings = (
      'RADGRPRESPON.IDGRPRESPON')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RXP.IDUSUARIO ,'
      '  RXP.IDGRPRESPON ,'
      '  USU.NOMEUSUARIO'
      'FROM'
      ' RADRESPONXGRP RXP ,'
      ' USUARIOSISTEMA USU'
      'WHERE'
      '           ( RXP.IDGRPRESPON = :pIDGRP)'
      '  AND ( RXP.IDUSUARIO = USU.IDUSUARIO)'
      'ORDER BY USU.NOMEUSUARIO'
      ' ')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 298
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDGRP'
        ParamType = ptUnknown
      end>
    object qryDetNOMEUSUARIO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEUSUARIO'
      Origin = 'USUARIOSISTEMA.NOMEUSUARIO'
    end
    object qryDetIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'RADRESPONXGRP.IDUSUARIO'
      Visible = False
    end
    object qryDetIDGRPRESPON: TFloatField
      FieldName = 'IDGRPRESPON'
      Origin = 'RADRESPONXGRP.IDGRPRESPON'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RADRESPONXGRP'
      'set'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDGRPRESPON = :IDGRPRESPON'
      'where'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  IDGRPRESPON = :OLD_IDGRPRESPON')
    InsertSQL.Strings = (
      'insert into RADRESPONXGRP'
      '  (IDUSUARIO, IDGRPRESPON)'
      'values'
      '  (:IDUSUARIO, :IDGRPRESPON)')
    DeleteSQL.Strings = (
      'delete from RADRESPONXGRP'
      'where'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  IDGRPRESPON = :OLD_IDGRPRESPON')
    Left = 335
    Top = 261
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 372
    Top = 261
  end
  object qryUsu: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '  USU.IDUSUARIO ,'
      '  USU.NOMEUSUARIO'
      'FROM'
      '    USUARIOSISTEMA USU'
      'WHERE'
      '      ( USU.IDUSUARIO NOT IN ( SELECT IDUSUARIO'
      #9#9#9'     FROM RADRESPONXGRP'
      
        #9'                                     WHERE ( IDGRPRESPON = :pID' +
        'GRP) ) )'
      'ORDER BY USU.NOMEUSUARIO'
      ''
      '')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updUsu
    ValidateWithMask = True
    Left = 46
    Top = 258
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDGRP'
        ParamType = ptUnknown
      end>
    object qryUsuNOMEUSUARIO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEUSUARIO'
    end
    object qryUsuIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
  end
  object dsUsu: TwwDataSource
    AutoEdit = False
    DataSet = qryUsu
    Left = 86
    Top = 258
  end
  object updUsu: TUpdateSQL
    ModifySQL.Strings = (
      'update USUARIOSISTEMA'
      'set'
      '  IDUSUARIO = :IDUSUARIO,'
      '  NOMEUSUARIO = :NOMEUSUARIO'
      'where'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  NOMEUSUARIO = :OLD_NOMEUSUARIO')
    InsertSQL.Strings = (
      'insert into USUARIOSISTEMA'
      '  (IDUSUARIO, NOMEUSUARIO)'
      'values'
      '  (:IDUSUARIO, :NOMEUSUARIO)')
    DeleteSQL.Strings = (
      'delete from USUARIOSISTEMA'
      'where'
      '  IDUSUARIO = :OLD_IDUSUARIO and'
      '  NOMEUSUARIO = :OLD_NOMEUSUARIO')
    Left = 126
    Top = 258
  end
end
