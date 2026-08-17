object Form1: TForm1
  Left = 198
  Top = 357
  Width = 530
  Height = 348
  Caption = 'Multilingual Messages'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object StaticGroup: TGroupBox
    Left = 8
    Top = 8
    Width = 505
    Height = 49
    Caption = 
      'Static messages are application generated messages that are cons' +
      'tants:'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 113
      Height = 13
      Caption = 'Operation is not allowed'
    end
    object StaticApplicationButton: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sample...'
      TabOrder = 0
      OnClick = StaticApplicationButtonClick
    end
  end
  object StaticSystemGroup: TGroupBox
    Left = 8
    Top = 120
    Width = 505
    Height = 49
    Caption = 
      'Static system messages are constant exceptions raised by system,' +
      ' VCL, or BDE:'
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 74
      Height = 13
      Caption = 'Division by zero'
    end
    object StaticSystemButton: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sample...'
      TabOrder = 0
      OnClick = StaticSystemButtonClick
    end
  end
  object DynamicGroup: TGroupBox
    Left = 8
    Top = 64
    Width = 505
    Height = 49
    Caption = 
      'Dynamic messages are application generated messages that contain' +
      's parameters:'
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 85
      Height = 13
      Caption = '%s value is invalid'
    end
    object DynamicApplicationButton: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sample...'
      TabOrder = 0
      OnClick = DynamicApplicationButtonClick
    end
  end
  object DynamicSystemGroup: TGroupBox
    Left = 8
    Top = 176
    Width = 505
    Height = 49
    Caption = 
      'Dynamic system messages are exceptions raised by system, VCL, or' +
      ' BDE:'
    TabOrder = 3
    object Label8: TLabel
      Left = 8
      Top = 20
      Width = 101
      Height = 13
      Caption = #39'%s'#39' is not a valid time'
    end
    object DynamicSystemButton: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sample...'
      TabOrder = 0
      OnClick = DynamicSystemButtonClick
    end
  end
  object LanguageButton: TButton
    Left = 432
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Language...'
    TabOrder = 4
    OnClick = LanguageButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 232
    Width = 505
    Height = 49
    Caption = 'Custom exceptions:'
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 101
      Height = 13
      Caption = #39'%s'#39' is not a valid time'
    end
    object CustomButton: TButton
      Left = 416
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Sample...'
      TabOrder = 0
      OnClick = CustomButtonClick
    end
  end
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'demo.mld'
    Left = 392
    Top = 288
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 360
    Top = 288
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
