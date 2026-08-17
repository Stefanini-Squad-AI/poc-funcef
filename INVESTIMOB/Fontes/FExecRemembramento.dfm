inherited frmExecRemembramento: TfrmExecRemembramento
  Left = 28
  Top = 56
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Remembramento de Imóveis'
  ClientHeight = 436
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 354
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 322
      Height = 24
      Caption = 'Remembramento de Imóveis [  ]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object ntbPrincipal: TNotebook
      Left = 1
      Top = 32
      Width = 729
      Height = 321
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object wwDBGrid3: TwwDBGrid
          Left = 16
          Top = 192
          Width = 697
          Height = 73
          Selected.Strings = (
            'CONNUMERO'#9'15'#9'Nº Contrato'#9'No'
            'CONNOME'#9'46'#9'Nome Contrato'#9'No'
            'CONDATAINICIO'#9'10'#9'Data Início'#9'No'
            'CONDATAFIM'#9'10'#9'Data Fim'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 4
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object wwDBGrid1: TwwDBGrid
          Left = 16
          Top = 34
          Width = 697
          Height = 119
          Selected.Strings = (
            'CONNUMERO'#9'15'#9'Nº Contrato'#9'No'
            'CONNOME'#9'46'#9'Nome Contrato'#9'No'
            'CONDATAINICIO'#9'10'#9'Data Início'#9'No'
            'CONDATAFIM'#9'10'#9'Data Fim'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          TabOrder = 2
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object btnContinuaSelecao: TfcShapeBtn
          Left = 624
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Continuar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
            BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
            BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          ParentShowHint = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          ShowHint = True
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object Panel1: TPanel
          Left = 16
          Top = 8
          Width = 697
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Imóveis'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnInsert: TfcShapeBtn
            Left = 1
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Inserir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
              8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
              BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
              B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
              B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
              0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
              FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
              BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
              88B888888888888888888888888B888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 0
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
          end
          object btnExclui: TfcShapeBtn
            Left = 78
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Excluir'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 1
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
          end
          object btnTrazer: TfcShapeBtn
            Left = 155
            Top = 1
            Width = 77
            Height = 25
            AllowAllUp = True
            Caption = 'Trazer'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 2
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
            Visible = False
          end
          object btnTotaliza: TfcShapeBtn
            Left = 608
            Top = 1
            Width = 89
            Height = 25
            AllowAllUp = True
            Caption = 'Atualizar'
            Color = clBtnFace
            DitherColor = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              888888888888FFFFFF88888800008888844444488888888F88F7777778F88888
              000024884222222448888877FF788888877F888800002244222222222488887F
              7788FFFFF887F8880000222222AAAAA22248887F888F77777F887F8800002222
              2A88888A2224887F88F7888887F887F80000222228888888A224887F8878F888
              887FF7F80000222222888888A444887FFFF78F88887777880000AAAAAAA88888
              8888887777777888888888880000888888888888888888888888888888FFFFFF
              00008888888888844444488FFFF888888777777F0000A444888888A222224877
              77F888887F88887F0000A2248888888A2222487F878F888887F8887F00008A22
              48888844222248878878FFFF7788887F00008A222444442222224887F8877777
              888FF87F000088A2222222222AA248887FF888888FF77F780000888AA222222A
              A88A8888877FFFFFF7788788000088888AAAAAA8888888888887777778888888
              0000}
            NumGlyphs = 2
            Options = [boFocusable, boFocusRect]
            Offsets.GlyphY = 1
            Offsets.TextDownX = 2
            Offsets.TextDownY = 2
            ParentClipping = True
            ParentFont = False
            RoundRectBias = 25
            ShadeStyle = fbsHighlight
            TabOrder = 3
            TabStop = True
            TextOptions.Alignment = taCenter
            TextOptions.ExtrudeEffects.Depth = 4
            TextOptions.ExtrudeEffects.Orientation = fcTopRight
            TextOptions.VAlignment = vaVCenter
          end
        end
        object Panel2: TPanel
          Left = 16
          Top = 166
          Width = 697
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Bens'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Confirma'
        object btnCancelaLanc: TfcShapeBtn
          Left = 528
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Cancelar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F88888888887F88791919191919088878888888888878F791919191919
            19087F88FFFFFFFFF87F79988888888891087F8777777777F87F791FFFFFFFF8
            19087F8777777777F87F799FFFFFFFF891087F8777777777887F791919191919
            190878F8888888888878879191919191908887F88888888887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object btnContinuaLanc: TfcShapeBtn
          Left = 624
          Top = 280
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 354
    Width = 731
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblProgress: TLabel
      Left = 16
      Top = 8
      Width = 141
      Height = 13
      Caption = 'Processando Relatório...'
      Visible = False
    end
    object lblContador: TLabel
      Left = 624
      Top = 8
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 16
      Top = 24
      Width = 697
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 3
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
