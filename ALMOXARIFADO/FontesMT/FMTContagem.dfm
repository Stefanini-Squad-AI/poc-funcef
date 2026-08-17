inherited FrmMTContagem: TFrmMTContagem
  Left = 34
  Top = 108
  HelpContext = 50039
  Caption = 'Contagem Física'
  ClientHeight = 381
  ClientWidth = 720
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 342
    object grdinvent: TwwDBGrid
      Left = 1
      Top = 56
      Width = 718
      Height = 230
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Código'
        'DESCRICAO'#9'50'#9'Descrição'
        'QTDECONTADA'#9'10'#9'Quantidade'
        'CODMEDIDA'#9'8'#9'Unid.'#9'F'
        'CUSTOMEDIO'#9'10'#9'Custo Médio'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      BorderStyle = bsNone
      Color = clWhite
      DataSource = dsInvent
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      UseTFields = False
      OnTitleButtonClick = grdinventTitleButtonClick
      OnExit = grdinventExit
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 718
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
      TabOrder = 1
      object lbInvent: TLabel
        Left = 96
        Top = 32
        Width = 94
        Height = 13
        Caption = 'Nº do Inventário'
      end
      object lbAlmox: TLabel
        Left = 96
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object Label7: TLabel
        Left = 408
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Grupo de Produtos'
      end
      object btnProcurar: TBitBtn
        Left = 5
        Top = 5
        Width = 68
        Height = 44
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnProcurarClick
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object dblcGrupoProd: TwwDBLookupCombo
        Left = 408
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
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnFiltrar: TBitBtn
        Left = 635
        Top = 25
        Width = 24
        Height = 21
        Hint = 'Filtrar pelo grupo'
        TabOrder = 2
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
      Left = 1
      Top = 286
      Width = 718
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
      TabOrder = 2
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Artigo'
      end
      object Label3: TLabel
        Left = 123
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 368
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Qtde. Contada'
      end
      object Label6: TLabel
        Left = 520
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Un. Medida'
      end
      object Label5: TLabel
        Left = 632
        Top = 8
        Width = 71
        Height = 13
        Caption = 'Custo Médio'
      end
      object DBText1: TDBText
        Left = 123
        Top = 28
        Width = 246
        Height = 17
        DataField = 'DESCRICAO'
        DataSource = dsInvent
      end
      object DBText2: TDBText
        Left = 608
        Top = 28
        Width = 92
        Height = 17
        Alignment = taRightJustify
        DataField = 'CUSTOMEDIO'
        DataSource = dsInvent
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
      object edSaldo: TDBRealEdit
        Left = 368
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
        OnEnter = edSaldoEnter
        IntDigits = 15
        DecDigits = 5
        NumberFormat = fNumber
        Signal = False
        DataField = 'QTDECONTADA'
        DataSource = dsInvent
      end
      object dblcUN: TwwDBLookupCombo
        Left = 520
        Top = 24
        Width = 73
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CODMEDIDA'#9'4'#9'Código'
          'DESCMEDIDA'#9'25'#9'Descrição')
        LookupTable = cdsUnMedida
        LookupField = 'CODMEDIDA'
        Options = [loTitles]
        Style = csDropDownList
        Color = clSilver
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcUNExit
      end
    end
  end
  inherited Dock971: TDock97
    Top = 342
    Width = 720
    inherited tb97Fundo: TToolbar97
      Left = 470
      DockPos = 581
      inherited sep1: TToolbarSep97
        Left = 163
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
        Left = 165
        HelpContext = 50039
      end
      object btnGravar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gravar'
        TabOrder = 2
        OnClick = btnGravarClick
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
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Inventário'
      'Data Inventário'
      'Código do Grupo'
      'Descrição do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTAR'
      'GRUPPROD')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.ABERTOFECHADO')
    Filtro.Strings = (
      'GRUPPROD.CODGRUPOPROD(+) = INVENTAR.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 303
    Top = 6
  end
  object cdsInvent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 136
  end
  object dsInvent: TwwDataSource
    AutoEdit = False
    DataSet = cdsInvent
    Left = 520
    Top = 88
  end
  object cdsUnMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 517
    Top = 184
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 136
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 640
    Top = 88
  end
end
