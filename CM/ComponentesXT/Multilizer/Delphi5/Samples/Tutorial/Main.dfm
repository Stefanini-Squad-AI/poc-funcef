object MainForm: TMainForm
  Left = 193
  Top = 274
  AutoScroll = False
  Caption = 'Driving time calculator'
  ClientHeight = 175
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDefaultPosOnly
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 69
    Height = 13
    Caption = 'Date and time:'
  end
  object CurrentTime: TLabel
    Left = 176
    Top = 88
    Width = 33
    Height = 13
    Hint = 'The current date and time in the local format'
    Caption = 'dummy'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 68
    Height = 13
    Caption = 'Speeding fine:'
  end
  object SpeedingFine: TLabel
    Left = 176
    Top = 64
    Width = 33
    Height = 13
    Hint = 'The speeding fine in the local currency'
    Caption = 'dummy'
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 68
    Height = 13
    Caption = 'Current locale:'
  end
  object Label1: TLabel
    Left = 8
    Top = 136
    Width = 116
    Height = 13
    Caption = 'User interface language:'
  end
  object CurrentLocale: TLabel
    Left = 176
    Top = 112
    Width = 34
    Height = 13
    Hint = 'The locale (i.e. language + country) that is used'
    Caption = 'Default'
  end
  object CurrentLanguage: TLabel
    Left = 176
    Top = 136
    Width = 34
    Height = 13
    Hint = 'The current language of the user interface'
    Caption = 'English'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 49
    Caption = '&Give the driving distance'
    TabOrder = 0
    object UnitLabel: TLabel
      Left = 88
      Top = 18
      Width = 58
      Height = 13
      Hint = 'The distance unit used by the current locale'
      Caption = 'in kilometres'
    end
    object DistanceEdit: TEdit
      Left = 8
      Top = 16
      Width = 73
      Height = 21
      Hint = 'Give the driving distance in kilometres'
      TabOrder = 0
    end
  end
  object CalculateButton: TButton
    Left = 256
    Top = 24
    Width = 97
    Height = 25
    Hint = 'Calculates the avarage driving time'
    Caption = '&Calculate'
    Default = True
    TabOrder = 1
    OnClick = CalculateButtonClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 156
    Width = 369
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 320
    Top = 56
    object File1: TMenuItem
      Caption = 'File'
      Hint = 'Let you select the language and locale'
      object ExitMenu: TMenuItem
        Caption = 'Exit'
        Hint = 'Quits the application'
        OnClick = ExitMenuClick
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      Hint = 'Provides help'
      object AboutMenu: TMenuItem
        Caption = 'About...'
        Hint = 'Shows information about DCALC'
        OnClick = AboutMenuClick
      end
    end
  end
end
