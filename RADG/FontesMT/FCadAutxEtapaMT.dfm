inherited frmCadAutxEtapaMT: TfrmCadAutxEtapaMT
  Left = 333
  Top = 116
  HelpContext = 110031
  Caption = 'Etapas x Grupo de Autorização'
  ClientHeight = 433
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 595
    Height = 347
    object Label5: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Processo'
    end
    object Label1: TLabel
      Left = 296
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Etapa'
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
      TabOrder = 0
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
      TabOrder = 1
    end
    object plnGrp: TPanel
      Left = 5
      Top = 69
      Width = 585
      Height = 273
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
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
        OnClick = BtnAdicionaTudoClick
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
        Width = 585
        Height = 33
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Grupos de Autorização'
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
          'NOMEGRUPOAUT'#9'38'#9'NOMEGRUPOAUT'#9'F')
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
        DataSource = dsGrupoDisp
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
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock972: TDock97
    Width = 595
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 595
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 110031
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 101
    Top = 82
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 454
    Top = 34
  end
  inherited ImlPadrao: TImageList
    Left = 23
    Top = 79
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 310
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 506
    Top = 38
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME'
      'RADETAPAXGRPRESP.IDGRUPOAUTORIZA'
      'RADGRUPOAUTORIZA.NOMEGRUPOAUT')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Processo'
      'Etapa'
      'Grupo Autorização'
      'Nome Grupo Autorização')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RADTIPOETAPAXPROC'
      'RADTIPOPROCESSO'
      'RADTIPOETAPA'
      'RADGRUPOAUTORIZA'
      'RADETAPAXGRPRESP')
    CamposChave.Strings = (
      'RADTIPOETAPAXPROC.IDTIPOPROCESSO'
      'RADTIPOETAPAXPROC.IDTIPOETAPA'
      'RADTIPOPROCESSO.NOME'
      'RADTIPOETAPA.NOME')
    Filtro.Strings = (
      
        'RADTIPOETAPAXPROC.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESS' +
        'O'
      'RADTIPOETAPAXPROC.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA'
      
        'RADTIPOETAPAXPROC.IDTIPOPROCESSO = RADETAPAXGRPRESP.IDTIPOPROCES' +
        'SO(+)'
      'RADTIPOETAPAXPROC.IDTIPOETAPA = RADETAPAXGRPRESP.IDTIPOETAPA(+)'
      
        'RADETAPAXGRPRESP.IDGRUPOAUTORIZA = RADGRUPOAUTORIZA.IDGRUPOAUTOR' +
        'IZA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '10'
      '60')
    Left = 466
    Top = 120
  end
  object cdsGrupoDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 184
  end
  object dsGrupoDisp: TwwDataSource
    DataSet = cdsGrupoDisp
    Left = 182
    Top = 242
  end
end
