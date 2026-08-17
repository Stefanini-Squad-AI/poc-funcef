object MainForm: TMainForm
  Left = 205
  Top = 259
  Width = 747
  Height = 365
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 721
    Height = 289
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 230
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object LanguageButton: TButton
    Left = 256
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Language...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = LanguageButtonClick
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 552
    Top = 8
  end
  object Table1: TTable
    Active = True
    TableName = '..\sample.db'
    Left = 520
    Top = 8
  end
  object IvDBDictionary1: TIvDBDictionary
    DictionaryName = 'Dictionary1'
    CheckLevel = ivclNone
    TableName = 'translat.db'
    LanguageTableName = 'language.db'
    Left = 584
    Top = 8
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 616
    Top = 8
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
        'Hints'
        0))
  end
end
