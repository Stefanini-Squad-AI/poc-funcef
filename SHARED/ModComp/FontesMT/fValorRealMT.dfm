inherited frmValorRealMT: TfrmValorRealMT
  Left = 127
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Informe o Valor Real Total'
  ClientWidth = 554
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 554
    BorderWidth = 2
    object pnlValor: TPanel
      Left = 4
      Top = 4
      Width = 546
      Height = 43
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object rgRateio: TRadioGroup
        Left = 8
        Top = 3
        Width = 400
        Height = 32
        Caption = 'Forma de Informar os Valores Reais'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Por Rateio do Valor ao Lado'
          'Informando Um a Um')
        TabOrder = 0
        OnClick = rgRateioClick
      end
      object redValor: TRealEdit
        Left = 414
        Top = 11
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object dbgrObjetos: TwwDBGrid
      Left = 4
      Top = 49
      Width = 546
      Height = 182
      Selected.Strings = (
        'Descricao'#9'40'#9'Descrição do Objeto Reclamado'
        'ValorEsperado'#9'12'#9'Valor Estimado'
        'VALORSENTENCA'#9'10'#9'Valor Real')
      MemoAttributes = [mWordWrap]
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 2
      ShowHorzScrollBar = True
      DataSource = dsValorReal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      OnColEnter = dbgrObjetosColEnter
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 554
    inherited tb97Fundo: TToolbar97
      Left = 384
      DockPos = 392
      TabOrder = 2
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 217
      DockPos = 225
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object sbtnCalcular: TBitBtn
      Left = 10
      Top = 2
      Width = 80
      Height = 33
      Hint = 'Calcular o Rateio do Valor Total'
      Caption = 'C&alcular'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = sbtnCalcularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 131
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CdsValorReal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsValorRealAfterScroll
    Left = 176
    Top = 99
  end
  object dsValorReal: TwwDataSource
    AutoEdit = False
    DataSet = CdsValorReal
    Left = 176
    Top = 148
  end
end
