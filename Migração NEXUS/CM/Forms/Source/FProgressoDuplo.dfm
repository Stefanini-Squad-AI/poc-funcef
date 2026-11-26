object frmProgressoDuplo: TfrmProgressoDuplo
  Left = 125
  Top = 238
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = ' Progresso'
  ClientHeight = 169
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
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
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
    Caption = 'Processando ...'
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
  object lblContador2: TLabel
    Left = 412
    Top = 82
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
  object lblProgress2: TfcLabel
    Left = 64
    Top = 68
    Width = 337
    Height = 27
    AutoSize = False
    Caption = 'Processando ...'
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
  object Animacao: TAnimate
    Left = 8
    Top = 40
    Width = 49
    Height = 49
    Active = False
    AutoSize = False
    CommonAVI = aviFindComputer
    StopFrame = 8
  end
  object btnCancelar: TBitBtn
    Left = 424
    Top = 131
    Width = 81
    Height = 25
    Cancel = True
    Caption = 'Parar'
    TabOrder = 1
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
  object Panel1: TPanel
    Left = 64
    Top = 32
    Width = 441
    Height = 22
    TabOrder = 2
    object Gauge: TGauge
      Left = 2
      Top = 2
      Width = 436
      Height = 17
      BackColor = clWindow
      BorderStyle = bsNone
      Color = clScrollBar
      ForeColor = clNavy
      ParentColor = False
      Progress = 0
    end
  end
  object Panel2: TPanel
    Left = 64
    Top = 96
    Width = 441
    Height = 22
    TabOrder = 3
    object Gauge2: TGauge
      Left = 2
      Top = 2
      Width = 436
      Height = 17
      BackColor = clWindow
      BorderStyle = bsNone
      Color = clScrollBar
      ForeColor = clNavy
      ParentColor = False
      Progress = 0
    end
  end
  object Temporizador: TTimer
    Enabled = False
    OnTimer = TemporizadorTimer
    Left = 168
    Top = 128
  end
end
