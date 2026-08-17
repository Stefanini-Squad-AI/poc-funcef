object Form1: TForm1
  Left = 215
  Top = 157
  Width = 440
  Height = 365
  Caption = 'DBScroll Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBScroll1: TDBScroll
    Left = 8
    Top = 8
    Width = 321
    Height = 291
    ParentColor = False
    TabOrder = 0
    Column01.DataField1 = 'FirstName'
    Column01.Header = 'First Name'
    Column01.WidthPercent = '25.00'
    Column02.DataField1 = 'LastName'
    Column02.Header = 'Last Name'
    Column02.WidthPercent = '30.00'
    Column03.DataField1 = 'Email'
    Column03.Header = 'Email Address'
    Column03.WidthPercent = '45.00'
    Column04.WidthPercent = '0.00'
    Column05.WidthPercent = '0.00'
    DataSource = DataSource1
    Header.CurrIndexFont.Charset = DEFAULT_CHARSET
    Header.CurrIndexFont.Color = clMaroon
    Header.CurrIndexFont.Height = -11
    Header.CurrIndexFont.Name = 'MS Sans Serif'
    Header.CurrIndexFont.Style = [fsBold, fsUnderline]
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clNavy
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Options = [dsAllowInsert, dsAlwaysShowSelection, dsConfirmDelete, dsColLines, dsColResize, dsRowLines, dsRowResize]
    SearchBox.Caption = 'Looking for:'
    SelField.Delimiter = ', '
    SelField.Font.Charset = DEFAULT_CHARSET
    SelField.Font.Color = clMaroon
    SelField.Font.Height = -11
    SelField.Font.Name = 'MS Sans Serif'
    SelField.Font.Style = []
    SelField.InfoText = 'selec-'#10'ted is:'
    SelField.InfoFont.Charset = DEFAULT_CHARSET
    SelField.InfoFont.Color = clWindowText
    SelField.InfoFont.Height = -11
    SelField.InfoFont.Name = 'MS Sans Serif'
    SelField.InfoFont.Style = []
  end
  object LanguageButton: TButton
    Left = 336
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 1
    OnClick = LanguageButtonClick
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 304
    Width = 320
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object Table1: TTable
    Active = True
    TableName = '..\sample.db'
    Left = 336
    Top = 72
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 368
    Top = 72
  end
  object IvBinaryDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Left = 336
    Top = 40
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 368
    Top = 40
    TargetsData = (
      1
      6
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
        0)
      (
        ''
        'Hints'
        0)
      (
        ''
        'Header'
        0)
      (
        ''
        'InfoText'
        0))
  end
end
