unit QExport3Common;

{$I VerCtrl.inc}

{$IFDEF VCL6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}

interface

uses
  Classes, QExport3, QExport3XLS, QExport3RTF, IniFiles, Db, TypInfo,
  QExport3Types, QExport3CustomSource, QExport3XLSCommon
  {$IFDEF WIN32}
    , Windows {$IFNDEF NOGUI}, Graphics, Controls, ExtCtrls, ComCtrls, Dialogs,
    DbGrids, Grids, StdCtrls, Messages{$ELSE}, QExport3Graphics{$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
    {$IFNDEF NOGUI}, QGraphics, QDialogs, QExtCtrls, QControls,
    QComCtrls, Types, QDbGrids, QGrids, QStdCtrls{$ELSE}, QExportG3raphics{$ENDIF}
  {$ENDIF};

{$IFNDEF NOGUI}
type
  TListItemProc = procedure(Item: TListItem) of object;
  TxlsCustomItemProc = procedure(Item: TxlsCustomItem) of object;
{$ENDIF}

const
  //------------------------
  // Don't localize this !!!
  //------------------------
  S_PRODUCT_NAME = 'Planus - Exportação de Dados';
  S_ABOUT = '(Sobre - Planus - Exportação de Dados)';
  S_REG_URL = 'www.funcef.com.br';
  //--------------
  S_FULL_PRODUCT_NAME = 'Planus - Exportação de Dados';
  S_VERSION = '3.36';
  S_COMPONENT_PAGE = 'Planus - Exportação de Dados';

  CRLF = #13#10;

  S_INTEGER_FORMAT = '#,###,##0';
  S_FLOAT_FORMAT = '#,###,##0.00';
  S_BOOLEAN_TRUE = 'true';
  S_BOOLEAN_FALSE = 'false';
  S_NULL_STRING = 'null';

  S_XLS_MAX_ROWS = {$IFDEF WIN32}65536{$ELSE}32000{$ENDIF};
  XL = 8;

  S_RTF_SAMPLE_TEXT = 'AaBbCc XxYyZz';

  S_GENERAL = 'GENERAL';
    S_FileName = 'FileName';
    S_ExportType = 'ExportType';
    S_ShowFile = 'ShowFile';
    S_PrintFile = 'PrintFile';
    S_GoToFirstRecord = 'GoToFirstRecord';
    S_CurrentRecordOnly = 'CurrentRecordOnly';
    S_ExportEmpty = 'ExportEmpty';
    S_ExportAllRecords = 'ExportAllRecords';
    S_ExportRecCount = 'ExportRecCount';
    S_SkipRecCount = 'SkipRecCount';
    S_AllowCaptions = 'AllowCaptions';
    S_OnlyVisibleFields = 'OnlyVisibleFields';
    S_AutoCalcStrType = 'AutocalcStrType';
    S_CaptionRow = 'CaptionRow';
  S_FORMATS = 'FORMATS';
    S_Integer = 'Integer';
    S_Float = 'Float';
    S_Date = 'Date';
    S_Time = 'Time';
    S_DateTime = 'DateTime';
    S_Currency = 'Currency';
    S_BooleanTrue = 'BooleanTrue';
    S_BooleanFalse = 'BooleanFalse';
    S_NullString = 'NullString';
  S_USER_FORMATS = 'USER_FORMATS';
  S_FIELDS = 'FIELDS';
    S_Field = 'field';
  S_HEADER = 'HEADER';
  S_FOOTER = 'FOOTER';
    S_Line = 'line';
  S_CAPTIONS = 'CAPTIONS';
  S_WIDTH = 'WIDTH';
  S_ALIGN = 'ALIGN';
  S_LENGTH = 'LENGTH';
  S_XLS = 'XLS';
    S_PageHeader = 'PageHeader';
    S_PageFooter = 'PageFooter';
    S_SheetTitle = 'SheetTitle';
    S_StripType = 'StripType';
    S_AutoCalcColWidth = 'AutoCalcColWidth';
    S_PageBackground = 'PageBackground';
  S_XLS_FIELD = 'XLS_FIELD_';
  S_XLS_OPTION = 'XLS_OPTION_';
  S_XLS_OPTION_HEADER = 'XLS_OPTION_HEADER';
  S_XLS_OPTION_CAPTION = 'XLS_OPTION_CAPTION';
  S_XLS_OPTION_AGGREGATE = 'XLS_OPTION_AGGREGATE';
  S_XLS_OPTION_FOOTER = 'XLS_OPTION_FOOTER';
  S_XLS_STYLE = 'XLS_STYLE_';
  S_XLS_HYPERLINK = 'XLS_HYPERLINK_';
  S_XLS_NOTE = 'XLS_NOTE_';
  S_XLS_SERIES = '_SERIES_';
  S_XLS_CHART = 'XLS_CHART_';
  S_XLS_CELL = 'XLS_CELL_';
  S_XLS_MERGED_CELL = 'XLS_MERGED_CELL_';
    S_XLS_FontName = 'FontName';
    S_XLS_FontSize = 'FontSize';
    S_XLS_FontColor = 'FontColor';
    S_XLS_FontBold = 'FontBold';
    S_XLS_FontItalic = 'FontItalic';
    S_XLS_FontStrikeOut = 'FontStrikeOut';
    S_XLS_FontUnderline = 'FontUnderline';
    S_XLS_HorAlignment = 'HorAlignment';
    S_XLS_VertAlignment = 'VertAlignment';
    S_XLS_BorderTop = 'BorderTop';
    S_XLS_BorderTopColor = 'BorderTopColor';
    S_XLS_BorderBottom = 'BorderBottom';
    S_XLS_BorderBottomColor = 'BorderBottomColor';
    S_XLS_BorderLeft = 'BorderLeft';
    S_XLS_BorderLeftColor = 'BorderLeftColor';
    S_XLS_BorderRight = 'BorderRight';
    S_XLS_BorderRightColor = 'BorderRightColor';
    S_XLS_FillPattern = 'FillPattern';
    S_XLS_FillBackground = 'FillBackground';
    S_XLS_FillForeground = 'FillForeground';
    S_XLS_Aggregate = 'Aggregate';
    S_XLS_Hyperlink_Col = 'Col';
    S_XLS_Hyperlink_Row = 'Row';
    S_XLS_Hyperlink_Style = 'Style';
    S_XLS_Hyperlink_Title = 'Title';
    S_XLS_Hyperlink_Target = 'Target';
    S_XLS_Hyperlink_ScreenTip = 'ScreenTip';
    S_XLS_Note_Col = 'Col';
    S_XLS_Note_Row = 'Row';
    S_XLS_Note_Lines = 'LINES';
    S_XLS_Note_FontName = 'FontName';
    S_XLS_Note_FontSize = 'FontSize';
    S_XLS_Note_FontColor = 'FontColor';
    S_XLS_Note_FontBold = 'FontBold';
    S_XLS_Note_FontItalic = 'FontItalic';
    S_XLS_Note_FontStrikeOut = 'FontStrikeOut';
    S_XLS_Note_FontUnderline = 'FontUnderline';
    S_XLS_Note_HorAlignment = 'HorAlignment';
    S_XLS_Note_VertAlignment = 'VertAlignment';
    S_XLS_Note_BackgroundColor = 'BackgroundColor';
    S_XLS_Note_ForegroundColor = 'ForegroundColor';
    S_XLS_Note_FillType = 'FillType';
    S_XLS_Note_Transparency = 'Transparency';
    S_XLS_Note_Orientation = 'Orientation';
    S_XLS_Note_Gradient = 'Gradient';
    S_XLS_DataRange_Col1 = 'Col1';
    S_XLS_DataRange_Row1 = 'Row1';
    S_XLS_DataRange_Col2 = 'Col2';
    S_XLS_DataRange_Row2 = 'Row2';
    S_XLS_Series_Color = 'Color';
    S_XLS_Series_Title = 'Title';
    S_XLS_Series_DataColumn = 'Column';
    S_XLS_Series_DataRangeType = 'DataRangeType';
    S_XLS_ChartPlacement = 'ChartPlacement';
    S_XLS_ChartHeight = 'ChartHeight';
    S_XLS_ChartLeft = 'ChartLeft';
    S_XLS_ChartTop = 'ChartTop';
    S_XLS_ChartWidth = 'ChartWidth';
    S_XLS_ChartPosition_X1 = 'X1';
    S_XLS_ChartPosition_Y1 = 'Y1';
    S_XLS_ChartPosition_X2 = 'X2';
    S_XLS_ChartPosition_Y2 = 'Y2';
    S_XLS_ChartPositionType = 'PositionType';
    S_XLS_Chart_AutoColor = 'AutoColor';
    S_XLS_Chart_LegendPlacement = 'LegendPlacement';
    S_XLS_Chart_ShowLegend = 'ShowLegend';
    S_XLS_Chart_Style = 'Style';
    S_XLS_Chart_Title = 'Title';
    S_XLS_Chart_CategoryLabelsType = 'CategoryLabelsType';
    S_XLS_Chart_CategoryLabelsColumn = 'CategoryLabelsColumn';
    S_XLS_Cell_CellType = 'CellType';
    S_XLS_Cell_Col = 'Col';
    S_XLS_Cell_Row = 'Row';
    S_XLS_Cell_DateTimeFormat = 'DateTimeFormat';
    S_XLS_Cell_NumericFormat = 'NumericFormat';
    S_XLS_Cell_BooleanValue = 'BooleanValue';
    S_XLS_Cell_DateTimeValue_Year = 'Year';
    S_XLS_Cell_DateTimeValue_Month = 'Month';
    S_XLS_Cell_DateTimeValue_Day = 'Day';
    S_XLS_Cell_DateTimeValue_Hour = 'Hour';
    S_XLS_Cell_DateTimeValue_Min = 'Min';
    S_XLS_Cell_DateTimeValue_Sec = 'Sec';
    S_XLS_Cell_DateTimeValue_MSec = 'MSec';
    S_XLS_Cell_NumericValue_Separator = 'Separator';
    S_XLS_Cell_NumericValue = 'NumericValue';
    S_XLS_Cell_StringValue = 'StringValue';
    S_XLS_MergedCell_FirstCol = 'FirstCol';
    S_XLS_MergedCell_FirstRow = 'FirstRow';
    S_XLS_MergedCell_LastCol = 'LastCol';
    S_XLS_MergedCell_LastRow = 'LastRow';
  S_RTF = 'RTF';
    S_RTF_PageOrientation = 'PageOrientation';
//    S_RTF_DefaultCaptionAlign = 'DefaultCaptionAlign';
    S_RTF_StripType = 'StripType';
  S_RTF_STYLE = 'RTF_STYLE_';
  S_RTF_STYLE_HEADER = 'RTF_STYLE_HEADER';
  S_RTF_STYLE_CAPTION = 'RTF_STYLE_CAPTION';
  S_RTF_STYLE_DATA = 'RTF_STYLE_DATA';
  S_RTF_STYLE_FOOTER = 'RTF_STYLE_FOOTER';
  S_RTF_STRIP_STYLE = 'RTF_STRIP_STYLE_';
    S_RTF_FontName = 'FontName';
    S_RTF_FontSize = 'FontSize';
    S_RTF_FontColor = 'FontColor';
    S_RTF_FontBold = 'FontBold';
    S_RTF_FontItalic = 'FontItalic';
    S_RTF_FontUnderline = 'FontUnderline';
    S_RTF_FontStrikeOut = 'FontStrikeOut';
    S_RTF_BackgroundColor = 'BackgroundColor';
    S_RTF_HighlightColor = 'HighlightColor';
    S_RTF_AllowHighlight = 'AllowHighlight';
    S_RTF_AllowBackground = 'AllowBackground';
    S_RTF_Alignment = 'Alignment';
  S_HTML = 'HTML';
    S_HTML_Title = 'Title';
    S_HTML_CSS = 'CSS';
    S_HTML_CSSFile = 'CSSFile';
    S_HTML_OverwriteCSSFile='OverwriteCSSFile';
    S_HTML_FileRecCount = 'FileRecCount';
    S_HTML_GenerateIndex = 'GenerateIndex';
    S_HTML_IndexLinkTemplate = 'IndexLinkTemplate';
    S_HTML_NavigationOnTop = 'NavigationOnTop';
    S_HTML_NavigationOnBottom = 'NavigationOnBottom';
    S_HTML_IndexLinkTitle = 'IndexLinkTitle';
    S_HTML_FirstLinkTitle = 'FirstLinkTitle';
    S_HTML_PriorLinkTitle = 'PriorLinkTitle';
    S_HTML_NextLinkTitle = 'NextLinkTitle';
    S_HTML_LastLinkTitle = 'LastLinkTitle';
    S_HTML_FontName = 'FontName';
    S_HTML_FontColor = 'FontColor';
    S_HTML_BackgroundColor = 'BackgroundColor';
    S_HTML_BackgroundFile = 'BackgroundFile';
    S_HTML_BodyAdvanced = 'BodyAdvanced';
    S_HTML_CellPadding = 'CellPadding';
    S_HTML_CellSpacing = 'CellSpacing';
    S_HTML_BorderWidth = 'BorderWidth';
    S_HTML_TableBackground = 'TableBackground';
    S_HTML_TableAdvanced = 'TableAdvanced';
    S_HTML_HeadBackgroundColor = 'HeadBackgroundColor';
    S_HTML_HeadFontColor = 'HeadFontColor';
    S_HTML_OddRowBackgroundColor = 'OddRowBackgroundColor';
    S_HTML_EvenRowBackgroundColor = 'EvenRowBackgroundColor';
    S_HTML_DataFontColor = 'DataFontColor';
    S_HTML_LinkColor = 'LinkColor';
    S_HTML_VLinkColor = 'VLinkColor';
    S_HTML_ALinkColor = 'ALinkColor';
  S_XML = 'XML';
    S_XML_Standalone = 'Standalone';
    S_XML_Encoding = 'Encoding';
  S_SQL = 'SQL';
    S_SQL_TableName = 'TableName';
    S_SQL_CreateTable = 'CreateTable';
    S_SQL_CommitRecCount = 'CommitRecCount';
    S_SQL_CommitAfterScript = 'CommitAfterScript';
    S_SQL_CommitStatement = 'CommitStatement';
    S_SQL_NullValues = 'NullValues';
    S_SQL_StatementTerm = 'StatementTerm';
  S_TXT = 'TXT';
    S_TXT_AutoCalcColWidth = 'AutoCalcColWidth';
    S_TXT_Spacing = 'Spacing';
  S_CSV = 'CSV';
    S_CSV_QuoteStrings = 'QuoteStrings';
    S_CSV_Comma = 'Comma';
    S_CSV_Quote = 'Quote';
  S_ASCII = 'ASCII';
    S_ASCII_ExportType = 'ExportType';
    S_ASCII_AutoCalcColWidth = 'AutoCalcColWidth';
  S_ACCESS = 'ACCESS';
    S_ACCESS_Password = 'Password';
    S_ACCESS_TableName = 'TableName';
    S_ACCESS_CreateTable = 'CreateTable';
  S_PDF = 'PDF';
    S_PDF_ColSpacing = 'ColSpacing';
    S_PDF_RowSpacing = 'RowSpacing';
    S_PDF_GridLineWidth = 'GridLineWidth';
    S_PDF_PageFormat = 'PageFormat';
    S_PDF_PageWidth = 'PageWidth';
    S_PDF_PageHeight = 'PageHeight';
    S_PDF_PageUnits = 'PageUnits';
    S_PDF_PageOrientation = 'PageOrientation';
    S_PDF_PageMarginLeft = 'PageMarginLeft';
    S_PDF_PageMarginRight = 'PageMarginRight';
    S_PDF_PageMarginTop = 'PageMarginTop';
    S_PDF_PageMarginBottom = 'PageMarginBottom';
  S_PDF_OPTION_HEADER = 'PDF_OPTION_HEADER';
  S_PDF_OPTION_CAPTION = 'PDF_OPTION_CAPTION';
  S_PDF_OPTION_DATA = 'PDF_OPTION_DATA';
  S_PDF_OPTION_FOOTER = 'PDF_OPTION_FOOTER';
    S_PDF_FontName = 'FontName';
    S_PDF_FontEncoding = 'FontEncoding';
    S_PDF_FontSize = 'FontSize';
    S_PDF_FontColor = 'FontColor'; 

  //--- TFont
  S_FontName      = 'FontName';
  S_FontSize      = 'FontSize';
  S_FontBold      = 'FontBold';
  S_FontItalic    = 'FontItalic';
  S_FontUnderline = 'FontUnderline';
  S_FontStrikeOut = 'FontStrikeOut';
  S_FontColor     = 'FontColor';
  S_FontCharset   = 'FontCharset';

  S_Commit = 'COMMIT WORK;';
  S_CreateTable = 'CREATE TABLE %s';
  S_Insert = 'INSERT INTO %s';
  S_Values = 'VALUES';

  S_Index = 'Index';
  S_First = 'First';
  S_Prior = 'Prior';
  S_Next = 'Next';
  S_Last = 'Last';

  DefaultDotPerInch = 72;
  DefaultMMPerInch  = 25.4;

var
  DefaultDateFormat: string;
  DefaultTimeFormat: string;
  DefaultDateTimeFormat: string;
  DefaultCurrencyFormat: string;

procedure EditFontStyle(Font: TFont; Style: TFontStyle; Add: boolean);
procedure EditFontStyleXLS(Font: TxlsFont; Style: TxlsFontStyle; Add: boolean);
procedure SaveFontToIniFile(Font: TFont; IniFile: TIniFile;
  const Section: string);
procedure LoadFontFromIniFile(Font, Default: TFont; IniFile: TIniFile;
  const Section: string);

{$IFNDEF NOGUI}
procedure RTFItemEditFontStyle(Item: TListItem; Style: TFontStyle;
  Add: boolean);
procedure XLSItemEditFontStyle(Item: TListItem; Style: TxlsFontStyle;
  Add: boolean); // uncomment by pai
procedure XLSCustomFormatEditFontStyle(Item: TxlsCustomItem;
  Style: TxlsFontStyle; Add: boolean);
procedure PaintXLSColors(PaintBox: TPaintBox; AColor: TxlsColor);
procedure PaintStandardColors(PaintBox: TPaintBox; AColor: TColor);
procedure XLSItemSetUnderline(Item: TListItem; Underline: TxlsFontUnderline); // uncomment by pai
procedure XLSCustomItemSetUnderline(Item: TxlsCustomItem;
  Underline: TxlsFontUnderline);
procedure XLSItemSetHorAlignment(Item: TListItem;
  HorAlignment: TxlsHorizontalAlignment); // uncomment by pai
procedure XLSCustomItemSetHorAlignment(Item: TxlsCustomItem;
  HorAlignment: TxlsHorizontalAlignment);
procedure RTFItemSetAlignment(Item: TListItem; Alignment: TrtfTextAlignment);
procedure XLSItemSetVertAlignment(Item: TListItem;
  VertAlignment: TxlsVerticalAlignment); // uncomment by pai
procedure XLSCustomItemSetVertAlignment(Item: TxlsCustomItem;
  VertAlignment: TxlsVerticalAlignment);
procedure DrawXLSCell(PaintBox: TPaintBox; Format: TxlsFormat);
procedure DrawRTFSample(PaintBox: TPaintBox; rtfStyle: TrtfStyle);
procedure DrawBorderStyle(Style: TxlsBorderStyle; Canvas: TCanvas; Rect: TRect);

procedure SelectFontForPaintBox(FontDialog: TFontDialog; AFont: TFont;
  APaintBox: TPaintBox);
procedure PaintSampleFont(AFont: TFont; APaintBox: TPaintBox;
  PaintColor: boolean);

procedure DrawPattern(Canvas: TCanvas; Index, X, Y: integer);

procedure IncLeftAndTop(Control: TControl);
procedure DecLeftAndTop(Control: TControl);

procedure SetListItemIndex(Item: TListItem; Index: integer);
function MoveListItem(Item: TListItem; Dst: TListView; Move: boolean;
  Index: integer): TListItem;

function GetTextWidth(Control: TControl; const Text: string): integer;

procedure ForAllListViewItems(ListView: TListView; Proc: TListItemProc;
  IsDownTo, All: boolean);
procedure ForAllListViewCustomItems(ListView: TListView;
  Proc: TxlsCustomItemProc; IsDownTo, All: boolean);

function GetMemoCaretPos(Memo: TMemo): {$IFDEF WIN32}TPoint{$ELSE}TCaretPos{$ENDIF};
{$ENDIF}

procedure SetDefaultRTFCaption(Style: TrtfStyle);
procedure SetDefaultXLSCaption(Format: TxlsFormat);
function ColorByXLSColor(XLSColor: TxlsColor): TColor;
function ColorToXLSColor(Color: TColor): TxlsColor;


function CalcStringType(const S,
  BooleanTrue, BooleanFalse: string): TQExportColType;

procedure QExportCheckSource(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource 
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
function QExportSource(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): TComponent;
procedure QExportGetColumns(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource; 
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF}ExportedFields, AvailableCols,
  ExportedCols: TStrings);
function QExportIsActive(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): boolean;
function QExportIsEmpty(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): boolean;
function QExportGetBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  CustomSource: TqeCustomSource{$IFNDEF NOGUI}; DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid{$ENDIF}): TBookmark;
procedure QExportGotoBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  CustomSource: TqeCustomSource;{$IFNDEF NOGUI}DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid;{$ENDIF} Bookmark: TBookmark);
procedure QExportFreeBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} Bookmark: TBookmark);
procedure QExportFirst(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI};DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
procedure QExportNext(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} var RecordCounter: integer);
procedure QExportSkip(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} SkipRecCount: integer;
  SkipEvent: TExportedRecordEvent; Sender: TObject; var RecordCounter: integer);
function QExportEof(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} RecordCounter, ExportRecCount,
  SkipRecCount: integer): boolean;
function QExportGetColData(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView; StringGrid: TStringGrid;{$ENDIF}
  Columns: TQExportColumns; Formats: TQExportFormats; NormalFunc: TNormalFunc;
  Index, RecordCounter, SkipRecCount: integer; NeedFormat: boolean): string;
function QExportFormatData(const DataStr, Format: string;
  ColType: TQExportColType; NormalFunc: TNormalFunc): string;
procedure QExportDisableControls(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
procedure QExportEnableControls(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});

procedure ClearIniFile(IniFile: TIniFile);
function Replace(const S, OldPattern, NewPattern: string): string;
function GetListSeparator: char;

function MinimumInt(V1, V2: integer): integer;
function MaximumInt(V1, V2: integer): integer;

{$IFNDEF NOGUI}
{$IFDEF WIN32}
function GetDisplayTextWidth(const Text: string; Font: TFont): integer;
{$ENDIF}
{$ENDIF}

{$IFDEF LINUX}
function RGB(Red, Green, Blue: byte): integer;
{$ENDIF}

function Str2Char(const Str: string): char;
function Char2Str(Chr: char): string;
function StrToDblDef(const Str: string; Default: double): double;

function InchToDot(const Value: double): integer;
function MMToDot(const Value: double): integer;
function DotToInch(const Value: integer): double;
function DotToMM(const Value: integer): double;
function GetPageFormatString(const pfFormat: TQExportPageFormat): string;
function GetPageFormatInchWidth(const pfFormat: TQExportPageFormat): double;
function GetPageFormatInchHeight(const pfFormat: TQExportPageFormat): double;
function RoundFraction(const X: double; const Digit: integer): double;
function Units2Dot(Units: TQExportUnits; Value: double): integer;
function Dot2Units(Units: TQExportUnits; Value: integer): double;

function AddNumberToFileName(const FileName: string; Number, Digits: integer): string;
function IniFileSectionExists(IniFile: TIniFile; const Section: string): Boolean;
function IniFileValueExists(IniFile: TIniFile; const Section, Ident: string): Boolean;

implementation

uses {$IFDEF WIN32}QExport3StrIDs{$ENDIF}
     {$IFDEF LINUX}QExport3Consts, SysUtils{$ENDIF}, SysUtils, Math;

procedure EditFontStyle(Font: TFont; Style: TFontStyle; Add: boolean);
begin
  if Add
    then Font.Style := Font.Style + [Style]
    else Font.Style := Font.Style - [Style];
end;


procedure EditFontStyleXLS(Font: TxlsFont; Style: TxlsFontStyle; Add: boolean);
begin
  if Add
    then Font.Style := Font.Style + [Style]
    else Font.Style := Font.Style - [Style];
end;

{$IFNDEF NOGUI}
procedure RTFItemEditFontStyle(Item: TListItem; Style: TFontStyle;
  Add: boolean);
begin
  EditFontStyle(TrtfStyle(Item.Data).Font, Style, Add);
end;

procedure XLSItemEditFontStyle(Item: TListItem; Style: TxlsFontStyle;
  Add: boolean);
begin
  EditFontStyleXLS(TxlsFormat(Item.Data).Font, Style, Add);
end;

procedure XLSCustomFormatEditFontStyle(Item: TxlsCustomItem;
  Style: TxlsFontStyle; Add: boolean);
var
  Font: TxlsFont;
begin
  Font := nil;
  case Item.ItemType of
    itFormat,
    itFieldFormat: Font := (Item as TxlsFormat).Font;
    itNoteFormat: Font := (Item as TxlsNoteFormat).Font;
    itHyperlink: Font := (Item as TxlsHyperlink).Format.Font;
    itNote: Font := (Item as TxlsNote).Format.Font;
  end;

  if Assigned(Font) then
    EditFontStyleXLS(Font, Style, Add);
end;

procedure PaintXLSColors(PaintBox: TPaintBox; AColor: TxlsColor);
begin
  with PaintBox.Canvas do begin
    Brush.Color := ColorByXLSColor(AColor);
    FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  end;
end;

procedure PaintStandardColors(PaintBox: TPaintBox; AColor: TColor);
begin
  with PaintBox.Canvas do begin
    Brush.Color := AColor;
    FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  end;
end;

procedure XLSItemSetUnderline(Item: TListItem; Underline: TxlsFontUnderline);
begin
  TxlsFormat(Item.Data).Font.Underline := Underline;
end;

procedure XLSCustomItemSetUnderline(Item: TxlsCustomItem;
  Underline: TxlsFontUnderline);
begin
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat: (Item as TxlsFormat).Font.Underline := Underline;
    itNoteFormat: (Item as TxlsNoteFormat).Font.Underline := Underline;
    itHyperlink: (Item as TxlsHyperlink).Format.Font.Underline := Underline;
    itNote: (Item as TxlsNote).Format.Font.Underline := Underline;
  end;
end;

procedure XLSItemSetHorAlignment(Item: TListItem;
  HorAlignment: TxlsHorizontalAlignment);
begin
  TxlsFormat(Item.Data).Alignment.Horizontal := HorAlignment;
end;

procedure XLSCustomItemSetHorAlignment(Item: TxlsCustomItem;
  HorAlignment: TxlsHorizontalAlignment);
begin
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat: (Item as TxlsFormat).Alignment.Horizontal := HorAlignment;
    itNoteFormat: (Item as TxlsNoteFormat).Alignment.Horizontal := HorAlignment;
    itHyperlink: (Item as TxlsHyperlink).Format.Alignment.Horizontal := HorAlignment;
    itNote: (Item as TxlsNote).Format.Alignment.Horizontal := HorAlignment;
  end;
end;

procedure RTFItemSetAlignment(Item: TListItem; Alignment: TrtfTextAlignment);
begin
  TrtfStyle(Item.Data).Alignment := Alignment;
end;

procedure XLSItemSetVertAlignment(Item: TListItem;
  VertAlignment: TxlsVerticalAlignment);
begin
  TxlsFormat(Item.Data).Alignment.Vertical := VertAlignment;
end;

procedure XLSCustomItemSetVertAlignment(Item: TxlsCustomItem;
  VertAlignment: TxlsVerticalAlignment);
begin
  if not Assigned(Item) then Exit;
  case Item.ItemType of
    itFormat,
    itFieldFormat: (Item as TxlsFormat).Alignment.Vertical := VertAlignment;
    itNoteFormat: (Item as TxlsNoteFormat).Alignment.Vertical := VertAlignment;
    itHyperlink: (Item as TxlsHyperlink).Format.Alignment.Vertical := VertAlignment;
    itNote: (Item as TxlsNote).Format.Alignment.Vertical := VertAlignment;
  end;
end;

{$ENDIF}

procedure SetDefaultRTFCaption(Style: TrtfStyle);
begin
  Style.SetDefault;
  EditFontStyle(Style.Font, fsBold, true);
  Style.Alignment := talCenter;
end;

procedure SetDefaultXLSCaption(Format: TxlsFormat);
begin
  Format.SetDefault;
  EditFontStyleXLS(Format.Font, xfsBold, true);
end;

function ColorByXLSColor(XLSColor: TxlsColor): TColor;
begin
  Result := XLS_STANDARD_PALETTE[Integer(XLSColor)];
end;

function ColorToXLSColor(Color: TColor): TxlsColor;
var
  i: integer;
begin
  Result := clrBlack;
  for i := 0 to 39 do
    if XLS_STANDARD_PALETTE[i] = Color then begin
      Result := TxlsColor(i);
      Break;
    end;
end;

{$IFNDEF NOGUI}
procedure DrawBorderStyle(Style: TxlsBorderStyle; Canvas: TCanvas; Rect: TRect);

  function DrawLine(Canvas: TCanvas; x1, y1, x2, y2, x3: integer): integer;
  begin
    Result := 0;
    with Canvas do begin
      MoveTo(x1, y1);
      if x2 >= x3 then begin
        x2 := x3;
        Result := -1;
      end;
      LineTo(x2, y2);
    end;
  end;

var
  x, y, l: integer;
begin
  with Canvas do begin
    Pen.Style := psSolid;
    case Style of
      bstMedium,
      bstMediumDashed,
      bstMediumDashDot,
      bstSlantedDashDot,
      bstMediumDashDotDot: Pen.Width := 2;
      bstThick: Pen.Width := 3;
      else Pen.Width := 1;
    end;

    l := (Rect.Right - Rect.Left) - 10;
    y := (Rect.Bottom + Rect.Top) div 2;
    x := 10;
    case Style of
      bstNone: TextOut((Rect.Right + Rect.Left - TextWidth({$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_None){$ENDIF}
                                                           {$IFDEF LINUX}QED_XLS_Border_None{$ENDIF})) div 2,
                       (Rect.Bottom + Rect.Top - TextHeight({$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_None){$ENDIF}
                                                            {$IFDEF LINUX}QED_XLS_Border_None{$ENDIF})) div 2,
                                                            {$IFDEF WIN32}QExportLoadStr(QED_XLS_Border_None){$ENDIF}
                                                            {$IFDEF LINUX}QED_XLS_Border_None{$ENDIF});

      bstThin,
      bstMedium,
      bstThick: DrawLine(Canvas, x, y, x + l, y, l);

      bstDashed,
      bstMediumDashed: while DrawLine(Canvas, x, y, x + 7, y, l) = 0  do Inc(x, 14);

      bstDotted: while DrawLine(Canvas, x, y, x + 3, y, l) = 0  do Inc(x, 6);

      bstDouble: begin
        DrawLine(Canvas, x, y - 1, x + l, y - 1, l);
        DrawLine(Canvas, x, y + 1, x + l, y + 1, l);
      end;

      bstHair: while DrawLine(Canvas, x, y, x + 2, y, l) = 0  do Inc(x, 4);

      bstDashDot,
      bstMediumDashDot,
      bstSlantedDashDot:
        while (DrawLine(Canvas, x, y, x + 7, y, l) = 0) do begin
          if DrawLine(Canvas, x + 11, y, x + 14, y, l) <> 0 then Break;
          Inc(x, 18);
        end;

      bstDashDotDot,
      bstMediumDashDotDot:
        while DrawLine(Canvas, x, y, x + 7, y, l) = 0 do begin
          if DrawLine(Canvas, x + 11, y, x + 14, y, l) <> 0 then Break;
          if DrawLine(Canvas, x + 18, y, x + 21, y, l) <> 0 then Break;
          Inc(x, 25);
        end
    end;
  end;
end;

procedure DrawPattern(Canvas: TCanvas; Index, X, Y: integer);
begin
  with Canvas do
    case Index of
      $02: begin
        MoveTo(X, Y);
        LineTo(X + 1, Y);
        MoveTo(X + 2, Y);
        LineTo(X + 3, Y);

        MoveTo(X + 1, Y + 1);
        LineTo(X + 2, Y + 1);
        MoveTo(X + 3, Y + 1);
        LineTo(X + 4, Y + 1);

        MoveTo(X, Y + 2);
        LineTo(X + 1, Y + 2);
        MoveTo(X + 2, Y + 2);
        LineTo(X + 3, Y + 2);

        MoveTo(X + 1, Y + 3);
        LineTo(X + 2, Y + 3);
        MoveTo(X + 3, Y + 3);
        LineTo(X + 4, Y + 3);
      end;
      $03: begin
        MoveTo(X + 1, Y);
        LineTo(X + 4, Y);

        MoveTo(X, Y + 1);
        LineTo(X + 2, Y + 1);
        MoveTo(X + 3, Y + 1);
        LineTo(X + 4, Y + 1);

        MoveTo(X + 1, Y + 2);
        LineTo(X + 4, Y + 2);

        MoveTo(X, Y + 3);
        LineTo(X + 2, Y + 3);
        MoveTo(X + 3, Y + 3);
        LineTo(X + 4, Y + 3);
      end;
      $04: begin
        MoveTo(X, Y);
        LineTo(X + 1, Y);

        MoveTo(X + 2, Y + 1);
        LineTo(X + 3, Y + 1);

        MoveTo(X, Y + 2);
        LineTo(X + 1, Y + 2);

        MoveTo(X + 2, Y + 3);
        LineTo(X + 3, Y + 3);
      end;
      $05: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y);

        MoveTo(X, Y + 1);
        LineTo(X + 4, Y + 1);
      end;
      $06: begin
        MoveTo(X, Y);
        LineTo(X, Y + 4);

        MoveTo(X + 1, Y);
        LineTo(X + 1, Y + 4);
      end;
      $07: begin
        MoveTo(X + 1, Y);
        LineTo(X + 5, Y + 4);

        MoveTo(X, Y);
        LineTo(X + 4, Y + 4);
      end;
      $08: begin
        MoveTo(X + 3, Y);
        LineTo(X - 1, Y + 4);

        MoveTo(X + 4, Y);
        LineTo(X, Y + 4);
      end;
      $09: begin
        MoveTo(X, Y);
        LineTo(X + 2, Y);

        MoveTo(X, Y + 1);
        LineTo(X + 2, Y + 1);

        MoveTo(X + 2, Y + 2);
        LineTo(X + 4, Y + 2);

        MoveTo(X + 2, Y + 3);
        LineTo(X + 4, Y + 3);
      end;
      $0A: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y);

        MoveTo(X, Y + 1);
        LineTo(X + 2, Y + 1);

        MoveTo(X + 2, Y + 2);
        LineTo(X + 4, Y + 2);

        MoveTo(X, Y + 3);
        LineTo(X + 4, Y + 3);
      end;
      $0B: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y);
      end;
      $0C: begin
        MoveTo(X, Y);
        LineTo(X, Y + 4);
      end;
      $0D: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y + 4);
      end;
      $0E: begin
        MoveTo(X + 4, Y);
        LineTo(X, Y + 4);
      end;
      $0F: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y);

        MoveTo(X, Y);
        LineTo(X, Y + 4);
      end;
      $10: begin
        MoveTo(X, Y);
        LineTo(X + 4, Y + 4);

        MoveTo(X + 2, Y);
        LineTo(X, Y + 2);
      end;
      $11: begin
        MoveTo(X, Y);
        LineTo(X + 1, Y);

        MoveTo(X + 2, Y + 2);
        LineTo(X + 3, Y + 2);
      end;
      $12: begin
        MoveTo(X, Y);
        LineTo(X + 1, Y);

        MoveTo(X + 4, Y + 2);
        LineTo(X + 5, Y + 2);
      end;
    end;
end;

procedure IncLeftAndTop(Control: TControl);
begin
  Control.Left := Control.Left + 1;
  Control.Top := Control.Top + 1;
end;

procedure DecLeftAndTop(Control: TControl);
begin
  Control.Left := Control.Left - 1;
  Control.Top := Control.Top - 1;
end;

procedure PaintSampleFont(AFont: TFont; APaintBox: TPaintBox;
  PaintColor: boolean);
const
  SampleText = 'AaBbCc XxYyZz';
var
  TextLength: integer;
begin
  with APaintBox.Canvas do begin
    Pen.Color := clBlack;
    Brush.Color := clWhite;
    Brush.Style := bsSolid;
    Rectangle(0, 0, APaintBox.Width, APaintBox.Height);
    Font.Assign(AFont);
    if not PaintColor then
      Font.Color := clBlack;
    TextLength := TextWidth(SampleText);
    TextOut((APaintBox.Width - TextLength) div 2,
      (APaintBox.Height - TextHeight(SampleText)) div 2, SampleText);
  end;
end;

procedure SelectFontForPaintBox(FontDialog: TFontDialog; AFont: TFont;
  APaintBox: TPaintBox);
begin
  FontDialog.Font.Assign(AFont);
  if FontDialog.Execute then begin
    AFont.Assign(FontDialog.Font);
    APaintBox.Repaint;
  end;
end;

procedure SetListItemIndex(Item: TListItem; Index: integer);

  procedure ChangeTwoItems(Src, Dst: TListItem);
  begin
    Dst.Caption:= Src.Caption;
    Dst.ImageIndex := Src.ImageIndex;
    Dst.Data := Src.Data;
  end;

var
  ListView: TListView;

  FItemCaption: string;
  FItemImageIndex: integer;
  FItemData: Pointer;

  idx, i: integer;
begin
  if Index < 0 then Exit;
  if not Assigned(Item) then Exit;
  idx := Item.Index;
  if idx = Index then Exit;
  ListView := Item.ListView as TListView;
  if not Assigned(ListView.Items[Index]) then Exit;

  FItemCaption := Item.Caption;
  FItemImageIndex := Item.ImageIndex;
  FItemData := Item.Data;

  if idx > Index then
    for i := idx downto Index + 1 do
      ChangeTwoItems(ListView.Items[i - 1], ListView.Items[i]);

  if idx < Index then
    for i := idx to Index - 1 do
      ChangeTwoItems(ListView.Items[i + 1], ListView.Items[i]);

  ListView.Items[Index].Caption:= FItemCaption;
  ListView.Items[Index].ImageIndex := FItemImageIndex;
  ListView.Items[Index].Data := FItemData;
end;

function MoveListItem(Item: TListItem; Dst: TListView; Move: boolean;
  Index: integer): TListItem;
var
  Idx: integer;
  Src: TListView;
begin
  Result := nil;
  if not Assigned(Item) or not Assigned(Dst) then Exit;
  Src := Item.ListView as TListView;
  {$IFDEF WIN32}
  if Index < 0
    then Result := Dst.Items.Add
    else Result := Dst.Items.Insert(Index);
  {$ENDIF}
  {$IFDEF LINUX}
    Result := Dst.Items.Add;
  {$ENDIF}
  Result.Caption := Item.Caption;
  Result.Data := Item.Data;
  Idx := Item.Index;
  if Move then Item.Delete;

  if Src.Items.Count > 0 then begin
    if Idx >= Src.Items.Count
      then Src.Items[Src.Items.Count - 1].Selected := true
      else if Idx < 0
           then Src.Items[0].Selected := true
           else Src.Items[Idx].Selected := true;
  end;
end;
{$ENDIF}

function CalcStringType(const S,
  BooleanTrue, BooleanFalse: string): TQExportColType;
var
  Year, Month, Day: Word;
  Hour, Min, Sec, MSec: Word;
begin
  Result := ectString;
  if S = EmptyStr then Exit;

  //-- IsBoolean
  if (AnsiCompareText(S, BooleanTrue) = 0) or
     (AnsiCompareText(S, BooleanFalse) = 0)  then begin
    Result := ectBoolean;
    Exit;
  end;
  //-- IsInteger
  try StrToInt(S); Result := ectInteger; Exit;
  except end;
  //-- IsFloat
  try StrToFloat(S); Result := ectFloat; Exit;
  except end;
  //-- IsDateTime
  try
    StrToDateTime(S);
    Result := ectDateTime;
    DecodeTime(StrToDateTime(S), Hour, Min, Sec, MSec);
    if (Hour = 0) and (Min = 0) and (Sec = 0) and (MSec = 0) then begin
      Result := ectDate;
      Exit;
    end
    else begin
      DecodeDate(StrToDateTime(S), Year, Month, Day);
      if (Year = 1899) and (Month = 12) and (Day = 30) then begin
        Result := ectTime;
        Exit;
      end;
    end;
  except
  end;
end;

{$IFNDEF NOGUI}
procedure DrawXLSCell(PaintBox: TPaintBox; Format: TxlsFormat);

  procedure OutText;
  const
    TXT = 'Aa Zz';
  var
    X, Y: integer;
    {$IFDEF WIN32}
    USz, UPz, XX: integer;
    otm: TOutlineTextmetric;
    {$ENDIF}
  begin
    with PaintBox.Canvas.Font do begin
      Name := Format.Font.Name;
      Size := Format.Font.Size;
      Charset := Format.Font.Charset;
      Color := XLS_STANDARD_PALETTE[Integer(Format.Font.Color)];
      Style := [];
      if xfsBold in Format.Font.Style
        then Style := Style + [fsBold];
      if xfsItalic in Format.Font.Style
        then Style := Style + [fsItalic];
      if xfsStrikeOut in Format.Font.Style
        then Style := Style + [fsStrikeOut];
    end;

    case Format.Alignment.Horizontal of
      halGeneral,
      halLeft,
      halFill: X := 5;
      halCenter: X := (PaintBox.Width - PaintBox.Canvas.TextWidth(TXT)) div 2;
      halRight: X := PaintBox.Width - 5 - PaintBox.Canvas.TextWidth(TXT);
      else X := 0;
    end;

    case Format.Alignment.Vertical of
      valTop: Y := 5;
      valCenter: Y := (PaintBox.Height - PaintBox.Canvas.TextHeight(TXT)) div 2;
      valBottom: Y := PaintBox.Height - 5 - PaintBox.Canvas.TextHeight(TXT);
      else Y := 0;
    end;

    {$IFDEF WIN32}
    if Format.Font.Underline in [fulNone, fulSingle, fulSingleAccounting] then begin
      PaintBox.Canvas.Brush.Style := bsClear;
      PaintBox.Canvas.TextOut(X, Y, TXT);
    end;
    {$ENDIF}
    {$IFDEF LINUX}
      PaintBox.Canvas.Brush.Style := bsSolid; //bsClear;
      PaintBox.Canvas.TextOut(X, Y, TXT);
    {$ENDIF}

    // Underline
    {$IFDEF WIN32}
    if Format.Font.Underline <> fulNone then begin
      otm.otmSize := SizeOf(otm);
      GetOutlineTextMetrics(PaintBox.Canvas.Handle, otm.otmSize, @otm);
      USz := otm.otmsUnderscoreSize;
      UPz := otm.otmsUnderscorePosition;
      with PaintBox.Canvas do begin
        Pen.Color := Font.Color;
        Pen.Width := otm.otmsUnderscoreSize;
        if Format.Font.Underline in [fulDouble, fulDoubleAccounting] then begin
          case Format.Alignment.Vertical of
            valCenter:
              Y := (PaintBox.Height - PaintBox.Canvas.TextHeight(TXT) -
                USz - 1) div 2;
            valBottom: Y := PaintBox.Height - 5 -
              PaintBox.Canvas.TextHeight(TXT) - USz - 1;
          end;
          if Format.Alignment.Vertical in [valCenter, valBottom] then begin
            PaintBox.Canvas.Brush.Style := bsClear;
            PaintBox.Canvas.TextOut(X, Y, TXT);
          end;
        end;

        case Format.Font.Underline of
          fulSingle: begin
            MoveTo(X, Y + TextHeight(TXT) + UPz);
            LineTo(X + TextWidth(TXT), Y + TextHeight(TXT) + UPz);
          end;
          fulSingleAccounting : begin
            MoveTo(X, Y + TextHeight(TXT) + UPz);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz);
            X := X + USz * 4;
            MoveTo(X, Y + TextHeight(TXT) + UPz);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz);
          end;
          fulDouble: begin
            MoveTo(X, Y + TextHeight(TXT) + Upz);
            LineTo(X + TextWidth(TXT), Y + TextHeight(TXT) + UPz);
            MoveTo(X, Y + TextHeight(TXT) + UPz + USz + 1);
            LineTo(X + TextWidth(TXT), Y + TextHeight(TXT) + UPz + USz + 1);
          end;
          fulDoubleAccounting: begin
            XX := X;
            MoveTo(X, Y + TextHeight(TXT) + UPz);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz);
            X := X + USz * 4;
            MoveTo(X, Y + TextHeight(TXT) + UPz);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz);

            X := XX;
            MoveTo(X, Y + TextHeight(TXT) + UPz + USz + 1);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz + USz + 1);
            X := X + USz * 4;
            MoveTo(X, Y + TextHeight(TXT) + UPz + USz + 1);
            X := X + TextWidth(TXT) div 2 - USz * 2;
            LineTo(X, Y + TextHeight(TXT) + UPz + USz + 1);
          end;
        end;
      end;
    end
    {$ENDIF}
  end;

  procedure DrawBorderLine(X1, Y1, X2, Y2: integer; Border: TxlsBorder);
  begin
    with PaintBox.Canvas do begin
      Pen.Style := psSolid;
      Pen.Color := ColorByXLSColor(Border.Color);

      case Border.Style of
        bstThin, bstDashed, bstDotted,
        bstDouble, bstHair, bstDashDot,
        bstDashDotDot: Pen.Width := 1;

        bstMedium, bstMediumDashed,
        bstMediumDashDot, bstMediumDashDotDot,
        bstSlantedDashDot: Pen.Width := 2;

        bstThick: Pen.Width := 3;
      end;

      case Border.Style of
        bstThin,
        bstMedium,
        bstThick: begin
          MoveTo(X1, Y1);
          LineTo(X2, Y2);
        end;

        bstDashed,
        bstMediumDashed,
        bstDashDot,
        bstMediumDashDot,
        bstSlantedDashDot,
        bstDashDotDot,
        bstMediumDashDotDot: begin
          if X2 > X1 then
            while X2 - X1 > 5 do begin
              MoveTo(X1, Y1);
              if X2 > X1 then
                if X2 - X1 >= 10
                  then LineTo(X1 + 10, Y1)
                  else LineTo(X2, Y1);
              Inc(X1, 15);

              if Border.Style in [bstDashDot, bstMediumDashDot,
              bstSlantedDashDot, bstDashDotDot, bstMediumDashDotDot] then begin
                MoveTo(X1, Y1);
                if X2 > X1 then
                  if X2 - X1 >= 2
                    then LineTo(X1 + 2, Y1)
                    else LineTo(X2, Y1);
                Inc(X1, 7);
              end;

              if Border.Style in [bstDashDotDot, bstMediumDashDotDot] then begin
                MoveTo(X1, Y1);
                if X2 > X1 then
                  if X2 - X1 >= 2
                    then LineTo(X1 + 2, Y1)
                    else LineTo(X2, Y1);
                Inc(X1, 7);
              end;

            end;

          if Y2 > Y1 then
            while Y2 - Y1 > 5 do begin
              MoveTo(X1, Y1);
              if Y2 > Y1 then
                if Y2 - Y1 >= 10
                  then LineTo(X1, Y1 + 10)
                  else LineTo(X1, Y2);
              Inc(Y1, 15);

              if Border.Style in [bstDashDot, bstMediumDashDot,
              bstSlantedDashDot, bstDashDotDot, bstMediumDashDotDot] then begin
                MoveTo(X1, Y1);
                if Y2 > Y1 then
                  if Y2 - Y1 >= 2
                    then LineTo(X1, Y1 + 2)
                    else LineTo(X1, Y2);
                Inc(Y1, 7);
              end;

              if Border.Style in [bstDashDotDot, bstMediumDashDotDot] then begin
                MoveTo(X1, Y1);
                if Y2 > Y1 then
                  if Y2 - Y1 >= 2
                    then LineTo(X1, Y1 + 2)
                    else LineTo(X1, Y2);
                Inc(Y1, 7);
              end;

            end;
        end;

        bstDotted,
        bstHair: begin
          if X2 > X1 then
            while X2 - X1 > 1 + Integer(Border.Style = bstDotted) do begin
              MoveTo(X1, Y1);
              if X2 - X1 >= 1 + Integer(Border.Style = bstDotted)
                then LineTo(X1 + 1 + Integer(Border.Style = bstDotted), Y1)
                else LineTo(X2, Y1);
              Inc(X1, 3 + 2 * Integer(Border.Style = bstDotted));
            end;

          if Y2 > Y1 then
            while Y2 - Y1 > 1 + Integer(Border.Style = bstDotted) do begin
              MoveTo(X1, Y1);
              if Y2 - Y1 >= 1 + Integer(Border.Style = bstDotted)
                then LineTo(X1, Y1 + 1 + Integer(Border.Style = bstDotted))
                else LineTo(X1, Y2);
              Inc(Y1, 3 + 2 * Integer(Border.Style = bstDotted));
            end;
        end;

        bstDouble: begin
          if X1 <> X2 then begin
            if X1 = Y1 then begin
              MoveTo(X1, Y1);
              LineTo(X2, Y2);
              MoveTo(X1, Y1 + 2);
              LineTo(X2, Y2 + 2);
            end
            else begin
              MoveTo(X1, Y1 - 2);
              LineTo(X2, Y2 - 2);
              MoveTo(X1, Y1);
              LineTo(X2, Y2);
            end;
          end;
          if Y1 <> Y2 then begin
            if X1 = Y1 then begin
              MoveTo(X1, Y1);
              LineTo(X2, Y2);
              MoveTo(X1 + 2, Y1);
              LineTo(X2 + 2, Y2);
            end
            else begin
              MoveTo(X1 - 2, Y1);
              LineTo(X2 - 2, Y2);
              MoveTo(X1, Y1);
              LineTo(X2, Y2);
            end;
          end;
        end;

      end;

    end;
  end;

  procedure DrawBorders;
  begin
    if Format.Borders.Top.Style <> bstNone then
      DrawBorderLine(2, 2, PaintBox.Width - 2, 2, Format.Borders.Top);
    if Format.Borders.Bottom.Style <> bstNone then
      DrawBorderLine(2, PaintBox.Height - 2, PaintBox.Width - 2,
        PaintBox.Height - 2, Format.Borders.Bottom);
    if Format.Borders.Left.Style <> bstNone then
      DrawBorderLine(2, 2, 2, PaintBox.Height - 2, Format.Borders.Left);
    if Format.Borders.Right.Style <> bstNone then
      DrawBorderLine(PaintBox.Width - 2, 2, PaintBox.Width - 2,
        PaintBox.Height - 2, Format.Borders.Right);
  end;

  procedure DrawPatterns;
  var
    X, Y: integer;
  begin
    X := 0;
    Y := 0;
    {$IFDEF LINUX}
    PaintBox.Canvas.Brush.Style := bsSolid;
    {$ENDIF}
    PaintBox.Canvas.Brush.Color := ColorByXLSColor(Format.Fill.Background);
    PaintBox.Canvas.FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
    PaintBox.Canvas.Pen.Width := 1;
    PaintBox.Canvas.Pen.Color := ColorByXLSColor(Format.Fill.Foreground);
    while Y <= PaintBox.Height - 4 do begin
      while X <= PaintBox.Width do begin
        DrawPattern(PaintBox.Canvas, Integer(Format.Fill.Pattern), X, Y);
        Inc(X, 4);
      end;
      Inc(Y, 4);
      X := 0;
    end
  end;

begin
  DrawPatterns;
  OutText;
  DrawBorders;
end;

procedure DrawRTFSample(PaintBox: TPaintBox; rtfStyle: TrtfStyle);
  procedure FillBackground;
  begin
    if rtfStyle.AllowBackground
      then  PaintBox.Canvas.Brush.Color := rtfStyle.BackgroundColor
      else  PaintBox.Canvas.Brush.Color := clWhite;
    PaintBox.Canvas.FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  end;

  procedure OutText;
  const
    TXT = 'Aa Zz';
  var
    H, W, X, Y: integer;
  begin
    with PaintBox.Canvas.Font do begin
      Name := rtfStyle.Font.Name;
      Size := rtfStyle.Font.Size;
      Charset := rtfStyle.Font.Charset;
      Color := rtfStyle.Font.Color;
      Style := rtfStyle.Font.Style;
    end;

    H := PaintBox.Canvas.TextHeight(TXT);
    W := PaintBox.Canvas.TextWidth(TXT);
    if H > PaintBox.Height then
      H := PaintBox.Height;
    if W > PaintBox.Width then
      W := PaintBox.Width;
//    X := 5;
    X := (PaintBox.Width - W) div 2;
    Y := (PaintBox.Height - H) div 2;

    if rtfStyle.AllowHighlight and
         (rtfStyle.HighlightColor <> rtfStyle.BackgroundColor) then begin
      PaintBox.Canvas.Brush.Color := rtfStyle.HighlightColor;
      PaintBox.Canvas.FillRect(Rect(X, Y, X + W, Y + H));
    end;

{    case Format.Alignment.Horizontal of
      halGeneral,
      halLeft,
      halFill: X := 5;
      halCenter: X := (PaintBox.Width - PaintBox.Canvas.TextWidth(TXT)) div 2;
      halRight: X := PaintBox.Width - 5 - PaintBox.Canvas.TextWidth(TXT);
      else X := 0;
    end;

    case Format.Alignment.Vertical of
      valTop: Y := 5;
      valCenter: Y := (PaintBox.Height - PaintBox.Canvas.TextHeight(TXT)) div 2;
      valBottom: Y := PaintBox.Height - 5 - PaintBox.Canvas.TextHeight(TXT);
      else Y := 0;
    end;}

    PaintBox.Canvas.TextOut(X, Y, TXT);

    //otm.otmSize := SizeOf(otm);
    //GetOutlineTextMetrics(PaintBox.Canvas.Handle, otm.otmSize, @otm);
  end;

begin
  FillBackground;
  OutText;
end;
{$ENDIF}

procedure QExportCheckSource(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
begin
  if ((ExportSource = esDataSet) and not Assigned(DataSet)) or
     ((ExportSource = esCustom) and not Assigned(CustomSource)){$IFNDEF NOGUI}or
     ((ExportSource = esDBGrid) and
      (not Assigned(DBGrid) or
       not Assigned(DBGrid.DataSource) or
       not Assigned(DBGrid.DataSource.DataSet))) or
     ((ExportSource = esListView) and not Assigned(ListView)) or
     ((ExportSource = esStringGrid) and not Assigned(StringGrid)){$ENDIF} then
    raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceNotAssigned){$ENDIF}
                              {$IFDEF LINUX}QEM_ExportSourceNotAssigned{$ENDIF},
                              [QExportSourceAsString(ExportSource)]);
end;

function QExportSource(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): TComponent;
begin
  Result := nil;
  if ExportSource = esDataSet then
    Result := DataSet
  else if ExportSource = esCustom then
    Result := CustomSource
  {$IFNDEF NOGUI}
  else if ExportSource = esDBGrid then
    Result := DBGrid
  else if ExportSource = esListView then
    Result := ListView
  else if ExportSource = esStringGrid then
    Result := StringGrid;
  {$ENDIF}
end;

procedure QExportGetColumns(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource; 
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} ExportedFields, AvailableCols,
  ExportedCols: TStrings);
var
  i: integer;
  WA: boolean;
  FDS: TDataSet;
begin
  QExportCheckSource(ExportSource, DataSet, CustomSource
    {$IFNDEF NOGUI}, DBGrid, ListView, StringGrid{$ENDIF});

  AvailableCols.Clear;
  ExportedCols.Clear;
  {$IFDEF NOGUI}FDS := nil;{$ENDIF}
  case ExportSource of
    esDataSet,
    esDbGrid: begin
      case ExportSource of
        esDataSet: FDS := DataSet;
        {$IFNDEF NOGUI}
        esDBGrid: FDS := DBGrid.DataSource.DataSet;
        else FDS := nil;
        {$ENDIF}
      end;
      WA := FDS.Active;
      if not FDS.Active and (FDS.FieldCount = 0) then
        try FDS.Open; except Exit; end;
      for i := 0 to FDS.FieldCount - 1 do
        if FDS.Fields[i].IsBlob
          then AvailableCols.AddObject(FDS.Fields[i].FieldName, TObject(1))
          else AvailableCols.AddObject(FDS.Fields[i].FieldName, TObject(0));
      if not WA and FDS.Active then
        try FDS.Close; except end;
    end;
    esCustom:
      for i := 0 to CustomSource.ColCount - 1 do
        AvailableCols.AddObject(CustomSource.Columns[i].ColumnName, TObject(0));
    {$IFNDEF NOGUI}
    esListView:
      for i := 0 to ListView.Columns.Count - 1 do
        AvailableCols.AddObject(ListView.Columns[i].Caption, TObject(0));
    esStringGrid:
      for i := 0 to StringGrid.ColCount - 1 do
        AvailableCols.AddObject(IntToStr(i), TObject(0));
    {$ENDIF}
  end; { case }

  for i := 0 to ExportedFields.Count - 1 do
    if AvailableCols.IndexOf(ExportedFields[i]) <> -1 then
      ExportedCols.Add(ExportedFields[i]);
  for i := AvailableCols.Count - 1 downto 0 do
    if ExportedFields.IndexOf(AvailableCols[i]) <> -1 then
      AvailableCols.Delete(i);
end;

function QExportIsActive(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): boolean;
begin
  Result := true;
  case ExportSource of
    esDataSet: Result := DataSet.Active;
    {$IFNDEF NOGUI}
    esDBGrid: Result := DBGrid.DataSource.DataSet.Active;
    {$ENDIF}
  end;
end;

function QExportIsEmpty(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF}): boolean;
begin
  Result := true;
  case ExportSource of
    esDataSet: Result := DataSet.IsEmpty;
    {$IFNDEF NOGUI}
    esDBGrid: Result := DBGrid.DataSource.DataSet.IsEmpty;
    esListView: Result := ListView.Items.Count = 0;
    esStringGrid: Result := StringGrid.RowCount = StringGrid.FixedRows;
    {$ENDIF}
  end;
end;

function QExportGetBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  CustomSource: TqeCustomSource{$IFNDEF NOGUI}; DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid{$ENDIF}): TBookmark;
begin
  Result := nil;
  case ExportSource of
    esDataSet: Result := DataSet.GetBookmark;
    esCustom: Result := Pointer(CustomSource.RecNo);
    {$IFNDEF NOGUI}
    esDBGrid: Result := DbGrid.DataSource.DataSet.GetBookmark;
    esListView: begin
      if Assigned(ListView.Selected)
        then Result := Pointer(ListView.Selected.Index)
        else Result := Pointer(0);
    end;
    esStringGrid: Result := Pointer(StringGrid.Row);
    {$ENDIF}
  end;
end;

procedure QExportGotoBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  CustomSource: TqeCustomSource;{$IFNDEF NOGUI}DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid;{$ENDIF} Bookmark: TBookmark);
begin
  case ExportSource of
    esDataSet: DataSet.GotoBookmark(Bookmark);
    esCustom:
      begin
        CustomSource.RecNo := Integer(Bookmark);
        CustomSource.Eof := False;
      end;
    {$IFNDEF NOGUI}
    esDBGrid: DbGrid.DataSource.DataSet.GotoBookmark(Bookmark);
    esListView: ListView.Items[Integer(Bookmark)].Selected := true;
    esStringGrid: StringGrid.Row := Integer(Bookmark);
    {$ENDIF}
  end;
end;

procedure QExportFreeBookmark(ExportSource: TQExportSource; DataSet: TDataSet;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} Bookmark: TBookmark);
begin
  case ExportSource of
    esDataSet: DataSet.FreeBookmark(Bookmark);
    {$IFNDEF NOGUI}
    esDBGrid: DbGrid.DataSource.DataSet.FreeBookmark(Bookmark);
    {$ENDIF}
  end;
end;

procedure QExportFirst(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI};DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
begin
  case ExportSource of
    esDataSet: DataSet.First;
    esCustom: CustomSource.First;
    {$IFNDEF NOGUI}
    esDBGrid:
      if Assigned(DBGrid) and Assigned(DBGrid.DataSource) and
         Assigned(DBGrid.DataSource.DataSet) and
         DBGrid.DataSource.DataSet.Active then
           DBGrid.DataSource.DataSet.First;
    esListView: ListView.Items[0].Selected := true;
    esStringGrid: StringGrid.Row := StringGrid.FixedRows;
    {$ENDIF}
  end;
end;

procedure QExportNext(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} var RecordCounter: integer);
begin
  Inc(RecordCounter);
  case ExportSource of
    esDataSet: DataSet.Next;
    esCustom: CustomSource.Next;
    {$IFNDEF NOGUI}
    esDBGrid: DBGrid.DataSource.DataSet.Next;
    esStringGrid: begin
      if StringGrid.Row < StringGrid.RowCount - 1 then
        StringGrid.Row := StringGrid.Row + 1;
    end;
    {$ENDIF}
  end;
end;

procedure QExportSkip(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} SkipRecCount: integer;
  SkipEvent: TExportedRecordEvent; Sender: TObject; var RecordCounter: integer);
var
  i: integer;
begin
  for i := 0 to SkipRecCount - 1 do begin
    QExportNext(ExportSource, DataSet, CustomSource,
     {$IFNDEF NOGUI}DBGrid, ListView, StringGrid,{$ENDIF} RecordCounter);
    if Assigned(SkipEvent) then SkipEvent(Sender, RecordCounter);
  end;
end;

function QExportEof(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} RecordCounter, ExportRecCount,
  SkipRecCount: integer): boolean;
begin
  Result := true;
  case ExportSource of
    esDataSet: Result := DataSet.Eof;
    esCustom: Result := CustomSource.Eof or not Assigned(CustomSource.OnGetNextRecord);
    {$IFNDEF NOGUI}
    esDBGrid: Result := DBGrid.DataSource.DataSet.Eof;
    esListView:
      if ExportRecCount > 0 then
        Result := RecordCounter = MaximumInt(MinimumInt(ExportRecCount,
          ListView.Items.Count - SkipRecCount), 0)
      else
        Result := RecordCounter = MaximumInt(ListView.Items.Count -
          SkipRecCount, 0);
    esStringGrid:
      if ExportRecCount > 0 then
        Result := RecordCounter = MaximumInt(MinimumInt(ExportRecCount,
          StringGrid.RowCount - StringGrid.FixedRows - SkipRecCount), 0)
      else
        Result := RecordCounter = MaximumInt(StringGrid.RowCount -
          StringGrid.FixedRows - SkipRecCount, 0);
    {$ENDIF}
  end;
end;

function QExportFormatData(const DataStr, Format: string;
  ColType: TQExportColType; NormalFunc: TNormalFunc): string;
begin
  try
    Result := DataStr;
    case ColType of
      ectInteger:
        Result := NormalFunc(FormatFloat(Format, StrToIntDef(Result, 0)));
      {$IFNDEF VCL3}
      ectBigint:
        Result := NormalFunc(FormatFloat(Format, StrToInt64Def(Result, 0)));
      {$ENDIF}
      ectFloat:
        Result := NormalFunc(FormatFloat(Format, StrToFloat(Result)));
      ectCurrency:
        Result := NormalFunc(FormatFloat(Format, StrToFloat(Result)));
      ectDate:
        Result := NormalFunc(FormatDateTime(Format, StrToDateTime(Result)));
      ectTime:
        Result := NormalFunc(FormatDateTime(Format, StrToDateTime(Result)));
      ectDateTime:
        Result := NormalFunc(FormatDateTime(Format, StrToDateTime(Result)));
      ectString: Result := NormalFunc(Result);
    end;
  except
    Result := EmptyStr;
  end;
end;

function QExportGetColData(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource;
  {$IFNDEF NOGUI}DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid;{$ENDIF} Columns: TQExportColumns;
  Formats: TQExportFormats; NormalFunc: TNormalFunc; Index, RecordCounter,
  SkipRecCount: integer; NeedFormat: Boolean): string;
{$IFNDEF NOGUI}
var
  N: integer;
{$ENDIF}
  //sFmt: string;
begin
  case ExportSource of
    esDataSet: begin
      Result := DataSet.Fields[Columns[Index].Number].AsString; 
    end;
    esCustom: begin
      Result := CustomSource.Columns[Columns[Index].Number].AsString;
    end;
    {$IFNDEF NOGUI}
    esDBGrid: Result := DBGrid.Columns[Columns[Index].Number].Field.AsString;
    esListView: begin
      N := Columns[Index].Number;
        if N = 0
          then Result := ListView.Items[RecordCounter + SkipRecCount].Caption
          else Result := ListView.Items[RecordCounter + SkipRecCount].SubItems[N - 1];
    end;
    esStringGrid:
      Result := StringGrid.Cells[Columns[Index].Number, StringGrid.Row];
    {$ENDIF}
  end;

  if NeedFormat then
  begin
    Result := QExportFormatData(Result, Columns[Index].Format,
      Columns[Index].ColType, NormalFunc);
    //sFmt := Columns[Index].Format;
//    case Columns[Index].ColType of
//      ectInteger:
//        Result := NormalFunc(FormatFloat(sFmt, StrToIntDef(Result, 0)));
//      ectFloat:
//        Result := NormalFunc(FormatFloat(sFmt, StrToFloat(Result)));
//      ectCurrency:
//        Result := NormalFunc(FormatFloat(sFmt, StrToFloat(Result)));
//      ectDate:
//        Result := NormalFunc(FormatDateTime(sFmt, StrToDateTime(Result)));
//      ectTime:
//        Result := NormalFunc(FormatDateTime(sFmt, StrToDateTime(Result)));
//      ectDateTime:
//        Result := NormalFunc(FormatDateTime(sFmt, StrToDateTime(Result)));
//      ectString: Result := NormalFunc(Result);
//    end;
  end;
end;

procedure QExportDisableControls(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
begin
  case ExportSource of
    esDataSet: DataSet.DisableControls;
    {$IFNDEF NOGUI}
    esListView: ListView.Items.BeginUpdate;
    esDBGrid: DBGrid.DataSource.DataSet.DisableControls;
    {$ENDIF}
  end;
end;

procedure QExportEnableControls(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource
  {$IFNDEF NOGUI}; DBGrid: TDBGrid; ListView: TListView;
  StringGrid: TStringGrid{$ENDIF});
begin
  case ExportSource of
    esDataSet: DataSet.EnableControls;
    {$IFNDEF NOGUI}
    esDBGrid: DBGrid.DataSource.DataSet.EnableControls;
    esListView: ListView.Items.EndUpdate;
    {$ENDIF}
  end;
end;

procedure ClearIniFile(IniFile: TIniFile);
var
  AStrings: TStrings;
  i: integer;
begin
  AStrings := TStringList.Create;
  try
    IniFile.ReadSections(AStrings);
    for i := 0 to AStrings.Count - 1 do
      IniFile.EraseSection(AStrings[i]);
  finally
    AStrings.Free;
  end;
end;

function Replace(const S, OldPattern, NewPattern: string): string;
var
  SearchStr, Patt, NewStr: string;
  Offset: Integer;
begin
  SearchStr := AnsiUpperCase(S);
  Patt := AnsiUpperCase(OldPattern);
  NewStr := S;
  Result := EmptyStr;
  while SearchStr <> EmptyStr do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;

function GetListSeparator: char;
begin
  {$IFDEF WIN32}
  Result := GetLocaleChar(GetThreadLocale, LOCALE_SLIST, ',');
  {$ELSE}
  Result := ',';
  {$ENDIF}
end;

function MinimumInt(V1, V2: integer): integer;
begin
  if V1 < V2 then Result := V1
  else Result := V2;
end;

function MaximumInt(V1, V2: integer): integer;
begin
  if V1 > V2 then Result := V1
  else Result := V2;
end;

{$IFNDEF NOGUI}
function GetTextWidth(Control: TControl; const Text: string): integer;
var
  Obj: integer;
  PropInfo: PPropInfo;
begin
  Result := 0;
  if not Assigned(Control) then Exit;
  if Text = EmptyStr then Exit;

  PropInfo := GetPropInfo(Control.ClassInfo, 'Canvas');

  if not Assigned(PropInfo) then begin
    Result := Length(Text) * XL;
    Exit;
  end;
  Obj := GetOrdProp(Control, PropInfo);
  if Obj > 0 then Result := TCanvas(Obj).TextWidth(Text)
end;

procedure ForAllListViewItems(ListView: TListView; Proc: TListItemProc;
  IsDownTo, All: boolean);
var
  i: integer;
begin
  if not Assigned(ListView) then Exit;
  ListView.Items.BeginUpdate;
  try
    if IsDownto then begin
      for i := ListView.Items.Count - 1 downto 0 do
        if ListView.Items[i].Selected or All then
          Proc(ListView.Items[i])
    end
    else begin
      for i := 0 to ListView.Items.Count - 1 do
        if ListView.Items[i].Selected or All then
          Proc(ListView.Items[i])
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

procedure ForAllListViewCustomItems(ListView: TListView;
  Proc: TxlsCustomItemProc; IsDownTo, All: boolean);
var
  i: integer;
begin
  if not Assigned(ListView) then Exit;
  ListView.Items.BeginUpdate;
  try
    if IsDownto then begin
      for i := ListView.Items.Count - 1 downto 0 do
        if ListView.Items[i].Selected or All then
          if Assigned(ListView.Items[i].Data) then
            Proc(TxlsCustomItem(ListView.Items[i].Data))
    end
    else begin
      for i := 0 to ListView.Items.Count - 1 do
        if ListView.Items[i].Selected or All then
          if Assigned(ListView.Items[i].Data) then
            Proc(TxlsCustomItem(ListView.Items[i].Data))
    end;
  finally
    ListView.Items.EndUpdate;
  end;
end;

function GetMemoCaretPos(Memo: TMemo): {$IFDEF WIN32}TPoint{$ELSE}TCaretPos{$ENDIF};
begin
  {$IFDEF WIN32}
  Result.X := LongRec(SendMessage(Memo.Handle, EM_GETSEL, 0, 0)).Hi;
  Result.Y := SendMessage(Memo.Handle, EM_LINEFROMCHAR, Result.X, 0);
  Result.X := Result.X - SendMessage(Memo.Handle, EM_LINEINDEX, -1, 0);
  {$ELSE}
  Memo.CaretPos;
  {$ENDIF}
end;

{$IFDEF WIN32}
function GetDisplayTextWidth(const Text: string; Font: TFont): integer;
var
  DC: HDC;
  Sz: TSize;
begin
  DC := CreateDC('DISPLAY', nil, nil, nil);
  SelectObject(DC, Font.Handle);
  GetTextExtentPoint32(DC, PChar(Text), Length(Text), Sz);
  Result := Sz.cx
end;
{$ENDIF}
{$ENDIF}

function Str2Char(const Str: string): char;
begin
  Result := #0;
  if Str = EmptyStr then Exit;
  if Length(Str) = 1 then Result := Str[1]
  else if Str[1] = '#'
    then Result := Chr(StrToIntDef(Copy(Str, 2, Length(Str)), 0));
end;

function Char2Str(Chr: char): string;
begin
  if Chr in [#33..#127]
    then Result := Chr
    else Result := Format('#%d', [Ord(Chr)]);
end;

procedure SaveFontToIniFile(Font: TFont; IniFile: TIniFile;
  const Section: string);
begin
  with IniFile do begin
    WriteString(Section, S_FontName, Font.Name);
    WriteBool(Section, S_FontBold, fsBold in Font.Style);
    WriteBool(Section, S_FontItalic, fsItalic in Font.Style);
    WriteBool(Section, S_FontUnderline, fsUnderline in Font.Style);
    WriteBool(Section, S_FontStrikeOut, fsStrikeOut in Font.Style);
    WriteInteger(Section, S_FontSize, Font.Size);
    WriteString(Section, S_FontColor, ColorToString(Font.Color));
    {$IFDEF WIN32}
    WriteInteger(Section, S_FontCharset, Font.Charset);
    {$ENDIF}
    {$IFDEF LINUX}
    WriteInteger(Section, S_FontCharset, Integer(Font.Charset));
    {$ENDIF}
  end;
end;

procedure LoadFontFromIniFile(Font, Default: TFont; IniFile: TIniFile;
  const Section: string);
var
  Flag: boolean;
begin
  with IniFile do begin
    Font.Name := ReadString(Section, S_FontName, Default.Name);
    Flag := ReadBool(Section, S_FontBold, fsBold in Default.Style);
    EditFontStyle(Font, fsBold, Flag);
    Flag := ReadBool(Section, S_FontItalic, fsItalic in Default.Style);
    EditFontStyle(Font, fsItalic, Flag);
    Flag := ReadBool(Section, S_FontUnderline, fsUnderline in Default.Style);
    EditFontStyle(Font, fsUnderline, Flag);
    Flag := ReadBool(Section, S_FontStrikeOut, fsStrikeOut in Default.Style);
    EditFontStyle(Font, fsStrikeOut, Flag);
    Font.Size := ReadInteger(Section, S_FontSize, Default.Size);
    Font.Color := StringToColor(ReadString(Section, S_FontColor,
      ColorToString(Default.Color)));
    {$IFDEF WIN32}
    Font.Charset := ReadInteger(Section, S_FontCharset, Default.Charset);
    {$ENDIF}
    {$IFDEF LINUX}
    Font.Charset := TFontCharset(ReadInteger(Section, S_FontCharset,
      Integer(Default.Charset)));
    {$ENDIF}
  end;
end;

{$IFDEF LINUX}
function RGB(Red, Green, Blue: byte): integer;
begin
  Result := (Red or (Green shl 8) or (Blue shl 16));
end;
{$ENDIF}

function StrToDblDef(const Str: string; Default: double): double;
var
  Code: integer;
begin
  Val(Str, Result, Code);
  if Code <> 0 then Result := Default;
end;

function InchToDot(const Value: double): integer;
begin
  Result := Trunc(Value * DefaultDotPerInch);
end;

function MMToDot(const Value: double): integer;
begin
  Result := Trunc(Value / DefaultMMPerInch * DefaultDotPerInch);
end;

function DotToInch(const Value: integer): double;
begin
  Result := Value / DefaultDotPerInch;
end;

function DotToMM(const Value: integer): double;
begin
  Result := Value / DefaultDotPerInch * DefaultMMPerInch;
end;

function GetPageFormatString(const pfFormat: TQExportPageFormat): string;
begin
  case pfFormat of
    pfLetter:         Result := {$IFDEF WIN32}QExportLoadStr(QEPF_Letter){$ENDIF}
                                {$IFDEF LINUX}QEPF_Letter{$ENDIF};
    pfLegal:          Result := {$IFDEF WIN32}QExportLoadStr(QEPF_Legal){$ENDIF}
                                {$IFDEF LINUX}QEPF_Legal{$ENDIF};
    pfA3:             Result := {$IFDEF WIN32}QExportLoadStr(QEPF_A3){$ENDIF}
                                {$IFDEF LINUX}QEPF_A3{$ENDIF};
    pfA4:             Result := {$IFDEF WIN32}QExportLoadStr(QEPF_A4){$ENDIF}
                                {$IFDEF LINUX}QEPF_A4{$ENDIF};
    pfA5:             Result := {$IFDEF WIN32}QExportLoadStr(QEPF_A5){$ENDIF}
                                {$IFDEF LINUX}QEPF_A5{$ENDIF};
    pfB5_JIS:         Result := {$IFDEF WIN32}QExportLoadStr(QEPF_B5_JIS){$ENDIF}
                                {$IFDEF LINUX}QEPF_B5_JIS{$ENDIF};
    pfUS_Std_Fanfold: Result := {$IFDEF WIN32}QExportLoadStr(QEPF_US_Std_Fanfold){$ENDIF}
                                {$IFDEF LINUX}QEPF_US_Std_Fanfold{$ENDIF};
    pfFanfold:        Result := {$IFDEF WIN32}QExportLoadStr(QEPF_Fanfold){$ENDIF}
                                {$IFDEF LINUX}QEPF_Fanfold{$ENDIF};
    pfUser:           Result := {$IFDEF WIN32}QExportLoadStr(QEPF_User){$ENDIF}
                                {$IFDEF LINUX}QEPF_User{$ENDIF};
    else Result := EmptyStr;
  end;
end;

function GetPageFormatInchWidth(const pfFormat: TQExportPageFormat): double;
begin
  case pfFormat of
    pfLetter:         Result := 8.5;
    pfLegal:          Result := 8.5;
    pfA3:             Result := 11.69;
    pfA4:             Result := 8.27;
    pfA5:             Result := 5.83;
    pfB5_JIS:         Result := 7.17;
    pfUS_Std_Fanfold: Result := 14.88;
    pfFanfold:        Result := 8.5;
    pfUser:           Result := 8.27;
    else
      Result := 8.27;
  end;
end;

function GetPageFormatInchHeight(const pfFormat: TQExportPageFormat): double;
begin
  case pfFormat of
    pfLetter:         Result := 11;
    pfLegal:          Result := 14;
    pfA3:             Result := 16.54;
    pfA4:             Result := 11.69;
    pfA5:             Result := 8.27;
    pfB5_JIS:         Result := 10.12;
    pfUS_Std_Fanfold: Result := 11;
    pfFanfold:        Result := 12;
    pfUser:           Result := 11.69;
    else
      Result := 11.69;
  end;
end;

function RoundFraction(const X: double; const Digit: integer): double;
begin
  Result := Round(X * Power(10, Digit)) / Power(10, Digit);
end;

function Units2Dot(Units: TQExportUnits; Value: double): integer;
begin
  case Units of
    unInch      : Result := InchToDot(Value);
    unMillimeter: Result := MMToDot(Value);
    else Result := Trunc(Value);
  end;
end;

function Dot2Units(Units: TQExportUnits; Value: integer): double;
begin
  case Units of
    unInch      : Result := RoundFraction(DotToInch(Value), 2);
    unMillimeter: Result := Round(DotToMM(Value));
    else Result := Value;
  end;
end;

function AddNumberToFileName(const FileName: string; Number,
  Digits: integer): string;
var
  Ext, Fmt: string;
  i: integer;
begin
  Result := FileName;
  Ext := ExtractFileExt(Result);

  if Ext <> EmptyStr then
    Delete(Result, Pos(Ext, Result), Length(Result));
  if Digits < 0 then Digits := 0;
  Fmt := EmptyStr;
  for i := 0 to Digits - 1 do
    Fmt := Fmt + '0';
  Result := Result + FormatFloat(Fmt, Number) + Ext;
end;

function IniFileSectionExists(IniFile: TIniFile; const Section: string): Boolean;
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    IniFile.ReadSection(Section, S);
    Result := S.Count > 0;
  finally
    S.Free;
  end;
end;

function IniFileValueExists(IniFile: TIniFile; const Section, Ident: string): Boolean;
var
  S: TStrings;
begin
  S := TStringList.Create;
  try
    IniFile.ReadSection(Section, S);
    Result := S.IndexOf(Ident) > -1;
  finally
    S.Free;
  end;
end;

initialization
  DefaultDateFormat := SysUtils.ShortDateFormat;
  DefaultTimeFormat := SysUtils.ShortTimeFormat;
  DefaultDateTimeFormat := SysUtils.ShortDateFormat + ' ' +
    SysUtils.ShortTimeFormat;
  case SysUtils.CurrencyFormat of
    0: DefaultCurrencyFormat :=  SysUtils.CurrencyString + S_FLOAT_FORMAT;
    1: DefaultCurrencyFormat :=  S_FLOAT_FORMAT + SysUtils.CurrencyString;
    2: DefaultCurrencyFormat :=  SysUtils.CurrencyString + ' ' + S_FLOAT_FORMAT;
    3: DefaultCurrencyFormat :=  S_FLOAT_FORMAT + ' ' + SysUtils.CurrencyString;
  end;
end.
