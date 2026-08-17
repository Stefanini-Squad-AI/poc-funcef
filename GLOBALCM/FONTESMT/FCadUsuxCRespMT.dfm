inherited FrmCadUsuxCResp: TFrmCadUsuxCResp
  Left = 298
  Top = 206
  Caption = 'Usuário x Centro de Responsabilidade'
  ClientHeight = 420
  ClientWidth = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 334
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object EdUsu: TEdit
      Left = 16
      Top = 32
      Width = 385
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object plnTransf: TPanel
      Left = 1
      Top = 72
      Width = 648
      Height = 261
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object btnAdiciona: TSpeedButton
        Left = 300
        Top = 98
        Width = 39
        Height = 34
        Hint = 'Adiciona'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = btnAdicionaClick
      end
      object BtnRemove: TSpeedButton
        Left = 300
        Top = 141
        Width = 39
        Height = 34
        Hint = 'Remove'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = BtnRemoveClick
      end
      object BtnAdicionaTudo: TSpeedButton
        Left = 300
        Top = 56
        Width = 39
        Height = 34
        Hint = 'Adiciona Todos'
        Anchors = [akLeft, akTop, akRight]
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
        OnClick = BtnAdicionaTudoClick
      end
      object btnRemoveTudo: TSpeedButton
        Left = 300
        Top = 184
        Width = 39
        Height = 34
        Hint = 'Remove Todos'
        Anchors = [akLeft, akTop, akRight]
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
        Left = 10
        Top = 17
        Width = 284
        Height = 28
        BevelOuter = bvNone
        Caption = 'C. Responsabilidade Disponíveis'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 348
        Top = 18
        Width = 284
        Height = 27
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'C. Responsabilidade  Selecionados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object DBGridCRespon: TwwDBGrid
        Left = 11
        Top = 45
        Width = 284
        Height = 205
        Selected.Strings = (
          'CODEXTERNO'#9'9'#9'Código'
          'NOME'#9'35'#9'Nome')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dsUsuario
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        OnTitleButtonClick = DBGridCResponTitleButtonClick
        OnDblClick = DBGridCResponDblClick
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock972: TDock97
    Width = 650
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
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 650
    inherited tb97Fundo: TToolbar97
      Left = 478
      DockPos = 481
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 520026
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 309
      DockPos = 312
    end
  end
  object DBGridSel: TwwDBGrid [3]
    Left = 349
    Top = 164
    Width = 284
    Height = 205
    Selected.Strings = (
      'CODEXTERNO'#9'9'#9'Código'
      'NOME'#9'60'#9'Nome')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Anchors = [akTop, akRight, akBottom]
    DataSource = ds
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 1
    TitleButtons = True
    OnTitleButtonClick = DBGridSelTitleButtonClick
    OnDblClick = DBGridSelDblClick
    IndicatorColor = icBlack
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 263
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 496
    Top = 264
  end
  inherited ImlPadrao: TImageList
    Left = 32
    Top = 200
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    DataSource = dsUsuario
    ApplyEdit = CmeCadastroApplyEdit
    Left = 456
    Top = 71
  end
  inherited Cds: TCMClientDataSet
    Left = 496
    Top = 296
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'USUARIOSISTEMA.IDUSUARIO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '20')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 344
    Top = 71
  end
  object dsUsuario: TwwDataSource
    DataSet = CdsRespDisp
    Left = 160
    Top = 223
  end
  object CdsRespDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 164
    Top = 255
  end
end
