object Form1: TForm1
  Left = 263
  Top = 173
  Width = 510
  Height = 356
  Caption = 'EMS QuickExport -- Dialog Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Button1: TButton
      Left = 194
      Top = 5
      Width = 114
      Height = 22
      Caption = '&Export Data!'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 32
    Width = 502
    Height = 297
    ActivePage = tshListView
    Align = alClient
    TabIndex = 2
    TabOrder = 1
    OnChange = PageControl1Change
    object tshDataSet: TTabSheet
      Caption = 'DataSet'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 31
        Width = 494
        Height = 238
        Align = alBottom
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 494
        Height = 31
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 9
          Width = 33
          Height = 13
          Caption = 'Aliases'
        end
        object Label2: TLabel
          Left = 219
          Top = 9
          Width = 32
          Height = 13
          Caption = 'Tables'
        end
        object ComboBox1: TComboBox
          Left = 48
          Top = 5
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = ComboBox1Change
        end
        object ComboBox2: TComboBox
          Left = 258
          Top = 5
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          OnChange = ComboBox2Change
        end
      end
    end
    object tshDBGrid: TTabSheet
      Caption = 'DBGrid'
      object DBGrid2: TDBGrid
        Left = 0
        Top = 31
        Width = 494
        Height = 238
        Align = alBottom
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tshListView: TTabSheet
      Caption = 'ListView'
      object ListView1: TListView
        Left = 0
        Top = 0
        Width = 494
        Height = 269
        Align = alClient
        Columns = <
          item
            Caption = 'Code'
            Width = 70
          end
          item
            Caption = 'Name'
            Width = 70
          end
          item
            Caption = 'Date'
            Width = 70
          end
          item
            Caption = 'Salary'
            Width = 70
          end
          item
            Caption = 'IsMale'
            Width = 70
          end>
        GridLines = True
        HideSelection = False
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object tshStringGrid: TTabSheet
      Caption = 'StringGrid'
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 494
        Height = 269
        Align = alClient
        DefaultColWidth = 97
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 6
        TabOrder = 0
      end
    end
  end
  object Table1: TTable
    Left = 108
    Top = 135
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 136
    Top = 135
  end
  object QExportDialog1: TADO_QExport3Dialog
    DataSet = Table1
    ListView = ListView1
    DBGrid = DBGrid2
    StringGrid = StringGrid1
    AutoCalcStrType = True
    SaveLoadButtons = True
    Formats.DateFormat = 'dd.MM.yyyy'
    Formats.TimeFormat = 'h:mm'
    Formats.DateTimeFormat = 'dd.MM.yyyy h:mm'
    Formats.CurrencyFormat = '00.00$'
    Formats.BooleanTrue = 'True'
    Formats.BooleanFalse = 'False'
    Formats.NullString = 'null'
    RTFOptions.CaptionStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.CaptionStyle.Font.Color = clBlack
    RTFOptions.CaptionStyle.Font.Height = -13
    RTFOptions.CaptionStyle.Font.Name = 'Arial'
    RTFOptions.CaptionStyle.Font.Style = [fsBold]
    RTFOptions.CaptionStyle.Alignment = talCenter
    RTFOptions.DataStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.DataStyle.Font.Color = clBlack
    RTFOptions.DataStyle.Font.Height = -13
    RTFOptions.DataStyle.Font.Name = 'Arial'
    RTFOptions.DataStyle.Font.Style = []
    RTFOptions.FooterStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.FooterStyle.Font.Color = clBlack
    RTFOptions.FooterStyle.Font.Height = -13
    RTFOptions.FooterStyle.Font.Name = 'Arial'
    RTFOptions.FooterStyle.Font.Style = []
    RTFOptions.HeaderStyle.Font.Charset = DEFAULT_CHARSET
    RTFOptions.HeaderStyle.Font.Color = clBlack
    RTFOptions.HeaderStyle.Font.Height = -13
    RTFOptions.HeaderStyle.Font.Name = 'Arial'
    RTFOptions.HeaderStyle.Font.Style = []
    RTFOptions.StripStyles = <>
    HTMLPageOptions.TextFont.Charset = DEFAULT_CHARSET
    HTMLPageOptions.TextFont.Color = clWhite
    HTMLPageOptions.TextFont.Height = -11
    HTMLPageOptions.TextFont.Name = 'Arial'
    HTMLPageOptions.TextFont.Style = []
    CSVOptions.Comma = ';'
    PDFOptions.PageOptions.MarginLeft = 1.17
    PDFOptions.PageOptions.MarginRight = 0.58
    PDFOptions.PageOptions.MarginTop = 0.78
    PDFOptions.PageOptions.MarginBottom = 0.78
    AccessOptions.TableName = 'EXPORT_TABLE'
    XLSOptions.PageFooter = 'Page &P of &N'
    XLSOptions.SheetTitle = 'Sheet 1'
    XLSOptions.CaptionFormat.Font.Style = [xfsBold]
    XLSOptions.HyperlinkFormat.Font.Color = clrBlue
    XLSOptions.HyperlinkFormat.Font.Underline = fulSingle
    XLSOptions.NoteFormat.Alignment.Horizontal = halLeft
    XLSOptions.NoteFormat.Alignment.Vertical = valTop
    XLSOptions.NoteFormat.Font.Size = 8
    XLSOptions.NoteFormat.Font.Style = [xfsBold]
    XLSOptions.NoteFormat.Font.Name = 'Tahoma'
    XLSOptions.FieldFormats = <>
    XLSOptions.StripStyles = <>
    XLSOptions.Hyperlinks = <>
    XLSOptions.Notes = <>
    XLSOptions.Charts = <>
    Left = 164
    Top = 135
  end
end
