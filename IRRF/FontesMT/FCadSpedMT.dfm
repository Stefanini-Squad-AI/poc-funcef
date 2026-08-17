inherited frmCadSpedMT: TfrmCadSpedMT
  Left = 495
  Top = 236
  Caption = 
    'Demonstrativo de Escrituração Fiscal Digital de Contribuições - ' +
    'EFD-Contribuição'
  ClientHeight = 583
  ClientWidth = 906
  Constraints.MinHeight = 621
  Constraints.MinWidth = 922
  PixelsPerInch = 96
  TextHeight = 13
  object Label29: TLabel [0]
    Left = 229
    Top = 19
    Width = 33
    Height = 13
    Caption = 'Base:'
  end
  object Label30: TLabel [1]
    Left = 296
    Top = 19
    Width = 90
    Height = 13
    Caption = '000.000.000,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 906
    Height = 544
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 904
      Height = 81
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 0
      object sbtnExcluiEFD: TSpeedButton
        Left = 790
        Top = 15
        Width = 100
        Height = 49
        Anchors = [akTop, akRight]
        Caption = 'Excluir EFD'
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
        OnClick = sbtnExcluiEFDClick
      end
      object sbtnGerarArquivos: TSpeedButton
        Left = 677
        Top = 14
        Width = 100
        Height = 49
        Anchors = [akTop, akRight]
        Caption = 'Gerar Arquivos'
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
        OnClick = sbtnGerarArquivosClick
      end
      object gbFiltros: TGroupBox
        Left = 8
        Top = 3
        Width = 633
        Height = 72
        Caption = ' Filtros '
        TabOrder = 0
        object Label7: TLabel
          Left = 221
          Top = 20
          Width = 55
          Height = 13
          Caption = 'Exercício'
        end
        object Label8: TLabel
          Left = 301
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
        object sbtnGeraDemonstrativo: TSpeedButton
          Left = 523
          Top = 14
          Width = 100
          Height = 49
          AllowAllUp = True
          Anchors = [akTop, akRight]
          GroupIndex = 1
          Caption = 'Gerar'#13'Demonstrativo'
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
          OnClick = sbtnGeraDemonstrativoClick
        end
        object cbPeriodo: TComboBox
          Left = 301
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
          Left = 221
          Top = 36
          Width = 57
          Height = 21
          MaxLength = 4
          TabOrder = 1
          OnKeyPress = edExercicioKeyPress
        end
        object dblcTipoRelatCad: TwwDBLookupCombo
          Left = 10
          Top = 36
          Width = 183
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'20'#9'Descrição'#9'F')
          LookupTable = cdsFiltroTipo
          LookupField = 'IDTIPO'
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnChange = dblcTipoRelatCadChange
        end
        object rgTipo: TRadioGroup
          Left = 408
          Top = 9
          Width = 105
          Height = 56
          Caption = 'Tipo'
          ItemIndex = 0
          Items.Strings = (
            'Normal'
            'Retificadora')
          TabOrder = 3
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 82
      Width = 904
      Height = 26
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvLowered
      BorderWidth = 1
      Caption = 'Demonstrativos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TabOrder = 1
    end
    object pnlDemonstrativo: TPanel
      Left = 1
      Top = 108
      Width = 904
      Height = 183
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object pnlRecibo: TPanel
        Left = 1
        Top = 141
        Width = 902
        Height = 41
        Align = alBottom
        TabOrder = 0
        object lblNumRecibo: TLabel
          Left = 351
          Top = 2
          Width = 106
          Height = 13
          Caption = 'Número do Recibo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnGravar: TBitBtn
          Left = 676
          Top = 6
          Width = 219
          Height = 28
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
        object edNumRecibo: TMaskEdit
          Left = 352
          Top = 15
          Width = 319
          Height = 21
          EditMask = 
            'aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa.aa\-a;1' +
            ';_'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 61
          ParentFont = False
          TabOrder = 1
          Text = '  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  - '
        end
      end
      object dbGridDemonstra: TwwDBGrid
        Left = 1
        Top = 1
        Width = 902
        Height = 140
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'Exercício'
          'PERIODO'#9'10'#9'Período'
          'NURECIBO'#9'30'#9'Nº Recibo'
          'NURECRETIFICADOR'#9'30'#9'Nº Recibo Retificador'
          'BASECALC'#9'17'#9'Base de Cálculo'
          'VLRPIS'#9'17'#9'Valor PIS'
          'VLRCOFINS'#9'17'#9'Valor COFINS')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = 16632264
        DataSource = dsDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
        ParentFont = False
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object pnlDetalhe: TPanel
      Left = 1
      Top = 291
      Width = 904
      Height = 252
      Align = alClient
      Caption = 'pnlDetalhe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object pgDados: TPageControl
        Left = 1
        Top = 1
        Width = 902
        Height = 250
        ActivePage = tbSintetico
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object tbSintetico: TTabSheet
          BorderWidth = 5
          Caption = 'Sintético'
          object pnlExporta: TPanel
            Left = 0
            Top = 122
            Width = 884
            Height = 90
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object spbExportaDet: TSpeedButton
              Left = 660
              Top = 43
              Width = 221
              Height = 28
              Cursor = crHandPoint
              Hint = 'Exportar dados dos Debitos'
              Caption = 'Exportar para Arquivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                AE060000424DAE06000000000000360000002800000018000000170000000100
                1800000000007806000000000000000000000000000000000000F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0
                A0008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000A0A0A0
                008000A0A0A0008000F0F0F0008000A0A0A0008000F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A000
                8000A0A0A0008000A0A0A0008000F0F0F0008000A0A0A0008000F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0008000A0A0A0008000A0A0A0008000F0F0F0008000A0A0A0008000A0
                A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000F0F0F0008000A0A0
                A0008000A0A0A0008000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000F0F0F0
                008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
                8000F0F0F0008000A0A0A0008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0008000F0F0F0008000A0A0A0008000A0A0A0008000A0A0A0008000A0
                A0A0F0F0F0F0F0F0F0F0F0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0008000A0A0A0008000A0A0A0F0F0F0A0A0
                A0008000A0A0A0008000F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000A0A0A0
                F0F0F0F0F0F0F0F0F0A0A0A0008000A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0
                A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF00
                00FF0000A0A0A0F0F0F0A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0A0A0A0A0A0A0A0A0
                A0000000F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF0000FF0000A0A0A0F0F0F0A0A0A0F0F0F0
                A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0F0F0F00000FF0000FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0
                A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF00
                00FF0000A0A0A0F0F0F0A0A0A0F0F0F00000FF0000FFF0F0F00000FF0000FFF0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0F0F0F0F0F0F0F0F0
                F00000FF0000FFF0F0F0F0F0F0F0F0F0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF0000FF0000A0A0A0F0F0F0A0A0A0F0F0F0
                F0F0F0F0F0F00000FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000FFF0F0F0F0F0F0F0F0F0
                A0A0A0FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000A0A0A0F0F0F00000FF0000FFF0F0F00000FF0000FFF0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0F0F0F00000FF0000
                FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Spacing = 10
              OnClick = spbExportaDetClick
            end
            object btnAtualizaDados: TBitBtn
              Left = 660
              Top = 11
              Width = 221
              Height = 29
              Anchors = [akTop, akRight]
              Caption = 'Atualizar dados'
              TabOrder = 0
              OnClick = btnAtualizaDadosClick
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
            object grbPreviaDemons: TGroupBox
              Left = 0
              Top = 0
              Width = 621
              Height = 86
              Caption = 'Prévia - Demonstrativo'
              TabOrder = 1
              object lblRef: TLabel
                Left = 16
                Top = 19
                Width = 67
                Height = 13
                Caption = 'Referência:'
              end
              object lblReceitas: TLabel
                Left = 222
                Top = 19
                Width = 55
                Height = 13
                Caption = 'Receitas:'
              end
              object lblExclusoes: TLabel
                Left = 446
                Top = 19
                Width = 62
                Height = 13
                Caption = 'Exclusões:'
              end
              object lblBase: TLabel
                Left = 16
                Top = 43
                Width = 76
                Height = 13
                Caption = 'Base Normal:'
              end
              object lblPIS: TLabel
                Left = 222
                Top = 67
                Width = 25
                Height = 13
                Caption = 'PIS:'
              end
              object lblCOFINS: TLabel
                Left = 446
                Top = 67
                Width = 50
                Height = 13
                Caption = 'COFINS:'
              end
              object lblValRef: TLabel
                Left = 87
                Top = 19
                Width = 49
                Height = 13
                Caption = '00/0000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValReceita: TLabel
                Left = 313
                Top = 19
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValExclusao: TLabel
                Left = 513
                Top = 19
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValBase: TLabel
                Left = 107
                Top = 43
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValPIS: TLabel
                Left = 313
                Top = 67
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValCOFINS: TLabel
                Left = 513
                Top = 67
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblBaseAjust: TLabel
                Left = 16
                Top = 67
                Width = 86
                Height = 13
                Caption = 'Base Ajustada:'
              end
              object lblVlrBaseAjust: TLabel
                Left = 107
                Top = 67
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblAcrescimos: TLabel
                Left = 222
                Top = 44
                Width = 69
                Height = 13
                Caption = 'Acréscimos:'
              end
              object lblVlrAcrescimos: TLabel
                Left = 313
                Top = 43
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblReducoes: TLabel
                Left = 446
                Top = 44
                Width = 62
                Height = 13
                Caption = 'Reduções:'
              end
              object lblVlrReducoes: TLabel
                Left = 513
                Top = 44
                Width = 90
                Height = 13
                Alignment = taRightJustify
                Caption = '000.000.000,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
          object dbGridSintetico: TwwDBGrid
            Left = 0
            Top = 0
            Width = 884
            Height = 122
            Selected.Strings = (
              'COD_LINHA'#9'10'#9'Código'
              'DESCRICAO'#9'90'#9'Descrição'
              'VALOR'#9'20'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
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
            Width = 884
            Height = 48
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblLinhas: TLabel
              Left = 312
              Top = 1
              Width = 32
              Height = 13
              Caption = 'Linha'
              Visible = False
            end
            object lblContaContabil: TLabel
              Left = 400
              Top = 1
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object edContaContabil: TMaskEdit
              Left = 400
              Top = 17
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
              TabOrder = 1
              OnChange = edContaContabilChange
            end
            object cbxLinha: TComboBox
              Left = 312
              Top = 17
              Width = 41
              Height = 21
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 0
              Visible = False
              OnClick = cbxLinhaClick
            end
            object grbLinha: TGroupBox
              Left = 2
              Top = -1
              Width = 295
              Height = 46
              Caption = 'Linha'
              TabOrder = 2
              object cmprocLinha: TCMProcura
                Left = 6
                Top = 14
                Width = 283
                Height = 27
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MostraMensagens = True
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                OnValidaDados = cmprocLinhaValidaDados
                LookupChave = 'COD_LINHA'
                LookupDescricao = 'COD_LINHA'
                MontaSelect = MSLinha
                LookupTabela = 'LINHA_RELATORIO'
                DataBaseName = 'BASEDADOS'
                ReadOnly = True
              end
            end
          end
          object pnlAtuValor: TPanel
            Left = 0
            Top = 171
            Width = 884
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object lblDebito: TLabel
              Left = 315
              Top = 2
              Width = 38
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Débito'
            end
            object lblCredito: TLabel
              Left = 135
              Top = 2
              Width = 41
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Crédito'
            end
            object sbtnExportarAnalitico: TSpeedButton
              Left = 660
              Top = 11
              Width = 221
              Height = 28
              Cursor = crHandPoint
              Hint = 'Exportar dados dos Debitos'
              Caption = 'Exportar para Arquivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Glyph.Data = {
                AE060000424DAE06000000000000360000002800000018000000170000000100
                1800000000007806000000000000000000000000000000000000F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0
                A0008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000A0A0A0
                008000A0A0A0008000F0F0F0008000A0A0A0008000F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A000
                8000A0A0A0008000A0A0A0008000F0F0F0008000A0A0A0008000F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0008000A0A0A0008000A0A0A0008000F0F0F0008000A0A0A0008000A0
                A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000F0F0F0008000A0A0
                A0008000A0A0A0008000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000F0F0F0
                008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000
                8000F0F0F0008000A0A0A0008000A0A0A0008000A0A0A0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0008000F0F0F0008000A0A0A0008000A0A0A0008000A0A0A0008000A0
                A0A0F0F0F0F0F0F0F0F0F0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0008000A0A0A0008000A0A0A0F0F0F0A0A0
                A0008000A0A0A0008000F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0008000A0A0A0008000A0A0A0
                F0F0F0F0F0F0F0F0F0A0A0A0008000A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0
                A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF00
                00FF0000A0A0A0F0F0F0A0A0A0F0F0F0A0A0A0A0A0A0A0A0A0000000F0F0F0F0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0A0A0A0A0A0A0A0A0
                A0000000F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF0000FF0000A0A0A0F0F0F0A0A0A0F0F0F0
                A0A0A0A0A0A0A0A0A0000000F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0F0F0F00000FF0000FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0
                A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF00
                00FF0000A0A0A0F0F0F0A0A0A0F0F0F00000FF0000FFF0F0F00000FF0000FFF0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0F0F0F0F0F0F0F0F0
                F00000FF0000FFF0F0F0F0F0F0F0F0F0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0A0A0A0FF0000FF0000A0A0A0F0F0F0A0A0A0F0F0F0
                F0F0F0F0F0F00000FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0F0F0F0F0F0F0F0F0F0F0F0F00000FF0000FFF0F0F0F0F0F0F0F0F0
                A0A0A0FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000A0A0A0F0F0F00000FF0000FFF0F0F00000FF0000FFF0
                F0F0F0F0F0F0F0F0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0
                A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0F0F0F0F0F0F00000FF0000
                FF0000FFF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
                F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0}
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Spacing = 10
              OnClick = sbtnExportarAnaliticoClick
            end
            object btnAtualizar: TBitBtn
              Left = 494
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
            object rVlrDebito: TRealEdit
              Left = 317
              Top = 17
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 13
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object rVlrCredito: TRealEdit
              Left = 138
              Top = 17
              Width = 170
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 13
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
          end
          object dbGridAnalitico: TwwDBGrid
            Left = 0
            Top = 48
            Width = 884
            Height = 123
            Selected.Strings = (
              'COD_LINHA'#9'12'#9'Código'#9'F'
              'PLACONTA'#9'20'#9'Conta Contábil'#9'F'
              'PLANOME'#9'59'#9'Nome da Conta'#9'F'
              'VLRCREDITO'#9'19'#9'Crédito'#9'F'
              'VLRDEBITO'#9'19'#9'Débito'#9'F'
              'TOTAL'#9'19'#9'Total'#9'F')
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
            IndicatorColor = icBlack
          end
        end
        object tbInfoAdic: TTabSheet
          Caption = 'Informações Adicionais'
          ImageIndex = 2
          object TPanel
            Left = 0
            Top = 0
            Width = 894
            Height = 222
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 5
            TabOrder = 0
            object pgDetalhes: TPageControl
              Left = 5
              Top = 5
              Width = 884
              Height = 212
              ActivePage = tsDadosIniciais
              Align = alClient
              TabOrder = 0
              object tsDadosIniciais: TTabSheet
                Caption = '   Dados Iniciais   '
                ImageIndex = 2
                object Label2: TLabel
                  Left = 15
                  Top = 9
                  Width = 167
                  Height = 13
                  Caption = 'Qualificação Pessoa Jurídica'
                end
                object Label4: TLabel
                  Left = 15
                  Top = 47
                  Width = 109
                  Height = 13
                  Caption = 'Situação Tributária'
                end
                object Label5: TLabel
                  Left = 15
                  Top = 87
                  Width = 185
                  Height = 13
                  Caption = 'Incidência Tributária no Período'
                end
                object Label6: TLabel
                  Left = 509
                  Top = 87
                  Width = 195
                  Height = 13
                  Caption = 'Método de Apropriação de Crédito'
                end
                object Label9: TLabel
                  Left = 509
                  Top = 9
                  Width = 188
                  Height = 13
                  Caption = 'Tipo de Atividade Preponderante'
                end
                object Label10: TLabel
                  Left = 509
                  Top = 47
                  Width = 89
                  Height = 13
                  Caption = 'Nº do Processo'
                end
                object Label11: TLabel
                  Left = 656
                  Top = 47
                  Width = 114
                  Height = 13
                  Caption = 'Origem do Processo'
                end
                object Label13: TLabel
                  Left = 509
                  Top = 127
                  Width = 203
                  Height = 13
                  Caption = 'Critério de Escrituração e Apuração'
                end
                object Label14: TLabel
                  Left = 15
                  Top = 127
                  Width = 170
                  Height = 13
                  Caption = 'Tipo de Contribuição Apurada'
                end
                object dbeProcesso: TwwDBEdit
                  Left = 510
                  Top = 63
                  Width = 114
                  Height = 21
                  Color = clWhite
                  DataField = 'NUMPROCESSO'
                  DataSource = dsEfdDetalhe
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dblcQualificaPJ: TComboBox
                  Tag = 1
                  Left = 17
                  Top = 24
                  Width = 423
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 0
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcSitTributaria: TComboBox
                  Tag = 3
                  Left = 17
                  Top = 63
                  Width = 363
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 2
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcIncidencia: TComboBox
                  Tag = 5
                  Left = 17
                  Top = 102
                  Width = 363
                  Height = 21
                  TabStop = False
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 5
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcTipoContrib: TComboBox
                  Tag = 7
                  Left = 17
                  Top = 141
                  Width = 423
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 7
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcApuraCredito: TComboBox
                  Tag = 6
                  Left = 510
                  Top = 103
                  Width = 350
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 6
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcCritEscritura: TComboBox
                  Tag = 8
                  Left = 510
                  Top = 141
                  Width = 350
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 8
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcOriProcesso: TComboBox
                  Tag = 4
                  Left = 657
                  Top = 62
                  Width = 202
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 4
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dblcTipoAtiv: TComboBox
                  Tag = 2
                  Left = 510
                  Top = 23
                  Width = 350
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 1
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
              end
              object tsInstituicao: TTabSheet
                Caption = '          Dados da Instituição            '
                ImageIndex = 1
                object btnAtuDadosPJ: TSpeedButton
                  Left = 671
                  Top = 7
                  Width = 196
                  Height = 28
                  Cursor = crHandPoint
                  Anchors = [akTop, akRight]
                  Caption = 'Atualizar Pessoa Jurídica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000C40E0000C40E00000001000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A6000020400000206000002080000020A0000020C0000020E000004000000040
                    20000040400000406000004080000040A0000040C0000040E000006000000060
                    20000060400000606000006080000060A0000060C0000060E000008000000080
                    20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                    200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                    200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                    200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                    20004000400040006000400080004000A0004000C0004000E000402000004020
                    20004020400040206000402080004020A0004020C0004020E000404000004040
                    20004040400040406000404080004040A0004040C0004040E000406000004060
                    20004060400040606000406080004060A0004060C0004060E000408000004080
                    20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                    200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                    200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                    200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                    20008000400080006000800080008000A0008000C0008000E000802000008020
                    20008020400080206000802080008020A0008020C0008020E000804000008040
                    20008040400080406000804080008040A0008040C0008040E000806000008060
                    20008060400080606000806080008060A0008060C0008060E000808000008080
                    20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                    200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                    200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                    200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                    2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                    2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                    2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                    2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                    2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                    2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                    2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070000
                    0000000000000000000007070707FFFFFFFFFFFFFFFFFFFFFF0007070707FFFF
                    0000FF00000000FFFF0007070707FFFFFFFFFFFFFFFFFFFFFF0000FBFBFBFB00
                    0000FF00FFFF0000FF0000FBFBFBFBFBFBFF00FF0000FFFFFF0000FBFBFBFB00
                    00000000FB00FF00FF0000FBFBFBFBFBFBFBFBFB00FFFFFFFF0000FBFB000000
                    00000000FF000000FF000000FBFBFB0000FB00FFFFFFFFFFFF00070700000000
                    FB00FFFFFFFF000000000707070700FB00FFFFFFFFFF00FF000707070700FB00
                    FFFFFFFFFFFF00000707070700FB0000000000000000000707070700F9000707
                    0707070707070707070707070007070707070707070707070707}
                  ParentFont = False
                  Spacing = 10
                  OnClick = btnAtuDadosPJClick
                end
                object gbPessoaJuridica: TGroupBox
                  Left = 5
                  Top = 1
                  Width = 660
                  Height = 42
                  Caption = ' Pessoa Jurídica '
                  TabOrder = 0
                  object Label12: TLabel
                    Left = 487
                    Top = 20
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
                  object lblNomeEmpresa: TLabel
                    Left = 8
                    Top = 20
                    Width = 80
                    Height = 13
                    Caption = 'Razão Social:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtRazao: TDBText
                    Left = 93
                    Top = 20
                    Width = 378
                    Height = 13
                    DataField = 'RAZAOSOCIAL'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbtCNPJ: TDBText
                    Left = 529
                    Top = 20
                    Width = 111
                    Height = 13
                    DataField = 'CNPJPESJUR'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                end
                object ckbDadosPadrao: TCheckBox
                  Left = 7
                  Top = 45
                  Width = 325
                  Height = 17
                  Caption = 'Exibir dados padrão de preenchimento da Fundação'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                  OnClick = ckbDadosPadraoClick
                end
                object pnlResponsavel: TPanel
                  Left = 5
                  Top = 66
                  Width = 868
                  Height = 117
                  BevelInner = bvLowered
                  BevelOuter = bvNone
                  TabOrder = 2
                  object Label25: TLabel
                    Left = 174
                    Top = 55
                    Width = 85
                    Height = 13
                    Caption = 'CRC Contador:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label32: TLabel
                    Left = 10
                    Top = 55
                    Width = 28
                    Height = 13
                    Caption = 'CPF:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label1: TLabel
                    Left = 10
                    Top = 76
                    Width = 55
                    Height = 13
                    Caption = 'Telefone:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label36: TLabel
                    Left = 10
                    Top = 97
                    Width = 106
                    Height = 13
                    Caption = 'Correio Eletrônico:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label3: TLabel
                    Left = 10
                    Top = 7
                    Width = 190
                    Height = 13
                    Caption = 'Responsável pelo Preenchimento'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtCPF: TDBText
                    Left = 41
                    Top = 55
                    Width = 111
                    Height = 13
                    DataField = 'CPF_CONTADOR'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbtEmail: TDBText
                    Left = 121
                    Top = 97
                    Width = 288
                    Height = 13
                    DataField = 'EMAIL'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbtFone: TDBText
                    Left = 71
                    Top = 76
                    Width = 90
                    Height = 13
                    DataField = 'TELEFONE'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label15: TLabel
                    Left = 457
                    Top = 7
                    Width = 55
                    Height = 13
                    Caption = 'Endereço'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label16: TLabel
                    Left = 458
                    Top = 55
                    Width = 19
                    Height = 13
                    Caption = 'Nº:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtNumero: TDBText
                    Left = 480
                    Top = 55
                    Width = 111
                    Height = 13
                    DataField = 'NUMERO'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label17: TLabel
                    Left = 458
                    Top = 76
                    Width = 38
                    Height = 13
                    Caption = 'Bairro:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label18: TLabel
                    Left = 458
                    Top = 97
                    Width = 61
                    Height = 13
                    Caption = 'Município:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtBairro: TDBText
                    Left = 500
                    Top = 76
                    Width = 229
                    Height = 13
                    DataField = 'BAIRRO'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbtCidade: TDBText
                    Left = 523
                    Top = 97
                    Width = 214
                    Height = 13
                    DataField = 'CIDADE'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object dbtCompl: TDBText
                    Left = 650
                    Top = 55
                    Width = 199
                    Height = 13
                    DataField = 'COMPLEMENTO'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label19: TLabel
                    Left = 604
                    Top = 55
                    Width = 43
                    Height = 13
                    Caption = 'Compl.:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label20: TLabel
                    Left = 745
                    Top = 76
                    Width = 29
                    Height = 13
                    Caption = 'CEP:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtCEP: TDBText
                    Left = 778
                    Top = 76
                    Width = 79
                    Height = 13
                    DataField = 'CEP'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label21: TLabel
                    Left = 753
                    Top = 97
                    Width = 21
                    Height = 13
                    Caption = 'UF:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbtUF: TDBText
                    Left = 778
                    Top = 97
                    Width = 41
                    Height = 13
                    DataField = 'UF'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object PResponsavel: TCMProcura
                    Left = 10
                    Top = 22
                    Width = 366
                    Height = 27
                    Cursor = crHandPoint
                    Hint = 'Responsavel'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MostraMensagens = True
                    Mensagens.EmBranco = 'Chave não pode estar em branco'
                    Mensagens.NaoExiste = 'Chave não existe'
                    PermiteChaveInvalida = False
                    PermiteChaveEmBranco = False
                    OnValidaDados = PResponsavelValidaDados
                    DataSource = dsEfdDetalhe
                    DataField = 'IDCONTADOR'
                    LookupChave = 'IDPESSOA'
                    LookupDescricao = 'NOME'
                    MontaSelect = MSResp
                    LookupTabela = 'PESSOA'
                    DataBaseName = 'BaseDados'
                    ReadOnly = True
                  end
                  object dbeCRC: TwwDBEdit
                    Left = 263
                    Top = 51
                    Width = 114
                    Height = 21
                    Color = clWhite
                    DataField = 'CRC'
                    DataSource = dsEfdDetalhe
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 1
                    UnboundDataType = wwDefault
                    WantReturns = False
                    WordWrap = False
                  end
                  object TEndereco: TCMProcura
                    Left = 457
                    Top = 22
                    Width = 400
                    Height = 27
                    Cursor = crHandPoint
                    Hint = 'Endereço'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clNavy
                    Font.Height = -9
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    MostraMensagens = True
                    Mensagens.EmBranco = 'Chave não pode estar em branco'
                    Mensagens.NaoExiste = 'Chave não existe'
                    PermiteChaveInvalida = False
                    PermiteChaveEmBranco = False
                    OnValidaDados = TEnderecoValidaDados
                    DataSource = dsEfdDetalhe
                    DataField = 'IDENDPESS'
                    LookupChave = 'IDENDERECO'
                    LookupDescricao = 'NOME'
                    MontaSelect = MSEnd
                    LookupTabela = 'ENDPESS'
                    DataBaseName = 'BaseDados'
                    ReadOnly = True
                  end
                end
              end
              object tsInfoJud: TTabSheet
                Caption = '      Informações Judiciais      '
                ImageIndex = 2
                object Label22: TLabel
                  Left = 14
                  Top = 6
                  Width = 136
                  Height = 13
                  Caption = 'Nº do Processo Judicial'
                end
                object Label23: TLabel
                  Left = 365
                  Top = 6
                  Width = 103
                  Height = 13
                  Caption = 'Natureza da Ação'
                end
                object Label24: TLabel
                  Left = 14
                  Top = 48
                  Width = 95
                  Height = 13
                  Caption = 'Seção Judiciária'
                end
                object Label26: TLabel
                  Left = 365
                  Top = 48
                  Width = 27
                  Height = 13
                  Caption = 'Vara'
                end
                object Label27: TLabel
                  Left = 14
                  Top = 92
                  Width = 287
                  Height = 13
                  Caption = 'Descrição Resumida da Decisão Judicial Proferida'
                end
                object Label28: TLabel
                  Left = 538
                  Top = 48
                  Width = 104
                  Height = 13
                  Caption = 'Data da Sentença'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dbeProcJud: TwwDBEdit
                  Left = 15
                  Top = 22
                  Width = 298
                  Height = 21
                  Color = clWhite
                  DataField = 'NUMPROCJUD'
                  DataSource = dsEfdDetalhe
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeSecaoJud: TwwDBEdit
                  Left = 15
                  Top = 64
                  Width = 299
                  Height = 21
                  Color = clWhite
                  DataField = 'SECAOJUD'
                  DataSource = dsEfdDetalhe
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dbeVara: TwwDBEdit
                  Left = 365
                  Top = 64
                  Width = 114
                  Height = 21
                  Color = clWhite
                  DataField = 'VARA'
                  DataSource = dsEfdDetalhe
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
                object dtDataSentenca: TCMDateTimePicker
                  Left = 538
                  Top = 64
                  Width = 119
                  Height = 21
                  Cursor = crHandPoint
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATASENTENCA'
                  DataSource = dsEfdDetalhe
                  Epoch = 1950
                  ButtonGlyph.Data = {
                    06050000424D06050000000000003604000028000000100000000D0000000100
                    080000000000D000000000000000000000000001000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A6000020400000206000002080000020A0000020C0000020E000004000000040
                    20000040400000406000004080000040A0000040C0000040E000006000000060
                    20000060400000606000006080000060A0000060C0000060E000008000000080
                    20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                    200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                    200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                    200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                    20004000400040006000400080004000A0004000C0004000E000402000004020
                    20004020400040206000402080004020A0004020C0004020E000404000004040
                    20004040400040406000404080004040A0004040C0004040E000406000004060
                    20004060400040606000406080004060A0004060C0004060E000408000004080
                    20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                    200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                    200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                    200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                    20008000400080006000800080008000A0008000C0008000E000802000008020
                    20008020400080206000802080008020A0008020C0008020E000804000008040
                    20008040400080406000804080008040A0008040C0008040E000806000008060
                    20008060400080606000806080008060A0008060C0008060E000808000008080
                    20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                    200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                    200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                    200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                    2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                    2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                    2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                    2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                    2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                    2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                    2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                    000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                    A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                    FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                    04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                    000000000000000000FF}
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 4
                  DisplayFormat = 'DD/MM/YYYY'
                end
                object dblcNatAcao: TComboBox
                  Tag = 9
                  Left = 365
                  Top = 22
                  Width = 451
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 1
                  OnChange = dblcQualificaPJChange
                  OnDropDown = CombosDropDown
                  OnKeyPress = dblcQualificaPJKeyPress
                end
                object dbmDecisao: TwwDBRichEdit
                  Left = 16
                  Top = 111
                  Width = 849
                  Height = 68
                  AutoURLDetect = False
                  DataField = 'DESCRICAOJUD'
                  DataSource = dsEfdDetalhe
                  MaxLength = 100
                  PrintJobName = 'Delphi 5'
                  TabOrder = 5
                  EditorCaption = 'Edit Rich Text'
                  EditorPosition.Left = 0
                  EditorPosition.Top = 0
                  EditorPosition.Width = 0
                  EditorPosition.Height = 0
                  MeasurementUnits = muInches
                  PrintMargins.Top = 1
                  PrintMargins.Bottom = 1
                  PrintMargins.Left = 1
                  PrintMargins.Right = 1
                  RichEditVersion = 2
                  Data = {
                    750000007B5C727466315C616E73695C616E7369637067313235325C64656666
                    305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
                    4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
                    5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
                end
              end
              object tsDadosContrib: TTabSheet
                Caption = '   Dados Para Contribuição   '
                ImageIndex = 3
                object lbltpContrib: TLabel
                  Left = 21
                  Top = 23
                  Width = 181
                  Height = 13
                  Caption = 'Tipo Contibuição PIS/CONFINS'
                end
                object lblcodRFbPis: TLabel
                  Left = 21
                  Top = 79
                  Width = 100
                  Height = 13
                  Caption = 'Código RFB - PIS'
                end
                object lblCodContAp: TLabel
                  Left = 395
                  Top = 23
                  Width = 166
                  Height = 13
                  Caption = 'Código Contribuição Apurada'
                end
                object lblCodRFbConfins: TLabel
                  Left = 395
                  Top = 79
                  Width = 134
                  Height = 13
                  Caption = 'Código RFB - CONFINS'
                end
                object cbbtpContrib: TComboBox
                  Tag = 1
                  Left = 21
                  Top = 39
                  Width = 280
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = SetaCodRFBPisConfins
                  OnDropDown = CombosDropDown
                  Items.Strings = (
                    '08 - Valor da contribuição não-cumulativa a recolher'
                    '12 - Valor da contribuição cumulativa a recolher')
                end
                object cbbcodRFbPis: TComboBox
                  Tag = 1
                  Left = 21
                  Top = 93
                  Width = 280
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 1
                  OnChange = dblcCodRFBChange
                  OnDropDown = CombosDropDown
                end
                object cbbCodContAp: TComboBox
                  Tag = 1
                  Left = 395
                  Top = 39
                  Width = 280
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 2
                  OnChange = SetaCodRFBPisConfins
                  OnDropDown = CombosDropDown
                  Items.Strings = (
                    '01 - Contribuição não-cumulativa apurada a alíquota básica'
                    
                      '02 - Contribuição não-cumulativa apurada a alíquotas diferenciad' +
                      'as'
                    
                      '03 - Contribuição não-cumulativa apurada a alíquota por unidade ' +
                      'de medida de produto'
                    
                      '04 - Contribuição não-cumulativa apurada a alíquota básica - Ati' +
                      'vidade Imobiliária'
                    '31 - Contribuição apurada por substituição tributária'
                    
                      '32 - Contribuição apurada por substituição tributária - Vendas à' +
                      ' Zona Franca de Manaus'
                    '51 - Contribuição cumulativa apurada a alíquota básica'
                    '52 - Contribuição cumulativa apurada a alíquotas diferenciadas'
                    
                      '53 - Contribuição cumulativa apurada a alíquota por unidade de m' +
                      'edida de produto'
                    
                      '54 - Contribuição cumulativa apurada a alíquota básica - Ativida' +
                      'de Imobiliária'
                    '71 - Contribuição apurada de SCP - Incidência Não Cumulativa'
                    '72 - Contribuição apurada de SCP - Incidência Cumulativa'
                    '99 - Contribuição para o PIS/Pasep - Folha de Salários')
                end
                object cbbCodRFbConfins: TComboBox
                  Tag = 2
                  Left = 395
                  Top = 93
                  Width = 280
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 0
                  TabOrder = 3
                  OnChange = dblcCodRFBChange
                  OnDropDown = CombosDropDown
                end
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 544
    Width = 906
    inherited tb97Fundo: TToolbar97
      Left = 656
      DockPos = 656
      inherited sep1: TToolbarSep97
        Left = 162
      end
      inherited bbtnSair: TBitBtn
        Left = 81
        ParentFont = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        Width = 82
      end
      object btnCancelar: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 2
        OnClick = btnCancelarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 851
    Top = 123
    TargetsData = (
      1
      4
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object cdsFiltroTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 106
    Top = 58
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
    Left = 46
    Top = 58
  end
  object dsSintetico: TwwDataSource
    DataSet = cdsSintetico
    Left = 292
    Top = 166
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
    Left = 292
    Top = 216
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
    Left = 384
    Top = 214
  end
  object dsAnalitico: TwwDataSource
    DataSet = cdsAnalitico
    Left = 388
    Top = 168
  end
  object cdsDemonstra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsDemonstraAfterOpen
    AfterScroll = cdsDemonstraAfterScroll
    Left = 204
    Top = 118
  end
  object dsDemonstra: TwwDataSource
    DataSet = cdsDemonstra
    Left = 204
    Top = 166
  end
  object CMSqlDemonstra: TCMSqlParams
    SQL.Strings = (
      'SELECT DET.IDCODDETALHE,     '
      '       DET.CODQUALIPESJUR,   '
      '       DET.CODATIVIDADE,     '
      '       DET.CODSITTRIB,       '
      '       DET.NUMPROCESSO,      '
      '       DET.CODORIGEMPROCESSO,'
      '       DET.CODINCIDTRIB,     '
      '       DET.CODAPROPCRED,     '
      '       DET.CODCRITESCRIT,    '
      '       DET.CODCONTRIBAPUR,   '
      '       DET.IDFUNDACAO,       '
      '       FND.RAZAOSOCIAL,      '
      '       DET.CNPJPESJUR,       '
      '       DET.IDCONTADOR,       '
      '       PES.NOME AS CONTADOR, '
      '       DET.CPF_CONTADOR,     '
      '       DET.CRC,              '
      '       DET.TELEFONE,         '
      '       DET.EMAIL,            '
      '       DET.IDENDPESS,        '
      '       ED.NOME      AS ENDERECO,    '
      '       ED.NUMERO    AS NUMERO,      '
      '       '#39'  '#39'        AS COMPLEMENTO,'
      '       ED.BAIRRO    AS BAIRRO,      '
      '       ED.CEP       AS CEP,        '
      '       CID.NOME      AS CIDADE,     '
      '       ED.CODESTADO AS UF,   '
      '       DET.NUMPROCJUD,       '
      '       DET.NATUREZAACAO,     '
      '       DET.SECAOJUD,         '
      '       DET.VARA,             '
      '       DET.DATASENTENCA,     '
      '       DET.DESCRICAOJUD      '
      '  FROM DADOS_EFD_CONTRIB_DETALHE DET,'
      '       ENDPESS ED,                  '
      '       CIDADES CID,                  '
      '       PESSOA PES, PESSOA FND       '
      ' WHERE CID.IDCIDADES = ED.IDCIDADES '
      '   AND ED.IDENDERECO  = DET.IDENDPESS '
      '   AND FND.IDPESSOA  = DET.IDFUNDACAO '
      '   AND PES.IDPESSOA  = DET.IDCONTADOR '
      '   AND DET.IDRELATORIODADOS = -1')
    Left = 202
    Top = 216
  end
  object cdsSitTributo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 756
    Top = 402
  end
  object cdsIncidencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 756
    Top = 450
  end
  object cdsTipoContrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 756
    Top = 498
  end
  object cdsTipoAtividade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 852
    Top = 354
  end
  object cdsOriProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 844
    Top = 402
  end
  object cdsApropriaCred: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 804
    Top = 458
  end
  object cdsEscrituraApura: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 828
    Top = 498
  end
  object cdsNaturezaAcao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 700
    Top = 490
  end
  object cdsEfdDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 498
    Top = 116
  end
  object dsEfdDetalhe: TwwDataSource
    DataSet = cdsEfdDetalhe
    Left = 500
    Top = 168
  end
  object cdsResponsavel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 108
    Top = 166
  end
  object cdsPesJur: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 166
  end
  object cdsSintetico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsSinteticoAfterOpen
    Left = 292
    Top = 118
  end
  object cdsAnalitico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsAnaliticoAfterOpen
    Left = 388
    Top = 118
  end
  object qeDadosSinteticos: TQExport3Dialog
    ShowPrintAfter = False
    DataSet = cdsSintetico
    AllowedExports = [aeXLS]
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.MarginLeft = 1.17
    PDFOptions.PageOptions.MarginRight = 0.57
    PDFOptions.PageOptions.MarginTop = 0.78
    PDFOptions.PageOptions.MarginBottom = 0.78
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    Left = 705
    Top = 196
  end
  object MSPessJur: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME'
      'P.RAZAOSOCIAL'
      'P.NUMDOCUMENTO'
      'F.CODCORRESP'
      'P.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Razão Social'
      'Número do Documento'
      'Código Correspondente'
      'Identificador')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'EMPRESAFORN EF'
      'FORNSERV F')
    CamposChave.Strings = (
      'P.IDPESSOA')
    Filtro.Strings = (
      'P.IDPESSOA=EF.IDFORCLI'
      'P.IDPESSOA=F.IDPESSOA'
      '(EF.FLGSTATUS = '#39'A'#39' OR EF.FLGSTATUS IS NULL)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '20'
      '20'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '0'
      '0'
      '0'
      '0'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 822
    Top = 308
  end
  object MSEnd: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UPPER(ENDPESS.NOME)')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Endereço')
    SensivelACaixa.Strings = (
      '')
    Tabelas.Strings = (
      'PESSOA '
      'ENDPESS')
    CamposChave.Strings = (
      'ENDPESS.IDENDERECO')
    Filtro.Strings = (
      'ENDPESS.IDPESSOA = PESSOA.IDPESSOA'
      'PESSOA.IDPESSOA = :IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    OperComparador.Strings = (
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MSEndBeforeOpenCds
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 674
    Top = 305
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA '
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 738
    Top = 305
  end
  object cdsEndereco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsAnaliticoAfterOpen
    Left = 604
    Top = 118
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 692
    Top = 126
  end
  object cdsQualificaPJ: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 756
    Top = 354
  end
  object cdsRFbPis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 462
  end
  object cdsRFbConfins: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 502
  end
  object MSLinha: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'LR.COD_LINHA'
      'LXC.PLACONTA'
      'PC.PLANOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Linha'
      'Conta Contábil'
      'Nome da Conta')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LINHA_RELATORIO LR'
      'LINHAXCONTACONTABIL LXC'
      'PLANOCONTA PC')
    CamposChave.Strings = (
      'LR.COD_LINHA'
      'LXC.PLACONTA')
    Filtro.Strings = (
      'LR.IDLINHA = LXC.IDLINHA'
      'LXC.PLANO = PC.PLANO'
      'TRIM(LXC.PLACONTA) = TRIM(PC.PLACONTA)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '18'
      '50')
    OperComparador.Strings = (
      '0'
      '0'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 371
    Top = 366
  end
  object qeDadosAnaliticos: TQExport3Dialog
    ShowPrintAfter = False
    DataSet = cdsAnalitico
    AllowedExports = [aeXLS]
    ExportedFields.Strings = (
      'COD_LINHA'
      'PLACONTA'
      'PLANOME'
      'CATEGORIA'
      'VLRCREDITO'
      'VLRDEBITO'
      'TOTAL')
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.MarginLeft = 1.17
    PDFOptions.PageOptions.MarginRight = 0.57
    PDFOptions.PageOptions.MarginTop = 0.78
    PDFOptions.PageOptions.MarginBottom = 0.78
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    XLSOptions.Pictures = <>
    XLSOptions.Images = <>
    XLSOptions.Cells = <>
    XLSOptions.MergedCells = <>
    Left = 801
    Top = 196
  end
end
