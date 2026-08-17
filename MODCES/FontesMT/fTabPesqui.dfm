inherited frmTabPesqui: TfrmTabPesqui
  Left = 95
  Top = 121
  HelpContext = 740028
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa Salarial: Tabulação de Um Cargo'
  ClientHeight = 382
  ClientWidth = 669
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 669
    Height = 270
    BorderWidth = 2
    object gbxPesquisa: TGroupBox
      Left = 12
      Top = 8
      Width = 649
      Height = 80
      Caption = 'Pesquisa Salarial a Tabular'
      TabOrder = 0
      object Label11: TLabel
        Left = 9
        Top = 51
        Width = 34
        Height = 13
        Caption = 'Cargo'
      end
      object dblckPesq: TwwDBLookupCombo
        Left = 8
        Top = 20
        Width = 257
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPESQSALAR'#9'40'#9'Pesquisa Salarial'
          'DATAREFPESQ'#9'12'#9'Data Refer.')
        LookupTable = CdsPesqui
        LookupField = 'NOMEPESQSALAR'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        AllowClearKey = False
        OnChange = dblckPesqChange
        OnEnter = dblckPesqEnter
      end
      object dblckCargo: TwwDBLookupCombo
        Left = 51
        Top = 48
        Width = 315
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TITULO'#9'30'#9'TITULO')
        LookupTable = CdsCargo
        LookupField = 'TITULO'
        Style = csDropDownList
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        AllowClearKey = False
      end
      object rgExcluir: TRadioGroup
        Left = 374
        Top = 12
        Width = 193
        Height = 30
        Caption = 'Excluir Empresa da Média?'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Nossa'
          'Outra'
          'Não')
        TabOrder = 2
        OnClick = rgExcluirClick
      end
      object dblckEntid: TwwDBLookupCombo
        Left = 374
        Top = 47
        Width = 193
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = CdsEntid
        LookupField = 'NOME'
        Style = csDropDownList
        TabOrder = 3
        Visible = False
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        AllowClearKey = False
      end
      object edData: TEdit
        Left = 271
        Top = 20
        Width = 94
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
      object gbxCorte: TGroupBox
        Left = 572
        Top = 12
        Width = 71
        Height = 56
        Caption = '% Corte'
        TabOrder = 5
        object ednPercCorte: TSpinEdit
          Left = 11
          Top = 20
          Width = 49
          Height = 22
          Hint = 
            'Valores Mais Afastados da Média do que Este % Serão Cortados (De' +
            'ixando Zero, Não Faz Corte)'
          MaxValue = 999
          MinValue = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 0
        end
      end
    end
    object dbgPesq: TwwDBGrid
      Left = 4
      Top = 95
      Width = 661
      Height = 171
      Selected.Strings = (
        'ENTIDADE'#9'30'#9'Empresa / Entidade'#9'F'
        'FREQ'#9'10'#9'Frequência'#9'F'
        'MENORC'#9'10'#9'Menor Nom.'#9'F'
        'PRIMQUAC'#9'10'#9'1.Quartil Nom.'#9'F'
        'MODAC'#9'10'#9'Moda Nom.'#9'F'
        'MEDIAC'#9'10'#9'Média Nom.'#9'F'
        'MEDIANAC'#9'10'#9'Mediana Nom.'#9'F'
        'TERCQUAC'#9'10'#9'3.Quartil Nom.'#9'F'
        'MAIORC'#9'10'#9'Maior Nom.'#9'F'
        'MENOR_RC'#9'10'#9'Menor Real'#9'F'
        'PRIMQUA_RC'#9'10'#9'1.Quartil Real'#9'F'
        'MODA_RC'#9'10'#9'Moda Real'#9'F'
        'MEDIA_RC'#9'10'#9'Média Real'#9'F'
        'MEDIANA_RC'#9'10'#9'Mediana Real'#9'F'
        'TERCQUA_RC'#9'10'#9'3.Quartil Real'#9'F'
        'MAIOR_RC'#9'10'#9'Maior Real'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsTendencia
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      Visible = False
      IndicatorColor = icYellow
    end
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 669
    inherited tb97Fundo: TToolbar97
      Left = 414
      DockPos = 414
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
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
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
    object bbtnGrafico: TBitBtn
      Left = 3
      Top = 2
      Width = 75
      Height = 33
      Hint = 'Mostrar os valores em gráfico'
      Caption = '&Gráfico'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnGraficoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object gbxMedia: TGroupBox [2]
    Left = 0
    Top = 309
    Width = 669
    Height = 73
    Align = alBottom
    Caption = 'Média do Mercado'
    TabOrder = 1
    Visible = False
    object Label8: TLabel
      Left = 17
      Top = 33
      Width = 73
      Height = 13
      Caption = 'Salário Nominal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 17
      Top = 52
      Width = 57
      Height = 13
      Caption = 'Salário Real'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 134
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Menor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 193
      Top = 16
      Width = 49
      Height = 13
      Caption = '1.Quartil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 280
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Moda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 347
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Média'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 409
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Mediana'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 478
      Top = 16
      Width = 49
      Height = 13
      Caption = '3.Quartil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 555
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Maior'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblMenor: TLabel
      Left = 115
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMenor'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMenorR: TLabel
      Left = 115
      Top = 52
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMenorR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl1Q: TLabel
      Left = 187
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbl1Q'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl1QR: TLabel
      Left = 187
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbl1QR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblModa: TLabel
      Left = 257
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblModa'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblModaR: TLabel
      Left = 257
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblModaR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMedia: TLabel
      Left = 327
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMedia'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMediaR: TLabel
      Left = 327
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMediaR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMediana: TLabel
      Left = 403
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMediana'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMedianaR: TLabel
      Left = 403
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMedianaR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl3Q: TLabel
      Left = 472
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbl3Q'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbl3QR: TLabel
      Left = 472
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbl3QR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMaior: TLabel
      Left = 532
      Top = 33
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMaior'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblMaiorR: TLabel
      Left = 532
      Top = 51
      Width = 55
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lblMaiorR'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 17
      Top = 17
      Width = 46
      Height = 13
      Caption = 'Freq.Tot.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFreq: TLabel
      Left = 72
      Top = 17
      Width = 41
      Height = 13
      AutoSize = False
      Caption = 'lblFreq'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 163
    Top = 204
  end
  object dsTendencia: TwwDataSource
    DataSet = CdsTendencia
    Left = 91
    Top = 132
  end
  object CdsPesqui: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 17
    Top = 204
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 68
    Top = 204
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 115
    Top = 204
  end
  object CdsTendencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 23
    Top = 132
  end
  object CdsDadosTend: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 307
    Top = 140
  end
end
