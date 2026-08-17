inherited frmWizardMTEP: TfrmWizardMTEP
  Left = 20
  Top = 98
  Caption = ''
  ClientHeight = 411
  ClientWidth = 772
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 378
    BevelOuter = bvNone
    object pgcControle: TPageControl
      Left = 0
      Top = 33
      Width = 772
      Height = 345
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = pgcControleChange
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        TabVisible = False
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        TabVisible = False
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 772
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 16
        Top = 8
        Width = 178
        Height = 24
        Caption = 'Caption [ página ]'
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
  inherited Dock971: TDock97
    Top = 378
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 486
      DockPos = 486
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 192
      DockPos = 192
      inherited ToolbarSep971: TToolbarSep97
        Left = 272
        Visible = False
      end
      inherited ToolbarSep973: TToolbarSep97
        Left = 174
        SizeHorz = 17
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 288
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 87
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      object ToolbarSep976: TToolbarSep97 [4]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 191
        Default = False
        TabOrder = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 274
        Width = 14
        Enabled = False
        TabOrder = 3
        Visible = False
      end
      object btnVoltar: TBitBtn
        Left = 2
        Top = 0
        Width = 85
        Height = 27
        Caption = 'Voltar'
        Enabled = False
        ModalResult = 1
        TabOrder = 0
        OnClick = btnVoltarClick
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
      end
      object btnContinuar: TBitBtn
        Left = 89
        Top = 0
        Width = 85
        Height = 27
        Caption = 'Continuar'
        ModalResult = 1
        TabOrder = 1
        OnClick = btnContinuarClick
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
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 571
    Top = 131
  end
end
