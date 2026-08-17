inherited frmMTUsuxCaixaPeq: TfrmMTUsuxCaixaPeq
  Left = 92
  Top = 114
  HelpContext = 1130017
  Caption = 'Usuários x Caixa Pequeno'
  ClientHeight = 413
  ClientWidth = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 654
    Height = 327
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
      Left = 5
      Top = 61
      Width = 644
      Height = 261
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object btnAdiciona: TSpeedButton
        Left = 300
        Top = 98
        Width = 39
        Height = 34
        Hint = 'Adiciona'
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
      object grdTranf: TwwDBGrid
        Left = 349
        Top = 44
        Width = 279
        Height = 206
        Selected.Strings = (
          'DESCCAIXAPEQ'#9'60'#9'DESCCAIXAPEQ')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = ds
        Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object GrdTodos: TwwDBGrid
        Left = 10
        Top = 44
        Width = 279
        Height = 206
        Selected.Strings = (
          'DESCCAIXAPEQ'#9'60'#9'DESCCAIXAPEQ')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsCaixasDisp
        Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        IndicatorColor = icBlack
      end
      object Panel1: TPanel
        Left = 9
        Top = 17
        Width = 281
        Height = 28
        BevelOuter = bvNone
        Caption = 'Caixas Pequenos Disponíveis'
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
        Left = 348
        Top = 18
        Width = 282
        Height = 27
        BevelOuter = bvNone
        Caption = 'Caixas Pequenos Selecionados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  inherited Dock972: TDock97
    Width = 654
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
    Top = 374
    Width = 654
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 1130017
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 310
    Top = 24
  end
  inherited Cds: TCMClientDataSet
    Left = 490
    Top = 54
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Usuário')
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
    ExibePergunta = False
    Left = 466
    Top = 120
  end
  object cdsCaixasDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 184
  end
  object dsCaixasDisp: TwwDataSource
    DataSet = cdsCaixasDisp
    Left = 182
    Top = 242
  end
end
