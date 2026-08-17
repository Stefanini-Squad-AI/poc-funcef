{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDB;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, SysUtils, Graphics, Forms, TypInfo,
  ppTypes, ppCache, ppComm, Dialogs, ppDsIntf, ppRelatv, ppRTTI;

type


  TppField = class;
  TppMasterFieldLink = class;
  TppDataPipelineList = class;
  TppLinkRangeIndex = class;
  TppLinkRange = class;


  TppLinkedDataInfoRec = record
    FMasterRecordNo: Longint;
    FDetailRecordNo: Longint;
    FCompareLinkedData: Integer;
    FDetailDataBuf: Variant;
    FMasterDataBuf: Variant;
  end;


  { TppDataPipeline }
  TppDataPipeline = class(TppRelative)
    private
      FBookmarks: TList;
      FCurrentBookmark: Longint;
      FDataTraversed: Boolean;
      FDataView: TComponent;
      FDetailPipelines: TList;
      FDetailSkip: Boolean;
      FMasterFieldLinksPlaceHolder: String;
      FMasterDataPipeline: TppDataPipeline;
      FMoveBy: Integer;
      FRangeEnd: TppRangeEndType;
      FRangeEndCount: Longint;
      FRangeBegin: TppRangeBeginType;
      FSkipWhenNoRecords: Boolean;
      FState: TppDataPipelineStates;
      FTraversalCount: Longint;
      FVisible: Boolean;
      FNoLinkedData: Boolean;
      FLinkingEnabled: Boolean;
      FRecordNo: Longint;
      FRecordCount: Longint;
      FLinkedDataInfo: TppLinkedDataInfoRec;
      FLinkRangeIndex: TppLinkRangeIndex;
      FInternalTraversing: Boolean;

      FOnClose: TNotifyEvent;
      FOnDataChange: TNotifyEvent;
      FOnFirst: TNotifyEvent;
      FOnGotoBookmark: TNotifyEvent;
      FOnLast: TNotifyEvent;
      FOnMasterRecordPositionChange: TNotifyEvent;
      FOnNext: TNotifyEvent;
      FOnOpen: TNotifyEvent;
      FOnPrior: TNotifyEvent;
      FOnRecordPositionChange: TNotifyEvent;
      FOnTraversal: TNotifyEvent;

      procedure DetailSkipBackward;
      procedure DetailSkipForward;
      function  GetBOF: Boolean;
      function  GetDataView: TComponent;
      function  GetEOF: Boolean;
      function  GetFieldObjectForAlias(aFieldName: String): TppField;
      function  GetFieldValueForAlias(aFieldAlias: String): Variant;
      function  InChain(aDataPipeline: TppDataPipeline): Boolean;
      procedure InternalTraverseBy(aIncrement: Integer);
      procedure SetDataView(aDataView: TComponent);
      procedure SetMasterDataPipeline(aDataPipeline: TppDataPipeline);
      procedure SetMoveBy(aValue: Integer);
      procedure SetRangeBegin(aValue: TppRangeBeginType);
      procedure SetRangeEnd(aValue: TppRangeEndType);
      procedure SetRangeEndCount(aValue: Longint);
      procedure SetSkipWhenNoRecords(aValue: Boolean);
      procedure UpdateMoveBy;
      function  CheckLinkedBOF: Boolean;
      function  CheckLinkedEOF: Boolean;

    protected
      class function AppearsOnDelphiPalette: Boolean; override;

      procedure ReadState(Reader: TReader); override;

      procedure BuildDetailPipelineList(aPipelines: TList); virtual;
      function  CheckBOF: Boolean; virtual; abstract;
      function  CheckEOF: Boolean; virtual; abstract;
      procedure CloseDataSet; virtual; abstract;
      function  GetActive: Boolean; virtual; abstract;
      procedure DoOnActiveChange;
      procedure DoOnDataChange;
      procedure DoOnGotoBookmark;
      procedure GotoFirstRecord; virtual;
      procedure GotoLastRecord; virtual;
      procedure OpenDataSet; virtual; abstract;
      function TraverseBy(aIncrement: Integer): Integer; virtual; abstract;

      {field support}
      function  GetAutoCreateFields: Boolean; virtual; abstract;
      procedure SetAutoCreateFields(aValue: Boolean); virtual; abstract;
      function  GetCurrentField: TppField; virtual; abstract;
      function  GetCreatingDefaultFields: Boolean; virtual; abstract;
      function  GetFieldCount: Integer; virtual; abstract;
      function  GetFieldForIndex(aIndex: Integer): TppField; virtual; abstract;

      {link support}
      procedure ClearLinkedDataCache;
      function  GetLinkCount: Integer; virtual; abstract;
      function  GetLinkForIndex(aIndex: Integer): TppMasterFieldLink; virtual; abstract;
      procedure InitializeLinkedDataCache;

      {detail support}
      property DetailSkip: Boolean read FDetailSkip write FDetailSkip;
      property DetailPipelines: TList read FDetailPipelines;

      {field support}
      property AutoCreateFields: Boolean read GetAutoCreateFields write SetAutoCreateFields default True;
      property CreatingDefaultFields: Boolean read GetCreatingDefaultFields;

      property MoveBy: Integer read FMoveBy write SetMoveBy default 1;
      property RangeEnd: TppRangeEndType read FRangeEnd write SetRangeEnd default reLastRecord;
      property RangeEndCount: Longint read FRangeEndCount write SetRangeEndCount default 0;
      property RangeBegin: TppRangeBeginType read FRangeBegin write SetRangeBegin default rbFirstRecord;

      {events}
      property OnClose: TNotifyEvent read FOnClose write FOnClose;
      property OnDataChange: TNotifyEvent read FOnDataChange write FOnDataChange;
      property OnFirst: TNotifyEvent read FOnFirst write FOnFirst;
      property OnGotoBookmark: TNotifyEvent read FOnGotoBookmark write FOnGotoBookmark;
      property OnLast: TNotifyEvent read FOnLast write FOnLast;
      property OnMasterRecordPositionChange: TNotifyEvent read FOnMasterRecordPositionChange write FOnMasterRecordPositionChange;
      property OnNext: TNotifyEvent read FOnNext write FOnNext;
      property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
      property OnPrior: TNotifyEvent read FOnPrior write FOnPrior;
      property OnRecordPositionChange: TNotifyEvent read FOnRecordPositionChange write FOnRecordPositionChange;
      property OnTraversal: TNotifyEvent read FOnTraversal write FOnTraversal;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      function HasParent: Boolean; override;

      procedure ExcludeState(aStateSet: TppDataPipelineStates);
      procedure IncludeState(aStateSet: TppDataPipelineStates);

      procedure AddBookmark(aBookmark: Longint);
      procedure ClearBookmarkList;
      procedure Close;
      procedure DoOnTraversal;
      procedure First;
      procedure FreeBookmarks;
      function  FindField(aFieldName: String): Integer;
      procedure GetQualifiedFieldNames(aFieldNameList: TStrings);
      procedure Last;
      procedure Next;
      procedure Open;
      procedure Prior;
      procedure RemoveBookmark(aBookmark: Longint);
      procedure SetBookmark;
      procedure Skip;
      procedure SkipBack;
      procedure UpdateState;

      {new for 5.0}
      function  GetFieldIsNull(aFieldName: String): Boolean; virtual; abstract;

      {new for 4.0}                                                             
      procedure RecordPositionChanged; virtual;
      procedure MasterRecordPositionChanged; virtual;
      procedure StartOfMainReport(aPipelines: TList); virtual;
      procedure EndOfMainReport(aPipelines: TList); virtual;

      {3.0}
      procedure FreeBookmark(aBookmark: Longint); virtual; abstract;
      function  GetBookmark: Longint; virtual; abstract;
      function  GetDataSetName: String; virtual; abstract;
      function  GetFieldNames(aFieldNameList: TStrings): Boolean; virtual; abstract;
      function  GetFieldAlignment(aFieldName: String): TAlignment; virtual; abstract;
      function  GetFieldAsDouble(aFieldName: String): Double; virtual; abstract;
      function  GetFieldAsPicture(aFieldName: String): TPicture; virtual; abstract;
      function  GetFieldAsString(aFieldName: String): String; virtual; abstract;
      function  GetFieldDataType(aFieldName: String): TppDataType; virtual; abstract;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; virtual; abstract;
      function  GetFieldIsCalculated(aFieldName: String): Boolean; virtual; abstract;
      function  GetFieldSize(aFieldName: String): Integer; virtual; abstract;
      function  GetFieldValue(aFieldName: String): Variant; virtual; abstract;

      procedure GotoBookmark(aBookmark: Longint); virtual;
      function CompareBookmarks(aBookmark1, aBookmark2: Integer): Integer; virtual;

      {optional section

       These search/edit/insert routines are required if you want to load and
       save Report templates to database blob fields as in the End-User demo}

      procedure Edit;  virtual;
      procedure GetFieldAsStream(aFieldName: String; aStream: TStream); virtual;
      procedure Insert; virtual;
      procedure Delete; virtual;
      function  Locate(const aFieldName: String; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean; virtual;

      procedure Post; virtual;
      procedure SetFieldFromStream(aFieldName: String; aStream: TStream); virtual;
      procedure SetFieldValue(aFieldName: String; aValue: Variant); virtual;

      {end of optional section}

      {field support}
      procedure AddField(aField: TppField); virtual; abstract;
      procedure CreateDefaultFields; virtual; abstract;
      function  DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer; virtual; abstract;
      procedure FreeFields; virtual; abstract;
      function  RemoveField(aField: TppField): Integer; virtual; abstract;
      function  FieldAliasForFieldName(const aFieldName: String): String; virtual; abstract;
      function  FieldNameForFieldAlias(const aFieldAlias: String): String; virtual; abstract;
      function  GetFieldAliases(aFieldAliasList: TStrings): Boolean; virtual; abstract;
      function  GetFieldForAlias(const aFieldAlias: String): TppField; virtual; abstract;
      function  GetFieldForName(const aFieldName: String): TppField; virtual; abstract;
      function  IndexOfFieldName(const aFieldName: String): Integer; virtual; abstract;
      function  IndexOfField(aField: TppField): Integer; virtual; abstract;
      function  IsValidDataType(aDataType: TppDataType): Boolean; virtual; abstract;
      procedure InsertField(aPosition: Integer; aField: TppField); virtual; abstract;

      {new for 4.0}
      function  IsLinked: Boolean; virtual; abstract;
      procedure FreeLinks; virtual; abstract;
      function  CheckLinkedData: Integer; virtual; abstract;
      procedure LocateLinkedDataFirst; virtual; abstract;
      procedure LocateLinkedDataLast; virtual; abstract;
      procedure TraverseLinkedData(aIncrement: Integer); virtual; abstract;

      property LinkRangeList: TppLinkRangeIndex read FLinkRangeIndex;

      property Active: Boolean read GetActive;
      property CurrentBookmark: Longint read FCurrentBookmark write FCurrentBookmark;
      property BOF: Boolean read GetBOF;
      property DataTraversed: Boolean read FDataTraversed write FDataTraversed;
      property DataView: TComponent read GetDataView write SetDataView;
      property EOF: Boolean read GetEOF;
      property RecordNo: Longint read FRecordNo write FRecordNo;
      property State: TppDataPipelineStates read FState write FState;
      property SkipWhenNoRecords: Boolean read FSkipWhenNoRecords write SetSkipWhenNoRecords default True;
      property TraversalCount: Longint read FTraversalCount write FTraversalCount;
      property Visible: Boolean read FVisible write FVisible default True;

      {note: this enables you to code DataPipeline['myFieldAlias'] to get a value }
      property FieldValues[Index: String]: Variant read GetFieldValueForAlias; default;
      property FieldObjects[Index: String]: TppField read GetFieldObjectForAlias;

      {field related}
      property CurrentField: TppField read GetCurrentField;
      property Fields[Index: Integer]: TppField read GetFieldForIndex;
      property FieldCount: Integer read GetFieldCount;
      property MasterDataPipeline: TppDataPipeline read FMasterDataPipeline write SetMasterDataPipeline;
      property LinkCount: Integer read GetLinkCount;
      property Links[Index: Integer]: TppMasterFieldLink read GetLinkForIndex;
      property MasterFieldLinks: String read FMasterFieldLinksPlaceHolder write FMasterFieldLinksPlaceHolder;

  end; {class, TppDataPipeline}


  { TppCustomDataPipeline }
  TppCustomDataPipeline = class(TppDataPipeline)
    private
      FAbsolutePageCount: Longint;
      FAutoCreateFields: Boolean;
      FBookmarksExist: Boolean;
      FCreatingDefaultFields: Boolean;
      FCurrentField: TppField;
      FFieldsOutOfSync: Boolean;
      FLinks: TList;

      function CompareLinkedData: Integer;

    protected
      {overriden from TppRelative}
      procedure SaveComponents(Proc: TGetChildProc); override;

      {field support}
      function  GetAutoCreateFields: Boolean; override;
      function  GetCurrentField: TppField; override;
      function  GetCreatingDefaultFields: Boolean; override;
      function  GetFieldCount: Integer; override;
      function  GetFieldForIndex(aIndex: Integer): TppField; override;
      procedure SetAutoCreateFields(aValue: Boolean); override;
      function  SetFieldName(aFieldName: String): Boolean; virtual;
      procedure SyncFields;

      {field support}
      function  GetLinkCount: Integer; override;
      function  GetLinkForIndex(aIndex: Integer): TppMasterFieldLink; override;

      property FieldsOutOfSync: Boolean read FFieldsOutOfSync;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  GetValidName(aComponent: TComponent): String;  override;
      procedure Loaded; override;

      {overriden from TppCommunicator}
      procedure PropertyChange; override;

      {overriden from TppRelative}
      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  IndexOfChild(aChild: TppRelative): Integer; override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      {overriden from TppDataPipeline}
      function  GetFieldNames(aFieldNameList: TStrings): Boolean; override;
      function  GetFieldAlignment(aFieldName: String): TAlignment; override;
      function  GetFieldDataType(aFieldName: String): TppDataType; override;
      function  GetFieldDisplayWidth(aFieldName: String): Integer; override;
      function  GetFieldSize(aFieldName: String): Integer; override;

      {field support}
      procedure AddField(aField: TppField); override;
      procedure CreateDefaultFields; override;
      function  DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer; override;
      function  RemoveField(aField: TppField): Integer; override;
      function  FieldAliasForFieldName(const aFieldName: String): String; override;
      function  FieldNameForFieldAlias(const aFieldAlias: String): String; override;
      procedure FreeFields; override;
      function  GetFieldAliases(aFieldAliasList: TStrings): Boolean; override;
      function  GetFieldForAlias(const aFieldAlias: String): TppField; override;
      function  GetFieldForName(const aFieldName: String): TppField; override;
      function  IndexOfFieldName(const aFieldName: String): Integer; override;
      function  IndexOfField(aField: TppField): Integer; override;
      function  IsValidDataType(aDataType: TppDataType): Boolean; override;
      procedure InsertField(aPosition: Integer; aField: TppField); override;

      {link support}
      function  IsLinked: Boolean; override;
      function  CheckLinkedData: Integer; override;
      procedure FreeLinks; override;
      procedure MasterRecordPositionChanged; override;
      procedure LocateLinkedDataFirst; override;
      procedure LocateLinkedDataLast; override;
      procedure TraverseLinkedData(aIncrement: Integer); override;

    published
      property MasterFieldLinks stored False;
  end; {class, TppCustomDataPipeline}


  { TppField }
  TppField = class(TppRelative)
    private
      FAlignment: TAlignment;
      FAutoSearch: Boolean;
      FLinkable: Boolean;
      FColumnWidth: Integer;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FDisplayWidth: Integer;
      FFieldLength: Integer;
      FFieldAlias: String;
      FFieldName: String;
      FFirstField: Boolean;
      FGroupOrder: Integer;
      FMandatory: Boolean;
      FReportComponent: TppCommunicator;
      FReportLabel: TppCommunicator;
      FSelectable: Boolean;
      FSelectOrder: Integer;
      FSearchable: Boolean;
      FSearch: Boolean;
      FSearchExpression: String;
      FSearchOrder: Integer;
      FSelectedIndex: Integer;
      FShowAllValues: Boolean;
      FSortable: Boolean;
      FSortOrder: Integer;
      FSortOrderType: TppSortOrderType;
      FSort: Boolean;
      FSortExpression: String;
      FSortType: TppSortOrderType;
      FTableAlias: String;
      FTableName: String;

      function  GetDataPipeline: TppDataPipeline;
      procedure SetDataPipeline(aDataPipeline: TppDataPipeline);
      procedure SetDataType(aDataType: TppDataType);

      function  GetFieldAsDouble: Double;
      function  GetFieldAsPicture: TPicture;
      function  GetFieldAsString: String;
      function  GetFieldIsNull: Boolean;
      function  GetFieldValue: Variant;

      procedure ReadVisible(Reader: TReader);

    protected
      procedure SetFieldName(const aFieldName: String); virtual;
      procedure SetMandatory(aValue: Boolean); virtual;
      procedure SetSearchExpression(const aExpression: String); virtual;
      procedure SetShowAllValues(aValue: Boolean); virtual;

      procedure DefineProperties(Filer: TFiler); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;
      
      property AsDouble: Double read GetFieldAsDouble;
      property AsPicture: TPicture read GetFieldAsPicture;
      property AsString: String read GetFieldAsString;
      property IsNull: Boolean read GetFieldIsNull;
      property DataPipeline: TppDataPipeline read GetDataPipeline write SetDataPipeline;
      property Value: Variant read GetFieldValue;

      {these properties used by the report wizard only}
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch default False;
      property ColumnWidth: Integer read FColumnWidth write FColumnWidth;
      property FirstField: Boolean read FFirstField write FFirstField default False;
      property ReportComponent: TppCommunicator read FReportComponent write FReportComponent;
      property ReportLabel: TppCommunicator read FReportLabel write FReportLabel;

      {this property used by the FieldListBuilder}
      property SelectedIndex: Integer read FSelectedIndex write FSelectedIndex;

    published
      property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write SetFieldName;
      property FieldLength: Integer read FFieldLength write FFieldLength;
      property Linkable: Boolean read FLinkable write FLinkable default True;
      property GroupOrder: Integer read FGroupOrder write FGroupOrder default -1;
      property DataType: TppDataType read FDataType write SetDataType default dtString;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property Mandatory: Boolean read FMandatory write SetMandatory default False;
      property Position;
      property Selectable: Boolean read FSelectable write FSelectable default True;
      property SelectOrder: Integer read FSelectOrder write FSelectOrder default -1;
      property Searchable: Boolean read FSearchable write FSearchable default True;
      property Search: Boolean read FSearch write FSearch default False;
      property SearchExpression: String read FSearchExpression write SetSearchExpression;
      property SearchOrder: Integer read FSearchOrder write FSearchOrder default -1;
      property ShowAllValues: Boolean read FShowAllValues write SetShowAllValues default False;
      property Sortable: Boolean read FSortable write FSortable default True;
      property Sort: Boolean read FSort write FSort default False;
      property SortOrder: Integer read FSortOrder write FSortOrder default -1;
      property SortType: TppSortOrderType read FSortType write FSortType default soAscending;
      property SortExpression: String read FSortExpression write FSortExpression;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;

  end; {class, TppField}

  { TppAutoSearchField }
  TppAutoSearchField = class(TppField)
    private
      FAsFilter: Boolean;
      FAutoSearchPanel: TComponent;
      FCriteria: TComponent;
      FDataPipelineName: String;
      FDataView: TComponent;
      FDelimiter: String;
      FLastField: Boolean;
      FOnChange: TNotifyEvent;
      FParentControl: TComponent;
      FSearchOperator: TppSearchOperatorType;
      FWildCard: String;

      function  ConvertValue(const aValue: String): Variant;
      procedure DoOnChange;
      function  GetValue: Variant;
      function  GetValues(aIndex: Integer): Variant;
      function  GetValueCount: Integer;
      procedure SetCriteria(aCriteria: TComponent);
      procedure SetDataPipelineName(const aName: String);
      procedure SetSearchOperator(aOperator: TppSearchOperatorType);

    protected
      procedure SetFieldName(const aFieldName: String); override;
      procedure SetMandatory(aValue: Boolean); override;
      procedure SetSearchExpression(const aExpression: String); override;
      procedure SetShowAllValues(aValue: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      
      function Description: String;
      function FilterString: String;
      function FormattedExpression: String;
      function FormatValue(aValue: String): String;
      function OperatorAsString: String;
      function OperatorDesc: String;
      function SQLString: String;
      function Valid: Boolean;

      property AutoSearchPanel: TComponent read FAutoSearchPanel write FAutoSearchPanel;
      property Criteria: TComponent read FCriteria write SetCriteria;
      property DataPipelineName: String read FDataPipelineName write SetDataPipelineName;
      property DataView: TComponent read FDataView write FDataView;
      property LastField: Boolean read FLastField write FLastField;
      property ParentControl: TComponent read FParentControl write FParentControl;

      property OnChange: TNotifyEvent read FOnChange write FOnChange;
      property Value: Variant read GetValue;
      property Values[Index: Integer]: Variant read GetValues;
      property ValueCount: Integer read GetValueCount;

    published
      property Delimiter: String read FDelimiter write FDelimiter;
      property SearchOperator: TppSearchOperatorType read FSearchOperator write SetSearchOperator default soEqual;
      property WildCard: String read FWildCard write FWildCard;

  end; {class, TppAutoSearchField}

  { TppMasterFieldLink }
  TppMasterFieldLink = class(TppRelative)
    private
      FMasterFieldName: String;
      FDetailFieldName: String;
      FDetailSortOrder: TppSortOrderType;
      FIsCaseSensitive: Boolean;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;

      function GetMasterDataPipeline: TppDataPipeline;
      function GetMasterField: TppField;
      function GetDetailDataPipeline: TppDataPipeline;
      function GetDetailField: TppField;

    published
      property MasterFieldName: String read FMasterFieldName write FMasterFieldName;
      property DetailFieldName: String read FDetailFieldName write FDetailFieldName;
      property DetailSortOrder: TppSortOrderType read FDetailSortOrder write FDetailSortOrder;
      property IsCaseSensitive: Boolean read FIsCaseSensitive write FIsCaseSensitive default False;

  end; {class, TppMasterFieldLink}


  {TppLinkRange - used by detail pipes at run-time to build an index for optimized performance}

 {TppLinkRange}
  TppLinkRange = class
    private
      FBeginRecordNo: Integer;
      FEndRecordNo: Integer;

    public
      property BeginRecordNo: Integer read FBeginRecordNo write FBeginRecordNo;
      property EndRecordNo: Integer read FEndRecordNo write FEndRecordNo;

  end; {class, TppLinkRange}

  {TppLinkRangeIndex - used by detail pipes at run-time to optimize linked dataset navigation}

  {TppLinkRangeIndex}
  TppLinkRangeIndex = class(TList)
    private
      FMasterRecNoList: TList;

      function GetLinkRangeValue(aMasterRecNo: Integer): TppLinkRange;
      function SafeGetRangeValue(aMasterRecNo: Integer): TppLinkRange;
      
    public
      constructor Create; virtual;
      destructor Destroy; override;

      function AddLinkRange(aMasterRecNo: Integer): TppLinkRange;
      procedure ClearValues;

      function GetBeginRecordNo(aMasterRecNo: Integer; var aRecordNo: Integer): Boolean;
      function GetEndRecordNo(aMasterRecNo: Integer; var aRecordNo: Integer): Boolean;
      function GetPosition(aMasterRecNo: Integer): Integer;
      function CheckNoLinkedData(aMasterRecNo: Integer): Boolean;
      procedure SetBeginRecordNo(aMasterRecNo, aRecordNo: Integer);
      procedure SetEndRecordNo(aMasterRecNo, aRecordNo: Integer);
      procedure SetNoLinkedData(aMasterRecNo: Integer);

      property Values[Index: Integer]: TppLinkRange read GetLinkRangeValue;

  end; {class, TppLinkRangeIndex}


  { TppDataPipelineList }
  TppDataPipelineList = class(TStringList)
    private
      FReport: TComponent;
      FFormDesigner: TppFormDesigner;

      procedure AddDataPipeline(aDataPipeline: TComponent);

      procedure BuildList;

      procedure BuildDataListFromDataModule(aDataModule: TDataModule);
      procedure BuildDataListFromDesigner(aDesigner: TppFormDesigner);
      procedure BuildDataListFromOwner(aOwner: TComponent);

      procedure GetDataItemsCallback(const S: String);

      function  GetDataPipelineForName(aName: String): TppDataPipeline;

      procedure SetReport(aReport: TComponent);

    public
      constructor Create(aReport: TComponent); virtual;

      destructor Destroy; override;

      function  GetPipeline(aIndex: Integer): TppDataPipeline;
      function  GetPipelineForComponentName(aName: String): TppDataPipeline;
      procedure Refresh;

      property Report: TComponent read FReport write SetReport;

      property Pipelines[aUserName: String]: TppDataPipeline read GetDataPipelineForName;

    end; {class, TppDataPipelineList}


{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppDataPipelineRTTI }
  TraTppDataPipelineRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppDataPipelineRTTI}

  { TraTppFieldRTTI }
  TraTppFieldRTTI = class(TraTppRelativeRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppFieldRTTI}

  { TraTppAutoSearchFieldRTTI }
  TraTppAutoSearchFieldRTTI = class(TraTppFieldRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetParams(const aMethodName: String): TraParamList; override;
      class function  CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
  end; {class, TraTppAutoSearchFieldRTTI}

implementation

uses
  ppClass, ppUtils;


{******************************************************************************
 *
 ** D A T A   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Create }

constructor TppDataPipeline.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  EventNotifies := [ciPipelineRecordPositionChange];

  FBookmarks := nil;
  FCurrentBookmark := 0;
  FDetailPipelines := nil;
  FDetailSkip := False;
  FDataView := nil;
  FDataTraversed := False;
  FMasterFieldLinksPlaceHolder := '';
  FMoveBy := 1;
  FRangeBegin := rbFirstRecord;
  FRangeEnd := reLastRecord;
  FRangeEndCount := 0;
  FSkipWhenNoRecords := True;
  FState := [];
  FTraversalCount := 0;
  FVisible := True;
  FLinkingEnabled := False;
  FLinkedDataInfo.FDetailRecordNo := -1;
  FLinkedDataInfo.FMasterREcordNo := -1;
  FLinkedDataInfo.FDetailDataBuf := NULL;
  FLinkedDataInfo.FMasterDataBuf := NULL;
  FLinkRangeIndex := nil;
  FInternalTraversing := False;


  FOnClose := nil;
  FOnFirst := nil;
  FOnGotoBookmark := nil;
  FOnLast := nil;
  FOnNext := nil;
  FOnOpen := nil;
  FOnPrior := nil;
  FOnTraversal := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Destroy }

destructor TppDataPipeline.Destroy;
begin

  SetDataView(nil);
  FBookmarks.Free;
  
  FDetailPipelines.Free;
  FLinkRangeIndex.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Notify }

procedure TppDataPipeline.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) then
    begin

      if (aCommunicator = FMasterDataPipeline)  then
        begin
          FMasterDataPipeline := nil;
          FreeLinks;
        end;

    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppDataPipeline.AppearsOnDelphiPalette}

class function TppDataPipeline.AppearsOnDelphiPalette: Boolean;
begin

  {this class function enables TppRelative descendants to decide whether to use
   the TComponent fake Left, Top  properties required for non-visual components
   installed onto the Delphi component palette}
  Result := True;

end; {class function, AppearsOnDelphiPalette}

{------------------------------------------------------------------------------}
{ TppDataPipeline.HasParent }

function TppDataPipeline.HasParent: Boolean;
begin
  Result := False;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppDataPipeline.CheckLinkedBOF }

function TppDataPipeline.CheckLinkedBOF: Boolean;
var
  liBeginRecordNo: Integer;
begin

  if (ppdaNoRecords in FMasterDataPipeline.State) then
    Result := True
  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.GetBeginRecordNo(FMasterDataPipeline.RecordNo, liBeginRecordNo) then
    Result := CheckBOF or FNoLinkedData or (FRecordNo < liBeginRecordNo)
  else
    Result := CheckBOF or FNoLinkedData or (CheckLinkedData < 0);

end;  {function, CheckLinkedBOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.CheckLinkedEOF }

function TppDataPipeline.CheckLinkedEOF: Boolean;
var
  liEndRecordNo: Integer;
begin

  if (ppdaNoRecords in FMasterDataPipeline.State) then
    Result := True
  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.GetEndRecordNo(FMasterDataPipeline.RecordNo, liEndRecordNo) then
    Result := CheckEOF or FNoLinkedData or (FRecordNo > liEndRecordNo)
  else
    Result := CheckEOF or FNoLinkedData or (CheckLinkedData > 0)

end;  {function, CheckLinkedEOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.RecordPositionChanged }

procedure TppDataPipeline.RecordPositionChanged;
begin
  if IsLinked and not(FLinkingEnabled) then Exit;

  if Assigned(FOnRecordPositionChange) then FOnRecordPositionChange(Self);

  SendEventNotify(Self, ciPipelineRecordPositionChange, nil);

end; {procedure, RecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppDataPipeline.MasterRecordPositionChanged }

procedure TppDataPipeline.MasterRecordPositionChanged;
begin

  if Assigned(FOnMasterRecordPositionChange) then FOnMasterRecordPositionChange(Self);

  SendEventNotify(Self, ciPipelineMasterRecordPositionChange, nil);

end; {procedure, MasterRecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppDataPipeline.StartOfMainReport }

procedure TppDataPipeline.StartOfMainReport(aPipelines: TList);
var
  liIndex: Integer;
  lbIncludeAllRecords: Boolean;
  lPipeline: TppDataPipeline;

begin
  InitializeLinkedDataCache;

  FDataTraversed := False;

  {initialize info used for skip when no records}
  FDetailSkip := False;

  if (FDetailPipelines = nil) then
    FDetailPipelines := TList.Create
  else
    FDetailPipelines.Clear;

  BuildDetailPipelineList(aPipelines);


  lbIncludeAllRecords := False;

  for liIndex := 0 to FDetailPipelines.Count - 1 do
    begin
      lPipeline := FDetailPipelines[liIndex];

      {check whether pipelines have SkipWhenNoRecords set to True}
      if not (lPipeline.SkipWhenNoRecords) then
        lbIncludeAllRecords := True;

    end;

  {if any detail pipelines have SkipWhenNoRecords set to False, then
   clear detail pipeline list}
  if lbIncludeAllRecords then
    FDetailPipelines.Clear;

  if (FDetailPipelines.Count > 0) then
    {set flag used to indicate whether pipeline traversal should check detail pipelines}
    FDetailSkip := True
  else
    begin
      FDetailPipelines.Free;

      FDetailPipelines := nil;
    end;

end; {procedure, StartOfMainReport}

{------------------------------------------------------------------------------}
{ TppDataPipeline.BuildDetailPipelineList}

procedure TppDataPipeline.BuildDetailPipelineList(aPipelines: TList);
var
  liIndex: Integer;
  lPipeline: TppDataPipeline;

begin

  FDetailPipelines.Clear;

  for liIndex := 0 to aPipelines.Count - 1 do
    begin
      lPipeline := TppDataPipeline(aPipelines[liIndex]);

      {check for detail pipelines}
      if (lPipeline <> Self) and (lPipeline.MasterDataPipeline = Self) then
        FDetailPipelines.Add(lPipeline);
    end;

end; {procedure, BuildDetailPipelineList}

{------------------------------------------------------------------------------}
{ TppDataPipeline.InitializeLinkedDataCache }

procedure TppDataPipeline.InitializeLinkedDataCache;
begin

  FLinkingEnabled := False;

  {initialize info used for pipeline linking}
  if IsLinked then
    begin
      {for linked detail pipes need to explicitly set the record position to the
       first record in the dataset}
      GotoFirstRecord;
      FRecordNo := 0;

      FNoLinkedData := False;
      FLinkedDataInfo.FDetailRecordNo := -1;
      FLinkedDataInfo.FMasterRecordNo := -1;
      FLinkedDataInfo.FDetailDataBuf := VarArrayCreate([0, LinkCount - 1], varVariant);
      FLinkedDataInfo.FMasterDataBuf := VarArrayCreate([0, LinkCount - 1], varVariant);
      if (FLinkRangeIndex = nil) then
        FLinkRangeIndex := TppLinkRangeIndex.Create
      else
        FLinkRangeIndex.ClearValues;

    end;

  FLinkingEnabled := True;

end;  {procedure, InitializeLinkedDataCache}

{------------------------------------------------------------------------------}
{ TppDataPipeline.ClearLinkedDataCache }

procedure TppDataPipeline.ClearLinkedDataCache;
begin

  {initialize info used for pipeline linking}
  FRecordNo := -1;
  FLinkingEnabled := False;

  if IsLinked then
    begin
      FNoLinkedData := False;
      FLinkedDataInfo.FDetailRecordNo := -1;
      FLinkedDataInfo.FMasterRecordNo := -1;
      FLinkedDataInfo.FDetailDataBuf := Null;
      FLinkedDataInfo.FMasterDataBuf := Null;
      FLinkRangeIndex.Free;
      FLinkRangeIndex := nil;
    end;

end;  {procedure, ClearLinkedDataCache}



{------------------------------------------------------------------------------}
{ TppDataPipeline.EndOfMainReport }

procedure TppDataPipeline.EndOfMainReport(aPipelines: TList);
begin


end; {procedure, EndOfMainReport}

{------------------------------------------------------------------------------}
{ TppDataPipeline.InChain }

function TppDataPipeline.InChain(aDataPipeline: TppDataPipeline): Boolean;
begin
  if (FMasterDataPipeline <> nil) then
    begin
      if (FMasterDataPipeline = aDataPipeline) then
        Result := True
      else
        Result := FMasterDataPipeline.InChain(aDataPipeline);
    end
  else
    Result := False;
end; {function, InChain}


{------------------------------------------------------------------------------}
{ TppDataPipeline.SetMasterDataPipeline }

procedure TppDataPipeline.SetMasterDataPipeline(aDataPipeline: TppDataPipeline);
begin

  if (aDataPipeline = Self) then Exit;

  if (aDataPipeline <> nil) and aDataPipeline.InChain(Self) then Exit;

  if (FMasterDataPipeline <> nil) then
    FMasterDataPipeline.RemoveEventNotify(Self);

  FMasterDataPipeline := aDataPipeline;

  if (FMasterDataPipeline = nil) then
    FreeLinks;

  if (FMasterDataPipeline <> nil) then
    FMasterDataPipeline.AddEventNotify(Self);

end; {procedure, SetMasterDataPipeline}

{------------------------------------------------------------------------------}
{ TppDataPipeline.EventNotify }

procedure TppDataPipeline.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FMasterDataPipeline) and (aEventID = ciPipelineRecordPositionChange) then
    MasterRecordPositionChanged;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnTraversal }

procedure TppDataPipeline.DoOnTraversal;
begin
  if Assigned(FOnTraversal) then FOnTraversal(Self);

  SendEventNotify(Self, ciPipelineTraversal, nil);
end; {procedure, DoOnTraversal}

{------------------------------------------------------------------------------}
{ TppDataPipeline.AddBookmark }

procedure TppDataPipeline.AddBookmark(aBookmark: Longint);
begin
  if (FBookmarks = nil) then
    FBookmarks := TList.Create;

  FBookmarks.Add(TObject(aBookmark));

end; {procedure, AddBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetBookmark }

procedure TppDataPipeline.SetBookmark;
begin
  AddBookmark(GetBookmark);
end; {procedure, SetBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.RemoveBookmark }

procedure TppDataPipeline.RemoveBookmark(aBookmark: Longint);
var
  liIndex: Integer;
begin
  if (FBookmarks = nil) then Exit;

  liIndex := FBookmarks.IndexOf(TObject(aBookmark));

  if (liIndex <> -1) then
    FBookmarks.Delete(liIndex);

  if (FBookmarks.Count = 0) then
    begin
      FBookmarks.Free;

      FBookmarks := nil;
    end;

end; {procedure, RemoveBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GotoBookmark }

procedure TppDataPipeline.GotoBookmark(aBookmark: Longint);
begin
  DoOnGotoBookmark;
  
end; {procedure, GotoBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.CompareBookmarks }

function TppDataPipeline.CompareBookmarks(aBookmark1, aBookmark2: Integer): Integer;
begin

  if aBookmark1 = aBookmark2 then
    Result := 0
  else if aBookmark1 < aBookmark2 then
    Result := -1
  else 
    Result := 1;

end; {procedure, CompareBookmarks}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnGotoBookmark }

procedure TppDataPipeline.DoOnGotoBookmark;
begin
  if Assigned(FOnGotoBookmark) then FOnGotoBookmark(Self);

  SendEventNotify(Self, ciPipelineGotoBookmark, nil);

  RecordPositionChanged;

end; {procedure, DoOnGotoBookmark}

{------------------------------------------------------------------------------}
{ TppDataPipeline.FreeBookmarks }

procedure TppDataPipeline.FreeBookmarks;
var
  liBookmark: Integer;
  liBookmarks: Integer;
begin

  if (FBookmarks = nil) then Exit;

  {free the list of bookmarks}
  liBookmarks := FBookmarks.Count;

  for liBookmark := 0 to liBookmarks - 1 do
    FreeBookmark(Longint(FBookmarks[liBookmark]));

  ClearBookmarkList;

end; {procedure, FreeBookmarks}

{------------------------------------------------------------------------------}
{ TppDataPipeline.ClearBookmarkList }

procedure TppDataPipeline.ClearBookmarkList;
begin

  if (FBookmarks <> nil) then
    begin
      FBookmarks.Free;

      FBookmarks := nil;
    end;

end; {procedure, ClearBookmarkList}

{------------------------------------------------------------------------------}
{ TppDataPipeline.FindField }

function  TppDataPipeline.FindField(aFieldName: String): Integer;
var
  lFieldNames: TStringList;

begin
  Result := -1;

  lFieldNames := TStringList.Create;

  if GetFieldNames(lFieldNames) then
    Result := lFieldNames.IndexOf(aFieldName);

  lFieldNames.Free;

end; {function, FindField}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetMoveBy }

procedure TppDataPipeline.SetMoveBy(aValue: Integer);
begin
  FMoveBy := aValue;
  DoOnDataChange;

end; {procedure, SetMoveBy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetSkipWhenNoRecords }

procedure TppDataPipeline.SetSkipWhenNoRecords(aValue: Boolean);
begin
  FSkipWhenNoRecords := aValue;
  DoOnDataChange;

end; {procedure, SetSkipWhenNoRecords}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeBegin }

procedure TppDataPipeline.SetRangeBegin(aValue: TppRangeBeginType);
begin

  FRangeBegin := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateMoveBy;


end; {procedure, SetRangeBegin}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeEnd }

procedure TppDataPipeline.SetRangeEnd(aValue: TppRangeEndType);
begin

  FRangeEnd := aValue;

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateMoveBy;

end; {procedure, SetRangeEnd}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetRangeEndCount }

procedure TppDataPipeline.SetRangeEndCount(aValue: Longint);
begin
  FRangeEndCount:= aValue;
  DoOnDataChange;

end; {procedure, SetRangeEndCount}

{------------------------------------------------------------------------------}
{ TppDataPipeline.UpdateMoveBy }

procedure TppDataPipeline.UpdateMoveBy;
begin
  {if RangeEnd is FirstRecord, must move backward to encounter BOF, which is used
   for the ending condition}
  if (FRangeEnd = reFirstRecord) then
    FMoveBy := -1

  else if (FRangeBegin = rbLastRecord) and (FRangeEnd <> reLastRecord) then
    FMoveBy := -1

  else
    FMoveBy := 1;

  DoOnDataChange;

end; {procedure, UpdateMoveBy}

{------------------------------------------------------------------------------}
{ TppDataPipeline.IncludeState }

procedure TppDataPipeline.IncludeState(aStateSet: TppDataPipelineStates);
begin
  FState := FState + aStateSet;
end; {procedure, IncludeState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.ExcludeState }

procedure TppDataPipeline.ExcludeState(aStateSet: TppDataPipelineStates);
begin
  FState := FState - aStateSet;
end; {procedure, ExcludeState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnActiveChange }

procedure TppDataPipeline.DoOnActiveChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  if (FreeingChildren) or (CreatingDefaultFields) then Exit;

  SendNotify(Self, ppopActiveChange);

  SendEventNotify(Self, ciPipelineActiveChange, nil);

end; {procedure, DoOnActiveChange}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DoOnDataChange }

procedure TppDataPipeline.DoOnDataChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;
  
  if (FreeingChildren) or (CreatingDefaultFields) then Exit;

  if FInternalTraversing then Exit;         

  UpdateState;

  SendNotify(Self, ppopDataChange);

  SendEventNotify(Self, ciPipelineDataChange, nil);

  if Assigned(FOnDataChange) then FOnDataChange(Self);

end; {procedure, DoOnDataChange}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Open }

procedure TppDataPipeline.Open;
begin

  OpenDataSet;

  UpdateState;

  if Assigned(FOnOpen) then FOnOpen(Self);

  SendEventNotify(Self, ciPipelineOpen, nil);

end; {procedure, Open}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Close }

procedure TppDataPipeline.Close;
begin

  SendEventNotify(Self, ciDataSetClose, nil);

  CloseDataSet;

  FState := [];

  DoOnDataChange;

  if Assigned(FOnClose) then FOnClose(Self);

  SendEventNotify(Self, ciPipelineClose, nil);

end; {procedure, Close}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GotoFirstRecord }

procedure TppDataPipeline.GotoFirstRecord;
begin

  RecordPositionChanged;

end; {procedure, GotoFirstRecord}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GotoLastRecord }

procedure TppDataPipeline.GotoLastRecord;
begin
  
  RecordPositionChanged;

end; {procedure, GotoLastRecord}

{------------------------------------------------------------------------------}
{ TppDataPipeline.InternalTraverseBy }

procedure TppDataPipeline.InternalTraverseBy(aIncrement: Integer);
var
  liMoveBy: Integer;

begin

  {optimize by setting state of InternalTraversing - do not want DoOnDataChange firing}
  FInternalTraversing := True;

  try
  
    {the following line of code is required for linked datapipelines, calling
     goto first record here will put the dataset into a BOF true, EOF false state}
    if (aIncrement = 0) and (FRecordNo = 0) then
      GotoFirstRecord;

    liMoveBy := TraverseBy(aIncrement);

    if FMoveBy >= 0 then
      begin
        {increase the RecordNo when moving forward}
        if aIncrement > 0 then
          FRecordNo := FRecordNo + Abs(liMoveBy)
        else
          FRecordNo := FRecordNo - Abs(liMoveBy);
      end
    else
      begin
        {increase the RecordNo when moving backward}
        if aIncrement > 0 then
          FRecordNo := FRecordNo - Abs(liMoveBy)
        else
          FRecordNo := FRecordNo + Abs(liMoveBy);
      end;

  finally
    FInternalTraversing := False;

    {finally, call data change}
    DoOnDataChange;

    RecordPositionChanged;

  end;

end; {procedure, InternalTraverseBy}


{------------------------------------------------------------------------------}
{ TppDataPipeline.Skip }

procedure TppDataPipeline.Skip;
begin

  {goto next record without incrementing traversal count}
  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      if (FTraversalCount < FBookmarks.Count) then
        GotoBookmark(Longint(FBookmarks[FTraversalCount + 1]));
    end

  else
    begin
      if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy)
      else
        InternalTraverseBy(FMoveBy);
    end; {if, not using bookmarklist}

  UpdateState;

end; {procedure, Skip}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SkipBack }

procedure TppDataPipeline.SkipBack;
begin

  {goto next record without incrementing traversal count}
  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      if (FTraversalCount > 0) then
        GotoBookmark(Longint(FBookmarks[FTraversalCount - 1]));
    end

  else
    begin
      if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy * -1)
      else
        InternalTraverseBy(FMoveBy * -1);
    end; {if, not using bookmarklist}

  UpdateState;

end; {procedure, SkipBack}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DetailSkipForward }

procedure TppDataPipeline.DetailSkipForward;
var
  liIndex: Integer;
  lbSkip: Boolean;
  lDataPipeline: TppDataPipeline;
begin

  if not(FDetailSkip) then Exit;

  lbSkip := True;

  while lbSkip and not(EOF) do
    begin

      {check all details, to see if any have data}
      liIndex := 0;

      while lbSkip and (liIndex < FDetailPipelines.Count) do
        begin
          lDataPipeline := TppDataPipeline(FDetailPipelines[liIndex]);

          if not(ppdaNoRecords in lDataPipeline.State) then
            lbSkip := False
          else
            Inc(liIndex);
        end;

      {if all details have no data, skip to next record}
      if lbSkip then
        begin
          Skip;
          FDataTraversed := True;
        end;
    end;

end; {procedure, DetailSkipForward}

{------------------------------------------------------------------------------}
{ TppDataPipeline.DetailSkipBackward }

procedure TppDataPipeline.DetailSkipBackward;
var
  liIndex: Integer;
  lbSkipBack: Boolean;
  lDataPipeline: TppDataPipeline;
begin

  if not(FDetailSkip) then Exit;

  lbSkipBack := True;

  while lbSkipBack and not(BOF) do
    begin

      liIndex := 0;

      {check all details, to see if any have data}
      while lbSkipBack and (liIndex < FDetailPipelines.Count) do
        begin
          lDataPipeline := TppDataPipeline(FDetailPipelines[liIndex]);

          if not(ppdaNoRecords in lDataPipeline.State) then
            lbSkipBack := False
          else
            Inc(liIndex);
        end;

      {if all details have no data, skip to previous record}
      if lbSkipBack then
        begin
          SkipBack;
          FDataTraversed := True;
        end;
    end;

end; {procedure, DetailSkipBackward}

{------------------------------------------------------------------------------}
{ TppDataPipeline.First }

procedure TppDataPipeline.First;
begin

  FDataTraversed := False;
  FTraversalCount := 0;

  if not IsLinked then
    FRecordNo := 0;

  if (ppdaNoRecords in FState) then Exit;

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    GotoBookmark(Longint(FBookmarks[0]))

  else
    case FRangeBegin of
      rbFirstRecord:
        begin
          if IsLinked then
            LocateLinkedDataFirst
          else
            GotoFirstRecord;

          DetailSkipForward;
        end;

      rbLastRecord:
        begin
          if IsLinked then
             LocateLinkedDataLast
           else
             GotoLastRecord;

           DetailSkipBackward;
        end;

      rbCurrentRecord:
        if (FCurrentBookmark > 0) then
          GotoBookmark(FCurrentBookmark);

    end; {case, RangeBegin}

  if GetEOF then
    IncludeState([ppdaNoRecords])
  else
    begin

      UpdateState;

      if not(ppdaFirstRecord in State) then
        IncludeState([ppdaFirstRecord]);
    end;

  if Assigned(FOnFirst) then FOnFirst(Self);

  SendEventNotify(Self, ciPipelineFirst, nil);

 { RecordPositionChanged;}

end; {procedure, First}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Last }

procedure TppDataPipeline.Last;
begin


  if not IsLinked then
    FRecordNo := FRecordCount;

  if (ppdaNoRecords in FState) then Exit;

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    GotoBookmark(Longint(FBookmarks[FBookmarks.Count - 1]))

  else
    case FRangeEnd of
      reFirstRecord:
        begin
          if IsLinked then
            LocateLinkedDataFirst
          else
            GotoFirstRecord;

          DetailSkipForward;
        end;

      reLastRecord:
        begin
          if IsLinked then
            LocateLinkedDataLast
          else
            GotoLastRecord;

          DetailSkipBackward;
        end;

      reCurrentRecord:
        if (FCurrentBookmark > 0) then
          GotoBookmark(FCurrentBookmark);

      reCount:
        begin
          First;

          while (FTraversalCount < RangeEndCount) do
            Next;

        end;

    end; {case, RangeEnd}

  UpdateState;

  if not(ppdaLastRecord in State) then
    IncludeState([ppdaLastRecord]);

  if Assigned(FOnLast) then FOnLast(Self);

  SendEventNotify(Self, ciPipelineLast, nil);

  {RecordPositionChanged;}


end; {procedure, Last}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Next }

procedure TppDataPipeline.Next;
begin

  {goto next record}
  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      Inc(FTraversalCount);

      if (FTraversalCount < FBookmarks.Count) then
        GotoBookmark(Longint(FBookmarks[FTraversalCount]));
    end

  else
    begin
      if GetEOF then
       {do nothing}
      else if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy)
      else
        InternalTraverseBy(FMoveBy);

      FDataTraversed := True;
      Inc(FTraversalCount);
    end; {if, not using bookmarklist}

  DetailSkipForward;

  UpdateState;

  if Assigned(FOnNext) then FOnNext(Self);

  SendEventNotify(Self, ciPipelineNext, nil);

  {RecordPositionChanged;}

end; {procedure, Next}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Prior }

procedure TppDataPipeline.Prior;
begin

  if (FBookmarks <> nil) and (FBookmarks.Count > 0) then
    begin
      if (FTraversalCount > 0) then
        begin
          GotoBookmark(Longint(FBookmarks[FTraversalCount - 1]));

          Dec(FTraversalCount);
        end;

    end

  else
    begin
      if GetBOF then
        {do nothing}
      else if (FRangeBegin = rbCurrentRecord) and (FRangeEnd = reCurrentRecord) then
        {do nothing}
      else if IsLinked then
        TraverseLinkedData(FMoveBy * -1)
      else
        InternalTraverseBy(FMoveBy * -1);

      Dec(FTraversalCount);
    end; {if, not using bookmarklist}

  DetailSkipBackward;

  UpdateState;

  if Assigned(FOnPrior) then FOnPrior(Self);

  SendEventNotify(Self, ciPipelinePrior, nil);

  {RecordPositionChanged;}

end; {procedure, Prior}


{------------------------------------------------------------------------------}
{ TppDataPipeline.GetBOF }

function TppDataPipeline.GetBOF: Boolean;
var
  lBookmark: Longint;
  lbCurrent: Boolean;

begin
  Result := False;

  if (FBookmarks <> nil) then
    Result := (FBookmarks.Count = 0) or (FTraversalCount = 0)

  else if not(IsLinked) then

    case FRangeBegin of
      rbLastRecord:    Result := CheckEOF;

      rbFirstRecord:   Result := CheckBOF;

      rbCurrentRecord:
        begin
          Result := not(FDataTraversed);

          if not(FDataTraversed) and (FRangeEnd <> reCurrentRecord) and not CheckBOF then
            begin
              lBookmark := GetBookmark;

              if (FMoveBy > 0) then
                lbCurrent := CompareBookmarks(lBookmark, FCurrentBookmark) <= 0
              else
                lbCurrent := CompareBookmarks(lBookmark, FCurrentBookmark) >= 0;

              FreeBookmark(lBookmark);

              Result := lbCurrent;


            end;
        end;

    end

  else if FNoLInkedData then
    Result := True

  else
    case FRangeBegin of
      rbLastRecord:    Result := CheckLinkedEOF;

      rbFirstRecord:   Result := CheckLinkedBOF;

      rbCurrentRecord: Result := not(FDataTraversed);
    end;


end; {function, GetBOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetEOF }

function  TppDataPipeline.GetEOF: Boolean;
var
  lBookmark: Longint;
  lbCurrent: Boolean;
begin
  Result := False;

  if (FBookmarks <> nil) then
    Result := (FBookmarks.Count = 0) or (FTraversalCount = FBookmarks.Count)

  else if not(IsLinked) then
    case FRangeEnd of

      reLastRecord: Result := CheckEOF;

      reFirstRecord: Result := CheckBOF;

      reCurrentRecord:
        begin
          Result := FDataTraversed;

          if FDataTraversed and (FRangeBegin <> rbCurrentRecord) and not CheckEOF then
            begin
              lBookmark := GetBookmark;

              if (FMoveBy > 0) then
                lbCurrent := CompareBookmarks(lBookmark, FCurrentBookmark) > 0
              else
                lbCurrent := CompareBookmarks(lBookmark, FCurrentBookmark) < 0;

              FreeBookmark(lBookmark);

              Result := lbCurrent;


            end;
        end;

      reCount:         Result := (FTraversalCount >= FRangeEndCount) or
                                 (  ((FMoveBy > 0) and CheckEOF) or
                                    ((FMoveBy < 0) and CheckBOF) );

    end

  else if FNoLinkedData then
    Result := True

  else

    case FRangeEnd of

      reLastRecord:    Result := CheckLinkedEOF;

      reFirstRecord:   Result := CheckLinkedBOF;

      reCurrentRecord: Result := (FTraversalCount = 1);

      reCount:         Result := (FTraversalCount >= FRangeEndCount) or
                                 (  ((FMoveBy > 0) and CheckLinkedEOF) or
                                    ((FMoveBy < 0) and CheckLinkedBOF) );

    end;


  if Result and not IsLinked then
    FRecordCount := FRecordNo

end; {function, GetEOF}

{------------------------------------------------------------------------------}
{ TppDataPipeline.UpdateState }

procedure TppDataPipeline.UpdateState;
var
  lbBOF: Boolean;
  lbEOF: Boolean;

begin

  FState := [];

  if (csDestroying in ComponentState) or not Active then Exit;

  lbBOF := GetBOF;
  lbEOF := GetEOF;

  if (lbBOF and lbEOF) then
    FState := [ppdaNoRecords]

  else if lbBOF then
    FState := [ppdaFirstRecord]

  else if lbEOF then
    FState := [ppdaLastRecord];

end; {procedure, UpdateState}


{------------------------------------------------------------------------------}
{ TppDataPipeline.Edit }

procedure TppDataPipeline.Edit;
begin

end; {procedure, Edit}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetFieldAsStream }

procedure TppDataPipeline.GetFieldAsStream(aFieldName: String; aStream: TStream);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetFieldObjectForAlias}


function TppDataPipeline.GetFieldObjectForAlias(aFieldName: String): TppField;
begin
  {this method required, because GetFieldForName declares a 'const' parameter,
   which is unacceptable for supporting the FieldObjects array property}
  Result := GetFieldForAlias(aFieldName);
end; {function, GetFieldObjectForAlias}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetFieldValueForAlias}

function TppDataPipeline.GetFieldValueForAlias(aFieldAlias: string): Variant;
var
  lsFieldName: String;
begin

  lsFieldName := FieldNameForFieldAlias(aFieldAlias);

  Result := GetFieldValue(lsFieldName);

  if (VarType(Result) in [varNull, varEmpty]) then
    begin
      case GetFieldDataType(lsFieldName) of
        dtString, dtChar:
          Result := '';

        dtDouble, dtSingle, dtExtended, dtInteger, dtLongint, dtCurrency, dtDate, dtTime, dtDateTime:
          Result := 0;

        dtBoolean:
          Result := False;
      end;
    end;

end; {function, GetFieldValueForAlias}

{------------------------------------------------------------------------------}
{ TppDataPipeline.Insert }

procedure TppDataPipeline.Insert;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Delete }

procedure TppDataPipeline.Delete;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Locate }

function  TppDataPipeline.Locate(const aFieldName: String; aKeyValue: Variant; aOptions: TppLocateOptions): Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Post }

procedure TppDataPipeline.Post;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetFieldFromStream }

procedure TppDataPipeline.SetFieldFromStream(aFieldName: String; aStream: TStream);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetFieldValue }

procedure TppDataPipeline.SetFieldValue(aFieldName: String; aValue: Variant);
begin

end;

{------------------------------------------------------------------------------}
{ TppDataPipeline.Create }

procedure TppDataPipeline.GetQualifiedFieldNames(aFieldNameList: TStrings);
var
  lList: TStringList;
  liIndex: Integer;
  lsDataSetName: String;
begin

  lList := TStringList.Create;

  lsDataSetName := GetDataSetName;

  GetFieldNames(lList);


  if (lsDataSetName <> '') then
    for liIndex := 0 to lList.Count - 1 do
      lList[liIndex] := lsDataSetName + '.' + lList[liIndex];

  aFieldNameList.AddStrings(lList);

  lList.Free;

end; {procedure, GetQualifiedFieldNames}


{------------------------------------------------------------------------------}
{ TppDataPipeline.ReadState }

procedure TppDataPipeline.ReadState(Reader: TReader);
begin

  if (Reader.Parent is TdaDataView) then
    SetDataView(Reader.Parent);

  inherited ReadState(Reader);

end; {procedure, ReadState}

{------------------------------------------------------------------------------}
{ TppDataPipeline.GetDataView }

function TppDataPipeline.GetDataView: TComponent;
begin
  if Parent is TdaDataView then
    Result := Parent
  else
    Result := nil;
end; {function, GetDataView}

{------------------------------------------------------------------------------}
{ TppDataPipeline.SetDataView }

procedure TppDataPipeline.SetDataView(aDataView: TComponent);
begin
  if aDataView is TdaDataView then
    SetParent(TppRelative(aDataView));
end; {procedure, SetDataView}



{******************************************************************************
 *
 ** C U S T O M   D A T A   P I P E L I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Create }

constructor TppCustomDataPipeline.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  OrderedChildren := True;

  FAbsolutePageCount := 0;
  FAutoCreateFields := True;
  FBookmarksExist := False;
  FCurrentField := nil;
  FCreatingDefaultFields := False;
  FFieldsOutOfSync := True;
  FLinks := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Destroy }

destructor TppCustomDataPipeline.Destroy;
begin

  Destroying;

  FreeLinks;

  FLinks.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.Loaded }

procedure TppCustomDataPipeline.Loaded;
begin

  inherited Loaded;

  if FAutoCreateFields and (ChildCount > 0) then
    FFieldsOutOfSync := False;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.PropertyChange }

procedure TppCustomDataPipeline.PropertyChange;
begin
  if (ComponentDesigner <> nil) then
    ComponentDesigner.ComponentChanged;
end; {procedure, PropertyChange}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SaveComponents }

procedure TppCustomDataPipeline.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  {write fields}
  inherited SaveComponents(Proc);

  {write master field link items}
  for liIndex := 0 to LinkCount - 1  do
    Proc(Links[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.AddChild }

procedure TppCustomDataPipeline.AddChild(aChild: TppRelative);
begin

  if (aChild.Owner <> Owner) and (Owner <> nil) then
    begin
      if (aChild.Owner <> nil) then
        aChild.Owner.RemoveComponent(aChild);

      aChild.ChangeOwner(Owner);
    end;

  if (aChild is TppMasterFieldLink) then
    begin
      FLinks.Add(aChild);
      ClearLinkedDataCache;
    end
  else
    inherited AddChild(aChild);

  DoOnDataChange;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.InsertChild }

procedure TppCustomDataPipeline.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  if (aChild.Owner <> Owner) and (Owner <> nil) then
    aChild.ChangeOwner(Owner);

  if (aChild is TppMasterFieldLink) then
    begin
      FLinks.Insert(aPosition, aChild);
      ClearLinkedDataCache;
    end
  else
    inherited InsertChild(aPosition, aChild);

  DoOnDataChange;

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexOfChild }

function TppCustomDataPipeline.IndexOfChild(aChild: TppRelative): Integer;
begin

  if (aChild is TppMasterFieldLink) then
    Result := FLinks.IndexOf(aChild)
  else
    Result := inherited IndexOfChild(aChild);

end; {procedure, IndexOfChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.RemoveChild }

function TppCustomDataPipeline.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin

  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  if (aChild is TppMasterFieldLink) then
    begin
      FLinks.Delete(liIndex);
      ClearLinkedDataCache;
    end
  else
    Result := inherited RemoveChild(aChild);

  DoOnDataChange;

end; {procedure, RemoveChild}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.DefineField }

function TppCustomDataPipeline.DefineField(aFieldName: String; aDataType: TppDataType; aFieldLength: Integer): Integer;
var
  lField: TppField;
begin

  {allow descendant pipeline to determine which DataTypes are supported}
  if not IsValidDataType(aDataType) then
    raise EInvalidPropertyError.Create('DataType not supported by ' + ClassName);

  lField := TppField.Create(Owner);

  {add field to pipeline}
  lField.DataPipeline := Self;

  {assign props}
  lField.FieldName    := aFieldName;
  lField.DataType     := aDataType;
  lField.FieldLength  := aFieldLength;
  lField.DisplayWidth := aFieldLength;

  if lField.DataType in [dtInteger, dtLongint, dtDouble] then
    lField.Alignment := taRightJustify
  else
    lField.Alignment := taLeftJustify;

  Result := IndexOfChild(lField);

end; {function, DefineField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetAutoCreateFields }

function TppCustomDataPipeline.GetAutoCreateFields: Boolean;
begin
  Result := FAutoCreateFields;
end; {function, GetAutoCreateFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SetAutoCreateFields }

procedure TppCustomDataPipeline.SetAutoCreateFields(aValue: Boolean);
begin
  FAutoCreateFields := aValue;

  SyncFields;
end; {function, SetAutoCreateFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetCreatingDefaultFields }

function TppCustomDataPipeline.GetCreatingDefaultFields: Boolean;
begin
  Result := FCreatingDefaultFields;
end; {function, GetCreatingDefaultFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreeFields }

procedure TppCustomDataPipeline.FreeFields;
begin
  FreeChildren;

  SyncFields;
end; {function, FreeFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.AddField }

procedure TppCustomDataPipeline.AddField(aField: TppField);
begin
  AddChild(aField);
end; {procedure, AddField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.InsertField }

procedure TppCustomDataPipeline.InsertField(aPosition: Integer; aField: TppField);
begin
  InsertChild(aPosition, aField);
end; {procedure, InsertField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.RemoveField }

function TppCustomDataPipeline.RemoveField(aField: TppField): Integer;
begin
  Result := RemoveChild(aField);
end; {function, RemoveField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldCount }

function TppCustomDataPipeline.GetFieldCount: Integer;
begin
  CreateDefaultFields;

  Result := ChildCount;
end; {function, GetFieldCount}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForIndex }

function TppCustomDataPipeline.GetFieldForIndex(aIndex: Integer): TppField;
begin
  CreateDefaultFields;

  Result := TppField(Children[aIndex]);
end; {function, GetFieldForIndex}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldNames }

function TppCustomDataPipeline.GetFieldNames(aFieldNameList: TStrings): Boolean;
var
  liField: Integer;
begin
  CreateDefaultFields;

  aFieldNameList.Clear;

  for liField := 0 to FieldCount - 1 do
    aFieldNameList.Add(Fields[liField].FieldName);

  Result := (aFieldNameList.Count > 0);
end; {function, GetFieldNames}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAliases }

function TppCustomDataPipeline.GetFieldAliases(aFieldAliasList: TStrings): Boolean;
var
  liField: Integer;
begin
  CreateDefaultFields;

  aFieldAliasList.Clear;

  for liField := 0 to FieldCount - 1 do
    aFieldAliasList.Add(Fields[liField].FieldAlias);

  Result := (aFieldAliasList.Count > 0);
end; {function, GetFieldAliases}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FieldAliasForFieldName }

function  TppCustomDataPipeline.FieldAliasForFieldName(const aFieldName: String): String;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForName}

  Result := aFieldName;

  if not(Active) and GetAutoCreateFields then Exit;

  lField := GetFieldForName(aFieldName);

  if (lField <> nil) then
    Result := lField.FieldAlias;

end; {function, FieldAliasForFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FieldNameForFieldAlias }

function  TppCustomDataPipeline.FieldNameForFieldAlias(const aFieldAlias: String): String;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForAlias}

  lField := GetFieldForAlias(aFieldAlias);

  if (lField <> nil) then
    Result := lField.FieldName
  else
    Result := '';

end; {function, FieldNameForFieldAlias}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetCurrentField }

function TppCustomDataPipeline.GetCurrentField: TppField;
begin
  Result := FCurrentField;
end; {function, GetCurrentField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForName }

function TppCustomDataPipeline.GetFieldForName(const aFieldName: String): TppField;
var
  liIndex: Integer;
begin

  CreateDefaultFields;

  Result  := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do

    if CompareText(Fields[liIndex].FieldName, aFieldName) = 0 then
      Result := Fields[liIndex]
    else
      Inc(liIndex);

end; {function, GetFieldForName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldForAlias }

function TppCustomDataPipeline.GetFieldForAlias(const aFieldAlias: String): TppField;
var
  liIndex: Integer;
begin

  CreateDefaultFields;

  Result  := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < FieldCount) do

    if CompareText(Fields[liIndex].FieldAlias, aFieldAlias) = 0 then
      Result := Fields[liIndex]
    else
      Inc(liIndex);

end; {function, GetFieldForAlias}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexofField }

function TppCustomDataPipeline.IndexOfField(aField: TppField): Integer;
begin
  CreateDefaultFields;

  Result := IndexOfChild(aField);
end; {procedure, IndexOfField}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IndexOfFieldName }

function TppCustomDataPipeline.IndexOfFieldName(const aFieldName: String): Integer;
var
  lField: TppField;
begin

  {do not call CreateDefaultFields here, it is already called by GetFieldForAlias}

  lField := GetFieldForName(aFieldName);

  if (lField <> nil) then
    Result := IndexOfChild(lField)
  else
    Result := -1;

end; {function, IndexOfFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IsValidDataType }

function  TppCustomDataPipeline.IsValidDataType(aDataType: TppDataType): Boolean;
begin
  {descendants can add code here to determine which DataType's to support}
  Result := True;
end; {function, IsValidDataType}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SetFieldName }

function TppCustomDataPipeline.SetFieldName(aFieldName: String): Boolean;
begin
  FCurrentField := GetFieldForName(aFieldName);

  Result := (FCurrentField <> nil);
end; {function, SetFieldName}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAlignment }

function TppCustomDataPipeline.GetFieldAlignment(aFieldName: String): TAlignment;
begin

  Result := taLeftJustify;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.Alignment;

end; {function, GetFieldAlignment}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldDataType }

function TppCustomDataPipeline.GetFieldDataType(aFieldName: String): TppDataType;
begin

  Result := dtNotKnown;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.DataType;

end; {function, GetFieldDataType}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldDisplayWidth }

function  TppCustomDataPipeline.GetFieldDisplayWidth(aFieldName: String): Integer;
begin

  Result := 0;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.DisplayWidth;

end; {function, GetFieldDisplayWidth}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetFieldAlignment }

function  TppCustomDataPipeline.GetFieldSize(aFieldName: String): Integer;
begin

  Result := 0;

  if SetFieldName(aFieldName) then
    Result := FCurrentField.FieldLength;

end; {function, GetFieldSize}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.SyncFields }

procedure TppCustomDataPipeline.SyncFields;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;

  FFieldsOutOfSync := True;

end; {function, SyncFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetValidName }

function TppCustomDataPipeline.GetValidName(aComponent: TComponent): String;
var
  lsNamingPrefix: String;
begin

  lsNamingPrefix := Name + ppGetStdNamingPrefix(aComponent);

  if (Owner <> nil) then
   Result := ppGetUniqueName(Owner, lsNamingPrefix, aComponent)

  else  {run-time designing }
    Result := ppGetUniqueName(Self, lsNamingPrefix, aComponent);

end; {function, GetValidName}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.CreateDefaultFields }

procedure TppCustomDataPipeline.CreateDefaultFields;
var
  liField: Integer;
  liFields: Integer;
  lsFieldName: String;
  lFields: TStrings;
  lField: TppField;
  
begin

  if (FCreatingDefaultFields) then Exit;

  if not(FAutoCreateFields) then Exit;

  if not(FFieldsOutOfSync) then Exit;

  if (csReading in ComponentState) or (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;


  FCreatingDefaultFields := True;

  FreeFields;

  lFields := TStringList.Create;

  if not(GetFieldNames(lFields)) then
    begin
      FCreatingDefaultFields := False;

      lFields.Free;

      Exit;
    end;

  liFields := lFields.Count;

  for liField := 0 to liFields - 1 do
    begin
      lField := TppField.Create(nil);

      lsFieldName := lFields[liField];

      {assign props}
      lField.Name := GetValidName(lField);

      lField.FieldName    := lsFieldName;
      lField.FieldLength  := GetFieldSize(lsFieldName);
      lField.DisplayWidth := GetFieldDisplayWidth(lsFieldName);
      lField.DataType     := GetFieldDataType(lsFieldName);
      lField.Position     := liField;
      
      if lField.DataType in [dtInteger, dtLongint, dtDouble] then
        lField.Alignment := taRightJustify;

      {allow descendant pipeline to determine which data types are supported}
      if not(IsValidDataType(lField.DataType)) then
        raise EInvalidPropertyError.Create('DataType not supported by ' + ClassName);

      {add field to pipeline}
      lField.DataPipeline := Self;

      lField.FieldAlias   := lsFieldName;
      lField.Searchable   := not(lField.DataType in [dtNotKnown, dtMemo, dtBLOB, dtGraphic]);
      lField.Sortable     := not(lField.DataType in [dtNotKnown, dtMemo, dtBLOB, dtGraphic]);

    end;

  lFields.Free;

  FFieldsOutOfSync := False;

  FCreatingDefaultFields := False;

  DoOnDataChange;

end; {procedure, CreateDefaultFields}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetLinkCount }

function TppCustomDataPipeline.GetLinkCount: Integer;
begin
  Result := FLinks.Count;
end; {function, GetLinkCount}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.IsLinked }

function TppCustomDataPipeline.IsLinked: Boolean;
begin
  Result := (MasterDataPipeline <> nil) and (FLinks.Count > 0);
end; {function, IsLinked}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.GetLinkForIndex }

function TppCustomDataPipeline.GetLinkForIndex(aIndex: Integer): TppMasterFieldLink;
begin
  Result := TppMasterFieldLink(FLinks[aIndex]);
end; {function, GetLinkForIndex}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.CheckLinkedData }

function TppCustomDataPipeline.CheckLinkedData: Integer;
var
  liIndex: Integer;
  lbNewData: Boolean;
  lSaveState: TppDataPipelineStates;
begin

  Result := 0;

  if not Active or not MasterDataPipeline.Active then Exit;

  if VarIsNull(FLinkedDataInfo.FDetailDataBuf) then Exit;

  if (MasterDataPipeline.RecordNo = -1) then Exit;

  lbNewData := False;

  {get field link data values for detail}
  if (FLinkedDataInfo.FDetailRecordNo <> FRecordNo) or (FRecordNo = 0) then
    begin
      lbNewData := True;
      FLinkedDataInfo.FDetailRecordNo := FRecordNo;

      {temporarily clear the state because if ppdaNoRecords, GetFieldValue returns NULL}
      lSaveState := FState;
      FState := [];

      for liIndex := 0 to LinkCount-1 do
        FLinkedDataInfo.FDetailDataBuf[liIndex] := GetFieldValue(Links[liIndex].DetailFieldName);

    end;

  {get field link data values for master}
  {note: do not optimize for RecordNo 0, this causes a problem when master is
         being traversed last to first}
  if (FLinkedDataInfo.FMasterRecordNo <> MasterDataPipeline.RecordNo) or
      (MasterDataPipeline.RecordNo = 0) then
    begin
      lbNewData := True;
      FLinkedDataInfo.FMasterRecordNo := MasterDataPipeline.RecordNo;

      {temporarily clear the state because if ppdaNoRecords, GetFieldValue returns NULL}
      lSaveState := MasterDataPipeline.State;
      MasterDataPipeline.State := [];

      for liIndex := 0 to FLinks.Count - 1 do
        FLinkedDataInfo.FMasterDataBuf[liIndex] := MasterDataPipeline.GetFieldValue(Links[liIndex].MasterFieldName);
        
      MasterDataPipeline.State := lSaveState;
    end;

  if lbNewData then
    FLinkedDataInfo.FCompareLinkedData := CompareLinkedData;


  Result := FLinkedDataInfo.FCompareLinkedData;

end; {procedure, CheckLinkedData}


{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.CompareLinkedData }

function TppCustomDataPipeline.CompareLinkedData: Integer;
var
  lMasterFieldValue: Variant;
  lDetailFieldValue: Variant;
  liIndex: Integer;
  lFieldLink: TppMasterFieldLink;
begin

  Result := 0;

  if not Active or not MasterDataPipeline.Active then Exit;

  liIndex := 0;


  while (Result = 0) and (liIndex < FLinks.Count) do
    begin

      lMasterFieldValue := FLinkedDataInfo.FMasterDataBuf[liIndex];
      lDetailFieldValue := FLinkedDataInfo.FDetailDataBuf[liIndex];
      lFieldLink := GetLinkForIndex(liIndex);

      if VarIsNull(lDetailFieldValue) then
        begin
          if CheckBOF then
            Result := -1
          else
            Result := 1;

        end


      else if ((VarType(lMasterFieldValue) = varString) and (VarType(lDetailFieldValue) = varString)) or
              ((VarType(lMasterFieldValue) = varOleStr) and (VarType(lDetailFieldValue) = varOleStr)) then
        begin
          if lFieldLink.IsCaseSensitive then
            Result := CompareStr(String(lDetailFieldValue), String(lMasterFieldValue))
          else
            Result := CompareText(String(lDetailFieldValue), String(lMasterFieldValue));
        end

      else
        begin

          if (lDetailFieldValue <> lMasterFieldValue) then
            begin
              if (lDetailFieldValue > lMasterFieldValue) then
                Result := 1
              else
                Result := -1;

            end;

        end;

      if Result = 0 then
        Inc(liIndex)

      else if lFieldLink.DetailSortOrder = soDescending then
        Result := Result * -1;

    end;

end; {procedure, CompareLinkedData}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.MasterRecordPositionChanged }

procedure TppCustomDataPipeline.MasterRecordPositionChanged;
begin

  inherited MasterRecordPositionChanged;

  if IsLinked and Active then
    begin
      FState := [];
      FNoLinkedData := False;
      First;
    end
  else if (FMasterDataPipeline <> nil) and Active then
    UpdateState;

end; {procedure, MasterRecordPositionChanged}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.TraverseLinkedData }

procedure TppCustomDataPipeline.TraverseLinkedData(aIncrement: Integer);
var
  liMove: Integer;

begin

  for liMove := 1 to Abs(aIncrement) do
    begin

      if (aIncrement > 0) and not GetEOF then
        begin
          InternalTraverseBy(1);
          if (FLinkRangeIndex <> nil) and GetEOF then
            if CheckEOF then
              FLinkRangeIndex.SetEndRecordNo(FMasterDataPipeline.RecordNo, FRecordNo)
            else
              FLinkRangeIndex.SetEndRecordNo(FMasterDataPipeline.RecordNo, FRecordNo-1);

        end
      else if (aIncrement < 0) and not GetBOF then
        begin
          InternalTraverseBy(-1);
          if (FLinkRangeIndex <> nil) and GetBOF then
            if CheckBOF then
              FLinkRangeIndex.SetBeginRecordNo(FMasterDataPipeline.RecordNo, FRecordNo)
            else
              FLinkRangeIndex.SetBeginRecordNo(FMasterDataPipeline.RecordNo, FRecordNo+1);
        end;

    end;

end; {function, TraverseLinkedData}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.LocateLinkedDataFirst }

procedure TppCustomDataPipeline.LocateLinkedDataFirst;
var
  liBeginRecordNo: Integer;

begin
  if not FLinkingEnabled then Exit;

  FLinkingEnabled := False;

  if (ppdaNoRecords in FMasterDataPipeline.State) then
    {do nothing}
  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.GetBeginRecordNo(FMasterDataPipeline.RecordNo, liBeginRecordNo) then
    InternalTraverseBy(liBeginRecordNo - RecordNo)

  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.CheckNoLinkedData(FMasterDataPipeline.RecordNo) then
    {do nothing}

  else
    begin

      {find first detail record related to the master}
      if CheckLinkedData < 0 then

        while not CheckEOF and (CheckLinkedData < 0) do
          InternalTraverseBy(1)

      else
        begin
          while not CheckBOF and (CheckLinkedData >= 0) do
            InternalTraverseBy(-1);

          if CheckLinkedData < 0 then
            InternalTraverseBy(1);

          {if not on a matching record, then go back to prev record}
          if (CheckLinkedData > 0) then
            InternalTraverseBy(-1);

        end;

      {update the range index}
      if (FLinkRangeIndex <> nil) then
        if (CheckLinkedData = 0) then
          FLinkRangeIndex.SetBeginRecordNo(FMasterDataPipeline.RecordNo, FRecordNo)
        else
          FLinkRangeIndex.SetNoLinkedData(FMasterDataPipeline.RecordNo);

    end;

  {update flag to indicate whether any linked records exists for the current master}
  FNoLinkedData := (CheckLinkedData <> 0) or (ppdaNoRecords in FMasterDataPipeline.State);

  {call UpdateState to set ppdaNoRecords}
  if FNoLinkedData then
    UpdateState;

  FLinkingEnabled := True;

  {this will notify detail pipelines that the master record position has changed}
  if not FNoLinkedData then
    RecordPositionChanged;

end; {procedure, LocateLinkedDataFirst}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.LocateLinkedDataLast }

procedure TppCustomDataPipeline.LocateLinkedDataLast;
var
  liEndRecordNo: Integer;
begin

  FLinkingEnabled := False;

  if (ppdaNoRecords in FMasterDataPipeline.State) then
    {do nothing}
  
  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.GetEndRecordNo(FMasterDataPipeline.RecordNo, liEndRecordNo) then
    InternalTraverseBy(liEndRecordNo - RecordNo)

  else if (FLinkRangeIndex <> nil) and FLinkRangeIndex.CheckNoLinkedData(FMasterDataPipeline.RecordNo) then
    {do nothing}

  else
    begin


      {find last detail record related to the master}
      if (CheckLinkedData <= 0) then
        begin
          while not CheckEOF and (CheckLinkedData <= 0) do
            InternalTraverseBy(1);

          if (CheckLinkedData > 0) then
            InternalTraverseBy(-1);

          {if not on a matching record, then go back to prev record}
          if (CheckLinkedData < 0) then
            InternalTraverseBy(1);

        end
      else
        while not CheckBOF and (CheckLinkedData > 0) do
          InternalTraverseBy(-1);

      {update the range index}
      if (FLinkRangeIndex <> nil) then
        if (CheckLinkedData = 0) then
          FLinkRangeIndex.SetEndRecordNo(FMasterDataPipeline.RecordNo, FRecordNo)
        else
          FLinkRangeIndex.SetNoLinkedData(FMasterDataPipeline.RecordNo);

    end;

  {update flag to indicate whether any linked records exists for the current master}
  FNoLinkedData := (CheckLinkedData <> 0) or (ppdaNoRecords in FMasterDataPipeline.State);

  {call UpdateState to set ppdaNoRecords}
  if FNoLinkedData then
    UpdateState;

  FLinkingEnabled := True;

  {this will notify detail pipelines that the master record position has changed}
  if not FNoLinkedData then
    RecordPositionChanged;

end; {procedure, LocateLinkedDataLast}

{------------------------------------------------------------------------------}
{ TppCustomDataPipeline.FreeLinks }

procedure TppCustomDataPipeline.FreeLinks;
var
  liIndex: Integer;
begin

  for liIndex := (FLinks.Count - 1) downto 0 do
    TObject(FLinks[liIndex]).Free;

  FLinks.Clear;

  ClearLinkedDataCache;

end; {procedure, FreeMasterFieldLinks}

{******************************************************************************
 *
 ** A U T O   S E A R C H   F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Create }

constructor TppAutoSearchField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAsFilter := False;
  FAutoSearchPanel  := nil;
  FCriteria := nil;
  FDataView := nil;
  FDelimiter := '';
  FFirstField := False;
  FOnChange := nil;
  FParentControl := nil;
  FSearchOperator := soEqual;
  FWildCard := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Notify }

procedure TppAutoSearchField.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation <> ppopRemove) then Exit;

  if (aCommunicator = FCriteria) then
    FCriteria := nil;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.DoOnChange }

procedure TppAutoSearchField.DoOnChange;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if Assigned(FOnChange) then FOnChange(Self);

end; {procedure, DoOnChange}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetMandatory }

procedure TppAutoSearchField.SetMandatory(aValue: Boolean);
begin

  inherited SetMandatory(aValue);

  DoOnChange;

end; {procedure, SetMandatory}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetShowAllValues }

procedure TppAutoSearchField.SetShowAllValues(aValue: Boolean);
begin

  inherited SetShowAllValues(aValue);

  DoOnChange;

end; {procedure, SetShowAllValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetFieldName }

procedure TppAutoSearchField.SetFieldName(const aFieldName: String);
begin

  inherited SetFieldName(aFieldName);

  DoOnChange;

end; {procedure, SetFieldName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchExpression }

procedure TppAutoSearchField.SetSearchExpression(const aExpression: String);
begin

  inherited SetSearchExpression(aExpression);

  DoOnChange;

end; {procedure, SetSearchExpression}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetCriteria }

procedure TppAutoSearchField.SetCriteria(aCriteria: TComponent);
begin

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).RemoveNotify(Self);

  FCriteria := aCriteria;

  if (FCriteria <> nil) then
    TppCommunicator(FCriteria).AddNotify(Self)

end; {procedure, SetCriteria}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetDataPipelineName }

procedure TppAutoSearchField.SetDataPipelineName(const aName: String);
begin

  FDataPipelineName := aName;

  DoOnChange;

end; {procedure, SetDataPipelineName}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SetSearchOperator }

procedure TppAutoSearchField.SetSearchOperator(aOperator: TppSearchOperatorType);
begin

  FSearchOperator := aOperator;

  DoOnChange;

end; {procedure, SetSearchOperator}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.ConvertValue }

function TppAutoSearchField.ConvertValue(const aValue: String): Variant;
begin

  Result := '';

  case DataType of
    dtString, dtChar, dtMemo:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, aValue) = 0) then
          Result := aValue + FWildCard
        else
          Result := aValue;
      end;

    dtDate, dtTime, dtDateTime: Result := ppStrToDateTime(aValue);
    dtInteger, dtLongint: Result := StrToInt(aValue);
    dtCurrency: Result := StrToCurr(aValue);
    dtSingle, dtDouble, dtExtended: Result := StrToFloat(aValue);
  end;

end; {function, ConvertValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValue }

function TppAutoSearchField.GetValue: Variant;
var
  lValues: TStrings;
begin

  Result := '';

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  if (lValues.Count > 0) then
    Result := ConvertValue(lValues[0]);

  lValues.Free;

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValues }

function TppAutoSearchField.GetValues(aIndex: Integer): Variant;
var
  lValues: TStrings;
begin

  Result := '';

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  if (lValues.Count > aIndex) then
    Result := ConvertValue(lValues[aIndex]);

  lValues.Free;

end; {function, GetValues}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.GetValueCount }

function TppAutoSearchField.GetValueCount: Integer;
var
  lValues: TStrings;
begin

  lValues := TStringList.Create;

  ppParseString(FSearchExpression, lValues);

  Result := lValues.Count;

  lValues.Free;

end; {function, GetValueCount}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FormatValue }

function TppAutoSearchField.FormatValue(aValue: String): String;
begin

  Result := aValue;

  if (FDataType in [dtDate, dtDateTime]) and (Length(DisplayFormat) > 0) then
    Result := FormatDateTime(DisplayFormat, ppStrToDateTime(Result))

  else if (FDataType in [dtInteger, dtLongint, dtSingle, dtDouble, dtExtended, dtCurrency]) then
    Result := ppFixUpFloatString(aValue, DisplayFormat)

  else if (FDataType = dtBoolean) then
    begin
      if (Length(aValue) = 0) then
        Result := 'FALSE'

       else if (UpperCase(aValue[1])[1] in ['T', 'Y']) then
         Result := 'TRUE'

       else if (aValue[1] = '1') then
         Result := '1'

       else if (aValue[1] = '0') then
         Result := '0'

       else 
         Result := 'FALSE';
    end;

  if (Length(FDelimiter) > 0) then
    Result := FDelimiter + Result + FDelimiter;

end; {function, FormatValue}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FormattedExpression }

function TppAutoSearchField.FormattedExpression: String;
var
  liIndex: Integer;
  lValues: TStrings;
begin

  Result := '';

  case FSearchOperator of

    soInList, soNotInList:
      begin
        lValues := TStringList.Create;

        ppParseString(FSearchExpression, lValues);

        if FAsFilter then
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                if (FSearchOperator = soInList) then
                  begin
                    Result := Result + '(' + FieldName + '=' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' OR ';
                  end
                else
                  begin
                    Result := Result + '(' + FieldName + '<>' + FormatValue(lValues[liIndex]) + ')';

                    if (liIndex < lValues.Count - 1) then
                      Result := Result + ' AND ';
                  end;
              end;
          end

        else
          begin
            for liIndex := 0 to lValues.Count - 1 do
              begin
                Result := Result + FormatValue(lValues[liIndex]);

                if (liIndex < lValues.Count - 1) then
                  Result := Result + ',';
              end;

            Result := '(' + Result + ')';
          end;

        lValues.Free;

      end;

    soBetween, soNotBetween:
      begin
        lValues := TStringList.Create;

        ppParseString(FSearchExpression, lValues);

        if (lValues.Count = 2) then
          begin

            if FAsFilter then
              begin
                if (FSearchOperator = soBetween) then
                  Result := '(' + FieldName + ' >= ' + FormatValue(lValues[0]) + ')' + ' AND ' + '(' + FieldName + ' <= ' + FormatValue(lValues[1]) + ')'
                else
                  Result := '(' + FieldName + ' < ' + FormatValue(lValues[0]) + ')' + ' OR ' + '(' + FieldName + ' > ' + FormatValue(lValues[1]) + ')'
              end

            else
              Result := FormatValue(lValues[0]) + ' AND ' + FormatValue(lValues[1]);

          end;

        lValues.Free;
      end;

    soLike, soNotLike:
      begin
        if (Length(FWildCard) > 0) and (Pos(FWildCard, FSearchExpression) = 0) then
          Result := FSearchExpression + FWildCard;

        Result := FormatValue(Result);
      end;

    else
      begin
        Result := FormatValue(FSearchExpression);
      end;
  end;


end; {function, FormattedExpression}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Description }

function TppAutoSearchField.Description: String;
begin

  if (FFirstField) then
    Result := ppLoadStr(54) {Show all data where the}
  else
    Result := ppLoadStr(55); {and the}

  if (FShowAllValues) then
    Result := Result + ' ' + FieldAlias + ' has any value'
  else
    Result := Result + ' ' + FieldAlias + ' ' + OperatorDesc + ' ' + SearchExpression;

end; {function, Description}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.FilterString }

function TppAutoSearchField.FilterString: String;
begin
  FAsFilter := True;

  if (FSearchOperator in [soInList, soNotInList, soBetween, soNotBetween]) then
    Result := '(' + FormattedExpression + ')'
  else
    Result := '(' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression + ')';

  FAsFilter := False;
end; {function, FilterString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.SQLString }

function TppAutoSearchField.SQLString: String;
begin
  Result := TableName + '.' + FieldName + ' ' + OperatorAsString + ' ' + FormattedExpression;
end; {function, SQLString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.Valid }

function TppAutoSearchField.Valid: Boolean;
begin
  Result := not(FShowAllValues) and (Length(FSearchExpression) > 0);
end; {function, Valid}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.OperatorAsString }

function TppAutoSearchField.OperatorAsString: String;
begin

  if (FAsFilter) then
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := '=';
      soNotLike:              Result := '<>';
      soBetween:              Result := '';
      soNotBetween:           Result := '';
      soInList:               Result := '';
      soNotInList:            Result := '';
      soBlank:                Result := '';
      soNotBlank:             Result := '';
    else
      Result := '=';
    end

  else
    case FSearchOperator of
      soEqual:                Result := '=';
      soNotEqual:             Result := '<>';
      soLessThan:             Result := '<';
      soLessThanOrEqualTo:    Result := '<=';
      soGreaterThan:          Result := '>';
      soGreaterThanOrEqualTo: Result := '>=';
      soLike:                 Result := 'LIKE';
      soNotLike:              Result := 'NOT LIKE';
      soBetween:              Result := 'BETWEEN';
      soNotBetween:           Result := 'NOT BETWEEN';
      soInList:               Result := 'IN';
      soNotInList:            Result := 'NOT IN';
      soBlank:                Result := 'IS NULL';
      soNotBlank:             Result := 'IS NOT NULL';
    else
      Result := '=';
    end;

end; {procedure, OperatorAsString}

{------------------------------------------------------------------------------}
{ TppAutoSearchField.OperatorDesc }

function TppAutoSearchField.OperatorDesc: String;
begin

  case FSearchOperator of
    soEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(92) {'is'}
        else
          Result := ppLoadStr(93) {'is equal to'}
      end;

    soNotEqual:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(94) {'is not'}
        else
          Result := ppLoadStr(95) {'is not equal to'}
      end;

    soLessThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(96) {'is before'}
        else
          Result := ppLoadStr(97); {'is less than'}
      end;

    soLessThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(98) {'is on or before'}
        else
          Result := ppLoadStr(99) {'is less than or equal to'}
      end;

    soGreaterThan:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(100) {'is after'}
        else
          Result := ppLoadStr(1000); {'is greater than'}
      end;

    soGreaterThanOrEqualTo:
      begin
        if DataType in [dtDate, dtTime, dtDateTime] then
          Result := ppLoadStr(1001) {'is on or after'}
        else
          Result := ppLoadStr(1002); {'is greater than or equal to'}
      end;

    soLike: Result := ppLoadStr(1003); {'begins with'}
    soNotLike: Result := ppLoadStr(1004); {'does not begin with'}
    soBetween: Result := ppLoadStr(1005); {'is between'}
    soNotBetween: Result := ppLoadStr(1006); {'is not between'}
    soInList: Result := ppLoadStr(1007); {'matches one of the values in this list'}
    soNotInList: Result := ppLoadStr(1027); {'does not match any of the values in this list'}
    soBlank: Result := ppLoadStr(1008); {'is blank'}
    soNotBlank: Result := ppLoadStr(1009); {'is not blank'}

  else
    Result := ppLoadStr(93); {'is equal to'}
  end;

end; {procedure, OperatorDesc}

{******************************************************************************
 *
 ** F I E L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppField.Create }

constructor TppField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FAlignment        := taLeftJustify;
  FAutoSearch       := False;
  FColumnWidth      := 0;
  FDataType         := dtString;
  FDisplayFormat    := '';
  FDisplayWidth     := 10;
  FFieldAlias       := '';
  FFieldName        := '';
  FFieldLength      := 10;
  FGroupOrder       := -1;
  FLinkable         := True;
  FMandatory        := False;
  FReportComponent  := nil;
  FReportLabel      := nil;
  FSelectable       := True;
  FSelectOrder      := -1;
  FSearchable       := True;
  FSearch           := False;
  FSearchOrder      := -1;
  FSearchExpression := '';
  FSelectedIndex    := -1;
  FShowAllValues    := False;
  FSortable         := True;
  FSort             := False;
  FSortExpression   := '';
  FSortOrder        := -1;
  FSortOrderType    := soAscending;
  FTableAlias       := '';
  FTableName        := '';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppField.Destroy }

destructor TppField.Destroy;
begin

  Destroying;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppField.ReadVisible }

procedure TppField.ReadVisible(Reader: TReader);
begin
  Reader.ReadBoolean;
end; {procedure, ReadVisible}

{------------------------------------------------------------------------------}
{ TppField.DefineProperties }

procedure TppField.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  {used for conversion to 5.1}
  Filer.DefineProperty('Visible', ReadVisible, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppField.HasParent }

function TppField.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppField.GetDataPipeline }

function TppField.GetDataPipeline: TppDataPipeline;
begin
  if (Parent is TppDataPipeline) then
    Result := TppDataPipeline(Parent)
  else
    Result := nil;
end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppField.SetDataPipeline }

procedure TppField.SetDataPipeline(aDataPipeline: TppDataPipeline);
begin
  SetParent(aDataPipeline);
end; {procedure, SetDataPipeline}

{------------------------------------------------------------------------------}
{ TppField.SetMandatory }

procedure TppField.SetMandatory(aValue: Boolean);
begin

  FMandatory := aValue;

  if (FMandatory) then
    FShowAllValues := False;

end; {procedure, SetMandatory}

{------------------------------------------------------------------------------}
{ TppField.SetShowAllValues }

procedure TppField.SetShowAllValues(aValue: Boolean);
begin

  FShowAllValues := aValue;

  if (FShowAllValues) then
    FMandatory := False;

end; {procedure, SetShowAllValues}

{------------------------------------------------------------------------------}
{ TppField.SetDataType }

procedure TppField.SetDataType(aDataType: TppDataType);
begin

  if (DataPipeline <> nil) and not DataPipeline.IsValidDataType(aDataType) then
    raise EInvalidPropertyError.Create('DataType not supported by ' + DataPipeline.ClassName);

  FDataType := aDataType;

end; {procedure, SetDataType}

{------------------------------------------------------------------------------}
{ TppField.SetFieldName }

procedure TppField.SetFieldName(const aFieldName: String);
begin

  {also set FieldAlias, if needed}
  if (FFieldName = FFieldAlias) then
    FFieldAlias := aFieldName;

  FFieldName:= aFieldName;

  PropertyChange;

end; {procedure, SetFieldName}

{------------------------------------------------------------------------------}
{ TppField.SetSearchExpression }

procedure TppField.SetSearchExpression(const aExpression: String);
begin

  FSearchExpression:= aExpression;

  PropertyChange;

end; {procedure, SetSearchExpression}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsDouble }

function  TppField.GetFieldAsDouble: Double;
begin

  if DataPipeline = nil then
    Result := 0
  else
    Result := DataPipeline.GetFieldAsDouble(FFieldName);

end; {procedure, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsPicture }

function  TppField.GetFieldAsPicture: TPicture;
begin

  if DataPipeline = nil then
    Result := nil
  else
    Result := DataPipeline.GetFieldAsPicture(FFieldName);

end; {procedure, GetFieldAsDouble}

{------------------------------------------------------------------------------}
{ TppField.GetFieldAsString }

function  TppField.GetFieldAsString: String;
begin

  if DataPipeline = nil then
    Result := ''
  else
    Result := DataPipeline.GetFieldAsString(FFieldName);

end; {procedure, GetFieldAsString}

{------------------------------------------------------------------------------}
{ TppField.GetFieldIsNull }

function  TppField.GetFieldIsNull: Boolean;
begin

  if DataPipeline = nil then
    Result := True
  else
    Result := DataPipeline.GetFieldIsNull(FFieldName);

end; {procedure, GetFieldIsNull}

{------------------------------------------------------------------------------}
{ TppField.GetFieldValue }

function TppField.GetFieldValue: Variant;
begin


  if DataPipeline = nil then
    Result := null
  else
    Result := DataPipeline.GetFieldValue(FFieldName);

end; {procedure, GetFieldValue}

{******************************************************************************
 *
 ** F I E L D  L I N K
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.Create }

constructor TppMasterFieldLink.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FMasterFieldName := '';
  FDetailFieldName := '';
  FDetailSortOrder := soAscending;
  FIsCaseSensitive := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.Destroy }

destructor TppMasterFieldLink.Destroy;
begin

  {TMO - this is already handled by Relative and with a SetParent(nil) call which
   in turn calls RemoveChild.}

  {if FDetailDataPipeline <> nil then
    FDetailDataPipeline.RemoveMasterFieldLink(Self);}

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.HasParent }

function TppMasterFieldLink.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetMasterDataPipeline }

function TppMasterFieldLink.GetMasterDataPipeline: TppDataPipeline;
begin

  if (Parent <> nil) then
    Result := TppDataPipeline(Parent).MasterDataPipeline
  else
    Result := nil;

end; {function, GetMasterDataPipeline}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetMasterField }

function TppMasterFieldLink.GetMasterField: TppField;
var
  lMasterDataPipeline: TppDataPipeline;
begin

  lMasterDataPipeline := GetMasterDataPipeline;

  if (lMasterDataPipeline <> nil) then
    Result := lMasterDataPipeline.GetFieldForName(FMasterFieldName)
  else
    Result := nil;

end; {function, GetMasterField}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetDetailDataPipeline }

function TppMasterFieldLink.GetDetailDataPipeline: TppDataPipeline;
begin

  if (Parent <> nil) then
    Result := TppDataPipeline(Parent)
  else
    Result := nil;

end; {function, GetDetailDataPipeline}

{------------------------------------------------------------------------------}
{ TppMasterFieldLink.GetDetailField }

function TppMasterFieldLink.GetDetailField: TppField;
var
  lDetailDataPipeline: TppDataPipeline;
begin

  lDetailDataPipeline := GetDetailDataPipeline;

  if (lDetailDataPipeline <> nil) then
    Result := lDetailDataPipeline.GetFieldForName(FDetailFieldName)
  else
    Result := nil;

end; {function, GetDetailField}

{******************************************************************************
 *
 ** L I N K   R A N G E   I N D E X
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.Create }

constructor TppLinkRangeIndex.Create;
begin
  inherited Create;

  {MasterRecNoList is used to store the MasterRecNo's and index into the RangeList}
  FMasterRecNoList := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.Destroy }

destructor TppLinkRangeIndex.Destroy;
begin

  {call ClearValues to free all object in the list}
  ClearValues;

  FMasterRecNoList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.ClearValues }

procedure TppLinkRangeIndex.ClearValues;
var
  liIndex: Integer;
begin

  {free each object in the list}
  for liIndex := 0 to Count-1 do
    TObject(Items[liIndex]).Free;

  Clear;

  FMasterRecNoList.Clear;
  
end; {function, Clear}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.GetPosition}

function TppLinkRangeIndex.GetPosition(aMasterRecNo: Integer): Integer;
begin
  {search the MasterRecNoList and use the index to retrieve the link range item}
  Result := FMasterRecNoList.IndexOf(Pointer(aMasterRecNo));

end; {function, GetPosition}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.AddLinkRange }

function TppLinkRangeIndex.AddLinkRange(aMasterRecNo: Integer): TppLinkRange;
var
  lLinkRange: TppLinkRange;
begin

  {create a new LinkRange object}
  lLinkRange := TppLinkRange.Create;
  lLinkRange.BeginRecordNo  := -1;
  lLinkRange.EndRecordNo    := -1;

  {add Object to the list}
  Add(Pointer(lLinkRange));

  {add MasterRecNo to the MasterRecNoList that is used as an index}
  FMasterRecNoList.Add(Pointer(aMasterRecNo));

  Result := lLinkRange;

end; {function, AddLinkRange}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.SafeGetRangeValue }

function TppLinkRangeIndex.SafeGetRangeValue(aMasterRecNo: Integer): TppLinkRange;
var
  liListIndex: Integer;
begin

  {search the MasterRecNoList and use the index to retrieve the link range item}
  liListIndex := GetPosition(aMasterRecNo);

  {return a link range item, add a new item, if needed}
  if liListIndex >= 0 then
    Result := TppLinkRange(Items[liListIndex])
  else
    Result := AddLinkRange(aMasterRecNo);

end; {function, SafeGetRangeValue}


{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.GetLinkRangeValue }

function TppLinkRangeIndex.GetLinkRangeValue(aMasterRecNo: Integer): TppLinkRange;
var
  liListIndex: Integer;
begin

  {search the MasterRecNoList and use the index to retrieve the link range item}
  liListIndex := GetPosition(aMasterRecNo);

  if liListIndex >= 0 then
    Result := TppLinkRange(Items[liListIndex])
  else
    Result := nil;

end; {function, GetLinkRangeValue}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.GetBeginRecordNo }

function TppLinkRangeIndex.GetBeginRecordNo(aMasterRecNo: Integer; var aRecordNo: Integer): Boolean;
var
  lLinkeRange: TppLinkRange;

begin

  lLinkeRange := GetLinkRangeValue(aMasterRecNo);

  {check whether there is a valid entry}
  Result := (lLinkeRange <> nil) and  (lLinkeRange.BeginRecordNo >= 0);

  if Result then
    aRecordNo := lLinkeRange.BeginRecordNo;

end; {function, GetBeginRecordNo}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.GetEndRecordNo }

function TppLinkRangeIndex.GetEndRecordNo(aMasterRecNo: Integer; var aRecordNo: Integer): Boolean;
var
  lLinkeRange: TppLinkRange;

begin

  lLinkeRange := GetLinkRangeValue(aMasterRecNo);

  {check whether there is a valid entry}
  Result := (lLinkeRange <> nil) and (lLinkeRange.EndRecordNo >= 0);

  if Result then
    aRecordNo := lLinkeRange.EndRecordNo;

end; {function, GetEndRecordNo}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.SetBeginRecordNo }

procedure TppLinkRangeIndex.SetBeginRecordNo(aMasterRecNo, aRecordNo: Integer);
var
  lLinkeRange: TppLinkRange;

begin
  {call SafeGetRangeValue which can allocate a new entry if needed}
  lLinkeRange := SafeGetRangeValue(aMasterRecNo);

  if (lLinkeRange <> nil) and (aMasterRecNo >= 0) then
    lLinkeRange.BeginRecordNo := aRecordNo;

end; {procedure, SetBeginRecordNo}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.SetEndRecordNo }

procedure TppLinkRangeIndex.SetEndRecordNo(aMasterRecNo, aRecordNo: Integer);
var
  lLinkeRange: TppLinkRange;

begin
  {call SafeGetRangeValue which can allocate a new entry if needed}
  lLinkeRange := SafeGetRangeValue(aMasterRecNo);

  if (lLinkeRange <> nil) and (aMasterRecNo >= 0) then
    lLinkeRange.EndRecordNo := aRecordNo;

end; {procedure, SetEndRecordNo}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.SetNoLinkedData }

procedure TppLinkRangeIndex.SetNoLinkedData(aMasterRecNo: Integer);
var
  lLinkeRange: TppLinkRange;

begin
  {call SafeGetRangeValue which can allocate a new entry if needed}
  lLinkeRange := SafeGetRangeValue(aMasterRecNo);

  if (lLinkeRange <> nil) and (aMasterRecNo >= 0) then
    begin
      lLinkeRange.BeginRecordNo := -99;
      lLinkeRange.EndRecordNo   := -99;
    end;

end; {procedure, SetNoLinkedData}

{------------------------------------------------------------------------------}
{ TppLinkRangeIndex.CheckNoLinkedData }

function TppLinkRangeIndex.CheckNoLinkedData(aMasterRecNo: Integer): Boolean;
var
  lLinkeRange: TppLinkRange;

begin
  lLinkeRange := GetLinkRangeValue(aMasterRecNo);

  Result := (lLinkeRange <> nil) and (lLinkeRange.BeginRecordNo = -99) and
                                     (lLinkeRange.EndRecordNo   = -99);
                                     
end; {procedure, CheckNoLinkedData}


{******************************************************************************
*
*  D A T A   P I P E L I N E   L I S T
*
******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.Create }

constructor TppDataPipelineList.Create(aReport: TComponent);
begin

  inherited  Create;

  SetReport(aReport);

end;  {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.Destroy }


destructor TppDataPipelineList.Destroy;
begin

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.AddDataPipeline }

procedure TppDataPipelineList.AddDataPipeline(aDataPipeline: TComponent);
begin

  {only add to list, if pipeline's Visible property set to true}
  if TppDataPipeline(aDataPipeline).Visible then
    AddObject(TppDataPipeline(aDataPipeline).UserName, aDataPipeline);

end; {procedure, AddDataPipeline}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildList }

procedure TppDataPipelineList.BuildList;
begin

  Clear;

  if (FReport = nil) then Exit;

  {build list of data pipeline names}
  if (FFormDesigner = nil) or (FFormDesigner.Designer = nil) then
    BuildDataListFromOwner(FReport.Owner)
  else
    BuildDataListFromDesigner(FFormDesigner);

end; {procedure, BuildList}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.Refresh }

procedure TppDataPipelineList.Refresh;
begin

  BuildList;

end; {procedure, Refresh}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.SetReport }

procedure TppDataPipelineList.SetReport(aReport: TComponent);
begin

  FReport := aReport;

  {get the form designer}
  if FReport <> nil then
    FFormDesigner := TppCustomReport(FReport).FormDesigner
  else
    FFormDesigner := nil;

  BuildList;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromDesigner }

procedure TppDataPipelineList.BuildDataListFromDesigner(aDesigner: TppFormDesigner);
begin
  aDesigner.GetComponentNames(GetTypeData(TppDataPipeline.ClassInfo), GetDataItemsCallback);
end; {procedure, BuildDataListFromDesigner}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetDataItemsCallback }

procedure TppDataPipelineList.GetDataItemsCallback(const S: string);
begin
  AddDataPipeline(TppDataPipeline(FFormDesigner.GetComponent(S)));

end; {procedure, GetDataItemsCallback}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetPipelineForComponentName }

function TppDataPipelineList.GetPipelineForComponentName(aName: String): TppDataPipeline;
var
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;
begin

  Result := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < Count) do
    begin
      lDataPipeline := TppDataPipeline(Objects[liIndex]);

      if (CompareText(lDataPipeline.Name, aName) = 0) then
        Result := lDataPipeline
      else
        Inc(liIndex);
    end;

end; {procedure, GetPipelineForComponentName}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetDataPipelineForName }

function TppDataPipelineList.GetDataPipelineForName(aName: String): TppDataPipeline;
var
  liPipeline: Integer;

begin
  liPipeline := IndexOf(aName);

  if liPipeline < 0 then
    Result := nil
  else
    Result := TppDataPipeline(Objects[liPipeline]);

end; {procedure, GetDataPipelineForName}


{------------------------------------------------------------------------------}
{ TppDataPipelineList.GetPipeline }

function TppDataPipelineList.GetPipeline(aIndex: Integer): TppDataPipeline;
begin
  Result := TppDataPipeline(Objects[aIndex]);

end; {procedure, GetPipeline}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromOwner }

procedure TppDataPipelineList.BuildDataListFromOwner(aOwner: TComponent);
var
  liComponent: Integer;
  liComponents: Integer;
  liDataModule: Integer;

begin

  liComponents := aOwner.ComponentCount;

  {add data pipeline residing in owner}
  for liComponent := 0 to liComponents-1 do
    if aOwner.Components[liComponent] is TppDataPipeline then
      AddDataPipeline(TppDataPipeline(aOwner.Components[liComponent]));

  {add data pipelines residing in data modules }
  if not (aOwner is TDataModule) then
    for liDataModule := 0 to Screen.DataModuleCount-1 do
      BuildDataListFromDataModule(Screen.DataModules[liDataModule]);

end; {procedure, BuildDataListFromOwner}

{------------------------------------------------------------------------------}
{ TppDataPipelineList.BuildDataListFromDataModule }

procedure TppDataPipelineList.BuildDataListFromDataModule(aDataModule: TDataModule);
var
  liComponent: Integer;

begin

  for liComponent := 0 to aDataModule.ComponentCount-1 do

    if aDataModule.Components[liComponent] is TppDataPipeline then
      AddDataPipeline(TppDataPipeline(aDataModule.Components[liComponent]));

end; {procedure, BuildDataListFromDataModules}

{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** D A T A   P I P E L I N E   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.RefClass }

class function TraTppDataPipelineRTTI.RefClass: TClass;
begin
  Result := TppDataPipeline;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropList }

class procedure TraTppDataPipelineRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  aPropList.AddProp('FieldObjects');
  aPropList.AddProp('FieldValues');
  aPropList.AddProp('GetFieldValue');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropRec }

class function TraTppDataPipelineRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {events}
  if CompareText(aPropName, 'OnRecordPositionChange') = 0 then
    EventToRec(aPropName, ciPipelineRecordPositionChange, False, aPropRec)

  else if CompareText(aPropName, 'OnMasterRecordPositionChange') = 0 then
    EventToRec(aPropName, ciPipelineMasterRecordPositionChange, False, aPropRec)

  else if CompareText(aPropName, 'OnTraversal') = 0 then
    EventToRec(aPropName, ciPipelineTraversal, False, aPropRec)

  else if CompareText(aPropName, 'OnGotoBookmark') = 0 then
    EventToRec(aPropName, ciPipelineGotoBookmark, False, aPropRec)

  else if CompareText(aPropName, 'OnDataChange') = 0 then
    EventToRec(aPropName, ciPipelineDataChange, False, aPropRec)

  else if CompareText(aPropName, 'OnFirst') = 0 then
    EventToRec(aPropName, ciPipelineFirst, False, aPropRec)

  else if CompareText(aPropName, 'OnNext') = 0 then
    EventToRec(aPropName, ciPipelineNext, False, aPropRec)

  else if CompareText(aPropName, 'OnPrior') = 0 then
    EventToRec(aPropName, ciPipelinePrior, False, aPropRec)

  else if CompareText(aPropName, 'OnLast') = 0 then
    EventToRec(aPropName, ciPipelineLast, False, aPropRec)

  else if CompareText(aPropName, 'OnOpen') = 0 then
    EventToRec(aPropName, ciPipelineOpen, False, aPropRec)

  else if CompareText(aPropName, 'OnClose') = 0 then
    EventToRec(aPropName, ciPipelineClose, False, aPropRec)


  {properties & methods}
  else if (CompareText(aPropName, '') = 0)  or (CompareText(aPropName, 'FieldValues') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'FieldObjects') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'GetFieldValue') = 0) then
    MethodToRec(aPropName, True, aPropRec)

  else if (CompareText(aPropName, 'Fields') = 0)  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if(CompareText(aPropName, 'Links') = 0) then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if (CompareText(aPropName, 'Active') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'BOF') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'DataTraversed') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'DataView') = 0) then
    ClassPropToRec(aPropName, TComponent, True, aPropRec)

  else if (CompareText(aPropName, 'EOF') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'TraversalCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'Visible') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else if (CompareText(aPropName, 'CurrentField') = 0) then
    ClassPropToRec(aPropName, TppField, True, aPropRec)

  else if (CompareText(aPropName, 'FieldCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else if (CompareText(aPropName, 'MasterDataPipeline') = 0) then
    ClassPropToRec(aPropName, TppDataPipeline, False, aPropRec)

  else if (CompareText(aPropName, 'LinkCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetParams }

class function TraTppDataPipelineRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, '') = 0) or (CompareText(aMethodName, 'FieldValues') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('FieldName', daString, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'FieldObjects') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('FieldName', daString, nil, '', False, False);
      Result.AddParam('Result', daClass, TppField, '', False, False);
    end

  else if (CompareText(aMethodName, 'GetFieldValue') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('FieldName', daString, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else if (CompareText(aMethodName, 'Fields') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppField, '', False, False);
    end

  else if (CompareText(aMethodName, 'Links') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daClass, TppMasterFieldLink, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.CallMethod }

class function TraTppDataPipelineRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lPipeline: TppDataPipeline;
  liIndex: Integer;
  lsField: String;
  lvValue: Variant;
  lField: TppField;
  lLink: TppMasterFieldLink;
begin

  Result := True;
  
  lPipeline := TppDataPipeline(aObject);

  if (CompareText(aMethodName, '') = 0) or (CompareText(aMethodName, 'FieldValues') = 0) then
    begin
      aParams.GetParamValue(0, lsField);

      lvValue := lPipeline.FieldValues[lsField];

      aParams.SetParamValue(1, lvValue);
    end

  else if (CompareText(aMethodName, 'FieldObjects') = 0) then
    begin
      aParams.GetParamValue(0, lsField);

      lField := lPipeline.FieldObjects[lsField];

      aParams.SetParamValue(1, Integer(lField));
    end

  else if (CompareText(aMethodName, 'Fields') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lField := lPipeline.Fields[liIndex];

      aParams.SetParamValue(1, Integer(lField));
    end

  else if (CompareText(aMethodName, 'GetFieldValue') = 0) then
    begin
      aParams.GetParamValue(0, lsField);

      lvValue := lPipeline.GetFieldValue(lsField);

      aParams.SetParamValue(1, lvValue);
    end

  else if (CompareText(aMethodName, 'Links') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lLink := lPipeline.Links[liIndex];

      aParams.SetParamValue(1, Integer(lLink));
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.GetPropValue }

class function TraTppDataPipelineRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Active') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).Active

  else if (CompareText(aPropName, 'BOF') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).BOF

  else if (CompareText(aPropName, 'DataTraversed') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).DataTraversed

  else if (CompareText(aPropName, 'DataView') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).DataView)

  else if (CompareText(aPropName, 'EOF') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).EOF

  else if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).SkipWhenNoRecords

  else if (CompareText(aPropName, 'TraversalCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).TraversalCount

  else if (CompareText(aPropName, 'Visible') = 0) then
    Boolean(aValue) := TppDataPipeline(aObject).Visible

  else if (CompareText(aPropName, 'CurrentField') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).CurrentField)

  else if (CompareText(aPropName, 'FieldCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).FieldCount

  else if (CompareText(aPropName, 'MasterDataPipeline') = 0) then
     Integer(aValue) := Integer(TppDataPipeline(aObject).MasterDataPipeline)

  else if (CompareText(aPropName, 'LinkCount') = 0) then
    Integer(aValue) := TppDataPipeline(aObject).LinkCount

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppDataPipelineRTTI.SetPropValue }

class function TraTppDataPipelineRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'SkipWhenNoRecords') = 0) then
    TppDataPipeline(aObject).SkipWhenNoRecords := Boolean(aValue)

  else if (CompareText(aPropName, 'Visible') = 0) then
    TppDataPipeline(aObject).Visible := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** F I E L D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppFieldRTTI.RefClass }

class function TraTppFieldRTTI.RefClass: TClass;
begin
  Result := TppField;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppFieldRTTI.GetPropList }

class procedure TraTppFieldRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('AsDouble');
  aPropList.AddProp('AsPicture');
  aPropList.AddProp('AsString');
  aPropList.AddProp('IsNull');
  aPropList.AddProp('DataPipeline');
  aPropList.AddProp('Value');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppFieldRTTI.GetPropRec }

class function TraTppFieldRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {properties}
  if (CompareText(aPropName, 'AsDouble') = 0) then
    PropToRec(aPropName, daDouble, True, aPropRec)

  else if(CompareText(aPropName, 'AsPicture') = 0) then
    ClassPropToRec(aPropName, TPicture, True, aPropRec)

  else if(CompareText(aPropName, 'AsString') = 0) then
    PropToRec(aPropName, daString, True, aPropRec)

  else if(CompareText(aPropName, 'IsNull') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if(CompareText(aPropName, 'DataPipeline') = 0) then
    ClassPropToRec(aPropName, TppDataPipeline, True, aPropRec)

  else if(CompareText(aPropName, 'Value') = 0) then
    PropToRec(aPropName, daVariant, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppFieldRTTI.GetPropValue }

class function TraTppFieldRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'AsDouble') = 0) then
    Double(aValue) := TppField(aObject).AsDouble

  else if (CompareText(aPropName, 'AsPicture') = 0) then
    Integer(aValue) := Integer(TppField(aObject).AsPicture)

  else if (CompareText(aPropName, 'AsString') = 0) then
    String(aValue) := TppField(aObject).AsString

  else if (CompareText(aPropName, 'IsNull') = 0) then
    Boolean(aValue) := TppField(aObject).IsNull

  else if (CompareText(aPropName, 'DataPipeline') = 0) then
    Integer(aValue) := Integer(TppField(aObject).DataPipeline)

  else if (CompareText(aPropName, 'Value') = 0) then
    Variant(aValue) := TppField(aObject).Value

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** A U T O S E A R C H   F I E L D   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.RefClass }

class function TraTppAutoSearchFieldRTTI.RefClass: TClass;
begin
  Result := TppAutoSearchField;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropList }

class procedure TraTppAutoSearchFieldRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

  {add public props}
  aPropList.AddProp('Value');
  aPropList.AddProp('Values');
  aPropList.AddProp('ValueCount');

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropRec }

class function TraTppAutoSearchFieldRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  {properties & methods}
  if (CompareText(aPropName, 'Value') = 0) then
    PropToRec(aPropName, daVariant, True, aPropRec)

  else if (CompareText(aPropName, 'Values') = 0)  then
    AccessSpecifierToRec(aPropName, aPropRec)

  else if(CompareText(aPropName, 'ValueCount') = 0) then
    PropToRec(aPropName, daInteger, True, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetParams }

class function TraTppAutoSearchFieldRTTI.GetParams(const aMethodName: String): TraParamList;
begin

  if (CompareText(aMethodName, 'Values') = 0) then
    begin
      Result := TraParamList.Create;

      Result.AddParam('Index', daInteger, nil, '', False, False);
      Result.AddParam('Result', daVariant, nil, '', False, False);
    end

  else
    Result := inherited GetParams(aMethodName);

end; {class function, GetParams}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.CallMethod }

class function TraTppAutoSearchFieldRTTI.CallMethod(aObject: TObject; const aMethodName: String; aParams: TraParamList; aGet: Boolean): Boolean;
var
  lField: TppAutoSearchField;
  liIndex: Integer;
  lvValue: Variant;
begin

  Result := True;

  lField := TppAutoSearchField(aObject);

  if (CompareText(aMethodName, 'Values') = 0) then
    begin
      aParams.GetParamValue(0, liIndex);

      lvValue := lField.Values[liIndex];

      aParams.SetParamValue(1, lvValue);
    end

  else
    Result := inherited CallMethod(aObject, aMethodName, aParams, aGet);

end; {class function, CallMethod}

{------------------------------------------------------------------------------}
{ TraTppAutoSearchFieldRTTI.GetPropValue }

class function TraTppAutoSearchFieldRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Value') = 0) then
    Variant(aValue) := TppAutoSearchField(aObject).Value

  else if (CompareText(aPropName, 'ValueCount') = 0) then
    Integer(aValue) := TppAutoSearchField(aObject).ValueCount

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppField, TppAutoSearchField, TppMasterFieldLink]);

  raRegisterRTTI(TraTppDataPipelineRTTI);
  raRegisterRTTI(TraTppFieldRTTI);
  raRegisterRTTI(TraTppAutoSearchFieldRTTI);

finalization

  UnRegisterClasses([TppField, TppAutoSearchField, TppMasterFieldLink]);

  raUnRegisterRTTI(TraTppDataPipelineRTTI);
  raUnRegisterRTTI(TraTppFieldRTTI);
  raUnRegisterRTTI(TraTppAutoSearchFieldRTTI);

end.
