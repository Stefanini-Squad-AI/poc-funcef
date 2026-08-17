inherited FrmMTAtuUltCompra: TFrmMTAtuUltCompra
  Left = -8
  Top = 138
  HelpContext = 50033
  Caption = 'Atualização de Preço de Última Compra'
  ClientHeight = 366
  ClientWidth = 697
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 697
    Height = 327
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 687
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lbAlmox: TLabel
        Left = 312
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Grupo de Produtos'
      end
      object dblcGrupoProd: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROD'#9'30'#9'Descrição'
          'CODGRUPOPROD'#9'10'#9'Código')
        LookupTable = cdsGrupoProd
        LookupField = 'CODGRUPOPROD'
        Options = [loTitles]
        Style = csDropDownList
        Color = clSilver
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnFiltrar: TBitBtn
        Left = 235
        Top = 25
        Width = 24
        Height = 21
        Hint = 'Filtrar pelo grupo'
        TabOrder = 1
        OnClick = btnFiltrarClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000012000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777799997
          7777770000007777777777777777770000007777777000077777770000007777
          7770F70777777700000077777770F70777777700000077777770F70777777700
          00007777770FF780777777000000777770FF777807777700000077770FF77777
          8077770000007770F7F77777780777000000770F7F77777777807700000070F7
          F777777777780700000070FFF7F7F77878780700000070000000000000000700
          000077CCCC7CCCC7CCCC77000000777777777777777777000000}
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 267
      Width = 687
      Height = 55
      Align = alBottom
      BevelOuter = bvNone
      BevelWidth = 2
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Artigo'
      end
      object Label3: TLabel
        Left = 131
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 400
        Top = 8
        Width = 96
        Height = 13
        Caption = 'Valor Utl.Compra'
      end
      object Label6: TLabel
        Left = 568
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Un. Medida'
      end
      object DBText1: TDBText
        Left = 131
        Top = 28
        Width = 246
        Height = 17
        DataField = 'DESCRICAO'
        DataSource = ds
      end
      object DBText2: TDBText
        Left = 568
        Top = 28
        Width = 92
        Height = 17
        DataField = 'CODMEDCUSTO'
        DataSource = ds
      end
      object dblcArtigo: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 112
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODARTIGO'#9'14'#9'CODARTIGO'
          'DESCRICAO'#9'87'#9'DESCRICAO')
        LookupTable = cdsArtigo
        LookupField = 'CODARTIGO'
        Options = [loTitles]
        Color = clSilver
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcArtigoCloseUp
      end
      object edValUltComp: TDBRealEdit
        Left = 400
        Top = 24
        Width = 124
        Height = 21
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '        0,00000')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        OnEnter = edValUltCompEnter
        OnExit = edValUltCompExit
        IntDigits = 15
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALULTCOMPRA'
        DataSource = ds
      end
    end
    object grdArtigo: TwwDBGrid
      Left = 5
      Top = 60
      Width = 687
      Height = 207
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição'
        'CODMEDCUSTO'#9'10'#9'Unid.'#9'F'
        'VALULTCOMPRA'#9'10'#9'Valor Ult. Compra'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = grdArtigoTitleButtonClick
      OnExit = grdArtigoExit
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 697
    inherited tb97Fundo: TToolbar97
      Left = 449
      DockPos = 573
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        HelpContext = 50033
      end
      object btnGravar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gravar'
        TabOrder = 2
        OnClick = btnGravarClick
        OnExit = btnGravarExit
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00877777777777
          777844448FFF88844C484444807F88844C484444807F88844C484444800F8884
          4C484444888888844C4844440000000004484444444444444448444444444444
          4C4844FFFFFFFFFFFC4844FFFFFFFFFFFC48444444444444FC4844FFFFFFFFFF
          FC48444444444444FC4844FFFFFFFFFFFC48444444444444FC48}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 88
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 136
  end
  object cdsAtuUltCompra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 152
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cdsAtuUltCompra
    Left = 400
    Top = 112
  end
end
