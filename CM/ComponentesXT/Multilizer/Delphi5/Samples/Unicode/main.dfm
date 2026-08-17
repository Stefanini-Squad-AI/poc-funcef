object Form1: TForm1
  Left = 192
  Top = 291
  Width = 256
  Height = 156
  Caption = 'Unicode Test'
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
    Width = 55
    Height = 13
    Caption = 'Sample text'
  end
  object LanguageButton: TButton
    Left = 160
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 32
    Width = 129
    Height = 81
    ItemHeight = 13
    Items.Strings = (
      'One'
      'Two'
      'Three')
    TabOrder = 1
  end
  object IvTranslator1: TIvTranslator
    Left = 192
    Top = 40
    TargetsData = (
      1
      3
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        ''
        'Items'
        0))
  end
  object IvDictionary1: TIvTextDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'translat.txt'
    LanguageFileName = 'language.txt'
    LocaleFileName = 'locale.txt'
    Left = 160
    Top = 40
  end
end
