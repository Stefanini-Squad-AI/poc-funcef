inherited frmProcxEtapaxObjMT: TfrmProcxEtapaxObjMT
  Left = 103
  Top = 58
  HelpContext = 110031
  Caption = 'Processos/Etapas x Objetos R.A.D.'
  ClientHeight = 447
  ClientWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 655
    Height = 361
    object Label5: TLabel
      Left = 26
      Top = 10
      Width = 53
      Height = 13
      Caption = 'Processo'
    end
    object Label1: TLabel
      Left = 344
      Top = 10
      Width = 34
      Height = 13
      Caption = 'Etapa'
    end
    object Label4: TLabel
      Left = 26
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Sistema'
    end
    object edProc: TEdit
      Left = 26
      Top = 26
      Width = 291
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
      Left = 344
      Top = 26
      Width = 291
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
    object edSitema: TEdit
      Left = 26
      Top = 64
      Width = 609
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
    object plnGrp: TPanel
      Left = 5
      Top = 97
      Width = 645
      Height = 259
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
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
        OnClick = BtnSobeClick
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
        OnClick = BtnDesceClick
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
        DataSource = dsObjRadDisp
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
        OnDblClick = btnAdicionarClick
        IndicatorColor = icBlack
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
        TabOrder = 2
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
    end
  end
  inherited Dock972: TDock97
    Width = 655
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
    Top = 408
    Width = 655
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
    Top = 42
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
    Left = 350
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 506
    Top = 38
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
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
    Left = 466
    Top = 120
  end
  object cdsObjRadDisp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 194
    Top = 176
  end
  object dsObjRadDisp: TwwDataSource
    DataSet = cdsObjRadDisp
    Left = 198
    Top = 242
  end
end
