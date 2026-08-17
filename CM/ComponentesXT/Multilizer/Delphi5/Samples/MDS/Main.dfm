object MainForm: TMainForm
  Left = 207
  Top = 358
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
  object CurrentLocale: TLabel
    Left = 176
    Top = 112
    Width = 33
    Height = 13
    Hint = 'The locale (i.e. language + country) that is used'
    Caption = 'dummy'
  end
  object Label4: TLabel
    Left = 8
    Top = 112
    Width = 68
    Height = 13
    Caption = 'Current locale:'
  end
  object CurrentLanguage: TLabel
    Left = 176
    Top = 136
    Width = 33
    Height = 13
    Hint = 'The current language of the user interface'
    Caption = 'dummy'
  end
  object Label11: TLabel
    Left = 8
    Top = 136
    Width = 116
    Height = 13
    Caption = 'User interface language:'
  end
  object IvGroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 49
    Caption = '&Give the driving distance'
    TabOrder = 0
    object UnitLabel: TLabel
      Left = 88
      Top = 18
      Width = 33
      Height = 13
      Hint = 'The distance unit used by the current locale'
      Caption = 'dummy'
    end
    object DistanceEdit: TEdit
      Left = 8
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 0
    end
  end
  object CalculateButton: TButton
    Left = 256
    Top = 24
    Width = 97
    Height = 25
    Hint = 'Calculates the average driving time'
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
    object Language1: TMenuItem
      Caption = 'File'
      Hint = 'Let you select the language and locale'
      object LanguageMenu: TMenuItem
        Caption = 'Language...'
        Hint = 'Select the active language'
        OnClick = LanguageMenuClick
      end
      object SublanguageMenu: TMenuItem
        Caption = 'Sublanguage...'
        Hint = 'Select the active language and locale'
        OnClick = SublanguageMenuClick
      end
      object LocaleMenu: TMenuItem
        Caption = 'Locale...'
        Hint = 'Select the active locale'
        OnClick = LocaleMenuClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ExitMenu: TMenuItem
        Caption = 'Exit'
        Hint = 'Quits the application'
        OnClick = ExitMenuClick
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      Hint = 'Let you change the options'
      OnClick = Options1Click
      object ShowNativeMenu: TMenuItem
        Caption = 'Show native names'
        Hint = 'If checked the select dialogs use the native names'
        OnClick = ShowNativeMenuClick
      end
      object ShowAllMenu: TMenuItem
        Caption = 'Show all languages'
        Hint = 'If not checked only the enabled languages and locales are shown'
        OnClick = ShowAllMenuClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object BindMenu: TMenuItem
        Caption = 'Bind'
        Hint = 'Set a binding between the language and the locale'
        object NoneMenu: TMenuItem
          Caption = 'None'
          Hint = 'No binding is used'
          OnClick = NoneMenuClick
        end
        object LanguageToLocaleMenu: TMenuItem
          Caption = 'Language to locale'
          Hint = 'The language has been bound to locale'
          OnClick = LanguageToLocaleMenuClick
        end
        object LocaleToLanguageMenu: TMenuItem
          Caption = 'Locale to language'
          Hint = 'The locale has been bound to language'
          OnClick = LocaleToLanguageMenuClick
        end
      end
      object EnabledLanguagesMenu: TMenuItem
        Caption = 'Enabled languages'
        Hint = 'Shows what languages are enabled'
        object AllMenu: TMenuItem
          Caption = 'All'
          Hint = 'All languages and locales are enabled'
          OnClick = AllMenuClick
        end
        object SystemMenu: TMenuItem
          Caption = 'Supported by the system'
          Hint = 'Only languages that are supported by the system are enabled'
          OnClick = SystemMenuClick
        end
        object CodePageMenu: TMenuItem
          Caption = 'Supported by the code page'
          Hint = 
            'Only languages that are supported by the current code page are e' +
            'nabled'
          OnClick = CodePageMenuClick
        end
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
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    OnLocaleChange = IvTranslator1LanguageChange
    OnLanguageChange = IvTranslator1LanguageChange
    Left = 288
    Top = 56
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
        'Text'
        0))
  end
  object IvDictionary1: TIvServerDictionary
    DictionaryName = 'Dictionary1'
    UserName = 'guest'
    Password = 'guest'
    RemoteDictionaryName = 'dcalc'
    Address = '127.0.0.1'
    Left = 256
    Top = 56
    DictionaryCode = 4
  end
end
