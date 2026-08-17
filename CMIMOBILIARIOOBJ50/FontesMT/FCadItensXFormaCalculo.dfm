inherited frmCadItensXFormaCalculo: TfrmCadItensXFormaCalculo
  Left = 193
  Top = 240
  HelpContext = 640091
  Caption = 'Itens da Forma de Cálculo'
  ClientHeight = 411
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 378
    object Label4: TLabel
      Left = 15
      Top = 10
      Width = 99
      Height = 13
      Caption = 'Forma de Cálculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbcboFormaCalculo: TwwDBLookupCombo
      Left = 15
      Top = 24
      Width = 690
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome'#9'F')
      LookupTable = cdsFormaCalculo
      LookupField = 'IDFORMACALCIMOB'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = dbcboFormaCalculoCloseUp
    end
    object Panel1: TPanel
      Left = 15
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens não Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object LstItensNAOAss: TListBox
      Left = 15
      Top = 80
      Width = 320
      Height = 281
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object LstItensAss: TTreeView
      Left = 386
      Top = 80
      Width = 319
      Height = 281
      Indent = 19
      ParentShowHint = False
      ReadOnly = True
      RightClickSelect = True
      ShowHint = False
      TabOrder = 3
      OnChange = LstItensAssChange
      Items.Data = {
        01000000190000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        00}
    end
    object Panel3: TPanel
      Left = 386
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object btnIncluir: TfcShapeBtn
      Left = 346
      Top = 171
      Width = 28
      Height = 28
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 5
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnIncluirClick
    end
    object btnExcluir: TfcShapeBtn
      Left = 346
      Top = 216
      Width = 28
      Height = 26
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
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
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 6
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnExcluirClick
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 720
    inherited tb97Fundo: TToolbar97
      Left = 541
      DockPos = 541
    end
    object btnDetalhe: TBitBtn
      Left = 449
      Top = 2
      Width = 80
      Height = 27
      Caption = 'Detalhe'
      TabOrder = 1
      OnClick = btnDetalheClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object cdsFormaCalculo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 8
    Data = {
      D40000009619E0BD010000001800000006000000000003000000D4000F494446
      4F524D4143414C43494D4F4208000400000000000849444D4F44554C4F080004
      0000000000044E4F4D450100490000000100055749445448020002003C000944
      455343524943414F04004B000000020007535542545950450200490005005465
      78740005574944544802000200E8030D5452474454494E434C5553414F080008
      00000000000F54524755534552494E434C5553414F0100490000000100055749
      445448020002001E000100044C4349440400010009080000}
  end
  object cdsItemXFormaCalc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 504
    Top = 112
    Data = {
      D40000009619E0BD010000001800000006000000000003000000D4000F494446
      4F524D4143414C43494D4F4208000400000000000849444D4F44554C4F080004
      0000000000044E4F4D450100490000000100055749445448020002003C000944
      455343524943414F04004B000000020007535542545950450200490005005465
      78740005574944544802000200E8030D5452474454494E434C5553414F080008
      00000000000F54524755534552494E434C5553414F0100490000000100055749
      445448020002001E000100044C4349440400010009080000}
  end
  object cdsItensNaoAss: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 120
    Data = {
      D40000009619E0BD010000001800000006000000000003000000D4000F494446
      4F524D4143414C43494D4F4208000400000000000849444D4F44554C4F080004
      0000000000044E4F4D450100490000000100055749445448020002003C000944
      455343524943414F04004B000000020007535542545950450200490005005465
      78740005574944544802000200E8030D5452474454494E434C5553414F080008
      00000000000F54524755534552494E434C5553414F0100490000000100055749
      445448020002001E000100044C4349440400010009080000}
  end
end
