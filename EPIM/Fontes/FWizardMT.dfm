inherited frmWizardMT: TfrmWizardMT
  Left = 163
  Top = 184
  Caption = 'frmWizardMT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object PagControle: TPageControl
      Left = 5
      Top = 5
      Width = 578
      Height = 224
      ActivePage = tabSelecao
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      OnChange = PagControleChange
      object tabSelecao: TTabSheet
        Caption = 'tabSelecao'
        TabVisible = False
        object lblTitulo: TfcLabel
          Left = 0
          Top = 0
          Width = 570
          Height = 24
          Align = alTop
          Caption = 'Nome do Formulário [ página 1]'
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
      end
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        ImageIndex = 1
        TabVisible = False
        object fcLabel1: TfcLabel
          Left = 0
          Top = 0
          Width = 317
          Height = 24
          Align = alTop
          Caption = 'Nome do Formulário [ página 2]'
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
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 172
      inherited sep1: TToolbarSep97
        Left = 330
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 247
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object sepVoltar: TToolbarSep97 [2]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object sepContinuar: TToolbarSep97 [3]
        Left = 164
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 249
        Width = 81
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 332
      end
      object btnContinuar: TfcShapeBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 33
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
        OnClick = btnContinuarClick
      end
      object btnVoltar: TfcShapeBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Voltar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F8888878F7FBBB00BBBBB
          BB087F88877FFFFFF87F7FBB00000000BB087F8877777777F87F7FB000000000
          BB087F8777777777F87F7FBB00000000BB087F8877777777887F7FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
        TabOrder = 3
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
        OnClick = btnVoltarClick
      end
      object btnConfirmar: TfcShapeBtn
        Left = 166
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Confirmar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Enabled = False
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
        NumGlyphs = 2
        Options = [boFocusable, boFocusRect]
        Offsets.GlyphY = 1
        Offsets.TextDownX = 2
        Offsets.TextDownY = 2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        TabOrder = 4
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.ExtrudeEffects.Depth = 4
        TextOptions.ExtrudeEffects.Orientation = fcTopRight
        TextOptions.VAlignment = vaVCenter
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
  end
end
