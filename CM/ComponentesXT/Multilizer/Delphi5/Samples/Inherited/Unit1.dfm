object Form1: TForm1
  Left = 216
  Top = 163
  Width = 410
  Height = 212
  Caption = 'Inherited Dictionary Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Language: TRadioGroup
    Left = 8
    Top = 8
    Width = 169
    Height = 169
    Caption = 'Language:'
    Items.Strings = (
      'Finnish'
      'English'
      'English (United Kindom)'
      'Swedish'
      'Swedish (Finland)')
    TabOrder = 0
    OnClick = LanguageClick
  end
  object GroupBox1: TGroupBox
    Left = 184
    Top = 8
    Width = 209
    Height = 49
    Caption = '&Favor color:'
    TabOrder = 1
    object Edit1: TEdit
      Left = 8
      Top = 16
      Width = 193
      Height = 21
      TabOrder = 0
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 184
    Top = 64
    Width = 209
    Height = 65
    Caption = 'Engine:'
    Items.Strings = (
      '&Gas'
      '&Electric')
    TabOrder = 2
  end
  object CheckBox1: TCheckBox
    Left = 192
    Top = 136
    Width = 201
    Height = 17
    Caption = '&Windshield'
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 192
    Top = 160
    Width = 201
    Height = 17
    Caption = '&Nice design'
    TabOrder = 4
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 368
    Top = 152
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
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    OnLanguageChange = IvDictionary1LanguageChange
    FileName = 'Project1.mld'
    Left = 336
    Top = 152
    DictionaryCode = 4
  end
end
