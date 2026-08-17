object Form1: TForm1
  Left = 224
  Top = 271
  Width = 700
  Height = 356
  Caption = 'EMS QuickExport -- Excel Demo'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 692
    Height = 66
    Align = alTop
    AutoSize = False
    Caption = 
      'This example shows how you can use some properties and events of' +
      ' the TQExport3XLS component.'#13#10'Check out ColumnsWidth, FieldForma' +
      'ts, Footer, Header, Options.AggregateFormat, Options.CaptionForm' +
      'at, '#13#10'Options.FooterFormat, Options.HeaderFormat properties and ' +
      'OnGetExportText, OnGetDataParams,'#13#10'OnGetFooterParams, OnGetHeade' +
      'rParams event handlers.'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 66
    Width = 692
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 569
      Top = 0
      Width = 123
      Height = 263
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 0
      object Button1: TButton
        Left = 11
        Top = 231
        Width = 102
        Height = 25
        Caption = 'Export Data!'
        TabOrder = 0
        OnClick = Button1Click
      end
      object gbExportedSheets: TGroupBox
        Left = 4
        Top = 14
        Width = 115
        Height = 112
        Caption = 'Exported Sheets'
        TabOrder = 1
        object chDataSet: TCheckBox
          Left = 9
          Top = 17
          Width = 97
          Height = 17
          Caption = 'DataSet'
          TabOrder = 0
        end
        object chDBGrid: TCheckBox
          Left = 9
          Top = 41
          Width = 97
          Height = 17
          Caption = 'DBGrid'
          TabOrder = 1
        end
        object chListView: TCheckBox
          Left = 9
          Top = 64
          Width = 97
          Height = 17
          Caption = 'ListView'
          TabOrder = 2
        end
        object chStringGrid: TCheckBox
          Left = 9
          Top = 88
          Width = 97
          Height = 17
          Caption = 'StringGrid'
          TabOrder = 3
        end
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 569
      Height = 263
      ActivePage = tshDataSet
      Align = alClient
      TabIndex = 0
      TabOrder = 1
      object tshDataSet: TTabSheet
        Caption = 'DataSet'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 235
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object tshDBGrid: TTabSheet
        Caption = 'DBGrid'
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 235
          Align = alClient
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NAME'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POPULATION'
              Visible = True
            end>
        end
      end
      object tshListView: TTabSheet
        Caption = 'ListView'
        object ListView1: TListView
          Left = 0
          Top = 0
          Width = 561
          Height = 235
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
              Width = 130
            end
            item
              Caption = 'Capital'
              Width = 100
            end
            item
              Caption = 'Continent'
              Width = 90
            end
            item
              Alignment = taRightJustify
              Caption = 'Area'
              Width = 70
            end
            item
              Alignment = taRightJustify
              Caption = 'Population'
              Width = 70
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object tshStringGrid: TTabSheet
        Caption = 'StringGrid'
        object StringGrid1: TStringGrid
          Left = 0
          Top = 0
          Width = 561
          Height = 235
          Align = alClient
          DefaultColWidth = 107
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 18
          TabOrder = 0
        end
      end
    end
  end
  object Table1: TTable
    Left = 110
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 138
    Top = 136
  end
  object QExportXLS1: TQExport3XLS
    DataSet = Table1
    ListView = ListView1
    DBGrid = DBGrid1
    StringGrid = StringGrid1
    About = '(About EMS QuickExport)'
    _Version = '2.00'
    ShowFile = True
    Formats.CurrencyFormat = '00.00$'
    ColumnsWidth.Strings = (
      'AREA=15'
      'POPULATION=20')
    Options.PageFooter = 'Page &P of &N'
    Options.SheetTitle = 'Save Your Time!'
    Options.HeaderFormat.Font.Size = 14
    Options.HeaderFormat.Font.Style = [xfsBold]
    Options.HeaderFormat.Font.Name = 'Tahoma'
    Options.CaptionsFormat.Font.Style = [xfsBold]
    Options.CaptionsFormat.Alignment.Horizontal = halCenter
    Options.AggregateFormat.Font.Size = 12
    Options.AggregateFormat.Font.Color = clrWhite
    Options.AggregateFormat.Font.Name = 'Impact'
    Options.AggregateFormat.Fill.Background = clrDarkTeal
    Options.AggregateFormat.Fill.Pattern = ptSolid
    Options.FooterFormat.Font.Size = 12
    Options.FooterFormat.Font.Style = [xfsBold]
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
    Sheets = <
      item
        Title = 'DataSet'
        Options.PageFooter = 'Page &P of &N'
        Options.SheetTitle = 'Sheet 1'
        Options.HeaderFormat.Font.Size = 14
        Options.HeaderFormat.Font.Style = [xfsBold]
        Options.HeaderFormat.Font.Name = 'Tahoma'
        Options.CaptionsFormat.Font.Size = 16
        Options.CaptionsFormat.Font.Style = [xfsBold]
        Options.CaptionsFormat.Font.Color = clrWhite
        Options.CaptionsFormat.Font.Name = 'Impact'
        Options.CaptionsFormat.Fill.Background = clrDarkTeal
        Options.CaptionsFormat.Fill.Pattern = ptSolid
        Options.CaptionsFormat.Alignment.Horizontal = halCenter
        Options.AggregateFormat.Font.Size = 12
        Options.AggregateFormat.Font.Color = clrWhite
        Options.AggregateFormat.Font.Name = 'Impact'
        Options.AggregateFormat.Fill.Background = clrDarkTeal
        Options.AggregateFormat.Fill.Pattern = ptSolid
        Options.HyperlinkFormat.Font.Color = clrBlue
        Options.HyperlinkFormat.Font.Underline = fulSingle
        Options.NoteFormat.Alignment.Horizontal = halLeft
        Options.NoteFormat.Alignment.Vertical = valTop
        Options.NoteFormat.Font.Size = 8
        Options.NoteFormat.Font.Style = [xfsBold]
        Options.NoteFormat.Font.Name = 'Tahoma'
        FieldFormats = <
          item
            FieldName = 'AREA'
            Aggregate = aggMax
          end
          item
            FieldName = 'POPULATION'
            Aggregate = aggMin
          end>
        StripStyles = <
          item
            Fill.Background = clrPaleBlue
            Fill.Pattern = ptSolid
          end
          item
            Fill.Background = clrLightTurquoise
            Fill.Pattern = ptSolid
          end>
        StripType = ssRow
        Hyperlinks = <
          item
            Row = 2
            Col = 2
            Title = 'www.quickexport.net'
            Target = 'www.quickexport.net'
            Format.Font.Size = 14
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrBlue
            Format.Font.Underline = fulSingle
            Format.Font.Name = 'Tahoma'
          end>
        Notes = <
          item
            Row = 1
            Col = 1
            Lines.Strings = (
              'We hope you will like new features of the '
              'QuickExport component suite.')
            Format.Alignment.Horizontal = halLeft
            Format.Alignment.Vertical = valTop
            Format.BackgroundColor = clBlack
            Format.ForegroundColor = clAqua
            Format.FillType = nftGradient
            Format.Font.Size = 12
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrWhite
            Format.Font.Name = 'Arial Black'
            Format.Transparency = 25
            Format.Gradient = ngrDiagonalDown
          end>
        Charts = <
          item
            CategoryLabelsColumn = 'Name'
            Position.AutoPosition.Height = 18
            Position.AutoPosition.Top = 1
            Series = <
              item
                DataColumn = 'AREA'
                Title = 'Country Area'
              end>
            Style = xcsLine
            Title = 'Country Area'
          end>
        DataSet = Table1
        Header.Strings = (
          
            'We are glad to present a new version of the TQExport3XLS compone' +
            'nt '
          'Welcome to'
          '')
        Captions.Strings = (
          '')
        Footer.Strings = (
          ''
          ''
          ''
          'This file was generated by'#9'EMS Quick Export Component Suite 3.0')
        Formats.DateFormat = 'dd/MM/yyyy'
        Formats.DateTimeFormat = 'dd/MM/yyyy h:mm'
        Formats.CurrencyFormat = '00.00'#1088'.'
        ColumnsWidth.Strings = (
          'NAME=30'
          'AREA=15'
          'POPULATION=20')
      end
      item
        Title = 'DBGrid'
        Options.PageFooter = 'Page &P of &N'
        Options.SheetTitle = 'Sheet 1'
        Options.HeaderFormat.Font.Size = 14
        Options.HeaderFormat.Font.Style = [xfsBold]
        Options.HeaderFormat.Font.Name = 'Tahoma'
        Options.CaptionsFormat.Font.Size = 16
        Options.CaptionsFormat.Font.Style = [xfsBold]
        Options.CaptionsFormat.Font.Color = clrWhite
        Options.CaptionsFormat.Font.Name = 'Impact'
        Options.CaptionsFormat.Fill.Background = clrDarkYellow
        Options.CaptionsFormat.Fill.Pattern = ptSolid
        Options.CaptionsFormat.Alignment.Horizontal = halCenter
        Options.AggregateFormat.Font.Size = 12
        Options.AggregateFormat.Font.Color = clrWhite
        Options.AggregateFormat.Font.Name = 'Impact'
        Options.AggregateFormat.Fill.Background = clrDarkYellow
        Options.AggregateFormat.Fill.Pattern = ptSolid
        Options.HyperlinkFormat.Font.Color = clrBlue
        Options.HyperlinkFormat.Font.Underline = fulSingle
        Options.NoteFormat.Alignment.Horizontal = halLeft
        Options.NoteFormat.Alignment.Vertical = valTop
        Options.NoteFormat.Font.Size = 8
        Options.NoteFormat.Font.Style = [xfsBold]
        Options.NoteFormat.Font.Name = 'Tahoma'
        FieldFormats = <
          item
            FieldName = 'AREA'
            Aggregate = aggSum
          end
          item
            FieldName = 'POPULATION'
            Aggregate = aggAvg
          end>
        StripStyles = <
          item
            Fill.Background = clrGray40Percent
            Fill.Pattern = ptSolid
          end
          item
            Font.Color = clrSeaGreen
            Fill.Background = clrGray25Percent
            Fill.Pattern = ptSolid
          end>
        StripType = ssCol
        Hyperlinks = <
          item
            Row = 2
            Col = 2
            Title = 'www.quickexport.net'
            Target = 'www.quickexport.net'
            Format.Font.Size = 14
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrBlue
            Format.Font.Underline = fulSingle
            Format.Font.Name = 'Tahoma'
          end>
        Notes = <
          item
            Row = 1
            Col = 1
            Lines.Strings = (
              'We hope you will like new features of the '
              'QuickExport component suite.')
            Format.Alignment.Horizontal = halLeft
            Format.Alignment.Vertical = valTop
            Format.BackgroundColor = clGray
            Format.ForegroundColor = clSilver
            Format.FillType = nftGradient
            Format.Font.Size = 12
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrGreen
            Format.Font.Name = 'Arial Black'
          end>
        Charts = <
          item
            CategoryLabelsColumn = 'NAME'
            Position.AutoPosition.Placement = cpRight
            Position.AutoPosition.Height = 18
            Position.AutoPosition.Left = 1
            Position.AutoPosition.Top = 4
            Position.AutoPosition.Width = 6
            Series = <
              item
                DataColumn = 'POPULATION'
                Title = 'Population'
              end>
            Style = xcsPie
            Title = 'Population'
          end>
        ExportSource = esDBGrid
        DBGrid = DBGrid2
        Header.Strings = (
          
            'We are glad to present a new version of the TQExport3XLS compone' +
            'nt '
          'Welcome to'
          '')
        Footer.Strings = (
          ''
          ''
          ''
          'This file was generated by'#9'EMS Quick Export Component Suite 3.0')
        Formats.DateFormat = 'dd/MM/yyyy'
        Formats.DateTimeFormat = 'dd/MM/yyyy h:mm'
        Formats.CurrencyFormat = '00.00$'
        Formats.NullString = 'null'
        ColumnsWidth.Strings = (
          'NAME=30'
          'AREA=15'
          'POPULATION=20')
      end
      item
        Title = 'ListView'
        Options.PageFooter = 'Page &P of &N'
        Options.SheetTitle = 'Sheet 1'
        Options.HeaderFormat.Font.Size = 14
        Options.HeaderFormat.Font.Style = [xfsBold]
        Options.HeaderFormat.Font.Name = 'Tahoma'
        Options.CaptionsFormat.Font.Size = 16
        Options.CaptionsFormat.Font.Style = [xfsBold]
        Options.CaptionsFormat.Font.Color = clrWhite
        Options.CaptionsFormat.Font.Name = 'Impact'
        Options.CaptionsFormat.Fill.Background = clrDarkRed
        Options.CaptionsFormat.Fill.Pattern = ptSolid
        Options.CaptionsFormat.Alignment.Horizontal = halCenter
        Options.AggregateFormat.Font.Size = 12
        Options.AggregateFormat.Font.Color = clrWhite
        Options.AggregateFormat.Font.Name = 'Impact'
        Options.AggregateFormat.Fill.Background = clrDarkRed
        Options.AggregateFormat.Fill.Pattern = ptSolid
        Options.HyperlinkFormat.Font.Color = clrBlue
        Options.HyperlinkFormat.Font.Underline = fulSingle
        Options.NoteFormat.Alignment.Horizontal = halLeft
        Options.NoteFormat.Alignment.Vertical = valTop
        Options.NoteFormat.Font.Size = 8
        Options.NoteFormat.Font.Style = [xfsBold]
        Options.NoteFormat.Font.Name = 'Tahoma'
        FieldFormats = <
          item
            Fill.Background = clrTan
            Fill.Pattern = ptSolid
            FieldName = 'Name'
          end
          item
            Fill.Background = clrGold
            Fill.Pattern = ptSolid
            FieldName = 'Capital'
          end
          item
            Fill.Background = clrLightYellow
            Fill.Pattern = ptSolid
            FieldName = 'Continent'
          end
          item
            Fill.Background = clrGold
            Fill.Pattern = ptSolid
            FieldName = 'Area'
            Aggregate = aggMax
          end
          item
            Fill.Background = clrTan
            Fill.Pattern = ptSolid
            FieldName = 'Population'
            Aggregate = aggMin
          end>
        StripStyles = <>
        Hyperlinks = <
          item
            Row = 2
            Col = 2
            Title = 'www.quickexport.net'
            Target = 'www.quickexport.net'
            Format.Font.Size = 14
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrBlue
            Format.Font.Underline = fulSingle
            Format.Font.Name = 'Tahoma'
          end>
        Notes = <
          item
            Row = 1
            Col = 1
            Lines.Strings = (
              'We hope you will like new features of the '
              'QuickExport component suite.')
            Format.Alignment.Horizontal = halLeft
            Format.Alignment.Vertical = valTop
            Format.BackgroundColor = 52479
            Format.ForegroundColor = 10079487
            Format.FillType = nftGradient
            Format.Font.Size = 12
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrDarkRed
            Format.Font.Name = 'Arial Black'
            Format.Gradient = ngrVertical
          end>
        Charts = <>
        ExportSource = esListView
        ListView = ListView1
        Header.Strings = (
          
            'We are glad to present a new version of the TQExport3XLS compone' +
            'nt '
          'Welcome to'
          '')
        Footer.Strings = (
          ''
          ''
          ''
          'This file was generated by'#9'EMS Quick Export Component Suite 3.0')
        Formats.CurrencyFormat = '00.00$'
        Formats.NullString = 'null'
        ColumnsWidth.Strings = (
          'NAME=30'
          'AREA=15'
          'CONTINENT=15'
          'POPULATION=20')
        AutoCalcStrType = True
      end
      item
        Title = 'StringGrid'
        Options.PageFooter = 'Page &P of &N'
        Options.SheetTitle = 'Sheet 1'
        Options.HeaderFormat.Font.Size = 14
        Options.HeaderFormat.Font.Style = [xfsBold]
        Options.HeaderFormat.Font.Name = 'Tahoma'
        Options.CaptionsFormat.Font.Size = 16
        Options.CaptionsFormat.Font.Style = [xfsBold]
        Options.CaptionsFormat.Font.Color = clrWhite
        Options.CaptionsFormat.Font.Name = 'Impact'
        Options.CaptionsFormat.Fill.Background = clrBlack
        Options.CaptionsFormat.Fill.Pattern = ptSolid
        Options.CaptionsFormat.Alignment.Horizontal = halCenter
        Options.AggregateFormat.Font.Size = 12
        Options.AggregateFormat.Font.Color = clrWhite
        Options.AggregateFormat.Font.Name = 'Impact'
        Options.AggregateFormat.Fill.Background = clrBlack
        Options.AggregateFormat.Fill.Pattern = ptSolid
        Options.HyperlinkFormat.Font.Color = clrBlue
        Options.HyperlinkFormat.Font.Underline = fulSingle
        Options.NoteFormat.Alignment.Horizontal = halLeft
        Options.NoteFormat.Alignment.Vertical = valTop
        Options.NoteFormat.Font.Size = 8
        Options.NoteFormat.Font.Style = [xfsBold]
        Options.NoteFormat.Font.Name = 'Tahoma'
        FieldFormats = <
          item
            FieldName = '3'
            Aggregate = aggSum
          end
          item
            FieldName = '4'
            Aggregate = aggAvg
          end>
        StripStyles = <>
        Hyperlinks = <
          item
            Row = 2
            Col = 2
            Title = 'www.quickexport.net'
            Target = 'www.quickexport.net'
            Format.Font.Size = 14
            Format.Font.Style = [xfsBold]
            Format.Font.Color = clrBlue
            Format.Font.Underline = fulSingle
            Format.Font.Name = 'Tahoma'
          end>
        Notes = <
          item
            Row = 1
            Col = 1
            Lines.Strings = (
              'We hope you will like new features of the '
              'QuickExport component suite.')
            Format.Alignment.Horizontal = halLeft
            Format.Alignment.Vertical = valTop
            Format.BackgroundColor = 16764057
            Format.ForegroundColor = 52479
            Format.FillType = nftGradient
            Format.Font.Size = 12
            Format.Font.Style = [xfsBold]
            Format.Font.Name = 'Arial Black'
          end>
        Charts = <>
        ExportSource = esStringGrid
        StringGrid = StringGrid1
        Header.Strings = (
          
            'We are glad to present a new version of the TQExport3XLS compone' +
            'nt '
          'Welcome to'
          '')
        Captions.Strings = (
          '')
        Footer.Strings = (
          ''
          ''
          ''
          'This file was generated by'#9'EMS Quick Export Component Suite 3.0')
        Formats.CurrencyFormat = '00.00$'
        Formats.NullString = 'null'
        ColumnsWidth.Strings = (
          '0=30'
          '3=15'
          '4=20')
        AutoCalcStrType = True
        CaptionRow = 0
      end>
    OnGetHeaderParams = QExportXLS1GetHeaderParams
    OnGetDataParams = QExportXLS1GetDataParams
    OnGetFooterParams = QExportXLS1GetFooterParams
    Left = 166
    Top = 136
  end
end
