inherited frmCadParamAditamentoMT: TfrmCadParamAditamentoMT
  Left = 47
  Top = 120
  HelpContext = 120013
  Caption = 'Parâmetro de Aditamentos'
  ClientHeight = 388
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 349
    object Panel1: TPanel
      Left = 1
      Top = 61
      Width = 732
      Height = 287
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 8
        Top = 10
        Width = 321
        Height = 27
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Dados Não Registrados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object DBgrdNaoRegistrados: TwwDBGrid
        Left = 8
        Top = 37
        Width = 321
        Height = 226
        Selected.Strings = (
          'DESCRICAO'#9'41'#9'Descrição'#9'F')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = dsNaoRegistra
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgPerfectRowFit]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        OnDblClick = btnLFUmClick
        IndicatorColor = icBlack
      end
      object btnLFUm: TfcShapeBtn
        Left = 337
        Top = 67
        Width = 41
        Height = 33
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Options = [boFocusable]
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 2
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnLFUmClick
      end
      object btnLFTodos: TfcShapeBtn
        Left = 337
        Top = 102
        Width = 41
        Height = 33
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Options = [boFocusable]
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 3
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnLFTodosClick
      end
      object btnFLUm: TfcShapeBtn
        Left = 337
        Top = 164
        Width = 41
        Height = 33
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Options = [boFocusable]
        Orientation = soDown
        ParentClipping = True
        RoundRectBias = 25
        ShadeColors.Btn3DLight = 14671839
        ShadeColors.BtnHighlight = 15724527
        ShadeColors.BtnShadow = 6316128
        ShadeColors.BtnBlack = 3158064
        ShadeStyle = fbsFlat
        TabOrder = 4
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnFLUmClick
      end
      object btnFLTodos: TfcShapeBtn
        Left = 337
        Top = 199
        Width = 41
        Height = 33
        Color = clBtnFace
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Options = [boFocusable]
        ParentClipping = True
        RoundRectBias = 25
        ShadeStyle = fbsFlat
        TabOrder = 5
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = btnFLTodosClick
      end
      object DBgrdRegistrados: TwwDBGrid
        Left = 384
        Top = 37
        Width = 321
        Height = 226
        Selected.Strings = (
          'DESCRICAO'#9'100'#9'Descrição')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        DataSource = dsRegistra
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgPerfectRowFit]
        TabOrder = 6
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = btnFLUmClick
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 384
        Top = 10
        Width = 321
        Height = 27
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Dados Registrados'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 732
      Height = 60
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 15
        Top = 8
        Width = 186
        Height = 13
        Caption = 'Tela para registro no Aditamento'
      end
      object cbTela: TComboBox
        Left = 16
        Top = 24
        Width = 313
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbTelaChange
        Items.Strings = (
          'Cadastro de Contratos'
          'Correções Contratuais'
          'Serviço/Produto x Item Contratual')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 734
    inherited tb97Fundo: TToolbar97
      Left = 557
      DockPos = 557
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 27
    Top = 355
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  object cdsNaoRegistra: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 389
    Top = 13
    Data = {
      690100009619E0BD010000001800000004000300000003000000AD0009494444
      444649454C440800040000000000095441424C454E414D450100490000000100
      055749445448020002006400094649454C444E414D4501004900000001000557
      494454480200020064000944455343524943414F010049000000010005574944
      544802000200640002000D44454641554C545F4F524445520200820002000000
      02000400044C434944040001000908000000000000000000809F400D434F4E54
      5241544F434F4E54520F434F4443454E54524F524553504F4E1A43656E74726F
      20646520526573706F6E736162696C696461646500000000000000B89F400D43
      4F4E545241544F434F4E5452104441544142415345434F4E545241544F154461
      7461204261736520646F20436F6E747261746F00000000000000AC9F400D434F
      4E545241544F434F4E54520E44415441415353494E4154555241124461746120
      646520417373696E6174757261}
  end
  object dsNaoRegistra: TDataSource
    DataSet = cdsNaoRegistra
    Left = 389
    Top = 26
  end
  object cdsRegistra: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 490
    Top = 13
    Data = {
      EE0000009619E0BD010000001800000004000100000003000000AD0009494444
      444649454C440800040000000000095441424C454E414D450100490000000100
      055749445448020002006400094649454C444E414D4501004900000001000557
      494454480200020064000944455343524943414F010049000000010005574944
      544802000200640002000D44454641554C545F4F524445520200820002000000
      02000400044C434944040001000908000000000000000000B49F400D434F4E54
      5241544F434F4E54521156414C4F5242415345434F4E545241544F1656616C6F
      72206261736520646F20636F6E747261746F}
  end
  object dsRegistra: TDataSource
    DataSet = cdsRegistra
    Left = 490
    Top = 26
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 513
    Top = 189
  end
end
