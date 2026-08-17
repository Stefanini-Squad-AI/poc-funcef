object MainForm: TMainForm
  Left = 216
  Top = 411
  Width = 500
  Height = 241
  Caption = 'Measurement Sample'
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
    Width = 63
    Height = 13
    Caption = 'Temperature:'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 23
    Height = 13
    Caption = 'Size:'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 45
    Height = 13
    Caption = 'Distance:'
  end
  object Label5: TLabel
    Left = 8
    Top = 80
    Width = 25
    Height = 13
    Caption = 'Area:'
  end
  object Temperature: TLabel
    Left = 88
    Top = 8
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 75
    Height = 13
    Caption = 'Liquid Capacity:'
  end
  object SizeValue: TLabel
    Left = 88
    Top = 32
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object Distance: TLabel
    Left = 88
    Top = 56
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object Area: TLabel
    Left = 88
    Top = 80
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object LiquidCapacity: TLabel
    Left = 104
    Top = 112
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object Label7: TLabel
    Left = 8
    Top = 168
    Width = 105
    Height = 13
    Caption = 'Scientific temperature:'
  end
  object ScientificTemperature: TLabel
    Left = 152
    Top = 168
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object Label8: TLabel
    Left = 8
    Top = 136
    Width = 63
    Height = 13
    Caption = 'Dry Capacity:'
  end
  object DryCapacity: TLabel
    Left = 104
    Top = 136
    Width = 33
    Height = 13
    Caption = 'dummy'
  end
  object LanguageButton: TButton
    Left = 408
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object LocaleButton: TButton
    Left = 408
    Top = 152
    Width = 75
    Height = 25
    Caption = 'L&ocale...'
    TabOrder = 1
    OnClick = LocaleButtonClick
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    OnLocaleChange = IvTranslator1LanguageChange
    OnLanguageChange = IvTranslator1LanguageChange
    Left = 424
    Top = 8
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
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'diction.mld'
    Left = 456
    Top = 8
  end
end
