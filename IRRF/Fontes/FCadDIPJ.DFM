inherited frmCadDIPJ: TfrmCadDIPJ
  Left = 264
  Top = 135
  BorderStyle = bsSingle
  Caption = 
    'Declaração de Informações Econômico-fiscais da Pessoa Jurídica -' +
    ' DIPJ'
  ClientHeight = 523
  ClientWidth = 912
  Constraints.MaxHeight = 561
  Constraints.MaxWidth = 928
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
      Caption = 'Gerar DIPJ'
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
      Enabled = False
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
      Caption = 'Excluir DIPJ'
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
      object sbtnProcurar: TSpeedButton
        Left = 500
        Top = 19
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
        Left = 15
        Top = 20
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object Label4: TLabel
        Left = 100
        Top = 20
        Width = 106
        Height = 13
        Caption = 'Número do Recibo'
      end
      object edExercicio: TEdit
        Left = 15
        Top = 36
        Width = 57
        Height = 21
        MaxLength = 4
        TabOrder = 0
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
        TabOrder = 1
        OnClick = rgTipoClick
      end
      object edNumReciboPesq: TMaskEdit
        Left = 100
        Top = 36
        Width = 121
        Height = 21
        EditMask = '00\.00\.00\.00\.00\-00;0;_'
        MaxLength = 17
        TabOrder = 2
      end
    end
  end
  object pgDados: TPageControl [3]
    Left = 0
    Top = 107
    Width = 912
    Height = 338
    ActivePage = tbInfoAdic
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
        object lblTotalAtivo: TLabel
          Left = 4
          Top = 1
          Width = 109
          Height = 13
          Caption = 'Total do Ativo - (A)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTotalPassivo: TLabel
          Left = 179
          Top = 1
          Width = 124
          Height = 13
          Caption = 'Total do Passivo - (P)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblResultado: TLabel
          Left = 357
          Top = 3
          Width = 101
          Height = 13
          Caption = 'Resultado = A - P'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edTotalAtivo: TMaskEdit
          Left = 4
          Top = 17
          Width = 166
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edTotalPassivo: TMaskEdit
          Left = 179
          Top = 17
          Width = 166
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edResultado: TMaskEdit
          Left = 355
          Top = 17
          Width = 166
          Height = 21
          TabStop = False
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object dbGridSintetico: TwwDBGrid
        Left = 0
        Top = 57
        Width = 894
        Height = 243
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = dbGridSinteticoRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 16632264
        DataSource = dsSintetico
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
        TabOrder = 1
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
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lblLinhas: TLabel
          Left = 177
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Linha'
        end
        object lblContaContabil: TLabel
          Left = 19
          Top = 8
          Width = 84
          Height = 13
          Caption = 'Conta Contábil'
        end
        object edContaContabil: TMaskEdit
          Left = 19
          Top = 26
          Width = 143
          Height = 21
          EditMask = '9.9.9.9.99.99.99.99.99.99;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 25
          ParentFont = False
          TabOrder = 0
          OnChange = edContaContabilChange
        end
        object cbxLinha: TComboBox
          Left = 177
          Top = 26
          Width = 335
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          OnClick = cbxLinhaClick
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 247
        Width = 894
        Height = 53
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblDebito: TLabel
          Left = 368
          Top = 2
          Width = 38
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Débito'
        end
        object lblCredito: TLabel
          Left = 546
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
          Left = 368
          Top = 17
          Width = 170
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
        object edCredito: TEdit
          Left = 546
          Top = 17
          Width = 170
          Height = 21
          Anchors = [akTop, akRight]
          TabOrder = 1
        end
      end
      object dbGridAnalitico: TwwDBGrid
        Left = 0
        Top = 54
        Width = 894
        Height = 193
        PictureMasks.Strings = (
          'VLRTRANSPORTE'#9'##,##0.00'#9'T'#9'T'
          'VLREMBARQUE'#9'##,##0.00'#9'T'#9'T'
          'VLRDESEMBARQUE'#9'##,##0.00'#9'T'#9'T')
        Selected.Strings = (
          'PLANOCONTA'#9'18'#9'Conta'#9'F'
          'PLANONOME'#9'62'#9'Descrição'#9'F'
          'DEBITO'#9'19'#9'Débito'#9'F'
          'CREDITO'#9'19'#9'Crédito'#9'F'
          'TOTAL'#9'17'#9'Total'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 16632264
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
        TitleAlignment = taCenter
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
        Width = 904
        Height = 310
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 0
        object gbRepresentante: TGroupBox
          Left = 5
          Top = 141
          Width = 894
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
          Width = 894
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
          Width = 894
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
        object GroupBox1: TGroupBox
          Left = 5
          Top = 225
          Width = 894
          Height = 72
          Align = alTop
          Caption = 'Quantidade de Empregados '
          TabOrder = 3
          object Label6: TLabel
            Left = 12
            Top = 21
            Width = 261
            Height = 13
            Caption = 'Número de Empregados no Início do Período:'
          end
          object Label8: TLabel
            Left = 18
            Top = 45
            Width = 255
            Height = 13
            Caption = 'Número de Empregados no Final do Período:'
          end
          object edQtdEmprIniPer: TEdit
            Left = 278
            Top = 21
            Width = 77
            Height = 19
            BorderStyle = bsNone
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
            Text = '0'
          end
          object edQtdEmprFimPer: TEdit
            Left = 278
            Top = 46
            Width = 77
            Height = 19
            BorderStyle = bsNone
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 1
            Text = '0'
          end
        end
      end
    end
    object tbRendimentos: TTabSheet
      Caption = 'Rendimentos'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 904
        Height = 125
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label13: TLabel
          Left = 83
          Top = 12
          Width = 28
          Height = 13
          Caption = 'CPF:'
        end
        object Label14: TLabel
          Left = 74
          Top = 39
          Width = 37
          Height = 13
          Caption = 'Nome:'
        end
        object Label15: TLabel
          Left = 52
          Top = 92
          Width = 59
          Height = 13
          Caption = 'Cod. R.F.:'
        end
        object Label19: TLabel
          Left = 73
          Top = 65
          Width = 38
          Height = 13
          Caption = 'Cargo:'
        end
        object btnChangeCodRF: TBitBtn
          Left = 540
          Top = 87
          Width = 30
          Height = 21
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnClick = btnChangeCodRFClick
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
        object cbListQualfRF: TComboBox
          Left = 114
          Top = 87
          Width = 419
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbListQualfRFChange
          OnExit = cbListQualfRFExit
        end
        object edNomeDir: TEdit
          Left = 114
          Top = 34
          Width = 647
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object edCPFDir: TMaskEdit
          Left = 114
          Top = 8
          Width = 107
          Height = 21
          EditMask = '999\.999\.999\-99;0'
          MaxLength = 14
          ReadOnly = True
          TabOrder = 3
        end
        object edCargoDir: TEdit
          Left = 114
          Top = 61
          Width = 357
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object edSeq: TEdit
          Left = 872
          Top = 12
          Width = 10
          Height = 21
          ReadOnly = True
          TabOrder = 5
          Text = '0'
          Visible = False
        end
      end
      object dbGridRendimentos: TwwDBGrid
        Left = 0
        Top = 125
        Width = 904
        Height = 185
        PictureMasks.Strings = (
          'VLRTRANSPORTE'#9'##,##0.00'#9'T'#9'T'
          'VLREMBARQUE'#9'##,##0.00'#9'T'#9'T'
          'VLRDESEMBARQUE'#9'##,##0.00'#9'T'#9'T')
        Selected.Strings = (
          'CPF'#9'13'#9'CPF'#9'F'
          'NOME'#9'43'#9'Nome'#9'F'
          'CARGO'#9'20'#9'Cargo'#9'F'
          'IRRF'#9'12'#9'I.R.R.F.'#9'F'
          'RENDIMENTO'#9'15'#9'Rendimento'#9'F'
          'DESCRICAORF'#9'36'#9'Cod. R.F.:'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clWhite
        DataSource = dsGridRendimentos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap, dgPerfectRowFit, dgFooter3DCells]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    object tbInfoPrevSint: TTabSheet
      Caption = 'Informações Previdenciárias'
      ImageIndex = 4
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 904
        Height = 41
        Align = alTop
        TabOrder = 0
      end
      object dbGridInfPrev: TwwDBGrid
        Left = 0
        Top = 41
        Width = 904
        Height = 269
        Selected.Strings = (
          'CODLINHA'#9'10'#9'Cód.'
          'DESCRICAOLINHA'#9'80'#9'Descrição'
          'TOTAL'#9'23'#9'Total')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnRowChanged = dbGridSinteticoRowChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 16632264
        DataSource = dsInfPrev
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
        TabOrder = 1
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
  end
  object Panel5: TPanel [4]
    Left = 0
    Top = 432
    Width = 912
    Height = 52
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    object lblNumRecibo: TLabel
      Left = 515
      Top = 5
      Width = 167
      Height = 13
      Caption = 'Informe o Número do Recibo:'
    end
    object lblReciboSintetico: TLabel
      Left = 22
      Top = 2
      Width = 144
      Height = 13
      Caption = 'Número do Recibo Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 527
      Top = 30
      Width = 151
      Height = 13
      Caption = 'Informe o Data do Recibo:'
    end
    object Label10: TLabel
      Left = 182
      Top = 2
      Width = 128
      Height = 13
      Caption = 'Data do Recibo Inicial'
    end
    object btnGravar: TBitBtn
      Left = 810
      Top = 9
      Width = 82
      Height = 35
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Gravar'
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
      Spacing = 10
    end
    object edNumRecibo: TMaskEdit
      Left = 684
      Top = 3
      Width = 121
      Height = 21
      EditMask = '00\.00\.00\.00\.00\-00;0;_'
      MaxLength = 17
      TabOrder = 1
    end
    object edReciboSintetico: TMaskEdit
      Left = 22
      Top = 18
      Width = 121
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = False
      EditMask = '00\.00\.00\.00\.00\-00;0;_'
      MaxLength = 17
      ReadOnly = True
      TabOrder = 2
    end
    object edDataRecibo: TDateTimePicker
      Left = 684
      Top = 27
      Width = 121
      Height = 21
      CalAlignment = dtaLeft
      Date = 29221.4918509954
      Time = 29221.4918509954
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object edDtRecIni: TEdit
      Left = 182
      Top = 18
      Width = 121
      Height = 21
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 869
    Top = 479
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
      'select'
      '       tp.idTipo                 as IdTipo,'
      '       tp.Descricao              as TipoRelatorio, '
      '       nv.idnorma                as IdNorma, '
      '       nv.Descricao              as Norma, '
      '       nv.DataInicio             as DataInicio, '
      '       nv.datafim                as DataFim, '
      '       lr.idlinha                as IdLinha, '
      '       lr.cod_linha              as CodLinha, '
      '       lr.descricao              as DescricaoLinha, '
      '       na.idNatureza             as IdNatureza,       '
      '       na.descricao              as NaturezaLinha, '
      '       tc.idtipodecategoria      as IdCategoria,'
      '       tc.descricaocategoria     as Categoria,'
      '       lc.placonta               as PlanoConta,'
      '       pla.planome               as PlanoNome,'
      '       sum(PS.PLSDEBITOCORRENTE) as Debito,'
      '       sum(PS.PLSCREDITOCOR)     as Credito,'
      
        '       (sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as To' +
        'tal'
      ''
      'from'
      '       tipo_relatorio       TP,'
      '       Norma_vigente        NV,'
      '       Linha_Relatorio      LR,'
      '       Natureza_Linha       NA,'
      '       TipoDeCategoria      TC,'
      '       linhaxcontacontabil  LC,'
      '       planoconta           PLA,'
      '       planosaldo           PS'
      ' where'
      '     tp.idtipo               = nv.idtipo and'
      '     nv.idnorma              = lr.idnorma and'
      '     lr.idnatureza           = na.idnatureza and'
      '     lr.idtipodecategoria    = tc.idtipodecategoria and'
      '     lr.idlinha              = lc.idlinha and'
      '     lc.plano                = pla.plano and'
      '     lc.placonta             = pla.placonta and'
      '     pla.plano               = ps.plano and'
      '     pla.placonta            = ps.placonta and'
      
        '     (nv.datafim = to_date('#39'30/12/1899'#39', '#39'dd/mm/yyyy'#39') or nv.dat' +
        'afim is null) and'
      '     ps.perexercicio         = '#39'2012'#39' and'
      '     tp.idTipo               = 2 and'
      '     nv.IdNorma              = 2'
      ''
      'group by'
      '       tp.idTipo,'
      '       tp.Descricao,'
      '       nv.idnorma,'
      '       nv.Descricao,'
      '       nv.DataInicio,'
      '       nv.datafim,'
      '       lr.idlinha,'
      '       lr.cod_linha,'
      '       lr.descricao,'
      '       na.idNatureza,'
      '       na.descricao,'
      '       tc.idtipodecategoria,'
      '       tc.descricaocategoria,'
      '       lc.placonta,'
      '       pla.planome'
      ''
      '')
    ClientDataSet = cdsAnalitico
    Left = 102
    Top = 380
  end
  object cdsSintetico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 150
    object cdsSinteticoCODLINHA: TStringField
      DisplayLabel = 'Linha'
      DisplayWidth = 7
      FieldName = 'CODLINHA'
      Size = 10
    end
    object cdsSinteticoDESCRICAOLINHA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 67
      FieldName = 'DESCRICAOLINHA'
      Size = 80
    end
    object cdsSinteticoCATEGORIA: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 13
      FieldName = 'CATEGORIA'
      Size = 10
    end
    object cdsSinteticoTOTAL: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 23
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsSintetico: TwwDataSource
    AutoEdit = False
    DataSet = cdsSintetico
    Left = 72
    Top = 204
  end
  object cdsAnalitico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsAnaliticoAfterScroll
    Left = 96
    Top = 266
    object cdsAnaliticoPLANOCONTA: TStringField
      FieldName = 'PLANOCONTA'
      EditMask = '9.9.9.9.99.99.99.99.99.99;0;'
      FixedChar = True
      Size = 18
    end
    object cdsAnaliticoPLANONOME: TStringField
      FieldName = 'PLANONOME'
      Size = 80
    end
    object cdsAnaliticoDEBITO: TFloatField
      FieldName = 'DEBITO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsAnaliticoCREDITO: TFloatField
      FieldName = 'CREDITO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsAnaliticoTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object dsAnalitico: TwwDataSource
    DataSet = cdsAnalitico
    Left = 106
    Top = 320
  end
  object cdsInfoAdic: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 138
  end
  object cdsDadosRelatorio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 802
    Top = 324
  end
  object cdsListaLinhas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 438
  end
  object dsListaLinhas: TwwDataSource
    DataSet = cdsListaLinhas
    Left = 330
    Top = 474
  end
  object CMSqlSintetico: TCMSqlParams
    SQL.Strings = (
      'select '
      '       tp.idTipo                 as IdTipo,'
      '       tp.Descricao              as TipoRelatorio, '
      '       nv.idnorma                as IdNorma, '
      '       nv.Descricao              as Norma, '
      '       nv.DataInicio             as DataInicio, '
      '       nv.datafim                as DataFim, '
      '       lr.idlinha                as IdLinha, '
      '       lr.cod_linha              as CodLinha, '
      '       lr.descricao              as DescricaoLinha, '
      '       na.idNatureza             as IdNatureza,       '
      '       na.descricao              as NaturezaLinha, '
      '       tc.idtipodecategoria   as IdCategoria,  '
      '       tc.descricaocategoria    as Categoria,'
      '       sum(PS.PLSDEBITOCORRENTE) as Debito,'
      '       sum(PS.PLSCREDITOCOR)     as Credito,'
      
        '       (sum(PS.PLSCREDITOCOR) - sum(PS.PLSDEBITOCORRENTE)) as To' +
        'tal'
      '    '
      'from   '
      '       tipo_relatorio       TP,'
      '       Norma_vigente        NV,'
      '       Linha_Relatorio      LR,'
      '       Natureza_Linha       NA,'
      '       TipoDeCategoria    TC,'
      '       linhaxcontacontabil  LC,'
      '       planoconta           PLA,'
      '       planosaldo           PS'
      ' where '
      '     tp.idtipo               =  nv.idtipo and'
      '     nv.idnorma              =  lr.idnorma and'
      '     lr.idnatureza           =  na.idnatureza and'
      '     lr.idtipodecategoria = tc.idtipodecategoria and'
      '     lr.idlinha              = lc.idlinha and'
      '     lc.plano                = pla.plano and'
      '     lc.placonta             = pla.placonta and'
      '     pla.plano               = ps.plano and'
      '     pla.placonta            = ps.placonta and'
      
        '     (nv.datafim = to_date('#39'30/12/1899'#39', '#39'dd/mm/yyyy'#39') or nv.dat' +
        'afim is null) and'
      '     ps.perexercicio         = '#39'2012'#39' and      '
      '     tp.idTipo               = 2 and'
      '     nv.IdNorma              = 2 '
      '         '
      'group by         '
      '       tp.idTipo,'
      '       tp.Descricao, '
      '       nv.idnorma, '
      '       nv.Descricao, '
      '       nv.DataInicio, '
      '       nv.datafim, '
      '       lr.idlinha,'
      '       lr.cod_linha, '
      '       lr.descricao, '
      '       na.idNatureza,       '
      '       na.descricao, '
      '       tc.idtipodecategoria,  '
      '       tc.descricaocategoria'
      ' '
      'order by  tc.descricaocategoria, lr.cod_linha'
      ' ')
    ClientDataSet = cdsSintetico
    Left = 29
    Top = 250
  end
  object cdsFiltroTipo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 440
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
    Left = 428
    Top = 476
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM TIPO_RELATORIO')
    ClientDataSet = cdsFiltroTipo
    Left = 704
    Top = 334
  end
  object cdsGridRendimentos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsGridRendimentosAfterScroll
    Left = 312
    Top = 204
    object cdsGridRendimentosCPF: TStringField
      FieldName = 'CPF'
      EditMask = '999\.999\.999\-99;0'
      Size = 18
    end
    object cdsGridRendimentosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsGridRendimentosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object cdsGridRendimentosIRRF: TFloatField
      FieldName = 'IRRF'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsGridRendimentosRENDIMENTO: TFloatField
      FieldName = 'RENDIMENTO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsGridRendimentosDESCRICAORF: TStringField
      FieldName = 'DESCRICAORF'
      Size = 80
    end
    object cdsGridRendimentosCODQUALIRF: TFloatField
      FieldName = 'CODQUALIRF'
    end
    object cdsGridRendimentosIDSEQ: TFloatField
      FieldName = 'IDSEQ'
      Visible = False
    end
  end
  object dsGridRendimentos: TwwDataSource
    DataSet = cdsGridRendimentos
    Left = 312
    Top = 270
  end
  object CMSqlParamsRendimentos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  R.CPF CPF, R.NOME NOME, R.CARGO CARGO, R.IRRF IRRF, R.RENDIMEN' +
        'TO RENDIMENTO, Q.DESCRICAORF DESCRICAORF,'
      '  R.CODQUALIRF  CODQUALIRF'
      'FROM '
      '  RENDIMENTOS_DIPJ R, QUALIRF_DIPJ Q'
      'WHERE '
      '  R.CODQUALIRF  = Q.CODQUALIRF  '
      ' ')
    ClientDataSet = cdsGridRendimentos
    Left = 314
    Top = 320
  end
  object dsInfPrev: TwwDataSource
    AutoEdit = False
    DataSet = cdsInfPrev
    Left = 424
    Top = 212
  end
  object cdsInfPrev: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 420
    Top = 156
    Data = {
      B40000009619E0BD010000001800000007000000000003000000B40005494453
      4551080004000000000008494452454349424F08000400000000000749444E4F
      524D4108000400000000000749444C494E4841080004000000000008434F444C
      494E48410100490000000100055749445448020002000A000E44455343524943
      414F4C494E4841010049000000010005574944544802000200500005544F5441
      4C08000400000000000100044C4349440400010009080000}
    object cdsInfPrevCODLINHA: TStringField
      DisplayLabel = 'Cód.'
      DisplayWidth = 10
      FieldName = 'CODLINHA'
      Size = 10
    end
    object cdsInfPrevDESCRICAOLINHA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 80
      FieldName = 'DESCRICAOLINHA'
      Size = 80
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 23
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object qryAuxI: TwwQuery
    ValidateWithMask = True
    Left = 286
    Top = 20
  end
  object CMSqlInfPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT *  FROM CONTRIBPREV_DIPJ')
    ClientDataSet = cdsInfPrev
    Left = 428
    Top = 268
  end
  object cdsPrevCompl: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 512
    Top = 156
  end
  object cdsPrevTot: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 148
  end
  object cdsSinteticoAnoAnt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 808
    Top = 142
  end
  object cdsRendimentosDB: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsGridRendimentosAfterScroll
    Left = 312
    Top = 132
  end
  object cdsRendimentosEDI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsGridRendimentosAfterScroll
    Left = 356
    Top = 40
  end
  object qryHlp: TCMSqlParams
    SQL.Strings = (
      'SELECT *  FROM CONTRIBPREV_DIPJ')
    Left = 668
    Top = 204
  end
end
