inherited FrmCadIntegraOrcFDO: TFrmCadIntegraOrcFDO
  Left = 418
  Top = 110
  Caption = 'Cadastro Integração Orçamentária - FDO'
  ClientHeight = 558
  ClientWidth = 601
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 601
    Height = 472
    object gbConsulta: TGroupBox
      Left = 12
      Top = 35
      Width = 548
      Height = 118
      Caption = ' Configuração Consulta '
      TabOrder = 1
      object Label1: TLabel
        Left = 20
        Top = 28
        Width = 26
        Height = 13
        Caption = 'URL'
      end
      object Label2: TLabel
        Left = 20
        Top = 52
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object Label3: TLabel
        Left = 20
        Top = 76
        Width = 37
        Height = 13
        Caption = 'Senha'
      end
      object edtURLConsulta: TDBEdit
        Left = 80
        Top = 24
        Width = 457
        Height = 21
        Color = clWhite
        DataField = 'URLCONSULTA'
        DataSource = ds
        TabOrder = 0
      end
      object edtUserConsulta: TDBEdit
        Left = 80
        Top = 48
        Width = 457
        Height = 21
        DataField = 'USERCONSULTA'
        DataSource = ds
        TabOrder = 1
      end
      object edtPassConsulta: TDBEdit
        Left = 80
        Top = 72
        Width = 265
        Height = 21
        DataField = 'PASSCONSULTA'
        DataSource = ds
        TabOrder = 2
      end
      object btnTesteCons: TBitBtn
        Left = 428
        Top = 80
        Width = 106
        Height = 25
        Caption = 'Testar conexão'
        TabOrder = 3
        OnClick = btnTesteConsClick
      end
    end
    object gbEnvio: TGroupBox
      Left = 12
      Top = 165
      Width = 548
      Height = 118
      Caption = ' Configuração Envio de Dados '
      TabOrder = 2
      object Label4: TLabel
        Left = 20
        Top = 28
        Width = 26
        Height = 13
        Caption = 'URL'
      end
      object Label5: TLabel
        Left = 20
        Top = 52
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object Label6: TLabel
        Left = 20
        Top = 76
        Width = 37
        Height = 13
        Caption = 'Senha'
      end
      object edtURLEnvio: TDBEdit
        Left = 80
        Top = 24
        Width = 459
        Height = 21
        DataField = 'URLENVIO'
        DataSource = ds
        TabOrder = 0
      end
      object edtUserEnvio: TDBEdit
        Left = 80
        Top = 48
        Width = 459
        Height = 21
        DataField = 'USERENVIO'
        DataSource = ds
        TabOrder = 1
      end
      object edtPassEnvio: TDBEdit
        Left = 80
        Top = 72
        Width = 265
        Height = 21
        DataField = 'PASSENVIO'
        DataSource = ds
        TabOrder = 2
      end
      object btnTesteEnv: TBitBtn
        Left = 428
        Top = 80
        Width = 106
        Height = 25
        Caption = 'Testar conexão'
        TabOrder = 3
        OnClick = btnTesteEnvClick
      end
    end
    object plnTransf: TPanel
      Left = 1
      Top = 292
      Width = 599
      Height = 182
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object BtnAdicionaTudo: TSpeedButton
        Left = 276
        Top = 54
        Width = 39
        Height = 25
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
      object btnAdiciona: TSpeedButton
        Left = 276
        Top = 86
        Width = 39
        Height = 25
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
        Left = 276
        Top = 119
        Width = 39
        Height = 25
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
      object btnRemoveTudo: TSpeedButton
        Left = 276
        Top = 151
        Width = 39
        Height = 25
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
      object grdModIntegra: TwwDBGrid
        Left = 318
        Top = 39
        Width = 261
        Height = 138
        Selected.Strings = (
          'NOMEMODULO'#9'30'#9'Módulo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsModIntegra
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
      object grdModulos: TwwDBGrid
        Left = 9
        Top = 39
        Width = 262
        Height = 138
        Selected.Strings = (
          'NOMEMODULO'#9'30'#9'Módulo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsModulos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
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
        Left = 8
        Top = 9
        Width = 263
        Height = 28
        BevelInner = bvLowered
        Caption = 'Módulos não Habilitados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 317
        Top = 10
        Width = 262
        Height = 27
        BevelInner = bvLowered
        Caption = 'Módulos Habilitados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object chkHabIntegra: TCheckBox
      Left = 15
      Top = 10
      Width = 261
      Height = 17
      Caption = 'Habilita Integração Orçamentária - FDO'
      TabOrder = 0
      OnClick = chkHabIntegraClick
    end
  end
  inherited Dock972: TDock97
    Width = 601
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 519
    Width = 601
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 506
    Top = 11
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 346
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 548
    Top = 11
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 288
    Top = 11
  end
  inherited Cds: TCMClientDataSet
    Left = 376
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Left = 440
    Top = 11
  end
  object cdsModulos: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMEMODULO'
    Params = <>
    Left = 72
    Top = 447
  end
  object cdsModIntegra: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMEMODULO'
    Params = <>
    Left = 448
    Top = 440
  end
  object dsModulos: TDataSource
    DataSet = cdsModulos
    Left = 117
    Top = 456
  end
  object dsModIntegra: TDataSource
    DataSet = cdsModIntegra
    Left = 505
    Top = 464
  end
end
