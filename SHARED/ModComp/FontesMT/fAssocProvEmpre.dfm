inherited frmAssocProvEmpre: TfrmAssocProvEmpre
  Left = 40
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Associação de Rubricas por Empresa'
  ClientHeight = 379
  ClientWidth = 715
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 340
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 549
      DockPos = 557
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 715
    Height = 340
    BorderWidth = 2
    Font.Style = []
    ParentFont = False
    object sbtnDesassociar: TSpeedButton
      Left = 367
      Top = 242
      Width = 25
      Height = 25
      Hint = 'Desassociar rubrica selecionada'
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
      OnClick = sbtnDesassociarClick
    end
    object sbtnDesassociarTodos: TSpeedButton
      Left = 367
      Top = 272
      Width = 25
      Height = 25
      Hint = 'Desassociar todas as rubricas'
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
      OnClick = sbtnDesassociarTodosClick
    end
    object sbtnAssociar: TSpeedButton
      Left = 367
      Top = 182
      Width = 25
      Height = 25
      Hint = 'Associar rubrica selecionada'
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
      OnClick = sbtnAssociarClick
    end
    object sbtnAssociarTodos: TSpeedButton
      Left = 367
      Top = 212
      Width = 25
      Height = 25
      Hint = 'Associar todas as rubricas'
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
      OnClick = sbtnAssociarTodosClick
    end
    object lblPlanPatro: TfcLabel
      Left = 10
      Top = 147
      Width = 331
      Height = 25
      AutoSize = False
      Caption = 'Rubricas da Empresa Selecionada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object fcLabel3: TfcLabel
      Left = 394
      Top = 147
      Width = 257
      Height = 25
      AutoSize = False
      Caption = 'Rubricas não Associadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object sbtnTornarInvisivelFolha: TSpeedButton
      Left = 340
      Top = 308
      Width = 25
      Height = 25
      Hint = 'Tornar todas as Rubricas da Empresa invisíveis para o Sistema RH'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888FF8888888888888778888888888888F77F8888888888800F08
        8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
        88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
        08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
        F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
        FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
        788877FF7FF778F7788889999991777888888777777787788888889999988888
        8888887777788888888888888888888888888888888888888888}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnTornarVisivelFolhaClick
    end
    object sbtnTornarVisivelFolha: TSpeedButton
      Left = 310
      Top = 308
      Width = 25
      Height = 25
      Hint = 'Tornar todas as Rubricas da Empresa visíveis para o Sistema RH'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333300000
        0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
        FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
        9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
        00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
        993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
        3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
        3333388888887733333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnTornarVisivelFolhaClick
    end
    object Panel1: TPanel
      Left = 4
      Top = 4
      Width = 707
      Height = 140
      BevelInner = bvLowered
      TabOrder = 0
      object fcLabel1: TfcLabel
        Left = 8
        Top = 6
        Width = 121
        Height = 23
        AutoSize = False
        Caption = 'Empresa(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
      end
      object dbgrdEmpre: TDBGrid
        Left = 8
        Top = 31
        Width = 692
        Height = 100
        DataSource = dsEmpresa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RAZAOSOCIAL'
            Title.Caption = 'Razão Social'
            Width = 399
            Visible = True
          end>
      end
    end
    object lstbxRubSel: TColorListBox
      Left = 10
      Top = 172
      Width = 355
      Height = 134
      ItemHeight = 13
      PopupMenu = pmenu
      Sorted = True
      TabOrder = 1
      OnDblClick = mnuAlterarClick
      FieldsWidth.Strings = (
        '300'
        '70')
      FieldKeyPos = 2
      FieldsVisibleCount = 2
      LinesType = [ltBottom, ltBeetwenCols]
      OnColorItems = lstbxRubSelColorItems
    end
    object edPesquisaRubSel: TEdit
      Left = 10
      Top = 309
      Width = 295
      Height = 21
      TabOrder = 2
      OnChange = edPesquisaRubSelChange
    end
    object lstbxRubNaoSel: TColorListBox
      Left = 394
      Top = 172
      Width = 312
      Height = 134
      ItemHeight = 13
      Sorted = True
      TabOrder = 3
      OnDblClick = sbtnAssociarClick
      FieldKeyPos = 1
      LinesType = [ltBottom, ltBeetwenCols]
    end
    object edPesquisaRubNaoSel: TEdit
      Left = 394
      Top = 309
      Width = 312
      Height = 21
      TabOrder = 4
      OnChange = edPesquisaRubNaoSelChange
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 506
    Top = 334
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dsEmpresa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEmpresa
    Left = 31
    Top = 62
  end
  object pmenu: TPopupMenu
    Left = 72
    Top = 174
    object mnuAlterar: TMenuItem
      Caption = 'Alterar'
      OnClick = mnuAlterarClick
    end
  end
  object CdsEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    BeforeScroll = CdsEmpresaBeforeScroll
    AfterScroll = CdsEmpresaAfterScroll
    Left = 90
    Top = 62
  end
  object CdsRubNaoSel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubNaoSelIndex1'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubNaoSelIndex1'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 420
    Top = 174
  end
  object CdsRubSel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubSelIndex1'
        Fields = 'DESCRPROVDESC'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubSelIndex1'
    Params = <>
    ProviderName = 'Dsp'
    StoreDefs = True
    Left = 26
    Top = 174
  end
end
