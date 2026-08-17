object Form1: TForm1
  Left = 206
  Top = 108
  Width = 394
  Height = 103
  Caption = 'Multilingual ReportBuilder Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 273
    Height = 57
    AutoSize = False
    Caption = 'MULTILIZER and ReportBuilder'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object LanguageButton: TButton
    Left = 288
    Top = 8
    Width = 89
    Height = 25
    Caption = '&Language...'
    TabOrder = 0
    OnClick = LanguageButtonClick
  end
  object PreviewButton: TButton
    Left = 288
    Top = 40
    Width = 89
    Height = 25
    Caption = '&Preview...'
    TabOrder = 1
    OnClick = PreviewButtonClick
  end
  object CustomerTable: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'customer.db'
    Left = 8
    Top = 40
  end
  object CustomerDataSource: TDataSource
    DataSet = CustomerTable
    Left = 40
    Top = 40
  end
  object Customer: TppDBPipeline
    DataSource = CustomerDataSource
    UserName = 'Customer'
    Left = 72
    Top = 40
    object ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CustNo'
      FieldName = 'CustNo'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'Company'
      FieldName = 'Company'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'Addr1'
      FieldName = 'Addr1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'Addr2'
      FieldName = 'Addr2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'City'
      FieldName = 'City'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'State'
      FieldName = 'State'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'Zip'
      FieldName = 'Zip'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'Country'
      FieldName = 'Country'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'Phone'
      FieldName = 'Phone'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'FAX'
      FieldName = 'FAX'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TaxRate'
      FieldName = 'TaxRate'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppField12: TppField
      FieldAlias = 'Contact'
      FieldName = 'Contact'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppField13: TppField
      FieldAlias = 'LastInvoiceDate'
      FieldName = 'LastInvoiceDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
  end
  object CustomerList: TppReport
    AutoStop = False
    DataPipeline = Customer
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    Units = utMillimeters
    UserName = 'Report'
    DeviceType = 'Screen'
    Left = 104
    Top = 40
    Version = '4.11 Pro'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Company'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 12
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 5027
        mmLeft = 10319
        mmTop = 3440
        mmWidth = 16669
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company'
        DataPipeline = Customer
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 2117
        mmWidth = 29104
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object IvTranslator1: TIvTranslator
    DictionaryName = 'Dictionary1'
    Left = 168
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
  object IvDictionary1: TIvBinaryDictionary
    DictionaryName = 'Dictionary1'
    FileName = 'Project1.mld'
    Left = 136
    Top = 40
  end
end
