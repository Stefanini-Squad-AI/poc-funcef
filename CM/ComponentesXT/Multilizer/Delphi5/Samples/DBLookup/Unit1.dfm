object Form1: TForm1
  Left = 225
  Top = 152
  Width = 432
  Height = 317
  Caption = 'Lookup Database Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 96
    Width = 153
    Height = 185
    Caption = 'Sport (list box):'
    TabOrder = 0
    object DBLookupListBox1: TDBLookupListBox
      Left = 8
      Top = 16
      Width = 137
      Height = 160
      DataField = 'Sport'
      DataSource = DataSource
      KeyField = 'Id'
      ListField = 'EnglishLookup'
      ListSource = LookupDataSource
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 168
    Top = 96
    Width = 153
    Height = 185
    Caption = 'Sport (combo box):'
    TabOrder = 1
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 16
      Width = 137
      Height = 21
      DataField = 'Sport'
      DataSource = DataSource
      KeyField = 'Id'
      ListField = 'EnglishLookup'
      ListSource = LookupDataSource
      TabOrder = 0
    end
  end
  object LanguageButton: TButton
    Left = 328
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 2
    OnClick = LanguageButtonClick
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 8
    Width = 310
    Height = 25
    DataSource = DataSource
    TabOrder = 3
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 40
    Width = 313
    Height = 49
    Caption = 'Name:'
    TabOrder = 4
    object DBEdit1: TDBEdit
      Left = 8
      Top = 16
      Width = 297
      Height = 21
      DataField = 'Name'
      DataSource = DataSource
      TabOrder = 0
    end
  end
  object DataSource: TDataSource
    DataSet = ItemsTable
    Left = 328
    Top = 104
  end
  object LookupDataSource: TDataSource
    DataSet = LookupTable
    Left = 360
    Top = 104
  end
  object ItemsTable: TTable
    Active = True
    TableName = 'items.db'
    Left = 328
    Top = 72
  end
  object LookupTable: TTable
    Active = True
    TableName = 'lookup.DB'
    Left = 360
    Top = 72
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    OnLanguageChange = IvTranslator1LanguageChange
    Left = 360
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
        'Filter'
        0))
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Left = 328
    Top = 40
    DictionaryCode = 4
  end
end
