unit QExport3XLSFile;

{$I VerCtrl.inc}

{$IFDEF VCL6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

interface

uses Classes, SysUtils {$IFDEF VCL6}, Variants{$ENDIF}, QExport3XLSCommon,
  ActiveX, Windows;

type
  TxlsSection = class;
  TbiffXFList = class;
  TbiffFormatList = class;
  TbiffSSTList = class;

  TbiffContinue = class;

  TbiffRecord = class
  private
    FSection: TxlsSection;
    FID: word;
    FDataSize: word;
    FData: PByteArray;
    FContinue: TbiffContinue;
    FOnDestroy: TNotifyEvent;

    function GetXFList: TbiffXFList;
    function GetFormatList: TbiffFormatList;
    function GetSSTList: TbiffSSTList;
  protected
    function GetDataSize: integer; virtual;
    function GetTotalSize: integer; virtual;
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); virtual;
    destructor Destroy; override;
    procedure AddContinue(const Continue: TbiffContinue);
    procedure Save(Stream: TStream); virtual;
    procedure Clear; virtual;

    property Section: TxlsSection read FSection;
    property XFList: TbiffXFList read GetXFList;
    property FormatList: TbiffFormatList read GetFormatList;
    property SSTList: TbiffSSTList read GetSSTList;

    property ID: word read FID;
    property DataSize: word read FDataSize write FDataSize;
    property Data: PByteArray read FData;
    property TotalSize: integer read GetTotalSize;

    property Continue: TbiffContinue read FContinue;

    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

  TbiffContinue = class(TbiffRecord);

  TbiffBOF = class(TbiffRecord)
  private
    function GetVersion: word;
    procedure SetVersion(Value: word);
    function GetDataType: word;
    procedure SetDataType(Value: word);
    function GetBuildID: word;
    procedure SetBuildID(Value: word);
    function GetBuildYear: word;
    procedure SetBuildYear(Value: word);
    function GetHistoryFlags: integer;
    procedure SetHistoryFlags(Value: integer);
    function GetLowVersion: integer;
    procedure SetLowVersion(Value: integer);
//    function GetBOFType: word;
  public
    property Version: word read GetVersion write SetVersion;
    property DataType: word read GetDataType write SetDataType;
    property BuildID: word read GetBuildID write SetBuildID;
    property BuildYear: word read GetBuildYear write SetBuildYear;
    property HistoryFlags: integer read GetHistoryFlags write SetHistoryFlags;
    property LowVersion: integer read GetLowVersion write SetLowVersion;

//    property BOFType: word read GetBOFType;
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
  end;

  TbiffEOF = class(TbiffRecord);

  TbiffBoundSheet = class(TbiffRecord)
  private
    function GetBOFPos: integer;
    procedure SetBOFPos(Value: integer);
    function GetVisibility: byte;
    procedure SetVisibility(Value: byte);
    function GetSheetType: byte;
    procedure SetSheetType(Value: byte);
    function GetNameLen: byte;
    procedure SetNameLen(Value: byte);
    function GetNameOpt: byte;
    procedure SetNameOpt(Value: byte);
    function GetName: WideString;
    procedure SetName(const Value: WideString);
  public
    property BOFPos: integer read GetBOFPos write SetBOFPos;
    property Visibility: byte read GetVisibility write SetVisibility;
    property SheetType: byte read GetSheetType write SetSheetType;
    property NameLen: byte read GetNameLen write SetNameLen;
    property NameOpt: byte read GetNameOpt write SetNameOpt;
    property Name: WideString read GetName write SetName;
  end;

  TbiffCountry = class(TbiffRecord)
  private
    function GetCountryDef: word;
    procedure SetCountryDef(Value: word);
    function GetCountryWinIni: word;
    procedure SetCountryWinIni(Value: word);
  public
    property CountryDef: word read GetCountryDef write SetCountryDef;
    property CountryWinIni: word read GetCountryWinIni write SetCountryWinIni;
  end;

  TbiffString = class(TbiffRecord)
  private
    function GetValue: WideString;
  public
    property Value: WideString read GetValue;
  end;

  TbiffColRow = class(TbiffRecord)
  private
    function GetCol: word;
    procedure SetCol(Value: word);
    function GetRow: word;
    procedure SetRow(Value: word);
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;

    property Col: word read GetCol write SetCol;
    property Row: word read GetRow write SetRow;
  end;

  TbiffCellType = (bctString, bctBoolean, bctNumeric, bctDateTime, bctUnknown);

  TxlsWorkSheet = class;

  TbiffCell = class(TbiffColRow)
  private
    FWorkSheet: TxlsWorkSheet;
    function GetXFIndex: word;
    procedure SetXFIndex(Value: word);
    function GetFormatIndex: word;
    function GetCellName: string;
  protected
    function GetCellType: TbiffCellType; virtual;
    function GetIsFormula: boolean; virtual;
    function GetIsString: boolean;
    function GetIsBoolean: boolean;
    function GetIsFloat: boolean;
    function GetIsDateTime: boolean;
    function GetIsDateOnly: boolean;
    function GetIsTimeOnly: boolean;
    function GetIsVariant: boolean;
    function GetAsString: WideString; virtual;
    procedure SetAsString(const Value: WideString); virtual;
    function GetAsBoolean: boolean; virtual;
    procedure SetAsBoolean(Value: boolean); virtual;
    function GetAsFloat: double; virtual;
    procedure SetAsFloat(Value: double); virtual;
    function GetAsDateTime: TDateTime; virtual;
    procedure SetAsDateTime(Value: TDateTime); virtual;
    function GetAsVariant: variant; virtual;
    procedure SetAsVariant(Value: variant); virtual;
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;

    property WorkSheet: TxlsWorkSheet read FWorkSheet;
    property XFIndex: word read GetXFIndex write SetXFIndex;
    property FormatIndex: word read GetFormatIndex{ write SetFormatIndex};

    property CellType: TbiffCellType read GetCellType;

    property IsFormula: boolean read GetIsFormula;
    property IsString: boolean read GetIsString;
    property IsBoolean: boolean read GetIsBoolean;
    property IsFloat: boolean read GetIsFloat;
    property IsDateTime: boolean read GetIsDateTime;
    property IsDateOnly: boolean read GetIsDateOnly;
    property IsTimeOnly: boolean read GetIsTimeOnly;
    property IsVariant: boolean read GetIsVariant;

    property AsString: WideString read GetAsString write SetAsString;
    property AsBoolean: boolean read GetAsBoolean write SetAsBoolean;
    property AsFloat: double read GetAsFloat write SetAsFloat;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsVariant: variant read GetAsVariant write SetAsVariant;
    property Value: variant read GetAsVariant write SetAsVariant;
    property CellName: string read GetCellName;
  end;

  TbiffBlank = class(TbiffCell);

  TbiffBoolErr = class(TbiffCell)
  protected
    function GetCellType: TbiffCellType; override;

    function GetAsBoolean: boolean; override;
    procedure SetAsBoolean(Value: boolean); override;
    function GetAsVariant: variant; override;
    procedure SetAsVariant(Value: variant); override;
  end;

  TbiffNumber = class(TbiffCell)
  protected
    function GetCellType: TbiffCellType; override;

    function GetAsFloat: double; override;
    procedure SetAsFloat(Value: double); override;
    function GetAsVariant: variant; override;
    procedure SetAsVariant(Value: variant); override;
    function GetAsString: WideString; override;
    procedure SetAsString(const Value: WideString); override;
  end;

  TbiffRK = class(TbiffCell)
  private
    function GetIsDateTime: boolean;
  protected
    function GetCellType: TbiffCellType; override;

    function GetAsFloat: double; override;
    procedure SetAsFloat(Value: double); override;
    function GetAsDateTime: TDateTime; override;
    procedure SetAsDateTime(Value: TDateTime); override;
    function GetAsVariant: variant; override;
    procedure SetAsVariant(Value: variant); override;
    function GetAsString: WideString; override;
    procedure SetAsString(const Value: WideString); override;
  end;

  PsstString = ^TsstString;
  TsstString = record
    FID: integer;
    FValue: WideString;
    FRefCount: integer;
  end;

  TsstStrings = class;

  TsstStringList = class(TList)
  private
    FItemOwner: boolean;
    FStrings: TsstStrings;

    function Get(Index: Integer): PsstString;
    procedure Put(Index: Integer; Item: PsstString);
  public
    constructor Create(Strings: TsstStrings);
    destructor Destroy; override;
    function Add(Item: PsstString): integer;
    procedure Delete(Index: integer);
    function Find(const Value: WideString; var Index: integer): boolean;
    procedure Insert(Index: integer; Item: PsstString);
    procedure Sort;
    procedure Save(Index: integer; Stream: TStream);

    property ItemOwner: boolean read FItemOwner write FItemOwner;
    property Items[Index: Integer]: PsstString read Get write Put; default;
    property Strings: TsstStrings read FStrings;
  end;

  TsstStrings = class
  private
    FPlainList: TsstStringList;
    FSortedList: TsstStringList;
    FContinueList: TList;
    FCurrentSize: integer;
    FTotalSize: integer;
    FBytesWritten: integer;
    FContinueIndex: integer;
    FTotalCount: integer;
    FUniqueCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    function AddString(const Value: WideString): integer;

//    procedure Clear;
    procedure Save(Stream: TStream);
//    procedure CalcContinue(First: integer; var Last: integer;
//      var RecordSize: word);

//    property Count: integer read GetCount;
//    property PlainItems[Index: integer]: TsstString read GetPlainItem
//      write SetPlainItem;
//    property SortedItems[Index: integer]: TsstString read GetSortedItem
//      write SetSortedItem;
  end;

  TxlsCharSize = 1..2;

  TxlsString = class
    FIsWideStr: boolean;

    FStrLen: word;
    FOptionFlags: byte;
    FWideData: WideString;
    FShortData: string;

    FRTFNumber: word;
    FRTFData: PByteArray;
    FFarEastDataSize: word;
    FFarEastData: PByteArray;

    function GetLenOfLen: byte;
    function GetHasWideChar: boolean;
    function GetCharSize: byte;
    function GetHasRichText: boolean;
    function GetFarEast: boolean;
    function GetValue: WideString;

    function GetTotalSize: integer;
  public
    constructor CreateR(IsWideStr: boolean; var ARecord: TbiffRecord;
      var Offset: integer);
    constructor CreateWS(IsWideStr: boolean; const Str: WideString);
    {constructor Create(IsWideStr: boolean; var ARecord: TbiffRecord;
      var Offset: integer); overload;
    constructor Create(IsWideStr: boolean; const Str: WideString); overload;}
    function Compare(Str: TxlsString): integer; //-1 if less, 0 if equal, 1 if more
    procedure Save(Stream: TStream);

    property OptionFlags: byte read FOptionFlags;
    property ShortData: string read FShortData;
    property WideData: WideString read FWideData;

    property LenOfLen: byte read GetLenOfLen;
    property HasWideChar: boolean read GetHasWideChar;
    property CharSize: byte read GetCharSize;
    property HasRichText: boolean read GetHasRichText;
    property HasFarEast: boolean read GetFarEast;
    property Value: WideString read GetValue;

    property TotalSize: integer read GetTotalSize;
  end;

  TxlsSSTEntry = class
  private
    FRefCount: integer;
    FValue: TxlsString;
    FTableIndex: integer;
    FStreamPosition: integer;
    FSSTPosition: integer;
    FIndex: integer;
    FOnDestroy: TNotifyEvent;

    function GetTotalSize: integer;
  public
    constructor CreateXS(Str: TxlsString);
    constructor CreateWS(Str: WideString);
    destructor Destroy; override;

    procedure IncRef;
    procedure DecRef;
    procedure Save(Stream: TStream; StartPosition: integer);

    property RefCount: integer read FRefCount;
    property Value: TxlsString read FValue;
    property TableIndex: integer read FTableIndex write FTableIndex;
    property TotalSize: integer read GetTotalSize;
    property Index: integer read FIndex;

    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

  TbiffLabelSST = class(TbiffCell)
  private
    FSSTEntry: TxlsSSTEntry;
    procedure DestroySSTEntry(Sender: TObject);
    function GetSSTIndex: integer;
    procedure SetSSTIndex(Value: integer);
  protected
    function GetCellType: TbiffCellType; override;

    function GetAsString: WideString; override;
    procedure SetAsString(const Value: WideString); override;
    function GetAsVariant: variant; override;
    procedure SetAsVariant(Value: variant); override;
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
    destructor Destroy; override;

    property SSTIndex: integer read GetSSTIndex write SetSSTIndex;
  end;

  TbiffFormula = class(TbiffCell)
  private
    FValue: variant;
    FExprLen: word;
    FExpression: PByteArray;
  protected
    function GetIsFormula: boolean; override;
    function GetAsVariant: variant; override;
    procedure SetAsVariant(Value: variant); override;
    function GetAsString: WideString; override;
    procedure SetAsString(const Value: WideString); override;
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
    destructor Destroy; override;
    property ExprLen: word read FExprLen;
    property Expression: PByteArray read FExpression;
  end;

  TbiffShrFmla = class(TbiffRecord)
  private
    function GetFirstRow: word;
    function GetLastRow: word;
    function GetFirstCol: word;
    function GetLastCol: word;
    function GetKey: cardinal;
  public
    property FirstRow: word read GetFirstRow;
    property LastRow: word read GetLastRow;
    property FirstCol: word read GetFirstCol;
    property LastCol: word read GetLastCol;
    property Key: cardinal read GetKey;
  end;

  TbiffName = class(TbiffRecord)
  private
    function GetName: WideString;
    function GetNameLength: byte;
    function GetNameSize: integer;
    function GetOptionFlags: byte;
    function GetRow1: integer;
    function GetRow2: integer;
    function GetCol1: integer;
    function GetCol2: integer;
  public
    property Name: WideString read GetName;
    property NameLength: byte read GetNameLength;
    property NameSize: integer read GetNameSize;
    property OptionFlags: byte read GetOptionFlags;
    property Row1: integer read GetRow1;
    property Row2: integer read GetRow2;
    property Col1: integer read GetCol1;
    property Col2: integer read GetCol2;
  end;

  TbiffMultiple = class(TbiffRecord)
  protected
    FCol: integer;
    function GetEOF: boolean; virtual; abstract;
    function GetCell: TbiffCell; virtual; abstract;
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
    property EOF: boolean read GetEOF;
    property Cell: TbiffCell read GetCell;
  end;

  TbiffMulBlank = class(TbiffMultiple)
  protected
    function GetEOF: boolean; override;
    function GetCell: TbiffCell; override;
  end;

  TbiffMulRK = class(TbiffMultiple)
  protected
    function GetEOF: boolean; override;
    function GetCell: TbiffCell; override;
  end;

  TbiffFont = class(TbiffRecord)
  private
    function GetHeight: word;
    procedure SetHeight(Value: word);
    function GetOption: word;
    procedure SetOption(Value: word);
    function GetPaletteIndex: word;
    procedure SetPaletteIndex(Value: word);
    function GetBoldness: word;
    procedure SetBoldness(Value: word);
    function GetScript: word;
    procedure SetScript(Value: word);
    function GetUnderline: byte;
    procedure SetUnderline(Value: byte);
    function GetFamily: byte;
    procedure SetFamily(Value: byte);
    function GetCharset: byte;
    procedure SetCharset(Value: byte);
    function GetNotUsed: byte;
    procedure SetNotUsed(Value: byte);
    function GetNameLen: byte;
    procedure SetNameLen(Value: byte);
    function GetNameOpt: byte;
    procedure SetNameOpt(Value: byte);
    function GetName: WideString;
    procedure SetName(const Value: WideString);
  public
    property Height: word read GetHeight write SetHeight;
    property Option: word read GetOption write SetOption;
    property PaletteIndex: word read GetPaletteIndex write SetPaletteIndex;
    property Boldness : word read GetBoldness write SetBoldness;
    property Script: word read GetScript write SetScript;
    property Underline: byte read GetUnderline write SetUnderline;
    property Family: byte read GetFamily write SetFamily;
    property Charset: byte read GetCharset write SetCharset;
    property NotUsed: byte read GetNotUsed write SetNotUsed;
    property NameLen: byte read GetNameLen write SetNameLen;
    property NameOpt: byte read GetNameOpt write SetNameOpt;
    property Name: WideString read GetName write SetName;
  end;

  TbiffStyle = class(TbiffRecord);

  TbiffXF = class(TbiffRecord)
  private
    function GetFontIndex: word;
    procedure SetFontIndex(Value: word);
    function GetFormatIndex: word;
    procedure SetFormatIndex(Value: word);
    function GetData1: word;
    procedure SetData1(Value: word);
    function GetData2: word;
    procedure SetData2(Value: word);
    function GetData3: word;
    procedure SetData3(Value: word);
    function GetData4: word;
    procedure SetData4(Value: word);
    function GetData5: word;
    procedure SetData5(Value: word);
    function GetData6: longint;
    procedure SetData6(Value: longint);
    function GetData7: word;
    procedure SetData7(Value: word);
  public
    property FontIndex: word read GetFontIndex write SetFontIndex;
    property FormatIndex: word read GetFormatIndex write SetFormatIndex;
    property Data1: word read GetData1 write SetData1;
    property Data2: word read GetData2 write SetData2;
    property Data3: word read GetData3 write SetData3;
    property Data4: word read GetData4 write SetData4;
    property Data5: word read GetData5 write SetData5;
    property Data6: longint read GetData6 write SetData6;
    property Data7: word read GetData7 write SetData7;
  end;

  TbiffFormat = class(TbiffRecord)
  private
    function GetID: word;
    procedure SetID(Value: word);
    function GetFormatLen: word;
    procedure SetFormatLen(Value: word);
    function GetFormatOpt: byte;
    procedure SetFormatOpt(Value: byte);
    function GetFormat: WideString;
    procedure SetFormat(const Value: WideString);
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;

    property ID: word read GetID write SetID;
    property FormatLen: word read GetFormatLen write SetFormatLen;
    property FormatOpt: byte read GetFormatOpt write SetFormatOpt;
    property Format: WideString read GetFormat write SetFormat;
  end;

  TbiffHLink = class(TbiffRecord);
{  private
    function GetFirstRow: word;
    procedure SetFirstRow(Value: word);
    function GetLastRow: word;
    procedure SetLastRow(Value: word);
    function GetFirstCol: word;
    procedure SetFirstCol(Value: word);
    function GetLastCol: word;
    procedure SetLastCol(Value: word);
  public
    property FirstRow: word read GetFirstRow write SetFirstRow;
    property LastRow: word read GetLastRow write SetLastRow;
    property FirstCol: word read GetFirstCol write SetFirstCol;
    property LastCol: word read GetLastCol write SetLastCol;
  end;}

  TbiffDefColWidth = class(TbiffRecord)
  private
    function GetWidth: word;
  public
    property Width: word read GetWidth;
  end;

  TbiffDefRowHeight = class(TbiffRecord)
  private
    function GetHeight: word;
  public
    property Height: word read GetHeight;
  end;

  TxlsColInfo = class
  private
    FColumn: word;
    FWidth: word;
    FXF: word;
    FOptions: word;
  public
    property Column: word read FColumn write FColumn; // zero-based
    property Width: word read FWidth write FWidth;
    property XF: word read FXF write FXF;
    property Options: word read FOptions write FOptions;

    constructor Create(Column, Width, XF, Options: word);
    function IsEqual(ColInfo: TxlsColInfo): boolean;
  end;

  TbiffColInfo = class(TbiffRecord);

  TbiffDimensions = class(TbiffRecord)
  private
    function GetFirstRow: integer;
    procedure SetFirstRow(Value: integer);
    function GetLastRow: integer;
    procedure SetLastRow(Value: integer);
    function GetFirstCol: word;
    procedure SetFirstCol(Value: word);
    function GetLastCol: word;
    procedure SetLastCol(Value: word);
    function GetReserved: word;
    procedure SetReserved(Value: word);
  public
    property FirstRow: integer read GetFirstRow write SetFirstRow;
    property LastRow: integer read GetLastRow write SetLastRow;
    property FirstCol: word read GetFirstCol write SetFirstCol;
    property LastCol: word read GetLastCol write SetLastCol;
    property Reserved: word read GetReserved write SetReserved;
  end;

  TbiffSST = class(TbiffRecord)
  private
    FCount: cardinal;
  public
    property Count: cardinal read FCount;
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
  end;

  TbiffWindow1 = class(TbiffRecord)
  private
    function GetLeft: word;
    procedure SetLeft(Value: word);
    function GetTop: word;
    procedure SetTop(Value: word);
    function GetWidth: word;
    procedure SetWidth(Value: word);
    function GetHeight: word;
    procedure SetHeight(Value: word);
    function GetOptions: word;
    procedure SetOptions(Value: word);
    function GetActiveSheet: word;
    procedure SetActiveSheet(Value: word);
    function GetFirstVisible: word;
    procedure SetFirstVisible(Value: word);
    function GetSelectCount: word;
    procedure SetSelectCount(Value: word);
    function GetTabWidth: word;
    procedure SetTabWidth(Value: word);
  public
    property Left: word read GetLeft write SetLeft;
    property Top: word read GetTop write SetTop;
    property Width: word read GetWidth write SetWidth;
    property Height: word read GetHeight write SetHeight;
    property Options: word read GetOptions write SetOptions;
    property ActiveSheet: word read GetActiveSheet write SetActiveSheet;
    property FirstVisible: word read GetFirstVisible write SetFirstVisible;
    property SelectCount : word read GetSelectCount write SetSelectCount;
    property TabWidth: word read GetTabWidth write SetTabWidth;
  end;

  TbiffWindow2 = class(TbiffRecord)
  private
    function GetOptions: word;
    procedure SetOptions(Value: word);
    function GetTopRow: word;
    procedure SetTopRow(Value: word);
    function GetLeftCol: word;
    procedure SetLeftCol(Value: word);
    function GetGridLineColor: integer;
    procedure SetGridLineColor(Value: integer);
    function GetZoomInPreview: word;
    procedure SetZoomInPreview(Value: word);
    function GetZoomInNormal: word;
    procedure SetZoomInNormal(Value: word);
    function GetReserved: integer;
    procedure SetReserved(Value: integer);
  public
    property Options: word read GetOptions write SetOptions;
    property TopRow: word read GetTopRow write SetTopRow;
    property LeftCol: word read GetLeftCol write SetLeftCol;
    property GridLineColor: integer read GetGridLineColor
      write SetGridLineColor;
    property ZoomInPreview: word read GetZoomInPreview
      write SetZoomInPreview;
    property ZoomInNormal: word read GetZoomInNormal
      write SetZoomInNormal;
    property Reserved: integer read GetReserved write SetReserved;
  end;

  TbiffSelection = class(TbiffRecord)
  private
    function GetPane: byte;
    procedure SetPane(Value: byte);
    function GetActiveRow: word;
    procedure SetActiveRow(Value: word);
    function GetActiveCol: word;
    procedure SetActiveCol(Value: word);
    function GetActiveRef: word;
    procedure SetActiveRef(Value: word);
    function GetRefs: word;
    procedure SetRefs(Value: word);
    function GetRow1: word;
    procedure SetRow1(Value: word);
    function GetRow2: word;
    procedure SetRow2(Value: word);
    function GetCol1: word;
    procedure SetCol1(Value: word);
    function GetCol2: byte;
    procedure SetCol2(Value: byte);
  public
    property Pane: byte read GetPane write SetPane;
    property ActiveRow: word read GetActiveRow write SetActiveRow;
    property ActiveCol: word read GetActiveCol write SetActiveCol;
    property ActiveRef: word read GetActiveRef write SetActiveRef;
    property Refs: word read GetRefs write SetRefs;
    property Row1: word read GetRow1 write SetRow1;
    property Row2: word read GetRow2 write SetRow2;
    property Col1: word read GetCol1 write SetCol1;
    property Col2: byte read GetCol2 write SetCol2;
  end;

  TbiffSCL = class(TbiffRecord)
  private
    function GetNumerator: word;
    procedure SetNumerator(Value: word);
    function GetDenominator: word;
    procedure SetDenominator(Value: word);
  public
    property Numerator: word read GetNumerator write SetNumerator;
    property Denominator: word read GetDenominator write SetDenominator;
  end;

  TbiffSetup = class(TbiffRecord)
  private
    function GetPaperSize: word;
    procedure SetPaperSize(Value: word);
    function GetScalingFactor: word;
    procedure SetScalingFactor(Value: word);
    function GetStartingPageNumber: word;
    procedure SetStartingPageNumber(Value: word);
    function GetFitToWidth: word;
    procedure SetFitToWidth(Value: word);
    function GetFitToHeight: word;
    procedure SetFitToHeight(Value: word);
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
    function GetPrintResolution: word;
    procedure SetPrintResolution(Value: word);
    function GetVerticalPrintResolution: word;
    procedure SetVerticalPrintResolution(Value: word);
    function GetHeaderMargin: double;
    procedure SetHeaderMargin(Value: double);
    function GetFooterMargin: double;
    procedure SetFooterMargin(Value: double);
    function GetNumberOfCopies: word;
    procedure SetNumberOfCopies(Value: word);
  public
    property PaperSize: word read GetPaperSize
      write SetPaperSize;
    property ScalingFactor: word read GetScalingFactor
      write SetScalingFactor;
    property StartingPageNumber: word read GetStartingPageNumber
      write SetStartingPageNumber;
    property FitToWidth: word read GetFitToWidth
      write SetFitToWidth;
    property FitToHeight: word read GetFitToHeight
      write SetFitToHeight;
    property OptionFlags: word read GetOptionFlags
      write SetOptionFlags;
    property PrintResolution: word read GetPrintResolution
      write SetPrintResolution;
    property VerticalPrintResolution: word
      read GetVerticalPrintResolution
      write SetVerticalPrintResolution;
    property HeaderMargin: double read GetHeaderMargin
      write SetHeaderMargin;
    property FooterMargin: double read GetFooterMargin
      write SetFooterMargin;
    property NumberOfCopies: word read GetNumberOfCopies
      write SetNumberOfCopies;
  end;

  TmsoObject = class
  private
    FVersion: word;
    FInstance: word;

    function GetDataSize: integer;
  protected
    function GetSize: integer; virtual; abstract;
  public
    constructor Create(Version, Instance: word);
    procedure Save(Stream: TStream); virtual; abstract;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); virtual; abstract;

    property Version: word read FVersion write FVersion;
    property Instance: word read FInstance write FInstance;
    property Size: integer read GetSize;
    property DataSize: integer read GetDataSize;
  end;

  TmsoList = class(TList)
  private
    function GetItems(Index: integer): TmsoObject;
    procedure SetItems(Index: integer; Value: TmsoObject);
  public
    function Add(Item: TmsoObject): integer;
    procedure Delete(Index: integer);
    {$IFDEF VCL5}
    function Extract(Item: TmsoObject): TmsoObject;
    {$ENDIF}
    function First: TmsoObject;
    function IndexOf(Item: TmsoObject): integer;
    procedure Insert(Index: integer; Item: TmsoObject);
    function Last: TmsoObject;
    function Remove(Item: TmsoObject): integer;

    property Items[Index: integer]: TmsoObject read GetItems
      write SetItems; default;
  end;

  TmsoContainer = class(TmsoObject)
  private
    FFBT: word;
    FAddSize: integer;
    FChildren: TmsoList;
  protected
    function GetSize: integer; override;
  public
    constructor Create(FBT, Version, Instance: word);
    destructor Destroy; override;
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;

    property FBT: word read FFBT write FFBT;
    property AddSize: integer read FAddSize write FAddSize;
    property Children: TmsoList read FChildren;
  end;

  TmsoDgg = class(TmsoObject)
  private
    FPicCount: integer;
  protected
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance: word; PicCount: integer);
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;

    property PicCount: integer read FPicCount;
  end;

  TmsoDg = class(TmsoObject)
  protected
    function GetSize: integer; override;
  public
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoSpgr = class(TmsoObject)
  protected
    function GetSize: integer; override;
  public
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoSp = class(TmsoObject)
  private
    FID: word;
    FFlags: word;
  protected
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance, ID, Flags: word);
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;

    property ID: word read FID write FID;
    property Flags: word read FFlags write FFlags;
  end;

  TmsoOPTData = class
  private
    FOptions: word;
    FValue: cardinal;
    FStrValue: WideString;
  public
    constructor Create(Options: word; Value: DWORD);
    constructor CreateStr(Options: word; const Value: WideString);

    property Options: word read FOptions write FOptions;
    property Value: cardinal read FValue write FValue;
    property StrValue: WideString read FStrValue write FStrValue;
  end;

  TmsoOPTDataList = class(TList)
  private
    function GetItems(Index: integer): TmsoOPTData;
    procedure SetItems(Index: integer; Value: TmsoOPTData);
  public
    function Add(Item: TmsoOPTData): integer;
    procedure Delete(Index: integer);
    {$IFDEF VCL5}
    function Extract(Item: TmsoOPTData): TmsoOPTData;
    {$ENDIF}
    function First: TmsoOPTData;
    function IndexOf(Item: TmsoOPTData): integer;
    procedure Insert(Index: integer; Item: TmsoOPTData);
    function Last: TmsoOPTData;
    function Remove(Item: TmsoOPTData): integer;

    property Items[Index: integer]: TmsoOPTData read GetItems
      write SetItems; default;
  end;

  TmsoOPT = class(TmsoObject)
  protected
    FValues: TmsoOPTDataList;
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance: word);
    destructor Destroy; override;
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
    procedure AddStrValue(ID: word; const Str: WideString);

    property Values: TmsoOPTDataList read FValues;
  end;

  TmsoClientAnchor = class(TmsoObject)
  private
    FOptions: word;
    FAnchor: PMSO_Anchor;
  protected
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance, Options: word; Anchor: TMSO_Anchor);
    destructor Destroy; override;
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;

    property Options: word read FOptions write FOptions;
  end;

  TmsoClientData = class(TmsoObject)
  protected
    function GetSize: integer; override;
  public
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoBLIPData = class(TmsoObject)
  private
    FFileName: string;
    FPicture: TStream;
    FPictureType: integer;

    function GetPictureSize: integer;
  protected
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance: word; const FileName: string;
      Picture: TStream; PictureType: integer);
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoBSEData = class(TmsoBLIPData)
  private
    FRefCount: integer;
  protected
    function GetSize: integer; override;
  public
    constructor Create(Version, Instance: word; const FileName: string;
      Picture: TStream; PictureType, RefCount: integer);
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoClientTextBox = class(TmsoObject)
  protected
    function GetSize: integer; override;
  public
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TmsoSplitMenuColors = class(TmsoObject)
  protected
    function GetSize: integer; override;
  public
    procedure Save(Stream: TStream); override;
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;
  end;

  TxlsMSODrawing = class
  private
    FDgContainer: TmsoContainer;
    FSpgrContainer: TmsoContainer;
    FData: TmsoList;
  public
    constructor Create;
    destructor Destroy; override;
    function GetSize(Index: integer): integer;
    procedure Save(Stream: TStream; Index: integer);
    function CreateByteArray(Index: integer): PByteArray;

    property DgContainer: TmsoContainer read FDgContainer;
    property SpgrContainer: TmsoContainer read FSpgrContainer;
    property Data: TmsoList read FData;
  end;

  TbiffMSODrawing = class(TbiffRecord);

  TbiffMSODrawingGroup = class(TbiffRecord)
  private
    FDataSize: integer;
  protected
    function GetDataSize: integer; override;
  public
    constructor CreateEx(Section: TxlsSection; ID, DataSize: integer;
      Data: PByteArray);
  end;

  TobjRecord = class
  private
    FID: word;
    FLength: word;
  public
    constructor Create(ID, Length: word);
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); virtual;

    property ID: word read FID;
    property Length: word read FLength;
  end;

  TobjRecordList = class(TList)
  private
    function GetItems(Index: integer): TobjRecord;
    procedure SetItems(Index: integer; Value: TobjRecord);
  public
    function Add(Item: TobjRecord): integer;
    procedure Insert(Index: integer; Item: TobjRecord);

    property Items[Index: integer]: TobjRecord read GetItems
      write SetItems; default;
  end;

  TobjCmo = class(TobjRecord)
  private
    FObjectType: word;
    FObjectID: word;
    FOptionFlags: word;
  public
    procedure AssignToByteArray(ByteArray: PByteArray;
      var Position: integer); override;

    property ObjectType: word read FObjectType write FObjectType;
    property ObjectID: word read FObjectID write FObjectID;
    property OptionFlags: word read FOptionFlags write FOptionFlags;
  end;

  TobjEnd = class(TobjRecord);
  TobjNts = class(TobjRecord);

  TbiffObj = class(TbiffRecord);

  TbiffTXO = class(TbiffRecord)
  private
    function GetOptions: word;
    procedure SetOptions(Value: word);
    function GetOrientation: word;
    procedure SetOrientation(Value: word);
    function GetTextLength: word;
    procedure SetTextLength(Value: word);
    function GetFormatLength: word;
    procedure SetFormatLength(Value: word);
  public
    property Options: word read GetOptions write SetOptions;
    property Orientation: word read GetOrientation write SetOrientation;
    property TextLength: word read GetTextlength write SetTextLength;
    property FormatLength: word read GetFormatLength write SetFormatLength;
  end;

  TbiffTXORUN = class(TbiffRecord)
  private
    function GetCharIndex1: word;
    procedure SetCharIndex1(Value: word);
    function GetFontIndex1: word;
    procedure SetFontIndex1(Value: word);
    function GetCharIndex2: word;
    procedure SetCharIndex2(Value: word);
    function GetFontIndex2: word;
    procedure SetFontIndex2(Value: word);
  public
    property CharIndex1: word read GetCharIndex1 write SetCharIndex1;
    property FontIndex1: word read getFontIndex1 write SetFontIndex1;
    property CharIndex2: word read GetCharIndex2 write SetCharIndex2;
    property FontIndex2: word read getFontIndex2 write SetFontIndex2;
  end;

  TbiffNote = class(TbiffColRow)
  private
    function GetOptions: word;
    procedure SetOptions(Value: word);
    function GetObjID: word;
    procedure SetObjID(Value: word);
//    function GetAuthorLength: word;
//    procedure SetAuthorLength(Value: word);
  public
    property Options: word read GetOptions write SetOptions;
    property ObjID: word read GetObjID write SetObjID;
//    property AuthorLength: word read GetAuthorLength write SetAuthorLength;
  end;

  TbiffSupbookInternal = class(TbiffRecord)
  private
    function GetSheetCount: word;
    procedure SetSheetCount(Value: word);
  public
    constructor Create(Section: TxlsSection; ID, DataSize: word;
      Data: PByteArray); override;
    property SheetCount: word read GetSheetCount write SetSheetCount;
  end;

  TbiffExternSheet = class(TbiffRecord)
  private
    function GetRefCount: word;
    procedure SetRefCount(const Value: word);
  public
    property RefCount: word read GetRefCount write SetRefCount;
  end;

  TchartFBI = class(TbiffRecord)
  private
    function GetWidth: word;
    procedure SetWidth(Value: word);
    function GetHeight: word;
    procedure SetHeight(Value: word);
    function GetHeightApplied: word;
    procedure SetHeightApplied(Value: word);
    function GetScale: word;
    procedure SetScale(Value: word);
    function GetFontIndex: word;
    procedure SetFontIndex(Value: word);
  public
    property Width: word read GetWidth write SetWidth;
    property Height: word read GetHeight write SetHeight;
    property HeightApplied: word read GetHeightApplied write SetHeightApplied;
    property Scale: word read GetScale write SetScale;
    property FontIndex: word read GetFontIndex write SetFontIndex;
  end;

  TchartChart = class(TbiffRecord)
  private
    function GetTop: cardinal;
    procedure SetTop(Value: cardinal);
    function GetLeft: cardinal;
    procedure SetLeft(Value: cardinal);
    function GetWidth: cardinal;
    procedure SetWidth(Value: cardinal);
    function GetHeight: cardinal;
    procedure SetHeight(Value: cardinal);
  public
    property Top: cardinal read GetTop write SetTop;
    property Left: cardinal read GetLeft write SetLeft;
    property Width: cardinal read GetWidth write SetWidth;
    property Height: cardinal read GetHeight write SetHeight;
  end;

  TchartPlotGrowth = class(TbiffRecord)
  private
    function GetHorizontal: cardinal;
    procedure SetHorizontal(Value: cardinal);
    function GetVertical: cardinal;
    procedure SetVertical(Value: cardinal);
  public
    property Horizontal: cardinal read GetHorizontal write SetHorizontal;
    property Vertical: cardinal read GetVertical write SetVertical;
  end;

  TchartFrame = class(TbiffRecord)
  private
    function GetFrameType: word;
    procedure SetFrameType(Value: word);
    function GetFlags: word;
    procedure SetFlags(Value: word);
  public
    property FrameType: word read GetFrameType write SetFrameType;
    property Flags: word read GetFlags write SetFlags;
  end;

  TchartLineFormat = class(TbiffRecord)
  private
    function GetColor: cardinal;
    procedure SetColor(Value: cardinal);
    function GetPattern: word;
    procedure SetPattern(Value: word);
    function GetWeight: word;
    procedure SetWeight(Value: word);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
    function GetColorIndex: word;
    procedure SetColorIndex(Value: word);
  public
    property Color: cardinal read GetColor write SetColor;
    property Pattern: word read GetPattern write SetPattern;
    property Weight: word read GetWeight write SetWeight;
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
    property ColorIndex: word read GetColorIndex write SetColorIndex;
  end;

  TchartAreaFormat = class(TbiffRecord)
  private
    function GetForegroundColor: cardinal;
    procedure SetForegroundColor(Value: cardinal);
    function GetBackgroundColor: cardinal;
    procedure SetBackgroundColor(Value: cardinal);
    function GetPattern: word;
    procedure SetPattern(Value: word);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
    function GetForegroundColorIndex: word;
    procedure SetForegroundColorIndex(Value: word);
    function GetBackgroundColorIndex: word;
    procedure SetBackgroundColorIndex(Value: word);
  public
    property ForegroundColor: cardinal read GetForegroundColor
      write SetForegroundColor;
    property BackgroundColor: cardinal read GetBackgroundColor
      write SetBackgroundColor;
    property Pattern: word read GetPattern write SetPattern;
    property FormatFlags: word read GetFormatFlags
      write SetFormatFlags;
    property ForegroundColorIndex: word read GetForegroundColorIndex
      write SetForegroundColorIndex;
    property BackgroundColorIndex: word read GetBackgroundColorIndex
      write SetBackgroundColorIndex;
  end;

  TchartSeries = class(TbiffRecord)
  private
    function GetCategoryType: word;
    procedure SetCategoryType(Value: word);
    function GetValueType: word;
    procedure SetValueType(Value: word);
    function GetCategoryCount: word;
    procedure SetCategoryCount(Value: word);
    function GetValueCount: word;
    procedure SetValueCount(Value: word);
    function GetBubbleType: word;
    procedure SetBubbleType(Value: word);
    function GetBubbleCount: word;
    procedure SetBubbleCount(Value: word);
  public
    property CategoryType: word read GetCategoryType write SetCategoryType;
    property ValueType: word read GetValueType write SetValueType;
    property CategoryCount: word read GetCategoryCount write SetCategoryCount;
    property ValueCount: word read GetValueCount write SetValueCount;
    property BubbleType: word read GetBubbleType write SetBubbleType;
    property BubbleCount: word read getBubbleCount write SetBubbleCount;
  end;

  TchartAI = class(TbiffRecord)
  private
    function GetLinkType: byte;
    procedure SetLinkType(Value: byte);
    function GetReferenceType: byte;
    procedure SetReferenceType(Value: byte);
    function GetFlags: word;
    procedure SetFlags(Value: word);
    function GetFormatIndex: word;
    procedure SetFormatIndex(Value: word);
    function GetFormulaSize: word;
    procedure SetFormulaSize(Value: word);
  public
    property LinkType: byte read GetLinkType write SetLinkType;
    property ReferenceType: byte read GetReferenceType write SetReferenceType;
    property Flags: word read GetFlags write SetFlags;
    property FormatIndex: word read GetFormatIndex write SetFormatIndex;
    property FormulaSize: word read GetFormulaSize write SetFormulaSize;
  end;

  TchartDataFormat = class(TbiffRecord)
  private
    function GetPointNumber: word;
    procedure SetPointNumber(Value: word);
    function GetSeriesIndex: word;
    procedure SetSeriesIndex(Value: word);
    function GetSeriesNumber: word;
    procedure SetSeriesNumber(Value: word);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property PointNumber: word read GetPointNumber write SetPointNumber;
    property SeriesIndex: word read GetSeriesIndex write SetSeriesIndex;
    property SeriesNumber: word read GetSeriesNumber write SetSeriesNumber;
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartSeriesText = class(TbiffRecord)
  private
    function GetTextID: word;
    procedure SetTextID(Value: word);
    function GetLength: byte;
    procedure SetLength(Value: byte);
    function GetText: string;
    procedure SetText(const Value: string);
  public
    property TextID: word read GetTextID write SetTextID;
    property Length: byte read GetLength write SetLength;
    property Text: string read GetText write SetText;
  end;

  TchartSerToCRT = class(TbiffRecord)
  private
    function GetChartGroupIndex: word;
    procedure SetChartGroupIndex(Value: word);
  public
    property ChartGroupIndex: word read GetChartGroupIndex
      write SetChartGroupIndex;
  end;

  TchartShtProps = class(TbiffRecord)
  private
    function GetPropertyFlags: word;
    procedure SetPropertyFlags(Value: word);
    function GetEmptyAs: byte;
    procedure SetEmptyAs(Value: byte);
    function GetUnknown: byte;
    procedure SetUnknown(Value: byte);
  public
    property PropertyFlags: word read GetPropertyFlags write SetPropertyFlags;
    property EmptyAs: byte read GetEmptyAs write SetEmptyAs;
    property Unknown: byte read GetUnknown write SetUnknown; 
  end;

  TchartDefaultText = class(TbiffRecord)
  private
    function GetObjectID: word;
    procedure SetObjectID(Value: word);
  public
    property ObjectID: word read GetObjectID write SetObjectID;
  end;

  TchartText = class(TbiffRecord)
  private
    function GetHorizontalAlignment: byte;
    procedure SetHorizontalAlignment(Value: byte);
    function GetVerticalAlignment: byte;
    procedure SetVerticalAlignment(Value: byte);
    function GetBackgroundMode: word;
    procedure SetBackgroundMode(Value: word);
    function GetColor: cardinal;
    procedure SetColor(Value: cardinal);
    function GetLeft: cardinal;
    procedure SetLeft(Value: cardinal);
    function GetTop: cardinal;
    procedure SetTop(Value: cardinal);
    function GetWidth: cardinal;
    procedure SetWidth(Value: cardinal);
    function GetHeight: cardinal;
    procedure SetHeight(Value: cardinal);
    function GetOptionFlags1: word;
    procedure SetOptionFlags1(Value: word);
    function GetColorIndex: word;
    procedure SetColorIndex(Value: word);
    function GetOptionFlags2: word;
    procedure SetOptionFlags2(Value: word);
    function GetRotation: word;
    procedure SetRotation(Value: word);
  public
    property HorizontalAlignment: byte read GetHorizontalAlignment
      write SetHorizontalAlignment;
    property VerticalAlignment: byte read GetVerticalAlignment
      write SetVerticalAlignment;
    property BackgroundMode: word read GetBackgroundMode
      write SetBackgroundMode;
    property Color: cardinal read GetColor write SetColor;
    property Left: cardinal read GetLeft write SetLeft;
    property Top: cardinal read GetTop write SetTop;
    property Width: cardinal read GetWidth write SetWidth;
    property Height: cardinal read GetHeight write SetHeight;
    property OptionFlags1: word read GetOptionFlags1
      write SetOptionFlags1;
    property ColorIndex: word read GetColorIndex write SetColorIndex;
    property OptionFlags2: word read GetOptionFlags2
      write SetOptionFlags2;
    property Rotation: word read GetRotation write SetRotation;
  end;

  TchartPos = class(TbiffRecord)
  private
    function GetTopLt: word;
    procedure SetTopLt(Value: word);
    function GetBotRt: word;
    procedure SetBotRt(Value: word);
    function GetX1: cardinal;
    procedure SetX1(Value: cardinal);
    function GetY1: cardinal;
    procedure SetY1(Value: cardinal);
    function GetX2: cardinal;
    procedure SetX2(Value: cardinal);
    function GetY2: cardinal;
    procedure SetY2(Value: cardinal);
  public
    property TopLt: word read GetTopLt write SetTopLt;
    property BotRt: word read GetBotRt write SetBotRt;
    property X1: cardinal read GetX1 write SetX1;
    property Y1: cardinal read GetY1 write SetY1;
    property X2: cardinal read GetX2 write SetX2;
    property Y2: cardinal read GetY2 write SetY2;
  end;

  TchartFontX = class(TbiffRecord)
  private
    function GetFontIndex: word;
    procedure SetFontIndex(Value: word);
  public
    property FontIndex: word read GetFontIndex write SetFontIndex;
  end;

  TchartAxesUsed = class(TbiffRecord)
  private
    function GetAxesCount: word;
    procedure SetAxesCount(Value: word);
  public
    property AxesCount: word read GetAxesCount write SetAxesCount;
  end;

  TchartAxisParent = class(TbiffRecord)
  private
    function GetAxisIndex: word;
    procedure SetAxisIndex(Value: word);
    function GetTop: cardinal;
    procedure SetTop(Value: cardinal);
    function GetLeft: cardinal;
    procedure SetLeft(Value: cardinal);
    function GetWidth: cardinal;
    procedure SetWidth(Value: cardinal);
    function GetHeight: cardinal;
    procedure SetHeight(Value: cardinal);
  public
    property AxisIndex: word read GetAxisIndex write SetAxisIndex;
    property Top: cardinal read GetTop write SetTop;
    property Left: cardinal read GetLeft write SetLeft;
    property Width: cardinal read GetWidth write SetWidth;
    property Height: cardinal read GetHeight write SetHeight;
  end;

  TchartAxis = class(TbiffRecord)
  private
    function GetAxisType: word;
    procedure SetAxisType(Value: word);
  public
    property AxisType: word read GetAxisType write SetAxisType;
  end;

  TchartCatSerRange = class(TbiffRecord)
  private
    function GetCrossingPoint: word;
    procedure SetCrossingPoint(Value: word);
    function GetFrequencyLabels: word;
    procedure SetFrequencyLabels(Value: word);
    function GetFrequencyMarks: word;
    procedure SetFrequencyMarks(Value: word);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property CrossingPoint: word read GetCrossingPoint
      write SetCrossingPoint;
    property FrequencyLabels: word read GetFrequencyLabels
      write SetFrequencyLabels;
    property FrequencyMarks: word read GetFrequencyMarks
      write SetFrequencyMarks;
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartAxcExt = class(TbiffRecord)
  private
    function GetMinCategory: word;
    procedure SetMinCategory(Value: word);
    function GetMaxCategory: word;
    procedure SetMaxCategory(Value: word);
    function GetMajorValue: word;
    procedure SetMajorValue(Value: word);
    function GetMajorUnits: word;
    procedure SetMajorUnits(Value: word);
    function GetMinorValue: word;
    procedure SetMinorValue(Value: word);
    function GetMinorUnits: word;
    procedure SetMinorUnits(Value: word);
    function GetBaseUnit: word;
    procedure SetBaseUnit(Value: word);
    function GetCrossingPoint: word;
    procedure SetCrossingPoint(Value: word);
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property MinCategory: word read GetMinCategory write SetMinCategory;
    property MaxCategory: word read GetMaxCategory write SetMaxCategory;
    property MajorValue: word read GetMajorValue write SetMajorValue;
    property MajorUnits: word read GetMajorUnits write SetMajorUnits;
    property MinorValue: word read GetMinorValue write SetMinorValue;
    property MinorUnits: word read GetMinorUnits write SetMinorUnits;
    property BaseUnit: word read GetBaseUnit write SetBaseUnit;
    property CrossingPoint: word read GetCrossingPoint write SetCrossingPoint;
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartTick = class(TbiffRecord)
  private
    function GetMajorMarkType: byte;
    procedure SetMajorMarkType(Value: byte);
    function GetMinorMarkType: byte;
    procedure SetMinorMarkType(Value: byte);
    function GetLabelPosition: byte;
    procedure SetLabelPosition(Value: byte);
    function GetBackgroundMode: byte;
    procedure SetBackgroundMode(Value: byte);
    function GetColor: cardinal;
    procedure SetColor(Value: cardinal);
    function GetDisplayFlags: word;
    procedure SetDisplayFlags(Value: word);
    function GetColorIndex: word;
    procedure SetColorIndex(Value: word);
  public
    property MajorMarkType: byte read GetMajorMarkType
      write SetMajorMarkType;
    property MinorMarkType: byte read GetMinorMarkType
      write SetMinorMarkType;
    property LabelPosition: byte read GetLabelPosition
      write SetLabelPosition;
    property BackgroundMode: byte read GetBackgroundMode
      write SetBackgroundMode;
    property Color: cardinal read GetColor write SetColor;
    property DisplayFlags: word read GetDisplayFlags
      write SetDisplayFlags;
    property ColorIndex: word read GetColorIndex
      write SetColorIndex;
  end;

  TchartValueRange = class(TbiffRecord)
  private
    function GetMinValue: double;
    procedure SetMinValue(Value: double);
    function GetMaxValue: double;
    procedure SetMaxValue(Value: double);
    function GetMajorInc: double;
    procedure SetMajorInc(Value: double);
    function GetMinorInc: double;
    procedure SetMinorInc(Value: double);
    function GetAxisCrosses: double;
    procedure SetAxisCrosses(Value: double);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property MinValue: double read GetMinValue write SetMinValue;
    property MaxValue: double read GetMaxValue write SetMaxValue;
    property MajorInc: double read GetMajorInc write SetMajorInc;
    property MinorInc: double read GetMinorInc write SetMinorInc;
    property AxisCrosses: double read GetAxisCrosses write SetAxisCrosses;
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartAxisLineFormat = class(TbiffRecord)
  private
    function GetLineID: word;
    procedure SetLineID(Value: word);
  public
    property LineID: word read GetLineId write SetLineID;
  end;

  TchartChartFormat = class(TbiffRecord)
  private
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
    function GetDrawingOrder: word;
    procedure SetDrawingOrder(Value: word);
  public
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
    property DrawingOrder: word read GetDrawingOrder write SetDrawingOrder;
  end;

  TchartBar = class(TbiffRecord)
  private
    function GetSpaceBars: word;
    procedure SetSpaceBars(Value: word);
    function GetSpaceCategories: word;
    procedure SetSpaceCategories(Value: word);
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property SpaceBars: word read GetSpaceBars write SetSpaceBars;
    property SpaceCategories: word read GetSpaceCategories
      write SetSpaceCategories;
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartLine = class(TbiffRecord)
  private
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartPie = class(TbiffRecord)
  private
    function GetAngle: word;
    procedure SetAngle(Value: word);
    function GetDonut: word;
    procedure SetDonut(Value: word);
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property Angle: word read GetAngle write SetAngle;
    property Donut: word read GetDonut write SetDonut;
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartArea = class(TbiffRecord)
  private
    function GetFormatFlags: word;
    procedure SetFormatFlags(Value: word);
  public
    property FormatFlags: word read GetFormatFlags write SetFormatFlags;
  end;

  TchartSurface = class(TbiffRecord)
  private
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartRadar = class(TbiffRecord)
  private
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartRadarArea = class(TbiffRecord)
  private
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  Tchart3d = class(TbiffRecord)
  private
    function GetRotation: word;
    procedure SetRotation(Value: word);
    function GetElevation: word;
    procedure SetElevation(Value: word);
    function GetDistance: word;
    procedure SetDistance(Value: word);
    function GetPlotHeight: word;
    procedure SetPlotHeight(Value: word);
    function GetDepth: word;
    procedure SetDepth(Value: word);
    function GetSpace: word;
    procedure SetSpace(Value: word);
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property Rotation: word read GetRotation write SetRotation;
    property Elevation: word read GetElevation write SetElevation;
    property Distance: word read GetDistance write SetDistance;
    property PlotHeight: word read GetPlotHeight write SetPlotHeight;
    property Depth: word read GetDepth write SetDepth;
    property Space: word read GetSpace write SetSpace;
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartLegend = class(TbiffRecord)
    function GetTop: cardinal;
    procedure SetTop(Value: cardinal);
    function GetLeft: cardinal;
    procedure SetLeft(Value: cardinal);
    function GetWidth: cardinal;
    procedure SetWidth(Value: cardinal);
    function GetHeight: cardinal;
    procedure SetHeight(Value: cardinal);
    function GetLegendType: byte;
    procedure SetLegendType(Value: byte);
    function GetSpacing: byte;
    procedure SetSpacing(Value: byte);
    function GetOptionFlags: word;
    procedure SetOptionFlags(Value: word);
  public
    property Top: cardinal read GetTop write SetTop;
    property Left: cardinal read GetLeft write SetLeft;
    property Width: cardinal read GetWidth write SetWidth;
    property Height: cardinal read GetHeight write SetHeight;
    property LegendType: byte read GetLegendType write SetLegendType;
    property Spacing: byte read GetSpacing write SetSpacing;
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
  end;

  TchartObjectLink = class(TbiffRecord)
  private
    function GetLinkedTo: word;
    procedure SetLinkedTo(Value: word);
    function GetSeriesIndex: word;
    procedure SetSeriesIndex(Value: word);
    function GetDataIndex: word;
    procedure SetDataIndex(Value: word);
  public
    property LinkedTo: word read GetLinkedTo write SetLinkedTo;
    property SeriesIndex: word read GetSeriesIndex write SetSeriesIndex;
    property DataIndex: word read GetDataIndex write SetDataIndex;
  end;

  TchartSIIndex = class(TbiffRecord)
  private
    function GetIndex: word;
    procedure SetIndex(Value: word);
  public
    property Index: word read GetIndex write SetIndex;
  end;

  TxlsWorkbook = class;

  TxlsList = class(TList)
  private
    FWorkbook: TxlsWorkbook;
    function GetItems(Index: integer): TObject;
    procedure SetItems(Index: integer; Value: TObject);
  public
    constructor Create(Workbook: TxlsWorkbook);
    function Add(Item: TObject): integer;
    procedure Delete(Index: integer);
    {$IFDEF VCL5}
    function Extract(Item: TObject): TObject;
    {$ENDIF}
    function First: TObject;
    function IndexOf(Item: TObject): integer;
    procedure Insert(Index: integer; Item: TObject);
    function Last: TObject;
    function Remove(Item: TObject): integer;

    property Items[Index: integer]: TObject read GetItems write SetItems;
    property Workbook: TxlsWorkbook read FWorkbook;
  end;

  TbiffRecordList = class(TxlsList)
  private
    function GetItems(Index: integer): TbiffRecord;
    procedure SetItems(Index: integer; Value: TbiffRecord);
  protected
    function GetTotalSize: integer; virtual;
  public
    function Add(Item: TbiffRecord): integer;
    procedure Insert(Index: integer; Item: TbiffRecord);
    procedure Save(Stream: TStream);

    property Items[Index: integer]: TbiffRecord read GetItems
      write SetItems; default;
    property TotalSize: integer read GetTotalSize;
  end;

  TbiffColRowList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffColRow;
    procedure SetItems(Index: integer; Value: TbiffColRow);
  public
    property Items[Index: integer]: TbiffColRow read GetItems
      write SetItems; default;
    function Add(Item: TbiffColRow): integer;
    procedure Insert(Index: integer; Item: TbiffColRow);
  end;

  TbiffColRowListClass = class of TbiffColRowList;

  TbiffCellList = class(TbiffColRowList)
  private
    FSorted: boolean;
    function GetItems(Index: integer): TbiffCell;
    procedure SetItems(Index: integer; Value: TbiffCell);
    procedure OnDestroyItem(Sender: TObject);
  protected
    procedure SetMinAndMaxCells(Item: TbiffCell); virtual;
    procedure SetColRowNumber(Item: TbiffCell); virtual;
    property Sorted: boolean read FSorted write FSorted;
  public
    function Add(Item: TbiffCell): integer;
    procedure Insert(Index: integer; Item: TbiffCell);

    property Items[Index: integer]: TbiffCell read GetItems
      write SetItems; default;
  end;

  TxlsRow = class(TbiffCellList)
  private
    FRowNumber: integer;
    FMinCol: integer;
    FMaxCol: integer;
  protected
    procedure SetMinAndMaxCells(Item: TbiffCell); override;
    procedure SetColRowNumber(Item: TbiffCell); override;
  public
    constructor Create(Workbook: TxlsWorkbook);
    function Find(Col: integer; var Index: integer): boolean;
    procedure Sort;

    property RowNumber: integer read FRowNumber;
    property MinCol: integer read FMinCol;
    property MaxCol: integer read FMaxCol;
  end;

  TxlsCol = class(TbiffCellList)
  private
    FColNumber: integer;
    FMinRow: integer;
    FMaxRow: integer;
  protected
    procedure SetMinAndMaxCells(Item: TbiffCell); override;
    procedure SetColRowNumber(Item: TbiffCell); override;
  public
    constructor Create(Workbook: TxlsWorkbook);
    function Find(Row: integer; var Index: integer): boolean;
    procedure Sort;

    property ColNumber: integer read FColNumber;
    property MinRow: integer read FMinRow;
    property MaxRow: integer read FMaxRow;
  end;

  TbiffShrFmlaList = class(TbiffRecordList)
  private
    FSorted: boolean;

    function GetItems(Index: integer): TbiffShrFmla;
    procedure SetItems(Index: integer; Value: TbiffShrFmla);
  public
    function Add(Item: TbiffShrFmla): integer;
    procedure Insert(Index: integer; Item: TbiffShrFmla);
    function Find(Key: cardinal; var Index: integer): boolean;
    procedure Sort;

    property Items[Index: integer]: TbiffShrFmla read GetItems
      write SetItems; default;
  end;

  TbiffNameList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffName;
    procedure SetItems(Index: integer; Value: TbiffName);
  public
    function Add(Item: TbiffName): integer;
    procedure Insert(Index: integer; Item: TbiffName);

    property Items[Index: integer]: TbiffName read GetItems
      write SetItems; default;
  end;

  TbiffBoundSheetList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffBoundSheet;
    procedure SetItems(Index: integer; Value: TbiffBoundSheet);
    function GetName(Index: integer): WideString;
  public
    function Add(Item: TbiffBoundSheet): integer;
    procedure Insert(Index: integer; Item: TbiffBoundSheet);

    property Items[Index: integer]: TbiffBoundSheet read GetItems
      write SetItems; default;
    property Name[Index: integer]: WideString read GetName;
  end;

  TbiffXFList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffXF;
    procedure SetItems(Index: integer; Value: TbiffXF);
  public
    function Add(Item: TbiffXF): integer;
    procedure Insert(Index: integer; Item: TbiffXF);

    property Items[Index: integer]: TbiffXF read GetItems
      write SetItems; default;
  end;

  TbiffFontList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffFont;
    procedure SetItems(Index: integer; Value: TbiffFont);
  public
    function Add(Item: TbiffFont): integer;
    procedure Insert(Index: integer; Item: TbiffFont);

    property Items[Index: integer]: TbiffFont read GetItems
      write SetItems; default;
  end;

  TbiffStyleList = class(TbiffRecordList)
  private
    function GetItems(Index: integer): TbiffStyle;
    procedure SetItems(Index: integer; Value: TbiffStyle);
  public
    function Add(Item: TbiffStyle): integer;
    procedure Insert(Index: integer; Item: TbiffStyle);

    property Items[Index: integer]: TbiffStyle read GetItems
      write SetItems; default;
  end;

  TbiffFormatList = class(TbiffRecordList)
  private
    FSorted: boolean;

    function GetItems(Index: integer): TbiffFormat;
    procedure SetItems(Index: integer; Value: TbiffFormat);
    function GetFormat(ID: integer): WideString;
  public
    function Add(Item: TbiffFormat): integer;
    procedure Insert(Index: integer; Item: TbiffFormat);
    function Find(ID: integer; var Index: integer): boolean;
    procedure Sort;

    property Items[Index: integer]: TbiffFormat read GetItems write SetItems;
    property Format[Index: integer]: WideString read GetFormat; default;
  end;

  TxlsColInfoList = class(TxlsList)
  private
    FSorted: boolean;
    function GetItems(Index: integer): TxlsColInfo;
    procedure SetItems(Index: integer; const Value: TxlsColInfo);
    function GetTotalSize: integer;
  public
    function Add(Item: TxlsColInfo): integer;
    procedure Insert(Index: integer; Item: TxlsColInfo);
    function Find(Column: integer; var Index: integer): boolean;
    procedure Sort;
    procedure AddRecord(R: TbiffColInfo);
    procedure Save(Stream: TStream);

    property Items[Index: integer]: TxlsColInfo read GetItems write SetItems;
    property TotalSize: integer read GetTotalSize;
  end;

  TxlsSSTIndex = class;

  TbiffSSTList = class(TxlsList)
  private
    FSSTIndex: TxlsSSTIndex;
    function GetItems(Index: integer): TxlsSSTEntry;
    procedure SetItems(Index: integer; Value: TxlsSSTEntry);

    procedure CalcNextContinue(First: integer; var Last: integer;
      var RecordSize: word);
    function GetTotalSize: integer;
  public
    function Add(Item: TxlsSSTEntry): integer;
    procedure Insert(Index: integer; Item: TxlsSSTEntry);
    procedure Load(SST: TbiffSST);
    procedure Save(Stream: TStream);
    function AddString(const Str: WideString): integer;
    procedure ClearEmptyEntries;

    property  TotalSize: integer read GetTotalSize;
    property Items[Index: integer]: TxlsSSTEntry read GetItems
      write SetItems; default;
  end;

  TxlsSSTIndex = class(TList)
  private
    FSorted: boolean;
    FSSTList: TbiffSSTList;

    function GetItems(Index: integer): TxlsSSTEntry;
    procedure SetItems(Index: integer; Value: TxlsSSTEntry);
  public
    constructor Create(SSTList: TbiffSSTList);

    function Add(Item: TxlsSSTEntry): integer;
    function Find(Str: TxlsString; var Index: integer): boolean;
    procedure Recreate;
    procedure Sort;

    property Items[Index: integer]: TxlsSSTEntry read GetItems
      write SetItems; default;
  end;

  TxlsRowList = class(TxlsList)
  private
    FSorted: boolean;
    function GetItems(Index: integer): TxlsRow;
    procedure SetItems(Index: integer; Value: TxlsRow);
    function GetTotalSize: integer;
  public
    constructor Create(Workbook: TxlsWorkbook);
    function Add(Row: TxlsRow): integer;
    procedure Insert(Index: integer; Row: TxlsRow);
    function Find(Row: integer; var Index: integer): boolean;
    procedure Sort;

    property Items[Index: integer]: TxlsRow read GetItems
      write SetItems; default;
    property TotalSize: integer read GetTotalSize;
  end;

  TxlsColList = class(TxlsList)
  private
    FSorted: boolean;
    function GetItems(Index: integer): TxlsCol;
    procedure SetItems(Index: integer; Value: TxlsCol);
  public
    constructor Create(Workbook: TxlsWorkbook);
    function Add(Col: TxlsCol): integer;
    procedure Insert(Index: integer; Col: TxlsCol);
    function Find(Col: integer; var Index: integer): boolean;
    procedure Sort;

    property Items[Index: integer]: TxlsCol read GetItems write SetItems; default;
  end;

  TxlsSection = class
  private
    FWorkbook: TxlsWorkbook;
    FBOF: TbiffBOF;
    FEOF: TbiffEOF;

    FOnDestroy: TNotifyEvent;
  protected
    function GetTotalSize: integer; virtual;
  public
    constructor Create(Workbook: TxlsWorkbook);
    destructor Destroy; override;
    procedure Load(Stream: TStream; BOF: TbiffBOF); virtual; abstract;
    procedure Save(Stream: TStream); virtual; abstract;
    procedure Clear;

    property Workbook: TxlsWorkbook read FWorkbook;
    property BOF: TbiffBOF read FBOF write FBOF;
    property EOF: TbiffEOF read FEOF write FEOF;
    property TotalSize: integer read GetTotalSize;

    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
  end;

  TxlsGlobals = class(TxlsSection)
  private
    FNameList: TbiffNameList;
    FWindow1: TbiffWindow1;
    FOthers1: TbiffRecordList;
    FFontList: TbiffFontList;
    FFormatList: TbiffFormatList;
    FXFList: TbiffXFList;
    FStyleList: TbiffStyleList;
    FSSTList: TbiffSSTList;
    FSSTIndex: TxlsSSTIndex;
    FBoundSheetList: TbiffBoundSheetList;
    FOthers2: TbiffRecordList;
  protected
    function GetTotalSize: integer; override;
  public
    constructor Create(Workbook: TxlsWorkbook);
    destructor Destroy; override;
    procedure Clear;
    procedure Load(Stream: TStream; BOF: TbiffBOF); override;
    procedure Save(Stream: TStream); override;

    property NameList: TbiffNameList read FNameList;
    property Window1: TbiffWindow1 read FWindow1 write FWindow1;
    property Others1: TbiffRecordList read FOthers1;
    property FontList: TbiffFontList read FFontList;
    property FormatList: TbiffFormatList read FFormatList;
    property XFList: TbiffXFList read FXFList;
    property StyleList: TbiffStyleList read FStyleList;
    property SSTList: TbiffSSTList read FSSTList;
    property SSTIndex: TxlsSSTIndex read FSSTIndex;
    property BoundSheetList: TbiffBoundSheetList read FBoundSheetList;
    property Others2: TbiffRecordList read FOthers2;
  end;

  TxlsChartSheet = class(TxlsSection)
  private
    FRecordList: TbiffRecordList;
  public
    constructor Create(Workbook: TxlsWorkbook);
    destructor Destroy; override;
    procedure Load(Stream: TStream; BOF: TbiffBOF); override;
    procedure Save(Stream: TStream); override;

    property RecordList: TbiffRecordList read FRecordList;
  end;

  TxlsChartSheetList = class(TxlsList)
  private
    function GetItems(Index: integer): TxlsChartSheet;
    procedure SetItems(Index: integer; Value: TxlsChartSheet);
    function GetTotalSize: integer;
  public
    function Add(Item: TxlsChartSheet): integer;
    procedure Insert(Index: integer; Item: TxlsChartSheet);
    procedure Save(Stream: TStream);

    property Items[Index: integer]: TxlsChartSheet read GetItems
      write SetItems; default;
    property TotalSize: integer read GetTotalSize;
  end;

  TxlsWorkSheet = class(TxlsSection)
  private
    FRows: TxlsRowList;
    FCols: TxlsColList;
    FColInfoList: TxlsColInfoList;
    FOthers1: TbiffRecordList;
    FDimensions: TBiffDimensions;
    FOthers2: TbiffRecordList;
    FHlinks: TbiffRecordList;
    FOthers3: TbiffRecordList;
    FCharts: TxlsChartSheetList;
    FDefColWidth: integer;
    FDefRowHeight: integer;

    FIndex: integer;
    FWindow2: TbiffWindow2;

    function GetName: WideString;
    function GetRowCount: integer;
    function GetColCount: integer;
    function GetCells(Row, Col: integer): TbiffCell;
    procedure FixDimensions;
  protected
    function GetTotalSize: integer; override;
  public
    constructor Create(Workbook: TxlsWorkbook); {override;}
    destructor Destroy; override;
    procedure Clear;
    procedure Load(Stream: TStream; BOF: TbiffBOF); override;
    procedure Save(Stream: TStream); override;
    procedure AddCell(Cell: TbiffCell);
    procedure AddMultiple(Multiple: TbiffMultiple);

    property Name: WideString read GetName;
    property Window2: TbiffWindow2 read FWindow2 write FWindow2;

    property Rows: TxlsRowList read FRows;
    property RowCount: integer read GetRowCount;
    property Cols: TxlsColList read FCols;
    property ColCount: integer read GetColCount;
    property ColInfoList: TxlsColInfoList read FColInfoList;
    property Others1: TbiffRecordList read FOthers1;
    property Others2: TbiffRecordList read FOthers2;
    property HLinks: TbiffRecordList read FHLinks;
    property Others3: TbiffRecordList read FOthers3;
    property Charts: TxlsChartSheetList read FCharts;
    property Dimensions: TbiffDimensions read FDimensions write FDimensions;

    property Cells[Row, Col: integer]: TbiffCell read GetCells;
    property DefColWidth: integer read FDefColWidth;
    property DefRowHeight: integer read FDefRowHeight;

    property TotalSize: integer read GetTotalSize;
  end;

  TxlsWorkSheetList = class(TxlsList)
  private
    function GetItems(Index: integer): TxlsWorkSheet;
    procedure SetItems(Index: integer; Value: TxlsWorkSheet);
    procedure OnDestroyItem(Sender: TObject);
  public
    function Add(Item: TxlsWorkSheet): integer;
    procedure Insert(Index: integer; Item: TxlsWorkSheet);
    function IndexOfName(const Name: WideString): integer;
    procedure Save(Stream: TStream);

    property Items[Index: integer]: TxlsWorkSheet read GetItems
      write SetItems; default;
  end;

  TxlsFile = class;

  TxlsWorkbook = class
  private
    FExcelFile: TxlsFile;
    FGlobals: TxlsGlobals;
    FWorkSheets: TxlsWorkSheetList;

    procedure FixBoundSheetOffsets;
  public
    constructor Create(ExcelFile: TxlsFile);
    destructor Destroy; override;
    procedure Load(Stream: TStream);
    procedure Save(Stream: TStream);
    procedure Clear;

    property ExcelFile: TxlsFile read FExcelFile;

    property Globals: TxlsGlobals read FGlobals;
    property WorkSheets: TxlsWorkSheetList read FWorkSheets;
  end;

  TFunctionEvent = procedure(Sender: TObject; const FunctionName: string;
    Arguments: Variant; var Result: Variant) of object;

  TxlsFile = class
  private
    FFileName: string;
    FStream: TStream;
    FWorkbook: TxlsWorkbook;
    FLoading: boolean;
    FLoaded: boolean;

    FOnFunction: TFunctionEvent;

    FOleStream: IStream;
    FStorage: IStorage;

    procedure Open(ReadOnly: boolean);
    procedure Close;
  public
    constructor Create;
    destructor Destroy; override;

    function OpenStream: TStream;
//    function CreateStream(const FileName: string): TStream;

    procedure Clear;
    procedure Load;
    procedure Save;

    property Loading: boolean read FLoading;
    property Loaded: boolean read FLoaded;

    property FileName: string read FFileName write FFileName;
    property Workbook: TxlsWorkbook read FWorkbook;

    property OnFunction: TFunctionEvent read FOnFunction write FOnFunction;
  end;

implementation

uses QExport3XLSConsts, QExport3XLSUtils, ComObj, AxCtrls, Dialogs, Consts,
  QExport3XLS{$IFDEF USES_JPEG}, Jpeg{$ENDIF};

{ TbiffRecord }

constructor TbiffRecord.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
begin
  inherited Create;
  FSection := Section;
  FID := ID;
  FDataSize := DataSize;
  FData := Data;
end;

destructor TbiffRecord.Destroy;
begin
  if Assigned(FOnDestroy) then FOnDestroy(Self);
  if Assigned(FData) then FreeMem(FData);
  if Assigned(FContinue) then begin
    FContinue.Free;
    FContinue := nil;
  end;
  inherited;
end;

procedure TbiffRecord.AddContinue(const Continue: TbiffContinue);
begin
  if Assigned(FContinue) then
    raise ExlsFileError.Create(sInvalidContinue);
  FContinue := Continue;
end;

procedure TbiffRecord.Save(Stream: TStream);
var
  Sz, Ps: integer;
  Ln: word;
  Continue: word;
begin
  if not Assigned(Stream) then Exit;

  if Stream.Write(FID, SizeOf(FID)) <> SizeOf(FID) then
    raise Exception.Create(sCannotWrite);

  Sz := GetDataSize; Ln := 0; Ps := 0;
  if Sz > 8220
    then Ln := 8220
    else Ln := Sz;

  if Stream.Write(Ln, SizeOf(Ln)) <> SizeOf(Ln) then
    raise Exception.Create(sCannotWrite);

  if Ln > 0 then begin
    if Stream.Write(FData^, Ln) <> Ln then
      raise Exception.Create(sCannotWrite);

    Dec(Sz, Ln);
    Inc(Ps, Ln);

    while Sz > 0 do begin

      if Sz > 8220
        then Ln := 8220
        else Ln := Sz;

      Continue := BIFF_CONTINUE;
      if Stream.Write(Continue, SizeOf(Continue)) <> SizeOf(Continue) then
        raise Exception.Create(sCannotWrite);

      if Stream.Write(Ln, SizeOf(Ln)) <> SizeOf(Ln) then
        raise Exception.Create(sCannotWrite);

      if Stream.Write(FData[Ps], Ln) <> Ln then
        raise Exception.Create(sCannotWrite);

      Dec(Sz, Ln);
      Inc(Ps, Ln);
    end;
  end;

  if Assigned(FContinue) then FContinue.Save(Stream);
end;

procedure TbiffRecord.Clear;
begin
  FillChar(FData^, FDataSize, $0);
end;

function TbiffRecord.GetDataSize: integer;
begin
  Result := FDataSize;
end;

function TbiffRecord.GetTotalSize: integer;
begin
  Result := SizeOf(TBIFF_Header) +  FDataSize;
  if Assigned(FContinue) then Result := Result + Continue.TotalSize;
end;

function TbiffRecord.GetXFList: TbiffXFList;
begin
  Result := Section.Workbook.Globals.XFList;
end;

function TbiffRecord.GetFormatList: TbiffFormatList;
begin
  Result := Section.Workbook.Globals.FormatList;
end;

function TbiffRecord.GetSSTList: TbiffSSTList;
begin
  Result := Section.Workbook.Globals.SSTList;
end;

{ TbiffBOF }

constructor TbiffBOF.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
begin
  inherited;
  if Section.Workbook.ExcelFile.Loading then
    if GetWord(Data, 0) <> BIFF_BOF_VER then
      raise Exception.Create(sInvalidVersion);
end;

function TbiffBOF.GetVersion: word;
begin
  Result := PBIFF_BOF(Data).Version;
end;

procedure TbiffBOF.SetVersion(Value: word);
begin
  PBIFF_BOF(Data).Version := Value;
end;

function TbiffBOF.GetDataType: word;
begin
  Result := PBIFF_BOF(Data).DataType;
end;

procedure TbiffBOF.SetDataType(Value: word);
begin
  PBIFF_BOF(Data).DataType := Value;
end;

function TbiffBOF.GetBuildID: word;
begin
  Result := PBIFF_BOF(Data).BuildID;
end;

procedure TbiffBOF.SetBuildID(Value: word);
begin
  PBIFF_BOF(Data).BuildID := Value;
end;

function TbiffBOF.GetBuildYear: word;
begin
  Result := PBIFF_BOF(Data).BuildYear;
end;

procedure TbiffBOF.SetBuildYear(Value: word);
begin
  PBIFF_BOF(Data).BuildYear := Value;
end;

function TbiffBOF.GetHistoryFlags: integer;
begin
  Result := PBIFF_BOF(Data).HistoryFlags;
end;

procedure TbiffBOF.SetHistoryFlags(Value: integer);
begin
  PBIFF_BOF(Data).HistoryFlags := Value;
end;

function TbiffBOF.GetLowVersion: integer;
begin
  Result := PBIFF_BOF(Data).LowVersion;
end;

procedure TbiffBOF.SetLowVersion(Value: integer);
begin
  PBIFF_BOF(Data).LowVersion := Value;
end;

{ TbiffBoundSheet }

function TbiffBoundSheet.GetBOFPos: integer;
begin
  Result := PBIFF_BOUNDSHEET(Data).BOFPos;
end;

procedure TbiffBoundSheet.SetBOFPos(Value: integer);
begin
  PBIFF_BOUNDSHEET(Data).BOFPos := Value;
end;

function TbiffBoundSheet.GetVisibility: byte;
begin
  Result := PBIFF_BOUNDSHEET(Data).Visibility;
end;

procedure TbiffBoundSheet.SetVisibility(Value: byte);
begin
  PBIFF_BOUNDSHEET(Data).Visibility := Value;
end;

function TbiffBoundSheet.GetSheetType: byte;
begin
  Result := PBIFF_BOUNDSHEET(Data).SheetType;
end;

procedure TbiffBoundSheet.SetSheetType(Value: byte);
begin
  PBIFF_BOUNDSHEET(Data).SheetType := Value;
end;

function TbiffBoundSheet.GetNameLen: byte;
begin
  Result := PBIFF_BOUNDSHEET(Data).NameLen;
end;

procedure TbiffBoundSheet.SetNameLen(Value: byte);
begin
  PBIFF_BOUNDSHEET(Data).NameLen := Value;
end;

function TbiffBoundSheet.GetNameOpt: byte;
begin
  Result := PBIFF_BOUNDSHEET(Data).NameOpt;
end;

procedure TbiffBoundSheet.SetNameOpt(Value: byte);
begin
  PBIFF_BOUNDSHEET(Data).NameOpt := Value;
end;

function TbiffBoundSheet.GetName: WideString;
var
  Ln: integer;
begin
  Result := EmptyStr;
  Ln := GetNameLen;
  if Ln <= 0 then Exit;
  SetLength(Result, Ln * 2);
  Move(Data[8], Result[1], Ln * 2);
end;

procedure TbiffBoundSheet.SetName(const Value: WideString);
var
  Ln: integer;
begin
  Ln := GetNameLen;
  if Ln <= 0 then Exit;
  Move(Value[1], Data[8], Ln * 2);
end;

{ TbiffCountry }

function TbiffCountry.GetCountryDef: word;
begin
  Result := PBIFF_COUNTRY(Data).CountryDef;
end;

procedure TbiffCountry.SetCountryDef(Value: word);
begin
  PBIFF_COUNTRY(Data).CountryDef := Value;
end;

function TbiffCountry.GetCountryWinIni: word;
begin
  Result := PBIFF_COUNTRY(Data).CountryWinIni;
end;

procedure TbiffCountry.SetCountryWinIni(Value: word);
begin
  PBIFF_COUNTRY(Data).CountryWinIni := Value;
end;

{ TbiffString }

function TbiffString.GetValue: WideString;
var
  Str: TxlsString;
  Tmp: TbiffRecord;
  Offset: integer;
begin
  Tmp := Self;
  Offset := 0;
  //Str := TxlsString.Create(true, Tmp, Offset);
  Str := TxlsString.CreateR(true, Tmp, Offset);
  try
    Result := Str.Value;
  finally
    Str.Free;
  end;
end;

{ TbiffColRow }

constructor TbiffColRow.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
begin
  inherited;
  if DataSize < 4 then
    raise ExlsFileError.CreateFmt(sWrongExcelRecord, [ID]);
end;

function TbiffColRow.GetCol: word;
begin
  Result := GetWord(Data, 2);
end;

procedure TbiffColRow.SetCol(Value: word);
begin
  SetWord(Data, 2, Value);
end;

function TbiffColRow.GetRow: word;
begin
  Result := GetWord(Data, 0);
end;

procedure TbiffColRow.SetRow(Value: word);
begin
  SetWord(Data, 0, Value);
end;

{ TbiffCell }

constructor TbiffCell.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray); 
begin
  inherited;
  if Section is TxlsWorkSheet
    then FWorkSheet := Section as TxlsWorkSheet
    else FWorkSheet := nil;
end;

function TbiffCell.GetXFIndex: word;
begin
  Result := GetWord(Data, 4);
end;

procedure TbiffCell.SetXFIndex(Value: word);
begin
  SetWord(Data, 4, Value);
end;

function TbiffCell.GetFormatIndex: word;
begin
  Result := Section.Workbook.Globals.XFList[XFIndex].FormatIndex;
end;

function TbiffCell.GetCellName: string;
begin
  Result := Col2Letter(Col) + Row2Number(Row);
end;

function TbiffCell.GetCellType: TbiffCellType;
begin
  Result := bctUnknown;
end;

function TbiffCell.GetIsFormula: boolean;
begin
  Result := false;
end;

function TbiffCell.GetIsString: boolean;
begin
  Result := GetCellType = bctString;
end;

function TbiffCell.GetIsBoolean: boolean;
begin
  Result := GetCellType = bctBoolean;
end;

function TbiffCell.GetIsFloat: boolean;
begin
  Result := GetCellType = bctNumeric;
end;

function TbiffCell.GetIsDateTime: boolean;
begin
  Result := GetCellType = bctDateTime;
end;

function TbiffCell.GetIsDateOnly: boolean;
begin
  Result := (GetCellType = bctDateTime) and (Frac(GetAsDateTime) = 0);
end;

function TbiffCell.GetIsTimeOnly: boolean;
begin
  Result := (GetCellType = bctDateTime) and (Int(GetAsDateTime) = 0);
end;

function TbiffCell.GetIsVariant: boolean;
begin
  Result := GetCellType = bctUnknown;
end;

function TbiffCell.GetAsString: WideString;
begin
  Result := EmptyStr;
end;

procedure TbiffCell.SetAsString(const Value: WideString);
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'String']);
end;

function TbiffCell.GetAsBoolean: boolean;
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'Boolean']);
end;

procedure TbiffCell.SetAsBoolean(Value: boolean);
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'Boolean']);
end;

function TbiffCell.GetAsFloat: double;
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'Float']);
end;

procedure TbiffCell.SetAsFloat(Value: double);
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'Float']);
end;

function TbiffCell.GetAsDateTime: TDateTime;
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'DateTime']);
end;

procedure TbiffCell.SetAsDateTime(Value: TDateTime);
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'DateTime']);
end;

function TbiffCell.GetAsVariant: variant;
begin
  Result := NULL;
end;

procedure TbiffCell.SetAsVariant(Value: variant);
begin
  raise ExlsFileError.CreateFmt(sCellAccessError, [CellName, 'Variant']);
end;

{ TbiffBoolErr }

function TbiffNumber.GetCellType: TbiffCellType;
begin
  Result := bctNumeric;
end;

function TbiffBoolErr.GetCellType: TbiffCellType;
begin
  Result := bctBoolean;
end;

function TbiffBoolErr.GetAsBoolean: boolean;
begin
  if Data[6] = 0
    then Result := false
    else Result := true
end;

procedure TbiffBoolErr.SetAsBoolean(Value: boolean);
begin
  Data[7] := 0;
  if Value
    then Data[6] := 1
    else Data[6] := 0;
end;

function TbiffBoolErr.GetAsVariant: variant;
begin
  if Data[7] = 0
    then  Result := GetAsBoolean
    else Result := ErrcodeToString(Data[6]);
end;

procedure TbiffBoolErr.SetAsVariant(Value: variant);
begin
  case VarType(Value) of
    varBoolean: SetAsBoolean(Value);
    varOleStr,
    varString: begin
      Data[7] := 1;
      Data[6] := StringToErrcode(Value);
    end;
    varNull: raise ExlsFileError.CreateFmt(sInvalidCellValue, ['']);

    else raise Exception.CreateFmt(sInvalidCellValue, [VarAsType(Value, varString)]);
  end;
end;

{ TbiffNumber }

function TbiffNumber.GetAsFloat: double;
var
  D: double;
begin
  Move(Data[6], D, SizeOf(d));
  Result := D;
end;

procedure TbiffNumber.SetAsFloat(Value: double);
var
  D: double;
begin
  D := Value;
  Move(D, Data[6], SizeOf(D));
end;

function TbiffNumber.GetAsVariant: variant;
begin
  Result := GetAsFloat;
end;

procedure TbiffNumber.SetAsVariant(Value: variant);
begin
  SetAsFloat(Value);
end;

function TbiffNumber.GetAsString: WideString;
begin
  Result := FloatToStr(GetAsFloat);
end;

procedure TbiffNumber.SetAsString(const Value: WideString);
var
  D: double;
begin
  D := StrToFloat(Value);
  SetAsFloat(D);
end;

{ TbiffRK }

function TbiffRK.GetCellType: TbiffCellType;
begin
  if GetIsDateTime
    then Result := bctDateTime
    else Result := bctNumeric;
end;

function TbiffRK.GetAsFloat: double;
var
  RK, PD: ^longint;
  D: double;
begin
  RK := @(Data[6]);
  if RK^ and $2 = $2 then // integer
    if RK^ and (1 shl 31) = (1 shl 31) // negative
      then D := not (not (RK^) shr 2)
      else D := RK^ shr 2
  else begin
    PD := @D;
    PD^ := 0;
    Inc(PD);
    PD^ := RK^ and $FFFFFFFC;
  end;

  Result := D;
  if RK^ and $1 = $1 then Result := Result / 100;
end;

procedure TbiffRK.SetAsFloat(Value: double);
var
  RK: ^longint;
begin
  RK := @(Data[6]);
  if not EncodeRK(Value, RK^) then
    raise ExlsFileError.CreateFmt(sInvalidCellValue, [FloatToStr(Value)]);
end;

function TbiffRK.GetAsDateTime: TDateTime;
begin
  Result := GetAsFloat;
end;

procedure TbiffRK.SetAsDateTime(Value: TDateTime);
begin
  SetAsFloat(Value);
end;

function TbiffRK.GetAsVariant: variant;
begin
  Result := GetAsFloat;
end;

procedure TbiffRK.SetAsVariant(Value: variant);
begin
  SetAsFloat(Value);
end;

function TbiffRK.GetIsDateTime: boolean;
var
  FormatList: TbiffFormatList;
  str: string;
  fmt: integer;
begin
  Result := false;
  FormatList := Section.Workbook.Globals.FormatList;
  fmt := FormatIndex;
  if fmt <= High(InternalNumberFormats) then
    Result := fmt in [$0E, $0F, $10, $11, $12, $13, $14, $15, $16]
  else begin
    Dec(fmt, High(InternalNumberFormats));
    if (fmt > 0) and
       (fmt <= FormatList.Count) then begin
      str  := FormatList[fmt - 1];
      Result := (Pos('y', str) > 0) or (Pos('m', str) > 0) or
        (Pos('d', str) > 0) or (Pos('h', str) > 0) or (Pos('s', str) > 0);
    end;
  end;
end;

function TbiffRK.GetAsString: WideString;
begin
  if GetCellType = bctNumeric then
    Result := FloatToStr(GetAsFloat)
  else begin
    if IsDateOnly then
      Result := DateToStr(GetAsDateTime)
    else if IsTimeOnly then
      Result := TimeToStr(GetAsDateTime)
    else Result := DateTimeToStr(GetAsDateTime);
  end;
end;

procedure TbiffRK.SetAsString(const Value: WideString);
var
  D: double;
  DT: TDateTime;
begin
  if GetCellType = bctNumeric then begin
    D := StrToFloat(Value);
    SetAsFloat(D);
  end
  else begin
    DT := StrToDateTime(Value);
    SetAsDateTime(DT);
  end;
end;

{ TsstString }

{constructor TsstString.Create;
begin
  inherited;
  FValue := EmptyStr;
  FOptionFlags := $01;
  FRefCount := 0;
end;

function TsstString.GetLength: integer;
begin
  Result := System.Length(FValue);
end;

function TsstString.GetSize: integer;
begin
  Result := 3 + 2 * GetLength;
end;

procedure TsstString.Save(Stream: TStream);
var
  Ln: integer;
begin
  Ln := GetLength;
  Stream.Write(Ln, SizeOf(Word));
  Stream.Write(FOptionFlags, SizeOf(FOptionFlags));
  if Ln > 0 then
    Stream.Write(FValue[1], Ln * 2);
end;}

{ TsstStringList }

constructor TsstStringList.Create(Strings: TsstStrings);
begin
  inherited Create;
  FItemOwner := false;
//  FSortedList := TList.Create;
  FStrings := Strings;
end;

destructor TsstStringList.Destroy;
begin
//  FSortedList.Free;
  inherited;
end;

function TsstStringList.Add(Item: PsstString): integer;
begin
  Result := inherited Add(Item)
end;

procedure TsstStringList.Delete(Index: integer);
begin
  if FItemOwner and Assigned(Items[Index]) then
    Dispose(Items[Index]);
  inherited;
end;

function TsstStringList.Find(const Value: WideString;
  var Index: integer): boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    C := CompareWideStr(PsstString(Items[I]).FValue, Value);
    if C < 0 then L := I + 1 else begin
      H := I - 1;
      if C = 0 then begin
        Result := True;
        //if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
  if Result then Index := PsstString(Items[Index]).FID;
end;

procedure TsstStringList.Insert(Index: integer; Item: PsstString);
begin
  inherited Insert(Index, Item);
end;

procedure TsstStringList.Sort;

  procedure QuickSort(L, R: Integer{;
    SCompare: TWideStringListSortCompare});
  var
    I, J, P: Integer;
  begin
    repeat
      I := L;
      J := R;
      P := (L + R) shr 1;
      repeat
        while CompareWideStr(PsstString(Items[I]).FValue, PsstString(Items[P]).FValue) < 0 do Inc(I);
        while CompareWideStr(PsstString(Items[J]).FValue, PsstString(Items[P]).FValue) > 0 do Dec(J);
        if I <= J then
        begin
          Exchange(I, J);
          if P = I then
            P := J
          else if P = J then
            P := I;
          Inc(I);
          Dec(J);
        end;
      until I > J;
      if L < J then QuickSort(L, J{, SCompare});
      L := I;
    until I >= R;
  end;

begin
  QuickSort(0, Count - 1);
end;

procedure TsstStringList.Save(Index: integer; Stream: TStream);

  procedure WriteCONTINUE;
  var
    Header: TBIFF_Header;
  begin
    Header.ID := BIFF_CONTINUE;
    Header.Length := Integer(FStrings.FContinueList[FStrings.FContinueIndex]);
    FStrings.FContinueIndex := FStrings.FContinueIndex + 1;
    Stream.Write(Header, SizeOf(TBIFF_Header));
  end;

var
  Ln, Sz, V: integer;
  Tmp: word;
  OptionFlags: byte;
begin
  Ln := Length(Items[Index].FValue);
  Sz := Ln * 2 + 3;
  OptionFlags := 1;
  if (FStrings.FBytesWritten + Sz) > MAX_RECORD_DATA_SIZE then begin
    WriteCONTINUE;
    FStrings.FBytesWritten := 0;
    if Sz > MAX_RECORD_DATA_SIZE then begin
      Tmp := Length(Items[Index].FValue);
      Stream.Write(Tmp, SizeOf(Word));
      Stream.Write(OptionFlags, SizeOf(Byte));
      Stream.Write(Items[Index].FValue[1], MAX_RECORD_DATA_SIZE - 3);
      Dec(Sz, MAX_RECORD_DATA_SIZE - 3);
      V := 0;
      while Sz > MAX_RECORD_DATA_SIZE do begin
        WriteCONTINUE;
        Stream.Write(V, 1);
        Stream.Write(Items[Index].FValue[1], MAX_RECORD_DATA_SIZE - 1);
        Dec(Sz, MAX_RECORD_DATA_SIZE - 1);
      end;
      if Sz > 0 then begin
        WriteCONTINUE;
        Stream.Write(V, 1);
        Stream.Write(Items[Index].FValue[1], Sz);
      end;
    end
    else begin
      Tmp := Length(Items[Index].FValue);
      Stream.Write(Tmp, SizeOf(Word));
      Stream.Write(OptionFlags, SizeOf(Byte));
      Stream.Write(Items[Index].FValue[1], Sz - 3);
      Inc(FStrings.FBytesWritten, Sz);
    end;
  end
  else begin
    Tmp := Length(Items[Index].FValue);
    Stream.Write(Tmp, SizeOf(Word));
    Stream.Write(OptionFlags, SizeOf(Byte));
    Stream.Write(Items[Index].FValue[1], Sz - 3);
    Inc(FStrings.FBytesWritten, Sz);
  end;
end;

{var
  Ln: integer;
  FOptionFlags: byte;
begin
  Ln := Length(Items[Index].FValue);
  Stream.Write(Ln, SizeOf(Word));
  FOptionFlags := 1;
  Stream.Write(FOptionFlags, SizeOf(FOptionFlags));
  if Ln > 0 then
    Stream.Write(Items[Index].FValue[1], Ln * 2);}


function TsstStringList.Get(Index: Integer): PsstString;
begin
  Result := PsstString(inherited Get(Index));
end;

procedure TsstStringList.Put(Index: Integer; Item: PsstString);
begin
  inherited Put(Index, Item);
end;

{ TsstStrings }

constructor TsstStrings.Create;
begin
  inherited;
  FPlainList := TsstStringList.Create(Self);
  FPlainList.ItemOwner := true;
  FSortedList := TsstStringList.Create(Self);
  FContinueList := TList.Create;
  FCurrentSize := 8;
  FTotalSize := 8;
  FBytesWritten := 0;
  FTotalCount := 0;
  FUniqueCount := 0;
end;

destructor TsstStrings.Destroy;
begin
  FContinueList.Free;
  FSortedList.Free;
  FPlainList.Free;
  inherited;
end;

function TsstStrings.AddString(const Value: WideString): integer;
var
  sstString: PsstString;
  Ln: integer;
begin
  if FSortedList.Find(Value, Result) then begin
    FPlainList[Result].FRefCount := FPlainList[Result].FRefCount + 1;
    Inc(FTotalCount);
    Exit;
  end
  else begin
    New(sstString);

    FSortedList.Insert(Result, sstString);

    sstString.FValue := Value;
    sstString.FRefCount := 1;
    sstString.FID := FPlainList.Count;
    Result := FPlainList.Add(sstString);

//    FSortedList.Sort;

    Ln := Length(Value) * 2 + 3;
    if (FCurrentSize + Ln) > MAX_RECORD_DATA_SIZE then begin
      FContinueList.Add(Pointer(FCurrentSize));
      FCurrentSize := 0;
    end;
    while Ln > MAX_RECORD_DATA_SIZE do begin
      FContinueList.Add(Pointer(MAX_RECORD_DATA_SIZE));
      Inc(Ln);
      Dec(Ln, MAX_RECORD_DATA_SIZE);
      Inc(FTotalSize, MAX_RECORD_DATA_SIZE);
    end;
    Inc(FTotalSize, Ln);
    Inc(FCurrentSize, Ln);
    Inc(FTotalCount);
    Inc(FUniqueCount);
  end;
end;

(*procedure TsstStrings.Save(Stream: TStream);
var
  i: integer;
  TotalRefCount{, aCount}: integer;
  Header: TBIFF_Header;
//  StartPosition: integer;
  First, Last: integer;
begin
//  StartPosition := Stream.Position;
  Header.ID:= BIFF_SST;

  TotalRefCount := 0;
  for i := 0 to Count - 1 do begin
    //Items[i].FIndex := i;
    TotalRefCount := TotalRefCount + FPlainList.RefCounts[i];
  end;

  First := 0;
  Header.Length := 8;
  CalcContinue(First, Last, Header.Length);

  Stream.Write(Header, SizeOf(Header));
  Stream.Write(TotalRefCount, SizeOf(TotalRefCount));

  i := FPlainList.Count;
  Stream.Write(i, SizeOf(i));

  while First < Count do begin
    for i := First to Last - 1 do
      FPlainList.Save(i, Stream);// PlainItems[i].Save(Stream{, StartPosition});

    // Write continue
    First := Last;
    if First < Count then begin
      //StartPosition := Stream.Position;
      Header.ID := BIFF_CONTINUE;
      Header.Length := 0;
      CalcContinue(First, Last, Header.Length);
      Stream.Write(Header, SizeOf(Header));
    end;
  end;
end;

procedure TsstStrings.CalcContinue(First: integer; var Last: integer;
  var RecordSize: word);
var
 RSize: integer;
begin
  Last := First;
  if Last < Count
    then RSize := Length(FPlainList[Last]) * 2 + 3
    else RSize := 0;

  while (Last < Count) and (RecordSize + RSize < MAX_RECORD_DATA_SIZE) do begin
    Inc(RecordSize, RSize);
    Inc(Last);
    if Last < Count then RSize := Length(FPlainList[Last]) * 2 + 3;
  end;
  if (First = Last) and (Last < Count) then
    raise Exception.Create(sStringTooLarge);
end; *)

procedure TsstStrings.Save(Stream: TStream);
var
  {Sz,} i: integer;
  Header: TBIFF_Header;
  SST: TBIFF_SST;
begin
  FContinueList.Add(Pointer(FCurrentSize));
//  Sz := FTotalSize + SizeOf(TBIFF_Header) +
//    (FContinueList.Count - 1) * SizeOf(TBIFF_Header);

  Header.ID := BIFF_SST;
  Header.Length := Integer(FContinueList[0]);
  Stream.Write(Header, SizeOf(TBIFF_Header));
  FillChar(SST, SizeOf(TBIFF_SST), $0);
  SST.Total := FTotalCount;
  SST.Unique := FUniqueCount;
  Stream.Write(SST, 8);

  FBytesWritten := 8;
  FContinueIndex := 1;

  for i := 0 to FPlainList.Count - 1 do
    FPlainList.Save(i, Stream);
end;

{ TxlsString }

{constructor TxlsString.Create(IsWideStr: boolean; var ARecord: TbiffRecord;
  var Offset: integer);}
constructor TxlsString.CreateR(IsWideStr: boolean; var ARecord: TbiffRecord;
  var Offset: integer);
var
  ByteLength: byte;
  RealOptionFlags: byte;
  DestPos: integer;
begin
  inherited Create;
  FIsWideStr := IsWideStr;
  if not FIsWideStr then begin
    ReadMem(ARecord, Offset, LenOfLen, @ByteLength);
    FStrLen := ByteLength
  end
  else ReadMem(ARecord, Offset, LenOfLen, @FStrLen);

  ReadMem(ARecord, Offset, SizeOf(FOptionFlags), @FOptionFlags);
  RealOptionFlags := FOptionFlags;

  if HasRichText
    then ReadMem(ARecord, Offset, SizeOf(FRTFNumber), @FRTFNumber)
    else FRTFNumber := 0;

  if HasFarEast
    then ReadMem(ARecord, Offset, SizeOf(FFarEastDataSize), @FFarEastDataSize)
    else FFarEastDataSize := 0;

  DestPos := 0;
  SetLength(FShortData, FStrLen);
  SetLength(FWideData, FStrLen);
  ReadStr(ARecord, Offset, FShortData, FWideData, FOptionFlags, RealOptionFlags,
    DestPos, FStrLen);
  if (Integer(HasWideChar) + 1) = 1
    then FWideData := EmptyStr
    else FShortData := EmptyStr;

  if FRTFNumber > 0 then begin
    GetMem(FRTFData, 4 * FRTFNumber);
    ReadMem(ARecord, Offset, 4 * FRTFNumber, FRTFData);
  end;

  if FFarEastDataSize > 0 then begin
    GetMem(FFarEastData, FFarEastDataSize);
    ReadMem(ARecord, Offset, FFarEastDataSize, FFarEastData)
  end;
end;

//constructor TxlsString.Create(IsWideStr: boolean; const Str: WideString);
constructor TxlsString.CreateWS(IsWideStr: boolean; const Str: WideString);
begin
  inherited Create;
  FIsWideStr := IsWideStr;
  if (not FIsWideStr) and (Length(Str) > $FF) then
    raise ExlsFileError.Create(sInvalidStringRecord);

  FStrLen := Length(Str);

{  FOptionFlags := 0;
  if IsWide(Str) then FOptionFlags := 1;}
  if IsWideStr
    then FOptionFlags := 1
    else FOptionFlags := 0;

  FRTFNumber := 0;
  FFarEastDataSize := 0;

  if not GetHasWideChar
    then FShortData := WideStringToStringNoCodePage(Str)
    else FWideData := Str;
end;

function TxlsString.GetLenOfLen: byte;
begin
  Result := Byte(FIsWideStr) + 1;
end;

function TxlsString.GetHasWideChar: boolean;
begin
  Result :=  not (FOptionFlags and $1 = 0);
end;

function TxlsString.GetCharSize: byte;
begin
  Result := Integer(GetHasWideChar) + 1;
end;

function TxlsString.GetFarEast: boolean;
begin
  Result := FOptionFlags and $4 = $4;
end;

function TxlsString.GetHasRichText: boolean;
begin
  Result := FOptionFlags and $8 = $8;
end;

function TxlsString.GetValue: WideString;
begin
  if not GetHasWideChar
    then Result := StringToWideStringNoCodePage(FShortData)
    else Result := WideData;
end;

function TxlsString.GetTotalSize: integer;
begin
  Result:= GetLenOfLen + SizeOf(FOptionFlags) + FStrLen * GetCharSize;
  // RTF
  if GetHasRichText then
    Result := Result + SizeOf(FRTFNumber) + 4 * FRTFNumber;
  // Far East
  if GetFarEast then
    Result := Result + SizeOf(FFarEastDataSize) + FFarEastDataSize;
end;

function TxlsString.Compare(Str: TxlsString): integer;
begin
  if LenOfLen < Str.LenOfLen then begin
    Result := -1;
    Exit;
  end
  else if LenOfLen > Str.LenOfLen then begin
    Result := 1;
    Exit;
  end;

  if FOptionFlags < Str.OptionFlags then begin
    Result := -1;
    Exit;
  end
  else if FOptionFlags > Str.OptionFlags then begin
    Result := 1;
    Exit;
  end;

  if not GetHasWideChar
    then Result := CompareStr(FShortData, Str.ShortData)
    else Result:= CompareWideStr(FWideData, Str.WideData);
end;

procedure TxlsString.Save(Stream: TStream);
begin
  case GetLenOfLen of
    1: Stream.Write(FStrLen, SizeOf(Byte));
    2: Stream.Write(FStrLen, SizeOf(Word));
    else raise Exception.Create(sInvalidLenOfLen);
  end;
  Stream.Write(FOptionFlags, SizeOf(FOptionFlags));
  if GetHasRichText then
    Stream.Write(FRTFNumber, SizeOf(FRTFNumber));
  if GetFarEast then
    Stream.Write(FFarEastDataSize, SizeOf(FFarEastDataSize));

  if GetCharSize = 1 then begin
    if FStrLen > 0 then
      Stream.Write(FShortData[1], Length(FShortData));
  end
  else if FStrLen > 0 then
    Stream.Write(FWideData[1], Length(FWideData) * SizeOf(WideChar));

  if FRTFNumber > 0 then
    Stream.Write(FRTFData^, 4 * FRTFNumber);
  if FFarEastDataSize > 0 then
    Stream.Write(FFarEastData^, FFarEastDataSize);
end;

{ TxlsSSTEntry }

//constructor TxlsSSTEntry.Create(Str: TxlsString);
constructor TxlsSSTEntry.CreateXS(Str: TxlsString);
begin
  inherited Create;
  FValue := Str;
end;

//constructor TxlsSSTEntry.Create(Str: WideString);
constructor TxlsSSTEntry.CreateWS(Str: WideString);
begin
  inherited Create;
  //FValue := TxlsString.Create(true, Str);
  FValue := TxlsString.CreateWS(true, Str);
end;

destructor TxlsSSTEntry.Destroy;
begin
  if Assigned(FOnDestroy) then FOnDestroy(Self);
  if Assigned(FValue) then FValue.Free;
  inherited;
end;

procedure TxlsSSTEntry.IncRef;
begin
  Inc(FRefCount);
end;

procedure TxlsSSTEntry.DecRef;
begin
  Dec(FRefCount);
end;

procedure TxlsSSTEntry.Save(Stream: TStream; StartPosition: integer);
begin
  FStreamPosition := Stream.Position;
  FSSTPosition := FStreamPosition - StartPosition;
  Value.Save(Stream);
end;

function TxlsSSTEntry.GetTotalSize: integer;
begin
  Result := Value.TotalSize;
end;

{ TbiffLabelSST }

function TbiffLabelSST.GetCellType: TbiffCellType;
begin
  Result := bctString;
end;

constructor TbiffLabelSST.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
{var
  l: integer;}
var
  Idx: integer;
begin
  inherited;
{  l := GetInteger(Data, 6);
  if l > SSTList.Count then
    raise ExlsFileError.Create(sExcelInvalid);}

  Idx := GetSSTIndex;
  FSSTEntry := SSTList[Idx];

//  FSSTEntry := SSTList[l];
  FSSTEntry.IncRef;
  FSSTEntry.OnDestroy := DestroySSTEntry;
end;

destructor TbiffLabelSST.Destroy;
begin
  if Assigned(FSSTEntry) then FSSTEntry.DecRef;
  inherited;
end;

function TbiffLabelSST.GetAsString: WideString;
begin
  Result := FSSTEntry.Value.Value;
end;

procedure TbiffLabelSST.SetAsString(const Value: WideString);
var
  OldSSTEntry: TxlsSSTEntry;
begin
  OldSSTEntry := FSSTEntry;
  FSSTEntry := SSTList[SSTList.AddString(Value)];
  if Assigned(OldSSTEntry) then OldSSTEntry.DecRef;
end;

function TbiffLabelSST.GetAsVariant: variant;
begin
  Result := GetAsString;
end;

procedure TbiffLabelSST.SetAsVariant(Value: variant);
begin
  SetAsString(Value);
end;

procedure TbiffLabelSST.DestroySSTEntry(Sender: TObject);
begin
  FSSTEntry := nil;
end;

function TbiffLabelSST.GetSSTIndex: integer;
begin
  Result := PBIFF_LABELSST(Data).SSTIndex;
end;

procedure TbiffLabelSST.SetSSTIndex(Value: integer);
begin
  PBIFF_LABELSST(Data).SSTIndex := Value;
end;

{ TbiffFormula }

constructor TbiffFormula.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
var
  D: double;
begin
  inherited;
  FValue := NULL;
  if GetWord(Data, 12) <> $FFFF then begin // numeric
    Move(Data[6], D, SizeOf(d));
    FValue := D;
  end else begin
    case Data[6] of
      0: FValue := EmptyStr; // string
      1: FValue := Data[8] = 1; // boolean
      //2 is error. we can't codify this on a variant.
    end;
  end;

  FillChar(Data^[6], 8, 0);
  Data^[6] := 2; //error value
  SetWord(Data, 12, $FFFF);
  FillChar(Data^[16], 4, 0);

  Data^[14] := Data^[14] or 2;

  FExprLen := GetWord(Data, 20);
  if FExprLen > 0 then begin
    GetMem(FExpression, FExprLen);
    Move(Data[22], FExpression^, FExprLen);
  end;
end;

destructor TbiffFormula.Destroy;
begin
  if Assigned(FExpression) then
    FreeMem(FExpression);
  inherited;
end;

function TbiffFormula.GetIsFormula: boolean;
begin
  Result := true;
end;

function TbiffFormula.GetAsVariant: variant;
begin
  Result := FValue;
end;

procedure TbiffFormula.SetAsVariant(Value: variant);
begin
  FValue := Value;
end;

function TbiffFormula.GetAsString: WideString;
begin
  Result := VarToStr(GetAsVariant);
end;

procedure TbiffFormula.SetAsString(const Value: WideString);
begin
  SetAsVariant(Value);
end;

{ TbiffShrFmla }

function TbiffShrFmla.GetFirstRow: word;
begin
  Result := GetWord(Data, 0);
end;

function TbiffShrFmla.GetLastRow: word;
begin
  Result := GetWord(Data, 2);
end;

function TbiffShrFmla.GetFirstCol: word;
begin
  Result := Data[4];
end;

function TbiffShrFmla.GetLastCol: word;
begin
  Result := Data[5];
end;

function TbiffShrFmla.GetKey: cardinal;
begin
  Result := GetWord(Data, 0) or Data[4] shl 16;
end;

{ TbiffName }

function TbiffName.GetName: WideString;
var
  Str: string;
begin
  if (GetOptionFlags and $01) = 1 then begin
    SetLength(Result, GetNameLength);
    Move(Data[15], Result[1], GetNameLength * 2);
  end else begin
    SetLength(Str, GetNameLength);
    Move(Data[15], Str[1], GetNameLength);
    Result := Str;
  end;
end;

function TbiffName.GetNameLength: byte;
begin
  Result := Data[3];
end;

function TbiffName.GetNameSize: integer;
begin
  Result := GetStrLen(false , Data, 14, true, NameLength);
end;

function TbiffName.GetOptionFlags: byte;
begin
  Result := Data[14];
end;

function TbiffName.GetRow1: integer;
begin
  if Data[14 + NameSize] in tkArea3d
    then Result := GetWord(Data, 15 + 2 + NameSize)
    else Result := -1;
end;

function TbiffName.GetRow2: integer;
begin
  if Data[14 + NameSize] in tkArea3d
    then Result := GetWord(Data, 15 + 4 + NameSize)
    else Result := -1;
end;

function TbiffName.GetCol1: integer;
begin
  if Data[14 + NameSize] in tkArea3d
    then Result := GetWord(Data, 15 + 6 + NameSize)
    else Result := -1;
end;

function TbiffName.GetCol2: integer;
begin
  if Data[14 + NameSize] in tkArea3d
    then Result := GetWord(Data, 15 + 8 + NameSize)
    else Result := -1;
end;

{ TbiffMultiple }

constructor TbiffMultiple.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
begin
  inherited;
  FCol := 0;
end;

{ TbiffMulBlank }

function TbiffMulBlank.GetEOF: boolean;
begin
  Result := 4 + (FCol + 1) * SizeOf(Word) >= DataSize;
end;

function TbiffMulBlank.GetCell: TbiffCell;
var
  NewData: PByteArray;
  NewDataSize: integer;
begin
  NewDataSize := 6;
  GetMem(NewData, NewDataSize);
  try
    SetWord(NewData, 0, GetWord(Data, 0));
    SetWord(NewData, 2, GetWord(Data, 2) + FCol);
    SetWord(NewData, 4, GetWord(Data, 4 + FCol * SizeOf(Word)));

    Result := TbiffBlank.Create(Section, BIFF_BLANK, NewDataSize, NewData);
    Inc(FCol);
  except
    FreeMem(NewData);
    raise;
  end;
end;

{ TbiffMulRK }

type
  P_RK = ^T_RK;
  T_RK = packed record
    XF: word;
    RK: longint;
  end;

function TbiffMulRK.GetEOF: boolean;
begin
  Result := 4 + (FCol + 1) * SizeOf(T_RK) >= DataSize;
end;

function TbiffMulRK.GetCell: TbiffCell;
var
  NewData: PByteArray;
  NewDataSize: integer;
  RK1, RK2: P_RK;
begin
  NewDataSize := 10;
  GetMem(NewData, NewDataSize);
  try
    SetWord(NewData, 0, GetWord(Data, 0));
    SetWord(NewData, 2, GetWord(Data, 2) + FCol);
    RK1 := P_RK(@(Data[4 + FCol * SizeOf(T_RK)]));
    RK2 := P_RK(@(NewData[4]));
    RK2^ := RK1^;

    Result := TbiffRK.Create(Section, BIFF_RK, NewDataSize, NewData);
    Inc(FCol);
  except
    FreeMem(NewData);
    raise;
  end;
end;

{ TbiffFont }

function TbiffFont.GetHeight: word;
begin
  Result := PBIFF_FONT(Data).Height;
end;

procedure TbiffFont.SetHeight(Value: word);
begin
  PBIFF_FONT(Data).Height := Value;
end;

function TbiffFont.GetOption: word;
begin
  Result := PBIFF_FONT(Data).Option;
end;

procedure TbiffFont.SetOption(Value: word);
begin
  PBIFF_FONT(Data).Option := Value;
end;

function TbiffFont.GetPaletteIndex: word;
begin
  Result := PBIFF_FONT(Data).PaletteIndex;
end;

procedure TbiffFont.SetPaletteIndex(Value: word);
begin
  PBIFF_FONT(Data).PaletteIndex := Value;
end;

function TbiffFont.GetBoldness: word;
begin
  Result := PBIFF_FONT(Data).Boldness;
end;

procedure TbiffFont.SetBoldness(Value: word);
begin
  PBIFF_FONT(Data).Boldness := Value;
end;

function TbiffFont.GetScript: word;
begin
  Result := PBIFF_FONT(Data).Script;
end;

procedure TbiffFont.SetScript(Value: word);
begin
  PBIFF_FONT(Data).Script := Value;
end;

function TbiffFont.GetUnderline: byte;
begin
  Result := PBIFF_FONT(Data).Underline;
end;

procedure TbiffFont.SetUnderline(Value: byte);
begin
  PBIFF_FONT(Data).Underline := Value;
end;

function TbiffFont.GetFamily: byte;
begin
  Result := PBIFF_FONT(Data).Family;
end;

procedure TbiffFont.SetFamily(Value: byte);
begin
  PBIFF_FONT(Data).Family := Value;
end;

function TbiffFont.GetCharset: byte;
begin
  Result := PBIFF_FONT(Data).Charset;
end;

procedure TbiffFont.SetCharset(Value: byte);
begin
  PBIFF_FONT(Data).Charset := Value;
end;

function TbiffFont.GetNotUsed: byte;
begin
  Result := PBIFF_FONT(Data).NotUsed;
end;

procedure TbiffFont.SetNotUsed(Value: byte);
begin
  PBIFF_FONT(Data).NotUsed := 0;
end;

function TbiffFont.GetNameLen: byte;
begin
  Result := PBIFF_FONT(Data).NameLen;
end;

procedure TbiffFont.SetNameLen(Value: byte);
begin
  PBIFF_FONT(Data).NameLen := Value;
end;

function TbiffFont.GetNameOpt: byte;
begin
  Result := PBIFF_FONT(Data).NameOpt;
end;

procedure TbiffFont.SetNameOpt(Value: byte);
begin
  PBIFF_FONT(Data).NameOpt := Value;
end;

function TbiffFont.GetName: WideString;
var
  Ln: integer;
begin
  Result := EmptyStr;
  Ln := GetNameLen;
  if Ln <= 0 then Exit;
  SetLength(Result, Ln * 2);
  Move(Data[16], Result[1], Ln * 2);
end;

procedure TbiffFont.SetName(const Value: WideString);
var
  Ln: integer;
begin
  Ln := GetNameLen;
  if Ln <= 0 then Exit;
  Move(Value[1], Data[16], Ln * 2);
end;

{ TbiffXF }

function TbiffXF.GetFontIndex: word;
begin
  Result := PBIFF_XF(Data).FontIndex;
end;

procedure TbiffXF.SetFontIndex(Value: word);
begin
  PBIFF_XF(Data).FontIndex := Value;
end;

function TbiffXF.GetFormatIndex: word;
begin
  Result := PBIFF_XF(Data).FormatIndex;
end;

procedure TbiffXF.SetFormatIndex(Value: word);
begin
  PBIFF_XF(Data).FormatIndex := Value;
end;

function TbiffXF.GetData1: word;
begin
  Result := PBIFF_XF(Data).Data1;
end;

procedure TbiffXF.SetData1(Value: word);
begin
  PBIFF_XF(Data).Data1 := Value;
end;

function TbiffXF.GetData2: word;
begin
  Result := PBIFF_XF(Data).Data2;
end;

procedure TbiffXF.SetData2(Value: word);
begin
  PBIFF_XF(Data).Data2 := Value;
end;

function TbiffXF.GetData3: word;
begin
  Result := PBIFF_XF(Data).Data3;
end;

procedure TbiffXF.SetData3(Value: word);
begin
  PBIFF_XF(Data).Data3 := Value;
end;

function TbiffXF.GetData4: word;
begin
  Result := PBIFF_XF(Data).Data4;
end;

procedure TbiffXF.SetData4(Value: word);
begin
  PBIFF_XF(Data).Data4 := Value;
end;

function TbiffXF.GetData5: word;
begin
  Result := PBIFF_XF(Data).Data5;
end;

procedure TbiffXF.SetData5(Value: word);
begin
  PBIFF_XF(Data).Data5 := Value;
end;

function TbiffXF.GetData6: longint;
begin
  Result := PBIFF_XF(Data).Data6;
end;

procedure TbiffXF.SetData6(Value: longint);
begin
  PBIFF_XF(Data).Data6 := Value;
end;

function TbiffXF.GetData7: word;
begin
  Result := PBIFF_XF(Data).Data7;
end;

procedure TbiffXF.SetData7(Value: word);
begin
  PBIFF_XF(Data).Data7 := Value;
end;

{ TbiffFormat }

constructor TbiffFormat.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
{var
  MySelf: TbiffRecord;
  TempPos, StrLen: integer;
  Str: string;
  WStr: WideString;
  OptionFlags, RealOptionFlags: byte;
  DestPos: integer;}
begin
  inherited;
{  FID := GetWord(Data, 0);

  TempPos := 5;
  MySelf := Self;
  DestPos := 0;
  OptionFlags := Data[4];
  RealOptionFlags := OptionFlags;
  StrLen := GetWord(Data, 2);
  SetLength(Str, StrLen);
  SetLength(WStr, StrLen);
  ReadStr(MySelf, TempPos, Str, WStr, OptionFlags, RealOptionFlags, DestPos,
    StrLen);
  if (OptionFlags and $1) = 0
    then FValue := StringToWideStringNoCodePage(Str)
    else FValue := WStr;}
end;

function TbiffFormat.GetID: word;
begin
  Result := PBIFF_FORMAT(Data).ID;
end;

procedure TbiffFormat.SetID(Value: word);
begin
  PBIFF_FORMAT(Data).ID := Value;
end;

function TbiffFormat.GetFormatLen: word;
begin
  Result := PBIFF_FORMAT(Data).FormatLen;
end;

procedure TbiffFormat.SetFormatLen(Value: word);
begin
  PBIFF_FORMAT(Data).FormatLen := Value;
end;

function TbiffFormat.GetFormatOpt: byte;
begin
  Result := PBIFF_FORMAT(Data).FormatOpt;
end;

procedure TbiffFormat.SetFormatOpt(Value: byte);
begin
  PBIFF_FORMAT(Data).FormatOpt := Value;
end;

function TbiffFormat.GetFormat: WideString;
var
  Ln, Cf: integer;
begin
  Result := EmptyStr;
  Ln := GetFormatLen;
  if Ln <= 0 then Exit;
  Cf := GetFormatOpt;
  Cf := Cf + 1;
  SetLength(Result, Ln * Cf);
  Move(Data[5], Result[1], Ln * Cf);
end;

procedure TbiffFormat.SetFormat(const Value: WideString);
var
  Ln, Cf: integer;
  Str: string;
begin
  Ln := GetFormatLen;
  if Ln <= 0 then Exit;
  Cf := GetFormatOpt;
  case Cf of
    0: begin
      Str := Value;
      Move(Str[1], Data[5], Ln);
    end;
    1: Move(Value[1], Data[5], Ln * 2);
  end;
end;

{ TbiffHLink }

{function TbiffHLink.GetFirstRow: word;
begin
  Result := GetWord(Data, 0);
end;

procedure TbiffHLink.SetFirstRow(Value: word);
begin
  SetWord(Data, 0, Value);
end;

function TbiffHLink.GetLastRow: word;
begin
  Result := GetWord(Data, 2);
end;

procedure TbiffHLink.SetLastRow(Value: word);
begin
  SetWord(Data, 2, Value);
end;

function TbiffHLink.GetFirstCol: word;
begin
  Result := GetWord(Data, 4);
end;

procedure TbiffHLink.SetFirstCol(Value: word);
begin
  SetWord(Data, 4, Value);
end;

function TbiffHLink.GetLastCol: word;
begin
  Result := GetWord(Data, 6);
end;

procedure TbiffHLink.SetLastCol(Value: word);
begin
  SetWord(Data, 6, Value);
end;}

{ TbiffDefColWidth }

function TbiffDefColWidth.GetWidth: word;
begin
  Result := GetWord(Data, 0);
end;

{ TbiffDefRowHeight }

function TbiffDefRowHeight.GetHeight: word;
begin
  Result := GetWord(Data, 2);
end;

{ TxlsColInfo }

constructor TxlsColInfo.Create(Column, Width, XF, Options: word);
begin
  inherited Create;
  FColumn := Column;
  FWidth := Width;
  FXF := XF;
  FOptions := Options;
end;

function TxlsColInfo.IsEqual(ColInfo: TxlsColInfo): boolean;
begin
  Result := (FWidth = ColInfo.Width) and
            (FXF = ColInfo.XF) and
            (FOptions = ColInfo.Options);
end;

{ TbiffDimensions }

function TbiffDimensions.GetFirstRow: integer;
begin
  Result := PBIFF_DIMENSIONS(Data).FirstRow;
end;

procedure TbiffDimensions.SetFirstRow(Value: integer);
begin
  PBIFF_DIMENSIONS(Data).FirstRow := Value;
end;

function TbiffDimensions.GetLastRow: integer;
begin
  Result := PBIFF_DIMENSIONS(Data).LastRow;
end;

procedure TbiffDimensions.SetLastRow(Value: integer);
begin
  PBIFF_DIMENSIONS(Data).LastRow := Value;
end;

function TbiffDimensions.GetFirstCol: word;
begin
  Result := PBIFF_DIMENSIONS(Data).FirstCol;
end;

procedure TbiffDimensions.SetFirstCol(Value: word);
begin
  PBIFF_DIMENSIONS(Data).FirstCol := Value;
end;

function TbiffDimensions.GetLastCol: word;
begin
  Result := PBIFF_DIMENSIONS(Data).LastCol;
end;

procedure TbiffDimensions.SetLastCol(Value: word);
begin
  PBIFF_DIMENSIONS(Data).LastCol := Value;
end;

function TbiffDimensions.GetReserved: word;
begin
  Result := PBIFF_DIMENSIONS(Data).Reserved;
end;

procedure TbiffDimensions.SetReserved(Value: word);
begin
  PBIFF_DIMENSIONS(Data).Reserved := 0;
end;

{ TbiffSST }

constructor TbiffSST.Create(Section: TxlsSection; ID, DataSize: word;
  Data: PByteArray);
begin
  inherited;
  FCount := GetWord(Data, 4);
end;

{ TbiffWindow1 }

function TbiffWindow1.GetLeft: word;
begin
  Result := PBIFF_WINDOW1(Data).Left;
end;

procedure TbiffWindow1.SetLeft(Value: word);
begin
  PBIFF_WINDOW1(Data).Left := Value;
end;

function TbiffWindow1.GetTop: word;
begin
  Result := PBIFF_WINDOW1(Data).Top;
end;

procedure TbiffWindow1.SetTop(Value: word);
begin
  PBIFF_WINDOW1(Data).Top := Value;
end;

function TbiffWindow1.GetWidth: word;
begin
  Result := PBIFF_WINDOW1(Data).Width;
end;

procedure TbiffWindow1.SetWidth(Value: word);
begin
  PBIFF_WINDOW1(Data).Width := Value;
end;

function TbiffWindow1.GetHeight: word;
begin
  Result := PBIFF_WINDOW1(Data).Height;
end;

procedure TbiffWindow1.SetHeight(Value: word);
begin
  PBIFF_WINDOW1(Data).Height := Value;
end;

function TbiffWindow1.GetOptions: word;
begin
  Result := PBIFF_WINDOW1(Data).Options;
end;

procedure TbiffWindow1.SetOptions(Value: word);
begin
  PBIFF_WINDOW1(Data).Options := Value;
end;

function TbiffWindow1.GetActiveSheet: word;
begin
  Result := PBIFF_WINDOW1(Data).ActiveSheet;
end;

procedure TbiffWindow1.SetActiveSheet(Value: word);
begin
  PBIFF_WINDOW1(Data).ActiveSheet := Value;
end;

function TbiffWindow1.GetFirstVisible: word;
begin
  Result := PBIFF_WINDOW1(Data).FirstVisible;
end;

procedure TbiffWindow1.SetFirstVisible(Value: word);
begin
  PBIFF_WINDOW1(Data).FirstVisible := Value;
end;

function TbiffWindow1.GetSelectCount: word;
begin
  Result := PBIFF_WINDOW1(Data).SelectCount;
end;

procedure TbiffWindow1.SetSelectCount(Value: word);
begin
  PBIFF_WINDOW1(Data).SelectCount := Value;
end;

function TbiffWindow1.GetTabWidth: word;
begin
  Result := PBIFF_WINDOW1(Data).TabWidth;
end;

procedure TbiffWindow1.SetTabWidth(Value: word);
begin
  PBIFF_WINDOW1(Data).TabWidth := Value;
end;

{ TbiffWindow2 }

function TbiffWindow2.GetOptions: word;
begin
  Result := PBIFF_WINDOW2(Data).Options;
end;

procedure TbiffWindow2.SetOptions(Value: word);
begin
  PBIFF_WINDOW2(Data).Options := Value;
end;

function TbiffWindow2.GetTopRow: word;
begin
  Result := PBIFF_WINDOW2(Data).TopRow;
end;

procedure TbiffWindow2.SetTopRow(Value: word);
begin
  PBIFF_WINDOW2(Data).TopRow := Value;
end;

function TbiffWindow2.GetLeftCol: word;
begin
  Result := PBIFF_WINDOW2(Data).LeftCol;
end;

procedure TbiffWindow2.SetLeftCol(Value: word);
begin
  PBIFF_WINDOW2(Data).LeftCol := Value;
end;

function TbiffWindow2.GetGridLineColor: integer;
begin
  Result := PBIFF_WINDOW2(Data).GridLineColor;
end;

procedure TbiffWindow2.SetGridLineColor(Value: integer);
begin
  PBIFF_WINDOW2(Data).GridLineColor := Value;
end;

function TbiffWindow2.GetZoomInPreview: word;
begin
  Result := PBIFF_WINDOW2(Data).ZoomInPreview;
end;

procedure TbiffWindow2.SetZoomInPreview(Value: word);
begin
  PBIFF_WINDOW2(Data).ZoomInPreview := Value;
end;

function TbiffWindow2.GetZoomInNormal: word;
begin
  Result := PBIFF_WINDOW2(Data).ZoomInNormal;
end;

procedure TbiffWindow2.SetZoomInNormal(Value: word);
begin
  PBIFF_WINDOW2(Data).ZoomInNormal := Value;
end;

function TbiffWindow2.GetReserved: integer;
begin
  Result := PBIFF_WINDOW2(Data).Reserved;
end;

procedure TbiffWindow2.SetReserved(Value: integer);
begin
  PBIFF_WINDOW2(Data).Reserved := 0;
end;

{ TbiffSelection }

function TbiffSelection.GetPane: byte;
begin
  Result := PBIFF_SELECTION(Data).Pane;
end;

procedure TbiffSelection.SetPane(Value: byte);
begin
  PBIFF_SELECTION(Data).Pane := Value;
end;

function TbiffSelection.GetActiveRow: word;
begin
  Result := PBIFF_SELECTION(Data).ActiveRow;
end;

procedure TbiffSelection.SetActiveRow(Value: word);
begin
  PBIFF_SELECTION(Data).ActiveRow := Value;
end;

function TbiffSelection.GetActiveCol: word;
begin
  Result := PBIFF_SELECTION(Data).ActiveCol;
end;

procedure TbiffSelection.SetActiveCol(Value: word);
begin
  PBIFF_SELECTION(Data).ActiveCol := Value;
end;

function TbiffSelection.GetActiveRef: word;
begin
  Result := PBIFF_SELECTION(Data).ActiveRef;
end;

procedure TbiffSelection.SetActiveRef(Value: word);
begin
  PBIFF_SELECTION(Data).ActiveRef := Value;
end;

function TbiffSelection.GetRefs: word;
begin
  Result := PBIFF_SELECTION(Data).Refs;
end;

procedure TbiffSelection.SetRefs(Value: word);
begin
  PBIFF_SELECTION(Data).Refs := Value;
end;

function TbiffSelection.GetRow1: word;
begin
  Result := PBIFF_SELECTION(Data).Row1;
end;

procedure TbiffSelection.SetRow1(Value: word);
begin
  PBIFF_SELECTION(Data).Row1 := Value;
end;

function TbiffSelection.GetRow2: word;
begin
  Result := PBIFF_SELECTION(Data).Row2;
end;

procedure TbiffSelection.SetRow2(Value: word);
begin
  PBIFF_SELECTION(Data).Row2 := Value;
end;

function TbiffSelection.GetCol1: word;
begin
  Result := PBIFF_SELECTION(Data).Col1;
end;

procedure TbiffSelection.SetCol1(Value: word);
begin
  PBIFF_SELECTION(Data).Col1 := Value;
end;

function TbiffSelection.GetCol2: byte;
begin
  Result := PBIFF_SELECTION(Data).Col2;
end;

procedure TbiffSelection.SetCol2(Value: byte);
begin
  PBIFF_SELECTION(Data).Col2 := Value;
end;

{ TbiffSCL }

function TbiffSCL.GetNumerator: word;
begin
  Result := PBIFF_SCL(Data).Numerator;
end;

procedure TbiffSCL.SetNumerator(Value: word);
begin
  PBIFF_SCL(Data).Numerator := Value;
end;

function TbiffSCL.GetDenominator: word;
begin
  Result := PBIFF_SCL(Data).Denominator;
end;

procedure TbiffSCL.SetDenominator(Value: word);
begin
  PBIFF_SCL(Data).Denominator := Value;
end;

{ TbiffSetup }

function TbiffSetup.GetPaperSize: word;
begin
  Result := PBIFF_SETUP(Data).PaperSize;
end;

procedure TbiffSetup.SetPaperSize(Value: word);
begin
  PBIFF_SETUP(Data).PaperSize := Value;
end;

function TbiffSetup.GetScalingFactor: word;
begin
  Result := PBIFF_SETUP(Data).ScalingFactor;
end;

procedure TbiffSetup.SetScalingFactor(Value: word);
begin
  PBIFF_SETUP(Data).ScalingFactor := Value;;
end;

function TbiffSetup.GetStartingPageNumber: word;
begin
  Result := PBIFF_SETUP(Data).StartingPageNumber;
end;

procedure TbiffSetup.SetStartingPageNumber(Value: word);
begin
  PBIFF_SETUP(Data).StartingPageNumber := Value;
end;

function TbiffSetup.GetFitToWidth: word;
begin
  Result := PBIFF_SETUP(Data).FitToWidth;
end;

procedure TbiffSetup.SetFitToWidth(Value: word);
begin
  PBIFF_SETUP(Data).FitToWidth := Value;
end;

function TbiffSetup.GetFitToHeight: word;
begin
  Result := PBIFF_SETUP(Data).FitToHeight;
end;

procedure TbiffSetup.SetFitToHeight(Value: word);
begin
  PBIFF_SETUP(Data).FitToHeight := Value;
end;

function TbiffSetup.GetOptionFlags: word;
begin
  Result := PBIFF_SETUP(Data).OptionFlags;
end;

procedure TbiffSetup.SetOptionFlags(Value: word);
begin
  PBIFF_SETUP(Data).OptionFlags := Value;
end;

function TbiffSetup.GetPrintResolution: word;
begin
  Result := PBIFF_SETUP(Data).PrintResolution;
end;

procedure TbiffSetup.SetPrintResolution(Value: word);
begin
  PBIFF_SETUP(Data).PrintResolution := Value;
end;

function TbiffSetup.GetVerticalPrintResolution: word;
begin
  Result := PBIFF_SETUP(Data).VerticalPrintResolution;
end;

procedure TbiffSetup.SetVerticalPrintResolution(Value: word);
begin
  PBIFF_SETUP(Data).VerticalPrintResolution := Value;
end;

function TbiffSetup.GetHeaderMargin: double;
begin
  Result := PBIFF_SETUP(Data).HeaderMargin;
end;

procedure TbiffSetup.SetHeaderMargin(Value: double);
begin
  PBIFF_SETUP(Data).HeaderMargin := Value;
end;

function TbiffSetup.GetFooterMargin: double;
begin
  Result := PBIFF_SETUP(Data).FooterMargin;
end;

procedure TbiffSetup.SetFooterMargin(Value: double);
begin
  PBIFF_SETUP(Data).FooterMargin := Value;
end;

function TbiffSetup.GetNumberOfCopies: word;
begin
  Result := PBIFF_SETUP(Data).NumberOfCopies;
end;

procedure TbiffSetup.SetNumberOfCopies(Value: word);
begin
  PBIFF_SETUP(Data).NumberOfCopies := Value;
end;

{ TmsoObject }

constructor TmsoObject.Create(Version, Instance: word);
begin
  inherited Create;
  FVersion := Version;
  FInstance := Instance;
end;

function TmsoObject.GetDataSize: integer;
begin
  Result := GetSize - SizeOf(TMSO_Header);
end;

{ TmsoList }

function TmsoList.GetItems(Index: integer): TmsoObject;
begin
  Result := TmsoObject(inherited Items[Index]);
end;

procedure TmsoList.SetItems(Index: integer; Value: TmsoObject);
begin
  Items[Index] := Value;
end;

function TmsoList.Add(Item: TmsoObject): integer;
begin
  Result := inherited Add(Item);
end;

procedure TmsoList.Delete(Index: integer);
begin
  if Assigned(Items[Index]) then
    TmsoObject(Items[Index]).Free;
  inherited Delete(Index);
end;

{$IFDEF VCL5}
function TmsoList.Extract(Item: TmsoObject): TmsoObject;
begin
  Result := TmsoObject(inherited Extract(Item));
end;
{$ENDIF}

function TmsoList.First: TmsoObject;
begin
  Result := TmsoObject(inherited First);
end;

function TmsoList.IndexOf(Item: TmsoObject): integer;
begin
  Result := inherited IndexOf(Item);
end;

procedure TmsoList.Insert(Index: integer; Item: TmsoObject);
begin
  inherited Insert(Index, Item);
end;

function TmsoList.Last: TmsoObject;
begin
  Result := TmsoObject(inherited Last);
end;

function TmsoList.Remove(Item: TmsoObject): integer;
begin
  Result := inherited Remove(Item);
end;

{ TmsoContainer }

constructor TmsoContainer.Create(FBT, Version, Instance: word);
begin
  inherited Create(Version, Instance);
  FFBT := FBT;
  FChildren := TmsoList.Create;
end;

destructor TmsoContainer.Destroy;
begin
  FChildren.Free;
  inherited;
end;

function TmsoContainer.GetSize: integer;
var
  i: integer;
begin
  Result := SizeOf(TMSO_Header);
  for i := 0 to FChildren.Count - 1 do
    Inc(Result, FChildren[i].Size);
end;

procedure TmsoContainer.Save(Stream: TStream);
var
  i: integer;
begin
  WriteMSOHeader(FFBT, Version, Instance,
    DataSize{GetSize - SizeOf(TMSOHeader)} + FAddSize, Stream);
  for i := 0 to FChildren.Count - 1 do
    FChildren[i].Save(Stream);
end;

procedure TmsoContainer.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  i: integer;
begin
  WriteMSOHeaderToByteArray(FFBT, Version, Instance,
    DataSize{GetSize - SizeOf(TMSOHeader)} + FAddSize, ByteArray, Position);
  for i := 0 to FChildren.Count - 1 do
    FChildren[i].AssignToByteArray(ByteArray, Position);
end;

{ TmsoDgg }

constructor TmsoDgg.Create(Version, Instance: word; PicCount: integer);
begin
  inherited Create(Version, Instance);
  FPicCount := PicCount;
end;

procedure TmsoDgg.Save(Stream: TStream);
var
  Dgg: TMSO_Dgg;
begin
  FillChar(Dgg, SizeOf(TMSO_Dgg), #0);
  Dgg.MaxShapeID := MSO_SPID + FPicCount; { $0402 };
  Dgg.ClusterCount := 2;
  Dgg.ShapesSaved := FPicCount + 1;
  Dgg.DrawingsSaved := 1;
  Dgg.ClusterID.DgID := 1;
  Dgg.ClusterID.ShapesUsed := FPicCount + 1;
  WriteMSOHeader(MSO_DGG, Version, Instance, DataSize, Stream);
  Stream.Write(Dgg, DataSize);
end;

procedure TmsoDgg.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  Dgg: TMSO_Dgg;
begin
  FillChar(Dgg, SizeOf(TMSO_Dgg), #0);
  Dgg.MaxShapeID := MSO_SPID + FPicCount; { $0402 };
  Dgg.ClusterCount := 2;
  Dgg.ShapesSaved := FPicCount + 1;
  Dgg.DrawingsSaved := 1;
  Dgg.ClusterID.DgID := 1;
  Dgg.ClusterID.ShapesUsed := FPicCount + 1;
  WriteMSOHeaderToByteArray(MSO_DGG, Version, Instance, DataSize, ByteArray,
    Position);
  Move(Dgg, ByteArray[Position], DataSize);
  Inc(Position, DataSize);
end;

function TmsoDgg.GetSize: integer;
begin
  Result := SizeOf(TMSO_Dgg) + SizeOf(TMSO_Header);
end;

{ TmsoDg }

function TmsoDg.GetSize: integer;
begin
  Result := SizeOf(TMSO_Dg) + SizeOf(TMSO_Header);
end;

procedure TmsoDg.Save(Stream: TStream);
var
  Dg: TMSO_Dg;
begin
  Dg.ShapeCount := 2;
  Dg.CurrShapeID := MSO_SPID; { $0401 } // ???
  WriteMSOHeader(MSO_DG, Version, Instance, DataSize, Stream);
  Stream.Write(Dg, DataSize);
end;

procedure TmsoDg.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  Dg: TMSO_Dg;
begin
  Dg.ShapeCount := 2;
  Dg.CurrShapeID := MSO_SPID; { $0401 } // ???
  WriteMSOHeaderToByteArray(MSO_DG, Version, Instance, DataSize, ByteArray,
    Position);
  Move(Dg, ByteArray[Position], DataSize);
  Inc(Position, DataSize);
end;

{ TmsoSpgr }

function TmsoSpgr.GetSize: integer;
begin
  Result := 16 + SizeOf(TMSO_Header);
end;

procedure TmsoSpgr.Save(Stream: TStream);
const
  Spgr: array[0..15] of byte =
  ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
begin
  WriteMSOHeader(MSO_SPGR, Version, Instance, DataSize, Stream);
  Stream.Write(Spgr, DataSize);
end;

procedure TmsoSpgr.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
const
  Spgr: array[0..15] of byte =
  ($00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
begin
  WriteMSOHeaderToByteArray(MSO_SPGR, Version, Instance, DataSize, ByteArray,
    Position);
  Move(Spgr[0], ByteArray[Position], DataSize);
  Inc(Position, DataSize);
end;

{ TmsoSp }

constructor TmsoSp.Create(Version, Instance, ID, Flags: word);
begin
  inherited Create(Version, Instance);
  FID := ID;
  FFlags := Flags;
end;

function TmsoSp.GetSize: integer;
begin
  Result := SizeOf(TMSO_Sp) + SizeOf(TMSO_Header);
end;

procedure TmsoSp.Save(Stream: TStream);
var
  Sp: TMSO_Sp;
begin
  Sp.ID := FID;
  Sp.Flags := FFlags;
  WriteMSOHeader(MSO_SP, Version, Instance, DataSize, Stream);
  Stream.Write(Sp, DataSize);
end;

procedure TmsoSp.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  Sp: TMSO_Sp;
begin
  Sp.ID := FID;
  Sp.Flags := FFlags;
  WriteMSOHeaderToByteArray(MSO_SP, Version, Instance, DataSize, ByteArray,
    Position);
  Move(Sp, ByteArray[Position], DataSize);
  Inc(Position, DataSize);
end;

{ TmsoOPTData }

constructor TmsoOPTData.Create(Options: word; Value: DWORD);
begin
  inherited Create;
  FOptions := Options;
  FValue := Value;
end;

constructor TmsoOPTData.CreateStr(Options: word; const Value: WideString);
begin
  inherited Create;
  FOptions := Options;
  FStrValue := Value;
  FValue := Length(FStrValue) * 2 + 2;
end;

{ TmsoOPTDataList }

function TmsoOPTDataList.GetItems(Index: integer): TmsoOPTData;
begin
  Result := TmsoOPTData(inherited Items[Index]);
end;

procedure TmsoOPTDataList.SetItems(Index: integer; Value: TmsoOPTData);
begin
  inherited Items[Index] := Value;
end;

function TmsoOPTDataList.Add(Item: TmsoOPTData): integer;
begin
  Result := inherited Add(Item);
end;

procedure TmsoOPTDataList.Delete(Index: integer);
begin
  if Assigned(Items[Index]) then
    TmsoOPTData(Items[Index]).Free;
  inherited Delete(Index);
end;

{$IFDEF VCL5}
function TmsoOPTDataList.Extract(Item: TmsoOPTData): TmsoOPTData;
begin
  Result := TmsoOPTData(inherited Extract(Item));
end;
{$ENDIF}

function TmsoOPTDataList.First: TmsoOPTData;
begin
  Result := TmsoOPTData(inherited First);
end;

function TmsoOPTDataList.IndexOf(Item: TmsoOPTData): integer;
begin
  Result := inherited IndexOf(Item);
end;

procedure TmsoOPTDataList.Insert(Index: integer; Item: TmsoOPTData);
begin
  inherited Insert(Index, Item);
end;

function TmsoOPTDataList.Last: TmsoOPTData;
begin
  Result := TmsoOPTData(inherited Last);
end;

function TmsoOPTDataList.Remove(Item: TmsoOPTData): integer;
begin
  Result := inherited Remove(Item);
end;

{ TmsoOPT }

constructor TmsoOPT.Create(Version, Instance: word);
begin
  inherited;
  FValues := TmsoOPTDataList.Create;
end;

destructor TmsoOPT.Destroy;
begin
  FValues.Free;
  inherited;
end;

function TmsoOPT.GetSize: integer;
var
  i: integer;
begin
  Result := SizeOf(TMSO_Header);
  for i := 0 to FValues.Count - 1 do begin
    Inc(Result, SizeOf(TMSO_OPT));
    if (FValues[i].Options and $8000) <> 0 then
      Inc(Result, FValues[i].Value);
  end;
end;

procedure TmsoOPT.Save(Stream: TStream);
var
  i: integer;
  L: cardinal;
  Str: WideString;
begin
  L := 0; Str := EmptyStr;
  Instance := FValues.Count;
  WriteMSOHeader(MSO_OPT, Version, Instance, GetSize - SizeOf(TMSO_Header),
    Stream);
  for i := 0 to FValues.Count - 1 do begin
    Stream.Write(FValues[i].Options, SizeOf(FValues[i].Options));
    Stream.Write(FValues[i].Value, SizeOf(FValues[i].Value));
    if (FValues[i].Options and $8000) <> 0 then begin
      if Str <> EmptyStr then Str := Str + #0;
      Str := Str + FValues[i].StrValue;
      L := L + FValues[i].Value;
    end;
  end;
  if Str <> EmptyStr then begin
    Stream.Write(Str[1], L);
  end;
end;

procedure TmsoOPT.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  i, L: integer;
  Str: WideString;
begin
  L := 0;
  Str := EmptyStr;
  Instance := FValues.Count;
  WriteMSOHeaderToByteArray(MSO_OPT, Version, Instance,
    GetSize - SizeOf(TMSO_Header), ByteArray, Position);
  for i := 0 to FValues.Count - 1 do begin
    Move(FValues[i].Options, ByteArray[Position], SizeOf(FValues[i].Options));
    Inc(Position, SizeOf(FValues[i].Options));
    Move(FValues[i].Value, ByteArray[Position], SizeOf(FValues[i].Value));
    Inc(Position, SizeOf(FValues[i].Value));
    if (FValues[i].Options and $8000) <> 0 then begin
      Str := FValues[i].StrValue;
      L := FValues[i].Value;
    end;
  end;
  if Str <> EmptyStr then begin
    Move(Str[1], ByteArray[Position], L);
    Inc(Position, L);
  end;
end;

procedure TmsoOPT.AddStrValue(ID: word; const Str: WideString);
var
  P: TmsoOPTData;
  Ln: integer;
begin
  Ln := Length(Str) * 2 + 2;
  P := TmsoOPTData.Create(ID or $8000, Ln);
  P.StrValue := Str + #0;
  FValues.Add(P)
end;

{ TmsoClientAnchor }

constructor TmsoClientAnchor.Create(Version, Instance, Options: word;
  Anchor: TMSO_Anchor);
begin
  inherited Create(Version, Instance);
  FOptions := Options;
  GetMem(FAnchor, SizeOf(TMSO_Anchor));
  FillChar(FAnchor^, SizeOf(TMSO_Anchor), #0);
  FAnchor^ := Anchor;
  FAnchor^.Options := Options;
end;

destructor TmsoClientAnchor.Destroy;
begin
  FreeMem(FAnchor);
  inherited;
end;

function TmsoClientAnchor.GetSize: integer;
begin
  Result := SizeOf(TMSO_Anchor) + SizeOf(TMSO_Header);
end;

procedure TmsoClientAnchor.Save(Stream: TStream);
{var
  Anchor: TMSO_Anchor;}
begin
{  Anchor.Options    := FOptions;
  Anchor.Col1       := FAnchorObj.Col1;
  Anchor.Col1Offset := FAnchorObj.Col1Offset;
  Anchor.Row1       := FAnchorObj.Row1;
  Anchor.Row1Offset := FAnchorObj.Row1Offset;
  Anchor.Col2       := FAnchorObj.Col2;
  Anchor.Col2Offset := FAnchorObj.Col2Offset;
  Anchor.Row2       := FAnchorObj.Row2;
  Anchor.Row2Offset := FAnchorObj.Row2Offset;}
  WriteMSOHeader(MSO_CLIENTANCHOR, Version, Instance, DataSize, Stream);
  Stream.Write(FAnchor^, DataSize);
end;

procedure TmsoClientAnchor.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
begin
  WriteMSOHeaderToByteArray(MSO_CLIENTANCHOR, Version, Instance, DataSize,
    ByteArray, Position);
  Move(FAnchor^, ByteArray[Position], DataSize);
  Inc(Position, DataSize);
end;

{ TmsoClientData }

function TmsoClientData.GetSize: integer;
begin
  Result := SizeOf(TMSO_Header);
end;

procedure TmsoClientData.Save(Stream: TStream);
begin
  WriteMSOHeader(MSO_CLIENTDATA, Version, Instance, DataSize, Stream);
end;

procedure TmsoClientData.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
begin
  WriteMSOHeaderToByteArray(MSO_CLIENTDATA, Version, Instance, DataSize,
    ByteArray, Position);
end;

{ TmsoBLIPData }

constructor TmsoBLIPData.Create(Version, Instance: word;
  const FileName: string; Picture: TStream; PictureType: integer);
begin
  inherited Create(Version, Instance);
  FFileName := FileName;
  FPicture := Picture;
  FPictureType := PictureType;
end;

function TmsoBLIPData.GetPictureSize: integer;
var
  SR: TSearchRec;
begin
  Result := 0;
  if Assigned(FPicture) and (FPicture.Size > 0) then
    Result := FPicture.Size
  else begin
    if FindFirst(FFileName, faArchive, SR) = 0 then
      Result := SR.Size;
  end;
  if FPictureType = 7 then
    Dec(Result, 14);
end;

function TmsoBLIPData.GetSize: integer;
begin
  Result := GetPictureSize + 17 + SizeOf(TMSO_Header);
end;

procedure TmsoBLIPData.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  SkipBytes, Sz, Dummy: integer;
//  Buf: PByteArray;
  FS: TFileStream;
begin
  SkipBytes := 0;
  case FPictureType of
    2: FInstance := BLIP_WMF;
    3: FInstance := BLIP_EMF;
    5: FInstance := BLIP_JPEG;
    6: FInstance := BLIP_PNG;
    7: begin
      FInstance := BLIP_DIB;
      SkipBytes := 14;
    end;
  end;

  Sz := GetPictureSize;
  WriteMSOHeaderToByteArray(MSO_BLIPSTART + FPictureType, Version, Instance,
    Sz + 17, ByteArray, Position);

  FillChar(ByteArray[Position], 17, #0);
  Inc(Position, 17);

  if Assigned(FPicture) and (FPicture.Size > 0) then begin
  end
  else begin
    FS := TFileStream.Create(FFileName, fmOpenRead);
    try
      FS.Seek(SkipBytes, soFromBeginning);
      Dummy := FS.Read(ByteArray[Position], FS.Size - FS.Position);
    finally
      FS.Free;
    end;
    Inc(Position, Dummy);
  end;

  {GetMem(Buf, 17);
  try
    FillChar(Buf^, 17, #0);
    Stream.Write(Buf^, 17);
    FPicture.Seek(SkipBytes, soFromBeginning);
    Stream.CopyFrom(FPicture, FPicture.Size - FPicture.Position);
  finally
    FreeMem(Buf);
  end;}
end;

procedure TmsoBLIPData.Save(Stream: TStream);
var
  SkipBytes, Sz: integer;
  Buf: PByteArray;
begin
  SkipBytes := 0;
  case FPictureType of
    2: FInstance := BLIP_WMF;
    3: FInstance := BLIP_EMF;
    5: FInstance := BLIP_JPEG;
    6: FInstance := BLIP_PNG;
    7: begin
      FInstance := BLIP_DIB;
      SkipBytes := 14;
      {if FPicture.FilePictureType = fptBMP then
        SkipBytes := SizeOf(TBMPHeader);}
    end;
  end;

  Sz := GetPictureSize;
  WriteMSOHeader(MSO_BLIPSTART + FPictureType, Version, Instance, Sz, Stream);

  GetMem(Buf, 17);
  try
    FillChar(Buf^, 17, #0);
    Stream.Write(Buf^, 17);
    FPicture.Seek(SkipBytes, soFromBeginning);
    Stream.CopyFrom(FPicture, FPicture.Size - FPicture.Position);
  finally
    FreeMem(Buf);
  end;
end;

{ TmsoBSEData }

constructor TmsoBSEData.Create(Version, Instance: word; const FileName: string;
  Picture: TStream; PictureType, RefCount: integer);
begin
  inherited Create(Version, Instance, FileName, Picture, PictureType);
  FRefCount := RefCount;
end;

function TmsoBSEData.GetSize: integer;
begin
  Result := SizeOf(TMSO_BSE) + SizeOf(TMSO_Header);
end;

procedure TmsoBSEData.Save(Stream: TStream);
var
  BSE: TMSO_BSE;
begin
  FillChar(BSE, SizeOf(TMSO_BSE), #0);
  BSE.Tag := $00FF;
  BSE.WinType := FPictureType;
  BSE.MacType := FPictureType;
  BSE.Size := GetPictureSize + 25;
  BSE.RefCount := FRefCount;
  BSE.Dummy := $023E;
  FInstance := BSE.WinType;

  WriteMSOHeader(MSO_BSE, Version, Instance, DataSize, Stream);
  Stream.Write(BSE, DataSize);
end;

procedure TmsoBSEData.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  BSE: TMSO_BSE;
begin
  FillChar(BSE, SizeOf(TMSO_BSE), #0);
  BSE.Tag := $00FF;
  BSE.WinType := FPictureType;
  BSE.MacType := FPictureType;
  BSE.Size := GetPictureSize + 25;
  BSE.RefCount := FRefCount;
  BSE.Dummy := $023E;
  FInstance := BSE.WinType;

  WriteMSOHeaderToByteArray(MSO_BSE, Version, Instance, DataSize, ByteArray,
    Position);
  Move(BSE, ByteArray[Position], SizeOf(TMSO_BSE));
  Inc(Position, SizeOf(TMSO_BSE));
end;

{ TmsoClientTextBox }

function TmsoClientTextBox.GetSize: integer;
begin
  Result := SizeOf(TMSO_Header);
end;

{procedure TmsoClientTextBox.Save(Stream: TStream);
begin
  WriteMSOHeader(MSO_CLIENTTEXTBOX, Version, Instance, DataSize, Stream);
end;}

procedure TmsoClientTextBox.Save(Stream: TStream);
begin
  WriteMSOHeader(MSO_CLIENTTEXTBOX, Version, Instance, DataSize, Stream);
end;

procedure TmsoClientTextBox.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
begin
  WriteMSOHeaderToByteArray(MSO_CLIENTTEXTBOX, Version, Instance, DataSize,
    ByteArray, Position);
end;

{ TmsoSplitMenuColors }

function TmsoSplitMenuColors.GetSize: integer;
begin
  Result := SizeOf(TMSO_SplitMenuColors) + SizeOf(TMSO_Header);
end;

procedure TmsoSplitMenuColors.Save(Stream: TStream);
var
  SMC: TMSO_SplitMenuColors;
begin
  SMC.TopLevelFill := $0800000D;
  SMC.LineType     := $0800000C;
  SMC.Shadow       := $08000017;
  SMC.ThreeD       := $100000F7;
  WriteMSOHeader(MSO_SPLITMENUCOLORS, Version, Instance,
    Size - SizeOf(TMSO_Header), Stream);
  Stream.Write(SMC, SizeOf(TMSO_SplitMenuColors));
end;

procedure TmsoSplitMenuColors.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
var
  SMC: TMSO_SplitMenuColors;
begin
  SMC.TopLevelFill := $0800000D;
  SMC.LineType     := $0800000C;
  SMC.Shadow       := $08000017;
  SMC.ThreeD       := $100000F7;
  WriteMSOHeaderToByteArray(MSO_SPLITMENUCOLORS, Version, Instance,
    Size - SizeOf(TMSO_Header), ByteArray, Position);
  Move(SMC, ByteArray[Position], SizeOf(TMSO_SplitMenuColors));
  Inc(Position, SizeOf(TMSO_SplitMenuColors));
end;

{ TxlsMSODrawing }

constructor TxlsMSODrawing.Create;
var
  SpContainer: TmsoContainer;
begin
  inherited;
  FDgContainer := TmsoContainer.Create(MSO_DGCONTAINER, $0F, $00);
  FSpgrContainer := TmsoContainer.Create(MSO_SPGRCONTAINER, $0F, $00);
  FData := TmsoList.Create;

  FDgContainer.Children.Add(TmsoDg.Create($00, $01));
  FDgContainer.Children.Add(SpgrContainer);

  SpContainer := TmsoContainer.Create(MSO_SPCONTAINER, $0F, $00);
  SpContainer.Children.Add(TmsoSpgr.Create($01, $00));
  SpContainer.Children.Add(TmsoSp.Create($02, $00, MSO_SPID - 1{ $0400 }, $0005));

  FSpgrContainer.Children.Add(SpContainer);
end;

destructor TxlsMSODrawing.Destroy;
begin
  FData.Free;
  FSpgrContainer.Free;
  FDgContainer.Free;
  inherited;
end;

function TxlsMSODrawing.GetSize(Index: integer): integer;
var
  i: integer;
begin
  if Index = 0 then begin
    Result := 0;
    for i := 0 to FData.Count - 1 do
      Inc(Result, FData[i].Size);
    FDgContainer.AddSize := Result;
    FSpgrContainer.AddSize := Result;
    Result := FDgContainer.Size + FData[0].Size;
  end
  else Result := FData[Index].Size;
end;

procedure TxlsMSODrawing.Save(Stream: TStream; Index: integer);
var
  Header: TBIFF_Header;
begin
  Header.ID := BIFF_MSODRAWING;
  Header.Length := GetSize(Index);
  Stream.Write(Header.ID, SizeOf(Word));
  Stream.Write(Header.Length, SizeOf(Word));
  if Index = 0 then begin
    FDgContainer.Save(Stream);
    FData[0].Save(Stream);
  end
  else FData[Index].Save(Stream);
end;

function TxlsMSODrawing.CreateByteArray(Index: integer): PByteArray;
var
  Sz, Ps: integer;
begin
  Sz := GetSize(Index);
  GetMem(Result, Sz);
  Ps := 0;
  if Index = 0 then begin
    FDgContainer.AssignToByteArray(Result, Ps);
    FData[0].AssignToByteArray(Result, Ps);
  end
  else FData[Index].AssignToByteArray(Result, Ps);
end;

{ TbiffMSODrawingGroup }

constructor TbiffMSODrawingGroup.CreateEx(Section: TxlsSection; ID,
  DataSize: integer; Data: PByteArray);
begin
  inherited Create(Section, ID, DataSize, Data);
  FDataSize := DataSize;
end;

function TbiffMSODrawingGroup.GetDataSize: integer;
begin
  Result := FDataSize;
end;

{ TobjRecord }

constructor TobjRecord.Create(ID, Length: word);
begin
  inherited Create;
  FID := ID;
  FLength := Length;
end;

procedure TobjRecord.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
begin
  if not Assigned(ByteArray) then Exit;

  Move(FID, ByteArray[Position], SizeOf(FID));
  Inc(Position, SizeOf(FID));
  Move(FLength, ByteArray[Position], SizeOf(FLength));
  Inc(Position, SizeOf(FLength));
end;

{ TobjRecordList }

function TobjRecordList.GetItems(Index: integer): TobjRecord;
begin
  Result := TobjRecord(inherited Items[Index]);
end;

procedure TobjRecordList.SetItems(Index: integer; Value: TobjRecord);
begin
  inherited Items[Index] := Value;
end;

function TobjRecordList.Add(Item: TobjRecord): integer;
begin
  Result := inherited Add(Item);
end;

procedure TobjRecordList.Insert(Index: integer; Item: TobjRecord);
begin
  inherited Insert(Index, Item);
end;

{ TobjCmo }

procedure TobjCmo.AssignToByteArray(ByteArray: PByteArray;
  var Position: integer);
const
  Reserved: array[0..11] of byte =
    ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00);
begin
  inherited;
  Move(FObjectType, ByteArray[Position], SizeOf(Word));
  Inc(Position, SizeOf(Word));
  Move(FObjectID, ByteArray[Position], SizeOf(Word));
  Inc(Position, SizeOf(Word));
  Move(FOptionFlags, ByteArray[Position], SizeOf(Word));
  Inc(Position, SizeOf(Word));
  Move(Reserved[0], ByteArray[Position], 12);
  Inc(Position, 12);
end;

{ TbiffTXO }

function TbiffTXO.GetOptions: word;
begin
  Result := PBIFF_TXO(Data).Options;
end;

procedure TbiffTXO.SetOptions(Value: word);
begin
  PBIFF_TXO(Data).Options := Value;
end;

function TbiffTXO.GetOrientation: word;
begin
  Result := PBIFF_TXO(Data).Orientation;
end;

procedure TbiffTXO.SetOrientation(Value: word);
begin
  PBIFF_TXO(Data).Orientation := Value;
end;

function TbiffTXO.GetTextLength: word;
begin
  Result := PBIFF_TXO(Data).TextLength;
end;

procedure TbiffTXO.SetTextLength(Value: word);
begin
  PBIFF_TXO(Data).TextLength := Value;
end;

function TbiffTXO.GetFormatLength: word;
begin
  Result := PBIFF_TXO(Data).FormatLength;
end;

procedure TbiffTXO.SetFormatLength(Value: word);
begin
  PBIFF_TXO(Data).FormatLength := Value;
end;

{ TbiffTXORUN }

function TbiffTXORUN.GetCharIndex1: word;
begin
  Result := PBIFF_TXORUN(Data).CharIndex1;
end;

procedure TbiffTXORUN.SetCharIndex1(Value: word);
begin
  PBIFF_TXORUN(Data).CharIndex1 := Value;
end;

function TbiffTXORUN.GetFontIndex1: word;
begin
  Result := PBIFF_TXORUN(Data).FontIndex1;
end;

procedure TbiffTXORUN.SetFontIndex1(Value: word);
begin
  PBIFF_TXORUN(Data).FontIndex1 := Value;
end;

function TbiffTXORUN.GetCharIndex2: word;
begin
  Result := PBIFF_TXORUN(Data).CharIndex2;
end;

procedure TbiffTXORUN.SetCharIndex2(Value: word);
begin
  PBIFF_TXORUN(Data).CharIndex2 := Value;
end;

function TbiffTXORUN.GetFontIndex2: word;
begin
  Result := PBIFF_TXORUN(Data).FontIndex2;
end;

procedure TbiffTXORUN.SetFontIndex2(Value: word);
begin
  PBIFF_TXORUN(Data).FontIndex2 := Value;
end;

{ TbiffNote }

function TbiffNote.GetOptions: word;
begin
  Result := PBIFF_NOTE(Data).Options;
end;

procedure TbiffNote.SetOptions(Value: word);
begin
  PBIFF_NOTE(Data).Options := Value;
end;

function TbiffNote.GetObjID: word;
begin
  Result := PBIFF_NOTE(Data).ObjID;
end;

procedure TbiffNote.SetObjID(Value: word);
begin
  PBIFF_NOTE(Data).ObjID := Value;
end;

{function TbiffNote.GetAuthorLength: word;
begin
  Result := PBIFF_NOTE(Data).AuthorLength;
end;

procedure TbiffNote.SetAuthorLength(Value: word);
begin
  PBIFF_NOTE(Data).AuthorLength := Value;
end;}

{ TbiffSupbookInternal }

constructor TbiffSupbookInternal.Create(Section: TxlsSection; ID,
  DataSize: word; Data: PByteArray);
begin
  inherited;
  PBIFF_SUPBOOK_INTERNAL(Data).Relict := $0401;
end;

function TbiffSupbookInternal.GetSheetCount: word;
begin
  Result := PBIFF_SUPBOOK_INTERNAL(Data).SheetCount;
end;

procedure TbiffSupbookInternal.SetSheetCount(Value: word);
begin
  PBIFF_SUPBOOK_INTERNAL(Data).SheetCount := Value;
end;

{ TbiffExternSheet }

function TbiffExternSheet.GetRefCount: word;
begin
  Result := GetWord(Data, 0);
end;

procedure TbiffExternSheet.SetRefCount(const Value: word);
begin
  SetWord(Data, 0, Value);
end;

{ TchartFBI }

function TchartFBI.GetWidth: word;
begin
  Result := PCHART_FBI(Data).Width;
end;

procedure TchartFBI.SetWidth(Value: word);
begin
  PCHART_FBI(Data).Width := Value;
end;

function TchartFBI.GetHeight: word;
begin
  Result := PCHART_FBI(Data).Height;
end;

procedure TchartFBI.SetHeight(Value: word);
begin
  PCHART_FBI(Data).Height := Value;
end;

function TchartFBI.GetHeightApplied: word;
begin
  Result := PCHART_FBI(Data).HeightApplied;
end;

procedure TchartFBI.SetHeightApplied(Value: word);
begin
  PCHART_FBI(Data).HeightApplied := Value;
end;

function TchartFBI.GetScale: word;
begin
  Result := PCHART_FBI(Data).Scale;
end;

procedure TchartFBI.SetScale(Value: word);
begin
  PCHART_FBI(Data).Scale := Value;
end;

function TchartFBI.GetFontIndex: word;
begin
  Result := PCHART_FBI(Data).FontIndex;
end;

procedure TchartFBI.SetFontIndex(Value: word);
begin
  PCHART_FBI(Data).FontIndex := Value;
end;

{ TchartChart }

function TchartChart.GetTop: cardinal;
begin
  Result := PCHART_CHART(Data).Top;
end;

procedure TchartChart.SetTop(Value: cardinal);
begin
  PCHART_CHART(Data).Top := Value;
end;

function TchartChart.GetLeft: cardinal;
begin
  Result := PCHART_CHART(Data).Left;
end;

procedure TchartChart.SetLeft(Value: cardinal);
begin
  PCHART_CHART(Data).Left := Value;
end;

function TchartChart.GetWidth: cardinal;
begin
  Result := PCHART_CHART(Data).Width;
end;

procedure TchartChart.SetWidth(Value: cardinal);
begin
  PCHART_CHART(Data).Width := Value;
end;

function TchartChart.GetHeight: cardinal;
begin
  Result := PCHART_CHART(Data).Height;
end;

procedure TchartChart.SetHeight(Value: cardinal);
begin
  PCHART_CHART(Data).Height := Value;
end;

{ TchartPlotGrowth }

function TchartPlotGrowth.GetHorizontal: cardinal;
begin
  Result := PCHART_PLOTGROWTH(Data).Horizontal;
end;

procedure TchartPlotGrowth.SetHorizontal(Value: cardinal);
begin
  PCHART_PLOTGROWTH(Data).Horizontal := Value;
end;

function TchartPlotGrowth.GetVertical: cardinal;
begin
  Result := PCHART_PLOTGROWTH(Data).Vertical;
end;

procedure TchartPlotGrowth.SetVertical(Value: cardinal);
begin
  PCHART_PLOTGROWTH(Data).Vertical := Value;
end;

{ TchartFrame }

function TchartFrame.GetFrameType: word;
begin
  Result := PCHART_FRAME(Data).FrameType;
end;

procedure TchartFrame.SetFrameType(Value: word);
begin
  PCHART_FRAME(Data).FrameType := Value;
end;

function TchartFrame.GetFlags: word;
begin
  Result := PCHART_FRAME(Data).Flags;
end;

procedure TchartFrame.SetFlags(Value: word);
begin
  PCHART_FRAME(Data).Flags := Value;
end;

{ TchartLineFormat }

function TchartLineFormat.GetColor: cardinal;
begin
  Result := PCHART_LINEFORMAT(Data).Color;
end;

procedure TchartLineFormat.SetColor(Value: cardinal);
begin
  PCHART_LINEFORMAT(Data).Color := Value;
end;

function TchartLineFormat.GetPattern: word;
begin
  Result := PCHART_LINEFORMAT(Data).Pattern;
end;

procedure TchartLineFormat.SetPattern(Value: word);
begin
  PCHART_LINEFORMAT(Data).Pattern := Value;
end;

function TchartLineFormat.GetWeight: word;
begin
  Result := PCHART_LINEFORMAT(Data).Weight;
end;

procedure TchartLineFormat.SetWeight(Value: word);
begin
  PCHART_LINEFORMAT(Data).Weight := Value;
end;

function TchartLineFormat.GetFormatFlags: word;
begin
  Result := PCHART_LINEFORMAT(Data).FormatFlags;
end;

procedure TchartLineFormat.SetFormatFlags(Value: word);
begin
  PCHART_LINEFORMAT(Data).FormatFlags := Value;
end;

function TchartLineFormat.GetColorIndex: word;
begin
  Result := PCHART_LINEFORMAT(Data).ColorIndex;
end;

procedure TchartLineFormat.SetColorIndex(Value: word);
begin
  PCHART_LINEFORMAT(Data).ColorIndex := Value;
end;

{ TchartAreaFormat }

function TchartAreaFormat.GetForegroundColor: cardinal;
begin
  Result := PCHART_AREAFORMAT(Data).ForegroundColor;
end;

procedure TchartAreaFormat.SetForegroundColor(Value: cardinal);
begin
  PCHART_AREAFORMAT(Data).ForegroundColor := Value;
end;

function TchartAreaFormat.GetBackgroundColor: cardinal;
begin
  Result := PCHART_AREAFORMAT(Data).BackgroundColor;
end;

procedure TchartAreaFormat.SetBackgroundColor(Value: cardinal);
begin
  PCHART_AREAFORMAT(Data).BackgroundColor := Value;
end;

function TchartAreaFormat.GetPattern: word;
begin
  Result := PCHART_AREAFORMAT(Data).Pattern;
end;

procedure TchartAreaFormat.SetPattern(Value: word);
begin
  PCHART_AREAFORMAT(Data).Pattern := Value;
end;

function TchartAreaFormat.GetFormatFlags: word;
begin
  Result := PCHART_AREAFORMAT(Data).FormatFlags;
end;

procedure TchartAreaFormat.SetFormatFlags(Value: word);
begin
  PCHART_AREAFORMAT(Data).FormatFlags := Value;
end;

function TchartAreaFormat.GetForegroundColorIndex: word;
begin
  Result := PCHART_AREAFORMAT(Data).ForegroundColorIndex;
end;

procedure TchartAreaFormat.SetForegroundColorIndex(Value: word);
begin
  PCHART_AREAFORMAT(Data).ForegroundColorIndex := Value;
end;

function TchartAreaFormat.GetBackgroundColorIndex: word;
begin
  Result := PCHART_AREAFORMAT(Data).BackgroundColorIndex;
end;

procedure TchartAreaFormat.SetBackgroundColorIndex(Value: word);
begin
  PCHART_AREAFORMAT(Data).BackgroundColorIndex := Value;
end;

{ TchartSeries }

function TchartSeries.GetCategoryType: word;
begin
  Result := PCHART_SERIES(Data).CategoryType;
end;

procedure TchartSeries.SetCategoryType(Value: word);
begin
  PCHART_SERIES(Data).CategoryType := Value;
end;

function TchartSeries.GetValueType: word;
begin
  Result := PCHART_SERIES(Data).ValueType;
end;

procedure TchartSeries.SetValueType(Value: word);
begin
  PCHART_SERIES(Data).ValueType := Value;
end;

function TchartSeries.GetCategoryCount: word;
begin
  Result := PCHART_SERIES(Data).CategoryCount;
end;

procedure TchartSeries.SetCategoryCount(Value: word);
begin
  PCHART_SERIES(Data).CategoryCount := Value;
end;

function TchartSeries.GetValueCount: word;
begin
  Result := PCHART_SERIES(Data).ValueCount;
end;

procedure TchartSeries.SetValueCount(Value: word);
begin
  PCHART_SERIES(Data).ValueCount := Value;
end;

function TchartSeries.GetBubbleType: word;
begin
  Result := PCHART_SERIES(Data).BubbleType;
end;

procedure TchartSeries.SetBubbleType(Value: word);
begin
  PCHART_SERIES(Data).BubbleType := Value;
end;

function TchartSeries.GetBubbleCount: word;
begin
  Result := PCHART_SERIES(Data).BubbleCount;
end;

procedure TchartSeries.SetBubbleCount(Value: word);
begin
  PCHART_SERIES(Data).BubbleCount := Value;
end;

{ TchartAI }

function TchartAI.GetLinkType: byte;
begin
  Result := PCHART_AI(Data).LinkType;
end;

procedure TchartAI.SetLinkType(Value: byte);
begin
  PCHART_AI(Data).LinkType := Value;
end;

function TchartAI.GetReferenceType: byte;
begin
  Result := PCHART_AI(Data).ReferenceType;
end;

procedure TchartAI.SetReferenceType(Value: byte);
begin
  PCHART_AI(Data).ReferenceType := Value;
end;

function TchartAI.GetFlags: word;
begin
  Result := PCHART_AI(Data).Flags;
end;

procedure TchartAI.SetFlags(Value: word);
begin
  PCHART_AI(Data).Flags := Value;
end;

function TchartAI.GetFormatIndex: word;
begin
  Result := PCHART_AI(Data).FormatIndex;
end;

procedure TchartAI.SetFormatIndex(Value: word);
begin
  PCHART_AI(Data).FormatIndex := Value;
end;

function TchartAI.GetFormulaSize: word;
begin
  Result := PCHART_AI(Data).FormulaSize;
end;

procedure TchartAI.SetFormulaSize(Value: word);
begin
  PCHART_AI(Data).FormulaSize := Value;
end;

{ TchartDataFormat }

function TchartDataFormat.GetPointNumber: word;
begin
  Result := PCHART_DATAFORMAT(Data).PointNumber;
end;

procedure TchartDataFormat.SetPointNumber(Value: word);
begin
  PCHART_DATAFORMAT(Data).PointNumber := Value;
end;

function TchartDataFormat.GetSeriesIndex: word;
begin
  Result := PCHART_DATAFORMAT(Data).SeriesIndex;
end;

procedure TchartDataFormat.SetSeriesIndex(Value: word);
begin
  PCHART_DATAFORMAT(Data).SeriesIndex := Value;
end;

function TchartDataFormat.GetSeriesNumber: word;
begin
  Result := PCHART_DATAFORMAT(Data).SeriesNumber;
end;

procedure TchartDataFormat.SetSeriesNumber(Value: word);
begin
  PCHART_DATAFORMAT(Data).SeriesNumber := Value;
end;

function TchartDataFormat.GetFormatFlags: word;
begin
  Result := PCHART_DATAFORMAT(Data).FormatFlags;
end;

procedure TchartDataFormat.SetFormatFlags(Value: word);
begin
  PCHART_DATAFORMAT(Data).FormatFlags := Value;
end;

{ TchartSeriesText }

function TchartSeriesText.GetTextID: word;
begin
  Result := PCHART_SERIESTEXT(Data).TextID;
end;

procedure TchartSeriesText.SetTextID(Value: word);
begin
  PCHART_SERIESTEXT(Data).TextID := Value;
end;

function TchartSeriesText.GetLength: byte;
begin
  Result := PCHART_SERIESTEXT(Data).Length;
end;

procedure TchartSeriesText.SetLength(Value: byte);
begin
  PCHART_SERIESTEXT(Data).Length := Value;
end;

function TchartSeriesText.GetText: string;
var
  Ln: byte;
begin
  Result := EmptyStr;
  Ln := GetLength;
  if Ln > 0 then begin
    System.SetLength(Result, Ln);
    Move(Data[3], Result[1], Ln)
  end;
end;

procedure TchartSeriesText.SetText(const Value: string);
var
  Ln: byte;
begin
  Ln := GetLength;
  if Ln > 0 then
    Move(Value[1], Data[3], Ln);
end;

{ TchartSerToCRT }

function TchartSerToCRT.GetChartGroupIndex: word;
begin
  Result := PCHART_SERTOCRT(Data).ChartGroupIndex;
end;

procedure TchartSerToCRT.SetChartGroupIndex(Value: word);
begin
  PCHART_SERTOCRT(Data).ChartGroupIndex := Value;
end;

{ TchartShtProps }

function TchartShtProps.GetPropertyFlags: word;
begin
  Result := PCHART_SHTPROPS(Data).PropertyFlags;
end;

procedure TchartShtProps.SetPropertyFlags(Value: word);
begin
  PCHART_SHTPROPS(Data).PropertyFlags := Value;
end;

function TchartShtProps.GetEmptyAs: byte;
begin
  Result := PCHART_SHTPROPS(Data).EmptyAs;
end;

procedure TchartShtProps.SetEmptyAs(Value: byte);
begin
  PCHART_SHTPROPS(Data).EmptyAs := Value;
end;

function TchartShtProps.GetUnknown: byte;
begin
  Result := PCHART_SHTPROPS(Data).Unknown;
end;

procedure TchartShtProps.SetUnknown(Value: byte);
begin
  PCHART_SHTPROPS(Data).Unknown := Value;
end;

{ TchartDefaultText }

function TchartDefaultText.GetObjectID: word;
begin
  Result := PCHART_DEFAULTTEXT(Data).ObjectID;
end;

procedure TchartDefaultText.SetObjectID(Value: word);
begin
  PCHART_DEFAULTTEXT(Data).ObjectID := Value;
end;

{ TchartText }

function TchartText.GetHorizontalAlignment: byte;
begin
  Result := PCHART_TEXT(Data).HorizontalAlignment;
end;

procedure TchartText.SetHorizontalAlignment(Value: byte);
begin
  PCHART_TEXT(Data).HorizontalAlignment := Value;
end;

function TchartText.GetVerticalAlignment: byte;
begin
  Result := PCHART_TEXT(Data).VerticalAlignment;
end;

procedure TchartText.SetVerticalAlignment(Value: byte);
begin
  PCHART_TEXT(Data).VerticalAlignment := Value;
end;

function TchartText.GetBackgroundMode: word;
begin
  Result := PCHART_TEXT(Data).BackgroundMode;
end;

procedure TchartText.SetBackgroundMode(Value: word);
begin
  PCHART_TEXT(Data).BackgroundMode := Value;
end;

function TchartText.GetColor: cardinal;
begin
  Result := PCHART_TEXT(Data).Color;
end;

procedure TchartText.SetColor(Value: cardinal);
begin
  PCHART_TEXT(Data).Color := Value;
end;

function TchartText.GetLeft: cardinal;
begin
  Result := PCHART_TEXT(Data).Left;
end;

procedure TchartText.SetLeft(Value: cardinal);
begin
  PCHART_TEXT(Data).Left := Value;
end;

function TchartText.GetTop: cardinal;
begin
  Result := PCHART_TEXT(Data).Top;
end;

procedure TchartText.SetTop(Value: cardinal);
begin
  PCHART_TEXT(Data).Top := Value;
end;

function TchartText.GetWidth: cardinal;
begin
  Result := PCHART_TEXT(Data).Width;
end;

procedure TchartText.SetWidth(Value: cardinal);
begin
  PCHART_TEXT(Data).Width := Value;
end;

function TchartText.GetHeight: cardinal;
begin
  Result := PCHART_TEXT(Data).Height;
end;

procedure TchartText.SetHeight(Value: cardinal);
begin
  PCHART_TEXT(Data).Height := Value;
end;

function TchartText.GetOptionFlags1: word;
begin
  Result := PCHART_TEXT(Data).OptionFlags1;
end;

procedure TchartText.SetOptionFlags1(Value: word);
begin
  PCHART_TEXT(Data).OptionFlags1 := Value;
end;

function TchartText.GetColorIndex: word;
begin
  Result := PCHART_TEXT(Data).ColorIndex;
end;

procedure TchartText.SetColorIndex(Value: word);
begin
  PCHART_TEXT(Data).ColorIndex := Value;
end;

function TchartText.GetOptionFlags2: word;
begin
  Result := PCHART_TEXT(Data).OptionFlags2;
end;

procedure TchartText.SetOptionFlags2(Value: word);
begin
  PCHART_TEXT(Data).OptionFlags2 := Value;
end;

function TchartText.GetRotation: word;
begin
  Result := PCHART_TEXT(Data).Rotation;
end;

procedure TchartText.SetRotation(Value: word);
begin
  PCHART_TEXT(Data).Rotation := Value;
end;

{ TchartPos }

function TchartPos.GetTopLt: word;
begin
  Result := PCHART_POS(Data).TopLt;
end;

procedure TchartPos.SetTopLt(Value: word);
begin
  PCHART_POS(Data).TopLt := Value;
end;

function TchartPos.GetBotRt: word;
begin
  Result := PCHART_POS(Data).BotRt;
end;

procedure TchartPos.SetBotRt(Value: word);
begin
  PCHART_POS(Data).BotRt := Value;
end;

function TchartPos.GetX1: cardinal;
begin
  Result := PCHART_POS(Data).X1;
end;

procedure TchartPos.SetX1(Value: cardinal);
begin
  PCHART_POS(Data).X1 := Value;
end;

function TchartPos.GetY1: cardinal;
begin
  Result := PCHART_POS(Data).Y1;
end;

procedure TchartPos.SetY1(Value: cardinal);
begin
  PCHART_POS(Data).Y1 := Value;
end;

function TchartPos.GetX2: cardinal;
begin
  Result := PCHART_POS(Data).X2;
end;

procedure TchartPos.SetX2(Value: cardinal);
begin
  PCHART_POS(Data).X2 := Value;
end;

function TchartPos.GetY2: cardinal;
begin
  Result := PCHART_POS(Data).Y2;
end;

procedure TchartPos.SetY2(Value: cardinal);
begin
  PCHART_POS(Data).Y2 := Value;
end;

{ TchartFontX }

function TchartFontX.GetFontIndex: word;
begin
  Result := PCHART_FONTX(Data).FontIndex;
end;

procedure TchartFontX.SetFontIndex(Value: word);
begin
  PCHART_FONTX(Data).FontIndex := Value;
end;

{ TchartAxesUsed }

function TchartAxesUsed.GetAxesCount: word;
begin
  Result := PCHART_AXESUSED(Data).AxesCount;
end;

procedure TchartAxesUsed.SetAxesCount(Value: word);
begin
  PCHART_AXESUSED(Data).AxesCount := Value;
end;

{ TchartAxisParent }

function TchartAxisParent.GetAxisIndex: word;
begin
  Result := PCHART_AXISPARENT(Data).AxisIndex;
end;

procedure TchartAxisParent.SetAxisIndex(Value: word);
begin
  PCHART_AXISPARENT(Data).AxisIndex := Value;
end;

function TchartAxisParent.GetTop: cardinal;
begin
  Result := PCHART_AXISPARENT(Data).Top;
end;

procedure TchartAxisParent.SetTop(Value: cardinal);
begin
  PCHART_AXISPARENT(Data).Top := Value;
end;

function TchartAxisParent.GetLeft: cardinal;
begin
  Result := PCHART_AXISPARENT(Data).Left;
end;

procedure TchartAxisParent.SetLeft(Value: cardinal);
begin
  PCHART_AXISPARENT(Data).Left := Value;
end;

function TchartAxisParent.GetWidth: cardinal;
begin
  Result := PCHART_AXISPARENT(Data).Width;
end;

procedure TchartAxisParent.SetWidth(Value: cardinal);
begin
  PCHART_AXISPARENT(Data).Width := Value;
end;

function TchartAxisParent.GetHeight: cardinal;
begin
  Result := PCHART_AXISPARENT(Data).Height;
end;

procedure TchartAxisParent.SetHeight(Value: cardinal);
begin
  PCHART_AXISPARENT(Data).Height := Value;
end;

{ TchartAxis }

function TchartAxis.GetAxisType: word;
begin
  Result := PCHART_AXIS(Data).AxisType;
end;

procedure TchartAxis.SetAxisType(Value: word);
begin
  PCHART_AXIS(Data).AxisType := Value;
end;

{ TchartCatSerRange }

function TchartCatSerRange.GetCrossingPoint: word;
begin
  Result := PCHART_CATSERRANGE(Data).CrossingPoint;
end;

procedure TchartCatSerRange.SetCrossingPoint(Value: word);
begin
  PCHART_CATSERRANGE(Data).CrossingPoint := Value;
end;

function TchartCatSerRange.GetFrequencyLabels: word;
begin
  Result := PCHART_CATSERRANGE(Data).FrequencyLabels;
end;

procedure TchartCatSerRange.SetFrequencyLabels(Value: word);
begin
  PCHART_CATSERRANGE(Data).FrequencyLabels := Value;
end;

function TchartCatSerRange.GetFrequencyMarks: word;
begin
  Result := PCHART_CATSERRANGE(Data).FrequencyMarks;
end;

procedure TchartCatSerRange.SetFrequencyMarks(Value: word);
begin
  PCHART_CATSERRANGE(Data).FrequencyMarks := Value;
end;

function TchartCatSerRange.GetFormatFlags: word;
begin
  Result := PCHART_CATSERRANGE(Data).FormatFlags;
end;

procedure TchartCatSerRange.SetFormatFlags(Value: word);
begin
  PCHART_CATSERRANGE(Data).FormatFlags := Value;
end;

{ TchartAxcExt }

function TchartAxcExt.GetMinCategory: word;
begin
  Result := PCHART_AXCEXT(Data).MinCategory;
end;

procedure TchartAxcExt.SetMinCategory(Value: word);
begin
  PCHART_AXCEXT(Data).MinCategory := Value;
end;

function TchartAxcExt.GetMaxCategory: word;
begin
  Result := PCHART_AXCEXT(Data).MaxCategory;
end;

procedure TchartAxcExt.SetMaxCategory(Value: word);
begin
  PCHART_AXCEXT(Data).MaxCategory := Value;
end;

function TchartAxcExt.GetMajorValue: word;
begin
  Result := PCHART_AXCEXT(Data).MajorValue;
end;

procedure TchartAxcExt.SetMajorValue(Value: word);
begin
  PCHART_AXCEXT(Data).MajorValue := Value;
end;

function TchartAxcExt.GetMajorUnits: word;
begin
  Result := PCHART_AXCEXT(Data).MajorUnits;
end;

procedure TchartAxcExt.SetMajorUnits(Value: word);
begin
  PCHART_AXCEXT(Data).MajorUnits := Value;
end;

function TchartAxcExt.GetMinorValue: word;
begin
  Result := PCHART_AXCEXT(Data).MinorValue;
end;

procedure TchartAxcExt.SetMinorValue(Value: word);
begin
  PCHART_AXCEXT(Data).MinorValue := Value;
end;

function TchartAxcExt.GetMinorUnits: word;
begin
  Result := PCHART_AXCEXT(Data).MinorUnits;
end;

procedure TchartAxcExt.SetMinorUnits(Value: word);
begin
  PCHART_AXCEXT(Data).MinorUnits := Value;
end;

function TchartAxcExt.GetBaseUnit: word;
begin
  Result := PCHART_AXCEXT(Data).BaseUnit;
end;

procedure TchartAxcExt.SetBaseUnit(Value: word);
begin
  PCHART_AXCEXT(Data).BaseUnit := Value;
end;

function TchartAxcExt.GetCrossingPoint: word;
begin
  Result := PCHART_AXCEXT(Data).CrossingPoint;
end;

procedure TchartAxcExt.SetCrossingPoint(Value: word);
begin
  PCHART_AXCEXT(Data).CrossingPoint := Value;
end;

function TchartAxcExt.GetOptionFlags: word;
begin
  Result := PCHART_AXCEXT(Data).OptionFlags;
end;

procedure TchartAxcExt.SetOptionFlags(Value: word);
begin
  PCHART_AXCEXT(Data).OptionFlags := Value;
end;

{ TchartTick }

function TchartTick.GetMajorMarkType: byte;
begin
  Result := PCHART_TICK(Data).MajorMarkType;
end;

procedure TchartTick.SetMajorMarkType(Value: byte);
begin
  PCHART_TICK(Data).MajorMarkType := Value;
end;

function TchartTick.GetMinorMarkType: byte;
begin
  Result := PCHART_TICK(Data).MinorMarkType;
end;

procedure TchartTick.SetMinorMarkType(Value: byte);
begin
  PCHART_TICK(Data).MinorMarkType := Value;
end;

function TchartTick.GetLabelPosition: byte;
begin
  Result := PCHART_TICK(Data).LabelPosition;
end;

procedure TchartTick.SetLabelPosition(Value: byte);
begin
  PCHART_TICK(Data).LabelPosition := Value;
end;

function TchartTick.GetBackgroundMode: byte;
begin
  Result := PCHART_TICK(Data).BackgroundMode;
end;

procedure TchartTick.SetBackgroundMode(Value: byte);
begin
  PCHART_TICK(Data).BackgroundMode := Value;
end;

function TchartTick.GetColor: cardinal;
begin
  Result := PCHART_TICK(Data).Color;
end;

procedure TchartTick.SetColor(Value: cardinal);
begin
  PCHART_TICK(Data).Color := Value;
end;

function TchartTick.GetDisplayFlags: word;
begin
  Result := PCHART_TICK(Data).DisplayFlags;
end;

procedure TchartTick.SetDisplayFlags(Value: word);
begin
  PCHART_TICK(Data).DisplayFlags := Value;
end;

function TchartTick.GetColorIndex: word;
begin
  Result := PCHART_TICK(Data).ColorIndex;
end;

procedure TchartTick.SetColorIndex(Value: word);
begin
  PCHART_TICK(Data).ColorIndex := Value;
end;

{ TchartValueRange }

function TchartValueRange.GetMinValue: double;
begin
  Result := PCHART_VALUERANGE(Data).MinValue;
end;

procedure TchartValueRange.SetMinValue(Value: double);
begin
  PCHART_VALUERANGE(Data).MinValue := Value;
end;

function TchartValueRange.GetMaxValue: double;
begin
  Result := PCHART_VALUERANGE(Data).MaxValue;
end;

procedure TchartValueRange.SetMaxValue(Value: double);
begin
  PCHART_VALUERANGE(Data).MaxValue := Value;
end;

function TchartValueRange.GetMajorInc: double;
begin
  Result := PCHART_VALUERANGE(Data).MajorInc;
end;

procedure TchartValueRange.SetMajorInc(Value: double);
begin
  PCHART_VALUERANGE(Data).MajorInc := Value;
end;

function TchartValueRange.GetMinorInc: double;
begin
  Result := PCHART_VALUERANGE(Data).MinorInc;
end;

procedure TchartValueRange.SetMinorInc(Value: double);
begin
  PCHART_VALUERANGE(Data).MinorInc := Value;
end;

function TchartValueRange.GetAxisCrosses: double;
begin
  Result := PCHART_VALUERANGE(Data).AxisCrosses;
end;

procedure TchartValueRange.SetAxisCrosses(Value: double);
begin
  PCHART_VALUERANGE(Data).AxisCrosses := Value;
end;

function TchartValueRange.GetFormatFlags: word;
begin
  Result := PCHART_VALUERANGE(Data).FormatFlags;
end;

procedure TchartValueRange.SetFormatFlags(Value: word);
begin
  PCHART_VALUERANGE(Data).FormatFlags := Value;
end;

{ TchartAxisLineFormat }

function TchartAxisLineFormat.GetLineID: word;
begin
  Result := PCHART_AXISLINEFORMAT(Data).LineID;
end;

procedure TchartAxisLineFormat.SetLineID(Value: word);
begin
  PCHART_AXISLINEFORMAT(Data).LineID := Value;
end;

{ TchartChartFormat }

function TchartChartFormat.GetFormatFlags: word;
begin
  Result := PCHART_CHARTFORMAT(Data).FormatFlags;
end;

procedure TchartChartFormat.SetFormatFlags(Value: word);
begin
  PCHART_CHARTFORMAT(Data).FormatFlags := Value;
end;

function TchartChartFormat.GetDrawingOrder: word;
begin
  Result := PCHART_CHARTFORMAT(Data).DrawingOrder;
end;

procedure TchartChartFormat.SetDrawingOrder(Value: word);
begin
  PCHART_CHARTFORMAT(Data).DrawingOrder := Value;
end;

{ TchartBar }

function TchartBar.GetSpaceBars: word;
begin
  Result := PCHART_BAR(Data).SpaceBars;
end;

procedure TchartBar.SetSpaceBars(Value: word);
begin
  PCHART_BAR(Data).SpaceBars := Value;
end;

function TchartBar.GetSpaceCategories: word;
begin
  Result := PCHART_BAR(Data).SpaceCategories;
end;

procedure TchartBar.SetSpaceCategories(Value: word);
begin
  PCHART_BAR(Data).SpaceCategories := Value;
end;

function TchartBar.GetFormatFlags: word;
begin
  Result := PCHART_BAR(Data).FormatFlags;
end;

procedure TchartBar.SetFormatFlags(Value: word);
begin
  PCHART_BAR(Data).FormatFlags := Value;
end;

{ TchartLine }

function TchartLine.GetFormatFlags: word;
begin
  Result := PCHART_LINE(Data).FormatFlags;
end;

procedure TchartLine.SetFormatFlags(Value: word);
begin
  PCHART_LINE(Data).FormatFlags := Value;
end;

{ TchartPie }

function TchartPie.GetAngle: word;
begin
  Result := PCHART_PIE(Data).Angle;
end;

procedure TchartPie.SetAngle(Value: word);
begin
  PCHART_PIE(Data).Angle := Value;
end;

function TchartPie.GetDonut: word;
begin
  Result := PCHART_PIE(Data).Donut;
end;

procedure TchartPie.SetDonut(Value: word);
begin
  PCHART_PIE(Data).Donut := Value;
end;

function TchartPie.GetOptionFlags: word;
begin
  Result := PCHART_PIE(Data).OptionFlags;
end;

procedure TchartPie.SetOptionFlags(Value: word);
begin
  PCHART_PIE(Data).OptionFlags := Value;
end;

{ TchartArea }

function TchartArea.GetFormatFlags: word;
begin
  Result := PCHART_AREA(Data).FormatFlags;
end;

procedure TchartArea.SetFormatFlags(Value: word);
begin
  PCHART_AREA(Data).FormatFlags := Value;
end;

{ TchartSurface }

function TchartSurface.GetOptionFlags: word;
begin
  Result := PCHART_SURFACE(Data).OptionFlags;
end;

procedure TchartSurface.SetOptionFlags(Value: word);
begin
  PCHART_SURFACE(Data).OptionFlags := Value;
end;

{ TchartRadar }

function TchartRadar.GetOptionFlags: word;
begin
  Result := PCHART_RADAR(Data).OptionFlags;
end;

procedure TchartRadar.SetOptionFlags(Value: word);
begin
  PCHART_RADAR(Data).OptionFlags := Value;
end;

{ TchartRadarArea }

function TchartRadarArea.GetOptionFlags: word;
begin
  Result := PCHART_RADARAREA(Data).OptionFlags;
end;

procedure TchartRadarArea.SetOptionFlags(Value: word);
begin
  PCHART_RADARAREA(Data).OptionFlags := Value;
end;

{ Tchart3d }

function Tchart3d.GetRotation: word;
begin
  Result := PCHART_3D(Data).Rotation;
end;

procedure Tchart3d.SetRotation(Value: word);
begin
  PCHART_3D(Data).Rotation := Value;
end;

function Tchart3d.GetElevation: word;
begin
  Result := PCHART_3D(Data).Elevation;
end;

procedure Tchart3d.SetElevation(Value: word);
begin
  PCHART_3D(Data).Elevation := Value;
end;

function Tchart3d.GetDistance: word;
begin
  Result := PCHART_3D(Data).Distance;
end;

procedure Tchart3d.SetDistance(Value: word);
begin
  PCHART_3D(Data).Distance := Value;
end;

function Tchart3d.GetPlotHeight: word;
begin
  Result := PCHART_3D(Data).PlotHeight;
end;

procedure Tchart3d.SetPlotHeight(Value: word);
begin
  PCHART_3D(Data).PlotHeight := Value;
end;

function Tchart3d.GetDepth: word;
begin
  Result := PCHART_3D(Data).Depth;
end;

procedure Tchart3d.SetDepth(Value: word);
begin
  PCHART_3D(Data).Depth := Value;
end;

function Tchart3d.GetSpace: word;
begin
  Result := PCHART_3D(Data).Space;
end;

procedure Tchart3d.SetSpace(Value: word);
begin
  PCHART_3D(Data).Space := Value;
end;

function Tchart3d.GetOptionFlags: word;
begin
  Result := PCHART_3D(Data).OptionFlags;
end;

procedure Tchart3d.SetOptionFlags(Value: word);
begin
  PCHART_3D(Data).OptionFlags := Value;
end;

{ TchartLegend }

function TchartLegend.GetTop: cardinal;
begin
  Result := PCHART_LEGEND(Data).Top;
end;

procedure TchartLegend.SetTop(Value: cardinal);
begin
  PCHART_LEGEND(Data).Top := Value;
end;

function TchartLegend.GetLeft: cardinal;
begin
  Result := PCHART_LEGEND(Data).Left;
end;

procedure TchartLegend.SetLeft(Value: cardinal);
begin
  PCHART_LEGEND(Data).Left := Value;
end;

function TchartLegend.GetWidth: cardinal;
begin
  Result := PCHART_LEGEND(Data).Width;
end;

procedure TchartLegend.SetWidth(Value: cardinal);
begin
  PCHART_LEGEND(Data).Width := Value;
end;

function TchartLegend.GetHeight: cardinal;
begin
  Result := PCHART_LEGEND(Data).Height;
end;

procedure TchartLegend.SetHeight(Value: cardinal);
begin
  PCHART_LEGEND(Data).Height := Value;
end;

function TchartLegend.GetLegendType: byte;
begin
  Result := PCHART_LEGEND(Data).LegendType;
end;

procedure TchartLegend.SetLegendType(Value: byte);
begin
  PCHART_LEGEND(Data).LegendType := Value;
end;

function TchartLegend.GetSpacing: byte;
begin
  Result := PCHART_LEGEND(Data).Spacing;
end;

procedure TchartLegend.SetSpacing(Value: byte);
begin
  PCHART_LEGEND(Data).Spacing := Value;
end;

function TchartLegend.GetOptionFlags: word;
begin
  Result := PCHART_LEGEND(Data).OptionFlags;
end;

procedure TchartLegend.SetOptionFlags(Value: word);
begin
  PCHART_LEGEND(Data).OptionFlags := Value;
end;

{ TchartObjectLink }

function TchartObjectLink.GetLinkedTo: word;
begin
  Result := PCHART_OBJECTLINK(Data).LinkedTo;
end;

procedure TchartObjectLink.SetLinkedTo(Value: word);
begin
  PCHART_OBJECTLINK(Data).LinkedTo := Value;
end;

function TchartObjectLink.GetSeriesIndex: word;
begin
  Result := PCHART_OBJECTLINK(Data).SeriesIndex;
end;

procedure TchartObjectLink.SetSeriesIndex(Value: word);
begin
  PCHART_OBJECTLINK(Data).SeriesIndex := Value;
end;

function TchartObjectLink.GetDataIndex: word;
begin
  Result := PCHART_OBJECTLINK(Data).DataIndex;
end;

procedure TchartObjectLink.SetDataIndex(Value: word);
begin
  PCHART_OBJECTLINK(Data).DataIndex := Value;
end;

{ TchartSIIndex }

function TchartSIIndex.GetIndex: word;
begin
  Result := PCHART_SIINDEX(Data).Index;
end;

procedure TchartSIIndex.SetIndex(Value: word);
begin
  PCHART_SIINDEX(Data).Index := Value;
end;

{ TxlsList }

function TxlsList.GetItems(Index: integer): TObject;
begin
  Result := TObject(inherited Items[Index]);
end;

procedure TxlsList.SetItems(Index: integer; Value: TObject);
begin
  Items[Index] := Value;
end;

function TxlsList.Add(Item: TObject): integer;
begin
  Result := inherited Add(Item);
end;

{procedure TxlsList.Clear;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do
    Delete(i);
  inherited;
end;}

constructor TxlsList.Create(Workbook: TxlsWorkbook);
begin
  inherited Create;
  FWorkbook := Workbook;
end;

procedure TxlsList.Delete(Index: integer);
begin
  if Assigned(Items[Index]) then
    TObject(Items[Index]).Free;
  inherited Delete(Index);
end;

{$IFDEF VCL5}
function TxlsList.Extract(Item: TObject): TObject;
begin
  Result := TObject(inherited Extract(Item));
end;
{$ENDIF}

function TxlsList.First: TObject;
begin
  Result := TObject(inherited First);
end;

function TxlsList.IndexOf(Item: TObject): integer;
begin
  Result := inherited IndexOf(Item);
end;

procedure TxlsList.Insert(Index: integer; Item: TObject);
begin
  inherited Insert(Index, Item);
end;

function TxlsList.Last: TObject;
begin
  Result := TObject(inherited Last);
end;

function TxlsList.Remove(Item: TObject): integer;
begin
  Result := inherited Remove(Item);
end;

{ TbiffRecordList }

function TbiffRecordList.Add(Item: TbiffRecord): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffRecordList.Insert(Index: integer; Item: TbiffRecord);
begin
  inherited Insert(Index, Item);
end;

procedure TbiffRecordList.Save(Stream: TStream);
var
  i: integer;
  R: TbiffRecord;
begin
  for i := 0 to Count - 1 do begin
    R := (Items[i] as TbiffRecord);
    if Assigned(R) then R.Save(Stream);
  end;
end;

function TbiffRecordList.GetTotalSize: integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
    Result := Result + Items[i].TotalSize;
end;

function TbiffRecordList.GetItems(Index: integer): TbiffRecord;
begin
  Result := inherited Items[Index] as TbiffRecord;
end;

procedure TbiffRecordList.SetItems(Index: integer; Value: TbiffRecord);
begin
  inherited Items[Index] := Value;
end;

{ TxlsRowList }

constructor TxlsRowList.Create(Workbook: TxlsWorkbook);
begin
  FSorted := false;
end;

function TxlsRowList.GetItems(Index: integer): TxlsRow;
begin
  Result := TxlsRow(inherited Items[Index]);
end;

procedure TxlsRowList.SetItems(Index: integer; Value: TxlsRow);
begin
  inherited Items[Index] := Value;
end;

function TxlsRowList.GetTotalSize: integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
    Result := Result + Items[i].TotalSize;
end;

function TxlsRowList.Add(Row: TxlsRow): integer;
begin
  Result := inherited Add(Row);
  FSorted := false;
end;

procedure TxlsRowList.Insert(Index: integer; Row: TxlsRow);
begin
  inherited Insert(Index, Row);
end;

function TxlsRowList.Find(Row: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not FSorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].RowNumber < Row then
      C := -1
    else if Items[i].RowNumber > Row then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareRowNumber(Item1, Item2: Pointer): integer;
begin
  if TxlsRow(Item1).RowNumber < TxlsRow(Item2).RowNumber then
    Result := -1
  else if TxlsRow(Item1).RowNumber > TxlsRow(Item2).RowNumber then
    Result := 1
  else Result := 0;
end;

procedure TxlsRowList.Sort;
begin
  inherited Sort(CompareRowNumber);
  FSorted := true;
end;

{ TxlsColList }

constructor TxlsColList.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FSorted := false;
end;

function TxlsColList.GetItems(Index: integer): TxlsCol;
begin
  Result := TxlsCol(inherited Items[Index]);
end;

procedure TxlsColList.SetItems(Index: integer; Value: TxlsCol);
begin
  inherited Items[Index] := Value;
end;

function TxlsColList.Add(Col: TxlsCol): integer;
begin
  Result := inherited Add(Col);
  FSorted := false;
end;

procedure TxlsColList.Insert(Index: integer; Col: TxlsCol);
begin
  inherited Insert(Index, Col);
end;

function TxlsColList.Find(Col: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not FSorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].ColNumber < Col then
      C := -1
    else if Items[i].ColNumber > Col then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareColNumber(Item1, Item2: Pointer): integer;
begin
  if TxlsCol(Item1).ColNumber < TxlsCol(Item2).ColNumber then
    Result := -1
  else if TxlsCol(Item1).ColNumber > TxlsCol(Item2).ColNumber then
    Result := 1
  else Result := 0;
end;

procedure TxlsColList.Sort;
begin
  inherited Sort(CompareColNumber);
  FSorted := true;
end;

{ TbiffColRowList }

function TbiffColRowList.GetItems(Index: integer): TbiffColRow;
begin
  Result := TbiffColRow(inherited Items[Index]);
end;

procedure TbiffColRowList.SetItems(Index: integer; Value: TbiffColRow);
begin
  inherited Items[Index] := Value;
end;

function TbiffColRowList.Add(Item: TbiffColRow): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffColRowList.Insert(Index: integer; Item: TbiffColRow);
begin
  inherited Insert(Index, Item);
end;

{ TbiffCellList }

function TbiffCellList.GetItems(Index: integer): TbiffCell;
begin
  Result := TbiffCell(inherited Items[Index]);
end;

procedure TbiffCellList.SetItems(Index: integer; Value: TbiffCell);
begin
  inherited Items[Index] := Value;
end;

procedure TbiffCellList.SetMinAndMaxCells(Item: TbiffCell);
begin
// do nothing
end;

procedure TbiffCellList.SetColRowNumber(Item: TbiffCell);
begin
// do nothing
end;

function TbiffCellList.Add(Item: TbiffCell): integer;
begin
  Result := inherited Add(Item);
  FSorted := false;
  Item.OnDestroy := OnDestroyItem;
  SetMinAndMaxCells(Item);
  if Count = 1 then SetColRowNumber(Item);
end;

procedure TbiffCellList.Insert(Index: integer; Item: TbiffCell);
begin
  inherited Insert(Index, Item);
  Item.OnDestroy := OnDestroyItem;
end;

procedure TbiffCellList.OnDestroyItem(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if Items[i] = Sender then begin
      Remove(Items[i]);
      Break;
    end;
end;

{ TxlsRow }

constructor TxlsRow.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FRowNumber := -1;
  FMinCol := -1;
  FMaxCol := -1;
end;

procedure TxlsRow.SetMinAndMaxCells(Item: TbiffCell);
begin
  if (FMinCol = -1) or (Item.Col < FMinCol) then
    FMinCol := Item.Col;
  if (FMaxCol = -1) or (Item.Col > FMaxCol) then
    FMaxCol := Item.Col;
end;

procedure TxlsRow.SetColRowNumber(Item: TbiffCell);
begin
  FRowNumber := Item.Row;
end;

function TxlsRow.Find(Col: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not Sorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].Col < Col then
      C := -1
    else if Items[i].Col > Col then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareCellCols(Item1, Item2: Pointer): integer;
begin
  if TbiffCell(Item1).Col < TbiffCell(Item2).Col then
    Result := -1
  else if TbiffCell(Item1).Col > TbiffCell(Item2).Col then
    Result := 1
  else Result := 0;
end;

procedure TxlsRow.Sort;
begin
  inherited Sort(CompareCellCols);
  Sorted := true;
end;

{ TxlsCol }

constructor TxlsCol.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FColNumber := -1;
  FMinRow := -1;
  FMaxRow := -1;
end;

procedure TxlsCol.SetMinAndMaxCells(Item: TbiffCell);
begin
  if (FMinRow = -1) or (Item.Row < FMinRow) then
    FMinRow := Item.Row;
  if (FMaxRow = -1) or (Item.Row > FMaxRow) then
    FMaxRow := Item.Row;
end;

procedure TxlsCol.SetColRowNumber(Item: TbiffCell);
begin
  FColNumber := Item.Col;
end;

function TxlsCol.Find(Row: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not Sorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].Row < Row then
      C := -1
    else if Items[i].Row > Row then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareCellRows(Item1, Item2: Pointer): integer;
begin
  if TbiffCell(Item1).Row < TbiffCell(Item2).Row then
    Result := -1
  else if TbiffCell(Item1).Row > TbiffCell(Item2).Row then
    Result := 1
  else Result := 0;
end;

procedure TxlsCol.Sort;
begin
  inherited Sort(CompareCellRows);
  Sorted := true;
end;

{ TbiffShrFmlaList }

function TbiffShrFmlaList.GetItems(Index: integer): TbiffShrFmla;
begin
  Result := TbiffShrFmla(inherited Items[Index]);
end;

procedure TbiffShrFmlaList.SetItems(Index: integer; Value: TbiffShrFmla);
begin
  inherited Items[Index] := Value;
end;

function TbiffShrFmlaList.Add(Item: TbiffShrFmla): integer;
begin
  Result := inherited Add(Item);
  FSorted := false;
end;

procedure TbiffShrFmlaList.Insert(Index: integer; Item: TbiffShrFmla);
begin
  inherited Insert(Index, Item);
end;

function TbiffShrFmlaList.Find(Key: cardinal; var Index: integer): boolean;
Var
 L, H, I, C: Integer;
begin
  if not FSorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].Key < Key then
      C := -1
    else if Items[i].Key > Key then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareFormulaKey(Item1, Item2: Pointer): integer;
begin
  if TbiffShrFmla(Item1).Key < TbiffShrFmla(Item2).Key then
    Result := -1
  else if TBiffShrFmla(Item1).Key > TBiffShrFmla(Item2).Key then
    Result := 1
  else Result := 0;
end;

procedure TbiffShrFmlaList.Sort;
begin
  inherited Sort(CompareFormulaKey);
  FSorted := true;
end;

{ TbiffNameList }

function TbiffNameList.GetItems(Index: integer): TbiffName;
begin
  Result := TbiffName(inherited Items[Index]);
end;

procedure TbiffNameList.SetItems(Index: integer; Value: TbiffName);
begin
  inherited Items[Index] := Value;
end;

function TbiffNameList.Add(Item: TbiffName): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffNameList.Insert(Index: integer; Item: TbiffName);
begin
  inherited Insert(Index, Item);
end;

{ TbiffBoundSheetList }

function TbiffBoundSheetList.GetItems(Index: integer): TbiffBoundSheet;
begin
  Result := TbiffBoundSheet(inherited Items[Index]);
end;

procedure TbiffBoundSheetList.SetItems(Index: integer; Value: TbiffBoundSheet);
begin
  inherited Items[Index] := Value;
end;

function TbiffBoundSheetList.Add(Item: TbiffBoundSheet): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffBoundSheetList.Insert(Index: integer; Item: TbiffBoundSheet);
begin
  inherited Insert(Index, Item);
end;

function TbiffBoundSheetList.GetName(Index: integer): WideString;
begin
  Result := Items[Index].Name;
end;

{ TbiffXFList }

function TbiffXFList.GetItems(Index: integer): TbiffXF;
begin
  Result := TbiffXF(inherited Items[Index]);
end;

procedure TbiffXFList.SetItems(Index: integer; Value: TbiffXF);
begin
  inherited Items[Index] := Value;
end;

function TbiffXFList.Add(Item: TbiffXF): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffXFList.Insert(Index: integer; Item: TbiffXF);
begin
  inherited Insert(Index, Item);
end;

{ TbiffFontList }

function TbiffFontList.GetItems(Index: integer): TbiffFont;
begin
  Result := TbiffFont(inherited Items[Index]);
end;

procedure TbiffFontList.SetItems(Index: integer; Value: TbiffFont);
begin
  inherited Items[Index] := Value;
end;

function TbiffFontList.Add(Item: TbiffFont): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffFontList.Insert(Index: integer; Item: TbiffFont);
begin
  inherited Insert(Index, Item);
end;

{ TbiffStyleList }

function TbiffStyleList.GetItems(Index: integer): TbiffStyle;
begin
  Result := TbiffStyle(inherited Items[Index]);
end;

procedure TbiffStyleList.SetItems(Index: integer; Value: TbiffStyle);
begin
  inherited Items[Index] := Value;
end;

function TbiffStyleList.Add(Item: TbiffStyle): integer;
begin
  Result := inherited Add(Item);
end;

procedure TbiffStyleList.Insert(Index: integer; Item: TbiffStyle);
begin
  inherited Insert(Index, Item);
end;

{ TbiffFormatList }

function TbiffFormatList.GetItems(Index: integer): TbiffFormat;
begin
  Result := TbiffFormat(inherited Items[Index]);
end;

procedure TbiffFormatList.SetItems(Index: integer; Value: TbiffFormat);
begin
  inherited Items[Index] := Value;
end;

function TbiffFormatList.GetFormat(ID: integer): WideString;
var
  Index: integer;
begin
  if Find(ID, Index) then
    Result := Items[Index].Format
  else if (ID >= Low(InternalNumberFormats)) and (ID <= High(InternalNumberFormats)) then
    Result := InternalNumberFormats[ID]
  else Result := EmptyStr;
end;

function TbiffFormatList.Add(Item: TbiffFormat): integer;
begin
  Result := inherited Add(Item);
  FSorted := false;
end;

procedure TbiffFormatList.Insert(Index: integer; Item: TbiffFormat);
begin
  inherited Insert(Index, Item);
end;

function TbiffFormatList.Find(ID: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not FSorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].ID < ID then
      C := -1
    else if Items[i].ID > ID then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1 else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareFormat(Item1, Item2: Pointer): integer;
begin
  if TbiffFormat(Item1).ID < TbiffRecord(Item2).ID then
    Result := -1
  else if TbiffFormat(Item1).ID > TbiffFormat(Item2).ID then
    Result := 1
  else Result := 0;
end;

procedure TbiffFormatList.Sort;
begin
  inherited Sort(CompareFormat);
  FSorted := true;
end;

{ TxlsColInfoList }

function TxlsColInfoList.GetItems(Index: integer): TxlsColInfo;
begin
  Result := TxlsColInfo(inherited Items[Index]);
end;

procedure TxlsColInfoList.SetItems(Index: integer; const Value: TxlsColInfo);
begin
  inherited Items[Index] := Value;
end;

function TxlsColInfoList.GetTotalSize: integer;
var
  i, j: integer;
begin
  Result := 0;
  if not FSorted then Sort;
  i := 0;
  while i < Count do begin
    j := i + 1;
    while (j < Count) and Items[i].IsEqual(Items[j]) do Inc(j);
    Inc(Result, SizeOf(TBIFF_Header) + SizeOf(TBIFF_COLINFO));
    i := j;
  end;
end;

function TxlsColInfoList.Add(Item: TxlsColInfo): integer;
begin
  Result := inherited Add(Item);
  FSorted := false; 
end;

procedure TxlsColInfoList.Insert(Index: integer; Item: TxlsColInfo);
begin
  inherited Insert(Index, Item);
end;

function TxlsColInfoList.Find(Column: integer; var Index: integer): boolean;
var
 L, H, I, C: Integer;
begin
  if not FSorted then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    if Items[i].Column < Column then
      C := -1
    else if Items[i].Column > Column then
      C := 1
    else C := 0;
    if C < 0 then L := I + 1 else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

function CompareColumns(Item1, Item2: Pointer): Integer;
begin
  if TxlsColInfo(Item1).Column < TxlsColInfo(Item2).Column then
    Result := -1
  else if TxlsColInfo(Item1).Column > TxlsColInfo(Item2).Column then
    Result := 1
  else Result := 0;
end;

procedure TxlsColInfoList.Sort;
begin
  inherited Sort(CompareColumns);
  FSorted := true;
end;

procedure TxlsColInfoList.AddRecord(R: TbiffColInfo);
var
  i: integer;
begin
  if not Assigned(R) then Exit;

  for i := PBIFF_COLINFO(R.Data).FirstCol to PBIFF_COLINFO(R.Data).LastCol do // ???
    Add(TxlsColInfo.Create(i, PBIFF_COLINFO(R.Data).Width,
                              PBIFF_COLINFO(R.Data).XF,
                              PBIFF_COLINFO(R.Data).Options));
  R.Free;
end;

procedure TxlsColInfoList.Save(Stream: TStream);
var
  i, j: integer;
  Header: TBIFF_Header;
  ColInfo: TBIFF_COLINFO;
begin
  if not FSorted then Sort;

  i := 0;
  while i < Count do begin
    j := i + 1;
    //while (j < Count) and Items[i].IsEqual(Items[j]) do Inc(j);

    Header.ID := BIFF_COLINFO;
    Header.Length := SizeOf(TBIFF_COLINFO);
    Stream.Write(Header, SizeOf(Header));
    ColInfo.FirstCol := Items[i].Column;
    ColInfo.LastCol := Items[j - 1].Column;
    ColInfo.Width := Items[i].Width;
    ColInfo.XF := Items[i].XF;
    ColInfo.Options := Items[i].Options;
    ColInfo.Reserved := 0;
    Stream.Write(ColInfo, SizeOf(ColInfo));

    i := j;
  end;
end;

{ TbiffSSTList }

function TbiffSSTList.GetItems(Index: integer): TxlsSSTEntry;
begin
  Result := TxlsSSTEntry(inherited Items[Index]);
end;

procedure TbiffSSTList.SetItems(Index: integer; Value: TxlsSSTEntry);
begin
  inherited Items[Index] := Value;
end;

procedure TbiffSSTList.CalcNextContinue(First: integer; var Last: integer;
  var RecordSize: word);
var
 RSize: integer;
begin
  Last := First;
  if Last < Count
    then RSize := Items[Last].TotalSize
    else RSize := 0;

  while (Last < Count) and (RecordSize + RSize < MAX_RECORD_DATA_SIZE) do begin
    Inc(RecordSize, RSize);
    Inc(Last);
    if Last < Count then RSize := Items[Last].TotalSize;
  end;
  if (First = Last) and (Last < Count) then
    raise Exception.Create(sStringTooLarge);
end;

function TbiffSSTList.GetTotalSize: integer;
var
  First, Last: integer;
  Rs: Word;
begin
  Result := 8;
  Rs := 0;
  First := 0;
  while First < Count do begin
    CalcNextContinue(First,Last, Rs);
    First := Last;
    Result := Result + Rs;
    if Last < Count then Result := Result + SizeOf(TBIFF_Header);
    Rs := 0;
  end;
  Result := Result + SizeOf(TBIFF_Header);
end;

function TbiffSSTList.Add(Item: TxlsSSTEntry): integer;
begin
  Result := inherited Add(Item);
  Item.FIndex := Result;
  if Assigned(FSSTIndex) then
    FSSTIndex.Add(Item);
end;

procedure TbiffSSTList.Insert(Index: integer; Item: TxlsSSTEntry);
begin
  inherited Insert(Index, Item);
end;

procedure TbiffSSTList.Load(SST: TbiffSST);
var
  i, Offset: integer;
  Str: TxlsString;
  Tmp: TbiffRecord;
begin
  Offset := 8;
  Tmp := SST;
  for i := 0 to SST.Count - 1 do begin
    {Str := TxlsString.Create(true, Tmp, Offset);
    Add(TxlsSSTEntry.Create(Str));}
    Str := TxlsString.CreateR(true, Tmp, Offset);
    Add(TxlsSSTEntry.CreateXS(Str));
  end;
end;

procedure TbiffSSTList.Save(Stream: TStream);
var
  i: integer;
  TotalRefCount{, aCount}: integer;
  Header: TBIFF_Header;
  StartPosition: integer;
  First, Last: integer;
begin
  StartPosition := Stream.Position;
  Header.ID:= BIFF_SST;

  TotalRefCount := 0;
  for i := 0 to Count - 1 do begin
    Items[i].TableIndex := i;
    TotalRefCount := TotalRefCount + Items[i].RefCount;
  end;

{  i:=0; TotalRefs:=0;
  while i< Count do
  begin
    Assert(Items[i].Refs>0,'Refs should be >0');
    Items[i].PosInTable:=i;
    TotalRefs:=TotalRefs+Cardinal(Items[i].Refs);
    inc(i);
   end;}


  First := 0;
  Header.Length := 8;
  CalcNextContinue(First, Last, Header.Length);

  Stream.Write(Header, SizeOf(Header));
  Stream.Write(TotalRefCount, SizeOf(TotalRefCount));
//  aCount:=Count;
  Stream.Write(Count, SizeOf(Count));

  while First < Count do begin
    for i := First to Last - 1 do
      Items[i].Save(Stream, StartPosition);

    // Write continue
    First := Last;
    if First < Count then begin
      StartPosition := Stream.Position;
      Header.ID := BIFF_CONTINUE;
      Header.Length := 0;
      CalcNextContinue(First, Last, Header.Length);
      Stream.Write(Header, SizeOf(Header));
    end;
  end;

//  WriteExtSST(DataStream);
end;

function TbiffSSTList.AddString(const Str: WideString): integer;
var
  S: TxlsString;
  Entr: TxlsSSTEntry;
begin
  //S := TxlsString.Create(true, Str);
  S := TxlsString.CreateWS(true, Str);
  if FSSTIndex.Find(S, Result) then begin
    //Items[Result].IncRef;
    S.Free;
  end
  else begin
    //Entr := TxlsSSTEntry.Create(S);
    Entr := TxlsSSTEntry.CreateXS(S);
    //Entr.IncRef;
    Result := Add(Entr);
  end;
end;

procedure TbiffSSTList.ClearEmptyEntries;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do
    if Items[i].RefCount <= 0 then Delete(i);
end;

{ TxlsSSTIndex }

constructor TxlsSSTIndex.Create(SSTList: TbiffSSTList);
begin
  inherited Create;
  FSSTList := SSTList;
  FSSTList.FSSTIndex := Self;
  FSorted := false;
end;

function TxlsSSTIndex.GetItems(Index: integer): TxlsSSTEntry;
begin
  Result := TxlsSSTEntry(inherited Items[Index]);
end;

procedure TxlsSSTIndex.SetItems(Index: integer; Value: TxlsSSTEntry);
begin
  inherited Items[Index] := Value;
end;

function TxlsSSTIndex.Add(Item: TxlsSSTEntry): integer;
begin
  Result := inherited Add(Item);
  FSorted := false;
end;

function TxlsSSTIndex.Find(Str: TxlsString; var Index: integer): boolean;
var
  L, H, I, C: integer;
begin
  if not FSorted  then Sort;
  Result := false;
  L := 0;
  H := Count - 1;
  while L <= H do begin
    I := (L + H) shr 1;
    C := Items[I].Value.Compare(Str);
    if C < 0 then
      L := I + 1
    else begin
      H := I - 1;
      if C = 0 then begin
        Result := true;
        L := I;
      end;
    end;
  end;
  if Result
    then Index := Items[L].Index
    else Index := L;
end;

procedure TxlsSSTIndex.Recreate;
var
  i: integer;
begin
  Clear;
  for i := 0 to FSSTList.Count - 1 do
    Add(FSSTList[i]);
  Sort;
end;

function CompareSSTEntries(Item1, Item2: Pointer): integer;
begin
  Result := TxlsSSTEntry(Item1).Value.Compare(TxlsSSTEntry(Item2).Value);
end;

procedure TxlsSSTIndex.Sort;
begin
  inherited Sort(CompareSSTEntries);
  FSorted := true;
end;

{ TxlsSection }

constructor TxlsSection.Create(Workbook: TxlsWorkbook);
begin
  inherited Create;
  FWorkbook := Workbook;
  FBOF := nil;
  FEOF := nil;
end;

destructor TxlsSection.Destroy;
begin
  if Assigned(FOnDestroy) then FOnDestroy(Self);
  Clear;
  inherited;
end;

procedure TxlsSection.Clear;
begin
  if Assigned(FBOF) then begin
    FBOF.Free;
    FBOF := nil;
  end;
  if Assigned(FEOF) then begin
    FEOF.Free;
    FEOF := nil;
  end;
end;

function TxlsSection.GetTotalSize: integer;
begin
  Result := BOF.TotalSize + EOF.TotalSize; 
end;

{ TxlsGlobals }

constructor TxlsGlobals.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FNameList := TbiffNameList.Create(Workbook);
  FWindow1 := nil;
  FOthers1 := TbiffRecordList.Create(Workbook);
  FFontList := TbiffFontList.Create(Workbook);
  FFormatList := TbiffFormatList.Create(Workbook);
  FXFList := TbiffXFList.Create(Workbook);
  FStyleList := TbiffStyleList.Create(Workbook);
  FSSTList := TbiffSSTList.Create(Workbook);
  FSSTIndex := TxlsSSTIndex.Create(FSSTList);
  FBoundSheetList := TbiffBoundSheetList.Create(Workbook);
  FOthers2 := TbiffRecordList.Create(Workbook);
end;

destructor TxlsGlobals.Destroy;
begin
  Clear;
  FNameList.Free;
  FOthers1.Free;
  FFontList.Free;
  FFormatList.Free;
  FXFList.Free;
  FStyleList.Free;
  FSSTList.Free;
  FSSTIndex.Free;
  FBoundSheetList.Free;
  FOthers2.Free;
  inherited;
end;

procedure TxlsGlobals.Clear;
begin
  inherited;
  if Assigned(FNameList) then FNameList.Clear;
  if Assigned(FOthers1) then FOthers1.Clear;
  if Assigned(FFontList) then FFontList.Clear;
  if Assigned(FFormatList) then FFormatList.Clear;
  if Assigned(FXFList) then FXFList.Clear;
  if Assigned(FStyleList) then FStyleList.Clear;
  if Assigned(FSSTList) then FSSTList.Clear;
  if Assigned(FSSTIndex) then FSSTIndex.Clear;
  if Assigned(FBoundSheetList) then FBoundSheetList.Clear;
  if Assigned(FOthers2) then FOthers2.Clear;
  FWindow1 := nil;
end;

procedure TxlsGlobals.Load(Stream: TStream; BOF: TbiffBOF);
var
  Header: TBIFF_Header;
  R: TbiffRecord;
begin
  Clear;
  repeat
    if (Stream.Read(Header, SizeOf(Header)) <> SizeOf(Header)) then
      raise ExlsFileError.Create(sExcelInvalid);

    R := LoadRecord(Self, Stream, Header);
    try
      //if (R is TbiffXF) and (FXF.Count = 0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FXF));
      //if (R is TFontRecord) and (FFonts.Count=0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FFonts));
      //if (R is TFormatRecord) and (FFormats.Count=0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FFormats));

      //if (R is TPaletteRecord) then FPaletteCache:=(R as TPaletteRecord);
      //if (R is TXFRecord) or (R is TStyleRecord) then FPaletteIndex:=FMiscRecords.Count; //After the last Style record

      case R.ID of
        BIFF_BOF       : raise ExlsFileError.Create(sExcelInvalid);
        //else if (R is TIgnoreRecord) then FreeAndNil(R)
        BIFF_BOUNDSHEET:
          if R is TbiffBoundSheet then
            FBoundSheetList.Add(R as TbiffBoundSheet);
        BIFF_NAME      :
          if R is TbiffName then FNameList.Add(R as TbiffName);
        BIFF_XF        :
          if R is TbiffXF then FXFList.Add(R as TbiffXF);
        //else if (R is TFontRecord) then FFonts.Add(R as TFontRecord)
        BIFF_FORMAT    :
          if R is TbiffFormat then FFormatList.Add(R as TbiffFormat);
        BIFF_EOF       :
          if R is TbiffEOF then EOF := R as TbiffEOF;
        BIFF_SST       :
          if R is TbiffSST then begin
            FSSTList.Load(R as TbiffSST);
            R.Free;
          end;
        //else if (R is TSupBookRecord) then FReferences.AddSupbook(R as TSupBookRecord)
        //else if (R is TExternSheetRecord) then begin; FReferences.AddExternRef(R as TExternSheetRecord); FreeAndNil(R);end
        //else if (R is TDrawingGroupRecord) then FDrawingGroup.LoadFromStream(DataStream, R as TDrawingGroupRecord)
        else if (R is TbiffWindow1) then begin
          FWindow1 := R as TbiffWindow1;
          FOthers1.Add(R);
        end

        else FOthers1.Add(R);
      end;
    except
      if Assigned(R) then R.Free;
      raise;
    end;

  until Header.ID = BIFF_EOF;

  Self.BOF := BOF;
end;

procedure TxlsGlobals.Save(Stream: TStream);
begin
  if not (Assigned(BOF) and Assigned(EOF)) then
    raise Exception.Create(sSectionNotLoaded);

  BOF.Save(Stream);
  FOthers1.Save(Stream);
  FFontList.Save(Stream);
  FFormatList.Save(Stream);
  FXFList.Save(Stream);
  FStyleList.Save(Stream);
  FBoundSheetList.Save(Stream);
  FOthers2.Save(Stream);
//  FReferences.SaveToStream(DataStream);
//  FNames.SaveToStream(DataStream); //Should be after FBoundSheets.SaveToStream
//  FDrawingGroup.SaveToStream(DataStream);
  FSSTList.Save(Stream);
  EOF.Save(Stream);
end;

function TxlsGlobals.GetTotalSize: integer;
begin
  Result:= inherited GetTotalSize +
    FOthers1.TotalSize +
    FFontList.TotalSize +
    FFormatList.TotalSize +
    FXFList.TotalSize +
    FStyleList.TotalSize +
    FBoundSheetList.TotalSize +
    FOthers2.TotalSize +
    FSSTList.TotalSize;
end;

{ TxlsChartSheet }

constructor TxlsChartSheet.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FRecordList := TbiffRecordList.Create(Workbook);
end;

destructor TxlsChartSheet.Destroy;
begin
  FRecordList.Free;
  inherited;
end;

procedure TxlsChartSheet.Load(Stream: TStream; BOF: TbiffBOF);
begin
// do nothing
end;

procedure TxlsChartSheet.Save(Stream: TStream);
var
  i: integer;
begin
  if not (Assigned(BOF) and Assigned(EOF)) then
    raise Exception.Create(sSectionNotLoaded);
  BOF.Save(Stream);
  for i := 0 to FRecordList.Count - 1 do
    FRecordList[i].Save(Stream);
  EOF.Save(Stream);
end;

{ TxlsChartSheetList }

function TxlsChartSheetList.GetItems(Index: integer): TxlsChartSheet;
begin
  Result := TxlsChartSheet(inherited Items[Index]);
end;

procedure TxlsChartSheetList.SetItems(Index: integer; Value: TxlsChartSheet);
begin
  inherited Items[Index] := Value;
end;

function TxlsChartSheetList.Add(Item: TxlsChartSheet): integer;
begin
  Result := inherited Add(Item);
end;

procedure TxlsChartSheetList.Insert(Index: integer; Item: TxlsChartSheet);
begin
  inherited Insert(Index, Item);
end;

procedure TxlsChartSheetList.Save(Stream: TStream);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Save(Stream);
end;

function TxlsChartSheetList.GetTotalSize: integer;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to Count - 1 do
    Inc(Result, Items[i].TotalSize);
end;

{ TxlsWorkSheet }

constructor TxlsWorkSheet.Create(Workbook: TxlsWorkbook);
begin
  inherited;
  FIndex := -1;
  FWindow2 := nil;

  FRows := TxlsRowList.Create(Workbook);
  FCols := TxlsColList.Create(Workbook);
  FColInfoList := TxlsColInfoList.Create(Workbook);
  FOthers1 := TbiffRecordList.Create(Workbook);
  FOthers2 := TbiffRecordList.Create(Workbook);
  FHLinks := TbiffRecordList.Create(Workbook);
  FOthers3 := TbiffRecordList.Create(Workbook);
  FCharts := TxlsChartSheetList.Create(Workbook);

  FDefRowHeight := $FF;
  FDefColWidth  := $08;

  FDimensions := nil;
end;

destructor TxlsWorkSheet.Destroy;
begin
  FRows.Free;
  FCols.Free;
  FColInfoList.Free;
  FOthers1.Free;
  FOthers2.Free;
  FHLinks.Free;
  FOthers3.Free;
  FCharts.Free;
  inherited;
end;

procedure TxlsWorkSheet.Clear;
begin
  if Assigned(FRows) then FRows.Clear;
  if Assigned(FCols) then FCols.Clear;
  if Assigned(FColInfoList) then FColInfoList.Clear;
  if Assigned(FOthers1) then FOthers1.Clear;
  if Assigned(FOthers2) then FOthers2.Clear;
  if Assigned(FHLinks) then FHLinks.Clear;
  if Assigned(FOthers3) then FOthers3.Clear;
  if Assigned(FCharts) then FCharts.Clear;
  FDimensions := nil;
  inherited;
end;

procedure TxlsWorkSheet.Load(Stream: TStream; BOF: TbiffBOF);
var
  Header: TBIFF_Header;
  R: TbiffRecord;
  Others: TbiffRecordList;
  FShrFmlaList: TbiffShrFmlaList;
  FLastFormula: TbiffFormula;
begin
  Clear;
  Others :=FOthers1;
  FShrFmlaList := TbiffShrFmlaList.Create(nil);
  FLastFormula := nil;
  try
    repeat
      if (Stream.Read(Header, SizeOf(Header)) <> SizeOf(Header)) then
        raise ExlsFileError.Create(sExcelInvalid);

      R := LoadRecord(Self, Stream, Header);
      try
        if Header.ID = BIFF_WINDOW2 then begin
          Others := FOthers2;
          FWindow2 := R as TbiffWindow2;
        end;
        if (R is TbiffFormula) then
          FLastFormula := R as TbiffFormula;

        if (R is TbiffDefColWidth) then
          FDefColWidth := (R as TbiffDefColWidth).Width;
        if (R is TbiffDefRowHeight) then
          FDefRowHeight := (R as TbiffDefRowHeight).Height;

        if (R is TbiffBOF) then
          raise ExlsFileError.Create(sExcelInvalid)
        //else if (R is TDrawingRecord) then FDrawing.LoadFromStream(DataStream, R as TDrawingRecord, SST)
        //else if (R is TIgnoreRecord) then FreeAndNil(R)
        //else if (R is TNoteRecord) then FNotes.AddRecord(R as TNoteRecord, (R as TNoteRecord).Row)
        else if (R is TbiffColInfo) then
          FColInfoList.AddRecord(R as TbiffColInfo)
        else if (R is TbiffCell) then
          AddCell(R as TbiffCell)
        else if (R is TbiffMultiple) then begin
          AddMultiple(R as TbiffMultiple);
          R.Free;
          R := nil;
        end
        //else if (R is TRowRecord) then FCells.AddRow(R as TRowRecord)
        //else if (R is TCondFmtRecord) then FRanges[FRanges.Add(TCondFmt.Create)].LoadFromStream(DataStream, R as TCondFmtRecord)
        //else if (R is TCellMergingRecord) then FRanges[FRanges.Add(TMergedCells.Create)].LoadFromStream(DataStream, R as TCellMergingRecord)
        else if (R is TbiffShrFmla) then FShrFmlaList.Add(R as TbiffShrFmla)
        //else if (R is THPageBreakRecord) then FPageBreaks.AddRecord(R as THPageBreakRecord)
        else if (R is TbiffString) then begin
          if not Assigned(FLastFormula) then
            raise ExlsFileError.Create(sExcelInvalid)
          else FLastFormula.Value := (R as TbiffString).Value;
          R.Free;
          R := nil;
        end
        else if (R is TbiffEOF) then EOF := (R as TbiffEOF)
        else Others.Add(R) ;

      except
        if Assigned(R) then R.Free;
        raise;
      end;

    until Header.ID = BIFF_EOF;

    //FNotes.FixDwgIds(FDrawing);
    //FCells.CellMatrix.FixFormulas(FShrFmlaList);
  finally
    FShrFmlaList.Free;
  end;

  Self.BOF := BOF;
end;

procedure TxlsWorkSheet.Save(Stream: TStream);
var
  i{, j}: integer;
begin
  if not (Assigned(BOF) and Assigned(EOF)) then
    raise Exception.Create(sSectionNotLoaded);
  BOF.Save(Stream);
  FOthers1.Save(Stream);
//  FPageBreaks.SaveToStream(DataStream);
  FColInfoList.Save(Stream);
  FixDimensions;
  FDimensions.Save(Stream);
  for i := 0 to Rows.Count - 1 do
    Rows[i].Save(Stream);
//  FDrawing.SaveToStream(DataStream);
//  FNotes.SaveToStream(DataStream);
  FOthers2.Save(Stream);
  FHLinks.Save(Stream);
  FOthers3.Save(Stream);
//  FCharts.Save(Stream);
//  FRanges.SaveToStream(DataStream);
  EOF.Save(Stream);
end;

procedure TxlsWorkSheet.AddMultiple(Multiple: TbiffMultiple);
var
  Cell: TbiffCell;
begin
  while not Multiple.EOF do begin
    Cell := Multiple.Cell;
    AddCell(Cell);
  end;
end;

procedure TxlsWorkSheet.AddCell(Cell: TbiffCell);
var
  i: integer;
begin
  for i := FRows.Count to Cell.Row do
    FRows.Add(TxlsRow.Create(FWorkbook));
  FRows[Cell.Row].Add(Cell);
  for i := FCols.Count to Cell.Col do
    FCols.Add(TxlsCol.Create(FWorkbook));
  FCols[Cell.Col].Add(Cell);
end;

function TxlsWorkSheet.GetRowCount: integer;
begin
  Result := FRows.Count;
end;

function TxlsWorkSheet.GetColCount: integer;
begin
  Result := FCols.Count;
end;

function TxlsWorkSheet.GetCells(Row, Col: integer): TbiffCell;
var
  Index: integer;
begin
  Result := nil;

  if (Row < 0) or (Row > MAX_ROW_COUNT) then
    raise ExlsFileError.CreateFmt(sInvalidRow, [Row]);
  if (Col < 0) or (Col > MAX_COL_COUNT) then
    raise ExlsFileError.CreateFmt(sInvalidCol, [Col]);

  if (Row >= GetRowCount) or (Col >= GetColCount) then Exit;

  if FRows[Row].Find(Col, Index) then
    Result := FRows[Row][Index];
end;

procedure TxlsWorkSheet.FixDimensions;
begin
  if not Assigned(FDimensions) then Exit;
  with FDimensions do begin
    if Rows.Count > 0 then begin
      FirstRow := Rows[0].RowNumber;
      LastRow := Rows[Rows.Count - 1].RowNumber + 1;
    end
    else begin
      FirstRow := 0;
      LastRow := 0;
    end;
    if Cols.Count > 0 then begin
      FirstCol := Cols[0].ColNumber;
      LastCol := Cols[Cols.Count - 1].ColNumber + 1;
    end
    else begin
      FirstCol := 0;
      LastCol := 0;
    end;
    Reserved := 0;
  end;
end;

function TxlsWorkSheet.GetTotalSize: integer;
begin
  Result := inherited GetTotalSize +
    FOthers1.TotalSize +
    FColInfoList.TotalSize +
    SizeOf(TBIFF_DIMENSIONS) + SizeOf(TBIFF_Header) +
    FRows.TotalSize +
    FOthers2.TotalSize +
    FHLinks.TotalSize +
    FOthers3.TotalSize {+
    FCharts.TotalSize};
end;

function TxlsWorkSheet.GetName: WideString;
begin
  Result := Workbook.Globals.BoundSheetList[FIndex].Name;
end;

{ TxlsWorkSheetList }

function TxlsWorkSheetList.GetItems(Index: integer): TxlsWorkSheet;
begin
  Result := TxlsWorkSheet(inherited Items[Index]);
end;

procedure TxlsWorkSheetList.SetItems(Index: integer; Value: TxlsWorkSheet);
begin
  inherited Items[Index] := Value;
end;

function TxlsWorkSheetList.Add(Item: TxlsWorkSheet): integer;
begin
  Result := inherited Add(Item);
  Items[Result].OnDestroy := OnDestroyItem;
end;

procedure TxlsWorkSheetList.Insert(Index: integer; Item: TxlsWorkSheet);
begin
  inherited Insert(Index, Item);
end;

function TxlsWorkSheetList.IndexOfName(const Name: WideString): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiStrIComp(PChar(PWideChar(Name)), PChar(PWideChar(Items[i].Name))) = 0 then begin
      Result := i;
      Break;
    end;
end;

procedure TxlsWorkSheetList.OnDestroyItem(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    if Items[i] = Sender then begin
      Remove(Items[i]);
      Break;
    end;
end;

procedure TxlsWorkSheetList.Save(Stream: TStream);
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Save(Stream);
end;

{ TxlsWorkbook }

constructor TxlsWorkbook.Create(ExcelFile: TxlsFile);
begin
  inherited Create;
  FExcelFile := ExcelFile;
  FGlobals := TxlsGlobals.Create(Self);
//  FSheets := TxlsSheetList.Create(Self);
  FWorkSheets := TxlsWorkSheetList.Create(Self);
end;

destructor TxlsWorkbook.Destroy;
begin
//  FSheets.Free;
  FWorkSheets.Free;
  FGlobals.Free;
  inherited;
end;

procedure TxlsWorkbook.Load(Stream: TStream);
var
  Header: TBIFF_Header;
  R: TbiffRecord;
  WorkSheet: TxlsWorkSheet;
begin
  FWorkSheets.Clear;
  FGlobals.Clear;
  Stream.Seek(soFromBeginning, 0);
  while (Stream.Read(Header, SizeOf(Header)) = SizeOf(Header)) and
        ((Header.ID <> BIFF_EOF) and (Header.ID <> 0)) do begin

    R := LoadRecord(FGlobals, Stream, Header);
    if Header.ID = BIFF_BOF then
      case (R as TbiffBOF).DataType of
        BIFF_BOF_GLOBALS  :
          FGlobals.Load(Stream, R as TbiffBOF{, FGlobals.SSTList});
        BIFF_BOF_WORKSHEET: begin
          WorkSheet := TxlsWorkSheet.Create(Self);
          WorkSheet.Load(Stream, R as TbiffBOF);
          //FSheets[FSheets.Add(WorkSheet)].Load(Stream, R as TbiffBOF);
          FWorkSheets.Add(WorkSheet);
        end;
        BIFF_BOF_CHART: begin
        end;
        //xlb_Chart     : FSheets[FSheets.Add(TChart.Create(Globals))].LoadFromStream(DataStream, R as TBOFRecord, Globals.SST) ;
        else raise ExlsFileError.Create(sExcelInvalid);
      end
    else raise ExlsFileError.Create(sExcelInvalid);
  end;
  FGlobals.SSTIndex.Sort;
end;

procedure TxlsWorkbook.Save(Stream: TStream);
begin
  FixBoundSheetOffsets;
  FGlobals.Save(Stream);
  FWorkSheets.Save(Stream);
end;

procedure TxlsWorkbook.Clear;
begin
  FGlobals.Clear;
  //FSheets.Clear;
  FWorkSheets.Clear;
end;

procedure TxlsWorkbook.FixBoundSheetOffsets;
var
  i: integer;
  Offset: integer;
begin
  Globals.SSTList.ClearEmptyEntries;
  Offset := Globals.TotalSize;  //Includes the EOF on workbook Globals
  if Globals.BoundSheetList.Count <> WorkSheets.Count then
    raise Exception.Create(sExcelInvalid);
  for i := 0 to Globals.BoundSheetList.Count - 1 do begin
    Globals.BoundSheetList[i].BOFPos := Offset;
    Offset := Offset + (WorkSheets[i].TotalSize);
  end;
end;

{ TOle2Stream }

{constructor TOle2Stream.Create(Ole2Stream: IStream);
begin
  inherited Create;
  FOle2Stream := Ole2Stream;
end;

function TOle2Stream.Write(const Buffer; Count: longint): longint;
begin
  Result := 0;
  if Assigned(FOle2Stream) then begin
    FOle2Stream.Write(@Buffer, Count, @Count);
    Result := Count;
  end;
end;

function TOle2Stream.Seek(Offset: Longint; Origin: Word): Longint;
var
  NewPos: largeint;
begin
  Result := 0;
  if Assigned(FOle2Stream) then begin
    FOle2Stream.Seek(Offset, Origin, NewPos);
    Result := NewPos;
  end;
end;}

{ TxlsFile }

constructor TxlsFile.Create;
begin
  inherited;
  FWorkbook := TxlsWorkbook.Create(Self);
  FLoaded := false;
  FLoading := false;
end;

destructor TxlsFile.Destroy;
begin
  FWorkbook.Free;
  inherited;
end;

procedure TxlsFile.Clear;
begin
  FWorkbook.Clear;
  FLoaded := false;
end;

procedure TxlsFile.Load;
begin
  FLoading := true;
  try
    Open(true);
    try
      FWorkbook.Load(FStream);
      FLoaded := true;
    finally
      Close;
    end;
  finally
    FLoading := false;
  end;
end;

procedure TxlsFile.Save;
begin
  Open(false);
  try
    FWorkbook.Save(FStream);
    FLoaded := true;
  finally
    Close;
  end;
end;

procedure TxlsFile.Open(ReadOnly: boolean);
var
  WC: PWideChar;
begin
  if FFileName = EmptyStr then
    raise ExlsFileError.Create(sFileNameNotDefined);
  if ReadOnly and not FileExists(FFileName) then
    raise ExlsFileError.Create(Format(sFileDoesNotExist, [FFileName]));
  GetMem(WC, 512);
  try
    StringToWideChar(FFileName, WC, 512);
    if ReadOnly then begin
      if StgIsStorageFile(WC) = S_OK then
        FStream := OpenStream;
    end
    else FStream := CreateXLSStream(FileName, FStorage, FOleStream);
  finally
    FreeMem(WC);
  end;
end;

function TxlsFile.OpenStream: TStream;
const
  ReadStorageOptions = STGM_DIRECT or STGM_SHARE_EXCLUSIVE or STGM_READ;
var
  WC: PWideChar;
  IsWorkbook: boolean;
  Enum: IEnumStatStg;
  Stat: TSTATSTG;
  InputStream: TOleStream;
begin
  Result := nil;
  GetMem(WC, 512);
  try
    StringToWideChar(FFileName, WC, 512);
    IsWorkBook := false;
    OleCheck(StgOpenStorage(WC, nil, STGM_READ or STGM_SHARE_DENY_WRITE,
                            nil, 0, FStorage));
    OleCheck(FStorage.EnumElements(0, nil, 0, Enum));

    while Enum.Next(1, Stat, nil) = S_OK do begin
      IsWorkbook := Stat.pwcsName = 'Workbook';
      if IsWorkbook then begin

        OleCheck(FStorage.OpenStream('Workbook', nil, ReadStoraGEoPTIONS, 0,
          FOleStream));
        //if not Assigned(FStream) then
        Result := TMemoryStream.Create;
        InputStream := TOleStream.Create(FOleStream);
        try
          Result.CopyFrom(InputStream, InputStream.Size);
        finally
          InputStream.Free;
        end;
        Break;
      end;
    end;

    if not IsWorkBook then
      raise ExlsFileError.CreateFmt(sFileIsNotExcelWorkbook, [FFileName]);
  finally
    FreeMem(WC);
  end;
end;

{function TxlsFile.CreateStream(const FileName: string): TStream;
var
  WC: PWideChar;
begin
  GetMem(WC, 512);
  try
    WC := StringToWideChar(FileName, WC, 512);
    OleCheck(StgCreateDocfile(WC,
             STGM_DIRECT or STGM_READWRITE or STGM_CREATE or
             STGM_SHARE_EXCLUSIVE, 0, FStorage));
  finally
    FreeMem(WC);
  end;
  OleCheck(FStorage.CreateStream('Workbook',
                                 STGM_DIRECT or STGM_READWRITE or STGM_CREATE or
                                 STGM_SHARE_EXCLUSIVE, 0, 0, FOleStream));
  Result := TOleStream.Create(FOleStream);
end;}

procedure TxlsFile.Close;
begin
  if Assigned(FStream) then begin
    FStream.Free;
    FStream := nil;
  end;
end;

end.

