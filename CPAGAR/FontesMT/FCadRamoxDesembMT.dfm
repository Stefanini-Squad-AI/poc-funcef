inherited FrmCadRamoxDesembMT: TFrmCadRamoxDesembMT
  Left = 215
  Top = 200
  Caption = 'Ramo do Fornecedor X Tipos de Desembolso'
  ClientHeight = 392
  ClientWidth = 667
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 47
    Width = 3
    Height = 306
    Cursor = crHSplit
  end
  inherited pnlFundo: TPanel
    Left = 3
    Width = 664
    Height = 306
    object PnlDesemb: TPanel
      Left = 330
      Top = 1
      Width = 333
      Height = 304
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 0
      object PnlTitDesemb: TPanel
        Left = 1
        Top = 1
        Width = 331
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Desembolso'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdTipDesemb: TwwDBGrid
        Left = 1
        Top = 27
        Width = 331
        Height = 276
        Selected.Strings = (
          'CODTIPRECDES'#9'15'#9'Código'
          'ANASINT'#9'1'#9'T'
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsTipDesemb
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = GrdTipDesembCalcCellColors
        IndicatorColor = icBlack
      end
    end
    object PnlCtrls: TPanel
      Left = 298
      Top = 1
      Width = 32
      Height = 304
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnIncluiDesemb: TSpeedButton
        Left = 4
        Top = 124
        Width = 25
        Height = 25
        Hint = 'Selciona'
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
        OnClick = BtnIncluiDesembClick
      end
      object BtnIncluiTodosDesemb: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
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
        OnClick = BtnIncluiTodosDesembClick
      end
      object BtnExcluiDesembAssoc: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
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
        OnClick = BtnExcluiDesembAssocClick
      end
      object BtnExcluiAllDesembAssoc: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Exclui'
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
        OnClick = BtnExcluiAllDesembAssocClick
      end
    end
    object PnlCadastro: TPanel
      Left = 1
      Top = 1
      Width = 297
      Height = 304
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object GrdTipoDesembAssoc: TwwDBGrid
        Left = 0
        Top = 76
        Width = 297
        Height = 228
        Selected.Strings = (
          'CODTIPRECDES'#9'15'#9'Código'
          'ANASINT'#9'1'#9'T'
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = GrdTipDesembCalcCellColors
        IndicatorColor = icBlack
      end
      object PnlTitDesembAssoc: TPanel
        Left = 0
        Top = 50
        Width = 297
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Desembolso Relacionados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PblRamoForn: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 50
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 4
          Top = 7
          Width = 119
          Height = 13
          Caption = 'Ramo do Fornecedor'
        end
        object CmDblRamoForn: TCMDBLookupCombo
          Left = 4
          Top = 23
          Width = 284
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRAMOFORNECEDOR'#9'30'#9'DESCRAMOFORNECEDOR')
          LookupTable = CdsRamoForn
          LookupField = 'IDRAMOFORNECEDOR'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = CmDblRamoFornCloseUp
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 667
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Width = 76
        Caption = '&Relacionar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888FFFFF8888888888800000888888888FF877777F8888888776666600
          888888F877888887788888766666666608888F878F888888878887666F666666
          60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
          6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
          6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
          66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
          6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
          8888888877FFFF87788888888777778888888888887777788888}
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 196
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 136
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 667
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 576
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 166
    Top = 202
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited Cds: TCMClientDataSet
    IndexFieldNames = 'CODTIPRECDES'
    Top = 151
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RAMOFORNECEDOR.DESCRAMOFORNECEDOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RAMOFORNECEDOR'
      'RAMOXDESEMB')
    CamposChave.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR')
    Filtro.Strings = (
      'RAMOFORNECEDOR.IDRAMOFORNECEDOR =  RAMOXDESEMB.IDRAMOFORNECEDOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    OperComparador.Strings = (
      '-1')
    UsaDistinct = True
    Left = 545
    Top = 2
  end
  object DsTipDesemb: TwwDataSource
    AutoEdit = False
    DataSet = CdsTipDesemb
    Left = 533
    Top = 129
  end
  object CdsTipDesemb: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODTIPRECDES'
    Params = <>
    ProviderName = 'Dsp'
    Left = 540
    Top = 87
  end
  object CdsRamoForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 156
    Top = 71
  end
end
