unit QExport3;

{$IFDEF WIN32}
  {$R QEResStr.res}
  {$R QEEULA.res}
{$ENDIF}

{$I VerCtrl.inc}

{$IFDEF VCL6}
  {$WARN UNIT_PLATFORM OFF}
{$ENDIF}

interface

uses Classes, DB, IniFiles, QExport3Types, QExport3CustomSource
     {$IFNDEF NOGUI}
       {$IFDEF WIN32}, Graphics, ComCtrls, DbGrids, Grids{$ENDIF}
       {$IFDEF LINUX}, QGraphics, QComCtrls, QDBGrids, QGrids, QForms{$ENDIF}
     {$ELSE}, QExport3Graphics{$ENDIF};

type
  TQExportRow = class;
  TQExport3 = class;

  TNormalFunc = function(const Str: string): string of object;
  TSpecialCharacters = set of char;
  TQExportSource = (esDataSet, esListView, esDBGrid, esStringGrid, esCustom);
  TQExportColAlign = (ecaLeft, ecaCenter, ecaRight);
  TQExportPageOrientation = (poPortrait, poLandscape);
  TQExportUnits = (unInch, unMillimeter, unDot);
  TQExportPageFormat = (pfLetter, pfLegal, pfA3, pfA4, pfA5, pfB5_JIS,
    pfUS_Std_Fanfold, pfFanfold, pfUser);

  TExportedRecordEvent = procedure(Sender: TObject; RecNo: integer) of object;
  TGetExportTextEvent = procedure(Sender: TObject; ColNo: integer;
    var Text: WideString) of object;
  TGetCellParamsEvent = procedure(Sender: TObject; RecNo, ColNo: integer;
    const Value: string; var Align: TQExportColAlign; AFont: TFont;
    var Background: TColor) of object;
  TQExportStopEvent = procedure(Sender: TObject;
    var CanContinue: boolean) of object;
  TBeforeExportRowEvent = procedure(Sender: TObject; Row: TQExportRow;
    var Accept: boolean) of object;

{$IFDEF WIN32}
  TLocalizeEvent = procedure(StringID: Integer; var ResultString: string) of object;

  TQExportLocale = class(TObject)
  private
    FDllHandle: Cardinal;
    FLoaded: Boolean;
    FOnLocalize: TLocalizeEvent;
    FIDEMode: Boolean;
  public
    constructor Create;
    function LoadStr(ID: Integer): string;
    procedure LoadDll(const Name: string);
    procedure UnloadDll;
    property OnLocalize: TLocalizeEvent read FOnLocalize write FOnLocalize;
  end;
{$ENDIF}

  TQExportFormats = class(TPersistent)
  private
    FIntegerFormat: string;
    FFloatFormat : string;
    FDateFormat: string;
    FTimeFormat: string;
    FDateTimeFormat: string;
    FCurrencyFormat: string;
    FBooleanTrue: string;
    FBooleanFalse: string;
    FNullString: string;

    procedure SetIntegerFormat(const Value: string);
    procedure SetFloatFormat(const Value: string);
    procedure SetDateFormat(const Value: string);
    procedure SetTimeFormat(const Value: string);
    procedure SetDateTimeFormat(const Value: string);
    procedure SetCurrencyFormat(const Value: string);
    procedure SetBooleanTrue(const Value: string);
    procedure SetBooleanFalse(const Value: string);

    function IsIntegerFormatStored: boolean;
    function IsFloatFormatStored: boolean;
    function IsDateFormatStored: boolean;
    function IsTimeFormatStored: boolean;
    function IsDateTimeFormatStored: boolean;
    function IsCurrencyFormatStored: boolean;
    function IsBooleanTrueStored: boolean;
    function IsBooleanFalseStored: boolean;

    procedure SetNullString(const Value: string);
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure ResetFormats;
  published
    property IntegerFormat: string read FIntegerFormat
      write SetIntegerFormat stored IsIntegerFormatStored;
    property FloatFormat: string read FFloatFormat
      write SetFloatFormat stored IsFloatFormatStored;
    property DateFormat: string read FDateFormat
      write SetDateFormat stored IsDateFormatStored;
    property TimeFormat: string read FTimeFormat
      write SetTimeFormat stored IsTimeFormatStored;
    property DateTimeFormat: string read FDateTimeFormat
      write SetDateTimeFormat stored IsDateTimeFormatStored;
    property CurrencyFormat: string read FCurrencyFormat
      write SetCurrencyFormat stored IsCurrencyFormatStored;
    property BooleanTrue: string read FBooleanTrue
      write SetBooleanTrue  stored IsBooleanTrueStored;
    property BooleanFalse: string read FBooleanFalse
      write SetBooleanFalse stored IsBooleanFalseStored;
    property NullString: string read FNullString write SetNullString;
  end;

  TQExportColumns = class;

  TQExportColumn = class(TCollectionItem)
  private
    FColumns: TQExportColumns;
    FNumber: integer;
    FColType: TQExportColType;
    FName: string;
    FCaption: string;
    FWidth: integer;
    FColAlign: TQExportColAlign;
    FFormat: string;
    FSQLType: string;
    FLength: integer;
    FTag: integer;

    FAllowFormat: boolean;
    FIsNumeric: boolean;
    FIsString: boolean;
    FIsBlob: boolean;
    FIsMemo: boolean;
    FIsVisible: boolean;
    FIsExported: boolean;

    function GetIsDefaultFormat: boolean;
  public
    constructor Create(Collection: TCollection); override;
    procedure SetDefaultFormat;
    function GetDefaultFormat: string;

    property Columns: TQExportColumns read FColumns;

    property Number: integer read FNumber write FNumber;
    property Name: string read FName write FName;
    property Caption: string read FCaption write FCaption;
    property Width: integer read FWidth write FWidth;
    property ColType: TQExportColType read FColType write FColType;
    property ColAlign: TQExportColAlign read FColAlign write FColAlign;
    property Format: string read FFormat write FFormat;
    property SQLType: string read FSQLType write FSQLType;
    property Length: integer read FLength write FLength;
    property Tag: integer read FTag write FTag;

    property AllowFormat: boolean read FAllowFormat;
    property IsNumeric: boolean read FIsNumeric;
    property IsString: boolean read FIsString;
    property IsBlob: boolean read FIsBlob;
    property IsMemo: boolean read FIsMemo;
    property IsVisible: boolean read FIsVisible;
    property IsDefaultFormat: boolean read GetIsDefaultFormat;

    property IsExported: boolean read FIsExported write FIsExported;
  end;

  TQExportColumns = class(TCollection)
  private
    FHolder: TPersistent;
    FNormalFunc: TNormalFunc;
    FRecordCounter: integer;

    FOwnerExportedFields: TStrings;
    FOwnerExportSource: TQExportSource;
    FOwnerDataSet: TDataSet;
    FOwnerCustomSource: TqeCustomSource;
    {$IFNDEF NOGUI}
    FOwnerListView: TListView;
    FOwnerDBGrid: TDBGrid;
    FOwnerStringGrid: TStringGrid;
    {$ENDIF}
    FOwnerOnlyVisibleFields: boolean;
    FOwnerFormats: TQExportFormats;
    FOwnerAutoCalcStrType: boolean;
    FOwnerUserFormats: TStrings;
    FOwnerColumnsWidth: TStrings;
    FOwnerCaptions: TStrings;
    FOwnerColumnsAlign: TStrings;
    FOwnerSkipRecCount: integer;
    FOwnerExportRecCount: integer;
    FOwnerColumnsLength: TStrings;
    FOwnerCaptionRow: integer;

    FOwnerOnFetchedRecord: TExportedRecordEvent;

    function GetColumn(Index: integer): TQExportColumn;
    procedure SetColumn(Index: integer; Value: TQExportColumn);

    procedure LoadOwnerProperties;

    function SetColumnNumber(Index: integer; BLOB: boolean): integer;
    procedure SetColumnName(Index: integer);
    procedure SetColumnType(Index: integer);
    procedure SetColumnFormat(Index: integer);
    procedure SetColumnWidth(Index: integer);
    procedure SetColumnCaption(Index: integer);
    procedure SetColumnAlign(Index: integer);
    procedure SetColumnLength(Index: integer);
    procedure SetColumnSQLType(Index: integer);

    procedure SetColumnAllowFormat(Index: integer);
    procedure SetColumnIsNumeric(Index: integer);
    procedure SetColumnIsString(Index: integer);
    procedure SetColumnIsBlob(Index: integer);
    procedure SetColumnIsMemo(Index: integer);
    procedure SetColumnIsVisible(Index: integer);
  public
    constructor Create(Holder: TPersistent; NormalFunc: TNormalFunc);

    function Add: TQExportColumn;
    procedure Fill(BLOB: boolean);
    procedure AutoCalcColWidth;
    function IndexOfName(const AName: string): integer;
    procedure EmptyTags;
    function GetColumnIsNull(Index: integer): boolean;
    function ContainsBLOB: boolean;
    function ContainsMEMO: boolean;

    property Holder: TPersistent read FHolder;
    property Items[Index: integer]: TQExportColumn read GetColumn
      write SetColumn; default;
  end;

  TQExportWriter = class
  private
    FStream: TStream;
    FOwner: TComponent;
  protected
    property Owner: TComponent read FOwner;
  public
    constructor Create(AOwner: TQExport3; AStream: TStream); virtual;

    procedure Write(const S: string);
    procedure WriteLn(const S: string);
    procedure EmptyLine;
    procedure CharLine(Chr: char; Count: integer);
    function PadL(const S: string; Chr: char; Count: integer): string;
    function PadR(const S: string; Chr: char; Count: integer): string;
    function PadC(const S: string; Chr: char; Count: integer): string;
    function AlignToStr(Value: TQExportColAlign): string; virtual;

    property Stream: TStream read FStream write FStream;
  end;

  TQExportCol = class;

  TQExportWriterClass = class of TQExportWriter;
  TQExportGetColData = function(ExportCol: TQExportCol): string of object;

  TQExportCol = class
  private
    FName: string;
    FValue: string;
    FColumnIndex: integer;
    FRow: TQExportRow;
  public
    constructor Create(Row: TQExportRow);
    function GetExportedValue(NeedFormat: boolean): string;
    property Row: TQExportRow read FRow;

    property ColumnIndex: integer read FColumnIndex;
    property Name: string read FName;
    property Value: string read FValue write FValue;
  end;

  TQExportRow = class(TList)
  private
    FIndex: TStringList;
    FColumns: TQExportColumns;
    FFormats: TQExportFormats;
    FGetColData: TQExportGetColData;


    function Get(Index: Integer): TQExportCol;
    procedure Put(Index: Integer; const Value: TQExportCol);
  public
    constructor Create(Columns: TQExportColumns; Formats: TQExportFormats;
      GetColData: TQExportGetColData);
    destructor Destroy; override;
    function Add(const AName: string; AColumnIndex: integer): TQExportCol;
    procedure Clear; {$IFNDEF VCL3}override;{$ENDIF}
    procedure Delete(Index: integer);
    function First: TQExportCol;
    procedure Insert(Index: Integer; Item: TQExportCol);
    procedure SetValue(const AName, AValue: string);
    procedure ClearValues;
    function Last: TQExportCol;
    function IndexOf(Item: TQExportCol): integer;
    function Remove(Item: TQExportCol): integer;
    function ColByName(const AName: string): TQExportCol;
    property Index: TStringList read FIndex;

    property Columns: TQExportColumns read FColumns;
    property Formats: TQExportFormats read FFormats;
    property GetColData: TQExportGetColData read FGetColData write FGetColData;
    property Items[Index: Integer]: TQExportCol read Get write Put; default;
  end;

  TQExport3 = class(TComponent)
  private
    FRecordCounter: integer;
    FColumns: TQExportColumns;
    FExportRow: TQExportRow;

    FExportSource: TQExportSource;

    FDataSet: TDataSet;
    FCustomSource: TqeCustomSource;
    {$IFNDEF NOGUI}
    FDBGrid: TDBGrid;
    FListView: TListView;
    FStringGrid: TStringGrid;
    {$ENDIF}
    FExportedFields: TStrings;

    FTitle: string;
    FHeader: TStrings;
    FCaptions: TStrings;
    FAllowCaptions: boolean;
    FFooter: TStrings;
    FFormats: TQExportFormats;
    FUserFormats: TStrings;
    FColumnsWidth: TStrings;
    FColumnsAlign: TStrings;
    FColumnsLength: TStrings;

    FCurrentRecordOnly: boolean;
    FGoToFirstRecord: boolean;
    FExportRecCount: integer;
    FSkipRecCount: integer;
    FOnlyVisibleFields: boolean;
    FAutoCalcStrType: boolean;
    FAutoCalcColWidth: boolean;
    FCaptionRow: integer;
    FExportEmpty: boolean;

    FAborted: boolean;

    F_Version: string;
    FAbout: string;

    FOnBeginExport: TNotifyEvent;
    FOnFetchedRecord: TExportedRecordEvent;
    FOnSkippedRecord: TExportedRecordEvent;
    FOnExportedRecord: TExportedRecordEvent;
    FOnStopExport: TQExportStopEvent;
    FOnGetExportText: TGetExportTextEvent;
    FOnGetCellParams: TGetCellParamsEvent;
    FOnEndExport: TNotifyEvent;
    FOnBeforeExportRow: TBeforeExportRowEvent;

    procedure SetExportedFields(const Value: TStrings);

    procedure SetCaptions(const Value: TStrings);
    procedure SetFooter(const Value: TStrings);
    procedure SetHeader(const Value: TStrings);
    procedure SetUserFormats(const Value: TStrings);
    procedure SetFormats(const Value: TQExportFormats);
    procedure SetColumnsWidth(const Value: TStrings);
    procedure SetColumnsAlign(const Value: TStrings);
    procedure SetColumnsLength(const Value: TStrings);

    procedure CheckExportSource;
  protected
    FWriter: TQExportWriter;

    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

    function GetWriterClass: TQExportWriterClass; virtual;
    function GetWriter: TQExportWriter;

    procedure DisableControls;
    procedure BeginExport; virtual;
    procedure BeforeExport; virtual;
    procedure DoExport;
    procedure AfterExport; virtual;
    procedure EndExport; virtual;
    procedure EnableControls;

    procedure First;
    procedure Next;
    procedure Skip(Count: integer);
    function  EndOfFile: boolean; virtual;

    function GetBookmark: TBookmark;
    procedure GoToBookmark(Bookmark: TBookmark);
    procedure FreeBookmark(Bookmark: TBookmark);

    function IsEmpty: boolean;
    function IsActive: boolean;

    function GetCaptionRow: string; virtual;
    procedure WriteCaptionRow; virtual;
    procedure FillExportRow; virtual;
    function GetDataRow(NeedFormat: boolean): string; virtual;
    procedure WriteDataRow; virtual;

    function GetColCaption(Index: integer): string; virtual;
    function GetColData(ExportCol: TQExportCol): string; virtual;

    function GetSpecialCharacters: TSpecialCharacters; virtual;

    procedure SaveProperties(IniFile: TIniFile); virtual;
    procedure LoadProperties(IniFile: TIniFile); virtual;

    procedure GetCellParams(RecNo, ColNo: integer; const Value: string;
      var Align: TQExportColAlign; AFont: TFont;
      var Background: TColor); dynamic;
    function CanContinue: boolean;
  protected
    property RecordCounter: integer read FRecordCounter write FRecordCounter;
    property Columns: TQExportColumns read FColumns write FColumns;
    property ExportRow: TQExportRow read FExportRow;
  protected
    property Title: string read FTitle write FTitle;
    property AllowCaptions: boolean read FAllowCaptions
      write FAllowCaptions default true;
    property AutoCalcColWidth: boolean read FAutoCalcColWidth
      write FAutoCalcColWidth default false;
    property ColumnsWidth: TStrings read FColumnsWidth write SetColumnsWidth;
    property ColumnsAlign: TStrings read FColumnsAlign write SetColumnsAlign;
    property ColumnsLength: TStrings read FColumnsLength write SetColumnsLength;

    property OnGetCellParams: TGetCellParamsEvent read FOnGetCellParams
      write FOnGetCellParams;
    property OnFetchedRecord: TExportedRecordEvent read FOnFetchedRecord
      write FOnFetchedRecord;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Execute; virtual;
    procedure ExportToStream(AStream: TStream);
    procedure Abort; virtual;
    function NormalString(const S: string): string; virtual;

    procedure SavePropertiesToFile(const FileName: string);
    procedure LoadPropertiesFromFile(const FileName: string);

    property Aborted: boolean read FAborted write FAborted;

    property Header: TStrings read FHeader write SetHeader;
    property Captions: TStrings read FCaptions write SetCaptions;
    property Footer: TStrings read FFooter write SetFooter;
    property Formats: TQExportFormats read FFormats write SetFormats;
    property UserFormats: TStrings read FUserFormats write SetUserFormats;
  published
    property ExportSource: TQExportSource read FExportSource
      write FExportSource default esDataSet;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property CustomSource: TqeCustomSource read FCustomSource
      write FCustomSource; 
    {$IFNDEF NOGUI}
    property ListView: TListView read FListView write FListView;
    property DBGrid: TDBGrid read FDBGrid write FDBGrid;
    property StringGrid: TStringGrid read FStringGrid write FStringGrid;
    {$ENDIF}
    property ExportedFields: TStrings read FExportedFields
      write SetExportedFields;

    property CurrentRecordOnly: boolean read FCurrentRecordOnly
      write FCurrentRecordOnly default false;
    property GoToFirstRecord: boolean read FGoToFirstRecord
      write FGoToFirstRecord default true;
    property ExportRecCount: integer read FExportRecCount
      write FExportRecCount default 0;
    property SkipRecCount: integer read FSkipRecCount
      write FSkipRecCount default 0;
    property OnlyVisibleFields: boolean read FOnlyVisibleFields
      write FOnlyVisibleFields default false;
    property AutoCalcStrType: boolean read FAutoCalcStrType
      write FAutoCalcStrType default false;
    property CaptionRow: integer read FCaptionRow write FCaptionRow default -1;
    property ExportEmpty: boolean read FExportEmpty
      write FExportEmpty default true;

    property About: string read FAbout write FAbout;
    property _Version: string read F_Version write F_Version;

    property OnBeginExport: TNotifyEvent read FOnBeginExport
      write FOnBeginExport;
    property OnEndExport: TNotifyEvent read FOnEndExport write FOnEndExport;
    property OnSkippedRecord: TExportedRecordEvent read FOnSkippedRecord
      write FOnSkippedRecord;
    property OnExportedRecord: TExportedRecordEvent read FOnExportedRecord
      write FOnExportedRecord;
    property OnStopExport: TQExportStopEvent read FOnStopExport
      write FOnStopExport;
    property OnGetExportText: TGetExportTextEvent read FOnGetExportText
      write FOnGetExportText;
    property OnBeforeExportRow: TBeforeExportRowEvent read FOnBeforeExportRow
      write FOnBeforeExportRow; 
  end;

  TQExport3Text = class(TQExport3)
  private
    FFileName: string;
    {$IFDEF WIN32}
    FShowFile: boolean;
    FPrintFile: boolean;
    {$ENDIF}
  protected
    procedure ShowResult; virtual;
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;
    function GetShowedFileName: string; virtual;
    function GetPrintedFileName: string; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Execute; override;
  published
    property FileName: string read FFileName write FFileName;
    {$IFDEF WIN32}
    property ShowFile: boolean read FShowFile write FShowFile default false;
    property PrintFile: boolean read FPrintFile write FPrintFile default false;
    {$ENDIF}
  end;

  TQExport3AdvancedText = class(TQExport3Text)
  protected
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;
  published
    property Header;
    property Footer;
  end;

  TQExport3FormatTextSQL = class(TQExport3AdvancedText)
  protected
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;
  published
    property Formats;
    property UserFormats;
  end;

  TQExport3FormatText = class(TQExport3AdvancedText)
  protected
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;
  published
    property AllowCaptions;
    property Captions;
    property Formats;
    property UserFormats;
  end;

  TQExport3Memory = class(TQExport3)
  public
    {$IFNDEF NOGUI}
    procedure Execute; override;
    {$ENDIF}
  end;

function DataType2QExportColType(Field: TField): TQExportColType;
function DataType2SQLType(Field: TField): string;
function QExportType2SQLType(Column: TQExportColumn): string;
function QExportColTypeAsString(ExportColType: TQExportColType): string;
function QExportSourceAsString(ExportSource: TQExportSource): string;

{$IFDEF WIN32}
function QExportLocale: TQExportLocale;
function QExportLoadStr(ID: Integer): string;
{$ENDIF}

implementation

uses SysUtils, QExport3Common, TypInfo
     {$IFDEF WIN32}
       , Windows, ShellAPI, ClipBrd, QExport3StrIDs,
       {$IFDEF TRIAL}fuQExport3About,{$ENDIF} FileCtrl
     {$ENDIF}
     {$IFDEF LINUX}
       {$IFNDEF NOGUI}, QClipbrd, Types, QExport3Consts {$ENDIF}
     {$ENDIF};

{$IFDEF WIN32}
var
  Locale: TQExportLocale = nil;
{$ENDIF}

{$IFDEF WIN32}
function QExportLocale: TQExportLocale;
begin
  if Locale = nil then
    Locale := TQExportLocale.Create;
  Result := Locale;
end;

function QExportLoadStr(ID: Integer): string;
begin
  Result := QExportLocale.LoadStr(ID);
end;
{$ENDIF}

function DataType2QExportColType(Field: TField): TQExportColType;
begin
  Result := ectUnknown;
  if not Assigned(Field) then Exit;
  case Field.DataType of
    ftBlob, ftMemo,
    {$IFNDEF VCL3}
    ftWideString,
    {$ENDIF}
    ftString: Result := ectString;
    ftSmallint, ftInteger,
    ftWord, ftAutoInc: Result := ectInteger;
    {$IFNDEF VCL3}
    ftLargeInt: Result := ectBigint;
    {$ENDIF}
    ftBoolean: Result := ectBoolean;
    ftFloat, ftBCD: Result := ectFloat;
    ftCurrency: Result := ectCurrency;
    ftDate: Result := ectDate;
    ftTime: Result := ectTime;
    {$IFDEF VCL6}
    ftTimeStamp,
    {$ENDIF}
    ftDateTime: Result := ectDateTime;
  end;
end;

function DataType2SQLType(Field: TField): string;
begin
  Result := 'UNKNOWN';
  case Field.DataType of
    ftBlob, ftMemo, ftGraphic, ftFmtMemo: Result := 'BLOB';
    {$IFNDEF VCL3} ftWideString, {$ENDIF}
    ftString: Result := Format('CHAR(%d)', [Field.Size]);
    ftSmallint, ftInteger, {$IFNDEF VCL3} ftLargeInt, {$ENDIF}
    ftWord, ftBoolean: Result := 'INTEGER';
    ftFloat, ftBCD, ftCurrency: Result := 'DOUBLE PRECISION';
    ftDate, ftTime, ftDateTime: Result := 'DATE';
  end;
end;

function QExportType2SQLType(Column: TQExportColumn): string;
begin
  case Column.ColType of
    ectInteger, ectBigint, ectBoolean: Result := 'INTEGER';
    ectFloat, ectCurrency: Result := 'DOUBLE PRECISSION';
    ectDate, ectTime, ectDateTime: Result := 'DATE';
    ectString: Result := Format('CHAR(%d)', [Column.Width]);
  end;
end;

function QExportColTypeAsString(ExportColType: TQExportColType): string;
begin
  case ExportColType of
    ectInteger, ectBigint: Result := 'Integer';
    ectFloat: Result := 'Float';
    ectCurrency: Result := 'Currency';
    ectDate: Result := 'Date';
    ectTime: Result := 'Time';
    ectDateTime: Result := 'DateTime';
    ectString: Result := 'String';
    ectBoolean: Result := 'Boolean';
    else Result := 'Unknown';
  end;
end;

function QExportSourceAsString(ExportSource: TQExportSource): string;
begin
  case ExportSource of
    esDataSet: Result := 'DataSet';
    esCustom: Result := 'CustomSource';
    esDBGrid: Result := 'DBGrid';
    esListView: Result := 'ListView';
    esStringGrid: Result := 'StringGrid';
    else Result := EmptyStr;
  end;
end;

{$IFDEF TRIAL}
{$IFDEF WIN32}
function IsIDERuning: Boolean;
begin
  Result := (FindWindow('TAppBuilder', nil) <> 0) or
            (FindWindow('TPropertyInspector', nil) <> 0) or
            (FindWindow('TAlignPalette', nil) <> 0);
end;
{$ENDIF}
{$ENDIF}

procedure CheckTrial;
begin
{$IFDEF TRIAL}
{$IFDEF WIN32}
  if not IsIDERuning then
    ShowAboutForm;
{$ENDIF}
{$ENDIF}
end;

{ TQExportFormats }

constructor TQExportFormats.Create;
begin
  inherited;
  ResetFormats;
end;

procedure TQExportFormats.Assign(Source: TPersistent);
begin
  if Source is TQExportFormats then begin
    IntegerFormat := (Source as TQExportFormats).IntegerFormat;
    FloatFormat := (Source as TQExportFormats).FloatFormat;
    DateFormat := (Source as TQExportFormats).DateFormat;
    TimeFormat := (Source as TQExportFormats).TimeFormat;
    DateTimeFormat := (Source as TQExportFormats).DateTimeFormat;
    CurrencyFormat := (Source as TQExportFormats).CurrencyFormat;
    BooleanTrue := (Source as TQExportFormats).BooleanTrue;
    BooleanFalse := (Source as TQExportFormats).BooleanFalse;
    NullString := (Source as TQExportFormats).NullString;
    Exit;
  end;
  inherited;
end;

procedure TQExportFormats.ResetFormats;
begin
  FIntegerFormat := S_INTEGER_FORMAT;
  FFloatFormat := S_FLOAT_FORMAT;
  FDateFormat := DefaultDateFormat;
  FTimeFormat := DefaultTimeFormat;
  FDateTimeFormat := DefaultDateTimeFormat;
  FCurrencyFormat := DefaultCurrencyFormat;
  FBooleanTrue := S_BOOLEAN_TRUE;
  FBooleanFalse := S_BOOLEAN_FALSE;
end;

procedure TQExportFormats.SetIntegerFormat(const Value: string);
begin
  if FIntegerFormat <> Value then
    if Value = EmptyStr
      then FIntegerFormat := S_INTEGER_FORMAT
      else FIntegerFormat := Value;
end;

procedure TQExportFormats.SetFloatFormat(const Value: string);
begin
  if FFloatFormat <> Value then
    {if Value = EmptyStr
      then FFloatFormat := S_FLOAT_FORMAT
      else FFloatFormat := Value;}
    FFloatFormat := Value; // ab
end;

procedure TQExportFormats.SetDateFormat(const Value: string);
begin
  if FDateFormat <> Value then
    if Value = EmptyStr
      then FDateFormat := DefaultDateFormat
      else FdateFormat := Value;
end;

procedure TQExportFormats.SetTimeFormat(const Value: string);
begin
  if FTimeFormat <> Value then
    if Value = EmptyStr
      then FTimeFormat := DefaultTimeFormat
      else FTimeFormat := Value;
end;

procedure TQExportFormats.SetDateTimeFormat(const Value: string);
begin
  if FDateTimeFormat <> Value then
    if Value = EmptyStr
      then FDateTimeFormat := DefaultDateTimeFormat
      else FDateTimeFormat := Value;
end;

procedure TQExportFormats.SetCurrencyFormat(const Value: string);
begin
  if FCurrencyFormat <> Value then
    if Value = EmptyStr
      then FCurrencyFormat := DefaultCurrencyFormat
      else FCurrencyFormat := Value;
end;

procedure TQExportFormats.SetBooleanTrue(const Value: string);
begin
  if FBooleanTrue <> Value then
    if Value = EmptyStr
      then FBooleanTrue := S_BOOLEAN_TRUE
      else FBooleanTrue := Value;
end;

procedure TQExportFormats.SetBooleanFalse(const Value: string);
begin
  if FBooleanFalse <> Value then
    if Value = EmptyStr
      then FBooleanFalse := S_BOOLEAN_FALSE
      else FBooleanFalse := Value;
end;

procedure TQExportFormats.SetNullString(const Value: string);
begin
  FNullString := Trim(Value);
end;

function TQExportFormats.IsIntegerFormatStored: boolean;
begin
  Result := AnsiCompareStr(FIntegerFormat, S_INTEGER_FORMAT) <> 0;
end;

function TQExportFormats.IsFloatFormatStored: boolean;
begin
  Result := AnsiCompareStr(FFloatFormat, S_FLOAT_FORMAT) <> 0;
end;

function TQExportFormats.IsDateFormatStored: boolean;
begin
  Result := AnsiCompareStr(FDateFormat, DefaultDateFormat) <> 0;
end;

function TQExportFormats.IsTimeFormatStored: boolean;
begin
  Result := AnsiCompareStr(FTimeFormat, DefaultTimeFormat) <> 0;
end;

function TQExportFormats.IsDateTimeFormatStored: boolean;
begin
  Result := AnsiCompareStr(FDateTimeFormat, DefaultDateTimeFormat) <> 0;
end;

function TQExportFormats.IsCurrencyFormatStored: boolean;
begin
  Result := AnsiCompareStr(FCurrencyFormat, DefaultCurrencyFormat) <> 0;
end;

function TQExportFormats.IsBooleanTrueStored: boolean;
begin
  Result := AnsiCompareStr(FBooleanTrue, S_BOOLEAN_TRUE) <> 0;
end;

function TQExportFormats.IsBooleanFalseStored: boolean;
begin
  Result := AnsiCompareStr(FBooleanFalse, S_BOOLEAN_FALSE) <> 0;
end;

{ TQExportColumn }

constructor TQExportColumn.Create(Collection: TCollection);
begin
  inherited;
  FTag := 0;
  if Collection is TQExportColumns then
    FColumns := Collection as TQExportColumns;
end;

function TQExportColumn.GetIsDefaultFormat: boolean;
begin
  Result := false;
  if FAllowFormat then
    case FColType of
      ectInteger, ectBigint: Result := FFormat = FColumns.FOwnerFormats.IntegerFormat;
      ectFloat: Result := FFormat = FColumns.FOwnerFormats.FloatFormat;
      ectDate: Result := FFormat = FColumns.FOwnerFormats.DateFormat;
      ectTime: Result := FFormat = FColumns.FOwnerFormats.TimeFormat;
      ectDateTime: Result := FFormat = FColumns.FOwnerFormats.DateTimeFormat;
      ectCurrency: Result := FFormat = FColumns.FOwnerFormats.CurrencyFormat;
    end;
end;

function TQExportColumn.GetDefaultFormat: string;
begin
  Result := EmptyStr;
  if FAllowFormat then
    case FColType of
      ectInteger, ectBigint: Result := FColumns.FOwnerFormats.IntegerFormat;
      ectFloat: Result := FColumns.FOwnerFormats.FloatFormat;
      ectDate: Result := FColumns.FOwnerFormats.DateFormat;
      ectTime: Result := FColumns.FOwnerFormats.TimeFormat;
      ectDateTime: Result := FColumns.FOwnerFormats.DateTimeFormat;
      ectCurrency: Result := FColumns.FOwnerFormats.CurrencyFormat;
    end;
end;

procedure TQExportColumn.SetDefaultFormat;
begin
  FFormat := GetDefaultFormat;
end;

{ TQExportColumns }

constructor TQExportColumns.Create(Holder: TPersistent; NormalFunc: TNormalFunc);
begin
  inherited Create(TQExportColumn);
  FHolder := Holder;
  FNormalFunc := NormalFunc;
end;

function TQExportColumns.Add: TQExportColumn;
begin
  Result := TQExportColumn(inherited Add);
end;

function TQExportColumns.GetColumn(Index: integer): TQExportColumn;
begin
  Result := TQExportColumn(inherited Items[Index]);
end;

procedure TQExportColumns.SetColumn(Index: integer; Value: TQExportColumn);
begin
  Items[Index].Assign(Value);
end;

procedure TQExportColumns.LoadOwnerProperties;
var
  PropInfo: PPropInfo;
begin
  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ExportedFields');
  if Assigned(PropInfo) then
    FOwnerExportedFields := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ExportSource');
  if Assigned(PropInfo) then
    FOwnerExportSource := TQExportSource(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'DataSet');
  if Assigned(PropInfo) then
    FOwnerDataSet := TDataSet(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'CustomSource');
  if Assigned(PropInfo) then
    FOwnerCustomSource := TqeCustomSource(GetOrdProp(FHolder, PropInfo));

  {$IFNDEF NOGUI}
  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ListView');
  if Assigned(PropInfo) then
    FOwnerListView := TListView(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'DBGrid');
  if Assigned(PropInfo) then
    FOwnerDBGrid := TDBGrid(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'StringGrid');
  if Assigned(PropInfo) then
    FOwnerStringGrid := TStringGrid(GetOrdProp(FHolder, PropInfo));
  {$ENDIF}

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'OnlyVisibleFields');
  if Assigned(PropInfo) then
    FOwnerOnlyVisibleFields := Boolean(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'Formats');
  if Assigned(PropInfo) then
    FOwnerFormats := TQExportFormats(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'AutoCalcStrType');
  if Assigned(PropInfo) then
    FOwnerAutoCalcStrType := Boolean(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'CaptionRow');
  if Assigned(PropInfo) then
    FOwnerCaptionRow := Integer(GetOrdProp(FHolder, PropInfo))
  else FOwnerCaptionRow := -1;

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'UserFormats');
  if Assigned(PropInfo) then
    FOwnerUserFormats := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ColumnsWidth');
  if Assigned(PropInfo) then
    FOwnerColumnsWidth := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'Captions');
  if Assigned(PropInfo) then
    FOwnerCaptions := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ColumnsAlign');
  if Assigned(PropInfo) then
    FOwnerColumnsAlign := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'SkipRecCount');
  if Assigned(PropInfo) then
    FOwnerSkipRecCount := Integer(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ExportRecCount');
  if Assigned(PropInfo) then
    FOwnerExportRecCount := Integer(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'ColumnsLength');
  if Assigned(PropInfo) then
    FOwnerColumnsLength := TStrings(GetOrdProp(FHolder, PropInfo));

  PropInfo := GetPropInfo(FHolder.ClassInfo, 'OnFetchedRecord');
  if Assigned(PropInfo) then
    FOwnerOnFetchedRecord := TExportedRecordEvent(GetMethodProp(FHolder, PropInfo));
end;

procedure TQExportColumns.Fill(BLOB: boolean);
var
  i, j: integer;
  FColCount: integer;
  FColumn: TQExportColumn;
begin
  LoadOwnerProperties;
  FColCount := 0;
  if FOwnerExportedFields.Count = 0 then begin
    case FOwnerExportSource of
      esDataSet:
        if Assigned(FOwnerDataSet) then
          FColCount := FOwnerDataSet.FieldCount;
      esCustom:
        if Assigned(FOwnerCustomSource) then
          FColCount := FOwnerCustomSource.ColCount;
      {$IFNDEF NOGUI}
      esListView:
        if Assigned(FOwnerListView) then
          FColCount := FOwnerListView.Columns.Count;
      esDBGrid:
        if Assigned(FOwnerDBGrid) then
          FColCount := FOwnerDBGrid.Columns.Count;
      esStringGrid:
        if Assigned(FOwnerStringGrid) then
          FColCount := FOwnerStringGrid.ColCount;
      {$ENDIF}
    end
  end
  else FColCount := FOwnerExportedFields.Count;
  for i := 0 to FColCount - 1 do  begin
    j := SetColumnNumber(i, BLOB);
    if  j = -1 then Continue;
    FColumn := Add;
    FColumn.Number := j;
  end;
  for i := 0 to Count - 1 do begin
    SetColumnName(i);
    SetColumnType(i);
    SetColumnCaption(i);
    SetColumnWidth(i);
    SetColumnFormat(i);
    SetColumnAlign(i);
    SetColumnSQLType(i);
    SetColumnIsString(i);
    SetColumnLength(i);
    SetColumnAllowFormat(i);
    SetColumnIsNumeric(i);
    SetColumnIsBlob(i);
    SetColumnIsMemo(i);
    SetColumnIsVisible(i);
  end;
end;

function TQExportColumns.SetColumnNumber(Index: integer; BLOB: boolean): integer;
var
  Field: TField;
  Column: TqeCustomColumn;
  {$IFNDEF NOGUI}j: integer;{$ENDIF}
begin
  Result := -1;
  if FOwnerExportedFields.Count = 0 then begin
    case FOwnerExportSource of
      esDataSet: begin
        Field := FOwnerDataSet.Fields[Index];
        if Assigned(Field) and
           (((BLOB) or (not Field.IsBlob)) and
            ((not FOwnerOnlyVisibleFields) or Field.Visible)) then
          Result := Index;
      end;
      {$IFNDEF NOGUI}
      esDBGrid: begin
        Field := FOwnerDBGrid.Columns[Index].Field;
        if Assigned(Field)  and
           (((BLOB) or (not Field.IsBlob)) and
            ((not FOwnerOnlyVisibleFields) or Field.Visible)) then
          Result := Index
      end;
      else Result := Index;
      {$ENDIF}
    end;
    Exit;
  end;

  case FOwnerExportSource of
    esDataSet: begin
      Field := FOwnerDataSet.FieldByName(FOwnerExportedFields[Index]);
      if Assigned(Field) and
         ((not FOwnerOnlyVisibleFields) or Field.Visible) then
        Result := Field.Index;
    end;
    esCustom: begin
      Column := FOwnerCustomSource.ColumnByName(FOwnerExportedFields[Index]);
      if Assigned(Column) then
        Result := Column.Index;
    end;
    {$IFNDEF NOGUI}
    esDBGrid:
      for j := 0 to FOwnerDBGrid.Columns.Count - 1 do begin
        Field := FOwnerDBGrid.Columns[j].Field;
        if Assigned(Field) and
           ((AnsiCompareText(Field.FieldName, FOwnerExportedFields[Index]) = 0) and
            (not FOwnerOnlyVisibleFields or Field.Visible)) then
          Result := j;
      end;
    esListView:
      for j := 0 to FOwnerListView.Columns.Count - 1 do begin
        if AnsiCompareText(FOwnerListView.Columns[j].Caption,
                           FOwnerExportedFields[Index]) = 0 then
          Result := j;
      end;
    esStringGrid: begin
      Result := StrToIntDef(FOwnerExportedFields[Index], -1);
      if not ((Result >= 0) and (Result <= FOwnerStringGrid.ColCount)) then
        Result := -1;
    end;
    {$ENDIF}
  end;
end;

procedure TQExportColumns.SetColumnName(Index: integer);
begin
  // Items[Index].Number must be defined
  with Items[Index] do
    case FOwnerExportSource of
      esDataSet: Name := FOwnerDataSet.Fields[Number].FieldName;
      esCustom: Name := FOwnerCustomSource.Columns[Number].ColumnName;
      {$IFNDEF NOGUI}
      esDBGrid: Name := FOwnerDBGrid.Columns[Number].Field.FieldName;
      esListView: Name := FOwnerListView.Columns[Number].Caption;
      esStringGrid: Name := IntToStr(Number);
      {$ENDIF}
    end;
end;

procedure TQExportColumns.SetColumnType(Index: integer);
begin
  // Items[Index].Number must be defined
  with Items[Index] do
    case FOwnerExportSource of
      esDataSet: ColType := DataType2QExportColType(FOwnerDataSet.Fields[Number]);
      esCustom: ColType := FOwnerCustomSource.Columns[Number].ColumnType;
      {$IFNDEF NOGUI}
      esDBGrid: ColType := DataType2QExportColType(FOwnerDBGrid.Columns[Number].Field);
      esListView:
        if not FOwnerAutoCalcStrType
          then ColType := ectString
          else if FOwnerListView.Items.Count > 0 then begin
            if Number = 0
              then ColType := CalcStringType(FOwnerListView.Items[0].Caption,
                FOwnerFormats.BooleanTrue, FOwnerFormats.BooleanFalse)
              else ColType := CalcStringType(FOwnerListView.Items[0].SubItems[Number - 1],
                FOwnerFormats.BooleanTrue, FOwnerFormats.BooleanFalse);
          end;
      esStringGrid:
        if not FOwnerAutoCalcStrType
          then ColType := ectString
          else ColType := CalcStringType(FOwnerStringGrid.Cells[Number,
            FOwnerStringGrid.Row], FOwnerFormats.BooleanTrue,
            FOwnerFormats.BooleanFalse);
      {$ENDIF}
    end;
end;

procedure TQExportColumns.SetColumnFormat(Index: integer);
var
  i: integer;
begin
  // Items[Index].ColType must be defined
  if Assigned(FOwnerFormats) then
    with FOwnerFormats, Items[Index] do
      case ColType of
        ectInteger, ectBigint: Format := IntegerFormat;
        ectFloat: Format := FloatFormat;
        ectDate: Format := DateFormat;
        ectTime: Format := TimeFormat;
        ectDateTime: Format := DateTimeFormat;
        ectCurrency: Format := CurrencyFormat;
      end;

  if Assigned(FOwnerUserFormats) then
    with FOwnerUserFormats, Items[Index] do begin
      i := IndexOfName(Name);
      if i > -1 then Format := Values[Names[i]];
    end;
end;

procedure TQExportColumns.SetColumnWidth(Index: integer);
var
  i: integer;
begin
  if Assigned(FOwnerColumnsWidth) then
    with FOwnerColumnsWidth, Items[Index] do begin
      i := IndexOfName(Name);
      if i > -1 then begin
        Width := StrToIntDef(Values[Names[i]], 0);
        Exit;
      end;
    end;
  // Items[Index].Number must be defined
  with Items[Index] do
    case FOwnerExportSource of
      esDataSet: Width := FOwnerDataSet.Fields[Number].DisplayWidth;
      esCustom: Width := FOwnerCustomSource.Columns[Number].Width;
      {$IFNDEF NOGUI}
      esDBGrid: Width := FOwnerDBGrid.Columns[Number].Width div
        FOwnerDBGrid.Canvas.TextWidth('X');
      esListView: begin
        Width := FOwnerListView.Columns[Number].Width div
          GetTextWidth(FOwnerListView, 'X');
      end;
      esStringGrid: Width := FOwnerStringGrid.ColWidths[Number] div
        FOwnerStringGrid.Canvas.TextWidth('X');
      {$ENDIF}
    end;
end;

procedure TQExportColumns.SetColumnCaption(Index: integer);
var
  i: integer;
begin
  if Assigned(FOwnerCaptions) then
    with FOwnerCaptions, Items[Index] do begin
      i := IndexOfName(Name);
      if i > -1 then begin
        Caption := Values[Names[i]];
        Exit;
      end;
    end;
  // Items[Index].Number must be defined
  with Items[Index] do
    case FOwnerExportSource of
      esDataSet: Caption := FOwnerDataSet.Fields[Number].DisplayLabel;
      esCustom: Caption := FOwnerCustomSource.Columns[Number].Caption;
      {$IFNDEF NOGUI}
      esDBGrid: Caption := FOwnerDBGrid.Columns[Number].Title.Caption;
      esListView: Caption := FOwnerListView.Columns[Number].Caption;
      esStringGrid:
        if FOwnerCaptionRow > -1
          then Caption := FOwnerStringGrid.Cells[Number, FOwnerCaptionRow]
          else Caption := 'ColNo_' + IntToStr(Number);
      {$ENDIF}
    end;
end;

procedure TQExportColumns.SetColumnAlign(Index: integer);
var
  i: integer;
  s: String;
begin
  // Items[Index].ColType must be defined
  if Assigned(FOwnerColumnsAlign) then
    with FOwnerColumnsAlign, Items[Index] do begin
      i := IndexOfName(Name);
      if i > -1 then begin
        s := AnsiUpperCase(Values[Names[i]]);
        if s <> '' then
          case s[1] of
            'L': ColAlign := ecaLeft;
            'C': COlAlign := ecaCenter;
            'R': ColAlign := ecaRight;
            else ColAlign := ecaLeft;
          end
        else ColAlign := ecaLeft;
        Exit;
      end;
      case ColType of
        ectInteger,
        ectBigint,
        ectFloat,
        ectCurrency: ColAlign := ecaRight;
        ectBoolean: ColAlign := ecaCenter;
        else ColAlign := ecaLeft;
      end;
    end;
end;

procedure TQExportColumns.AutoCalcColWidth;
var
  i, w: integer;
  Bookmark: TBookmark;
  Str: string;
begin
  for i := 0 to Count - 1 do
    if Length(Items[i].Caption) > Items[i].Width
      then Items[i].Width := Length(Items[i].Caption);

  Bookmark := QExportGetBookmark(FOwnerExportSource, FOwnerDataSet,
    FOwnerCustomSource{$IFNDEF NOGUI}, FOwnerDBGrid, FOwnerListView,
    FOwnerStringGrid{$ENDIF});
  try
    QExportFirst(FOwnerExportSource, FOwnerDataSet, FOwnerCustomSource
      {$IFNDEF NOGUI}, FOwnerDBGrid, FOwnerListView, FOwnerStringGrid{$ENDIF});
    for i := 0 to FOwnerSkipRecCount - 1 do
      QExportNext(FOwnerExportSource, FOwnerDataSet, FOwnerCustomSource,
        {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView, FOwnerStringGrid,{$ENDIF} FRecordCounter);

    FRecordCounter := 0;
    while not QExportEOF(FOwnerExportSource, FOwnerDataSet, FOwnerCustomSource,
      {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView, FOwnerStringGrid,{$ENDIF}
      FRecordCounter, FOwnerExportRecCount, FOwnerSkipRecCount) and
      ((FOwnerExportRecCount = 0) or
       (FRecordCounter < FOwnerExportRecCount)) do
    begin
      //if Aborted and not CanContinue then Break;
      for i := 0 to Count - 1 do
      begin
        Str := QExportGetColData(FOwnerExportSource, FOwnerDataSet,
          FOwnerCustomSource, {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView,
          FOwnerStringGrid,{$ENDIF} Self, FOwnerFormats, FNormalFunc, i,
          FRecordCounter, FOwnerSkipRecCount, true);
        w := Length(Str);
        if w > Items[i].Width then
          Items[i].Width := w;
      end;
      QExportNext(FOwnerExportSource, FOwnerDataSet, FOwnerCustomSource,
      {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView, FOwnerStringGrid,{$ENDIF}
      FRecordCounter);
      if Assigned(FOwnerOnFetchedRecord) then
        FOwnerOnFetchedRecord(Holder, FRecordCounter);
{$IFDEF WIN32}
      Sleep(0);
{$ENDIF}
    end;
    QExportGoToBookmark(FOwnerExportSource, FOwnerDataSet, FOwnerCustomSource,
      {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView, FOwnerStringGrid,{$ENDIF}
      Bookmark);
  finally
    QExportFreeBookmark(FOwnerExportSource, FOwnerDataSet,
      {$IFNDEF NOGUI}FOwnerDBGrid, FOwnerListView, FOwnerStringGrid, {$ENDIF}
      Bookmark);
  end;
end;

procedure TQExportColumns.SetColumnSQLType(Index: integer);
begin
  with Items[Index] do begin
    case FOwnerExportSource of
      esDataSet: SQLType := DataType2SQLType(FOwnerDataSet.Fields[Number]);
      esCustom: SQLType := QExportType2SQLType(Items[Index]);
      {$IFNDEF NOGUI}
      esDBGrid: SQLType := DataType2SQLType(FOwnerDBGrid.Columns[Number].Field);
      esListView,
      esStringGrid: QExportType2SQLType(Items[Index]);
      {$ENDIF}
    end;
  end;
end;

procedure TQExportColumns.SetColumnLength(Index: integer);
var
  i: integer;
begin
  if not Items[Index].IsString then Exit;
  if Assigned(FOwnerColumnsLength) then
    if FOwnerExportSource in [esListView, esStringGrid] then
      with FOwnerColumnsLength, Items[Index] do begin
        i := IndexOfName(Name);
        if i > -1 then begin
          Length := StrToIntDef(Values[Names[i]], 255);
          Exit;
        end;
      end;
  /// Items[Index].Number must be defined
  with Items[Index] do
    case FOwnerExportSource of
      esDataSet: Length := MinimumInt(FOwnerDataSet.Fields[Number].Size, 255);
      esCustom: Length := MinimumInt(FOwnerCustomSource.Columns[Number].Size, 255);
      {$IFNDEF NOGUI}
      esDBGrid: Length := MinimumInt(FOwnerDBGrid.Columns[Number].Field.Size, 255);
      esListView: Length := 255;
      esStringGrid: Length := 255;
      {$ENDIF}
    end;
end;

procedure TQExportColumns.SetColumnAllowFormat(Index: integer);
begin
  Items[Index].FAllowFormat := Items[Index].ColType in [ectInteger, ectBigint,
    ectFloat, ectDate, ectTime, ectDateTime, ectCurrency];
end;

procedure TQExportColumns.SetColumnIsNumeric(Index: integer);
begin
  Items[Index].FIsNumeric := Items[Index].ColType in [ectInteger, ectBigint,
    ectFloat, ectCurrency];
end;

procedure TQExportColumns.SetColumnIsString(Index: integer);
begin
  Items[Index].FIsString := Items[Index].ColType in [ectString];
end;

function TQExportColumns.GetColumnIsNull(Index: integer): boolean;
begin
  case FOwnerExportSource of
    esDataSet: Result := FOwnerDataSet.Fields[Items[Index].Number].IsNull;
    {$IFNDEF NOGUI}
    esDBGrid: Result := FOwnerDBGrid.Columns[Items[Index].Number].Field.IsNull;
    {$ENDIF}
    else Result := false;
  end;
end;

procedure TQExportColumns.SetColumnIsBlob(Index: integer);
begin
  case FOwnerExportSource of
    esDataSet: Items[Index].FIsBlob := FOwnerDataSet.Fields[Items[Index].Number].IsBlob;
    {$IFNDEF NOGUI}
    esDBGrid: Items[Index].FIsBlob := FOwnerDBGrid.Columns[Items[Index].Number].Field.IsBlob;
    {$ENDIF}
    else Items[Index].FIsBlob := false;
  end;
end;

procedure TQExportColumns.SetColumnIsMemo(Index: integer);
begin
  case FOwnerExportSource of
    esDataSet: Items[Index].FIsMemo := FOwnerDataSet.Fields[Items[Index].Number] is TMemoField;
    {$IFNDEF NOGUI}
    esDBGrid: Items[Index].FIsMemo := FOwnerDBGrid.Columns[Items[Index].Number].Field is TMemoField;
    {$ENDIF}
    else Items[Index].FIsMemo := false;
  end;
end;

procedure TQExportColumns.SetColumnIsVisible(Index: integer);
begin
  case FOwnerExportSource of
    esDataSet: Items[Index].FIsVisible := FOwnerDataSet.Fields[Items[Index].Number].Visible;
    {$IFNDEF NOGUI}
    esDBGrid: Items[Index].FIsVisible := FOwnerDBGrid.Columns[Items[Index].Number].Field.Visible;
    {$ENDIF}
    else Items[Index].FIsVisible := true;
  end;
end;

function TQExportColumns.IndexOfName(const AName: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareText(AName, Items[i].Name) = 0 then begin
      Result := i;
      Exit;
    end;
end;

procedure TQExportColumns.EmptyTags;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Tag := 0;
end;

function TQExportColumns.ContainsBLOB: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Items[i].IsBlob then begin
      Result := true;
      Exit;
    end;
end;

function TQExportColumns.ContainsMEMO: boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Count - 1 do
    if Items[i].IsMemo then begin
      Result := true;
      Exit;
    end;
end;

{ TQExportWriter }

constructor TQExportWriter.Create(AOwner: TQExport3; AStream: TStream);
begin
  inherited Create;
  FStream := AStream;
  FOwner := AOwner;
end;

procedure TQExportWriter.EmptyLine;
begin
  WriteLn(EmptyStr);
end;

procedure TQExportWriter.CharLine(Chr: char; Count: integer);
var
  i: integer;
  str: string;
begin
  str := EmptyStr;
  for i := 0 to Count - 1 do str := str + Chr;
  WriteLn(str);
end;

function TQExportWriter.PadL(const S: string; Chr: char; Count: integer): string;
var
  i, j: integer;
begin
  Result := S;
  j := Count - Length(S);
  for i := 1 to j do Result := Chr + Result;
end;

function TQExportWriter.PadR(const S: string; Chr: char; Count: integer): string;
var
  i: integer;
begin
  Result := S;
  for i := Length(S) + 1 to Count do Result := Result + Chr;
end;

function TQExportWriter.PadC(const S: string; Chr: char; Count: integer): string;
var
  l, r: integer;
begin
  Result := S;
  l := (Count - Length(Result)) div 2;
  r := Count - Length(Result) - l;
  Result := PadL(Result, Chr, Length(Result) + l);
  Result := PadR(Result, Chr, Length(Result) + r);
end;

procedure TQExportWriter.Write(const S: string);
begin
  FStream.WriteBuffer(S[1], Length(S));
end;

procedure TQExportWriter.WriteLn(const S: string);
begin
  Write(S + CRLF);
end;

function TQExportWriter.AlignToStr(Value: TQExportColAlign): string;
begin
  case Value of
    ecaLeft: Result := 'Left alignment';
    ecaCenter: Result := 'Center alignment';
    ecaRight: Result := 'Right alignment';
    else Result := 'Unknown alignment';
  end
end;

{ TQExportCol }

constructor TQExportCol.Create(Row: TQExportRow);
begin
  inherited Create;
  FColumnIndex := -1;
  FName := EmptyStr;
  FValue := EmptyStr;
  FRow := Row;
end;

function TQExportCol.GetExportedValue(NeedFormat: boolean): string;
begin
  if Row.Columns.GetColumnIsNull(FColumnIndex) then
    FValue := Row.Columns.FNormalFunc(Row.Formats.NullString)
  else if NeedFormat then
    FValue := QExportFormatData(FValue, Row.Columns[FColumnIndex].Format,
      Row.Columns[FColumnIndex].ColType, Row.Columns.FNormalFunc);

  Result := FValue;

  if Assigned(Row.GetColData) then
    Result := Row.GetColData(Self);
end;

{ TQExportRow }

constructor TQExportRow.Create(Columns: TQExportColumns;
  Formats: TQExportFormats; GetColdata: TQExportGetColData);
begin
  inherited Create;
  FIndex := TStringList.Create;
  FColumns := Columns;
  FFormats := Formats;
  FGetColData := GetColData;
end;

destructor TQExportRow.Destroy;
begin
  Clear;
  FIndex.Free;
  inherited;
end;

function TQExportRow.Add(const AName: string; AColumnIndex: integer): TQExportCol;
begin
  Result := TQExportCol.Create(Self);
  Result.FName := Trim(AName);
  Result.FColumnIndex := AColumnIndex;
  inherited Add(Result);
end;

procedure TQExportRow.Clear;
var
  i: integer;
begin
  for i := Count - 1 downto 0 do Delete(i);
  inherited;
end;

procedure TQExportRow.Delete(Index: integer);
begin
  TQExportCol(Items[Index]).Free;
  inherited Delete(Index);
end;

function TQExportRow.First: TQExportCol;
begin
  Result := TQExportCol(inherited First);
end;

procedure TQExportRow.Insert(Index: Integer; Item: TQExportCol);
begin
  inherited Insert(Index, Item);
end;

procedure TQExportRow.SetValue(const AName, AValue: string);
var
  i: integer;
begin
  FIndex.Find(AName, i);
  if i > -1 then begin
    i := Integer(FIndex.Objects[i]);
    Items[i].Value := Trim(AValue);
  end;
end;

procedure TQExportRow.ClearValues;
var
  i: integer;
begin
  for i := 0 to Count - 1 do
    Items[i].Value := EmptyStr
end;

function TQExportRow.Last: TQExportCol;
begin
  Result := TQExportCol(inherited Last);
end;

function TQExportRow.IndexOf(Item: TQExportCol): Integer;
begin
  Result := inherited IndexOf(Item);
end;

function TQExportRow.Remove(Item: TQExportCol): Integer;
begin
  Result := inherited Remove(Item);
end;

function TQExportRow.ColByName(const AName: string): TQExportCol;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
    if AnsiCompareText(AName, Items[i].Name) = 0 then begin
      Result := Items[i];
      Exit;
    end;
end;

function TQExportRow.Get(Index: Integer): TQExportCol;
begin
  Result := TQExportCol(inherited Get(Index));
end;

procedure TQExportRow.Put(Index: Integer; const Value: TQExportCol);
begin
  inherited Put(Index, Value);
end;

{ TQExport3 }

constructor TQExport3.Create(AOwner: TComponent);
begin
  inherited;
  FRecordCounter := 0;
  FColumns := TQExportColumns.Create(Self, NormalString);

  FExportSource := esDataSet;
  FExportedFields := TStringList.Create;
  FHeader := TStringList.Create;
  FCaptions := TStringList.Create;
  FAllowCaptions := true;
  FFooter := TStringList.Create;
  FFormats := TQExportFormats.Create;
  FUserFormats := TStringList.Create;
  FColumnsWidth := TStringList.Create;
  FColumnsAlign := TStringList.Create;
  FColumnsLength := TStringList.Create;

  FExportRow := TQExportRow.Create(Columns, Formats, GetColData);

  FCurrentRecordOnly := false;
  FGoToFirstRecord := true;
  FSkipRecCount := 0;
  FExportRecCount := 0;
  FOnlyVisibleFields := false;
  FAutoCalcStrType := false;
  FAutoCalcColWidth := false;
  FCaptionRow := -1;
  FExportEmpty := true;

  FAborted := false;

  F_Version := S_VERSION;
  FAbout := S_ABOUT;
end;

destructor TQExport3.Destroy;
begin
  FExportRow.Free;
  FColumns.Free;

  FExportedFields.Free;
  FHeader.Free;
  FCaptions.Free;
  FFooter.Free;
  FFormats.Free;
  FUserFormats.Free;
  FColumnsWidth.Free;
  FColumnsAlign.Free;
  FColumnsLength.Free;
  inherited;
end;

procedure TQExport3.Execute;
begin
end;

procedure TQExport3.ExportToStream(AStream: TStream);
begin
  FWriter := GetWriterClass.Create(Self, AStream);
  try
    DoExport;
  finally
    FWriter.Free;
  end;
end;

procedure TQExport3.Abort;
begin
  FAborted := true;
end;

procedure TQExport3.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then begin
    if AComponent = FDataSet then FDataSet := nil;
    if AComponent = FCustomSource then FCustomSource := nil;
    {$IFNDEF NOGUI}
    if AComponent = FListView then FListView := nil;
    if AComponent = FDBGrid then FDBGrid := nil;
    if AComponent = FStringGrid then FStringGrid := nil;
    {$ENDIF}
  end;
end;

procedure TQExport3.LoadPropertiesFromFile(const FileName: string);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FileName);
  try
    LoadProperties(IniFile);
  finally
    IniFile.Free;
  end;
end;

procedure TQExport3.SavePropertiesToFile(const FileName: string);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(FileName);
  try
    SaveProperties(IniFile);
  finally
    IniFile.Free;
  end;
end;

procedure TQExport3.DisableControls;
begin
  QExportDisableControls(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

procedure TQExport3.EnableControls;
begin
  QExportEnableControls(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

procedure TQExport3.First;
begin
  FRecordCounter := 0;
  QExportFirst(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

procedure TQExport3.Next;
begin
  QExportNext(FExportSource, FDataSet, FCustomSource,
    {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}FRecordCounter);
end;

procedure TQExport3.Skip(Count: integer);
begin
  QExportSkip(FExportSource, FDataSet, FCustomSource,
    {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}
    FSkipRecCount, FOnSkippedRecord, Self, FRecordCounter)
end;

function TQExport3.EndOfFile: boolean;
begin
  Result := QExportEof(ExportSource, DataSet, CustomSource,
    {$IFNDEF NOGUI}DBGrid, ListView, StringGrid,{$ENDIF} RecordCounter,
    ExportRecCount, SkipRecCount);
end;

function TQExport3.GetBookmark: TBookmark;
begin
  Result := QExportGetBookmark(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

procedure TQExport3.GoToBookmark(Bookmark: TBookmark);
begin
  FRecordCounter := 0;
  QExportGoToBookmark(FExportSource, FDataSet, FCustomSource,
  {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF} Bookmark);
end;

procedure TQExport3.FreeBookmark(Bookmark: TBookmark);
begin
  QExportFreeBookmark(FExportSource, FDataSet, {$IFNDEF NOGUI}FDBGrid,
    FListView, FStringGrid,{$ENDIF} Bookmark);
end;

function TQExport3.IsEmpty: boolean;
begin
  Result := QExportIsEmpty(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

function TQExport3.IsActive: boolean;
begin
  Result := QExportIsActive(FExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

function TQExport3.GetColCaption(Index: integer): string;
begin
  Result := NormalString(Columns[Index].Caption);
end;

function TQExport3.GetColData(ExportCol: TQExportCol): string;
begin
  Result := ExportCol.Value;
end;

function TQExport3.NormalString(const S: string): string;
begin
  Result := S;
end;

procedure TQExport3.FillExportRow;
var
  i: integer;
  str: string;
  wstr: WideString;
begin
  for i := 0 to FColumns.Count - 1 do
  begin
    str := QExportGetColData(FExportSource, FDataSet, FCustomSource,
      {$IFNDEF NOGUI}FDBGrid, FListView, FStringGrid,{$ENDIF}
      FColumns, FFormats, FColumns.FNormalFunc, i, FRecordCounter,
      FSkipRecCount, false);
    wstr := str;
    if Assigned(FOnGetExportText) then
      FOnGetExportText(Self, i, wstr);
    FExportRow.SetValue(Columns[i].Name, wstr);
  end;
end;

function TQExport3.GetDataRow(NeedFormat: boolean): string;
var
  i: integer;
begin
  Result := EmptyStr;
  for i := 0 to FExportRow.Count - 1 do
    Result := Result + FExportRow[i].GetExportedValue(NeedFormat);
end;

function TQExport3.GetCaptionRow: string;
var
  i: integer;
begin
  Result := EmptyStr;
  for i := 0 to Columns.Count - 1 do
    Result := Result + GetColCaption(i);
end;

procedure TQExport3.DoExport;
var
  AcceptRow: boolean;
begin
  FRecordCounter := 0;
  CheckExportSource;
  if not IsActive
    then raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceNotActive){$ENDIF}
                                   {$IFDEF LINUX}QEM_ExportSourceNotActive{$ENDIF},
                                   [QExportSourceAsString(FExportSource)]);
  if (not FExportEmpty) and IsEmpty
    then raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_ExportSourceEmpty){$ENDIF}
                                   {$IFDEF LINUX}QEM_ExportSourceEmpty{$ENDIF},
                                   [QExportSourceAsString(FExportSource)]);
  DisableControls;
  try
    BeginExport;
    if Aborted then Exit;
    if AutoCalcColWidth then
      Columns.AutoCalcColWidth;
    if Aborted then Exit;
    try
      if FAllowCaptions then WriteCaptionRow;
      if Aborted then Exit;
      if FGoToFirstRecord then First;
      BeforeExport;
      if Aborted then Exit;
      Skip(SkipRecCount);
      if Aborted then Exit;
      RecordCounter := 0;
      while not EndOfFile and
        ((FExportRecCount = 0) or
         (FRecordCounter < FExportRecCount)) do
      begin
        if FAborted and not CanContinue then Break;
        AcceptRow := true;
        FillExportRow;
        if Assigned(FOnBeforeExportRow) then
          FOnBeforeExportRow(Self, FExportRow, AcceptRow);
        if AcceptRow then begin
          WriteDataRow;
          if Assigned(FOnExportedRecord)
            then FOnExportedRecord(Self, FRecordCounter);
        end;
        if FCurrentRecordOnly
          then Break
          else Next;
{$IFDEF WIN32}
        Sleep(0);
{$ENDIF}        
      end;
      AfterExport;
    finally
      EndExport;
    end;
  finally
    EnableControls;
  end;
end;

procedure TQExport3.SetExportedFields(const Value: TStrings);
begin
  FExportedFields.Assign(Value);
end;

procedure TQExport3.BeginExport;
var
  i: integer;
begin
  CheckTrial;
  Columns.Clear;
  Columns.Fill(false);

  FExportRow.Clear;
  FExportRow.FIndex.Clear;

  for i := 0 to Columns.Count - 1 do begin
    FExportRow.Add(Columns[i].Name, i);
    FExportRow.FIndex.AddObject(Columns[i].Name, TObject(i));
  end;
  FExportRow.FIndex.Sort;

  FAborted := false;

  {$IFNDEF NOGUI}
  case FExportSource of
    esListView: begin
      FSkipRecCount := MinimumInt(FSkipRecCount, FListView.Items.Count);
      if FExportRecCount > 0 then
        FExportRecCount := MinimumInt(FExportRecCount, FListView.Items.Count);
    end;
  end;
  {$ENDIF}
  if Assigned(FOnBeginExport) then FOnBeginExport(Self);
end;

procedure TQExport3.EndExport;
begin
  if Assigned(FOnEndExport) then FOnEndExport(Self);
end;

procedure TQExport3.SetCaptions(const Value: TStrings);
begin
  FCaptions.Assign(Value);
end;

procedure TQExport3.SetFooter(const Value: TStrings);
begin
  FFooter.Assign(Value);
end;

procedure TQExport3.SetHeader(const Value: TStrings);
begin
  FHeader.Assign(Value);
end;

procedure TQExport3.SetUserFormats(const Value: TStrings);
begin
  FUserFormats.Assign(Value);
end;

procedure TQExport3.SetFormats(const Value: TQExportFormats);
begin
  FFormats.Assign(Value);
end;

procedure TQExport3.AfterExport;
begin
  // do nothing
end;

procedure TQExport3.BeforeExport;
begin
// do nothing
end;

function TQExport3.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := [];
end;

procedure TQExport3.SetColumnsWidth(const Value: TStrings);
begin
  FColumnsWidth.Assign(Value);
end;

procedure TQExport3.SetColumnsAlign(const Value: TStrings);
begin
  FColumnsAlign.Assign(Value);
end;

procedure TQExport3.SetColumnsLength(const Value: TStrings);
begin
  FColumnsLength.Assign(Value);
end;

procedure TQExport3.CheckExportSource;
begin
  QExportCheckSource(ExportSource, FDataSet, FCustomSource
    {$IFNDEF NOGUI}, FDBGrid, FListView, FStringGrid{$ENDIF});
end;

function TQExport3.GetWriterClass: TQExportWriterClass;
begin
  Result := TQExportWriter;
end;

function TQExport3.GetWriter: TQExportWriter;
begin
  Result := TQExportWriter(FWriter);
end;

procedure TQExport3.WriteCaptionRow;
begin

end;

procedure TQExport3.WriteDataRow;
begin
end;

function TQExport3.CanContinue: boolean;
begin
  Result := not FAborted;
  if Assigned(FOnStopExport) then FOnStopExport(Self, Result);
  FAborted := not Result;
end;

procedure TQExport3.GetCellParams(RecNo, ColNo: integer; const Value: string;
  var Align: TQExportColAlign; AFont: TFont; var Background: TColor);
begin
  if Assigned(FOnGetCellParams) then
    FOnGetCellParams(Self, RecNo, ColNo, Value, Align, AFont, Background);
end;

procedure TQExport3.LoadProperties(IniFile: TIniFile);
var i: Integer;
begin
  with IniFile do begin
    //--- General
    GoToFirstRecord := ReadBool(S_GENERAL, S_GoToFirstRecord, GoToFirstRecord);
    ExportEmpty := ReadBool(S_GENERAL, S_ExportEmpty, ExportEmpty);
    CurrentRecordOnly := ReadBool(S_GENERAL, S_CurrentRecordOnly, CurrentRecordOnly);
    ExportRecCount := ReadInteger(S_GENERAL, S_ExportRecCount, ExportRecCount);
    SkipRecCount := ReadInteger(S_GENERAL, S_SkipRecCount, SkipRecCount);
    OnlyVisibleFields := ReadBool(S_GENERAL, S_OnlyVisibleFields, OnlyVisibleFields);
    AutoCalcStrType := ReadBool(S_GENERAL, S_AutoCalcStrType, AutoCalcStrType);
    CaptionRow := ReadInteger(S_GENERAL, S_CaptionRow, CaptionRow);
    //--- ExportedFields
    ExportedFields.Clear;
    IniFile.ReadSectionValues(S_FIELDS, ExportedFields);
    for i:=0 to ExportedFields.Count-1 do
      ExportedFields[i]:=Copy(ExportedFields[i], Pos('=',ExportedFields[i])+1,
        Length(ExportedFields[i]));
  end;
end;

procedure TQExport3.SaveProperties(IniFile: TIniFile);
var
  i: integer;
begin
  with IniFile do begin
    //--- General
    WriteBool(S_GENERAL, S_GoToFirstRecord, GoToFirstRecord);
    WriteBool(S_GENERAL, S_ExportEmpty, ExportEmpty);
    WriteBool(S_GENERAL, S_CurrentRecordOnly, CurrentRecordOnly);
    WriteInteger(S_GENERAL, S_ExportRecCount, ExportRecCount);
    WriteInteger(S_GENERAL, S_SkipRecCount, SkipRecCount);
    WriteBool(S_GENERAL, S_OnlyVisibleFields, OnlyVisibleFields);
    WriteBool(S_GENERAL, S_AutoCalcStrType, AutoCalcStrType);
    WriteInteger(S_GENERAL, S_CaptionRow, CaptionRow);
    //--- ExportedFields
    EraseSection(S_FIELDS);
    for i := 0 to ExportedFields.Count - 1 do
      WriteString(S_FIELDS, Format('%s%d', [S_Field,i]), ExportedFields[i]);
  end;
end;

{ TQExport3Text }

constructor TQExport3Text.Create(AOwner: TComponent);
begin
  inherited;
  {$IFDEF WIN32}
  FShowFile := false;
  {$ENDIF}
end;

procedure TQExport3Text.ShowResult;
begin
  {$IFDEF WIN32}
  if not Aborted then begin
    if FShowFile then
      ShellExecute(0, 'open', PChar(GetShowedFileName{FFileName}), '', '', SW_SHOWNORMAL);
    if FPrintFile then
      ShellExecute(0, 'print', PChar(GetPrintedFileName{FFileName}), '', '', SW_SHOWNORMAL);
  end;
  {$ENDIF}
end;

procedure TQExport3Text.SaveProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    //--- General
    WriteString(S_GENERAL, S_FileName, Self.FileName);
    {$IFDEF WIN32}
    WriteBool(S_GENERAL, S_ShowFile, ShowFile);
    WriteBool(S_GENERAL, S_PrintFile, PrintFile);
    {$ENDIF}
  end;
end;

procedure TQExport3Text.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    //--- General
    Self.FileName := ReadString(S_GENERAL, S_FileName, Self.FileName);
    {$IFDEF WIN32}
    ShowFile := ReadBool(S_GENERAL, S_ShowFile, ShowFile);
    PrintFile := ReadBool(S_GENERAL, S_PrintFile, PrintFile);
    {$ENDIF}
  end;
end;

function TQExport3Text.GetShowedFileName: string; 
begin
  Result := FFileName;
end;

function TQExport3Text.GetPrintedFileName: string; 
begin
  Result := FFileName;
end;

procedure TQExport3Text.Execute;
var
  FS: TFileStream;
  Dir: string;
begin
  Dir := ExtractFileDir(FFileName);
  if Dir = EmptyStr then Dir := ExtractFilePath(ParamStr(0));
  if not DirectoryExists(Dir) then begin
    ForceDirectories(Dir);
    if not DirectoryExists(Dir) then
      raise Exception.CreateFmt({$IFDEF WIN32}QExportLoadStr(QEM_DirNotFound){$ENDIF}
                                {$IFDEF LINUX}QEM_DirNotFound{$ENDIF}, [Dir]);
  end;
  FS := TFileStream.Create(FFileName, fmCreate);
  try
    ExportToStream(FS);
  finally
    FS.Free;
  end;

  ShowResult;
end;

{ TQExport3AdvancedText }

procedure TQExport3AdvancedText.SaveProperties(IniFile: TIniFile);
var
  i: integer;
begin
  inherited;
  with IniFile do begin
    EraseSection(S_HEADER);
    for i := 0 to Header.Count - 1 do
      WriteString(S_HEADER, Format('%s%d', [S_Line, i]), Header[i]);
    EraseSection(S_FOOTER);
    for i := 0 to Footer.Count - 1 do
      WriteString(S_FOOTER, Format('%s%d', [S_Line, i]), Footer[i]);
  end;
end;

procedure TQExport3AdvancedText.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    Header.Clear;
    ReadSectionValues(S_HEADER, Header);
    Footer.Clear;
    ReadSectionValues(S_FOOTER, Footer);
  end;
end;

{ TQExport3FormatText }

procedure TQExport3FormatText.SaveProperties(IniFile: TIniFile);
var
  i: integer;
begin
  inherited;
  with IniFile do begin
    WriteBool(S_GENERAL, S_AllowCaptions, AllowCaptions);
    //--- Captions
    EraseSection(S_CAPTIONS);
    for i := 0 to Captions.Count - 1 do
      WriteString(S_CAPTIONS, Format('%s%d', [S_Line, i]), Captions[i]);
    //--- Formats
    WriteString(S_FORMATS, S_Integer, Formats.IntegerFormat);
    WriteString(S_FORMATS, S_Float, Formats.FloatFormat);
    WriteString(S_FORMATS, S_Date, Formats.DateFormat);
    WriteString(S_FORMATS, S_Time, Formats.TimeFormat);
    WriteString(S_FORMATS, S_DateTime, Formats.DateTimeFormat);
    WriteString(S_FORMATS, S_Currency, Formats.CurrencyFormat);
    WriteString(S_FORMATS, S_BooleanTrue, Formats.BooleanTrue);
    WriteString(S_FORMATS, S_BooleanFalse, Formats.BooleanFalse);
    WriteString(S_FORMATS, S_NullString, Formats.NullString);
    //--- UserFormats
    EraseSection(S_USER_FORMATS);
    for i := 0 to UserFormats.Count - 1 do
      WriteString(S_USER_FORMATS, Format('%s%d', [S_Line, i]), UserFormats[i]);
  end;
end;

procedure TQExport3FormatText.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    AllowCaptions := ReadBool(S_GENERAL, S_AllowCaptions, AllowCaptions);
    //--- Captions
    Captions.Clear;
    ReadSectionValues(S_CAPTIONS, Captions);
    //--- Formats
    Formats.IntegerFormat := ReadString(S_FORMATS, S_Integer, Formats.IntegerFormat);
    Formats.FloatFormat := ReadString(S_FORMATS, S_Float, Formats.FloatFormat);
    Formats.DateFormat := ReadString(S_FORMATS, S_Date, Formats.DateFormat);
    Formats.TimeFormat := ReadString(S_FORMATS, S_Time, Formats.TimeFormat);
    Formats.DateTimeFormat := ReadString(S_FORMATS, S_DateTime, Formats.DateTimeFormat);
    Formats.CurrencyFormat := ReadString(S_FORMATS, S_Currency, Formats.CurrencyFormat);
    Formats.BooleanTrue := ReadString(S_FORMATS, S_BooleanTrue, Formats.BooleanTrue);
    Formats.BooleanFalse := ReadString(S_FORMATS, S_BooleanFalse, Formats.BooleanFalse);
    Formats.NullString := ReadString(S_FORMATS, S_NullString, Formats.NullString);
    //--- UserFormats
    UserFormats.Clear;
    ReadSectionValues(S_USER_FORMATS, UserFormats);
  end;
end;

{$IFNDEF NOGUI}
{ TQExport3Memory }

procedure TQExport3Memory.Execute;
var
  MS: TMemoryStream;
  s: string;
begin
  MS := TMemoryStream.Create;
  try
    ExportToStream(MS);
    MS.Position := 0;
    SetLength(s, MS.Size);
    MS.Read(s[1], MS.Size);
    Clipboard.AsText := s;
  finally
    MS.Free;
  end;
end;
{$ENDIF}

{ TQExportLocale }

{$IFDEF WIN32}
constructor TQExportLocale.Create;
begin
  FIDEMode := AnsiUpperCase(ExtractFileName(ParamStr(0))) = 'DELPHI32.EXE';
end;

procedure TQExportLocale.LoadDll(const Name: string);
begin
  if FLoaded then
    UnloadDll;

  FDllHandle := LoadLibrary(PChar(Name));
  FLoaded := FDllHandle <> HINSTANCE_ERROR;

  { TODO : Perhaps, any localization code will be needed here }
end;

function TQExportLocale.LoadStr(ID: Integer): string;
var
  Buffer: array[0..1023] of Char;
  Handle: THandle;
begin
  if Assigned(FOnLocalize) then
  begin
    Result := '';
    FOnLocalize(ID, Result);
    if Result <> '' then
      Exit;
  end;

  if FLoaded then
    Handle := FDllHandle
  else
    Handle := HInstance;

  if FIDEMode then
    Result := SysUtils.LoadStr(ID)
  else
    SetString(Result, Buffer, LoadString(Handle, ID, Buffer, SizeOf(Buffer)));
end;

procedure TQExportLocale.UnloadDll;
begin
  if FLoaded then
    FreeLibrary(FDllHandle);

  FLoaded := False;

  { TODO : Perhaps, any localization code will be needed here }
end;
{$ENDIF}

{ TQExport3FormatTextSQL }

procedure TQExport3FormatTextSQL.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do
  begin
    //--- Formats
    Formats.IntegerFormat := ReadString(S_FORMATS, S_Integer, Formats.IntegerFormat);
    Formats.FloatFormat := ReadString(S_FORMATS, S_Float, Formats.FloatFormat);
    Formats.DateFormat := ReadString(S_FORMATS, S_Date, Formats.DateFormat);
    Formats.TimeFormat := ReadString(S_FORMATS, S_Time, Formats.TimeFormat);
    Formats.DateTimeFormat := ReadString(S_FORMATS, S_DateTime, Formats.DateTimeFormat);
    Formats.CurrencyFormat := ReadString(S_FORMATS, S_Currency, Formats.CurrencyFormat);
    Formats.BooleanTrue := ReadString(S_FORMATS, S_BooleanTrue, Formats.BooleanTrue);
    Formats.BooleanFalse := ReadString(S_FORMATS, S_BooleanFalse, Formats.BooleanFalse);
    Formats.NullString := ReadString(S_FORMATS, S_NullString, Formats.NullString);
    //--- UserFormats
    UserFormats.Clear;
    ReadSectionValues(S_USER_FORMATS, UserFormats);
  end;
end;

procedure TQExport3FormatTextSQL.SaveProperties(IniFile: TIniFile);
var
  i: Integer;
begin
  inherited;
  with IniFile do
  begin
    //--- Formats
    WriteString(S_FORMATS, S_Integer, Formats.IntegerFormat);
    WriteString(S_FORMATS, S_Float, Formats.FloatFormat);
    WriteString(S_FORMATS, S_Date, Formats.DateFormat);
    WriteString(S_FORMATS, S_Time, Formats.TimeFormat);
    WriteString(S_FORMATS, S_DateTime, Formats.DateTimeFormat);
    WriteString(S_FORMATS, S_Currency, Formats.CurrencyFormat);
    WriteString(S_FORMATS, S_BooleanTrue, Formats.BooleanTrue);
    WriteString(S_FORMATS, S_BooleanFalse, Formats.BooleanFalse);
    WriteString(S_FORMATS, S_NullString, Formats.NullString);
    //--- UserFormats
    EraseSection(S_USER_FORMATS);
    for i := 0 to UserFormats.Count - 1 do
      WriteString(S_USER_FORMATS, Format('%s%d', [S_Line, i]), UserFormats[i]);
  end;
end;

initialization

finalization
{$IFDEF WIN32}
  Locale.Free;
  Locale := nil;
{$ENDIF}

end.
