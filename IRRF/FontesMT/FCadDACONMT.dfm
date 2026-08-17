inherited frmCadDacon: TfrmCadDacon
  Left = 132
  Top = 72
  BorderStyle = bsSingle
  Caption = 'Demonstrativo de Apuração de Contribuções Sociais'
  ClientHeight = 523
  ClientWidth = 912
  Constraints.MaxHeight = 550
  Constraints.MaxWidth = 920
  Constraints.MinHeight = 550
  Constraints.MinWidth = 920
  FormStyle = fsNormal
  Position = poDesktopCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 81
    Width = 912
    Height = 26
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Demonstrativos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
  end
  inherited Dock971: TDock97
    Top = 484
    Width = 912
    BackgroundOnToolbars = False
    FixAlign = True
    inherited tb97Fundo: TToolbar97
      Left = 662
      DockPos = 662
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 912
    Height = 81
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    object sbtnGeraDacon: TSpeedButton
      Left = 599
      Top = 17
      Width = 100
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Gerar DACON'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF0000FFFF00848484008484
        8400FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
        FF0000FFFF0000FFFF00FF00FF00FF00FF000000000000000000FFFFFF000000
        0000FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
        FF0000FFFF0000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
        000000FFFF0000FFFF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
        FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
        FF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
        FF00FFFFFF000000000000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        0000FFFFFF000000000000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0000FF
        FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
        FF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FFFF00FF00FF00FF00
        FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000FFFF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00
        FF0000FFFF0000FFFF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFF
        FF00848484008484840000FFFF0000FFFF00FF00FF00FF00FF00FF00FF00FF00
        FF0000FFFF0000FFFF00FF00FF00FF00FF0000FFFF0084848400848484008484
        8400FF00FF00FF00FF0000FFFF0000FFFF00FF00FF00FF00FF00FF00FF0000FF
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
      OnClick = sbtnGeraDaconClick
    end
    object sbtnGeraArquivo: TSpeedButton
      Left = 701
      Top = 17
      Width = 100
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Gerar Arquivo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
        88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
        B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
        BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
        BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
        BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
        B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
        8888888778FFFF77888888888777778888888888877777888888}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = sbtnGeraArquivoClick
    end
    object sbtnExcluiDacon: TSpeedButton
      Left = 803
      Top = 17
      Width = 100
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Excluir DACON'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
        FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000840000008400000084000000840000008400FF000000FF000000FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
        FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
        0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
        FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
        FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
        FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
        0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
        FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
        FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
        FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
        FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
        840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
      OnClick = sbtnExcluiDaconClick
    end
    object gbFiltros: TGroupBox
      Left = 8
      Top = 3
      Width = 577
      Height = 72
      Caption = ' Filtros '
      TabOrder = 0
      object lblNumRecibo: TLabel
        Left = 277
        Top = 20
        Width = 106
        Height = 13
        Caption = 'Número do Recibo'
      end
      object sbtnProcurar: TSpeedButton
        Left = 499
        Top = 20
        Width = 71
        Height = 43
        Caption = 'Procurar'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        Layout = blGlyphTop
        OnClick = sbtnProcurarClick
      end
      object Label7: TLabel
        Left = 109
        Top = 20
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object Label8: TLabel
        Left = 173
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Período'
      end
      object lblTipoRelatCad: TLabel
        Left = 8
        Top = 20
        Width = 99
        Height = 13
        Caption = 'Tipo de Relatório'
      end
      object edNumRecibo: TEdit
        Left = 277
        Top = 36
        Width = 108
        Height = 21
        TabOrder = 3
      end
      object cbPeriodo: TComboBox
        Left = 173
        Top = 36
        Width = 97
        Height = 21
        Style = csDropDownList
        DropDownCount = 13
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          'Selecione'
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object edExercicio: TEdit
        Left = 109
        Top = 36
        Width = 57
        Height = 21
        MaxLength = 4
        TabOrder = 1
      end
      object dblcTipoRelatCad: TwwDBLookupCombo
        Left = 10
        Top = 36
        Width = 87
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'20'#9'Descrição'#9'F')
        LookupTable = cdsFiltroTipo
        LookupField = 'Descricao'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcTipoRelatCadChange
      end
      object rgTipo: TRadioGroup
        Left = 389
        Top = 9
        Width = 105
        Height = 56
        Caption = 'Tipo'
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Retificadora')
        TabOrder = 4
        OnClick = rgTipoClick
      end
    end
  end
  object pgDados: TPageControl [3]
    Left = 0
    Top = 107
    Width = 912
    Height = 363
    ActivePage = tbAnalitico
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnChange = pgDadosChange
    object tbSintetico: TTabSheet
      BorderWidth = 5
      Caption = 'Sintético'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 894
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lblReciboSintetico: TLabel
          Left = 0
          Top = 8
          Width = 106
          Height = 13
          Caption = 'Número do Recibo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblReciboRetificadorSintetico: TLabel
          Left = 128
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Recibo Retificador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBaseCalculo: TLabel
          Left = 256
          Top = 8
          Width = 93
          Height = 13
          Caption = 'Base de Cálculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVlrPis: TLabel
          Left = 384
          Top = 8
          Width = 72
          Height = 13
          Caption = 'Valor do PIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVlrCofins: TLabel
          Left = 512
          Top = 8
          Width = 97
          Height = 13
          Caption = 'Valor do COFINS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edReciboSintetico: TEdit
          Left = 0
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edReciboRetificadorSintetico: TEdit
          Left = 128
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edBaseCalc: TEdit
          Left = 256
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edVlrPis: TEdit
          Left = 384
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edVlrCofins: TEdit
          Left = 512
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 284
        Width = 894
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object btnGravar: TBitBtn
          Left = 264
          Top = 9
          Width = 334
          Height = 29
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Gravar Número do Recibo'
          TabOrder = 0
          OnClick = btnGravarClick
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
          Spacing = 20
        end
      end
      object dbGridSintetico: TwwDBGrid
        Left = 0
        Top = 57
        Width = 894
        Height = 227
        Selected.Strings = (
          'NURECIBO'#9'20'#9'N° Recibo'
          'DESCRICAO'#9'78'#9'Descrição'
          'VALOR'#9'15'#9'Valor')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = dbGridSinteticoRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 16632264
        DataSource = dsSintetico
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object tbAnalitico: TTabSheet
      BorderWidth = 5
      Caption = 'Analítico'
      ImageIndex = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 894
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblLinhas: TLabel
          Left = 256
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Linha'
        end
        object lblContaContabil: TLabel
          Left = 648
          Top = 8
          Width = 84
          Height = 13
          Caption = 'Conta Contábil'
        end
        object lblReciboAnalitico: TLabel
          Left = 0
          Top = 8
          Width = 106
          Height = 13
          Caption = 'Número do Recibo'
        end
        object lblReciboRetificadorAnalitico: TLabel
          Left = 128
          Top = 8
          Width = 107
          Height = 13
          Caption = 'Recibo Retificador'
        end
        object edReciboAnalitico: TEdit
          Left = 0
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edReciboRetificadorAnalitico: TEdit
          Left = 128
          Top = 24
          Width = 121
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edContaContabil: TMaskEdit
          Left = 648
          Top = 24
          Width = 164
          Height = 21
          EditMask = '9.9.9.9.99.99.99.99.99.99;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 25
          ParentFont = False
          TabOrder = 2
          OnChange = edContaContabilChange
        end
        object cbxLinha: TComboBox
          Left = 256
          Top = 24
          Width = 385
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnClick = cbxLinhaClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 284
        Width = 894
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblDebito: TLabel
          Left = 547
          Top = 2
          Width = 38
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Débito'
        end
        object lblCredito: TLabel
          Left = 367
          Top = 2
          Width = 41
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Crédito'
        end
        object btnAtualizar: TBitBtn
          Left = 726
          Top = 11
          Width = 161
          Height = 29
          Anchors = [akTop, akRight]
          Caption = 'Atualizar Valores'
          TabOrder = 2
          OnClick = btnAtualizarClick
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
          Spacing = 10
        end
        object edDebito: TEdit
          Left = 547
          Top = 17
          Width = 170
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
        object edCredito: TEdit
          Left = 367
          Top = 17
          Width = 170
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
      object dbGridAnalitico: TwwDBGrid
        Left = 0
        Top = 57
        Width = 894
        Height = 227
        PictureMasks.Strings = (
          'VLRTRANSPORTE'#9'##,##0.00'#9'T'#9'T'
          'VLREMBARQUE'#9'##,##0.00'#9'T'#9'T'
          'VLRDESEMBARQUE'#9'##,##0.00'#9'T'#9'T')
        Selected.Strings = (
          'IDLINHADACON'#9'6'#9'Linha'#9'F'
          'PLACONTA'#9'15'#9'Conta Contábil'#9'F'
          'PLANOME'#9'59'#9'Nome da Conta'#9'F'
          'CREDITO'#9'16'#9'Crédito'#9'F'
          'DEBITO'#9'16'#9'Débito'#9'F'
          'TOTAL'#9'17'#9'TOTAL'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clWhite
        DataSource = dsAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap, dgPerfectRowFit, dgFooter3DCells]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnCalcCellColors = dbGridAnaliticoCalcCellColors
        OnDrawDataCell = dbGridAnaliticoDrawDataCell
        IndicatorColor = icBlack
      end
    end
    object tbInfoAdic: TTabSheet
      Caption = 'Informações Adicionais'
      ImageIndex = 2
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 896
        Height = 335
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 0
        object gbRepresentante: TGroupBox
          Left = 5
          Top = 141
          Width = 886
          Height = 84
          Align = alTop
          Caption = ' Representante da Pessoa Jurídica '
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 24
            Width = 37
            Height = 13
            Caption = 'Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 16
            Top = 40
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 16
            Top = 56
            Width = 106
            Height = 13
            Caption = 'Correio Eletrônico:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNomeRepre: TLabel
            Left = 128
            Top = 24
            Width = 67
            Height = 13
            Caption = 'lblNomeRepre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblTelefoneRepre: TLabel
            Left = 128
            Top = 40
            Width = 81
            Height = 13
            Caption = 'lblTelefoneRepre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblCorreio1Repre: TLabel
            Left = 128
            Top = 56
            Width = 78
            Height = 13
            Caption = 'lblCorreio1Repre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 237
            Top = 40
            Width = 40
            Height = 13
            Caption = 'Ramal:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblRamalRepre: TLabel
            Left = 278
            Top = 40
            Width = 69
            Height = 13
            Caption = 'lblRamalRepre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 368
            Top = 24
            Width = 28
            Height = 13
            Caption = 'CPF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCpfRepre: TLabel
            Left = 480
            Top = 24
            Width = 55
            Height = 13
            Caption = 'lblCpfRepre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFaxRepre: TLabel
            Left = 480
            Top = 40
            Width = 56
            Height = 13
            Caption = 'lblFaxRepre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblCorreio2Repre: TLabel
            Left = 480
            Top = 56
            Width = 78
            Height = 13
            Caption = 'lblCorreio2Repre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label16: TLabel
            Left = 368
            Top = 56
            Width = 106
            Height = 13
            Caption = 'Correio Eletrônico:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 368
            Top = 40
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object gbPessoaJuridica: TGroupBox
          Left = 5
          Top = 5
          Width = 886
          Height = 52
          Align = alTop
          Caption = ' Pessoa Jurídica '
          TabOrder = 1
          object Label12: TLabel
            Left = 16
            Top = 24
            Width = 36
            Height = 13
            Caption = 'CNPJ:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCNPJ: TLabel
            Left = 55
            Top = 24
            Width = 37
            Height = 13
            Caption = 'lblCNPJ'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 248
            Top = 24
            Width = 106
            Height = 13
            Caption = 'Nome Empresarial:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNomeEmpresarial: TLabel
            Left = 360
            Top = 24
            Width = 92
            Height = 13
            Caption = 'lblNomeEmpresarial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object gbResponsavel: TGroupBox
          Left = 5
          Top = 57
          Width = 886
          Height = 84
          Align = alTop
          Caption = ' Responsável pelo Preenchimento '
          TabOrder = 2
          object Label33: TLabel
            Left = 16
            Top = 24
            Width = 37
            Height = 13
            Caption = 'Nome:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblNomeResp: TLabel
            Left = 128
            Top = 24
            Width = 63
            Height = 13
            Caption = 'lblNomeResp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label35: TLabel
            Left = 368
            Top = 24
            Width = 28
            Height = 13
            Caption = 'CPF:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCpfResp: TLabel
            Left = 480
            Top = 24
            Width = 51
            Height = 13
            Caption = 'lblCpfResp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 16
            Top = 40
            Width = 55
            Height = 13
            Caption = 'Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTelefoneResp: TLabel
            Left = 128
            Top = 40
            Width = 77
            Height = 13
            Caption = 'lblTelefoneResp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label39: TLabel
            Left = 237
            Top = 40
            Width = 40
            Height = 13
            Caption = 'Ramal:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblRamalResp: TLabel
            Left = 278
            Top = 40
            Width = 65
            Height = 13
            Caption = 'lblRamalResp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label41: TLabel
            Left = 16
            Top = 56
            Width = 106
            Height = 13
            Caption = 'Correio Eletrônico:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCorreio1Resp: TLabel
            Left = 128
            Top = 56
            Width = 74
            Height = 13
            Caption = 'lblCorreio1Resp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label43: TLabel
            Left = 368
            Top = 56
            Width = 106
            Height = 13
            Caption = 'Correio Eletrônico:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCorreio2Resp: TLabel
            Left = 480
            Top = 56
            Width = 74
            Height = 13
            Caption = 'lblCorreio2Resp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label45: TLabel
            Left = 368
            Top = 40
            Width = 25
            Height = 13
            Caption = 'Fax:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblFaxResp: TLabel
            Left = 480
            Top = 40
            Width = 52
            Height = 13
            Caption = 'lblFaxResp'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 675
    Top = 65531
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object CMSqllAnalitico: TCMSqlParams
    SQL.Strings = (
      'SELECT *'
      '  FROM (SELECT'
      '               LD.IDRELATORIODADOS, '
      '               LD.IDLINHADACON,'
      '               PL.PLACONTA,'
      '               PL.PLANOME,'
      '               SUM(LD.VLRCREDITO) AS CREDITO,'
      '               SUM(LD.VLRDEBITO) AS DEBITO,'
      
        '               ((SUM(LD.VLRCREDITO)) - (SUM(LD.VLRDEBITO))) AS T' +
        'OTAL,'
      '               RDC.NURECIBO'
      '          FROM LINHAS_DACON               LD,'
      '               PLANOSALDO                 PS,'
      '               PLANOCONTA                 PL,'
      '               RELATORIO_DADOS_CADASTRAIS RDC'
      '         WHERE LD.IDRELATORIODADOS = RDC.IDRELATORIODADOS'
      '           AND PS.PEREXERCICIO = '#39'9999'#39
      '           AND PS.PERNUMERO = '#39'99'#39
      '           AND RDC.IDTIPO = '#39'9'#39
      '           AND PS.PLANO = PL.PLANO'
      '           AND PS.PLACONTA = PL.PLACONTA'
      '           AND LD.PLACONTA = PL.PLACONTA'
      '           AND LD.PLACONTA IN'
      '               (SELECT PLACONTA'
      '                  FROM LINHAXCONTACONTABIL LCC'
      
        '                  Join LINHA_RELATORIO LR on LR.IDLINHA = LCC.ID' +
        'LINHA'
      '                 WHERE LR.IDNORMA = 99)'
      
        '         GROUP BY LD.IDRELATORIODADOS,  LD.IDLINHADACON, PL.PLAC' +
        'ONTA, PL.PLANOME, RDC.NURECIBO)'
      ' WHERE TOTAL <> 0'
      ' ')
    ClientDataSet = cdsAnalitico
    Left = 656
    Top = 230
  end
  object cdsSintetico: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 102
    Data = {
      A90000009619E0BD010000001800000006000000000003000000A9000749444C
      494E484108000400000000000749444E4F524D41080004000000000009444553
      43524943414F01004900000001000557494454480200020050000556414C4F52
      080004000000000010494452454C41544F52494F4441444F5308000400000000
      00084E5552454349424F01004900000001000557494454480200020064000100
      044C4349440400010009080000}
    object cdsSinteticoNURECIBO: TStringField
      DisplayLabel = 'N° Recibo'
      DisplayWidth = 20
      FieldName = 'NURECIBO'
      Size = 100
    end
    object cdsSinteticoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 78
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object cdsSinteticoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '###,###,#.00'
    end
    object cdsSinteticoIDLINHA: TFloatField
      FieldName = 'IDLINHA'
      Visible = False
    end
    object cdsSinteticoIDNORMA: TFloatField
      FieldName = 'IDNORMA'
      Visible = False
    end
    object cdsSinteticoIDRELATORIODADOS: TFloatField
      FieldName = 'IDRELATORIODADOS'
      Visible = False
    end
  end
  object dsSintetico: TwwDataSource
    DataSet = cdsSintetico
    Left = 532
    Top = 158
  end
  object cdsAnalitico: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = cdsAnaliticoAfterScroll
    Left = 650
    Top = 100
    Data = {
      F00000009619E0BD010000001800000008000000000003000000F00010494452
      454C41544F52494F4441444F5308000400000000000C49444C494E4841444143
      4F4E080004000000000008504C41434F4E544101004900000002000753554254
      595045020049000A004669786564436861720005574944544802000200120007
      504C414E4F4D4501004900000001000557494454480200020050000743524544
      49544F08000400000000000644454249544F080004000000000005544F54414C
      0800040000000000084E5552454349424F010049000000010005574944544802
      00020064000100044C4349440400010009080000}
    object cdsAnaliticoIDLINHADACON: TFloatField
      Alignment = taCenter
      FieldName = 'IDLINHADACON'
    end
    object cdsAnaliticoPLACONTA: TStringField
      DisplayLabel = 'Conta Contábil'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object cdsAnaliticoPLANOME: TStringField
      DisplayLabel = 'Nome da Conta'
      DisplayWidth = 44
      FieldName = 'PLANOME'
      Size = 80
    end
    object cdsAnaliticoCREDITO: TFloatField
      DisplayLabel = 'Crédito'
      DisplayWidth = 15
      FieldName = 'CREDITO'
      DisplayFormat = '###,###,#0.00'
    end
    object cdsAnaliticoDEBITO: TFloatField
      DisplayLabel = 'Débito'
      DisplayWidth = 15
      FieldName = 'DEBITO'
      DisplayFormat = '###,###,#0.00'
    end
    object cdsAnaliticoTOTAL: TFloatField
      DisplayWidth = 15
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,#0.00'
    end
    object cdsAnaliticoIDRELATORIODADOS: TFloatField
      FieldName = 'IDRELATORIODADOS'
    end
    object cdsAnaliticoNURECIBO: TStringField
      FieldName = 'NURECIBO'
      Size = 100
    end
  end
  object dsAnalitico: TwwDataSource
    DataSet = cdsAnalitico
    Left = 652
    Top = 160
  end
  object cdsInfoAdic: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 110
    Top = 52
  end
  object cdsDadosRelatorio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 354
    Top = 96
  end
  object cdsListaLinhas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 190
    Top = 58
  end
  object dsListaLinhas: TwwDataSource
    DataSet = cdsListaLinhas
    Left = 176
    Top = 238
  end
  object CMSqlSintetico: TCMSqlParams
    SQL.Strings = (
      'SELECT LD.IDLINHA,'
      '       LR.IDNORMA,       '
      '       LR.DESCRICAO,'
      '      (SUM(LD.VLRCREDITO) - SUM(LD.VLRDEBITO)) AS VALOR,'
      '      RDC.IDRELATORIODADOS,'
      'RDC.NURECIBO     '
      '  FROM LINHA_RELATORIO            LR,'
      '       LINHAS_DACON               LD,'
      '       RELATORIO_DADOS_CADASTRAIS RDC'
      ' WHERE LR.IDLINHA = LD.IDLINHA   '
      '   AND LR.IDNORMA = LD.IDNORMA '
      '   AND LD.IDRELATORIODADOS = RDC.IDRELATORIODADOS'
      '   AND RDC.EXERCICIO = '#39'9999'#39
      '   AND RDC.PERIODO = '#39'99'#39
      'GROUP BY LD.IDLINHA,'
      '       LR.IDNORMA,       '
      '       LR.DESCRICAO,'
      '      RDC.IDRELATORIODADOS,'
      'RDC.NURECIBO'
      ' '
      ' ')
    ClientDataSet = cdsSintetico
    Left = 530
    Top = 232
  end
  object cdsFiltroTipo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 322
    Top = 386
    Data = {
      730000009619E0BD010000001800000002000200000003000000540006494454
      49504F08000400000000000944455343524943414F0100490000000100055749
      4454480200020014000100044C43494404000100090800000000000000000000
      F03F054441434F4E00000000000000000040044449504A}
    object cdsFiltroTipoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
    end
    object cdsFiltroTipoIDTIPO: TFloatField
      FieldName = 'IDTIPO'
      Visible = False
    end
  end
  object dsFiltroTipo: TwwDataSource
    DataSet = cdsFiltroTipo
    Left = 262
    Top = 346
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM TIPO_RELATORIO')
    ClientDataSet = cdsFiltroTipo
    Left = 358
    Top = 334
  end
end
