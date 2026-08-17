object MainForm: TMainForm
  Left = 195
  Top = 268
  Width = 333
  Height = 154
  Caption = 'Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Sample'
  end
  object LanguageButton: TButton
    Left = 168
    Top = 8
    Width = 147
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object AddButton: TButton
    Left = 168
    Top = 40
    Width = 147
    Height = 25
    Caption = '&Add new components'
    TabOrder = 1
    OnClick = AddButtonClick
  end
  object IvTranslator1: TIvTranslator
    Left = 288
    Top = 72
    TargetsData = (
      1
      3
      (
        ''
        'Caption'
        0)
      (
        ''
        'Hint'
        0)
      (
        ''
        'Items'
        0))
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    Language = 2
    FileName = 'diction.mld'
    Left = 256
    Top = 72
    DictionaryCode = 4
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 72
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Cut1: TMenuItem
        Caption = 'Cut'
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
      end
      object Paste1: TMenuItem
        Caption = 'Paste'
      end
    end
  end
end
