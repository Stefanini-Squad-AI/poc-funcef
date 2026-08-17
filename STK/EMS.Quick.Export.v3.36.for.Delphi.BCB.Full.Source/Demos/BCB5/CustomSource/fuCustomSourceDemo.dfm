object fmCustomSourceDemo: TfmCustomSourceDemo
  Left = 259
  Top = 197
  Width = 502
  Height = 311
  Caption = 'Custom Source Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 494
      Height = 45
      Align = alClient
      Alignment = taCenter
      Caption = 
        'This application demostrates you how to use the TqeCustomSource ' +
        'component.'#13#10'Check out the OnGetColumnValue and OnGetNextRecord e' +
        'vent handlers to understand how it works.'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 45
    Width = 494
    Height = 198
    Align = alClient
    DefaultColWidth = 97
    DefaultRowHeight = 16
    FixedCols = 0
    TabOrder = 1
  end
  object paButtons: TPanel
    Left = 0
    Top = 243
    Width = 494
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object buExport: TButton
      Left = 210
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Export Data!'
      TabOrder = 0
      OnClick = buExportClick
    end
  end
  object qeCustomSource1: TqeCustomSource
    Columns = <
      item
        ColumnName = 'CODE'
        ColumnType = ectInteger
        Caption = 'Code'
      end
      item
        ColumnName = 'NAME'
        Caption = 'Name'
      end
      item
        ColumnName = 'DATE'
        ColumnType = ectDate
        Caption = 'Date'
      end
      item
        ColumnName = 'SALARY'
        ColumnType = ectCurrency
        Caption = 'Salary'
      end
      item
        ColumnName = 'IS_MALE'
        ColumnType = ectBoolean
        Caption = 'Is Male'
      end>
    OnGetNextRecord = qeCustomSource1GetNextRecord
    OnGetColumnValue = qeCustomSource1GetColumnValue
    Left = 8
    Top = 96
  end
  object QExport3XLS1: TQExport3XLS
    ExportSource = esCustom
    CustomSource = qeCustomSource1
    About = '(About EMS QuickExport)'
    _Version = '3.00'
    ShowFile = True
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Sheet 1'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.HyperlinkFormat.Font.Color = clrBlue
    Options.HyperlinkFormat.Font.Underline = fulSingle
    Options.NoteFormat.Alignment.Horizontal = halLeft
    Options.NoteFormat.Alignment.Vertical = valTop
    Options.NoteFormat.Font.Size = 8
    Options.NoteFormat.Font.Style = [xfsBold]
    Options.NoteFormat.Font.Name = 'Tahoma'
    FieldFormats = <>
    StripStyles = <>
    Hyperlinks = <>
    Notes = <>
    Charts = <>
    Sheets = <>
    Left = 36
    Top = 96
  end
end
