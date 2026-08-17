inherited frmAcertoImpostoMT: TfrmAcertoImpostoMT
  Left = 394
  Top = 274
  HelpContext = 90001
  Caption = 'Acerto de Imposto'
  ClientHeight = 148
  ClientWidth = 413
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 413
    Height = 109
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 411
      Height = 85
      TabStop = False
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Acerta os Impostos não lançados')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object prgBarAcerto: TProgressBar
      Left = 1
      Top = 86
      Width = 411
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 413
    inherited tb97Fundo: TToolbar97
      Left = 100
      inherited sep1: TToolbarSep97
        Left = 226
      end
      inherited bbtnSair: TBitBtn
        Left = 145
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 228
        HelpContext = 90001
      end
      object bbtnAcerta: TBitBtn
        Left = 0
        Top = 0
        Width = 145
        Height = 33
        Cancel = True
        Caption = '&Acerta'
        TabOrder = 2
        OnClick = bbtnAcertaClick
        Glyph.Data = {
          B6010000424DB601000000000000760000002800000022000000100000000100
          0400000000004001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888988888
          888888888887F888888888000000888889988888888888888877FFFFFFF88800
          0000888899999999988888888777777777F88800000088889999999998888888
          87777777778888000000888889988888888888888877F8888888880000008888
          889888888888888888878888888888000000888888888888888888888FFFFFFF
          FFFF880000008887000000000088888877777777777F880000008887BFB7BF7F
          B08888887FF87FF7F87F880000008887FBF7FB7BF08888887F8F7F87FF7F8800
          00008887BFB7BF7FB08888887FF87FF7F87F880000008887FBF7FB7BF0888888
          7F8F7F87FF7F880000008887BFB7BF7FB08888887FF87FF7F87F880000008887
          FBF7FB7BF08888887FFF7FF7FF7F880000008887777777777088888877777777
          7778880000008888888888888888888888888888888888000000}
        NumGlyphs = 3
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
