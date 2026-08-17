object MainForm: TMainForm
  Left = 197
  Top = 360
  Width = 258
  Height = 105
  Caption = 'User Dictionary Sample'
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
    Width = 75
    Height = 13
    Caption = 'This is a sample'
  end
  object DateLabel: TLabel
    Left = 8
    Top = 32
    Width = 49
    Height = 13
    Caption = 'DateLabel'
  end
  object AmountLabel: TLabel
    Left = 8
    Top = 48
    Width = 62
    Height = 13
    Caption = 'AmountLabel'
  end
  object LanguageButton: TButton
    Left = 128
    Top = 8
    Width = 113
    Height = 25
    Caption = 'Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object SublanguageButton: TButton
    Left = 128
    Top = 40
    Width = 113
    Height = 25
    Caption = 'Sublanguage...'
    TabOrder = 1
    OnClick = SublanguageButtonClick
  end
  object IvDictionary1: TIvUserDictionary
    DictionaryName = 'Dictionary1'
    OnLocaleChange = IvDictionary1LocaleChange
    OnLanguageCount = IvDictionary1LanguageCount
    OnLanguageData = IvDictionary1LanguageData
    OnLocaleCount = IvDictionary1LocaleCount
    OnLocaleData = IvDictionary1LocaleData
    OnTranslate = IvDictionary1Translate
    Left = 96
    Top = 8
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 96
    Top = 40
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
