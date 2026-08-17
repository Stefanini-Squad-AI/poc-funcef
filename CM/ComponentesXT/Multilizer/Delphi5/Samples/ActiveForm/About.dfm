object AboutDialog: TAboutDialog
  Left = 230
  Top = 285
  Width = 313
  Height = 122
  Caption = 'About'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 145
    Height = 13
    Caption = 'Sample ActiveForm application'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 246
    Height = 13
    Caption = 'Copyright (c) 1998 Innoview Data Technologies Ltd.'
  end
  object OKButton: TButton
    Left = 112
    Top = 56
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 272
    Top = 56
    TargetsData = (
      1
      2
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0))
  end
end
