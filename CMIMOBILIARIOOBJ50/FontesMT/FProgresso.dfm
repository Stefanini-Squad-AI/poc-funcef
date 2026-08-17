object frmProgresso: TfrmProgresso
  Left = 315
  Top = 235
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Imobiliário'
  ClientHeight = 89
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblContador: TLabel
    Left = 412
    Top = 18
    Width = 93
    Height = 13
    Alignment = taRightJustify
    Caption = '00000 de 00000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblProgress: TfcLabel
    Left = 64
    Top = 4
    Width = 337
    Height = 27
    AutoSize = False
    Caption = 'Blá Blá Blá...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TextOptions.Alignment = taLeftJustify
    TextOptions.LineSpacing = 0
    TextOptions.VAlignment = vaBottom
    TextOptions.WordWrap = True
  end
  object ProgressBar: TProgressBar
    Left = 64
    Top = 32
    Width = 441
    Height = 17
    Min = 0
    Max = 100
    Step = 1
    TabOrder = 1
  end
  object Animacao: TAnimate
    Left = 8
    Top = 16
    Width = 49
    Height = 49
    Active = True
    AutoSize = False
    CommonAVI = aviFindComputer
    StopFrame = 8
  end
  object btnCancelar: TBitBtn
    Left = 424
    Top = 56
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Parar'
    TabOrder = 2
    OnClick = btnCancelarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
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
  end
  object Temporizador: TTimer
    OnTimer = TemporizadorTimer
    Left = 168
    Top = 48
  end
end
