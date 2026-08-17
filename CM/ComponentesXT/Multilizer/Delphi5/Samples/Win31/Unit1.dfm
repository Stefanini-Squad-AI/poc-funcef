object Form1: TForm1
  Left = 220
  Top = 118
  Width = 383
  Height = 136
  Caption = 'Win 3.1 Controls Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 273
    Height = 89
    PageIndex = 2
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Outline'
      object Outline1: TOutline
        Left = 8
        Top = 8
        Width = 257
        Height = 81
        Lines.Nodes = (
          'One'
          #9'One'
          #9'Two'
          'Two'
          'Three')
        ItemHeight = 13
        TabOrder = 0
        ItemSeparator = '\'
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Header'
      object Header1: THeader
        Left = 8
        Top = 8
        Width = 257
        Height = 81
        Sections.Sections = (
          #0'28'#0'One'
          #0'29'#0'Two'
          #0'36'#0'Three')
        TabOrder = 0
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'TabbedNotebook'
      object TabbedNotebook1: TTabbedNotebook
        Left = 8
        Top = 8
        Width = 257
        Height = 81
        TabFont.Charset = DEFAULT_CHARSET
        TabFont.Color = clBtnText
        TabFont.Height = -11
        TabFont.Name = 'MS Sans Serif'
        TabFont.Style = []
        TabOrder = 0
        object TTabPage
          Left = 4
          Top = 24
          Caption = 'One'
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 75
            Height = 13
            Caption = 'This is a sample'
          end
        end
        object TTabPage
          Left = 4
          Top = 24
          Caption = 'Two'
          object Button1: TButton
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Caption = 'Press'
            TabOrder = 0
          end
        end
        object TTabPage
          Left = 4
          Top = 24
          Caption = 'Three'
          object CheckBox1: TCheckBox
            Left = 8
            Top = 8
            Width = 233
            Height = 17
            Caption = 'Sample check box'
            TabOrder = 0
          end
        end
      end
    end
  end
  object TabSet1: TTabSet
    Left = 8
    Top = 88
    Width = 257
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'TOutline'
      'THeader'
      'TTabbedNotebook')
    TabIndex = 0
    OnChange = TabSet1Change
  end
  object LanguageButton: TButton
    Left = 280
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 2
    OnClick = LanguageButtonClick
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Left = 280
    Top = 40
    DictionaryCode = 4
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 312
    Top = 40
    TargetsData = (
      1
      5
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
        'Lines'
        0)
      (
        ''
        'Sections'
        0)
      (
        ''
        'Tabs'
        0))
  end
  object IvControlModule1: TIvControlModule
    Left = 344
    Top = 40
  end
end
