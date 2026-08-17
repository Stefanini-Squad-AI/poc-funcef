object frmReplicaCCusto: TfrmReplicaCCusto
  Left = 285
  Top = 126
  Width = 852
  Height = 456
  Caption = 'Replicar Centro de Custo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCCusto: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 418
    Align = alClient
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 174
      Width = 834
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 1
      Top = 206
      Width = 834
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 1
      Top = 177
      Width = 834
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object BtnSel: TSpeedButton
        Tag = 1
        Left = 135
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Adiciona'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888877777888888888887777788888888877EEEEE77
          8888888778FFFF778888887EE66666EE78888878FF88888F788887E666666666
          6088878F88888888878887E666666666608887F88888888887F88E6666666666
          660878F88888888888788E66FFFFFFF666087F8877777778887F8E666FFFFF66
          66087F888777778F887F8E6666FFF66666087F88887778F8887F8E66666F6666
          66087F8888878F88887F876666666666608887888888F888878F876666666666
          608887F88888888887F8880666666666088888788888888878F8888006666600
          88888887788888778F8888888000008888888888F777778FF888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSelClick
      end
      object BtnSelAll: TSpeedButton
        Left = 167
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Adiciona Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888006666600
          888888F877888887788888066666666608888F87888888888788806666666666
          67888F78FFFFFFF88F788066FFFFFFF66788F87887777777887806666FFFFF66
          6E78F7888877777888F7066666FFF6666E78F7888887778888F70666666F6666
          6E78F788FFFF7FF888F70666FFFFFFF66E78F7888777777788F706666FFFFF66
          6E788788887777788F87806666FFF666E7888F78888777888F788066666F6666
          E788887888887888F878887EE66666EE78888887F88888FF878888877EEEEE77
          8888888877FFFF87788888888777778888888888887777788888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnSelAllClick
      end
      object BtnDel: TSpeedButton
        Left = 199
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Exlui'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888000008888888888877777888888888006666600
          88888887788888778F88880666666666088888788888888878F8876666666666
          608887F88888888887F8876666666666608887888888F888878F8E66666F6666
          66087F8888878F88887F8E6666FFF66666087F88887778F8887F8E666FFFFF66
          66087F888777778F887F8E66FFFFFFF666087F8877777778887F8E6666666666
          660878F888888888887887E666666666608887F88888888887F887E666666666
          6088878F888888888788887EE66666EE78888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDelClick
      end
      object BtnDelAll: TSpeedButton
        Left = 231
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888888877777888888888888777778888888877EEEEE77
          8888888877FFFF877888887EE66666EE78888887F88888FF87888066666F6666
          E788887888887888F878806666FFF666E7888F78888777888F7806666FFFFF66
          6E788788887777788F870666FFFFFFF66E78F7888777777788F70666666F6666
          6E78F788FFFF7FF888F7066666FFF6666E78F7888887778888F706666FFFFF66
          6E78F7888877777888F78066FFFFFFF66788F878877777778878806666666666
          67888F78FFFFFFF88F7888066666666608888F87888888888788888006666600
          888888F87788888778888888800000888888888FF877777F8888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnDelAllClick
      end
    end
    object plnCCustoRelac: TPanel
      Left = 1
      Top = 1
      Width = 834
      Height = 173
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 0
        Width = 834
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Centros de Custo Relacionados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdSel: TwwDBGrid
        Left = 0
        Top = 26
        Width = 834
        Height = 147
        Selected.Strings = (
          'CODCENTROCUSTO'#9'10'#9'Código'#9'F'
          'STATUSGRUPOCDC'#9'15'#9'Analítico/Sintético'
          'NOME'#9'30'#9'Nome'
          'ATIVO'#9'10'#9'Ativo?')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsSel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = [dgAllowDelete]
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        OnCalcCellColors = GrdSelCalcCellColors
        IndicatorColor = icBlack
      end
    end
    object plnCCusto: TPanel
      Left = 1
      Top = 209
      Width = 834
      Height = 171
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 832
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Centros de Custo'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdAll: TwwDBGrid
        Left = 1
        Top = 27
        Width = 832
        Height = 143
        Selected.Strings = (
          'CODCENTROCUSTO'#9'10'#9'Código'#9'F'
          'STATUSGRUPOCDC'#9'15'#9'Analítico/Sintético'
          'NOME'#9'30'#9'Nome'
          'ATIVO'#9'10'#9'Ativo?')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsAll
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = [dgAllowDelete]
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        OnCalcCellColors = GrdAllCalcCellColors
        IndicatorColor = icBlack
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 380
      Width = 834
      Height = 37
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object bbtnConfirmar: TBitBtn
        Left = 377
        Top = 2
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 0
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object DsSel: TwwDataSource
    AutoEdit = False
    DataSet = CdsSel
    Left = 520
    Top = 8
  end
  object CdsSel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 480
    Top = 8
  end
  object CdsAll: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 504
    Top = 288
  end
  object DsAll: TwwDataSource
    AutoEdit = False
    DataSet = CdsAll
    Left = 544
    Top = 288
  end
end
