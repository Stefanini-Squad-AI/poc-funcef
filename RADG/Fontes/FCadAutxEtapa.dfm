inherited FrmCadAutxEtapa: TFrmCadAutxEtapa
  Left = 118
  Top = 68
  Caption = 'Etapas x Grupo de Autorização '
  ClientHeight = 431
  ClientWidth = 596
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 296
    Top = 64
    Width = 35
    Height = 13
    Caption = 'Grupo'
  end
  inherited pnlFundo: TPanel
    Width = 596
    Height = 345
    object Label1: TLabel
      Left = 296
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Etapa'
    end
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Processo'
    end
    object plnGrp: TPanel
      Left = 5
      Top = 67
      Width = 586
      Height = 273
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 43
        Width = 252
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
        Left = 323
        Top = 43
        Width = 252
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
        Left = 275
        Top = 159
        Width = 35
        Height = 32
        Hint = 'Remove'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnRemoverClick
      end
      object btnAdicionar: TSpeedButton
        Left = 275
        Top = 119
        Width = 35
        Height = 32
        Hint = 'Adiciona'
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAdicionarClick
      end
      object btnAdicionaTudo: TSpeedButton
        Left = 275
        Top = 78
        Width = 35
        Height = 32
        Hint = 'Adiciona Todas'
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
        OnClick = btnAdicionaTudoClick
      end
      object btnRemoveTudo: TSpeedButton
        Left = 275
        Top = 198
        Width = 35
        Height = 32
        Hint = 'Remove Todos'
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
        OnClick = btnRemoveTudoClick
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 586
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
        Left = 323
        Top = 64
        Width = 252
        Height = 200
        Selected.Strings = (
          'NOMEGRUPOAUT'#9'38'#9'NOMEGRUPOAUT')
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
        Width = 252
        Height = 200
        Selected.Strings = (
          'NOMEGRUPOAUT'#9'38'#9'NOMEGRUPOAUT')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsGrp
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
      Top = 32
      Width = 265
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 1
    end
    object edEtapa: TEdit
      Left = 296
      Top = 32
      Width = 281
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97
    Width = 596
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
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {00000000}
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 596
    inherited tb97Fundo: TToolbar97
      Left = 323
      DockPos = 323
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 155
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     EXA.IDTIPOPROCESSO,'
      '     EXA.IDTIPOETAPA,'
      '     EXA.IDGRUPOAUTORIZA,'
      '     E.NOME AS ETAPA,'
      '     P.NOME AS PROC,'
      '     A.NOMEGRUPOAUT'
      'FROM'
      '     RADETAPAXGRPRESP EXA,'
      '     RADTIPOETAPA E,'
      '     RADTIPOPROCESSO P,'
      '     RADGRUPOAUTORIZA A'
      'WHERE'
      '          (EXA.IDTIPOPROCESSO  = :pIDPROC)'
      '  AND (EXA.IDTIPOETAPA     = :pIDETAPA)'
      '  AND (EXA.IDTIPOPROCESSO  = P.IDTIPOPROCESSO)'
      '  AND (EXA.IDTIPOETAPA     =  E.IDTIPOETAPA)'
      '  AND (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)'
      'ORDER BY A.NOMEGRUPOAUT'
      '')
    Left = 298
    Top = 1
    ParamData = <
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
    object qryIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADETAPAXGRPRESP.IDTIPOETAPA'
      Visible = False
    end
    object qryIDGRUPOAUTORIZA: TFloatField
      FieldName = 'IDGRUPOAUTORIZA'
      Origin = 'RADETAPAXGRPRESP.IDGRUPOAUTORIZA'
      Visible = False
    end
    object qryETAPA2: TStringField
      FieldName = 'ETAPA'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
    object qryPROC: TStringField
      FieldName = 'PROC'
      Origin = 'RADTIPOPROCESSO.NOME'
      Size = 60
    end
    object qryIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADETAPAXGRPRESP.IDTIPOPROCESSO'
    end
    object qryNOMEGRUPOAUT: TStringField
      FieldName = 'NOMEGRUPOAUT'
      Origin = '"CM.RADGRUPOAUTORIZA".NOMEGRUPOAUT'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
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
      'update RADETAPAXGRPRESP'
      'set'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDGRUPOAUTORIZA = :IDGRUPOAUTORIZA,'
      '  IDTIPOETAPA = :IDTIPOETAPA'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
    InsertSQL.Strings = (
      'insert into RADETAPAXGRPRESP'
      '  (IDTIPOPROCESSO, IDGRUPOAUTORIZA, IDTIPOETAPA)'
      'values'
      '  (:IDTIPOPROCESSO, :IDGRUPOAUTORIZA, :IDTIPOETAPA)')
    DeleteSQL.Strings = (
      'delete from RADETAPAXGRPRESP'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
    Left = 268
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Processo'
      'Etapa')
    SensivelACaixa.Strings = (
      ''
      '')
    Tabelas.Strings = (
      'RADTIPOETAPAXPROC'
      'RADTIPOPROCESSO'
      'RADTIPOETAPA')
    CamposChave.Strings = (
      'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      'RADTIPOETAPAXPROC.IDTIPOETAPA'
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME')
    Filtro.Strings = (
      'RADTIPOETAPAXPROC.IDTIPOPROCESSO=RADTIPOPROCESSO.IDTIPOPROCESSO'
      'RADTIPOETAPAXPROC.IDTIPOETAPA=RADTIPOETAPA.IDTIPOETAPA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '30')
    Left = 446
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 328
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 358
    Top = 58
  end
  object qryEtapa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      EXP.IDTIPOPROCESSO,'
      '      EXP.IDTIPOETAPA,'
      '      ETP.NOME'
      'FROM'
      '      RADTIPOETAPAXPROC EXP,'
      '      RADTIPOETAPA ETP '
      'WHERE'
      '           (EXP.IDTIPOPROCESSO = :pIDPROC)'
      '  AND (EXP.IDTIPOETAPA  = ETP.IDTIPOETAPA)'
      'ORDER BY ETP.NOME')
    ValidateWithMask = True
    Left = 376
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryEtapaIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      Visible = False
    end
    object qryEtapaIDTIPOETAPA: TFloatField
      FieldName = 'IDTIPOETAPA'
      Origin = 'RADTIPOETAPAXPROC.IDTIPOETAPA'
      Visible = False
    end
    object qryEtapaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
  end
  object qryGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '        GRP.IDGRUPOAUTORIZA ,'
      '        GRP.NOMEGRUPOAUT'
      'FROM'
      '        RADGRUPOAUTORIZA GRP'
      'WHERE'
      '      ( GRP.IDGRUPOAUTORIZA NOT IN ( SELECT IDGRUPOAUTORIZA'
      #9#9#9'             FROM RADETAPAXGRPRESP'
      
        '                                     WHERE (IDTIPOPROCESSO = :pI' +
        'DPROC)'
      
        '                                        AND(IDTIPOETAPA    = :pI' +
        'DETAPA) ) )'
      'ORDER BY GRP.NOMEGRUPOAUT'
      ''
      '')
    UpdateMode = upWhereKeyOnly
    UpdateObject = updGrp
    ValidateWithMask = True
    Left = 46
    Top = 258
    ParamData = <
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
    object qryGrpIDGRUPOAUTORIZA: TFloatField
      FieldName = 'IDGRUPOAUTORIZA'
      Visible = False
    end
    object qryGrpNOMEGRUPOAUT: TStringField
      FieldName = 'NOMEGRUPOAUT'
      Size = 60
    end
  end
  object dsGrp: TwwDataSource
    AutoEdit = False
    DataSet = qryGrp
    Left = 86
    Top = 258
  end
  object updGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update RADGRUPOAUTORIZA'
      'set'
      '  IDGRUPOAUTORIZA = :IDGRUPOAUTORIZA,'
      '  NOMEGRUPOAUT = :NOMEGRUPOAUT'
      'where'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA and'
      '  NOMEGRUPOAUT = :OLD_NOMEGRUPOAUT')
    InsertSQL.Strings = (
      'insert into RADGRUPOAUTORIZA'
      '  (IDGRUPOAUTORIZA, NOMEGRUPOAUT)'
      'values'
      '  (:IDGRUPOAUTORIZA, :NOMEGRUPOAUT)')
    DeleteSQL.Strings = (
      'delete from RADGRUPOAUTORIZA'
      'where'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA and'
      '  NOMEGRUPOAUT = :OLD_NOMEGRUPOAUT')
    Left = 126
    Top = 258
  end
end
