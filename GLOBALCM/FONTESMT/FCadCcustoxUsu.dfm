inherited FrmCadCcustoxUsu: TFrmCadCcustoxUsu
  Left = 227
  Top = 182
  Caption = 'Centro de Custo x Usuário'
  ClientHeight = 449
  ClientWidth = 758
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 758
    Height = 363
    object BtnAdicionaTudo: TSpeedButton
      Left = 367
      Top = 166
      Width = 26
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
    object btnAdiciona: TSpeedButton
      Left = 367
      Top = 208
      Width = 26
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
      Left = 367
      Top = 251
      Width = 26
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
    object btnRemoveTudo: TSpeedButton
      Left = 367
      Top = 294
      Width = 26
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
    object wwDbGridUSU: TwwDBGrid
      Left = 9
      Top = 128
      Width = 351
      Height = 221
      Selected.Strings = (
        'NOMEUSUARIO'#9'20'#9'Usuário'
        'NOME'#9'60'#9'Nome'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DsUsuario
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentShowHint = False
      ShowHint = True
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
    object DbGridSel: TwwDBGrid
      Left = 398
      Top = 128
      Width = 351
      Height = 221
      Selected.Strings = (
        'NOMEUSUARIO'#9'20'#9'Usuário'#9'F'
        'NOME'#9'60'#9'Nome'#9'F')
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
    object Panel1: TPanel
      Left = 9
      Top = 108
      Width = 351
      Height = 20
      BevelOuter = bvNone
      Caption = 'Usuários Disponíveis'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 398
      Top = 108
      Width = 351
      Height = 20
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Caption = 'Usuários Selecionados'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 13
      Width = 741
      Height = 65
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Centro de Custo'
      TabOrder = 4
      object Label2: TLabel
        Left = 11
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label1: TLabel
        Left = 107
        Top = 21
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object EditCodigo: TEdit
        Left = 11
        Top = 37
        Width = 86
        Height = 21
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
      object EditCentro: TEdit
        Left = 107
        Top = 37
        Width = 523
        Height = 21
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
    end
  end
  inherited Dock972: TDock97
    Width = 758
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 758
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 486
    Top = 199
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 432
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 564
    Top = 199
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CENTCUST.CODEXTERNO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODEXTERNO')
    Filtro.Strings = (
      'CENTCUST.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 464
    Top = 7
  end
  object CdsUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 207
  end
  object DsUsuario: TwwDataSource
    DataSet = CdsUsuario
    Left = 96
    Top = 207
  end
end
